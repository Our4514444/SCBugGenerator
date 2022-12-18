/**
 *Submitted for verification at Etherscan.io on 2020-05-22
*/

/*
██╗     ███████╗██╗  ██╗                         
██║     ██╔════╝╚██╗██╔╝                         
██║     █████╗   ╚███╔╝                          
██║     ██╔══╝   ██╔██╗                          
███████╗███████╗██╔╝ ██╗                         
╚══════╝╚══════╝╚═╝  ╚═╝                         
                                                 
██╗      ██████╗  ██████╗██╗  ██╗███████╗██████╗ 
██║     ██╔═══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
██║     ██║   ██║██║     █████╔╝ █████╗  ██████╔╝
██║     ██║   ██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
███████╗╚██████╔╝╚██████╗██║  ██╗███████╗██║  ██║
╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
DEAR MSG.SENDER(S):

/ LXL is a project in beta.
// Please audit and use at your own risk.
/// Entry into LXL shall not create an attorney/client relationship.
//// Likewise, LXL should not be construed as legal advice or replacement for professional counsel.
///// STEAL THIS C0D3SL4W 

~presented by Open, ESQ || LexDAO LLC
*/

pragma solidity 0.5.17;

/**************************
OPENZEPPELIN BASE CONTRACTS  
**************************/
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
    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
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
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
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
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
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

/***************
EARNING PROTOCOL 
***************/
/**
 * @title Compound interface
 * @dev see https://github.com/compound-developers/compound-supply-examples
 */
interface ICERC20 {
    function balanceOf(address account) external view returns (uint256);
    
    function transfer(address recipient, uint256 amount) external returns (bool);
    
    function mint(uint256) external returns (uint256);

    function exchangeRateCurrent() external returns (uint256);

    function supplyRatePerBlock() external returns (uint256);
}

