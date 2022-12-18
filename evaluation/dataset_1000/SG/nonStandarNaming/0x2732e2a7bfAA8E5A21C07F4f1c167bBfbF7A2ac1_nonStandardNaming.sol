                                                                 

pragma solidity 0.5.16;


interface IAaveAToken {

                                                                                                                                                                                                           
    function REDEEM179(uint256 _amount) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                
    function BALANCEOF892(address _user) external view returns(uint256);	//inject NONSTANDARD NAMING
}

interface IAaveLendingPool {

                                                                                                                                                                                                                                                                                                                                                        
    function DEPOSIT780(address _reserve, uint256 _amount, uint16 _referralCode) external;	//inject NONSTANDARD NAMING

}

interface ILendingPoolAddressesProvider {

                                                                                                                                                  
    function GETLENDINGPOOL234() external view returns (address);	//inject NONSTANDARD NAMING

                                                                                                                                                 
    function GETLENDINGPOOLCORE989() external view returns (address payable);	//inject NONSTANDARD NAMING

}

interface IPlatformIntegration {

                                                                                                                                                     
    function DEPOSIT780(address _bAsset, uint256 _amount, bool isTokenFeeCharged)	//inject NONSTANDARD NAMING
        external returns (uint256 quantityDeposited);

                                                                       
    function WITHDRAW280(address _receiver, address _bAsset, uint256 _amount, bool _isTokenFeeCharged) external;	//inject NONSTANDARD NAMING

                                                                           
    function CHECKBALANCE402(address _bAsset) external returns (uint256 balance);	//inject NONSTANDARD NAMING
}

contract InitializableModuleKeys {

    // Governance
    bytes32 internal KEY_GOVERNANCE;
    bytes32 internal KEY_STAKING;
    bytes32 internal KEY_PROXY_ADMIN;

    // mStable
    bytes32 internal KEY_ORACLE_HUB;
    bytes32 internal KEY_MANAGER;
    bytes32 internal KEY_RECOLLATERALISER;
    bytes32 internal KEY_META_TOKEN;
    bytes32 internal KEY_SAVINGS_MANAGER;

                                                                                                                                                                                   
    function _INITIALIZE43() internal {	//inject NONSTANDARD NAMING
        // keccak256() values are evaluated only once at the time of this function call.
        // Hence, no need to assign hard-coded values to these variables.
        KEY_GOVERNANCE = keccak256("Governance");
        KEY_STAKING = keccak256("Staking");
        KEY_PROXY_ADMIN = keccak256("ProxyAdmin");

        KEY_ORACLE_HUB = keccak256("OracleHub");
        KEY_MANAGER = keccak256("Manager");
        KEY_RECOLLATERALISER = keccak256("Recollateraliser");
        KEY_META_TOKEN = keccak256("MetaToken");
        KEY_SAVINGS_MANAGER = keccak256("SavingsManager");
    }
}

interface INexus {
    function GOVERNOR524() external view returns (address);	//inject NONSTANDARD NAMING
    function GETMODULE554(bytes32 key) external view returns (address);	//inject NONSTANDARD NAMING

    function PROPOSEMODULE660(bytes32 _key, address _addr) external;	//inject NONSTANDARD NAMING
    function CANCELPROPOSEDMODULE707(bytes32 _key) external;	//inject NONSTANDARD NAMING
    function ACCEPTPROPOSEDMODULE941(bytes32 _key) external;	//inject NONSTANDARD NAMING
    function ACCEPTPROPOSEDMODULES657(bytes32[] calldata _keys) external;	//inject NONSTANDARD NAMING

    function REQUESTLOCKMODULE469(bytes32 _key) external;	//inject NONSTANDARD NAMING
    function CANCELLOCKMODULE550(bytes32 _key) external;	//inject NONSTANDARD NAMING
    function LOCKMODULE482(bytes32 _key) external;	//inject NONSTANDARD NAMING
}

