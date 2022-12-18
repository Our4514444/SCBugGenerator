pragma solidity ^0.5.0;

contract owned {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER212 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    function TRANSFEROWNERSHIP966(address newOwner) ONLYOWNER212 public {	//inject NONSTANDARD NAMING
        owner = newOwner;
    }
}

contract TokenERC20 {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event TRANSFER823(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL295(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
	
    constructor (
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        name = tokenName;
        symbol = tokenSymbol;
    }

    function _TRANSFER382(address _from, address _to, uint _value) internal {	//inject NONSTANDARD NAMING
        require(_to != address(0x0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit TRANSFER823(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
    function TRANSFER872(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        _TRANSFER382(msg.sender, _to, _value);
        return true;
    }

    function TRANSFERFROM78(address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _TRANSFER382(_from, _to, _value);
        return true;
    }
	
    function APPROVE492(address _spender, uint256 _value) public	//inject NONSTANDARD NAMING
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
		emit APPROVAL295(msg.sender, _spender, _value);
        return true;
    }
}

contract A0101Token is owned, TokenERC20 {

    mapping (address => bool) public frozenAccount;

    event FROZENFUNDS642(address target, bool frozen);	//inject NONSTANDARD NAMING

    constructor (
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) TokenERC20(initialSupply, tokenName, tokenSymbol) public {}

    function _TRANSFER382(address _from, address _to, uint _value) internal {	//inject NONSTANDARD NAMING
        require(_to != address(0x0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        require(!frozenAccount[_from]);
        require(!frozenAccount[_to]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit TRANSFER823(_from, _to, _value);
    }

    function MINTTOKEN340(address target, uint256 mintedAmount) ONLYOWNER212 public {	//inject NONSTANDARD NAMING
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        emit TRANSFER823(address(0), owner, mintedAmount);
        emit TRANSFER823(owner, target, mintedAmount);
    }

    function FREEZEACCOUNT695(address target, bool freeze) ONLYOWNER212 public {	//inject NONSTANDARD NAMING
        frozenAccount[target] = freeze;
        emit FROZENFUNDS642(target, freeze);
    }
}