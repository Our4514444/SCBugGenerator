pragma solidity ^0.5.2;

                                                                                        
contract ERC20 {
  function TOTALSUPPLY994() public view returns (uint256);	//inject NONSTANDARD NAMING

  function BALANCEOF119(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING

  function ALLOWANCE378(address _owner, address _spender)	//inject NONSTANDARD NAMING
    public view returns (uint256);

  function TRANSFER654(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

  function APPROVE885(address _spender, uint256 _value)	//inject NONSTANDARD NAMING
    public returns (bool);

  function TRANSFERFROM538(address _from, address _to, uint256 _value)	//inject NONSTANDARD NAMING
    public returns (bool);

  event TRANSFER315(	//inject NONSTANDARD NAMING
    address indexed from,
    address indexed to,
    uint256 value
  );

  event APPROVAL686(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

library SafeMath {
  function MUL227(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function DIV350(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a / b;
    return c;
  }

  function SUB65(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function ADD713(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

contract SCT_Sale {

    using SafeMath for uint256;
    address owner;
    address selfdroptoken;
    address[] public hugeetherinvest;

    mapping (address => bool) public blacklist;

    uint256 public rate = 0;
    uint256 public totalRemaining;
    uint256 public selfdropvalue;

    event DISTR952(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event DISTRFINISHED271();	//inject NONSTANDARD NAMING
    event CROWDSALEFINISHEDD229();	//inject NONSTANDARD NAMING

    bool public distributionFinished;
    bool public crowdsaleFinished;
    
    modifier CANDISTR247() {	//inject NONSTANDARD NAMING
        require(!distributionFinished);
        _;
    }
    modifier CANDISTRCS794() {	//inject NONSTANDARD NAMING
        require(!crowdsaleFinished);
        _;
    }
    modifier ONLYOWNER745() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }
    
    modifier ONLYNOTBLACKLIST634() {	//inject NONSTANDARD NAMING
        require(blacklist[msg.sender] == false);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    function SETSELFDROPTOKEN259(address _selfdroptoken) public ONLYOWNER745 {	//inject NONSTANDARD NAMING
        require (_selfdroptoken != address(0));
        selfdroptoken = _selfdroptoken;
        totalRemaining = ERC20(selfdroptoken).BALANCEOF119(address(this));
    } 
    function TRANSFEROWNERSHIP130(address newOwner) ONLYOWNER745 public {	//inject NONSTANDARD NAMING
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }
    function STARTSALE227() ONLYOWNER745 public returns (bool) {	//inject NONSTANDARD NAMING
        distributionFinished = false;
        return true;
    }
    function STARTCROWDSALE345() ONLYOWNER745 public returns (bool) {	//inject NONSTANDARD NAMING
        crowdsaleFinished = false;
        return true;
    }
    function FINISHSELFDROP754() ONLYOWNER745 CANDISTR247 public returns (bool) {	//inject NONSTANDARD NAMING
        distributionFinished = true;
        emit DISTRFINISHED271();
        return true;
    }
    function FINISHCROWDSALE730() ONLYOWNER745 CANDISTRCS794 public returns (bool) {	//inject NONSTANDARD NAMING
        crowdsaleFinished = true;
        emit CROWDSALEFINISHEDD229();
        return true;
    }
    
    function DISTR49(address _to, uint256 _amount) private returns (bool) {	//inject NONSTANDARD NAMING

        totalRemaining = totalRemaining.SUB65(_amount);
        ERC20(selfdroptoken).TRANSFER654(_to,_amount);
        emit DISTR952(_to, _amount);
        return true;
        
        if (totalRemaining == 0) {
            distributionFinished = true;
            crowdsaleFinished = true;
        }
    }
    function SETSELFDROPVALUE189(uint256 _value) public ONLYOWNER745 {	//inject NONSTANDARD NAMING
        selfdropvalue = _value.MUL227(1e4);
    }
    function () external payable{
        if(msg.value == 0){GETTOKENSS963();}else{GETTOKENS865();}         
    }
    function GETTOKENSS963() CANDISTR247 ONLYNOTBLACKLIST634 internal {	//inject NONSTANDARD NAMING
        
        require (selfdropvalue != 0);
        
        if (selfdropvalue > totalRemaining) {
            selfdropvalue = totalRemaining;
        }
        
        require(selfdropvalue <= totalRemaining);
        
        address investor = msg.sender;
        uint256 toGive = selfdropvalue;
        
        DISTR49(investor, toGive);
        
        if (toGive > 0) {
            blacklist[investor] = true;
        }
    }
    
    function SETETHRATE860(uint _rate) ONLYOWNER745 public {	//inject NONSTANDARD NAMING
        rate = _rate;
    }
    function GETTOKENS865() CANDISTRCS794 public payable {	//inject NONSTANDARD NAMING
        
        require(msg.value >= 0.001 ether);
        require(rate > 0);
        
        uint256 value = msg.value.MUL227(rate);
        
        require(totalRemaining >= value);
        
        address investor = msg.sender;
        uint256 toGive = value;
        
        DISTR49(investor, toGive);
        
        if(msg.value >= 0.1 ether){
            hugeetherinvest.push(msg.sender);
        }
    }
    function WITHDRAWFROMCONTRACT232() public ONLYOWNER745 {	//inject NONSTANDARD NAMING
        ERC20(selfdroptoken).TRANSFER654(owner,ERC20(selfdroptoken).BALANCEOF119(address(this)));
    }
    function WITHDRAW97() public ONLYOWNER745 {	//inject NONSTANDARD NAMING
        msg.sender.transfer(address(this).balance);
    }
}