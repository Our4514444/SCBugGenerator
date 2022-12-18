                                                                 

pragma solidity ^0.5.8;

                                                                                          

library SafeMath {
    function MUL152(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function DIV636(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB478(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD90(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

                                                               
contract Token {
    uint256 public totalSupply;

    function BALANCEOF479(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER535(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE41(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM333(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE428(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER385(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL504(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract StandardToken is Token {
    using SafeMath for uint256;
    mapping(address => mapping (address => uint256)) internal allowed;
    mapping(address => uint256) balances;

                                                                                                                                                               
    function TRANSFER535(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(balances[msg.sender] >= _value && balances[_to].ADD90(_value) >= balances[_to]);

        balances[msg.sender] = balances[msg.sender].SUB478(_value);
        balances[_to] = balances[_to].ADD90(_value);

        emit TRANSFER385(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                               
    function BALANCEOF479(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }


                                                                                                                                                                                                                                                                                     
    function TRANSFERFROM333(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].SUB478(_value);
        balances[_to] = balances[_to].ADD90(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB478(_value);

        emit TRANSFER385(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE428(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;

        emit APPROVAL504(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                 
    function ALLOWANCE41(address _owner, address _spender) public view returns (uint256 remaining) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

                                                                                                                                                                                                                                                  
    function INCREASEAPPROVAL275(address _spender, uint256 _addedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD90(_addedValue);

        emit APPROVAL504(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL897(address _spender, uint256 _subtractedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        uint256 oldValue = allowed[msg.sender][_spender];

        if (_subtractedValue > oldValue) {
          allowed[msg.sender][_spender] = 0;
        } else {
          allowed[msg.sender][_spender] = oldValue.SUB478(_subtractedValue);
        }

        emit APPROVAL504(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}

contract DappChannel is StandardToken {
    string public constant name590 = "AzimCoin";	//inject NONSTANDARD NAMING
    string public constant symbol750 = "AZI";	//inject NONSTANDARD NAMING
    uint256 public constant decimals638 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant initial_supply225 = 1000000 * (10**decimals638);	//inject NONSTANDARD NAMING
    address public tokenWallet;

    constructor() public {
        totalSupply = initial_supply225;
        tokenWallet = msg.sender;
        balances[tokenWallet] = totalSupply;
    }
}