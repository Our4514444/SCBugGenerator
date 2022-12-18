                                                                 

pragma solidity ^0.5.16;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract Initializable {

                                                                       
  bool private initialized;

                                                                                         
  bool private initializing;

                                                                                
  modifier INITIALIZER992() {	//inject NONSTANDARD NAMING
    require(initializing || ISCONSTRUCTOR413() || !initialized, "Contract instance has already been initialized");

    bool isTopLevelCall = !initializing;
    if (isTopLevelCall) {
      initializing = true;
      initialized = true;
    }

    _;

    if (isTopLevelCall) {
      initializing = false;
    }
  }

                                                                                 
  function ISCONSTRUCTOR413() private view returns (bool) {	//inject NONSTANDARD NAMING
    // extcodesize checks the size of the code stored in an address, and
    // address returns the current address. Since the code is still not
    // deployed when running a constructor, any checks on its code size will
    // yield zero, making it an effective way to detect if a contract is
    // under construction or not.
    address self = address(this);
    uint256 cs;
    assembly { cs := extcodesize(self) }
    return cs == 0;
  }

  // Reserved storage space to allow for layout changes in the future.
  uint256[50] private ______gap;
}

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY145() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF118(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER783(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE235(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE66(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM411(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER472(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL236(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                           
contract ERC20Detailed is Initializable, IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

                                                                                                                                                                                       
    function INITIALIZE26(string memory name, string memory symbol, uint8 decimals) public INITIALIZER992 {	//inject NONSTANDARD NAMING
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                          
    function NAME359() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL998() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function DECIMALS981() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }

    uint256[50] private ______gap;
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD630(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB360(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB360(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB360(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL402(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV49(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV49(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV49(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD739(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD739(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD739(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                         
library Math {
                                                               
    function MAX318(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN565(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE207(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

                                                               
library Arrays {
                                                                                                                                                                                                                                                                                                                                                                                                                          
    function FINDUPPERBOUND954(uint256[] storage array, uint256 element) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        if (array.length == 0) {
            return 0;
        }

        uint256 low = 0;
        uint256 high = array.length;

        while (low < high) {
            uint256 mid = Math.AVERAGE207(low, high);

            // Note that mid will always be strictly less than high (i.e. it will be a valid array index)
            // because Math.average rounds down (it does integer division with truncation).
            if (array[mid] > element) {
                high = mid;
            } else {
                low = mid + 1;
            }
        }

        // At this point `low` is the exclusive upper bound. We will return the inclusive upper bound.
        if (low > 0 && array[low - 1] == element) {
            return low - 1;
        } else {
            return low;
        }
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
library Counters {
    using SafeMath for uint256;

    struct Counter {
        // This variable should never be directly accessed by users of the library: interactions must be restricted to
        // the library's function. As of Solidity v0.5.2, this cannot be enforced, though there is a proposal to add
        // this feature: see https://github.com/ethereum/solidity/issues/4637
        uint256 _value; // default: 0
    }

    function CURRENT697(Counter storage counter) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return counter._value;
    }

    function INCREMENT301(Counter storage counter) internal {	//inject NONSTANDARD NAMING
        // The {SafeMath} overflow check can be skipped here, see the comment at the top
        counter._value += 1;
    }

    function DECREMENT951(Counter storage counter) internal {	//inject NONSTANDARD NAMING
        counter._value = counter._value.SUB360(1);
    }
}

                                                         
contract ERC20 is Initializable, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) internal _balances;

    mapping (address => mapping (address => uint256)) internal _allowances;

    uint256 internal _totalSupply;

                                                     
    function TOTALSUPPLY145() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF118(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER783(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER583(msg.sender, recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE235(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE66(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE802(msg.sender, spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM411(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER583(sender, recipient, amount);
        _APPROVE802(sender, msg.sender, _allowances[sender][msg.sender].SUB360(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE156(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE802(msg.sender, spender, _allowances[msg.sender][spender].ADD630(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE537(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE802(msg.sender, spender, _allowances[msg.sender][spender].SUB360(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER583(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB360(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD630(amount);
        emit TRANSFER472(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT206(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD630(amount);
        _balances[account] = _balances[account].ADD630(amount);
        emit TRANSFER472(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN570(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB360(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB360(amount);
        emit TRANSFER472(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE802(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL236(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM441(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN570(account, amount);
        _APPROVE802(account, msg.sender, _allowances[account][msg.sender].SUB360(amount, "ERC20: burn amount exceeds allowance"));
    }

    uint256[50] private ______gap;
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract ERC20Snapshot is Initializable, ERC20 {

    using SafeMath for uint256;
    using Arrays for uint256[];
    using Counters for Counters.Counter;

    // Snapshotted values have arrays of ids and the value corresponding to that id. These could be an array of a
    // Snapshot struct, but that would impede usage of functions that work on an array.
    struct Snapshots {
        uint256[] ids;
        uint256[] values;
    }

    mapping (address => Snapshots) private _accountBalanceSnapshots;
    Snapshots private _totalSupplySnapshots;

    // Snapshot ids increase monotonically, with the first value being 1. An id of 0 is invalid.
    Counters.Counter private _currentSnapshotId;

                                                                                                 
    event SNAPSHOT753(uint256 id);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function _SNAPSHOT675() internal returns (uint256) {	//inject NONSTANDARD NAMING
        _currentSnapshotId.INCREMENT301();

        uint256 currentId = _currentSnapshotId.CURRENT697();
        emit SNAPSHOT753(currentId);
        return currentId;
    }

                                                                                                    
    function BALANCEOFAT167(address account, uint256 snapshotId) public view returns (uint256) {	//inject NONSTANDARD NAMING
        (bool snapshotted, uint256 value) = _VALUEAT266(snapshotId, _accountBalanceSnapshots[account]);

        return snapshotted ? value : BALANCEOF118(account);
    }

                                                                                            
    function TOTALSUPPLYAT918(uint256 snapshotId) public view returns(uint256) {	//inject NONSTANDARD NAMING
        (bool snapshotted, uint256 value) = _VALUEAT266(snapshotId, _totalSupplySnapshots);

        return snapshotted ? value : TOTALSUPPLY145();
    }

    // _transfer, _mint and _burn are the only functions where the balances are modified, so it is there that the
    // snapshots are updated. Note that the update happens _before_ the balance change, with the pre-modified value.
    // The same is true for the total supply and _mint and _burn.
    function _TRANSFER583(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        _UPDATEACCOUNTSNAPSHOT934(from);
        _UPDATEACCOUNTSNAPSHOT934(to);

        super._TRANSFER583(from, to, value);
    }

    function _MINT206(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _UPDATEACCOUNTSNAPSHOT934(account);
        _UPDATETOTALSUPPLYSNAPSHOT800();

        super._MINT206(account, value);
    }

    function _BURN570(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _UPDATEACCOUNTSNAPSHOT934(account);
        _UPDATETOTALSUPPLYSNAPSHOT800();

        super._BURN570(account, value);
    }

    function _VALUEAT266(uint256 snapshotId, Snapshots storage snapshots)	//inject NONSTANDARD NAMING
        private view returns (bool, uint256)
    {
        require(snapshotId > 0, "ERC20Snapshot: id is 0");
        // solhint-disable-next-line max-line-length
        require(snapshotId <= _currentSnapshotId.CURRENT697(), "ERC20Snapshot: nonexistent id");

        // When a valid snapshot is queried, there are three possibilities:
        //  a) The queried value was not modified after the snapshot was taken. Therefore, a snapshot entry was never
        //  created for this id, and all stored snapshot ids are smaller than the requested one. The value that corresponds
        //  to this id is the current one.
        //  b) The queried value was modified after the snapshot was taken. Therefore, there will be an entry with the
        //  requested id, and its value is the one to return.
        //  c) More snapshots were created after the requested one, and the queried value was later modified. There will be
        //  no entry for the requested id: the value that corresponds to it is that of the smallest snapshot id that is
        //  larger than the requested one.
        //
        // In summary, we need to find an element in an array, returning the index of the smallest value that is larger if
        // it is not found, unless said value doesn't exist (e.g. when all values are smaller). Arrays.findUpperBound does
        // exactly this.

        uint256 index = snapshots.ids.FINDUPPERBOUND954(snapshotId);

        if (index == snapshots.ids.length) {
            return (false, 0);
        } else {
            return (true, snapshots.values[index]);
        }
    }

    function _UPDATEACCOUNTSNAPSHOT934(address account) private {	//inject NONSTANDARD NAMING
        _UPDATESNAPSHOT608(_accountBalanceSnapshots[account], BALANCEOF118(account));
    }

    function _UPDATETOTALSUPPLYSNAPSHOT800() private {	//inject NONSTANDARD NAMING
        _UPDATESNAPSHOT608(_totalSupplySnapshots, TOTALSUPPLY145());
    }

    function _UPDATESNAPSHOT608(Snapshots storage snapshots, uint256 currentValue) private {	//inject NONSTANDARD NAMING
        uint256 currentId = _currentSnapshotId.CURRENT697();
        if (_LASTSNAPSHOTID140(snapshots.ids) < currentId) {
            snapshots.ids.push(currentId);
            snapshots.values.push(currentValue);
        }
    }

    function _LASTSNAPSHOTID140(uint256[] storage ids) private view returns (uint256) {	//inject NONSTANDARD NAMING
        if (ids.length == 0) {
            return 0;
        } else {
            return ids[ids.length - 1];
        }
    }
}

// ECDSA operations for signature

                                                                                                                                                                                                             
library ECDSA {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function RECOVER585(bytes32 hash, bytes memory signature) internal pure returns (address) {	//inject NONSTANDARD NAMING
        // Check the signature length
        if (signature.length != 65) {
            return (address(0));
        }

        // Divide the signature in r, s and v variables
        bytes32 r;
        bytes32 s;
        uint8 v;

        // ecrecover takes the signature parameters, and the only way to get them
        // currently is to use assembly.
        // solhint-disable-next-line no-inline-assembly
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }

        // EIP-2 still allows signature malleability for ecrecover(). Remove this possibility and make the signature
        // unique. Appendix F in the Ethereum Yellow paper (https://ethereum.github.io/yellowpaper/paper.pdf), defines
        // the valid range for s in (281): 0 < s < secp256k1n 1 2 + 1, and for v in (282): v 1 {27, 28}. Most
        // signatures from current libraries generate a unique signature with an s-value in the lower half order.
        //
        // If your library generates malleable signatures, such as s-values in the upper range, calculate a new s-value
        // with 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141 - s1 and flip v from 27 to 28 or
        // vice versa. If your library also generates signatures with 0/1 for v instead 27/28, add 27 to v to accept
        // these malleable signatures as well.
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            return address(0);
        }

        if (v != 27 && v != 28) {
            return address(0);
        }

        // If the signature is valid (and not malleable), return the signer address
        return ecrecover(hash, v, r, s);
    }

                                                                                                                                                                                                                                                                 
    function TOETHSIGNEDMESSAGEHASH506(bytes32 hash) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        // 32 is the length in bytes of hash,
        // enforced by the type signature above
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}

contract ERC20Delegatable is
    Initializable,
    ERC20
{
    using ECDSA for bytes32;

    struct DelegateBalance {
        uint128 delegatedBalance;       // number of delegated tokens
        uint128 receivedBalance;        // number of received tokens
        mapping(address => uint128) receivedFromBalances;   // [tokenOwner] => amount
    }

    // ** PUBLIC VARIABLES **

    // A record of accounts delegate 1 ([tokenReceiver] => DelegateBalance)
    mapping(address => DelegateBalance) public delegates;

    // ** EVENTS **

    event DELEGATED959(address indexed owner, address indexed recipient, uint256 amount);	//inject NONSTANDARD NAMING
    event UNDELEGATED684(address indexed owner, address indexed recipient, uint256 amount);	//inject NONSTANDARD NAMING

    // ** MODIFIERS **

    modifier CHECKDELEGATES275(address _tokenSpender, uint _amountToSpend) {	//inject NONSTANDARD NAMING
        uint balance = BALANCEOF118(_tokenSpender);
        uint receivedBalance = delegates[_tokenSpender].receivedBalance;
        require(balance.SUB360(receivedBalance) >= _amountToSpend, "not enough undelgated tokens");
        _;
    }

    modifier ONLYVERIFIED734(	//inject NONSTANDARD NAMING
        address delegator,
        address recipient,
        uint256 amount,
        uint256 maxAllowedTimestamp,
        bytes memory _signature // signature is v, r, s for ECDSA
    ) {
        require(now < maxAllowedTimestamp, "sign is expired");

        bytes32 hash = keccak256(abi.encodePacked(
            address(this),
            recipient,
            amount,
            maxAllowedTimestamp
        ));
        require(delegator == hash.RECOVER585(_signature), "This action is not verified");
        _;
    }

    // ** PUBLIC view function **

    function BALANCEOFWITHDELEGATED346(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return BALANCEOF118(account).ADD630(delegates[account].delegatedBalance);
    }

    function BALANCEOFWITHOUTRECEIVED572(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return BALANCEOF118(account).SUB360(delegates[account].receivedBalance);
    }

    // ** PUBLIC function **

    function DELGATE371(address recipient, uint256 amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _DELEGATE664(msg.sender, recipient, amount);
        return true;
    }

    function UNDELGATE188(address recipient, uint256 amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _UNDELEGATE833(msg.sender, recipient, amount);
        return true;
    }

    // ** PUBLIC with SIGN function **

    function DELGATEWITHSIGN695(	//inject NONSTANDARD NAMING
        address delegator,
        address recipient,
        uint256 amount,
        uint256 maxAllowedTimestamp,
        bytes memory _signature // signature is v, r, s for ECDSA
    ) public
        ONLYVERIFIED734(delegator, recipient, amount, maxAllowedTimestamp, _signature)
    returns(
        bool
    ) {
        _DELEGATE664(delegator, recipient, amount);
        return true;
    }

    function UNDELGATEWITHSIGN878(	//inject NONSTANDARD NAMING
        address delegator,
        address recipient,
        uint256 amount,
        uint256 maxAllowedTimestamp,
        bytes memory _signature // signature is v, r, s for ECDSA
    ) public
        ONLYVERIFIED734(delegator, recipient, amount, maxAllowedTimestamp, _signature)
    returns(
        bool
    ) {
        _UNDELEGATE833(delegator, recipient, amount);
        return true;
    }

    // ** INTERNAL functions **

    function _DELEGATE664(address owner, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != recipient, "Unable to delegate to delegator address");

        // UPD delegates states
        delegates[owner].delegatedBalance = uint128(uint256(delegates[owner].delegatedBalance).ADD630(amount));
        delegates[recipient].receivedBalance = uint128(uint256(delegates[recipient].receivedBalance).ADD630(amount));
        delegates[recipient].receivedFromBalances[owner] = uint128(uint256(delegates[recipient].receivedFromBalances[owner]).ADD630(amount));

        // transfer tokens from owner to recipient
        _TRANSFER583(owner, recipient, amount);

        emit DELEGATED959(owner, recipient, amount);
    }

    function _UNDELEGATE833(address owner, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        // UPD delegates states with validation
        delegates[owner].delegatedBalance = uint128(uint256(delegates[owner].delegatedBalance).SUB360(amount));
        delegates[recipient].receivedBalance = uint128(uint256(delegates[recipient].receivedBalance).SUB360(amount));
        delegates[recipient].receivedFromBalances[owner] = uint128(uint256(delegates[recipient].receivedFromBalances[owner]).SUB360(amount));

        // transfer tokens from recipient to owner
        _TRANSFER583(recipient, owner, amount);

        emit UNDELEGATED684(owner, recipient, amount);
    }

    // ** INTERNAL overrided with CHECK_DELEGATES functions **

    function _TRANSFER583(address sender, address recipient, uint256 amount) internal CHECKDELEGATES275(sender, amount) {	//inject NONSTANDARD NAMING
        super._TRANSFER583(sender, recipient, amount);
    }

    function _BURN570(address account, uint256 amount) internal CHECKDELEGATES275(account, amount) {	//inject NONSTANDARD NAMING
        super._BURN570(account, amount);
    }

}

// import "../openzeppelin/upgrades/contracts/Initializable.sol";

contract OwnableUpgradable is Initializable {
    address payable public owner;
    address payable internal newOwnerCandidate;

    modifier ONLYOWNER668 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Permission denied");
        _;
    }

    // ** INITIALIZERS 1 Constructors for Upgradable contracts **

    function INITIALIZE26() public INITIALIZER992 {	//inject NONSTANDARD NAMING
        owner = msg.sender;
    }

    function INITIALIZE26(address payable newOwner) public INITIALIZER992 {	//inject NONSTANDARD NAMING
        owner = newOwner;
    }

    function CHANGEOWNER581(address payable newOwner) public ONLYOWNER668 {	//inject NONSTANDARD NAMING
        newOwnerCandidate = newOwner;
    }

    function ACCEPTOWNER393() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwnerCandidate, "Permission denied");
        owner = newOwnerCandidate;
    }

    uint256[50] private ______gap;
}

contract DfDepositToken is
    Initializable,
    ERC20Detailed,
    ERC20Snapshot,
    OwnableUpgradable,
    ERC20Delegatable
{

    // ** INITIALIZER **

    function INITIALIZE26(	//inject NONSTANDARD NAMING
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        address payable _controller
    ) public INITIALIZER992 {
        // Initialize Parents Contracts
        ERC20Detailed.INITIALIZE26(_name, _symbol, _decimals);
        OwnableUpgradable.INITIALIZE26(_controller);
    }

    // ** PUBLIC functions **

    // Transfer to array of addresses
    function TRANSFER783(address[] memory recipients, uint256[] memory amounts) public returns(bool) {	//inject NONSTANDARD NAMING
        require(recipients.length == amounts.length, "Arrays lengths not equal");

        // transfer to all addresses
        for (uint i = 0; i < recipients.length; i++) {
            _TRANSFER583(msg.sender, recipients[i], amounts[i]);
        }

        return true;
    }

    // ** ONLY_OWNER functions **

    function SNAPSHOT656() public ONLYOWNER668 returns(uint256 currentId) {	//inject NONSTANDARD NAMING
        currentId = _SNAPSHOT675();
    }

    function MINT412(address account, uint256 amount) public ONLYOWNER668 {	//inject NONSTANDARD NAMING
        _MINT206(account, amount);
    }

    function BURNFROM112(address account, uint256 amount) public ONLYOWNER668 {	//inject NONSTANDARD NAMING
        _BURN570(account, amount);
    }
}