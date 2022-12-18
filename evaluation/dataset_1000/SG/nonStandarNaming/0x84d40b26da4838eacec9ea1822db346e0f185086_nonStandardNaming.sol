pragma solidity ^0.5.2;

// File: zeppelin-solidity/contracts/ownership/Ownable.sol

                                                                                                                                                                                             
contract Ownable {
  address public owner;


  event OWNERSHIPTRANSFERRED494(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING


                                                                                                                   
  constructor() public {
    owner = msg.sender;
  }


                                                                           
  modifier ONLYOWNER496() {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }


                                                                                                                                                            
  function TRANSFEROWNERSHIP332(address newOwner) public ONLYOWNER496 {	//inject NONSTANDARD NAMING
    require(newOwner != address(0));
    emit OWNERSHIPTRANSFERRED494(owner, newOwner);
    owner = newOwner;
  }

}

// File: zeppelin-solidity/contracts/lifecycle/Pausable.sol

                                                                                                                
contract Pausable is Ownable {
  event PAUSE877();	//inject NONSTANDARD NAMING
  event UNPAUSE628();	//inject NONSTANDARD NAMING

  bool public paused = false;


                                                                                                
  modifier WHENNOTPAUSED943() {	//inject NONSTANDARD NAMING
    require(!paused);
    _;
  }

                                                                                            
  modifier WHENPAUSED815() {	//inject NONSTANDARD NAMING
    require(paused);
    _;
  }

                                                                          
  function PAUSE52() ONLYOWNER496 WHENNOTPAUSED943 public {	//inject NONSTANDARD NAMING
    paused = true;
    emit PAUSE877();
  }

                                                                             
  function UNPAUSE582() ONLYOWNER496 WHENPAUSED815 public {	//inject NONSTANDARD NAMING
    paused = false;
    emit UNPAUSE628();
  }
}

// File: zeppelin-solidity/contracts/math/SafeMath.sol

                                                                                         
library SafeMath {
  function MUL561(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function DIV870(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function SUB390(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function ADD86(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

// File: zeppelin-solidity/contracts/token/ERC20Basic.sol

                                                                                                                               
contract ERC20Basic {
  uint256 public totalSupply;
  function BALANCEOF449(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER106(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event TRANSFER57(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

// File: zeppelin-solidity/contracts/token/BasicToken.sol

                                                                                         
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) balances;

                                                                                                                                                     
  function TRANSFER106(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].SUB390(_value);
    balances[_to] = balances[_to].ADD86(_value);
    emit TRANSFER57(msg.sender, _to, _value);
    return true;
  }

                                                                                                                                                                                                     
  function BALANCEOF449(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
    return balances[_owner];
  }

}

// File: zeppelin-solidity/contracts/token/ERC20.sol

                                                                                        
contract ERC20 is ERC20Basic {
  function ALLOWANCE478(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFERFROM402(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE530(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event APPROVAL370(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: zeppelin-solidity/contracts/token/StandardToken.sol

                                                                                                                                                                                                                                                                          
contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;


                                                                                                                                                                                                                                                                              
  function TRANSFERFROM402(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].SUB390(_value);
    balances[_to] = balances[_to].ADD86(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB390(_value);
    emit TRANSFER57(_from, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function APPROVE530(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = _value;
    emit APPROVAL370(msg.sender, _spender, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                          
  function ALLOWANCE478(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return allowed[_owner][_spender];
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function INCREASEAPPROVAL938(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD86(_addedValue);
    emit APPROVAL370(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function DECREASEAPPROVAL958(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    uint oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.SUB390(_subtractedValue);
    }
    emit APPROVAL370(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}

// File: zeppelin-solidity/contracts/token/PausableToken.sol

                                                                                            

contract PausableToken is StandardToken, Pausable {

  function TRANSFER106(address _to, uint256 _value) public WHENNOTPAUSED943 returns (bool) {	//inject NONSTANDARD NAMING
    return super.TRANSFER106(_to, _value);
  }

  function TRANSFERFROM402(address _from, address _to, uint256 _value) public WHENNOTPAUSED943 returns (bool) {	//inject NONSTANDARD NAMING
    return super.TRANSFERFROM402(_from, _to, _value);
  }

  function APPROVE530(address _spender, uint256 _value) public WHENNOTPAUSED943 returns (bool) {	//inject NONSTANDARD NAMING
    return super.APPROVE530(_spender, _value);
  }

  function INCREASEAPPROVAL938(address _spender, uint _addedValue) public WHENNOTPAUSED943 returns (bool success) {	//inject NONSTANDARD NAMING
    return super.INCREASEAPPROVAL938(_spender, _addedValue);
  }

  function DECREASEAPPROVAL958(address _spender, uint _subtractedValue) public WHENNOTPAUSED943 returns (bool success) {	//inject NONSTANDARD NAMING
    return super.DECREASEAPPROVAL958(_spender, _subtractedValue);
  }
}



contract MQMTOKEN is PausableToken {
    using SafeMath for uint;

                                      
    string public constant name884 = "MQM TOKEN";	//inject NONSTANDARD NAMING
    string public constant symbol643 = "MQM";	//inject NONSTANDARD NAMING
    uint public constant decimals871 = 18;	//inject NONSTANDARD NAMING

                                               
    mapping (address => uint) public lockedBalances;

                  
    bool public claimedFlag;

                               


    modifier CANCLAIMED566 {	//inject NONSTANDARD NAMING
        require(claimedFlag == true);
        _;
    }


    modifier VALIDADDRESS865( address addr ) {	//inject NONSTANDARD NAMING
        require(addr != address(0x0));
        require(addr != address(this));
        _;
    }

                                                                                                                         
    constructor(address _admin, uint _TotalSupply)
        public
        VALIDADDRESS865(_admin)
        {
        totalSupply = _TotalSupply;
        claimedFlag = false;
        TRANSFEROWNERSHIP332(_admin);
		balances[msg.sender] = balances[msg.sender].ADD86(_TotalSupply);
    }

    function INCREASE990(uint amount) public ONLYOWNER496 {	//inject NONSTANDARD NAMING
        balances[msg.sender] = balances[msg.sender].ADD86(amount);
        totalSupply = totalSupply.ADD86(amount);
    }
	
	 function DECREASE465(uint amount) public ONLYOWNER496 {	//inject NONSTANDARD NAMING
        balances[msg.sender] = balances[msg.sender].SUB390(amount);
        totalSupply = totalSupply.SUB390(amount);
    }

 



    function SETCLAIMEDFLAG62(bool flag)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER496
    {
        claimedFlag = flag;
    }

                                       

                                                                                 
    function CLAIMTOKENS263(address[] calldata receipents)	//inject NONSTANDARD NAMING
        external
        CANCLAIMED566
    {
        for (uint i = 0; i < receipents.length; i++) {
            address receipent = receipents[i];
            //balances[receipent] = balances[receipent].add(lockedBalances[receipent]);
            balances[msg.sender] = balances[msg.sender].ADD86(lockedBalances[receipent]);
            TRANSFER106(receipent, lockedBalances[receipent]);
            lockedBalances[receipent] = 0;
        }
    }
}