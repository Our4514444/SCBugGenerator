                                                                 

                                                                                                                                           

pragma solidity 0.5.17;
pragma experimental ABIEncoderV2;


interface IWeth {
    function DEPOSIT923() external payable;	//inject NONSTANDARD NAMING
    function WITHDRAW770(uint256 wad) external;	//inject NONSTANDARD NAMING
}

contract IERC20 {
    string public name;
    uint8 public decimals;
    string public symbol;
    function TOTALSUPPLY163() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF581(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE164(address _owner, address _spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE189(address _spender, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER686(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM541(address _from, address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER41(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL383(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract IWethERC20 is IWeth, IERC20 {}

contract Constants {

    uint256 internal constant wei_precision839 = 10**18;	//inject NONSTANDARD NAMING
    uint256 internal constant wei_percent_precision418 = 10**20;	//inject NONSTANDARD NAMING

    uint256 internal constant days_in_a_year244 = 365;	//inject NONSTANDARD NAMING
    uint256 internal constant one_month794 = 2628000; // approx. seconds in a month	//inject NONSTANDARD NAMING

    IWethERC20 public constant wethtoken628 = IWethERC20(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);	//inject NONSTANDARD NAMING
    address public constant bzrxtokenaddress331 = 0x56d811088235F11C8920698a204A5010a788f4b3;	//inject NONSTANDARD NAMING
    address public constant vbzrxtokenaddress836 = 0xB72B31907C1C95F3650b64b2469e08EdACeE5e8F;	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                          
library EnumerableBytes32Set {

    struct Bytes32Set {
        // Position of the value in the `values` array, plus 1 because index 0
        // means a value is not in the set.
        mapping (bytes32 => uint256) index;
        bytes32[] values;
    }

                                                                                                                          
    function ADDADDRESS194(Bytes32Set storage set, address addrvalue)	//inject NONSTANDARD NAMING
        internal
        returns (bool)
    {
        bytes32 value;
        assembly {
            value := addrvalue
        }
        return ADDBYTES32666(set, value);
    }

                                                                                                                 
    function ADDBYTES32666(Bytes32Set storage set, bytes32 value)	//inject NONSTANDARD NAMING
        internal
        returns (bool)
    {
        if (!CONTAINS173(set, value)){
            set.index[value] = set.values.push(value);
            return true;
        } else {
            return false;
        }
    }

                                                                                                                                    
    function REMOVEADDRESS121(Bytes32Set storage set, address addrvalue)	//inject NONSTANDARD NAMING
        internal
        returns (bool)
    {
        bytes32 value;
        assembly {
            value := addrvalue
        }
        return REMOVEBYTES32643(set, value);
    }

                                                                                                                           
    function REMOVEBYTES32643(Bytes32Set storage set, bytes32 value)	//inject NONSTANDARD NAMING
        internal
        returns (bool)
    {
        if (CONTAINS173(set, value)){
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

                                                                          
    function CONTAINS173(Bytes32Set storage set, bytes32 value)	//inject NONSTANDARD NAMING
        internal
        view
        returns (bool)
    {
        return set.index[value] != 0;
    }

                                                                          
    function CONTAINSADDRESS456(Bytes32Set storage set, address addrvalue)	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                          
    function ENUMERATE460(Bytes32Set storage set, uint256 start, uint256 count)	//inject NONSTANDARD NAMING
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

                                                                            
    function LENGTH648(Bytes32Set storage set)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256)
    {
        return set.values.length;
    }

                                                                                                                                                                                                                                                                                                                           
    function GET501(Bytes32Set storage set, uint256 index)	//inject NONSTANDARD NAMING
        internal
        view
        returns (bytes32)
    {
        return set.values[index];
    }

                                                                                                                                                                                                                                                                                                                           
    function GETADDRESS879(Bytes32Set storage set, uint256 index)	//inject NONSTANDARD NAMING
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

                                                                                     
                                                                              
    uint256 internal constant reentrancy_guard_free17 = 1;	//inject NONSTANDARD NAMING

                                            
    uint256 internal constant reentrancy_guard_locked747 = 2;	//inject NONSTANDARD NAMING

                                                                      
    uint256 internal reentrancyLock = reentrancy_guard_free17;

                                                                                                                                                                                                                                                                                                                                                                                                 
    modifier NONREENTRANT128() {	//inject NONSTANDARD NAMING
        require(reentrancyLock == reentrancy_guard_free17, "nonReentrant");
        reentrancyLock = reentrancy_guard_locked747;
        _;
        reentrancyLock = reentrancy_guard_free17;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER873() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA681() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED648(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER873();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED648(address(0), msgSender);
    }

                                                                     
    function OWNER852() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER341() {	//inject NONSTANDARD NAMING
        require(ISOWNER977(), "unauthorized");
        _;
    }

                                                                            
    function ISOWNER977() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER873() == _owner;
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP378(address newOwner) public ONLYOWNER341 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP58(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP58(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED648(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD382(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB183(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB183(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB183(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL173(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV820(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV820(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV820(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b != 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                  
    function DIVCEIL723(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIVCEIL723(a, b, "SafeMath: division by zero");
    }

                                                                                                  
    function DIVCEIL723(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b != 0, errorMessage);

        if (a == 0) {
            return 0;
        }
        uint256 c = ((a - 1) / b) + 1;

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD973(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD973(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD973(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }

    function MIN256749(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return _a < _b ? _a : _b;
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

    address public priceFeeds;                                                          // handles asset reference price lookups
    address public swapsImpl;                                                           // handles asset swaps using dex liquidity

    mapping (bytes4 => address) public logicTargets;                                    // implementations of protocol functions

    mapping (bytes32 => Loan) public loans;                                             // loanId => Loan
    mapping (bytes32 => LoanParams) public loanParams;                                  // loanParamsId => LoanParams

    mapping (address => mapping (bytes32 => Order)) public lenderOrders;                // lender => orderParamsId => Order
    mapping (address => mapping (bytes32 => Order)) public borrowerOrders;              // borrower => orderParamsId => Order

    mapping (bytes32 => mapping (address => bool)) public delegatedManagers;            // loanId => delegated => approved

    // Interest
    mapping (address => mapping (address => LenderInterest)) public lenderInterest;     // lender => loanToken => LenderInterest object
    mapping (bytes32 => LoanInterest) public loanInterest;                              // loanId => LoanInterest object

    // Internals
    EnumerableBytes32Set.Bytes32Set internal logicTargetsSet;                           // implementations set
    EnumerableBytes32Set.Bytes32Set internal activeLoansSet;                            // active loans set

    mapping (address => EnumerableBytes32Set.Bytes32Set) internal lenderLoanSets;       // lender loans set
    mapping (address => EnumerableBytes32Set.Bytes32Set) internal borrowerLoanSets;     // borrow loans set
    mapping (address => EnumerableBytes32Set.Bytes32Set) internal userLoanParamSets;    // user loan params set

    address public feesController;                                                      // address controlling fee withdrawals

    uint256 public lendingFeePercent = 10 ether; // 10% fee                             // fee taken from lender interest payments
    mapping (address => uint256) public lendingFeeTokensHeld;                           // total interest fees received and not withdrawn per asset
    mapping (address => uint256) public lendingFeeTokensPaid;                           // total interest fees withdraw per asset (lifetime fees = lendingFeeTokensHeld + lendingFeeTokensPaid)

    uint256 public tradingFeePercent = 0.15 ether; // 0.15% fee                         // fee paid for each trade
    mapping (address => uint256) public tradingFeeTokensHeld;                           // total trading fees received and not withdrawn per asset
    mapping (address => uint256) public tradingFeeTokensPaid;                           // total trading fees withdraw per asset (lifetime fees = tradingFeeTokensHeld + tradingFeeTokensPaid)

    uint256 public borrowingFeePercent = 0.09 ether; // 0.09% fee                       // origination fee paid for each loan
    mapping (address => uint256) public borrowingFeeTokensHeld;                         // total borrowing fees received and not withdrawn per asset
    mapping (address => uint256) public borrowingFeeTokensPaid;                         // total borrowing fees withdraw per asset (lifetime fees = borrowingFeeTokensHeld + borrowingFeeTokensPaid)

    uint256 public protocolTokenHeld;                                                   // current protocol token deposit balance
    uint256 public protocolTokenPaid;                                                   // lifetime total payout of protocol token

    uint256 public affiliateFeePercent = 30 ether; // 30% fee share                     // fee share for affiliate program

    mapping (address => uint256) public liquidationIncentivePercent;                    // percent discount on collateral for liquidators per collateral asset

    mapping (address => address) public loanPoolToUnderlying;                           // loanPool => underlying
    mapping (address => address) public underlyingToLoanPool;                           // underlying => loanPool
    EnumerableBytes32Set.Bytes32Set internal loanPoolsSet;                              // loan pools set

    mapping (address => bool) public supportedTokens;                                   // supported tokens for swaps

    uint256 public maxDisagreement = 5 ether;                                           // % disagreement between swap rate and reference rate

    uint256 public sourceBufferPercent = 5 ether;                                       // used to estimate kyber swap source amount

    uint256 public maxSwapSize = 1500 ether;                                            // maximum supported swap size in ETH


    function _SETTARGET520(	//inject NONSTANDARD NAMING
        bytes4 sig,
        address target)
        internal
    {
        logicTargets[sig] = target;

        if (target != address(0)) {
            logicTargetsSet.ADDBYTES32666(bytes32(sig));
        } else {
            logicTargetsSet.REMOVEBYTES32643(bytes32(sig));
        }
    }
}

contract LoanSettingsEvents {

    event LOANPARAMSSETUP772(	//inject NONSTANDARD NAMING
        bytes32 indexed id,
        address owner,
        address indexed loanToken,
        address indexed collateralToken,
        uint256 minInitialMargin,
        uint256 maintenanceMargin,
        uint256 maxLoanTerm
    );
    event LOANPARAMSIDSETUP962(	//inject NONSTANDARD NAMING
        bytes32 indexed id,
        address indexed owner
    );

    event LOANPARAMSDISABLED785(	//inject NONSTANDARD NAMING
        bytes32 indexed id,
        address owner,
        address indexed loanToken,
        address indexed collateralToken,
        uint256 minInitialMargin,
        uint256 maintenanceMargin,
        uint256 maxLoanTerm
    );
    event LOANPARAMSIDDISABLED789(	//inject NONSTANDARD NAMING
        bytes32 indexed id,
        address indexed owner
    );
}

contract LoanSettings is State, LoanSettingsEvents {

    function INITIALIZE111(	//inject NONSTANDARD NAMING
        address target)
        external
        ONLYOWNER341
    {
        _SETTARGET520(this.SETUPLOANPARAMS614.selector, target);
        _SETTARGET520(this.DISABLELOANPARAMS450.selector, target);
        _SETTARGET520(this.GETLOANPARAMS886.selector, target);
        _SETTARGET520(this.GETLOANPARAMSLIST836.selector, target);
        _SETTARGET520(this.GETTOTALPRINCIPAL838.selector, target);
    }

    function SETUPLOANPARAMS614(	//inject NONSTANDARD NAMING
        LoanParams[] calldata loanParamsList)
        external
        returns (bytes32[] memory loanParamsIdList)
    {
        loanParamsIdList = new bytes32[](loanParamsList.length);
        for (uint256 i = 0; i < loanParamsList.length; i++) {
            loanParamsIdList[i] = _SETUPLOANPARAMS992(loanParamsList[i]);
        }
    }

    // Deactivates LoanParams for future loans. Active loans using it are unaffected.
    function DISABLELOANPARAMS450(	//inject NONSTANDARD NAMING
        bytes32[] calldata loanParamsIdList)
        external
    {
        for (uint256 i = 0; i < loanParamsIdList.length; i++) {
            require(msg.sender == loanParams[loanParamsIdList[i]].owner, "unauthorized owner");
            loanParams[loanParamsIdList[i]].active = false;

            LoanParams memory loanParamsLocal = loanParams[loanParamsIdList[i]];
            emit LOANPARAMSDISABLED785(
                loanParamsLocal.id,
                loanParamsLocal.owner,
                loanParamsLocal.loanToken,
                loanParamsLocal.collateralToken,
                loanParamsLocal.minInitialMargin,
                loanParamsLocal.maintenanceMargin,
                loanParamsLocal.maxLoanTerm
            );
            emit LOANPARAMSIDDISABLED789(
                loanParamsLocal.id,
                loanParamsLocal.owner
            );
        }
    }

    function GETLOANPARAMS886(	//inject NONSTANDARD NAMING
        bytes32[] memory loanParamsIdList)
        public
        view
        returns (LoanParams[] memory loanParamsList)
    {
        loanParamsList = new LoanParams[](loanParamsIdList.length);
        uint256 itemCount;

        for (uint256 i = 0; i < loanParamsIdList.length; i++) {
            LoanParams memory loanParamsLocal = loanParams[loanParamsIdList[i]];
            if (loanParamsLocal.id == 0) {
                continue;
            }
            loanParamsList[itemCount] = loanParamsLocal;
            itemCount++;
        }

        if (itemCount < loanParamsList.length) {
            assembly {
                mstore(loanParamsList, itemCount)
            }
        }
    }

    function GETLOANPARAMSLIST836(	//inject NONSTANDARD NAMING
        address owner,
        uint256 start,
        uint256 count)
        external
        view
        returns (bytes32[] memory loanParamsList)
    {
        EnumerableBytes32Set.Bytes32Set storage set = userLoanParamSets[owner];
        uint256 end = start.ADD382(count).MIN256749(set.LENGTH648());
        if (start >= end) {
            return loanParamsList;
        }
        count = end-start;

        loanParamsList = new bytes32[](count);
        for (uint256 i = --end; i >= start; i--) {
            loanParamsList[--count] = set.GET501(i);

            if (i == 0) {
                break;
            }
        }
    }

    function GETTOTALPRINCIPAL838(	//inject NONSTANDARD NAMING
        address lender,
        address loanToken)
        external
        view
        returns (uint256)
    {
        return lenderInterest[lender][loanToken].principalTotal;
    }

    function _SETUPLOANPARAMS992(	//inject NONSTANDARD NAMING
        LoanParams memory loanParamsLocal)
        internal
        returns (bytes32)
    {
        bytes32 loanParamsId = keccak256(abi.encode(
            loanParamsLocal.loanToken,
            loanParamsLocal.collateralToken,
            loanParamsLocal.minInitialMargin,
            loanParamsLocal.maintenanceMargin,
            loanParamsLocal.maxLoanTerm,
            block.timestamp
        ));
        require(loanParams[loanParamsId].id == 0, "loanParams exists");

        require(loanParamsLocal.loanToken != address(0) &&
            loanParamsLocal.collateralToken != address(0) &&
            loanParamsLocal.minInitialMargin > loanParamsLocal.maintenanceMargin &&
            (loanParamsLocal.maxLoanTerm == 0 || loanParamsLocal.maxLoanTerm > 1 hours), // a defined maxLoanTerm has to be greater than one hour
            "invalid params"
        );

        loanParamsLocal.id = loanParamsId;
        loanParamsLocal.active = true;
        loanParamsLocal.owner = msg.sender;

        loanParams[loanParamsId] = loanParamsLocal;
        userLoanParamSets[msg.sender].ADDBYTES32666(loanParamsId);

        emit LOANPARAMSSETUP772(
            loanParamsId,
            loanParamsLocal.owner,
            loanParamsLocal.loanToken,
            loanParamsLocal.collateralToken,
            loanParamsLocal.minInitialMargin,
            loanParamsLocal.maintenanceMargin,
            loanParamsLocal.maxLoanTerm
        );
        emit LOANPARAMSIDSETUP962(
            loanParamsId,
            loanParamsLocal.owner
        );

        return loanParamsId;
    }
}