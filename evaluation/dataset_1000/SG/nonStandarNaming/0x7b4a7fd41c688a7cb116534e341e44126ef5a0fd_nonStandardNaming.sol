                                                                 

                                                                 

// File: contracts/ComptrollerInterface.sol

pragma solidity ^0.5.8;

interface ComptrollerInterface {
                                                                                                                                                                                             
    function ISCOMPTROLLER719() external view returns (bool);	//inject NONSTANDARD NAMING

                               

    function ENTERMARKETS879(address[] calldata cTokens) external returns (uint[] memory);	//inject NONSTANDARD NAMING
    function EXITMARKET21(address cToken) external returns (uint);	//inject NONSTANDARD NAMING

                          

    function MINTALLOWED342(address cToken, address minter, uint mintAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function MINTVERIFY442(address cToken, address minter, uint mintAmount, uint mintTokens) external;	//inject NONSTANDARD NAMING

    function REDEEMALLOWED631(address cToken, address redeemer, uint redeemTokens) external returns (uint);	//inject NONSTANDARD NAMING
    function REDEEMVERIFY615(address cToken, address redeemer, uint redeemAmount, uint redeemTokens) external;	//inject NONSTANDARD NAMING

    function BORROWALLOWED514(address cToken, address borrower, uint borrowAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function BORROWVERIFY924(address cToken, address borrower, uint borrowAmount) external;	//inject NONSTANDARD NAMING

    function REPAYBORROWALLOWED49(	//inject NONSTANDARD NAMING
        address cToken,
        address payer,
        address borrower,
        uint repayAmount) external returns (uint);
    function REPAYBORROWVERIFY984(	//inject NONSTANDARD NAMING
        address cToken,
        address payer,
        address borrower,
        uint repayAmount,
        uint borrowerIndex) external;

    function LIQUIDATEBORROWALLOWED284(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount) external returns (uint);
    function LIQUIDATEBORROWVERIFY992(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount,
        uint seizeTokens) external;

    function SEIZEALLOWED906(	//inject NONSTANDARD NAMING
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external returns (uint);
    function SEIZEVERIFY161(	//inject NONSTANDARD NAMING
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external;

    function TRANSFERALLOWED622(address cToken, address src, address dst, uint transferTokens) external returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFERVERIFY136(address cToken, address src, address dst, uint transferTokens) external;	//inject NONSTANDARD NAMING

                                                

    function LIQUIDATECALCULATESEIZETOKENS267(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        uint repayAmount) external view returns (uint, uint);
}

// File: contracts/ErrorReporter.sol

pragma solidity ^0.5.8;

contract ComptrollerErrorReporter {
    enum Error {
        NO_ERROR,
        UNAUTHORIZED,
        COMPTROLLER_MISMATCH,
        INSUFFICIENT_SHORTFALL,
        INSUFFICIENT_LIQUIDITY,
        INVALID_CLOSE_FACTOR,
        INVALID_COLLATERAL_FACTOR,
        INVALID_LIQUIDATION_INCENTIVE,
        MARKET_NOT_ENTERED,
        MARKET_NOT_LISTED,
        MARKET_ALREADY_LISTED,
        MATH_ERROR,
        NONZERO_BORROW_BALANCE,
        PRICE_ERROR,
        REJECTION,
        SNAPSHOT_ERROR,
        TOO_MANY_ASSETS,
        TOO_MUCH_REPAY
    }

    enum FailureInfo {
        ACCEPT_ADMIN_PENDING_ADMIN_CHECK,
        ACCEPT_PENDING_IMPLEMENTATION_ADDRESS_CHECK,
        EXIT_MARKET_BALANCE_OWED,
        EXIT_MARKET_REJECTION,
        SET_CLOSE_FACTOR_OWNER_CHECK,
        SET_CLOSE_FACTOR_VALIDATION,
        SET_COLLATERAL_FACTOR_OWNER_CHECK,
        SET_COLLATERAL_FACTOR_NO_EXISTS,
        SET_COLLATERAL_FACTOR_VALIDATION,
        SET_COLLATERAL_FACTOR_WITHOUT_PRICE,
        SET_IMPLEMENTATION_OWNER_CHECK,
        SET_LIQUIDATION_INCENTIVE_OWNER_CHECK,
        SET_LIQUIDATION_INCENTIVE_VALIDATION,
        SET_MAX_ASSETS_OWNER_CHECK,
        SET_PENDING_ADMIN_OWNER_CHECK,
        SET_PENDING_IMPLEMENTATION_OWNER_CHECK,
        SET_PRICE_ORACLE_OWNER_CHECK,
        SUPPORT_MARKET_EXISTS,
        SUPPORT_MARKET_OWNER_CHECK,
        ZUNUSED
    }

                                                                                                                                                                                                                                              
    event FAILURE35(uint error, uint info, uint detail);	//inject NONSTANDARD NAMING

                                                                                                                           
    function FAIL339(Error err, FailureInfo info) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE35(uint(err), uint(info), 0);

        return uint(err);
    }

                                                                                                               
    function FAILOPAQUE40(Error err, FailureInfo info, uint opaqueError) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE35(uint(err), uint(info), opaqueError);

        return uint(err);
    }
}

contract TokenErrorReporter {
    enum Error {
        NO_ERROR,
        UNAUTHORIZED,
        BAD_INPUT,
        COMPTROLLER_REJECTION,
        COMPTROLLER_CALCULATION_ERROR,
        INTEREST_RATE_MODEL_ERROR,
        INVALID_ACCOUNT_PAIR,
        INVALID_CLOSE_AMOUNT_REQUESTED,
        INVALID_COLLATERAL_FACTOR,
        MATH_ERROR,
        MARKET_NOT_FRESH,
        MARKET_NOT_LISTED,
        TOKEN_INSUFFICIENT_ALLOWANCE,
        TOKEN_INSUFFICIENT_BALANCE,
        TOKEN_INSUFFICIENT_CASH,
        TOKEN_TRANSFER_IN_FAILED,
        TOKEN_TRANSFER_OUT_FAILED
    }

                                                                                                                                                                                                                                                                                   
    enum FailureInfo {
        ACCEPT_ADMIN_PENDING_ADMIN_CHECK,
        ACCRUE_INTEREST_ACCUMULATED_INTEREST_CALCULATION_FAILED,
        ACCRUE_INTEREST_BORROW_RATE_CALCULATION_FAILED,
        ACCRUE_INTEREST_NEW_BORROW_INDEX_CALCULATION_FAILED,
        ACCRUE_INTEREST_NEW_TOTAL_BORROWS_CALCULATION_FAILED,
        ACCRUE_INTEREST_NEW_TOTAL_RESERVES_CALCULATION_FAILED,
        ACCRUE_INTEREST_SIMPLE_INTEREST_FACTOR_CALCULATION_FAILED,
        BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED,
        BORROW_ACCRUE_INTEREST_FAILED,
        BORROW_CASH_NOT_AVAILABLE,
        BORROW_FRESHNESS_CHECK,
        BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED,
        BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED,
        BORROW_MARKET_NOT_LISTED,
        BORROW_COMPTROLLER_REJECTION,
        LIQUIDATE_ACCRUE_BORROW_INTEREST_FAILED,
        LIQUIDATE_ACCRUE_COLLATERAL_INTEREST_FAILED,
        LIQUIDATE_COLLATERAL_FRESHNESS_CHECK,
        LIQUIDATE_COMPTROLLER_REJECTION,
        LIQUIDATE_COMPTROLLER_CALCULATE_AMOUNT_SEIZE_FAILED,
        LIQUIDATE_CLOSE_AMOUNT_IS_UINT_MAX,
        LIQUIDATE_CLOSE_AMOUNT_IS_ZERO,
        LIQUIDATE_FRESHNESS_CHECK,
        LIQUIDATE_LIQUIDATOR_IS_BORROWER,
        LIQUIDATE_REPAY_BORROW_FRESH_FAILED,
        LIQUIDATE_SEIZE_BALANCE_INCREMENT_FAILED,
        LIQUIDATE_SEIZE_BALANCE_DECREMENT_FAILED,
        LIQUIDATE_SEIZE_COMPTROLLER_REJECTION,
        LIQUIDATE_SEIZE_LIQUIDATOR_IS_BORROWER,
        LIQUIDATE_SEIZE_TOO_MUCH,
        MINT_ACCRUE_INTEREST_FAILED,
        MINT_COMPTROLLER_REJECTION,
        MINT_EXCHANGE_CALCULATION_FAILED,
        MINT_EXCHANGE_RATE_READ_FAILED,
        MINT_FRESHNESS_CHECK,
        MINT_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED,
        MINT_NEW_TOTAL_SUPPLY_CALCULATION_FAILED,
        MINT_TRANSFER_IN_FAILED,
        MINT_TRANSFER_IN_NOT_POSSIBLE,
        REDEEM_ACCRUE_INTEREST_FAILED,
        REDEEM_COMPTROLLER_REJECTION,
        REDEEM_EXCHANGE_TOKENS_CALCULATION_FAILED,
        REDEEM_EXCHANGE_AMOUNT_CALCULATION_FAILED,
        REDEEM_EXCHANGE_RATE_READ_FAILED,
        REDEEM_FRESHNESS_CHECK,
        REDEEM_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED,
        REDEEM_NEW_TOTAL_SUPPLY_CALCULATION_FAILED,
        REDEEM_TRANSFER_OUT_NOT_POSSIBLE,
        REDUCE_RESERVES_ACCRUE_INTEREST_FAILED,
        REDUCE_RESERVES_ADMIN_CHECK,
        REDUCE_RESERVES_CASH_NOT_AVAILABLE,
        REDUCE_RESERVES_FRESH_CHECK,
        REDUCE_RESERVES_VALIDATION,
        REPAY_BEHALF_ACCRUE_INTEREST_FAILED,
        REPAY_BORROW_ACCRUE_INTEREST_FAILED,
        REPAY_BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED,
        REPAY_BORROW_COMPTROLLER_REJECTION,
        REPAY_BORROW_FRESHNESS_CHECK,
        REPAY_BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED,
        REPAY_BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED,
        REPAY_BORROW_TRANSFER_IN_NOT_POSSIBLE,
        SET_COLLATERAL_FACTOR_OWNER_CHECK,
        SET_COLLATERAL_FACTOR_VALIDATION,
        SET_COMPTROLLER_OWNER_CHECK,
        SET_INTEREST_RATE_MODEL_ACCRUE_INTEREST_FAILED,
        SET_INTEREST_RATE_MODEL_FRESH_CHECK,
        SET_INTEREST_RATE_MODEL_OWNER_CHECK,
        SET_MAX_ASSETS_OWNER_CHECK,
        SET_ORACLE_MARKET_NOT_LISTED,
        SET_PENDING_ADMIN_OWNER_CHECK,
        SET_RESERVE_FACTOR_ACCRUE_INTEREST_FAILED,
        SET_RESERVE_FACTOR_ADMIN_CHECK,
        SET_RESERVE_FACTOR_FRESH_CHECK,
        SET_RESERVE_FACTOR_BOUNDS_CHECK,
        TRANSFER_COMPTROLLER_REJECTION,
        TRANSFER_NOT_ALLOWED,
        TRANSFER_NOT_ENOUGH,
        TRANSFER_TOO_MUCH
    }

                                                                                                                                                                                                                                              
    event FAILURE35(uint error, uint info, uint detail);	//inject NONSTANDARD NAMING

                                                                                                                           
    function FAIL339(Error err, FailureInfo info) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE35(uint(err), uint(info), 0);

        return uint(err);
    }

                                                                                                               
    function FAILOPAQUE40(Error err, FailureInfo info, uint opaqueError) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE35(uint(err), uint(info), opaqueError);

        return uint(err);
    }
}

