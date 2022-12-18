                                                                 

pragma solidity ^0.5.8;

                                                                                          

library SafeMath {
    function MUL437(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function DIV509(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB27(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD528(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

                                                               
contract Token {
    uint256 public totalSupply;

    function BALANCEOF744(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER609(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE381(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM243(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE395(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER414(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL414(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract StandardToken is Token {
    using SafeMath for uint256;
    mapping(address => mapping (address => uint256)) internal allowed;
    mapping(address => uint256) balances;

                                                                                                                                                               
    function TRANSFER609(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(balances[msg.sender] >= _value && balances[_to].ADD528(_value) >= balances[_to]);

        balances[msg.sender] = balances[msg.sender].SUB27(_value);
        balances[_to] = balances[_to].ADD528(_value);

        emit TRANSFER414(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                               
    function BALANCEOF744(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }


                                                                                                                                                                                                                                                                                     
    function TRANSFERFROM243(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].SUB27(_value);
        balances[_to] = balances[_to].ADD528(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB27(_value);

        emit TRANSFER414(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE395(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;

        emit APPROVAL414(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                 
    function ALLOWANCE381(address _owner, address _spender) public view returns (uint256 remaining) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

                                                                                                                                                                                                                                                  
    function INCREASEAPPROVAL285(address _spender, uint256 _addedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD528(_addedValue);

        emit APPROVAL414(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL577(address _spender, uint256 _subtractedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        uint256 oldValue = allowed[msg.sender][_spender];

        if (_subtractedValue > oldValue) {
          allowed[msg.sender][_spender] = 0;
        } else {
          allowed[msg.sender][_spender] = oldValue.SUB27(_subtractedValue);
        }

        emit APPROVAL414(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}

contract ReliveCoin is StandardToken {
    string public constant name193 = "ReliveCoin";	//inject NONSTANDARD NAMING
    string public constant symbol348 = "RLC";	//inject NONSTANDARD NAMING
    uint256 public constant decimals189 = 10;	//inject NONSTANDARD NAMING
    uint256 public constant initial_supply820 = 2100000000 * (10**decimals189);	//inject NONSTANDARD NAMING
    address public tokenWallet;

    constructor() public {
        totalSupply = initial_supply820;
        tokenWallet = msg.sender;
        balances[tokenWallet] = totalSupply;
    }
}