                                                                 

pragma solidity ^0.5.1;

interface ERC20 {
    function BALANCEOF54(address _owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE387(address _owner, address _spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER42(address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM700(address _from, address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE686(address _spender, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER116(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL721(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function MUL511(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV222(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        return c;
    }

    function SUB758(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD556(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract SpiderFinance is ERC20 {
    using SafeMath for uint256;
    address private deployer;
    string public name = "Spider Finance";
    string public symbol = "SPID";
    uint8 public constant decimals675 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant decimalfactor850 = 10 ** uint256(decimals675);	//inject NONSTANDARD NAMING
    uint256 public constant totalsupply592 = 30000 * decimalfactor850;	//inject NONSTANDARD NAMING
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) internal allowed;

    event TRANSFER116(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL721(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    constructor() public {
        balances[msg.sender] = totalsupply592;
        deployer = msg.sender;
        emit TRANSFER116(address(0), msg.sender, totalsupply592);
    }

    function BALANCEOF54(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

    function ALLOWANCE387(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

    function TRANSFER42(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[msg.sender] = balances[msg.sender].SUB758(_value);
        balances[_to] = balances[_to].ADD556(_value);
        emit TRANSFER116(msg.sender, _to, _value);
        return true;
    }

    function TRANSFERFROM700(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[_from] = balances[_from].SUB758(_value);
        balances[_to] = balances[_to].ADD556(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB758(_value);
        emit TRANSFER116(_from, _to, _value);
        return true;
    }

    function APPROVE686(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL721(msg.sender, _spender, _value);
        return true;
    }

    function INCREASEAPPROVAL338(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD556(_addedValue);
        emit APPROVAL721(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL168(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB758(_subtractedValue);
        }
        emit APPROVAL721(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}