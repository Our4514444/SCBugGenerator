                                                                 

pragma solidity ^0.5.2;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD615(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB782(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB782(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB782(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL584(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV515(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV515(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV515(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD861(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD861(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD861(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER786() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA512() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED275(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                     
    function OWNER604() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER81() {	//inject NONSTANDARD NAMING
        require(ISOWNER533(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER533() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER786() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP472() public ONLYOWNER81 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED275(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP8(address newOwner) public ONLYOWNER81 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP854(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP854(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED275(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                                                                                                                                                                      
contract Administratable is Ownable {

    // The mapping to track administrator accounts - true is reserved for admin addresses.
    mapping (address => bool) public administrators;

    // Events to allow tracking add/remove.
    event ADMINADDED477(address indexed addedAdmin, address indexed addedBy);	//inject NONSTANDARD NAMING
    event ADMINREMOVED950(address indexed removedAdmin, address indexed removedBy);	//inject NONSTANDARD NAMING

                                                                            
    modifier ONLYADMINISTRATOR965() {	//inject NONSTANDARD NAMING
        require(ISADMINISTRATOR764(msg.sender), "Calling account is not an administrator.");
        _;
    }

                                                                                  
    function ISADMINISTRATOR764(address addressToTest) public view returns (bool) {	//inject NONSTANDARD NAMING
        return administrators[addressToTest];
    }

                                                                                                         
    function ADDADMIN598(address adminToAdd) public ONLYOWNER81 {	//inject NONSTANDARD NAMING
        // Verify the account is not already an admin
        require(administrators[adminToAdd] == false, "Account to be added to admin list is already an admin");

        // Set the address mapping to true to indicate it is an administrator account.
        administrators[adminToAdd] = true;

        // Emit the event for any watchers.
        emit ADMINADDED477(adminToAdd, msg.sender);
    }

                                                                                                              
    function REMOVEADMIN792(address adminToRemove) public ONLYOWNER81 {	//inject NONSTANDARD NAMING
        // Verify the account is an admin
        require(administrators[adminToRemove] == true, "Account to be removed from admin list is not already an admin");

        // Set the address mapping to false to indicate it is NOT an administrator account.  
        administrators[adminToRemove] = false;

        // Emit the event for any watchers.
        emit ADMINREMOVED950(adminToRemove, msg.sender);
    }
}

                                                                                                                                                                                                                      
contract Whitelistable is Administratable {
    // Zero is reserved for indicating it is not on a whitelist
    uint8 constant no_whitelist536 = 0;	//inject NONSTANDARD NAMING

    // The mapping to keep track of which whitelist any address belongs to.
    // 0 is reserved for no whitelist and is the default for all addresses.
    mapping (address => uint8) public addressWhitelists;

    // The mapping to keep track of each whitelist's outbound whitelist flags.
    // Boolean flag indicates whether outbound transfers are enabled.
    mapping(uint8 => mapping (uint8 => bool)) public outboundWhitelistsEnabled;

    // Events to allow tracking add/remove.
    event ADDRESSADDEDTOWHITELIST763(address indexed addedAddress, uint8 indexed whitelist, address indexed addedBy);	//inject NONSTANDARD NAMING
    event ADDRESSREMOVEDFROMWHITELIST317(address indexed removedAddress, uint8 indexed whitelist, address indexed removedBy);	//inject NONSTANDARD NAMING
    event OUTBOUNDWHITELISTUPDATED89(address indexed updatedBy, uint8 indexed sourceWhitelist, uint8 indexed destinationWhitelist, bool from, bool to);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                             
    function ADDTOWHITELIST362(address addressToAdd, uint8 whitelist) public ONLYADMINISTRATOR965 {	//inject NONSTANDARD NAMING
        // Verify the whitelist is valid
        require(whitelist != no_whitelist536, "Invalid whitelist ID supplied");

        // Save off the previous white list
        uint8 previousWhitelist = addressWhitelists[addressToAdd];

        // Set the address's white list ID
        addressWhitelists[addressToAdd] = whitelist;        

        // If the previous whitelist existed then we want to indicate it has been removed
        if(previousWhitelist != no_whitelist536) {
            // Emit the event for tracking
            emit ADDRESSREMOVEDFROMWHITELIST317(addressToAdd, previousWhitelist, msg.sender);
        }

        // Emit the event for new whitelist
        emit ADDRESSADDEDTOWHITELIST763(addressToAdd, whitelist, msg.sender);
    }

                                                                                                                 
    function REMOVEFROMWHITELIST483(address addressToRemove) public ONLYADMINISTRATOR965 {	//inject NONSTANDARD NAMING
        // Save off the previous white list
        uint8 previousWhitelist = addressWhitelists[addressToRemove];

        // Zero out the previous white list
        addressWhitelists[addressToRemove] = no_whitelist536;

        // Emit the event for tracking
        emit ADDRESSREMOVEDFROMWHITELIST317(addressToRemove, previousWhitelist, msg.sender);
    }

                                                                                                                                                                             
    function UPDATEOUTBOUNDWHITELISTENABLED194(uint8 sourceWhitelist, uint8 destinationWhitelist, bool newEnabledValue) public ONLYADMINISTRATOR965 {	//inject NONSTANDARD NAMING
        // Get the old enabled flag
        bool oldEnabledValue = outboundWhitelistsEnabled[sourceWhitelist][destinationWhitelist];

        // Update to the new value
        outboundWhitelistsEnabled[sourceWhitelist][destinationWhitelist] = newEnabledValue;

        // Emit event for tracking
        emit OUTBOUNDWHITELISTUPDATED89(msg.sender, sourceWhitelist, destinationWhitelist, oldEnabledValue, newEnabledValue);
    }

                                                                                                                                                                             
    function CHECKWHITELISTALLOWED241(address sender, address receiver) public view returns (bool) {	//inject NONSTANDARD NAMING
        // First get each address white list
        uint8 senderWhiteList = addressWhitelists[sender];
        uint8 receiverWhiteList = addressWhitelists[receiver];

        // If either address is not on a white list then the check should fail
        if(senderWhiteList == no_whitelist536 || receiverWhiteList == no_whitelist536){
            return false;
        }

        // Determine if the sending whitelist is allowed to send to the destination whitelist        
        return outboundWhitelistsEnabled[senderWhiteList][receiverWhiteList];
    }
}

                                                                                                                                      
contract Restrictable is Ownable {
    // State variable to track whether restrictions are enabled.  Defaults to true.
    bool private _restrictionsEnabled = true;

    // Event emitted when flag is disabled
    event RESTRICTIONSDISABLED750(address indexed owner);	//inject NONSTANDARD NAMING

                                                                          
    function ISRESTRICTIONENABLED456() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _restrictionsEnabled;
    }

                                                                                                                                                                                 
    function DISABLERESTRICTIONS732() public ONLYOWNER81 {	//inject NONSTANDARD NAMING
        require(_restrictionsEnabled, "Restrictions are already disabled.");
        
        // Set the flag
        _restrictionsEnabled = false;

        // Trigger the event
        emit RESTRICTIONSDISABLED750(msg.sender);
    }
}

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY868() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF751(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER843(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE949(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE758(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM107(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER624(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL132(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY868() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF751(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER843(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER722(_MSGSENDER786(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE949(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE758(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE597(_MSGSENDER786(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM107(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER722(sender, recipient, amount);
        _APPROVE597(sender, _MSGSENDER786(), _allowances[sender][_MSGSENDER786()].SUB782(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE784(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE597(_MSGSENDER786(), spender, _allowances[_MSGSENDER786()][spender].ADD615(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE101(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE597(_MSGSENDER786(), spender, _allowances[_MSGSENDER786()][spender].SUB782(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER722(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB782(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD615(amount);
        emit TRANSFER624(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT430(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD615(amount);
        _balances[account] = _balances[account].ADD615(amount);
        emit TRANSFER624(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN145(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB782(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB782(amount);
        emit TRANSFER624(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE597(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL132(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM7(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN145(account, amount);
        _APPROVE597(account, _MSGSENDER786(), _allowances[account][_MSGSENDER786()].SUB782(amount, "ERC20: burn amount exceeds allowance"));
    }
}

contract ERC1404 is IERC20 {
                                                                                                      
                                   
                                   
                                                       
                                                                          
                                                                  
    function DETECTTRANSFERRESTRICTION120 (address from, address to, uint256 value) public view returns (uint8);	//inject NONSTANDARD NAMING

                                                                             
                                                                  
                                                        
                                                                            
    function MESSAGEFORTRANSFERRESTRICTION861 (uint8 restrictionCode) public view returns (string memory);	//inject NONSTANDARD NAMING
}

                                                                                              
library SafeMathUint {
  function TOINT256SAFE883(uint256 a) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    int256 b = int256(a);
    require(b >= 0);
    return b;
  }
}

                                                                                                                                                                                                                                                                                             
library SafeMathInt {
  function MUL584(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    // Prevent overflow when multiplying INT256_MIN with -1
    // https://github.com/RequestNetwork/requestNetwork/issues/43
    require(!(a == - 2**255 && b == -1) && !(b == - 2**255 && a == -1));

    int256 c = a * b;
    require((b == 0) || (c / b == a));
    return c;
  }

  function DIV515(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    // Prevent overflow when dividing INT256_MIN by -1
    // https://github.com/RequestNetwork/requestNetwork/issues/43
    require(!(a == - 2**255 && b == -1) && (b > 0));

    return a / b;
  }

  function SUB782(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    require((b >= 0 && a - b <= a) || (b < 0 && a - b > a));

    return a - b;
  }

  function ADD615(int256 a, int256 b) internal pure returns (int256) {	//inject NONSTANDARD NAMING
    int256 c = a + b;
    require((b >= 0 && c >= a) || (b < 0 && c < a));
    return c;
  }

  function TOUINT256SAFE797(int256 a) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(a >= 0);
    return uint256(a);
  }
}

interface IFundsDistributionToken {

	                                                                                                                                                                                                                                       
	function WITHDRAWABLEFUNDSOF345(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING

	                                                                                    
	function WITHDRAWFUNDS885() external;	//inject NONSTANDARD NAMING

	                                                                                                                                                                                                         
	event FUNDSDISTRIBUTED945(address indexed by, uint256 fundsDistributed);	//inject NONSTANDARD NAMING

	                                                                                                                                                                                                               
	event FUNDSWITHDRAWN900(address indexed by, uint256 fundsWithdrawn);	//inject NONSTANDARD NAMING
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

                                                          
    function NAME134() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                          
    function SYMBOL622() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DECIMALS479() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD615(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS384(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE603(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS384(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS384(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED348(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED645(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    modifier ONLYMINTER363() {	//inject NONSTANDARD NAMING
        require(ISMINTER551(msg.sender), "MinterRole: caller does not have the Minter role");
        _;
    }

    function ISMINTER551(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS384(account);
    }

    function ADDMINTER390(address account) public ONLYMINTER363 {	//inject NONSTANDARD NAMING
        _ADDMINTER50(account);
    }

    function RENOUNCEMINTER714() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER236(msg.sender);
    }

    function _ADDMINTER50(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD615(account);
        emit MINTERADDED348(account);
    }

    function _REMOVEMINTER236(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE603(account);
        emit MINTERREMOVED645(account);
    }
}

                                                                                                                                                                                                                                     
contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                 
    function MINT685(address account, uint256 amount) public ONLYMINTER363 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT430(account, amount);
        return true;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
contract FundsDistributionToken is IFundsDistributionToken, ERC20Detailed, ERC20Mintable {

	using SafeMath for uint256;
	using SafeMathUint for uint256;
	using SafeMathInt for int256;

	// optimize, see https://github.com/ethereum/EIPs/issues/1726#issuecomment-472352728
	uint256 constant internal pointsmultiplier780 = 2**128;	//inject NONSTANDARD NAMING
	uint256 internal pointsPerShare;

	mapping(address => int256) internal pointsCorrection;
	mapping(address => uint256) internal withdrawnFunds;


	constructor (
		string memory name, 
		string memory symbol
	) 
		public 
		ERC20Detailed(name, symbol, 18) 
	{}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
	function _DISTRIBUTEFUNDS105(uint256 value) internal {	//inject NONSTANDARD NAMING
		require(TOTALSUPPLY868() > 0, "FundsDistributionToken._distributeFunds: SUPPLY_IS_ZERO");

		if (value > 0) {
			pointsPerShare = pointsPerShare.ADD615(
				value.MUL584(pointsmultiplier780) / TOTALSUPPLY868()
			);
			emit FUNDSDISTRIBUTED945(msg.sender, value);
		}
	}

	                                                                                                                                                                        
	function _PREPAREWITHDRAW48() internal returns (uint256) {	//inject NONSTANDARD NAMING
		uint256 _withdrawableDividend = WITHDRAWABLEFUNDSOF345(msg.sender);

		withdrawnFunds[msg.sender] = withdrawnFunds[msg.sender].ADD615(_withdrawableDividend);

		emit FUNDSWITHDRAWN900(msg.sender, _withdrawableDividend);

		return _withdrawableDividend;
	}

	                                                                                                                                                                                                                       
	function WITHDRAWABLEFUNDSOF345(address _owner) public view returns(uint256) {	//inject NONSTANDARD NAMING
		return ACCUMULATIVEFUNDSOF616(_owner).SUB782(withdrawnFunds[_owner]);
	}

	                                                                                                                                                                                                                        
	function WITHDRAWNFUNDSOF36(address _owner) public view returns(uint256) {	//inject NONSTANDARD NAMING
		return withdrawnFunds[_owner];
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                              
	function ACCUMULATIVEFUNDSOF616(address _owner) public view returns(uint256) {	//inject NONSTANDARD NAMING
		return pointsPerShare.MUL584(BALANCEOF751(_owner)).TOINT256SAFE883()
			.ADD615(pointsCorrection[_owner]).TOUINT256SAFE797() / pointsmultiplier780;
	}

	                                                                                                                                                                                                                                                                                 
	function _TRANSFER722(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
		super._TRANSFER722(from, to, value);

		int256 _magCorrection = pointsPerShare.MUL584(value).TOINT256SAFE883();
		pointsCorrection[from] = pointsCorrection[from].ADD615(_magCorrection);
		pointsCorrection[to] = pointsCorrection[to].SUB782(_magCorrection);
	}

	                                                                                                                                                                                                                                                
	function _MINT430(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
		super._MINT430(account, value);

		pointsCorrection[account] = pointsCorrection[account]
			.SUB782( (pointsPerShare.MUL584(value)).TOINT256SAFE883() );
	}

	                                                                                                                                                                                                                                                          
	function _BURN145(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
		super._BURN145(account, value);

		pointsCorrection[account] = pointsCorrection[account]
			.ADD615( (pointsPerShare.MUL584(value)).TOINT256SAFE883() );
	}
}

contract SimpleRestrictedFDT is FundsDistributionToken, ERC1404, Whitelistable, Restrictable {
    // presented by OpenEsquire || lexDAO

	using SafeMathUint for uint256;
	using SafeMathInt for int256;
	
	 // ERC1404 Error codes and messages
    uint8 public constant success_code243 = 0;	//inject NONSTANDARD NAMING
    uint8 public constant failure_non_whitelist210 = 1;	//inject NONSTANDARD NAMING
    string public constant success_message872 = "SUCCESS";	//inject NONSTANDARD NAMING
    string public constant failure_non_whitelist_message970 = "The transfer was restricted due to white list configuration.";	//inject NONSTANDARD NAMING
    string public constant unknown_error293 = "Unknown Error Code";	//inject NONSTANDARD NAMING

	// token in which the funds can be sent to the FundsDistributionToken
	IERC20 public fundsToken;

	// balance of fundsToken that the FundsDistributionToken currently holds
	uint256 public fundsTokenBalance;

	modifier ONLYFUNDSTOKEN581 () {	//inject NONSTANDARD NAMING
		require(msg.sender == address(fundsToken), "FDT_ERC20Extension.onlyFundsToken: UNAUTHORIZED_SENDER");
		_;
	}

	constructor(
		string memory name, 
		string memory symbol,
		IERC20 _fundsToken,
        address[] memory initialOwner,
        uint256[] memory initialAmount
	) 
		public 
		FundsDistributionToken(name, symbol)
	{
		require(address(_fundsToken) != address(0), "SimpleRestrictedFDT: INVALID_FUNDS_TOKEN_ADDRESS");

        for (uint256 i = 0; i < initialOwner.length; i++) {
		    _MINT430(initialOwner[i], initialAmount[i]);
        }

		fundsToken = _fundsToken;
        _ADDMINTER50(initialOwner[0]);
        _TRANSFEROWNERSHIP854(initialOwner[0]);
	}

                                                                                                                                                                          
    function DETECTTRANSFERRESTRICTION120 (address from, address to, uint256)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint8)
    {               
        // If the restrictions have been disabled by the owner, then just return success
        // Logic defined in Restrictable parent class
        if(!ISRESTRICTIONENABLED456()) {
            return success_code243;
        }

        // If the contract owner is transferring, then ignore reistrictions        
        if(from == OWNER604()) {
            return success_code243;
        }

        // Restrictions are enabled, so verify the whitelist config allows the transfer.
        // Logic defined in Whitelistable parent class
        if(!CHECKWHITELISTALLOWED241(from, to)) {
            return failure_non_whitelist210;
        }

        // If no restrictions were triggered return success
        return success_code243;
    }
    
                                                                                                                                                                                                                              
    function MESSAGEFORTRANSFERRESTRICTION861 (uint8 restrictionCode)	//inject NONSTANDARD NAMING
        public
        view
        returns (string memory)
    {
        if (restrictionCode == success_code243) {
            return success_message872;
        }

        if (restrictionCode == failure_non_whitelist210) {
            return failure_non_whitelist_message970;
        }

        // An unknown error code was passed in.
        return unknown_error293;
    }

                                                                          
    modifier NOTRESTRICTED202 (address from, address to, uint256 value) {        	//inject NONSTANDARD NAMING
        uint8 restrictionCode = DETECTTRANSFERRESTRICTION120(from, to, value);
        require(restrictionCode == success_code243, MESSAGEFORTRANSFERRESTRICTION861(restrictionCode));
        _;
    }

                                                                                               
    function TRANSFER843 (address to, uint256 value)	//inject NONSTANDARD NAMING
        public
        NOTRESTRICTED202(msg.sender, to, value)
        returns (bool success)
    {
        success = super.TRANSFER843(to, value);
    }

                                                                                                   
    function TRANSFERFROM107 (address from, address to, uint256 value)	//inject NONSTANDARD NAMING
        public
        NOTRESTRICTED202(from, to, value)
        returns (bool success)
    {
        success = super.TRANSFERFROM107(from, to, value);
    }

	                                                                     
	function WITHDRAWFUNDS885() 	//inject NONSTANDARD NAMING
		external 
	{
		uint256 withdrawableFunds = _PREPAREWITHDRAW48();

		require(fundsToken.TRANSFER843(msg.sender, withdrawableFunds), "FDT_ERC20Extension.withdrawFunds: TRANSFER_FAILED");

		_UPDATEFUNDSTOKENBALANCE786();
	}

	                                                                                                                                                                                                                               
	function _UPDATEFUNDSTOKENBALANCE786() internal returns (int256) {	//inject NONSTANDARD NAMING
		uint256 prevFundsTokenBalance = fundsTokenBalance;

		fundsTokenBalance = fundsToken.BALANCEOF751(address(this));

		return int256(fundsTokenBalance).SUB782(int256(prevFundsTokenBalance));
	}

	                                                                                                                                                                                                                                                                                                                                             
	function UPDATEFUNDSRECEIVED93() external {	//inject NONSTANDARD NAMING
		int256 newFunds = _UPDATEFUNDSTOKENBALANCE786();

		if (newFunds > 0) {
			_DISTRIBUTEFUNDS105(newFunds.TOUINT256SAFE797());
		}
	}
}

contract SimpleRestrictedFDTFactory {
    // presented by OpenEsquire || lexDAO
    
    // Factory settings
    string public stamp;
    bool public gated;
    address public deployer;
    
    SimpleRestrictedFDT private SRFDT;
    
    address[] public tokens;
    
    event DEPLOYED502(address indexed SRFDT, address indexed owner);	//inject NONSTANDARD NAMING
    
    constructor(string memory _stamp, bool _gated, address _deployer) public 
	{
        stamp = _stamp;
        gated = _gated;
        deployer = _deployer;
	}
    
    function NEWSRFDT412(	//inject NONSTANDARD NAMING
        string memory name, 
		string memory symbol,
		IERC20 _fundsToken,
		address[] memory initialOwner,
		uint256[] memory initialAmount) public {
       
        if (gated == true) {
            require(msg.sender == deployer);
        }
       
        SRFDT = new SimpleRestrictedFDT(
            name, 
            symbol, 
            _fundsToken,
            initialOwner,
            initialAmount);
        
        tokens.push(address(SRFDT));
        
        emit DEPLOYED502(address(SRFDT), initialOwner[0]);

    }
    
    function GETTOKENCOUNT60() public view returns (uint256 tokenCount) {	//inject NONSTANDARD NAMING
        return tokens.length;
    }
}