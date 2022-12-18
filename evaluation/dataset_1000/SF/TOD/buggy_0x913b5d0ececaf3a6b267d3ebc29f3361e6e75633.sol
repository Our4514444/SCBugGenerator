/**
 *Submitted for verification at Etherscan.io on 2020-01-27
*/

pragma solidity ^0.5.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
	/**
 	* @dev Returns the addition of two unsigned integers, reverting on
 	* overflow.
 	*
 	* Counterpart to Solidity's `+` operator.
 	*
 	* Requirements:
 	* - Addition cannot overflow.
 	*/
	function add(uint256 a, uint256 b) internal pure returns (uint256) {
    	uint256 c = a + b;
    	require(c >= a, "SafeMath: addition overflow");

    	return c;
	}

	/**
 	* @dev Returns the subtraction of two unsigned integers, reverting on
 	* overflow (when the result is negative).
 	*
 	* Counterpart to Solidity's `-` operator.
 	*
 	* Requirements:
 	* - Subtraction cannot overflow.
 	*/
	function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    	return sub(a, b, "SafeMath: subtraction overflow");
	}

	/**
 	* @dev Returns the subtraction of two unsigned integers, reverting with custom message on
 	* overflow (when the result is negative).
 	*
 	* Counterpart to Solidity's `-` operator.
 	*
 	* Requirements:
 	* - Subtraction cannot overflow.
 	*
 	* _Available since v2.4.0._
 	*/
	function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
    	require(b <= a, errorMessage);
    	uint256 c = a - b;

    	return c;
	}

	/**
 	* @dev Returns the multiplication of two unsigned integers, reverting on
 	* overflow.
 	*
 	* Counterpart to Solidity's `*` operator.
 	*
 	* Requirements:
 	* - Multiplication cannot overflow.
 	*/
	function mul(uint256 a, uint256 b) internal pure returns (uint256) {
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

	/**
 	* @dev Returns the integer division of two unsigned integers. Reverts on
 	* division by zero. The result is rounded towards zero.
 	*
 	* Counterpart to Solidity's `/` operator. Note: this function uses a
 	* `revert` opcode (which leaves remaining gas untouched) while Solidity
 	* uses an invalid opcode to revert (consuming all remaining gas).
 	*
 	* Requirements:
 	* - The divisor cannot be zero.
 	*/
	function div(uint256 a, uint256 b) internal pure returns (uint256) {
    	return div(a, b, "SafeMath: division by zero");
	}

	/**
 	* @dev Returns the integer division of two unsigned integers. Reverts with custom message on
 	* division by zero. The result is rounded towards zero.
 	*
 	* Counterpart to Solidity's `/` operator. Note: this function uses a
 	* `revert` opcode (which leaves remaining gas untouched) while Solidity
 	* uses an invalid opcode to revert (consuming all remaining gas).
 	*
 	* Requirements:
 	* - The divisor cannot be zero.
 	*
 	* _Available since v2.4.0._
 	*/
	function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
    	// Solidity only automatically asserts when dividing by 0
    	require(b > 0, errorMessage);
    	uint256 c = a / b;
    	// assert(a == b * c + a % b); // There is no case in which this doesn't hold

    	return c;
	}

	/**
 	* @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
 	* Reverts when dividing by zero.
 	*
 	* Counterpart to Solidity's `%` operator. This function uses a `revert`
 	* opcode (which leaves remaining gas untouched) while Solidity uses an
 	* invalid opcode to revert (consuming all remaining gas).
 	*
 	* Requirements:
 	* - The divisor cannot be zero.
 	*/
	function mod(uint256 a, uint256 b) internal pure returns (uint256) {
    	return mod(a, b, "SafeMath: modulo by zero");
	}

	/**
 	* @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
 	* Reverts with custom message when dividing by zero.
 	*
 	* Counterpart to Solidity's `%` operator. This function uses a `revert`
 	* opcode (which leaves remaining gas untouched) while Solidity uses an
 	* invalid opcode to revert (consuming all remaining gas).
 	*
 	* Requirements:
 	* - The divisor cannot be zero.
 	*
 	* _Available since v2.4.0._
 	*/
	function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
    	require(b != 0, errorMessage);
    	return a % b;
	}
}

/**
 * @dev Collection of functions related to the address type
 */
library Address {
	/**
 	* @dev Returns true if `account` is a contract.
 	*
 	* [IMPORTANT]
 	* ====
 	* It is unsafe to assume that an address for which this function returns
 	* false is an externally-owned account (EOA) and not a contract.
 	*
 	* Among others, `isContract` will return false for the following
 	* types of addresses:
 	*
 	*  - an externally-owned account
 	*  - a contract in construction
 	*  - an address where a contract will be created
 	*  - an address where a contract lived, but was destroyed
 	* ====
 	*/
	function isContract(address account) internal view returns (bool) {
    	// According to EIP-1052, 0x0 is the value returned for not-yet created accounts
    	// and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
    	// for accounts without code, i.e. `keccak256('')`
    	bytes32 codehash;
    	bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
    	// solhint-disable-next-line no-inline-assembly
    	assembly { codehash := extcodehash(account) }
    	return (codehash != accountHash && codehash != 0x0);
	}

	/**
 	* @dev Converts an `address` into `address payable`. Note that this is
 	* simply a type cast: the actual underlying value is not changed.
 	*
 	* _Available since v2.4.0._
 	*/
	function toPayable(address account) internal pure returns (address payable) {
    	return address(uint160(account));
	}

	/**
 	* @dev Replacement for Solidity's `transfer`: sends `amount` wei to
 	* `recipient`, forwarding all available gas and reverting on errors.
 	*
 	* https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
 	* of certain opcodes, possibly making contracts go over the 2300 gas limit
 	* imposed by `transfer`, making them unable to receive funds via
 	* `transfer`. {sendValue} removes this limitation.
 	*
 	* https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
 	*
 	* IMPORTANT: because control is transferred to `recipient`, care must be
 	* taken to not create reentrancy vulnerabilities. Consider using
 	* {ReentrancyGuard} or the
 	* https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
 	*
 	* _Available since v2.4.0._
 	*/
	function sendValue(address payable recipient, uint256 amount) internal {
    	require(address(this).balance >= amount, "Address: insufficient balance");

    	// solhint-disable-next-line avoid-call-value
    	(bool success, ) = recipient.call.value(amount)("");
    	require(success, "Address: unable to send value, recipient may have reverted");
	}
}

/**
 * @title Counters
 * @author Matt Condon (@shrugs)
 * @dev Provides counters that can only be incremented or decremented by one. This can be used e.g. to track the number
 * of elements in a mapping, issuing ERC721 ids, or counting request ids.
 *
 * Include with `using Counters for Counters.Counter;`
 * Since it is not possible to overflow a 256 bit integer with increments of one, `increment` can skip the {SafeMath}
 * overflow check, thereby saving gas. This does assume however correct usage, in that the underlying `_value` is never
 * directly accessed.
 */
