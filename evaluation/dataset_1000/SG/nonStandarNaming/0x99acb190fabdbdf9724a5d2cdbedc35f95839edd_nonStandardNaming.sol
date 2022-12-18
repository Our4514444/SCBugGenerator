                                                                 

pragma solidity ^0.5.8;

                                                                                                                                                                                                                                                                                                           

library SafeMath {
    function MUL151(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function DIV654(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB982(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD542(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

                                                               
contract Token {
    uint256 public totalSupply;

    function BALANCEOF656(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER847(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE722(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM518(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE615(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER225(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL190(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract StandardToken is Token {
    using SafeMath for uint256;
    mapping(address => mapping (address => uint256)) internal allowed;
    mapping(address => uint256) balances;

                                                                                                                                                               
    function TRANSFER847(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(balances[msg.sender] >= _value && balances[_to].ADD542(_value) >= balances[_to]);

        balances[msg.sender] = balances[msg.sender].SUB982(_value);
        balances[_to] = balances[_to].ADD542(_value);

        emit TRANSFER225(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                               
    function BALANCEOF656(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }


                                                                                                                                                                                                                                                                                     
    function TRANSFERFROM518(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].SUB982(_value);
        balances[_to] = balances[_to].ADD542(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB982(_value);

        emit TRANSFER225(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE615(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;

        emit APPROVAL190(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                 
    function ALLOWANCE722(address _owner, address _spender) public view returns (uint256 remaining) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

                                                                                                                                                                                                                                                  
    function INCREASEAPPROVAL578(address _spender, uint256 _addedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD542(_addedValue);

        emit APPROVAL190(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL143(address _spender, uint256 _subtractedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        uint256 oldValue = allowed[msg.sender][_spender];

        if (_subtractedValue > oldValue) {
          allowed[msg.sender][_spender] = 0;
        } else {
          allowed[msg.sender][_spender] = oldValue.SUB982(_subtractedValue);
        }

        emit APPROVAL190(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}

contract Dapp1 is StandardToken {
    string public constant name659 = "Jamie Coin";	//inject NONSTANDARD NAMING
    string public constant symbol317 = "JCX";	//inject NONSTANDARD NAMING
    uint256 public constant decimals734 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant initial_supply208 = 10 * (10**decimals734);	//inject NONSTANDARD NAMING
    address public tokenWallet;

    constructor() public {
        totalSupply = initial_supply208;
        tokenWallet = msg.sender;
        balances[tokenWallet] = totalSupply;
    }
}