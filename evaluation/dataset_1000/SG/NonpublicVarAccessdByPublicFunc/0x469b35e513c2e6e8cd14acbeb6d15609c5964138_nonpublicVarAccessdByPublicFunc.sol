pragma solidity ^0.5.0;

contract owned {
    address internal owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        owner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}

contract TokenERC20 {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 internal totalSupply;

    mapping (address => uint256) internal balanceOf;
    mapping (address => mapping (address => uint256)) internal allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
	
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

    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != address(0x0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     // Check allowance	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        allowance[_from][msg.sender] -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _transfer(_from, _to, _value);
        return true;
    }
	
    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		emit Approval(msg.sender, _spender, _value);
        return true;
    }
}

contract A0101Token is owned, TokenERC20 {

    mapping (address => bool) internal frozenAccount;

    event FrozenFunds(address target, bool frozen);

    constructor (
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) TokenERC20(initialSupply, tokenName, tokenSymbol) public {}

    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != address(0x0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        require(!frozenAccount[_from]);
        require(!frozenAccount[_to]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
    }

    function mintToken(address target, uint256 mintedAmount) onlyOwner public {
        balanceOf[target] += mintedAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSupply += mintedAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(address(0), owner, mintedAmount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(owner, target, mintedAmount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function freezeAccount(address target, bool freeze) onlyOwner public {
        frozenAccount[target] = freeze;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit FrozenFunds(target, freeze);
    }
}