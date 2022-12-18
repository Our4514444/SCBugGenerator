                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;

// File: @openzeppelin/contracts/math/SafeMath.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD736(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB877(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB877(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB877(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL349(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV656(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV656(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV656(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD334(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD334(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD334(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

    function _MSGSENDER309() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA829() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED344(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER309();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED344(address(0), msgSender);
    }

                                                                     
    function OWNER420() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER322() {	//inject NONSTANDARD NAMING
        require(ISOWNER549(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER549() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER309() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP596() public ONLYOWNER322 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED344(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP13(address newOwner) public ONLYOWNER322 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP674(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP674(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED344(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/protocol/lib/BaseMath.sol

                                                                                                                       
library BaseMath {
    using SafeMath for uint256;

    // The number One in the BaseMath system.
    uint256 constant internal base831 = 10 ** 18;	//inject NONSTANDARD NAMING

                                                                                                  
    function BASE775()	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        return base831;
    }

                                                                                        
    function BASEMUL317(	//inject NONSTANDARD NAMING
        uint256 value,
        uint256 baseValue
    )
        internal
        pure
        returns (uint256)
    {
        return value.MUL349(baseValue).DIV656(base831);
    }

                                                                                                                                                                                                                     
    function BASEDIVMUL910(	//inject NONSTANDARD NAMING
        uint256 value,
        uint256 baseValue
    )
        internal
        pure
        returns (uint256)
    {
        return value.DIV656(base831).MUL349(baseValue);
    }

                                                                                      
    function BASEMULROUNDUP296(	//inject NONSTANDARD NAMING
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
        return value.MUL349(baseValue).SUB877(1).DIV656(base831).ADD736(1);
    }

                                                                                    
    function BASEDIV791(	//inject NONSTANDARD NAMING
        uint256 value,
        uint256 baseValue
    )
        internal
        pure
        returns (uint256)
    {
        return value.MUL349(base831).DIV656(baseValue);
    }

                                                                                                                                    
    function BASERECIPROCAL725(	//inject NONSTANDARD NAMING
        uint256 baseValue
    )
        internal
        pure
        returns (uint256)
    {
        return BASEDIV791(base831, baseValue);
    }
}

// File: contracts/protocol/lib/Math.sol

                                                                                          
library Math {
    using SafeMath for uint256;

    // ============ Library Functions ============

                                                                                    
    function GETFRACTION529(	//inject NONSTANDARD NAMING
        uint256 target,
        uint256 numerator,
        uint256 denominator
    )
        internal
        pure
        returns (uint256)
    {
        return target.MUL349(numerator).DIV656(denominator);
    }

                                                                                  
    function GETFRACTIONROUNDUP809(	//inject NONSTANDARD NAMING
        uint256 target,
        uint256 numerator,
        uint256 denominator
    )
        internal
        pure
        returns (uint256)
    {
        if (target == 0 || numerator == 0) {
            // SafeMath will check for zero denominator
            return SafeMath.DIV656(0, denominator);
        }
        return target.MUL349(numerator).SUB877(1).DIV656(denominator).ADD736(1);
    }

                                                                
    function MIN317(	//inject NONSTANDARD NAMING
        uint256 a,
        uint256 b
    )
        internal
        pure
        returns (uint256)
    {
        return a < b ? a : b;
    }

                                                                
    function MAX44(	//inject NONSTANDARD NAMING
        uint256 a,
        uint256 b
    )
        internal
        pure
        returns (uint256)
    {
        return a > b ? a : b;
    }
}

// File: contracts/protocol/lib/SafeCast.sol

                                                                                                         
library SafeCast {

                                                                                                                                                                                                                                                                                                 
    function TOUINT128535(	//inject NONSTANDARD NAMING
        uint256 value
    )
        internal
        pure
        returns (uint128)
    {
        require(value < 2**128, "SafeCast: value doesn\'t fit in 128 bits");
        return uint128(value);
    }

                                                                                                                                                                                                                                                                                                 
    function TOUINT120496(	//inject NONSTANDARD NAMING
        uint256 value
    )
        internal
        pure
        returns (uint120)
    {
        require(value < 2**120, "SafeCast: value doesn\'t fit in 120 bits");
        return uint120(value);
    }

                                                                                                                                                                                                                                                                                             
    function TOUINT32636(	//inject NONSTANDARD NAMING
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

// File: contracts/protocol/lib/SignedMath.sol

                                                                                                               
library SignedMath {
    using SafeMath for uint256;

    // ============ Structs ============

    struct Int {
        uint256 value;
        bool isPositive;
    }

    // ============ Functions ============

                                                                                                            
    function ADD736(	//inject NONSTANDARD NAMING
        Int memory sint,
        uint256 value
    )
        internal
        pure
        returns (Int memory)
    {
        if (sint.isPositive) {
            return Int({
                value: value.ADD736(sint.value),
                isPositive: true
            });
        }
        if (sint.value < value) {
            return Int({
                value: value.SUB877(sint.value),
                isPositive: true
            });
        }
        return Int({
            value: sint.value.SUB877(value),
            isPositive: false
        });
    }

                                                                                                             
    function SUB877(	//inject NONSTANDARD NAMING
        Int memory sint,
        uint256 value
    )
        internal
        pure
        returns (Int memory)
    {
        if (!sint.isPositive) {
            return Int({
                value: value.ADD736(sint.value),
                isPositive: false
            });
        }
        if (sint.value > value) {
            return Int({
                value: sint.value.SUB877(value),
                isPositive: true
            });
        }
        return Int({
            value: value.SUB877(sint.value),
            isPositive: false
        });
    }

                                                                                                               
    function SIGNEDADD212(	//inject NONSTANDARD NAMING
        Int memory augend,
        Int memory addend
    )
        internal
        pure
        returns (Int memory)
    {
        return addend.isPositive
            ? ADD736(augend, addend.value)
            : SUB877(augend, addend.value);
    }

                                                                                                                
    function SIGNEDSUB805(	//inject NONSTANDARD NAMING
        Int memory minuend,
        Int memory subtrahend
    )
        internal
        pure
        returns (Int memory)
    {
        return subtrahend.isPositive
            ? SUB877(minuend, subtrahend.value)
            : ADD736(minuend, subtrahend.value);
    }

                                                                                                                   
    function GT349(	//inject NONSTANDARD NAMING
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

                                                                               
    function MIN317(	//inject NONSTANDARD NAMING
        Int memory a,
        Int memory b
    )
        internal
        pure
        returns (Int memory)
    {
        return GT349(b, a) ? a : b;
    }

                                                                               
    function MAX44(	//inject NONSTANDARD NAMING
        Int memory a,
        Int memory b
    )
        internal
        pure
        returns (Int memory)
    {
        return GT349(a, b) ? a : b;
    }
}

// File: contracts/protocol/v1/intf/I_P1Funder.sol

                                                                                                                                     
interface I_P1Funder {

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function GETFUNDING791(	//inject NONSTANDARD NAMING
        uint256 timeDelta
    )
        external
        view
        returns (bool, uint256);
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

// File: contracts/protocol/v1/lib/P1IndexMath.sol

                                                                                                        
library P1IndexMath {

    // ============ Constants ============

    uint256 private constant flag_is_positive493 = 1 << (8 * 16);	//inject NONSTANDARD NAMING

    // ============ Functions ============

                                                                                                 
    function TOBYTES32620(	//inject NONSTANDARD NAMING
        P1Types.Index memory index
    )
        internal
        pure
        returns (bytes32)
    {
        uint256 result =
            index.value
            | (index.isPositive ? flag_is_positive493 : 0)
            | (uint256(index.timestamp) << 136);
        return bytes32(result);
    }
}

// File: contracts/protocol/v1/oracles/P1FundingOracle.sol

                                                                                                                         
contract P1FundingOracle is
    Ownable,
    I_P1Funder
{
    using BaseMath for uint256;
    using SafeCast for uint256;
    using SafeMath for uint128;
    using SafeMath for uint256;
    using P1IndexMath for P1Types.Index;
    using SignedMath for SignedMath.Int;

    // ============ Constants ============

    uint256 private constant flag_is_positive493 = 1 << 128;	//inject NONSTANDARD NAMING
    uint128 constant internal base831 = 10 ** 18;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    uint128 public constant max_abs_value31 = base831 * 75 / 10000 / (8 hours);	//inject NONSTANDARD NAMING
    uint128 public constant max_abs_diff_per_second915 = max_abs_value31 * 2 / (45 minutes);	//inject NONSTANDARD NAMING

    // ============ Events ============

    event LOGFUNDINGRATEUPDATED965(	//inject NONSTANDARD NAMING
        bytes32 fundingRate
    );

    event LOGFUNDINGRATEPROVIDERSET321(	//inject NONSTANDARD NAMING
        address fundingRateProvider
    );

    // ============ Mutable Storage ============

    // The funding rate is denoted in units per second, as a fixed-point number with 18 decimals.
    P1Types.Index private _FUNDING_RATE_;

    // Address which has the ability to update the funding rate.
    address public _FUNDING_RATE_PROVIDER_;

    // ============ Constructor ============

    constructor(
        address fundingRateProvider
    )
        public
    {
        P1Types.Index memory fundingRate = P1Types.Index({
            timestamp: block.timestamp.TOUINT32636(),
            isPositive: true,
            value: 0
        });
        _FUNDING_RATE_ = fundingRate;
        _FUNDING_RATE_PROVIDER_ = fundingRateProvider;

        emit LOGFUNDINGRATEUPDATED965(fundingRate.TOBYTES32620());
        emit LOGFUNDINGRATEPROVIDERSET321(fundingRateProvider);
    }

    // ============ External Functions ============

                                                                                                                                                                                                                                                                                                                                                                                                        
    function SETFUNDINGRATE53(	//inject NONSTANDARD NAMING
        SignedMath.Int calldata newRate
    )
        external
        returns (P1Types.Index memory)
    {
        require(
            msg.sender == _FUNDING_RATE_PROVIDER_,
            "The funding rate can only be set by the funding rate provider"
        );

        SignedMath.Int memory boundedNewRate = _BOUNDRATE328(newRate);
        P1Types.Index memory boundedNewRateWithTimestamp = P1Types.Index({
            timestamp: block.timestamp.TOUINT32636(),
            isPositive: boundedNewRate.isPositive,
            value: boundedNewRate.value.TOUINT128535()
        });
        _FUNDING_RATE_ = boundedNewRateWithTimestamp;

        emit LOGFUNDINGRATEUPDATED965(boundedNewRateWithTimestamp.TOBYTES32620());

        return boundedNewRateWithTimestamp;
    }

                                                                                                                                                                                                                                                             
    function SETFUNDINGRATEPROVIDER885(	//inject NONSTANDARD NAMING
        address newProvider
    )
        external
        ONLYOWNER322
    {
        _FUNDING_RATE_PROVIDER_ = newProvider;
        emit LOGFUNDINGRATEPROVIDERSET321(newProvider);
    }

    // ============ Public Functions ============

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function GETFUNDING791(	//inject NONSTANDARD NAMING
        uint256 timeDelta
    )
        public
        view
        returns (bool, uint256)
    {
        // Note: Funding interest in PerpetualV1 does not compound, as the interest affects margin
        // balances but is calculated based on position balances.
        P1Types.Index memory fundingRate = _FUNDING_RATE_;
        uint256 fundingAmount = uint256(fundingRate.value).MUL349(timeDelta);
        return (fundingRate.isPositive, fundingAmount);
    }

    // ============ Helper Functions ============

                                                                                          
    function _BOUNDRATE328(	//inject NONSTANDARD NAMING
        SignedMath.Int memory newRate
    )
        private
        view
        returns (SignedMath.Int memory)
    {
        // Get the old rate from storage.
        P1Types.Index memory oldRateWithTimestamp = _FUNDING_RATE_;
        SignedMath.Int memory oldRate = SignedMath.Int({
            value: oldRateWithTimestamp.value,
            isPositive: oldRateWithTimestamp.isPositive
        });

        // Get the maximum allowed change in the rate.
        uint256 timeDelta = block.timestamp.SUB877(oldRateWithTimestamp.timestamp);
        uint256 maxDiff = max_abs_diff_per_second915.MUL349(timeDelta);

        // Calculate and return the bounded rate.
        if (newRate.GT349(oldRate)) {
            SignedMath.Int memory upperBound = SignedMath.MIN317(
                oldRate.ADD736(maxDiff),
                SignedMath.Int({ value: max_abs_value31, isPositive: true })
            );
            return SignedMath.MIN317(
                newRate,
                upperBound
            );
        } else {
            SignedMath.Int memory lowerBound = SignedMath.MAX44(
                oldRate.SUB877(maxDiff),
                SignedMath.Int({ value: max_abs_value31, isPositive: false })
            );
            return SignedMath.MAX44(
                newRate,
                lowerBound
            );
        }
    }
}