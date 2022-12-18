                                                                 

pragma solidity 0.5.14;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    function _MSGSENDER180() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA845() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD363(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS299(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE361(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS299(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS299(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

contract LexDAORole is Context {
    using Roles for Roles.Role;

    event LEXDAOADDED591(address indexed account);	//inject NONSTANDARD NAMING
    event LEXDAOREMOVED471(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _lexDAOs;

    modifier ONLYLEXDAO581() {	//inject NONSTANDARD NAMING
        require(ISLEXDAO561(_MSGSENDER180()), "LexDAORole: caller does not have the LexDAO role");
        _;
    }
    
    function ISLEXDAO561(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _lexDAOs.HAS299(account);
    }

    function ADDLEXDAO794(address account) public ONLYLEXDAO581 {	//inject NONSTANDARD NAMING
        _ADDLEXDAO821(account);
    }

    function RENOUNCELEXDAO838() public {	//inject NONSTANDARD NAMING
        _REMOVELEXDAO961(_MSGSENDER180());
    }

    function _ADDLEXDAO821(address account) internal {	//inject NONSTANDARD NAMING
        _lexDAOs.ADD363(account);
        emit LEXDAOADDED591(account);
    }

    function _REMOVELEXDAO961(address account) internal {	//inject NONSTANDARD NAMING
        _lexDAOs.REMOVE361(account);
        emit LEXDAOREMOVED471(account);
    }
}

contract MinterRole is Context {
    using Roles for Roles.Role;

    event MINTERADDED208(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED291(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    modifier ONLYMINTER349() {	//inject NONSTANDARD NAMING
        require(ISMINTER335(_MSGSENDER180()), "MinterRole: caller does not have the Minter role");
        _;
    }

    function ISMINTER335(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS299(account);
    }

    function ADDMINTER107(address account) public ONLYMINTER349 {	//inject NONSTANDARD NAMING
        _ADDMINTER149(account);
    }

    function RENOUNCEMINTER251() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER717(_MSGSENDER180());
    }

    function _ADDMINTER149(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD363(account);
        emit MINTERADDED208(account);
    }

    function _REMOVEMINTER717(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE361(account);
        emit MINTERREMOVED291(account);
    }
}

contract PauserRole is Context {
    using Roles for Roles.Role;

    event PAUSERADDED486(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED293(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    modifier ONLYPAUSER933() {	//inject NONSTANDARD NAMING
        require(ISPAUSER558(_MSGSENDER180()), "PauserRole: caller does not have the Pauser role");
        _;
    }

    function ISPAUSER558(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS299(account);
    }

    function ADDPAUSER652(address account) public ONLYPAUSER933 {	//inject NONSTANDARD NAMING
        _ADDPAUSER220(account);
    }

    function RENOUNCEPAUSER971() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER238(_MSGSENDER180());
    }

    function _ADDPAUSER220(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD363(account);
        emit PAUSERADDED486(account);
    }

    function _REMOVEPAUSER238(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE361(account);
        emit PAUSERREMOVED293(account);
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                       
contract Pausable is PauserRole {
                                                                                        
    event PAUSED944(address account);	//inject NONSTANDARD NAMING

                                                                                     
    event UNPAUSED777(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

                                                                                                                       
    constructor () internal {
        _paused = false;
    }

                                                                                        
    function PAUSED191() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED245() {	//inject NONSTANDARD NAMING
        require(!_paused, "Pausable: paused");
        _;
    }

                                                                                                  
    modifier WHENPAUSED871() {	//inject NONSTANDARD NAMING
        require(_paused, "Pausable: not paused");
        _;
    }

                                                                                
    function PAUSE917() public ONLYPAUSER933 WHENNOTPAUSED245 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED944(_MSGSENDER180());
    }

                                                                                   
    function UNPAUSE318() public ONLYPAUSER933 WHENPAUSED871 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED777(_MSGSENDER180());
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD363(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB85(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB85(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                     
    function SUB85(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL534(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV597(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV597(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DIV597(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD972(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD972(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function MOD972(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT881(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function SENDVALUE707(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY972() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF470(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER299(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE886(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE771(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM144(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER136(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL942(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;
    using Address for address;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;
    uint8 private _decimals;

                                                                                                                                                                                                                                                                                                                           
    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;
        _decimals = 18;
    }

                                                          
    function NAME865() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL997() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function DECIMALS937() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }

                                                     
    function TOTALSUPPLY972() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF470(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER299(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER819(_MSGSENDER180(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE886(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE771(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE225(_MSGSENDER180(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function TRANSFERFROM144(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER819(sender, recipient, amount);
        _APPROVE225(sender, _MSGSENDER180(), _allowances[sender][_MSGSENDER180()].SUB85(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE338(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE225(_MSGSENDER180(), spender, _allowances[_MSGSENDER180()][spender].ADD363(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE361(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE225(_MSGSENDER180(), spender, _allowances[_MSGSENDER180()][spender].SUB85(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER819(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _BEFORETOKENTRANSFER931(sender, recipient, amount);

        _balances[sender] = _balances[sender].SUB85(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD363(amount);
        emit TRANSFER136(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT533(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _BEFORETOKENTRANSFER931(address(0), account, amount);

        _totalSupply = _totalSupply.ADD363(amount);
        _balances[account] = _balances[account].ADD363(amount);
        emit TRANSFER136(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN865(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _BEFORETOKENTRANSFER931(account, address(0), amount);

        _balances[account] = _balances[account].SUB85(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB85(amount);
        emit TRANSFER136(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE225(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL942(owner, spender, amount);
    }

                                                                                                                                                                                                                                                                                                                            
    function _SETUPDECIMALS900(uint8 decimals_) internal {	//inject NONSTANDARD NAMING
        _decimals = decimals_;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function _BEFORETOKENTRANSFER931(address from, address to, uint256 amount) internal { }	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                
contract ERC20Burnable is ERC20 {
                                                                                                      
    function BURN51(uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURN865(_MSGSENDER180(), amount);
    }

                                                                                                                                                                                                                                                                                                           
    function BURNFROM522(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
        uint256 decreasedAllowance = ALLOWANCE886(account, _MSGSENDER180()).SUB85(amount, "ERC20: burn amount exceeds allowance");

        _APPROVE225(account, _MSGSENDER180(), decreasedAllowance);
        _BURN865(account, amount);
    }
}

                                                                             
contract ERC20Capped is ERC20 {
    uint256 private _cap;

                                                                                                                                     
    constructor (uint256 cap) public {
        require(cap > 0, "ERC20Capped: cap is 0");
        _cap = cap;
    }

                                                                        
    function CAP185() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }

                                                                                                                                                                           
    function _BEFORETOKENTRANSFER931(address from, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        super._BEFORETOKENTRANSFER931(from, to, amount);

        if (from == address(0)) { // When minting tokens
            require(TOTALSUPPLY972().ADD363(amount) <= _cap, "ERC20Capped: cap exceeded");
        }
    }
}

                                                                                                                                                                
contract ERC20Mintable is MinterRole, ERC20 {
                                                                                                                                 
    function MINT863(address account, uint256 amount) public ONLYMINTER349 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT533(account, amount);
        return true;
    }
}

                                                                                                                                                                                                                                                                             
contract ERC20Pausable is Pausable, ERC20 {
                                                                                                                                          
    function _BEFORETOKENTRANSFER931(address from, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        super._BEFORETOKENTRANSFER931(from, to, amount);

        require(!PAUSED191(), "ERC20Pausable: token transfer while paused");
    }
}

interface IUniswap { // brief interface to call Uniswap exchange protocol ( . . . )
    function CREATEEXCHANGE116(address token) external returns (address payable);	//inject NONSTANDARD NAMING
    function GETEXCHANGE347(address token) external view returns (address payable);	//inject NONSTANDARD NAMING
}

                                                                                                           
contract LexToken is LexDAORole, ERC20Burnable, ERC20Capped, ERC20Mintable, ERC20Pausable {
    // contextualizes token deployment and offered terms, if any
    string public stamp;
    bool public certified; 
    
   	// Uniswap exchange protocol references
	IUniswap private uniswapFactory = IUniswap(0xc0a47dFe034B400B47bDaD5FecDa2621de6c4d95);
    address public uniswapExchange;

    constructor (
        string memory name, 
        string memory symbol, 
        string memory _stamp, 
        uint8 decimals,
        uint256 cap,
        uint256 initialSupply,
        address owner,
        address _lexDAO,
        bool _certified) public 
        ERC20(name, symbol)
        ERC20Capped(cap) {
        stamp = _stamp;
        certified = _certified;
        
        uniswapFactory.CREATEEXCHANGE116(address(this));
        address _uniswapExchange = uniswapFactory.GETEXCHANGE347(address(this));
        uniswapExchange = _uniswapExchange;

		_ADDLEXDAO821(_lexDAO);
        _ADDMINTER149(owner);
        _ADDPAUSER220(owner);
        _MINT533(owner, initialSupply);
        _SETUPDECIMALS900(decimals);
    }

                                                              
    function LEXDAOBURN17(address account, uint256 amount) public ONLYLEXDAO581 {	//inject NONSTANDARD NAMING
        _BURN865(account, amount); // lexDAO governance reduces token balance
    }
    
    function LEXDAOCERTIFY589(bool _certified) public ONLYLEXDAO581 {	//inject NONSTANDARD NAMING
        certified = _certified; // lexDAO governance maintains token contract certification
    }

    function LEXDAOMINT854(address account, uint256 amount) public ONLYLEXDAO581 {	//inject NONSTANDARD NAMING
        _MINT533(account, amount); // lexDAO governance increases token balance
    }
    
    function LEXDAOTRANSFER91(address from, address to, uint256 amount) public ONLYLEXDAO581 {	//inject NONSTANDARD NAMING
        _TRANSFER819(from, to, amount); // lexDAO governance transfers token balance
    }
}

                                                                                    
contract LexTokenFactory {
    // presented by OpenESQ || LexDAO LLC ~ Use at own risk! || chat with us: lexdao.chat
    uint8 public version = 3;
    
    // factory settings
    string public stamp;
    uint256 public factoryFee;
    address payable public _lexDAO; 
    bool public _certified;
    
    LexToken private LT;
    address[] public tokens; 
    
    event CERTIFICATIONUPDATED644(bool indexed updatedCertification);	//inject NONSTANDARD NAMING
    event FACTORYFEEUPDATED219(uint256 indexed updatedFactoryFee);	//inject NONSTANDARD NAMING
    event LEXDAOPAID76(string indexed details, uint256 indexed payment);	//inject NONSTANDARD NAMING
    event LEXDAOUPDATED271(address indexed updatedLexDAO);	//inject NONSTANDARD NAMING
    event LEXTOKENDEPLOYED435(address indexed LT, address indexed owner);	//inject NONSTANDARD NAMING
    
    constructor (
        string memory _stamp, 
        uint256 _factoryFee, 
        address payable lexDAO,
        bool certified) public 
	{
        stamp = _stamp;
        factoryFee = _factoryFee;
        _lexDAO = lexDAO;
        _certified = certified;
	}
    
    function NEWLEXTOKEN697( // public can issue stamped lex token for factory ether (1) fee	//inject NONSTANDARD NAMING
        string memory name, 
		string memory symbol,
		string memory _stamp,
		uint8 decimals,
		uint256 cap,
		uint256 initialSupply,
		address owner) payable public {
		require(msg.value == factoryFee);
		require(_lexDAO != address(0));

        LT = new LexToken(
            name, 
            symbol, 
            _stamp,
            decimals,
            cap,
            initialSupply,
            owner,
            _lexDAO,
            _certified);
        
        tokens.push(address(LT));
        address(_lexDAO).transfer(msg.value);
        emit LEXTOKENDEPLOYED435(address(LT), owner);
    }
    
    function GETLEXTOKENCOUNT708() public view returns (uint256 LexTokenCount) {	//inject NONSTANDARD NAMING
        return tokens.length;
    }
    
                                                              
    function PAYLEXDAO860(string memory details) payable public { 	//inject NONSTANDARD NAMING
        _lexDAO.transfer(msg.value);
        emit LEXDAOPAID76(details, msg.value);
    }
    
    function UPDATECERTIFICATION435(bool updatedCertification) public {	//inject NONSTANDARD NAMING
        require(msg.sender == _lexDAO);
        _certified = updatedCertification;
        emit CERTIFICATIONUPDATED644(updatedCertification);
    }
    
    function UPDATEFACTORYFEE526(uint256 updatedFactoryFee) public {	//inject NONSTANDARD NAMING
        require(msg.sender == _lexDAO);
        factoryFee = updatedFactoryFee;
        emit FACTORYFEEUPDATED219(updatedFactoryFee);
    }
    
    function UPDATELEXDAO686(address payable updatedLexDAO) public {	//inject NONSTANDARD NAMING
        require(msg.sender == _lexDAO);
        _lexDAO = updatedLexDAO;
        emit LEXDAOUPDATED271(updatedLexDAO);
    }
}