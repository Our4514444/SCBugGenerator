                                                                 

pragma solidity ^0.5.7;
pragma experimental ABIEncoderV2;

library SafeMath {

    function MUL71(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0)
            return 0;
        uint256 c = a * b;
        require(c / a == b);
        return c;
    }

    function DIV387(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0);
        uint256 c = a / b;
        return c;
    }

    function SUB323(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;
        return c;
    }

    function ADD265(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);
        return c;
    }

    function MOD752(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


contract ERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) internal _balances;
    mapping (address => mapping (address => uint256)) internal _allowed;

    event TRANSFER450(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL885(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    uint256 internal _totalSupply;

                                                             
    function TOTALSUPPLY747() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                         
    function BALANCEOF137(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                               
    function ALLOWANCE16(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                            
    function TRANSFER941(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER268(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE609(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[msg.sender][spender] = value;
        emit APPROVAL885(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function TRANSFERFROM165(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER268(from, to, value);
        _allowed[msg.sender][to] = _allowed[msg.sender][to].SUB323(value);
        return true;
    }

    function _TRANSFER268(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));
        _balances[from] = _balances[from].SUB323(value);
        _balances[to] = _balances[to].ADD265(value);
        emit TRANSFER450(from, to, value);
    }

}

interface ITokenizedCDP {
    function DEBT144() external returns(uint256);	//inject NONSTANDARD NAMING
    function MIGRATE173() external;	//inject NONSTANDARD NAMING
}

library Account {
    enum Status {Normal, Liquid, Vapor}
    struct Info {
        address owner; // The address that owns the account
        uint256 number; // A nonce that allows a single address to control many accounts
    }
    struct Storage {
        mapping(uint256 => Types.Par) balances; // Mapping from marketId to principal
        Status status;
    }
}


library Actions {
    enum ActionType {
        Deposit, // supply tokens
        Withdraw, // borrow tokens
        Transfer, // transfer balance between accounts
        Buy, // buy an amount of some token (publicly)
        Sell, // sell an amount of some token (publicly)
        Trade, // trade tokens against another account
        Liquidate, // liquidate an undercollateralized or expiring account
        Vaporize, // use excess tokens to zero-out a completely negative account
        Call // send arbitrary data to an address
    }

    enum AccountLayout {OnePrimary, TwoPrimary, PrimaryAndSecondary}

    enum MarketLayout {ZeroMarkets, OneMarket, TwoMarkets}

    struct ActionArgs {
        ActionType actionType;
        uint256 accountId;
        Types.AssetAmount amount;
        uint256 primaryMarketId;
        uint256 secondaryMarketId;
        address otherAddress;
        uint256 otherAccountId;
        bytes data;
    }

    struct DepositArgs {
        Types.AssetAmount amount;
        Account.Info account;
        uint256 market;
        address from;
    }

    struct WithdrawArgs {
        Types.AssetAmount amount;
        Account.Info account;
        uint256 market;
        address to;
    }

    struct TransferArgs {
        Types.AssetAmount amount;
        Account.Info accountOne;
        Account.Info accountTwo;
        uint256 market;
    }

    struct BuyArgs {
        Types.AssetAmount amount;
        Account.Info account;
        uint256 makerMarket;
        uint256 takerMarket;
        address exchangeWrapper;
        bytes orderData;
    }

    struct SellArgs {
        Types.AssetAmount amount;
        Account.Info account;
        uint256 takerMarket;
        uint256 makerMarket;
        address exchangeWrapper;
        bytes orderData;
    }

    struct TradeArgs {
        Types.AssetAmount amount;
        Account.Info takerAccount;
        Account.Info makerAccount;
        uint256 inputMarket;
        uint256 outputMarket;
        address autoTrader;
        bytes tradeData;
    }

    struct LiquidateArgs {
        Types.AssetAmount amount;
        Account.Info solidAccount;
        Account.Info liquidAccount;
        uint256 owedMarket;
        uint256 heldMarket;
    }

    struct VaporizeArgs {
        Types.AssetAmount amount;
        Account.Info solidAccount;
        Account.Info vaporAccount;
        uint256 owedMarket;
        uint256 heldMarket;
    }

    struct CallArgs {
        Account.Info account;
        address callee;
        bytes data;
    }
}


library Decimal {
    struct D256 {
        uint256 value;
    }
}


library Interest {
    struct Rate {
        uint256 value;
    }

    struct Index {
        uint96 borrow;
        uint96 supply;
        uint32 lastUpdate;
    }
}


library Monetary {
    struct Price {
        uint256 value;
    }
    struct Value {
        uint256 value;
    }
}


library Storage {
    // All information necessary for tracking a market
    struct Market {
        // Contract address of the associated ERC20 token
        address token;
        // Total aggregated supply and borrow amount of the entire market
        Types.TotalPar totalPar;
        // Interest index of the market
        Interest.Index index;
        // Contract address of the price oracle for this market
        address priceOracle;
        // Contract address of the interest setter for this market
        address interestSetter;
        // Multiplier on the marginRatio for this market
        Decimal.D256 marginPremium;
        // Multiplier on the liquidationSpread for this market
        Decimal.D256 spreadPremium;
        // Whether additional borrows are allowed for this market
        bool isClosing;
    }

    // The global risk parameters that govern the health and security of the system
    struct RiskParams {
        // Required ratio of over-collateralization
        Decimal.D256 marginRatio;
        // Percentage penalty incurred by liquidated accounts
        Decimal.D256 liquidationSpread;
        // Percentage of the borrower's interest fee that gets passed to the suppliers
        Decimal.D256 earningsRate;
        // The minimum absolute borrow value of an account
        // There must be sufficient incentivize to liquidate undercollateralized accounts
        Monetary.Value minBorrowedValue;
    }

    // The maximum RiskParam values that can be set
    struct RiskLimits {
        uint64 marginRatioMax;
        uint64 liquidationSpreadMax;
        uint64 earningsRateMax;
        uint64 marginPremiumMax;
        uint64 spreadPremiumMax;
        uint128 minBorrowedValueMax;
    }

    // The entire storage state of Solo
    struct State {
        // number of markets
        uint256 numMarkets;
        // marketId => Market
        mapping(uint256 => Market) markets;
        // owner => account number => Account
        mapping(address => mapping(uint256 => Account.Storage)) accounts;
        // Addresses that can control other users accounts
        mapping(address => mapping(address => bool)) operators;
        // Addresses that can control all users accounts
        mapping(address => bool) globalOperators;
        // mutable risk parameters of the system
        RiskParams riskParams;
        // immutable risk limits of the system
        RiskLimits riskLimits;
    }
}


library Types {
    enum AssetDenomination {
        Wei, // the amount is denominated in wei
        Par // the amount is denominated in par
    }

    enum AssetReference {
        Delta, // the amount is given as a delta from the current value
        Target // the amount is given as an exact number to end up at
    }

    struct AssetAmount {
        bool sign; // true if positive
        AssetDenomination denomination;
        AssetReference ref;
        uint256 value;
    }

    struct TotalPar {
        uint128 borrow;
        uint128 supply;
    }

    struct Par {
        bool sign; // true if positive
        uint128 value;
    }

    struct Wei {
        bool sign; // true if positive
        uint256 value;
    }
}


contract ISoloMargin {
    struct OperatorArg {
        address operator;
        bool trusted;
    }

    function OWNERSETSPREADPREMIUM73(	//inject NONSTANDARD NAMING
        uint256 marketId,
        Decimal.D256 memory spreadPremium
    ) public;

    function GETISGLOBALOPERATOR965(address operator) public view returns (bool);	//inject NONSTANDARD NAMING

    function GETMARKETTOKENADDRESS76(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (address);

    function OWNERSETINTERESTSETTER353(uint256 marketId, address interestSetter)	//inject NONSTANDARD NAMING
        public;

    function GETACCOUNTVALUES751(Account.Info memory account)	//inject NONSTANDARD NAMING
        public
        view
        returns (Monetary.Value memory, Monetary.Value memory);

    function GETMARKETPRICEORACLE946(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (address);

    function GETMARKETINTERESTSETTER714(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (address);

    function GETMARKETSPREADPREMIUM660(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (Decimal.D256 memory);

    function GETNUMMARKETS530() public view returns (uint256);	//inject NONSTANDARD NAMING

    function OWNERWITHDRAWUNSUPPORTEDTOKENS857(address token, address recipient)	//inject NONSTANDARD NAMING
        public
        returns (uint256);

    function OWNERSETMINBORROWEDVALUE113(Monetary.Value memory minBorrowedValue)	//inject NONSTANDARD NAMING
        public;

    function OWNERSETLIQUIDATIONSPREAD582(Decimal.D256 memory spread) public;	//inject NONSTANDARD NAMING

    function OWNERSETEARNINGSRATE891(Decimal.D256 memory earningsRate) public;	//inject NONSTANDARD NAMING

    function GETISLOCALOPERATOR169(address owner, address operator)	//inject NONSTANDARD NAMING
        public
        view
        returns (bool);

    function GETACCOUNTPAR847(Account.Info memory account, uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (Types.Par memory);

    function OWNERSETMARGINPREMIUM392(	//inject NONSTANDARD NAMING
        uint256 marketId,
        Decimal.D256 memory marginPremium
    ) public;

    function GETMARGINRATIO427() public view returns (Decimal.D256 memory);	//inject NONSTANDARD NAMING

    function GETMARKETCURRENTINDEX188(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (Interest.Index memory);

    function GETMARKETISCLOSING523(uint256 marketId) public view returns (bool);	//inject NONSTANDARD NAMING

    function GETRISKPARAMS98() public view returns (Storage.RiskParams memory);	//inject NONSTANDARD NAMING

    function GETACCOUNTBALANCES636(Account.Info memory account)	//inject NONSTANDARD NAMING
        public
        view
        returns (address[] memory, Types.Par[] memory, Types.Wei[] memory);

    function RENOUNCEOWNERSHIP778() public;	//inject NONSTANDARD NAMING

    function GETMINBORROWEDVALUE797() public view returns (Monetary.Value memory);	//inject NONSTANDARD NAMING

    function SETOPERATORS514(OperatorArg[] memory args) public;	//inject NONSTANDARD NAMING

    function GETMARKETPRICE482(uint256 marketId) public view returns (address);	//inject NONSTANDARD NAMING

    function OWNER141() public view returns (address);	//inject NONSTANDARD NAMING

    function ISOWNER966() public view returns (bool);	//inject NONSTANDARD NAMING

    function OWNERWITHDRAWEXCESSTOKENS674(uint256 marketId, address recipient)	//inject NONSTANDARD NAMING
        public
        returns (uint256);

    function OWNERADDMARKET928(	//inject NONSTANDARD NAMING
        address token,
        address priceOracle,
        address interestSetter,
        Decimal.D256 memory marginPremium,
        Decimal.D256 memory spreadPremium
    ) public;

    function OPERATE120(	//inject NONSTANDARD NAMING
        Account.Info[] memory accounts,
        Actions.ActionArgs[] memory actions
    ) public;

    function GETMARKETWITHINFO286(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (
            Storage.Market memory,
            Interest.Index memory,
            Monetary.Price memory,
            Interest.Rate memory
        );

    function OWNERSETMARGINRATIO275(Decimal.D256 memory ratio) public;	//inject NONSTANDARD NAMING

    function GETLIQUIDATIONSPREAD936() public view returns (Decimal.D256 memory);	//inject NONSTANDARD NAMING

    function GETACCOUNTWEI574(Account.Info memory account, uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (Types.Wei memory);

    function GETMARKETTOTALPAR330(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (Types.TotalPar memory);

    function GETLIQUIDATIONSPREADFORPAIR445(	//inject NONSTANDARD NAMING
        uint256 heldMarketId,
        uint256 owedMarketId
    ) public view returns (Decimal.D256 memory);

    function GETNUMEXCESSTOKENS897(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (Types.Wei memory);

    function GETMARKETCACHEDINDEX586(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (Interest.Index memory);

    function GETACCOUNTSTATUS813(Account.Info memory account)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint8);

    function GETEARNINGSRATE4() public view returns (Decimal.D256 memory);	//inject NONSTANDARD NAMING

    function OWNERSETPRICEORACLE716(uint256 marketId, address priceOracle) public;	//inject NONSTANDARD NAMING

    function GETRISKLIMITS373() public view returns (Storage.RiskLimits memory);	//inject NONSTANDARD NAMING

    function GETMARKET804(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (Storage.Market memory);

    function OWNERSETISCLOSING725(uint256 marketId, bool isClosing) public;	//inject NONSTANDARD NAMING

    function OWNERSETGLOBALOPERATOR138(address operator, bool approved) public;	//inject NONSTANDARD NAMING

    function TRANSFEROWNERSHIP106(address newOwner) public;	//inject NONSTANDARD NAMING

    function GETADJUSTEDACCOUNTVALUES973(Account.Info memory account)	//inject NONSTANDARD NAMING
        public
        view
        returns (Monetary.Value memory, Monetary.Value memory);

    function GETMARKETMARGINPREMIUM646(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (Decimal.D256 memory);

    function GETMARKETINTERESTRATE973(uint256 marketId)	//inject NONSTANDARD NAMING
        public
        view
        returns (Interest.Rate memory);
}

                                                                                                                       
contract ICallee {

    // ============ Public Functions ============

                                                                                                                                                                                                                                                                            
    function CALLFUNCTION758(	//inject NONSTANDARD NAMING
        address sender,
        Account.Info memory accountInfo,
        bytes memory data
    )
        public;
}

contract DydxFlashloanBase {
    using SafeMath for uint256;

    // -- Internal Helper functions -- //

    function _GETMARKETIDFROMTOKENADDRESS783(address _solo, address token)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256)
    {
        ISoloMargin solo = ISoloMargin(_solo);

        uint256 numMarkets = solo.GETNUMMARKETS530();

        address curToken;
        for (uint256 i = 0; i < numMarkets; i++) {
            curToken = solo.GETMARKETTOKENADDRESS76(i);

            if (curToken == token) {
                return i;
            }
        }

        revert("No marketId found for provided token");
    }

    function _GETREPAYMENTAMOUNTINTERNAL774(uint256 amount)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256)
    {
        // Needs to be overcollateralize
        // Needs to provide +2 wei to be safe
        return amount.ADD265(2);
    }

    function _GETACCOUNTINFO266() internal view returns (Account.Info memory) {	//inject NONSTANDARD NAMING
        return Account.Info({owner: address(this), number: 1});
    }

    function _GETWITHDRAWACTION124(uint marketId, uint256 amount)	//inject NONSTANDARD NAMING
        internal
        view
        returns (Actions.ActionArgs memory)
    {
        return
            Actions.ActionArgs({
                actionType: Actions.ActionType.Withdraw,
                accountId: 0,
                amount: Types.AssetAmount({
                    sign: false,
                    denomination: Types.AssetDenomination.Wei,
                    ref: Types.AssetReference.Delta,
                    value: amount
                }),
                primaryMarketId: marketId,
                secondaryMarketId: 0,
                otherAddress: address(this),
                otherAccountId: 0,
                data: ""
            });
    }

    function _GETCALLACTION320(bytes memory data)	//inject NONSTANDARD NAMING
        internal
        view
        returns (Actions.ActionArgs memory)
    {
        return
            Actions.ActionArgs({
                actionType: Actions.ActionType.Call,
                accountId: 0,
                amount: Types.AssetAmount({
                    sign: false,
                    denomination: Types.AssetDenomination.Wei,
                    ref: Types.AssetReference.Delta,
                    value: 0
                }),
                primaryMarketId: 0,
                secondaryMarketId: 0,
                otherAddress: address(this),
                otherAccountId: 0,
                data: data
            });
    }

    function _GETDEPOSITACTION398(uint marketId, uint256 amount)	//inject NONSTANDARD NAMING
        internal
        view
        returns (Actions.ActionArgs memory)
    {
        return
            Actions.ActionArgs({
                actionType: Actions.ActionType.Deposit,
                accountId: 0,
                amount: Types.AssetAmount({
                    sign: true,
                    denomination: Types.AssetDenomination.Wei,
                    ref: Types.AssetReference.Delta,
                    value: amount
                }),
                primaryMarketId: marketId,
                secondaryMarketId: 0,
                otherAddress: address(this),
                otherAccountId: 0,
                data: ""
            });
    }
}


contract FlashMigrator is ICallee, DydxFlashloanBase {
    struct LoanInfo {
        address token;
        uint256 repayAmount;
    }

    ITokenizedCDP tCDP;
    ERC20 DAI = ERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);

    constructor(ITokenizedCDP _tCDP) public {
        tCDP = _tCDP;
        DAI.APPROVE609(address(_tCDP), uint256(-1));
    }

    function CALLFUNCTION758(	//inject NONSTANDARD NAMING
        address sender,
        Account.Info memory account,
        bytes memory data
    ) public {
        LoanInfo memory loan = abi.decode(data, (LoanInfo));
        uint256 balOfLoanedToken = ERC20(loan.token).BALANCEOF137(address(this));
        uint256 debt = tCDP.DEBT144();

        require(balOfLoanedToken >= debt, "Loaned balance not enough for debt");

        tCDP.MIGRATE173();
    }

    // _solo 0x1E0447b19BB6EcFdAe1e4AE1694b0C3659614e4e
    function FLASHMIGRATE550(address _solo)	//inject NONSTANDARD NAMING
        external
    {
        uint256 amount = tCDP.DEBT144();
        ISoloMargin solo = ISoloMargin(_solo);

        // Get marketId from token address
        uint256 marketId = _GETMARKETIDFROMTOKENADDRESS783(_solo, address(DAI));

        // Calculate repay amount (amount + (2 wei))
        // Approve transfer from
        uint256 repayAmount = _GETREPAYMENTAMOUNTINTERNAL774(amount);
        DAI.APPROVE609(_solo, repayAmount);

        // 1. Withdraw $
        // 2. Call callFunction(...)
        // 3. Deposit back $
        Actions.ActionArgs[] memory operations = new Actions.ActionArgs[](3);

        operations[0] = _GETWITHDRAWACTION124(marketId, amount);
        operations[1] = _GETCALLACTION320(
            // Encode LoanInfo for callFunction
            abi.encode(LoanInfo({token: address(DAI), repayAmount: repayAmount}))
        );
        operations[2] = _GETDEPOSITACTION398(marketId, repayAmount);

        Account.Info[] memory accountInfos = new Account.Info[](1);
        accountInfos[0] = _GETACCOUNTINFO266();

        solo.OPERATE120(accountInfos, operations);
    }
}