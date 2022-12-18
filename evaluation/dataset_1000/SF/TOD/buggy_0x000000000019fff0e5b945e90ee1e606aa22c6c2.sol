/**
 *Submitted for verification at Etherscan.io on 2020-03-18
*/

pragma solidity 0.5.16;


interface IDaiBackstopSyndicate {
  event AuctionEntered(uint256 auctionId, uint256 mkrAsk, uint256 daiBid);
  event AuctionFinalized(uint256 auctionId);

  enum Status {
    ACCEPTING_DEPOSITS,
    ACTIVATED,
    DEACTIVATED
  }

  // Anyone can deposit Dai up until the auctions have started at 1:1
  function enlist(uint256 daiAmount) external returns (uint256 backstopTokensMinted);

  // Anyone can withdraw at any point as long as Dai is not locked in auctions
  function defect(uint256 backstopTokenAmount) external returns (uint256 daiRedeemed, uint256 mkrRedeemed);

  // Anyone can enter an auction for the syndicate, bidding Dai in return for MKR
  function enterAuction(uint256 auctionId) external;

  // Anyone can finalize an auction, returning the Dai or MKR to the syndicate
  function finalizeAuction(uint256 auctionId) external;

  // An owner can halt all new deposits and auctions (but not withdrawals or ongoing auctions)
  function ceaseFire() external;
  
  function getDaiBalance() external view returns (uint256 combinedDaiInVat);

  function getStatus() external view returns (Status status);

  function getActiveAuctions() external view returns (uint256[] memory activeAuctions);
}


interface IJoin {
    function join(address, uint256) external;
    function exit(address, uint256) external;
}


interface IVat {
    function dai(address) external view returns (uint256);
    function hope(address) external;
    function move(address, address, uint256) external;
}


interface IFlopper {
    // --- Auth ---
    // caller authorization (1 = authorized, 0 = not authorized)
    function wards(address) external view returns (uint256);
    // authorize caller
    function rely(address usr) external;
    // deauthorize caller
    function deny(address usr) external;

    // Bid objects
    function bids(uint256) external view returns (
        uint256 bid,
        uint256 lot,
        address guy,
        uint48 tic,
        uint48 end
    );

    // DAI contract address
    function vat() external view returns (address);
    // MKR contract address
    function gem() external view returns (address);

    // num decimals (constant)
    function ONE() external pure returns (uint256);

    // minimum bid increase (config - 5% initial)
    function beg() external view returns (uint256);
    // initial lot increase (config - 50% initial)
    function pad() external view returns (uint256);
    // bid lifetime (config - 3 hours initial)
    function ttl() external view returns (uint48);
    // total auction length (config - 2 days initial)
    function tau() external view returns (uint48);

    // number of auctions
    function kicks() external view returns (uint256);
    // status of the auction (1 = active, 0 = disabled)
    function live() external view returns (uint256);
    // user who shut down flopper mechanism and paid off last bid
    function vow() external view returns (address);

    // --- Events ---
    event Kick(uint256 id, uint256 lot, uint256 bid, address indexed gal);

    // --- Admin ---
    function file(bytes32 what, uint256 data) external;

    // --- Auction ---

    // create an auction 
    // access control: authed
    // state machine: after auction expired
    // gal - recipient of the dai
    // lot - amount of mkr to mint
    // bid - amount of dai to pay
    // id - id of the auction
    function kick(address gal, uint256 lot, uint256 bid) external returns (uint256 id);

    // extend the auction and increase minimum maker amount minted
    // access control: not-authed
    // state machine: after auction expiry, before first bid
    // id - id of the auction
    function tick(uint256 id) external;

    // bid up auction and refund locked up dai to previous bidder
    // access control: not-authed
    // state machine: before auction expired
    // id - id of the auction
    // lot - amount of mkr to mint
    // bid - amount of dai to pay
    function dent(uint256 id, uint256 lot, uint256 bid) external;

    // finalize auction
    // access control: not-authed
    // state machine: after auction expired
    // id - id of the auction
    function deal(uint256 id) external;

    // --- Shutdown ---

    // shutdown flopper mechanism
    // access control: authed
    // state machine: anytime
    function cage() external;

