pragma solidity ^0.5.2;
                                                                          
 
                                                                                         
library SafeMath {

                                                                     
    function MUL554(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

                                                                                   
    function DIV670(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return c;
    }

                                                                                                                 
    function SUB410(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

                                                               
    function ADD768(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c>=a && c>=b);
        return c;
    }
}

                                                                                                                                                                                             
contract Ownable {
    address public owner;

    event OWNERSHIPRENOUNCED887(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED974(	//inject NONSTANDARD NAMING
        address indexed previousOwner,
        address indexed newOwner
    );

                                                                                                                        
    constructor() public {
        owner = msg.sender;
    }

                                                                               
    modifier ONLYOWNER174() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                                                                                 
    function TRANSFEROWNERSHIP946(address newOwner) public ONLYOWNER174 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED974(owner, newOwner);
        owner = newOwner;
    }

                                                                                         
    function RENOUNCEOWNERSHIP363() public ONLYOWNER174 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED887(owner);
        owner = address(0);
    }
}

                                                                                                                               
contract ERC20Basic {
    function TOTALSUPPLY406() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF555(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER356(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER661(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                        
contract ERC20 is ERC20Basic {
    function ALLOWANCE433(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM510(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE423(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event APPROVAL382(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract BasicToken is ERC20Basic {
    using SafeMath for uint256;

    mapping(address => uint256) balances;

    uint256 totalSupply_;

                                                             
    function TOTALSUPPLY406() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return totalSupply_;
    }

                                                                                                                                                               
    function TRANSFER356(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].SUB410(_value);
        balances[_to] = balances[_to].ADD768(_value);
        emit TRANSFER661(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                               
    function BALANCEOF555(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

}
                                                                                                                                                                                                                                                                          
contract StandardToken is ERC20, BasicToken {

    mapping (address => mapping (address => uint256)) allowed;


                                                                                                                                                                                                                                                                              
    function TRANSFERFROM510(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].SUB410(_value);
        balances[_to] = balances[_to].ADD768(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB410(_value);
        emit TRANSFER661(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE423(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL382(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                 
    function ALLOWANCE433(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function INCREASEAPPROVAL583(address _spender, uint256 _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD768(_addedValue);
        emit APPROVAL382(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DECREASEAPPROVAL858(address _spender, uint256 _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB410(_subtractedValue);
        }
        emit APPROVAL382(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

}

contract Pausable is Ownable {
    event PAUSE962();	//inject NONSTANDARD NAMING
    event UNPAUSE236();	//inject NONSTANDARD NAMING

    bool public paused = false;


                                                                                                    
    modifier WHENNOTPAUSED325() {	//inject NONSTANDARD NAMING
        require(!paused);
        _;
    }

                                                                                                
    modifier WHENPAUSED231() {	//inject NONSTANDARD NAMING
        require(paused);
        _;
    }

                                                                              
    function PAUSE287() ONLYOWNER174 WHENNOTPAUSED325 public {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE962();
    }

                                                                                 
    function UNPAUSE869() ONLYOWNER174 WHENPAUSED231 public {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE236();
    }
}

contract PausableToken is StandardToken, Pausable {

    function TRANSFER356(address _to, uint256 _value) public WHENNOTPAUSED325 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER356(_to, _value);
    }

    function TRANSFERFROM510(address _from, address _to, uint256 _value) public WHENNOTPAUSED325 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM510(_from, _to, _value);
    }

    function APPROVE423(address _spender, uint256 _value) public WHENNOTPAUSED325 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE423(_spender, _value);
    }

    function INCREASEAPPROVAL583(address _spender, uint256 _addedValue) public WHENNOTPAUSED325 returns (bool) {	//inject NONSTANDARD NAMING
        return super.INCREASEAPPROVAL583(_spender, _addedValue);
    }

    function DECREASEAPPROVAL858(address _spender, uint256 _subtractedValue) public WHENNOTPAUSED325 returns (bool) {	//inject NONSTANDARD NAMING
        return super.DECREASEAPPROVAL858(_spender, _subtractedValue);
    }
}

contract TSToken is PausableToken {
    string public constant name568 = "Touch Smart Token"; 	//inject NONSTANDARD NAMING
    string public constant symbol129 = "TST";	//inject NONSTANDARD NAMING
    uint256 public constant decimals455 = 18;	//inject NONSTANDARD NAMING

    mapping (address => uint256) freezes;

                                                      
    event BURN97(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
	
	                                                   
    event FREEZE378(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
	
	                                                     
    event UNFREEZE146(address indexed from, uint256 value);	//inject NONSTANDARD NAMING

    constructor() public {
        totalSupply_ = 1000000000 * (10 ** uint256(decimals455));
        balances[msg.sender] = totalSupply_;
    }
    
    function FREEZEOF531(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return freezes[_owner];
    }

    function BURN975(uint256 _value) WHENNOTPAUSED325 public returns (bool) {	//inject NONSTANDARD NAMING
        require(_value <= balances[msg.sender]);
        
        balances[msg.sender] = balances[msg.sender].SUB410(_value);
        totalSupply_ = totalSupply_.SUB410(_value);
        emit BURN97(msg.sender, _value);
        return true;
    }
	
	function FREEZE442(uint256 _value) WHENNOTPAUSED325 public returns (bool) {	//inject NONSTANDARD NAMING
        require(_value <= balances[msg.sender]);
        
        balances[msg.sender] = balances[msg.sender].SUB410(_value);
        freezes[msg.sender] = freezes[msg.sender].ADD768(_value);
        emit FREEZE378(msg.sender, _value);
        return true;
    }
	
	function UNFREEZE959(uint256 _value) WHENNOTPAUSED325 public returns (bool) {	//inject NONSTANDARD NAMING
        require(_value <= freezes[msg.sender]);
        
        freezes[msg.sender] = freezes[msg.sender].SUB410(_value);
		balances[msg.sender] = balances[msg.sender].ADD768(_value);
        emit UNFREEZE146(msg.sender, _value);
        return true;
    }
    
                                                                                                                                                                 
    function TRANSFEROWNERSHIP946(address newOwner) ONLYOWNER174 WHENNOTPAUSED325 public {	//inject NONSTANDARD NAMING
        super.TRANSFEROWNERSHIP946(newOwner);
    }

                                           
    function() payable external {
        revert();
    }
}