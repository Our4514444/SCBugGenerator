pragma solidity ^0.5.2;

                                                                                                                                                                                             
contract Ownable {
    address public owner;

    event OWNERSHIPRENOUNCED892(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED373(	//inject NONSTANDARD NAMING
        address indexed previousOwner,
        address indexed newOwner
    );

                                                                                                                        
    constructor() public {
        owner = msg.sender;
    }

                                                                               
    modifier ONLYOWNER469() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                                                                                 
    function TRANSFEROWNERSHIP874(address newOwner) public ONLYOWNER469 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED373(owner, newOwner);
        owner = newOwner;
    }

                                                                                         
    function RENOUNCEOWNERSHIP644() public ONLYOWNER469 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED892(owner);
        owner = address(0);
    }
}

                                                                                         
library SafeMath {

                                                                     
    function MUL361(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

                                                                                   
    function DIV870(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return c;
    }

                                                                                                                 
    function SUB384(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

                                                               
    function ADD848(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c>=a && c>=b);
        return c;
    }
}

                                                                                                                               
contract ERC20Basic {
    function TOTALSUPPLY207() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF736(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER947(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER375(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                        
contract ERC20 is ERC20Basic {
    function ALLOWANCE163(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM767(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE578(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event APPROVAL868(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract BasicToken is ERC20Basic {
    using SafeMath for uint256;

    mapping(address => uint256) balances;

    uint256 totalSupply_;

                                                             
    function TOTALSUPPLY207() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return totalSupply_;
    }

                                                                                                                                                               
    function TRANSFER947(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].SUB384(_value);
        balances[_to] = balances[_to].ADD848(_value);
        emit TRANSFER375(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                               
    function BALANCEOF736(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

}
                                                                                                                                                                                                                                                                          
contract StandardToken is ERC20, BasicToken {

    mapping (address => mapping (address => uint256)) allowed;


                                                                                                                                                                                                                                                                              
    function TRANSFERFROM767(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].SUB384(_value);
        balances[_to] = balances[_to].ADD848(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB384(_value);
        emit TRANSFER375(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE578(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL868(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                 
    function ALLOWANCE163(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function INCREASEAPPROVAL577(address _spender, uint256 _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD848(_addedValue);
        emit APPROVAL868(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DECREASEAPPROVAL82(address _spender, uint256 _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB384(_subtractedValue);
        }
        emit APPROVAL868(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

}

contract Pausable is Ownable {
    event PAUSE918();	//inject NONSTANDARD NAMING
    event UNPAUSE646();	//inject NONSTANDARD NAMING

    bool public paused = false;


                                                                                                    
    modifier WHENNOTPAUSED11() {	//inject NONSTANDARD NAMING
        require(!paused);
        _;
    }

                                                                                                
    modifier WHENPAUSED683() {	//inject NONSTANDARD NAMING
        require(paused);
        _;
    }

                                                                              
    function PAUSE780() ONLYOWNER469 WHENNOTPAUSED11 public {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE918();
    }

                                                                                 
    function UNPAUSE671() ONLYOWNER469 WHENPAUSED683 public {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE646();
    }
}

contract PausableToken is StandardToken, Pausable {

    function TRANSFER947(address _to, uint256 _value) public WHENNOTPAUSED11 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER947(_to, _value);
    }

    function TRANSFERFROM767(address _from, address _to, uint256 _value) public WHENNOTPAUSED11 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM767(_from, _to, _value);
    }

    function APPROVE578(address _spender, uint256 _value) public WHENNOTPAUSED11 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE578(_spender, _value);
    }

    function INCREASEAPPROVAL577(address _spender, uint256 _addedValue) public WHENNOTPAUSED11 returns (bool) {	//inject NONSTANDARD NAMING
        return super.INCREASEAPPROVAL577(_spender, _addedValue);
    }

    function DECREASEAPPROVAL82(address _spender, uint256 _subtractedValue) public WHENNOTPAUSED11 returns (bool) {	//inject NONSTANDARD NAMING
        return super.DECREASEAPPROVAL82(_spender, _subtractedValue);
    }
}

contract FFToken is PausableToken {
    string public constant name387 = "Fifty Five Token"; 	//inject NONSTANDARD NAMING
    string public constant symbol829 = "FF";	//inject NONSTANDARD NAMING
    uint256 public constant decimals786 = 18;	//inject NONSTANDARD NAMING

    mapping (address => uint256) freezes;

                                                      
    event BURN685(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
	
	                                                   
    event FREEZE812(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
	
	                                                     
    event UNFREEZE597(address indexed from, uint256 value);	//inject NONSTANDARD NAMING

    constructor() public {
        totalSupply_ = 10000000000 * (10 ** uint256(decimals786));
        balances[msg.sender] = totalSupply_;
    }
    
    function FREEZEOF121(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return freezes[_owner];
    }

    function BURN82(uint256 _value) WHENNOTPAUSED11 public returns (bool) {	//inject NONSTANDARD NAMING
        require(_value <= balances[msg.sender]);
        
        balances[msg.sender] = balances[msg.sender].SUB384(_value);
        totalSupply_ = totalSupply_.SUB384(_value);
        emit BURN685(msg.sender, _value);
        return true;
    }
	
	function FREEZE198(uint256 _value) WHENNOTPAUSED11 public returns (bool) {	//inject NONSTANDARD NAMING
        require(_value <= balances[msg.sender]);
        
        balances[msg.sender] = balances[msg.sender].SUB384(_value);
        freezes[msg.sender] = freezes[msg.sender].ADD848(_value);
        emit FREEZE812(msg.sender, _value);
        return true;
    }
	
	function UNFREEZE108(uint256 _value) WHENNOTPAUSED11 public returns (bool) {	//inject NONSTANDARD NAMING
        require(_value <= freezes[msg.sender]);
        
        freezes[msg.sender] = freezes[msg.sender].SUB384(_value);
		balances[msg.sender] = balances[msg.sender].ADD848(_value);
        emit UNFREEZE597(msg.sender, _value);
        return true;
    }
    
                                                                                                                                                                 
    function TRANSFEROWNERSHIP874(address newOwner) ONLYOWNER469 WHENNOTPAUSED11 public {	//inject NONSTANDARD NAMING
        super.TRANSFEROWNERSHIP874(newOwner);
    }

                                           
    function() payable external {
        revert();
    }
}