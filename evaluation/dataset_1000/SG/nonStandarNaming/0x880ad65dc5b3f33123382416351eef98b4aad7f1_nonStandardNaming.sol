                                                                 

pragma solidity ^0.5.8;


interface ILiquidityPool {
    
    
    function TAKE813(address _token, uint256 _amount) external;	//inject NONSTANDARD NAMING

    
    
    function DEPOSIT230(address _token, uint256 _amount) external returns (uint256);	//inject NONSTANDARD NAMING

    
    
    function WITHDRAW608(address _token, uint256 _amount) external;	//inject NONSTANDARD NAMING

    
    
    
    function ISETHER496(address _ether) external pure returns (bool);	//inject NONSTANDARD NAMING
}

interface IRebalancer {
    
    
    
    
    
    
    function GIVEUNBALANCEDPOSITION383(address _negToken, uint256 _negAmount, address _posToken, uint256 _posAmount) external payable;	//inject NONSTANDARD NAMING
}

contract Context {
    
    
    constructor () internal { }
    

    function _MSGSENDER316() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA582() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; 
        return msg.data;
    }
}

contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED197(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    
    constructor () internal {
        _owner = _MSGSENDER316();
        emit OWNERSHIPTRANSFERRED197(address(0), _owner);
    }

    
    function OWNER749() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

    
    modifier ONLYOWNER996() {	//inject NONSTANDARD NAMING
        require(ISOWNER95(), "Ownable: caller is not the owner");
        _;
    }

    
    function ISOWNER95() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER316() == _owner;
    }

    
    function RENOUNCEOWNERSHIP300() public ONLYOWNER996 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED197(_owner, address(0));
        _owner = address(0);
    }

    
    function TRANSFEROWNERSHIP284(address newOwner) public ONLYOWNER996 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP741(newOwner);
    }

    
    function _TRANSFEROWNERSHIP741(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED197(_owner, newOwner);
        _owner = newOwner;
    }
}

interface IERC20 {
    
