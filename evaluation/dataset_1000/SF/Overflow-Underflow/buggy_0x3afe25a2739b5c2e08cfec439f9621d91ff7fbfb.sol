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
function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  function name() public view returns(string memory) {
    return _Tokenname;
  }
mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }

  function symbol() public view returns(string memory) {
    return _Tokensymbol;
  }
mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }

  function decimals() public view returns(uint8) {
    return _Tokendecimals;
  }
function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
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
    uint256 public twitter_share = 5;
    uint256 public mastodon_share = 5;
    uint256 public base_report = 5;
    uint256 public validated_poi = 5;
    uint256 public speed_sign = 1;
    uint256 public report_init = 1;
 
    //Keep track of BULVRD users and their redeemed rewards
    mapping(address => uint256) redeemedRewards;
    mapping(address => uint256) latestWithdrawBlock;
    
  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    //The Redeem event is activated when a BULVRD user redeems rewards
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event RedeemRewards(address indexed addr, uint256 rewards);
    
    constructor() public ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) {
        owner = msg.sender;
        maintainer = msg.sender;
        oracle = msg.sender;
        maxMintable = 50000000000 * 10**uint256(tokenDecimals);
        //initial grant
        redeemRewards(87500000000 * 10**uint256(tokenDecimals), owner);
    }
mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }
    
    function transferAnyERC20Token(address tokenAddress, uint tokens) public returns (bool success) {
        require(owner == msg.sender);
        return IERC20(tokenAddress).transfer(owner, tokens);
    }
function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}
    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }

    function balanceOf(address _owner) public view returns (uint256) {
        return _balanceOf[_owner];
    }
mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }

    function allowance(address _owner, address spender) public view returns (uint256) {
        return _allowed[_owner][spender];
    }
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function multiTransfer(address[] memory receivers, uint256[] memory amounts) public {
        for (uint256 i = 0; i < receivers.length; i++) {
            transfer(receivers[i], amounts[i]);
        }
    }
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        require(spender != address(0));
        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        require(spender != address(0));
        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }
  
     function transfer(address to, uint tokens) public returns (bool success) {
        _balanceOf[msg.sender] = _balanceOf[msg.sender].sub(tokens);
        _balanceOf[to] = _balanceOf[to].add(tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }
 
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        _balanceOf[from] = _balanceOf[from].sub(tokens);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(tokens);
        _balanceOf[to] = _balanceOf[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
 
    function approve(address spender, uint tokens) public returns (bool success) {
        _allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
    
    //The owner can transfer ownership
    function transferOwnership(address newOwner) public {
        require(owner == msg.sender);
        require(newOwner != address(0));
        owner = newOwner;
    }
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }
    
    //The owner can change the oracle
    //This works only if removeOracle() was never called
    function changeOracle(address newOracle) public {
        require(owner == msg.sender);
        require(oracle != address(0) && newOracle != address(0));
        oracle = newOracle;
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
    
    //The owner can change the maintainer
    function changeMaintainer(address newMaintainer) public {
        require(owner == msg.sender);
        maintainer = newMaintainer;
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
    
    //This function is a workaround because this.redeemedRewards cannot be public
    //This is the limitation of the current Solidity compiler
    function redeemedRewardsOf(address destination) public view returns(uint256) {
        return redeemedRewards[destination];
    }
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
    
    
    //Helper methods to update rewards
     function updateLimiter(uint256 value) public{
         require(maintainer == msg.sender);
         limiter = value;
     }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
     
     function updateReferral(uint256 value) public {
         require(maintainer == msg.sender);
         referral = value;
     }
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
     
     function updateTwitterShare(uint256 value) public {
         require(maintainer == msg.sender);
         twitter_share = value;
     }
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
     
     function updateMastodonShare(uint256 value) public {
         require(maintainer == msg.sender);
         mastodon_share = value;
     }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
     
     function updateArDrive(uint256 value) public {
         require(maintainer == msg.sender);
         ar_drive = value;
     }
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
     
     function updateMapDrive(uint256 value) public {
         require(maintainer == msg.sender);
         map_drive = value;
     }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function updateDashDrive(uint256 value) public {
        require(maintainer == msg.sender);
         dash_drive = value;
     }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
     
     function updateObd2Drive(uint256 value) public {
         require(maintainer == msg.sender);
         odb2_drive = value;
     }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
     
     function updatePolice(uint256 value) public {
         require(maintainer == msg.sender);
         police = value;
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
     
     function updateClosure(uint256 value) public {
        require(maintainer == msg.sender);
         closure = value;
     }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
     
     function updateHazard(uint256 value) public {
         require(maintainer == msg.sender);
         hazard = value;
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
     
     function updateTraffic(uint256 value) public {
         require(maintainer == msg.sender);
         traffic = value;
     }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
     
     function updateAccident(uint256 value) public {
         require(maintainer == msg.sender);
         accident = value;
     }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
     
     function updateSpeedSign(uint256 value) public {
         require(maintainer == msg.sender);
         speed_sign = value;
     }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
     
     function updateBaseReport(uint256 value) public {
         require(maintainer == msg.sender);
         base_report = value;
     }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
     
     function updateValidatedPoi(uint256 value) public {
         require(maintainer == msg.sender);
         validated_poi = value;
     }
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
     
     function updateReportInit(uint256 value) public {
         require(maintainer == msg.sender);
         report_init = value;
     }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
}