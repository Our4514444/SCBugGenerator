                                                                 

pragma solidity ^0.5.1 ;


contract SafeMath {
    function MUL403(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function DIV513(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB827(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD307(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract HKDOLLARSTABLECOINConstants {
    uint256 constant token_decimals189 = 18;	//inject NONSTANDARD NAMING
    uint256 constant token_decimals_uint8732 = uint8(token_decimals189);	//inject NONSTANDARD NAMING
    uint256 constant token_decimal_multiplier936 = 10 ** token_decimals189;	//inject NONSTANDARD NAMING
    string public name = "HKDOLLARSTABLECOIN";
    string public symbol = "HKDS";
    string public standard = "ERC20";
    string public Owner = "Wallex Trust";
}



contract owned {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER428 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    function TRANSFEROWNERSHIP394(address newOwner) ONLYOWNER428 public {	//inject NONSTANDARD NAMING
        owner = newOwner;
    }
}

contract ERC20Basic {
    uint256 public totalSupply;
    //function balanceOf(address who) view public returns (uint256);
    function TRANSFER125(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER375(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                        
contract ERC20 is ERC20Basic {
    //function allowance(address owner, address spender) view public returns (uint256);
  	function TRANSFERFROM194(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  	function APPROVE277(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  	event APPROVAL957(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

interface tokenRecipient { function RECEIVEAPPROVAL62(address _from, uint256 _value, address _token, bytes calldata _extraData) external; }	//inject NONSTANDARD NAMING





contract HKDOLLARSTABLECOIN is owned, ERC20, HKDOLLARSTABLECOINConstants,SafeMath  {

    
    

    mapping (address => bool) public frozenAccount;

                                                                                  
    event FROZENFUNDS102(address target, bool frozen);	//inject NONSTANDARD NAMING

                                                                                        
   
    mapping(address => uint256) public balanceOf;
    event TRANSFER375(address from, address to, uint256 value);	//inject NONSTANDARD NAMING
    uint256 public totalSupply;
    mapping(address => mapping(address => uint256)) public allowance;
    event APPROVAL957(address owner, address spender, uint256 value);	//inject NONSTANDARD NAMING
    event BURN485(address who, uint256 value);	//inject NONSTANDARD NAMING

                                                                
    function _TRANSFER107(address _from, address _to, uint _value) internal {	//inject NONSTANDARD NAMING
        require (_to != address(0x0));                          // Prevent transfer to 0x0 address. Use burn() instead
        require (balanceOf[_from] >= _value);                   // Check if the sender has enough
        require (balanceOf[_to] + _value >= balanceOf[_to]);    // Check for overflows
        require(!frozenAccount[_from]);                         // Check if sender is frozen
        require(!frozenAccount[_to]);                           // Check if recipient is frozen
        balanceOf[_from] -= _value;                             // Subtract from the sender
        balanceOf[_to] += _value;                               // Add the same to the recipient
        emit TRANSFER375(_from, _to, _value);
    }

                                                                    
                                                   
                                                                
    function MINTTOKEN148(address target, uint256 mintedAmount) ONLYOWNER428 public {	//inject NONSTANDARD NAMING
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        emit TRANSFER375(address(0), address(this), mintedAmount);
        emit TRANSFER375(address(this), target, mintedAmount);
    }

                                                                                  
                                          
                                                
    function FREEZEACCOUNT712(address target, bool freeze) ONLYOWNER428 public {	//inject NONSTANDARD NAMING
        frozenAccount[target] = freeze;
        emit FROZENFUNDS102(target, freeze);
    }

    


                                                                             

                                                                                                                                                                                                  
    function TRANSFER125(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        _TRANSFER107(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                      
    function TRANSFERFROM194(address _from, address _to, uint256 _value) ONLYOWNER428 public returns (bool success) {	//inject NONSTANDARD NAMING
        //require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _TRANSFER107(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                            
    function APPROVE277(address _spender, uint256 _value) ONLYOWNER428 public	//inject NONSTANDARD NAMING
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL957(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVEANDCALL561(address _spender, uint256 _value, bytes memory _extraData)	//inject NONSTANDARD NAMING
        ONLYOWNER428   public 
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (APPROVE277(_spender, _value)) {
            spender.RECEIVEAPPROVAL62(msg.sender, _value, address(this), _extraData);
            return true;
        }
    }

                                                                                                                                                               
    function BURN532(uint256 _value) ONLYOWNER428 public returns (bool success) {	//inject NONSTANDARD NAMING
        require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
        balanceOf[msg.sender] -= _value;            // Subtract from the sender
        totalSupply -= _value;                      // Updates totalSupply
        emit BURN485(msg.sender, _value);
        return true;
    }

                                                                                                                                                                                                                                                      
    function BURNFROM18(address _from, uint256 _value) ONLYOWNER428 public returns (bool success) {	//inject NONSTANDARD NAMING
        require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
        //require(_value <= allowance[_from][msg.sender]);    // Check allowance
        balanceOf[_from] -= _value;                         // Subtract from the targeted balance
        allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
        totalSupply -= _value;                              // Update totalSupply
        emit BURN485(_from, _value);
        return true;
    }
}