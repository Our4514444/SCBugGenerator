pragma solidity ^0.5.10;
                                                                                                                                                                                                                                                                                                                                                                                                            


interface IERC20 {
    function TOTALSUPPLY651() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF84(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

    function TRANSFER789(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE157(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    function APPROVE236(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM762(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER778(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL455(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED749(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED749(address(0), _owner);
    }

    function OWNER759() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

    modifier ONLYOWNER272() {	//inject NONSTANDARD NAMING
        require(ISOWNER771(), "Ownable: caller is not the owner");
        _;
    }

    function ISOWNER771() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

    function RENOUNCEOWNERSHIP960() public ONLYOWNER272 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED749(_owner, address(0));
        _owner = address(0);
    }

    function TRANSFEROWNERSHIP871(address newOwner) public ONLYOWNER272 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP445(newOwner);
    }

    function _TRANSFEROWNERSHIP445(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED749(_owner, newOwner);
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

    function NAME536() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL43() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS956() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

contract GPYX is IERC20, ERC20Detailed, Ownable {
    event BURN126(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
    event FROZENFUNDS21(address target, bool frozen);	//inject NONSTANDARD NAMING

    uint256 public totalSupply;

    mapping (address => uint256) private _balances;
    mapping(address => mapping(address=> uint256)) private _allowances;
    mapping(address => bool) public frozenAccount;

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
        emit TRANSFER778(address(0), msg.sender, totalSupply);
    }

    function _TRANSFER336(address _from, address _to, uint256 _value) internal {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_balances[_from] >=_value);
        require(_balances[_to] +_value >= _balances[_to]);
        require(!frozenAccount[msg.sender]);
        uint256 previousBalances = _balances[_from ] + _balances[_to];
        _balances[_from] -= _value;
        _balances[_to] += _value;
        emit TRANSFER778 (_from, _to, _value);
        assert(_balances[_from] + _balances[_to] == previousBalances);
    }

    function TRANSFER789(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        _TRANSFER336(msg.sender, _to, _value);
        return true;
    }

    function TRANSFERFROM762(address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_value <= _allowances[_from][msg.sender]);
        _allowances[_from][msg.sender] -=_value;
        _TRANSFER336(_from,_to, _value);
        return true;
    }

    function ALLOWANCE157(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE236(address _spender, uint256 _value) public ONLYOWNER272 returns (bool success) {	//inject NONSTANDARD NAMING
        _allowances[msg.sender][_spender] = _value;
        emit APPROVAL455(msg.sender, _spender, _value);
        return true;
    }

    function BALANCEOF84(address _who) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return _balances[_who];
    }

    function BURN173(uint256 _value) public ONLYOWNER272 returns (bool success) {	//inject NONSTANDARD NAMING
        require(_balances[msg.sender] >= _value);
        _balances[msg.sender] -= _value;
        totalSupply -= _value;
        emit BURN126(msg.sender, _value);
        return true;
    }

    function BURNFROM491(address _from, uint256 _value) public ONLYOWNER272 returns (bool success) {	//inject NONSTANDARD NAMING
        require(_balances[_from] >= _value);
        require(_value <= _allowances[_from][msg.sender]);
        _balances[_from] -= _value;
        totalSupply -= _value;
        emit BURN126(msg.sender, _value);
        return true;
    }

    function FREEZEACCOUNT978(address target) public ONLYOWNER272 returns (bool frozen) {	//inject NONSTANDARD NAMING
        frozenAccount[target] = true;
        emit FROZENFUNDS21 (target, true);
        return true;
    }

    function UNFREEZEACCOUNT773(address target) public ONLYOWNER272 returns (bool frozen) {	//inject NONSTANDARD NAMING
        frozenAccount[target] = false;
        emit FROZENFUNDS21 (target, false);
        return true;
    }
}