    function TOTALSUPPLY576() external view returns (uint256);	//inject NONSTANDARD NAMING

    
    function BALANCEOF373(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

    
    function TRANSFER173(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    
    function ALLOWANCE822(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    
    function APPROVE759(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    
    function TRANSFERFROM471(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    
    event TRANSFER53(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    
    event APPROVAL973(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    
    function ADD53(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    
    function SUB559(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB559(a, b, "SafeMath: subtraction overflow");
    }

    
    function SUB559(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    
    function MUL752(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    
    function DIV599(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV599(a, b, "SafeMath: division by zero");
    }

    
    function DIV599(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        
        require(b > 0, errorMessage);
        uint256 c = a / b;
        

        return c;
    }

    
    function MOD337(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD337(a, b, "SafeMath: modulo by zero");
    }

    
    function MOD337(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    
    function TOTALSUPPLY576() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    
    function BALANCEOF373(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    
    function TRANSFER173(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER361(_MSGSENDER316(), recipient, amount);
        return true;
    }

    
    function ALLOWANCE822(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    
    function APPROVE759(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE411(_MSGSENDER316(), spender, amount);
        return true;
    }

    
    function TRANSFERFROM471(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER361(sender, recipient, amount);
        _APPROVE411(sender, _MSGSENDER316(), _allowances[sender][_MSGSENDER316()].SUB559(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    
    function INCREASEALLOWANCE595(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE411(_MSGSENDER316(), spender, _allowances[_MSGSENDER316()][spender].ADD53(addedValue));
        return true;
    }

    
    function DECREASEALLOWANCE127(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE411(_MSGSENDER316(), spender, _allowances[_MSGSENDER316()][spender].SUB559(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    
    function _TRANSFER361(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB559(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD53(amount);
        emit TRANSFER53(sender, recipient, amount);
    }

    
    function _MINT52(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD53(amount);
        _balances[account] = _balances[account].ADD53(amount);
        emit TRANSFER53(address(0), account, amount);
    }

     
    function _BURN896(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB559(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB559(amount);
        emit TRANSFER53(account, address(0), amount);
    }

    
    function _APPROVE411(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL973(owner, spender, amount);
    }

    
    function _BURNFROM736(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN896(account, amount);
        _APPROVE411(account, _MSGSENDER316(), _allowances[account][_MSGSENDER316()].SUB559(amount, "ERC20: burn amount exceeds allowance"));
    }
}

library Address {
    
    function ISCONTRACT714(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        
        
        

        
        
        
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }

    
    function TOPAYABLE215(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

    
    function SENDVALUE140(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER78(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN171(token, abi.encodeWithSelector(token.TRANSFER173.selector, to, value));
    }

    function SAFETRANSFERFROM383(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN171(token, abi.encodeWithSelector(token.TRANSFERFROM471.selector, from, to, value));
    }

    function SAFEAPPROVE45(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        
        
        
        
        require((value == 0) || (token.ALLOWANCE822(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN171(token, abi.encodeWithSelector(token.APPROVE759.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE416(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE822(address(this), spender).ADD53(value);
        CALLOPTIONALRETURN171(token, abi.encodeWithSelector(token.APPROVE759.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE137(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE822(address(this), spender).SUB559(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN171(token, abi.encodeWithSelector(token.APPROVE759.selector, spender, newAllowance));
    }

    
    function CALLOPTIONALRETURN171(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        
        

        
        
        
        
        
        require(address(token).ISCONTRACT714(), "SafeERC20: call to non-contract");

        
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { 
            
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract CanReclaimTokens is Ownable {
    using SafeERC20 for ERC20;

    mapping(address => bool) private recoverableTokensBlacklist;

    function BLACKLISTRECOVERABLETOKEN347(address _token) public ONLYOWNER996 {	//inject NONSTANDARD NAMING
        recoverableTokensBlacklist[_token] = true;
    }

    
    
    function RECOVERTOKENS948(address _token) external ONLYOWNER996 {	//inject NONSTANDARD NAMING
        require(!recoverableTokensBlacklist[_token], "CanReclaimTokens: token is not recoverable");

        if (_token == address(0x0)) {
            msg.sender.transfer(address(this).balance);
        } else {
            ERC20(_token).SAFETRANSFER78(msg.sender, ERC20(_token).BALANCEOF373(address(this)));
        }
    }
}

interface ComptrollerInterface {
    
    function ISCOMPTROLLER617() external view returns (bool);	//inject NONSTANDARD NAMING

    

    function ENTERMARKETS292(address[] calldata cTokens) external returns (uint[] memory);	//inject NONSTANDARD NAMING
    function EXITMARKET548(address cToken) external returns (uint);	//inject NONSTANDARD NAMING

    

    function MINTALLOWED780(address cToken, address minter, uint mintAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function MINTVERIFY904(address cToken, address minter, uint mintAmount, uint mintTokens) external;	//inject NONSTANDARD NAMING

    function REDEEMALLOWED712(address cToken, address redeemer, uint redeemTokens) external returns (uint);	//inject NONSTANDARD NAMING
    function REDEEMVERIFY97(address cToken, address redeemer, uint redeemAmount, uint redeemTokens) external;	//inject NONSTANDARD NAMING

    function BORROWALLOWED637(address cToken, address borrower, uint borrowAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function BORROWVERIFY402(address cToken, address borrower, uint borrowAmount) external;	//inject NONSTANDARD NAMING

    function REPAYBORROWALLOWED332(	//inject NONSTANDARD NAMING
        address cToken,
        address payer,
        address borrower,
        uint repayAmount) external returns (uint);
    function REPAYBORROWVERIFY773(	//inject NONSTANDARD NAMING
        address cToken,
        address payer,
        address borrower,
        uint repayAmount,
        uint borrowerIndex) external;

    function LIQUIDATEBORROWALLOWED865(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount) external returns (uint);
    function LIQUIDATEBORROWVERIFY217(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount,
        uint seizeTokens) external;

    function SEIZEALLOWED564(	//inject NONSTANDARD NAMING
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external returns (uint);
    function SEIZEVERIFY574(	//inject NONSTANDARD NAMING
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external;

    function TRANSFERALLOWED19(address cToken, address src, address dst, uint transferTokens) external returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFERVERIFY472(address cToken, address src, address dst, uint transferTokens) external;	//inject NONSTANDARD NAMING

    

    function LIQUIDATECALCULATESEIZETOKENS887(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        uint repayAmount) external view returns (uint, uint);
}

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
        SET_PAUSE_GUARDIAN_OWNER_CHECK
    }

    
    event FAILURE607(uint error, uint info, uint detail);	//inject NONSTANDARD NAMING

    
    function FAIL155(Error err, FailureInfo info) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE607(uint(err), uint(info), 0);

        return uint(err);
    }

    
    function FAILOPAQUE17(Error err, FailureInfo info, uint opaqueError) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE607(uint(err), uint(info), opaqueError);

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

    
    event FAILURE607(uint error, uint info, uint detail);	//inject NONSTANDARD NAMING

    
    function FAIL155(Error err, FailureInfo info) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE607(uint(err), uint(info), 0);

        return uint(err);
    }

    
    function FAILOPAQUE17(Error err, FailureInfo info, uint opaqueError) internal returns (uint) {	//inject NONSTANDARD NAMING
        emit FAILURE607(uint(err), uint(info), opaqueError);

        return uint(err);
    }
}

contract CarefulMath {

    
    enum MathError {
        NO_ERROR,
        DIVISION_BY_ZERO,
        INTEGER_OVERFLOW,
        INTEGER_UNDERFLOW
    }

    
    function MULUINT824(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
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

    
    function DIVUINT515(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (b == 0) {
            return (MathError.DIVISION_BY_ZERO, 0);
        }

        return (MathError.NO_ERROR, a / b);
    }

    
    function SUBUINT706(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (b <= a) {
            return (MathError.NO_ERROR, a - b);
        } else {
            return (MathError.INTEGER_UNDERFLOW, 0);
        }
    }

    
    function ADDUINT472(uint a, uint b) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;

        if (c >= a) {
            return (MathError.NO_ERROR, c);
        } else {
            return (MathError.INTEGER_OVERFLOW, 0);
        }
    }

    
    function ADDTHENSUBUINT110(uint a, uint b, uint c) internal pure returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err0, uint sum) = ADDUINT472(a, b);

        if (err0 != MathError.NO_ERROR) {
            return (err0, 0);
        }

        return SUBUINT706(sum, c);
    }
}

contract Exponential is CarefulMath {
    uint constant expscale434 = 1e18;	//inject NONSTANDARD NAMING
    uint constant halfexpscale30 = expscale434/2;	//inject NONSTANDARD NAMING
    uint constant mantissaone609 = expscale434;	//inject NONSTANDARD NAMING

    struct Exp {
        uint mantissa;
    }

    
    function GETEXP523(uint num, uint denom) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint scaledNumerator) = MULUINT824(num, expscale434);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        (MathError err1, uint rational) = DIVUINT515(scaledNumerator, denom);
        if (err1 != MathError.NO_ERROR) {
            return (err1, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: rational}));
    }

    
    function ADDEXP118(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError error, uint result) = ADDUINT472(a.mantissa, b.mantissa);

        return (error, Exp({mantissa: result}));
    }

    
    function SUBEXP690(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError error, uint result) = SUBUINT706(a.mantissa, b.mantissa);

        return (error, Exp({mantissa: result}));
    }

    
    function MULSCALAR762(Exp memory a, uint scalar) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint scaledMantissa) = MULUINT824(a.mantissa, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: scaledMantissa}));
    }

    
    function MULSCALARTRUNCATE358(Exp memory a, uint scalar) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory product) = MULSCALAR762(a, scalar);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return (MathError.NO_ERROR, TRUNCATE841(product));
    }

    
    function MULSCALARTRUNCATEADDUINT969(Exp memory a, uint scalar, uint addend) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory product) = MULSCALAR762(a, scalar);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return ADDUINT472(TRUNCATE841(product), addend);
    }

    
    function DIVSCALAR665(Exp memory a, uint scalar) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err0, uint descaledMantissa) = DIVUINT515(a.mantissa, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        return (MathError.NO_ERROR, Exp({mantissa: descaledMantissa}));
    }

    
    function DIVSCALARBYEXP297(uint scalar, Exp memory divisor) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        
        (MathError err0, uint numerator) = MULUINT824(expscale434, scalar);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }
        return GETEXP523(numerator, divisor.mantissa);
    }

    
    function DIVSCALARBYEXPTRUNCATE87(uint scalar, Exp memory divisor) pure internal returns (MathError, uint) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory fraction) = DIVSCALARBYEXP297(scalar, divisor);
        if (err != MathError.NO_ERROR) {
            return (err, 0);
        }

        return (MathError.NO_ERROR, TRUNCATE841(fraction));
    }

    
    function MULEXP331(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING

        (MathError err0, uint doubleScaledProduct) = MULUINT824(a.mantissa, b.mantissa);
        if (err0 != MathError.NO_ERROR) {
            return (err0, Exp({mantissa: 0}));
        }

        
        
        
        (MathError err1, uint doubleScaledProductWithHalfScale) = ADDUINT472(halfexpscale30, doubleScaledProduct);
        if (err1 != MathError.NO_ERROR) {
            return (err1, Exp({mantissa: 0}));
        }

        (MathError err2, uint product) = DIVUINT515(doubleScaledProductWithHalfScale, expscale434);
        
        assert(err2 == MathError.NO_ERROR);

        return (MathError.NO_ERROR, Exp({mantissa: product}));
    }

    
    function MULEXP331(uint a, uint b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        return MULEXP331(Exp({mantissa: a}), Exp({mantissa: b}));
    }

    
    function MULEXP3150(Exp memory a, Exp memory b, Exp memory c) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        (MathError err, Exp memory ab) = MULEXP331(a, b);
        if (err != MathError.NO_ERROR) {
            return (err, ab);
        }
        return MULEXP331(ab, c);
    }

    
    function DIVEXP189(Exp memory a, Exp memory b) pure internal returns (MathError, Exp memory) {	//inject NONSTANDARD NAMING
        return GETEXP523(a.mantissa, b.mantissa);
    }

    
    function TRUNCATE841(Exp memory exp) pure internal returns (uint) {	//inject NONSTANDARD NAMING
        
        return exp.mantissa / expscale434;
    }

    
    function LESSTHANEXP75(Exp memory left, Exp memory right) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return left.mantissa < right.mantissa;
    }

    
    function LESSTHANOREQUALEXP110(Exp memory left, Exp memory right) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return left.mantissa <= right.mantissa;
    }

    
    function GREATERTHANEXP450(Exp memory left, Exp memory right) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return left.mantissa > right.mantissa;
    }

    
    function ISZEROEXP845(Exp memory value) pure internal returns (bool) {	//inject NONSTANDARD NAMING
        return value.mantissa == 0;
    }
}

interface EIP20Interface {

    
    function TOTALSUPPLY576() external view returns (uint256);	//inject NONSTANDARD NAMING

    
    function BALANCEOF373(address owner) external view returns (uint256 balance);	//inject NONSTANDARD NAMING

    
    function TRANSFER173(address dst, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

    
    function TRANSFERFROM471(address src, address dst, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

    
    function APPROVE759(address spender, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

    
    function ALLOWANCE822(address owner, address spender) external view returns (uint256 remaining);	//inject NONSTANDARD NAMING

    event TRANSFER53(address indexed from, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event APPROVAL973(address indexed owner, address indexed spender, uint256 amount);	//inject NONSTANDARD NAMING
}

interface EIP20NonStandardInterface {

    
    function TOTALSUPPLY576() external view returns (uint256);	//inject NONSTANDARD NAMING

    
    function BALANCEOF373(address owner) external view returns (uint256 balance);	//inject NONSTANDARD NAMING

    
    
    
    
    

    
    function TRANSFER173(address dst, uint256 amount) external;	//inject NONSTANDARD NAMING

    
    
    
    
    

    
    function TRANSFERFROM471(address src, address dst, uint256 amount) external;	//inject NONSTANDARD NAMING

    
    function APPROVE759(address spender, uint256 amount) external returns (bool success);	//inject NONSTANDARD NAMING

    
    function ALLOWANCE822(address owner, address spender) external view returns (uint256 remaining);	//inject NONSTANDARD NAMING

    event TRANSFER53(address indexed from, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event APPROVAL973(address indexed owner, address indexed spender, uint256 amount);	//inject NONSTANDARD NAMING
}

contract ReentrancyGuard {
    
    uint256 private _guardCounter;

    constructor () internal {
        
        
        _guardCounter = 1;
    }

    
    modifier NONREENTRANT733() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "re-entered");
    }
}

interface InterestRateModel {
    
    function GETBORROWRATE532(uint cash, uint borrows, uint reserves) external view returns (uint, uint);	//inject NONSTANDARD NAMING

    
    function ISINTERESTRATEMODEL817() external view returns (bool);	//inject NONSTANDARD NAMING
}

contract CToken is EIP20Interface, Exponential, TokenErrorReporter, ReentrancyGuard {
    
    bool public constant isctoken718 = true;	//inject NONSTANDARD NAMING

    
    string public name;

    
    string public symbol;

    
    uint8 public decimals;

    

    uint internal constant borrowratemaxmantissa614 = 0.0005e16;	//inject NONSTANDARD NAMING

    
    uint internal constant reservefactormaxmantissa925 = 1e18;	//inject NONSTANDARD NAMING

    
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

    
    mapping (address => uint256) internal accountTokens;

    
    mapping (address => mapping (address => uint256)) internal transferAllowances;

    
    struct BorrowSnapshot {
        uint principal;
        uint interestIndex;
    }

    
    mapping(address => BorrowSnapshot) internal accountBorrows;


    

    
    event ACCRUEINTEREST221(uint interestAccumulated, uint borrowIndex, uint totalBorrows);	//inject NONSTANDARD NAMING

    
    event MINT76(address minter, uint mintAmount, uint mintTokens);	//inject NONSTANDARD NAMING

    
    event REDEEM786(address redeemer, uint redeemAmount, uint redeemTokens);	//inject NONSTANDARD NAMING

    
    event BORROW192(address borrower, uint borrowAmount, uint accountBorrows, uint totalBorrows);	//inject NONSTANDARD NAMING

    
    event REPAYBORROW356(address payer, address borrower, uint repayAmount, uint accountBorrows, uint totalBorrows);	//inject NONSTANDARD NAMING

    
    event LIQUIDATEBORROW83(address liquidator, address borrower, uint repayAmount, address cTokenCollateral, uint seizeTokens);	//inject NONSTANDARD NAMING


    

    
    event NEWPENDINGADMIN372(address oldPendingAdmin, address newPendingAdmin);	//inject NONSTANDARD NAMING

    
    event NEWADMIN263(address oldAdmin, address newAdmin);	//inject NONSTANDARD NAMING

    
    event NEWCOMPTROLLER110(ComptrollerInterface oldComptroller, ComptrollerInterface newComptroller);	//inject NONSTANDARD NAMING

    
    event NEWMARKETINTERESTRATEMODEL792(InterestRateModel oldInterestRateModel, InterestRateModel newInterestRateModel);	//inject NONSTANDARD NAMING

    
    event NEWRESERVEFACTOR978(uint oldReserveFactorMantissa, uint newReserveFactorMantissa);	//inject NONSTANDARD NAMING

    
    event RESERVESREDUCED627(address admin, uint reduceAmount, uint newTotalReserves);	//inject NONSTANDARD NAMING


    
    constructor(ComptrollerInterface comptroller_,
                InterestRateModel interestRateModel_,
                uint initialExchangeRateMantissa_,
                string memory name_,
                string memory symbol_,
                uint8 decimals_,
                address payable admin_) internal {
        
        initialExchangeRateMantissa = initialExchangeRateMantissa_;
        require(initialExchangeRateMantissa > 0, "Initial exchange rate must be greater than zero.");

        
        admin = msg.sender;
        
        uint err = _SETCOMPTROLLER923(comptroller_);
        require(err == uint(Error.NO_ERROR), "Setting comptroller failed");

        
        accrualBlockNumber = GETBLOCKNUMBER651();
        borrowIndex = mantissaone609;

        
        err = _SETINTERESTRATEMODELFRESH419(interestRateModel_);
        require(err == uint(Error.NO_ERROR), "Setting interest rate model failed");

        name = name_;
        symbol = symbol_;
        decimals = decimals_;

        
        admin = admin_;
    }

    
    function TRANSFERTOKENS427(address spender, address src, address dst, uint tokens) internal returns (uint) {	//inject NONSTANDARD NAMING
        
        uint allowed = comptroller.TRANSFERALLOWED19(address(this), src, dst, tokens);
        if (allowed != 0) {
            return FAILOPAQUE17(Error.COMPTROLLER_REJECTION, FailureInfo.TRANSFER_COMPTROLLER_REJECTION, allowed);
        }

        
        if (src == dst) {
            return FAIL155(Error.BAD_INPUT, FailureInfo.TRANSFER_NOT_ALLOWED);
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

        (mathErr, allowanceNew) = SUBUINT706(startingAllowance, tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL155(Error.MATH_ERROR, FailureInfo.TRANSFER_NOT_ALLOWED);
        }

        (mathErr, srcTokensNew) = SUBUINT706(accountTokens[src], tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL155(Error.MATH_ERROR, FailureInfo.TRANSFER_NOT_ENOUGH);
        }

        (mathErr, dstTokensNew) = ADDUINT472(accountTokens[dst], tokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAIL155(Error.MATH_ERROR, FailureInfo.TRANSFER_TOO_MUCH);
        }

        
        
        

        accountTokens[src] = srcTokensNew;
        accountTokens[dst] = dstTokensNew;

        
        if (startingAllowance != uint(-1)) {
            transferAllowances[src][spender] = allowanceNew;
        }

        
        emit TRANSFER53(src, dst, tokens);

        comptroller.TRANSFERVERIFY472(address(this), src, dst, tokens);

        return uint(Error.NO_ERROR);
    }

    
    function TRANSFER173(address dst, uint256 amount) external NONREENTRANT733 returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERTOKENS427(msg.sender, msg.sender, dst, amount) == uint(Error.NO_ERROR);
    }

    
    function TRANSFERFROM471(address src, address dst, uint256 amount) external NONREENTRANT733 returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERTOKENS427(msg.sender, src, dst, amount) == uint(Error.NO_ERROR);
    }

    
    function APPROVE759(address spender, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
        address src = msg.sender;
        transferAllowances[src][spender] = amount;
        emit APPROVAL973(src, spender, amount);
        return true;
    }

    
    function ALLOWANCE822(address owner, address spender) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return transferAllowances[owner][spender];
    }

    
    function BALANCEOF373(address owner) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return accountTokens[owner];
    }

    
    function BALANCEOFUNDERLYING319(address owner) external returns (uint) {	//inject NONSTANDARD NAMING
        Exp memory exchangeRate = Exp({mantissa: EXCHANGERATECURRENT330()});
        (MathError mErr, uint balance) = MULSCALARTRUNCATE358(exchangeRate, accountTokens[owner]);
        require(mErr == MathError.NO_ERROR);
        return balance;
    }

    
    function GETACCOUNTSNAPSHOT561(address account) external view returns (uint, uint, uint, uint) {	//inject NONSTANDARD NAMING
        uint cTokenBalance = accountTokens[account];
        uint borrowBalance;
        uint exchangeRateMantissa;

        MathError mErr;

        (mErr, borrowBalance) = BORROWBALANCESTOREDINTERNAL740(account);
        if (mErr != MathError.NO_ERROR) {
            return (uint(Error.MATH_ERROR), 0, 0, 0);
        }

        (mErr, exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL401();
        if (mErr != MathError.NO_ERROR) {
            return (uint(Error.MATH_ERROR), 0, 0, 0);
        }

        return (uint(Error.NO_ERROR), cTokenBalance, borrowBalance, exchangeRateMantissa);
    }

    
    function GETBLOCKNUMBER651() internal view returns (uint) {	//inject NONSTANDARD NAMING
        return block.number;
    }

    
    function BORROWRATEPERBLOCK330() external view returns (uint) {	//inject NONSTANDARD NAMING
        (uint opaqueErr, uint borrowRateMantissa) = interestRateModel.GETBORROWRATE532(GETCASHPRIOR796(), totalBorrows, totalReserves);
        require(opaqueErr == 0, "borrowRatePerBlock: interestRateModel.borrowRate failed"); 
        return borrowRateMantissa;
    }

    
    function SUPPLYRATEPERBLOCK798() external view returns (uint) {	//inject NONSTANDARD NAMING
        
        uint exchangeRateMantissa = EXCHANGERATESTORED868();

        (uint e0, uint borrowRateMantissa) = interestRateModel.GETBORROWRATE532(GETCASHPRIOR796(), totalBorrows, totalReserves);
        require(e0 == 0, "supplyRatePerBlock: calculating borrowRate failed"); 

        (MathError e1, Exp memory underlying) = MULSCALAR762(Exp({mantissa: exchangeRateMantissa}), totalSupply);
        require(e1 == MathError.NO_ERROR, "supplyRatePerBlock: calculating underlying failed");

        (MathError e2, Exp memory borrowsPer) = DIVSCALARBYEXP297(totalBorrows, underlying);
        require(e2 == MathError.NO_ERROR, "supplyRatePerBlock: calculating borrowsPer failed");

        (MathError e3, Exp memory oneMinusReserveFactor) = SUBEXP690(Exp({mantissa: mantissaone609}), Exp({mantissa: reserveFactorMantissa}));
        require(e3 == MathError.NO_ERROR, "supplyRatePerBlock: calculating oneMinusReserveFactor failed");

        (MathError e4, Exp memory supplyRate) = MULEXP3150(Exp({mantissa: borrowRateMantissa}), oneMinusReserveFactor, borrowsPer);
        require(e4 == MathError.NO_ERROR, "supplyRatePerBlock: calculating supplyRate failed");

        return supplyRate.mantissa;
    }

    
    function TOTALBORROWSCURRENT675() external NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        require(ACCRUEINTEREST211() == uint(Error.NO_ERROR), "accrue interest failed");
        return totalBorrows;
    }

    
    function BORROWBALANCECURRENT462(address account) external NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        require(ACCRUEINTEREST211() == uint(Error.NO_ERROR), "accrue interest failed");
        return BORROWBALANCESTORED928(account);
    }

    
    function BORROWBALANCESTORED928(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        (MathError err, uint result) = BORROWBALANCESTOREDINTERNAL740(account);
        require(err == MathError.NO_ERROR, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        return result;
    }

    
    function BORROWBALANCESTOREDINTERNAL740(address account) internal view returns (MathError, uint) {	//inject NONSTANDARD NAMING
        
        MathError mathErr;
        uint principalTimesIndex;
        uint result;

        
        BorrowSnapshot storage borrowSnapshot = accountBorrows[account];

        
        if (borrowSnapshot.principal == 0) {
            return (MathError.NO_ERROR, 0);
        }

        
        (mathErr, principalTimesIndex) = MULUINT824(borrowSnapshot.principal, borrowIndex);
        if (mathErr != MathError.NO_ERROR) {
            return (mathErr, 0);
        }

        (mathErr, result) = DIVUINT515(principalTimesIndex, borrowSnapshot.interestIndex);
        if (mathErr != MathError.NO_ERROR) {
            return (mathErr, 0);
        }

        return (MathError.NO_ERROR, result);
    }

    
    function EXCHANGERATECURRENT330() public NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        require(ACCRUEINTEREST211() == uint(Error.NO_ERROR), "accrue interest failed");
        return EXCHANGERATESTORED868();
    }

    
    function EXCHANGERATESTORED868() public view returns (uint) {	//inject NONSTANDARD NAMING
        (MathError err, uint result) = EXCHANGERATESTOREDINTERNAL401();
        require(err == MathError.NO_ERROR, "exchangeRateStored: exchangeRateStoredInternal failed");
        return result;
    }

    
    function EXCHANGERATESTOREDINTERNAL401() internal view returns (MathError, uint) {	//inject NONSTANDARD NAMING
        if (totalSupply == 0) {
            
            return (MathError.NO_ERROR, initialExchangeRateMantissa);
        } else {
            
            uint totalCash = GETCASHPRIOR796();
            uint cashPlusBorrowsMinusReserves;
            Exp memory exchangeRate;
            MathError mathErr;

            (mathErr, cashPlusBorrowsMinusReserves) = ADDTHENSUBUINT110(totalCash, totalBorrows, totalReserves);
            if (mathErr != MathError.NO_ERROR) {
                return (mathErr, 0);
            }

            (mathErr, exchangeRate) = GETEXP523(cashPlusBorrowsMinusReserves, totalSupply);
            if (mathErr != MathError.NO_ERROR) {
                return (mathErr, 0);
            }

            return (MathError.NO_ERROR, exchangeRate.mantissa);
        }
    }

    
    function GETCASH353() external view returns (uint) {	//inject NONSTANDARD NAMING
        return GETCASHPRIOR796();
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

    
    function ACCRUEINTEREST211() public returns (uint) {	//inject NONSTANDARD NAMING
        AccrueInterestLocalVars memory vars;

        
        (vars.opaqueErr, vars.borrowRateMantissa) = interestRateModel.GETBORROWRATE532(GETCASHPRIOR796(), totalBorrows, totalReserves);
        require(vars.borrowRateMantissa <= borrowratemaxmantissa614, "borrow rate is absurdly high");
        if (vars.opaqueErr != 0) {
            return FAILOPAQUE17(Error.INTEREST_RATE_MODEL_ERROR, FailureInfo.ACCRUE_INTEREST_BORROW_RATE_CALCULATION_FAILED, vars.opaqueErr);
        }

        
        vars.currentBlockNumber = GETBLOCKNUMBER651();

        
        (vars.mathErr, vars.blockDelta) = SUBUINT706(vars.currentBlockNumber, accrualBlockNumber);
        assert(vars.mathErr == MathError.NO_ERROR); 

        
        (vars.mathErr, vars.simpleInterestFactor) = MULSCALAR762(Exp({mantissa: vars.borrowRateMantissa}), vars.blockDelta);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_SIMPLE_INTEREST_FACTOR_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.interestAccumulated) = MULSCALARTRUNCATE358(vars.simpleInterestFactor, totalBorrows);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_ACCUMULATED_INTEREST_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalBorrowsNew) = ADDUINT472(vars.interestAccumulated, totalBorrows);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_TOTAL_BORROWS_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalReservesNew) = MULSCALARTRUNCATEADDUINT969(Exp({mantissa: reserveFactorMantissa}), vars.interestAccumulated, totalReserves);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_TOTAL_RESERVES_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.borrowIndexNew) = MULSCALARTRUNCATEADDUINT969(vars.simpleInterestFactor, borrowIndex, borrowIndex);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.ACCRUE_INTEREST_NEW_BORROW_INDEX_CALCULATION_FAILED, uint(vars.mathErr));
        }

        
        
        

        
        accrualBlockNumber = vars.currentBlockNumber;
        borrowIndex = vars.borrowIndexNew;
        totalBorrows = vars.totalBorrowsNew;
        totalReserves = vars.totalReservesNew;

        
        emit ACCRUEINTEREST221(vars.interestAccumulated, vars.borrowIndexNew, totalBorrows);

        return uint(Error.NO_ERROR);
    }

    
    function MINTINTERNAL265(uint mintAmount) internal NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST211();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL155(Error(error), FailureInfo.MINT_ACCRUE_INTEREST_FAILED);
        }
        
        return MINTFRESH61(msg.sender, mintAmount);
    }

    struct MintLocalVars {
        Error err;
        MathError mathErr;
        uint exchangeRateMantissa;
        uint mintTokens;
        uint totalSupplyNew;
        uint accountTokensNew;
    }

    
    function MINTFRESH61(address minter, uint mintAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
        
        uint allowed = comptroller.MINTALLOWED780(address(this), minter, mintAmount);
        if (allowed != 0) {
            return FAILOPAQUE17(Error.COMPTROLLER_REJECTION, FailureInfo.MINT_COMPTROLLER_REJECTION, allowed);
        }

        
        if (accrualBlockNumber != GETBLOCKNUMBER651()) {
            return FAIL155(Error.MARKET_NOT_FRESH, FailureInfo.MINT_FRESHNESS_CHECK);
        }

        MintLocalVars memory vars;

        
        vars.err = CHECKTRANSFERIN296(minter, mintAmount);
        if (vars.err != Error.NO_ERROR) {
            return FAIL155(vars.err, FailureInfo.MINT_TRANSFER_IN_NOT_POSSIBLE);
        }

        
        (vars.mathErr, vars.exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL401();
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.MINT_EXCHANGE_RATE_READ_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.mintTokens) = DIVSCALARBYEXPTRUNCATE87(mintAmount, Exp({mantissa: vars.exchangeRateMantissa}));
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.MINT_EXCHANGE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        
        (vars.mathErr, vars.totalSupplyNew) = ADDUINT472(totalSupply, vars.mintTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.MINT_NEW_TOTAL_SUPPLY_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.accountTokensNew) = ADDUINT472(accountTokens[minter], vars.mintTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.MINT_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        
        
        

        
        vars.err = DOTRANSFERIN366(minter, mintAmount);
        if (vars.err != Error.NO_ERROR) {
            return FAIL155(vars.err, FailureInfo.MINT_TRANSFER_IN_FAILED);
        }

        
        totalSupply = vars.totalSupplyNew;
        accountTokens[minter] = vars.accountTokensNew;

        
        emit MINT76(minter, mintAmount, vars.mintTokens);
        emit TRANSFER53(address(this), minter, vars.mintTokens);

        
        comptroller.MINTVERIFY904(address(this), minter, mintAmount, vars.mintTokens);

        return uint(Error.NO_ERROR);
    }

    
    function REDEEMINTERNAL616(uint redeemTokens) internal NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST211();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL155(Error(error), FailureInfo.REDEEM_ACCRUE_INTEREST_FAILED);
        }
        
        return REDEEMFRESH636(msg.sender, redeemTokens, 0);
    }

    
    function REDEEMUNDERLYINGINTERNAL417(uint redeemAmount) internal NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST211();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL155(Error(error), FailureInfo.REDEEM_ACCRUE_INTEREST_FAILED);
        }
        
        return REDEEMFRESH636(msg.sender, 0, redeemAmount);
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

    
    function REDEEMFRESH636(address payable redeemer, uint redeemTokensIn, uint redeemAmountIn) internal returns (uint) {	//inject NONSTANDARD NAMING
        require(redeemTokensIn == 0 || redeemAmountIn == 0, "one of redeemTokensIn or redeemAmountIn must be zero");

        RedeemLocalVars memory vars;

        
        (vars.mathErr, vars.exchangeRateMantissa) = EXCHANGERATESTOREDINTERNAL401();
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_RATE_READ_FAILED, uint(vars.mathErr));
        }

        
        if (redeemTokensIn > 0) {
            
            vars.redeemTokens = redeemTokensIn;

            (vars.mathErr, vars.redeemAmount) = MULSCALARTRUNCATE358(Exp({mantissa: vars.exchangeRateMantissa}), redeemTokensIn);
            if (vars.mathErr != MathError.NO_ERROR) {
                return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_TOKENS_CALCULATION_FAILED, uint(vars.mathErr));
            }
        } else {
            

            (vars.mathErr, vars.redeemTokens) = DIVSCALARBYEXPTRUNCATE87(redeemAmountIn, Exp({mantissa: vars.exchangeRateMantissa}));
            if (vars.mathErr != MathError.NO_ERROR) {
                return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.REDEEM_EXCHANGE_AMOUNT_CALCULATION_FAILED, uint(vars.mathErr));
            }

