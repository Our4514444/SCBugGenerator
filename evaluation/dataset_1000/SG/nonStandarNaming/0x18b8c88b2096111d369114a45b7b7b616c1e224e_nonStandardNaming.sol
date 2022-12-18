                                                                 

                                                                                                                                           

pragma solidity 0.5.17;
pragma experimental ABIEncoderV2;


interface IWeth {
    function DEPOSIT642() external payable;	//inject NONSTANDARD NAMING
    function WITHDRAW190(uint256 wad) external;	//inject NONSTANDARD NAMING
}

contract IERC20 {
    string public name;
    uint8 public decimals;
    string public symbol;
    function TOTALSUPPLY992() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF93(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE601(address _owner, address _spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE369(address _spender, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER474(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM335(address _from, address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER660(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL717(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract IWethERC20 is IWeth, IERC20 {}

contract Constants {

    uint256 internal constant wei_precision346 = 10**18;	//inject NONSTANDARD NAMING
    uint256 internal constant wei_percent_precision171 = 10**20;	//inject NONSTANDARD NAMING

    uint256 internal constant days_in_a_year585 = 365;	//inject NONSTANDARD NAMING
    uint256 internal constant one_month792 = 2628000; // approx. seconds in a month	//inject NONSTANDARD NAMING

    IWethERC20 public constant wethtoken478 = IWethERC20(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);	//inject NONSTANDARD NAMING
    address public constant bzrxtokenaddress445 = 0x56d811088235F11C8920698a204A5010a788f4b3;	//inject NONSTANDARD NAMING
    address public constant vbzrxtokenaddress346 = 0xB72B31907C1C95F3650b64b2469e08EdACeE5e8F;	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                          
library EnumerableBytes32Set {

    struct Bytes32Set {
        // Position of the value in the `values` array, plus 1 because index 0
        // means a value is not in the set.
        mapping (bytes32 => uint256) index;
        bytes32[] values;
    }

                                                                                                                          
    function ADDADDRESS384(Bytes32Set storage set, address addrvalue)	//inject NONSTANDARD NAMING
        internal
        returns (bool)
    {
        bytes32 value;
        assembly {
            value := addrvalue
        }
        return ADDBYTES32843(set, value);
    }

                                                                                                                 
    function ADDBYTES32843(Bytes32Set storage set, bytes32 value)	//inject NONSTANDARD NAMING
        internal
        returns (bool)
    {
        if (!CONTAINS172(set, value)){
            set.index[value] = set.values.push(value);
            return true;
        } else {
            return false;
        }
    }

                                                                                                                                    
    function REMOVEADDRESS2(Bytes32Set storage set, address addrvalue)	//inject NONSTANDARD NAMING
        internal
        returns (bool)
    {
        bytes32 value;
        assembly {
            value := addrvalue
        }
        return REMOVEBYTES32732(set, value);
    }

                                                                                                                           
    function REMOVEBYTES32732(Bytes32Set storage set, bytes32 value)	//inject NONSTANDARD NAMING
        internal
        returns (bool)
    {
        if (CONTAINS172(set, value)){
            uint256 toDeleteIndex = set.index[value] - 1;
            uint256 lastIndex = set.values.length - 1;

            // If the element we're deleting is the last one, we can just remove it without doing a swap
            if (lastIndex != toDeleteIndex) {
                bytes32 lastValue = set.values[lastIndex];

                // Move the last value to the index where the deleted value is
                set.values[toDeleteIndex] = lastValue;
                // Update the index for the moved value
                set.index[lastValue] = toDeleteIndex + 1; // All indexes are 1-based
            }

            // Delete the index entry for the deleted value
            delete set.index[value];

            // Delete the old entry for the moved value
            set.values.pop();

            return true;
        } else {
            return false;
        }
    }

                                                                          
    function CONTAINS172(Bytes32Set storage set, bytes32 value)	//inject NONSTANDARD NAMING
        internal
        view
        returns (bool)
    {
        return set.index[value] != 0;
    }

                                                                          
    function CONTAINSADDRESS637(Bytes32Set storage set, address addrvalue)	//inject NONSTANDARD NAMING
        internal
        view
        returns (bool)
    {
        bytes32 value;
        assembly {
            value := addrvalue
        }
        return set.index[value] != 0;
    }

                                                                                                                                                                                                                                                                                                                                                          
    function ENUMERATE571(Bytes32Set storage set, uint256 start, uint256 count)	//inject NONSTANDARD NAMING
        internal
        view
        returns (bytes32[] memory output)
    {
        uint256 end = start + count;
        require(end >= start, "addition overflow");
        end = set.values.length < end ? set.values.length : end;
        if (end == 0 || start >= end) {
            return output;
        }

        output = new bytes32[](end-start);
        for (uint256 i = start; i < end; i++) {
            output[i-start] = set.values[i];
        }
        return output;
    }

                                                                            
    function LENGTH208(Bytes32Set storage set)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256)
    {
        return set.values.length;
    }

                                                                                                                                                                                                                                                                                                                           
    function GET945(Bytes32Set storage set, uint256 index)	//inject NONSTANDARD NAMING
        internal
        view
        returns (bytes32)
    {
        return set.values[index];
    }

                                                                                                                                                                                                                                                                                                                           
    function GETADDRESS786(Bytes32Set storage set, uint256 index)	//inject NONSTANDARD NAMING
        internal
        view
        returns (address)
    {
        bytes32 value = set.values[index];
        address addrvalue;
        assembly {
            addrvalue := value
        }
        return addrvalue;
    }
}

                                                                                                                                                                                                                             
contract ReentrancyGuard {

                                                                                     
                                                                              
    uint256 internal constant reentrancy_guard_free648 = 1;	//inject NONSTANDARD NAMING

                                            
    uint256 internal constant reentrancy_guard_locked639 = 2;	//inject NONSTANDARD NAMING

                                                                      
    uint256 internal reentrancyLock = reentrancy_guard_free648;

                                                                                                                                                                                                                                                                                                                                                                                                 
    modifier NONREENTRANT934() {	//inject NONSTANDARD NAMING
        require(reentrancyLock == reentrancy_guard_free648, "nonReentrant");
        reentrancyLock = reentrancy_guard_locked639;
        _;
        reentrancyLock = reentrancy_guard_free648;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER996() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA867() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED279(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER996();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED279(address(0), msgSender);
    }

                                                                     
    function OWNER925() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER39() {	//inject NONSTANDARD NAMING
        require(ISOWNER651(), "unauthorized");
        _;
    }

                                                                            
    function ISOWNER651() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER996() == _owner;
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP192(address newOwner) public ONLYOWNER39 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP8(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP8(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED279(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD318(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB941(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB941(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB941(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL892(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV236(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV236(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV236(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b != 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                  
    function DIVCEIL307(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIVCEIL307(a, b, "SafeMath: division by zero");
    }

                                                                                                  
    function DIVCEIL307(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b != 0, errorMessage);

        if (a == 0) {
            return 0;
        }
        uint256 c = ((a - 1) / b) + 1;

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD595(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD595(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD595(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }

    function MIN256892(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return _a < _b ? _a : _b;
    }
}

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function ISCONTRACT531(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

                                                                                                                                                                                                          
    function TOPAYABLE235(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE741(address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER414(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN570(token, abi.encodeWithSelector(token.TRANSFER474.selector, to, value));
    }

    function SAFETRANSFERFROM370(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN570(token, abi.encodeWithSelector(token.TRANSFERFROM335.selector, from, to, value));
    }

    function SAFEAPPROVE102(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE601(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN570(token, abi.encodeWithSelector(token.APPROVE369.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE353(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE601(address(this), spender).ADD318(value);
        CALLOPTIONALRETURN570(token, abi.encodeWithSelector(token.APPROVE369.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE575(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE601(address(this), spender).SUB941(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN570(token, abi.encodeWithSelector(token.APPROVE369.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN570(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT531(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract LoanStruct {
    struct Loan {
        bytes32 id;                 // id of the loan
        bytes32 loanParamsId;       // the linked loan params id
        bytes32 pendingTradesId;    // the linked pending trades id
        uint256 principal;          // total borrowed amount outstanding
        uint256 collateral;         // total collateral escrowed for the loan
        uint256 startTimestamp;     // loan start time
        uint256 endTimestamp;       // for active loans, this is the expected loan end time, for in-active loans, is the actual (past) end time
        uint256 startMargin;        // initial margin when the loan opened
        uint256 startRate;          // reference rate when the loan opened for converting collateralToken to loanToken
        address borrower;           // borrower of this loan
        address lender;             // lender of this loan
        bool active;                // if false, the loan has been fully closed
    }
}

contract LoanParamsStruct {
    struct LoanParams {
        bytes32 id;                 // id of loan params object
        bool active;                // if false, this object has been disabled by the owner and can't be used for future loans
        address owner;              // owner of this object
        address loanToken;          // the token being loaned
        address collateralToken;    // the required collateral token
        uint256 minInitialMargin;   // the minimum allowed initial margin
        uint256 maintenanceMargin;  // an unhealthy loan when current margin is at or below this value
        uint256 maxLoanTerm;        // the maximum term for new loans (0 means there's no max term)
    }
}

contract OrderStruct {
    struct Order {
        uint256 lockedAmount;           // escrowed amount waiting for a counterparty
        uint256 interestRate;           // interest rate defined by the creator of this order
        uint256 minLoanTerm;            // minimum loan term allowed
        uint256 maxLoanTerm;            // maximum loan term allowed
        uint256 createdTimestamp;       // timestamp when this order was created
        uint256 expirationTimestamp;    // timestamp when this order expires
    }
}

contract LenderInterestStruct {
    struct LenderInterest {
        uint256 principalTotal;     // total borrowed amount outstanding of asset
        uint256 owedPerDay;         // interest owed per day for all loans of asset
        uint256 owedTotal;          // total interest owed for all loans of asset (assuming they go to full term)
        uint256 paidTotal;          // total interest paid so far for asset
        uint256 updatedTimestamp;   // last update
    }
}

contract LoanInterestStruct {
    struct LoanInterest {
        uint256 owedPerDay;         // interest owed per day for loan
        uint256 depositTotal;       // total escrowed interest for loan
        uint256 updatedTimestamp;   // last update
    }
}

contract Objects is
    LoanStruct,
    LoanParamsStruct,
    OrderStruct,
    LenderInterestStruct,
    LoanInterestStruct
{}

contract State is Constants, Objects, ReentrancyGuard, Ownable {
    using SafeMath for uint256;
    using EnumerableBytes32Set for EnumerableBytes32Set.Bytes32Set;

    address public priceFeeds;                                                              // handles asset reference price lookups
    address public swapsImpl;                                                               // handles asset swaps using dex liquidity

    mapping (bytes4 => address) public logicTargets;                                        // implementations of protocol functions

    mapping (bytes32 => Loan) public loans;                                                 // loanId => Loan
    mapping (bytes32 => LoanParams) public loanParams;                                      // loanParamsId => LoanParams

    mapping (address => mapping (bytes32 => Order)) public lenderOrders;                    // lender => orderParamsId => Order
    mapping (address => mapping (bytes32 => Order)) public borrowerOrders;                  // borrower => orderParamsId => Order

    mapping (bytes32 => mapping (address => bool)) public delegatedManagers;                // loanId => delegated => approved

    // Interest
    mapping (address => mapping (address => LenderInterest)) public lenderInterest;         // lender => loanToken => LenderInterest object
    mapping (bytes32 => LoanInterest) public loanInterest;                                  // loanId => LoanInterest object

    // Internals
    EnumerableBytes32Set.Bytes32Set internal logicTargetsSet;                               // implementations set
    EnumerableBytes32Set.Bytes32Set internal activeLoansSet;                                // active loans set

    mapping (address => EnumerableBytes32Set.Bytes32Set) internal lenderLoanSets;           // lender loans set
    mapping (address => EnumerableBytes32Set.Bytes32Set) internal borrowerLoanSets;         // borrow loans set
    mapping (address => EnumerableBytes32Set.Bytes32Set) internal userLoanParamSets;        // user loan params set

    address public feesController;                                                          // address controlling fee withdrawals

    uint256 public lendingFeePercent = 10 ether; // 10% fee                                 // fee taken from lender interest payments
    mapping (address => uint256) public lendingFeeTokensHeld;                               // total interest fees received and not withdrawn per asset
    mapping (address => uint256) public lendingFeeTokensPaid;                               // total interest fees withdraw per asset (lifetime fees = lendingFeeTokensHeld + lendingFeeTokensPaid)

    uint256 public tradingFeePercent = 0.15 ether; // 0.15% fee                             // fee paid for each trade
    mapping (address => uint256) public tradingFeeTokensHeld;                               // total trading fees received and not withdrawn per asset
    mapping (address => uint256) public tradingFeeTokensPaid;                               // total trading fees withdraw per asset (lifetime fees = tradingFeeTokensHeld + tradingFeeTokensPaid)

    uint256 public borrowingFeePercent = 0.09 ether; // 0.09% fee                           // origination fee paid for each loan
    mapping (address => uint256) public borrowingFeeTokensHeld;                             // total borrowing fees received and not withdrawn per asset
    mapping (address => uint256) public borrowingFeeTokensPaid;                             // total borrowing fees withdraw per asset (lifetime fees = borrowingFeeTokensHeld + borrowingFeeTokensPaid)

    uint256 public protocolTokenHeld;                                                       // current protocol token deposit balance
    uint256 public protocolTokenPaid;                                                       // lifetime total payout of protocol token

    uint256 public affiliateFeePercent = 30 ether; // 30% fee share                         // fee share for affiliate program

    mapping (address => mapping (address => uint256)) public liquidationIncentivePercent;   // percent discount on collateral for liquidators per loanToken and collateralToken

    mapping (address => address) public loanPoolToUnderlying;                               // loanPool => underlying
    mapping (address => address) public underlyingToLoanPool;                               // underlying => loanPool
    EnumerableBytes32Set.Bytes32Set internal loanPoolsSet;                                  // loan pools set

    mapping (address => bool) public supportedTokens;                                       // supported tokens for swaps

    uint256 public maxDisagreement = 5 ether;                                               // % disagreement between swap rate and reference rate

    uint256 public sourceBufferPercent = 5 ether;                                           // used to estimate kyber swap source amount

    uint256 public maxSwapSize = 1500 ether;                                                // maximum supported swap size in ETH


    function _SETTARGET284(	//inject NONSTANDARD NAMING
        bytes4 sig,
        address target)
        internal
    {
        logicTargets[sig] = target;

        if (target != address(0)) {
            logicTargetsSet.ADDBYTES32843(bytes32(sig));
        } else {
            logicTargetsSet.REMOVEBYTES32732(bytes32(sig));
        }
    }
}

interface IPriceFeeds {
    function QUERYRATE321(	//inject NONSTANDARD NAMING
        address sourceToken,
        address destToken)
        external
        view
        returns (uint256 rate, uint256 precision);

    function QUERYPRECISION282(	//inject NONSTANDARD NAMING
        address sourceToken,
        address destToken)
        external
        view
        returns (uint256 precision);

    function QUERYRETURN720(	//inject NONSTANDARD NAMING
        address sourceToken,
        address destToken,
        uint256 sourceAmount)
        external
        view
        returns (uint256 destAmount);

    function CHECKPRICEDISAGREEMENT213(	//inject NONSTANDARD NAMING
        address sourceToken,
        address destToken,
        uint256 sourceAmount,
        uint256 destAmount,
        uint256 maxSlippage)
        external
        view
        returns (uint256 sourceToDestSwapRate);

    function AMOUNTINETH197(	//inject NONSTANDARD NAMING
        address Token,
        uint256 amount)
        external
        view
        returns (uint256 ethAmount);

    function GETMAXDRAWDOWN873(	//inject NONSTANDARD NAMING
        address loanToken,
        address collateralToken,
        uint256 loanAmount,
        uint256 collateralAmount,
        uint256 maintenanceMargin)
        external
        view
        returns (uint256);

    function GETCURRENTMARGINANDCOLLATERALSIZE85(	//inject NONSTANDARD NAMING
        address loanToken,
        address collateralToken,
        uint256 loanAmount,
        uint256 collateralAmount)
        external
        view
        returns (uint256 currentMargin, uint256 collateralInEthAmount);

    function GETCURRENTMARGIN973(	//inject NONSTANDARD NAMING
        address loanToken,
        address collateralToken,
        uint256 loanAmount,
        uint256 collateralAmount)
        external
        view
        returns (uint256 currentMargin, uint256 collateralToLoanRate);

    function SHOULDLIQUIDATE392(	//inject NONSTANDARD NAMING
        address loanToken,
        address collateralToken,
        uint256 loanAmount,
        uint256 collateralAmount,
        uint256 maintenanceMargin)
        external
        view
        returns (bool);

    function GETFASTGASPRICE520(	//inject NONSTANDARD NAMING
        address payToken)
        external
        view
        returns (uint256);
}

contract ProtocolTokenUser is State {
    using SafeERC20 for IERC20;

    function _WITHDRAWPROTOCOLTOKEN992(	//inject NONSTANDARD NAMING
        address receiver,
        uint256 amount)
        internal
        returns (address, uint256)
    {
        uint256 withdrawAmount = amount;

        uint256 tokenBalance = protocolTokenHeld;
        if (withdrawAmount > tokenBalance) {
            withdrawAmount = tokenBalance;
        }
        if (withdrawAmount == 0) {
            return (vbzrxtokenaddress346, 0);
        }

        protocolTokenHeld = tokenBalance
            .SUB941(withdrawAmount);

        IERC20(vbzrxtokenaddress346).SAFETRANSFER414(
            receiver,
            withdrawAmount
        );

        return (vbzrxtokenaddress346, withdrawAmount);
    }
}

contract FeesEvents {

    event PAYLENDINGFEE830(	//inject NONSTANDARD NAMING
        address indexed payer,
        address indexed token,
        uint256 amount
    );

    event PAYTRADINGFEE738(	//inject NONSTANDARD NAMING
        address indexed payer,
        address indexed token,
        bytes32 indexed loanId,
        uint256 amount
    );

    event PAYBORROWINGFEE598(	//inject NONSTANDARD NAMING
        address indexed payer,
        address indexed token,
        bytes32 indexed loanId,
        uint256 amount
    );

    event EARNREWARD872(	//inject NONSTANDARD NAMING
        address indexed receiver,
        address indexed token,
        bytes32 indexed loanId,
        uint256 amount
    );
}

contract FeesHelper is State, ProtocolTokenUser, FeesEvents {
    using SafeERC20 for IERC20;

    // calculate trading fee
    function _GETTRADINGFEE583(	//inject NONSTANDARD NAMING
        uint256 feeTokenAmount)
        internal
        view
        returns (uint256)
    {
        return feeTokenAmount
            .MUL892(tradingFeePercent)
            .DIVCEIL307(wei_percent_precision171);
    }

    // calculate loan origination fee
    function _GETBORROWINGFEE882(	//inject NONSTANDARD NAMING
        uint256 feeTokenAmount)
        internal
        view
        returns (uint256)
    {
        return feeTokenAmount
            .MUL892(borrowingFeePercent)
            .DIVCEIL307(wei_percent_precision171);
    }

    // settle trading fee
    function _PAYTRADINGFEE650(	//inject NONSTANDARD NAMING
        address user,
        bytes32 loanId,
        address feeToken,
        uint256 tradingFee)
        internal
    {
        if (tradingFee != 0) {
            tradingFeeTokensHeld[feeToken] = tradingFeeTokensHeld[feeToken]
                .ADD318(tradingFee);

            emit PAYTRADINGFEE738(
                user,
                feeToken,
                loanId,
                tradingFee
            );

            _PAYFEEREWARD123(
                user,
                loanId,
                feeToken,
                tradingFee
            );
        }
    }

    // settle loan origination fee
    function _PAYBORROWINGFEE495(	//inject NONSTANDARD NAMING
        address user,
        bytes32 loanId,
        address feeToken,
        uint256 borrowingFee)
        internal
    {
        if (borrowingFee != 0) {
            borrowingFeeTokensHeld[feeToken] = borrowingFeeTokensHeld[feeToken]
                .ADD318(borrowingFee);

            emit PAYBORROWINGFEE598(
                user,
                feeToken,
                loanId,
                borrowingFee
            );

            _PAYFEEREWARD123(
                user,
                loanId,
                feeToken,
                borrowingFee
            );
        }
    }

    // settle lender (interest) fee
    function _PAYLENDINGFEE661(	//inject NONSTANDARD NAMING
        address user,
        address feeToken,
        uint256 lendingFee)
        internal
    {
        if (lendingFee != 0) {
            lendingFeeTokensHeld[feeToken] = lendingFeeTokensHeld[feeToken]
                .ADD318(lendingFee);

            emit PAYLENDINGFEE830(
                user,
                feeToken,
                lendingFee
            );

                                                                
        }
    }

    // settles and pays borrowers based on the fees generated by their interest payments
    function _SETTLEFEEREWARDFORINTERESTEXPENSE518(	//inject NONSTANDARD NAMING
        LoanInterest storage loanInterestLocal,
        bytes32 loanId,
        address feeToken,
        address user,
        uint256 interestTime)
        internal
    {
        uint256 updatedTimestamp = loanInterestLocal.updatedTimestamp;

        uint256 interestExpenseFee;
        if (updatedTimestamp != 0) {
            // this represents the fee generated by a borrower's interest payment
            interestExpenseFee = interestTime
                .SUB941(updatedTimestamp)
                .MUL892(loanInterestLocal.owedPerDay)
                .MUL892(lendingFeePercent)
                .DIV236(1 days * wei_percent_precision171);
        }

        loanInterestLocal.updatedTimestamp = interestTime;

        if (interestExpenseFee != 0) {
            _PAYFEEREWARD123(
                user,
                loanId,
                feeToken,
                interestExpenseFee
            );
        }
    }


    // pay protocolToken reward to user
    function _PAYFEEREWARD123(	//inject NONSTANDARD NAMING
        address user,
        bytes32 loanId,
        address feeToken,
        uint256 feeAmount)
        internal
    {
        // The protocol is designed to allow positions and loans to be closed, if for whatever reason
        // the price lookup is failing, returning 0, or is otherwise paused. Therefore, we allow this
        // call to fail silently, rather than revert, to allow the transaction to continue without a
        // BZRX token reward.
        uint256 rewardAmount;
        address _priceFeeds = priceFeeds;
        (bool success, bytes memory data) = _priceFeeds.staticcall(
            abi.encodeWithSelector(
                IPriceFeeds(_priceFeeds).QUERYRETURN720.selector,
                feeToken,
                bzrxtokenaddress445, // price rewards using BZRX price rather than vesting token price
                feeAmount / 2  // 50% of fee value
            )
        );
        assembly {
            if eq(success, 1) {
                rewardAmount := mload(add(data, 32))
            }
        }

        if (rewardAmount != 0) {
            address rewardToken;
            (rewardToken, rewardAmount) = _WITHDRAWPROTOCOLTOKEN992(
                user,
                rewardAmount
            );
            if (rewardAmount != 0) {
                protocolTokenPaid = protocolTokenPaid
                    .ADD318(rewardAmount);

                emit EARNREWARD872(
                    user,
                    rewardToken,
                    loanId,
                    rewardAmount
                );
            }
        }
    }
}

contract VaultController is Constants {
    using SafeERC20 for IERC20;

    event VAULTDEPOSIT35(	//inject NONSTANDARD NAMING
        address indexed asset,
        address indexed from,
        uint256 amount
    );
    event VAULTWITHDRAW570(	//inject NONSTANDARD NAMING
        address indexed asset,
        address indexed to,
        uint256 amount
    );

    function VAULTETHERDEPOSIT512(	//inject NONSTANDARD NAMING
        address from,
        uint256 value)
        internal
    {
        IWethERC20 _wethToken = wethtoken478;
        _wethToken.DEPOSIT642.value(value)();

        emit VAULTDEPOSIT35(
            address(_wethToken),
            from,
            value
        );
    }

    function VAULTETHERWITHDRAW531(	//inject NONSTANDARD NAMING
        address to,
        uint256 value)
        internal
    {
        if (value != 0) {
            IWethERC20 _wethToken = wethtoken478;
            uint256 balance = address(this).balance;
            if (value > balance) {
                _wethToken.WITHDRAW190(value - balance);
            }
            Address.SENDVALUE741(to, value);

            emit VAULTWITHDRAW570(
                address(_wethToken),
                to,
                value
            );
        }
    }

    function VAULTDEPOSIT134(	//inject NONSTANDARD NAMING
        address token,
        address from,
        uint256 value)
        internal
    {
        if (value != 0) {
            IERC20(token).SAFETRANSFERFROM370(
                from,
                address(this),
                value
            );

            emit VAULTDEPOSIT35(
                token,
                from,
                value
            );
        }
    }

    function VAULTWITHDRAW299(	//inject NONSTANDARD NAMING
        address token,
        address to,
        uint256 value)
        internal
    {
        if (value != 0) {
            IERC20(token).SAFETRANSFER414(
                to,
                value
            );

            emit VAULTWITHDRAW570(
                token,
                to,
                value
            );
        }
    }

    function VAULTTRANSFER555(	//inject NONSTANDARD NAMING
        address token,
        address from,
        address to,
        uint256 value)
        internal
    {
        if (value != 0) {
            if (from == address(this)) {
                IERC20(token).SAFETRANSFER414(
                    to,
                    value
                );
            } else {
                IERC20(token).SAFETRANSFERFROM370(
                    from,
                    to,
                    value
                );
            }
        }
    }

    function VAULTAPPROVE918(	//inject NONSTANDARD NAMING
        address token,
        address to,
        uint256 value)
        internal
    {
        if (value != 0 && IERC20(token).ALLOWANCE601(address(this), to) != 0) {
            IERC20(token).SAFEAPPROVE102(to, 0);
        }
        IERC20(token).SAFEAPPROVE102(to, value);
    }
}

contract InterestUser is State, VaultController, FeesHelper {
    using SafeERC20 for IERC20;

    function _PAYINTEREST956(	//inject NONSTANDARD NAMING
        address lender,
        address interestToken)
        internal
    {
        LenderInterest storage lenderInterestLocal = lenderInterest[lender][interestToken];

        uint256 interestOwedNow = 0;
        if (lenderInterestLocal.owedPerDay != 0 && lenderInterestLocal.updatedTimestamp != 0) {
            interestOwedNow = block.timestamp
                .SUB941(lenderInterestLocal.updatedTimestamp)
                .MUL892(lenderInterestLocal.owedPerDay)
                .DIV236(1 days);

            lenderInterestLocal.updatedTimestamp = block.timestamp;

            if (interestOwedNow > lenderInterestLocal.owedTotal)
	            interestOwedNow = lenderInterestLocal.owedTotal;

            if (interestOwedNow != 0) {
                lenderInterestLocal.paidTotal = lenderInterestLocal.paidTotal
                    .ADD318(interestOwedNow);
                lenderInterestLocal.owedTotal = lenderInterestLocal.owedTotal
                    .SUB941(interestOwedNow);

                _PAYINTERESTTRANSFER988(
                    lender,
                    interestToken,
                    interestOwedNow
                );
            }
        } else {
            lenderInterestLocal.updatedTimestamp = block.timestamp;
        }
    }

    function _PAYINTERESTTRANSFER988(	//inject NONSTANDARD NAMING
        address lender,
        address interestToken,
        uint256 interestOwedNow)
        internal
    {
        uint256 lendingFee = interestOwedNow
            .MUL892(lendingFeePercent)
            .DIVCEIL307(wei_percent_precision171);

        _PAYLENDINGFEE661(
            lender,
            interestToken,
            lendingFee
        );

        // transfers the interest to the lender, less the interest fee
        VAULTWITHDRAW299(
            interestToken,
            lender,
            interestOwedNow
                .SUB941(lendingFee)
        );
    }
}

contract LiquidationHelper is State {

    function _GETLIQUIDATIONAMOUNTS41(	//inject NONSTANDARD NAMING
        uint256 principal,
        uint256 collateral,
        uint256 currentMargin,
        uint256 maintenanceMargin,
        uint256 collateralToLoanRate,
        uint256 incentivePercent)
        internal
        view
        returns (uint256 maxLiquidatable, uint256 maxSeizable)
    {
        if (currentMargin > maintenanceMargin || collateralToLoanRate == 0) {
            return (maxLiquidatable, maxSeizable);
        } else if (currentMargin <= incentivePercent) {
            return (principal, collateral);
        }

        uint256 desiredMargin = maintenanceMargin
            .ADD318(5 ether); // 5 percentage points above maintenance

        // maxLiquidatable = ((1 + desiredMargin)*principal - collateralToLoanRate*collateral) / (desiredMargin - incentivePercent)
        maxLiquidatable = desiredMargin
            .ADD318(wei_percent_precision171)
            .MUL892(principal)
            .DIV236(wei_percent_precision171);
        maxLiquidatable = maxLiquidatable
            .SUB941(
                collateral
                    .MUL892(collateralToLoanRate)
                    .DIV236(wei_precision346)
            );
        maxLiquidatable = maxLiquidatable
            .MUL892(wei_percent_precision171)
            .DIV236(
                desiredMargin
                    .SUB941(incentivePercent)
            );
        if (maxLiquidatable > principal) {
            maxLiquidatable = principal;
        }

        // maxSeizable = maxLiquidatable * (1 + incentivePercent) / collateralToLoanRate
        maxSeizable = maxLiquidatable
            .MUL892(
                incentivePercent
                    .ADD318(wei_percent_precision171)
            );
        maxSeizable = maxSeizable
            .DIV236(collateralToLoanRate)
            .DIV236(100);
        if (maxSeizable > collateral) {
            maxSeizable = collateral;
        }

        return (maxLiquidatable, maxSeizable);
    }
}

contract SwapsEvents {

    event LOANSWAP488(	//inject NONSTANDARD NAMING
        bytes32 indexed loanId,
        address indexed sourceToken,
        address indexed destToken,
        address borrower,
        uint256 sourceAmount,
        uint256 destAmount
    );

    event EXTERNALSWAP1000(	//inject NONSTANDARD NAMING
        address indexed user,
        address indexed sourceToken,
        address indexed destToken,
        uint256 sourceAmount,
        uint256 destAmount
    );
}

interface ISwapsImpl {
    function DEXSWAP261(	//inject NONSTANDARD NAMING
        address sourceTokenAddress,
        address destTokenAddress,
        address receiverAddress,
        address returnToSenderAddress,
        uint256 minSourceTokenAmount,
        uint256 maxSourceTokenAmount,
        uint256 requiredDestTokenAmount)
        external
        returns (uint256 destTokenAmountReceived, uint256 sourceTokenAmountUsed);

    function DEXEXPECTEDRATE519(	//inject NONSTANDARD NAMING
        address sourceTokenAddress,
        address destTokenAddress,
        uint256 sourceTokenAmount)
        external
        view
        returns (uint256);
}

contract SwapsUser is State, SwapsEvents, FeesHelper {

    function _LOANSWAP665(	//inject NONSTANDARD NAMING
        bytes32 loanId,
        address sourceToken,
        address destToken,
        address user,
        uint256 minSourceTokenAmount,
        uint256 maxSourceTokenAmount,
        uint256 requiredDestTokenAmount,
        bool bypassFee,
        bytes memory loanDataBytes)
        internal
        returns (uint256 destTokenAmountReceived, uint256 sourceTokenAmountUsed, uint256 sourceToDestSwapRate)
    {
        (destTokenAmountReceived, sourceTokenAmountUsed) = _SWAPSCALL465(
            [
                sourceToken,
                destToken,
                address(this), // receiver
                address(this), // returnToSender
                user
            ],
            [
                minSourceTokenAmount,
                maxSourceTokenAmount,
                requiredDestTokenAmount
            ],
            loanId,
            bypassFee,
            loanDataBytes
        );

        // will revert if swap size too large
        _CHECKSWAPSIZE290(sourceToken, sourceTokenAmountUsed);

        // will revert if disagreement found
        sourceToDestSwapRate = IPriceFeeds(priceFeeds).CHECKPRICEDISAGREEMENT213(
            sourceToken,
            destToken,
            sourceTokenAmountUsed,
            destTokenAmountReceived,
            maxDisagreement
        );

        emit LOANSWAP488(
            loanId,
            sourceToken,
            destToken,
            user,
            sourceTokenAmountUsed,
            destTokenAmountReceived
        );
    }

    function _SWAPSCALL465(	//inject NONSTANDARD NAMING
        address[5] memory addrs,
        uint256[3] memory vals,
        bytes32 loanId,
        bool miscBool, // bypassFee
        bytes memory loanDataBytes)
        internal
        returns (uint256, uint256)
    {
        //addrs[0]: sourceToken
        //addrs[1]: destToken
        //addrs[2]: receiver
        //addrs[3]: returnToSender
        //addrs[4]: user
        //vals[0]:  minSourceTokenAmount
        //vals[1]:  maxSourceTokenAmount
        //vals[2]:  requiredDestTokenAmount

        require(vals[0] != 0, "sourceAmount == 0");

        uint256 destTokenAmountReceived;
        uint256 sourceTokenAmountUsed;

        uint256 tradingFee;
        if (!miscBool) { // bypassFee
            if (vals[2] == 0) {
                // condition: vals[0] will always be used as sourceAmount

                tradingFee = _GETTRADINGFEE583(vals[0]);
                if (tradingFee != 0) {
                    _PAYTRADINGFEE650(
                        addrs[4], // user
                        loanId,
                        addrs[0], // sourceToken
                        tradingFee
                    );

                    vals[0] = vals[0]
                        .SUB941(tradingFee);
                }
            } else {
                // condition: unknown sourceAmount will be used

                tradingFee = _GETTRADINGFEE583(vals[2]);

                if (tradingFee != 0) {
                    vals[2] = vals[2]
                        .ADD318(tradingFee);
                }
            }
        }

        if (vals[1] == 0) {
            vals[1] = vals[0];
        } else {
            require(vals[0] <= vals[1], "min greater than max");
        }

        require(loanDataBytes.length == 0, "invalid state");
        (destTokenAmountReceived, sourceTokenAmountUsed) = _SWAPSCALL_INTERNAL424(
            addrs,
            vals
        );

        if (vals[2] == 0) {
            // there's no minimum destTokenAmount, but all of vals[0] (minSourceTokenAmount) must be spent, and amount spent can't exceed vals[0]
            require(sourceTokenAmountUsed == vals[0], "swap too large to fill");

            if (tradingFee != 0) {
                sourceTokenAmountUsed = sourceTokenAmountUsed + tradingFee; // will never overflow
            }
        } else {
            // there's a minimum destTokenAmount required, but sourceTokenAmountUsed won't be greater than vals[1] (maxSourceTokenAmount)
            require(sourceTokenAmountUsed <= vals[1], "swap fill too large");
            require(destTokenAmountReceived >= vals[2], "insufficient swap liquidity");

            if (tradingFee != 0) {
                _PAYTRADINGFEE650(
                    addrs[4], // user
                    loanId, // loanId,
                    addrs[1], // destToken
                    tradingFee
                );

                destTokenAmountReceived = destTokenAmountReceived - tradingFee; // will never overflow
            }
        }

        return (destTokenAmountReceived, sourceTokenAmountUsed);
    }

    function _SWAPSCALL_INTERNAL424(	//inject NONSTANDARD NAMING
        address[5] memory addrs,
        uint256[3] memory vals)
        internal
        returns (uint256 destTokenAmountReceived, uint256 sourceTokenAmountUsed)
    {
        bytes memory data = abi.encodeWithSelector(
            ISwapsImpl(swapsImpl).DEXSWAP261.selector,
            addrs[0], // sourceToken
            addrs[1], // destToken
            addrs[2], // receiverAddress
            addrs[3], // returnToSenderAddress
            vals[0],  // minSourceTokenAmount
            vals[1],  // maxSourceTokenAmount
            vals[2]   // requiredDestTokenAmount
        );

        bool success;
        (success, data) = swapsImpl.delegatecall(data);
        require(success, "swap failed");

        (destTokenAmountReceived, sourceTokenAmountUsed) = abi.decode(data, (uint256, uint256));
    }

    function _SWAPSEXPECTEDRETURN401(	//inject NONSTANDARD NAMING
        address sourceToken,
        address destToken,
        uint256 sourceTokenAmount)
        internal
        view
        returns (uint256)
    {
        uint256 tradingFee = _GETTRADINGFEE583(sourceTokenAmount);
        if (tradingFee != 0) {
            sourceTokenAmount = sourceTokenAmount
                .SUB941(tradingFee);
        }

        uint256 sourceToDestRate = ISwapsImpl(swapsImpl).DEXEXPECTEDRATE519(
            sourceToken,
            destToken,
            sourceTokenAmount
        );
        uint256 sourceToDestPrecision = IPriceFeeds(priceFeeds).QUERYPRECISION282(
            sourceToken,
            destToken
        );

        return sourceTokenAmount
            .MUL892(sourceToDestRate)
            .DIV236(sourceToDestPrecision);
    }

    function _CHECKSWAPSIZE290(	//inject NONSTANDARD NAMING
        address tokenAddress,
        uint256 amount)
        internal
        view
    {
        uint256 _maxSwapSize = maxSwapSize;
        if (_maxSwapSize != 0) {
            uint256 amountInEth;
            if (tokenAddress == address(wethtoken478)) {
                amountInEth = amount;
            } else {
                amountInEth = IPriceFeeds(priceFeeds).AMOUNTINETH197(tokenAddress, amount);
            }
            require(amountInEth <= _maxSwapSize, "swap too large");
        }
    }
}

contract LoanMaintenanceEvents {

    event DEPOSITCOLLATERAL517(	//inject NONSTANDARD NAMING
        address indexed user,
        address indexed depositToken,
        bytes32 indexed loanId,
        uint256 depositAmount
    );

    event WITHDRAWCOLLATERAL564(	//inject NONSTANDARD NAMING
        address indexed user,
        address indexed withdrawToken,
        bytes32 indexed loanId,
        uint256 withdrawAmount
    );

    event EXTENDLOANDURATION74(	//inject NONSTANDARD NAMING
        address indexed user,
        address indexed depositToken,
        bytes32 indexed loanId,
        uint256 depositAmount,
        uint256 collateralUsedAmount,
        uint256 newEndTimestamp
    );

    event REDUCELOANDURATION661(	//inject NONSTANDARD NAMING
        address indexed user,
        address indexed withdrawToken,
        bytes32 indexed loanId,
        uint256 withdrawAmount,
        uint256 newEndTimestamp
    );

    enum LoanType {
        All,
        Margin,
        NonMargin
    }

    struct LoanReturnData {
        bytes32 loanId;
        uint96 endTimestamp;
        address loanToken;
        address collateralToken;
        uint256 principal;
        uint256 collateral;
        uint256 interestOwedPerDay;
        uint256 interestDepositRemaining;
        uint256 startRate; // collateralToLoanRate
        uint256 startMargin;
        uint256 maintenanceMargin;
        uint256 currentMargin;
        uint256 maxLoanTerm;
        uint256 maxLiquidatable;
        uint256 maxSeizable;
    }
}

contract LoanMaintenance is State, LoanMaintenanceEvents, VaultController, InterestUser, SwapsUser, LiquidationHelper {

    function INITIALIZE235(	//inject NONSTANDARD NAMING
        address target)
        external
        ONLYOWNER39
    {
        _SETTARGET284(this.DEPOSITCOLLATERAL712.selector, target);
        _SETTARGET284(this.WITHDRAWCOLLATERAL882.selector, target);
        _SETTARGET284(this.WITHDRAWACCRUEDINTEREST64.selector, target);
        _SETTARGET284(this.EXTENDLOANDURATION965.selector, target);
        _SETTARGET284(this.REDUCELOANDURATION6.selector, target);
        _SETTARGET284(this.GETLENDERINTERESTDATA16.selector, target);
        _SETTARGET284(this.GETLOANINTERESTDATA932.selector, target);
        _SETTARGET284(this.GETUSERLOANS919.selector, target);
        _SETTARGET284(this.GETLOAN576.selector, target);
        _SETTARGET284(this.GETACTIVELOANS682.selector, target);
    }

    function DEPOSITCOLLATERAL712(	//inject NONSTANDARD NAMING
        bytes32 loanId,
        uint256 depositAmount) // must match msg.value if ether is sent
        external
        payable
        NONREENTRANT934
    {
        require(depositAmount != 0, "depositAmount is 0");

        Loan storage loanLocal = loans[loanId];
        require(loanLocal.active, "loan is closed");

        LoanParams storage loanParamsLocal = loanParams[loanLocal.loanParamsId];

        address collateralToken = loanParamsLocal.collateralToken;
        uint256 collateral = loanLocal.collateral;

        require(msg.value == 0 || collateralToken == address(wethtoken478), "wrong asset sent");

        collateral = collateral
            .ADD318(depositAmount);
        loanLocal.collateral = collateral;

        if (msg.value == 0) {
            VAULTDEPOSIT134(
                collateralToken,
                msg.sender,
                depositAmount
            );
        } else {
            require(msg.value == depositAmount, "ether deposit mismatch");
            VAULTETHERDEPOSIT512(
                msg.sender,
                msg.value
            );
        }

        emit DEPOSITCOLLATERAL517(
            loanLocal.borrower,
            collateralToken,
            loanId,
            depositAmount
        );
    }

    function WITHDRAWCOLLATERAL882(	//inject NONSTANDARD NAMING
        bytes32 loanId,
        address receiver,
        uint256 withdrawAmount)
        external
        NONREENTRANT934
        returns (uint256 actualWithdrawAmount)
    {
        require(withdrawAmount != 0, "withdrawAmount is 0");
        Loan storage loanLocal = loans[loanId];
        LoanParams storage loanParamsLocal = loanParams[loanLocal.loanParamsId];

        require(loanLocal.active, "loan is closed");
        require(
            msg.sender == loanLocal.borrower ||
            delegatedManagers[loanLocal.id][msg.sender],
            "unauthorized"
        );

        address collateralToken = loanParamsLocal.collateralToken;
        uint256 collateral = loanLocal.collateral;

        uint256 maxDrawdown = IPriceFeeds(priceFeeds).GETMAXDRAWDOWN873(
            loanParamsLocal.loanToken,
            collateralToken,
            loanLocal.principal,
            collateral,
            loanParamsLocal.maintenanceMargin
        );

        if (withdrawAmount > maxDrawdown) {
            actualWithdrawAmount = maxDrawdown;
        } else {
            actualWithdrawAmount = withdrawAmount;
        }

        collateral = collateral
            .SUB941(actualWithdrawAmount, "withdrawAmount too high");
        loanLocal.collateral = collateral;

        if (collateralToken == address(wethtoken478)) {
            VAULTETHERWITHDRAW531(
                receiver,
                actualWithdrawAmount
            );
        } else {
            VAULTWITHDRAW299(
                collateralToken,
                receiver,
                actualWithdrawAmount
            );
        }

        emit WITHDRAWCOLLATERAL564(
            loanLocal.borrower,
            collateralToken,
            loanId,
            withdrawAmount
        );
    }

    function WITHDRAWACCRUEDINTEREST64(	//inject NONSTANDARD NAMING
        address loanToken)
        external
    {
        // pay outstanding interest to lender
        _PAYINTEREST956(
            msg.sender, // lender
            loanToken
        );
    }

    function EXTENDLOANDURATION965(	//inject NONSTANDARD NAMING
        bytes32 loanId,
        uint256 depositAmount,
        bool useCollateral,
        bytes calldata                  ) // for future use
        external
        payable
        NONREENTRANT934
        returns (uint256 secondsExtended)
    {
        require(depositAmount != 0, "depositAmount is 0");
        Loan storage loanLocal = loans[loanId];
        LoanParams storage loanParamsLocal = loanParams[loanLocal.loanParamsId];

        require(loanLocal.active, "loan is closed");
        require(
            !useCollateral ||
            msg.sender == loanLocal.borrower ||
            delegatedManagers[loanLocal.id][msg.sender],
            "unauthorized"
        );
        require(loanParamsLocal.maxLoanTerm == 0, "indefinite-term only");
        require(msg.value == 0 || (!useCollateral && loanParamsLocal.loanToken == address(wethtoken478)), "wrong asset sent");

        // pay outstanding interest to lender
        _PAYINTEREST956(
            loanLocal.lender,
            loanParamsLocal.loanToken
        );

        LoanInterest storage loanInterestLocal = loanInterest[loanLocal.id];

        _SETTLEFEEREWARDFORINTERESTEXPENSE518(
            loanInterestLocal,
            loanLocal.id,
            loanParamsLocal.loanToken,
            loanLocal.borrower,
            block.timestamp
        );

        // Handle back interest: calculates interest owned since the loan endtime passed but the loan remained open
        uint256 backInterestOwed;
        if (block.timestamp > loanLocal.endTimestamp) {
            backInterestOwed = block.timestamp
                .SUB941(loanLocal.endTimestamp);
            backInterestOwed = backInterestOwed
                .MUL892(loanInterestLocal.owedPerDay);
            backInterestOwed = backInterestOwed
                .DIV236(1 days);

            require(depositAmount > backInterestOwed, "deposit cannot cover back interest");
        }

        // deposit interest
        uint256 collateralUsed;
        if (useCollateral) {
            collateralUsed = _DOSWAPWITHCOLLATERAL637(
                loanLocal,
                loanParamsLocal,
                depositAmount
            );
        } else {
            if (msg.value == 0) {
                VAULTDEPOSIT134(
                    loanParamsLocal.loanToken,
                    msg.sender,
                    depositAmount
                );
            } else {
                require(msg.value == depositAmount, "ether deposit mismatch");
                VAULTETHERDEPOSIT512(
                    msg.sender,
                    msg.value
                );
            }
        }

        if (backInterestOwed != 0) {
            depositAmount = depositAmount
                .SUB941(backInterestOwed);

            // pay out backInterestOwed
            _PAYINTERESTTRANSFER988(
                loanLocal.lender,
                loanParamsLocal.loanToken,
                backInterestOwed
            );
        }

        secondsExtended = depositAmount
            .MUL892(1 days)
            .DIV236(loanInterestLocal.owedPerDay);

        loanLocal.endTimestamp = loanLocal.endTimestamp
            .ADD318(secondsExtended);

        require(loanLocal.endTimestamp > block.timestamp &&
               (loanLocal.endTimestamp - block.timestamp) > 1 hours,
            "loan too short"
        );

        loanInterestLocal.depositTotal = loanInterestLocal.depositTotal
            .ADD318(depositAmount);

        lenderInterest[loanLocal.lender][loanParamsLocal.loanToken].owedTotal = lenderInterest[loanLocal.lender][loanParamsLocal.loanToken].owedTotal
            .ADD318(depositAmount);

        emit EXTENDLOANDURATION74(
            loanLocal.borrower,
            loanParamsLocal.loanToken,
            loanId,
            depositAmount,
            collateralUsed,
            loanLocal.endTimestamp
        );
    }

    function REDUCELOANDURATION6(	//inject NONSTANDARD NAMING
        bytes32 loanId,
        address receiver,
        uint256 withdrawAmount)
        external
        NONREENTRANT934
        returns (uint256 secondsReduced)
    {
        require(withdrawAmount != 0, "withdrawAmount is 0");
        Loan storage loanLocal = loans[loanId];
        LoanParams storage loanParamsLocal = loanParams[loanLocal.loanParamsId];

        require(loanLocal.active, "loan is closed");
        require(
            msg.sender == loanLocal.borrower ||
            delegatedManagers[loanLocal.id][msg.sender],
            "unauthorized"
        );
        require(loanParamsLocal.maxLoanTerm == 0, "indefinite-term only");
        require(loanLocal.endTimestamp > block.timestamp, "loan term has ended");

        // pay outstanding interest to lender
        _PAYINTEREST956(
            loanLocal.lender,
            loanParamsLocal.loanToken
        );

        LoanInterest storage loanInterestLocal = loanInterest[loanLocal.id];

        _SETTLEFEEREWARDFORINTERESTEXPENSE518(
            loanInterestLocal,
            loanLocal.id,
            loanParamsLocal.loanToken,
            loanLocal.borrower,
            block.timestamp
        );

        uint256 interestDepositRemaining = loanLocal.endTimestamp
            .SUB941(block.timestamp)
            .MUL892(loanInterestLocal.owedPerDay)
            .DIV236(1 days);
        require(withdrawAmount < interestDepositRemaining, "withdraw amount too high");

        // withdraw interest
        if (loanParamsLocal.loanToken == address(wethtoken478)) {
            VAULTETHERWITHDRAW531(
                receiver,
                withdrawAmount
            );
        } else {
            VAULTWITHDRAW299(
                loanParamsLocal.loanToken,
                receiver,
                withdrawAmount
            );
        }

        secondsReduced = withdrawAmount
            .MUL892(1 days)
            .DIV236(loanInterestLocal.owedPerDay);

        require (loanLocal.endTimestamp > secondsReduced, "loan too short");

        loanLocal.endTimestamp = loanLocal.endTimestamp
            .SUB941(secondsReduced);

        require(loanLocal.endTimestamp > block.timestamp &&
               (loanLocal.endTimestamp - block.timestamp) > 1 hours,
            "loan too short"
        );

        loanInterestLocal.depositTotal = loanInterestLocal.depositTotal
            .SUB941(withdrawAmount);

        lenderInterest[loanLocal.lender][loanParamsLocal.loanToken].owedTotal = lenderInterest[loanLocal.lender][loanParamsLocal.loanToken].owedTotal
            .SUB941(withdrawAmount);

        emit REDUCELOANDURATION661(
            loanLocal.borrower,
            loanParamsLocal.loanToken,
            loanId,
            withdrawAmount,
            loanLocal.endTimestamp
        );
    }

                                                                                                             
                                        
                                               
                                                                                               
                                                                                                                  
                                                                                       
                                                                                                     
                                                                                                         
                                                                                             
    function GETLENDERINTERESTDATA16(	//inject NONSTANDARD NAMING
        address lender,
        address loanToken)
        external
        view
        returns (
            uint256 interestPaid,
            uint256 interestPaidDate,
            uint256 interestOwedPerDay,
            uint256 interestUnPaid,
            uint256 interestFeePercent,
            uint256 principalTotal)
    {
        LenderInterest memory lenderInterestLocal = lenderInterest[lender][loanToken];

        interestUnPaid = block.timestamp.SUB941(lenderInterestLocal.updatedTimestamp).MUL892(lenderInterestLocal.owedPerDay).DIV236(1 days);
        if (interestUnPaid > lenderInterestLocal.owedTotal)
            interestUnPaid = lenderInterestLocal.owedTotal;

        return (
            lenderInterestLocal.paidTotal,
            lenderInterestLocal.paidTotal != 0 ? lenderInterestLocal.updatedTimestamp : 0,
            lenderInterestLocal.owedPerDay,
            lenderInterestLocal.updatedTimestamp != 0 ? interestUnPaid : 0,
            lendingFeePercent,
            lenderInterestLocal.principalTotal
        );
    }

                                                  
                                                       
                                                                 
                                                                                        
                                                                                            
                                                                                                          
    function GETLOANINTERESTDATA932(	//inject NONSTANDARD NAMING
        bytes32 loanId)
        external
        view
        returns (
            address loanToken,
            uint256 interestOwedPerDay,
            uint256 interestDepositTotal,
            uint256 interestDepositRemaining)
    {
        loanToken = loanParams[loans[loanId].loanParamsId].loanToken;
        interestOwedPerDay = loanInterest[loanId].owedPerDay;
        interestDepositTotal = loanInterest[loanId].depositTotal;

        uint256 endTimestamp = loans[loanId].endTimestamp;
        uint256 interestTime = block.timestamp > endTimestamp ?
            endTimestamp :
            block.timestamp;
        interestDepositRemaining = endTimestamp > interestTime ?
            endTimestamp
                .SUB941(interestTime)
                .MUL892(interestOwedPerDay)
                .DIV236(1 days) :
                0;
    }

    // Only returns data for loans that are active
    // All(0): all loans
    // Margin(1): margin trade loans
    // NonMargin(2): non-margin trade loans
    // only active loans are returned
    function GETUSERLOANS919(	//inject NONSTANDARD NAMING
        address user,
        uint256 start,
        uint256 count,
        LoanType loanType,
        bool isLender,
        bool unsafeOnly)
        external
        view
        returns (LoanReturnData[] memory loansData)
    {
        EnumerableBytes32Set.Bytes32Set storage set = isLender ?
            lenderLoanSets[user] :
            borrowerLoanSets[user];

        uint256 end = start.ADD318(count).MIN256892(set.LENGTH208());
        if (start >= end) {
            return loansData;
        }
        count = end-start;

        uint256 idx = count;
        LoanReturnData memory loanData;
        loansData = new LoanReturnData[](idx);
        for (uint256 i = --end; i >= start; i--) {
            loanData = _GETLOAN958(
                set.GET945(i), // loanId
                loanType,
                unsafeOnly
            );
            if (loanData.loanId == 0) {
                if (i == 0) {
                    break;
                } else {
                    continue;
                }
            }

            loansData[count-(idx--)] = loanData;

            if (i == 0) {
                break;
            }
        }

        if (idx != 0) {
            count -= idx;
            assembly {
                mstore(loansData, count)
            }
        }
    }

    function GETLOAN576(	//inject NONSTANDARD NAMING
        bytes32 loanId)
        external
        view
        returns (LoanReturnData memory loanData)
    {
        return _GETLOAN958(
            loanId,
            LoanType.All,
            false // unsafeOnly
        );
    }

    function GETACTIVELOANS682(	//inject NONSTANDARD NAMING
        uint256 start,
        uint256 count,
        bool unsafeOnly)
        external
        view
        returns (LoanReturnData[] memory loansData)
    {
        uint256 end = start.ADD318(count).MIN256892(activeLoansSet.LENGTH208());
        if (start >= end) {
            return loansData;
        }
        count = end-start;

        uint256 idx = count;
        LoanReturnData memory loanData;
        loansData = new LoanReturnData[](idx);
        for (uint256 i = --end; i >= start; i--) {
            loanData = _GETLOAN958(
                activeLoansSet.GET945(i), // loanId
                LoanType.All,
                unsafeOnly
            );
            if (loanData.loanId == 0) {
                if (i == 0) {
                    break;
                } else {
                    continue;
                }
            }

            loansData[count-(idx--)] = loanData;

            if (i == 0) {
                break;
            }
        }

        if (idx != 0) {
            count -= idx;
            assembly {
                mstore(loansData, count)
            }
        }
    }

    function _GETLOAN958(	//inject NONSTANDARD NAMING
        bytes32 loanId,
        LoanType loanType,
        bool unsafeOnly)
        internal
        view
        returns (LoanReturnData memory loanData)
    {
        Loan memory loanLocal = loans[loanId];
        LoanParams memory loanParamsLocal = loanParams[loanLocal.loanParamsId];

        if ((loanType == LoanType.Margin && loanParamsLocal.maxLoanTerm == 0) ||
            (loanType == LoanType.NonMargin && loanParamsLocal.maxLoanTerm != 0)) {
            return loanData;
        }

        LoanInterest memory loanInterestLocal = loanInterest[loanId];

        (uint256 currentMargin, uint256 collateralToLoanRate) = IPriceFeeds(priceFeeds).GETCURRENTMARGIN973(
            loanParamsLocal.loanToken,
            loanParamsLocal.collateralToken,
            loanLocal.principal,
            loanLocal.collateral
        );

        uint256 maxLiquidatable;
        uint256 maxSeizable;
        if (currentMargin <= loanParamsLocal.maintenanceMargin) {
            (maxLiquidatable, maxSeizable) = _GETLIQUIDATIONAMOUNTS41(
                loanLocal.principal,
                loanLocal.collateral,
                currentMargin,
                loanParamsLocal.maintenanceMargin,
                collateralToLoanRate,
                liquidationIncentivePercent[loanParamsLocal.loanToken][loanParamsLocal.collateralToken]
            );
        } else if (unsafeOnly) {
            return loanData;
        }

        return LoanReturnData({
            loanId: loanId,
            endTimestamp: uint96(loanLocal.endTimestamp),
            loanToken: loanParamsLocal.loanToken,
            collateralToken: loanParamsLocal.collateralToken,
            principal: loanLocal.principal,
            collateral: loanLocal.collateral,
            interestOwedPerDay: loanInterestLocal.owedPerDay,
            interestDepositRemaining: loanLocal.endTimestamp >= block.timestamp ? loanLocal.endTimestamp.SUB941(block.timestamp).MUL892(loanInterestLocal.owedPerDay).DIV236(1 days) : 0,
            startRate: loanLocal.startRate,
            startMargin: loanLocal.startMargin,
            maintenanceMargin: loanParamsLocal.maintenanceMargin,
            currentMargin: currentMargin,
            maxLoanTerm: loanParamsLocal.maxLoanTerm,
            maxLiquidatable: maxLiquidatable,
            maxSeizable: maxSeizable
        });
    }

    function _DOSWAPWITHCOLLATERAL637(	//inject NONSTANDARD NAMING
        Loan storage loanLocal,
        LoanParams memory loanParamsLocal,
        uint256 depositAmount)
        internal
        returns (uint256)
    {
        // reverts in _loanSwap if amountNeeded can't be bought
        (,uint256 sourceTokenAmountUsed,) = _LOANSWAP665(
            loanLocal.id,
            loanParamsLocal.collateralToken,
            loanParamsLocal.loanToken,
            loanLocal.borrower,
            loanLocal.collateral, // minSourceTokenAmount
            0, // maxSourceTokenAmount (0 means minSourceTokenAmount)
            depositAmount, // requiredDestTokenAmount (partial spend of loanLocal.collateral to fill this amount)
            true, // bypassFee
            "" // loanDataBytes
        );
        loanLocal.collateral = loanLocal.collateral
            .SUB941(sourceTokenAmountUsed);

        // ensure the loan is still healthy
        (uint256 currentMargin,) = IPriceFeeds(priceFeeds).GETCURRENTMARGIN973(
            loanParamsLocal.loanToken,
            loanParamsLocal.collateralToken,
            loanLocal.principal,
            loanLocal.collateral
        );
        require(
            currentMargin > loanParamsLocal.maintenanceMargin,
            "unhealthy position"
        );

        return sourceTokenAmountUsed;
    }
}