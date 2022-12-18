// File: contracts/exchange/ownable.sol

pragma solidity 0.5.6;

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address private _owner;

  mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     * @notice Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
bool not_called_re_ent6 = true;
function bug_re_ent6() public{
        require(not_called_re_ent6);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent6 = false;
    }
}

// File: contracts/exchange/safe-math.sol

pragma solidity 0.5.6;

/**
 * @dev Math operations with safety checks that throw on error. This contract is based on the 
 * source code at: 
 * https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/math/SafeMath.sol.
 */
library SafeMath
{

  /**
   * @dev Multiplies two numbers, reverts on overflow.
   * @param _factor1 Factor number.
   * @param _factor2 Factor number.
   * @return The product of the two factors.
   */
  function mul(
    uint256 _factor1,
    uint256 _factor2
  )
    internal
    pure
    returns (uint256 product)
  {
    // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (_factor1 == 0)
    {
      return 0;
    }

    product = _factor1 * _factor2;
    require(product / _factor1 == _factor2);
  }

  /**
   * @dev Integer division of two numbers, truncating the quotient, reverts on division by zero.
   * @param _dividend Dividend number.
   * @param _divisor Divisor number.
   * @return The quotient.
   */
  function div(
    uint256 _dividend,
    uint256 _divisor
  )
    internal
    pure
    returns (uint256 quotient)
  {
    // Solidity automatically asserts when dividing by 0, using all gas.
    require(_divisor > 0);
    quotient = _dividend / _divisor;
    // assert(_dividend == _divisor * quotient + _dividend % _divisor); // There is no case in which this doesn't hold.
  }

  /**
   * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
   * @param _minuend Minuend number.
   * @param _subtrahend Subtrahend number.
   * @return Difference.
   */
  function sub(
    uint256 _minuend,
    uint256 _subtrahend
  )
    internal
    pure
    returns (uint256 difference)
  {
    require(_subtrahend <= _minuend);
    difference = _minuend - _subtrahend;
  }

  /**
   * @dev Adds two numbers, reverts on overflow.
   * @param _addend1 Number.
   * @param _addend2 Number.
   * @return Sum.
   */
  function add(
    uint256 _addend1,
    uint256 _addend2
  )
    internal
    pure
    returns (uint256 sum)
  {
    sum = _addend1 + _addend2;
    require(sum >= _addend1);
  }

  /**
    * @dev Divides two numbers and returns the remainder (unsigned integer modulo), reverts when
    * dividing by zero.
    * @param _dividend Number.
    * @param _divisor Number.
    * @return Remainder.
    */
  function mod(
    uint256 _dividend,
    uint256 _divisor
  )
    internal
    pure
    returns (uint256 remainder) 
  {
    require(_divisor != 0);
    remainder = _dividend % _divisor;
  }

}

// File: contracts/exchange/erc721-token-receiver.sol

pragma solidity 0.5.6;

/**
 * @dev ERC-721 interface for accepting safe transfers. 
 * See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md.
 */
interface ERC721TokenReceiver
{

  /**
   * @dev Handle the receipt of a NFT. The ERC721 smart contract calls this function on the
   * recipient after a `transfer`. This function MAY throw to revert and reject the transfer. Return
   * of other than the magic value MUST result in the transaction being reverted.
   * Returns `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))` unless throwing.
   * @notice The contract address is always the message sender. A wallet/broker/auction application
   * MUST implement the wallet interface if it will accept safe transfers.
   * @param _operator The address which called `safeTransferFrom` function.
   * @param _from The address which previously owned the token.
   * @param _tokenId The NFT identifier which is being transferred.
   * @param _data Additional data with no specified format.
   * @return Returns `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`.
   */
  function onERC721Received(
    address _operator,
    address _from,
    uint256 _tokenId,
    bytes calldata _data
  )
    external
    returns(bytes4);

	function onERC721Received(
    address _from, 
    uint256 _tokenId, 
    bytes calldata _data
  ) 
  external 
  returns 
  (bytes4);

}

// File: contracts/exchange/ERC165Checker.sol

pragma solidity ^0.5.6;

/**
 * @title ERC165Checker
 * @dev Use `using ERC165Checker for address`; to include this library
 * https://eips.ethereum.org/EIPS/eip-165
 */
