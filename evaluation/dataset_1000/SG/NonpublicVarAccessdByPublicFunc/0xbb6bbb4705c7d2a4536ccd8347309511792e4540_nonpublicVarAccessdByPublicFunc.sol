/**
 *Submitted for verification at Etherscan.io on 2020-10-30
*/

pragma solidity 0.5.16;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {ERC20Detailed}.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


/**
 * @title Initializable
 *
 * @dev Helper contract to support initializer functions. To use it, replace
 * the constructor with a function that has the `initializer` modifier.
 * WARNING: Unlike constructors, initializer functions must be manually
 * invoked. This applies both to deploying an Initializable contract, as well
 * as extending an Initializable contract via inheritance.
 * WARNING: When used with inheritance, manual care must be taken to not invoke
 * a parent initializer twice, or ensure that all initializers are idempotent,
 * because this is not dealt with automatically as with constructors.
 */
contract Initializable {

  /**
   * @dev Indicates that the contract has been initialized.
   */
  bool private initialized;

  /**
   * @dev Indicates that the contract is in the process of being initialized.
   */
  bool private initializing;

  /**
   * @dev Modifier to use in the initializer function of a contract.
   */
  modifier initializer() {
    require(initializing || isConstructor() || !initialized, "Contract instance has already been initialized");

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

  /// @dev Returns true if and only if the function is running in the constructor
  function isConstructor() private view returns (bool) {
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
contract Context is Initializable {
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

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be aplied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Initializable, Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    function initialize(address sender) public initializer {
        _owner = sender;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit OwnershipTransferred(address(0), _owner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Returns true if the caller is the current owner.
     */
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * > Note: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _owner = address(0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

    uint256[50] private ______gap;
}


library BasisPoints {
    using SafeMath for uint;

    uint constant private BASIS_POINTS = 10000;

    function mulBP(uint amt, uint bp) internal pure returns (uint) {
        if (amt == 0) return 0;
        return amt.mul(bp).div(BASIS_POINTS);
    }

    function divBP(uint amt, uint bp) internal pure returns (uint) {
        require(bp > 0, "Cannot divide by zero.");
        if (amt == 0) return 0;
        return amt.mul(BASIS_POINTS).div(bp);
    }

    function addBP(uint amt, uint bp) internal pure returns (uint) {
        if (amt == 0) return 0;
        if (bp == 0) return amt;
        return amt.add(mulBP(amt, bp));
    }

    function subBP(uint amt, uint bp) internal pure returns (uint) {
        if (amt == 0) return 0;
        if (bp == 0) return amt;
        return amt.sub(mulBP(amt, bp));
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
     * @dev Give an account access to this role.
     */
    function add(Role storage role, address account) internal {
        require(!has(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

    /**
     * @dev Remove an account's access to this role.
     */
    function remove(Role storage role, address account) internal {
        require(has(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

    /**
     * @dev Check if an account has this role.
     * @return bool
     */
    function has(Role storage role, address account) internal view returns (bool) {
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}


contract PauserRole is Initializable, Context {
    using Roles for Roles.Role;

    event PauserAdded(address indexed account);
    event PauserRemoved(address indexed account);

    Roles.Role private _pausers;

    function initialize(address sender) public initializer {
        if (!isPauser(sender)) {
            _addPauser(sender);
        }
    }

    modifier onlyPauser() {
        require(isPauser(_msgSender()), "PauserRole: caller does not have the Pauser role");
        _;
    }

    function isPauser(address account) public view returns (bool) {
        return _pausers.has(account);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function addPauser(address account) public onlyPauser {
        _addPauser(account);
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

    uint256[50] private ______gap;
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
contract Pausable is Initializable, Context, PauserRole {
    /**
     * @dev Emitted when the pause is triggered by a pauser (`account`).
     */
    event Paused(address account);

    /**
     * @dev Emitted when the pause is lifted by a pauser (`account`).
     */
    event Unpaused(address account);

    bool private _paused;

    /**
     * @dev Initializes the contract in unpaused state. Assigns the Pauser role
     * to the deployer.
     */
    function initialize(address sender) public initializer {
        PauserRole.initialize(sender);

        _paused = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    /**
     * @dev Returns true if the contract is paused, and false otherwise.
     */
    function paused() public view returns (bool) {
        return _paused;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
        _paused = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Paused(_msgSender());
    }

    /**
     * @dev Called by a pauser to unpause, returns to normal state.
     */
    function unpause() public onlyPauser whenPaused {
        _paused = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Unpaused(_msgSender());
    }

    uint256[50] private ______gap;
}


/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 */
contract ReentrancyGuard is Initializable {
    // counter to allow mutex lock with only one SSTORE operation
    uint256 private _guardCounter;

    function initialize() public initializer {
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }

    uint256[50] private ______gap;
}


pragma solidity =0.5.16;

interface IUniswapV2Router01 {
    function factory() external pure returns (address);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);

    function WETH() external view returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
}


contract LidSimplifiedPresaleTimer is Initializable, Ownable {
    using SafeMath for uint;

    uint public startTime;
    uint public endTime;
    uint internal hardCapTimer;
    uint internal softCap;
    address internal presale;

    function initialize(
        uint _startTime,
        uint _hardCapTimer,
        uint _softCap,
        address _presale,
        address owner
    ) external initializer {
        Ownable.initialize(msg.sender);
        startTime = _startTime;
        hardCapTimer = _hardCapTimer;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        softCap = _softCap;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        presale = _presale;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        //Due to issue in oz testing suite, the msg.sender might not be owner
        _transferOwnership(owner);
    }

    function setStartTime(uint time) external onlyOwner {
        startTime = time;
    }

    function setEndTime(uint time) external onlyOwner {
        endTime = time;
    }

    function updateSoftCap(uint valueWei) external onlyOwner {
        softCap = valueWei;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function updateEndTime() external returns (uint) {
        if (endTime != 0) return endTime;
        if (presale.balance >= softCap) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            endTime = now.add(hardCapTimer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return endTime;
        }
        return 0;
    }

    function isStarted() external view returns (bool) {
        return (startTime != 0 && now > startTime);
    }

}


contract LidSimplifiedPresaleRedeemer is Initializable, Ownable {
    using BasisPoints for uint;
    using SafeMath for uint;

    uint internal redeemBP;
    uint internal redeemInterval;

    uint[] internal bonusRangeStart;
    uint[] internal bonusRangeBP;
    uint internal currentBonusIndex;

    uint internal totalShares;
    uint internal totalDepositors;
    mapping(address => uint) public accountDeposits;
    mapping(address => uint) internal accountShares;
    mapping(address => uint) internal accountClaimedTokens;

    address private presale;

    modifier onlyPresaleContract {
        require(msg.sender == presale, "Only callable by presale contract.");
        _;
    }

    function initialize(
        uint _redeemBP,
        uint _redeemInterval,
        uint[] calldata _bonusRangeStart,
        uint[] calldata _bonusRangeBP,
        address _presale,
        address owner
    ) external initializer {
        Ownable.initialize(msg.sender);

        redeemBP = _redeemBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        redeemInterval = _redeemInterval;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        presale = _presale;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        require(
            _bonusRangeStart.length == _bonusRangeBP.length,
            "Must have equal values for bonus range start and BP"
        );
        require(_bonusRangeStart.length <= 10, "Cannot have more than 10 items in bonusRange");
        for (uint i = 0; i < _bonusRangeStart.length; ++i) {
            bonusRangeStart.push(_bonusRangeStart[i]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        for (uint i = 0; i < _bonusRangeBP.length; ++i) {
            bonusRangeBP.push(_bonusRangeBP[i]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        //Due to issue in oz testing suite, the msg.sender might not be owner
        _transferOwnership(owner);
    }

    function setClaimed(address account, uint amount) external onlyPresaleContract {
        accountClaimedTokens[account] = accountClaimedTokens[account].add(amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function setDeposit(address account, uint deposit, uint postDepositEth) external onlyPresaleContract {
        if (accountDeposits[account] == 0) totalDepositors = totalDepositors.add(1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        accountDeposits[account] = accountDeposits[account].add(deposit);
        uint sharesToAdd;
        if (currentBonusIndex.add(1) >= bonusRangeBP.length) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            //final bonus rate
            sharesToAdd = deposit.addBP(bonusRangeBP[currentBonusIndex]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else if (postDepositEth < bonusRangeStart[currentBonusIndex.add(1)]) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            //Purchase doesnt push to next start
            sharesToAdd = deposit.addBP(bonusRangeBP[currentBonusIndex]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            //purchase straddles next start
            uint previousBonusBP = bonusRangeBP[currentBonusIndex];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            uint newBonusBP = bonusRangeBP[currentBonusIndex.add(1)];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            uint newBonusDeposit = postDepositEth.sub(bonusRangeStart[currentBonusIndex.add(1)]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            uint previousBonusDeposit = deposit.sub(newBonusDeposit);
            sharesToAdd = newBonusDeposit.addBP(newBonusBP).add(
                previousBonusDeposit.addBP(previousBonusBP));
            currentBonusIndex = currentBonusIndex.add(1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        accountShares[account] = accountShares[account].add(sharesToAdd);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalShares = totalShares.add(sharesToAdd);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function updateBonus(
        uint[] calldata _bonusRangeStart,
        uint[] calldata _bonusRangeBP
    ) external onlyOwner {
        require(
            _bonusRangeStart.length == _bonusRangeBP.length,
            "Must have equal values for bonus range start and BP"
        );
        require(_bonusRangeStart.length <= 10, "Cannot have more than 10 items in bonusRange");
        for (uint i = 0; i < _bonusRangeStart.length; ++i) {
            bonusRangeStart.push(_bonusRangeStart[i]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        for (uint i = 0; i < _bonusRangeBP.length; ++i) {
            bonusRangeBP.push(_bonusRangeBP[i]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }

    function calculateRatePerEth(uint totalPresaleTokens, uint depositEth, uint hardCap) external view returns (uint) {

        uint tokensPerEtherShare = totalPresaleTokens
        .mul(1 ether)
        .div(
            getMaxShares(hardCap)
        );

        uint bp;
        if (depositEth >= bonusRangeStart[bonusRangeStart.length.sub(1)]) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            bp = bonusRangeBP[bonusRangeBP.length.sub(1)];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            for (uint i = 1; i < bonusRangeStart.length; ++i) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                if (bp == 0) {
                    if (depositEth < bonusRangeStart[i]) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                        bp = bonusRangeBP[i.sub(1)];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                    }
                }
            }
        }
        return tokensPerEtherShare.addBP(bp);
    }

    function calculateReedemable(
        address account,
        uint finalEndTime,
        uint totalPresaleTokens
    ) external view returns (uint) {
        if (finalEndTime == 0) return 0;
        if (finalEndTime >= now) return 0;
        uint earnedTokens = accountShares[account].mul(totalPresaleTokens).div(totalShares);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint claimedTokens = accountClaimedTokens[account];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint cycles = now.sub(finalEndTime).div(redeemInterval).add(1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint totalRedeemable = earnedTokens.mulBP(redeemBP).mul(cycles);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint claimable;
        if (totalRedeemable >= earnedTokens) {
            claimable = earnedTokens.sub(claimedTokens);
        } else {
            claimable = totalRedeemable.sub(claimedTokens);
        }
        return claimable;
    }

    function getMaxShares(uint hardCap) public view returns (uint) {
        uint maxShares;
        for (uint i = 0; i < bonusRangeStart.length; ++i) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            uint amt;
            if (i < bonusRangeStart.length.sub(1)) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                amt = bonusRangeStart[i.add(1)].sub(bonusRangeStart[i]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            } else {
                amt = hardCap.sub(bonusRangeStart[i]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            }
            maxShares = maxShares.add(amt.addBP(bonusRangeBP[i]));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        return maxShares;
    }
}


interface IStakeHandler {
    function handleStake(address staker, uint stakerDeltaValue, uint stakerFinalValue) external;
    function handleUnstake(address staker, uint stakerDeltaValue, uint stakerFinalValue) external;
}


interface ILidCertifiableToken {
    function activateTransfers() external;
    function activateTax() external;
    function mint(address account, uint256 amount) external returns (bool);
    function addMinter(address account) external;
    function renounceMinter() external;
    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function isMinter(address account) external view returns (bool);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

}


contract LidStaking is Initializable, Ownable {
    using BasisPoints for uint;
    using SafeMath for uint;

    uint256 constant internal DISTRIBUTION_MULTIPLIER = 2 ** 64;

    uint internal stakingTaxBP;
    uint internal unstakingTaxBP;
    ILidCertifiableToken private lidToken;

    mapping(address => uint) public stakeValue;
    mapping(address => int) internal stakerPayouts;


    uint internal totalDistributions;
    uint internal totalStaked;
    uint internal totalStakers;
    uint internal profitPerShare;
    uint private emptyStakeTokens; //These are tokens given to the contract when there are no stakers.

    IStakeHandler[] internal stakeHandlers;
    uint internal startTime;

    uint internal registrationFeeWithReferrer;
    uint internal registrationFeeWithoutReferrer;
    mapping(address => uint) internal accountReferrals;
    mapping(address => bool) internal stakerIsRegistered;

    event OnDistribute(address sender, uint amountSent);
    event OnStake(address sender, uint amount, uint tax);
    event OnUnstake(address sender, uint amount, uint tax);
    event OnReinvest(address sender, uint amount, uint tax);
    event OnWithdraw(address sender, uint amount);

    modifier onlyLidToken {
        require(msg.sender == address(lidToken), "Can only be called by LidToken contract.");
        _;
    }

    modifier whenStakingActive {
        require(startTime != 0 && now > startTime, "Staking not yet started.");
        _;
    }

    function initialize(
        uint _stakingTaxBP,
        uint _ustakingTaxBP,
        uint _registrationFeeWithReferrer,
        uint _registrationFeeWithoutReferrer,
        address owner,
        ILidCertifiableToken _lidToken
    ) external initializer {
        Ownable.initialize(msg.sender);
        stakingTaxBP = _stakingTaxBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        unstakingTaxBP = _ustakingTaxBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        lidToken = _lidToken;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        registrationFeeWithReferrer = _registrationFeeWithReferrer;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        registrationFeeWithoutReferrer = _registrationFeeWithoutReferrer;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        //Due to issue in oz testing suite, the msg.sender might not be owner
        _transferOwnership(owner);
    }

    function registerAndStake(uint amount) public {
        registerAndStake(amount, address(0x0));
    }

    function registerAndStake(uint amount, address referrer) public whenStakingActive {
        require(!stakerIsRegistered[msg.sender], "Staker must not be registered");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(lidToken.balanceOf(msg.sender) >= amount, "Must have enough balance to stake amount");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint finalAmount;
        if(address(0x0) == referrer) {
            //No referrer
            require(amount >= registrationFeeWithoutReferrer, "Must send at least enough LID to pay registration fee.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            distribute(registrationFeeWithoutReferrer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            finalAmount = amount.sub(registrationFeeWithoutReferrer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            //has referrer
            require(amount >= registrationFeeWithReferrer, "Must send at least enough LID to pay registration fee.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            require(lidToken.transferFrom(msg.sender, referrer, registrationFeeWithReferrer), "Stake failed due to failed referral transfer.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            accountReferrals[referrer] = accountReferrals[referrer].add(1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            finalAmount = amount.sub(registrationFeeWithReferrer);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        stakerIsRegistered[msg.sender] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        stake(finalAmount);
    }

    function stake(uint amount) public whenStakingActive {
        require(stakerIsRegistered[msg.sender] == true, "Must be registered to stake.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(amount >= 1e18, "Must stake at least one LID.");
        require(lidToken.balanceOf(msg.sender) >= amount, "Cannot stake more LID than you hold unstaked.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (stakeValue[msg.sender] == 0) totalStakers = totalStakers.add(1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint tax = _addStake(amount);
        require(lidToken.transferFrom(msg.sender, address(this), amount), "Stake failed due to failed transfer.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit OnStake(msg.sender, amount, tax);
    }

    function unstake(uint amount) external whenStakingActive {
        require(amount >= 1e18, "Must unstake at least one LID.");
        require(stakeValue[msg.sender] >= amount, "Cannot unstake more LID than you have staked.");
        //must withdraw all dividends, to prevent overflows
        withdraw(dividendsOf(msg.sender));
        if (stakeValue[msg.sender] == amount) totalStakers = totalStakers.sub(1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalStaked = totalStaked.sub(amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        stakeValue[msg.sender] = stakeValue[msg.sender].sub(amount);

        uint tax = findTaxAmount(amount, unstakingTaxBP);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint earnings = amount.sub(tax);
        _increaseProfitPerShare(tax);
        stakerPayouts[msg.sender] = uintToInt(profitPerShare.mul(stakeValue[msg.sender]));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        for (uint i=0; i < stakeHandlers.length; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            stakeHandlers[i].handleUnstake(msg.sender, amount, stakeValue[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        require(lidToken.transferFrom(address(this), msg.sender, earnings), "Unstake failed due to failed transfer.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit OnUnstake(msg.sender, amount, tax);
    }

    function withdraw(uint amount) public whenStakingActive {
        require(dividendsOf(msg.sender) >= amount, "Cannot withdraw more dividends than you have earned.");
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + uintToInt(amount.mul(DISTRIBUTION_MULTIPLIER));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        lidToken.transfer(msg.sender, amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit OnWithdraw(msg.sender, amount);
    }

    function reinvest(uint amount) external whenStakingActive {
        require(dividendsOf(msg.sender) >= amount, "Cannot reinvest more dividends than you have earned.");
        uint payout = amount.mul(DISTRIBUTION_MULTIPLIER);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + uintToInt(payout);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint tax = _addStake(amount);
        emit OnReinvest(msg.sender, amount, tax);
    }

    function distribute(uint amount) public {
        require(lidToken.balanceOf(msg.sender) >= amount, "Cannot distribute more LID than you hold unstaked.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalDistributions = totalDistributions.add(amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _increaseProfitPerShare(amount);
        require(
            lidToken.transferFrom(msg.sender, address(this), amount),	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            "Distribution failed due to failed transfer."
        );
        emit OnDistribute(msg.sender, amount);
    }

    function handleTaxDistribution(uint amount) external onlyLidToken {
        totalDistributions = totalDistributions.add(amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _increaseProfitPerShare(amount);
        emit OnDistribute(msg.sender, amount);
    }

    function dividendsOf(address staker) public view returns (uint) {
        int divPayout = uintToInt(profitPerShare.mul(stakeValue[staker]));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(divPayout >= stakerPayouts[staker], "dividend calc overflow");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return uint(divPayout - stakerPayouts[staker])	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            .div(DISTRIBUTION_MULTIPLIER);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function findTaxAmount(uint value, uint taxBP) public pure returns (uint) {
        return value.mulBP(taxBP);
    }

    function numberStakeHandlersRegistered() external view returns (uint) {
        return stakeHandlers.length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function registerStakeHandler(IStakeHandler sc) external onlyOwner {
        stakeHandlers.push(sc);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function unregisterStakeHandler(uint index) external onlyOwner {
        IStakeHandler sc = stakeHandlers[stakeHandlers.length-1];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        stakeHandlers.pop();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        stakeHandlers[index] = sc;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function setStakingBP(uint valueBP) external onlyOwner {
        require(valueBP < 10000, "Tax connot be over 100% (10000 BP)");
        stakingTaxBP = valueBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function setUnstakingBP(uint valueBP) external onlyOwner {
        require(valueBP < 10000, "Tax connot be over 100% (10000 BP)");
        unstakingTaxBP = valueBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function setStartTime(uint _startTime) external onlyOwner {
        startTime = _startTime;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function setRegistrationFees(uint valueWithReferrer, uint valueWithoutReferrer) external onlyOwner {
        registrationFeeWithReferrer = valueWithReferrer;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        registrationFeeWithoutReferrer = valueWithoutReferrer;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function uintToInt(uint val) internal pure returns (int) {
        if (val >= uint(-1).div(2)) {
            require(false, "Overflow. Cannot convert uint to int.");
        } else {
            return int(val);
        }
    }

    function _addStake(uint amount) internal returns (uint tax) {
        tax = findTaxAmount(amount, stakingTaxBP);
        uint stakeAmount = amount.sub(tax);
        totalStaked = totalStaked.add(stakeAmount);
        stakeValue[msg.sender] = stakeValue[msg.sender].add(stakeAmount);
        for (uint i=0; i < stakeHandlers.length; i++) {
            stakeHandlers[i].handleStake(msg.sender, stakeAmount, stakeValue[msg.sender]);
        }
        uint payout = profitPerShare.mul(stakeAmount);
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + uintToInt(payout);
        _increaseProfitPerShare(tax);
    }

    function _increaseProfitPerShare(uint amount) internal {
        if (totalStaked != 0) {
            if (emptyStakeTokens != 0) {
                amount = amount.add(emptyStakeTokens);
                emptyStakeTokens = 0;
            }
            profitPerShare = profitPerShare.add(amount.mul(DISTRIBUTION_MULTIPLIER).div(totalStaked));
        } else {
            emptyStakeTokens = emptyStakeTokens.add(amount);
        }
    }

}


contract LidSimplifiedPresaleAccess is Initializable {
    using SafeMath for uint;
    LidStaking private staking;

    uint[5] private cutoffs;

    function initialize(LidStaking _staking) external initializer {
        staking = _staking;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        //Precalculated
        cutoffs = [	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            500000 ether,
            100000 ether,
            50000 ether,
            25000 ether,
            1 ether
        ];
    }

    function getAccessTime(address account, uint startTime) external view returns (uint accessTime) {
        uint stakeValue = staking.stakeValue(account);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (stakeValue == 0) return startTime.add(15 minutes);
        if (stakeValue >= cutoffs[0]) return startTime;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint i=0;
        uint stake2 = cutoffs[0];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        while (stake2 > stakeValue && i < cutoffs.length) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            i++;
            stake2 = cutoffs[i];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        return startTime.add(i.mul(3 minutes));
    }
}


contract LidSimplifiedPresale is Initializable, Ownable, ReentrancyGuard, Pausable {
    using BasisPoints for uint;
    using SafeMath for uint;

    uint internal maxBuyPerAddress;

    uint internal referralBP;

    uint internal uniswapEthBP;
    uint internal lidEthBP;

    uint internal uniswapTokenBP;
    uint internal presaleTokenBP;
    address[] internal tokenPools;
    uint[] internal tokenPoolBPs;

    uint internal hardcap;
    uint internal totalTokens;

    bool internal hasSentToUniswap;
    bool internal hasIssuedTokens;

    uint public finalEndTime;
    uint internal finalEth;

    IERC20 private token;
    IUniswapV2Router01 private uniswapRouter;
    LidSimplifiedPresaleTimer private timer;
    LidSimplifiedPresaleRedeemer private redeemer;
    LidSimplifiedPresaleAccess private access;
    address payable private lidFund;

    mapping(address => uint) public accountEthDeposit;
    mapping(address => uint) internal earnedReferrals;

    mapping(address => uint) internal referralCounts;

    mapping(address => uint) internal refundedEth;

    bool internal isRefunding;

    modifier whenPresaleActive {
        require(timer.isStarted(), "Presale not yet started.");
        require(!isPresaleEnded(), "Presale has ended.");
        _;
    }

    modifier whenPresaleFinished {
        require(timer.isStarted(), "Presale not yet started.");
        require(isPresaleEnded(), "Presale has not yet ended.");
        _;
    }

    function initialize(
        uint _maxBuyPerAddress,
        uint _uniswapEthBP,
        uint _lidEthBP,
        uint _referralBP,
        uint _hardcap,
        address owner,
        LidSimplifiedPresaleTimer _timer,
        LidSimplifiedPresaleRedeemer _redeemer,
        LidSimplifiedPresaleAccess _access,
        IERC20 _token,
        IUniswapV2Router01 _uniswapRouter,
        address payable _lidFund
    ) external initializer {
        Ownable.initialize(msg.sender);
        Pausable.initialize(msg.sender);
        ReentrancyGuard.initialize();

        token = _token;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        timer = _timer;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        redeemer = _redeemer;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        access = _access;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        lidFund = _lidFund;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        maxBuyPerAddress = _maxBuyPerAddress;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        uniswapEthBP = _uniswapEthBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        lidEthBP = _lidEthBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        referralBP = _referralBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        hardcap = _hardcap;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        uniswapRouter = _uniswapRouter;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalTokens = token.totalSupply();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        token.approve(address(uniswapRouter), token.totalSupply());	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        //Due to issue in oz testing suite, the msg.sender might not be owner
        _transferOwnership(owner);
    }

    function deposit() external payable whenNotPaused {
        deposit(address(0x0));
    }

    function setTokenPools(
        uint _uniswapTokenBP,
        uint _presaleTokenBP,
        address[] calldata _tokenPools,
        uint[] calldata _tokenPoolBPs
    ) external onlyOwner whenNotPaused {
        require(_tokenPools.length == _tokenPoolBPs.length, "Must have exactly one tokenPool addresses for each BP.");
        delete tokenPools;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        delete tokenPoolBPs;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uniswapTokenBP = _uniswapTokenBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        presaleTokenBP = _presaleTokenBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        for (uint i = 0; i < _tokenPools.length; ++i) {
            tokenPools.push(_tokenPools[i]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        uint totalTokenPoolBPs = uniswapTokenBP.add(presaleTokenBP);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        for (uint i = 0; i < _tokenPoolBPs.length; ++i) {
            tokenPoolBPs.push(_tokenPoolBPs[i]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            totalTokenPoolBPs = totalTokenPoolBPs.add(_tokenPoolBPs[i]);
        }
        require(totalTokenPoolBPs == 10000, "Must allocate exactly 100% (10000 BP) of tokens to pools");
    }

    function sendToUniswap() external whenPresaleFinished nonReentrant whenNotPaused {
        require(msg.sender == tx.origin, "Sender must be origin - no contract calls.");
        require(tokenPools.length > 0, "Must have set token pools");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(!hasSentToUniswap, "Has already sent to Uniswap.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        finalEndTime = now;
        finalEth = address(this).balance;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        hasSentToUniswap = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint uniswapTokens = totalTokens.mulBP(uniswapTokenBP);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint uniswapEth = finalEth.mulBP(uniswapEthBP);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uniswapRouter.addLiquidityETH.value(uniswapEth)(	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            address(token),	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            uniswapTokens,
            uniswapTokens,
            uniswapEth,
            address(0x000000000000000000000000000000000000dEaD),
            now
        );
    }

    function issueTokens() external whenPresaleFinished whenNotPaused {
        require(hasSentToUniswap, "Has not yet sent to Uniswap.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(!hasIssuedTokens, "Has already issued tokens.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        hasIssuedTokens = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint last = tokenPools.length.sub(1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        for (uint i = 0; i < last; ++i) {
            token.transfer(	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                tokenPools[i],	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                totalTokens.mulBP(tokenPoolBPs[i])	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            );
        }
        // in case rounding error, send all to final
        token.transfer(	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            tokenPools[last],	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            totalTokens.mulBP(tokenPoolBPs[last])	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        );
    }

    function releaseEthToAddress(address payable receiver, uint amount) external onlyOwner whenNotPaused returns(uint) {
        require(hasSentToUniswap, "Has not yet sent to Uniswap.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        receiver.transfer(amount);
    }

    function redeem() external whenPresaleFinished whenNotPaused {
        require(hasSentToUniswap, "Must have sent to Uniswap before any redeems.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint claimable = redeemer.calculateReedemable(msg.sender, finalEndTime, totalTokens.mulBP(presaleTokenBP));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        redeemer.setClaimed(msg.sender, claimable);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        token.transfer(msg.sender, claimable);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function startRefund() external onlyOwner {
        //TODO: Automatically start refund after timer is passed for softcap reach
        pause();
        isRefunding = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function topUpRefundFund() external payable onlyOwner {

    }

    function claimRefund(address payable account) external whenPaused {
        require(isRefunding, "Refunds not active");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint refundAmt = getRefundableEth(account);
        require(refundAmt > 0, "Nothing to refund");
        refundedEth[account] = refundedEth[account].add(refundAmt);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        account.transfer(refundAmt);
    }

    function updateHardcap(uint valueWei) external onlyOwner {
        hardcap = valueWei;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function updateMaxBuy(uint valueWei) external onlyOwner {
        maxBuyPerAddress = valueWei;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function deposit(address payable referrer) public payable nonReentrant whenNotPaused {
        require(timer.isStarted(), "Presale not yet started.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(now >= access.getAccessTime(msg.sender, timer.startTime()), "Time must be at least access time.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(msg.sender != referrer, "Sender cannot be referrer.");
        require(address(this).balance.sub(msg.value) <= hardcap, "Cannot deposit more than hardcap.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(!hasSentToUniswap, "Presale Ended, Uniswap has been called.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint endTime = timer.updateEndTime();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(!(now > endTime && endTime != 0), "Presale Ended, time over limit.");
        require(
            redeemer.accountDeposits(msg.sender).add(msg.value) <= maxBuyPerAddress,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            "Deposit exceeds max buy per address."
        );

        uint fee = msg.value.mulBP(referralBP);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint depositEther = msg.value;
        uint excess = 0;

        //Remove fee and refund eth in case final purchase needed to end sale without dust errors
        if (address(this).balance > hardcap) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            fee = 0;
            excess = address(this).balance.sub(hardcap);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            depositEther = depositEther.sub(excess);
        }

        redeemer.setDeposit(msg.sender, depositEther.sub(fee), address(this).balance.sub(fee));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        if (excess == 0) {
            if (referrer != address(0x0) && referrer != msg.sender) {
                earnedReferrals[referrer] = earnedReferrals[referrer].add(fee);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                referralCounts[referrer] = referralCounts[referrer].add(1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                referrer.transfer(fee);
            } else {
                lidFund.transfer(fee);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            }
        } else {
            msg.sender.transfer(excess);
        }
    }

    function getRefundableEth(address account) public view returns (uint) {
        if (!isRefunding) return 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        //TODO: use account eth deposits insted once switched to referral withdraw pattern
        return redeemer.accountDeposits(account)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            .divBP(10000 - referralBP)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            .sub(refundedEth[account]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function isPresaleEnded() public view returns (bool) {
        uint endTime =  timer.endTime();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (hasSentToUniswap) return true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return (
            (address(this).balance >= hardcap) ||	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            (timer.isStarted() && (now > endTime && endTime != 0))	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        );
    }

}


contract LidTimeLock is Initializable, Ownable {
    using BasisPoints for uint;
    using SafeMath for uint;

    uint internal releaseInterval;
    uint public releaseStart;
    uint internal releaseBP;

    uint internal startingTokens;
    uint internal claimedTokens;

    IERC20 private token;

    address releaseWallet;
    
    LidSimplifiedPresale private presale;

    modifier onlyAfterStart {
        uint finalEndTime = presale.finalEndTime();
        require(finalEndTime != 0 && now > finalEndTime, "Has not yet started.");
        _;
    }

    function initialize(
        uint _releaseInterval,
        uint _releaseBP,
        address owner,
        IERC20 _token,
        LidSimplifiedPresale _presale,
        address _releaseWallet
    ) external initializer {
        releaseInterval = _releaseInterval;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        releaseBP = _releaseBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        token = _token;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        presale = _presale;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        releaseWallet = _releaseWallet;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        Ownable.initialize(msg.sender);

        //Due to issue in oz testing suite, the msg.sender might not be owner
        _transferOwnership(owner);
    }

    function claimToken() external onlyAfterStart {
        startingTokens = token.balanceOf(address(this)).add(claimedTokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint cycle = getCurrentCycleCount();
        uint totalClaimAmount = cycle.mul(startingTokens.mulBP(releaseBP));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint toClaim = totalClaimAmount.sub(claimedTokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (token.balanceOf(address(this)) < toClaim) toClaim = token.balanceOf(address(this));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        claimedTokens = claimedTokens.add(toClaim);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        token.transfer(releaseWallet, toClaim);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function reset(
        uint _releaseInterval,
        uint _releaseBP,
        LidSimplifiedPresale _presale,
        address _releaseWallet
    ) external onlyOwner {
        releaseInterval = _releaseInterval;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        releaseBP = _releaseBP;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        presale = _presale;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        releaseWallet = _releaseWallet;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function setPresale(
        LidSimplifiedPresale _presale
    ) external onlyOwner {
        presale = _presale;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getCurrentCycleCount() public view returns (uint) {
        uint finalEndTime = presale.finalEndTime();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (now <= finalEndTime || finalEndTime == 0) return 0;
        return now.sub(finalEndTime).div(releaseInterval).add(1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

}