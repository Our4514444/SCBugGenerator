pragma solidity ^0.5.1;
                                                                                         
library SafeMath {
                                                                        
    function MUL193(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }
    
                                                                                      
    function DIV487(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        // uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return a / b;
    }
    
                                                                                                                    
    function SUB226(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }
    
                                                                  
    function ADD915(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        c = a + b;
        assert(c >= a);
        return c;
    }
}
                                                                                                                                                                                              
 
contract Ownable {
    address payable public owner;
    event OWNERSHIPTRANSFERRED135(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
                                                                                                                 
   constructor() public {
      owner = msg.sender;
    }
    
                                                                                  
    modifier ONLYOWNER946() {	//inject NONSTANDARD NAMING
      require(msg.sender == owner);
      _;
    }
    
                                                                                                                                                                     
    function TRANSFEROWNERSHIP738(address payable newOwner) public ONLYOWNER946 {	//inject NONSTANDARD NAMING
      require(newOwner != address(0));
      emit OWNERSHIPTRANSFERRED135(owner, newOwner);
      owner = newOwner;
    }
}
                                                                     
contract ERC20Basic {
    function TOTALSUPPLY369() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF682(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER877(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER806(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}
                                                                                         
contract ERC20 is ERC20Basic {
    function ALLOWANCE673(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM228(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE923(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event APPROVAL333(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}
                                                                                          
contract BasicToken is ERC20Basic {
    using SafeMath for uint256;
    mapping(address => uint256) balances;
    uint256 totalSupply_;
    
                                                                
    function TOTALSUPPLY369() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return totalSupply_;
    }
    
                                                                                                                                                                    
    function TRANSFER877(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        
        balances[msg.sender] = balances[msg.sender].SUB226(_value);
        balances[_to] = balances[_to].ADD915(_value);
        emit TRANSFER806(msg.sender, _to, _value);
        return true;
    }
    
                                                                                                                                                                                                                    
    function BALANCEOF682(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }
}
contract StandardToken is ERC20, BasicToken {
    mapping (address => mapping (address => uint256)) internal allowed;
                                                                                                                                                                                                                                                                                           
    function TRANSFERFROM228(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
    
        balances[_from] = balances[_from].SUB226(_value);
        balances[_to] = balances[_to].ADD915(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB226(_value);
        
        emit TRANSFER806(_from, _to, _value);
        return true;
    }
    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function APPROVE923(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL333(msg.sender, _spender, _value);
        return true;
    }
    
                                                                                                                                                                                                                                                                                                                                       
    function ALLOWANCE673(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }
    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function INCREASEAPPROVAL946(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD915(_addedValue);
        emit APPROVAL333(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function DECREASEAPPROVAL89(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB226(_subtractedValue);
        }
        emit APPROVAL333(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}
                                                                           
contract ThePeakToken is StandardToken, Ownable {
    string public constant name562 = "The Peak Token";	//inject NONSTANDARD NAMING
    string public constant symbol62 = "PKT";	//inject NONSTANDARD NAMING
    uint32 public constant decimals48 = 8;	//inject NONSTANDARD NAMING

    constructor() public {
        totalSupply_ = 208000000*10**8;
        balances[owner] = balances[owner].ADD915(totalSupply_);
        emit TRANSFER806(address(this), owner, totalSupply_);
    }
}