            vars.redeemAmount = redeemAmountIn;
        }

        
        uint allowed = comptroller.REDEEMALLOWED712(address(this), redeemer, vars.redeemTokens);
        if (allowed != 0) {
            return FAILOPAQUE17(Error.COMPTROLLER_REJECTION, FailureInfo.REDEEM_COMPTROLLER_REJECTION, allowed);
        }

        
        if (accrualBlockNumber != GETBLOCKNUMBER651()) {
            return FAIL155(Error.MARKET_NOT_FRESH, FailureInfo.REDEEM_FRESHNESS_CHECK);
        }

        
        (vars.mathErr, vars.totalSupplyNew) = SUBUINT706(totalSupply, vars.redeemTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.REDEEM_NEW_TOTAL_SUPPLY_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.accountTokensNew) = SUBUINT706(accountTokens[redeemer], vars.redeemTokens);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.REDEEM_NEW_ACCOUNT_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        
        if (GETCASHPRIOR796() < vars.redeemAmount) {
            return FAIL155(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.REDEEM_TRANSFER_OUT_NOT_POSSIBLE);
        }

        
        
        

        
        vars.err = DOTRANSFEROUT772(redeemer, vars.redeemAmount);
        require(vars.err == Error.NO_ERROR, "redeem transfer out failed");

        
        totalSupply = vars.totalSupplyNew;
        accountTokens[redeemer] = vars.accountTokensNew;

        
        emit TRANSFER53(redeemer, address(this), vars.redeemTokens);
        emit REDEEM786(redeemer, vars.redeemAmount, vars.redeemTokens);

        
        comptroller.REDEEMVERIFY97(address(this), redeemer, vars.redeemAmount, vars.redeemTokens);

        return uint(Error.NO_ERROR);
    }

    
    function BORROWINTERNAL262(uint borrowAmount) internal NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST211();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL155(Error(error), FailureInfo.BORROW_ACCRUE_INTEREST_FAILED);
        }
        
        return BORROWFRESH798(msg.sender, borrowAmount);
    }

    struct BorrowLocalVars {
        Error err;
        MathError mathErr;
        uint accountBorrows;
        uint accountBorrowsNew;
        uint totalBorrowsNew;
    }

    
    function BORROWFRESH798(address payable borrower, uint borrowAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
        
        uint allowed = comptroller.BORROWALLOWED637(address(this), borrower, borrowAmount);
        if (allowed != 0) {
            return FAILOPAQUE17(Error.COMPTROLLER_REJECTION, FailureInfo.BORROW_COMPTROLLER_REJECTION, allowed);
        }

        
        if (accrualBlockNumber != GETBLOCKNUMBER651()) {
            return FAIL155(Error.MARKET_NOT_FRESH, FailureInfo.BORROW_FRESHNESS_CHECK);
        }

        
        if (GETCASHPRIOR796() < borrowAmount) {
            return FAIL155(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.BORROW_CASH_NOT_AVAILABLE);
        }

        BorrowLocalVars memory vars;

        
        (vars.mathErr, vars.accountBorrows) = BORROWBALANCESTOREDINTERNAL740(borrower);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.accountBorrowsNew) = ADDUINT472(vars.accountBorrows, borrowAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalBorrowsNew) = ADDUINT472(totalBorrows, borrowAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        
        
        

        
        vars.err = DOTRANSFEROUT772(borrower, borrowAmount);
        require(vars.err == Error.NO_ERROR, "borrow transfer out failed");

        
        accountBorrows[borrower].principal = vars.accountBorrowsNew;
        accountBorrows[borrower].interestIndex = borrowIndex;
        totalBorrows = vars.totalBorrowsNew;

        
        emit BORROW192(borrower, borrowAmount, vars.accountBorrowsNew, vars.totalBorrowsNew);

        
        comptroller.BORROWVERIFY402(address(this), borrower, borrowAmount);

        return uint(Error.NO_ERROR);
    }

    
    function REPAYBORROWINTERNAL164(uint repayAmount) internal NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST211();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL155(Error(error), FailureInfo.REPAY_BORROW_ACCRUE_INTEREST_FAILED);
        }
        
        return REPAYBORROWFRESH780(msg.sender, msg.sender, repayAmount);
    }

    
    function REPAYBORROWBEHALFINTERNAL701(address borrower, uint repayAmount) internal NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST211();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL155(Error(error), FailureInfo.REPAY_BEHALF_ACCRUE_INTEREST_FAILED);
        }
        
        return REPAYBORROWFRESH780(msg.sender, borrower, repayAmount);
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

    
    function REPAYBORROWFRESH780(address payer, address borrower, uint repayAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
        
        uint allowed = comptroller.REPAYBORROWALLOWED332(address(this), payer, borrower, repayAmount);
        if (allowed != 0) {
            return FAILOPAQUE17(Error.COMPTROLLER_REJECTION, FailureInfo.REPAY_BORROW_COMPTROLLER_REJECTION, allowed);
        }

        
        if (accrualBlockNumber != GETBLOCKNUMBER651()) {
            return FAIL155(Error.MARKET_NOT_FRESH, FailureInfo.REPAY_BORROW_FRESHNESS_CHECK);
        }

        RepayBorrowLocalVars memory vars;

        
        vars.borrowerIndex = accountBorrows[borrower].interestIndex;

        
        (vars.mathErr, vars.accountBorrows) = BORROWBALANCESTOREDINTERNAL740(borrower);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.REPAY_BORROW_ACCUMULATED_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        
        if (repayAmount == uint(-1)) {
            vars.repayAmount = vars.accountBorrows;
        } else {
            vars.repayAmount = repayAmount;
        }

        
        vars.err = CHECKTRANSFERIN296(payer, vars.repayAmount);
        if (vars.err != Error.NO_ERROR) {
            return FAIL155(vars.err, FailureInfo.REPAY_BORROW_TRANSFER_IN_NOT_POSSIBLE);
        }

        
        (vars.mathErr, vars.accountBorrowsNew) = SUBUINT706(vars.accountBorrows, vars.repayAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.REPAY_BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        (vars.mathErr, vars.totalBorrowsNew) = SUBUINT706(totalBorrows, vars.repayAmount);
        if (vars.mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.REPAY_BORROW_NEW_TOTAL_BALANCE_CALCULATION_FAILED, uint(vars.mathErr));
        }

        
        
        

        
        vars.err = DOTRANSFERIN366(payer, vars.repayAmount);
        require(vars.err == Error.NO_ERROR, "repay borrow transfer in failed");

        
        accountBorrows[borrower].principal = vars.accountBorrowsNew;
        accountBorrows[borrower].interestIndex = borrowIndex;
        totalBorrows = vars.totalBorrowsNew;

        
        emit REPAYBORROW356(payer, borrower, vars.repayAmount, vars.accountBorrowsNew, vars.totalBorrowsNew);

        
        comptroller.REPAYBORROWVERIFY773(address(this), payer, borrower, vars.repayAmount, vars.borrowerIndex);

        return uint(Error.NO_ERROR);
    }

    
    function LIQUIDATEBORROWINTERNAL935(address borrower, uint repayAmount, CToken cTokenCollateral) internal NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST211();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL155(Error(error), FailureInfo.LIQUIDATE_ACCRUE_BORROW_INTEREST_FAILED);
        }

        error = cTokenCollateral.ACCRUEINTEREST211();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL155(Error(error), FailureInfo.LIQUIDATE_ACCRUE_COLLATERAL_INTEREST_FAILED);
        }

        
        return LIQUIDATEBORROWFRESH278(msg.sender, borrower, repayAmount, cTokenCollateral);
    }

    
    function LIQUIDATEBORROWFRESH278(address liquidator, address borrower, uint repayAmount, CToken cTokenCollateral) internal returns (uint) {	//inject NONSTANDARD NAMING
        
        uint allowed = comptroller.LIQUIDATEBORROWALLOWED865(address(this), address(cTokenCollateral), liquidator, borrower, repayAmount);
        if (allowed != 0) {
            return FAILOPAQUE17(Error.COMPTROLLER_REJECTION, FailureInfo.LIQUIDATE_COMPTROLLER_REJECTION, allowed);
        }

        
        if (accrualBlockNumber != GETBLOCKNUMBER651()) {
            return FAIL155(Error.MARKET_NOT_FRESH, FailureInfo.LIQUIDATE_FRESHNESS_CHECK);
        }

        
        if (cTokenCollateral.accrualBlockNumber() != GETBLOCKNUMBER651()) {
            return FAIL155(Error.MARKET_NOT_FRESH, FailureInfo.LIQUIDATE_COLLATERAL_FRESHNESS_CHECK);
        }

        
        if (borrower == liquidator) {
            return FAIL155(Error.INVALID_ACCOUNT_PAIR, FailureInfo.LIQUIDATE_LIQUIDATOR_IS_BORROWER);
        }

        
        if (repayAmount == 0) {
            return FAIL155(Error.INVALID_CLOSE_AMOUNT_REQUESTED, FailureInfo.LIQUIDATE_CLOSE_AMOUNT_IS_ZERO);
        }

        
        if (repayAmount == uint(-1)) {
            return FAIL155(Error.INVALID_CLOSE_AMOUNT_REQUESTED, FailureInfo.LIQUIDATE_CLOSE_AMOUNT_IS_UINT_MAX);
        }

        
        (uint amountSeizeError, uint seizeTokens) = comptroller.LIQUIDATECALCULATESEIZETOKENS887(address(this), address(cTokenCollateral), repayAmount);
        if (amountSeizeError != 0) {
            return FAILOPAQUE17(Error.COMPTROLLER_CALCULATION_ERROR, FailureInfo.LIQUIDATE_COMPTROLLER_CALCULATE_AMOUNT_SEIZE_FAILED, amountSeizeError);
        }

        
        if (seizeTokens > cTokenCollateral.BALANCEOF373(borrower)) {
            return FAIL155(Error.TOKEN_INSUFFICIENT_BALANCE, FailureInfo.LIQUIDATE_SEIZE_TOO_MUCH);
        }

        
        uint repayBorrowError = REPAYBORROWFRESH780(liquidator, borrower, repayAmount);
        if (repayBorrowError != uint(Error.NO_ERROR)) {
            return FAIL155(Error(repayBorrowError), FailureInfo.LIQUIDATE_REPAY_BORROW_FRESH_FAILED);
        }

        
        uint seizeError = cTokenCollateral.SEIZE115(liquidator, borrower, seizeTokens);
        require(seizeError == uint(Error.NO_ERROR), "token seizure failed");

        
        emit LIQUIDATEBORROW83(liquidator, borrower, repayAmount, address(cTokenCollateral), seizeTokens);

        
        comptroller.LIQUIDATEBORROWVERIFY217(address(this), address(cTokenCollateral), liquidator, borrower, repayAmount, seizeTokens);

        return uint(Error.NO_ERROR);
    }

    
    function SEIZE115(address liquidator, address borrower, uint seizeTokens) external NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        
        uint allowed = comptroller.SEIZEALLOWED564(address(this), msg.sender, liquidator, borrower, seizeTokens);
        if (allowed != 0) {
            return FAILOPAQUE17(Error.COMPTROLLER_REJECTION, FailureInfo.LIQUIDATE_SEIZE_COMPTROLLER_REJECTION, allowed);
        }

        
        if (borrower == liquidator) {
            return FAIL155(Error.INVALID_ACCOUNT_PAIR, FailureInfo.LIQUIDATE_SEIZE_LIQUIDATOR_IS_BORROWER);
        }

        MathError mathErr;
        uint borrowerTokensNew;
        uint liquidatorTokensNew;

        
        (mathErr, borrowerTokensNew) = SUBUINT706(accountTokens[borrower], seizeTokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.LIQUIDATE_SEIZE_BALANCE_DECREMENT_FAILED, uint(mathErr));
        }

        (mathErr, liquidatorTokensNew) = ADDUINT472(accountTokens[liquidator], seizeTokens);
        if (mathErr != MathError.NO_ERROR) {
            return FAILOPAQUE17(Error.MATH_ERROR, FailureInfo.LIQUIDATE_SEIZE_BALANCE_INCREMENT_FAILED, uint(mathErr));
        }

        
        
        

        
        accountTokens[borrower] = borrowerTokensNew;
        accountTokens[liquidator] = liquidatorTokensNew;

        
        emit TRANSFER53(borrower, liquidator, seizeTokens);

        
        comptroller.SEIZEVERIFY574(address(this), msg.sender, liquidator, borrower, seizeTokens);

        return uint(Error.NO_ERROR);
    }


    

    
    function _SETPENDINGADMIN773(address payable newPendingAdmin) external returns (uint) {	//inject NONSTANDARD NAMING
        
        if (msg.sender != admin) {
            return FAIL155(Error.UNAUTHORIZED, FailureInfo.SET_PENDING_ADMIN_OWNER_CHECK);
        }

        
        address oldPendingAdmin = pendingAdmin;

        
        pendingAdmin = newPendingAdmin;

        
        emit NEWPENDINGADMIN372(oldPendingAdmin, newPendingAdmin);

        return uint(Error.NO_ERROR);
    }

    
    function _ACCEPTADMIN733() external returns (uint) {	//inject NONSTANDARD NAMING
        
        if (msg.sender != pendingAdmin || msg.sender == address(0)) {
            return FAIL155(Error.UNAUTHORIZED, FailureInfo.ACCEPT_ADMIN_PENDING_ADMIN_CHECK);
        }

        
        address oldAdmin = admin;
        address oldPendingAdmin = pendingAdmin;

        
        admin = pendingAdmin;

        
        pendingAdmin = address(0);

        emit NEWADMIN263(oldAdmin, admin);
        emit NEWPENDINGADMIN372(oldPendingAdmin, pendingAdmin);

        return uint(Error.NO_ERROR);
    }

    
    function _SETCOMPTROLLER923(ComptrollerInterface newComptroller) public returns (uint) {	//inject NONSTANDARD NAMING
        
        if (msg.sender != admin) {
            return FAIL155(Error.UNAUTHORIZED, FailureInfo.SET_COMPTROLLER_OWNER_CHECK);
        }

        ComptrollerInterface oldComptroller = comptroller;
        
        require(newComptroller.ISCOMPTROLLER617(), "marker method returned false");

        
        comptroller = newComptroller;

        
        emit NEWCOMPTROLLER110(oldComptroller, newComptroller);

        return uint(Error.NO_ERROR);
    }

    
    function _SETRESERVEFACTOR468(uint newReserveFactorMantissa) external NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST211();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL155(Error(error), FailureInfo.SET_RESERVE_FACTOR_ACCRUE_INTEREST_FAILED);
        }
        
        return _SETRESERVEFACTORFRESH421(newReserveFactorMantissa);
    }

    
    function _SETRESERVEFACTORFRESH421(uint newReserveFactorMantissa) internal returns (uint) {	//inject NONSTANDARD NAMING
        
        if (msg.sender != admin) {
            return FAIL155(Error.UNAUTHORIZED, FailureInfo.SET_RESERVE_FACTOR_ADMIN_CHECK);
        }

        
        if (accrualBlockNumber != GETBLOCKNUMBER651()) {
            return FAIL155(Error.MARKET_NOT_FRESH, FailureInfo.SET_RESERVE_FACTOR_FRESH_CHECK);
        }

        
        if (newReserveFactorMantissa > reservefactormaxmantissa925) {
            return FAIL155(Error.BAD_INPUT, FailureInfo.SET_RESERVE_FACTOR_BOUNDS_CHECK);
        }

        uint oldReserveFactorMantissa = reserveFactorMantissa;
        reserveFactorMantissa = newReserveFactorMantissa;

        emit NEWRESERVEFACTOR978(oldReserveFactorMantissa, newReserveFactorMantissa);

        return uint(Error.NO_ERROR);
    }

    
    function _REDUCERESERVES430(uint reduceAmount) external NONREENTRANT733 returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST211();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL155(Error(error), FailureInfo.REDUCE_RESERVES_ACCRUE_INTEREST_FAILED);
        }
        
        return _REDUCERESERVESFRESH865(reduceAmount);
    }

    
    function _REDUCERESERVESFRESH865(uint reduceAmount) internal returns (uint) {	//inject NONSTANDARD NAMING
        Error err;
        
        uint totalReservesNew;

        
        if (msg.sender != admin) {
            return FAIL155(Error.UNAUTHORIZED, FailureInfo.REDUCE_RESERVES_ADMIN_CHECK);
        }

        
        if (accrualBlockNumber != GETBLOCKNUMBER651()) {
            return FAIL155(Error.MARKET_NOT_FRESH, FailureInfo.REDUCE_RESERVES_FRESH_CHECK);
        }

        
        if (GETCASHPRIOR796() < reduceAmount) {
            return FAIL155(Error.TOKEN_INSUFFICIENT_CASH, FailureInfo.REDUCE_RESERVES_CASH_NOT_AVAILABLE);
        }

        
        if (reduceAmount > totalReserves) {
            return FAIL155(Error.BAD_INPUT, FailureInfo.REDUCE_RESERVES_VALIDATION);
        }

        
        
        

        totalReservesNew = totalReserves - reduceAmount;
        
        require(totalReservesNew <= totalReserves, "reduce reserves unexpected underflow");

        
        totalReserves = totalReservesNew;

        
        err = DOTRANSFEROUT772(admin, reduceAmount);
        
        require(err == Error.NO_ERROR, "reduce reserves transfer out failed");

        emit RESERVESREDUCED627(admin, reduceAmount, totalReservesNew);

        return uint(Error.NO_ERROR);
    }

    
    function _SETINTERESTRATEMODEL763(InterestRateModel newInterestRateModel) public returns (uint) {	//inject NONSTANDARD NAMING
        uint error = ACCRUEINTEREST211();
        if (error != uint(Error.NO_ERROR)) {
            
            return FAIL155(Error(error), FailureInfo.SET_INTEREST_RATE_MODEL_ACCRUE_INTEREST_FAILED);
        }
        
        return _SETINTERESTRATEMODELFRESH419(newInterestRateModel);
    }

    
    function _SETINTERESTRATEMODELFRESH419(InterestRateModel newInterestRateModel) internal returns (uint) {	//inject NONSTANDARD NAMING

        
        InterestRateModel oldInterestRateModel;

        
        if (msg.sender != admin) {
            return FAIL155(Error.UNAUTHORIZED, FailureInfo.SET_INTEREST_RATE_MODEL_OWNER_CHECK);
        }

        
        if (accrualBlockNumber != GETBLOCKNUMBER651()) {
            return FAIL155(Error.MARKET_NOT_FRESH, FailureInfo.SET_INTEREST_RATE_MODEL_FRESH_CHECK);
        }

        
        oldInterestRateModel = interestRateModel;

        
        require(newInterestRateModel.ISINTERESTRATEMODEL817(), "marker method returned false");

        
        interestRateModel = newInterestRateModel;

        
        emit NEWMARKETINTERESTRATEMODEL792(oldInterestRateModel, newInterestRateModel);

        return uint(Error.NO_ERROR);
    }

    

    
    function GETCASHPRIOR796() internal view returns (uint);	//inject NONSTANDARD NAMING

    
    function CHECKTRANSFERIN296(address from, uint amount) internal view returns (Error);	//inject NONSTANDARD NAMING

    
    function DOTRANSFERIN366(address from, uint amount) internal returns (Error);	//inject NONSTANDARD NAMING

    
    function DOTRANSFEROUT772(address payable to, uint amount) internal returns (Error);	//inject NONSTANDARD NAMING
}