library Counters {
	using SafeMath for uint256;

	struct Counter {
    	// This variable should never be directly accessed by users of the library: interactions must be restricted to
    	// the library's function. As of Solidity v0.5.2, this cannot be enforced, though there is a proposal to add
    	// this feature: see https://github.com/ethereum/solidity/issues/4637
    	uint256 _value; // default: 0
	}

	function current(Counter storage counter) internal view returns (uint256) {
    	return counter._value;
	}

	function increment(Counter storage counter) internal {
    	// The {SafeMath} overflow check can be skipped here, see the comment at the top
    	counter._value += 1;
	}

	function decrement(Counter storage counter) internal {
    	counter._value = counter._value.sub(1);
	}
}

/**
 * @title Roles
 * @dev Library for managing addresses assigned to a Role.
 */
library Roles {
	struct Role {
    	mapping (address => bool) bearer;
	}

	/**
 	* @dev give an account access to this role
 	*/
	function add(Role storage role, address account) internal {
    	require(account != address(0));
    	require(!has(role, account));

    	role.bearer[account] = true;
	}

	/**
 	* @dev remove an account's access to this role
 	*/
	function remove(Role storage role, address account) internal {
    	require(account != address(0));
    	require(has(role, account));

    	role.bearer[account] = false;
	}

	/**
 	* @dev check if an account has this role
 	* @return bool
 	*/
	function has(Role storage role, address account) internal view returns (bool) {
    	require(account != address(0));
    	return role.bearer[account];
	}
}

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
	// Empty internal constructor, to prevent people from mistakenly deploying
	// an instance of this contract, which should be used via inheritance.
	constructor () internal { }
	// solhint-disable-previous-line no-empty-blocks

	function _msgSender() internal view returns (address payable) {
    	return msg.sender;
	}

	function _msgData() internal view returns (bytes memory) {
    	this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
    	return msg.data;
	}
}

contract MinterRole is Context {
	using Roles for Roles.Role;
address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }

	event MinterAdded(address indexed account);address payable winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }

	event MinterRemoved(address indexed account);

	Roles.Role private _minters;

	constructor () internal {
    	_addMinter(_msgSender());
	}

	modifier onlyMinter() {
    	require(isMinter(_msgSender()), "MinterRole: caller does not have the Minter role");
    	_;
	}

	function isMinter(address account) public view returns (bool) {
    	return _minters.has(account);
	}

	function renounceMinter() public {
    	_removeMinter(_msgSender());
	}

	function _addMinter(address account) internal {
    	_minters.add(account);
    	emit MinterAdded(account);
	}

	function _removeMinter(address account) internal {
    	_minters.remove(account);
    	emit MinterRemoved(account);
	}
}

contract PauserRole is Context {
	using Roles for Roles.Role;
bool claimed_TOD24 = false;
address payable owner_TOD24;
uint256 reward_TOD24;
function setReward_TOD24() public payable {
        require (!claimed_TOD24);

        require(msg.sender == owner_TOD24);
        owner_TOD24.transfer(reward_TOD24);
        reward_TOD24 = msg.value;
    }

    function claimReward_TOD24(uint256 submission) public {
        require (!claimed_TOD24);
        require(submission < 10);

        msg.sender.transfer(reward_TOD24);
        claimed_TOD24 = true;
    }

	event PauserAdded(address indexed account);address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }

	event PauserRemoved(address indexed account);

	Roles.Role private _pausers;

	constructor () internal {
    	_addPauser(_msgSender());
	}

	modifier onlyPauser() {
    	require(isPauser(_msgSender()), "PauserRole: caller does not have the Pauser role");
    	_;
	}

	function isPauser(address account) public view returns (bool) {
    	return _pausers.has(account);
	}

	function renouncePauser() public {
    	_removePauser(_msgSender());
	}

	function _addPauser(address account) internal {
    	_pausers.add(account);
    	emit PauserAdded(account);
	}

	function _removePauser(address account) internal {
    	_pausers.remove(account);
    	emit PauserRemoved(account);
	}
}

contract BurnerRole is Context {
	using Roles for Roles.Role;
bool claimed_TOD26 = false;
address payable owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
    }

	event BurnerAdded(address indexed account);address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }

	event BurnerRemoved(address indexed account);

	Roles.Role private _burners;
    
	constructor () internal {
    	_addBurner(_msgSender());
	}

	modifier onlyBurner() {
    	require(isBurner(_msgSender()), "BurnerRole: caller does not have the Burner role");
    	_;
	}

	function isBurner(address account) public view returns (bool) {
    	return _burners.has(account);
	}

	function renounceBurner() public {
    	_removeBurner(_msgSender());
	}

	function _addBurner(address account) internal {
    	_burners.add(account);
    	emit BurnerAdded(account);
	}

	function _removeBurner(address account) internal {
    	_burners.remove(account);
    	emit BurnerRemoved(account);
	}
}

contract OperatorRole is Context {
	using Roles for Roles.Role;
bool claimed_TOD10 = false;
address payable owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }

	event OperatorAdded(address indexed account);address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }

	event OperatorRemoved(address indexed account);

	Roles.Role private _operators;
    
	constructor () internal {
    	_addOperator(_msgSender());
	}

	modifier onlyOperator() {
    	require(isOperator(_msgSender()), "OperatorRole: caller does not have the Operator role");
    	_;
	}

	function isOperator(address account) public view returns (bool) {
    	return _operators.has(account);
	}

	function addOperator(address account) public onlyOperator {
    	_addOperator(account);
	}
    
	function renounceOperator() public {
    	_removeOperator(_msgSender());
	}
    
	function _addOperator(address account) internal {
    	_operators.add(account);
    	emit OperatorAdded(account);
	}

	function _removeOperator(address account) internal {
    	_operators.remove(account);
    	emit OperatorRemoved(account);
	}
}

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
	/**
 	* @dev Returns true if this contract implements the interface defined by
 	* `interfaceId`. See the corresponding
 	* https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
 	* to learn more about how these ids are created.
 	*
 	* This function call must use less than 30 000 gas.
 	*/
	function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts may inherit from this and call {_registerInterface} to declare
 * their support of an interface.
 */
