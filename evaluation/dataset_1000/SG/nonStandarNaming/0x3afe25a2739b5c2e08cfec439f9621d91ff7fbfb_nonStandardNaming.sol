pragma solidity ^0.5.10;

interface IERC20 {
  function TOTALSUPPLY839() external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF298(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
  function ALLOWANCE182(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER790(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE843(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM40(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

  event TRANSFER951(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
  event APPROVAL585(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
                                                                                                                                                                                                                           
    function ADD305(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB86(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL961(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV940(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

  function NAME582() public view returns(string memory) {	//inject NONSTANDARD NAMING
    return _Tokenname;
  }

  function SYMBOL131() public view returns(string memory) {	//inject NONSTANDARD NAMING
    return _Tokensymbol;
  }

  function DECIMALS27() public view returns(uint8) {	//inject NONSTANDARD NAMING
    return _Tokendecimals;
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
    
    string public constant tokensymbol581 = "BLVD";	//inject NONSTANDARD NAMING
    string public constant tokenname910 = "BULVRD";	//inject NONSTANDARD NAMING
    uint8 public constant tokendecimals781 = 18;	//inject NONSTANDARD NAMING
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
    
    event TRANSFER951(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
    event APPROVAL585(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING
    //The Redeem event is activated when a BULVRD user redeems rewards
    event REDEEMREWARDS701(address indexed addr, uint256 rewards);	//inject NONSTANDARD NAMING
    
    constructor() public ERC20Detailed(tokenname910, tokensymbol581, tokendecimals781) {
        owner = msg.sender;
        maintainer = msg.sender;
        oracle = msg.sender;
        maxMintable = 50000000000 * 10**uint256(tokendecimals781);
        //initial grant
        REDEEMREWARDS459(87500000000 * 10**uint256(tokendecimals781), owner);
    }
    
    function TRANSFERANYERC20TOKEN185(address tokenAddress, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(owner == msg.sender);
        return IERC20(tokenAddress).TRANSFER790(owner, tokens);
    }
    
    function TOTALSUPPLY839() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF298(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balanceOf[_owner];
    }

    function ALLOWANCE182(address _owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[_owner][spender];
    }

    function MULTITRANSFER853(address[] memory receivers, uint256[] memory amounts) public {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < receivers.length; i++) {
            TRANSFER790(receivers[i], amounts[i]);
        }
    }
  
    function INCREASEALLOWANCE983(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].ADD305(addedValue));
        emit APPROVAL585(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

    function DECREASEALLOWANCE199(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].SUB86(subtractedValue));
        emit APPROVAL585(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }
  
     function TRANSFER790(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        _balanceOf[msg.sender] = _balanceOf[msg.sender].SUB86(tokens);
        _balanceOf[to] = _balanceOf[to].ADD305(tokens);
        emit TRANSFER951(msg.sender, to, tokens);
        return true;
    }
 
    function TRANSFERFROM40(address from, address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        _balanceOf[from] = _balanceOf[from].SUB86(tokens);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB86(tokens);
        _balanceOf[to] = _balanceOf[to].ADD305(tokens);
        emit TRANSFER951(from, to, tokens);
        return true;
    }
 
    function APPROVE843(address spender, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        _allowed[msg.sender][spender] = tokens;
        emit APPROVAL585(msg.sender, spender, tokens);
        return true;
    }
    
    //The owner can transfer ownership
    function TRANSFEROWNERSHIP341(address newOwner) public {	//inject NONSTANDARD NAMING
        require(owner == msg.sender);
        require(newOwner != address(0));
        owner = newOwner;
    }
    
    //The owner can change the oracle
    //This works only if removeOracle() was never called
    function CHANGEORACLE813(address newOracle) public {	//inject NONSTANDARD NAMING
        require(owner == msg.sender);
        require(oracle != address(0) && newOracle != address(0));
        oracle = newOracle;
    }
    
    //The owner can change the maintainer
    function CHANGEMAINTAINER848(address newMaintainer) public {	//inject NONSTANDARD NAMING
        require(owner == msg.sender);
        maintainer = newMaintainer;
    }
    
    //Allow address to redeem rewards verified from BULVRD
    function REDEEMREWARDS459(uint256 rewards, address destination) public {	//inject NONSTANDARD NAMING
        
        //Must be oracle 
        require(msg.sender == oracle, "Must be Oracle to complete");

        //Make sure we have moved on since the last transaction of the give
        require(block.number > latestWithdrawBlock[destination], "Have not moved on from last block");
        
        //rewards to token conversion
        uint256 reward = SafeMath.DIV940(rewards, limiter);
        
        //The amount of rewards needs to be more than the previous redeemed amount
        require(reward > redeemedRewards[destination], "Has not earned since last redeem");
        
        //check if reward amount can be redeemed against supply
        uint256 total = SafeMath.ADD305(_totalSupply, reward);
        require(total <= maxMintable, "Max Mintable Reached");

        //The new rewards that is available to be redeemed
        uint256 newUserRewards = SafeMath.SUB86(reward, redeemedRewards[destination]);
        
        //The user's rewards balance is updated with the new reward
        _balanceOf[destination] = SafeMath.ADD305(_balanceOf[destination], newUserRewards);
        
        //The total supply (ERC20) is updated
        _totalSupply = SafeMath.ADD305(_totalSupply, newUserRewards);
        
        //The amount of rewards redeemed by a user is updated
        redeemedRewards[destination] = reward;
        
        //Set block status for user transaction
        latestWithdrawBlock[destination] = block.number;
        
        //The Redeem event is triggered
        emit REDEEMREWARDS701(destination, newUserRewards);
        //Update token holder balance on chain explorers
        emit TRANSFER951(oracle, destination, newUserRewards);
    }
    
    //This function is a workaround because this.redeemedRewards cannot be public
    //This is the limitation of the current Solidity compiler
    function REDEEMEDREWARDSOF248(address destination) public view returns(uint256) {	//inject NONSTANDARD NAMING
        return redeemedRewards[destination];
    }
    
    
    //Helper methods to update rewards
     function UPDATELIMITER651(uint256 value) public{	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         limiter = value;
     }
     
     function UPDATEREFERRAL204(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         referral = value;
     }
     
     function UPDATETWITTERSHARE736(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         twitter_share = value;
     }
     
     function UPDATEMASTODONSHARE996(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         mastodon_share = value;
     }
     
     function UPDATEARDRIVE863(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         ar_drive = value;
     }
     
     function UPDATEMAPDRIVE415(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         map_drive = value;
     }
    
    function UPDATEDASHDRIVE736(uint256 value) public {	//inject NONSTANDARD NAMING
        require(maintainer == msg.sender);
         dash_drive = value;
     }
     
     function UPDATEOBD2DRIVE207(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         odb2_drive = value;
     }
     
     function UPDATEPOLICE532(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         police = value;
     }
     
     function UPDATECLOSURE706(uint256 value) public {	//inject NONSTANDARD NAMING
        require(maintainer == msg.sender);
         closure = value;
     }
     
     function UPDATEHAZARD639(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         hazard = value;
     }
     
     function UPDATETRAFFIC506(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         traffic = value;
     }
     
     function UPDATEACCIDENT591(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         accident = value;
     }
     
     function UPDATESPEEDSIGN720(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         speed_sign = value;
     }
     
     function UPDATEBASEREPORT223(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         base_report = value;
     }
     
     function UPDATEVALIDATEDPOI352(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         validated_poi = value;
     }
     
     function UPDATEREPORTINIT532(uint256 value) public {	//inject NONSTANDARD NAMING
         require(maintainer == msg.sender);
         report_init = value;
     }
}