    // get cancelled bid back
    // access control: authed
    // state machine: after shutdown
    function yank(uint256 id) external;
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
        require(b <= a, "SafeMath: subtraction overflow");
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
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
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
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}


/**
 * @dev Interface of the ERC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see `ERC20Detailed`.
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
     * Emits a `Transfer` event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through `transferFrom`. This is
     * zero by default.
     *
     * This value changes when `approve` or `transferFrom` are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * > Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an `Approval` event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a `Transfer` event.
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
     * a call to `approve`. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


/**
 * @dev Implementation of the `IERC20` interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using `_mint`.
 * For a generic mechanism see `ERC20Mintable`.
 *
 * *For a detailed writeup see our guide [How to implement supply
 * mechanisms](https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226).*
 *
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
 *
 * Additionally, an `Approval` event is emitted on calls to `transferFrom`.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard `decreaseAllowance` and `increaseAllowance`
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See `IERC20.approve`.
 */
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    /**
     * @dev See `IERC20.totalSupply`.
     */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
address payable winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27() payable public{
     
       winner_TOD27.transfer(msg.value);
    }

    /**
     * @dev See `IERC20.balanceOf`.
     */
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
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

    /**
     * @dev See `IERC20.transfer`.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
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
     * @dev See `IERC20.allowance`.
     */
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
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
     * @dev See `IERC20.approve`.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 value) public returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
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
     * @dev See `IERC20.transferFrom`.
     *
     * Emits an `Approval` event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of `ERC20`;
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `value`.
     * - the caller must have allowance for `sender`'s tokens of at least
     * `amount`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount));
        return true;
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
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to `approve` that can be used as a mitigation for
     * problems described in `IERC20.approve`.
     *
     * Emits an `Approval` event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
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
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to `approve` that can be used as a mitigation for
     * problems described in `IERC20.approve`.
     *
     * Emits an `Approval` event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue));
        return true;
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
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to `transfer`, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a `Transfer` event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
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

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a `Transfer` event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
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

     /**
     * @dev Destoys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a `Transfer` event with `to` set to the zero address.
     *
     * Requirements
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 value) internal {
        require(account != address(0), "ERC20: burn from the zero address");

        _totalSupply = _totalSupply.sub(value);
        _balances[account] = _balances[account].sub(value);
        emit Transfer(account, address(0), value);
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
     * @dev Sets `amount` as the allowance of `spender` over the `owner`s tokens.
     *
     * This is internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an `Approval` event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(address owner, address spender, uint256 value) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit Approval(owner, spender, value);
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
     * @dev Destoys `amount` tokens from `account`.`amount` is then deducted
     * from the caller's allowance.
     *
     * See `_burn` and `_approve`.
     */
    function _burnFrom(address account, uint256 amount) internal {
        _burn(account, amount);
        _approve(account, msg.sender, _allowances[account][msg.sender].sub(amount));
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
}