contract ERC165 is IERC165 {
	/*
 	* bytes4(keccak256('supportsInterface(bytes4)')) == 0x01ffc9a7
 	*/
	bytes4 private constant _INTERFACE_ID_ERC165 = 0x01ffc9a7;

	/**
 	* @dev Mapping of interface ids to whether or not it's supported.
 	*/
	mapping(bytes4 => bool) private _supportedInterfaces;

	constructor () internal {
    	// Derived contracts need only register support for their own interfaces,
    	// we register support for ERC165 itself here
    	_registerInterface(_INTERFACE_ID_ERC165);
	}

	/**
 	* @dev See {IERC165-supportsInterface}.
 	*
 	* Time complexity O(1), guaranteed to always use less than 30 000 gas.
 	*/
	function supportsInterface(bytes4 interfaceId) external view returns (bool) {
    	return _supportedInterfaces[interfaceId];
	}

	/**
 	* @dev Registers the contract as an implementer of the interface defined by
 	* `interfaceId`. Support of the actual ERC165 interface is automatic and
 	* registering its interface id is not required.
 	*
 	* See {IERC165-supportsInterface}.
 	*
 	* Requirements:
 	*
 	* - `interfaceId` cannot be the ERC165 invalid interface (`0xffffffff`).
 	*/
	function _registerInterface(bytes4 interfaceId) internal {
    	require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
    	_supportedInterfaces[interfaceId] = true;
	}
}

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
contract IERC721 is IERC165 {address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }

	event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }

	event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }

	event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

	/**
 	* @dev Returns the number of NFTs in `owner`'s account.
 	*/
	function balanceOf(address owner) public view returns (uint256 balance);

	/**
 	* @dev Returns the owner of the NFT specified by `tokenId`.
 	*/
	function ownerOf(uint256 tokenId) public view returns (address owner);

	/**
 	* @dev Transfers a specific NFT (`tokenId`) from one account (`from`) to
 	* another (`to`).
 	*
 	*
 	*
 	* Requirements:
 	* - `from`, `to` cannot be zero.
 	* - `tokenId` must be owned by `from`.
 	* - If the caller is not `from`, it must be have been allowed to move this
 	* NFT by either {approve} or {setApprovalForAll}.
 	*/
	function safeTransferFrom(address from, address to, uint256 tokenId) public;
	/**
 	* @dev Transfers a specific NFT (`tokenId`) from one account (`from`) to
 	* another (`to`).
 	*
 	* Requirements:
 	* - If the caller is not `from`, it must be approved to move this NFT by
 	* either {approve} or {setApprovalForAll}.
 	*/
	function transferFrom(address from, address to, uint256 tokenId) public;
	function approve(address to, uint256 tokenId) public;
	function getApproved(uint256 tokenId) public view returns (address operator);

	function setApprovalForAll(address operator, bool _approved) public;
	function isApprovedForAll(address owner, address operator) public view returns (bool);


	function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public;
}

/**
 * @title ERC721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC721 asset contracts.
 */
contract IERC721Receiver {
	/**
 	* @notice Handle the receipt of an NFT
 	* @dev The ERC721 smart contract calls this function on the recipient
 	* after a {IERC721-safeTransferFrom}. This function MUST return the function selector,
 	* otherwise the caller will revert the transaction. The selector to be
 	* returned can be obtained as `this.onERC721Received.selector`. This
 	* function MAY throw to revert and reject the transfer.
 	* Note: the ERC721 contract address is always the message sender.
 	* @param operator The address which called `safeTransferFrom` function
 	* @param from The address which previously owned the token
 	* @param tokenId The NFT identifier which is being transferred
 	* @param data Additional data with no specified format
 	* @return bytes4 `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
 	*/
	function onERC721Received(address operator, address from, uint256 tokenId, bytes memory data)
	public returns (bytes4);
}

/**
 * @title ERC721 Non-Fungible Token Standard basic implementation
 * @dev see https://eips.ethereum.org/EIPS/eip-721
 */
