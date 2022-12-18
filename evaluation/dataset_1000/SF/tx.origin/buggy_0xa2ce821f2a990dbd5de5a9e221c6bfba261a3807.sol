// File: contracts/EToken2Interface.sol

pragma solidity 0.5.8;


contract RegistryICAPInterface {
    function parse(bytes32 _icap) public view returns(address, bytes32, bool);
    function institutions(bytes32 _institution) public view returns(address);
}


contract EToken2Interface {
    function registryICAP() public view returns(RegistryICAPInterface);
    function baseUnit(bytes32 _symbol) public view returns(uint8);
    function description(bytes32 _symbol) public view returns(string memory);
    function owner(bytes32 _symbol) public view returns(address);
    function isOwner(address _owner, bytes32 _symbol) public view returns(bool);
    function totalSupply(bytes32 _symbol) public view returns(uint);
    function balanceOf(address _holder, bytes32 _symbol) public view returns(uint);
    function isLocked(bytes32 _symbol) public view returns(bool);

    function issueAsset(
        bytes32 _symbol,
        uint _value,
        string memory _name,
        string memory _description,
        uint8 _baseUnit,
        bool _isReissuable)
    public returns(bool);

    function reissueAsset(bytes32 _symbol, uint _value) public returns(bool);
    function revokeAsset(bytes32 _symbol, uint _value) public returns(bool);
    function setProxy(address _address, bytes32 _symbol) public returns(bool);
    function lockAsset(bytes32 _symbol) public returns(bool);

    function proxyTransferFromToICAPWithReference(
        address _from,
        bytes32 _icap,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function proxyApprove(address _spender, uint _value, bytes32 _symbol, address _sender)
    public returns(bool);
    
    function allowance(address _from, address _spender, bytes32 _symbol) public view returns(uint);

    function proxyTransferFromWithReference(
        address _from,
        address _to,
        uint _value,
        bytes32 _symbol,
        string memory _reference,
        address _sender)
    public returns(bool);

    function changeOwnership(bytes32 _symbol, address _newOwner) public returns(bool);
}

// File: contracts/AssetInterface.sol

pragma solidity 0.5.8;


contract AssetInterface {
    function _performTransferWithReference(
        address _to,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function _performTransferToICAPWithReference(
        bytes32 _icap,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function _performApprove(address _spender, uint _value, address _sender)
    public returns(bool);

    function _performTransferFromWithReference(
        address _from,
        address _to,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function _performTransferFromToICAPWithReference(
        address _from,
        bytes32 _icap,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function _performGeneric(bytes memory, address) public payable {
        revert();
    }
}

// File: contracts/ERC20Interface.sol

pragma solidity 0.5.8;


contract ERC20Interface {
  function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
  event Transfer(address indexed from, address indexed to, uint256 value);
  function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
  event Approval(address indexed from, address indexed spender, uint256 value);

    function totalSupply() public view returns(uint256 supply);
    function balanceOf(address _owner) public view returns(uint256 balance);
    // solhint-disable-next-line no-simple-event-func-name
    function transfer(address _to, uint256 _value) public returns(bool success);
    function transferFrom(address _from, address _to, uint256 _value) public returns(bool success);
    function approve(address _spender, uint256 _value) public returns(bool success);
    function allowance(address _owner, address _spender) public view returns(uint256 remaining);

    // function symbol() constant returns(string);
    function decimals() public view returns(uint8);
    // function name() constant returns(string);
}

// File: contracts/AssetProxyInterface.sol

pragma solidity 0.5.8;



contract AssetProxyInterface is ERC20Interface {
    function _forwardApprove(address _spender, uint _value, address _sender)
    public returns(bool);

    function _forwardTransferFromWithReference(
        address _from,
        address _to,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function _forwardTransferFromToICAPWithReference(
        address _from,
        bytes32 _icap,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function recoverTokens(ERC20Interface _asset, address _receiver, uint _value)
    public returns(bool);

    function etoken2() external view returns(address); // To be replaced by the implicit getter;

    // To be replaced by the implicit getter;
    function etoken2Symbol() external view returns(bytes32);
}

// File: smart-contracts-common/contracts/Bytes32.sol

pragma solidity 0.5.8;


contract Bytes32 {
    function _bytes32(string memory _input) internal pure returns(bytes32 result) {
        assembly {
            result := mload(add(_input, 32))
        }
    }
}

// File: smart-contracts-common/contracts/ReturnData.sol

pragma solidity 0.5.8;


contract ReturnData {
    function _returnReturnData(bool _success) internal pure {
        assembly {
            let returndatastart := 0
            returndatacopy(returndatastart, 0, returndatasize)
            switch _success case 0 { revert(returndatastart, returndatasize) }
                default { return(returndatastart, returndatasize) }
        }
    }

    function _assemblyCall(address _destination, uint _value, bytes memory _data)
    internal returns(bool success) {
        assembly {
            success := call(gas, _destination, _value, add(_data, 32), mload(_data), 0, 0)
        }
    }
}

// File: contracts/AssetProxy.sol

pragma solidity 0.5.8;








/**
 * @title EToken2 Asset Proxy.
 *
 * Proxy implements ERC20 interface and acts as a gateway to a single EToken2 asset.
 * Proxy adds etoken2Symbol and caller(sender) when forwarding requests to EToken2.
 * Every request that is made by caller first sent to the specific asset implementation
 * contract, which then calls back to be forwarded onto EToken2.
 *
 * Calls flow: Caller ->
 *             Proxy.func(...) ->
 *             Asset._performFunc(..., Caller.address) ->
 *             Proxy._forwardFunc(..., Caller.address) ->
 *             Platform.proxyFunc(..., symbol, Caller.address)
 *
 * Generic call flow: Caller ->
 *             Proxy.unknownFunc(...) ->
 *             Asset._performGeneric(..., Caller.address) ->
 *             Asset.unknownFunc(...)
 *
 * Asset implementation contract is mutable, but each user have an option to stick with
 * old implementation, through explicit decision made in timely manner, if he doesn't agree
 * with new rules.
 * Each user have a possibility to upgrade to latest asset contract implementation, without the
 * possibility to rollback.
 *
 * Note: all the non constant functions return false instead of throwing in case if state change
 * didn't happen yet.
 */
contract AssetProxy is ERC20Interface, AssetProxyInterface, Bytes32, ReturnData {
    // Assigned EToken2, immutable.
    EToken2Interface public etoken2;

    // Assigned symbol, immutable.
    bytes32 public etoken2Symbol;

    // Assigned name, immutable. For UI.
    string public name;
    string public symbol;

    /**
     * Sets EToken2 address, assigns symbol and name.
     *
     * Can be set only once.
     *
     * @param _etoken2 EToken2 contract address.
     * @param _symbol assigned symbol.
     * @param _name assigned name.
     *
     * @return success.
     */
    function init(EToken2Interface _etoken2, string memory _symbol, string memory _name)
        public returns(bool)
    {
        if (address(etoken2) != address(0)) {
            return false;
        }
        etoken2 = _etoken2;
        etoken2Symbol = _bytes32(_symbol);
        name = _name;
        symbol = _symbol;
        return true;
    }

    /**
     * Only EToken2 is allowed to call.
     */
    modifier onlyEToken2() {
        if (msg.sender == address(etoken2)) {
            _;
        }
    }

    /**
     * Only current asset owner is allowed to call.
     */
    modifier onlyAssetOwner() {
        if (etoken2.isOwner(msg.sender, etoken2Symbol)) {
            _;
        }
    }

    /**
     * Returns asset implementation contract for current caller.
     *
     * @return asset implementation contract.
     */
    function _getAsset() internal view returns(AssetInterface) {
        return AssetInterface(getVersionFor(msg.sender));
    }

    /**
     * Recovers tokens on proxy contract
     *
     * @param _asset type of tokens to recover.
     * @param _value tokens that will be recovered.
     * @param _receiver address where to send recovered tokens.
     *
     * @return success.
     */
    function recoverTokens(ERC20Interface _asset, address _receiver, uint _value)
    public onlyAssetOwner() returns(bool) {
        return _asset.transfer(_receiver, _value);
    }
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}

    /**
     * Returns asset total supply.
     *
     * @return asset total supply.
     */
    function totalSupply() public view returns(uint) {
        return etoken2.totalSupply(etoken2Symbol);
    }
function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }

    /**
     * Returns asset balance for a particular holder.
     *
     * @param _owner holder address.
     *
     * @return holder balance.
     */
    function balanceOf(address _owner) public view returns(uint) {
        return etoken2.balanceOf(_owner, etoken2Symbol);
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

    /**
     * Returns asset allowance from one holder to another.
     *
     * @param _from holder that allowed spending.
     * @param _spender holder that is allowed to spend.
     *
     * @return holder to spender allowance.
     */
    function allowance(address _from, address _spender) public view returns(uint) {
        return etoken2.allowance(_from, _spender, etoken2Symbol);
    }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }

    /**
     * Returns asset decimals.
     *
     * @return asset decimals.
     */
    function decimals() public view returns(uint8) {
        return etoken2.baseUnit(etoken2Symbol);
    }
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }

    /**
     * Transfers asset balance from the caller to specified receiver.
     *
     * @param _to holder address to give to.
     * @param _value amount to transfer.
     *
     * @return success.
     */
    function transfer(address _to, uint _value) public returns(bool) {
        return transferWithReference(_to, _value, '');
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

    /**
     * Transfers asset balance from the caller to specified receiver adding specified comment.
     * Resolves asset implementation contract for the caller and forwards there arguments along with
     * the caller address.
     *
     * @param _to holder address to give to.
     * @param _value amount to transfer.
     * @param _reference transfer comment to be included in a EToken2's Transfer event.
     *
     * @return success.
     */
    function transferWithReference(address _to, uint _value, string memory _reference)
    public returns(bool) {
        return _getAsset()._performTransferWithReference(
            _to, _value, _reference, msg.sender);
    }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }

    /**
     * Transfers asset balance from the caller to specified ICAP.
     *
     * @param _icap recipient ICAP to give to.
     * @param _value amount to transfer.
     *
     * @return success.
     */
    function transferToICAP(bytes32 _icap, uint _value) public returns(bool) {
        return transferToICAPWithReference(_icap, _value, '');
    }
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}

    /**
     * Transfers asset balance from the caller to specified ICAP adding specified comment.
     * Resolves asset implementation contract for the caller and forwards there arguments along with
     * the caller address.
     *
     * @param _icap recipient ICAP to give to.
     * @param _value amount to transfer.
     * @param _reference transfer comment to be included in a EToken2's Transfer event.
     *
     * @return success.
     */
    function transferToICAPWithReference(
        bytes32 _icap,
        uint _value,
        string memory _reference)
    public returns(bool) {
        return _getAsset()._performTransferToICAPWithReference(
            _icap, _value, _reference, msg.sender);
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

    /**
     * Prforms allowance transfer of asset balance between holders.
     *
     * @param _from holder address to take from.
     * @param _to holder address to give to.
     * @param _value amount to transfer.
     *
     * @return success.
     */
    function transferFrom(address _from, address _to, uint _value) public returns(bool) {
        return transferFromWithReference(_from, _to, _value, '');
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

    /**
     * Prforms allowance transfer of asset balance between holders adding specified comment.
     * Resolves asset implementation contract for the caller and forwards there arguments along with
     * the caller address.
     *
     * @param _from holder address to take from.
     * @param _to holder address to give to.
     * @param _value amount to transfer.
     * @param _reference transfer comment to be included in a EToken2's Transfer event.
     *
     * @return success.
     */
    function transferFromWithReference(
        address _from,
        address _to,
        uint _value,
        string memory _reference)
    public returns(bool) {
        return _getAsset()._performTransferFromWithReference(
            _from,
            _to,
            _value,
            _reference,
            msg.sender
        );
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

    /**
     * Performs transfer call on the EToken2 by the name of specified sender.
     *
     * Can only be called by asset implementation contract assigned to sender.
     *
     * @param _from holder address to take from.
     * @param _to holder address to give to.
     * @param _value amount to transfer.
     * @param _reference transfer comment to be included in a EToken2's Transfer event.
     * @param _sender initial caller.
     *
     * @return success.
     */
    function _forwardTransferFromWithReference(
        address _from,
        address _to,
        uint _value,
        string memory _reference,
        address _sender)
    public onlyImplementationFor(_sender) returns(bool) {
        return etoken2.proxyTransferFromWithReference(
            _from,
            _to,
            _value,
            etoken2Symbol,
            _reference,
            _sender
        );
    }
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }

    /**
     * Prforms allowance transfer of asset balance between holders.
     *
     * @param _from holder address to take from.
     * @param _icap recipient ICAP address to give to.
     * @param _value amount to transfer.
     *
     * @return success.
     */
    function transferFromToICAP(address _from, bytes32 _icap, uint _value)
    public returns(bool) {
        return transferFromToICAPWithReference(_from, _icap, _value, '');
    }
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }

    /**
     * Prforms allowance transfer of asset balance between holders adding specified comment.
     * Resolves asset implementation contract for the caller and forwards there arguments along with
     * the caller address.
     *
     * @param _from holder address to take from.
     * @param _icap recipient ICAP address to give to.
     * @param _value amount to transfer.
     * @param _reference transfer comment to be included in a EToken2's Transfer event.
     *
     * @return success.
     */
    function transferFromToICAPWithReference(
        address _from,
        bytes32 _icap,
        uint _value,
        string memory _reference)
    public returns(bool) {
        return _getAsset()._performTransferFromToICAPWithReference(
            _from,
            _icap,
            _value,
            _reference,
            msg.sender
        );
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    /**
     * Performs allowance transfer to ICAP call on the EToken2 by the name of specified sender.
     *
     * Can only be called by asset implementation contract assigned to sender.
     *
     * @param _from holder address to take from.
     * @param _icap recipient ICAP address to give to.
     * @param _value amount to transfer.
     * @param _reference transfer comment to be included in a EToken2's Transfer event.
     * @param _sender initial caller.
     *
     * @return success.
     */
    function _forwardTransferFromToICAPWithReference(
        address _from,
        bytes32 _icap,
        uint _value,
        string memory _reference,
        address _sender)
    public onlyImplementationFor(_sender) returns(bool) {
        return etoken2.proxyTransferFromToICAPWithReference(
            _from,
            _icap,
            _value,
            _reference,
            _sender
        );
    }
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}

    /**
     * Sets asset spending allowance for a specified spender.
     * Resolves asset implementation contract for the caller and forwards there arguments along with
     * the caller address.
     *
     * @param _spender holder address to set allowance to.
     * @param _value amount to allow.
     *
     * @return success.
     */
    function approve(address _spender, uint _value) public returns(bool) {
        return _getAsset()._performApprove(_spender, _value, msg.sender);
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

    /**
     * Performs allowance setting call on the EToken2 by the name of specified sender.
     *
     * Can only be called by asset implementation contract assigned to sender.
     *
     * @param _spender holder address to set allowance to.
     * @param _value amount to allow.
     * @param _sender initial caller.
     *
     * @return success.
     */
    function _forwardApprove(address _spender, uint _value, address _sender)
    public onlyImplementationFor(_sender) returns(bool) {
        return etoken2.proxyApprove(_spender, _value, etoken2Symbol, _sender);
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

    /**
     * Emits ERC20 Transfer event on this contract.
     *
     * Can only be, and, called by assigned EToken2 when asset transfer happens.
     */
    function emitTransfer(address _from, address _to, uint _value) public onlyEToken2() {
        emit Transfer(_from, _to, _value);
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

    /**
     * Emits ERC20 Approval event on this contract.
     *
     * Can only be, and, called by assigned EToken2 when asset allowance set happens.
     */
    function emitApprove(address _from, address _spender, uint _value) public onlyEToken2() {
        emit Approval(_from, _spender, _value);
    }
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }

    /**
     * Resolves asset implementation contract for the caller and forwards there transaction data,
     * along with the value. This allows for proxy interface growth.
     */
    function () external payable {
        _getAsset()._performGeneric.value(msg.value)(msg.data, msg.sender);
        _returnReturnData(true);
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}

    // Interface functions to allow specifying ICAP addresses as strings.
    function transferToICAP(string memory _icap, uint _value) public returns(bool) {
        return transferToICAPWithReference(_icap, _value, '');
    }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }

    function transferToICAPWithReference(string memory _icap, uint _value, string memory _reference)
    public returns(bool) {
        return transferToICAPWithReference(_bytes32(_icap), _value, _reference);
    }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }

    function transferFromToICAP(address _from, string memory _icap, uint _value)
        public returns(bool)
    {
        return transferFromToICAPWithReference(_from, _icap, _value, '');
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

    function transferFromToICAPWithReference(
        address _from,
        string memory _icap,
        uint _value,
        string memory _reference)
    public returns(bool) {
        return transferFromToICAPWithReference(_from, _bytes32(_icap), _value, _reference);
    }
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}

    /**
     * Indicates an upgrade freeze-time start, and the next asset implementation contract.
     */
  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  event UpgradeProposed(address newVersion);
  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  event UpgradePurged(address newVersion);
  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  event UpgradeCommited(address newVersion);
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event OptedOut(address sender, address version);
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event OptedIn(address sender, address version);

    // Current asset implementation contract address.
    address internal latestVersion;

    // Proposed next asset implementation contract address.
    address internal pendingVersion;

    // Upgrade freeze-time start.
    uint internal pendingVersionTimestamp;

    // Timespan for users to review the new implementation and make decision.
    uint internal constant UPGRADE_FREEZE_TIME = 3 days;

    // Asset implementation contract address that user decided to stick with.
    // 0x0 means that user uses latest version.
    mapping(address => address) internal userOptOutVersion;

    /**
     * Only asset implementation contract assigned to sender is allowed to call.
     */
    modifier onlyImplementationFor(address _sender) {
        if (getVersionFor(_sender) == msg.sender) {
            _;
        }
    }

    /**
     * Returns asset implementation contract address assigned to sender.
     *
     * @param _sender sender address.
     *
     * @return asset implementation contract address.
     */
    function getVersionFor(address _sender) public view returns(address) {
        return userOptOutVersion[_sender] == address(0) ?
            latestVersion : userOptOutVersion[_sender];
    }

    /**
     * Returns current asset implementation contract address.
     *
     * @return asset implementation contract address.
     */
    function getLatestVersion() public view returns(address) {
        return latestVersion;
    }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }

    /**
     * Returns proposed next asset implementation contract address.
     *
     * @return asset implementation contract address.
     */
    function getPendingVersion() public view returns(address) {
        return pendingVersion;
    }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}

    /**
     * Returns upgrade freeze-time start.
     *
     * @return freeze-time start.
     */
    function getPendingVersionTimestamp() public view returns(uint) {
        return pendingVersionTimestamp;
    }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }

    /**
     * Propose next asset implementation contract address.
     *
     * Can only be called by current asset owner.
     *
     * Note: freeze-time should not be applied for the initial setup.
     *
     * @param _newVersion asset implementation contract address.
     *
     * @return success.
     */
    function proposeUpgrade(address _newVersion) public onlyAssetOwner() returns(bool) {
        // Should not already be in the upgrading process.
        if (pendingVersion != address(0)) {
            return false;
        }
        // New version address should be other than 0x0.
        if (_newVersion == address(0)) {
            return false;
        }
        // Don't apply freeze-time for the initial setup.
        if (latestVersion == address(0)) {
            latestVersion = _newVersion;
            return true;
        }
        pendingVersion = _newVersion;
        // solhint-disable-next-line not-rely-on-time
        pendingVersionTimestamp = now;
        emit UpgradeProposed(_newVersion);
        return true;
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

    /**
     * Cancel the pending upgrade process.
     *
     * Can only be called by current asset owner.
     *
     * @return success.
     */
    function purgeUpgrade() public onlyAssetOwner() returns(bool) {
        if (pendingVersion == address(0)) {
            return false;
        }
        emit UpgradePurged(pendingVersion);
        delete pendingVersion;
        delete pendingVersionTimestamp;
        return true;
    }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}

    /**
     * Finalize an upgrade process setting new asset implementation contract address.
     *
     * Can only be called after an upgrade freeze-time.
     *
     * @return success.
     */
    function commitUpgrade() public returns(bool) {
        if (pendingVersion == address(0)) {
            return false;
        }
        // solhint-disable-next-line not-rely-on-time
        if (pendingVersionTimestamp + UPGRADE_FREEZE_TIME > now) {
            return false;
        }
        latestVersion = pendingVersion;
        delete pendingVersion;
        delete pendingVersionTimestamp;
        emit UpgradeCommited(latestVersion);
        return true;
    }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }

    /**
     * Disagree with proposed upgrade, and stick with current asset implementation
     * until further explicit agreement to upgrade.
     *
     * @return success.
     */
    function optOut() public returns(bool) {
        if (userOptOutVersion[msg.sender] != address(0)) {
            return false;
        }
        userOptOutVersion[msg.sender] = latestVersion;
        emit OptedOut(msg.sender, latestVersion);
        return true;
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}

    /**
     * Implicitly agree to upgrade to current and future asset implementation upgrades,
     * until further explicit disagreement.
     *
     * @return success.
     */
    function optIn() public returns(bool) {
        delete userOptOutVersion[msg.sender];
        emit OptedIn(msg.sender, latestVersion);
        return true;
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    // Backwards compatibility.
    function multiAsset() public view returns(EToken2Interface) {
        return etoken2;
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
}