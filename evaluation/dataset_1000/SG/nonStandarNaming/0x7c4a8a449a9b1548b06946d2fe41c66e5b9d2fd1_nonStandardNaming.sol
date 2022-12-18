                                                                 

pragma solidity ^0.5.7;

contract Identity {
    mapping(address => string) private _names;

                                                                                 
    function IAM221(string memory shortName) public {	//inject NONSTANDARD NAMING
        _names[msg.sender] = shortName;
    }

                                                                                
    function WHEREAMI82() public view returns (address yourAddress) {	//inject NONSTANDARD NAMING
        address myself = msg.sender;
        return myself;
    }

                                                                                   
    function WHOAMI869() public view returns (string memory yourName) {	//inject NONSTANDARD NAMING
        return (_names[msg.sender]);
    }
}


pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER237() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA852() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}


pragma solidity ^0.5.0;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY820() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF403(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER431(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE123(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE986(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM317(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER671(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL176(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD590(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB668(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB668(a, b, "Insufficient funds");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB668(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL592(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV616(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV616(a, b);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV616(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD360(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD360(a, b);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD360(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}


pragma solidity ^0.5.0;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY820() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF403(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER431(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER803(_MSGSENDER237(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE123(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE986(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE779(_MSGSENDER237(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM317(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER803(sender, recipient, amount);
        _APPROVE779(sender, _MSGSENDER237(), _allowances[sender][_MSGSENDER237()].SUB668(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE887(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE779(_MSGSENDER237(), spender, _allowances[_MSGSENDER237()][spender].ADD590(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE300(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE779(_MSGSENDER237(), spender, _allowances[_MSGSENDER237()][spender].SUB668(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER803(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0));

        _balances[sender] = _balances[sender].SUB668(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD590(amount);
        emit TRANSFER671(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT20(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD590(amount);
        _balances[account] = _balances[account].ADD590(amount);
        emit TRANSFER671(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN728(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _balances[account] = _balances[account].SUB668(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB668(amount);
        emit TRANSFER671(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE779(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0));
        require(spender != address(0));

        _allowances[owner][spender] = amount;
        emit APPROVAL176(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM106(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN728(account, amount);
        _APPROVE779(account, _MSGSENDER237(), _allowances[account][_MSGSENDER237()].SUB668(amount, "ERC20: burn amount exceeds allowance"));
    }
}


pragma solidity ^0.5.0;


                                                                                                                                                                                                                
contract ERC20Burnable is Context, ERC20 {
                                                                                                      
    function BURN59(uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURN728(_MSGSENDER237(), amount);
    }

                                                  
    function BURNFROM149(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURNFROM106(account, amount);
    }
}


pragma solidity ^0.5.0;


                                                           
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

                                                                                                                                                                                       
    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                          
    function NAME166() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL564() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function DECIMALS315() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}


pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED244(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER237();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED244(address(0), msgSender);
    }

                                                                     
    function OWNER813() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER456() {	//inject NONSTANDARD NAMING
        require(ISOWNER295());
        _;
    }

                                                                            
    function ISOWNER295() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER237() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP2() public ONLYOWNER456 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED244(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP947(address newOwner) public ONLYOWNER456 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP265(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP265(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED244(_owner, newOwner);
        _owner = newOwner;
    }
}


pragma solidity ^0.5.0;

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD590(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS393(role, account));
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE375(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS393(role, account));
        role.bearer[account] = false;
    }

                                                                                  
    function HAS393(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}


pragma solidity ^0.5.7;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
contract PauserRole is Ownable {
    using Roles for Roles.Role;

    event PAUSERADDED778(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED420(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    constructor () internal {
        _ADDPAUSER165(msg.sender);
    }

    modifier ONLYPAUSER414() {	//inject NONSTANDARD NAMING
        require(ISPAUSER323(msg.sender), "onlyPauser");
        _;
    }

    function ISPAUSER323(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS393(account);
    }

    function ADDPAUSER944(address account) public ONLYOWNER456 {	//inject NONSTANDARD NAMING
        _ADDPAUSER165(account);
    }

    function REMOVEPAUSER658(address account) public ONLYOWNER456 {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER47(account);
    }

    function _ADDPAUSER165(address account) private {	//inject NONSTANDARD NAMING
        require(account != address(0));
        _pausers.ADD590(account);
        emit PAUSERADDED778(account);
    }

    function _REMOVEPAUSER47(address account) private {	//inject NONSTANDARD NAMING
        require(account != address(0));
        _pausers.REMOVE375(account);
        emit PAUSERREMOVED420(account);
    }


    // =========================================================================
    // === Overridden ERC20 functionality
    // =========================================================================

                                                                                                                                                                                                                    
    function RENOUNCEOWNERSHIP2() public ONLYOWNER456 {	//inject NONSTANDARD NAMING
        require(false, "forbidden");
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP947(address newOwner) public ONLYOWNER456 {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER47(msg.sender);
        super.TRANSFEROWNERSHIP947(newOwner);
        _ADDPAUSER165(newOwner);
    }
}


pragma solidity ^0.5.0;


                                                                                                                                                                                                                                                                                                                                                                                                                                                       
contract Pausable is Context, PauserRole {
                                                                                        
    event PAUSED560(address account);	//inject NONSTANDARD NAMING

                                                                                     
    event UNPAUSED768(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

                                                                                                                       
    constructor () internal {
        _paused = false;
    }

                                                                                        
    function PAUSED52() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED977() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED499() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE783() public ONLYPAUSER414 WHENNOTPAUSED977 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED560(_MSGSENDER237());
    }

                                                                                   
    function UNPAUSE941() public ONLYPAUSER414 WHENPAUSED499 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED768(_MSGSENDER237());
    }
}


pragma solidity ^0.5.0;


                                                                                                                                                                                                                                                            
contract ERC20Pausable is ERC20, Pausable {
    function TRANSFER431(address to, uint256 value) public WHENNOTPAUSED977 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER431(to, value);
    }

    function TRANSFERFROM317(address from, address to, uint256 value) public WHENNOTPAUSED977 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM317(from, to, value);
    }

    function APPROVE986(address spender, uint256 value) public WHENNOTPAUSED977 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE986(spender, value);
    }

    function INCREASEALLOWANCE887(address spender, uint256 addedValue) public WHENNOTPAUSED977 returns (bool) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE887(spender, addedValue);
    }

    function DECREASEALLOWANCE300(address spender, uint256 subtractedValue) public WHENNOTPAUSED977 returns (bool) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE300(spender, subtractedValue);
    }
}


pragma solidity ^0.5.7;


contract VerifiedAccount is ERC20, Ownable {

    mapping(address => bool) private _isRegistered;

    constructor () internal {
        // The smart contract starts off registering itself, since address is known.
        REGISTERACCOUNT630();
    }

    event ACCOUNTREGISTERED595(address indexed account);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                      
    function REGISTERACCOUNT630() public returns (bool ok) {	//inject NONSTANDARD NAMING
        _isRegistered[msg.sender] = true;
        emit ACCOUNTREGISTERED595(msg.sender);
        return true;
    }

    function ISREGISTERED939(address account) public view returns (bool ok) {	//inject NONSTANDARD NAMING
        return _isRegistered[account];
    }

    function _ACCOUNTEXISTS652(address account) internal view returns (bool exists) {	//inject NONSTANDARD NAMING
        return account == msg.sender || _isRegistered[account];
    }

    modifier ONLYEXISTINGACCOUNT761(address account) {	//inject NONSTANDARD NAMING
        require(_ACCOUNTEXISTS652(account), "account not registered");
        _;
    }


    // =========================================================================
    // === Safe ERC20 methods
    // =========================================================================

    function SAFETRANSFER269(address to, uint256 value) public ONLYEXISTINGACCOUNT761(to) returns (bool ok) {	//inject NONSTANDARD NAMING
        TRANSFER431(to, value);
        return true;
    }

    function SAFEAPPROVE915(address spender, uint256 value) public ONLYEXISTINGACCOUNT761(spender) returns (bool ok) {	//inject NONSTANDARD NAMING
        APPROVE986(spender, value);
        return true;
    }

    function SAFETRANSFERFROM506(address from, address to, uint256 value) public ONLYEXISTINGACCOUNT761(to) returns (bool ok) {	//inject NONSTANDARD NAMING
        TRANSFERFROM317(from, to, value);
        return true;
    }


    // =========================================================================
    // === Safe ownership transfer
    // =========================================================================

                                                                                                                                                                    
    function TRANSFEROWNERSHIP947(address newOwner) public ONLYEXISTINGACCOUNT761(newOwner) ONLYOWNER456 {	//inject NONSTANDARD NAMING
        super.TRANSFEROWNERSHIP947(newOwner);
    }
}


pragma solidity ^0.5.7;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
contract GrantorRole is Ownable {
    bool private constant owner_uniform_grantor_flag855 = false;	//inject NONSTANDARD NAMING

    using Roles for Roles.Role;

    event GRANTORADDED177(address indexed account);	//inject NONSTANDARD NAMING
    event GRANTORREMOVED839(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _grantors;
    mapping(address => bool) private _isUniformGrantor;

    constructor () internal {
        _ADDGRANTOR260(msg.sender, owner_uniform_grantor_flag855);
    }

    modifier ONLYGRANTOR597() {	//inject NONSTANDARD NAMING
        require(ISGRANTOR365(msg.sender), "onlyGrantor");
        _;
    }

    modifier ONLYGRANTORORSELF648(address account) {	//inject NONSTANDARD NAMING
        require(ISGRANTOR365(msg.sender) || msg.sender == account, "onlyGrantorOrSelf");
        _;
    }

    function ISGRANTOR365(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _grantors.HAS393(account);
    }

    function ADDGRANTOR959(address account, bool isUniformGrantor) public ONLYOWNER456 {	//inject NONSTANDARD NAMING
        _ADDGRANTOR260(account, isUniformGrantor);
    }

    function REMOVEGRANTOR135(address account) public ONLYOWNER456 {	//inject NONSTANDARD NAMING
        _REMOVEGRANTOR638(account);
    }

    function _ADDGRANTOR260(address account, bool isUniformGrantor) private {	//inject NONSTANDARD NAMING
        require(account != address(0));
        _grantors.ADD590(account);
        _isUniformGrantor[account] = isUniformGrantor;
        emit GRANTORADDED177(account);
    }

    function _REMOVEGRANTOR638(address account) private {	//inject NONSTANDARD NAMING
        require(account != address(0));
        _grantors.REMOVE375(account);
        emit GRANTORREMOVED839(account);
    }

    function ISUNIFORMGRANTOR164(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return ISGRANTOR365(account) && _isUniformGrantor[account];
    }

    modifier ONLYUNIFORMGRANTOR888() {	//inject NONSTANDARD NAMING
        require(ISUNIFORMGRANTOR164(msg.sender), "onlyUniformGrantor");
        // Only grantor role can do this.
        _;
    }


    // =========================================================================
    // === Overridden ERC20 functionality
    // =========================================================================

                                                                                                                                                                                                                         
    function RENOUNCEOWNERSHIP2() public ONLYOWNER456 {	//inject NONSTANDARD NAMING
        require(false, "forbidden");
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP947(address newOwner) public ONLYOWNER456 {	//inject NONSTANDARD NAMING
        _REMOVEGRANTOR638(msg.sender);
        super.TRANSFEROWNERSHIP947(newOwner);
        _ADDGRANTOR260(newOwner, owner_uniform_grantor_flag855);
    }
}


pragma solidity ^0.5.7;


interface IERC20Vestable {
    function GETINTRINSICVESTINGSCHEDULE542(address grantHolder)	//inject NONSTANDARD NAMING
    external
    view
    returns (
        uint32 cliffDuration,
        uint32 vestDuration,
        uint32 vestIntervalDays
    );

    function GRANTVESTINGTOKENS215(	//inject NONSTANDARD NAMING
        address beneficiary,
        uint256 totalAmount,
        uint256 vestingAmount,
        uint32 startDay,
        uint32 duration,
        uint32 cliffDuration,
        uint32 interval,
        bool isRevocable
    ) external returns (bool ok);

    function TODAY986() external view returns (uint32 dayNumber);	//inject NONSTANDARD NAMING

    function VESTINGFORACCOUNTASOF727(	//inject NONSTANDARD NAMING
        address grantHolder,
        uint32 onDayOrToday
    )
    external
    view
    returns (
        uint256 amountVested,
        uint256 amountNotVested,
        uint256 amountOfGrant,
        uint32 vestStartDay,
        uint32 cliffDuration,
        uint32 vestDuration,
        uint32 vestIntervalDays,
        bool isActive,
        bool wasRevoked
    );

    function VESTINGASOF916(uint32 onDayOrToday) external view returns (	//inject NONSTANDARD NAMING
        uint256 amountVested,
        uint256 amountNotVested,
        uint256 amountOfGrant,
        uint32 vestStartDay,
        uint32 cliffDuration,
        uint32 vestDuration,
        uint32 vestIntervalDays,
        bool isActive,
        bool wasRevoked
    );

    function REVOKEGRANT273(address grantHolder, uint32 onDay) external returns (bool);	//inject NONSTANDARD NAMING


    event VESTINGSCHEDULECREATED156(	//inject NONSTANDARD NAMING
        address indexed vestingLocation,
        uint32 cliffDuration, uint32 indexed duration, uint32 interval,
        bool indexed isRevocable);

    event VESTINGTOKENSGRANTED869(	//inject NONSTANDARD NAMING
        address indexed beneficiary,
        uint256 indexed vestingAmount,
        uint32 startDay,
        address vestingLocation,
        address indexed grantor);

    event GRANTREVOKED263(address indexed grantHolder, uint32 indexed onDay);	//inject NONSTANDARD NAMING
}


pragma solidity ^0.5.7;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
contract ERC20Vestable is ERC20, VerifiedAccount, GrantorRole, IERC20Vestable {
    using SafeMath for uint256;

    // Date-related constants for sanity-checking dates to reject obvious erroneous inputs
    // and conversions from seconds to days and years that are more or less leap year-aware.
    uint32 private constant thousand_years_days480 = 365243;                                                                                                                     	//inject NONSTANDARD NAMING
    uint32 private constant ten_years_days216 = thousand_years_days480 / 100;                                                                	//inject NONSTANDARD NAMING
    uint32 private constant seconds_per_day267 = 24 * 60 * 60;                                             	//inject NONSTANDARD NAMING
    uint32 private constant jan_1_2000_seconds314 = 946684800;                                                                                                    	//inject NONSTANDARD NAMING
    uint32 private constant jan_1_2000_days626 = jan_1_2000_seconds314 / seconds_per_day267;	//inject NONSTANDARD NAMING
    uint32 private constant jan_1_3000_days345 = jan_1_2000_days626 + thousand_years_days480;	//inject NONSTANDARD NAMING

    struct vestingSchedule {
        bool isValid;                                                         
        bool isRevocable;                                                                                                   
        uint32 cliffDuration;                                                                                 
        uint32 duration;                                                                                                 
        uint32 interval;                                                           
    }

    struct tokenGrant {
        bool isActive;                                                                             
        bool wasRevoked;                                                            
        uint32 startDay;                                                                                      
        uint256 amount;                                                    
        address vestingLocation;                                                                 
        address grantor;                                             
    }

    mapping(address => vestingSchedule) private _vestingSchedules;
    mapping(address => tokenGrant) private _tokenGrants;


    // =========================================================================
    // === Methods for administratively creating a vesting schedule for an account.
    // =========================================================================

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _SETVESTINGSCHEDULE993(	//inject NONSTANDARD NAMING
        address vestingLocation,
        uint32 cliffDuration, uint32 duration, uint32 interval,
        bool isRevocable) internal returns (bool ok) {

        // Check for a valid vesting schedule given (disallow absurd values to reject likely bad input).
        require(
            duration > 0 && duration <= ten_years_days216
            && cliffDuration < duration
            && interval >= 1,
            "invalid vesting schedule"
        );

        // Make sure the duration values are in harmony with interval (both should be an exact multiple of interval).
        require(
            duration % interval == 0 && cliffDuration % interval == 0,
            "invalid cliff/duration for interval"
        );

        // Create and populate a vesting schedule.
        _vestingSchedules[vestingLocation] = vestingSchedule(
            true           ,
            isRevocable,
            cliffDuration, duration, interval
        );

        // Emit the event and return success.
        emit VESTINGSCHEDULECREATED156(
            vestingLocation,
            cliffDuration, duration, interval,
            isRevocable);
        return true;
    }

    function _HASVESTINGSCHEDULE920(address account) internal view returns (bool ok) {	//inject NONSTANDARD NAMING
        return _vestingSchedules[account].isValid;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function GETINTRINSICVESTINGSCHEDULE542(address grantHolder)	//inject NONSTANDARD NAMING
    public
    view
    ONLYGRANTORORSELF648(grantHolder)
    returns (
        uint32 vestDuration,
        uint32 cliffDuration,
        uint32 vestIntervalDays
    )
    {
        return (
        _vestingSchedules[grantHolder].duration,
        _vestingSchedules[grantHolder].cliffDuration,
        _vestingSchedules[grantHolder].interval
        );
    }


    // =========================================================================
    // === Token grants (general-purpose)
    // === Methods to be used for administratively creating one-off token grants with vesting schedules.
    // =========================================================================

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function _GRANTVESTINGTOKENS514(	//inject NONSTANDARD NAMING
        address beneficiary,
        uint256 totalAmount,
        uint256 vestingAmount,
        uint32 startDay,
        address vestingLocation,
        address grantor
    )
    internal returns (bool ok)
    {
        // Make sure no prior grant is in effect.
        require(!_tokenGrants[beneficiary].isActive, "grant already exists");

        // Check for valid vestingAmount
        require(
            vestingAmount <= totalAmount && vestingAmount > 0
            && startDay >= jan_1_2000_days626 && startDay < jan_1_3000_days345,
            "invalid vesting params");

        // Make sure the vesting schedule we are about to use is valid.
        require(_HASVESTINGSCHEDULE920(vestingLocation), "no such vesting schedule");

        // Transfer the total number of tokens from grantor into the account's holdings.
        _TRANSFER803(grantor, beneficiary, totalAmount);
                                     

        // Create and populate a token grant, referencing vesting schedule.
        _tokenGrants[beneficiary] = tokenGrant(
            true            ,
            false              ,
            startDay,
            vestingAmount,
            vestingLocation,                                                             
            grantor                                                                                           
        );

        // Emit the event and return success.
        emit VESTINGTOKENSGRANTED869(beneficiary, vestingAmount, startDay, vestingLocation, grantor);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function GRANTVESTINGTOKENS215(	//inject NONSTANDARD NAMING
        address beneficiary,
        uint256 totalAmount,
        uint256 vestingAmount,
        uint32 startDay,
        uint32 duration,
        uint32 cliffDuration,
        uint32 interval,
        bool isRevocable
    ) public ONLYGRANTOR597 returns (bool ok) {
        // Make sure no prior vesting schedule has been set.
        require(!_tokenGrants[beneficiary].isActive, "grant already exists");

        // The vesting schedule is unique to this wallet and so will be stored here,
        _SETVESTINGSCHEDULE993(beneficiary, cliffDuration, duration, interval, isRevocable);

        // Issue grantor tokens to the beneficiary, using beneficiary's own vesting schedule.
        _GRANTVESTINGTOKENS514(beneficiary, totalAmount, vestingAmount, startDay, beneficiary, msg.sender);

        return true;
    }

                                                                                                                      
    function SAFEGRANTVESTINGTOKENS119(	//inject NONSTANDARD NAMING
        address beneficiary, uint256 totalAmount, uint256 vestingAmount,
        uint32 startDay, uint32 duration, uint32 cliffDuration, uint32 interval,
        bool isRevocable) public ONLYGRANTOR597 ONLYEXISTINGACCOUNT761(beneficiary) returns (bool ok) {

        return GRANTVESTINGTOKENS215(
            beneficiary, totalAmount, vestingAmount,
            startDay, duration, cliffDuration, interval,
            isRevocable);
    }


    // =========================================================================
    // === Check vesting.
    // =========================================================================

                                                                                                    
    function TODAY986() public view returns (uint32 dayNumber) {	//inject NONSTANDARD NAMING
        return uint32(block.timestamp / seconds_per_day267);
    }

    function _EFFECTIVEDAY599(uint32 onDayOrToday) internal view returns (uint32 dayNumber) {	//inject NONSTANDARD NAMING
        return onDayOrToday == 0 ? TODAY986() : onDayOrToday;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                      
    function _GETNOTVESTEDAMOUNT103(address grantHolder, uint32 onDayOrToday) internal view returns (uint256 amountNotVested) {	//inject NONSTANDARD NAMING
        tokenGrant storage grant = _tokenGrants[grantHolder];
        vestingSchedule storage vesting = _vestingSchedules[grant.vestingLocation];
        uint32 onDay = _EFFECTIVEDAY599(onDayOrToday);

        // If there's no schedule, or before the vesting cliff, then the full amount is not vested.
        if (!grant.isActive || onDay < grant.startDay + vesting.cliffDuration)
        {
            // None are vested (all are not vested)
            return grant.amount;
        }
        // If after end of vesting, then the not vested amount is zero (all are vested).
        else if (onDay >= grant.startDay + vesting.duration)
        {
            // All are vested (none are not vested)
            return uint256(0);
        }
        // Otherwise a fractional amount is vested.
        else
        {
            // Compute the exact number of days vested.
            uint32 daysVested = onDay - grant.startDay;
            // Adjust result rounding down to take into consideration the interval.
            uint32 effectiveDaysVested = (daysVested / vesting.interval) * vesting.interval;

            // Compute the fraction vested from schedule using 224.32 fixed point math for date range ratio.
            // Note: This is safe in 256-bit math because max value of X billion tokens = X*10^27 wei, and
            // typical token amounts can fit into 90 bits. Scaling using a 32 bits value results in only 125
            // bits before reducing back to 90 bits by dividing. There is plenty of room left, even for token
            // amounts many orders of magnitude greater than mere billions.
            uint256 vested = grant.amount.MUL592(effectiveDaysVested).DIV616(vesting.duration);
            return grant.amount.SUB668(vested);
        }
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function _GETAVAILABLEAMOUNT501(address grantHolder, uint32 onDay) internal view returns (uint256 amountAvailable) {	//inject NONSTANDARD NAMING
        uint256 totalTokens = BALANCEOF403(grantHolder);
        uint256 vested = totalTokens.SUB668(_GETNOTVESTEDAMOUNT103(grantHolder, onDay));
        return vested;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function VESTINGFORACCOUNTASOF727(	//inject NONSTANDARD NAMING
        address grantHolder,
        uint32 onDayOrToday
    )
    public
    view
    ONLYGRANTORORSELF648(grantHolder)
    returns (
        uint256 amountVested,
        uint256 amountNotVested,
        uint256 amountOfGrant,
        uint32 vestStartDay,
        uint32 vestDuration,
        uint32 cliffDuration,
        uint32 vestIntervalDays,
        bool isActive,
        bool wasRevoked
    )
    {
        tokenGrant storage grant = _tokenGrants[grantHolder];
        vestingSchedule storage vesting = _vestingSchedules[grant.vestingLocation];
        uint256 notVestedAmount = _GETNOTVESTEDAMOUNT103(grantHolder, onDayOrToday);
        uint256 grantAmount = grant.amount;

        return (
        grantAmount.SUB668(notVestedAmount),
        notVestedAmount,
        grantAmount,
        grant.startDay,
        vesting.duration,
        vesting.cliffDuration,
        vesting.interval,
        grant.isActive,
        grant.wasRevoked
        );
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function VESTINGASOF916(uint32 onDayOrToday) public view returns (	//inject NONSTANDARD NAMING
        uint256 amountVested,
        uint256 amountNotVested,
        uint256 amountOfGrant,
        uint32 vestStartDay,
        uint32 vestDuration,
        uint32 cliffDuration,
        uint32 vestIntervalDays,
        bool isActive,
        bool wasRevoked
    )
    {
        return VESTINGFORACCOUNTASOF727(msg.sender, onDayOrToday);
    }

                                                                                                                                                                                                                                                                                                                                                                 
    function _FUNDSAREAVAILABLEON902(address account, uint256 amount, uint32 onDay) internal view returns (bool ok) {	//inject NONSTANDARD NAMING
        return (amount <= _GETAVAILABLEAMOUNT501(account, onDay));
    }

                                                                                                                                                                                                                                        
    modifier ONLYIFFUNDSAVAILABLENOW969(address account, uint256 amount) {	//inject NONSTANDARD NAMING
        // Distinguish insufficient overall balance from insufficient vested funds balance in failure msg.
        require(_FUNDSAREAVAILABLEON902(account, amount, TODAY986()),
            BALANCEOF403(account) < amount ? "insufficient funds" : "insufficient vested funds");
        _;
    }


    // =========================================================================
    // === Grant revocation
    // =========================================================================

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function REVOKEGRANT273(address grantHolder, uint32 onDay) public ONLYGRANTOR597 returns (bool ok) {	//inject NONSTANDARD NAMING
        tokenGrant storage grant = _tokenGrants[grantHolder];
        vestingSchedule storage vesting = _vestingSchedules[grant.vestingLocation];
        uint256 notVestedAmount;

        // Make sure grantor can only revoke from own pool.
        require(msg.sender == OWNER813() || msg.sender == grant.grantor, "not allowed");
        // Make sure a vesting schedule has previously been set.
        require(grant.isActive, "no active grant");
        // Make sure it's revocable.
        require(vesting.isRevocable, "irrevocable");
        // Fail on likely erroneous input.
        require(onDay <= grant.startDay + vesting.duration, "no effect");
        // Don"t let grantor revoke anf portion of vested amount.
        require(onDay >= TODAY986(), "cannot revoke vested holdings");

        notVestedAmount = _GETNOTVESTEDAMOUNT103(grantHolder, onDay);

        // Use ERC20 _approve() to forcibly approve grantor to take back not-vested tokens from grantHolder.
        _APPROVE779(grantHolder, grant.grantor, notVestedAmount);
                                      
        TRANSFERFROM317(grantHolder, grant.grantor, notVestedAmount);
                                                     

        // Kill the grant by updating wasRevoked and isActive.
        _tokenGrants[grantHolder].wasRevoked = true;
        _tokenGrants[grantHolder].isActive = false;

        emit GRANTREVOKED263(grantHolder, onDay);
                                           
        return true;
    }


    // =========================================================================
    // === Overridden ERC20 functionality
    // =========================================================================

                                                                                                                                                                                                                                                                                                                         
    function TRANSFER431(address to, uint256 value) public ONLYIFFUNDSAVAILABLENOW969(msg.sender, value) returns (bool ok) {	//inject NONSTANDARD NAMING
        return super.TRANSFER431(to, value);
    }

                                                                                                            
    function APPROVE986(address spender, uint256 value) public ONLYIFFUNDSAVAILABLENOW969(msg.sender, value) returns (bool ok) {	//inject NONSTANDARD NAMING
        return super.APPROVE986(spender, value);
    }
}


pragma solidity ^0.5.7;


                                                                                                                                                                                                                                                                              
contract UniformTokenGrantor is ERC20Vestable {

    struct restrictions {
        bool isValid;
        uint32 minStartDay;                                                                        
        uint32 maxStartDay;                                                                       
        uint32 expirationDay;                                                       
    }

    mapping(address => restrictions) private _restrictions;


    // =========================================================================
    // === Uniform token grant setup
    // === Methods used by owner to set up uniform grants on restricted grantor
    // =========================================================================

    event GRANTORRESTRICTIONSSET667(	//inject NONSTANDARD NAMING
        address indexed grantor,
        uint32 minStartDay,
        uint32 maxStartDay,
        uint32 expirationDay);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function SETRESTRICTIONS58(	//inject NONSTANDARD NAMING
        address grantor,
        uint32 minStartDay,
        uint32 maxStartDay,
        uint32 expirationDay
    )
    public
    ONLYOWNER456
    ONLYEXISTINGACCOUNT761(grantor)
    returns (bool ok)
    {
        require(
            ISUNIFORMGRANTOR164(grantor)
         && maxStartDay > minStartDay
         && expirationDay > TODAY986(), "invalid params");

        // We allow owner to set or change existing specific restrictions.
        _restrictions[grantor] = restrictions(
            true           ,
            minStartDay,
            maxStartDay,
            expirationDay
        );

        // Emit the event and return success.
        emit GRANTORRESTRICTIONSSET667(grantor, minStartDay, maxStartDay, expirationDay);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function SETGRANTORVESTINGSCHEDULE847(	//inject NONSTANDARD NAMING
        address grantor,
        uint32 duration,
        uint32 cliffDuration,
        uint32 interval,
        bool isRevocable
    )
    public
    ONLYOWNER456
    ONLYEXISTINGACCOUNT761(grantor)
    returns (bool ok)
    {
        // Only allow doing this to restricted grantor role account.
        require(ISUNIFORMGRANTOR164(grantor), "uniform grantor only");
        // Make sure no prior vesting schedule has been set!
        require(!_HASVESTINGSCHEDULE920(grantor), "schedule already exists");

        // The vesting schedule is unique to this grantor wallet and so will be stored here to be
        // referenced by future grants. Emits VestingScheduleCreated event.
        _SETVESTINGSCHEDULE993(grantor, cliffDuration, duration, interval, isRevocable);

        return true;
    }


    // =========================================================================
    // === Uniform token grants
    // === Methods to be used by exchanges to use for creating tokens.
    // =========================================================================

    function ISUNIFORMGRANTORWITHSCHEDULE164(address account) internal view returns (bool ok) {	//inject NONSTANDARD NAMING
        // Check for grantor that has a uniform vesting schedule already set.
        return ISUNIFORMGRANTOR164(account) && _HASVESTINGSCHEDULE920(account);
    }

    modifier ONLYUNIFORMGRANTORWITHSCHEDULE696(address account) {	//inject NONSTANDARD NAMING
        require(ISUNIFORMGRANTORWITHSCHEDULE164(account), "grantor account not ready");
        _;
    }

    modifier WHENGRANTORRESTRICTIONSMET858(uint32 startDay) {	//inject NONSTANDARD NAMING
        restrictions storage restriction = _restrictions[msg.sender];
        require(restriction.isValid, "set restrictions first");

        require(
            startDay >= restriction.minStartDay
            && startDay < restriction.maxStartDay, "startDay too early");

        require(TODAY986() < restriction.expirationDay, "grantor expired");
        _;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function GRANTUNIFORMVESTINGTOKENS288(	//inject NONSTANDARD NAMING
        address beneficiary,
        uint256 totalAmount,
        uint256 vestingAmount,
        uint32 startDay
    )
    public
    ONLYUNIFORMGRANTORWITHSCHEDULE696(msg.sender)
    WHENGRANTORRESTRICTIONSMET858(startDay)
    returns (bool ok)
    {
        // Issue grantor tokens to the beneficiary, using beneficiary's own vesting schedule.
        // Emits VestingTokensGranted event.
        return _GRANTVESTINGTOKENS514(beneficiary, totalAmount, vestingAmount, startDay, msg.sender, msg.sender);
    }

                                                                                                                      
    function SAFEGRANTUNIFORMVESTINGTOKENS263(	//inject NONSTANDARD NAMING
        address beneficiary,
        uint256 totalAmount,
        uint256 vestingAmount,
        uint32 startDay
    )
    public
    ONLYUNIFORMGRANTORWITHSCHEDULE696(msg.sender)
    WHENGRANTORRESTRICTIONSMET858(startDay)
    ONLYEXISTINGACCOUNT761(beneficiary)
    returns (bool ok)
    {
        // Issue grantor tokens to the beneficiary, using beneficiary's own vesting schedule.
        // Emits VestingTokensGranted event.
        return _GRANTVESTINGTOKENS514(beneficiary, totalAmount, vestingAmount, startDay, msg.sender, msg.sender);
    }
}


pragma solidity ^0.5.7;


                                                                                                                                                                                                                              
contract CxpCoin is Identity, ERC20, ERC20Pausable, ERC20Burnable, ERC20Detailed, UniformTokenGrantor {
    uint32 public constant version522 = 8;	//inject NONSTANDARD NAMING

    uint8 private constant decimals941 = 18;	//inject NONSTANDARD NAMING
    uint256 private constant token_wei507 = 10 ** uint256(decimals941);	//inject NONSTANDARD NAMING

    uint256 private constant initial_whole_tokens713 = uint256(10 * (10 ** 9));	//inject NONSTANDARD NAMING
    uint256 private constant initial_supply412 = uint256(initial_whole_tokens713) * uint256(token_wei507);	//inject NONSTANDARD NAMING

                                                                                     
    constructor () ERC20Detailed("CXPcoin", "CXP", decimals941) public {
        // This is the only place where we ever mint tokens.
        _MINT20(msg.sender, initial_supply412);
    }

    event DEPOSITRECEIVED509(address indexed from, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                        
    function() payable external {
        // Track where unexpected ETH came from so we can follow up later.
        emit DEPOSITRECEIVED509(msg.sender, msg.value);
    }

                                                                                                                                                                                                                                                                                                               
    function BURN59(uint256 value) ONLYIFFUNDSAVAILABLENOW969(msg.sender, value) public {	//inject NONSTANDARD NAMING
        // This is the only place where we ever burn tokens.
        _BURN728(msg.sender, value);
    }

                                                                                                                                                                                                                                
    function KILL230() WHENPAUSED499 ONLYPAUSER414 public returns (bool itsDeadJim) {	//inject NONSTANDARD NAMING
        require(ISPAUSER323(msg.sender), "onlyPauser");
        address payable payableOwner = address(uint160(OWNER813()));
        selfdestruct(payableOwner);
        return true;
    }
}