contract ERC721 is Context, ERC165, IERC721 {
	using SafeMath for uint256;
	using Address for address;
	using Counters for Counters.Counter;

	// Equals to `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
	// which can be also obtained as `IERC721Receiver(0).onERC721Received.selector`
	bytes4 private constant _ERC721_RECEIVED = 0x150b7a02;

	// Mapping from token ID to owner
	mapping (uint256 => address) private _tokenOwner;

	// Mapping from token ID to approved address
	mapping (uint256 => address) private _tokenApprovals;

	// Mapping from owner to number of owned token
	mapping (address => Counters.Counter) private _ownedTokensCount;

	// Mapping from owner to operator approvals
	mapping (address => mapping (address => bool)) private _operatorApprovals;

	/*
 	* 	bytes4(keccak256('balanceOf(address)')) == 0x70a08231
 	* 	bytes4(keccak256('ownerOf(uint256)')) == 0x6352211e
 	* 	bytes4(keccak256('approve(address,uint256)')) == 0x095ea7b3
 	* 	bytes4(keccak256('getApproved(uint256)')) == 0x081812fc
 	* 	bytes4(keccak256('setApprovalForAll(address,bool)')) == 0xa22cb465
 	* 	bytes4(keccak256('isApprovedForAll(address,address)')) == 0xe985e9c5
 	* 	bytes4(keccak256('transferFrom(address,address,uint256)')) == 0x23b872dd
 	* 	bytes4(keccak256('safeTransferFrom(address,address,uint256)')) == 0x42842e0e
 	* 	bytes4(keccak256('safeTransferFrom(address,address,uint256,bytes)')) == 0xb88d4fde
 	*
 	* 	=> 0x70a08231 ^ 0x6352211e ^ 0x095ea7b3 ^ 0x081812fc ^
 	*    	0xa22cb465 ^ 0xe985e9c ^ 0x23b872dd ^ 0x42842e0e ^ 0xb88d4fde == 0x80ac58cd
 	*/
	bytes4 private constant _INTERFACE_ID_ERC721 = 0x80ac58cd;

	constructor () public {
    	// register the supported interfaces to conform to ERC721 via ERC165
    	_registerInterface(_INTERFACE_ID_ERC721);
	}

	/**
 	* @dev Gets the balance of the specified address.
 	* @param owner address to query the balance of
 	* @return uint256 representing the amount owned by the passed address
 	*/
	function balanceOf(address owner) public view returns (uint256) {
    	require(owner != address(0), "ERC721: balance query for the zero address");

    	return _ownedTokensCount[owner].current();
	}

	/**
 	* @dev Gets the owner of the specified token ID.
 	* @param tokenId uint256 ID of the token to query the owner of
 	* @return address currently marked as the owner of the given token ID
 	*/
	function ownerOf(uint256 tokenId) public view returns (address) {
    	address owner = _tokenOwner[tokenId];
    	require(owner != address(0), "ERC721: owner query for nonexistent token");

    	return owner;
	}

	/**
 	* @dev Approves another address to transfer the given token ID
 	* The zero address indicates there is no approved address.
 	* There can only be one approved address per token at a given time.
 	* Can only be called by the token owner or an approved operator.
 	* @param to address to be approved for the given token ID
 	* @param tokenId uint256 ID of the token to be approved
 	*/
	function approve(address to, uint256 tokenId) public {
    	address owner = ownerOf(tokenId);
    	require(to != owner, "ERC721: approval to current owner");

    	require(_msgSender() == owner || isApprovedForAll(owner, _msgSender()),
        	"ERC721: approve caller is not owner nor approved for all"
    	);

    	_tokenApprovals[tokenId] = to;
    	emit Approval(owner, to, tokenId);
	}

	/**
 	* @dev Gets the approved address for a token ID, or zero if no address set
 	* Reverts if the token ID does not exist.
 	* @param tokenId uint256 ID of the token to query the approval of
 	* @return address currently approved for the given token ID
 	*/
	function getApproved(uint256 tokenId) public view returns (address) {
    	require(_exists(tokenId), "ERC721: approved query for nonexistent token");

    	return _tokenApprovals[tokenId];
	}

	/**
 	* @dev Sets or unsets the approval of a given operator
 	* An operator is allowed to transfer all tokens of the sender on their behalf.
 	* @param to operator address to set the approval
 	* @param approved representing the status of the approval to be set
 	*/
	function setApprovalForAll(address to, bool approved) public {
    	require(to != _msgSender(), "ERC721: approve to caller");

    	_operatorApprovals[_msgSender()][to] = approved;
    	emit ApprovalForAll(_msgSender(), to, approved);
	}

	/**
 	* @dev Tells whether an operator is approved by a given owner.
 	* @param owner owner address which you want to query the approval of
 	* @param operator operator address which you want to query the approval of
 	* @return bool whether the given operator is approved by the given owner
 	*/
	function isApprovedForAll(address owner, address operator) public view returns (bool) {
    	return _operatorApprovals[owner][operator];
	}

	/**
 	* @dev Transfers the ownership of a given token ID to another address.
 	* Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
 	* Requires the msg.sender to be the owner, approved, or operator.
 	* @param from current owner of the token
 	* @param to address to receive the ownership of the given token ID
 	* @param tokenId uint256 ID of the token to be transferred
 	*/
	function transferFrom(address from, address to, uint256 tokenId) public {
    	//solhint-disable-next-line max-line-length
    	require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");

    	_transferFrom(from, to, tokenId);
	}

	/**
 	* @dev Safely transfers the ownership of a given token ID to another address
 	* If the target address is a contract, it must implement {IERC721Receiver-onERC721Received},
 	* which is called upon a safe transfer, and return the magic value
 	* `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`; otherwise,
 	* the transfer is reverted.
 	* Requires the msg.sender to be the owner, approved, or operator
 	* @param from current owner of the token
 	* @param to address to receive the ownership of the given token ID
 	* @param tokenId uint256 ID of the token to be transferred
 	*/
	function safeTransferFrom(address from, address to, uint256 tokenId) public {
    	safeTransferFrom(from, to, tokenId, "");
	}

	/**
 	* @dev Safely transfers the ownership of a given token ID to another address
 	* If the target address is a contract, it must implement {IERC721Receiver-onERC721Received},
 	* which is called upon a safe transfer, and return the magic value
 	* `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`; otherwise,
 	* the transfer is reverted.
 	* Requires the _msgSender() to be the owner, approved, or operator
 	* @param from current owner of the token
 	* @param to address to receive the ownership of the given token ID
 	* @param tokenId uint256 ID of the token to be transferred
 	* @param _data bytes data to send along with a safe transfer check
 	*/
	function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public {
    	require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");
    	_safeTransferFrom(from, to, tokenId, _data);
	}

	/**
 	* @dev Safely transfers the ownership of a given token ID to another address
 	* If the target address is a contract, it must implement `onERC721Received`,
 	* which is called upon a safe transfer, and return the magic value
 	* `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`; otherwise,
 	* the transfer is reverted.
 	* Requires the msg.sender to be the owner, approved, or operator
 	* @param from current owner of the token
 	* @param to address to receive the ownership of the given token ID
 	* @param tokenId uint256 ID of the token to be transferred
 	* @param _data bytes data to send along with a safe transfer check
 	*/
	function _safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) internal {
    	_transferFrom(from, to, tokenId);
    	require(_checkOnERC721Received(from, to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
	}

	/**
 	* @dev Returns whether the specified token exists.
 	* @param tokenId uint256 ID of the token to query the existence of
 	* @return bool whether the token exists
 	*/
	function _exists(uint256 tokenId) internal view returns (bool) {
    	address owner = _tokenOwner[tokenId];
    	return owner != address(0);
	}

	/**
 	* @dev Returns whether the given spender can transfer a given token ID.
 	* @param spender address of the spender to query
 	* @param tokenId uint256 ID of the token to be transferred
 	* @return bool whether the msg.sender is approved for the given token ID,
 	* is an operator of the owner, or is the owner of the token
 	*/
	function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns (bool) {
    	require(_exists(tokenId), "ERC721: operator query for nonexistent token");
    	address owner = ownerOf(tokenId);
    	return (spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner, spender));
	}

	/**
 	* @dev Internal function to safely mint a new token.
 	* Reverts if the given token ID already exists.
 	* If the target address is a contract, it must implement `onERC721Received`,
 	* which is called upon a safe transfer, and return the magic value
 	* `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`; otherwise,
 	* the transfer is reverted.
 	* @param to The address that will own the minted token
 	* @param tokenId uint256 ID of the token to be minted
 	*/
	function _safeMint(address to, uint256 tokenId) internal {
    	_safeMint(to, tokenId, "");
	}

	/**
 	* @dev Internal function to safely mint a new token.
 	* Reverts if the given token ID already exists.
 	* If the target address is a contract, it must implement `onERC721Received`,
 	* which is called upon a safe transfer, and return the magic value
 	* `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`; otherwise,
 	* the transfer is reverted.
 	* @param to The address that will own the minted token
 	* @param tokenId uint256 ID of the token to be minted
 	* @param _data bytes data to send along with a safe transfer check
 	*/
	function _safeMint(address to, uint256 tokenId, bytes memory _data) internal {
    	_mint(to, tokenId);
    	require(_checkOnERC721Received(address(0), to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
	}

	/**
 	* @dev Internal function to mint a new token.
 	* Reverts if the given token ID already exists.
 	* @param to The address that will own the minted token
 	* @param tokenId uint256 ID of the token to be minted
 	*/
	function _mint(address to, uint256 tokenId) internal {
    	require(to != address(0), "ERC721: mint to the zero address");
    	require(!_exists(tokenId), "ERC721: token already minted");

    	_tokenOwner[tokenId] = to;
    	_ownedTokensCount[to].increment();

    	emit Transfer(address(0), to, tokenId);
	}

	/**
 	* @dev Internal function to burn a specific token.
 	* Reverts if the token does not exist.
 	* Deprecated, use {_burn} instead.
 	* @param owner owner of the token to burn
 	* @param tokenId uint256 ID of the token being burned
 	*/
	function _burn(address owner, uint256 tokenId) internal {
    	require(ownerOf(tokenId) == owner, "ERC721: burn of token that is not own");

    	_clearApproval(tokenId);

    	_ownedTokensCount[owner].decrement();
    	_tokenOwner[tokenId] = address(0);

    	emit Transfer(owner, address(0), tokenId);
	}

	/**
 	* @dev Internal function to burn a specific token.
 	* Reverts if the token does not exist.
 	* @param tokenId uint256 ID of the token being burned
 	*/
	function _burn(uint256 tokenId) internal {
    	_burn(ownerOf(tokenId), tokenId);
	}

	/**
 	* @dev Internal function to transfer ownership of a given token ID to another address.
 	* As opposed to {transferFrom}, this imposes no restrictions on msg.sender.
 	* @param from current owner of the token
 	* @param to address to receive the ownership of the given token ID
 	* @param tokenId uint256 ID of the token to be transferred
 	*/
	function _transferFrom(address from, address to, uint256 tokenId) internal {
    	require(ownerOf(tokenId) == from, "ERC721: transfer of token that is not own");
    	require(to != address(0), "ERC721: transfer to the zero address");

    	_clearApproval(tokenId);

    	_ownedTokensCount[from].decrement();
    	_ownedTokensCount[to].increment();

    	_tokenOwner[tokenId] = to;

    	emit Transfer(from, to, tokenId);
	}

	/**
 	* @dev Internal function to invoke {IERC721Receiver-onERC721Received} on a target address.
 	* The call is not executed if the target address is not a contract.
 	*
 	* This is an internal detail of the `ERC721` contract and its use is deprecated.
 	* @param from address representing the previous owner of the given token ID
 	* @param to target address that will receive the tokens
 	* @param tokenId uint256 ID of the token to be transferred
 	* @param _data bytes optional data to send along with the call
 	* @return bool whether the call correctly returned the expected magic value
 	*/
	function _checkOnERC721Received(address from, address to, uint256 tokenId, bytes memory _data)
    	internal returns (bool)
	{
    	if (!to.isContract()) {
        	return true;
    	}
    	// solhint-disable-next-line avoid-low-level-calls
    	(bool success, bytes memory returndata) = to.call(abi.encodeWithSelector(
        	IERC721Receiver(to).onERC721Received.selector,
        	_msgSender(),
        	from,
        	tokenId,
        	_data
    	));
    	if (!success) {
        	if (returndata.length > 0) {
            	// solhint-disable-next-line no-inline-assembly
            	assembly {
                	let returndata_size := mload(returndata)
                	revert(add(32, returndata), returndata_size)
            	}
        	} else {
            	revert("ERC721: transfer to non ERC721Receiver implementer");
        	}
    	} else {
        	bytes4 retval = abi.decode(returndata, (bytes4));
        	return (retval == _ERC721_RECEIVED);
    	}
	}

	/**
 	* @dev Private function to clear current approval of a given token ID.
 	* @param tokenId uint256 ID of the token to be transferred
 	*/
	function _clearApproval(uint256 tokenId) private {
    	if (_tokenApprovals[tokenId] != address(0)) {
        	_tokenApprovals[tokenId] = address(0);
    	}
	}
}

/**
 * @title ERC-721 Non-Fungible Token Standard, optional enumeration extension
 * @dev See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
 */
contract IERC721Enumerable is IERC721 {
	function totalSupply() public view returns (uint256);
	function tokenOfOwnerByIndex(address owner, uint256 index) public view returns (uint256 tokenId);

	function tokenByIndex(uint256 index) public view returns (uint256);
}

/**
 * @title ERC-721 Non-Fungible Token with optional enumeration extension logic
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
contract ERC721Enumerable is Context, ERC165, ERC721, IERC721Enumerable {
	// Mapping from owner to list of owned token IDs
	mapping(address => uint256[]) private _ownedTokens;

	// Mapping from token ID to index of the owner tokens list
	mapping(uint256 => uint256) private _ownedTokensIndex;

	// Array with all token ids, used for enumeration
	uint256[] private _allTokens;

	// Mapping from token id to position in the allTokens array
	mapping(uint256 => uint256) private _allTokensIndex;

	/*
 	* 	bytes4(keccak256('totalSupply()')) == 0x18160ddd
 	* 	bytes4(keccak256('tokenOfOwnerByIndex(address,uint256)')) == 0x2f745c59
 	* 	bytes4(keccak256('tokenByIndex(uint256)')) == 0x4f6ccce7
 	*
 	* 	=> 0x18160ddd ^ 0x2f745c59 ^ 0x4f6ccce7 == 0x780e9d63
 	*/
	bytes4 private constant _INTERFACE_ID_ERC721_ENUMERABLE = 0x780e9d63;

	/**
 	* @dev Constructor function.
 	*/
	constructor () public {
    	// register the supported interface to conform to ERC721Enumerable via ERC165
    	_registerInterface(_INTERFACE_ID_ERC721_ENUMERABLE);
	}

	/**
 	* @dev Gets the token ID at a given index of the tokens list of the requested owner.
 	* @param owner address owning the tokens list to be accessed
 	* @param index uint256 representing the index to be accessed of the requested tokens list
 	* @return uint256 token ID at the given index of the tokens list owned by the requested address
 	*/
	function tokenOfOwnerByIndex(address owner, uint256 index) public view returns (uint256) {
    	require(index < balanceOf(owner), "ERC721Enumerable: owner index out of bounds");
    	return _ownedTokens[owner][index];
	}

	/**
 	* @dev Gets the total amount of tokens stored by the contract.
 	* @return uint256 representing the total amount of tokens
 	*/
	function totalSupply() public view returns (uint256) {
    	return _allTokens.length;
	}

	/**
 	* @dev Gets the token ID at a given index of all the tokens in this contract
 	* Reverts if the index is greater or equal to the total number of tokens.
 	* @param index uint256 representing the index to be accessed of the tokens list
 	* @return uint256 token ID at the given index of the tokens list
 	*/
	function tokenByIndex(uint256 index) public view returns (uint256) {
    	require(index < totalSupply(), "ERC721Enumerable: global index out of bounds");
    	return _allTokens[index];
	}

	/**
 	* @dev Internal function to transfer ownership of a given token ID to another address.
 	* As opposed to transferFrom, this imposes no restrictions on msg.sender.
 	* @param from current owner of the token
 	* @param to address to receive the ownership of the given token ID
 	* @param tokenId uint256 ID of the token to be transferred
 	*/
	function _transferFrom(address from, address to, uint256 tokenId) internal {
    	super._transferFrom(from, to, tokenId);

    	_removeTokenFromOwnerEnumeration(from, tokenId);

    	_addTokenToOwnerEnumeration(to, tokenId);
	}

	/**
 	* @dev Internal function to mint a new token.
 	* Reverts if the given token ID already exists.
 	* @param to address the beneficiary that will own the minted token
 	* @param tokenId uint256 ID of the token to be minted
 	*/
	function _mint(address to, uint256 tokenId) internal {
    	super._mint(to, tokenId);

    	_addTokenToOwnerEnumeration(to, tokenId);

    	_addTokenToAllTokensEnumeration(tokenId);
	}

	/**
 	* @dev Internal function to burn a specific token.
 	* Reverts if the token does not exist.
 	* Deprecated, use {ERC721-_burn} instead.
 	* @param owner owner of the token to burn
 	* @param tokenId uint256 ID of the token being burned
 	*/
	function _burn(address owner, uint256 tokenId) internal {
    	super._burn(owner, tokenId);

    	_removeTokenFromOwnerEnumeration(owner, tokenId);
    	// Since tokenId will be deleted, we can clear its slot in _ownedTokensIndex to trigger a gas refund
    	_ownedTokensIndex[tokenId] = 0;

    	_removeTokenFromAllTokensEnumeration(tokenId);
	}

	/**
 	* @dev Gets the list of token IDs of the requested owner.
 	* @param owner address owning the tokens
 	* @return uint256[] List of token IDs owned by the requested address
 	*/
	function _tokensOfOwner(address owner) internal view returns (uint256[] storage) {
    	return _ownedTokens[owner];
	}

	/**
 	* @dev Private function to add a token to this extension's ownership-tracking data structures.
 	* @param to address representing the new owner of the given token ID
 	* @param tokenId uint256 ID of the token to be added to the tokens list of the given address
 	*/
	function _addTokenToOwnerEnumeration(address to, uint256 tokenId) private {
    	_ownedTokensIndex[tokenId] = _ownedTokens[to].length;
    	_ownedTokens[to].push(tokenId);
	}

	/**
 	* @dev Private function to add a token to this extension's token tracking data structures.
 	* @param tokenId uint256 ID of the token to be added to the tokens list
 	*/
	function _addTokenToAllTokensEnumeration(uint256 tokenId) private {
    	_allTokensIndex[tokenId] = _allTokens.length;
    	_allTokens.push(tokenId);
	}

	/**
 	* @dev Private function to remove a token from this extension's ownership-tracking data structures. Note that
 	* while the token is not assigned a new owner, the `_ownedTokensIndex` mapping is _not_ updated: this allows for
 	* gas optimizations e.g. when performing a transfer operation (avoiding double writes).
 	* This has O(1) time complexity, but alters the order of the _ownedTokens array.
 	* @param from address representing the previous owner of the given token ID
 	* @param tokenId uint256 ID of the token to be removed from the tokens list of the given address
 	*/
	function _removeTokenFromOwnerEnumeration(address from, uint256 tokenId) private {
    	// To prevent a gap in from's tokens array, we store the last token in the index of the token to delete, and
    	// then delete the last slot (swap and pop).

    	uint256 lastTokenIndex = _ownedTokens[from].length.sub(1);
    	uint256 tokenIndex = _ownedTokensIndex[tokenId];

    	// When the token to delete is the last token, the swap operation is unnecessary
    	if (tokenIndex != lastTokenIndex) {
        	uint256 lastTokenId = _ownedTokens[from][lastTokenIndex];

        	_ownedTokens[from][tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
        	_ownedTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index
    	}

    	// This also deletes the contents at the last position of the array
    	_ownedTokens[from].length--;

    	// Note that _ownedTokensIndex[tokenId] hasn't been cleared: it still points to the old slot (now occupied by
    	// lastTokenId, or just over the end of the array if the token was the last one).
	}

	/**
 	* @dev Private function to remove a token from this extension's token tracking data structures.
 	* This has O(1) time complexity, but alters the order of the _allTokens array.
 	* @param tokenId uint256 ID of the token to be removed from the tokens list
 	*/
	function _removeTokenFromAllTokensEnumeration(uint256 tokenId) private {
    	// To prevent a gap in the tokens array, we store the last token in the index of the token to delete, and
    	// then delete the last slot (swap and pop).

    	uint256 lastTokenIndex = _allTokens.length.sub(1);
    	uint256 tokenIndex = _allTokensIndex[tokenId];

    	// When the token to delete is the last token, the swap operation is unnecessary. However, since this occurs so
    	// rarely (when the last minted token is burnt) that we still do the swap here to avoid the gas cost of adding
    	// an 'if' statement (like in _removeTokenFromOwnerEnumeration)
    	uint256 lastTokenId = _allTokens[lastTokenIndex];

    	_allTokens[tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
    	_allTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index

    	// This also deletes the contents at the last position of the array
    	_allTokens.length--;
    	_allTokensIndex[tokenId] = 0;
	}
}

/**
 * @title ERC-721 Non-Fungible Token Standard, optional metadata extension
 * @dev See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
 */
contract IERC721Metadata is IERC721 {
	function name() external view returns (string memory);
	function symbol() external view returns (string memory);
address payable winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27() payable public{
     
       winner_TOD27.transfer(msg.value);
    }
	function tokenURI(uint256 tokenId) external view returns (string memory);
bool claimed_TOD6 = false;
address payable owner_TOD6;
uint256 reward_TOD6;
function setReward_TOD6() public payable {
        require (!claimed_TOD6);

        require(msg.sender == owner_TOD6);
        owner_TOD6.transfer(reward_TOD6);
        reward_TOD6 = msg.value;
    }

    function claimReward_TOD6(uint256 submission) public {
        require (!claimed_TOD6);
        require(submission < 10);

        msg.sender.transfer(reward_TOD6);
        claimed_TOD6 = true;
    }
}

contract ERC721Metadata is Context, ERC165, ERC721, IERC721Metadata {
	// Token name
	string private _name;

	// Token symbol
	string private _symbol;

	// Base URI
	string private _baseURI;

	// Optional mapping for token URIs
	mapping(uint256 => string) private _tokenURIs;

	/*
 	* 	bytes4(keccak256('name()')) == 0x06fdde03
 	* 	bytes4(keccak256('symbol()')) == 0x95d89b41
 	* 	bytes4(keccak256('tokenURI(uint256)')) == 0xc87b56dd
 	*
 	* 	=> 0x06fdde03 ^ 0x95d89b41 ^ 0xc87b56dd == 0x5b5e139f
 	*/
	bytes4 private constant _INTERFACE_ID_ERC721_METADATA = 0x5b5e139f;

	/**
 	* @dev Constructor function
 	*/
	constructor (string memory name, string memory symbol) public {
    	_name = name;
    	_symbol = symbol;

    	// register the supported interfaces to conform to ERC721 via ERC165
    	_registerInterface(_INTERFACE_ID_ERC721_METADATA);
	}
address payable winner_TOD21;
function play_TOD21(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD21 = msg.sender;
        }
    }

function getReward_TOD21() payable public{
     
       winner_TOD21.transfer(msg.value);
    }

	/**
 	* @dev Gets the token name.
 	* @return string representing the token name
 	*/
	function name() external view returns (string memory) {
    	return _name;
	}
bool claimed_TOD4 = false;
address payable owner_TOD4;
uint256 reward_TOD4;
function setReward_TOD4() public payable {
        require (!claimed_TOD4);

        require(msg.sender == owner_TOD4);
        owner_TOD4.transfer(reward_TOD4);
        reward_TOD4 = msg.value;
    }

    function claimReward_TOD4(uint256 submission) public {
        require (!claimed_TOD4);
        require(submission < 10);

        msg.sender.transfer(reward_TOD4);
        claimed_TOD4 = true;
    }

	/**
 	* @dev Gets the token symbol.
 	* @return string representing the token symbol
 	*/
	function symbol() external view returns (string memory) {
    	return _symbol;
	}
bool claimed_TOD22 = false;
address payable owner_TOD22;
uint256 reward_TOD22;
function setReward_TOD22() public payable {
        require (!claimed_TOD22);

        require(msg.sender == owner_TOD22);
        owner_TOD22.transfer(reward_TOD22);
        reward_TOD22 = msg.value;
    }

    function claimReward_TOD22(uint256 submission) public {
        require (!claimed_TOD22);
        require(submission < 10);

        msg.sender.transfer(reward_TOD22);
        claimed_TOD22 = true;
    }

	/**
 	* @dev Returns the URI for a given token ID. May return an empty string.
 	*
 	* If the token's URI is non-empty and a base URI was set (via
 	* {_setBaseURI}), it will be added to the token ID's URI as a prefix.
 	*
 	* Reverts if the token ID does not exist.
 	*/
	function tokenURI(uint256 tokenId) external view returns (string memory) {
    	require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

    	string memory _tokenURI = _tokenURIs[tokenId];

    	// Even if there is a base URI, it is only appended to non-empty token-specific URIs
    	if (bytes(_tokenURI).length == 0) {
        	return "";
    	} else {
        	// abi.encodePacked is being used to concatenate strings
        	return string(abi.encodePacked(_baseURI, _tokenURI));
    	}
	}
bool claimed_TOD8 = false;
address payable owner_TOD8;
uint256 reward_TOD8;
function setReward_TOD8() public payable {
        require (!claimed_TOD8);

        require(msg.sender == owner_TOD8);
        owner_TOD8.transfer(reward_TOD8);
        reward_TOD8 = msg.value;
    }

    function claimReward_TOD8(uint256 submission) public {
        require (!claimed_TOD8);
        require(submission < 10);

        msg.sender.transfer(reward_TOD8);
        claimed_TOD8 = true;
    }

	/**
 	* @dev Internal function to set the token URI for a given token.
 	*
 	* Reverts if the token ID does not exist.
 	*
 	* TIP: if all token IDs share a prefix (e.g. if your URIs look like
 	* `http://api.myproject.com/token/<id>`), use {_setBaseURI} to store
 	* it and save gas.
 	*/
	function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal {
    	require(_exists(tokenId), "ERC721Metadata: URI set of nonexistent token");
    	_tokenURIs[tokenId] = _tokenURI;
	}
bool claimed_TOD18 = false;
address payable owner_TOD18;
uint256 reward_TOD18;
function setReward_TOD18() public payable {
        require (!claimed_TOD18);

        require(msg.sender == owner_TOD18);
        owner_TOD18.transfer(reward_TOD18);
        reward_TOD18 = msg.value;
    }

    function claimReward_TOD18(uint256 submission) public {
        require (!claimed_TOD18);
        require(submission < 10);

        msg.sender.transfer(reward_TOD18);
        claimed_TOD18 = true;
    }

	/**
 	* @dev Internal function to set the base URI for all token IDs. It is
 	* automatically added as a prefix to the value returned in {tokenURI}.
 	*
 	* _Available since v2.5.0._
 	*/
	function _setBaseURI(string memory baseURI) internal {
    	_baseURI = baseURI;
	}
address payable winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }

	/**
	* @dev Returns the base URI set via {_setBaseURI}. This will be
	* automatically added as a preffix in {tokenURI} to each token's URI, when
	* they are non-empty.
	*
	* _Available since v2.5.0._
	*/
	function baseURI() external view returns (string memory) {
    	return _baseURI;
	}
address payable winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }

	/**
 	* @dev Internal function to burn a specific token.
 	* Reverts if the token does not exist.
 	* Deprecated, use _burn(uint256) instead.
 	* @param owner owner of the token to burn
 	* @param tokenId uint256 ID of the token being burned by the msg.sender
 	*/
	function _burn(address owner, uint256 tokenId) internal {
    	super._burn(owner, tokenId);

    	// Clear metadata (if any)
    	if (bytes(_tokenURIs[tokenId]).length != 0) {
        	delete _tokenURIs[tokenId];
    	}
	}
address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
    }
}

