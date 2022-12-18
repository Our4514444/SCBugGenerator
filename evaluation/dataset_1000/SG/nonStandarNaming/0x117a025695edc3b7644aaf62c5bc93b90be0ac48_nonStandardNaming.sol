                                                                 

pragma solidity ^0.5.1;

interface ERC20 {
    function BALANCEOF467(address _owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE796(address _owner, address _spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER331(address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM222(address _from, address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE668(address _spender, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER219(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL557(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function MUL204(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV541(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        return c;
    }

    function SUB379(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD976(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract BUG is ERC20 {
    using SafeMath for uint256;
    address private deployer;
    string public name = "BUG Finance";
    string public symbol = "BUG";
    uint8 public constant decimals285 = 2;	//inject NONSTANDARD NAMING
    uint256 public constant decimalfactor300 = 10 ** uint256(decimals285);	//inject NONSTANDARD NAMING
    uint256 public constant totalsupply164 = 20000 * decimalfactor300;	//inject NONSTANDARD NAMING
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) internal allowed;

    event TRANSFER219(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL557(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    constructor() public {
        balances[msg.sender] = totalsupply164;
        deployer = msg.sender;
        emit TRANSFER219(address(0), msg.sender, totalsupply164);
    }

    function BALANCEOF467(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

    function ALLOWANCE796(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

    function TRANSFER331(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[msg.sender] = balances[msg.sender].SUB379(_value);
        balances[_to] = balances[_to].ADD976(_value);
        emit TRANSFER219(msg.sender, _to, _value);
        return true;
    }

    function TRANSFERFROM222(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[_from] = balances[_from].SUB379(_value);
        balances[_to] = balances[_to].ADD976(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB379(_value);
        emit TRANSFER219(_from, _to, _value);
        return true;
    }

    function APPROVE668(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL557(msg.sender, _spender, _value);
        return true;
    }

    function INCREASEAPPROVAL379(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD976(_addedValue);
        emit APPROVAL557(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL816(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB379(_subtractedValue);
        }
        emit APPROVAL557(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}