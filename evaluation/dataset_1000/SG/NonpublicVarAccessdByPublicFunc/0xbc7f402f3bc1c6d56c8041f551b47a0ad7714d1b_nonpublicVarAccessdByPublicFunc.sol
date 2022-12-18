pragma solidity ^0.5.10;
/*
------------------------------------------------------
    GPYX utility token contract

    Official website:
    https://www.pyrexcoin.com

    Symbol      : GPYX
    Name        : GoldenPyrex
    Total supply: 10000000
    Decimals    : 18
    Audited by t.me/bolpol
    Powered by ILIK.

    Enjoy.
    Released under the MIT License.
----------------------------------------------------
*/


interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Ownable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function owner() public view returns (address) {
        return _owner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    function isOwner() public view returns (bool) {
        return msg.sender == _owner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _owner = address(0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

contract ERC20Detailed {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

    function name() public view returns (string memory) {
        return _name;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function symbol() public view returns (string memory) {
        return _symbol;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function decimals() public view returns (uint8) {
        return _decimals;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}

contract GPYX is IERC20, ERC20Detailed, Ownable {
    event Burn(address indexed from, uint256 value);
    event FrozenFunds(address target, bool frozen);

    uint256 internal totalSupply;

    mapping (address => uint256) private _balances;
    mapping(address => mapping(address=> uint256)) private _allowances;
    mapping(address => bool) internal frozenAccount;

    constructor (
        uint256 initialSupply,
        string memory name,
        string memory symbol,
        uint8 decimals
    )
    public
    ERC20Detailed(name, symbol, decimals)
    {
        totalSupply = initialSupply*10**uint256(decimals);
        _balances[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function _transfer(address _from, address _to, uint256 _value) internal {
        require(_to != address(0));
        require(_balances[_from] >=_value);
        require(_balances[_to] +_value >= _balances[_to]);
        require(!frozenAccount[msg.sender]);
        uint256 previousBalances = _balances[_from ] + _balances[_to];
        _balances[_from] -= _value;
        _balances[_to] += _value;
        emit Transfer (_from, _to, _value);
        assert(_balances[_from] + _balances[_to] == previousBalances);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= _allowances[_from][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _allowances[_from][msg.sender] -=_value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _transfer(_from,_to, _value);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function approve(address _spender, uint256 _value) public onlyOwner returns (bool success) {
        _allowances[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function balanceOf(address _who) public view returns (uint256 balance) {
        return _balances[_who];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function burn(uint256 _value) public onlyOwner returns (bool success) {
        require(_balances[msg.sender] >= _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _balances[msg.sender] -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSupply -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Burn(msg.sender, _value);
        return true;
    }

    function burnFrom(address _from, uint256 _value) public onlyOwner returns (bool success) {
        require(_balances[_from] >= _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(_value <= _allowances[_from][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _balances[_from] -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSupply -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Burn(msg.sender, _value);
        return true;
    }

    function freezeAccount(address target) public onlyOwner returns (bool frozen) {
        frozenAccount[target] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit FrozenFunds (target, true);
        return true;
    }

    function unfreezeAccount(address target) public onlyOwner returns (bool frozen) {
        frozenAccount[target] = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit FrozenFunds (target, false);
        return true;
    }
}