// File: contracts/CarefulMath.sol

pragma solidity ^0.5.8;

                                                                                                                                                                                                                        
contract CarefulMath {

                                                                   
    enum MathError {
        NO_ERROR,
        DIVISION_BY_ZERO,
        INTEGER_OVERFLOW,
        INTEGER_UNDERFLOW
    }

                                                                               
    function MULUINT645(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return (MathError.NO_ERROR, 0);
        }

        uint c = a * b;

        if (c / a != b) {
            return (MathError.INTEGER_OVERFLOW, 0);
        } else {
            return (MathError.NO_ERROR, c);
        }
    }

                                                                                   
    function DIVUINT883(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (b == 0) {
            return (MathError.DIVISION_BY_ZERO, 0);
        }

        return (MathError.NO_ERROR, a / b);
    }

                                                                                                                           
    function SUBUINT336(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (b <= a) {
            return (MathError.NO_ERROR, a - b);
        } else {
            return (MathError.INTEGER_UNDERFLOW, 0);
        }
    }

                                                                         
    function ADDUINT627(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;

        if (c >= a) {
            return (MathError.NO_ERROR, c);
        } else {
            return (MathError.INTEGER_OVERFLOW, 0);
        }
    }

                                                         
    function ADDTHENSUBUINT132(uint a, uint b, uint c) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err0, uint sum) = ADDUINT627(a, b);

        if (err0 != MathError.NO_ERROR) {
            return (err0, 0);
        }

        return SUBUINT336(sum, c);
    }
}

// File: contracts/Exponential.sol

pragma solidity ^0.5.8;


                                                                                                                                                                                                                                                                                                                                   
contract Exponential is CarefulMath {
    uint constant expscale171 = 1e18;	//inject NONSTANDARD NAMING
    uint constant halfexpscale420 = expscale171/2;	//inject NONSTANDARD NAMING
    uint constant mantissaone555 = expscale171;	//inject NONSTANDARD NAMING

    struct Exp {
        uint mantissa;
    }

                                                                                                                                                                                                   
    function GETEXP508(uint num, uint denom) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint scaledNumerator) = MULUINT645(num, expscale171);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        (MathError err1, uint rational) = DIVUINT883(scaledNumerator, denom);
        if (err1 != MathError.NO_ERROR) {
            return (err1, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: rational}));
    }

                                                                               
    function ADDEXP70(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError error, uint result) = ADDUINT627(a.mantissa, b.mantissa);

        return (error, Exp({mantissa: result}));
    }

                                                                                    
    function SUBEXP417(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError error, uint result) = SUBUINT336(a.mantissa, b.mantissa);

        return (error, Exp({mantissa: result}));
    }

                                                                             
    function MULSCALAR971(Exp memory a, uint scalar) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint scaledMantissa) = MULUINT645(a.mantissa, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: scaledMantissa}));
    }

                                                                                                     
    function MULSCALARTRUNCATE842(Exp memory a, uint scalar) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory product) = MULSCALAR971(a, scalar);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return (MathError.NO_ERROR, TRUNCATE337(product));
    }

                                                                                                                                     
    function MULSCALARTRUNCATEADDUINT175(Exp memory a, uint scalar, uint addend) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory product) = MULSCALAR971(a, scalar);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return ADDUINT627(TRUNCATE337(product), addend);
    }

                                                                           
    function DIVSCALAR338(Exp memory a, uint scalar) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint descaledMantissa) = DIVUINT883(a.mantissa, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: descaledMantissa}));
    }

                                                                           
    function DIVSCALARBYEXP182(uint scalar, Exp memory divisor) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                                 
        (MathError err0, uint numerator) = MULUINT645(expscale171, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }
        return GETEXP508(numerator, divisor.mantissa);
    }

                                                                                                   
    function DIVSCALARBYEXPTRUNCATE98(uint scalar, Exp memory divisor) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory fraction) = DIVSCALARBYEXP182(scalar, divisor);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return (MathError.NO_ERROR, TRUNCATE337(fraction));
    }

                                                                                     
    function MULEXP47(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING

        (MathError err0, uint doubleScaledProduct) = MULUINT645(a.mantissa, b.mantissa);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        // We add half the scale before dividing so that we get rounding instead of truncation.
        //  See "Listing 6" and text above it at https://accu.org/index.php/journals/1717
        // Without this change, a result like 6.6...e-19 will be truncated to 0 instead of being rounded to 1e-18.
        (MathError err1, uint doubleScaledProductWithHalfScale) = ADDUINT627(halfexpscale420, doubleScaledProduct);
        if (err1 != MathError.NO_ERROR) {
            return (err1, Exp({mantissa: 0}));
        }

        (MathError err2, uint product) = DIVUINT883(doubleScaledProductWithHalfScale, expscale171);
        // The only error `div` can return is MathError.DIVISION_BY_ZERO but we control `expScale` and it is not zero.
        assert(err2 == MathError.NO_ERROR);

        return (MathError.NO_ERROR, Exp({mantissa: product}));
    }

                                                                                                           
    function MULEXP47(uint a, uint b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        return MULEXP47(Exp({mantissa: a}), Exp({mantissa: b}));
    }

                                                                                       
    function MULEXP377(Exp memory a, Exp memory b, Exp memory c) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory ab) = MULEXP47(a, b);
        if (err != MathError.NO_ERROR) {
            return (err, ab);
        }
        return MULEXP47(ab, c);
    }

                                                                                                                                                                                                                                 
    function DIVEXP781(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        return GETEXP508(a.mantissa, b.mantissa);
    }

                                                                                                                                                 
    function TRUNCATE337(Exp memory exp) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        // Note: We are not using careful math here as we're performing a division that cannot fail
        return exp.mantissa / expscale171;
    }

                                                                        
    function LESSTHANEXP478(Exp memory left, Exp memory right) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return left.mantissa < right.mantissa; //TODO: Add some simple tests and this in another PR yo.
    }

                                                            
    function LESSTHANOREQUALEXP494(Exp memory left, Exp memory right) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return left.mantissa <= right.mantissa;
    }

                                                               
    function ISZEROEXP78(Exp memory value) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return value.mantissa == 0;
    }
}

