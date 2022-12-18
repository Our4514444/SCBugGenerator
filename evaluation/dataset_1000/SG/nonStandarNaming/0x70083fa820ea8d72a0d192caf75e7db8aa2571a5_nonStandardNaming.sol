                                                                 

pragma solidity 0.5.14;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD107(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB92(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB92(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB92(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL934(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV864(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV864(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV864(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD951(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD951(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD951(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                              
library SafeMathUint {
  function TOINT256SAFE115(uint256 a) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    int256 b = int256(a);
    require(b >= 0);
    return b;
  }
}

                                                                                                                                                                                                                                                                                            
library SafeMathInt {
  function MUL934(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    // Prevent overflow when multiplying INT256_MIN with -1
    // https://github.com/RequestNetwork/requestNetwork/issues/43
    require(!(a == - 2**255 && b == -1) && !(b == - 2**255 && a == -1));

    int256 c = a * b;
    require((b == 0) || (c / b == a));
    return c;
  }

  function DIV864(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    // Prevent overflow when dividing INT256_MIN by -1
    // https://github.com/RequestNetwork/requestNetwork/issues/43
    require(!(a == - 2**255 && b == -1) && (b > 0));

    return a / b;
  }

  function SUB92(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    require((b >= 0 && a - b <= a) || (b < 0 && a - b > a));

    return a - b;
  }

  function ADD107(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    int256 c = a + b;
    require((b >= 0 && c >= a) || (b < 0 && c < a));
    return c;
  }

  function TOUINT256SAFE964(int256 a) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(a >= 0);
    return uint256(a);
  }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER930() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA928() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD107(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS0(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE265(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS0(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS0(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED57(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED233(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    modifier ONLYMINTER383() {	//inject NONSTANDARD NAMING
        require(ISMINTER920(msg.sender), "MinterRole: caller does not have the Minter role");
        _;
    }

    function ISMINTER920(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS0(account);
    }

    function ADDMINTER253(address account) public ONLYMINTER383 {	//inject NONSTANDARD NAMING
        _ADDMINTER932(account);
    }

    function RENOUNCEMINTER984() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER490(msg.sender);
    }

    function _ADDMINTER932(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD107(account);
        emit MINTERADDED57(account);
    }

    function _REMOVEMINTER490(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE265(account);
        emit MINTERREMOVED233(account);
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED836(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                     
    function OWNER256() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER126() {	//inject NONSTANDARD NAMING
        require(ISOWNER476(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER476() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER930() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP786() public ONLYOWNER126 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED836(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP43(address newOwner) public ONLYOWNER126 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP314(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP314(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED836(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                                                                      
contract Restrictable is Ownable {
    // State variable to track whether restrictions are enabled.  Defaults to true.
    bool private _restrictionsEnabled = true;

    // Event emitted when flag is disabled
    event RESTRICTIONSDISABLED948(address indexed owner);	//inject NONSTANDARD NAMING

                                                                          
    function ISRESTRICTIONENABLED60() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _restrictionsEnabled;
    }

                                                                                                                                                                                 
    function DISABLERESTRICTIONS97() public ONLYOWNER126 {	//inject NONSTANDARD NAMING
        require(_restrictionsEnabled, "Restrictions are already disabled.");
        
        // Set the flag
        _restrictionsEnabled = false;

        // Trigger the event
        emit RESTRICTIONSDISABLED948(msg.sender);
    }
}

                                                                                                                                                                                                                                      
contract Administratable is Ownable {
    // The mapping to track administrator accounts - true is reserved for admin addresses.
    mapping (address => bool) public administrators;

    // Events to allow tracking add/remove.
    event ADMINADDED686(address indexed addedAdmin, address indexed addedBy);	//inject NONSTANDARD NAMING
    event ADMINREMOVED439(address indexed removedAdmin, address indexed removedBy);	//inject NONSTANDARD NAMING

                                                                            
    modifier ONLYADMINISTRATOR315() {	//inject NONSTANDARD NAMING
        require(ISADMINISTRATOR960(msg.sender), "Calling account is not an administrator.");
        _;
    }

                                                                                  
    function ISADMINISTRATOR960(address addressToTest) public view returns (bool) {	//inject NONSTANDARD NAMING
        return administrators[addressToTest];
    }

                                                                                                         
    function ADDADMIN186(address adminToAdd) public ONLYOWNER126 {	//inject NONSTANDARD NAMING
        // Verify the account is not already an admin
        require(administrators[adminToAdd] == false, "Account to be added to admin list is already an admin");

        // Set the address mapping to true to indicate it is an administrator account.
        administrators[adminToAdd] = true;

        // Emit the event for any watchers.
        emit ADMINADDED686(adminToAdd, msg.sender);
    }

                                                                                                              
    function REMOVEADMIN786(address adminToRemove) public ONLYOWNER126 {	//inject NONSTANDARD NAMING
        // Verify the account is an admin
        require(administrators[adminToRemove] == true, "Account to be removed from admin list is not already an admin");

        // Set the address mapping to false to indicate it is NOT an administrator account.  
        administrators[adminToRemove] = false;

        // Emit the event for any watchers.
        emit ADMINREMOVED439(adminToRemove, msg.sender);
    }
}

                                                                                                                                                                                                                      
contract Whitelistable is Administratable {
                                                                                                                                                                                                                            
    function ADDTOWHITELIST838(address[] memory addressToAdd, uint8 whitelist) public ONLYADMINISTRATOR315 {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < addressToAdd.length; i++) {
        // Verify the whitelist is valid
        require(whitelist != no_whitelist49, "Invalid whitelist ID supplied");

        // Save off the previous whitelist
        uint8 previousWhitelist = addressWhitelists[addressToAdd[i]];

        // Set the address's whitelist ID
        addressWhitelists[addressToAdd[i]] = whitelist;        

        // If the previous whitelist existed then we want to indicate it has been removed
        if(previousWhitelist != no_whitelist49) {
            // Emit the event for tracking
            emit ADDRESSREMOVEDFROMWHITELIST864(addressToAdd[i], previousWhitelist, msg.sender);
        }

        // Emit the event for new whitelist
        emit ADDRESSADDEDTOWHITELIST267(addressToAdd[i], whitelist, msg.sender);
        }
    }

                                                                                                                
    function REMOVEFROMWHITELIST447(address[] memory addressToRemove) public ONLYADMINISTRATOR315 {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < addressToRemove.length; i++) {
        // Save off the previous whitelist
        uint8 previousWhitelist = addressWhitelists[addressToRemove[i]];

        // Zero out the previous whitelist
        addressWhitelists[addressToRemove[i]] = no_whitelist49;

        // Emit the event for tracking
        emit ADDRESSREMOVEDFROMWHITELIST864(addressToRemove[i], previousWhitelist, msg.sender);
        }
    }
        
    // Zero is reserved for indicating it is not on a whitelist
    uint8 constant no_whitelist49 = 0;	//inject NONSTANDARD NAMING

    // The mapping to keep track of which whitelist any address belongs to.
    // 0 is reserved for no whitelist and is the default for all addresses.
    mapping (address => uint8) public addressWhitelists;

    // The mapping to keep track of each whitelist's outbound whitelist flags.
    // Boolean flag indicates whether outbound transfers are enabled.
    mapping(uint8 => mapping (uint8 => bool)) public outboundWhitelistsEnabled;

    // Events to allow tracking add/remove.
    event ADDRESSADDEDTOWHITELIST267(address indexed addedAddress, uint8 indexed whitelist, address indexed addedBy);	//inject NONSTANDARD NAMING
    event ADDRESSREMOVEDFROMWHITELIST864(address indexed removedAddress, uint8 indexed whitelist, address indexed removedBy);	//inject NONSTANDARD NAMING
    event OUTBOUNDWHITELISTUPDATED10(address indexed updatedBy, uint8 indexed sourceWhitelist, uint8 indexed destinationWhitelist, bool from, bool to);	//inject NONSTANDARD NAMING

                                                                                                                                                                             
    function UPDATEOUTBOUNDWHITELISTENABLED18(uint8 sourceWhitelist, uint8 destinationWhitelist, bool newEnabledValue) public ONLYADMINISTRATOR315 {	//inject NONSTANDARD NAMING
        // Get the old enabled flag
        bool oldEnabledValue = outboundWhitelistsEnabled[sourceWhitelist][destinationWhitelist];

        // Update to the new value
        outboundWhitelistsEnabled[sourceWhitelist][destinationWhitelist] = newEnabledValue;

        // Emit event for tracking
        emit OUTBOUNDWHITELISTUPDATED10(msg.sender, sourceWhitelist, destinationWhitelist, oldEnabledValue, newEnabledValue);
    }

                                                                                                                                                                            
    function CHECKWHITELISTALLOWED965(address sender, address receiver) public view returns (bool) {	//inject NONSTANDARD NAMING
        // First get each address whitelist
        uint8 senderWhiteList = addressWhitelists[sender];
        uint8 receiverWhiteList = addressWhitelists[receiver];

        // If either address is not on a whitelist then the check should fail
        if(senderWhiteList == no_whitelist49 || receiverWhiteList == no_whitelist49){
            return false;
        }

        // Determine if the sending whitelist is allowed to send to the destination whitelist        
        return outboundWhitelistsEnabled[senderWhiteList][receiverWhiteList];
    }
}

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY824() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF582(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER700(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE947(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE439(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM729(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER675(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL843(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY824() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF582(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER700(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER404(_MSGSENDER930(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE947(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE439(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE736(_MSGSENDER930(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM729(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER404(sender, recipient, amount);
        _APPROVE736(sender, _MSGSENDER930(), _allowances[sender][_MSGSENDER930()].SUB92(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE749(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE736(_MSGSENDER930(), spender, _allowances[_MSGSENDER930()][spender].ADD107(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE791(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE736(_MSGSENDER930(), spender, _allowances[_MSGSENDER930()][spender].SUB92(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER404(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB92(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD107(amount);
        emit TRANSFER675(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT993(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD107(amount);
        _balances[account] = _balances[account].ADD107(amount);
        emit TRANSFER675(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN882(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB92(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB92(amount);
        emit TRANSFER675(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE736(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL843(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM974(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN882(account, amount);
        _APPROVE736(account, _MSGSENDER930(), _allowances[account][_MSGSENDER930()].SUB92(amount, "ERC20: burn amount exceeds allowance"));
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

                                                          
    function NAME953() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL170() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DECIMALS916() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

                                                                                                                                                                                                                                     
contract ERC20Mintable is MinterRole, ERC20 {
                                                                                                                                 
    function MINT718(address account, uint256 amount) public ONLYMINTER383 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT993(account, amount);
        return true;
    }
}

contract ERC1404 is IERC20 {
                                                                                                      
                                   
                                   
                                                       
                                                                          
                                                                  
    function DETECTTRANSFERRESTRICTION896 (address from, address to, uint256 value) public view returns (uint8);	//inject NONSTANDARD NAMING

                                                                             
                                                                  
                                                        
                                                                            
    function MESSAGEFORTRANSFERRESTRICTION649 (uint8 restrictionCode) public view returns (string memory);	//inject NONSTANDARD NAMING
}

interface IFundsDistributionToken {
	                                                                                                                                                                                                                                       
	function WITHDRAWABLEFUNDSOF113(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING

	                                                                                    
	function WITHDRAWFUNDS219() external;	//inject NONSTANDARD NAMING

	                                                                                                                                                                                                         
	event FUNDSDISTRIBUTED977(address indexed by, uint256 fundsDistributed);	//inject NONSTANDARD NAMING

	                                                                                                                                                                                                               
	event FUNDSWITHDRAWN832(address indexed by, uint256 fundsWithdrawn);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
contract FundsDistributionToken is ERC20Detailed, ERC20Mintable, IFundsDistributionToken {
	using SafeMath for uint256;
	using SafeMathUint for uint256;
	using SafeMathInt for int256;

	// optimize, see https://github.com/ethereum/EIPs/issues/1726#issuecomment-472352728
	uint256 constant internal pointsmultiplier821 = 2**128;	//inject NONSTANDARD NAMING
	uint256 internal pointsPerShare;

	mapping(address => int256) internal pointsCorrection;
	mapping(address => uint256) internal withdrawnFunds;

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
	function _DISTRIBUTEFUNDS477(uint256 value) internal {	//inject NONSTANDARD NAMING
		require(TOTALSUPPLY824() > 0, "FundsDistributionToken._distributeFunds: SUPPLY_IS_ZERO");

		if (value > 0) {
			pointsPerShare = pointsPerShare.ADD107(
				value.MUL934(pointsmultiplier821) / TOTALSUPPLY824()
			);
			emit FUNDSDISTRIBUTED977(msg.sender, value);
		}
	}

	                                                                                                                                                                        
	function _PREPAREWITHDRAW896() internal returns (uint256) {	//inject NONSTANDARD NAMING
		uint256 _withdrawableDividend = WITHDRAWABLEFUNDSOF113(msg.sender);

		withdrawnFunds[msg.sender] = withdrawnFunds[msg.sender].ADD107(_withdrawableDividend);

		emit FUNDSWITHDRAWN832(msg.sender, _withdrawableDividend);

		return _withdrawableDividend;
	}

	                                                                                                                                                                                                                       
	function WITHDRAWABLEFUNDSOF113(address _owner) public view returns(uint256) {	//inject NONSTANDARD NAMING
		return ACCUMULATIVEFUNDSOF490(_owner).SUB92(withdrawnFunds[_owner]);
	}

	                                                                                                                                                                                                                        
	function WITHDRAWNFUNDSOF970(address _owner) public view returns(uint256) {	//inject NONSTANDARD NAMING
		return withdrawnFunds[_owner];
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                              
	function ACCUMULATIVEFUNDSOF490(address _owner) public view returns(uint256) {	//inject NONSTANDARD NAMING
		return pointsPerShare.MUL934(BALANCEOF582(_owner)).TOINT256SAFE115()
			.ADD107(pointsCorrection[_owner]).TOUINT256SAFE964() / pointsmultiplier821;
	}

	                                                                                                                                                                                                                                                                                 
	function _TRANSFER404(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
		super._TRANSFER404(from, to, value);

		int256 _magCorrection = pointsPerShare.MUL934(value).TOINT256SAFE115();
		pointsCorrection[from] = pointsCorrection[from].ADD107(_magCorrection);
		pointsCorrection[to] = pointsCorrection[to].SUB92(_magCorrection);
	}

	                                                                                                                                                                                                                                                
	function _MINT993(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
		super._MINT993(account, value);

		pointsCorrection[account] = pointsCorrection[account]
			.SUB92( (pointsPerShare.MUL934(value)).TOINT256SAFE115() );
	}

	                                                                                                                                                                                                                                                          
	function _BURN882(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
		super._BURN882(account, value);

		pointsCorrection[account] = pointsCorrection[account]
			.ADD107( (pointsPerShare.MUL934(value)).TOINT256SAFE115() );
	}
}

contract SecurityToken is Restrictable, Whitelistable, ERC1404, FundsDistributionToken {
    // presented by OpenEsquire || lexDAO ~ Hybrid ERC-1404_2222 ~ Use at own risk!
	using SafeMathUint for uint256;
	using SafeMathInt for int256;
	
	// ERC1404 Error codes and messages
    uint8 public constant success_code77 = 0;	//inject NONSTANDARD NAMING
    uint8 public constant failure_non_whitelist951 = 1;	//inject NONSTANDARD NAMING
    string public constant success_message585 = "SUCCESS";	//inject NONSTANDARD NAMING
    string public constant failure_non_whitelist_message439 = "The transfer was restricted due to whitelist configuration.";	//inject NONSTANDARD NAMING
    string public constant unknown_error814 = "Unknown Error Code";	//inject NONSTANDARD NAMING

	// token in which the funds can be sent to the FundsDistributionToken
	IERC20 public fundsToken;

	// balance of fundsToken that the FundsDistributionToken currently holds
	uint256 public fundsTokenBalance;

	modifier ONLYFUNDSTOKEN212 () {	//inject NONSTANDARD NAMING
		require(msg.sender == address(fundsToken), "SecurityToken: UNAUTHORIZED_SENDER");
		_;
	}

	constructor(
		string memory name, 
		string memory symbol,
		uint8 decimals,
		IERC20 _fundsToken,
        address[] memory ownership,
        uint256[] memory issuance
	) 
		public 
		ERC20Detailed(name, symbol, decimals)
	{
		require(address(_fundsToken) != address(0), "SecurityToken: INVALID_FUNDS_TOKEN_ADDRESS");

        for (uint256 i = 0; i < ownership.length; i++) {
		    _MINT993(ownership[i], issuance[i]);
        }

		fundsToken = _fundsToken;
		
        _ADDMINTER932(ownership[0]); 
        _TRANSFEROWNERSHIP314(ownership[0]);
        administrators[ownership[0]] = true;
	}

                                                                                                                                                                          
    function DETECTTRANSFERRESTRICTION896 (address from, address to, uint256)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint8)
    {               
        // If the restrictions have been disabled by the owner, then just return success
        // Logic defined in Restrictable parent class
        if(!ISRESTRICTIONENABLED60()) {
            return success_code77;
        }

        // If the contract owner is transferring, then ignore restrictions        
        if(from == OWNER256()) {
            return success_code77;
        }

        // Restrictions are enabled, so verify the whitelist config allows the transfer.
        // Logic defined in Whitelistable parent class
        if(!CHECKWHITELISTALLOWED965(from, to)) {
            return failure_non_whitelist951;
        }

        // If no restrictions were triggered return success
        return success_code77;
    }
    
                                                                                                                                                                                                                              
    function MESSAGEFORTRANSFERRESTRICTION649 (uint8 restrictionCode)	//inject NONSTANDARD NAMING
        public
        view
        returns (string memory)
    {
        if (restrictionCode == success_code77) {
            return success_message585;
        }

        if (restrictionCode == failure_non_whitelist951) {
            return failure_non_whitelist_message439;
        }

        // An unknown error code was passed in.
        return unknown_error814;
    }

                                                                          
    modifier NOTRESTRICTED3 (address from, address to, uint256 value) {        	//inject NONSTANDARD NAMING
        uint8 restrictionCode = DETECTTRANSFERRESTRICTION896(from, to, value);
        require(restrictionCode == success_code77, MESSAGEFORTRANSFERRESTRICTION649(restrictionCode));
        _;
    }

                                                                                               
    function TRANSFER700 (address to, uint256 value)	//inject NONSTANDARD NAMING
        public
        NOTRESTRICTED3(msg.sender, to, value)
        returns (bool success)
    {
        success = super.TRANSFER700(to, value);
    }

                                                                                                   
    function TRANSFERFROM729 (address from, address to, uint256 value)	//inject NONSTANDARD NAMING
        public
        NOTRESTRICTED3(from, to, value)
        returns (bool success)
    {
        success = super.TRANSFERFROM729(from, to, value);
    }

	                                                                     
	function WITHDRAWFUNDS219() 	//inject NONSTANDARD NAMING
		external 
	{
		uint256 withdrawableFunds = _PREPAREWITHDRAW896();

		require(fundsToken.TRANSFER700(msg.sender, withdrawableFunds), "SecurityToken: TRANSFER_FAILED");

		_UPDATEFUNDSTOKENBALANCE125();
	}

	                                                                                                                                                                                                                               
	function _UPDATEFUNDSTOKENBALANCE125() internal returns (int256) {	//inject NONSTANDARD NAMING
		uint256 prevFundsTokenBalance = fundsTokenBalance;

		fundsTokenBalance = fundsToken.BALANCEOF582(address(this));

		return int256(fundsTokenBalance).SUB92(int256(prevFundsTokenBalance));
	}

	                                                                                                                                                                                                                                                                                                                                             
	function UPDATEFUNDSRECEIVED785() external {	//inject NONSTANDARD NAMING
		int256 newFunds = _UPDATEFUNDSTOKENBALANCE125();

		if (newFunds > 0) {
			_DISTRIBUTEFUNDS477(newFunds.TOUINT256SAFE964());
		}
	}
}

contract SecurityTokenFactory {
    // presented by OpenEsquire || lexDAO ~ Hybrid ERC-1404_2222 Factory ~ Use at own risk!
    
    // Factory stamp message
    string public stamp;
    
    SecurityToken private ST;
    
    address[] public tokens;
    
    event DEPLOYED446(address indexed ST, address indexed owner);	//inject NONSTANDARD NAMING
    
    constructor(string memory _stamp) public 
	{
        stamp = _stamp;
	}
    
    function NEWSECURITYTOKEN653(	//inject NONSTANDARD NAMING
        string memory name, 
		string memory symbol,
		uint8 decimals,
		IERC20 _fundsToken,
		address[] memory ownership,
		uint256[] memory issuance) public {
       
        ST = new SecurityToken(
            name, 
            symbol,
            decimals,
            _fundsToken,
            ownership,
            issuance);
        
        tokens.push(address(ST));
        
        emit DEPLOYED446(address(ST), ownership[0]);
    }
    
    function GETTOKENCOUNT533() public view returns (uint256 tokenCount) {	//inject NONSTANDARD NAMING
        return tokens.length;
    }
}