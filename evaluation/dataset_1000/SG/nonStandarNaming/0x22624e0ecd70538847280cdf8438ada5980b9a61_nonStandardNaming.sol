pragma solidity 0.5.9;

                                                                                                                          
contract ERC20Basic {
  function TOTALSUPPLY987() public view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF280(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER368(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event TRANSFER198(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                        
contract ERC20 is ERC20Basic {
  function ALLOWANCE898(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFERFROM130(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE64(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event APPROVAL839(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

                                                                                         
library SafeMath {

    function MUL900(uint256 a, uint256 b) internal pure  returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        require(a == 0 || c / a == b);
        return c;
    }

    function DIV952(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        return c;
    }

    function SUB681(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        return a - b;
    }

    function ADD868(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);
        return c;
    }
    function CEIL172(uint256 a, uint256 m) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = ADD868(a,m);
        uint256 d = SUB681(c,1);
        return MUL900(DIV952(d,m),m);
    }

}

                                                                                   
contract Burner {
    using SafeMath for uint256;
    uint256 public basePercent = 100;
    function FINDONEPERCENT666(uint256 value) public view returns (uint256)  {	//inject NONSTANDARD NAMING
        uint256 roundValue = value.CEIL172(basePercent);
        uint256 onePercent = roundValue.MUL900(basePercent).DIV952(10000);
        return onePercent;
    }
}

                                                                                         
contract BasicToken is ERC20Basic, Burner {
  using SafeMath for uint256;

  mapping(address => uint256) balances;

  uint256 totalSupply_;

                                                       
  function TOTALSUPPLY987() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return totalSupply_;
  }

                                                                                                                                                     
  function TRANSFER368(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    uint256 amountBurn = FINDONEPERCENT666(_value);
    uint256 amountTransfer = _value.SUB681(amountBurn);

    balances[msg.sender] = balances[msg.sender].SUB681(amountTransfer);
    balances[_to] = balances[_to].ADD868(amountTransfer);
    totalSupply_ = totalSupply_.SUB681(amountBurn);

    emit TRANSFER198(msg.sender, _to, amountTransfer);
    emit TRANSFER198(msg.sender, address(0), amountBurn);
    return true;
  }

                                                                                                                                                                                                     
  function BALANCEOF280(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return balances[_owner];
  }

}

                                                                                                                                                                                                                                                                
contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;


                                                                                                                                                                                                                                                                              
  function TRANSFERFROM130(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].SUB681(_value);

    uint256 amountBurn = FINDONEPERCENT666(_value);
    uint256 amountTransfer = _value.SUB681(amountBurn);

    balances[_to] = balances[_to].ADD868(amountTransfer);
    totalSupply_ = totalSupply_.SUB681(amountBurn);

    allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB681(_value);

    emit TRANSFER198(_from, _to, _value);
    emit TRANSFER198(_from, address(0), amountBurn);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
  function APPROVE64(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = _value;
    emit APPROVAL839(msg.sender, _spender, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                          
  function ALLOWANCE898(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return allowed[_owner][_spender];
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function INCREASEAPPROVAL833(address _spender, uint256 _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = (allowed[msg.sender][_spender].ADD868(_addedValue));
    emit APPROVAL839(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function DECREASEAPPROVAL358(address _spender, uint256 _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    uint256 oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue > oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.SUB681(_subtractedValue);
    }
    emit APPROVAL839(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}

                                                                                           
contract Burnable is BasicToken {

  event BURN664(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                             
  function BURN172(uint256 _value) public {	//inject NONSTANDARD NAMING
    _BURN817(msg.sender, _value);
  }

  function _BURN817(address _who, uint256 _value) internal {	//inject NONSTANDARD NAMING
    require(_value <= balances[_who]);
    // no need to require value <= totalSupply, since that would imply the
    // sender's balance is greater than the totalSupply, which *should* be an assertion failure

    balances[_who] = balances[_who].SUB681(_value);
    totalSupply_ = totalSupply_.SUB681(_value);
    emit BURN664(_who, _value);
    emit TRANSFER198(_who, address(0), _value);
  }
}

                                                                                                                                                                                             
contract Ownable {
  address public owner;


  event OWNERSHIPRENOUNCED387(address indexed previousOwner);	//inject NONSTANDARD NAMING
  event OWNERSHIPTRANSFERRED957(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );


                                                                                                                   
  constructor() public {
    owner = msg.sender;
  }

                                                                           
  modifier ONLYOWNER441() {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }

                                                                                                                                                                                                                                                                   
  function RENOUNCEOWNERSHIP752() public ONLYOWNER441 {	//inject NONSTANDARD NAMING
    emit OWNERSHIPRENOUNCED387(owner);
    owner = address(0);
  }

                                                                                                                                                             
  function TRANSFEROWNERSHIP994(address _newOwner) public ONLYOWNER441 {	//inject NONSTANDARD NAMING
    _TRANSFEROWNERSHIP542(_newOwner);
  }

                                                                                                                                  
  function _TRANSFEROWNERSHIP542(address _newOwner) internal {	//inject NONSTANDARD NAMING
    require(_newOwner != address(0));
    emit OWNERSHIPTRANSFERRED957(owner, _newOwner);
    owner = _newOwner;
  }
}

                                                                                                                                                                     
contract Claimable is Ownable {
  address public pendingOwner;

                                                                                           
  modifier ONLYPENDINGOWNER934() {	//inject NONSTANDARD NAMING
    require(msg.sender == pendingOwner);
    _;
  }

                                                                                                                                          
  function TRANSFEROWNERSHIP994(address newOwner) ONLYOWNER441 public {	//inject NONSTANDARD NAMING
    pendingOwner = newOwner;
  }

                                                                               
  function CLAIMOWNERSHIP515() ONLYPENDINGOWNER934 public {	//inject NONSTANDARD NAMING
    emit OWNERSHIPTRANSFERRED957(owner, pendingOwner);
    owner = pendingOwner;
    pendingOwner = address(0);
  }
}


                                                                                                                
contract Pausable is Ownable {
  event PAUSE691();	//inject NONSTANDARD NAMING
  event UNPAUSE897();	//inject NONSTANDARD NAMING

  bool public paused = false;

                                                                                                
  modifier WHENNOTPAUSED575() {	//inject NONSTANDARD NAMING
    require(!paused);
    _;
  }

                                                                                            
  modifier WHENPAUSED366() {	//inject NONSTANDARD NAMING
    require(paused);
    _;
  }

                                                                          
  function PAUSE279() ONLYOWNER441 WHENNOTPAUSED575 public {	//inject NONSTANDARD NAMING
    paused = true;
    emit PAUSE691();
  }

                                                                             
  function UNPAUSE649() ONLYOWNER441 WHENPAUSED366 public {	//inject NONSTANDARD NAMING
    paused = false;
    emit UNPAUSE897();
  }
}

                                                                          
contract ArenaMatchGold is StandardToken, Burnable, Pausable, Claimable {

  string public constant name412 = "AMGold Arena Match"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
  string public constant symbol594 = "AMG"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
  uint8 public constant decimals125 = 18; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
  uint256 public constant initial_supply728 = 100000000 * (10 ** uint256(decimals125));	//inject NONSTANDARD NAMING

                                                                               
  constructor() public {
    totalSupply_ = initial_supply728;
    balances[msg.sender] = initial_supply728;
    emit TRANSFER198(address(0), msg.sender, initial_supply728);
  }
  
  function TRANSFER368(address _to, uint256 _value) public WHENNOTPAUSED575 returns (bool) {	//inject NONSTANDARD NAMING
    return super.TRANSFER368(_to, _value);
  }

  function TRANSFERFROM130(address _from, address _to, uint256 _value) public WHENNOTPAUSED575 returns (bool) {	//inject NONSTANDARD NAMING
    return super.TRANSFERFROM130(_from, _to, _value);
  }

  function APPROVE64(address _spender, uint256 _value) public WHENNOTPAUSED575 returns (bool) {	//inject NONSTANDARD NAMING
    return super.APPROVE64(_spender, _value);
  }

  function INCREASEAPPROVAL833(address _spender, uint _addedValue) public WHENNOTPAUSED575 returns (bool success) {	//inject NONSTANDARD NAMING
    return super.INCREASEAPPROVAL833(_spender, _addedValue);
  }

  function DECREASEAPPROVAL358(address _spender, uint _subtractedValue) public WHENNOTPAUSED575 returns (bool success) {	//inject NONSTANDARD NAMING
    return super.DECREASEAPPROVAL358(_spender, _subtractedValue);
  }
  
}

                                                                                                                                                         