// File: contracts/EIP20Interface.sol

pragma solidity ^0.5.8;

                                                                                           
interface EIP20Interface {

                                                                                                                   
    function TOTALSUPPLY119() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                            
    function BALANCEOF800(address owner) external view returns (uint256 balance);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                           
    function TRANSFER834(address dst, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                         
    function TRANSFERFROM164(address src, address dst, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function APPROVE706(address spender, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                
    function ALLOWANCE158(address owner, address spender) external view returns (uint256 remaining);	//inject NONSTANDARD NAMING

    event TRANSFER123(address indexed from, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event APPROVAL530(address indexed owner, address indexed spender, uint256 amount);	//inject NONSTANDARD NAMING
}

// File: contracts/EIP20NonStandardInterface.sol

pragma solidity ^0.5.8;

                                                                                                                                                                                                                                    
interface EIP20NonStandardInterface {

                                                                                                                
    function TOTALSUPPLY119() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                            
    function BALANCEOF800(address owner) external view returns (uint256 balance);	//inject NONSTANDARD NAMING

    ///
                      
                                                                                                   
                      
    ///

                                                                                                                                                                                                     
    function TRANSFER834(address dst, uint256 amount) external;	//inject NONSTANDARD NAMING

    ///
                      
                                                                                                       
                      
    ///

                                                                                                                                                                                                                                                   
    function TRANSFERFROM164(address src, address dst, uint256 amount) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function APPROVE706(address spender, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function ALLOWANCE158(address owner, address spender) external view returns (uint256 remaining);	//inject NONSTANDARD NAMING

    event TRANSFER123(address indexed from, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event APPROVAL530(address indexed owner, address indexed spender, uint256 amount);	//inject NONSTANDARD NAMING
}

// File: contracts/ReentrancyGuard.sol

pragma solidity ^0.5.8;

                                                                                                                                                                                                                             
contract ReentrancyGuard {
                                                                       
    uint256 private _guardCounter;

    constructor () internal {
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT512() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "re-entered");
    }
}

// File: contracts/InterestRateModel.sol

pragma solidity ^0.5.8;

                                                                                                                                                                                                                                                                                                 
interface InterestRateModel {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function GETBORROWRATE648(uint cash, uint borrows, uint reserves) external view returns (uint, uint);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                    
    function ISINTERESTRATEMODEL967() external view returns (bool);	//inject NONSTANDARD NAMING
}

// File: contracts/CToken.sol

pragma solidity ^0.5.8;








                                                                                                     
contract CToken is EIP20Interface, Exponential, TokenErrorReporter, ReentrancyGuard {
                                                                                        
    bool public constant isctoken484 = true;	//inject NONSTANDARD NAMING

                                                               
    string public name;

                                                                 
    string public symbol;

                                                                   
    uint public decimals;

                                                                                            
    uint constant borrowratemaxmantissa954 = 5e14;	//inject NONSTANDARD NAMING

                                                                                              
    uint constant reservefactormaxmantissa965 = 1e18;	//inject NONSTANDARD NAMING

                                                              
    address payable public admin;

                                                                      
    address payable public pendingAdmin;

                                                                              
    ComptrollerInterface public comptroller;

                                                                                         
    InterestRateModel public interestRateModel;

                                                                                                                    
    uint public initialExchangeRateMantissa;

                                                                                    
    uint public reserveFactorMantissa;

                                                                             
    uint public accrualBlockNumber;

                                                                                                   
    uint public borrowIndex;

                                                                                                   
    uint public totalBorrows;

                                                                                             
    uint public totalReserves;

                                                                    
    uint256 public totalSupply;

                                                                                 
    mapping (address => uint256) accountTokens;

                                                                                  
    mapping (address => mapping (address => uint256)) transferAllowances;

                                                                                                                                                                                                                                                                                            
    struct BorrowSnapshot {
        uint principal;
        uint interestIndex;
    }

                                                                                          
    mapping(address => BorrowSnapshot) accountBorrows;


                           

                                                                     
    event ACCRUEINTEREST515(uint interestAccumulated, uint borrowIndex, uint totalBorrows);	//inject NONSTANDARD NAMING

                                                                   
    event MINT798(address minter, uint mintAmount, uint mintTokens);	//inject NONSTANDARD NAMING

                                                                     
    event REDEEM926(address redeemer, uint redeemAmount, uint redeemTokens);	//inject NONSTANDARD NAMING

                                                                        
    event BORROW443(address borrower, uint borrowAmount, uint accountBorrows, uint totalBorrows);	//inject NONSTANDARD NAMING

                                                                    
    event REPAYBORROW215(address payer, address borrower, uint repayAmount, uint accountBorrows, uint totalBorrows);	//inject NONSTANDARD NAMING

                                                                        
    event LIQUIDATEBORROW267(address liquidator, address borrower, uint repayAmount, address cTokenCollateral, uint seizeTokens);	//inject NONSTANDARD NAMING


                          

                                                                         
    event NEWPENDINGADMIN221(address oldPendingAdmin, address newPendingAdmin);	//inject NONSTANDARD NAMING

                                                                                                        
    event NEWADMIN895(address oldAdmin, address newAdmin);	//inject NONSTANDARD NAMING

                                                                        
    event NEWCOMPTROLLER211(ComptrollerInterface oldComptroller, ComptrollerInterface newComptroller);	//inject NONSTANDARD NAMING

                                                                              
    event NEWMARKETINTERESTRATEMODEL719(InterestRateModel oldInterestRateModel, InterestRateModel newInterestRateModel);	//inject NONSTANDARD NAMING

                                                                               
    event NEWRESERVEFACTOR137(uint oldReserveFactorMantissa, uint newReserveFactorMantissa);	//inject NONSTANDARD NAMING

                                                                          
    event RESERVESREDUCED17(address admin, uint reduceAmount, uint newTotalReserves);	//inject NONSTANDARD NAMING


                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    constructor(ComptrollerInterface comptroller_,
                InterestRateModel interestRateModel_,
                uint initialExchangeRateMantissa_,
                string memory name_,
                string memory symbol_,
                uint decimals_) internal {
        // Set admin to msg.sender
        admin = msg.sender;

        // Set initial exchange rate
        initialExchangeRateMantissa = initialExchangeRateMantissa_;
        require(initialExchangeRateMantissa > 0, "Initial exchange rate must be greater than zero.");

        // Set the comptroller
        uint err = _SETCOMPTROLLER437(comptroller_);
        require(err == uint(Error.NO_ERROR), "Setting comptroller failed");

        // Initialize block number and borrow index (block number mocks depend on comptroller being set)
        accrualBlockNumber = GETBLOCKNUMBER633();
        borrowIndex = mantissaone555;

        // Set the interest rate model (depends on block number / borrow index)
        err = _SETINTERESTRATEMODELFRESH751(interestRateModel_);
        require(err == uint(Error.NO_ERROR), "Setting interest rate model failed");

        name = name_;
        symbol = symbol_;
        decimals = decimals_;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function TRANSFERTOKENS186(address spender, address src, address dst, uint tokens) internal returns (uint) {	//inject NONSTANDARD NAMING
                                          
        uint allowed = comptroller.TRANSFERALLOWED622(address(this), src, dst, tokens);
        if (allowed != 0) {
            return FAILOPAQUE40(Error.COMPTROLLER_REJECTION, FailureInfo.TRANSFER_COMPTROLLER_REJECTION, allowed);
        }

                                         
        if (src == dst) {
            return FAIL339(Error.BAD_INPUT, FailureInfo.TRANSFER_NOT_ALLOWED);
        }

                                                               
        uint startingAllowance = 0;
        if (spender == src) {
            startingAllowance = uint(-1);
        } else {
            startingAllowance = transferAllowances[src][spender];
        }

                                                                
        MathError mathErr;
        uint allowanceNew;
        uint srcTokensNew;
        uint dstTokensNew;

        (mathErr, allowanceNew) = SUBUINT336(startingAllowance, tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL339(Error.MATH_ERROR, FailureInfo.TRANSFER_NOT_ALLOWED);
        }

        (mathErr, srcTokensNew) = SUBUINT336(accountTokens[src], tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL339(Error.MATH_ERROR, FailureInfo.TRANSFER_NOT_ENOUGH);
        }

        (mathErr, dstTokensNew) = ADDUINT627(accountTokens[dst], tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL339(Error.MATH_ERROR, FailureInfo.TRANSFER_TOO_MUCH);
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

        accountTokens[src] = srcTokensNew;
        accountTokens[dst] = dstTokensNew;

                                                      
        if (startingAllowance != uint(-1)) {
            transferAllowances[src][spender] = allowanceNew;
        }

                                      
        emit TRANSFER123(src, dst, tokens);

                                                                                 
        comptroller.TRANSFERVERIFY136(address(this), src, dst, tokens);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                      
    function TRANSFER834(address dst, uint256 amount) external NONREENTRANT512 returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERTOKENS186(msg.sender, msg.sender, dst, amount) == uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM164(address src, address dst, uint256 amount) external NONREENTRANT512 returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERTOKENS186(msg.sender, src, dst, amount) == uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE706(address spender, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
        address src = msg.sender;
        transferAllowances[src][spender] = amount;
        emit APPROVAL530(src, spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                           
    function ALLOWANCE158(address owner, address spender) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return transferAllowances[owner][spender];
    }

                                                                                                                                                                                
    function BALANCEOF800(address owner) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return accountTokens[owner];
    }

                                                                                                                                                                                                                                                 
    function BALANCEOFUNDERLYING98(address owner) external returns (uint) {	//inject NONSTANDARD NAMING
        Exp memory exchangeRate = Exp({mantissa: EXCHANGERATECURRENT678()});
        (MathError mErr, uint balance) = MULSCALARTRUNCATE842(exchangeRate, accountTokens[owner]);
        require(mErr == MathError.NO_ERROR);
        return balance;
    }

                                                                                                                                                                                                                                                                                                                                           
    function GETACCOUNTSNAPSHOT303(address account) external view returns (uint, uint, uint, uint) {	//inject NONSTANDARD NAMING
        uint cTokenBalance = accountTokens[account];
        uint borrowBalance;
        uint exchangeRateMantissa;

        MathError mErr;

        (mErr, borrowBalance) = BORROWBALANCESTOREDINTERNAL395(account);
        if (mErr != MathError.NO_ERROR) {
            return (uint(Error.MATH_ERROR), 0, 0, 0);
        }

        (mErr, exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL283();
        if (mErr != MathError.NO_ERROR) {
            return (uint(Error.MATH_ERROR), 0, 0, 0);
        }

        return (uint(Error.NO_ERROR), cTokenBalance, borrowBalance, exchangeRateMantissa);
    }

                                                                                                                                                  
    function GETBLOCKNUMBER633() internal view returns (uint) {	//inject NONSTANDARD NAMING
        return block.number;
    }

                                                                                                                                                                   
    function BORROWRATEPERBLOCK720() external view returns (uint) {	//inject NONSTANDARD NAMING
        (uint opaqueErr, uint borrowRateMantissa) = interestRateModel.GETBORROWRATE648(GETCASHPRIOR761(), totalBorrows, totalReserves);
        require(opaqueErr == 0, "borrowRatePerBlock: interestRateModel.borrowRate failed"); // semi-opaque
        return borrowRateMantissa;
    }

                                                                                                                                                                   
    function SUPPLYRATEPERBLOCK718() external view returns (uint) {	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                
        uint exchangeRateMantissa = EXCHANGERATESTORED18();

        (uint e0, uint borrowRateMantissa) = interestRateModel.GETBORROWRATE648(GETCASHPRIOR761(), totalBorrows, totalReserves);
        require(e0 == 0, "supplyRatePerBlock: calculating borrowRate failed"); // semi-opaque

        (MathError e1, Exp memory underlying) = MULSCALAR971(Exp({mantissa: exchangeRateMantissa}), totalSupply);
        require(e1 == MathError.NO_ERROR, "supplyRatePerBlock: calculating underlying failed");

        (MathError e2, Exp memory borrowsPer) = DIVSCALARBYEXP182(totalBorrows, underlying);
        require(e2 == MathError.NO_ERROR, "supplyRatePerBlock: calculating borrowsPer failed");

        (MathError e3, Exp memory oneMinusReserveFactor) = SUBEXP417(Exp({mantissa: mantissaone555}), Exp({mantissa: reserveFactorMantissa}));
        require(e3 == MathError.NO_ERROR, "supplyRatePerBlock: calculating oneMinusReserveFactor failed");

        (MathError e4, Exp memory supplyRate) = MULEXP377(Exp({mantissa: borrowRateMantissa}), oneMinusReserveFactor, borrowsPer);
        require(e4 == MathError.NO_ERROR, "supplyRatePerBlock: calculating supplyRate failed");

        return supplyRate.mantissa;
    }

                                                                                                                                     
    function TOTALBORROWSCURRENT47() external NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        require(ACCRUEINTEREST395() == uint(Error.NO_ERROR), "accrue interest failed");
        return totalBorrows;
    }

                                                                                                                                                                                                                                                                                     
    function BORROWBALANCECURRENT859(address account) external NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        require(ACCRUEINTEREST395() == uint(Error.NO_ERROR), "accrue interest failed");
        return BORROWBALANCESTORED18(account);
    }

                                                                                                                                                                                                   
    function BORROWBALANCESTORED18(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        (MathError err, uint result) = BORROWBALANCESTOREDINTERNAL395(account);
        require(err == MathError.NO_ERROR, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        return result;
    }

                                                                                                                                                                                                                                                
    function BORROWBALANCESTOREDINTERNAL395(address account) internal view returns (MathError, uint) {	//inject NONSTANDARD NAMING
                                                                  
        MathError mathErr;
        uint principalTimesIndex;
        uint result;

                                               
        BorrowSnapshot storage borrowSnapshot = accountBorrows[account];

                                                                                                                                                                                         
        if (borrowSnapshot.principal == 0) {
            return (MathError.NO_ERROR, 0);
        }

                                                                                                                                                                                  
        (mathErr, principalTimesIndex) = MULUINT645(borrowSnapshot.principal, borrowIndex);
        if (mathErr != MathError.NO_ERROR) {
            return (mathErr, 0);
        }

        (mathErr, result) = DIVUINT883(principalTimesIndex, borrowSnapshot.interestIndex);
        if (mathErr != MathError.NO_ERROR) {
            return (mathErr, 0);
        }

        return (MathError.NO_ERROR, result);
    }

                                                                                                                                              
    function EXCHANGERATECURRENT678() public NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        require(ACCRUEINTEREST395() == uint(Error.NO_ERROR), "accrue interest failed");
        return EXCHANGERATESTORED18();
    }

                                                                                                                                                                                                                                            
    function EXCHANGERATESTORED18() public view returns (uint) {	//inject NONSTANDARD NAMING
        (MathError err, uint result) = EXCHANGERATESTOREDINTERNAL283();
        require(err == MathError.NO_ERROR, "exchangeRateStored: exchangeRateStoredInternal failed");
        return result;
    }

                                                                                                                                                                                                                                                          
    function EXCHANGERATESTOREDINTERNAL283() internal view returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (totalSupply == 0) {
                                                                                                                               
            return (MathError.NO_ERROR, initialExchangeRateMantissa);
        } else {
                                                                                                                                                
            uint totalCash = GETCASHPRIOR761();
            uint cashPlusBorrowsMinusReserves;
            Exp memory exchangeRate;
            MathError mathErr;

            (mathErr, cashPlusBorrowsMinusReserves) = ADDTHENSUBUINT132(totalCash, totalBorrows, totalReserves);
            if (mathErr != MathError.NO_ERROR) {
                return (mathErr, 0);
            }

            (mathErr, exchangeRate) = GETEXP508(cashPlusBorrowsMinusReserves, totalSupply);
            if (mathErr != MathError.NO_ERROR) {
                return (mathErr, 0);
            }

            return (MathError.NO_ERROR, exchangeRate.mantissa);
        }
    }

                                                                                                                                                             
    function GETCASH65() external view returns (uint) {	//inject NONSTANDARD NAMING
        return GETCASHPRIOR761();
    }

    struct AccrueInterestLocalVars {
        MathError mathErr;
        uint opaqueErr;
        uint borrowRateMantissa;
        uint currentBlockNumber;
        uint blockDelta;

        Exp simpleInterestFactor;

        uint interestAccumulated;
        uint totalBorrowsNew;
        uint totalReservesNew;
        uint borrowIndexNew;
    }

                                                                                                                                                                                                                                                  
    function ACCRUEINTEREST395() public returns (uint) {	//inject NONSTANDARD NAMING
        AccrueInterestLocalVars memory vars;

                                                        
        (vars.opaqueErr, vars.borrowRateMantissa) = interestRateModel.GETBORROWRATE648(GETCASHPRIOR761(), totalBorrows, totalReserves);
        require(vars.borrowRateMantissa <= borrowratemaxmantissa954, "borrow rate is absurdly high");
        if (vars.opaqueErr != 0) {
            return FAILOPAQUE40(Error.INTEREST_RATE_MODEL_ERROR, FailureInfo.ACCRUE_INTEREST_BORROW_RATE_CALCULATION_FAILED, vars.opaqueErr);
        }

                                               
        vars.currentBlockNumber = GETBLOCKNUMBER633();

                                                                           
        (vars.mathErr, vars.blockDelta) = SUBUINT336(vars.currentBlockNumber, accrualBlockNumber);
        assert(vars.mathErr == MathError.NO_ERROR); // Block delta should always succeed and if it doesn't, blow up.

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
        (vars.mathErr, vars.simpleInterestFactor) = MULSCALAR971(Exp({mantissa: vars.borrowRateMantissa}), vars.blockDelta);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_SIMPLE_INTEREST_FACTOR_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.interestAccumulated) = MULSCALARTRUNCATE842(vars.simpleInterestFactor, totalBorrows);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_ACCUMULATED_INTEREST_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalBorrowsNew) = ADDUINT627(vars.interestAccumulated, totalBorrows);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_TOTAL_BORROWS_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalReservesNew) = MULSCALARTRUNCATEADDUINT175(Exp({mantissa: reserveFactorMantissa}), vars.interestAccumulated, totalReserves);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_TOTAL_RESERVES_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.borrowIndexNew) = MULSCALARTRUNCATEADDUINT175(vars.simpleInterestFactor, borrowIndex, borrowIndex);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_BORROW_INDEX_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                    
        accrualBlockNumber = vars.currentBlockNumber;
        borrowIndex = vars.borrowIndexNew;
        totalBorrows = vars.totalBorrowsNew;
        totalReserves = vars.totalReservesNew;

                                             
        emit ACCRUEINTEREST515(vars.interestAccumulated, vars.borrowIndexNew, totalBorrows);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                       
    function MINTINTERNAL978(uint mintAmount) internal NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST395();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted borrow failed
            return FAIL339(Error(error), FailureInfo.MINT_ACCRUE_INTEREST_FAILED);
        }
        // mintFresh emits the actual Mint event if successful and logs on errors, so we don't need to
        return MINTFRESH127(msg.sender, mintAmount);
    }

    struct MintLocalVars {
        Error err;
        MathError mathErr;
        uint exchangeRateMantissa;
        uint mintTokens;
        uint totalSupplyNew;
        uint accountTokensNew;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                             
    function MINTFRESH127(address minter, uint mintAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
                                      
        uint allowed = comptroller.MINTALLOWED342(address(this), minter, mintAmount);
        if (allowed != 0) {
            return FAILOPAQUE40(Error.COMPTROLLER_REJECTION, FailureInfo.MINT_COMPTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER633()) {
            return FAIL339(Error.MARKET_NOT_FRESH, FailureInfo.MINT_FRESHNESS_CHECK);
        }

        MintLocalVars memory vars;

                                           
        vars.err = CHECKTRANSFERIN695(minter, mintAmount);
        if (vars.err != Error.NO_ERROR) {
            return FAIL339(vars.err, FailureInfo.MINT_TRANSFER_IN_NOT_POSSIBLE);
        }

                                                                                                                                                                       
        (vars.mathErr, vars.exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL283();
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.MINT_EXCHANGE_RATE_READ_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.mintTokens) = DIVSCALARBYEXPTRUNCATE98(mintAmount, Exp({mantissa: vars.exchangeRateMantissa}));
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.MINT_EXCHANGE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                                                                                                                                                                                                                                       
        (vars.mathErr, vars.totalSupplyNew) = ADDUINT627(totalSupply, vars.mintTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.MINT_NEW_TOTAL_SUPPLY_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.accountTokensNew) = ADDUINT627(accountTokens[minter], vars.mintTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.MINT_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                                                                                                                                                                                                                                                                                                                                                                  
        vars.err = DOTRANSFERIN134(minter, mintAmount);
        if (vars.err != Error.NO_ERROR) {
            return FAIL339(vars.err, FailureInfo.MINT_TRANSFER_IN_FAILED);
        }

                                                                
        totalSupply = vars.totalSupplyNew;
        accountTokens[minter] = vars.accountTokensNew;

                                                        
        emit MINT798(minter, mintAmount, vars.mintTokens);
        emit TRANSFER123(address(this), minter, vars.mintTokens);

                                      
        comptroller.MINTVERIFY442(address(this), minter, mintAmount, vars.mintTokens);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                
    function REDEEMINTERNAL888(uint redeemTokens) internal NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST395();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted redeem failed
            return FAIL339(Error(error), FailureInfo.REDEEM_ACCRUE_INTEREST_FAILED);
        }
        // redeemFresh emits redeem-specific logs on errors, so we don't need to
        return REDEEMFRESH520(msg.sender, redeemTokens, 0);
    }

                                                                                                                                                                                                                                                                                                                                                     
    function REDEEMUNDERLYINGINTERNAL985(uint redeemAmount) internal NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST395();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted redeem failed
            return FAIL339(Error(error), FailureInfo.REDEEM_ACCRUE_INTEREST_FAILED);
        }
        // redeemFresh emits redeem-specific logs on errors, so we don't need to
        return REDEEMFRESH520(msg.sender, 0, redeemAmount);
    }

    struct RedeemLocalVars {
        Error err;
        MathError mathErr;
        uint exchangeRateMantissa;
        uint redeemTokens;
        uint redeemAmount;
        uint totalSupplyNew;
        uint accountTokensNew;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function REDEEMFRESH520(address payable redeemer, uint redeemTokensIn, uint redeemAmountIn) internal returns (uint) {	//inject NONSTANDARD NAMING
        require(redeemTokensIn == 0 || redeemAmountIn == 0, "one of redeemTokensIn or redeemAmountIn must be zero");

        RedeemLocalVars memory vars;

                                                          
        (vars.mathErr, vars.exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL283();
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_RATE_READ_FAILED, uint(vars.mathErr));
        }

                                    
        if (redeemTokensIn > 0) {
                                                                                                                                                                                                                                           
            vars.redeemTokens = redeemTokensIn;

            (vars.mathErr, vars.redeemAmount) = MULSCALARTRUNCATE842(Exp({mantissa: vars.exchangeRateMantissa}), redeemTokensIn);
            if (vars.mathErr != MathError.NO_ERROR) {
                return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_TOKENS_CALCULATION_FAILED, uint(vars.mathErr));
            }
        } else {
                                                                                                                                                                                                                                  

            (vars.mathErr, vars.redeemTokens) = DIVSCALARBYEXPTRUNCATE98(redeemAmountIn, Exp({mantissa: vars.exchangeRateMantissa}));
            if (vars.mathErr != MathError.NO_ERROR) {
                return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_AMOUNT_CALCULATION_FAILED, uint(vars.mathErr));
            }

            vars.redeemAmount = redeemAmountIn;
        }

                                        
        uint allowed = comptroller.REDEEMALLOWED631(address(this), redeemer, vars.redeemTokens);
        if (allowed != 0) {
            return FAILOPAQUE40(Error.COMPTROLLER_REJECTION, FailureInfo.REDEEM_COMPTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER633()) {
            return FAIL339(Error.MARKET_NOT_FRESH, FailureInfo.REDEEM_FRESHNESS_CHECK);
        }

                                                                                                                                                                                                                                               
        (vars.mathErr, vars.totalSupplyNew) = SUBUINT336(totalSupply, vars.redeemTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.REDEEM_NEW_TOTAL_SUPPLY_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.accountTokensNew) = SUBUINT336(accountTokens[redeemer], vars.redeemTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.REDEEM_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                                               
        if (GETCASHPRIOR761() < vars.redeemAmount) {
            return FAIL339(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.REDEEM_TRANSFER_OUT_NOT_POSSIBLE);
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                                                                                                                                                                                                                                                                                                                                                                  
        vars.err = DOTRANSFEROUT434(redeemer, vars.redeemAmount);
        require(vars.err == Error.NO_ERROR, "redeem transfer out failed");

                                                                
        totalSupply = vars.totalSupplyNew;
        accountTokens[redeemer] = vars.accountTokensNew;

                                                          
        emit TRANSFER123(redeemer, address(this), vars.redeemTokens);
        emit REDEEM926(redeemer, vars.redeemAmount, vars.redeemTokens);

                                      
        comptroller.REDEEMVERIFY615(address(this), redeemer, vars.redeemAmount, vars.redeemTokens);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                              
    function BORROWINTERNAL390(uint borrowAmount) internal NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST395();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted borrow failed
            return FAIL339(Error(error), FailureInfo.BORROW_ACCRUE_INTEREST_FAILED);
        }
        // borrowFresh emits borrow-specific logs on errors, so we don't need to
        return BORROWFRESH605(msg.sender, borrowAmount);
    }

    struct BorrowLocalVars {
        Error err;
        MathError mathErr;
        uint accountBorrows;
        uint accountBorrowsNew;
        uint totalBorrowsNew;
    }

                                                                                                                                                                                                                                                            
    function BORROWFRESH605(address payable borrower, uint borrowAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
                                        
        uint allowed = comptroller.BORROWALLOWED514(address(this), borrower, borrowAmount);
        if (allowed != 0) {
            return FAILOPAQUE40(Error.COMPTROLLER_REJECTION, FailureInfo.BORROW_COMPTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER633()) {
            return FAIL339(Error.MARKET_NOT_FRESH, FailureInfo.BORROW_FRESHNESS_CHECK);
        }

                                                                          
        if (GETCASHPRIOR761() < borrowAmount) {
            return FAIL339(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.BORROW_CASH_NOT_AVAILABLE);
        }

        BorrowLocalVars memory vars;

                                                                                                                                                                                                                                       
        (vars.mathErr, vars.accountBorrows) = BORROWBALANCESTOREDINTERNAL395(borrower);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.accountBorrowsNew) = ADDUINT627(vars.accountBorrows, borrowAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalBorrowsNew) = ADDUINT627(totalBorrows, borrowAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                                                                                                                                                                                                                                                                                                                                                              
        vars.err = DOTRANSFEROUT434(borrower, borrowAmount);
        require(vars.err == Error.NO_ERROR, "borrow transfer out failed");

                                                                    
        accountBorrows[borrower].principal = vars.accountBorrowsNew;
        accountBorrows[borrower].interestIndex = borrowIndex;
        totalBorrows = vars.totalBorrowsNew;

                                    
        emit BORROW443(borrower, borrowAmount, vars.accountBorrowsNew, vars.totalBorrowsNew);

                                      
        comptroller.BORROWVERIFY924(address(this), borrower, borrowAmount);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                  
    function REPAYBORROWINTERNAL271(uint repayAmount) internal NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST395();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted borrow failed
            return FAIL339(Error(error), FailureInfo.REPAY_BORROW_ACCRUE_INTEREST_FAILED);
        }
        // repayBorrowFresh emits repay-borrow-specific logs on errors, so we don't need to
        return REPAYBORROWFRESH562(msg.sender, msg.sender, repayAmount);
    }

                                                                                                                                                                                                                                                                                 
    function REPAYBORROWBEHALFINTERNAL479(address borrower, uint repayAmount) internal NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST395();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted borrow failed
            return FAIL339(Error(error), FailureInfo.REPAY_BEHALF_ACCRUE_INTEREST_FAILED);
        }
        // repayBorrowFresh emits repay-borrow-specific logs on errors, so we don't need to
        return REPAYBORROWFRESH562(msg.sender, borrower, repayAmount);
    }

    struct RepayBorrowLocalVars {
        Error err;
        MathError mathErr;
        uint repayAmount;
        uint borrowerIndex;
        uint accountBorrows;
        uint accountBorrowsNew;
        uint totalBorrowsNew;
    }

                                                                                                                                                                                                                                                                                                                                                                                 
    function REPAYBORROWFRESH562(address payer, address borrower, uint repayAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
                                             
        uint allowed = comptroller.REPAYBORROWALLOWED49(address(this), payer, borrower, repayAmount);
        if (allowed != 0) {
            return FAILOPAQUE40(Error.COMPTROLLER_REJECTION, FailureInfo.REPAY_BORROW_COMPTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER633()) {
            return FAIL339(Error.MARKET_NOT_FRESH, FailureInfo.REPAY_BORROW_FRESHNESS_CHECK);
        }

        RepayBorrowLocalVars memory vars;

                                                                              
        vars.borrowerIndex = accountBorrows[borrower].interestIndex;

                                                                              
        (vars.mathErr, vars.accountBorrows) = BORROWBALANCESTOREDINTERNAL395(borrower);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.REPAY_BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                                                
        if (repayAmount == uint(-1)) {
            vars.repayAmount = vars.accountBorrows;
        } else {
            vars.repayAmount = repayAmount;
        }

                                           
        vars.err = CHECKTRANSFERIN695(payer, vars.repayAmount);
        if (vars.err != Error.NO_ERROR) {
            return FAIL339(vars.err, FailureInfo.REPAY_BORROW_TRANSFER_IN_NOT_POSSIBLE);
        }

                                                                                                                                                                                                                                      
        (vars.mathErr, vars.accountBorrowsNew) = SUBUINT336(vars.accountBorrows, vars.repayAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.REPAY_BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalBorrowsNew) = SUBUINT336(totalBorrows, vars.repayAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.REPAY_BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                                                                                                                                                                                                                                                                                                                                                                   
        vars.err = DOTRANSFERIN134(payer, vars.repayAmount);
        require(vars.err == Error.NO_ERROR, "repay borrow transfer in failed");

                                                                    
        accountBorrows[borrower].principal = vars.accountBorrowsNew;
        accountBorrows[borrower].interestIndex = borrowIndex;
        totalBorrows = vars.totalBorrowsNew;

                                         
        emit REPAYBORROW215(payer, borrower, vars.repayAmount, vars.accountBorrowsNew, vars.totalBorrowsNew);

                                      
        comptroller.REPAYBORROWVERIFY984(address(this), payer, borrower, vars.repayAmount, vars.borrowerIndex);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function LIQUIDATEBORROWINTERNAL787(address borrower, uint repayAmount, CToken cTokenCollateral) internal NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST395();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted liquidation failed
            return FAIL339(Error(error), FailureInfo.LIQUIDATE_ACCRUE_BORROW_INTEREST_FAILED);
        }

        error = cTokenCollateral.ACCRUEINTEREST395();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but we still want to log the fact that an attempted liquidation failed
            return FAIL339(Error(error), FailureInfo.LIQUIDATE_ACCRUE_COLLATERAL_INTEREST_FAILED);
        }

        // liquidateBorrowFresh emits borrow-specific logs on errors, so we don't need to
        return LIQUIDATEBORROWFRESH908(msg.sender, borrower, repayAmount, cTokenCollateral);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function LIQUIDATEBORROWFRESH908(address liquidator, address borrower, uint repayAmount, CToken cTokenCollateral) internal returns (uint) {	//inject NONSTANDARD NAMING
                                           
        uint allowed = comptroller.LIQUIDATEBORROWALLOWED284(address(this), address(cTokenCollateral), liquidator, borrower, repayAmount);
        if (allowed != 0) {
            return FAILOPAQUE40(Error.COMPTROLLER_REJECTION, FailureInfo.LIQUIDATE_COMPTROLLER_REJECTION, allowed);
        }

                                                                      
        if (accrualBlockNumber != GETBLOCKNUMBER633()) {
            return FAIL339(Error.MARKET_NOT_FRESH, FailureInfo.LIQUIDATE_FRESHNESS_CHECK);
        }

                                                                                       
        if (cTokenCollateral.accrualBlockNumber() != GETBLOCKNUMBER633()) {
            return FAIL339(Error.MARKET_NOT_FRESH, FailureInfo.LIQUIDATE_COLLATERAL_FRESHNESS_CHECK);
        }

                                           
        if (borrower == liquidator) {
            return FAIL339(Error.INVALID_ACCOUNT_PAIR, FailureInfo.LIQUIDATE_LIQUIDATOR_IS_BORROWER);
        }

                                     
        if (repayAmount == 0) {
            return FAIL339(Error.INVALID_CLOSE_AMOUNT_REQUESTED, FailureInfo.LIQUIDATE_CLOSE_AMOUNT_IS_ZERO);
        }

                                      
        if (repayAmount == uint(-1)) {
            return FAIL339(Error.INVALID_CLOSE_AMOUNT_REQUESTED, FailureInfo.LIQUIDATE_CLOSE_AMOUNT_IS_UINT_MAX);
        }

                                                                              
        (uint amountSeizeError, uint seizeTokens) = comptroller.LIQUIDATECALCULATESEIZETOKENS267(address(this), address(cTokenCollateral), repayAmount);
        if (amountSeizeError != 0) {
            return FAILOPAQUE40(Error.COMPTROLLER_CALCULATION_ERROR, FailureInfo.LIQUIDATE_COMPTROLLER_CALCULATE_AMOUNT_SEIZE_FAILED, amountSeizeError);
        }

                                                                     
        if (seizeTokens > cTokenCollateral.BALANCEOF800(borrower)) {
            return FAIL339(Error.TOKEN_INSUFFICIENT_BALANCE, FailureInfo.LIQUIDATE_SEIZE_TOO_MUCH);
        }

                                       
        uint repayBorrowError = REPAYBORROWFRESH562(liquidator, borrower, repayAmount);
        if (repayBorrowError != uint(Error.NO_ERROR)) {
            return FAIL339(Error(repayBorrowError), FailureInfo.LIQUIDATE_REPAY_BORROW_FRESH_FAILED);
        }

                                                                                    
        uint seizeError = cTokenCollateral.SEIZE260(liquidator, borrower, seizeTokens);
        require(seizeError == uint(Error.NO_ERROR), "token seizure failed");

                                             
        emit LIQUIDATEBORROW267(liquidator, borrower, repayAmount, address(cTokenCollateral), seizeTokens);

                                      
        comptroller.LIQUIDATEBORROWVERIFY992(address(this), address(cTokenCollateral), liquidator, borrower, repayAmount, seizeTokens);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function SEIZE260(address liquidator, address borrower, uint seizeTokens) external NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
                                       
        uint allowed = comptroller.SEIZEALLOWED906(address(this), msg.sender, liquidator, borrower, seizeTokens);
        if (allowed != 0) {
            return FAILOPAQUE40(Error.COMPTROLLER_REJECTION, FailureInfo.LIQUIDATE_SEIZE_COMPTROLLER_REJECTION, allowed);
        }

                                           
        if (borrower == liquidator) {
            return FAIL339(Error.INVALID_ACCOUNT_PAIR, FailureInfo.LIQUIDATE_SEIZE_LIQUIDATOR_IS_BORROWER);
        }

        MathError mathErr;
        uint borrowerTokensNew;
        uint liquidatorTokensNew;

                                                                                                                                                                                                                                                                             
        (mathErr, borrowerTokensNew) = SUBUINT336(accountTokens[borrower], seizeTokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.LIQUIDATE_SEIZE_BALANCE_DECREMENT_FAILED, uint(mathErr));
        }

        (mathErr, liquidatorTokensNew) = ADDUINT627(accountTokens[liquidator], seizeTokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE40(Error.MATH_ERROR, FailureInfo.LIQUIDATE_SEIZE_BALANCE_INCREMENT_FAILED, uint(mathErr));
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

                                                                    
        accountTokens[borrower] = borrowerTokensNew;
        accountTokens[liquidator] = liquidatorTokensNew;

                                   
        emit TRANSFER123(borrower, liquidator, seizeTokens);

                                      
        comptroller.SEIZEVERIFY161(address(this), msg.sender, liquidator, borrower, seizeTokens);

        return uint(Error.NO_ERROR);
    }


                             

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _SETPENDINGADMIN210(address payable newPendingAdmin) external returns (uint) {	//inject NONSTANDARD NAMING
        // Check caller = admin
        if (msg.sender != admin) {
            return FAIL339(Error.UNAUTHORIZED, FailureInfo.SET_PENDING_ADMIN_OWNER_CHECK);
        }

        // Save current value, if any, for inclusion in log
        address oldPendingAdmin = pendingAdmin;

        // Store pendingAdmin with value newPendingAdmin
        pendingAdmin = newPendingAdmin;

        // Emit NewPendingAdmin(oldPendingAdmin, newPendingAdmin)
        emit NEWPENDINGADMIN221(oldPendingAdmin, newPendingAdmin);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                        
    function _ACCEPTADMIN754() external returns (uint) {	//inject NONSTANDARD NAMING
        // Check caller is pendingAdmin and pendingAdmin 1 address(0)
        if (msg.sender != pendingAdmin || msg.sender == address(0)) {
            return FAIL339(Error.UNAUTHORIZED, FailureInfo.ACCEPT_ADMIN_PENDING_ADMIN_CHECK);
        }

        // Save current values for inclusion in log
        address oldAdmin = admin;
        address oldPendingAdmin = pendingAdmin;

        // Store admin with value pendingAdmin
        admin = pendingAdmin;

        // Clear the pending value
        pendingAdmin = address(0);

        emit NEWADMIN895(oldAdmin, admin);
        emit NEWPENDINGADMIN221(oldPendingAdmin, pendingAdmin);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                   
    function _SETCOMPTROLLER437(ComptrollerInterface newComptroller) public returns (uint) {	//inject NONSTANDARD NAMING
        // Check caller is admin
        if (msg.sender != admin) {
            return FAIL339(Error.UNAUTHORIZED, FailureInfo.SET_COMPTROLLER_OWNER_CHECK);
        }

        ComptrollerInterface oldComptroller = comptroller;
        // Ensure invoke comptroller.isComptroller() returns true
        require(newComptroller.ISCOMPTROLLER719(), "marker method returned false");

        // Set market's comptroller to newComptroller
        comptroller = newComptroller;

        // Emit NewComptroller(oldComptroller, newComptroller)
        emit NEWCOMPTROLLER211(oldComptroller, newComptroller);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                 
    function _SETRESERVEFACTOR115(uint newReserveFactorMantissa) external NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST395();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but on top of that we want to log the fact that an attempted reserve factor change failed.
            return FAIL339(Error(error), FailureInfo.SET_RESERVE_FACTOR_ACCRUE_INTEREST_FAILED);
        }
        // _setReserveFactorFresh emits reserve-factor-specific logs on errors, so we don't need to.
        return _SETRESERVEFACTORFRESH713(newReserveFactorMantissa);
    }

                                                                                                                                                                                                                                                              
    function _SETRESERVEFACTORFRESH713(uint newReserveFactorMantissa) internal returns (uint) {	//inject NONSTANDARD NAMING
        // Check caller is admin
        if (msg.sender != admin) {
            return FAIL339(Error.UNAUTHORIZED, FailureInfo.SET_RESERVE_FACTOR_ADMIN_CHECK);
        }

        // Verify market's block number equals current block number
        if (accrualBlockNumber != GETBLOCKNUMBER633()) {
            // TODO: static_assert + no error code?
            return FAIL339(Error.MARKET_NOT_FRESH, FailureInfo.SET_RESERVE_FACTOR_FRESH_CHECK);
        }

        // Check newReserveFactor 1 maxReserveFactor
        if (newReserveFactorMantissa > reservefactormaxmantissa965) {
            return FAIL339(Error.BAD_INPUT, FailureInfo.SET_RESERVE_FACTOR_BOUNDS_CHECK);
        }

        uint oldReserveFactorMantissa = reserveFactorMantissa;
        reserveFactorMantissa = newReserveFactorMantissa;

        emit NEWRESERVEFACTOR137(oldReserveFactorMantissa, newReserveFactorMantissa);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                               
    function _REDUCERESERVES31(uint reduceAmount) external NONREENTRANT512 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST395();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but on top of that we want to log the fact that an attempted reduce reserves failed.
            return FAIL339(Error(error), FailureInfo.REDUCE_RESERVES_ACCRUE_INTEREST_FAILED);
        }
        // _reduceReservesFresh emits reserve-reduction-specific logs on errors, so we don't need to.
        return _REDUCERESERVESFRESH730(reduceAmount);
    }

                                                                                                                                                                                                                                                                      
    function _REDUCERESERVESFRESH730(uint reduceAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
        Error err;
        // totalReserves - reduceAmount
        uint totalReservesNew;

        // Check caller is admin
        if (msg.sender != admin) {
            return FAIL339(Error.UNAUTHORIZED, FailureInfo.REDUCE_RESERVES_ADMIN_CHECK);
        }

        // We fail gracefully unless market's block number equals current block number
        if (accrualBlockNumber != GETBLOCKNUMBER633()) {
            // TODO: static_assert + no error code?
            return FAIL339(Error.MARKET_NOT_FRESH, FailureInfo.REDUCE_RESERVES_FRESH_CHECK);
        }

        // Fail gracefully if protocol has insufficient underlying cash
        if (GETCASHPRIOR761() < reduceAmount) {
            return FAIL339(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.REDUCE_RESERVES_CASH_NOT_AVAILABLE);
        }

        // Check reduceAmount 1 reserves[n] (totalReserves)
        // TODO: I'm following the spec literally here but I think we should we just use SafeMath instead and fail on an error (which would be underflow)
        if (reduceAmount > totalReserves) {
            return FAIL339(Error.BAD_INPUT, FailureInfo.REDUCE_RESERVES_VALIDATION);
        }

                                 
        // EFFECTS & INTERACTIONS
        // (No safe failures beyond this point)

        totalReservesNew = totalReserves - reduceAmount;
        // We checked reduceAmount <= totalReserves above, so this should never revert.
        require(totalReservesNew <= totalReserves, "reduce reserves unexpected underflow");

        // Store reserves[n+1] = reserves[n] - reduceAmount
        totalReserves = totalReservesNew;

        // invoke doTransferOut(reduceAmount, admin)
        err = DOTRANSFEROUT434(admin, reduceAmount);
        // we revert on the failure of this command
        require(err == Error.NO_ERROR, "reduce reserves transfer out failed");

        emit RESERVESREDUCED17(admin, reduceAmount, totalReservesNew);

        return uint(Error.NO_ERROR);
    }

                                                                                                                                                                                                                                                                                                                                                                  
    function _SETINTERESTRATEMODEL475(InterestRateModel newInterestRateModel) public returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST395();
        if (error != uint(Error.NO_ERROR)) {
            // accrueInterest emits logs on errors, but on top of that we want to log the fact that an attempted change of interest rate model failed
            return FAIL339(Error(error), FailureInfo.SET_INTEREST_RATE_MODEL_ACCRUE_INTEREST_FAILED);
        }
        // _setInterestRateModelFresh emits interest-rate-model-update-specific logs on errors, so we don't need to.
        return _SETINTERESTRATEMODELFRESH751(newInterestRateModel);
    }

                                                                                                                                                                                                                                                                                                                           
    function _SETINTERESTRATEMODELFRESH751(InterestRateModel newInterestRateModel) internal returns (uint) {	//inject NONSTANDARD NAMING

        // Used to store old model for use in the event that is emitted on success
        InterestRateModel oldInterestRateModel;

        // Check caller is admin
        if (msg.sender != admin) {
            return FAIL339(Error.UNAUTHORIZED, FailureInfo.SET_INTEREST_RATE_MODEL_OWNER_CHECK);
        }

        // We fail gracefully unless market's block number equals current block number
        if (accrualBlockNumber != GETBLOCKNUMBER633()) {
            // TODO: static_assert + no error code?
            return FAIL339(Error.MARKET_NOT_FRESH, FailureInfo.SET_INTEREST_RATE_MODEL_FRESH_CHECK);
        }

        // Track the market's current interest rate model
        oldInterestRateModel = interestRateModel;

        // Ensure invoke newInterestRateModel.isInterestRateModel() returns true
        require(newInterestRateModel.ISINTERESTRATEMODEL967(), "marker method returned false");

        // Set the interest rate model to newInterestRateModel
        interestRateModel = newInterestRateModel;

        // Emit NewMarketInterestRateModel(oldInterestRateModel, newInterestRateModel)
        emit NEWMARKETINTERESTRATEMODEL719(oldInterestRateModel, newInterestRateModel);

        return uint(Error.NO_ERROR);
    }

                        

                                                                                                                                                                                                                           
    function GETCASHPRIOR761() internal view returns (uint);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                              
    function CHECKTRANSFERIN695(address from, uint amount) internal view returns (Error);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                        
    function DOTRANSFERIN134(address from, uint amount) internal returns (Error);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                        
    function DOTRANSFEROUT434(address payable to, uint amount) internal returns (Error);	//inject NONSTANDARD NAMING
}