/*****************
LexLocker Contract
*****************/
contract LexLocker is Context { // deal deposits w/ embedded arbitration + defi earning
    using SafeMath for uint256;
    
    /** ADR Wrapper **/
  mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  address private judgeToken;
    IERC20 public judge = IERC20(judgeToken);

    /** DAI + Wrappers **/
    // $DAI:
  mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }
  address private daiToken = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    IERC20 public dai = IERC20(daiToken);
    // $cDAI:
  function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
  address private cDAItoken = 0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643;
    ICERC20 public cDAI = ICERC20(cDAItoken);
    
    /** USDC + Wrappers **/
    // $USDC:
  function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address private usdcToken = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    IERC20 public usdc = IERC20(usdcToken);
    // $cUSDC:
  function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
  address private cUSDCtoken = 0x39AA39c021dfbaE8faC545936693aC917d5E7563;
    ICERC20 public cUSDC = ICERC20(cUSDCtoken);
    
    /** <$> LXL <$> **/
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  address payable public lexDAO;
    address private vault = address(this);
  function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
  uint8 public version = 1;
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  uint256 public depositFee;
  mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
  uint256 public lxl; // index for registered LexLocker
  function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  string public emoji = "⚖️🌱⚔️";
  function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
  mapping (uint256 => Deposit) public deposit; 

    struct Deposit {  
        address client; 
        address provider;
        uint256 amount;
        uint256 index;
        uint256 termination;
        uint256 wrap;
        string details; 
        bool dai;
        bool locked; 
        bool released;
    }
    	
    // LXL Contract Events:
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  event Log(string, uint256); // log for Compound Finance interactions
  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  event Registered(address indexed client, address indexed provider, uint256 indexed index);  
  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event Released(uint256 indexed index); 
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  event Locked(uint256 indexed index, string indexed details); 
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event Resolved(address indexed resolver, uint256 indexed index, string indexed details); 
    
    constructor (address _judgeToken, address payable _lexDAO) public {
        dai.approve(cDAItoken, uint(-1));
        usdc.approve(cUSDCtoken, uint(-1));
        depositFee = 0.001 ether;
        judgeToken = _judgeToken;
        lexDAO = _lexDAO;
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
} 
    
    /****************
    DEPOSIT FUNCTIONS
    ****************/
    function depositDAI( // register $DAI locker w/ interest via $cDAI; arbitration via lexDAO
        address provider,
        uint256 amount, 
        uint256 termination,
        string memory details) public payable returns (uint) {
        require(msg.value == depositFee);
	    
	    // Amount of current exchange rate from $cDAI to underlying
        uint256 exchangeRateMantissa = cDAI.exchangeRateCurrent();
        emit Log("Exchange Rate: (scaled up by 1e18)", exchangeRateMantissa);
        
        // Amount added to supply balance this block
        uint256 supplyRateMantissa = cDAI.supplyRatePerBlock();
        emit Log("Supply Rate: (scaled up by 1e18)", supplyRateMantissa);
	    
	    dai.transferFrom(_msgSender(), vault, amount); // deposit $DAI
	    uint256 balance = cDAI.balanceOf(vault);
        uint mintResult = cDAI.mint(amount); // wrap into $cDAI and store in vault
        
        uint256 index = lxl.add(1); 
	    lxl = lxl.add(1);
                
            deposit[index] = Deposit( 
                _msgSender(), 
                provider,
                amount,
                index,
                termination,
                cDAI.balanceOf(vault).sub(balance),
                details, 
                true,
                false, 
                false);
        
        address(lexDAO).transfer(msg.value);
        
        emit Registered(_msgSender(), provider, index); 
        
        return mintResult;
    }
    
    function depositUSDC( // register $USDC locker w/ interest via $cUSDC; arbitration via lexDAO
        address provider,
        uint256 amount, 
        uint256 termination,
        string memory details) public payable returns (uint) {
        require(msg.value == depositFee);
	    
	    // Amount of current exchange rate from $cUSDC to underlying
        uint256 exchangeRateMantissa = cUSDC.exchangeRateCurrent();
        emit Log("Exchange Rate: (scaled up by 1e18)", exchangeRateMantissa);
        
        // Amount added to supply balance this block
        uint256 supplyRateMantissa = cUSDC.supplyRatePerBlock();
        emit Log("Supply Rate: (scaled up by 1e18)", supplyRateMantissa);
	    
	    usdc.transferFrom(_msgSender(), vault, amount); // deposit $USDC
	    uint256 balance = cUSDC.balanceOf(vault);
        uint mintResult = cUSDC.mint(amount); // wrap into $cUSDC and store in vault
        
        uint256 index = lxl.add(1); 
	    lxl = lxl.add(1);
                
            deposit[index] = Deposit( 
                _msgSender(), 
                provider,
                amount,
                index,
                termination,
                cUSDC.balanceOf(vault).sub(balance),
                details, 
                false,
                false, 
                false);
        
        address(lexDAO).transfer(msg.value);
        
        emit Registered(_msgSender(), provider, index);
        
        return mintResult; 
    }
    
    function release(uint256 index) public { 
    	Deposit storage depos = deposit[index];
	    require(depos.locked == false); // program safety check / status
	    require(depos.released == false); // program safety check / status
    	require(now <= depos.termination); // program safety check / time
    	require(_msgSender() == depos.client); // program safety check / authorization

        if (depos.dai == true) {
            cDAI.transfer(depos.provider, depos.wrap);
        } else {
            cUSDC.transfer(depos.provider, depos.wrap);
        }
        
        depos.released = true; 
        
	    emit Released(index); 
    }
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
    
    function withdraw(uint256 index) public { // withdraws wrapped deposit if termination time passes
    	Deposit storage depos = deposit[index];
        require(depos.locked == false); // program safety check / status
        require(depos.released == false); // program safety check / status
    	require(now >= depos.termination); // program safety check / time
        
        if (depos.dai == true) {
            cDAI.transfer(depos.client, depos.wrap);
        } else {
            cUSDC.transfer(depos.client, depos.wrap);
        }
        
        depos.released = true; 
        
	    emit Released(index); 
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
    
    /************
    ADR FUNCTIONS
    ************/
    function lock(uint256 index, string memory details) public {
        Deposit storage depos = deposit[index]; 
        require(depos.released == false); // program safety check / status
        require(now <= depos.termination); // program safety check / time
        require(_msgSender() == depos.client || _msgSender() == depos.provider); // program safety check / authorization

	    depos.locked = true; 
	    
	    emit Locked(index, details);
    }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
    
    function resolve(uint256 index, uint256 clientAward, uint256 providerAward, string memory details) public {
        Deposit storage depos = deposit[index];
	    require(depos.locked == true); // program safety check / status
	    require(depos.released == false); // program safety check / status
	    require(clientAward.add(providerAward) == depos.wrap); // program safety check / economics
	    require(judge.balanceOf(_msgSender()) >= 1, "judgeToken balance insufficient");
	    require(_msgSender() != depos.client || _msgSender() != depos.provider);
        
        if (depos.dai == true) {
            cDAI.transfer(depos.client, clientAward); 
            cDAI.transfer(depos.provider, providerAward);
        } else {
            cUSDC.transfer(depos.client, clientAward); 
            cUSDC.transfer(depos.provider, providerAward);
        }
    	
	    depos.released = true; 
	    
	    emit Resolved(_msgSender(), index, details);
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
    
    /*************
    MGMT FUNCTIONS
    *************/
    modifier onlyLexDAO () {
        require(_msgSender() == lexDAO);
        _;
    }
    
    function newDepositFee(uint256 _depositFee) public onlyLexDAO {
        depositFee = _depositFee;
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function newJudgeToken(address _judgeToken) public onlyLexDAO {
        judgeToken = _judgeToken;
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
    
    function newLexDAO(address payable _lexDAO) public onlyLexDAO {
        lexDAO = _lexDAO;
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}