contract SimpleFlopper {

  // A "flopper" is a contract for auctioning off MKR in exchange for Dai.
  IFlopper internal constant _auction = IFlopper(
    0x4D95A049d5B0b7d32058cd3F2163015747522e99
  );

  // Getters //

  /// @notice Get the status of the flopper contract
  /// @return bool status true if auction contract is enabled
  function isEnabled() public view returns (bool status) {
    return (_auction.live() == 1) ? true : false;
  }

  /// @notice Get the id of the latest auction
  /// @return auctionID uint256 id
  function getTotalNumberOfAuctions() public view returns (uint256 auctionID) {
    return _auction.kicks();
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

  /// @notice Get the address of the auction contract (Flopper)
  /// @return Auction address
  function getFlopperAddress() public view returns (address flopper) {
    return address(_auction);
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

  /// @notice Get the flopper contract config
  /// @return bidIncrement uint256 minimum bid increment as percentage (initial = 1.05E18)
  /// @return repriceIncrement uint256 reprice increment as percentage (initial = 1.50E18)
  /// @return bidDuration uint256 duration of a bid in seconds (initial = 3 hours)
  /// @return auctionDuration uint256 initial duration of an auction in seconds (initial = 2 days)
  function getAuctionInformation() public view returns (
    uint256 bidIncrement,
    uint256 repriceIncrement,
    uint256 bidDuration,
    uint256 auctionDuration
  ) {
    return (_auction.beg(), _auction.pad(), _auction.ttl(), _auction.tau());
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

  /// @notice Get the winning bid for an auction
  /// @return amountDAI uint256 amount of DAI to be burned
  /// @return amountMKR uint256 amount of MKR to be minted
  /// @return bidder address account who placed bid
  /// @return bidDeadline uint48 deadline of bid
  /// @return auctionDeadline uint48 deadline of auction
  function getCurrentBid(uint256 auctionID) public view returns (
    uint256 amountDAI,
    uint256 amountMKR,
    address bidder,
    uint48 bidDeadline,
    uint48 auctionDeadline
  ) {
    return _auction.bids(auctionID);
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

  // Setters //

  /// @notice Extend and reprice expired auction with no bid
  /// @dev state machine: after auction expiry, before first bid
  /// @param auctionID uint256 id of the auction
  function _reprice(uint256 auctionID) internal {
    _auction.tick(auctionID);
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

  /// @notice Add bid to a live auction, if first bid this transfers DAI to vat
  /// @dev state machine: before auction expired
  /// @param auctionID uint256 id of the auction
  function _bid(uint256 auctionID, uint256 amountMKR, uint256 amountDAI) internal {
    _auction.dent(auctionID, amountMKR, amountDAI);
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

  /// @notice Finalize an auction with a winning bid and release maker
  /// @dev state machine: after auction expired
  /// @param auctionID uint256 id of the auction
  function _finalize(uint256 auctionID) internal {
    _auction.deal(auctionID);
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
}


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be aplied to your functions to restrict their use to
 * the owner.
 *
 * In order to transfer ownership, a recipient must be specified, at which point
 * the specified recipient can call `acceptOwnership` and take ownership.
 */
contract TwoStepOwnable {
  address private _owner;

  address private _newPotentialOwner;

address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

  /**
   * @dev Initialize contract by setting transaction submitter as initial owner.
   */
  constructor() internal {
    _owner = tx.origin;
    emit OwnershipTransferred(address(0), _owner);
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

  /**
   * @dev Returns the address of the current owner.
   */
  function owner() public view returns (address) {
    return _owner;
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

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(isOwner(), "TwoStepOwnable: caller is not the owner.");
    _;
  }

  /**
   * @dev Returns true if the caller is the current owner.
   */
  function isOwner() public view returns (bool) {
    return msg.sender == _owner;
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

  /**
   * @dev Allows a new account (`newOwner`) to accept ownership.
   * Can only be called by the current owner.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(
      newOwner != address(0),
      "TwoStepOwnable: new potential owner is the zero address."
    );

    _newPotentialOwner = newOwner;
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

  /**
   * @dev Cancel a transfer of ownership to a new account.
   * Can only be called by the current owner.
   */
  function cancelOwnershipTransfer() public onlyOwner {
    delete _newPotentialOwner;
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

  /**
   * @dev Transfers ownership of the contract to the caller.
   * Can only be called by a new potential owner set by the current owner.
   */
  function acceptOwnership() public {
    require(
      msg.sender == _newPotentialOwner,
      "TwoStepOwnable: current owner must set caller as new potential owner."
    );

    delete _newPotentialOwner;

    emit OwnershipTransferred(_owner, msg.sender);

    _owner = msg.sender;
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
}


/**
 * Adapted from OpenZeppelin's address version of the same, written by Alberto Cuesta Cañada:
 * https://github.com/OpenZeppelin/openzeppelin-contracts/blob/5dfe7215a9156465d550030eadc08770503b2b2f/
 *   contracts/utils/EnumerableSet.sol
 */
library EnumerableSet {

  struct AuctionIDSet {
    // Position of the value in the `values` array, plus 1 because index 0
    // means a value is not in the set.
    mapping (uint256 => uint256) index;
    uint256[] values;
  }

  /**
   * @dev Add a value to a set. O(1).
   * Returns false if the value was already in the set.
   */
  function add(AuctionIDSet storage set, uint256 value)
    internal
    returns (bool)
  {
    if (!contains(set, value)) {
      set.values.push(value);
      // The element is stored at length-1, but we add 1 to all indexes
      // and use 0 as a sentinel value
      set.index[value] = set.values.length;
      return true;
    } else {
      return false;
    }
  }

  /**
   * @dev Removes a value from a set. O(1).
   * Returns false if the value was not present in the set.
   */
  function remove(AuctionIDSet storage set, uint256 value)
    internal
    returns (bool)
  {
    if (contains(set, value)){
      uint256 toDeleteIndex = set.index[value] - 1;
      uint256 lastIndex = set.values.length - 1;

      // If the element we're deleting is the last one, we can just remove it without doing a swap
      if (lastIndex != toDeleteIndex) {
        uint256 lastValue = set.values[lastIndex];

        // Move the last value to the index where the deleted value is
        set.values[toDeleteIndex] = lastValue;
        // Update the index for the moved value
        set.index[lastValue] = toDeleteIndex + 1; // All indexes are 1-based
      }

      // Delete the index entry for the deleted value
      delete set.index[value];

      // Delete the old entry for the moved value
      set.values.pop();

      return true;
    } else {
      return false;
    }
  }

  /**
   * @dev Returns true if the value is in the set. O(1).
   */
  function contains(AuctionIDSet storage set, uint256 value)
    internal
    view
    returns (bool)
  {
    return set.index[value] != 0;
  }

  /**
   * @dev Returns an array with all values in the set. O(N).
   * Note that there are no guarantees on the ordering of values inside the
   * array, and it may change when more values are added or removed.
   * WARNING: This function may run out of gas on large sets: use {length} and
   * {get} instead in these cases.
   */
  function enumerate(AuctionIDSet storage set)
    internal
    view
    returns (uint256[] memory)
  {
    uint256[] memory output = new uint256[](set.values.length);
    for (uint256 i; i < set.values.length; i++){
      output[i] = set.values[i];
    }
    return output;
  }

  /**
   * @dev Returns the number of elements on the set. O(1).
   */
  function length(AuctionIDSet storage set)
    internal
    view
    returns (uint256)
  {
    return set.values.length;
  }

   /** @dev Returns the element stored at position `index` in the set. O(1).
  * Note that there are no guarantees on the ordering of values inside the
  * array, and it may change when more values are added or removed.
  *
  * Requirements:
  *
  * - `index` must be strictly less than {length}.
  */
  function get(AuctionIDSet storage set, uint256 index)
    internal
    view
    returns (uint256)
  {
    return set.values[index];
  }
}


/// @notice See https://github.com/backstop-syndicate/dai-backstop-syndicate
contract DaiBackstopSyndicateV2 is
  IDaiBackstopSyndicate,
  SimpleFlopper,
  TwoStepOwnable,
  ERC20
{
  using SafeMath for uint256;
  using EnumerableSet for EnumerableSet.AuctionIDSet;

  // Track the status of the Syndicate.
  Status internal _status;

  // Track each active auction as an enumerable set.
  EnumerableSet.AuctionIDSet internal _activeAuctions;

  IERC20 internal constant _DAI = IERC20(
    0x6B175474E89094C44Da98b954EedeAC495271d0F
  );

  IERC20 internal constant _MKR = IERC20(
    0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2
  );

  IJoin internal constant _DAI_JOIN = IJoin(
    0x9759A6Ac90977b93B58547b4A71c78317f391A28
  );

  IVat internal constant _VAT = IVat(
    0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B
  );

  constructor() public {
    // Begin in the "accepting deposits" state.
    _status = Status.ACCEPTING_DEPOSITS;
    
    // Enable "dai-join" to take vatDai in order mint ERC20 Dai.
    _VAT.hope(address(_DAI_JOIN));
    
    // Enable creation of "vat dai" by approving dai-join.
    _DAI.approve(address(_DAI_JOIN), uint256(-1));
    
    // Enable entry into auctions by approving the "flopper".
    _VAT.hope(SimpleFlopper.getFlopperAddress());
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

  /// @notice User deposits DAI in the BackStop Syndicate and receives Syndicate shares
  /// @param daiAmount Amount of DAI to deposit
  /// @return Amount of Backstop Syndicate shares participant receives
  function enlist(
    uint256 daiAmount
  ) external notWhenDeactivated returns (uint256 backstopTokensMinted) {
    require(daiAmount > 0, "DaiBackstopSyndicate/enlist: No Dai amount supplied.");  
      
    require(
      _status == Status.ACCEPTING_DEPOSITS,
      "DaiBackstopSyndicate/enlist: Cannot deposit once the first auction bid has been made."
    );

    require(
      _DAI.transferFrom(msg.sender, address(this), daiAmount),
      "DaiBackstopSyndicate/enlist: Could not transfer Dai amount from caller."
    );

    // Place the supplied Dai into the central Maker ledger for use in auctions.
    _DAI_JOIN.join(address(this), daiAmount);

    // Mint tokens 1:1 to the caller in exchange for the supplied Dai.
    backstopTokensMinted = daiAmount;
    _mint(msg.sender, backstopTokensMinted);
  }
address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }

  /// @notice User withdraws DAI and MKR from BackStop Syndicate based on Syndicate shares owned
  /// @param backstopTokenAmount Amount of shares to burn
  /// @return daiRedeemed: Amount of DAI withdrawn
  /// @return mkrRedeemed: Amount of MKR withdrawn
  function defect(
    uint256 backstopTokenAmount
  ) external returns (uint256 daiRedeemed, uint256 mkrRedeemed) {
    require(
      backstopTokenAmount > 0, "DaiBackstopSyndicate/enlist: No token amount supplied."
    );
      
    // Determine the % ownership. (scaled up by 1e18)
    uint256 shareFloat = (backstopTokenAmount.mul(1e18)).div(totalSupply());

    // Burn the tokens.
    _burn(msg.sender, backstopTokenAmount);

    // Determine the Dai currently being used to bid in auctions.
    uint256 vatDaiLockedInAuctions = _getActiveAuctionVatDaiTotal();

    // Determine the Dai currently locked up on behalf of this contract.
    uint256 vatDaiBalance = _VAT.dai(address(this));

    // Combine Dai locked in auctions with the balance on the contract.
    uint256 combinedVatDai = vatDaiLockedInAuctions.add(vatDaiBalance);

    // Determine the Maker currently held by the contract.
    uint256 makerBalance = _MKR.balanceOf(address(this));

    // Determine the amount of Dai and MKR to redeem based on the share.
    uint256 vatDaiRedeemed = combinedVatDai.mul(shareFloat) / 1e18;
    mkrRedeemed = makerBalance.mul(shareFloat) / 1e18;

    // daiRedeemed is the e18 version of vatDaiRedeemed (e45).
    // Needed for dai ERC20 token, otherwise keep decimals of vatDai.
    daiRedeemed = vatDaiRedeemed / 1e27;

    // Ensure that sufficient Dai liquidity is currently available to withdraw.
    require(
      vatDaiRedeemed <= vatDaiBalance,
      "DaiBackstopSyndicate/defect: Insufficient Dai (in use in auctions)"
    );

    // Redeem the Dai and MKR, giving user vatDai if global settlement, otherwise, tokens
    if (vatDaiRedeemed > 0) {
      if (SimpleFlopper.isEnabled()) {
        _DAI_JOIN.exit(msg.sender, daiRedeemed);
      } else {
        _VAT.move(address(this), msg.sender, vatDaiRedeemed);
      }
    }

    if (mkrRedeemed > 0) {
      require(
        _MKR.transfer(msg.sender, mkrRedeemed),
        "DaiBackstopSyndicate/defect: MKR redemption failed."
      );      
    }
  }
address payable winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }

  /// @notice Triggers syndicate participation in an auction, bidding 50k DAI for 500 MKR
  /// @param auctionId ID of the auction to participate in
  function enterAuction(uint256 auctionId) external notWhenDeactivated {
    require(
      !_activeAuctions.contains(auctionId),
      "DaiBackstopSyndicate/enterAuction: Auction already active."
    );

    // dai has 45 decimal places
    (uint256 amountDai, , , , ) = SimpleFlopper.getCurrentBid(auctionId);

    // lot needs to have 18 decimal places, and we're expecting 1 mkr == 100 dai
    uint256 expectedLot = (amountDai / 1e27) / 100;

    // Place the bid, reverting on failure.
    SimpleFlopper._bid(auctionId, expectedLot, amountDai);

    // Prevent further deposits.
    if (_status != Status.ACTIVATED) {
      _status = Status.ACTIVATED;
    }

    // Register auction if successful participation.
    _activeAuctions.add(auctionId);

    // Emit an event to signal that the auction was entered.
    emit AuctionEntered(auctionId, expectedLot, amountDai);
  }
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

  // Anyone can finalize an auction if it's ready
  function finalizeAuction(uint256 auctionId) external {
    require(
      _activeAuctions.contains(auctionId),
      "DaiBackstopSyndicate/enterAuction: Auction already finalized"
    );

    // If auction was finalized, end should be 0x0.
    (,, address bidder,, uint48 end) = SimpleFlopper.getCurrentBid(auctionId);

    // If auction isn't closed, we try to close it ourselves
    if (end != 0) {
      // If we are the winning bidder, we finalize the auction
      // Otherwise we got outbid and we withdraw DAI
      if (bidder == address(this)) {
        SimpleFlopper._finalize(auctionId);
      }
    }

    // Remove the auction from the set of active auctions.
    _activeAuctions.remove(auctionId);

    // Emit an event to signal that the auction was finalized.
    emit AuctionFinalized(auctionId);
  }
address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }

  /// @notice The owner can pause new deposits and auctions. Existing auctions
  /// and withdrawals will be unaffected.
  function ceaseFire() external onlyOwner {
    _status = Status.DEACTIVATED;
  }
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

  function getStatus() external view returns (Status status) {
    status = _status;
  }
address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }

  function getActiveAuctions() external view returns (
    uint256[] memory activeAuctions
  ) {
    activeAuctions = _activeAuctions.enumerate();
  }
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

  /**
   * @dev Returns the name of the token.
   */
  function name() external view returns (string memory) {
    return "Dai Backstop Syndicate v1-100";
  }
address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }

  /**
   * @dev Returns the symbol of the token, usually a shorter version of the
   * name.
   */
  function symbol() external view returns (string memory) {
    return "DBSv1-100";
  }
address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }

  /**
   * @dev Returns the number of decimals used to get its user representation.
   * For example, if `decimals` equals `2`, a balance of `505` tokens should
   * be displayed to a user as `5,05` (`505 / 10 ** 2`).
   *
   * Tokens usually opt for a value of 18, imitating the relationship between
   * Ether and Wei.
   *
   * > Note that this information is only used for _display_ purposes: it in
   * no way affects any of the arithmetic of the contract, including
   * `IERC20.balanceOf` and `IERC20.transfer`.
   */
  function decimals() external view returns (uint8) {
    return 18;
  }
bool claimed_TOD30 = false;
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

  /// @notice Return total amount of DAI that is currently held by Syndicate
  function getDaiBalance() external view returns (uint256 combinedDaiInVat) {
        // Determine the Dai currently being used to bid in auctions.
    uint256 vatDaiLockedInAuctions = _getActiveAuctionVatDaiTotal();

    // Determine the Dai currently locked up on behalf of this contract.
    uint256 vatDaiBalance = _VAT.dai(address(this));

    // Combine Dai locked in auctions with the balance on the contract.
    combinedDaiInVat = vatDaiLockedInAuctions.add(vatDaiBalance) / 1e27;
  }
address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }

  function _getActiveAuctionVatDaiTotal() internal view returns (uint256 vatDai) {
    vatDai = 0;
    uint256[] memory activeAuctions = _activeAuctions.enumerate();

    uint256 auctionVatDai;
    address bidder;
    for (uint256 i = 0; i < activeAuctions.length; i++) {
      // Dai bid size is returned from getCurrentBid with 45 decimals
      (auctionVatDai,, bidder,,) = SimpleFlopper.getCurrentBid(activeAuctions[i]);
      if (bidder == address(this)) {
        // we are keeping the 45 decimals in case we need to return vatDai
        vatDai.add(auctionVatDai);
      }
    }
  }
address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }

  modifier notWhenDeactivated() {
    require(
      _status != Status.DEACTIVATED,
      "DaiBackstopSyndicate/notWhenDeactivated: Syndicate is deactivated, please withdraw."
    );
    _;
  }
}