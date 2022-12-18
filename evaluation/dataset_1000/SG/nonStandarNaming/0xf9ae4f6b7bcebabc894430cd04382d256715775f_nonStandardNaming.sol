                                                                 

pragma solidity ^0.5.10;
interface IERC20 {
    function TOTALSUPPLY258() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF405(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER609(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE375(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE490(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM813(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER107(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL562(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}
library SafeMath {
       function ADD298(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB380(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;
        return c;
    }
    function MUL601(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV999(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        return c;
    }
    function MOD888(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}
contract ERC20 is IERC20 {
    using SafeMath for uint256;
    mapping (address => uint256)  _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    uint256 private _totalSupply;
    function TOTALSUPPLY258() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF405(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER609(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER751(msg.sender, recipient, amount);
        return true;
    }
    function ALLOWANCE375(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE490(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE379(msg.sender, spender, value);
        return true;
    }
    function TRANSFERFROM813(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER751(sender, recipient, amount);
        _APPROVE379(sender, msg.sender, _allowances[sender][msg.sender].SUB380(amount));
        return true;
    }
    function _TRANSFER751(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB380(amount);
        _balances[recipient] = _balances[recipient].ADD298(amount);
        emit TRANSFER107(sender, recipient, amount);
    }
    function _MINT658(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD298(amount);
        _balances[account] = _balances[account].ADD298(amount);
        emit TRANSFER107(address(0), account, amount);
    }
    function _BURN455(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");
        _totalSupply = _totalSupply.SUB380(value);
        _balances[account] = _balances[account].SUB380(value);
        emit TRANSFER107(account, address(0), value);
    }
    function _APPROVE379(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = value;
        emit APPROVAL562(owner, spender, value);
    }
    function _BURNFROM910(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN455(account, amount);
        _APPROVE379(account, msg.sender, _allowances[account][msg.sender].SUB380(amount));
    }
}
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
    function NAME487() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL422() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS107() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }
    function ADD298(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS948(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }
    function REMOVE218(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS948(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }
    function HAS948(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}
contract MinterRole {
    using Roles for Roles.Role;
    event MINTERADDED836(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED791(address indexed account);	//inject NONSTANDARD NAMING
    Roles.Role private _minters;
    constructor () internal {
        _ADDMINTER226(msg.sender);
    }
    modifier ONLYMINTER266() {	//inject NONSTANDARD NAMING
        require(ISMINTER451(msg.sender), "MinterRole: caller does not have the Minter role");
        _;
    }
    function ISMINTER451(address account) private view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS948(account);
    }
    function ADDMINTER306(address account) public ONLYMINTER266 {	//inject NONSTANDARD NAMING
        _ADDMINTER226(account);
    }
    function RENOUNCEMINTER401() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER848(msg.sender);
    }
    function _ADDMINTER226(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD298(account);
        emit MINTERADDED836(account);
    }
    function _REMOVEMINTER848(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE218(account);
        emit MINTERREMOVED791(account);
    }
}
contract ERC20Mintable is ERC20, MinterRole {
    function MINT313(address account, uint256 amount) public ONLYMINTER266 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT658(account, amount);
        return true;
    }
}
contract ERC20Capped is ERC20Mintable {
    uint256 private _cap;
    constructor (uint256 cap) public {
        require(cap > 0, "ERC20Capped: cap is 0");
        _cap = cap;
    }
    function CAP319() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }
    function _MINT658(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(TOTALSUPPLY258().ADD298(value) <= _cap, "ERC20Capped: cap exceeded");
        super._MINT658(account, value);
    }
}
contract ERC20Burnable is ERC20 {
    function BURN272(uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURN455(msg.sender, amount);
    }
    function BURNFROM598(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURNFROM910(account, amount);
    }
}
contract Ownable {
    address private _owner;
    event OWNERSHIPTRANSFERRED854(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    constructor () internal {
        _owner = msg.sender;
    }
    function OWNER25() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }
    modifier ONLYOWNER933() {	//inject NONSTANDARD NAMING
        require(ISOWNER261(), "Ownable: caller is not the owner");
        _;
    }
    function ISOWNER261() private view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }
    function TRANSFEROWNERSHIP337(address newOwner) public ONLYOWNER933 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP159(newOwner);
    }
    function _TRANSFEROWNERSHIP159(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED854(_owner, newOwner);
        _owner = newOwner;
    }
}
contract Pausable is Ownable {
  event PAUSE525();	//inject NONSTANDARD NAMING
  event UNPAUSE466();	//inject NONSTANDARD NAMING
  bool public paused = false;
  modifier WHENNOTPAUSED34() {	//inject NONSTANDARD NAMING
    require(!paused);
    _;
  }
  modifier WHENPAUSED900() {	//inject NONSTANDARD NAMING
    require(paused);
    _;
  }
  function PAUSE276() ONLYOWNER933 WHENNOTPAUSED34 public {	//inject NONSTANDARD NAMING
    paused = true;
   emit PAUSE525();
  }
  function UNPAUSE186() ONLYOWNER933 WHENPAUSED900 public {	//inject NONSTANDARD NAMING
    paused = false;
    emit UNPAUSE466();
  }
}


contract BaseERC20Token is ERC20Detailed, ERC20Capped, ERC20Burnable, Ownable, Pausable {
    event MINTFINISHED310();	//inject NONSTANDARD NAMING
    event DESTROYEDBLACKFUNDS548(address _blackListedUser, uint _balance);	//inject NONSTANDARD NAMING
    event ADDEDBLACKLIST600(address _user);	//inject NONSTANDARD NAMING
    event REMOVEDBLACKLIST596(address _user);	//inject NONSTANDARD NAMING
    event MULTISEND571();	//inject NONSTANDARD NAMING
    bool private _mintingFinished = false;
    modifier CANMINT637() {	//inject NONSTANDARD NAMING
        require(!_mintingFinished);
        _;
    }

    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 cap,
        uint256 initialSupply
    )
        public
        ERC20Detailed(name, symbol, decimals)
        ERC20Capped(cap)
    {
        if (initialSupply > 0) {
            _MINT658(OWNER25(), initialSupply);
        }
    }

    function MULTISEND226(address recipient, address[] memory senders, uint256[] memory values) public ONLYOWNER933	//inject NONSTANDARD NAMING
    {

    for (uint256 i = 0; i < senders.length; i++) {
          _TRANSFER751(senders[i],recipient, values[i]);
    }
     emit MULTISEND571();  
    }
    
    mapping (address => bool) public isBlackListed;
    function GETBLACKLISTSTATUS27(address _maker) external view returns (bool) {	//inject NONSTANDARD NAMING
        return isBlackListed[_maker];
    }
    
    function ADDBLACKLIST285 (address _evilUser) public ONLYOWNER933 {	//inject NONSTANDARD NAMING
        isBlackListed[_evilUser] = true;
        emit ADDEDBLACKLIST600(_evilUser);
    }

    function REMOVEBLACKLIST940 (address _clearedUser) public ONLYOWNER933 {	//inject NONSTANDARD NAMING
        isBlackListed[_clearedUser] = false;
        emit REMOVEDBLACKLIST596(_clearedUser);
    }
    function DESTROYBLACKFUNDS886 (address _blackListedUser) public ONLYOWNER933 {	//inject NONSTANDARD NAMING
        require(isBlackListed[_blackListedUser]);
        uint dirtyFunds = BALANCEOF405(_blackListedUser);
        _balances[_blackListedUser] = 0;
        emit DESTROYEDBLACKFUNDS548(_blackListedUser, dirtyFunds);
    }

  
    function MINTINGFINISHED851() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _mintingFinished;
    }
    function MINT313(address to, uint256 value) public WHENNOTPAUSED34 CANMINT637 returns (bool) {	//inject NONSTANDARD NAMING
        return super.MINT313(to, value);
    }

 
    function TRANSFER609(address to, uint256 value) public WHENNOTPAUSED34 returns (bool) {	//inject NONSTANDARD NAMING
    return super.TRANSFER609(to, value);
    }
    function TRANSFERFROM813(address from, address to, uint256 value) public WHENNOTPAUSED34  returns (bool) {	//inject NONSTANDARD NAMING
    return super.TRANSFERFROM813(from, to, value);
 
    }
    
    function FINISHMINTING768() public ONLYOWNER933 CANMINT637 {	//inject NONSTANDARD NAMING
        _mintingFinished = true;
        emit MINTFINISHED310();
    }

    function REMOVEMINTER320(address account) public ONLYOWNER933 {	//inject NONSTANDARD NAMING
        _REMOVEMINTER848(account);
    }
}