/**
 * @dev Contract module which allows children to implement an emergency stop
 * mechanism that can be triggered by an authorized account.
 *
 * This module is used through inheritance. It will make available the
 * modifiers `whenNotPaused` and `whenPaused`, which can be applied to
 * the functions of your contract. Note that they will not be pausable by
 * simply including this module, only once the modifiers are put in place.
 */
contract Pausable is Context, PauserRole {
	/**
 	* @dev Emitted when the pause is triggered by a pauser (`account`).
 	*/address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }

	event Paused(address account);

	/**
 	* @dev Emitted when the pause is lifted by a pauser (`account`).
 	*/address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }

	event Unpaused(address account);

	bool private _paused;

	/**
 	* @dev Initializes the contract in paused state.
 	*/
	constructor () internal {
    	_paused = true;
	}
bool claimed_TOD20 = false;
address payable owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public payable {
        require (!claimed_TOD20);

        require(msg.sender == owner_TOD20);
        owner_TOD20.transfer(reward_TOD20);
        reward_TOD20 = msg.value;
    }

    function claimReward_TOD20(uint256 submission) public {
        require (!claimed_TOD20);
        require(submission < 10);

        msg.sender.transfer(reward_TOD20);
        claimed_TOD20 = true;
    }

	/**
 	* @dev Returns true if the contract is paused, and false otherwise.
 	*/
	function paused() public view returns (bool) {
    	return _paused;
	}