// File: contracts/CEther.sol

pragma solidity ^0.5.8;


                                                                                                    
contract CEther is CToken {
                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    constructor(ComptrollerInterface comptroller_,
                InterestRateModel interestRateModel_,
                uint initialExchangeRateMantissa_,
                string memory name_,
                string memory symbol_,
                uint decimals_) public
    CToken(comptroller_, interestRateModel_, initialExchangeRateMantissa_, name_, symbol_, decimals_) {}

                            

                                                                                                                                           
    function MINT742() external payable {	//inject NONSTANDARD NAMING
        REQUIRENOERROR761(MINTINTERNAL978(msg.value), "mint failed");
    }

                                                                                                                                                                                                                                                                                                                                                
    function REDEEM330(uint redeemTokens) external returns (uint) {	//inject NONSTANDARD NAMING
        return REDEEMINTERNAL888(redeemTokens);
    }

                                                                                                                                                                                                                                                                                                                                                     
    function REDEEMUNDERLYING23(uint redeemAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return REDEEMUNDERLYINGINTERNAL985(redeemAmount);
    }

                                                                                                                                                                                                                                                              
    function BORROW876(uint borrowAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return BORROWINTERNAL390(borrowAmount);
    }

                                                                                                  
    function REPAYBORROW629() external payable {	//inject NONSTANDARD NAMING
        REQUIRENOERROR761(REPAYBORROWINTERNAL271(msg.value), "repayBorrow failed");
    }

                                                                                                                                                                                 
    function REPAYBORROWBEHALF441(address borrower) external payable {	//inject NONSTANDARD NAMING
        REQUIRENOERROR761(REPAYBORROWBEHALFINTERNAL479(borrower, msg.value), "repayBorrowBehalf failed");
    }

                                                                                                                                                                                                                                                                                                                                                
    function LIQUIDATEBORROW293(address borrower, CToken cTokenCollateral) external payable {	//inject NONSTANDARD NAMING
        REQUIRENOERROR761(LIQUIDATEBORROWINTERNAL787(borrower, msg.value, cTokenCollateral), "liquidateBorrow failed");
    }

                                                           
    function () external payable {
        REQUIRENOERROR761(MINTINTERNAL978(msg.value), "mint failed");
    }

                        

                                                                                                                                                                                                                                  
    function GETCASHPRIOR761() internal view returns (uint) {	//inject NONSTANDARD NAMING
        (MathError err, uint startingBalance) = SUBUINT336(address(this).balance, msg.value);
        require(err == MathError.NO_ERROR);
        return startingBalance;
    }

                                                                                                                                                                                                                                                                            
    function CHECKTRANSFERIN695(address from, uint amount) internal view returns (Error) {	//inject NONSTANDARD NAMING
        // Sanity checks
        require(msg.sender == from, "sender mismatch");
        require(msg.value == amount, "value mismatch");
        return Error.NO_ERROR;
    }

                                                                                                                                                                                                   
    function DOTRANSFERIN134(address from, uint amount) internal returns (Error) {	//inject NONSTANDARD NAMING
        // Sanity checks
        require(msg.sender == from, "sender mismatch");
        require(msg.value == amount, "value mismatch");
        return Error.NO_ERROR;
    }

    function DOTRANSFEROUT434(address payable to, uint amount) internal returns (Error) {	//inject NONSTANDARD NAMING
                                                                    
        to.transfer(amount);
        return Error.NO_ERROR;
    }

    function REQUIRENOERROR761(uint errCode, string memory message) internal pure {	//inject NONSTANDARD NAMING
        if (errCode == uint(Error.NO_ERROR)) {
            return;
        }

        bytes memory fullMessage = new bytes(bytes(message).length + 5);
        uint i;

        for (i = 0; i < bytes(message).length; i++) {
            fullMessage[i] = bytes(message)[i];
        }

        fullMessage[i+0] = byte(uint8(32));
        fullMessage[i+1] = byte(uint8(40));
        fullMessage[i+2] = byte(uint8(48 + ( errCode / 10 )));
        fullMessage[i+3] = byte(uint8(48 + ( errCode % 10 )));
        fullMessage[i+4] = byte(uint8(41));

        require(errCode == uint(Error.NO_ERROR), string(fullMessage));
    }
}