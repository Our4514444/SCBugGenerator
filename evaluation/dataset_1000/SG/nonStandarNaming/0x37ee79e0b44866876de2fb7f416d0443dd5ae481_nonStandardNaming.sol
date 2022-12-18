                                                                 

pragma solidity 0.5.11;

                                                                                         
library SafeMath {
    function MUL377(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function DIV676(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB529(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD877(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


                                                                                                                                                                                             
contract Ownable {
    
    address public owner;

    event OWNERSHIPTRANSFERRED994(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor() public {
        owner = msg.sender;
    }


                                                                                 
    modifier ONLYOWNER368() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP759(address newOwner) ONLYOWNER368 public {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED994(owner, newOwner);
        owner = newOwner;
    }
}

                                                                                                                               
contract ERC20Basic {
    uint256 public totalSupply;
    function BALANCEOF593(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER560(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER385(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                         
contract BasicToken is ERC20Basic {

    using SafeMath for uint256;

    mapping(address => uint256) internal balances;

                                                                                                                                                                   
    function TRANSFER560(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0) && _to != address(this));

        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].SUB529(_value);
        balances[_to] = balances[_to].ADD877(_value);
        emit TRANSFER385(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                                   
    function BALANCEOF593(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }
}

                                                                                        
contract ERC20 is ERC20Basic {
    function ALLOWANCE381(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM253(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE663(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event APPROVAL228(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                                                                          
contract StandardToken is ERC20, BasicToken {

    mapping (address => mapping (address => uint256)) internal allowed;

                                                                                                                                                                                                                                                                                          
    function TRANSFERFROM253(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0) && _to != address(this));

        uint256 _allowance = allowed[_from][msg.sender];

        // Check is not needed because sub(_allowance, _value) will already throw if this condition is not met
        // require (_value <= _allowance);

        balances[_from] = balances[_from].SUB529(_value);
        balances[_to] = balances[_to].ADD877(_value);
        allowed[_from][msg.sender] = _allowance.SUB529(_value);
        emit TRANSFER385(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function APPROVE663(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL228(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                      
    function ALLOWANCE381(address _owner, address _spender) public view returns (uint256 remaining) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

                                                                                                                                                                                                                                                       
    function INCREASEAPPROVAL676 (address _spender, uint _addedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD877(_addedValue);
        emit APPROVAL228(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL610 (address _spender, uint _subtractedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB529(_subtractedValue);
        }
        emit APPROVAL228(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}


                                                                                           
 
contract BurnableToken is StandardToken {

    event BURN329(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                     
    function BURN741(uint256 _value) public {	//inject NONSTANDARD NAMING
        require(_value > 0);
        require(_value <= balances[msg.sender]);
        // no need to require value <= totalSupply, since that would imply the
        // sender's balance is greater than the totalSupply, which *should* be an assertion failure

        address burner = msg.sender;
        balances[burner] = balances[burner].SUB529(_value);
        totalSupply = totalSupply.SUB529(_value);
        emit BURN329(burner, _value);
        emit TRANSFER385(burner, address(0), _value);
    }
}

interface tokenRecipient { 
    function RECEIVEAPPROVAL723(address _from, uint256 _value, bytes calldata _extraData) external;	//inject NONSTANDARD NAMING
}

contract Tatcoin is BurnableToken, Ownable {

    string public constant name484 = "Tatcoin";	//inject NONSTANDARD NAMING
    string public constant symbol495 = "TAT";	//inject NONSTANDARD NAMING
    uint public constant decimals185 = 18;	//inject NONSTANDARD NAMING
    // there is no problem in using * here instead of .mul()
    uint256 public constant initialsupply367 = 200000000 * (10 ** uint256(decimals185));	//inject NONSTANDARD NAMING

    // Constructors
    constructor () public {
        totalSupply = initialsupply367;
        balances[msg.sender] = initialsupply367; // Send all tokens to owner
        emit TRANSFER385(address(0), msg.sender, initialsupply367);
    }
    
    function APPROVEANDCALL225(address _spender, uint256 _value, bytes calldata _extraData)	//inject NONSTANDARD NAMING
        external
        returns (bool success) 
    {
        tokenRecipient spender = tokenRecipient(_spender);
        if (APPROVE663(_spender, _value)) {
            spender.RECEIVEAPPROVAL723(msg.sender, _value, _extraData);
            return true;
        }
    }
    
    function TRANSFERANYERC20TOKEN293(address _tokenAddress, address _to, uint _amount) public ONLYOWNER368 {	//inject NONSTANDARD NAMING
        ERC20(_tokenAddress).TRANSFER560(_to, _amount);
    }
}