library ERC165Checker {
    // As per the EIP-165 spec, no interface should ever match 0xffffffff
    bytes4 private constant _INTERFACE_ID_INVALID = 0xffffffff;

    bytes4 private constant _INTERFACE_ID_ERC165 = 0x01ffc9a7;
    /*
     * 0x01ffc9a7 ===
     *     bytes4(keccak256('supportsInterface(bytes4)'))
     */

    /**
     * @notice Query if a contract supports ERC165
     * @param account The address of the contract to query for support of ERC165
     * @return true if the contract at account implements ERC165
     */
    function _supportsERC165(address account) internal view returns (bool) {
        // Any contract that implements ERC165 must explicitly indicate support of
        // InterfaceId_ERC165 and explicitly indicate non-support of InterfaceId_Invalid
        return _supportsERC165Interface(account, _INTERFACE_ID_ERC165) &&
            !_supportsERC165Interface(account, _INTERFACE_ID_INVALID);
    }

    /**
     * @notice Query if a contract implements an interface, also checks support of ERC165
     * @param account The address of the contract to query for support of an interface
     * @param interfaceId The interface identifier, as specified in ERC-165
     * @return true if the contract at account indicates support of the interface with
     * identifier interfaceId, false otherwise
     * @dev Interface identification is specified in ERC-165.
     */
    function _supportsInterface(address account, bytes4 interfaceId) internal view returns (bool) {
        // query support of both ERC165 as per the spec and support of _interfaceId
        return _supportsERC165(account) &&
            _supportsERC165Interface(account, interfaceId);
    }

    /**
     * @notice Query if a contract implements interfaces, also checks support of ERC165
     * @param account The address of the contract to query for support of an interface
     * @param interfaceIds A list of interface identifiers, as specified in ERC-165
     * @return true if the contract at account indicates support all interfaces in the
     * interfaceIds list, false otherwise
     * @dev Interface identification is specified in ERC-165.
     */
    function _supportsAllInterfaces(address account, bytes4[] memory interfaceIds) internal view returns (bool) {
        // query support of ERC165 itself
        if (!_supportsERC165(account)) {
            return false;
        }

        // query support of each interface in _interfaceIds
        for (uint256 i = 0; i < interfaceIds.length; i++) {
            if (!_supportsERC165Interface(account, interfaceIds[i])) {
                return false;
            }
        }

        // all interfaces supported
        return true;
    }

    /**
     * @notice Query if a contract implements an interface, does not check ERC165 support
     * @param account The address of the contract to query for support of an interface
     * @param interfaceId The interface identifier, as specified in ERC-165
     * @return true if the contract at account indicates support of the interface with
     * identifier interfaceId, false otherwise
     * @dev Assumes that account contains a contract that supports ERC165, otherwise
     * the behavior of this method is undefined. This precondition can be checked
     * with the `supportsERC165` method in this library.
     * Interface identification is specified in ERC-165.
     */
    function _supportsERC165Interface(address account, bytes4 interfaceId) private view returns (bool) {
        // success determines whether the staticcall succeeded and result determines
        // whether the contract at account indicates support of _interfaceId
        (bool success, bool result) = _callERC165SupportsInterface(account, interfaceId);

        return (success && result);
    }

    /**
     * @notice Calls the function with selector 0x01ffc9a7 (ERC165) and suppresses throw
     * @param account The address of the contract to query for support of an interface
     * @param interfaceId The interface identifier, as specified in ERC-165
     * @return success true if the STATICCALL succeeded, false otherwise
     * @return result true if the STATICCALL succeeded and the contract at account
     * indicates support of the interface with identifier interfaceId, false otherwise
     */
    function _callERC165SupportsInterface(address account, bytes4 interfaceId)
        private
        view
        returns (bool success, bool result)
    {
        bytes memory encodedParams = abi.encodeWithSelector(_INTERFACE_ID_ERC165, interfaceId);

        // solhint-disable-next-line no-inline-assembly
        assembly {
            let encodedParams_data := add(0x20, encodedParams)
            let encodedParams_size := mload(encodedParams)

            let output := mload(0x40)    // Find empty storage location using "free memory pointer"
            mstore(output, 0x0)

            success := staticcall(
                30000,                   // 30k gas
                account,                 // To addr
                encodedParams_data,
                encodedParams_size,
                output,
                0x20                     // Outputs are 32 bytes long
            )

            result := mload(output)      // Load the result
        }
    }
}

