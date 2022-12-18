                                                                 

pragma solidity ^0.5.1;

interface ERC20 {
    function BALANCEOF895(address _owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE250(address _owner, address _spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER244(address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM111(address _from, address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE618(address _spender, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER164(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL895(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function MUL533(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV259(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        return c;
    }

    function SUB921(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD781(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract CROW is ERC20 {
    using SafeMath for uint256;
    address private deployer;
    string public name = "CROW Finance";
    string public symbol = "CROW";
    uint8 public constant decimals180 = 2;	//inject NONSTANDARD NAMING
    uint256 public constant decimalfactor137 = 10 ** uint256(decimals180);	//inject NONSTANDARD NAMING
    uint256 public constant totalsupply863 = 20000 * decimalfactor137;	//inject NONSTANDARD NAMING
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) internal allowed;

    event TRANSFER164(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL895(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    constructor() public {
        balances[msg.sender] = totalsupply863;
        deployer = msg.sender;
        emit TRANSFER164(address(0), msg.sender, totalsupply863);
    }

    function BALANCEOF895(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

    function ALLOWANCE250(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

    function TRANSFER244(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[msg.sender] = balances[msg.sender].SUB921(_value);
        balances[_to] = balances[_to].ADD781(_value);
        emit TRANSFER164(msg.sender, _to, _value);
        return true;
    }

    function TRANSFERFROM111(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[_from] = balances[_from].SUB921(_value);
        balances[_to] = balances[_to].ADD781(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB921(_value);
        emit TRANSFER164(_from, _to, _value);
        return true;
    }

    function APPROVE618(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL895(msg.sender, _spender, _value);
        return true;
    }

    function INCREASEAPPROVAL42(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD781(_addedValue);
        emit APPROVAL895(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL457(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB921(_subtractedValue);
        }
        emit APPROVAL895(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}