                                                                                               

pragma solidity 0.5.2;

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

                                                                                        
interface IERC20 {
    function TRANSFER938(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE521(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM882(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY706() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF370(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE28(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER538(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL112(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

                                                                                                   
library SafeMath {
                                                                                
    function MUL732(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV634(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB949(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD538(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD505(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                             
    function TOTALSUPPLY706() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF370(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE28(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER938(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER305(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE521(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL112(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM882(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB949(value);
        _TRANSFER305(from, to, value);
        emit APPROVAL112(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE933(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD538(addedValue);
        emit APPROVAL112(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE307(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB949(subtractedValue);
        emit APPROVAL112(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER305(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB949(value);
        _balances[to] = _balances[to].ADD538(value);
        emit TRANSFER538(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT727(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD538(value);
        _balances[account] = _balances[account].ADD538(value);
        emit TRANSFER538(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN553(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB949(value);
        _balances[account] = _balances[account].SUB949(value);
        emit TRANSFER538(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM958(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _allowed[account][msg.sender] = _allowed[account][msg.sender].SUB949(value);
        _BURN553(account, value);
        emit APPROVAL112(account, msg.sender, _allowed[account][msg.sender]);
    }
}

// File: openzeppelin-solidity/contracts/access/Roles.sol

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD538(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS329(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE297(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS329(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS329(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

// File: openzeppelin-solidity/contracts/access/roles/PauserRole.sol

contract PauserRole {
    using Roles for Roles.Role;

    event PAUSERADDED12(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED654(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    constructor () internal {
        _ADDPAUSER450(msg.sender);
    }

    modifier ONLYPAUSER380() {	//inject NONSTANDARD NAMING
        require(ISPAUSER480(msg.sender));
        _;
    }

    function ISPAUSER480(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS329(account);
    }

    function ADDPAUSER304(address account) public ONLYPAUSER380 {	//inject NONSTANDARD NAMING
        _ADDPAUSER450(account);
    }

    function RENOUNCEPAUSER687() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER273(msg.sender);
    }

    function _ADDPAUSER450(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD538(account);
        emit PAUSERADDED12(account);
    }

    function _REMOVEPAUSER273(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE297(account);
        emit PAUSERREMOVED654(account);
    }
}

// File: openzeppelin-solidity/contracts/lifecycle/Pausable.sol

                                                                                                                
contract Pausable is PauserRole {
    event PAUSED193(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED619(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

                                                                               
    function PAUSED496() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED220() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED545() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE88() public ONLYPAUSER380 WHENNOTPAUSED220 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED193(msg.sender);
    }

                                                                                   
    function UNPAUSE739() public ONLYPAUSER380 WHENPAUSED545 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED619(msg.sender);
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Pausable.sol

                                                                                 
contract ERC20Pausable is ERC20, Pausable {
    function TRANSFER938(address to, uint256 value) public WHENNOTPAUSED220 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER938(to, value);
    }

    function TRANSFERFROM882(address from, address to, uint256 value) public WHENNOTPAUSED220 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM882(from, to, value);
    }

    function APPROVE521(address spender, uint256 value) public WHENNOTPAUSED220 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE521(spender, value);
    }

    function INCREASEALLOWANCE933(address spender, uint addedValue) public WHENNOTPAUSED220 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE933(spender, addedValue);
    }

    function DECREASEALLOWANCE307(address spender, uint subtractedValue) public WHENNOTPAUSED220 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE307(spender, subtractedValue);
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

                                                     
    function NAME718() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL685() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS552() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: contracts/TRYCO.sol

contract TRYCO is ERC20Pausable, ERC20Detailed {
    constructor (string memory name, string memory symbol, uint8 decimals, uint256 totalSupply)
    public
    ERC20Detailed (name, symbol, decimals) {
        _MINT727(msg.sender, totalSupply);
    }
}