pragma solidity 0.5.2;

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address private _owner;

  uint256 bugv_tmstmp5 = block.timestamp;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }
uint256 bugv_tmstmp4 = block.timestamp;

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * @notice Renouncing to ownership will leave the contract without an owner.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {
    /**
    * @dev Multiplies two unsigned integers, reverts on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
    * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Adds two unsigned integers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
    * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure.
 * To use this library you can add a `using SafeERC20 for ERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        require(token.transfer(to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        require(token.transferFrom(from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require((value == 0) || (token.allowance(msg.sender, spender) == 0));
        require(token.approve(spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        require(token.approve(spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value);
        require(token.approve(spender, newAllowance));
    }
}

// File: contracts/MaticTokenVesting.sol

/**
 * @title TokenVesting
 * @dev A token holder contract that can release its token balance gradually like a
 * typical vesting scheme, with a cliff and vesting period. Optionally revocable by the
 * owner.
 */
contract MaticTokenVesting is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

  function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  IERC20 private maticToken;
  address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
  uint256 private tokensToVest = 0;
  function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 private vestingId = 0;

  address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
  string private constant INSUFFICIENT_BALANCE = "Insufficient balance";
  function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  string private constant INVALID_VESTING_ID = "Invalid vesting id";
  function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  string private constant VESTING_ALREADY_RELEASED = "Vesting already released";
  function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  string private constant INVALID_BENEFICIARY = "Invalid beneficiary address";
  address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  string private constant NOT_VESTED = "Tokens have not vested yet";

    struct Vesting {
        uint256 releaseTime;
        uint256 amount;
        address beneficiary;
        bool released;
    }
  function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping(uint256 => Vesting) public vestings;

  uint256 bugv_tmstmp2 = block.timestamp;
  event TokenVestingReleased(uint256 indexed vestingId, address indexed beneficiary, uint256 amount);
  uint256 bugv_tmstmp3 = block.timestamp;
  event TokenVestingAdded(uint256 indexed vestingId, address indexed beneficiary, uint256 amount);
  uint256 bugv_tmstmp1 = block.timestamp;
  event TokenVestingRemoved(uint256 indexed vestingId, address indexed beneficiary, uint256 amount);

    constructor(IERC20 _token) public {
        require(address(_token) != address(0x0), "Matic token address is not valid");
        maticToken = _token;

        uint256 SCALING_FACTOR = 10 ** 18;
        uint256 day = 1 days;

        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 0, 3230085552 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 30 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 61 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 91 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 122 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 153 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 183 * day, 1088418885 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 214 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 244 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 275 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 306 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 335 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 366 * day, 1218304816 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 396 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 427 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 457 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 488 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 519 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 549 * day, 1218304816 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 580 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 610 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 641 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 672 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 700 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 731 * day, 1084971483 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 761 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 792 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 822 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 853 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 884 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 914 * day, 618304816 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 945 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 975 * day, 25000000 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 1096 * day, 593304816 * SCALING_FACTOR);
        addVesting(0xb316fa9Fa91700D7084D377bfdC81Eb9F232f5Ff, now + 1279 * day, 273304816 * SCALING_FACTOR);
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    function token() public view returns (IERC20) {
        return maticToken;
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

    function beneficiary(uint256 _vestingId) public view returns (address) {
        return vestings[_vestingId].beneficiary;
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

    function releaseTime(uint256 _vestingId) public view returns (uint256) {
        return vestings[_vestingId].releaseTime;
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    function vestingAmount(uint256 _vestingId) public view returns (uint256) {
        return vestings[_vestingId].amount;
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function removeVesting(uint256 _vestingId) public onlyOwner {
        Vesting storage vesting = vestings[_vestingId];
        require(vesting.beneficiary != address(0x0), INVALID_VESTING_ID);
        require(!vesting.released , VESTING_ALREADY_RELEASED);
        vesting.released = true;
        tokensToVest = tokensToVest.sub(vesting.amount);
        emit TokenVestingRemoved(_vestingId, vesting.beneficiary, vesting.amount);
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

    function addVesting(address _beneficiary, uint256 _releaseTime, uint256 _amount) public onlyOwner {
        require(_beneficiary != address(0x0), INVALID_BENEFICIARY);
        tokensToVest = tokensToVest.add(_amount);
        vestingId = vestingId.add(1);
        vestings[vestingId] = Vesting({
            beneficiary: _beneficiary,
            releaseTime: _releaseTime,
            amount: _amount,
            released: false
        });
        emit TokenVestingAdded(vestingId, _beneficiary, _amount);
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

    function release(uint256 _vestingId) public {
        Vesting storage vesting = vestings[_vestingId];
        require(vesting.beneficiary != address(0x0), INVALID_VESTING_ID);
        require(!vesting.released , VESTING_ALREADY_RELEASED);
        // solhint-disable-next-line not-rely-on-time
        require(block.timestamp >= vesting.releaseTime, NOT_VESTED);

        require(maticToken.balanceOf(address(this)) >= vesting.amount, INSUFFICIENT_BALANCE);
        vesting.released = true;
        tokensToVest = tokensToVest.sub(vesting.amount);
        maticToken.safeTransfer(vesting.beneficiary, vesting.amount);
        emit TokenVestingReleased(_vestingId, vesting.beneficiary, vesting.amount);
    }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function retrieveExcessTokens(uint256 _amount) public onlyOwner {
        require(_amount <= maticToken.balanceOf(address(this)).sub(tokensToVest), INSUFFICIENT_BALANCE);
        maticToken.safeTransfer(owner(), _amount);
    }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}