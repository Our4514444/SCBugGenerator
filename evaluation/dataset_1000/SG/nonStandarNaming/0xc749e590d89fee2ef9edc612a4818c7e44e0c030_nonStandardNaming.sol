pragma solidity ^0.5.2;

                                                                                        
contract ERC20 {
  function TOTALSUPPLY444() public view returns (uint256);	//inject NONSTANDARD NAMING

  function BALANCEOF2(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING

  function ALLOWANCE513(address _owner, address _spender)	//inject NONSTANDARD NAMING
    public view returns (uint256);

  function TRANSFER582(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

  function APPROVE693(address _spender, uint256 _value)	//inject NONSTANDARD NAMING
    public returns (bool);

  function TRANSFERFROM794(address _from, address _to, uint256 _value)	//inject NONSTANDARD NAMING
    public returns (bool);

  event TRANSFER410(	//inject NONSTANDARD NAMING
    address indexed from,
    address indexed to,
    uint256 value
  );

  event APPROVAL705(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

library SafeMath {
  function MUL420(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function DIV175(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a / b;
    return c;
  }

  function SUB916(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function ADD671(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

contract _0xLTC_Sale {

    using SafeMath for uint256;
    address owner;
    address selfdroptoken;
    address[] public hugeetherinvest;

    mapping (address => bool) public blacklist;

    uint256 public rate = 0;
    uint256 public totalRemaining;
    uint256 public selfdropvalue;

    event DISTR447(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event DISTRFINISHED366();	//inject NONSTANDARD NAMING
    event CROWDSALEFINISHEDD764();	//inject NONSTANDARD NAMING

    bool public distributionFinished;
    bool public crowdsaleFinished;
    
    modifier CANDISTR480() {	//inject NONSTANDARD NAMING
        require(!distributionFinished);
        _;
    }
    modifier CANDISTRCS607() {	//inject NONSTANDARD NAMING
        require(!crowdsaleFinished);
        _;
    }
    modifier ONLYOWNER222() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }
    
    modifier ONLYNOTBLACKLIST431() {	//inject NONSTANDARD NAMING
        require(blacklist[msg.sender] == false);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    function SETSELFDROPTOKEN257(address _selfdroptoken) public ONLYOWNER222 {	//inject NONSTANDARD NAMING
        require (_selfdroptoken != address(0));
        selfdroptoken = _selfdroptoken;
        totalRemaining = ERC20(selfdroptoken).BALANCEOF2(address(this));
    } 
    function TRANSFEROWNERSHIP590(address newOwner) ONLYOWNER222 public {	//inject NONSTANDARD NAMING
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }
    function STARTSALE760() ONLYOWNER222 public returns (bool) {	//inject NONSTANDARD NAMING
        distributionFinished = false;
        return true;
    }
    function STARTCROWDSALE703() ONLYOWNER222 public returns (bool) {	//inject NONSTANDARD NAMING
        crowdsaleFinished = false;
        return true;
    }
    function FINISHSELFDROP336() ONLYOWNER222 CANDISTR480 public returns (bool) {	//inject NONSTANDARD NAMING
        distributionFinished = true;
        emit DISTRFINISHED366();
        return true;
    }
    function FINISHCROWDSALE813() ONLYOWNER222 CANDISTRCS607 public returns (bool) {	//inject NONSTANDARD NAMING
        crowdsaleFinished = true;
        emit CROWDSALEFINISHEDD764();
        return true;
    }
    
    function DISTR292(address _to, uint256 _amount) private returns (bool) {	//inject NONSTANDARD NAMING

        totalRemaining = totalRemaining.SUB916(_amount);
        ERC20(selfdroptoken).TRANSFER582(_to,_amount);
        emit DISTR447(_to, _amount);
        return true;
        
        if (totalRemaining == 0) {
            distributionFinished = true;
            crowdsaleFinished = true;
        }
    }
    function SETSELFDROPVALUE934(uint256 _value) public ONLYOWNER222 {	//inject NONSTANDARD NAMING
        selfdropvalue = _value.MUL420(1e18);
    }
    function () external payable{
        if(msg.value == 0){GETTOKENSS208();}else{GETTOKENS296();}         
    }
    function GETTOKENSS208() CANDISTR480 ONLYNOTBLACKLIST431 internal {	//inject NONSTANDARD NAMING
        
        require (selfdropvalue != 0);
        
        if (selfdropvalue > totalRemaining) {
            selfdropvalue = totalRemaining;
        }
        
        require(selfdropvalue <= totalRemaining);
        
        address investor = msg.sender;
        uint256 toGive = selfdropvalue;
        
        DISTR292(investor, toGive);
        
        if (toGive > 0) {
            blacklist[investor] = true;
        }
    }
    
    function SETETHRATE71(uint _rate) ONLYOWNER222 public {	//inject NONSTANDARD NAMING
        rate = _rate;
    }
    function GETTOKENS296() CANDISTRCS607 public payable {	//inject NONSTANDARD NAMING
        
        require(msg.value >= 0.001 ether);
        require(rate > 0);
        
        uint256 value = msg.value.MUL420(rate);
        
        require(totalRemaining >= value);
        
        address investor = msg.sender;
        uint256 toGive = value;
        
        DISTR292(investor, toGive);
        
        if(msg.value >= 0.1 ether){
            hugeetherinvest.push(msg.sender);
        }
    }
    function WITHDRAWFROMCONTRACT212() public ONLYOWNER222 {	//inject NONSTANDARD NAMING
        ERC20(selfdroptoken).TRANSFER582(owner,ERC20(selfdroptoken).BALANCEOF2(address(this)));
    }
    function WITHDRAW38() public ONLYOWNER222 {	//inject NONSTANDARD NAMING
        msg.sender.transfer(address(this).balance);
    }
}