pragma solidity ^0.5.10;

interface IERC20 {
  function totalSupply() external view returns (uint256);
  function balanceOf(address who) external view returns (uint256);
  function allowance(address owner, address spender) external view returns (uint256);
  function transfer(address to, uint256 value) external returns (bool);
  function approve(address spender, uint256 value) external returns (bool);
  function transferFrom(address from, address to, uint256 value) external returns (bool);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

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
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
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
  
}

contract ERC20Detailed is IERC20 {

  uint8 private _Tokendecimals;
  string private _Tokenname;
  string private _Tokensymbol;

  constructor(string memory name, string memory symbol, uint8 decimals) public {
   
   _Tokendecimals = decimals;
    _Tokenname = name;
    _Tokensymbol = symbol;
    
  }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

  function name() public view returns(string memory) {
    return _Tokenname;
  }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

  function symbol() public view returns(string memory) {
    return _Tokensymbol;
  }
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  function decimals() public view returns(uint8) {
    return _Tokendecimals;
  }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
 
}

contract BLVD is ERC20Detailed {
    //ERC20 contract for rewards within the BULVRD ecosystem
    //https://bulvrdapp.com

    using SafeMath for uint256;

    //The oracle checks the authenticity of the rewards
    address public oracle;
    
    //The maintainer is in charge of keeping the oracle running
    address public maintainer;
    
    //The owner can replace the oracle or maintainer if they are compromised
    address public owner;

    //Set max tokens that can be minted
    uint256 public maxMintable;

    mapping(address => uint256) private _balanceOf;
    mapping(address => mapping (address => uint256)) private _allowed;
    
    string public constant tokenSymbol = "BLVD";
    string public constant tokenName = "BULVRD";
    uint8 public constant tokenDecimals = 18;
    uint256 public _totalSupply = 0;
    
    //Constant values for rewards
    uint256 public limiter = 5;
    uint256 public referral = 35;
    uint256 public ar_drive = 15;
    uint256 public closure = 15;
    uint256 public map_drive = 10;
    uint256 public dash_drive = 10;
    uint256 public odb2_drive = 10;
    uint256 public police = 10;
    uint256 public hazard = 10;
    uint256 public accident = 10;
    uint256 public traffic = 5;
  function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
  uint256 public twitter_share = 5;
  function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  uint256 public mastodon_share = 5;
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  uint256 public base_report = 5;
  function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 public validated_poi = 5;
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  uint256 public speed_sign = 1;
  bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  uint256 public report_init = 1;
 
    //Keep track of BULVRD users and their redeemed rewards
  function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
  mapping(address => uint256) redeemedRewards;
  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  mapping(address => uint256) latestWithdrawBlock;
    
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    //The Redeem event is activated when a BULVRD user redeems rewards
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event RedeemRewards(address indexed addr, uint256 rewards);
    
    constructor() public ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) {
        owner = msg.sender;
        maintainer = msg.sender;
        oracle = msg.sender;
        maxMintable = 50000000000 * 10**uint256(tokenDecimals);
        //initial grant
        redeemRewards(87500000000 * 10**uint256(tokenDecimals), owner);
    }
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
    
    function transferAnyERC20Token(address tokenAddress, uint tokens) public returns (bool success) {
        require(owner == msg.sender);
        return IERC20(tokenAddress).transfer(owner, tokens);
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

    function balanceOf(address _owner) public view returns (uint256) {
        return _balanceOf[_owner];
    }
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }

    function allowance(address _owner, address spender) public view returns (uint256) {
        return _allowed[_owner][spender];
    }
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }

    function multiTransfer(address[] memory receivers, uint256[] memory amounts) public {
        for (uint256 i = 0; i < receivers.length; i++) {
            transfer(receivers[i], amounts[i]);
        }
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        require(spender != address(0));
        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        require(spender != address(0));
        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  
     function transfer(address to, uint tokens) public returns (bool success) {
        _balanceOf[msg.sender] = _balanceOf[msg.sender].sub(tokens);
        _balanceOf[to] = _balanceOf[to].add(tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
 
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        _balanceOf[from] = _balanceOf[from].sub(tokens);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(tokens);
        _balanceOf[to] = _balanceOf[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
 
    function approve(address spender, uint tokens) public returns (bool success) {
        _allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    
    //The owner can transfer ownership
    function transferOwnership(address newOwner) public {
        require(owner == msg.sender);
        require(newOwner != address(0));
        owner = newOwner;
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
    
    //The owner can change the oracle
    //This works only if removeOracle() was never called
    function changeOracle(address newOracle) public {
        require(owner == msg.sender);
        require(oracle != address(0) && newOracle != address(0));
        oracle = newOracle;
    }
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    
    //The owner can change the maintainer
    function changeMaintainer(address newMaintainer) public {
        require(owner == msg.sender);
        maintainer = newMaintainer;
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
    
    //Allow address to redeem rewards verified from BULVRD
    function redeemRewards(uint256 rewards, address destination) public {
        
        //Must be oracle 
        require(msg.sender == oracle, "Must be Oracle to complete");

        //Make sure we have moved on since the last transaction of the give
        require(block.number > latestWithdrawBlock[destination], "Have not moved on from last block");
        
        //rewards to token conversion
        uint256 reward = SafeMath.div(rewards, limiter);
        
        //The amount of rewards needs to be more than the previous redeemed amount
        require(reward > redeemedRewards[destination], "Has not earned since last redeem");
        
        //check if reward amount can be redeemed against supply
        uint256 total = SafeMath.add(_totalSupply, reward);
        require(total <= maxMintable, "Max Mintable Reached");

        //The new rewards that is available to be redeemed
        uint256 newUserRewards = SafeMath.sub(reward, redeemedRewards[destination]);
        
        //The user's rewards balance is updated with the new reward
        _balanceOf[destination] = SafeMath.add(_balanceOf[destination], newUserRewards);
        
        //The total supply (ERC20) is updated
        _totalSupply = SafeMath.add(_totalSupply, newUserRewards);
        
        //The amount of rewards redeemed by a user is updated
        redeemedRewards[destination] = reward;
        
        //Set block status for user transaction
        latestWithdrawBlock[destination] = block.number;
        
        //The Redeem event is triggered
        emit RedeemRewards(destination, newUserRewards);
        //Update token holder balance on chain explorers
        emit Transfer(oracle, destination, newUserRewards);
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
    
    //This function is a workaround because this.redeemedRewards cannot be public
    //This is the limitation of the current Solidity compiler
    function redeemedRewardsOf(address destination) public view returns(uint256) {
        return redeemedRewards[destination];
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
    
    
    //Helper methods to update rewards
     function updateLimiter(uint256 value) public{
         require(maintainer == msg.sender);
         limiter = value;
     }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
     
     function updateReferral(uint256 value) public {
         require(maintainer == msg.sender);
         referral = value;
     }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
     
     function updateTwitterShare(uint256 value) public {
         require(maintainer == msg.sender);
         twitter_share = value;
     }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
     
     function updateMastodonShare(uint256 value) public {
         require(maintainer == msg.sender);
         mastodon_share = value;
     }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
     
     function updateArDrive(uint256 value) public {
         require(maintainer == msg.sender);
         ar_drive = value;
     }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
     
     function updateMapDrive(uint256 value) public {
         require(maintainer == msg.sender);
         map_drive = value;
     }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    
    function updateDashDrive(uint256 value) public {
        require(maintainer == msg.sender);
         dash_drive = value;
     }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
     
     function updateObd2Drive(uint256 value) public {
         require(maintainer == msg.sender);
         odb2_drive = value;
     }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
     
     function updatePolice(uint256 value) public {
         require(maintainer == msg.sender);
         police = value;
     }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
     
     function updateClosure(uint256 value) public {
        require(maintainer == msg.sender);
         closure = value;
     }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
     
     function updateHazard(uint256 value) public {
         require(maintainer == msg.sender);
         hazard = value;
     }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
     
     function updateTraffic(uint256 value) public {
         require(maintainer == msg.sender);
         traffic = value;
     }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
     
     function updateAccident(uint256 value) public {
         require(maintainer == msg.sender);
         accident = value;
     }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
     
     function updateSpeedSign(uint256 value) public {
         require(maintainer == msg.sender);
         speed_sign = value;
     }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
     
     function updateBaseReport(uint256 value) public {
         require(maintainer == msg.sender);
         base_report = value;
     }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
     
     function updateValidatedPoi(uint256 value) public {
         require(maintainer == msg.sender);
         validated_poi = value;
     }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
     
     function updateReportInit(uint256 value) public {
         require(maintainer == msg.sender);
         report_init = value;
     }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
}