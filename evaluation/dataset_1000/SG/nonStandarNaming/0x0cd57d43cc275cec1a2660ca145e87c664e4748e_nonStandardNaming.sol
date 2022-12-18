                                                                 

pragma solidity ^0.5.1;

interface ERC20 {
    function BALANCEOF338(address _owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE865(address _owner, address _spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER892(address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM944(address _from, address _to, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE922(address _spender, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER411(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL129(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function MUL763(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV472(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        return c;
    }

    function SUB746(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD10(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract ApClyde_token is ERC20 {
    using SafeMath for uint256;
    address private deployer;
    string public name = "ApClyde.com";
    string public symbol = "APCL";
    uint8 public constant decimals852 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant decimalfactor140 = 10 ** uint256(decimals852);	//inject NONSTANDARD NAMING
    uint256 public constant totalsupply410 = 500000 * decimalfactor140;	//inject NONSTANDARD NAMING
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) internal allowed;

    event TRANSFER411(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL129(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    constructor() public {
        balances[msg.sender] = totalsupply410;
        deployer = msg.sender;
        emit TRANSFER411(address(0), msg.sender, totalsupply410);
    }

    function BALANCEOF338(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

    function ALLOWANCE865(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

    function TRANSFER892(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[msg.sender] = balances[msg.sender].SUB746(_value);
        balances[_to] = balances[_to].ADD10(_value);
        emit TRANSFER411(msg.sender, _to, _value);
        return true;
    }

    function TRANSFERFROM944(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        require(block.timestamp >= 1545102693);

        balances[_from] = balances[_from].SUB746(_value);
        balances[_to] = balances[_to].ADD10(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB746(_value);
        emit TRANSFER411(_from, _to, _value);
        return true;
    }

    function APPROVE922(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL129(msg.sender, _spender, _value);
        return true;
    }

    function INCREASEAPPROVAL347(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD10(_addedValue);
        emit APPROVAL129(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL869(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB746(_subtractedValue);
        }
        emit APPROVAL129(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}