contract CErc20 is CToken {

    
    address public underlying;

    
    constructor(address underlying_,
                ComptrollerInterface comptroller_,
                InterestRateModel interestRateModel_,
                uint initialExchangeRateMantissa_,
                string memory name_,
                string memory symbol_,
                uint8 decimals_,
                address payable admin_) public
    CToken(comptroller_, interestRateModel_, initialExchangeRateMantissa_, name_, symbol_, decimals_, admin_) {
        
        underlying = underlying_;
        EIP20Interface(underlying).TOTALSUPPLY576(); 
    }

    

    
    function MINT787(uint mintAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return MINTINTERNAL265(mintAmount);
    }

    
    function REDEEM948(uint redeemTokens) external returns (uint) {	//inject NONSTANDARD NAMING
        return REDEEMINTERNAL616(redeemTokens);
    }

    
    function REDEEMUNDERLYING305(uint redeemAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return REDEEMUNDERLYINGINTERNAL417(redeemAmount);
    }

    
    function BORROW571(uint borrowAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return BORROWINTERNAL262(borrowAmount);
    }

    
    function REPAYBORROW869(uint repayAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return REPAYBORROWINTERNAL164(repayAmount);
    }

    
    function REPAYBORROWBEHALF248(address borrower, uint repayAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return REPAYBORROWBEHALFINTERNAL701(borrower, repayAmount);
    }

    
    function LIQUIDATEBORROW67(address borrower, uint repayAmount, CToken cTokenCollateral) external returns (uint) {	//inject NONSTANDARD NAMING
        return LIQUIDATEBORROWINTERNAL935(borrower, repayAmount, cTokenCollateral);
    }

    

    
    function GETCASHPRIOR796() internal view returns (uint) {	//inject NONSTANDARD NAMING
        EIP20Interface token = EIP20Interface(underlying);
        return token.BALANCEOF373(address(this));
    }

    
    function CHECKTRANSFERIN296(address from, uint amount) internal view returns (Error) {	//inject NONSTANDARD NAMING
        EIP20Interface token = EIP20Interface(underlying);

        if (token.ALLOWANCE822(from, address(this)) < amount) {
            return Error.TOKEN_INSUFFICIENT_ALLOWANCE;
        }

        if (token.BALANCEOF373(from) < amount) {
            return Error.TOKEN_INSUFFICIENT_BALANCE;
        }

        return Error.NO_ERROR;
    }

    
    function DOTRANSFERIN366(address from, uint amount) internal returns (Error) {	//inject NONSTANDARD NAMING
        EIP20NonStandardInterface token = EIP20NonStandardInterface(underlying);
        bool result;

        token.TRANSFERFROM471(from, address(this), amount);

        
        assembly {
            switch returndatasize()
                case 0 {                      
                    result := not(0)          
                }
                case 32 {                     
                    returndatacopy(0, 0, 32)
                    result := mload(0)        
                }
                default {                     
                    revert(0, 0)
                }
        }

        if (!result) {
            return Error.TOKEN_TRANSFER_IN_FAILED;
        }

        return Error.NO_ERROR;
    }

    
    function DOTRANSFEROUT772(address payable to, uint amount) internal returns (Error) {	//inject NONSTANDARD NAMING
        EIP20NonStandardInterface token = EIP20NonStandardInterface(underlying);
        bool result;

        token.TRANSFER173(to, amount);

        
        assembly {
            switch returndatasize()
                case 0 {                      
                    result := not(0)          
                }
                case 32 {                     
                    returndatacopy(0, 0, 32)
                    result := mload(0)        
                }
                default {                     
                    revert(0, 0)
                }
        }

        if (!result) {
            return Error.TOKEN_TRANSFER_OUT_FAILED;
        }

        return Error.NO_ERROR;
    }
}

