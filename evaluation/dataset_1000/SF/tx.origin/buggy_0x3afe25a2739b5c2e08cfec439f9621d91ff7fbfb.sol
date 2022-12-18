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
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}

  function name() public view returns(string memory) {
    return _Tokenname;
  }
function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }

  function symbol() public view returns(string memory) {
    return _Tokensymbol;
  }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}

  function decimals() public view returns(uint8) {
    return _Tokendecimals;
  }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
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
    
  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    //The Redeem event is activated when a BULVRD user redeems rewards
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
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
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
    
    function transferAnyERC20Token(address tokenAddress, uint tokens) public returns (bool success) {
        require(owner == msg.sender);
        return IERC20(tokenAddress).transfer(owner, tokens);
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return _balanceOf[_owner];
    }
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}

    function allowance(address _owner, address spender) public view returns (uint256) {
        return _allowed[_owner][spender];
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

    function multiTransfer(address[] memory receivers, uint256[] memory amounts) public {
        for (uint256 i = 0; i < receivers.length; i++) {
            transfer(receivers[i], amounts[i]);
        }
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
  
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        require(spender != address(0));
        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        require(spender != address(0));
        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
        emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
  
     function transfer(address to, uint tokens) public returns (bool success) {
        _balanceOf[msg.sender] = _balanceOf[msg.sender].sub(tokens);
        _balanceOf[to] = _balanceOf[to].add(tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
 
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        _balanceOf[from] = _balanceOf[from].sub(tokens);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(tokens);
        _balanceOf[to] = _balanceOf[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
 
    function approve(address spender, uint tokens) public returns (bool success) {
        _allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
    
    //The owner can transfer ownership
    function transferOwnership(address newOwner) public {
        require(owner == msg.sender);
        require(newOwner != address(0));
        owner = newOwner;
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
    
    //The owner can change the oracle
    //This works only if removeOracle() was never called
    function changeOracle(address newOracle) public {
        require(owner == msg.sender);
        require(oracle != address(0) && newOracle != address(0));
        oracle = newOracle;
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
    
    //The owner can change the maintainer
    function changeMaintainer(address newMaintainer) public {
        require(owner == msg.sender);
        maintainer = newMaintainer;
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
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
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
    
    //This function is a workaround because this.redeemedRewards cannot be public
    //This is the limitation of the current Solidity compiler
    function redeemedRewardsOf(address destination) public view returns(uint256) {
        return redeemedRewards[destination];
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
    
    
    //Helper methods to update rewards
     function updateLimiter(uint256 value) public{
         require(maintainer == msg.sender);
         limiter = value;
     }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
     
     function updateReferral(uint256 value) public {
         require(maintainer == msg.sender);
         referral = value;
     }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
     
     function updateTwitterShare(uint256 value) public {
         require(maintainer == msg.sender);
         twitter_share = value;
     }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
     
     function updateMastodonShare(uint256 value) public {
         require(maintainer == msg.sender);
         mastodon_share = value;
     }
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
     
     function updateArDrive(uint256 value) public {
         require(maintainer == msg.sender);
         ar_drive = value;
     }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
     
     function updateMapDrive(uint256 value) public {
         require(maintainer == msg.sender);
         map_drive = value;
     }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
    
    function updateDashDrive(uint256 value) public {
        require(maintainer == msg.sender);
         dash_drive = value;
     }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
     
     function updateObd2Drive(uint256 value) public {
         require(maintainer == msg.sender);
         odb2_drive = value;
     }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
     
     function updatePolice(uint256 value) public {
         require(maintainer == msg.sender);
         police = value;
     }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
     
     function updateClosure(uint256 value) public {
        require(maintainer == msg.sender);
         closure = value;
     }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
     
     function updateHazard(uint256 value) public {
         require(maintainer == msg.sender);
         hazard = value;
     }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
     
     function updateTraffic(uint256 value) public {
         require(maintainer == msg.sender);
         traffic = value;
     }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
     
     function updateAccident(uint256 value) public {
         require(maintainer == msg.sender);
         accident = value;
     }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
     
     function updateSpeedSign(uint256 value) public {
         require(maintainer == msg.sender);
         speed_sign = value;
     }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
     
     function updateBaseReport(uint256 value) public {
         require(maintainer == msg.sender);
         base_report = value;
     }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
     
     function updateValidatedPoi(uint256 value) public {
         require(maintainer == msg.sender);
         validated_poi = value;
     }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
     
     function updateReportInit(uint256 value) public {
         require(maintainer == msg.sender);
         report_init = value;
     }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
}