                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;

// File: @openzeppelin/contracts/math/SafeMath.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD655(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB978(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB978(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB978(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL321(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV964(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV964(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV964(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD177(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD177(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD177(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/GSN/Context.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER22() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA190() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED864(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER22();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED864(address(0), msgSender);
    }

                                                                     
    function OWNER842() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER832() {	//inject NONSTANDARD NAMING
        require(ISOWNER468(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER468() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER22() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP899() public ONLYOWNER832 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED864(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP928(address newOwner) public ONLYOWNER832 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP302(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP302(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED864(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY564() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF578(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER679(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE904(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE369(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM315(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER941(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL346(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/utils/Address.sol

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT799(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

                                                                                                                                                                                                          
    function TOPAYABLE729(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE141(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER44(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN885(token, abi.encodeWithSelector(token.TRANSFER679.selector, to, value));
    }

    function SAFETRANSFERFROM200(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN885(token, abi.encodeWithSelector(token.TRANSFERFROM315.selector, from, to, value));
    }

    function SAFEAPPROVE560(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE904(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN885(token, abi.encodeWithSelector(token.APPROVE369.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE938(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE904(address(this), spender).ADD655(value);
        CALLOPTIONALRETURN885(token, abi.encodeWithSelector(token.APPROVE369.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE722(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE904(address(this), spender).SUB978(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN885(token, abi.encodeWithSelector(token.APPROVE369.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN885(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT799(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: contracts/protocol/lib/BaseMath.sol

                                                                                                                       
library BaseMath {
    using SafeMath for uint256;

    // The number One in the BaseMath system.
    uint256 constant internal base362 = 10 ** 18;	//inject NONSTANDARD NAMING

                                                                                                  
    function BASE743()	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return base362;
    }

                                                                                        
    function BASEMUL577(	//inject NONSTANDARD NAMING
        uint256 value,
        uint256 baseValue
    )
        internal
        pure
        returns (uint256)
    {
        return value.MUL321(baseValue).DIV964(base362);
    }

                                                                                                                                                                                                                     
    function BASEDIVMUL204(	//inject NONSTANDARD NAMING
        uint256 value,
        uint256 baseValue
    )
        internal
        pure
        returns (uint256)
    {
        return value.DIV964(base362).MUL321(baseValue);
    }

                                                                                      
    function BASEMULROUNDUP619(	//inject NONSTANDARD NAMING
        uint256 value,
        uint256 baseValue
    )
        internal
        pure
        returns (uint256)
    {
        if (value == 0 || baseValue == 0) {
            return 0;
        }
        return value.MUL321(baseValue).SUB978(1).DIV964(base362).ADD655(1);
    }

                                                                                    
    function BASEDIV598(	//inject NONSTANDARD NAMING
        uint256 value,
        uint256 baseValue
    )
        internal
        pure
        returns (uint256)
    {
        return value.MUL321(base362).DIV964(baseValue);
    }

                                                                                                                                    
    function BASERECIPROCAL771(	//inject NONSTANDARD NAMING
        uint256 baseValue
    )
        internal
        pure
        returns (uint256)
    {
        return BASEDIV598(base362, baseValue);
    }
}

// File: contracts/protocol/lib/SignedMath.sol

                                                                                                               
library SignedMath {
    using SafeMath for uint256;

    // ============ Structs ============

    struct Int {
        uint256 value;
        bool isPositive;
    }

    // ============ Functions ============

                                                                                                            
    function ADD655(	//inject NONSTANDARD NAMING
        Int memory sint,
        uint256 value
    )
        internal
        pure
        returns (Int memory)
    {
        if (sint.isPositive) {
            return Int({
                value: value.ADD655(sint.value),
                isPositive: true
            });
        }
        if (sint.value < value) {
            return Int({
                value: value.SUB978(sint.value),
                isPositive: true
            });
        }
        return Int({
            value: sint.value.SUB978(value),
            isPositive: false
        });
    }

                                                                                                             
    function SUB978(	//inject NONSTANDARD NAMING
        Int memory sint,
        uint256 value
    )
        internal
        pure
        returns (Int memory)
    {
        if (!sint.isPositive) {
            return Int({
                value: value.ADD655(sint.value),
                isPositive: false
            });
        }
        if (sint.value > value) {
            return Int({
                value: sint.value.SUB978(value),
                isPositive: true
            });
        }
        return Int({
            value: value.SUB978(sint.value),
            isPositive: false
        });
    }

                                                                                                               
    function SIGNEDADD42(	//inject NONSTANDARD NAMING
        Int memory augend,
        Int memory addend
    )
        internal
        pure
        returns (Int memory)
    {
        return addend.isPositive
            ? ADD655(augend, addend.value)
            : SUB978(augend, addend.value);
    }

                                                                                                                
    function SIGNEDSUB919(	//inject NONSTANDARD NAMING
        Int memory minuend,
        Int memory subtrahend
    )
        internal
        pure
        returns (Int memory)
    {
        return subtrahend.isPositive
            ? SUB978(minuend, subtrahend.value)
            : ADD655(minuend, subtrahend.value);
    }

                                                                                                                   
    function GT31(	//inject NONSTANDARD NAMING
        Int memory a,
        Int memory b
    )
        internal
        pure
        returns (bool)
    {
        if (a.isPositive) {
            if (b.isPositive) {
                return a.value > b.value;
            } else {
                // True, unless both values are zero.
                return a.value != 0 || b.value != 0;
            }
        } else {
            if (b.isPositive) {
                return false;
            } else {
                return a.value < b.value;
            }
        }
    }

                                                                               
    function MIN587(	//inject NONSTANDARD NAMING
        Int memory a,
        Int memory b
    )
        internal
        pure
        returns (Int memory)
    {
        return GT31(b, a) ? a : b;
    }

                                                                               
    function MAX673(	//inject NONSTANDARD NAMING
        Int memory a,
        Int memory b
    )
        internal
        pure
        returns (Int memory)
    {
        return GT31(a, b) ? a : b;
    }
}

// File: contracts/protocol/v1/lib/P1Types.sol

                                                                                                            
library P1Types {
    // ============ Structs ============

                                                                                                                                                                
    struct Index {
        uint32 timestamp;
        bool isPositive;
        uint128 value;
    }

                                                                                                                 
    struct Balance {
        bool marginIsPositive;
        bool positionIsPositive;
        uint120 margin;
        uint120 position;
    }

                                                                                                              
    struct Context {
        uint256 price;
        uint256 minCollateral;
        Index index;
    }

                                                                                                                    
    struct TradeResult {
        uint256 marginAmount;
        uint256 positionAmount;
        bool isBuy; // From taker's perspective.
        bytes32 traderFlags;
    }
}

// File: contracts/protocol/v1/intf/I_PerpetualV1.sol

                                                                                        
interface I_PerpetualV1 {

    // ============ Structs ============

    struct TradeArg {
        uint256 takerIndex;
        uint256 makerIndex;
        address trader;
        bytes data;
    }

    // ============ State-Changing Functions ============

                                                                                                                                                                                                                                                   
    function TRADE767(	//inject NONSTANDARD NAMING
        address[] calldata accounts,
        TradeArg[] calldata trades
    )
        external;

                                                                                                                                                         
    function WITHDRAWFINALSETTLEMENT634()	//inject NONSTANDARD NAMING
        external;

                                                                                                                                                                                                                                             
    function DEPOSIT611(	//inject NONSTANDARD NAMING
        address account,
        uint256 amount
    )
        external;

                                                                                                                                                                                                                                                                                                                                           
    function WITHDRAW336(	//inject NONSTANDARD NAMING
        address account,
        address destination,
        uint256 amount
    )
        external;

                                                                                                                                                                                                                                                                                           
    function SETLOCALOPERATOR179(	//inject NONSTANDARD NAMING
        address operator,
        bool approved
    )
        external;

    // ============ Account Getters ============

                                                                                                                                                                                                                                                   
    function GETACCOUNTBALANCE427(	//inject NONSTANDARD NAMING
        address account
    )
        external
        view
        returns (P1Types.Balance memory);

                                                                                                                                                                                                                    
    function GETACCOUNTINDEX552(	//inject NONSTANDARD NAMING
        address account
    )
        external
        view
        returns (P1Types.Index memory);

                                                                                                                                                                                                                                                                                                                                                             
    function GETISLOCALOPERATOR250(	//inject NONSTANDARD NAMING
        address account,
        address operator
    )
        external
        view
        returns (bool);

    // ============ Global Getters ============

                                                                                                                                                                                                                                                     
    function GETISGLOBALOPERATOR122(	//inject NONSTANDARD NAMING
        address operator
    )
        external
        view
        returns (bool);

                                                                                                                                                            
    function GETTOKENCONTRACT477()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                                                                                     
    function GETORACLECONTRACT730()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                                                                         
    function GETFUNDERCONTRACT532()	//inject NONSTANDARD NAMING
        external
        view
        returns (address);

                                                                                                                                       
    function GETGLOBALINDEX162()	//inject NONSTANDARD NAMING
        external
        view
        returns (P1Types.Index memory);

                                                                                                                                                                                                                                  
    function GETMINCOLLATERAL485()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);

                                                                                                                                                                                   
    function GETFINALSETTLEMENTENABLED747()	//inject NONSTANDARD NAMING
        external
        view
        returns (bool);

    // ============ Public Getters ============

                                                                                                                                                                                                                                                                                                                                     
    function HASACCOUNTPERMISSIONS542(	//inject NONSTANDARD NAMING
        address account,
        address operator
    )
        external
        view
        returns (bool);

    // ============ Authorized Getters ============

                                                                                                                                                                                                   
    function GETORACLEPRICE378()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256);
}

// File: contracts/protocol/lib/SafeCast.sol

                                                                                                         
library SafeCast {

                                                                                                                                                                                                                                                                                                 
    function TOUINT128917(	//inject NONSTANDARD NAMING
        uint256 value
    )
        internal
        pure
        returns (uint128)
    {
        require(value < 2**128, "SafeCast: value doesn\'t fit in 128 bits");
        return uint128(value);
    }

                                                                                                                                                                                                                                                                                                 
    function TOUINT120899(	//inject NONSTANDARD NAMING
        uint256 value
    )
        internal
        pure
        returns (uint120)
    {
        require(value < 2**120, "SafeCast: value doesn\'t fit in 120 bits");
        return uint120(value);
    }

                                                                                                                                                                                                                                                                                             
    function TOUINT32866(	//inject NONSTANDARD NAMING
        uint256 value
    )
        internal
        pure
        returns (uint32)
    {
        require(value < 2**32, "SafeCast: value doesn\'t fit in 32 bits");
        return uint32(value);
    }
}

// File: contracts/protocol/v1/lib/P1BalanceMath.sol

                                                                                                            
library P1BalanceMath {
    using BaseMath for uint256;
    using SafeCast for uint256;
    using SafeMath for uint256;
    using SignedMath for SignedMath.Int;
    using P1BalanceMath for P1Types.Balance;

    // ============ Constants ============

    uint256 private constant flag_margin_is_positive858 = 1 << (8 * 31);	//inject NONSTANDARD NAMING
    uint256 private constant flag_position_is_positive823 = 1 << (8 * 15);	//inject NONSTANDARD NAMING

    // ============ Functions ============

                                                                
    function COPY388(	//inject NONSTANDARD NAMING
        P1Types.Balance memory balance
    )
        internal
        pure
        returns (P1Types.Balance memory)
    {
        return P1Types.Balance({
            marginIsPositive: balance.marginIsPositive,
            positionIsPositive: balance.positionIsPositive,
            margin: balance.margin,
            position: balance.position
        });
    }

                                                                  
    function ADDTOMARGIN109(	//inject NONSTANDARD NAMING
        P1Types.Balance memory balance,
        uint256 amount
    )
        internal
        pure
    {
        SignedMath.Int memory signedMargin = balance.GETMARGIN422();
        signedMargin = signedMargin.ADD655(amount);
        balance.SETMARGIN731(signedMargin);
    }

                                                                         
    function SUBFROMMARGIN144(	//inject NONSTANDARD NAMING
        P1Types.Balance memory balance,
        uint256 amount
    )
        internal
        pure
    {
        SignedMath.Int memory signedMargin = balance.GETMARGIN422();
        signedMargin = signedMargin.SUB978(amount);
        balance.SETMARGIN731(signedMargin);
    }

                                                                    
    function ADDTOPOSITION177(	//inject NONSTANDARD NAMING
        P1Types.Balance memory balance,
        uint256 amount
    )
        internal
        pure
    {
        SignedMath.Int memory signedPosition = balance.GETPOSITION848();
        signedPosition = signedPosition.ADD655(amount);
        balance.SETPOSITION680(signedPosition);
    }

                                                                           
    function SUBFROMPOSITION921(	//inject NONSTANDARD NAMING
        P1Types.Balance memory balance,
        uint256 amount
    )
        internal
        pure
    {
        SignedMath.Int memory signedPosition = balance.GETPOSITION848();
        signedPosition = signedPosition.SUB978(amount);
        balance.SETPOSITION680(signedPosition);
    }

                                                                                                                                                                                                                                                                                                   
    function GETPOSITIVEANDNEGATIVEVALUE842(	//inject NONSTANDARD NAMING
        P1Types.Balance memory balance,
        uint256 price
    )
        internal
        pure
        returns (uint256, uint256)
    {
        uint256 positiveValue = 0;
        uint256 negativeValue = 0;

        // add value of margin
        if (balance.marginIsPositive) {
            positiveValue = uint256(balance.margin).MUL321(BaseMath.BASE743());
        } else {
            negativeValue = uint256(balance.margin).MUL321(BaseMath.BASE743());
        }

        // add value of position
        uint256 positionValue = uint256(balance.position).MUL321(price);
        if (balance.positionIsPositive) {
            positiveValue = positiveValue.ADD655(positionValue);
        } else {
            negativeValue = negativeValue.ADD655(positionValue);
        }

        return (positiveValue, negativeValue);
    }

                                                                                                   
    function TOBYTES32151(	//inject NONSTANDARD NAMING
        P1Types.Balance memory balance
    )
        internal
        pure
        returns (bytes32)
    {
        uint256 result =
            uint256(balance.position)
            | (uint256(balance.margin) << 128)
            | (balance.marginIsPositive ? flag_margin_is_positive858 : 0)
            | (balance.positionIsPositive ? flag_position_is_positive823 : 0);
        return bytes32(result);
    }

    // ============ Helper Functions ============

                                                                                      
    function GETMARGIN422(	//inject NONSTANDARD NAMING
        P1Types.Balance memory balance
    )
        internal
        pure
        returns (SignedMath.Int memory)
    {
        return SignedMath.Int({
            value: balance.margin,
            isPositive: balance.marginIsPositive
        });
    }

                                                                                        
    function GETPOSITION848(	//inject NONSTANDARD NAMING
        P1Types.Balance memory balance
    )
        internal
        pure
        returns (SignedMath.Int memory)
    {
        return SignedMath.Int({
            value: balance.position,
            isPositive: balance.positionIsPositive
        });
    }

                                                                                 
    function SETMARGIN731(	//inject NONSTANDARD NAMING
        P1Types.Balance memory balance,
        SignedMath.Int memory newMargin
    )
        internal
        pure
    {
        balance.margin = newMargin.value.TOUINT120899();
        balance.marginIsPositive = newMargin.isPositive;
    }

                                                                                   
    function SETPOSITION680(	//inject NONSTANDARD NAMING
        P1Types.Balance memory balance,
        SignedMath.Int memory newPosition
    )
        internal
        pure
    {
        balance.position = newPosition.value.TOUINT120899();
        balance.positionIsPositive = newPosition.isPositive;
    }
}

// File: contracts/protocol/v1/proxies/P1LiquidatorProxy.sol

                                                                                                                                                                                       
contract P1LiquidatorProxy is
    Ownable
{
    using BaseMath for uint256;
    using SafeMath for uint256;
    using SignedMath for SignedMath.Int;
    using P1BalanceMath for P1Types.Balance;
    using SafeERC20 for IERC20;

    // ============ Events ============

    event LOGLIQUIDATORPROXYUSED719(	//inject NONSTANDARD NAMING
        address indexed liquidatee,
        address indexed liquidator,
        bool isBuy,
        uint256 liquidationAmount,
        uint256 feeAmount
    );

    event LOGINSURANCEFUNDSET4(	//inject NONSTANDARD NAMING
        address insuranceFund
    );

    event LOGINSURANCEFEESET507(	//inject NONSTANDARD NAMING
        uint256 insuranceFee
    );

    // ============ Immutable Storage ============

    // Address of the perpetual contract.
    address public _PERPETUAL_V1_;

    // Address of the P1Liquidation contract.
    address public _LIQUIDATION_;

    // ============ Mutable Storage ============

    // Address of the insurance fund.
    address public _INSURANCE_FUND_;

    // Proportion of liquidation profits that is directed to the insurance fund.
    // This number is represented as a fixed-point number with 18 decimals.
    uint256 public _INSURANCE_FEE_;

    // ============ Constructor ============

    constructor (
        address perpetualV1,
        address liquidator,
        address insuranceFund,
        uint256 insuranceFee
    )
        public
    {
        _PERPETUAL_V1_ = perpetualV1;
        _LIQUIDATION_ = liquidator;
        _INSURANCE_FUND_ = insuranceFund;
        _INSURANCE_FEE_ = insuranceFee;

        emit LOGINSURANCEFUNDSET4(insuranceFund);
        emit LOGINSURANCEFEESET507(insuranceFee);
    }

    // ============ External Functions ============

                                                                                                                                                                                                          
    function APPROVEMAXIMUMONPERPETUAL191()	//inject NONSTANDARD NAMING
        external
    {
        address perpetual = _PERPETUAL_V1_;
        IERC20 tokenContract = IERC20(I_PerpetualV1(perpetual).GETTOKENCONTRACT477());

        // safeApprove requires unsetting the allowance first.
        tokenContract.SAFEAPPROVE560(perpetual, 0);

        // Set the allowance to the highest possible value.
        tokenContract.SAFEAPPROVE560(perpetual, uint256(-1));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function LIQUIDATE282(	//inject NONSTANDARD NAMING
        address liquidatee,
        address liquidator,
        bool isBuy,
        SignedMath.Int calldata maxPosition
    )
        external
        returns (uint256)
    {
        I_PerpetualV1 perpetual = I_PerpetualV1(_PERPETUAL_V1_);

        // Verify that this account can liquidate for the liquidator.
        require(
            liquidator == msg.sender || perpetual.HASACCOUNTPERMISSIONS542(liquidator, msg.sender),
            "msg.sender cannot operate the liquidator account"
        );

        // Settle the liquidator's account and get balances.
        perpetual.DEPOSIT611(liquidator, 0);
        P1Types.Balance memory initialBalance = perpetual.GETACCOUNTBALANCE427(liquidator);

        // Get the maximum liquidatable amount.
        SignedMath.Int memory maxPositionDelta = _GETMAXPOSITIONDELTA24(
            initialBalance,
            isBuy,
            maxPosition
        );

        // Do the liquidation.
        _DOLIQUIDATION720(
            perpetual,
            liquidatee,
            liquidator,
            maxPositionDelta
        );

        // Get the balances of the liquidator.
        P1Types.Balance memory currentBalance = perpetual.GETACCOUNTBALANCE427(liquidator);

        // Get the liquidated amount and fee amount.
        (uint256 liqAmount, uint256 feeAmount) = _GETLIQUIDATEDANDFEEAMOUNT582(
            perpetual,
            initialBalance,
            currentBalance
        );

        // Transfer fee from liquidator to insurance fund.
        if (feeAmount > 0) {
            perpetual.WITHDRAW336(liquidator, address(this), feeAmount);
            perpetual.DEPOSIT611(_INSURANCE_FUND_, feeAmount);
        }

        // Log the result.
        emit LOGLIQUIDATORPROXYUSED719(
            liquidatee,
            liquidator,
            isBuy,
            liqAmount,
            feeAmount
        );

        return liqAmount;
    }

    // ============ Admin Functions ============

                                                                                                                                                                                                   
    function SETINSURANCEFUND633(	//inject NONSTANDARD NAMING
        address insuranceFund
    )
        external
        ONLYOWNER832
    {
        _INSURANCE_FUND_ = insuranceFund;
        emit LOGINSURANCEFUNDSET4(insuranceFund);
    }

                                                                                                                                                                                                                      
    function SETINSURANCEFEE522(	//inject NONSTANDARD NAMING
        uint256 insuranceFee
    )
        external
        ONLYOWNER832
    {
        require(
            insuranceFee <= BaseMath.BASE743().DIV964(2),
            "insuranceFee cannot be greater than 50%"
        );
        _INSURANCE_FEE_ = insuranceFee;
        emit LOGINSURANCEFEESET507(insuranceFee);
    }

    // ============ Helper Functions ============

                                                                                                                  
    function _GETMAXPOSITIONDELTA24(	//inject NONSTANDARD NAMING
        P1Types.Balance memory initialBalance,
        bool isBuy,
        SignedMath.Int memory maxPosition
    )
        private
        pure
        returns (SignedMath.Int memory)
    {
        SignedMath.Int memory result = maxPosition.SIGNEDSUB919(initialBalance.GETPOSITION848());

        require(
            result.isPositive == isBuy && result.value > 0,
            "Cannot liquidate if it would put liquidator past the specified maxPosition"
        );

        return result;
    }

                                                                                                                                 
    function _DOLIQUIDATION720(	//inject NONSTANDARD NAMING
        I_PerpetualV1 perpetual,
        address liquidatee,
        address liquidator,
        SignedMath.Int memory maxPositionDelta
    )
        private
    {
        // Create accounts. Base protocol requires accounts to be sorted.
        bool takerFirst = liquidator < liquidatee;
        address[] memory accounts = new address[](2);
        uint256 takerIndex = takerFirst ? 0 : 1;
        uint256 makerIndex = takerFirst ? 1 : 0;
        accounts[takerIndex] = liquidator;
        accounts[makerIndex] = liquidatee;

        // Create trade args.
        I_PerpetualV1.TradeArg[] memory trades = new I_PerpetualV1.TradeArg[](1);
        trades[0] = I_PerpetualV1.TradeArg({
            takerIndex: takerIndex,
            makerIndex: makerIndex,
            trader: _LIQUIDATION_,
            data: abi.encode(
                maxPositionDelta.value,
                maxPositionDelta.isPositive,
                false // allOrNothing
            )
        });

        // Do the liquidation.
        perpetual.TRADE767(accounts, trades);
    }

                                                                                                                                                                                                                                                     
    function _GETLIQUIDATEDANDFEEAMOUNT582(	//inject NONSTANDARD NAMING
        I_PerpetualV1 perpetual,
        P1Types.Balance memory initialBalance,
        P1Types.Balance memory currentBalance
    )
        private
        view
        returns (uint256, uint256)
    {
        // Get the change in the position and margin of the liquidator.
        SignedMath.Int memory deltaPosition =
            currentBalance.GETPOSITION848().SIGNEDSUB919(initialBalance.GETPOSITION848());
        SignedMath.Int memory deltaMargin =
            currentBalance.GETMARGIN422().SIGNEDSUB919(initialBalance.GETMARGIN422());

        // Get the change in the balances of the liquidator.
        P1Types.Balance memory deltaBalance;
        deltaBalance.SETPOSITION680(deltaPosition);
        deltaBalance.SETMARGIN731(deltaMargin);

        // Get the positive and negative value taken by the liquidator.
        uint256 price = perpetual.GETORACLEPRICE378();
        (uint256 posValue, uint256 negValue) = deltaBalance.GETPOSITIVEANDNEGATIVEVALUE842(price);

        // Calculate the fee amount based on the liquidation profit.
        uint256 feeAmount = posValue > negValue
            ? posValue.SUB978(negValue).BASEMUL577(_INSURANCE_FEE_).DIV964(BaseMath.BASE743())
            : 0;

        return (deltaPosition.value, feeAmount);
    }
}