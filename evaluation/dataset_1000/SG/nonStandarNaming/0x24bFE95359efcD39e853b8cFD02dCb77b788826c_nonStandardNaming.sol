                                                                 

pragma solidity ^0.5.1;

interface ERC20 {
    function BALANCEOF876(address _owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE395(address _owner, address _spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER826(address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM374(address _from, address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE926(address _spender, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER646(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL485(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function MUL295(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV245(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        return c;
    }

    function SUB23(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD483(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract SpiderX is ERC20 {
    using SafeMath for uint256;
    address private deployer;
    string public name = "SpiderX";
    string public symbol = "SPIDX";
    uint8 public constant decimals983 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant decimalfactor994 = 10 ** uint256(decimals983);	//inject NONSTANDARD NAMING
    uint256 public constant totalsupply794 = 20000 * decimalfactor994;	//inject NONSTANDARD NAMING
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) internal allowed;

    event TRANSFER646(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL485(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    constructor() public {
        balances[msg.sender] = totalsupply794;
        deployer = msg.sender;
        emit TRANSFER646(address(0), msg.sender, totalsupply794);
    }

    function BALANCEOF876(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

    function ALLOWANCE395(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

    function TRANSFER826(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[msg.sender] = balances[msg.sender].SUB23(_value);
        balances[_to] = balances[_to].ADD483(_value);
        emit TRANSFER646(msg.sender, _to, _value);
        return true;
    }

    function TRANSFERFROM374(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[_from] = balances[_from].SUB23(_value);
        balances[_to] = balances[_to].ADD483(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB23(_value);
        emit TRANSFER646(_from, _to, _value);
        return true;
    }

    function APPROVE926(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL485(msg.sender, _spender, _value);
        return true;
    }

    function INCREASEAPPROVAL685(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD483(_addedValue);
        emit APPROVAL485(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL688(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB23(_subtractedValue);
        }
        emit APPROVAL485(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}