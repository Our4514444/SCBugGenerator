pragma solidity ^0.5.3;


    interface IERC20 {
    function TRANSFER976(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE804(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM471(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY82() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF763(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE527(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER734(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL243(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


    library SafeMath {

    function MUL333(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING

        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function DIV319(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function SUB314(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    function ADD73(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    function MOD143(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

    contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

    function TOTALSUPPLY82() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF763(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

    function ALLOWANCE527(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

    function TRANSFER976(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER724(msg.sender, to, value);
        return true;
    }

    function APPROVE804(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE922(msg.sender, spender, value);
        return true;
    }

    function TRANSFERFROM471(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER724(from, to, value);
        _APPROVE922(from, msg.sender, _allowed[from][msg.sender].SUB314(value));
        return true;
    }

    function INCREASEALLOWANCE292(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE922(msg.sender, spender, _allowed[msg.sender][spender].ADD73(addedValue));
        return true;
    }

    function DECREASEALLOWANCE711(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE922(msg.sender, spender, _allowed[msg.sender][spender].SUB314(subtractedValue));
        return true;
    }

    function _TRANSFER724(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB314(value);
        _balances[to] = _balances[to].ADD73(value);
        emit TRANSFER734(from, to, value);
    }

    function _MINT467(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD73(value);
        _balances[account] = _balances[account].ADD73(value);
        emit TRANSFER734(address(0), account, value);
    }

    function _BURN998(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB314(value);
        _balances[account] = _balances[account].SUB314(value);
        emit TRANSFER734(account, address(0), value);
    }

    function _APPROVE922(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL243(owner, spender, value);
    }

    function _BURNFROM76(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN998(account, value);
        _APPROVE922(account, msg.sender, _allowed[account][msg.sender].SUB314(value));
    }
}

    contract ERC20Burnable is ERC20 {

    function BURN100(uint256 value) public {	//inject NONSTANDARD NAMING
        _BURN998(msg.sender, value);
    }

    function BURNFROM877(address from, uint256 value) public {	//inject NONSTANDARD NAMING
        _BURNFROM76(from, value);
    }
}

    library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

    function ADD73(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS468(role, account));

        role.bearer[account] = true;
    }

    function REMOVE431(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS468(role, account));

        role.bearer[account] = false;
    }

    function HAS468(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

contract PauserRole {
    using Roles for Roles.Role;

    event PAUSERADDED585(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED655(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    constructor () internal {
        _ADDPAUSER314(msg.sender);
    }

    modifier ONLYPAUSER850() {	//inject NONSTANDARD NAMING
        require(ISPAUSER226(msg.sender));
        _;
    }

    function ISPAUSER226(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS468(account);
    }

    function ADDPAUSER993(address account) public ONLYPAUSER850 {	//inject NONSTANDARD NAMING
        _ADDPAUSER314(account);
    }

    function RENOUNCEPAUSER89() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER743(msg.sender);
    }

    function _ADDPAUSER314(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD73(account);
        emit PAUSERADDED585(account);
    }

    function _REMOVEPAUSER743(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE431(account);
        emit PAUSERREMOVED655(account);
    }
}

    contract Pausable is PauserRole {
    event PAUSED485(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED44(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

    function PAUSED424() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

    modifier WHENNOTPAUSED397() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

    modifier WHENPAUSED230() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

    function PAUSE863() public ONLYPAUSER850 WHENNOTPAUSED397 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED485(msg.sender);
    }

    function UNPAUSE457() public ONLYPAUSER850 WHENPAUSED230 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED44(msg.sender);
    }
}

    contract ERC20Pausable is ERC20, Pausable {
    function TRANSFER976(address to, uint256 value) public WHENNOTPAUSED397 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER976(to, value);
    }

    function TRANSFERFROM471(address from, address to, uint256 value) public WHENNOTPAUSED397 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM471(from, to, value);
    }

    function APPROVE804(address spender, uint256 value) public WHENNOTPAUSED397 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE804(spender, value);
    }

    function INCREASEALLOWANCE292(address spender, uint addedValue) public WHENNOTPAUSED397 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE292(spender, addedValue);
    }

    function DECREASEALLOWANCE711(address spender, uint subtractedValue) public WHENNOTPAUSED397 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE711(spender, subtractedValue);
    }
}
    contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED796(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED794(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER936(msg.sender);
    }

    modifier ONLYMINTER505() {	//inject NONSTANDARD NAMING
        require(ISMINTER358(msg.sender));
        _;
    }

    function ISMINTER358(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS468(account);
    }

    function ADDMINTER941(address account) public ONLYMINTER505 {	//inject NONSTANDARD NAMING
        _ADDMINTER936(account);
    }

    function RENOUNCEMINTER950() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER290(msg.sender);
    }

    function _ADDMINTER936(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD73(account);
        emit MINTERADDED796(account);
    }

    function _REMOVEMINTER290(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE431(account);
        emit MINTERREMOVED794(account);
    }
}

    contract ERC20Mintable is ERC20, MinterRole {

    function MINT386(address to, uint256 value) public ONLYMINTER505 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT467(to, value);
        return true;
    }
}

    contract Playzone is IERC20, ERC20Burnable, ERC20Pausable, ERC20Mintable {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

    function NAME150() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL574() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS634() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}