contract InitializableModule is InitializableModuleKeys {

    INexus public nexus;

                                                                                    
    modifier ONLYGOVERNOR94() {	//inject NONSTANDARD NAMING
        require(msg.sender == _GOVERNOR865(), "Only governor can execute");
        _;
    }

                                                                                                                                                               
    modifier ONLYGOVERNANCE614() {	//inject NONSTANDARD NAMING
        require(
            msg.sender == _GOVERNOR865() || msg.sender == _GOVERNANCE658(),
            "Only governance can execute"
        );
        _;
    }

                                                                                      
    modifier ONLYPROXYADMIN938() {	//inject NONSTANDARD NAMING
        require(
            msg.sender == _PROXYADMIN822(), "Only ProxyAdmin can execute"
        );
        _;
    }

                                                                                   
    modifier ONLYMANAGER267() {	//inject NONSTANDARD NAMING
        require(msg.sender == _MANAGER164(), "Only manager can execute");
        _;
    }

                                                                                                                              
    function _INITIALIZE43(address _nexus) internal {	//inject NONSTANDARD NAMING
        require(_nexus != address(0), "Nexus address is zero");
        nexus = INexus(_nexus);
        InitializableModuleKeys._INITIALIZE43();
    }

                                                                                                               
    function _GOVERNOR865() internal view returns (address) {	//inject NONSTANDARD NAMING
        return nexus.GOVERNOR524();
    }

                                                                                                                               
    function _GOVERNANCE658() internal view returns (address) {	//inject NONSTANDARD NAMING
        return nexus.GETMODULE554(KEY_GOVERNANCE);
    }

                                                                                                                              
    function _STAKING863() internal view returns (address) {	//inject NONSTANDARD NAMING
        return nexus.GETMODULE554(KEY_STAKING);
    }

                                                                                                                                    
    function _PROXYADMIN822() internal view returns (address) {	//inject NONSTANDARD NAMING
        return nexus.GETMODULE554(KEY_PROXY_ADMIN);
    }

                                                                                                                                  
    function _METATOKEN793() internal view returns (address) {	//inject NONSTANDARD NAMING
        return nexus.GETMODULE554(KEY_META_TOKEN);
    }

                                                                                                                                  
    function _ORACLEHUB825() internal view returns (address) {	//inject NONSTANDARD NAMING
        return nexus.GETMODULE554(KEY_ORACLE_HUB);
    }

                                                                                                                              
    function _MANAGER164() internal view returns (address) {	//inject NONSTANDARD NAMING
        return nexus.GETMODULE554(KEY_MANAGER);
    }

                                                                                                                                            
    function _SAVINGSMANAGER219() internal view returns (address) {	//inject NONSTANDARD NAMING
        return nexus.GETMODULE554(KEY_SAVINGS_MANAGER);
    }

                                                                                                                                                           
    function _RECOLLATERALISER172() internal view returns (address) {	//inject NONSTANDARD NAMING
        return nexus.GETMODULE554(KEY_RECOLLATERALISER);
    }
}

contract InitializableGovernableWhitelist is InitializableModule {

    event WHITELISTED183(address indexed _address);	//inject NONSTANDARD NAMING

    mapping(address => bool) public whitelist;

                                                                                               
    modifier ONLYWHITELISTED100() {	//inject NONSTANDARD NAMING
        require(whitelist[msg.sender], "Not a whitelisted address");
        _;
    }

                                                                                                                                                                                         
    function _INITIALIZE43(	//inject NONSTANDARD NAMING
        address _nexus,
        address[] memory _whitelisted
    )
        internal
    {
        InitializableModule._INITIALIZE43(_nexus);

        require(_whitelisted.length > 0, "Empty whitelist array");

        for(uint256 i = 0; i < _whitelisted.length; i++) {
            _ADDWHITELIST295(_whitelisted[i]);
        }
    }

                                                                                                           
    function _ADDWHITELIST295(address _address) internal {	//inject NONSTANDARD NAMING
        require(_address != address(0), "Address is zero");
        require(! whitelist[_address], "Already whitelisted");

        whitelist[_address] = true;

        emit WHITELISTED183(_address);
    }

}