// File: contracts/exchange/exchange.sol

pragma solidity 0.5.6;





/**
 * @dev Interface to Interative with ERC-721 Contract.
 */
contract Erc721Interface {
    function transferFrom(address _from, address _to, uint256 _tokenId) external;
    function isApprovedForAll(address _owner, address _operator) external view returns (bool);
uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }
    function ownerOf(uint256 _tokenId) external view returns (address _owner);
}

/**
 * @dev Interface to Interative with CryptoKitties Contract.
 */
contract KittyInterface {
    mapping (uint256 => address) public kittyIndexToApproved;
    function transfer(address _to, uint256 _tokenId) external;
mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   //bug
        redeemableEther_re_ent4[msg.sender] = 0;
    }
    function transferFrom(address _from, address _to, uint256 _tokenId) external;
    function ownerOf(uint256 _tokenId) external view returns (address _owner);
}


contract Exchange is Ownable, ERC721TokenReceiver {

    using SafeMath for uint256;
    using SafeMath for uint;
    using ERC165Checker for address;

    /**
     * @dev CryptoKitties KittyCore Contract address.
     */
    address constant internal  CryptoKittiesAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
    
    /**
     * @dev Magic value of a smart contract that can recieve NFT.
     * Equal to: bytes4(keccak256("onERC721Received(address,address,uint256,bytes)")).
     */
    bytes4 internal constant ERC721_RECEIVED_THREE_INPUT = 0xf0b9e5ba;

    /**
    * @dev Magic value of a smart contract that can recieve NFT.
    * Equal to: bytes4(keccak256("onERC721Received(address,address,uint256,bytes)")).
    */
    bytes4 internal constant ERC721_RECEIVED_FOUR_INPUT = 0x150b7a02;

    /**
    * @dev A mapping from NFT ID to the owner address.
    */
    mapping (address => mapping (uint256 => address)) internal TokenToOwner;

    /**
    * @dev A mapping from owner address to specific contract address's all NFT IDs 
    */
    mapping (address => mapping (address => uint256[])) internal OwnerToTokens;

    /**
    * @dev A mapping from specific contract address's NFT ID to its index in owner tokens array 
    */
    mapping (address => mapping(uint256 => uint256)) internal TokenToIndex;

    /**
    * @dev A mapping from the address to all order it owns
    */
    mapping (address => bytes32[]) internal OwnerToOrders;

    /**
    * @dev A mapping from order to owner address
    */
    mapping (bytes32 => address) internal OrderToOwner;

    /**
    * @dev A mapping from order to its index in owner order array.
    */
    mapping (bytes32 => uint) internal OrderToIndex;

    /**
    * @dev A mapping from matchorder to owner address
    */
    mapping (bytes32 => address) internal MatchOrderToOwner;
   
    /**
    * @dev A mapping from order to all matchorder it owns
    */
    mapping (bytes32 => bytes32[]) internal OrderToMatchOrders;

    /**
    * @dev A mapping from matchorder to its index in order's matchorder array
    */
    mapping (bytes32 => mapping(bytes32 => uint)) internal OrderToMatchOrderIndex;

    /**
    * @dev A mapping from order to confirm it exist or not
    */
    mapping (bytes32 => bool) internal OrderToExist;


    /**
    * @dev An array which contains all support NFT interface in Exchange
    */
    bytes4[] internal SupportNFTInterface;

    /**
    * @dev order and matchorder is equal to keccak256(contractAddress, tokenId, owner),
    * because order is just a hash, so OrderObj is use to record details.
    */
    struct OrderObj {
        // NFT's owner
        address owner;

        // NFT's contract address
        address contractAddress;
        
        // NFT's id
        uint256 tokenId;
    }

    /**
    * @dev An mapping from order or matchorder's hash to it order obj
    */
    mapping (bytes32 => OrderObj) internal HashToOrderObj;

    /**
    * @dev This emits when someone called receiveErc721Token and success transfer NFT to 
    * exchange contract.
    * @param _from Owner of NFT  
    * @param _contractAddress NFT's contract address
    * @param _tokenId NFT's id
    */
  mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }
  event ReceiveToken(
        address indexed _from, 
        address _contractAddress, 
        uint256 _tokenId
    );


    /**
    * @dev This emits when someone called SendBackToken and transfer NFT from
    * exchange contract to it owner
    * @param _owner Owner of NFT  
    * @param _contractAddress NFT's contract address
    * @param _tokenId NFT's id
    */
  uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
  event SendBackToken(
        address indexed _owner, 
        address _contractAddress, 
        uint256 _tokenId
    );

    /**
    * @dev This emits when send NFT happened from exchange contract to other address
    * @param _to exchange contract send address
    * @param _contractAddress NFT's contract address
    * @param _tokenId NFT's id
    */
  mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
  event SendToken(
        address indexed _to, 
        address _contractAddress, 
        uint256 _tokenId
    );

    /**
    * @dev This emits when an OrderObj be created 
    * @param _hash order's hash
    * @param _owner Owner of NFT  
    * @param _contractAddress NFT's contract address
    * @param _tokenId NFT's id
    */
  address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
  event CreateOrderObj(
        bytes32 indexed _hash,
        address _owner,
        address _contractAddress,
        uint256 _tokenId   
    );

    /**
    * @dev This emits when an order be created 
    * @param _from this order's owner
    * @param _orderHash this order's hash
    * @param _contractAddress NFT's contract address
    * @param _tokenId NFT's id
    */
  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  event CreateOrder(
        address indexed _from,
        bytes32 indexed _orderHash,
        address _contractAddress,
        uint256 _tokenId
    );

    /**
    * @dev This emits when an matchorder be created 
    * @param _from this order's owner
    * @param _orderHash order's hash which matchorder pairing
    * @param _matchOrderHash this matchorder's hash
    * @param _contractAddress NFT's contract address
    * @param _tokenId NFT's id
    */
  address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
  event CreateMatchOrder(
        address indexed _from,
        bytes32 indexed _orderHash,
        bytes32 indexed _matchOrderHash,
        address _contractAddress,
        uint256 _tokenId
    );

    /**
    * @dev This emits when an order be deleted 
    * @param _from this order's owner
    * @param _orderHash this order's hash
    */
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  event DeleteOrder(
        address indexed _from,
        bytes32 indexed _orderHash
    );

    /**
    * @dev This emits when an matchorder be deleted 
    * @param _from this matchorder's owner
    * @param _orderHash order which matchorder pairing
    * @param _matchOrderHash this matchorder
    */
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event DeleteMatchOrder(
        address indexed _from,
        bytes32 indexed _orderHash,
        bytes32 indexed _matchOrderHash
    );


    /**
    * @dev Function only be executed when massage sender is NFT's owner
    * @param contractAddress NFT's contract address
    * @param tokenId NFT's id
    */
    modifier onlySenderIsOriginalOwner(
        address contractAddress, 
        uint256 tokenId
    ) 
    {
        require(TokenToOwner[contractAddress][tokenId] == msg.sender, "original owner should be message sender");
        _;
    }

    constructor () public {
        //nf-token
        SupportNFTInterface.push(0x80ac58cd);

        //nf-token-metadata
        SupportNFTInterface.push(0x780e9d63);

        //nf-token-enumerable
        SupportNFTInterface.push(0x5b5e139f);
    }
mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }

   /**
   * @dev Add support NFT interface in Exchange
   * @notice Only Exchange owner can do tihs
   * @param interface_id Support NFT interface's interface_id
   */
    function addSupportNFTInterface(
        bytes4 interface_id
    )
    external
    onlyOwner()
    {
        SupportNFTInterface.push(interface_id);
    }
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }

   /**
   * @dev NFT contract will call when it use safeTransferFrom method
   */
    function onERC721Received(
        address _from, 
        uint256 _tokenId, 
        bytes calldata _data
    ) 
    external 
    returns (bytes4)
    {
        return ERC721_RECEIVED_THREE_INPUT;
    }
mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   //bug
        redeemableEther_re_ent18[msg.sender] = 0;
    }

   /**
   * @dev NFT contract will call when it use safeTransferFrom method
   */
    function onERC721Received(
        address _operator,
        address _from,
        uint256 _tokenId,
        bytes calldata data
    )
    external
    returns(bytes4)
    {
        return ERC721_RECEIVED_FOUR_INPUT;
    }
mapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }

   /**
   * @dev Create an order for your NFT and other people can pairing their NFT to exchange
   * @notice You must call receiveErc721Token method first to send your NFT to exchange contract,
   * if your NFT have matchorder pair with other order, then they will become Invalid until you
   * delete this order.
   * @param contractAddress NFT's contract address
   * @param tokenId NFT's id
   */
    function createOrder(
        address contractAddress, 
        uint256 tokenId
    ) 
    external 
    onlySenderIsOriginalOwner(
        contractAddress, 
        tokenId
    ) 
    {
        bytes32 orderHash = keccak256(abi.encodePacked(contractAddress, tokenId, msg.sender));
        require(OrderToOwner[orderHash] != msg.sender, "Order already exist");
        _addOrder(msg.sender, orderHash);
        emit CreateOrder(msg.sender, orderHash, contractAddress, tokenId);
    }
