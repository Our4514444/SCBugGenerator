                                                                 

// File: contracts/interfaces/IPublicLock.sol

pragma solidity 0.5.17;

                                                                                      


contract IPublicLock
{

// See indentationissue description here:
// https://github.com/duaraghav8/Ethlint/issues/268
// solium-disable indentation

               

  function INITIALIZE243(	//inject NONSTANDARD NAMING
    address _lockCreator,
    uint _expirationDuration,
    address _tokenAddress,
    uint _keyPrice,
    uint _maxNumberOfKeys,
    string calldata _lockName
  ) external;

                                                                                                                                                                          
  function() external payable;

                                         
  function INITIALIZE243() external;	//inject NONSTANDARD NAMING

                                                                                                                                
  function PUBLICLOCKVERSION602() public pure returns (uint);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                         
  function GETBALANCE339(	//inject NONSTANDARD NAMING
    address _tokenAddress,
    address _account
  ) external view
    returns (uint);

                                                                                                                                                                                                                 
  function DISABLELOCK441() external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function WITHDRAW762(	//inject NONSTANDARD NAMING
    address _tokenAddress,
    uint _amount
  ) external;

                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function UPDATEKEYPRICING854( uint _keyPrice, address _tokenAddress ) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                       
  function UPDATEBENEFICIARY529( address _beneficiary ) external;	//inject NONSTANDARD NAMING

                                                                                                           
  function GETHASVALIDKEY803(	//inject NONSTANDARD NAMING
    address _user
  ) external view returns (bool);

                                                                                                                                                               
  function GETTOKENIDFOR386(	//inject NONSTANDARD NAMING
    address _account
  ) external view returns (uint);

                                                                                                                                                                                                                                                                                  
  function GETOWNERSBYPAGE834(	//inject NONSTANDARD NAMING
    uint _page,
    uint _pageSize
  ) external view returns (address[] memory);

                                                                                                                                                                                
  function ISKEYOWNER633(	//inject NONSTANDARD NAMING
    uint _tokenId,
    address _keyOwner
  ) external view returns (bool);

                                                                                                                                                                                                                          
  function KEYEXPIRATIONTIMESTAMPFOR871(	//inject NONSTANDARD NAMING
    address _keyOwner
  ) external view returns (uint timestamp);

                                                                                                                                                     
  function NUMBEROFOWNERS173() external view returns (uint);	//inject NONSTANDARD NAMING

                                                                                                                                                                                          
  function UPDATELOCKNAME966(	//inject NONSTANDARD NAMING
    string calldata _lockName
  ) external;

                                                                                                                                                                                    
  function UPDATELOCKSYMBOL834(	//inject NONSTANDARD NAMING
    string calldata _lockSymbol
  ) external;

                                                                                                
  function SYMBOL83()	//inject NONSTANDARD NAMING
    external view
    returns(string memory);

                                                                                                                                                                                                                           
  function SETBASETOKENURI398(	//inject NONSTANDARD NAMING
    string calldata _baseTokenURI
  ) external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function TOKENURI883(	//inject NONSTANDARD NAMING
    uint256 _tokenId
  ) external view returns(string memory);

                                                                             
  function SETEVENTHOOKS104(	//inject NONSTANDARD NAMING
    address _onKeyPurchaseHook,
    address _onKeyCancelHook
  ) external;

                                                                                                                                                                                                                                                                                                                                                                    
  function GRANTKEYS710(	//inject NONSTANDARD NAMING
    address[] calldata _recipients,
    uint[] calldata _expirationTimestamps,
    address[] calldata _keyManagers
  ) external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function PURCHASE34(	//inject NONSTANDARD NAMING
    uint256 _value,
    address _recipient,
    address _referrer,
    bytes calldata _data
  ) external payable;

                                                                                                                                                                      
  function PURCHASEPRICEFOR465(	//inject NONSTANDARD NAMING
    address _recipient,
    address _referrer,
    bytes calldata _data
  ) external view
    returns (uint);

                                                                                                                                                                                                                              
  function UPDATETRANSFERFEE701(	//inject NONSTANDARD NAMING
    uint _transferFeeBasisPoints
  ) external;

                                                                                                                                                                                                                                                                                                                                                                                                                                
  function GETTRANSFERFEE0(	//inject NONSTANDARD NAMING
    address _keyOwner,
    uint _time
  ) external view returns (uint);

                                                                                                                                                                                                                                                                                                                                                                       
  function EXPIREANDREFUNDFOR4(	//inject NONSTANDARD NAMING
    address _keyOwner,
    uint amount
  ) external;

                                                                                                                                                                                                       
  function CANCELANDREFUND886(uint _tokenId) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                               
  function CANCELANDREFUNDFOR57(	//inject NONSTANDARD NAMING
    address _keyManager,
    uint8 _v,
    bytes32 _r,
    bytes32 _s,
    uint _tokenId
  ) external;

                                                                                                                                                                                           
  function INVALIDATEOFFCHAINAPPROVAL774(	//inject NONSTANDARD NAMING
    uint _nextAvailableNonce
  ) external;

                                                                                                                                                                                                                                                                                       
  function UPDATEREFUNDPENALTY112(	//inject NONSTANDARD NAMING
    uint _freeTrialLength,
    uint _refundPenaltyBasisPoints
  ) external;

                                                                                                                                                                                                                                                                                                                                                  
  function GETCANCELANDREFUNDVALUEFOR476(	//inject NONSTANDARD NAMING
    address _keyOwner
  ) external view returns (uint refund);

  function KEYMANAGERTONONCE174(address ) external view returns (uint256 );	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                       
  function GETCANCELANDREFUNDAPPROVALHASH893(	//inject NONSTANDARD NAMING
    address _keyManager,
    address _txSender
  ) external view returns (bytes32 approvalHash);

  function ADDKEYGRANTER548(address account) external;	//inject NONSTANDARD NAMING

  function ADDLOCKMANAGER4(address account) external;	//inject NONSTANDARD NAMING

  function ISKEYGRANTER295(address account) external view returns (bool);	//inject NONSTANDARD NAMING

  function ISLOCKMANAGER668(address account) external view returns (bool);	//inject NONSTANDARD NAMING

  function ONKEYPURCHASEHOOK497() external view returns(address);	//inject NONSTANDARD NAMING

  function ONKEYCANCELHOOK73() external view returns(address);	//inject NONSTANDARD NAMING

  function REVOKEKEYGRANTER134(address _granter) external;	//inject NONSTANDARD NAMING

  function RENOUNCELOCKMANAGER584() external;	//inject NONSTANDARD NAMING

                                                                        
                                                                 

  function BENEFICIARY721() external view returns (address );	//inject NONSTANDARD NAMING

  function EXPIRATIONDURATION692() external view returns (uint256 );	//inject NONSTANDARD NAMING

  function FREETRIALLENGTH362() external view returns (uint256 );	//inject NONSTANDARD NAMING

  function ISALIVE86() external view returns (bool );	//inject NONSTANDARD NAMING

  function KEYPRICE333() external view returns (uint256 );	//inject NONSTANDARD NAMING

  function MAXNUMBEROFKEYS372() external view returns (uint256 );	//inject NONSTANDARD NAMING

  function OWNERS792(uint256 ) external view returns (address );	//inject NONSTANDARD NAMING

  function REFUNDPENALTYBASISPOINTS310() external view returns (uint256 );	//inject NONSTANDARD NAMING

  function TOKENADDRESS841() external view returns (address );	//inject NONSTANDARD NAMING

  function TRANSFERFEEBASISPOINTS167() external view returns (uint256 );	//inject NONSTANDARD NAMING

  function UNLOCKPROTOCOL989() external view returns (address );	//inject NONSTANDARD NAMING

  function KEYMANAGEROF491(uint) external view returns (address );	//inject NONSTANDARD NAMING

                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function SHAREKEY659(	//inject NONSTANDARD NAMING
    address _to,
    uint _tokenId,
    uint _timeShared
  ) external;

                                                                                                                                                                                                                
  function SETKEYMANAGEROF195(	//inject NONSTANDARD NAMING
    uint _tokenId,
    address _keyManager
  ) external;

                                                                          
  function NAME924() external view returns (string memory _name);	//inject NONSTANDARD NAMING
                                                                        

                     
  function SUPPORTSINTERFACE536(bytes4 interfaceId) external view returns (bool );	//inject NONSTANDARD NAMING
                                                                        

                  
                                                                          
    function BALANCEOF598(address _owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING

                                                                                
    function OWNEROF442(uint256 tokenId) public view returns (address _owner);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                       
    function SAFETRANSFERFROM818(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                              
    function TRANSFERFROM763(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function APPROVE997(address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                               
    function GETAPPROVED850(uint256 _tokenId) public view returns (address operator);	//inject NONSTANDARD NAMING

    function SETAPPROVALFORALL432(address operator, bool _approved) public;	//inject NONSTANDARD NAMING
    function ISAPPROVEDFORALL243(address _owner, address operator) public view returns (bool);	//inject NONSTANDARD NAMING

    function SAFETRANSFERFROM818(address from, address to, uint256 tokenId, bytes memory data) public;	//inject NONSTANDARD NAMING

    function TOTALSUPPLY405() public view returns (uint256);	//inject NONSTANDARD NAMING
    function TOKENOFOWNERBYINDEX873(address _owner, uint256 index) public view returns (uint256 tokenId);	//inject NONSTANDARD NAMING

    function TOKENBYINDEX759(uint256 index) public view returns (uint256);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/upgrades/contracts/Initializable.sol

pragma solidity >=0.4.24 <0.7.0;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract Initializable {

                                                                       
  bool private initialized;

                                                                                         
  bool private initializing;

                                                                                
  modifier INITIALIZER90() {	//inject NONSTANDARD NAMING
    require(initializing || ISCONSTRUCTOR855() || !initialized, "Contract instance has already been initialized");

    bool isTopLevelCall = !initializing;
    if (isTopLevelCall) {
      initializing = true;
      initialized = true;
    }

    _;

    if (isTopLevelCall) {
      initializing = false;
    }
  }

                                                                                 
  function ISCONSTRUCTOR855() private view returns (bool) {	//inject NONSTANDARD NAMING
    // extcodesize checks the size of the code stored in an address, and
    // address returns the current address. Since the code is still not
    // deployed when running a constructor, any checks on its code size will
    // yield zero, making it an effective way to detect if a contract is
    // under construction or not.
    address self = address(this);
    uint256 cs;
    assembly { cs := extcodesize(self) }
    return cs == 0;
  }

  // Reserved storage space to allow for layout changes in the future.
  uint256[50] private ______gap;
}

// File: @openzeppelin/contracts-ethereum-package/contracts/introspection/IERC165.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                       
interface IERC165 {
                                                                                                                                                                                                                                                                                                                                                        
    function SUPPORTSINTERFACE536(bytes4 interfaceId) external view returns (bool);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts-ethereum-package/contracts/introspection/ERC165.sol

pragma solidity ^0.5.0;



                                                                                                                                                                           
contract ERC165 is Initializable, IERC165 {
                                                                                  
    bytes4 private constant _interface_id_erc165868 = 0x01ffc9a7;	//inject NONSTANDARD NAMING

                                                                                      
    mapping(bytes4 => bool) private _supportedInterfaces;

    function INITIALIZE243() public INITIALIZER90 {	//inject NONSTANDARD NAMING
        // Derived contracts need only register support for their own interfaces,
        // we register support for ERC165 itself here
        _REGISTERINTERFACE570(_interface_id_erc165868);
    }

                                                                                                                                               
    function SUPPORTSINTERFACE536(bytes4 interfaceId) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _supportedInterfaces[interfaceId];
    }

                                                                                                                                                                                                                                                                                                                                                                                                   
    function _REGISTERINTERFACE570(bytes4 interfaceId) internal {	//inject NONSTANDARD NAMING
        require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
        _supportedInterfaces[interfaceId] = true;
    }

    uint256[50] private ______gap;
}

// File: @openzeppelin/contracts-ethereum-package/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.0;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY405() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF598(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER63(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE834(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE997(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM763(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER76(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL673(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts-ethereum-package/contracts/utils/Address.sol

pragma solidity ^0.5.5;

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT805(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }

                                                                                                                                                                                                          
    function TOPAYABLE55(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE695(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts-ethereum-package/contracts/math/SafeMath.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD74(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB481(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB481(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB481(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL946(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV616(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV616(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV616(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD291(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD291(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD291(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts-ethereum-package/contracts/token/ERC20/SafeERC20.sol

pragma solidity ^0.5.0;




                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER927(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN644(token, abi.encodeWithSelector(token.TRANSFER63.selector, to, value));
    }

    function SAFETRANSFERFROM818(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN644(token, abi.encodeWithSelector(token.TRANSFERFROM763.selector, from, to, value));
    }

    function SAFEAPPROVE658(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE834(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN644(token, abi.encodeWithSelector(token.APPROVE997.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE63(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE834(address(this), spender).ADD74(value);
        CALLOPTIONALRETURN644(token, abi.encodeWithSelector(token.APPROVE997.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE643(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE834(address(this), spender).SUB481(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN644(token, abi.encodeWithSelector(token.APPROVE997.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN644(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT805(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: contracts/mixins/MixinFunds.sol

pragma solidity 0.5.17;





                                                                                                                    
contract MixinFunds
{
  using Address for address payable;
  using SafeERC20 for IERC20;

                                                                                                                          
  address public tokenAddress;

  function _INITIALIZEMIXINFUNDS749(	//inject NONSTANDARD NAMING
    address _tokenAddress
  ) internal
  {
    tokenAddress = _tokenAddress;
    require(
      _tokenAddress == address(0) || IERC20(_tokenAddress).TOTALSUPPLY405() > 0,
      'INVALID_TOKEN'
    );
  }

                                                                  
  function GETBALANCE339(	//inject NONSTANDARD NAMING
    address _tokenAddress,
    address _account
  ) public view
    returns (uint)
  {
    if(_tokenAddress == address(0)) {
      return _account.balance;
    } else {
      return IERC20(_tokenAddress).BALANCEOF598(_account);
    }
  }

                                                                                                                                                  
  function _TRANSFER818(	//inject NONSTANDARD NAMING
    address _tokenAddress,
    address _to,
    uint _amount
  ) internal
  {
    if(_amount > 0) {
      if(_tokenAddress == address(0)) {
        // https://diligence.consensys.net/blog/2019/09/stop-using-soliditys-transfer-now/
        address(uint160(_to)).SENDVALUE695(_amount);
      } else {
        IERC20 token = IERC20(_tokenAddress);
        token.SAFETRANSFER927(_to, _amount);
      }
    }
  }
}

// File: @openzeppelin/contracts-ethereum-package/contracts/access/Roles.sol

pragma solidity ^0.5.0;

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD74(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS284(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE151(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS284(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS284(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}

// File: contracts/mixins/MixinLockManagerRole.sol

pragma solidity 0.5.17;

// This contract mostly follows the pattern established by openzeppelin in
// openzeppelin/contracts-ethereum-package/contracts/access/roles



contract MixinLockManagerRole {
  using Roles for Roles.Role;

  event LOCKMANAGERADDED105(address indexed account);	//inject NONSTANDARD NAMING
  event LOCKMANAGERREMOVED21(address indexed account);	//inject NONSTANDARD NAMING

  Roles.Role private lockManagers;

  function _INITIALIZEMIXINLOCKMANAGERROLE172(address sender) internal {	//inject NONSTANDARD NAMING
    if (!ISLOCKMANAGER668(sender)) {
      lockManagers.ADD74(sender);
    }
  }

  modifier ONLYLOCKMANAGER712() {	//inject NONSTANDARD NAMING
    require(ISLOCKMANAGER668(msg.sender), 'MixinLockManager: caller does not have the LockManager role');
    _;
  }

  function ISLOCKMANAGER668(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
    return lockManagers.HAS284(account);
  }

  function ADDLOCKMANAGER4(address account) public ONLYLOCKMANAGER712 {	//inject NONSTANDARD NAMING
    lockManagers.ADD74(account);
    emit LOCKMANAGERADDED105(account);
  }

  function RENOUNCELOCKMANAGER584() public {	//inject NONSTANDARD NAMING
    lockManagers.REMOVE151(msg.sender);
    emit LOCKMANAGERREMOVED21(msg.sender);
  }
}

// File: contracts/mixins/MixinDisable.sol

pragma solidity 0.5.17;



                                                                                                                                                                                                                                                                                        
contract MixinDisable is
  MixinLockManagerRole,
  MixinFunds
{
  // Used to disable payable functions when deprecating an old lock
  bool public isAlive;

  event DISABLE791();	//inject NONSTANDARD NAMING

  function _INITIALIZEMIXINDISABLE727(	//inject NONSTANDARD NAMING
  ) internal
  {
    isAlive = true;
  }

  // Only allow usage when contract is Alive
  modifier ONLYIFALIVE275() {	//inject NONSTANDARD NAMING
    require(isAlive, 'LOCK_DEPRECATED');
    _;
  }

                                                                                          
  function DISABLELOCK441()	//inject NONSTANDARD NAMING
    external
    ONLYLOCKMANAGER712
    ONLYIFALIVE275
  {
    emit DISABLE791();
    isAlive = false;
  }
}

// File: @openzeppelin/contracts-ethereum-package/contracts/token/ERC721/IERC721.sol

pragma solidity ^0.5.0;



                                                                   
contract IERC721 is Initializable, IERC165 {
    event TRANSFER76(address indexed from, address indexed to, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVAL673(address indexed owner, address indexed approved, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVALFORALL880(address indexed owner, address indexed operator, bool approved);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF598(address owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING

                                                                                
    function OWNEROF442(uint256 tokenId) public view returns (address owner);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                       
    function SAFETRANSFERFROM818(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                              
    function TRANSFERFROM763(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function APPROVE997(address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function GETAPPROVED850(uint256 tokenId) public view returns (address operator);	//inject NONSTANDARD NAMING

    function SETAPPROVALFORALL432(address operator, bool _approved) public;	//inject NONSTANDARD NAMING
    function ISAPPROVEDFORALL243(address owner, address operator) public view returns (bool);	//inject NONSTANDARD NAMING


    function SAFETRANSFERFROM818(address from, address to, uint256 tokenId, bytes memory data) public;	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts-ethereum-package/contracts/token/ERC721/IERC721Enumerable.sol

pragma solidity ^0.5.0;



                                                                                                                                        
contract IERC721Enumerable is Initializable, IERC721 {
    function TOTALSUPPLY405() public view returns (uint256);	//inject NONSTANDARD NAMING
    function TOKENOFOWNERBYINDEX873(address owner, uint256 index) public view returns (uint256 tokenId);	//inject NONSTANDARD NAMING

    function TOKENBYINDEX759(uint256 index) public view returns (uint256);	//inject NONSTANDARD NAMING
}

// File: contracts/interfaces/IUnlock.sol

pragma solidity 0.5.17;


                                                                                    

interface IUnlock
{
  // Use initialize instead of a constructor to support proxies(for upgradeability via zos).
  function INITIALIZE243(address _unlockOwner) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                     
  function CREATELOCK605(	//inject NONSTANDARD NAMING
    uint _expirationDuration,
    address _tokenAddress,
    uint _keyPrice,
    uint _maxNumberOfKeys,
    string calldata _lockName,
    bytes12 _salt
  ) external;

                                                                                                                                                                                                                                                                                                                                                                        
  function RECORDKEYPURCHASE154(	//inject NONSTANDARD NAMING
    uint _value,
    address _referrer // solhint-disable-line no-unused-vars
  )
    external;

                                                                                                                                                                                                                                                                                                         
  function RECORDCONSUMEDDISCOUNT751(	//inject NONSTANDARD NAMING
    uint _discount,
    uint _tokens // solhint-disable-line no-unused-vars
  )
    external;

                                                                                                                                                                                                                                                      
  function COMPUTEAVAILABLEDISCOUNTFOR461(	//inject NONSTANDARD NAMING
    address _purchaser, // solhint-disable-line no-unused-vars
    uint _keyPrice // solhint-disable-line no-unused-vars
  )
    external
    view
    returns(uint discount, uint tokens);

  // Function to read the globalTokenURI field.
  function GLOBALBASETOKENURI525()	//inject NONSTANDARD NAMING
    external
    view
    returns(string memory);

                                                                                                         
  function GETGLOBALBASETOKENURI800()	//inject NONSTANDARD NAMING
    external
    view
    returns (string memory);

  // Function to read the globalTokenSymbol field.
  function GLOBALTOKENSYMBOL855()	//inject NONSTANDARD NAMING
    external
    view
    returns(string memory);

                                                                                                        
  function GETGLOBALTOKENSYMBOL919()	//inject NONSTANDARD NAMING
    external
    view
    returns (string memory);

                                                                                                                       
  function CONFIGUNLOCK6(	//inject NONSTANDARD NAMING
    string calldata _symbol,
    string calldata _URI
  )
    external;

                                                                                                                                                                
  function SETLOCKTEMPLATE255(	//inject NONSTANDARD NAMING
    address payable _publicLockAddress
  ) external;

  // Allows the owner to change the value tracking variables as needed.
  function RESETTRACKEDVALUE694(	//inject NONSTANDARD NAMING
    uint _grossNetworkProduct,
    uint _totalDiscountGranted
  ) external;

  function GROSSNETWORKPRODUCT946() external view returns(uint);	//inject NONSTANDARD NAMING

  function TOTALDISCOUNTGRANTED848() external view returns(uint);	//inject NONSTANDARD NAMING

  function LOCKS8(address) external view returns(bool deployed, uint totalSales, uint yieldedDiscountTokens);	//inject NONSTANDARD NAMING

  // The address of the public lock template, used when `createLock` is called
  function PUBLICLOCKADDRESS512() external view returns(address);	//inject NONSTANDARD NAMING

  // Map token address to exchange contract address if the token is supported
  // Used for GDP calculations
  function UNISWAPEXCHANGES817(address) external view returns(address);	//inject NONSTANDARD NAMING

  // The version number of the current Unlock implementation on this network
  function UNLOCKVERSION72() external pure returns(uint16);	//inject NONSTANDARD NAMING

  // allows the owner to set the exchange address to use for value conversions
  // setting the _exchangeAddress to address(0) removes support for the token
  function SETEXCHANGE998(	//inject NONSTANDARD NAMING
    address _tokenAddress,
    address _exchangeAddress
  ) external;

                                                                      
  function ISOWNER181() external view returns(bool);	//inject NONSTANDARD NAMING

                                                               
  function OWNER980() external view returns(address);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                 
  function RENOUNCEOWNERSHIP35() external;	//inject NONSTANDARD NAMING

                                                                                                                                      
  function TRANSFEROWNERSHIP600(address newOwner) external;	//inject NONSTANDARD NAMING
}

// File: contracts/interfaces/hooks/ILockKeyCancelHook.sol

pragma solidity 0.5.17;


                                                                                                                                            
interface ILockKeyCancelHook
{
                                                                                                                                                                                                                                                                                                                         
  function ONKEYCANCEL136(	//inject NONSTANDARD NAMING
    address operator,
    address to,
    uint256 refund
  ) external;
}

// File: contracts/interfaces/hooks/ILockKeyPurchaseHook.sol

pragma solidity 0.5.17;


                                                                                                                                              
interface ILockKeyPurchaseHook
{
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function KEYPURCHASEPRICE678(	//inject NONSTANDARD NAMING
    address from,
    address recipient,
    address referrer,
    bytes calldata data
  ) external view
    returns (uint minKeyPrice);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function ONKEYPURCHASE123(	//inject NONSTANDARD NAMING
    address from,
    address recipient,
    address referrer,
    bytes calldata data,
    uint minKeyPrice,
    uint pricePaid
  ) external;
}

// File: contracts/mixins/MixinLockCore.sol

pragma solidity 0.5.17;










                                                                                                                                                                                                                             
contract MixinLockCore is
  IERC721Enumerable,
  MixinLockManagerRole,
  MixinFunds,
  MixinDisable
{
  using Address for address;

  event WITHDRAWAL5(	//inject NONSTANDARD NAMING
    address indexed sender,
    address indexed tokenAddress,
    address indexed beneficiary,
    uint amount
  );

  event PRICINGCHANGED512(	//inject NONSTANDARD NAMING
    uint oldKeyPrice,
    uint keyPrice,
    address oldTokenAddress,
    address tokenAddress
  );

  // Unlock Protocol address
  // TODO: should we make that private/internal?
  IUnlock public unlockProtocol;

  // Duration in seconds for which the keys are valid, after creation
  // should we take a smaller type use less gas?
  // TODO: add support for a timestamp instead of duration
  uint public expirationDuration;

  // price in wei of the next key
  // TODO: allow support for a keyPriceCalculator which could set prices dynamically
  uint public keyPrice;

  // Max number of keys sold if the keyReleaseMechanism is public
  uint public maxNumberOfKeys;

  // A count of how many new key purchases there have been
  uint internal _totalSupply;

  // The account which will receive funds on withdrawal
  address public beneficiary;

  // The denominator component for values specified in basis points.
  uint internal constant basis_points_den273 = 10000;	//inject NONSTANDARD NAMING

  ILockKeyPurchaseHook public onKeyPurchaseHook;
  ILockKeyCancelHook public onKeyCancelHook;

  // Ensure that the Lock has not sold all of its keys.
  modifier NOTSOLDOUT587() {	//inject NONSTANDARD NAMING
    require(maxNumberOfKeys > _totalSupply, 'LOCK_SOLD_OUT');
    _;
  }

  modifier ONLYLOCKMANAGERORBENEFICIARY766()	//inject NONSTANDARD NAMING
  {
    require(
      ISLOCKMANAGER668(msg.sender) || msg.sender == beneficiary,
      'ONLY_LOCK_MANAGER_OR_BENEFICIARY'
    );
    _;
  }

  function _INITIALIZEMIXINLOCKCORE763(	//inject NONSTANDARD NAMING
    address _beneficiary,
    uint _expirationDuration,
    uint _keyPrice,
    uint _maxNumberOfKeys
  ) internal
  {
    require(_expirationDuration <= 100 * 365 * 24 * 60 * 60, 'MAX_EXPIRATION_100_YEARS');
    unlockProtocol = IUnlock(msg.sender); // Make sure we link back to Unlock's smart contract.
    beneficiary = _beneficiary;
    expirationDuration = _expirationDuration;
    keyPrice = _keyPrice;
    maxNumberOfKeys = _maxNumberOfKeys;
  }

  // The version number of the current implementation on this network
  function PUBLICLOCKVERSION602(	//inject NONSTANDARD NAMING
  ) public pure
    returns (uint)
  {
    return 7;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function WITHDRAW762(	//inject NONSTANDARD NAMING
    address _tokenAddress,
    uint _amount
  ) external
    ONLYLOCKMANAGERORBENEFICIARY766
  {
    uint balance = GETBALANCE339(_tokenAddress, address(this));
    uint amount;
    if(_amount == 0 || _amount > balance)
    {
      require(balance > 0, 'NOT_ENOUGH_FUNDS');
      amount = balance;
    }
    else
    {
      amount = _amount;
    }

    emit WITHDRAWAL5(msg.sender, _tokenAddress, beneficiary, amount);
    // Security: re-entrancy not a risk as this is the last line of an external function
    _TRANSFER818(_tokenAddress, beneficiary, amount);
  }

                                                                                                                                                                                                                                                            
  function UPDATEKEYPRICING854(	//inject NONSTANDARD NAMING
    uint _keyPrice,
    address _tokenAddress
  )
    external
    ONLYLOCKMANAGER712
    ONLYIFALIVE275
  {
    uint oldKeyPrice = keyPrice;
    address oldTokenAddress = tokenAddress;
    require(
      _tokenAddress == address(0) || IERC20(_tokenAddress).TOTALSUPPLY405() > 0,
      'INVALID_TOKEN'
    );
    keyPrice = _keyPrice;
    tokenAddress = _tokenAddress;
    emit PRICINGCHANGED512(oldKeyPrice, keyPrice, oldTokenAddress, tokenAddress);
  }

                                                                                                                                     
  function UPDATEBENEFICIARY529(	//inject NONSTANDARD NAMING
    address _beneficiary
  ) external
  {
    require(msg.sender == beneficiary || ISLOCKMANAGER668(msg.sender), 'ONLY_BENEFICIARY_OR_LOCKMANAGER');
    require(_beneficiary != address(0), 'INVALID_ADDRESS');
    beneficiary = _beneficiary;
  }

                                                                             
  function SETEVENTHOOKS104(	//inject NONSTANDARD NAMING
    address _onKeyPurchaseHook,
    address _onKeyCancelHook
  ) external
    ONLYLOCKMANAGER712()
  {
    require(_onKeyPurchaseHook == address(0) || _onKeyPurchaseHook.ISCONTRACT805(), 'INVALID_ON_KEY_SOLD_HOOK');
    require(_onKeyCancelHook == address(0) || _onKeyCancelHook.ISCONTRACT805(), 'INVALID_ON_KEY_CANCEL_HOOK');
    onKeyPurchaseHook = ILockKeyPurchaseHook(_onKeyPurchaseHook);
    onKeyCancelHook = ILockKeyCancelHook(_onKeyCancelHook);
  }

  function TOTALSUPPLY405()	//inject NONSTANDARD NAMING
    public
    view returns(uint256)
  {
    return _totalSupply;
  }
}

// File: contracts/mixins/MixinKeys.sol

pragma solidity 0.5.17;




                                                                                                                                                                                                                                                                                                       
contract MixinKeys is
  MixinLockCore
{
  using SafeMath for uint;

  // The struct for a key
  struct Key {
    uint tokenId;
    uint expirationTimestamp;
  }

  // Emitted when the Lock owner expires a user's Key
  event EXPIREKEY93(uint indexed tokenId);	//inject NONSTANDARD NAMING

  // Emitted when the expiration of a key is modified
  event EXPIRATIONCHANGED495(	//inject NONSTANDARD NAMING
    uint indexed _tokenId,
    uint _amount,
    bool _timeAdded
  );

  event KEYMANAGERCHANGED575(uint indexed _tokenId, address indexed _newManager);	//inject NONSTANDARD NAMING


  // Keys
  // Each owner can have at most exactly one key
  // TODO: could we use public here? (this could be confusing though because it getter will
  // return 0 values when missing a key)
  mapping (address => Key) internal keyByOwner;

  // Each tokenId can have at most exactly one owner at a time.
  // Returns 0 if the token does not exist
  // TODO: once we decouple tokenId from owner address (incl in js), then we can consider
  // merging this with totalSupply into an array instead.
  mapping (uint => address) internal _ownerOf;

  // Addresses of owners are also stored in an array.
  // Addresses are never removed by design to avoid abuses around referals
  address[] public owners;

  // A given key has both an owner and a manager.
  // If keyManager == address(0) then the key owner is also the manager
  // Each key can have at most 1 keyManager.
  mapping (uint => address) public keyManagerOf;

    // Keeping track of approved transfers
  // This is a mapping of addresses which have approved
  // the transfer of a key to another address where their key can be transferred
  // Note: the approver may actually NOT have a key... and there can only
  // be a single approved address
  mapping (uint => address) private approved;

    // Keeping track of approved operators for a given Key manager.
  // This approves a given operator for all keys managed by the calling "keyManager"
  // The caller may not currently be the keyManager for ANY keys.
  // These approvals are never reset/revoked automatically, unlike "approved",
  // which is reset on transfer.
  mapping (address => mapping (address => bool)) private managerToOperatorApproved;

    // Ensure that the caller is the keyManager of the key
  // or that the caller has been approved
  // for ownership of that key
  modifier ONLYKEYMANAGERORAPPROVED688(	//inject NONSTANDARD NAMING
    uint _tokenId
  )
  {
    require(
      _ISKEYMANAGER298(_tokenId, msg.sender) ||
      _ISAPPROVED360(_tokenId, msg.sender) ||
      ISAPPROVEDFORALL243(_ownerOf[_tokenId], msg.sender),
      'ONLY_KEY_MANAGER_OR_APPROVED'
    );
    _;
  }

  // Ensures that an owner owns or has owned a key in the past
  modifier OWNSORHASOWNEDKEY252(	//inject NONSTANDARD NAMING
    address _keyOwner
  ) {
    require(
      keyByOwner[_keyOwner].expirationTimestamp > 0, 'HAS_NEVER_OWNED_KEY'
    );
    _;
  }

  // Ensures that an owner has a valid key
  modifier HASVALIDKEY427(	//inject NONSTANDARD NAMING
    address _user
  ) {
    require(
      GETHASVALIDKEY803(_user), 'KEY_NOT_VALID'
    );
    _;
  }

  // Ensures that a key has an owner
  modifier ISKEY844(	//inject NONSTANDARD NAMING
    uint _tokenId
  ) {
    require(
      _ownerOf[_tokenId] != address(0), 'NO_SUCH_KEY'
    );
    _;
  }

  // Ensure that the caller owns the key
  modifier ONLYKEYOWNER728(	//inject NONSTANDARD NAMING
    uint _tokenId
  ) {
    require(
      ISKEYOWNER633(_tokenId, msg.sender), 'ONLY_KEY_OWNER'
    );
    _;
  }

                                                                                                                                                           
  function BALANCEOF598(	//inject NONSTANDARD NAMING
    address _keyOwner
  )
    public
    view
    returns (uint)
  {
    require(_keyOwner != address(0), 'INVALID_ADDRESS');
    return GETHASVALIDKEY803(_keyOwner) ? 1 : 0;
  }

                                                          
  function GETHASVALIDKEY803(	//inject NONSTANDARD NAMING
    address _keyOwner
  )
    public
    view
    returns (bool)
  {
    return keyByOwner[_keyOwner].expirationTimestamp > block.timestamp;
  }

                                                                                                             
  function GETTOKENIDFOR386(	//inject NONSTANDARD NAMING
    address _account
  ) public view
    returns (uint)
  {
    return keyByOwner[_account].tokenId;
  }

                                                                                                                                                                                                                                  
  function GETOWNERSBYPAGE834(uint _page, uint _pageSize)	//inject NONSTANDARD NAMING
    public
    view
    returns (address[] memory)
  {
    require(owners.length > 0, 'NO_OUTSTANDING_KEYS');
    uint pageSize = _pageSize;
    uint _startIndex = _page * pageSize;
    uint endOfPageIndex;

    if (_startIndex + pageSize > owners.length) {
      endOfPageIndex = owners.length;
      pageSize = owners.length - _startIndex;
    } else {
      endOfPageIndex = (_startIndex + pageSize);
    }

    // new temp in-memory array to hold pageSize number of requested owners:
    address[] memory ownersByPage = new address[](pageSize);
    uint pageIndex = 0;

    // Build the requested set of owners into a new temporary array:
    for (uint i = _startIndex; i < endOfPageIndex; i++) {
      ownersByPage[pageIndex] = owners[i];
      pageIndex++;
    }

    return ownersByPage;
  }

                                                                    
  function ISKEYOWNER633(	//inject NONSTANDARD NAMING
    uint _tokenId,
    address _keyOwner
  ) public view
    returns (bool)
  {
    return _ownerOf[_tokenId] == _keyOwner;
  }

                                                                                                                                                                                                                          
  function KEYEXPIRATIONTIMESTAMPFOR871(	//inject NONSTANDARD NAMING
    address _keyOwner
  ) public view
    returns (uint)
  {
    return keyByOwner[_keyOwner].expirationTimestamp;
  }

                                                                                                                                                     
  function NUMBEROFOWNERS173()	//inject NONSTANDARD NAMING
    public
    view
    returns (uint)
  {
    return owners.length;
  }
  // Returns the owner of a given tokenId
  function OWNEROF442(	//inject NONSTANDARD NAMING
    uint _tokenId
  ) public view
    ISKEY844(_tokenId)
    returns(address)
  {
    return _ownerOf[_tokenId];
  }

                                                                                                                                                                                                                                                                                                                          
  function SETKEYMANAGEROF195(	//inject NONSTANDARD NAMING
    uint _tokenId,
    address _keyManager
  ) public
    ISKEY844(_tokenId)
  {
    require(
      _ISKEYMANAGER298(_tokenId, msg.sender) ||
      ISLOCKMANAGER668(msg.sender),
      'UNAUTHORIZED_KEY_MANAGER_UPDATE'
    );
    _SETKEYMANAGEROF57(_tokenId, _keyManager);
  }

  function _SETKEYMANAGEROF57(	//inject NONSTANDARD NAMING
    uint _tokenId,
    address _keyManager
  ) internal
  {
    if(keyManagerOf[_tokenId] != _keyManager) {
      keyManagerOf[_tokenId] = _keyManager;
      _CLEARAPPROVAL926(_tokenId);
      emit KEYMANAGERCHANGED575(_tokenId, address(0));
    }
  }

                                                                                                                                                                                           
  function APPROVE997(	//inject NONSTANDARD NAMING
    address _approved,
    uint _tokenId
  )
    public
    ONLYIFALIVE275
    ONLYKEYMANAGERORAPPROVED688(_tokenId)
  {
    require(msg.sender != _approved, 'APPROVE_SELF');

    approved[_tokenId] = _approved;
    emit APPROVAL673(_ownerOf[_tokenId], _approved, _tokenId);
  }

                                                                                                                                                                                                                                                                          
  function GETAPPROVED850(	//inject NONSTANDARD NAMING
    uint _tokenId
  ) public view
    ISKEY844(_tokenId)
    returns (address)
  {
    address approvedRecipient = approved[_tokenId];
    return approvedRecipient;
  }

                                                                                                                                                                                                                                                                                                                       
  function ISAPPROVEDFORALL243(	//inject NONSTANDARD NAMING
    address _owner,
    address _operator
  ) public view
    returns (bool)
  {
    uint tokenId = keyByOwner[_owner].tokenId;
    address keyManager = keyManagerOf[tokenId];
    if(keyManager == address(0)) {
      return managerToOperatorApproved[_owner][_operator];
    } else {
      return managerToOperatorApproved[keyManager][_operator];
    }
  }

                                                                                                
  function _ISKEYMANAGER298(	//inject NONSTANDARD NAMING
    uint _tokenId,
    address _keyManager
  ) internal view
    returns (bool)
  {
    if(keyManagerOf[_tokenId] == _keyManager ||
      (keyManagerOf[_tokenId] == address(0) && ISKEYOWNER633(_tokenId, _keyManager))) {
      return true;
    } else {
      return false;
    }
  }

                                                                                                                
  function _ASSIGNNEWTOKENID168(	//inject NONSTANDARD NAMING
    Key storage _key
  ) internal
  {
    if (_key.tokenId == 0) {
      // This is a brand new owner
      // We increment the tokenId counter
      _totalSupply++;
      // we assign the incremented `_totalSupply` as the tokenId for the new key
      _key.tokenId = _totalSupply;
    }
  }

                                                     
  function _RECORDOWNER143(	//inject NONSTANDARD NAMING
    address _keyOwner,
    uint _tokenId
  ) internal
  {
    if (_ownerOf[_tokenId] != _keyOwner) {
      // TODO: this may include duplicate entries
      owners.push(_keyOwner);
      // We register the owner of the tokenID
      _ownerOf[_tokenId] = _keyOwner;
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                        
  function _TIMEMACHINE475(	//inject NONSTANDARD NAMING
    uint _tokenId,
    uint256 _deltaT,
    bool _addTime
  ) internal
  {
    address tokenOwner = _ownerOf[_tokenId];
    require(tokenOwner != address(0), 'NON_EXISTENT_KEY');
    Key storage key = keyByOwner[tokenOwner];
    uint formerTimestamp = key.expirationTimestamp;
    bool validKey = GETHASVALIDKEY803(tokenOwner);
    if(_addTime) {
      if(validKey) {
        key.expirationTimestamp = formerTimestamp.ADD74(_deltaT);
      } else {
        key.expirationTimestamp = block.timestamp.ADD74(_deltaT);
      }
    } else {
      key.expirationTimestamp = formerTimestamp.SUB481(_deltaT);
    }
    emit EXPIRATIONCHANGED495(_tokenId, _deltaT, _addTime);
  }

                                                                                                                                                                                                                                                                                     
  function SETAPPROVALFORALL432(	//inject NONSTANDARD NAMING
    address _to,
    bool _approved
  ) public
    ONLYIFALIVE275
  {
    require(_to != msg.sender, 'APPROVE_SELF');
    managerToOperatorApproved[msg.sender][_to] = _approved;
    emit APPROVALFORALL880(msg.sender, _to, _approved);
  }

                                                                                     
  function _ISAPPROVED360(	//inject NONSTANDARD NAMING
    uint _tokenId,
    address _user
  ) internal view
    returns (bool)
  {
    return approved[_tokenId] == _user;
  }

                                                                                                                                             
  function _CLEARAPPROVAL926(	//inject NONSTANDARD NAMING
    uint256 _tokenId
  ) internal
  {
    if (approved[_tokenId] != address(0)) {
      approved[_tokenId] = address(0);
    }
  }
}

// File: contracts/mixins/MixinERC721Enumerable.sol

pragma solidity 0.5.17;






                                                              
contract MixinERC721Enumerable is
  IERC721Enumerable,
  ERC165,
  MixinLockCore, // Implements totalSupply
  MixinKeys
{
  function _INITIALIZEMIXINERC721ENUMERABLE861() internal	//inject NONSTANDARD NAMING
  {
                                                                                                                                                                                                                                                                                                    
    _REGISTERINTERFACE570(0x780e9d63);
  }

                                  
                                                 
                                                       
                                                          
                                 
  function TOKENBYINDEX759(	//inject NONSTANDARD NAMING
    uint256 _index
  ) public view
    returns (uint256)
  {
    require(_index < _totalSupply, 'OUT_OF_RANGE');
    return _index;
  }

                                                 
                                                             
                                                                  
                                                                               
                                                              
                                                                                  
                                  
  function TOKENOFOWNERBYINDEX873(	//inject NONSTANDARD NAMING
    address _keyOwner,
    uint256 _index
  ) public view
    returns (uint256)
  {
    require(_index == 0, 'ONLY_ONE_KEY_PER_OWNER');
    return GETTOKENIDFOR386(_keyOwner);
  }
}

// File: contracts/mixins/MixinKeyGranterRole.sol

pragma solidity 0.5.17;

// This contract mostly follows the pattern established by openzeppelin in
// openzeppelin/contracts-ethereum-package/contracts/access/roles




contract MixinKeyGranterRole is MixinLockManagerRole {
  using Roles for Roles.Role;

  event KEYGRANTERADDED943(address indexed account);	//inject NONSTANDARD NAMING
  event KEYGRANTERREMOVED82(address indexed account);	//inject NONSTANDARD NAMING

  Roles.Role private keyGranters;

  function _INITIALIZEMIXINKEYGRANTERROLE428(address sender) internal {	//inject NONSTANDARD NAMING
    if (!ISKEYGRANTER295(sender)) {
      keyGranters.ADD74(sender);
    }
  }

  modifier ONLYKEYGRANTERORMANAGER730() {	//inject NONSTANDARD NAMING
    require(ISKEYGRANTER295(msg.sender) || ISLOCKMANAGER668(msg.sender), 'MixinKeyGranter: caller does not have the KeyGranter or LockManager role');
    _;
  }

  function ISKEYGRANTER295(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
    return keyGranters.HAS284(account);
  }

  function ADDKEYGRANTER548(address account) public ONLYLOCKMANAGER712 {	//inject NONSTANDARD NAMING
    keyGranters.ADD74(account);
    emit KEYGRANTERADDED943(account);
  }

  function REVOKEKEYGRANTER134(address _granter) public ONLYLOCKMANAGER712 {	//inject NONSTANDARD NAMING
    keyGranters.REMOVE151(_granter);
    emit KEYGRANTERREMOVED82(_granter);
  }
}

// File: contracts/mixins/MixinGrantKeys.sol

pragma solidity 0.5.17;




                                                                                                                                                                                                                                                  
contract MixinGrantKeys is
  MixinKeyGranterRole,
  MixinKeys
{
                                                                                                                                                     
  function GRANTKEYS710(	//inject NONSTANDARD NAMING
    address[] calldata _recipients,
    uint[] calldata _expirationTimestamps,
    address[] calldata _keyManagers
  ) external
    ONLYKEYGRANTERORMANAGER730
  {
    for(uint i = 0; i < _recipients.length; i++) {
      address recipient = _recipients[i];
      uint expirationTimestamp = _expirationTimestamps[i];
      address keyManager = _keyManagers[i];

      require(recipient != address(0), 'INVALID_ADDRESS');

      Key storage toKey = keyByOwner[recipient];
      require(expirationTimestamp > toKey.expirationTimestamp, 'ALREADY_OWNS_KEY');

      uint idTo = toKey.tokenId;

      if(idTo == 0) {
        _ASSIGNNEWTOKENID168(toKey);
        idTo = toKey.tokenId;
        _RECORDOWNER143(recipient, idTo);
      }
      // Set the key Manager
      _SETKEYMANAGEROF57(idTo, keyManager);
      emit KEYMANAGERCHANGED575(idTo, keyManager);

      toKey.expirationTimestamp = expirationTimestamp;
      // trigger event
      emit TRANSFER76(
        address(0), // This is a creation.
        recipient,
        idTo
      );
    }
  }
}

// File: contracts/UnlockUtils.sol

pragma solidity 0.5.17;

// This contract provides some utility methods for use with the unlock protocol smart contracts.
// Borrowed from:
// https://github.com/oraclize/ethereum-api/blob/master/oraclizeAPI_0.5.sol#L943

library UnlockUtils {

  function STRCONCAT591(	//inject NONSTANDARD NAMING
    string memory _a,
    string memory _b,
    string memory _c,
    string memory _d
  ) internal pure
    returns (string memory _concatenatedString)
  {
    return string(abi.encodePacked(_a, _b, _c, _d));
  }

  function UINT2STR177(	//inject NONSTANDARD NAMING
    uint _i
  ) internal pure
    returns (string memory _uintAsString)
  {
    // make a copy of the param to avoid security/no-assign-params error
    uint c = _i;
    if (_i == 0) {
      return '0';
    }
    uint j = _i;
    uint len;
    while (j != 0) {
      len++;
      j /= 10;
    }
    bytes memory bstr = new bytes(len);
    uint k = len - 1;
    while (c != 0) {
      bstr[k--] = byte(uint8(48 + c % 10));
      c /= 10;
    }
    return string(bstr);
  }

  function ADDRESS2STR300(	//inject NONSTANDARD NAMING
    address _addr
  ) internal pure
    returns(string memory)
  {
    bytes32 value = bytes32(uint256(_addr));
    bytes memory alphabet = '0123456789abcdef';
    bytes memory str = new bytes(42);
    str[0] = '0';
    str[1] = 'x';
    for (uint i = 0; i < 20; i++) {
      str[2+i*2] = alphabet[uint8(value[i + 12] >> 4)];
      str[3+i*2] = alphabet[uint8(value[i + 12] & 0x0f)];
    }
    return string(str);
  }
}

// File: contracts/mixins/MixinLockMetadata.sol

pragma solidity 0.5.17;







                                                                                                                                                                                                                        
contract MixinLockMetadata is
  IERC721Enumerable,
  ERC165,
  MixinLockManagerRole,
  MixinLockCore,
  MixinKeys
{
  using UnlockUtils for uint;
  using UnlockUtils for address;
  using UnlockUtils for string;

                                                                                                                              
  string public name;

                                                                                                    
  string private lockSymbol;

  // the base Token URI for this Lock. If not set by lock owner, the global URI stored in Unlock is used.
  string private baseTokenURI;

  event NEWLOCKSYMBOL551(	//inject NONSTANDARD NAMING
    string symbol
  );

  function _INITIALIZEMIXINLOCKMETADATA436(	//inject NONSTANDARD NAMING
    string memory _lockName
  ) internal
  {
    ERC165.INITIALIZE243();
    name = _lockName;
    // registering the optional erc721 metadata interface with ERC165.sol using
    // the ID specified in the standard: https://eips.ethereum.org/EIPS/eip-721
    _REGISTERINTERFACE570(0x5b5e139f);
  }

                                                                                  
  function UPDATELOCKNAME966(	//inject NONSTANDARD NAMING
    string calldata _lockName
  ) external
    ONLYLOCKMANAGER712
  {
    name = _lockName;
  }

                                                                        
  function UPDATELOCKSYMBOL834(	//inject NONSTANDARD NAMING
    string calldata _lockSymbol
  ) external
    ONLYLOCKMANAGER712
  {
    lockSymbol = _lockSymbol;
    emit NEWLOCKSYMBOL551(_lockSymbol);
  }

                                                                                              
  function SYMBOL83()	//inject NONSTANDARD NAMING
    external view
    returns(string memory)
  {
    if(bytes(lockSymbol).length == 0) {
      return unlockProtocol.GLOBALTOKENSYMBOL855();
    } else {
      return lockSymbol;
    }
  }

                                                                                
  function SETBASETOKENURI398(	//inject NONSTANDARD NAMING
    string calldata _baseTokenURI
  ) external
    ONLYLOCKMANAGER712
  {
    baseTokenURI = _baseTokenURI;
  }

                                                                                                                                                                                                                                                                                                                                        
  function TOKENURI883(	//inject NONSTANDARD NAMING
    uint256 _tokenId
  ) external
    view
    ISKEY844(_tokenId)
    returns(string memory)
  {
    string memory URI;
    if(bytes(baseTokenURI).length == 0) {
      URI = unlockProtocol.GLOBALBASETOKENURI525();
    } else {
      URI = baseTokenURI;
    }

    return URI.STRCONCAT591(
      address(this).ADDRESS2STR300(),
      '/',
      _tokenId.UINT2STR177()
    );
  }
}

// File: contracts/mixins/MixinPurchase.sol

pragma solidity 0.5.17;







                                                                                                                                                                                                                               
contract MixinPurchase is
  MixinFunds,
  MixinDisable,
  MixinLockCore,
  MixinKeys
{
  using SafeMath for uint;

  event RENEWKEYPURCHASE203(address indexed owner, uint newExpiration);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function PURCHASE34(	//inject NONSTANDARD NAMING
    uint256 _value,
    address _recipient,
    address _referrer,
    bytes calldata _data
  ) external payable
    ONLYIFALIVE275
    NOTSOLDOUT587
  {
    require(_recipient != address(0), 'INVALID_ADDRESS');

    // Assign the key
    Key storage toKey = keyByOwner[_recipient];
    uint idTo = toKey.tokenId;
    uint newTimeStamp;

    if (idTo == 0) {
      // Assign a new tokenId (if a new owner or previously transferred)
      _ASSIGNNEWTOKENID168(toKey);
      // refresh the cached value
      idTo = toKey.tokenId;
      _RECORDOWNER143(_recipient, idTo);
      newTimeStamp = block.timestamp + expirationDuration;
      toKey.expirationTimestamp = newTimeStamp;

      // trigger event
      emit TRANSFER76(
        address(0), // This is a creation.
        _recipient,
        idTo
      );
    } else if (toKey.expirationTimestamp > block.timestamp) {
      // This is an existing owner trying to extend their key
      newTimeStamp = toKey.expirationTimestamp.ADD74(expirationDuration);
      toKey.expirationTimestamp = newTimeStamp;
      emit RENEWKEYPURCHASE203(_recipient, newTimeStamp);
    } else {
      // This is an existing owner trying to renew their expired key
      // SafeAdd is not required here since expirationDuration is capped to a tiny value
      // (relative to the size of a uint)
      newTimeStamp = block.timestamp + expirationDuration;
      toKey.expirationTimestamp = newTimeStamp;

      // reset the key Manager to 0x00
      _SETKEYMANAGEROF57(idTo, address(0));

      emit RENEWKEYPURCHASE203(_recipient, newTimeStamp);
    }

    (uint inMemoryKeyPrice, uint discount, uint tokens) = _PURCHASEPRICEFOR373(_recipient, _referrer, _data);
    if (discount > 0)
    {
      unlockProtocol.RECORDCONSUMEDDISCOUNT751(discount, tokens);
    }

    // Record price without any tips
    unlockProtocol.RECORDKEYPURCHASE154(inMemoryKeyPrice, GETHASVALIDKEY803(_referrer) ? _referrer : address(0));

    // We explicitly allow for greater amounts of ETH or tokens to allow 'donations'
    uint pricePaid;
    if(tokenAddress != address(0))
    {
      pricePaid = _value;
      IERC20 token = IERC20(tokenAddress);
      token.SAFETRANSFERFROM818(msg.sender, address(this), _value);
    }
    else
    {
      pricePaid = msg.value;
    }
    require(pricePaid >= inMemoryKeyPrice, 'INSUFFICIENT_VALUE');

    if(address(onKeyPurchaseHook) != address(0))
    {
      onKeyPurchaseHook.ONKEYPURCHASE123(msg.sender, _recipient, _referrer, _data, inMemoryKeyPrice, pricePaid);
    }
  }

                                                                                                                                                                            
  function PURCHASEPRICEFOR465(	//inject NONSTANDARD NAMING
    address _recipient,
    address _referrer,
    bytes calldata _data
  ) external view
    returns (uint minKeyPrice)
  {
    (minKeyPrice, , ) = _PURCHASEPRICEFOR373(_recipient, _referrer, _data);
  }

                                                                                                                                                                                                                                                                            
  function _PURCHASEPRICEFOR373(	//inject NONSTANDARD NAMING
    address _recipient,
    address _referrer,
    bytes memory _data
  ) internal view
    returns (uint minKeyPrice, uint unlockDiscount, uint unlockTokens)
  {
    if(address(onKeyPurchaseHook) != address(0))
    {
      minKeyPrice = onKeyPurchaseHook.KEYPURCHASEPRICE678(msg.sender, _recipient, _referrer, _data);
    }
    else
    {
      minKeyPrice = keyPrice;
    }

    if(minKeyPrice > 0)
    {
      (unlockDiscount, unlockTokens) = unlockProtocol.COMPUTEAVAILABLEDISCOUNTFOR461(_recipient, minKeyPrice);
      require(unlockDiscount <= minKeyPrice, 'INVALID_DISCOUNT_FROM_UNLOCK');
      minKeyPrice -= unlockDiscount;
    }
  }
}

// File: @openzeppelin/contracts-ethereum-package/contracts/cryptography/ECDSA.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                             
library ECDSA {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function RECOVER413(bytes32 hash, bytes memory signature) internal pure returns (address) {	//inject NONSTANDARD NAMING
        // Check the signature length
        if (signature.length != 65) {
            return (address(0));
        }

        // Divide the signature in r, s and v variables
        bytes32 r;
        bytes32 s;
        uint8 v;

        // ecrecover takes the signature parameters, and the only way to get them
        // currently is to use assembly.
        // solhint-disable-next-line no-inline-assembly
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }

        // EIP-2 still allows signature malleability for ecrecover(). Remove this possibility and make the signature
        // unique. Appendix F in the Ethereum Yellow paper (https://ethereum.github.io/yellowpaper/paper.pdf), defines
        // the valid range for s in (281): 0 < s < secp256k1n 1 2 + 1, and for v in (282): v 1 {27, 28}. Most
        // signatures from current libraries generate a unique signature with an s-value in the lower half order.
        //
        // If your library generates malleable signatures, such as s-values in the upper range, calculate a new s-value
        // with 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141 - s1 and flip v from 27 to 28 or
        // vice versa. If your library also generates signatures with 0/1 for v instead 27/28, add 27 to v to accept
        // these malleable signatures as well.
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            return address(0);
        }

        if (v != 27 && v != 28) {
            return address(0);
        }

        // If the signature is valid (and not malleable), return the signer address
        return ecrecover(hash, v, r, s);
    }

                                                                                                                                                                                                                                                                 
    function TOETHSIGNEDMESSAGEHASH999(bytes32 hash) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        // 32 is the length in bytes of hash,
        // enforced by the type signature above
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}

// File: contracts/mixins/MixinSignatures.sol

pragma solidity 0.5.17;



contract MixinSignatures
{
                                                                           
  event NONCECHANGED98(	//inject NONSTANDARD NAMING
    address indexed keyManager,
    uint nextAvailableNonce
  );

  // Stores a nonce per user to use for signed messages
  mapping(address => uint) public keyManagerToNonce;

                                                        
                                                       
  modifier CONSUMEOFFCHAINAPPROVAL457(	//inject NONSTANDARD NAMING
    bytes32 _hash,
    address _keyManager,
    uint8 _v,
    bytes32 _r,
    bytes32 _s
  )
  {
    require(
      ecrecover(
        ECDSA.TOETHSIGNEDMESSAGEHASH999(_hash),
        _v,
        _r,
        _s
      ) == _keyManager, 'INVALID_SIGNATURE'
    );
    keyManagerToNonce[_keyManager]++;
    emit NONCECHANGED98(_keyManager, keyManagerToNonce[_keyManager]);
    _;
  }

                                                                                                                                                                                           
  function INVALIDATEOFFCHAINAPPROVAL774(	//inject NONSTANDARD NAMING
    uint _nextAvailableNonce
  ) external
  {
    require(_nextAvailableNonce > keyManagerToNonce[msg.sender], 'NONCE_ALREADY_USED');
    keyManagerToNonce[msg.sender] = _nextAvailableNonce;
    emit NONCECHANGED98(msg.sender, _nextAvailableNonce);
  }
}

// File: contracts/mixins/MixinRefunds.sol

pragma solidity 0.5.17;








contract MixinRefunds is
  MixinLockManagerRole,
  MixinSignatures,
  MixinFunds,
  MixinLockCore,
  MixinKeys
{
  using SafeMath for uint;

  // CancelAndRefund will return funds based on time remaining minus this penalty.
  // This is calculated as `proRatedRefund * refundPenaltyBasisPoints / BASIS_POINTS_DEN`.
  uint public refundPenaltyBasisPoints;

  uint public freeTrialLength;

                                                   
                                                                       
  bytes32 private constant cancel_typehash286 = keccak256('cancelAndRefundFor(address _keyOwner)');	//inject NONSTANDARD NAMING

  event CANCELKEY150(	//inject NONSTANDARD NAMING
    uint indexed tokenId,
    address indexed owner,
    address indexed sendTo,
    uint refund
  );

  event REFUNDPENALTYCHANGED825(	//inject NONSTANDARD NAMING
    uint freeTrialLength,
    uint refundPenaltyBasisPoints
  );

  function _INITIALIZEMIXINREFUNDS957() internal	//inject NONSTANDARD NAMING
  {
    // default to 10%
    refundPenaltyBasisPoints = 1000;
  }

                                                                                                                               
  function EXPIREANDREFUNDFOR4(	//inject NONSTANDARD NAMING
    address _keyOwner,
    uint amount
  ) external
    ONLYLOCKMANAGER712
    HASVALIDKEY427(_keyOwner)
  {
    _CANCELANDREFUND47(_keyOwner, amount);
  }

                                                                                                                                                  
  function CANCELANDREFUND886(uint _tokenId)	//inject NONSTANDARD NAMING
    external
    ONLYKEYMANAGERORAPPROVED688(_tokenId)
  {
    address keyOwner = OWNEROF442(_tokenId);
    uint refund = _GETCANCELANDREFUNDVALUE186(keyOwner);

    _CANCELANDREFUND47(keyOwner, refund);
  }

                                                                                                                                                                                                                                                                                               
  function CANCELANDREFUNDFOR57(	//inject NONSTANDARD NAMING
    address _keyManager,
    uint8 _v,
    bytes32 _r,
    bytes32 _s,
    uint _tokenId
  ) external
    CONSUMEOFFCHAINAPPROVAL457(
      GETCANCELANDREFUNDAPPROVALHASH893(_keyManager, msg.sender),
      _keyManager,
      _v,
      _r,
      _s
    )
  {
    address keyOwner = OWNEROF442(_tokenId);
    uint refund = _GETCANCELANDREFUNDVALUE186(keyOwner);
    _CANCELANDREFUND47(keyOwner, refund);
  }

                                                              
  function UPDATEREFUNDPENALTY112(	//inject NONSTANDARD NAMING
    uint _freeTrialLength,
    uint _refundPenaltyBasisPoints
  ) external
    ONLYLOCKMANAGER712
  {
    emit REFUNDPENALTYCHANGED825(
      _freeTrialLength,
      _refundPenaltyBasisPoints
    );

    freeTrialLength = _freeTrialLength;
    refundPenaltyBasisPoints = _refundPenaltyBasisPoints;
  }

                                                                                                                                                                                                                                                                                 
  function GETCANCELANDREFUNDVALUEFOR476(	//inject NONSTANDARD NAMING
    address _keyOwner
  )
    external view
    returns (uint refund)
  {
    return _GETCANCELANDREFUNDVALUE186(_keyOwner);
  }

                                                                                                                                                                                                                                                                                                                                                                                       
  function GETCANCELANDREFUNDAPPROVALHASH893(	//inject NONSTANDARD NAMING
    address _keyManager,
    address _txSender
  ) public view
    returns (bytes32 approvalHash)
  {
    return keccak256(
      abi.encodePacked(
        // Approval is specific to this Lock
        address(this),
        // The specific function the signer is approving
        cancel_typehash286,
        // Approval enables only one cancel call
        keyManagerToNonce[_keyManager],
        // Approval allows only one account to broadcast the tx
        _txSender
      )
    );
  }

                                                                                                    
  function _CANCELANDREFUND47(	//inject NONSTANDARD NAMING
    address _keyOwner,
    uint refund
  ) internal
  {
    Key storage key = keyByOwner[_keyOwner];

    emit CANCELKEY150(key.tokenId, _keyOwner, msg.sender, refund);
    // expirationTimestamp is a proxy for hasKey, setting this to `block.timestamp` instead
    // of 0 so that we can still differentiate hasKey from hasValidKey.
    key.expirationTimestamp = block.timestamp;

    if (refund > 0) {
      // Security: doing this last to avoid re-entrancy concerns
      _TRANSFER818(tokenAddress, _keyOwner, refund);
    }

    // inform the hook if there is one registered
    if(address(onKeyCancelHook) != address(0))
    {
      onKeyCancelHook.ONKEYCANCEL136(msg.sender, _keyOwner, refund);
    }
  }

                                                                                                                                                                                                 
  function _GETCANCELANDREFUNDVALUE186(	//inject NONSTANDARD NAMING
    address _keyOwner
  )
    private view
    HASVALIDKEY427(_keyOwner)
    returns (uint refund)
  {
    Key storage key = keyByOwner[_keyOwner];
    // Math: safeSub is not required since `hasValidKey` confirms timeRemaining is positive
    uint timeRemaining = key.expirationTimestamp - block.timestamp;
    if(timeRemaining + freeTrialLength >= expirationDuration) {
      refund = keyPrice;
    } else {
      // Math: using safeMul in case keyPrice or timeRemaining is very large
      refund = keyPrice.MUL946(timeRemaining) / expirationDuration;
    }

    // Apply the penalty if this is not a free trial
    if(freeTrialLength == 0 || timeRemaining + freeTrialLength < expirationDuration)
    {
      uint penalty = keyPrice.MUL946(refundPenaltyBasisPoints) / basis_points_den273;
      if (refund > penalty) {
        // Math: safeSub is not required since the if confirms this won't underflow
        refund -= penalty;
      } else {
        refund = 0;
      }
    }
  }
}

// File: @openzeppelin/contracts-ethereum-package/contracts/token/ERC721/IERC721Receiver.sol

pragma solidity ^0.5.0;

                                                                                                                                                        
contract IERC721Receiver {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function ONERC721RECEIVED103(address operator, address from, uint256 tokenId, bytes memory data)	//inject NONSTANDARD NAMING
    public returns (bytes4);
}

// File: contracts/mixins/MixinTransfer.sol

pragma solidity 0.5.17;









                                                                                                                                                                                                                                                                  

contract MixinTransfer is
  MixinLockManagerRole,
  MixinFunds,
  MixinLockCore,
  MixinKeys
{
  using SafeMath for uint;
  using Address for address;

  event TRANSFERFEECHANGED551(	//inject NONSTANDARD NAMING
    uint transferFeeBasisPoints
  );

  // 0x150b7a02 == bytes4(keccak256('onERC721Received(address,address,uint256,bytes)'))
  bytes4 private constant _erc721_received323 = 0x150b7a02;	//inject NONSTANDARD NAMING

  // The fee relative to keyPrice to charge when transfering a Key to another account
  // (potentially on a 0x marketplace).
  // This is calculated as `keyPrice * transferFeeBasisPoints / BASIS_POINTS_DEN`.
  uint public transferFeeBasisPoints;

                                                                                                                                                                                                                                                                                                     
  function SHAREKEY659(	//inject NONSTANDARD NAMING
    address _to,
    uint _tokenId,
    uint _timeShared
  ) public
    ONLYIFALIVE275
    ONLYKEYMANAGERORAPPROVED688(_tokenId)
  {
    require(transferFeeBasisPoints < basis_points_den273, 'KEY_TRANSFERS_DISABLED');
    require(_to != address(0), 'INVALID_ADDRESS');
    address keyOwner = _ownerOf[_tokenId];
    require(GETHASVALIDKEY803(keyOwner), 'KEY_NOT_VALID');
    Key storage fromKey = keyByOwner[keyOwner];
    Key storage toKey = keyByOwner[_to];
    uint idTo = toKey.tokenId;
    uint time;
    // get the remaining time for the origin key
    uint timeRemaining = fromKey.expirationTimestamp - block.timestamp;
    // get the transfer fee based on amount of time wanted share
    uint fee = GETTRANSFERFEE0(keyOwner, _timeShared);
    uint timePlusFee = _timeShared.ADD74(fee);

    // ensure that we don't try to share too much
    if(timePlusFee < timeRemaining) {
      // now we can safely set the time
      time = _timeShared;
      // deduct time from parent key, including transfer fee
      _TIMEMACHINE475(_tokenId, timePlusFee, false);
    } else {
      // we have to recalculate the fee here
      fee = GETTRANSFERFEE0(keyOwner, timeRemaining);
      time = timeRemaining - fee;
      fromKey.expirationTimestamp = block.timestamp; // Effectively expiring the key
      emit EXPIREKEY93(_tokenId);
    }

    if (idTo == 0) {
      _ASSIGNNEWTOKENID168(toKey);
      idTo = toKey.tokenId;
      _RECORDOWNER143(_to, idTo);
      emit TRANSFER76(
        address(0), // This is a creation or time-sharing
        _to,
        idTo
      );
    } else if (toKey.expirationTimestamp <= block.timestamp) {
      // reset the key Manager for expired keys
      _SETKEYMANAGEROF57(idTo, address(0));
    }

    // add time to new key
    _TIMEMACHINE475(idTo, time, true);
    // trigger event
    emit TRANSFER76(
      keyOwner,
      _to,
      idTo
    );

    require(_CHECKONERC721RECEIVED176(keyOwner, _to, _tokenId, ''), 'NON_COMPLIANT_ERC721_RECEIVER');
  }

  function TRANSFERFROM763(	//inject NONSTANDARD NAMING
    address _from,
    address _recipient,
    uint _tokenId
  )
    public
    ONLYIFALIVE275
    HASVALIDKEY427(_from)
    ONLYKEYMANAGERORAPPROVED688(_tokenId)
  {
    require(ISKEYOWNER633(_tokenId, _from), 'TRANSFER_FROM: NOT_KEY_OWNER');
    require(transferFeeBasisPoints < basis_points_den273, 'KEY_TRANSFERS_DISABLED');
    require(_recipient != address(0), 'INVALID_ADDRESS');
    uint fee = GETTRANSFERFEE0(_from, 0);

    Key storage fromKey = keyByOwner[_from];
    Key storage toKey = keyByOwner[_recipient];

    uint previousExpiration = toKey.expirationTimestamp;
    // subtract the fee from the senders key before the transfer
    _TIMEMACHINE475(_tokenId, fee, false);

    if (toKey.tokenId == 0) {
      toKey.tokenId = _tokenId;
      _RECORDOWNER143(_recipient, _tokenId);
      // Clear any previous approvals
      _CLEARAPPROVAL926(_tokenId);
    }

    if (previousExpiration <= block.timestamp) {
      // The recipient did not have a key, or had a key but it expired. The new expiration is the sender's key expiration
      // An expired key is no longer a valid key, so the new tokenID is the sender's tokenID
      toKey.expirationTimestamp = fromKey.expirationTimestamp;
      toKey.tokenId = _tokenId;

      // Reset the key Manager to the key owner
      _SETKEYMANAGEROF57(_tokenId, address(0));

      _RECORDOWNER143(_recipient, _tokenId);
    } else {
      // The recipient has a non expired key. We just add them the corresponding remaining time
      // SafeSub is not required since the if confirms `previousExpiration - block.timestamp` cannot underflow
      toKey.expirationTimestamp = fromKey
        .expirationTimestamp.ADD74(previousExpiration - block.timestamp);
    }

    // Effectively expiring the key for the previous owner
    fromKey.expirationTimestamp = block.timestamp;

    // Set the tokenID to 0 for the previous owner to avoid duplicates
    fromKey.tokenId = 0;

    // trigger event
    emit TRANSFER76(
      _from,
      _recipient,
      _tokenId
    );
  }

                                                                                                                                                                                                                                                                                                                                                  
  function SAFETRANSFERFROM818(	//inject NONSTANDARD NAMING
    address _from,
    address _to,
    uint _tokenId
  )
    public
  {
    SAFETRANSFERFROM818(_from, _to, _tokenId, '');
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function SAFETRANSFERFROM818(	//inject NONSTANDARD NAMING
    address _from,
    address _to,
    uint _tokenId,
    bytes memory _data
  )
    public
  {
    TRANSFERFROM763(_from, _to, _tokenId);
    require(_CHECKONERC721RECEIVED176(_from, _to, _tokenId, _data), 'NON_COMPLIANT_ERC721_RECEIVER');

  }

                                                                 
  function UPDATETRANSFERFEE701(	//inject NONSTANDARD NAMING
    uint _transferFeeBasisPoints
  )
    external
    ONLYLOCKMANAGER712
  {
    emit TRANSFERFEECHANGED551(
      _transferFeeBasisPoints
    );
    transferFeeBasisPoints = _transferFeeBasisPoints;
  }

                                                                                                                                                                                                                                                               
  function GETTRANSFERFEE0(	//inject NONSTANDARD NAMING
    address _keyOwner,
    uint _time
  )
    public view
    HASVALIDKEY427(_keyOwner)
    returns (uint)
  {
    Key storage key = keyByOwner[_keyOwner];
    uint timeToTransfer;
    uint fee;
    // Math: safeSub is not required since `hasValidKey` confirms timeToTransfer is positive
    // this is for standard key transfers
    if(_time == 0) {
      timeToTransfer = key.expirationTimestamp - block.timestamp;
    } else {
      timeToTransfer = _time;
    }
    fee = timeToTransfer.MUL946(transferFeeBasisPoints) / basis_points_den273;
    return fee;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function _CHECKONERC721RECEIVED176(	//inject NONSTANDARD NAMING
    address from,
    address to,
    uint256 tokenId,
    bytes memory _data
  )
    internal
    returns (bool)
  {
    if (!to.ISCONTRACT805()) {
      return true;
    }
    bytes4 retval = IERC721Receiver(to).ONERC721RECEIVED103(
      msg.sender, from, tokenId, _data);
    return (retval == _erc721_received323);
  }

}

// File: contracts/PublicLock.sol

pragma solidity 0.5.17;


















                                                                                                                                                                                                                                                                                                               
contract PublicLock is
  IPublicLock,
  Initializable,
  ERC165,
  MixinLockManagerRole,
  MixinKeyGranterRole,
  MixinSignatures,
  MixinFunds,
  MixinDisable,
  MixinLockCore,
  MixinKeys,
  MixinLockMetadata,
  MixinERC721Enumerable,
  MixinGrantKeys,
  MixinPurchase,
  MixinTransfer,
  MixinRefunds
{
  function INITIALIZE243(	//inject NONSTANDARD NAMING
    address _lockCreator,
    uint _expirationDuration,
    address _tokenAddress,
    uint _keyPrice,
    uint _maxNumberOfKeys,
    string memory _lockName
  ) public
    INITIALIZER90()
  {
    MixinFunds._INITIALIZEMIXINFUNDS749(_tokenAddress);
    MixinDisable._INITIALIZEMIXINDISABLE727();
    MixinLockCore._INITIALIZEMIXINLOCKCORE763(_lockCreator, _expirationDuration, _keyPrice, _maxNumberOfKeys);
    MixinLockMetadata._INITIALIZEMIXINLOCKMETADATA436(_lockName);
    MixinERC721Enumerable._INITIALIZEMIXINERC721ENUMERABLE861();
    MixinRefunds._INITIALIZEMIXINREFUNDS957();
    MixinLockManagerRole._INITIALIZEMIXINLOCKMANAGERROLE172(_lockCreator);
    MixinKeyGranterRole._INITIALIZEMIXINKEYGRANTERROLE428(_lockCreator);
    // registering the interface for erc721 with ERC165.sol using
    // the ID specified in the standard: https://eips.ethereum.org/EIPS/eip-721
    _REGISTERINTERFACE570(0x80ac58cd);
  }

                                                                                                                                                                          
  function() external payable {}
}