contract CEther is CToken {
    
    constructor(ComptrollerInterface comptroller_,
                InterestRateModel interestRateModel_,
                uint initialExchangeRateMantissa_,
                string memory name_,
                string memory symbol_,
                uint8 decimals_,
                address payable admin_) public
    CToken(comptroller_, interestRateModel_, initialExchangeRateMantissa_, name_, symbol_, decimals_, admin_) {}

    

    
    function MINT787() external payable {	//inject NONSTANDARD NAMING
        REQUIRENOERROR502(MINTINTERNAL265(msg.value), "mint failed");
    }

    
    function REDEEM948(uint redeemTokens) external returns (uint) {	//inject NONSTANDARD NAMING
        return REDEEMINTERNAL616(redeemTokens);
    }

    
    function REDEEMUNDERLYING305(uint redeemAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return REDEEMUNDERLYINGINTERNAL417(redeemAmount);
    }

    
    function BORROW571(uint borrowAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        return BORROWINTERNAL262(borrowAmount);
    }

    
    function REPAYBORROW869() external payable {	//inject NONSTANDARD NAMING
        REQUIRENOERROR502(REPAYBORROWINTERNAL164(msg.value), "repayBorrow failed");
    }

    
    function REPAYBORROWBEHALF248(address borrower) external payable {	//inject NONSTANDARD NAMING
        REQUIRENOERROR502(REPAYBORROWBEHALFINTERNAL701(borrower, msg.value), "repayBorrowBehalf failed");
    }

    
    function LIQUIDATEBORROW67(address borrower, CToken cTokenCollateral) external payable {	//inject NONSTANDARD NAMING
        REQUIRENOERROR502(LIQUIDATEBORROWINTERNAL935(borrower, msg.value, cTokenCollateral), "liquidateBorrow failed");
    }

    
    function () external payable {
        REQUIRENOERROR502(MINTINTERNAL265(msg.value), "mint failed");
    }

    

    
    function GETCASHPRIOR796() internal view returns (uint) {	//inject NONSTANDARD NAMING
        (MathError err, uint startingBalance) = SUBUINT706(address(this).balance, msg.value);
        require(err == MathError.NO_ERROR);
        return startingBalance;
    }

    
    function CHECKTRANSFERIN296(address from, uint amount) internal view returns (Error) {	//inject NONSTANDARD NAMING
        
        require(msg.sender == from, "sender mismatch");
        require(msg.value == amount, "value mismatch");
        return Error.NO_ERROR;
    }

    
    function DOTRANSFERIN366(address from, uint amount) internal returns (Error) {	//inject NONSTANDARD NAMING
        
        require(msg.sender == from, "sender mismatch");
        require(msg.value == amount, "value mismatch");
        return Error.NO_ERROR;
    }

    function DOTRANSFEROUT772(address payable to, uint amount) internal returns (Error) {	//inject NONSTANDARD NAMING
        
        to.transfer(amount);
        return Error.NO_ERROR;
    }

    function REQUIRENOERROR502(uint errCode, string memory message) internal pure {	//inject NONSTANDARD NAMING
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

library ECDSA {
    
    function RECOVER885(bytes32 hash, bytes memory signature) internal pure returns (address) {	//inject NONSTANDARD NAMING
        
        if (signature.length != 65) {
            revert("signature's length is invalid");
        }

        
        bytes32 r;
        bytes32 s;
        uint8 v;

        
        
        
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }

        
        
        
        
        
        
        
        
        
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            revert("signature's s is in the wrong range");
        }

        if (v != 27 && v != 28) {
            revert("signature's v is in the wrong range");
        }

        
        return ecrecover(hash, v, r, s);
    }

    
    function TOETHSIGNEDMESSAGEHASH770(bytes32 hash) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        
        
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}

