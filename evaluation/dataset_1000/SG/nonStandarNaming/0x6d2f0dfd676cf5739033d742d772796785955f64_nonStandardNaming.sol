                                                                 

pragma solidity ^0.5.1;

interface ERC20 {
    function BALANCEOF373(address _owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE985(address _owner, address _spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER583(address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM281(address _from, address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE858(address _spender, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER600(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL577(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function MUL598(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV869(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        return c;
    }

    function SUB683(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD420(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract ElfFinance is ERC20 {
    using SafeMath for uint256;
    address private deployer;
    string public name = "ELF Finance";
    string public symbol = "ELF";
    uint8 public constant decimals887 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant decimalfactor145 = 10 ** uint256(decimals887);	//inject NONSTANDARD NAMING
    uint256 public constant totalsupply90 = 20000 * decimalfactor145;	//inject NONSTANDARD NAMING
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) internal allowed;

    event TRANSFER600(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL577(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    constructor() public {
        balances[msg.sender] = totalsupply90;
        deployer = msg.sender;
        emit TRANSFER600(address(0), msg.sender, totalsupply90);
    }

    function BALANCEOF373(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

    function ALLOWANCE985(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

    function TRANSFER583(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
      

        balances[msg.sender] = balances[msg.sender].SUB683(_value);
        balances[_to] = balances[_to].ADD420(_value);
        emit TRANSFER600(msg.sender, _to, _value);
        return true;
    }

    function TRANSFERFROM281(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
       

        balances[_from] = balances[_from].SUB683(_value);
        balances[_to] = balances[_to].ADD420(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB683(_value);
        emit TRANSFER600(_from, _to, _value);
        return true;
    }

    function APPROVE858(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL577(msg.sender, _spender, _value);
        return true;
    }

    function INCREASEAPPROVAL898(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD420(_addedValue);
        emit APPROVAL577(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL13(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB683(_subtractedValue);
        }
        emit APPROVAL577(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}