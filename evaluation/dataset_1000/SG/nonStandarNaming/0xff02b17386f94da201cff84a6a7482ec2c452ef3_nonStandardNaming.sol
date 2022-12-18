pragma solidity ^0.5.2;

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

                                                                                        
interface IERC20 {
    function TRANSFER286(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE35(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM334(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY79() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF850(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE391(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER315(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL119(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

                                                                                                   
library SafeMath {
                                                                                
    function MUL143(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                         
    function DIV870(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB939(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD89(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD217(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                             
    function TOTALSUPPLY79() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF850(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE391(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER286(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER826(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE35(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL119(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM334(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB939(value);
        _TRANSFER826(from, to, value);
        emit APPROVAL119(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE92(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD89(addedValue);
        emit APPROVAL119(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE771(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB939(subtractedValue);
        emit APPROVAL119(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER826(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB939(value);
        _balances[to] = _balances[to].ADD89(value);
        emit TRANSFER315(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT270(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD89(value);
        _balances[account] = _balances[account].ADD89(value);
        emit TRANSFER315(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN770(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB939(value);
        _balances[account] = _balances[account].SUB939(value);
        emit TRANSFER315(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM574(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _allowed[account][msg.sender] = _allowed[account][msg.sender].SUB939(value);
        _BURN770(account, value);
        emit APPROVAL119(account, msg.sender, _allowed[account][msg.sender]);
    }
}

// File: openzeppelin-solidity/contracts/access/Roles.sol

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD89(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS274(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE76(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS274(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS274(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

// File: openzeppelin-solidity/contracts/access/roles/MinterRole.sol

contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED484(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED381(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER879(msg.sender);
    }

    modifier ONLYMINTER798() {	//inject NONSTANDARD NAMING
        require(ISMINTER159(msg.sender));
        _;
    }

    function ISMINTER159(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS274(account);
    }

    function ADDMINTER30(address account) public ONLYMINTER798 {	//inject NONSTANDARD NAMING
        _ADDMINTER879(account);
    }

    function RENOUNCEMINTER344() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER137(msg.sender);
    }

    function _ADDMINTER879(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD89(account);
        emit MINTERADDED484(account);
    }

    function _REMOVEMINTER137(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE76(account);
        emit MINTERREMOVED381(account);
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol

                                                           
contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                                                                                                                                
    function MINT237(address to, uint256 value) public ONLYMINTER798 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT270(to, value);
        return true;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol

                                                                                           
contract ERC20Burnable is ERC20 {
                                                                                                                    
    function BURN391(uint256 value) public {	//inject NONSTANDARD NAMING
        _BURN770(msg.sender, value);
    }

                                                                                                                                                                                                                                                     
    function BURNFROM289(address from, uint256 value) public {	//inject NONSTANDARD NAMING
        _BURNFROM574(from, value);
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol

                                                                                                                                                                                                                                        
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                     
    function NAME120() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL946() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS667() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: openzeppelin-solidity/contracts/access/roles/PauserRole.sol

contract PauserRole {
    using Roles for Roles.Role;

    event PAUSERADDED890(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED424(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    constructor () internal {
        _ADDPAUSER268(msg.sender);
    }

    modifier ONLYPAUSER912() {	//inject NONSTANDARD NAMING
        require(ISPAUSER170(msg.sender));
        _;
    }

    function ISPAUSER170(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS274(account);
    }

    function ADDPAUSER669(address account) public ONLYPAUSER912 {	//inject NONSTANDARD NAMING
        _ADDPAUSER268(account);
    }

    function RENOUNCEPAUSER265() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER701(msg.sender);
    }

    function _ADDPAUSER268(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD89(account);
        emit PAUSERADDED890(account);
    }

    function _REMOVEPAUSER701(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE76(account);
        emit PAUSERREMOVED424(account);
    }
}

// File: openzeppelin-solidity/contracts/lifecycle/Pausable.sol

                                                                                                                
contract Pausable is PauserRole {
    event PAUSED900(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED610(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

                                                                               
    function PAUSED505() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED561() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED325() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE730() public ONLYPAUSER912 WHENNOTPAUSED561 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED900(msg.sender);
    }

                                                                                   
    function UNPAUSE476() public ONLYPAUSER912 WHENPAUSED325 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED610(msg.sender);
    }
}

// File: contracts/BlacklistAdminRole.sol

contract BlacklistAdminRole {
    using Roles for Roles.Role;

    event BLACKLISTADMINADDED650(address indexed account);	//inject NONSTANDARD NAMING
    event BLACKLISTADMINREMOVED356(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _blacklistAdmins;

    constructor () internal {
        _ADDBLACKLISTADMIN490(msg.sender);
    }

    modifier ONLYBLACKLISTADMIN606() {	//inject NONSTANDARD NAMING
        require(ISBLACKLISTADMIN143(msg.sender));
        _;
    }

    function ISBLACKLISTADMIN143(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _blacklistAdmins.HAS274(account);
    }

    function ADDBLACKLISTADMIN213(address account) public ONLYBLACKLISTADMIN606 {	//inject NONSTANDARD NAMING
        _ADDBLACKLISTADMIN490(account);
    }

    function RENOUNCEBLACKLISTADMIN474() public {	//inject NONSTANDARD NAMING
        _REMOVEBLACKLISTADMIN893(msg.sender);
    }

    function _ADDBLACKLISTADMIN490(address account) internal {	//inject NONSTANDARD NAMING
        _blacklistAdmins.ADD89(account);
        emit BLACKLISTADMINADDED650(account);
    }

    function _REMOVEBLACKLISTADMIN893(address account) internal {	//inject NONSTANDARD NAMING
        _blacklistAdmins.REMOVE76(account);
        emit BLACKLISTADMINREMOVED356(account);
    }
}

// File: contracts/BlacklistedRole.sol

contract BlacklistedRole is BlacklistAdminRole {
    using Roles for Roles.Role;

    event BLACKLISTEDADDED271(address indexed account);	//inject NONSTANDARD NAMING
    event BLACKLISTEDREMOVED21(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _blacklisteds;

    modifier ONLYBLACKLISTED114() {	//inject NONSTANDARD NAMING
        require(ISBLACKLISTED790(msg.sender));
        _;
    }

    modifier ONLYNOTBLACKLISTED355() {	//inject NONSTANDARD NAMING
        require(!ISBLACKLISTED790(msg.sender));
        _;
    }

    function ISBLACKLISTED790(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _blacklisteds.HAS274(account);
    }

    function ADDBLACKLISTED821(address account) public ONLYBLACKLISTADMIN606 {	//inject NONSTANDARD NAMING
        _ADDBLACKLISTED52(account);
    }

    function REMOVEBLACKLISTED176(address account) public ONLYBLACKLISTADMIN606 {	//inject NONSTANDARD NAMING
        _REMOVEBLACKLISTED803(account);
    }

    function RENOUNCEBLACKLISTED523() public {	//inject NONSTANDARD NAMING
        _REMOVEBLACKLISTED803(msg.sender);
    }

    function _ADDBLACKLISTED52(address account) internal {	//inject NONSTANDARD NAMING
        _blacklisteds.ADD89(account);
        emit BLACKLISTEDADDED271(account);
    }

    function _REMOVEBLACKLISTED803(address account) internal {	//inject NONSTANDARD NAMING
        _blacklisteds.REMOVE76(account);
        emit BLACKLISTEDREMOVED21(account);
    }
}

// File: contracts/RingTokenPausable.sol

                                                                                 
contract RingTokenPausable is ERC20, Pausable, BlacklistedRole {
    function TRANSFER286(address to, uint256 value) public WHENNOTPAUSED561 ONLYNOTBLACKLISTED355 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER286(to, value);
    }

    function TRANSFERFROM334(address from, address to, uint256 value) public WHENNOTPAUSED561 ONLYNOTBLACKLISTED355 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM334(from, to, value);
    }

    function APPROVE35(address spender, uint256 value) public WHENNOTPAUSED561 ONLYNOTBLACKLISTED355 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE35(spender, value);
    }

    function INCREASEALLOWANCE92(address spender, uint addedValue) public WHENNOTPAUSED561 ONLYNOTBLACKLISTED355 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE92(spender, addedValue);
    }

    function DECREASEALLOWANCE771(address spender, uint subtractedValue) public WHENNOTPAUSED561 ONLYNOTBLACKLISTED355 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE771(spender, subtractedValue);
    }
}

// File: contracts/RingCasinoCoin.sol

contract RingCasinoCoin is ERC20Detailed, ERC20Burnable, ERC20Mintable, RingTokenPausable {
    uint8 public constant decimals288 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant initial_supply320 = 3000000000 * (10 ** uint256(decimals288));	//inject NONSTANDARD NAMING

    constructor () public ERC20Detailed("Ring Casino Coin", "RCC", decimals288) {
        _MINT270(msg.sender, initial_supply320);
    }
}