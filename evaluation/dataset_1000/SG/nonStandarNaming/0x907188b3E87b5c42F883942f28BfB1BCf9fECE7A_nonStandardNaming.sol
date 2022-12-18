                                                                 

pragma solidity ^0.5.8;
// This is a token designed to research Impermanent Loss in an LP. Do not purchase! Token creator will not be liable for any financial damage or loss.//
                                                                                          

library SafeMath {
    function MUL139(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function DIV859(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB932(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD159(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

       
contract Token {
    uint256 public totalSupply;

    function BALANCEOF293(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER9(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE257(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM192(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE444(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER923(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL524(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract StandardToken is Token {
    using SafeMath for uint256;
    mapping(address => mapping (address => uint256)) internal allowed;
    mapping(address => uint256) balances;

                                                                                                                                                               
    function TRANSFER9(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(balances[msg.sender] >= _value && balances[_to].ADD159(_value) >= balances[_to]);

        balances[msg.sender] = balances[msg.sender].SUB932(_value);
        balances[_to] = balances[_to].ADD159(_value);

        emit TRANSFER923(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                               
    function BALANCEOF293(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }


                                                                                                                                                                                                                                                                                     
    function TRANSFERFROM192(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].SUB932(_value);
        balances[_to] = balances[_to].ADD159(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB932(_value);

        emit TRANSFER923(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE444(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;

        emit APPROVAL524(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                 
    function ALLOWANCE257(address _owner, address _spender) public view returns (uint256 remaining) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

                                                                                                                                                                                                                                                  
    function INCREASEAPPROVAL169(address _spender, uint256 _addedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD159(_addedValue);

        emit APPROVAL524(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL872(address _spender, uint256 _subtractedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        uint256 oldValue = allowed[msg.sender][_spender];

        if (_subtractedValue > oldValue) {
          allowed[msg.sender][_spender] = 0;
        } else {
          allowed[msg.sender][_spender] = oldValue.SUB932(_subtractedValue);
        }

        emit APPROVAL524(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}

contract DappChannel is StandardToken {
    string public constant name462 = "Archangel";	//inject NONSTANDARD NAMING
    string public constant symbol413 = "ARCH";	//inject NONSTANDARD NAMING
    uint256 public constant decimals209 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant initial_supply971 = 100000 * (10**decimals209);	//inject NONSTANDARD NAMING
    address public tokenWallet;

    constructor() public {
        totalSupply = initial_supply971;
        tokenWallet = msg.sender;
        balances[tokenWallet] = totalSupply;
    }
}