contract CompoundAdapter is CanReclaimTokens {
    using SafeERC20 for ERC20;
    ILiquidityPool liquidityPool;
    IRebalancer rebalancer;

    CEther cEther;
    mapping (address=>CErc20) cTokens;

    uint256 loansNonce;
    mapping (bytes32=>bool) loans;

    function () external payable {
    }

    constructor(ILiquidityPool _liquidityPool, IRebalancer _rebalancer) public {
        liquidityPool = _liquidityPool;
        rebalancer = _rebalancer;
    }

    function UPDATELIQUIDITYPOOL458(ILiquidityPool _newLiquidityPool) external ONLYOWNER996 {	//inject NONSTANDARD NAMING
        liquidityPool = _newLiquidityPool;
    }

    function UPDATEREBALANCER283(IRebalancer _newRebalancer) external ONLYOWNER996 {	//inject NONSTANDARD NAMING
        rebalancer = _newRebalancer;
    }

    function REGISTER263(address _underlying, address _cToken) external ONLYOWNER996 {	//inject NONSTANDARD NAMING
        require(_underlying != address(0x0), "Underlying asset cannot be 0x0");
        if (liquidityPool.ISETHER496(_underlying)) {
            cEther = CEther(uint256(_cToken));
        } else {
            cTokens[_underlying] = CErc20(_cToken);
        }
    }

    function LIQUIDATE371(address _borrower, CToken _collateralToken, address _debtToken, uint256 _debtAmount) external {	//inject NONSTANDARD NAMING
        _LIQUIDATE394(_borrower, _collateralToken, _debtToken, _debtAmount);
        loans[keccak256(abi.encodePacked(_borrower, address(_collateralToken), _debtToken, _debtAmount, loansNonce))] = true;
        loansNonce++;
    }

    function REBALANCE993(address _borrower, CToken _collateralToken, address _debtToken, uint256 _debtAmount, uint256 _loansNonce) internal {	//inject NONSTANDARD NAMING
        bytes32 loanId = keccak256(abi.encodePacked(_borrower, address(_collateralToken), _debtToken, _debtAmount, _loansNonce));
        require(loans[loanId], "Loan does not exist");
        delete(loans[loanId]);
        uint256 cAmount = _collateralToken.BALANCEOF373(address(this));
        _collateralToken.APPROVE759(address(rebalancer), cAmount);
        rebalancer.GIVEUNBALANCEDPOSITION383(_debtToken, _debtAmount, address(_collateralToken), cAmount);
    }

    function _LIQUIDATE394(address _borrower, CToken cToken, address _debtToken, uint256 _debtAmount) internal {	//inject NONSTANDARD NAMING
        liquidityPool.TAKE813(_debtToken, _debtAmount);
        if (liquidityPool.ISETHER496(_debtToken)) {
           cEther.LIQUIDATEBORROW67.value(_debtAmount)(_borrower, cToken);
        } else {
            CErc20 cerc20 = cTokens[_debtToken];
            ERC20(_debtToken).SAFETRANSFERFROM383(address(liquidityPool), address(this), _debtAmount);
            ERC20(_debtToken).SAFEAPPROVE45(address(cerc20), _debtAmount);
            require(cerc20.LIQUIDATEBORROW67(_borrower, _debtAmount, cToken) == 0, "liquidation failed");
        }
    }
}