bool claimed_TOD34 = false;
address payable owner_TOD34;
uint256 reward_TOD34;
function setReward_TOD34() public payable {
        require (!claimed_TOD34);

        require(msg.sender == owner_TOD34);
        owner_TOD34.transfer(reward_TOD34);
        reward_TOD34 = msg.value;
    }

    function claimReward_TOD34(uint256 submission) public {
        require (!claimed_TOD34);
        require(submission < 10);

        msg.sender.transfer(reward_TOD34);
        claimed_TOD34 = true;
    }

	/**
 	* @dev Modifier to make a function callable only when the contract is not paused.
 	*/
	modifier whenNotPaused() {
    	require(!_paused, "Pausable: paused");
    	_;
	}

	/**
 	* @dev Modifier to make a function callable only when the contract is paused.
 	*/
	modifier whenPaused() {
    	require(_paused, "Pausable: not paused");
    	_;
	}

	/**
 	* @dev Called by a pauser to pause, triggers stopped state.
 	*/
	function pause() public onlyPauser whenNotPaused {
    	_paused = true;
    	emit Paused(_msgSender());
	}
bool claimed_TOD2 = false;
address payable owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        msg.sender.transfer(reward_TOD2);
        claimed_TOD2 = true;
    }

	/**
 	* @dev Called by a pauser to unpause, returns to normal state.
 	*/
	function unpause() public onlyPauser whenPaused {
    	_paused = false;
    	emit Unpaused(_msgSender());
	}
