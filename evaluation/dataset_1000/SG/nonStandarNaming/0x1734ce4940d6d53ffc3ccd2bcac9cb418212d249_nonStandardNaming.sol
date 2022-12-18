pragma solidity ^0.5.2;

                                                                                         
library SafeMath {

                                                               
  function MUL682(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

                                                                             
  function DIV302(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

                                                                                                            
  function SUB277(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

                                                         
  function ADD882(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

                                                                                                                               
contract ERC20Basic {
  function TOTALSUPPLY954() public view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF307(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER275(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event TRANSFER180(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                        
contract ERC20 is ERC20Basic {
  function ALLOWANCE392(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFERFROM476(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE779(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event APPROVAL906(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                         
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) balances;

  uint256 totalSupply_;

                                                       
  function TOTALSUPPLY954() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return totalSupply_;
  }

                                                                                                                                                     
  function TRANSFER275(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].SUB277(_value);
    balances[_to] = balances[_to].ADD882(_value);
    emit TRANSFER180(msg.sender, _to, _value);
    return true;
  }

                                                                                                                                                                                                     
  function BALANCEOF307(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
    return balances[_owner];
  }

}

                                                                                                                                                                                                                                                                          
contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;


                                                                                                                                                                                                                                                                              
  function TRANSFERFROM476(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].SUB277(_value);
    balances[_to] = balances[_to].ADD882(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB277(_value);
    emit TRANSFER180(_from, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function APPROVE779(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = _value;
    emit APPROVAL906(msg.sender, _spender, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                          
  function ALLOWANCE392(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return allowed[_owner][_spender];
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function INCREASEAPPROVAL90(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD882(_addedValue);
    emit APPROVAL906(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function DECREASEAPPROVAL718(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    uint oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.SUB277(_subtractedValue);
    }
    emit APPROVAL906(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}

                                                                                                                                                                                                                                             
contract DoorBTC is StandardToken {

  string public constant name194 = "DoorBTC Coin"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
  string public constant symbol914 = "DC"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
  uint8 public constant decimals706 = 18; // solium-disable-line uppercase	//inject NONSTANDARD NAMING

  uint256 public constant initial_supply543 = (10 ** 8) * (10 ** uint256(decimals706));	//inject NONSTANDARD NAMING

                                                                               
  constructor() public {
    totalSupply_ = initial_supply543;
    balances[msg.sender] = initial_supply543;
    emit TRANSFER180(0x0000000000000000000000000000000000000000, msg.sender, initial_supply543);
  }

}