                                                                 

pragma solidity 0.5.14;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }

    function _MSGSENDER55() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA398() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD291(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS733(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE632(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS733(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS733(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

contract lexDAORole is Context {
    using Roles for Roles.Role;

    event LEXDAOADDED30(address indexed account);	//inject NONSTANDARD NAMING
    event LEXDAOREMOVED374(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _lexDAOs;

    modifier ONLYLEXDAO607() {	//inject NONSTANDARD NAMING
        require(ISLEXDAO593(_MSGSENDER55()), "lexDAO: caller does not have the lexDAO role");
        _;
    }
    
    function ISLEXDAO593(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _lexDAOs.HAS733(account);
    }

    function ADDLEXDAO997(address account) public ONLYLEXDAO607 {	//inject NONSTANDARD NAMING
        _ADDLEXDAO124(account);
    }

    function RENOUNCELEXDAO871() public {	//inject NONSTANDARD NAMING
        _REMOVELEXDAO524(_MSGSENDER55());
    }

    function _ADDLEXDAO124(address account) internal {	//inject NONSTANDARD NAMING
        _lexDAOs.ADD291(account);
        emit LEXDAOADDED30(account);
    }

    function _REMOVELEXDAO524(address account) internal {	//inject NONSTANDARD NAMING
        _lexDAOs.REMOVE632(account);
        emit LEXDAOREMOVED374(account);
    }
}

contract MinterRole is Context {
    using Roles for Roles.Role;

    event MINTERADDED717(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED90(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    modifier ONLYMINTER903() {	//inject NONSTANDARD NAMING
        require(ISMINTER586(_MSGSENDER55()), "MinterRole: caller does not have the Minter role");
        _;
    }

    function ISMINTER586(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS733(account);
    }

    function ADDMINTER477(address account) public ONLYMINTER903 {	//inject NONSTANDARD NAMING
        _ADDMINTER135(account);
    }

    function RENOUNCEMINTER846() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER392(_MSGSENDER55());
    }

    function _ADDMINTER135(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD291(account);
        emit MINTERADDED717(account);
    }

    function _REMOVEMINTER392(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE632(account);
        emit MINTERREMOVED90(account);
    }
}

contract PauserRole {
    using Roles for Roles.Role;

    event PAUSERADDED987(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED305(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    modifier ONLYPAUSER212() {	//inject NONSTANDARD NAMING
        require(ISPAUSER229(msg.sender), "PauserRole: caller does not have the Pauser role");
        _;
    }

    function ISPAUSER229(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS733(account);
    }

    function ADDPAUSER264(address account) public ONLYPAUSER212 {	//inject NONSTANDARD NAMING
        _ADDPAUSER50(account);
    }

    function RENOUNCEPAUSER421() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER502(msg.sender);
    }

    function _ADDPAUSER50(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD291(account);
        emit PAUSERADDED987(account);
    }

    function _REMOVEPAUSER502(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE632(account);
        emit PAUSERREMOVED305(account);
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                       
contract Pausable is PauserRole {
                                                                                        
    event PAUSED933(address account);	//inject NONSTANDARD NAMING

                                                                                     
    event UNPAUSED257(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

                                                                                                                       
    constructor () internal {
        _paused = false;
    }

                                                                                        
    function PAUSED34() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED51() {	//inject NONSTANDARD NAMING
        require(!_paused, "Pausable: paused");
        _;
    }

                                                                                                  
    modifier WHENPAUSED350() {	//inject NONSTANDARD NAMING
        require(_paused, "Pausable: not paused");
        _;
    }

                                                                                
    function PAUSE479() public ONLYPAUSER212 WHENNOTPAUSED51 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED933(msg.sender);
    }

                                                                                   
    function UNPAUSE814() public ONLYPAUSER212 WHENPAUSED350 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED257(msg.sender);
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD291(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB617(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB617(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB617(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL586(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV674(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV674(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV674(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD467(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD467(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD467(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY156() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF946(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER844(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE346(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE246(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM330(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER235(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL186(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY156() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF946(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER844(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER979(_MSGSENDER55(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE346(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE246(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE721(_MSGSENDER55(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM330(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER979(sender, recipient, amount);
        _APPROVE721(sender, _MSGSENDER55(), _allowances[sender][_MSGSENDER55()].SUB617(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE892(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE721(_MSGSENDER55(), spender, _allowances[_MSGSENDER55()][spender].ADD291(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE548(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE721(_MSGSENDER55(), spender, _allowances[_MSGSENDER55()][spender].SUB617(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER979(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _BEFORETOKENTRANSFER468(sender, recipient, amount);

        _balances[sender] = _balances[sender].SUB617(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD291(amount);
        emit TRANSFER235(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT174(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _BEFORETOKENTRANSFER468(address(0), account, amount);

        _totalSupply = _totalSupply.ADD291(amount);
        _balances[account] = _balances[account].ADD291(amount);
        emit TRANSFER235(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN953(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _BEFORETOKENTRANSFER468(account, address(0), amount);

        _balances[account] = _balances[account].SUB617(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB617(amount);
        emit TRANSFER235(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE721(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL186(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM545(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN953(account, amount);
        _APPROVE721(account, _MSGSENDER55(), _allowances[account][_MSGSENDER55()].SUB617(amount, "ERC20: burn amount exceeds allowance"));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function _BEFORETOKENTRANSFER468(address from, address to, uint256 amount) internal { }	//inject NONSTANDARD NAMING
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

                                                          
    function NAME895() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL283() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function DECIMALS81() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

                                                                                                                                                                                                                
contract ERC20Burnable is Context, ERC20 {
                                                                                                      
    function BURN57(uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURN953(_MSGSENDER55(), amount);
    }

                                                  
    function BURNFROM664(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURNFROM545(account, amount);
    }
}

                                                                                                                                                                
contract ERC20Mintable is MinterRole, ERC20 {
                                                                                                                                 
    function MINT124(address account, uint256 amount) public ONLYMINTER903 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT174(account, amount);
        return true;
    }
}

                                                                                     
contract ERC20Capped is ERC20Mintable {
    uint256 private _cap;

                                                                                                                                     
    constructor (uint256 cap) public {
        require(cap > 0, "ERC20Capped: cap is 0");
        _cap = cap;
    }

                                                                        
    function CAP571() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }

                                                                                                                                                             
    function _MINT174(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(TOTALSUPPLY156().ADD291(value) <= _cap, "ERC20Capped: cap exceeded");
        super._MINT174(account, value);
    }
}

                                                                                                                                                                                                                                                                   
contract ERC20Pausable is Pausable, ERC20 {
    function TRANSFER844(address to, uint256 value) public WHENNOTPAUSED51 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER844(to, value);
    }

    function TRANSFERFROM330(address from, address to, uint256 value) public WHENNOTPAUSED51 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM330(from, to, value);
    }

    function APPROVE246(address spender, uint256 value) public WHENNOTPAUSED51 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE246(spender, value);
    }

    function INCREASEALLOWANCE892(address spender, uint256 addedValue) public WHENNOTPAUSED51 returns (bool) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE892(spender, addedValue);
    }

    function DECREASEALLOWANCE548(address spender, uint256 subtractedValue) public WHENNOTPAUSED51 returns (bool) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE548(spender, subtractedValue);
    }
}

                                                                                                           
contract LexToken is lexDAORole, ERC20Detailed, ERC20Burnable, ERC20Capped, ERC20Pausable {
    // contextualizes token deployment and offered terms, if any
    string public stamp;

    constructor (
        string memory name, 
        string memory symbol, 
        string memory _stamp, 
        uint8 decimals,
        uint256 cap,
        uint256 initialSupply, 
        address owner,
        address _lexDAO) public 
        ERC20Detailed(name, symbol, decimals)
        ERC20Capped(cap) {
        stamp = _stamp;
		_MINT174(owner, initialSupply);
        _ADDMINTER135(owner);
        _ADDPAUSER50(owner);
        _ADDLEXDAO124(_lexDAO);
    }
    
    function LEXDAOTRANSFER479(address from, address to, uint256 amount) public ONLYLEXDAO607 returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER979(from, to, amount); // lexDAO governance transfers token balance
        return true;
    }
    
    function LEXDAOMINT352(address account, uint256 amount) public ONLYLEXDAO607 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT174(account, amount); // lexDAO governance increases token balance
        return true;
    }    
    
    function LEXDAOBURN440(address account, uint256 amount) public ONLYLEXDAO607 returns (bool) {	//inject NONSTANDARD NAMING
        _BURN953(account, amount); // lexDAO governance reduces token balance
        return true;
    }
}