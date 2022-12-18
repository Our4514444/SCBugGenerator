pragma solidity ^0.5.7;


                                                                                        
contract ERC20 {
    function TOTALSUPPLY462() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF306(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE769(address _owner, address _spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER941(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE507(address _spender, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM785(address _from, address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER46(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL79(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                          
library SafeMath {
                                                                      
    function MUL837(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = _a * _b;
        require(_a == 0 || c / _a == _b);

        return c;
    }

                                                                                                               
    function DIV778(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = _a / _b;
        return c;
    }

                                                                                                                  
    function SUB818(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(_b <= _a);
        uint256 c = _a - _b;

        return c;
    }

                                                                
    function ADD125(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = _a + _b;
        require(c >= _a);

        return c;
    }
}


                                                                                                                                                                                             
contract Ownable {
    address public owner;

    event OWNERSHIPRENOUNCED526(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED116(address indexed previousOwner,address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                        
    constructor() public {
        owner = msg.sender;
    }

                                                                               
    modifier ONLYOWNER739() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                                                                                                                                                                                          
    function RENOUNCEOWNERSHIP777() public ONLYOWNER739 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED526(owner);
        owner = address(0);
    }

                                                                                                                                                                  
    function TRANSFEROWNERSHIP734(address _newOwner) public ONLYOWNER739 {	//inject NONSTANDARD NAMING
		require(_newOwner != address(0), "New owner cannot be address(0)");
		emit OWNERSHIPTRANSFERRED116(owner, _newOwner);
        owner = _newOwner;
    }
}

                                                                                                                                     
contract Administrator is Ownable {
    mapping (address=>bool) public admin;
    
    // Current number of members of the administrator group
    uint    public   adminLength;   
    // The maximum number of members of the administrator group, which is specified in the constructor
    uint    public   adminMaxLength;      
    
    event   ADDADMIN591(address indexed _address);	//inject NONSTANDARD NAMING
    event   REMOVEADMIN754(address indexed _address);	//inject NONSTANDARD NAMING
    
    constructor (uint _len) public {        
        adminMaxLength = _len;
    }
    
    modifier ISADMIN520(address _addr) {	//inject NONSTANDARD NAMING
        require(admin[_addr], "Not administrator");
        _;
    }
    
    modifier ISNOTADMIN406(address _addr) {	//inject NONSTANDARD NAMING
        require(!admin[_addr], "Is administrator");
        _;        
    }
    
                                                                                                                 
	modifier ONLYOWNERORADMIN367() {	//inject NONSTANDARD NAMING
		require(msg.sender == owner || admin[msg.sender], "msg.sender is nether owner nor administator");
		_;
	}
    
                                                                   
    function ADDADMIN479(address _addr) ONLYOWNER739 ISNOTADMIN406(_addr) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_addr != address(0), "Administrator cannot be address(0)");
        require(_addr != owner, "Administrator cannot be owner");
        require(adminLength < adminMaxLength, "Exceeded the maximum number of administrators");
        
        admin[_addr] = true;
        adminLength++; 
        
        emit ADDADMIN591(_addr);
        return true;
    } 
    
                                                                        
    function REMOVEADMIN800(address _addr) ONLYOWNER739 ISADMIN520(_addr) public returns (bool) {	//inject NONSTANDARD NAMING
        delete admin[_addr];
        adminLength--;
        
        emit REMOVEADMIN754(_addr);
        return true;
    }
}

                                                                                                                   
contract Blacklisted is Administrator {
	mapping (address => bool) public blacklist;

	event SETBLACKLIST409(address indexed _address, bool _bool);	//inject NONSTANDARD NAMING

	                                                               
	modifier NOTINBLACKLIST445(address _address) {	//inject NONSTANDARD NAMING
		require(!blacklist[_address], "Is in Blacklist");
		_;
	}

	                                                                               
	function SETBLACKLIST92(address _address, bool _bool) public ONLYOWNERORADMIN367 {	//inject NONSTANDARD NAMING
		require(_address != address(0));
		
		if(_bool) {
		    require(!blacklist[_address], "Already in blacklist");
		} else {
		    require(blacklist[_address], "Not in blacklist yet");
		}
		
		blacklist[_address] = _bool;
		emit SETBLACKLIST409(_address, _bool);
	}
}

                                                                                                                
contract Pausable is Ownable {
    event PAUSE625();	//inject NONSTANDARD NAMING
    event UNPAUSE37();	//inject NONSTANDARD NAMING

    bool public paused = false;

                                                                                                    
    modifier WHENNOTPAUSED261() {	//inject NONSTANDARD NAMING
        require(!paused);
        _;
    }

                                                                                                
    modifier WHENPAUSED979() {	//inject NONSTANDARD NAMING
        require(paused);
        _;
    }

                                                                              
    function PAUSE176() public ONLYOWNER739 WHENNOTPAUSED261 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE625();
    }

                                                                                 
    function UNPAUSE701() public ONLYOWNER739 WHENPAUSED979 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE37();
    }
}


                                                                                                                                           
contract StandardToken is ERC20, Pausable, Blacklisted {
    using SafeMath for uint256;

    mapping(address => uint256) balances;

    mapping (address => mapping (address => uint256)) internal allowed;

    uint256 totalSupply_;

                                                             
    function TOTALSUPPLY462() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return totalSupply_;
    }

                                                                                                                                                                                                               
    function BALANCEOF306(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

                                                                                                                                                                                                                                                                                                                                 
    function ALLOWANCE769(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

                                                                                                                                                               
    function TRANSFER941(address _to, uint256 _value) WHENNOTPAUSED261 NOTINBLACKLIST445(msg.sender) NOTINBLACKLIST445(_to) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));

        balances[msg.sender] = balances[msg.sender].SUB818(_value);
        balances[_to] = balances[_to].ADD125(_value);

        emit TRANSFER46(msg.sender, _to, _value);
        return true;
    }


                                                                                                                                                                                                                                                                                     
    function TRANSFERFROM785(address _from, address _to, uint256 _value) WHENNOTPAUSED261 NOTINBLACKLIST445(msg.sender) NOTINBLACKLIST445(_from) NOTINBLACKLIST445(_to) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));

        balances[_from] = balances[_from].SUB818(_value);
        balances[_to] = balances[_to].ADD125(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB818(_value);

        emit TRANSFER46(_from, _to, _value);
        return true;
    }


                                                                                                                                                                                                                                         
    function APPROVE507(address _spender, uint256 _value) WHENNOTPAUSED261 public returns (bool) {	//inject NONSTANDARD NAMING
		require(_value == 0 || allowed[msg.sender][_spender] == 0 );
        allowed[msg.sender][_spender] = _value;

        emit APPROVAL79(msg.sender, _spender, _value);
        return true;
    }


                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function INCREASEAPPROVAL962(address _spender, uint256 _addedValue) WHENNOTPAUSED261 public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = (allowed[msg.sender][_spender].ADD125(_addedValue));

        emit APPROVAL79(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function DECREASEAPPROVAL283(address _spender, uint256 _subtractedValue) WHENNOTPAUSED261 public returns (bool) {	//inject NONSTANDARD NAMING
        uint256 oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue >= oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB818(_subtractedValue);
        }

        emit APPROVAL79(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}



                                                             
contract GomicsToken is StandardToken {
    string public constant name609 = "Gomics";	//inject NONSTANDARD NAMING
    string public constant symbol979 = "GOM";	//inject NONSTANDARD NAMING
    uint8 public constant decimals589 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant initial_supply42 = 75000000;	//inject NONSTANDARD NAMING
    
    constructor() Administrator(3) public {
        totalSupply_ = initial_supply42 * (10 ** uint256(decimals589));
        balances[msg.sender] = totalSupply_;
        emit TRANSFER46(address(0), msg.sender, totalSupply_);
    }
}