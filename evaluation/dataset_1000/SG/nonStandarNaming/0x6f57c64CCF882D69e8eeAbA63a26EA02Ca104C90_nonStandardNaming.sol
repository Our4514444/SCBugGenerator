                                                                 

pragma solidity ^0.5.8;
// This is a token designed to research Impermanent Loss in an LP. Do not purchase! Token creator will not be liable for any financial damage or loss.//
                                                                                          

library SafeMath {
    function MUL105(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function DIV746(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB290(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD350(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

       
contract Token {
    uint256 public totalSupply;

    function BALANCEOF737(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER0(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE8(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM157(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE391(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER321(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL529(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract StandardToken is Token {
    using SafeMath for uint256;
    mapping(address => mapping (address => uint256)) internal allowed;
    mapping(address => uint256) balances;

                                                                                                                                                               
    function TRANSFER0(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(balances[msg.sender] >= _value && balances[_to].ADD350(_value) >= balances[_to]);

        balances[msg.sender] = balances[msg.sender].SUB290(_value);
        balances[_to] = balances[_to].ADD350(_value);

        emit TRANSFER321(msg.sender, _to, _value);
        return true;
    }

                                                                                                                                                                                                               
    function BALANCEOF737(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }


                                                                                                                                                                                                                                                                                     
    function TRANSFERFROM157(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].SUB290(_value);
        balances[_to] = balances[_to].ADD350(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB290(_value);

        emit TRANSFER321(_from, _to, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE391(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;

        emit APPROVAL529(msg.sender, _spender, _value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                 
    function ALLOWANCE8(address _owner, address _spender) public view returns (uint256 remaining) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

                                                                                                                                                                                                                                                  
    function INCREASEAPPROVAL880(address _spender, uint256 _addedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD350(_addedValue);

        emit APPROVAL529(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL128(address _spender, uint256 _subtractedValue) public returns (bool success) {	//inject NONSTANDARD NAMING
        uint256 oldValue = allowed[msg.sender][_spender];

        if (_subtractedValue > oldValue) {
          allowed[msg.sender][_spender] = 0;
        } else {
          allowed[msg.sender][_spender] = oldValue.SUB290(_subtractedValue);
        }

        emit APPROVAL529(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}

contract DappChannel is StandardToken {
    string public constant name922 = "xKAI Finance";	//inject NONSTANDARD NAMING
    string public constant symbol847 = "XKAI";	//inject NONSTANDARD NAMING
    uint256 public constant decimals300 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant initial_supply863 = 100000 * (10**decimals300);	//inject NONSTANDARD NAMING
    address public tokenWallet;

    constructor() public {
        totalSupply = initial_supply863;
        tokenWallet = msg.sender;
        balances[tokenWallet] = totalSupply;
    }
}