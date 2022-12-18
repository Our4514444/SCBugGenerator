pragma solidity ^0.5.7;

contract Identity {
    mapping(address => string) private _names;

                                                                                 
    function IAM708(string memory shortName) public {	//inject NONSTANDARD NAMING
        _names[msg.sender] = shortName;
    }

                                                                                
    function WHEREAMI217() public view returns (address yourAddress) {	//inject NONSTANDARD NAMING
        address myself = msg.sender;
        return myself;
    }

                                                                                   
    function WHOAMI165() public view returns (string memory yourName) {	//inject NONSTANDARD NAMING
        return (_names[msg.sender]);
    }
}


pragma solidity ^0.5.0;

                                                                                   
interface IERC20 {
    function TRANSFER642(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE68(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM949(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY156() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF909(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE316(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER577(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL285(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


pragma solidity ^0.5.0;

                                                                                                    
library SafeMath {
                                                                                  
    function MUL562(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV429(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB960(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "Insufficient funds");
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD143(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD922(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


pragma solidity ^0.5.0;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                                
    function TOTALSUPPLY156() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF909(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE316(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                 
    function TRANSFER642(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER211(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE68(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE297(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM949(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER211(from, to, value);
        _APPROVE297(from, msg.sender, _allowed[from][msg.sender].SUB960(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE468(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE297(msg.sender, spender, _allowed[msg.sender][spender].ADD143(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE950(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE297(msg.sender, spender, _allowed[msg.sender][spender].SUB960(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                     
    function _TRANSFER211(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB960(value);
        _balances[to] = _balances[to].ADD143(value);
        emit TRANSFER577(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT20(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD143(value);
        _balances[account] = _balances[account].ADD143(value);
        emit TRANSFER577(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN83(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB960(value);
        _balances[account] = _balances[account].SUB960(value);
        emit TRANSFER577(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE297(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0));
        require(spender != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL285(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM597(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN83(account, value);
        _APPROVE297(account, msg.sender, _allowed[account][msg.sender].SUB960(value));
    }
}


pragma solidity ^0.5.0;


                                                                                           
contract ERC20Burnable is ERC20 {
                                                                                                                    
    function BURN762(uint256 value) public {	//inject NONSTANDARD NAMING
        _BURN83(msg.sender, value);
    }

                                                                                                                                                                                                                                                 
    function BURNFROM328(address from, uint256 value) public {	//inject NONSTANDARD NAMING
        _BURNFROM597(from, value);
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

                                                     
    function NAME46() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL16() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS380() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}


pragma solidity ^0.5.0;

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED341(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED341(address(0), _owner);
    }

                                                        
    function OWNER298() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER544() {	//inject NONSTANDARD NAMING
        require(ISOWNER324());
        _;
    }

                                                                                 
    function ISOWNER324() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP441() public ONLYOWNER544 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED341(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP240(address newOwner) public ONLYOWNER544 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP537(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP537(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED341(_owner, newOwner);
        _owner = newOwner;
    }
}


pragma solidity ^0.5.0;

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD143(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS139(role, account));
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE494(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS139(role, account));
        role.bearer[account] = false;
    }

                                                                                  
    function HAS139(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}


pragma solidity ^0.5.7;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
contract PauserRole is Ownable {
    using Roles for Roles.Role;

    event PAUSERADDED427(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED374(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    constructor () internal {
        _ADDPAUSER452(msg.sender);
    }

    modifier ONLYPAUSER465() {	//inject NONSTANDARD NAMING
        require(ISPAUSER932(msg.sender), "onlyPauser");
        _;
    }

    function ISPAUSER932(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS139(account);
    }

    function ADDPAUSER994(address account) public ONLYOWNER544 {	//inject NONSTANDARD NAMING
        _ADDPAUSER452(account);
    }

    function REMOVEPAUSER106(address account) public ONLYOWNER544 {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER704(account);
    }

    function _ADDPAUSER452(address account) private {	//inject NONSTANDARD NAMING
        require(account != address(0));
        _pausers.ADD143(account);
        emit PAUSERADDED427(account);
    }

    function _REMOVEPAUSER704(address account) private {	//inject NONSTANDARD NAMING
        require(account != address(0));
        _pausers.REMOVE494(account);
        emit PAUSERREMOVED374(account);
    }


    // =========================================================================
    // === Overridden ERC20 functionality
    // =========================================================================

                                                                                                                                                                                                                    
    function RENOUNCEOWNERSHIP441() public ONLYOWNER544 {	//inject NONSTANDARD NAMING
        require(false, "forbidden");
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP240(address newOwner) public ONLYOWNER544 {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER704(msg.sender);
        super.TRANSFEROWNERSHIP240(newOwner);
        _ADDPAUSER452(newOwner);
    }
}


pragma solidity ^0.5.0;


                                                                                                                
contract Pausable is PauserRole {
    event PAUSED655(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED585(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

                                                                               
    function PAUSED553() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED830() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED310() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE936() public ONLYPAUSER465 WHENNOTPAUSED830 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED655(msg.sender);
    }

                                                                                   
    function UNPAUSE704() public ONLYPAUSER465 WHENPAUSED310 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED585(msg.sender);
    }
}


pragma solidity ^0.5.0;


                                                                                
contract ERC20Pausable is ERC20, Pausable {
    function TRANSFER642(address to, uint256 value) public WHENNOTPAUSED830 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER642(to, value);
    }

    function TRANSFERFROM949(address from, address to, uint256 value) public WHENNOTPAUSED830 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM949(from, to, value);
    }

    function APPROVE68(address spender, uint256 value) public WHENNOTPAUSED830 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE68(spender, value);
    }

    function INCREASEALLOWANCE468(address spender, uint addedValue) public WHENNOTPAUSED830 returns (bool) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE468(spender, addedValue);
    }

    function DECREASEALLOWANCE950(address spender, uint subtractedValue) public WHENNOTPAUSED830 returns (bool) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE950(spender, subtractedValue);
    }
}


pragma solidity ^0.5.7;


contract VerifiedAccount is ERC20, Ownable {

    mapping(address => bool) private _isRegistered;

    constructor () internal {
        // The smart contract starts off registering itself, since address is known.
        REGISTERACCOUNT908();
    }

    event ACCOUNTREGISTERED290(address indexed account);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                      
    function REGISTERACCOUNT908() public returns (bool ok) {	//inject NONSTANDARD NAMING
        _isRegistered[msg.sender] = true;
        emit ACCOUNTREGISTERED290(msg.sender);
        return true;
    }

    function ISREGISTERED151(address account) public view returns (bool ok) {	//inject NONSTANDARD NAMING
        return _isRegistered[account];
    }

    function _ACCOUNTEXISTS114(address account) internal view returns (bool exists) {	//inject NONSTANDARD NAMING
        return account == msg.sender || _isRegistered[account];
    }

    modifier ONLYEXISTINGACCOUNT79(address account) {	//inject NONSTANDARD NAMING
        require(_ACCOUNTEXISTS114(account), "account not registered");
        _;
    }


    // =========================================================================
    // === Safe ERC20 methods
    // =========================================================================

    function SAFETRANSFER465(address to, uint256 value) public ONLYEXISTINGACCOUNT79(to) returns (bool ok) {	//inject NONSTANDARD NAMING
        TRANSFER642(to, value);
        return true;
    }

    function SAFEAPPROVE114(address spender, uint256 value) public ONLYEXISTINGACCOUNT79(spender) returns (bool ok) {	//inject NONSTANDARD NAMING
        APPROVE68(spender, value);
        return true;
    }

    function SAFETRANSFERFROM962(address from, address to, uint256 value) public ONLYEXISTINGACCOUNT79(to) returns (bool ok) {	//inject NONSTANDARD NAMING
        TRANSFERFROM949(from, to, value);
        return true;
    }


    // =========================================================================
    // === Safe ownership transfer
    // =========================================================================

                                                                                                                                                                    
    function TRANSFEROWNERSHIP240(address newOwner) public ONLYEXISTINGACCOUNT79(newOwner) ONLYOWNER544 {	//inject NONSTANDARD NAMING
        super.TRANSFEROWNERSHIP240(newOwner);
    }
}


pragma solidity ^0.5.7;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
contract GrantorRole is Ownable {
    bool private constant owner_uniform_grantor_flag145 = false;	//inject NONSTANDARD NAMING

    using Roles for Roles.Role;

    event GRANTORADDED214(address indexed account);	//inject NONSTANDARD NAMING
    event GRANTORREMOVED878(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _grantors;
    mapping(address => bool) private _isUniformGrantor;

    constructor () internal {
        _ADDGRANTOR885(msg.sender, owner_uniform_grantor_flag145);
    }

    modifier ONLYGRANTOR917() {	//inject NONSTANDARD NAMING
        require(ISGRANTOR780(msg.sender), "onlyGrantor");
        _;
    }

    modifier ONLYGRANTORORSELF79(address account) {	//inject NONSTANDARD NAMING
        require(ISGRANTOR780(msg.sender) || msg.sender == account, "onlyGrantorOrSelf");
        _;
    }

    function ISGRANTOR780(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _grantors.HAS139(account);
    }

    function ADDGRANTOR932(address account, bool isUniformGrantor) public ONLYOWNER544 {	//inject NONSTANDARD NAMING
        _ADDGRANTOR885(account, isUniformGrantor);
    }

    function REMOVEGRANTOR325(address account) public ONLYOWNER544 {	//inject NONSTANDARD NAMING
        _REMOVEGRANTOR343(account);
    }

    function _ADDGRANTOR885(address account, bool isUniformGrantor) private {	//inject NONSTANDARD NAMING
        require(account != address(0));
        _grantors.ADD143(account);
        _isUniformGrantor[account] = isUniformGrantor;
        emit GRANTORADDED214(account);
    }

    function _REMOVEGRANTOR343(address account) private {	//inject NONSTANDARD NAMING
        require(account != address(0));
        _grantors.REMOVE494(account);
        emit GRANTORREMOVED878(account);
    }

    function ISUNIFORMGRANTOR563(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return ISGRANTOR780(account) && _isUniformGrantor[account];
    }

    modifier ONLYUNIFORMGRANTOR155() {	//inject NONSTANDARD NAMING
        require(ISUNIFORMGRANTOR563(msg.sender), "onlyUniformGrantor");
        // Only grantor role can do this.
        _;
    }


    // =========================================================================
    // === Overridden ERC20 functionality
    // =========================================================================

                                                                                                                                                                                                                         
    function RENOUNCEOWNERSHIP441() public ONLYOWNER544 {	//inject NONSTANDARD NAMING
        require(false, "forbidden");
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP240(address newOwner) public ONLYOWNER544 {	//inject NONSTANDARD NAMING
        _REMOVEGRANTOR343(msg.sender);
        super.TRANSFEROWNERSHIP240(newOwner);
        _ADDGRANTOR885(newOwner, owner_uniform_grantor_flag145);
    }
}


pragma solidity ^0.5.7;


interface IERC20Vestable {
    function GETINTRINSICVESTINGSCHEDULE73(address grantHolder)	//inject NONSTANDARD NAMING
    external
    view
    returns (
        uint32 cliffDuration,
        uint32 vestDuration,
        uint32 vestIntervalDays
    );

    function GRANTVESTINGTOKENS103(	//inject NONSTANDARD NAMING
        address beneficiary,
        uint256 totalAmount,
        uint256 vestingAmount,
        uint32 startDay,
        uint32 duration,
        uint32 cliffDuration,
        uint32 interval,
        bool isRevocable
    ) external returns (bool ok);

    function TODAY869() external view returns (uint32 dayNumber);	//inject NONSTANDARD NAMING

    function VESTINGFORACCOUNTASOF2(	//inject NONSTANDARD NAMING
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

    function VESTINGASOF713(uint32 onDayOrToday) external view returns (	//inject NONSTANDARD NAMING
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

    function REVOKEGRANT942(address grantHolder, uint32 onDay) external returns (bool);	//inject NONSTANDARD NAMING


    event VESTINGSCHEDULECREATED729(	//inject NONSTANDARD NAMING
        address indexed vestingLocation,
        uint32 cliffDuration, uint32 indexed duration, uint32 interval,
        bool indexed isRevocable);

    event VESTINGTOKENSGRANTED26(	//inject NONSTANDARD NAMING
        address indexed beneficiary,
        uint256 indexed vestingAmount,
        uint32 startDay,
        address vestingLocation,
        address indexed grantor);

    event GRANTREVOKED11(address indexed grantHolder, uint32 indexed onDay);	//inject NONSTANDARD NAMING
}


pragma solidity ^0.5.7;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
contract ERC20Vestable is ERC20, VerifiedAccount, GrantorRole, IERC20Vestable {
    using SafeMath for uint256;

    // Date-related constants for sanity-checking dates to reject obvious erroneous inputs
    // and conversions from seconds to days and years that are more or less leap year-aware.
    uint32 private constant thousand_years_days936 = 365243;                                                                                                                     	//inject NONSTANDARD NAMING
    uint32 private constant ten_years_days919 = thousand_years_days936 / 100;                                                                	//inject NONSTANDARD NAMING
    uint32 private constant seconds_per_day968 = 24 * 60 * 60;                                             	//inject NONSTANDARD NAMING
    uint32 private constant jan_1_2000_seconds901 = 946684800;                                                                                                    	//inject NONSTANDARD NAMING
    uint32 private constant jan_1_2000_days108 = jan_1_2000_seconds901 / seconds_per_day968;	//inject NONSTANDARD NAMING
    uint32 private constant jan_1_3000_days211 = jan_1_2000_days108 + thousand_years_days936;	//inject NONSTANDARD NAMING

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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _SETVESTINGSCHEDULE616(	//inject NONSTANDARD NAMING
        address vestingLocation,
        uint32 cliffDuration, uint32 duration, uint32 interval,
        bool isRevocable) internal returns (bool ok) {

        // Check for a valid vesting schedule given (disallow absurd values to reject likely bad input).
        require(
            duration > 0 && duration <= ten_years_days919
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
        emit VESTINGSCHEDULECREATED729(
            vestingLocation,
            cliffDuration, duration, interval,
            isRevocable);
        return true;
    }

    function _HASVESTINGSCHEDULE609(address account) internal view returns (bool ok) {	//inject NONSTANDARD NAMING
        return _vestingSchedules[account].isValid;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function GETINTRINSICVESTINGSCHEDULE73(address grantHolder)	//inject NONSTANDARD NAMING
    public
    view
    ONLYGRANTORORSELF79(grantHolder)
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function _GRANTVESTINGTOKENS164(	//inject NONSTANDARD NAMING
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
            && startDay >= jan_1_2000_days108 && startDay < jan_1_3000_days211,
            "invalid vesting params");

        // Make sure the vesting schedule we are about to use is valid.
        require(_HASVESTINGSCHEDULE609(vestingLocation), "no such vesting schedule");

        // Transfer the total number of tokens from grantor into the account's holdings.
        _TRANSFER211(grantor, beneficiary, totalAmount);
                                     

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
        emit VESTINGTOKENSGRANTED26(beneficiary, vestingAmount, startDay, vestingLocation, grantor);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function GRANTVESTINGTOKENS103(	//inject NONSTANDARD NAMING
        address beneficiary,
        uint256 totalAmount,
        uint256 vestingAmount,
        uint32 startDay,
        uint32 duration,
        uint32 cliffDuration,
        uint32 interval,
        bool isRevocable
    ) public ONLYGRANTOR917 returns (bool ok) {
        // Make sure no prior vesting schedule has been set.
        require(!_tokenGrants[beneficiary].isActive, "grant already exists");

        // The vesting schedule is unique to this wallet and so will be stored here,
        _SETVESTINGSCHEDULE616(beneficiary, cliffDuration, duration, interval, isRevocable);

        // Issue grantor tokens to the beneficiary, using beneficiary's own vesting schedule.
        _GRANTVESTINGTOKENS164(beneficiary, totalAmount, vestingAmount, startDay, beneficiary, msg.sender);

        return true;
    }

                                                                                                                      
    function SAFEGRANTVESTINGTOKENS665(	//inject NONSTANDARD NAMING
        address beneficiary, uint256 totalAmount, uint256 vestingAmount,
        uint32 startDay, uint32 duration, uint32 cliffDuration, uint32 interval,
        bool isRevocable) public ONLYGRANTOR917 ONLYEXISTINGACCOUNT79(beneficiary) returns (bool ok) {

        return GRANTVESTINGTOKENS103(
            beneficiary, totalAmount, vestingAmount,
            startDay, duration, cliffDuration, interval,
            isRevocable);
    }


    // =========================================================================
    // === Check vesting.
    // =========================================================================

                                                                                                    
    function TODAY869() public view returns (uint32 dayNumber) {	//inject NONSTANDARD NAMING
        return uint32(block.timestamp / seconds_per_day968);
    }

    function _EFFECTIVEDAY847(uint32 onDayOrToday) internal view returns (uint32 dayNumber) {	//inject NONSTANDARD NAMING
        return onDayOrToday == 0 ? TODAY869() : onDayOrToday;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                      
    function _GETNOTVESTEDAMOUNT653(address grantHolder, uint32 onDayOrToday) internal view returns (uint256 amountNotVested) {	//inject NONSTANDARD NAMING
        tokenGrant storage grant = _tokenGrants[grantHolder];
        vestingSchedule storage vesting = _vestingSchedules[grant.vestingLocation];
        uint32 onDay = _EFFECTIVEDAY847(onDayOrToday);

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
            uint256 vested = grant.amount.MUL562(effectiveDaysVested).DIV429(vesting.duration);
            return grant.amount.SUB960(vested);
        }
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function _GETAVAILABLEAMOUNT648(address grantHolder, uint32 onDay) internal view returns (uint256 amountAvailable) {	//inject NONSTANDARD NAMING
        uint256 totalTokens = BALANCEOF909(grantHolder);
        uint256 vested = totalTokens.SUB960(_GETNOTVESTEDAMOUNT653(grantHolder, onDay));
        return vested;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function VESTINGFORACCOUNTASOF2(	//inject NONSTANDARD NAMING
        address grantHolder,
        uint32 onDayOrToday
    )
    public
    view
    ONLYGRANTORORSELF79(grantHolder)
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
        uint256 notVestedAmount = _GETNOTVESTEDAMOUNT653(grantHolder, onDayOrToday);
        uint256 grantAmount = grant.amount;

        return (
        grantAmount.SUB960(notVestedAmount),
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function VESTINGASOF713(uint32 onDayOrToday) public view returns (	//inject NONSTANDARD NAMING
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
        return VESTINGFORACCOUNTASOF2(msg.sender, onDayOrToday);
    }

                                                                                                                                                                                                                                                                                                                                                                 
    function _FUNDSAREAVAILABLEON606(address account, uint256 amount, uint32 onDay) internal view returns (bool ok) {	//inject NONSTANDARD NAMING
        return (amount <= _GETAVAILABLEAMOUNT648(account, onDay));
    }

                                                                                                                                                                                                                                        
    modifier ONLYIFFUNDSAVAILABLENOW268(address account, uint256 amount) {	//inject NONSTANDARD NAMING
        // Distinguish insufficient overall balance from insufficient vested funds balance in failure msg.
        require(_FUNDSAREAVAILABLEON606(account, amount, TODAY869()),
            BALANCEOF909(account) < amount ? "insufficient funds" : "insufficient vested funds");
        _;
    }


    // =========================================================================
    // === Grant revocation
    // =========================================================================

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function REVOKEGRANT942(address grantHolder, uint32 onDay) public ONLYGRANTOR917 returns (bool ok) {	//inject NONSTANDARD NAMING
        tokenGrant storage grant = _tokenGrants[grantHolder];
        vestingSchedule storage vesting = _vestingSchedules[grant.vestingLocation];
        uint256 notVestedAmount;

        // Make sure grantor can only revoke from own pool.
        require(msg.sender == OWNER298() || msg.sender == grant.grantor, "not allowed");
        // Make sure a vesting schedule has previously been set.
        require(grant.isActive, "no active grant");
        // Make sure it's revocable.
        require(vesting.isRevocable, "irrevocable");
        // Fail on likely erroneous input.
        require(onDay <= grant.startDay + vesting.duration, "no effect");
        // Don"t let grantor revoke anf portion of vested amount.
        require(onDay >= TODAY869(), "cannot revoke vested holdings");

        notVestedAmount = _GETNOTVESTEDAMOUNT653(grantHolder, onDay);

        // Use ERC20 _approve() to forcibly approve grantor to take back not-vested tokens from grantHolder.
        _APPROVE297(grantHolder, grant.grantor, notVestedAmount);
                                      
        TRANSFERFROM949(grantHolder, grant.grantor, notVestedAmount);
                                                     

        // Kill the grant by updating wasRevoked and isActive.
        _tokenGrants[grantHolder].wasRevoked = true;
        _tokenGrants[grantHolder].isActive = false;

        emit GRANTREVOKED11(grantHolder, onDay);
                                           
        return true;
    }


    // =========================================================================
    // === Overridden ERC20 functionality
    // =========================================================================

                                                                                                                                                                                                                                                                                                                         
    function TRANSFER642(address to, uint256 value) public ONLYIFFUNDSAVAILABLENOW268(msg.sender, value) returns (bool ok) {	//inject NONSTANDARD NAMING
        return super.TRANSFER642(to, value);
    }

                                                                                                            
    function APPROVE68(address spender, uint256 value) public ONLYIFFUNDSAVAILABLENOW268(msg.sender, value) returns (bool ok) {	//inject NONSTANDARD NAMING
        return super.APPROVE68(spender, value);
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

    event GRANTORRESTRICTIONSSET681(	//inject NONSTANDARD NAMING
        address indexed grantor,
        uint32 minStartDay,
        uint32 maxStartDay,
        uint32 expirationDay);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function SETRESTRICTIONS250(	//inject NONSTANDARD NAMING
        address grantor,
        uint32 minStartDay,
        uint32 maxStartDay,
        uint32 expirationDay
    )
    public
    ONLYOWNER544
    ONLYEXISTINGACCOUNT79(grantor)
    returns (bool ok)
    {
        require(
            ISUNIFORMGRANTOR563(grantor)
         && maxStartDay > minStartDay
         && expirationDay > TODAY869(), "invalid params");

        // We allow owner to set or change existing specific restrictions.
        _restrictions[grantor] = restrictions(
            true           ,
            minStartDay,
            maxStartDay,
            expirationDay
        );

        // Emit the event and return success.
        emit GRANTORRESTRICTIONSSET681(grantor, minStartDay, maxStartDay, expirationDay);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function SETGRANTORVESTINGSCHEDULE903(	//inject NONSTANDARD NAMING
        address grantor,
        uint32 duration,
        uint32 cliffDuration,
        uint32 interval,
        bool isRevocable
    )
    public
    ONLYOWNER544
    ONLYEXISTINGACCOUNT79(grantor)
    returns (bool ok)
    {
        // Only allow doing this to restricted grantor role account.
        require(ISUNIFORMGRANTOR563(grantor), "uniform grantor only");
        // Make sure no prior vesting schedule has been set!
        require(!_HASVESTINGSCHEDULE609(grantor), "schedule already exists");

        // The vesting schedule is unique to this grantor wallet and so will be stored here to be
        // referenced by future grants. Emits VestingScheduleCreated event.
        _SETVESTINGSCHEDULE616(grantor, cliffDuration, duration, interval, isRevocable);

        return true;
    }


    // =========================================================================
    // === Uniform token grants
    // === Methods to be used by exchanges to use for creating tokens.
    // =========================================================================

    function ISUNIFORMGRANTORWITHSCHEDULE212(address account) internal view returns (bool ok) {	//inject NONSTANDARD NAMING
        // Check for grantor that has a uniform vesting schedule already set.
        return ISUNIFORMGRANTOR563(account) && _HASVESTINGSCHEDULE609(account);
    }

    modifier ONLYUNIFORMGRANTORWITHSCHEDULE813(address account) {	//inject NONSTANDARD NAMING
        require(ISUNIFORMGRANTORWITHSCHEDULE212(account), "grantor account not ready");
        _;
    }

    modifier WHENGRANTORRESTRICTIONSMET404(uint32 startDay) {	//inject NONSTANDARD NAMING
        restrictions storage restriction = _restrictions[msg.sender];
        require(restriction.isValid, "set restrictions first");

        require(
            startDay >= restriction.minStartDay
            && startDay < restriction.maxStartDay, "startDay too early");

        require(TODAY869() < restriction.expirationDay, "grantor expired");
        _;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function GRANTUNIFORMVESTINGTOKENS487(	//inject NONSTANDARD NAMING
        address beneficiary,
        uint256 totalAmount,
        uint256 vestingAmount,
        uint32 startDay
    )
    public
    ONLYUNIFORMGRANTORWITHSCHEDULE813(msg.sender)
    WHENGRANTORRESTRICTIONSMET404(startDay)
    returns (bool ok)
    {
        // Issue grantor tokens to the beneficiary, using beneficiary's own vesting schedule.
        // Emits VestingTokensGranted event.
        return _GRANTVESTINGTOKENS164(beneficiary, totalAmount, vestingAmount, startDay, msg.sender, msg.sender);
    }

                                                                                                                      
    function SAFEGRANTUNIFORMVESTINGTOKENS195(	//inject NONSTANDARD NAMING
        address beneficiary,
        uint256 totalAmount,
        uint256 vestingAmount,
        uint32 startDay
    )
    public
    ONLYUNIFORMGRANTORWITHSCHEDULE813(msg.sender)
    WHENGRANTORRESTRICTIONSMET404(startDay)
    ONLYEXISTINGACCOUNT79(beneficiary)
    returns (bool ok)
    {
        // Issue grantor tokens to the beneficiary, using beneficiary's own vesting schedule.
        // Emits VestingTokensGranted event.
        return _GRANTVESTINGTOKENS164(beneficiary, totalAmount, vestingAmount, startDay, msg.sender, msg.sender);
    }
}


pragma solidity ^0.5.7;


                                                                                                                                                                                                                              
contract CpuCoin is Identity, ERC20, ERC20Pausable, ERC20Burnable, ERC20Detailed, UniformTokenGrantor {
    uint32 public constant version506 = 8;	//inject NONSTANDARD NAMING

    uint8 private constant decimals647 = 18;	//inject NONSTANDARD NAMING
    uint256 private constant token_wei400 = 10 ** uint256(decimals647);	//inject NONSTANDARD NAMING

    uint256 private constant initial_whole_tokens209 = uint256(5 * (10 ** 9));	//inject NONSTANDARD NAMING
    uint256 private constant initial_supply379 = uint256(initial_whole_tokens209) * uint256(token_wei400);	//inject NONSTANDARD NAMING

                                                                                     
    constructor () ERC20Detailed("CPUcoin", "CPU", decimals647) public {
        // This is the only place where we ever mint tokens.
        _MINT20(msg.sender, initial_supply379);
    }

    event DEPOSITRECEIVED468(address indexed from, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                        
    function() payable external {
        // Track where unexpected ETH came from so we can follow up later.
        emit DEPOSITRECEIVED468(msg.sender, msg.value);
    }

                                                                                                                                                                                                                                                                                                                      
    function BURN762(uint256 value) ONLYIFFUNDSAVAILABLENOW268(msg.sender, value) public {	//inject NONSTANDARD NAMING
        // This is the only place where we ever burn tokens.
        _BURN83(msg.sender, value);
    }

                                                                                                                                                                                                                                
    function KILL824() WHENPAUSED310 ONLYPAUSER465 public returns (bool itsDeadJim) {	//inject NONSTANDARD NAMING
        require(ISPAUSER932(msg.sender), "onlyPauser");
        address payable payableOwner = address(uint160(OWNER298()));
        selfdestruct(payableOwner);
        return true;
    }
}