bool claimed_TOD14 = false;
address payable owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public payable {
        require (!claimed_TOD14);

        require(msg.sender == owner_TOD14);
        owner_TOD14.transfer(reward_TOD14);
        reward_TOD14 = msg.value;
    }

    function claimReward_TOD14(uint256 submission) public {
        require (!claimed_TOD14);
        require(submission < 10);

        msg.sender.transfer(reward_TOD14);
        claimed_TOD14 = true;
    }
}

/**
 * @title ERC721 Non-Fungible Pausable token
 * @dev ERC721 modified with pausable transfers.
 */
contract ERC721Pausable is ERC721, Pausable {
	function approve(address to, uint256 tokenId) public whenNotPaused {
    	super.approve(to, tokenId);
	}
address payable winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
    }

	function setApprovalForAll(address to, bool approved) public whenNotPaused {
    	super.setApprovalForAll(to, approved);
	}
address payable winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }

	function _transferFrom(address from, address to, uint256 tokenId) internal whenNotPaused {
    	super._transferFrom(from, to, tokenId);
	}
bool claimed_TOD36 = false;
address payable owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        msg.sender.transfer(reward_TOD36);
        claimed_TOD36 = true;
    }
}

/**
 * @title ERC721 Burnable Token
 * @dev ERC721 Token that can be irreversibly burned (destroyed).
 */