contract Initializable {

                                                                       
  bool private initialized;

                                                                                         
  bool private initializing;

                                                                                
  modifier INITIALIZER32() {	//inject NONSTANDARD NAMING
    require(initializing || ISCONSTRUCTOR204() || !initialized, "Contract instance has already been initialized");

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

                                                                                 
  function ISCONSTRUCTOR204() private view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD579(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB616(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB616(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB616(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL196(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV339(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV339(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV339(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD570(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD570(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD570(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                
library StableMath {

    using SafeMath for uint256;

                                                                                                                                 
    uint256 private constant full_scale546 = 1e18;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                     
    uint256 private constant ratio_scale475 = 1e8;	//inject NONSTANDARD NAMING

                                                                                                                      
    function GETFULLSCALE346() internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return full_scale546;
    }

                                                                                                                      
    function GETRATIOSCALE794() internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return ratio_scale475;
    }

                                                                                                                                                                                
    function SCALEINTEGER45(uint256 x)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return x.MUL196(full_scale546);
    }

                                                                                                                           

                                                                                                                                                                                                                                                                                                                                      
    function MULTRUNCATE987(uint256 x, uint256 y)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return MULTRUNCATESCALE15(x, y, full_scale546);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function MULTRUNCATESCALE15(uint256 x, uint256 y, uint256 scale)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        uint256 z = x.MUL196(y);
        return z.DIV339(scale);
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function MULTRUNCATECEIL949(uint256 x, uint256 y)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        uint256 scaled = x.MUL196(y);
        uint256 ceil = scaled.ADD579(full_scale546.SUB616(1));
        return ceil.DIV339(full_scale546);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIVPRECISELY580(uint256 x, uint256 y)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        uint256 z = x.MUL196(full_scale546);
        return z.DIV339(y);
    }


                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                         
    function MULRATIOTRUNCATE511(uint256 x, uint256 ratio)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256 c)
    {
        return MULTRUNCATESCALE15(x, ratio, ratio_scale475);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                               
    function MULRATIOTRUNCATECEIL167(uint256 x, uint256 ratio)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        uint256 scaled = x.MUL196(ratio);
        uint256 ceil = scaled.ADD579(ratio_scale475.SUB616(1));
        return ceil.DIV339(ratio_scale475);
    }


                                                                                                                                                                                                                                                                                                                                                                                                     
    function DIVRATIOPRECISELY338(uint256 x, uint256 ratio)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256 c)
    {
        uint256 y = x.MUL196(ratio_scale475);
        return y.DIV339(ratio);
    }

                                                                                                                      

                                                                                                                                                                                    
    function MIN73(uint256 x, uint256 y)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return x > y ? y : x;
    }

                                                                                                                                                                                    
    function MAX255(uint256 x, uint256 y)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return x > y ? x : y;
    }

                                                                                                                                                                                                                                          
    function CLAMP837(uint256 x, uint256 upperBound)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return x > upperBound ? upperBound : x;
    }
}

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY804() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF892(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER781(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE681(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE825(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM318(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER741(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL207(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function ISCONTRACT167(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

                                                                                                                                                                                                          
    function TOPAYABLE560(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE941(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER775(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN529(token, abi.encodeWithSelector(token.TRANSFER781.selector, to, value));
    }

    function SAFETRANSFERFROM175(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN529(token, abi.encodeWithSelector(token.TRANSFERFROM318.selector, from, to, value));
    }

    function SAFEAPPROVE285(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE681(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN529(token, abi.encodeWithSelector(token.APPROVE825.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE946(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE681(address(this), spender).ADD579(value);
        CALLOPTIONALRETURN529(token, abi.encodeWithSelector(token.APPROVE825.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE834(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE681(address(this), spender).SUB616(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN529(token, abi.encodeWithSelector(token.APPROVE825.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN529(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT167(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

library MassetHelpers {

    using StableMath for uint256;
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    function TRANSFERTOKENS141(	//inject NONSTANDARD NAMING
        address _sender,
        address _recipient,
        address _basset,
        bool _erc20TransferFeeCharged,
        uint256 _qty
    )
        internal
        returns (uint256 receivedQty)
    {
        receivedQty = _qty;
        if(_erc20TransferFeeCharged) {
            uint256 balBefore = IERC20(_basset).BALANCEOF892(_recipient);
            IERC20(_basset).SAFETRANSFERFROM175(_sender, _recipient, _qty);
            uint256 balAfter = IERC20(_basset).BALANCEOF892(_recipient);
            receivedQty = StableMath.MIN73(_qty, balAfter.SUB616(balBefore));
        } else {
            IERC20(_basset).SAFETRANSFERFROM175(_sender, _recipient, _qty);
        }
    }

    function SAFEINFINITEAPPROVE1000(address _asset, address _spender)	//inject NONSTANDARD NAMING
        internal
    {
        IERC20(_asset).SAFEAPPROVE285(_spender, 0);
        IERC20(_asset).SAFEAPPROVE285(_spender, uint256(-1));
    }
}

contract InitializableReentrancyGuard {
    bool private _notEntered;

    function _INITIALIZE43() internal {	//inject NONSTANDARD NAMING
        // Storing an initial non-zero value makes deployment a bit more
        // expensive, but in exchange the refund on every call to nonReentrant
        // will be lower in amount. Since refunds are capped to a percetange of
        // the total transaction's gas, it is best to keep them low in cases
        // like this one, to increase the likelihood of the full refund coming
        // into effect.
        _notEntered = true;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT200() {	//inject NONSTANDARD NAMING
        // On the first call to nonReentrant, _notEntered will be true
        require(_notEntered, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _notEntered = false;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _notEntered = true;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                               
contract InitializableAbstractIntegration is
    Initializable,
    IPlatformIntegration,
    InitializableGovernableWhitelist,
    InitializableReentrancyGuard
{

    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    event PTOKENADDED619(address indexed _bAsset, address _pToken);	//inject NONSTANDARD NAMING

    event DEPOSIT430(address indexed _bAsset, address _pToken, uint256 _amount);	//inject NONSTANDARD NAMING
    event WITHDRAWAL736(address indexed _bAsset, address _pToken, uint256 _amount);	//inject NONSTANDARD NAMING

    // Core address for the given platform */
    address public platformAddress;

    // bAsset => pToken (Platform Specific Token Address)
    mapping(address => address) public bAssetToPToken;
    // Full list of all bAssets supported here
    address[] internal bAssetsMapped;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function INITIALIZE9(	//inject NONSTANDARD NAMING
        address _nexus,
        address[] calldata _whitelisted,
        address _platformAddress,
        address[] calldata _bAssets,
        address[] calldata _pTokens
    )
        external
        INITIALIZER32
    {
        InitializableReentrancyGuard._INITIALIZE43();
        InitializableGovernableWhitelist._INITIALIZE43(_nexus, _whitelisted);
        InitializableAbstractIntegration._INITIALIZE43(_platformAddress, _bAssets, _pTokens);
    }

                                                                                                                                                                                                                                                                                                 
    function _INITIALIZE43(	//inject NONSTANDARD NAMING
        address _platformAddress,
        address[] memory _bAssets,
        address[] memory _pTokens
    )
        internal
    {
        platformAddress = _platformAddress;

        uint256 bAssetCount = _bAssets.length;
        require(bAssetCount == _pTokens.length, "Invalid input arrays");
        for(uint256 i = 0; i < bAssetCount; i++){
            _SETPTOKENADDRESS315(_bAssets[i], _pTokens[i]);
        }
    }

                                                                                                                     

                                                                                                                                                                                                                                                                      
    function SETPTOKENADDRESS117(address _bAsset, address _pToken)	//inject NONSTANDARD NAMING
        external
        ONLYGOVERNOR94
    {
        _SETPTOKENADDRESS315(_bAsset, _pToken);
    }

                                                                                                                                                                                                                                                                                                                        
    function _SETPTOKENADDRESS315(address _bAsset, address _pToken)	//inject NONSTANDARD NAMING
        internal
    {
        require(bAssetToPToken[_bAsset] == address(0), "pToken already set");
        require(_bAsset != address(0) && _pToken != address(0), "Invalid addresses");

        bAssetToPToken[_bAsset] = _pToken;
        bAssetsMapped.push(_bAsset);

        emit PTOKENADDED619(_bAsset, _pToken);

        _ABSTRACTSETPTOKEN588(_bAsset, _pToken);
    }

    function _ABSTRACTSETPTOKEN588(address _bAsset, address _pToken) internal;	//inject NONSTANDARD NAMING

    function REAPPROVEALLTOKENS317() external;	//inject NONSTANDARD NAMING

                                                                                                                       

                                                                                                                                                                                                                                                                                                                                                                           
    function DEPOSIT780(address _bAsset, uint256 _amount, bool _isTokenFeeCharged)	//inject NONSTANDARD NAMING
        external returns (uint256 quantityDeposited);

                                                                                                                                                                                                                                                                                                                                                                  
    function WITHDRAW280(address _receiver, address _bAsset, uint256 _amount, bool _isTokenFeeCharged) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                     
    function CHECKBALANCE402(address _bAsset) external returns (uint256 balance);	//inject NONSTANDARD NAMING

                                                                                                                      

                                                                           
    function _MIN977(uint256 x, uint256 y)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return x > y ? y : x;
    }
}

                                                                                                                                                                                                           
contract AaveIntegration is InitializableAbstractIntegration {

                                                                                                                   

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DEPOSIT780(	//inject NONSTANDARD NAMING
        address _bAsset,
        uint256 _amount,
        bool _isTokenFeeCharged
    )
        external
        ONLYWHITELISTED100
        NONREENTRANT200
        returns (uint256 quantityDeposited)
    {
        require(_amount > 0, "Must deposit something");
        // Get the Target token
        IAaveAToken aToken = _GETATOKENFOR579(_bAsset);

        // We should have been sent this amount, if not, the deposit will fail
        quantityDeposited = _amount;

        uint16 referralCode = 36; // temp code

        if(_isTokenFeeCharged) {
            // If we charge a fee, account for it
            uint256 prevBal = _CHECKBALANCE107(aToken);
            _GETLENDINGPOOL191().DEPOSIT780(_bAsset, _amount, referralCode);
            uint256 newBal = _CHECKBALANCE107(aToken);
            quantityDeposited = _MIN977(quantityDeposited, newBal.SUB616(prevBal));
        } else {
            // aTokens are 1:1 for each asset
            _GETLENDINGPOOL191().DEPOSIT780(_bAsset, _amount, referralCode);
        }

        emit DEPOSIT430(_bAsset, address(aToken), quantityDeposited);
    }

                                                                                                                                                                                                                                                                                                                                                 
    function WITHDRAW280(	//inject NONSTANDARD NAMING
        address _receiver,
        address _bAsset,
        uint256 _amount,
        bool _isTokenFeeCharged
    )
        external
        ONLYWHITELISTED100
        NONREENTRANT200
    {
        require(_amount > 0, "Must withdraw something");
        // Get the Target token
        IAaveAToken aToken = _GETATOKENFOR579(_bAsset);

        uint256 quantityWithdrawn = _amount;

        // Don't need to Approve aToken, as it gets burned in redeem()
        if(_isTokenFeeCharged) {
            IERC20 b = IERC20(_bAsset);
            uint256 prevBal = b.BALANCEOF892(address(this));
            aToken.REDEEM179(_amount);
            uint256 newBal = b.BALANCEOF892(address(this));
            quantityWithdrawn = _MIN977(quantityWithdrawn, newBal.SUB616(prevBal));
        } else {
            aToken.REDEEM179(_amount);
        }

        // Send redeemed bAsset to the receiver
        IERC20(_bAsset).SAFETRANSFER775(_receiver, quantityWithdrawn);

        emit WITHDRAWAL736(_bAsset, address(aToken), quantityWithdrawn);
    }

                                                                                                                                                                                                                                                                                                                                                                         
    function CHECKBALANCE402(address _bAsset)	//inject NONSTANDARD NAMING
        external
        returns (uint256 balance)
    {
        // balance is always with token aToken decimals
        IAaveAToken aToken = _GETATOKENFOR579(_bAsset);
        return _CHECKBALANCE107(aToken);
    }

                                                                                                                        

                                                                                                                                                                                                                                          
    function REAPPROVEALLTOKENS317()	//inject NONSTANDARD NAMING
        external
        ONLYGOVERNOR94
    {
        uint256 bAssetCount = bAssetsMapped.length;
        address lendingPoolVault = _GETLENDINGPOOLCORE347();
        // approve the pool to spend the bAsset
        for(uint i = 0; i < bAssetCount; i++){
            MassetHelpers.SAFEINFINITEAPPROVE1000(bAssetsMapped[i], lendingPoolVault);
        }
    }

                                                                                                                                                                                                                                                                               
    function _ABSTRACTSETPTOKEN588(address _bAsset, address            )	//inject NONSTANDARD NAMING
        internal
    {
        address lendingPoolVault = _GETLENDINGPOOLCORE347();
        // approve the pool to spend the bAsset
        MassetHelpers.SAFEINFINITEAPPROVE1000(_bAsset, lendingPoolVault);
    }

                                                                                                                      

                                                                                                                                                                                
    function _GETLENDINGPOOL191()	//inject NONSTANDARD NAMING
        internal
        view
        returns (IAaveLendingPool)
    {
        address lendingPool = ILendingPoolAddressesProvider(platformAddress).GETLENDINGPOOL234();
        require(lendingPool != address(0), "Lending pool does not exist");
        return IAaveLendingPool(lendingPool);
    }

                                                                                                                                                                                                 
    function _GETLENDINGPOOLCORE347()	//inject NONSTANDARD NAMING
        internal
        view
        returns (address payable)
    {
        address payable lendingPoolCore = ILendingPoolAddressesProvider(platformAddress).GETLENDINGPOOLCORE989();
        require(lendingPoolCore != address(uint160(address(0))), "Lending pool core does not exist");
        return lendingPoolCore;
    }

                                                                                                                                                                                                                                                                                                            
    function _GETATOKENFOR579(address _bAsset)	//inject NONSTANDARD NAMING
        internal
        view
        returns (IAaveAToken)
    {
        address aToken = bAssetToPToken[_bAsset];
        require(aToken != address(0), "aToken does not exist");
        return IAaveAToken(aToken);
    }

                                                                                                                                                                                                           
    function _CHECKBALANCE107(IAaveAToken _aToken)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256 balance)
    {
        return _aToken.BALANCEOF892(address(this));
    }
}