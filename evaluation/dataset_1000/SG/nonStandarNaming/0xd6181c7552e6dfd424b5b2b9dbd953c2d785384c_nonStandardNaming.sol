                                                                 

pragma solidity ^0.5.1;

interface ERC20 {
    function BALANCEOF231(address _owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE884(address _owner, address _spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER893(address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM751(address _from, address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE428(address _spender, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER30(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL646(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function MUL274(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV121(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        return c;
    }

    function SUB676(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD210(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract BEANSFARM is ERC20 {
    using SafeMath for uint256;
    address private deployer;
    string public name = "BEANS @ beans.farm";
    string public symbol = "BEANS";
    uint8 public constant decimals711 = 8;	//inject NONSTANDARD NAMING
    uint256 public constant decimalfactor725 = 10 ** uint256(decimals711);	//inject NONSTANDARD NAMING
    uint256 public constant totalsupply221 = 1000 * decimalfactor725;	//inject NONSTANDARD NAMING
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) internal allowed;

    event TRANSFER30(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL646(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    constructor() public {
        balances[msg.sender] = totalsupply221;
        deployer = msg.sender;
        emit TRANSFER30(address(0), msg.sender, totalsupply221);
    }

    function BALANCEOF231(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

    function ALLOWANCE884(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

    function TRANSFER893(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[msg.sender] = balances[msg.sender].SUB676(_value);
        balances[_to] = balances[_to].ADD210(_value);
        emit TRANSFER30(msg.sender, _to, _value);
        return true;
    }

    function TRANSFERFROM751(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[_from] = balances[_from].SUB676(_value);
        balances[_to] = balances[_to].ADD210(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB676(_value);
        emit TRANSFER30(_from, _to, _value);
        return true;
    }

    function APPROVE428(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL646(msg.sender, _spender, _value);
        return true;
    }

    function INCREASEAPPROVAL783(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD210(_addedValue);
        emit APPROVAL646(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL948(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB676(_subtractedValue);
        }
        emit APPROVAL646(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}