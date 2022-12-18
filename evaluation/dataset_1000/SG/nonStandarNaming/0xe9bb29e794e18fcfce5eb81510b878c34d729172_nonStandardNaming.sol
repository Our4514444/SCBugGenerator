// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER892(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE56(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM533(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY924() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF74(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE18(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER583(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL931(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL938(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV473(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB82(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD813(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD323(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20.sol

pragma solidity ^0.5.2;



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY924() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF74(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE18(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER892(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER850(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE56(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE74(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM533(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER850(from, to, value);
        _APPROVE74(from, msg.sender, _allowed[from][msg.sender].SUB82(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE324(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE74(msg.sender, spender, _allowed[msg.sender][spender].ADD813(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE439(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE74(msg.sender, spender, _allowed[msg.sender][spender].SUB82(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER850(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB82(value);
        _balances[to] = _balances[to].ADD813(value);
        emit TRANSFER583(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT676(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD813(value);
        _balances[account] = _balances[account].ADD813(value);
        emit TRANSFER583(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN236(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB82(value);
        _balances[account] = _balances[account].SUB82(value);
        emit TRANSFER583(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE74(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL931(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM258(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN236(account, value);
        _APPROVE74(account, msg.sender, _allowed[account][msg.sender].SUB82(value));
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol

pragma solidity ^0.5.2;


                                                                                                                                                                                                                                        
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                     
    function NAME215() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL480() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS10() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol

pragma solidity ^0.5.2;


                                                                                           
contract ERC20Burnable is ERC20 {
                                                                                                                    
    function BURN762(uint256 value) public {	//inject NONSTANDARD NAMING
        _BURN236(msg.sender, value);
    }

                                                                                                                                                                                                                                                
    function BURNFROM134(address from, uint256 value) public {	//inject NONSTANDARD NAMING
        _BURNFROM258(from, value);
    }
}

// File: openzeppelin-solidity/contracts/access/Roles.sol

pragma solidity ^0.5.2;

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD813(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS473(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE916(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS473(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS473(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

// File: openzeppelin-solidity/contracts/access/roles/MinterRole.sol

pragma solidity ^0.5.2;


contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED234(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED306(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER500(msg.sender);
    }

    modifier ONLYMINTER480() {	//inject NONSTANDARD NAMING
        require(ISMINTER743(msg.sender));
        _;
    }

    function ISMINTER743(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS473(account);
    }

    function ADDMINTER602(address account) public ONLYMINTER480 {	//inject NONSTANDARD NAMING
        _ADDMINTER500(account);
    }

    function RENOUNCEMINTER658() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER804(msg.sender);
    }

    function _ADDMINTER500(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD813(account);
        emit MINTERADDED234(account);
    }

    function _REMOVEMINTER804(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE916(account);
        emit MINTERREMOVED306(account);
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol

pragma solidity ^0.5.2;



                                                           
contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                                                                                                                                
    function MINT463(address to, uint256 value) public ONLYMINTER480 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT676(to, value);
        return true;
    }
}

// File: openzeppelin-solidity/contracts/access/roles/PauserRole.sol

pragma solidity ^0.5.2;


contract PauserRole {
    using Roles for Roles.Role;

    event PAUSERADDED767(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED377(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    constructor () internal {
        _ADDPAUSER452(msg.sender);
    }

    modifier ONLYPAUSER775() {	//inject NONSTANDARD NAMING
        require(ISPAUSER511(msg.sender));
        _;
    }

    function ISPAUSER511(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS473(account);
    }

    function ADDPAUSER857(address account) public ONLYPAUSER775 {	//inject NONSTANDARD NAMING
        _ADDPAUSER452(account);
    }

    function RENOUNCEPAUSER530() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER304(msg.sender);
    }

    function _ADDPAUSER452(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD813(account);
        emit PAUSERADDED767(account);
    }

    function _REMOVEPAUSER304(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE916(account);
        emit PAUSERREMOVED377(account);
    }
}

// File: openzeppelin-solidity/contracts/lifecycle/Pausable.sol

pragma solidity ^0.5.2;


                                                                                                                
contract Pausable is PauserRole {
    event PAUSED855(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED511(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

                                                                               
    function PAUSED328() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED80() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED401() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE743() public ONLYPAUSER775 WHENNOTPAUSED80 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED855(msg.sender);
    }

                                                                                   
    function UNPAUSE52() public ONLYPAUSER775 WHENPAUSED401 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED511(msg.sender);
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Pausable.sol

pragma solidity ^0.5.2;



                                                                                
contract ERC20Pausable is ERC20, Pausable {
    function TRANSFER892(address to, uint256 value) public WHENNOTPAUSED80 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER892(to, value);
    }

    function TRANSFERFROM533(address from, address to, uint256 value) public WHENNOTPAUSED80 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM533(from, to, value);
    }

    function APPROVE56(address spender, uint256 value) public WHENNOTPAUSED80 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE56(spender, value);
    }

    function INCREASEALLOWANCE324(address spender, uint addedValue) public WHENNOTPAUSED80 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE324(spender, addedValue);
    }

    function DECREASEALLOWANCE439(address spender, uint subtractedValue) public WHENNOTPAUSED80 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE439(spender, subtractedValue);
    }
}

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

pragma solidity ^0.5.2;

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED89(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED89(address(0), _owner);
    }

                                                        
    function OWNER648() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER922() {	//inject NONSTANDARD NAMING
        require(ISOWNER90());
        _;
    }

                                                                                 
    function ISOWNER90() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP882() public ONLYOWNER922 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED89(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP207(address newOwner) public ONLYOWNER922 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP221(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP221(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED89(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/Token.sol

pragma solidity >=0.4.21 <0.6.0;







contract Token is ERC20, ERC20Detailed, ERC20Burnable, ERC20Mintable, ERC20Pausable, Ownable {

    constructor(string memory name, string memory symbol, uint8 decimals, uint256 totalSupply)

    ERC20Detailed(name, symbol, decimals)

    public {
        _MINT676(OWNER648(), totalSupply * (10 ** uint(decimals)));
    }
}