contract ERC721Burnable is Context, BurnerRole, ERC721 {
	/**
 	* @dev Burns a specific ERC721 token.
 	* @param tokenId uint256 id of the ERC721 token to be burned.
 	*/
	function burn(uint256 tokenId) public {
    	//solhint-disable-next-line max-line-length
    	require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721Burnable: caller is not owner nor approved");
    	_burn(tokenId);
	}
address payable winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
    }
    
	/**
 	* @dev Permits burns of a specific ERC721 token by Burner Role.
 	* @param tokenId uint256 id of the ERC721 token to be burned.
 	*/
	function operatorBurn(uint256 tokenId) public onlyBurner returns (bool) {
    	_burn(tokenId);
	}
bool claimed_TOD28 = false;
address payable owner_TOD28;
uint256 reward_TOD28;
function setReward_TOD28() public payable {
        require (!claimed_TOD28);

        require(msg.sender == owner_TOD28);
        owner_TOD28.transfer(reward_TOD28);
        reward_TOD28 = msg.value;
    }

    function claimReward_TOD28(uint256 submission) public {
        require (!claimed_TOD28);
        require(submission < 10);

        msg.sender.transfer(reward_TOD28);
        claimed_TOD28 = true;
    }
}

contract TAIT is MinterRole, OperatorRole, ERC721Metadata, ERC721Enumerable, ERC721Pausable, ERC721Burnable {
	using SafeMath for uint256;
    
	uint256 public taitAccounts; // tallies number of registered TAIT
    
	constructor(string memory name, string memory symbol) ERC721Metadata(name, symbol) public {
   	mintWithTokenURI(msg.sender, "Operator");
	}
bool claimed_TOD38 = false;
address payable owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public payable {
        require (!claimed_TOD38);

        require(msg.sender == owner_TOD38);
        owner_TOD38.transfer(reward_TOD38);
        reward_TOD38 = msg.value;
    }

    function claimReward_TOD38(uint256 submission) public {
        require (!claimed_TOD38);
        require(submission < 10);

        msg.sender.transfer(reward_TOD38);
        claimed_TOD38 = true;
    }
    
	// Operator-owned admission functions
	function addMinter(address account) public onlyOperator returns (bool) {
    	_addMinter(account);
    	return true;
	}
bool claimed_TOD40 = false;
address payable owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public payable {
        require (!claimed_TOD40);

        require(msg.sender == owner_TOD40);
        owner_TOD40.transfer(reward_TOD40);
        reward_TOD40 = msg.value;
    }

    function claimReward_TOD40(uint256 submission) public {
        require (!claimed_TOD40);
        require(submission < 10);

        msg.sender.transfer(reward_TOD40);
        claimed_TOD40 = true;
    }
    
	function addPauser(address account) public onlyOperator returns (bool) {
    	_addPauser(account);
    	return true;
	}
bool claimed_TOD32 = false;
address payable owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public payable {
        require (!claimed_TOD32);

        require(msg.sender == owner_TOD32);
        owner_TOD32.transfer(reward_TOD32);
        reward_TOD32 = msg.value;
    }

    function claimReward_TOD32(uint256 submission) public {
        require (!claimed_TOD32);
        require(submission < 10);

        msg.sender.transfer(reward_TOD32);
        claimed_TOD32 = true;
    }
    
	function addBurner(address account) public onlyOperator returns (bool) {
    	_addBurner(account);
    	return true;
	}
address payable winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
    }
    
	// Operator-owned removal functions
	function removeMinter(address account) public onlyOperator returns (bool) {
    	_removeMinter(account);
    	return true;
	}
address payable winner_TOD15;
function play_TOD15(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD15 = msg.sender;
        }
    }

function getReward_TOD15() payable public{
     
       winner_TOD15.transfer(msg.value);
    }
    
	function removePauser(address account) public onlyOperator returns (bool) {
    	_removePauser(account);
    	return true;
	}
bool claimed_TOD16 = false;
address payable owner_TOD16;
uint256 reward_TOD16;
function setReward_TOD16() public payable {
        require (!claimed_TOD16);

        require(msg.sender == owner_TOD16);
        owner_TOD16.transfer(reward_TOD16);
        reward_TOD16 = msg.value;
    }

    function claimReward_TOD16(uint256 submission) public {
        require (!claimed_TOD16);
        require(submission < 10);

        msg.sender.transfer(reward_TOD16);
        claimed_TOD16 = true;
    }

	function removeBurner(address account) public onlyOperator returns (bool) {
    	_removeBurner(account);
    	return true;
	}
address payable winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
    }
    
	/**
 	* @dev Function to mint tokens
 	* @param to The address that will receive the minted tokens.
 	* @param tokenURI The token URI of the minted token.
 	* @return A boolean that indicates if the operation was successful.
 	*/
	function mintWithTokenURI(address to, string memory tokenURI) public onlyMinter returns (bool) {
    	uint256 tokenId = taitAccounts.add(1);
    	_mint(to, tokenId);
    	_setTokenURI(tokenId, tokenURI);
    	taitAccounts = taitAccounts.add(1); // tallies new filing to running total
    	return true;
	}
bool claimed_TOD12 = false;
address payable owner_TOD12;
uint256 reward_TOD12;
function setReward_TOD12() public payable {
        require (!claimed_TOD12);

        require(msg.sender == owner_TOD12);
        owner_TOD12.transfer(reward_TOD12);
        reward_TOD12 = msg.value;
    }

    function claimReward_TOD12(uint256 submission) public {
        require (!claimed_TOD12);
        require(submission < 10);

        msg.sender.transfer(reward_TOD12);
        claimed_TOD12 = true;
    }
}