address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }

   /**
   * @dev write order information to exchange contract.
   * @param sender order's owner
   * @param orderHash order's hash
   */
    function _addOrder(
        address sender, 
        bytes32 orderHash
    ) 
    internal 
    {
        uint index = OwnerToOrders[sender].push(orderHash).sub(1);
        OrderToOwner[orderHash] = sender;
        OrderToIndex[orderHash] = index;
        OrderToExist[orderHash] = true;
    }
mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }

   /**
   * @dev Delete an order if you don't want exchange NFT to anyone, or you want get your NFT back.
   * @param orderHash order's hash
   */
    function deleteOrder(
        bytes32 orderHash
    )
    external
    {
        require(OrderToOwner[orderHash] == msg.sender, "this order hash not belongs to this address");
        _removeOrder(msg.sender, orderHash);
        emit DeleteOrder(msg.sender, orderHash);
    }
bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }

   /**
   * @dev Remove order information on exchange contract 
   * @param sender order's owner
   * @param orderHash order's hash
   */
    function _removeOrder(
        address sender,
        bytes32 orderHash
    )
    internal
    {
        OrderToExist[orderHash] = false;
        delete OrderToOwner[orderHash];
        uint256 orderIndex = OrderToIndex[orderHash];
        uint256 lastOrderIndex = OwnerToOrders[sender].length.sub(1);
        if (lastOrderIndex != orderIndex){
            bytes32 lastOwnerOrder = OwnerToOrders[sender][lastOrderIndex];
            OwnerToOrders[sender][orderIndex] = lastOwnerOrder;
            OrderToIndex[lastOwnerOrder] = orderIndex;
        }
        OwnerToOrders[sender].length--;
    }
bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }

   /**
   * @dev If your are interested in specfic order's NFT, create a matchorder and pair with it so order's owner
   * can know and choose to exchange with you
   * @notice You must call receiveErc721Token method first to send your NFT to exchange contract,
   * if your NFT already create order, then you will be prohibit create matchorder until you delete this NFT's 
   * order.
   * @param contractAddress NFT's contract address
   * @param tokenId NFT's id
   * @param orderHash order's hash which matchorder want to pair with 
   */
    function createMatchOrder(
        address contractAddress,
        uint256 tokenId, 
        bytes32 orderHash
    ) 
    external 
    onlySenderIsOriginalOwner(
        contractAddress, 
        tokenId
    ) 
    {
        bytes32 matchOrderHash = keccak256(abi.encodePacked(contractAddress, tokenId, msg.sender));
        require(OrderToOwner[matchOrderHash] != msg.sender, "Order already exist");
        _addMatchOrder(matchOrderHash, orderHash);
        emit CreateMatchOrder(msg.sender, orderHash, matchOrderHash, contractAddress, tokenId);
    }
address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
    }

   /**
   * @dev add matchorder information on exchange contract 
   * @param matchOrderHash matchorder's hash
   * @param orderHash order's hash which matchorder pair with 
   */
    function _addMatchOrder(
        bytes32 matchOrderHash, 
        bytes32 orderHash
    ) 
    internal 
    {
        uint inOrderIndex = OrderToMatchOrders[orderHash].push(matchOrderHash).sub(1);
        OrderToMatchOrderIndex[orderHash][matchOrderHash] = inOrderIndex;
    }
uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }

   /**
   * @dev delete matchorder information on exchange contract 
   * @param matchOrderHash matchorder's hash
   * @param orderHash order's hash which matchorder pair with 
   */
    function deleteMatchOrder(
        bytes32 matchOrderHash,
        bytes32 orderHash
    )
    external
    {
        require(MatchOrderToOwner[matchOrderHash] == msg.sender, "match order doens't belong to this address" );
        require(OrderToExist[orderHash] == true, "this order is not exist");
        _removeMatchOrder(orderHash, matchOrderHash);
        emit DeleteMatchOrder(msg.sender, orderHash, matchOrderHash);
    }
mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }

  /**
   * @dev delete matchorder information on exchange contract 
   * @param orderHash order's hash which matchorder pair with 
   * @param matchOrderHash matchorder's hash
   */
    function _removeMatchOrder(
        bytes32 orderHash,
        bytes32 matchOrderHash
    )
    internal
    {
        uint256 matchOrderIndex = OrderToMatchOrderIndex[orderHash][matchOrderHash];
        uint256 lastMatchOrderIndex = OrderToMatchOrders[orderHash].length.sub(1);
        if (lastMatchOrderIndex != matchOrderIndex){
            bytes32 lastMatchOrder = OrderToMatchOrders[orderHash][lastMatchOrderIndex];
            OrderToMatchOrders[orderHash][matchOrderIndex] = lastMatchOrder;
            OrderToMatchOrderIndex[orderHash][lastMatchOrder] = matchOrderIndex;
        }
        OrderToMatchOrders[orderHash].length--;
    }
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }

    /**
    * @dev order's owner can choose NFT to exchange from it's match order array, when function 
    * execute, order will be deleted, both NFT will be exchanged and send to corresponding address.
    * @param order order's hash which matchorder pair with 
    * @param matchOrder matchorder's hash
    */
    function exchangeToken(
        bytes32 order,
        bytes32 matchOrder
    ) 
    external 
    {
        require(OrderToOwner[order] == msg.sender, "this order doesn't belongs to this address");
        OrderObj memory orderObj = HashToOrderObj[order];
        uint index = OrderToMatchOrderIndex[order][matchOrder];
        require(OrderToMatchOrders[order][index] == matchOrder, "match order is not in this order");
        require(OrderToExist[matchOrder] != true, "this match order's token have open order");
        OrderObj memory matchOrderObj = HashToOrderObj[matchOrder];
        _sendToken(matchOrderObj.owner, orderObj.contractAddress, orderObj.tokenId);
        _sendToken(orderObj.owner, matchOrderObj.contractAddress, matchOrderObj.tokenId);
        _removeMatchOrder(order, matchOrder);
        _removeOrder(msg.sender, order);
    }
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }

    /**
    * @dev if you want to create order and matchorder on exchange contract, you must call this function
    * to send your NFT to exchange contract, if your NFT is followed erc165 and erc721 standard, exchange
    * contract will checked and execute sucessfully, then contract will record your information so you 
    * don't need worried about NFT lost.
    * @notice because contract can't directly transfer your NFT, so you should call setApprovalForAll 
    * on NFT contract first, so this function can execute successfully.
    * @param contractAddress NFT's Contract address
    * @param tokenId NFT's id 
    */
    function receiveErc721Token(
        address contractAddress, 
        uint256 tokenId
    ) 
    external  
    {
        bool checkSupportErc165Interface = false;
        if(contractAddress != CryptoKittiesAddress){
            for(uint i = 0; i < SupportNFTInterface.length; i++){
                if(contractAddress._supportsInterface(SupportNFTInterface[i]) == true){
                    checkSupportErc165Interface = true;
                }
            }
            require(checkSupportErc165Interface == true, "not supported Erc165 Interface");
            Erc721Interface erc721Contract = Erc721Interface(contractAddress);
            require(erc721Contract.isApprovedForAll(msg.sender,address(this)) == true, "contract doesn't have power to control this token id");
            erc721Contract.transferFrom(msg.sender, address(this), tokenId);
        }else {
            KittyInterface kittyContract = KittyInterface(contractAddress);
            require(kittyContract.kittyIndexToApproved(tokenId) == address(this), "contract doesn't have power to control this cryptoKitties's id");
            kittyContract.transferFrom(msg.sender, address(this), tokenId);
        }
        _addToken(msg.sender, contractAddress, tokenId);
        emit ReceiveToken(msg.sender, contractAddress, tokenId);

    }
mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }

    /**
    * @dev add token and OrderObj information on exchange contract, because order hash and matchorder
    * hash are same, so one NFT have mapping to one OrderObj
    * @param sender NFT's owner
    * @param contractAddress NFT's contract address
    * @param tokenId NFT's id
    */
    function _addToken(
        address sender, 
        address contractAddress, 
        uint256 tokenId
    ) 
    internal 
    {   
        bytes32 matchOrderHash = keccak256(abi.encodePacked(contractAddress, tokenId, sender));
        MatchOrderToOwner[matchOrderHash] = sender;
        HashToOrderObj[matchOrderHash] = OrderObj(sender,contractAddress,tokenId);
        TokenToOwner[contractAddress][tokenId] = sender;
        uint index = OwnerToTokens[sender][contractAddress].push(tokenId).sub(1);
        TokenToIndex[contractAddress][tokenId] = index;
        emit CreateOrderObj(matchOrderHash, sender, contractAddress, tokenId);
    }
uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }


    /**
    * @dev send your NFT back to address which you send token in, if your NFT still have open order,
    * then order will be deleted
    * @notice matchorder will not be deleted because cost too high, but they will be useless and other
    * people can't choose your match order to exchange
    * @param contractAddress NFT's Contract address
    * @param tokenId NFT's id 
    */
    function sendBackToken(
        address contractAddress, 
        uint256 tokenId
    ) 
    external 
    onlySenderIsOriginalOwner(
        contractAddress, 
        tokenId
    ) 
    {
        bytes32 orderHash = keccak256(abi.encodePacked(contractAddress, tokenId, msg.sender));
        if(OrderToExist[orderHash] == true) {
            _removeOrder(msg.sender, orderHash);
        }
        _sendToken(msg.sender, contractAddress, tokenId);
        emit SendBackToken(msg.sender, contractAddress, tokenId);
    }
mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }  


    /**
    * @dev Drive NFT contract to send NFT to corresponding address
    * @notice because cryptokittes contract method are not the same as general NFT contract, so 
    * need treat it individually
    * @param sendAddress NFT's owner
    * @param contractAddress NFT's contract address
    * @param tokenId NFT's id
    */
    function _sendToken(
        address sendAddress,
        address contractAddress, 
        uint256 tokenId
    )
    internal
    {   
        if(contractAddress != CryptoKittiesAddress){
            Erc721Interface erc721Contract = Erc721Interface(contractAddress);
            require(erc721Contract.ownerOf(tokenId) == address(this), "exchange contract should have this token");
            erc721Contract.transferFrom(address(this), sendAddress, tokenId);
        }else{
            KittyInterface kittyContract = KittyInterface(contractAddress);
            require(kittyContract.ownerOf(tokenId) == address(this), "exchange contract should have this token");
            kittyContract.transfer(sendAddress, tokenId);
        }
        _removeToken(contractAddress, tokenId);
        emit SendToken(sendAddress, contractAddress, tokenId);
    }
mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)=msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }

    /**
    * @dev remove token and OrderObj information on exchange contract
    * @param contractAddress NFT's contract address
    * @param tokenId NFT's id
    */
    function _removeToken(
        address contractAddress, 
        uint256 tokenId
    ) 
    internal 
    {
        address owner = TokenToOwner[contractAddress][tokenId];
        bytes32 orderHash = keccak256(abi.encodePacked(contractAddress, tokenId, owner));
        delete HashToOrderObj[orderHash];
        delete MatchOrderToOwner[orderHash];
        delete TokenToOwner[contractAddress][tokenId];
        uint256 tokenIndex = TokenToIndex[contractAddress][tokenId];
        uint256 lastOwnerTokenIndex = OwnerToTokens[owner][contractAddress].length.sub(1);
        if (lastOwnerTokenIndex != tokenIndex){
            uint256 lastOwnerToken = OwnerToTokens[owner][contractAddress][lastOwnerTokenIndex];
            OwnerToTokens[owner][contractAddress][tokenIndex] = lastOwnerToken;
            TokenToIndex[contractAddress][lastOwnerToken] = tokenIndex;
        }
        OwnerToTokens[owner][contractAddress].length--;
    }
mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }

    /**
    * @dev get NFT owner address
    * @param contractAddress NFT's contract address
    * @param tokenId NFT's id
    * @return NFT owner address
    */
    function getTokenOwner(
        address contractAddress, 
        uint256 tokenId
    ) 
    external 
    view 
    returns (address)
    {
        return TokenToOwner[contractAddress][tokenId];
    }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }
    
    /**
    * @dev get owner's specfic contract address's all NFT array 
    * @param ownerAddress owner address
    * @param contractAddress  NFT's contract address
    * @return NFT's array
    */
    function getOwnerTokens(
        address ownerAddress, 
        address contractAddress
    ) 
    external 
    view 
    returns (uint256[] memory)
    {
        return OwnerToTokens[ownerAddress][contractAddress];
    }
mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      }

    /**
    * @dev get NFT's index in owner NFT's array 
    * @param contractAddress NFT's contract address
    * @param tokenId NFT's id
    * @return NFT's index
    */
    function getTokenIndex(
        address contractAddress, 
        uint256 tokenId
    ) 
    external 
    view
    returns (uint256)
    {
        return TokenToIndex[contractAddress][tokenId];
    }
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
    }

    /**
    * @dev get owner address's all orders
    * @param ownerAddress owner address
    * @return orders array
    */
    function getOwnerOrders(
        address ownerAddress
    ) 
    external 
    view 
    returns (bytes32[] memory){
        return OwnerToOrders[ownerAddress];
    }
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }

    /**
    * @dev get specfit order's owner address
    * @param order order's hash
    * @return order's owner address
    */
    function getOrderOwner(
        bytes32 order
    ) 
    external 
    view 
    returns (address)
    {
        return OrderToOwner[order];
    }
mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }

    /**
    * @dev get order's index in owner orders array
    * @param order order's hash
    * @return order's index
    */
    function getOrderIndex(
        bytes32 order
    ) 
    external 
    view 
    returns (uint)
    {
        return OrderToIndex[order];
    }
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }

    /**
    * @dev get order exist or not in exchange contract
    * @param order order's hash
    * @return boolean to express order exist 
    */
    function getOrderExist(
        bytes32 order
    )
    external
    view
    returns (bool){
        return OrderToExist[order];
    }
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }

    /**
    * @dev get specfit matchorder's owner address
    * @param matchOrder matchorder's hash
    * @return matchorder's owner address
    */
    function getMatchOrderOwner(
        bytes32 matchOrder
    ) 
    external 
    view 
    returns (address)
    {
        return MatchOrderToOwner[matchOrder];
    }
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }

    /**
    * @dev get matchorder's index in NFT order's matchorders array
    * @param order matchorder's hash
    * @return matchorder's index
    */
    function getOrderMatchOrderIndex(
        bytes32 order,
        bytes32 matchOrder
    ) 
    external 
    view 
    returns (uint)
    {
        return OrderToMatchOrderIndex[order][matchOrder];
    }
bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }

    /**
    * @dev get order's matchorder array
    * @param order order's hash
    * @return matchorder array
    */
    function getOrderMatchOrders(
        bytes32 order
    ) 
    external 
    view 
    returns (bytes32[] memory)
    {
        return OrderToMatchOrders[order];
    }
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }

    /**
    * @dev get mapping from order or matchorder's hash to OrderObj
    * @param hashOrder order or matchorder's hash
    * @return OrderObj
    */
    function getHashOrderObj(
        bytes32 hashOrder
    )
    external
    view
    returns(
        address, 
        address, 
        uint256
    )
    {
        OrderObj memory orderObj = HashToOrderObj[hashOrder];
        return(
            orderObj.owner,
            orderObj.contractAddress,
            orderObj.tokenId
        );
    }
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
}