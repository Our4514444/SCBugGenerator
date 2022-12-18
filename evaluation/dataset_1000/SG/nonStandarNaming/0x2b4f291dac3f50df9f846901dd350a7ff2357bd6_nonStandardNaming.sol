pragma solidity ^0.5.7;


// Token Public Sale

library SafeMath256 {

    function ADD690(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        c = a + b;
        assert(c >= a);
        return c;
    }


    function SUB444(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }


    function MUL125(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }


    function DIV352(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return a / b;
    }


    function MOD426(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


library SafeMath16 {

    function ADD690(uint16 a, uint16 b) internal pure returns (uint16 c) {	//inject NONSTANDARD NAMING
        c = a + b;
        assert(c >= a);
        return c;
    }


    function SUB444(uint16 a, uint16 b) internal pure returns (uint16) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function MUL125(uint16 a, uint16 b) internal pure returns (uint16 c) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV352(uint16 a, uint16 b) internal pure returns (uint16) {	//inject NONSTANDARD NAMING
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return a / b;
    }

    function MOD426(uint16 a, uint16 b) internal pure returns (uint16) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


contract Ownable {
    address private _owner;
    address payable internal _receiver;

    event OWNERSHIPTRANSFERRED472(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    event RECEIVERCHANGED711(address indexed previousReceiver, address indexed newReceiver);	//inject NONSTANDARD NAMING

    constructor () internal {
        _owner = msg.sender;
        _receiver = msg.sender;
    }


    function OWNER213() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }


    modifier ONLYOWNER66() {	//inject NONSTANDARD NAMING
        require(msg.sender == _owner);
        _;
    }


    function TRANSFEROWNERSHIP948(address newOwner) external ONLYOWNER66 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        address __previousOwner = _owner;
        _owner = newOwner;
        emit OWNERSHIPTRANSFERRED472(__previousOwner, newOwner);
    }

    function CHANGERECEIVER37(address payable newReceiver) external ONLYOWNER66 {	//inject NONSTANDARD NAMING
        require(newReceiver != address(0));
        address __previousReceiver = _receiver;
        _receiver = newReceiver;
        emit RECEIVERCHANGED711(__previousReceiver, newReceiver);
    }

    function RESCUETOKENS426(address tokenAddress, address receiver, uint256 amount) external ONLYOWNER66 {	//inject NONSTANDARD NAMING
        IERC20 _token = IERC20(tokenAddress);
        require(receiver != address(0));
        uint256 balance = _token.BALANCEOF172(address(this));
        require(balance >= amount);

        assert(_token.TRANSFER36(receiver, amount));
    }


    function WITHDRAWETHER624(address payable to, uint256 amount) external ONLYOWNER66 {	//inject NONSTANDARD NAMING
        require(to != address(0));
        uint256 balance = address(this).balance;
        require(balance >= amount);

        to.transfer(amount);
    }
}



contract Pausable is Ownable {
    bool private _paused;

    event PAUSED634(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED65(address account);	//inject NONSTANDARD NAMING

    constructor () internal {
        _paused = false;
    }

    function PAUSED132() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

    modifier WHENNOTPAUSED937() {	//inject NONSTANDARD NAMING
        require(!_paused, "Paused.");
        _;
    }

    function SETPAUSED463(bool state) external ONLYOWNER66 {	//inject NONSTANDARD NAMING
        if (_paused && !state) {
            _paused = false;
            emit UNPAUSED65(msg.sender);
        } else if (!_paused && state) {
            _paused = true;
            emit PAUSED634(msg.sender);
        }
    }
}


interface IERC20 {
    function BALANCEOF172(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER36(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
}


interface IToken {
    function BALANCEOF172(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER36(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function INWHITELIST556(address account) external view returns (bool);	//inject NONSTANDARD NAMING
    function REFERRER671(address account) external view returns (address);	//inject NONSTANDARD NAMING
    function REFCOUNT613(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
}


contract TokenPublicSale is Ownable, Pausable{
    using SafeMath16 for uint16;
    using SafeMath256 for uint256;

    IToken public TOKEN = IToken(0xfaCe8492ce3EE56855827b5eC3f9Affd0a4c5E15);

    // Start timestamp
    uint32 _startTimestamp;

    // Audit ether price
    uint256 private _etherPrice;    // 1 Ether = xx.xxxxxx USD, with 6 decimals

    // Referral rewards, 35% for 15 levels
    uint16 private WHITELIST_REF_REWARDS_PCT_SUM = 35;
    uint16[15] private WHITELIST_REF_REWARDS_PCT = [
    6,  // 6% for Level.1
    6,  // 6% for Level.2
    5,  // 5% for Level.3
    4,  // 4% for Level.4
    3,  // 3% for Level.5
    2,  // 2% for Level.6
    1,  // 1% for Level.7
    1,  // 1% for Level.8
    1,  // 1% for Level.9
    1,  // 1% for Level.10
    1,  // 1% for Level.11
    1,  // 1% for Level.12
    1,  // 1% for Level.13
    1,  // 1% for Level.14
    1   // 1% for Level.15
    ];

    // Wei & Gas
    uint72 private WEI_MIN   = 0.1 ether;      // 0.1 Ether Minimum
    uint72 private WEI_MAX   = 10 ether;       // 10 Ether Maximum
    uint72 private WEI_BONUS = 10 ether;       // >10 Ether for Bonus
    uint24 private GAS_MIN   = 3000000;        // 3.0 Mwei gas Mininum
    uint24 private GAS_EX    = 1500000;        // 1.5 Mwei gas for ex

    // Price
    uint256 private TOKEN_USD_PRICE_START = 1000;           // $      0.00100 USD
    uint256 private TOKEN_USD_PRICE_STEP  = 10;             // $    + 0.00001 USD
    uint256 private STAGE_USD_CAP_START   = 100000000;      // $    100 USD
    uint256 private STAGE_USD_CAP_STEP    = 1000000;        // $     +1 USD
    uint256 private STAGE_USD_CAP_MAX     = 15100000000;    // $    15,100 USD

    uint256 private _tokenUsdPrice        = TOKEN_USD_PRICE_START;

    // Progress
    uint16 private STAGE_MAX = 60000;   // 60,000 stages total
    uint16 private SEASON_MAX = 100;    // 100 seasons total
    uint16 private SEASON_STAGES = 600; // each 600 stages is a season

    uint16 private _stage;
    uint16 private _season;

    // Sum
    uint256 private _txs;
    uint256 private _tokenTxs;
    uint256 private _tokenBonusTxs;
    uint256 private _tokenWhitelistTxs;
    uint256 private _tokenIssued;
    uint256 private _tokenBonus;
    uint256 private _tokenWhitelist;
    uint256 private _weiSold;
    uint256 private _weiRefRewarded;
    uint256 private _weiTopSales;
    uint256 private _weiTeam;
    uint256 private _weiPending;
    uint256 private _weiPendingTransfered;

    // Top-Sales
    uint256 private TOP_SALES_RATIO_START = 15000000;         // 15%, with 8 decimals
    uint256 private TOP_SALES_RATIO_DISTANCE = 50000000;      // 50%, with 8 decimals

    uint256 private _topSalesRatio = TOP_SALES_RATIO_START;   // 15% + 50% x(_stage/_stageMax)

    // During tx
    bool private _inWhitelist_;
    uint256 private _pending_ = WHITELIST_REF_REWARDS_PCT_SUM;
    uint16[] private _rewards_;
    address[] private _referrers_;

    // Audit ether price auditor
    mapping (address => bool) private _etherPriceAuditors;

    // Stage
    mapping (uint16 => uint256) private _stageUsdSold;
    mapping (uint16 => uint256) private _stageTokenIssued;

    // Season
    mapping (uint16 => uint256) private _seasonWeiSold;
    mapping (uint16 => uint256) private _seasonWeiTopSales;
    mapping (uint16 => uint256) private _seasonWeiTopSalesTransfered;

    // Account
    mapping (address => uint256) private _accountTokenIssued;
    mapping (address => uint256) private _accountTokenBonus;
    mapping (address => uint256) private _accountTokenWhitelisted;
    mapping (address => uint256) private _accountWeiPurchased;
    mapping (address => uint256) private _accountWeiRefRewarded;

    // Ref
    mapping (uint16 => address[]) private _seasonRefAccounts;
    mapping (uint16 => mapping (address => bool)) private _seasonHasRefAccount;
    mapping (uint16 => mapping (address => uint256)) private _usdSeasonAccountPurchased;
    mapping (uint16 => mapping (address => uint256)) private _usdSeasonAccountRef;

    // Events
    event AUDITETHERPRICECHANGED734(uint256 value, address indexed account);	//inject NONSTANDARD NAMING
    event AUDITETHERPRICEAUDITORCHANGED577(address indexed account, bool state);	//inject NONSTANDARD NAMING

    event TOKENBONUSTRANSFERED958(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event TOKENWHITELISTTRANSFERED578(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event TOKENISSUEDTRANSFERED899(uint16 stageIndex, address indexed to, uint256 tokenAmount, uint256 auditEtherPrice, uint256 weiUsed);	//inject NONSTANDARD NAMING

    event STAGECLOSED164(uint256 _stageNumber, address indexed account);	//inject NONSTANDARD NAMING
    event SEASONCLOSED519(uint16 _seasonNumber, address indexed account);	//inject NONSTANDARD NAMING

    event SEASONTOPSALESWEITRANSFERED437(uint16 seasonNumber, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event TEAMWEITRANSFERED912(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event PENDINGWEITRANSFERED800(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING


    function STARTTIMESTAMP868() public view returns (uint32) {	//inject NONSTANDARD NAMING
        return _startTimestamp;
    }

    function SETSTARTTIMESTAMP813(uint32 timestamp) external ONLYOWNER66 {	//inject NONSTANDARD NAMING
        _startTimestamp = timestamp;
    }

    modifier ONLYETHERPRICEAUDITOR517() {	//inject NONSTANDARD NAMING
        require(_etherPriceAuditors[msg.sender]);
        _;
    }

    function SETETHERPRICE698(uint256 value) external ONLYETHERPRICEAUDITOR517 {	//inject NONSTANDARD NAMING
        _etherPrice = value;
        emit AUDITETHERPRICECHANGED734(value, msg.sender);
    }

    function ETHERPRICEAUDITOR421(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _etherPriceAuditors[account];
    }

    function SETETHERPRICEAUDITOR844(address account, bool state) external ONLYOWNER66 {	//inject NONSTANDARD NAMING
        _etherPriceAuditors[account] = state;
        emit AUDITETHERPRICEAUDITORCHANGED577(account, state);
    }

    function STAGETOKENUSDPRICE610(uint16 stageIndex) private view returns (uint256) {	//inject NONSTANDARD NAMING
        return TOKEN_USD_PRICE_START.ADD690(TOKEN_USD_PRICE_STEP.MUL125(stageIndex));
    }

    function WEI2USD779(uint256 amount) private view returns (uint256) {	//inject NONSTANDARD NAMING
        return amount.MUL125(_etherPrice).DIV352(1 ether);
    }

    function USD2WEI304(uint256 amount) private view returns (uint256) {	//inject NONSTANDARD NAMING
        return amount.MUL125(1 ether).DIV352(_etherPrice);
    }

    function USD2TOKEN379(uint256 usdAmount) private view returns (uint256) {	//inject NONSTANDARD NAMING
        return usdAmount.MUL125(1000000).DIV352(_tokenUsdPrice);
    }

    function USD2TOKENBYSTAGE410(uint256 usdAmount, uint16 stageIndex) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return usdAmount.MUL125(1000000).DIV352(STAGETOKENUSDPRICE610(stageIndex));
    }

    function CALCSEASON706(uint16 stageIndex) private view returns (uint16) {	//inject NONSTANDARD NAMING
        if (stageIndex > 0) {
            uint16 __seasonNumber = stageIndex.DIV352(SEASON_STAGES);

            if (stageIndex.MOD426(SEASON_STAGES) > 0) {
                return __seasonNumber.ADD690(1);
            }

            return __seasonNumber;
        }

        return 1;
    }


    function TRANSFERTOPSALES89(uint16 seasonNumber, address payable to) external ONLYOWNER66 {	//inject NONSTANDARD NAMING
        uint256 __weiRemain = SEASONTOPSALESREMAIN230(seasonNumber);
        require(to != address(0));

        _seasonWeiTopSalesTransfered[seasonNumber] = _seasonWeiTopSalesTransfered[seasonNumber].ADD690(__weiRemain);
        emit SEASONTOPSALESWEITRANSFERED437(seasonNumber, to, __weiRemain);
        to.transfer(__weiRemain);
    }

    function PENDINGREMAIN313() private view returns (uint256) {	//inject NONSTANDARD NAMING
        return _weiPending.SUB444(_weiPendingTransfered);
    }


    function TRANSFERPENDING104(address payable to) external ONLYOWNER66 {	//inject NONSTANDARD NAMING
        uint256 __weiRemain = PENDINGREMAIN313();
        require(to != address(0));

        _weiPendingTransfered = _weiPendingTransfered.ADD690(__weiRemain);
        emit PENDINGWEITRANSFERED800(to, __weiRemain);
        to.transfer(__weiRemain);
    }

    function TRANSFERTEAM313(address payable to) external ONLYOWNER66 {	//inject NONSTANDARD NAMING
        uint256 __weiRemain = _weiSold.SUB444(_weiRefRewarded).SUB444(_weiTopSales).SUB444(_weiPending).SUB444(_weiTeam);
        require(to != address(0));

        _weiTeam = _weiTeam.ADD690(__weiRemain);
        emit TEAMWEITRANSFERED912(to, __weiRemain);
        to.transfer(__weiRemain);
    }


    function STATUS672() public view returns (uint256 auditEtherPrice,	//inject NONSTANDARD NAMING
        uint16 stage,
        uint16 season,
        uint256 tokenUsdPrice,
        uint256 currentTopSalesRatio,
        uint256 txs,
        uint256 tokenTxs,
        uint256 tokenBonusTxs,
        uint256 tokenWhitelistTxs,
        uint256 tokenIssued,
        uint256 tokenBonus,
        uint256 tokenWhitelist) {
        auditEtherPrice = _etherPrice;

        if (_stage > STAGE_MAX) {
            stage = STAGE_MAX;
            season = SEASON_MAX;
        } else {
            stage = _stage;
            season = _season;
        }

        tokenUsdPrice = _tokenUsdPrice;
        currentTopSalesRatio = _topSalesRatio;

        txs = _txs;
        tokenTxs = _tokenTxs;
        tokenBonusTxs = _tokenBonusTxs;
        tokenWhitelistTxs = _tokenWhitelistTxs;
        tokenIssued = _tokenIssued;
        tokenBonus = _tokenBonus;
        tokenWhitelist = _tokenWhitelist;
    }

    function SUM537() public view returns(uint256 weiSold,	//inject NONSTANDARD NAMING
        uint256 weiReferralRewarded,
        uint256 weiTopSales,
        uint256 weiTeam,
        uint256 weiPending,
        uint256 weiPendingTransfered,
        uint256 weiPendingRemain) {
        weiSold = _weiSold;
        weiReferralRewarded = _weiRefRewarded;
        weiTopSales = _weiTopSales;
        weiTeam = _weiTeam;
        weiPending = _weiPending;
        weiPendingTransfered = _weiPendingTransfered;
        weiPendingRemain = PENDINGREMAIN313();
    }

    modifier ENOUGHGAS244() {	//inject NONSTANDARD NAMING
        require(gasleft() > GAS_MIN);
        _;
    }

    modifier ONLYONSALE317() {	//inject NONSTANDARD NAMING
        require(_startTimestamp > 0 && now > _startTimestamp, "TM Token Public-Sale has not started yet.");
        require(_etherPrice > 0,        "Audit ETH price must be greater than zero.");
        require(!PAUSED132(),              "TM Token Public-Sale is paused.");
        require(_stage <= STAGE_MAX,    "TM Token Public-Sale Closed.");
        _;
    }


    function TOPSALESRATIO852(uint16 stageIndex) private view returns (uint256) {	//inject NONSTANDARD NAMING
        return TOP_SALES_RATIO_START.ADD690(TOP_SALES_RATIO_DISTANCE.MUL125(stageIndex).DIV352(STAGE_MAX));
    }

    function USD2WEITOPSALES895(uint256 usdAmount) private view returns (uint256) {	//inject NONSTANDARD NAMING
        return USD2WEI304(usdAmount.MUL125(_topSalesRatio).DIV352(100000000));
    }


    function STAGEUSDCAP914(uint16 stageIndex) private view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 __usdCap = STAGE_USD_CAP_START.ADD690(STAGE_USD_CAP_STEP.MUL125(stageIndex));

        if (__usdCap > STAGE_USD_CAP_MAX) {
            return STAGE_USD_CAP_MAX;
        }

        return __usdCap;
    }


    function STAGETOKENCAP281(uint16 stageIndex) private view returns (uint256) {	//inject NONSTANDARD NAMING
        return USD2TOKENBYSTAGE410(STAGEUSDCAP914(stageIndex), stageIndex);
    }


    function STAGESTATUS697(uint16 stageIndex) public view returns (uint256 tokenUsdPrice,	//inject NONSTANDARD NAMING
        uint256 tokenCap,
        uint256 tokenOnSale,
        uint256 tokenSold,
        uint256 usdCap,
        uint256 usdOnSale,
        uint256 usdSold,
        uint256 weiTopSalesRatio) {
        if (stageIndex > STAGE_MAX) {
            return (0, 0, 0, 0, 0, 0, 0, 0);
        }

        tokenUsdPrice = STAGETOKENUSDPRICE610(stageIndex);

        tokenSold = _stageTokenIssued[stageIndex];
        tokenCap = STAGETOKENCAP281(stageIndex);
        tokenOnSale = tokenCap.SUB444(tokenSold);

        usdSold = _stageUsdSold[stageIndex];
        usdCap = STAGEUSDCAP914(stageIndex);
        usdOnSale = usdCap.SUB444(usdSold);

        weiTopSalesRatio = TOPSALESRATIO852(stageIndex);
    }

    function SEASONTOPSALESREMAIN230(uint16 seasonNumber) private view returns (uint256) {	//inject NONSTANDARD NAMING
        return _seasonWeiTopSales[seasonNumber].SUB444(_seasonWeiTopSalesTransfered[seasonNumber]);
    }

    function SEASONTOPSALESREWARDS59(uint16 seasonNumber) public view returns (uint256 weiSold,	//inject NONSTANDARD NAMING
        uint256 weiTopSales,
        uint256 weiTopSalesTransfered,
        uint256 weiTopSalesRemain) {
        weiSold = _seasonWeiSold[seasonNumber];
        weiTopSales = _seasonWeiTopSales[seasonNumber];
        weiTopSalesTransfered = _seasonWeiTopSalesTransfered[seasonNumber];
        weiTopSalesRemain = SEASONTOPSALESREMAIN230(seasonNumber);
    }

    function ACCOUNTQUERY103(address account) public view returns (uint256 tokenIssued,	//inject NONSTANDARD NAMING
        uint256 tokenBonus,
        uint256 tokenWhitelisted,
        uint256 weiPurchased,
        uint256 weiReferralRewarded) {
        tokenIssued = _accountTokenIssued[account];
        tokenBonus = _accountTokenBonus[account];
        tokenWhitelisted = _accountTokenWhitelisted[account];
        weiPurchased = _accountWeiPurchased[account];
        weiReferralRewarded = _accountWeiRefRewarded[account];
    }

    function SEASONREFACCOUNTS513(uint16 seasonNumber) public view returns (address[] memory accounts) {	//inject NONSTANDARD NAMING
        accounts = _seasonRefAccounts[seasonNumber];
    }

    function USDSEASONACCOUNTPURCHASED922(uint16 seasonNumber, address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _usdSeasonAccountPurchased[seasonNumber][account];
    }

    function USDSEASONACCOUNTREF975(uint16 seasonNumber, address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _usdSeasonAccountRef[seasonNumber][account];
    }

    constructor () public {
        _etherPriceAuditors[msg.sender] = true;
        _stage = 0;
        _season = 1;
    }

    function () external payable ENOUGHGAS244 ONLYONSALE317 {
        require(msg.value >= WEI_MIN);
        require(msg.value <= WEI_MAX);

        // Set temporary variables.
        SETTEMPORARYVARIABLES3();
        uint256 __usdAmount = WEI2USD779(msg.value);
        uint256 __usdRemain = __usdAmount;
        uint256 __tokenIssued;
        uint256 __tokenBonus;
        uint256 __usdUsed;
        uint256 __weiUsed;

        // USD => TM Token
        while (gasleft() > GAS_EX && __usdRemain > 0 && _stage <= STAGE_MAX) {
            uint256 __txTokenIssued;
            (__txTokenIssued, __usdRemain) = EX320(__usdRemain);
            __tokenIssued = __tokenIssued.ADD690(__txTokenIssued);
        }

        // Used
        __usdUsed = __usdAmount.SUB444(__usdRemain);
        __weiUsed = USD2WEI304(__usdUsed);

        // Bonus 10%
        if (msg.value >= WEI_BONUS) {
            __tokenBonus = __tokenIssued.DIV352(10);
            assert(TRANSFERTOKENBONUS555(__tokenBonus));
        }

        // Whitelisted
        // BUY-ONE-AND-GET-ONE-MORE-FREE
        if (_inWhitelist_ && __tokenIssued > 0) {
            // both issued and bonus
            assert(TRANSFERTOKENWHITELISTED657(__tokenIssued.ADD690(__tokenBonus)));

            // 35% for 15 levels
            SENDWHITELISTREFERRALREWARDS50(__weiUsed);
        }

        // If wei remains, refund.
        if (__usdRemain > 0) {
            uint256 __weiRemain = USD2WEI304(__usdRemain);

            __weiUsed = msg.value.SUB444(__weiRemain);

            // Refund wei back
            msg.sender.transfer(__weiRemain);
        }

        // Counter
        if (__weiUsed > 0) {
            _txs = _txs.ADD690(1);
            _weiSold = _weiSold.ADD690(__weiUsed);
            _accountWeiPurchased[msg.sender] = _accountWeiPurchased[msg.sender].ADD690(__weiUsed);
        }

        // Wei team
        uint256 __weiTeam;
        if (_season > SEASON_MAX)
            __weiTeam = _weiSold.SUB444(_weiRefRewarded).SUB444(_weiTopSales).SUB444(_weiPending).SUB444(_weiTeam);
        else
            __weiTeam = _weiSold.SUB444(_weiRefRewarded).SUB444(_weiTopSales).SUB444(_weiPending).SUB444(_weiTeam).DIV352(0.01 ether).MUL125(0.01 ether);

        _weiTeam = _weiTeam.ADD690(__weiTeam);
        _receiver.transfer(__weiTeam);

        // Assert finished
        assert(true);
    }

    function SETTEMPORARYVARIABLES3() private {	//inject NONSTANDARD NAMING
        delete _referrers_;
        delete _rewards_;

        _inWhitelist_ = TOKEN.INWHITELIST556(msg.sender);
        _pending_ = WHITELIST_REF_REWARDS_PCT_SUM;

        address __cursor = msg.sender;
        for(uint16 i = 0; i < WHITELIST_REF_REWARDS_PCT.length; i++) {
            address __refAccount = TOKEN.REFERRER671(__cursor);

            if (__cursor == __refAccount)
                break;

            if (TOKEN.REFCOUNT613(__refAccount) > i) {
                if (!_seasonHasRefAccount[_season][__refAccount]) {
                    _seasonRefAccounts[_season].push(__refAccount);
                    _seasonHasRefAccount[_season][__refAccount] = true;
                }

                _pending_ = _pending_.SUB444(WHITELIST_REF_REWARDS_PCT[i]);
                _rewards_.push(WHITELIST_REF_REWARDS_PCT[i]);
                _referrers_.push(__refAccount);
            }

            __cursor = __refAccount;
        }
    }

                                       
    function EX320(uint256 usdAmount) private returns (uint256, uint256) {	//inject NONSTANDARD NAMING
        uint256 __stageUsdCap = STAGEUSDCAP914(_stage);
        uint256 __tokenIssued;

        // in stage
        if (_stageUsdSold[_stage].ADD690(usdAmount) <= __stageUsdCap) {
            EXCOUNT151(usdAmount);

            __tokenIssued = USD2TOKEN379(usdAmount);
            assert(TRANSFERTOKENISSUED599(__tokenIssued, usdAmount));

            // close stage, if stage dollor cap reached
            if (__stageUsdCap == _stageUsdSold[_stage]) {
                assert(CLOSESTAGE450());
            }

            return (__tokenIssued, 0);
        }

        // close stage
        uint256 __usdUsed = __stageUsdCap.SUB444(_stageUsdSold[_stage]);
        uint256 __usdRemain = usdAmount.SUB444(__usdUsed);

        EXCOUNT151(__usdUsed);

        __tokenIssued = USD2TOKEN379(__usdUsed);
        assert(TRANSFERTOKENISSUED599(__tokenIssued, __usdUsed));
        assert(CLOSESTAGE450());

        return (__tokenIssued, __usdRemain);
    }

    function EXCOUNT151(uint256 usdAmount) private {	//inject NONSTANDARD NAMING
        uint256 __weiSold = USD2WEI304(usdAmount);
        uint256 __weiTopSales = USD2WEITOPSALES895(usdAmount);

        _usdSeasonAccountPurchased[_season][msg.sender] = _usdSeasonAccountPurchased[_season][msg.sender].ADD690(usdAmount);   // season => address => purchased, in USD

        _stageUsdSold[_stage] = _stageUsdSold[_stage].ADD690(usdAmount);                   // stage sold, in USD
        _seasonWeiSold[_season] = _seasonWeiSold[_season].ADD690(__weiSold);               // season sold, in wei
        _seasonWeiTopSales[_season] = _seasonWeiTopSales[_season].ADD690(__weiTopSales);   // season Top-Sales, in wei
        _weiTopSales = _weiTopSales.ADD690(__weiTopSales);                                 // sum Top-Sales, in wei

        // season referral account
        if (_inWhitelist_) {
            for (uint16 i = 0; i < _rewards_.length; i++) {
                _usdSeasonAccountRef[_season][_referrers_[i]] = _usdSeasonAccountRef[_season][_referrers_[i]].ADD690(usdAmount);
            }
        }
    }

    function TRANSFERTOKENISSUED599(uint256 amount, uint256 usdAmount) private returns (bool) {	//inject NONSTANDARD NAMING
        _tokenTxs = _tokenTxs.ADD690(1);

        _tokenIssued = _tokenIssued.ADD690(amount);
        _stageTokenIssued[_stage] = _stageTokenIssued[_stage].ADD690(amount);
        _accountTokenIssued[msg.sender] = _accountTokenIssued[msg.sender].ADD690(amount);

        assert(TOKEN.TRANSFER36(msg.sender, amount));
        emit TOKENISSUEDTRANSFERED899(_stage, msg.sender, amount, _etherPrice, usdAmount);
        return true;
    }

    function TRANSFERTOKENBONUS555(uint256 amount) private returns (bool) {	//inject NONSTANDARD NAMING
        _tokenBonusTxs = _tokenBonusTxs.ADD690(1);

        _tokenBonus = _tokenBonus.ADD690(amount);
        _accountTokenBonus[msg.sender] = _accountTokenBonus[msg.sender].ADD690(amount);

        assert(TOKEN.TRANSFER36(msg.sender, amount));
        emit TOKENBONUSTRANSFERED958(msg.sender, amount);
        return true;
    }

    function TRANSFERTOKENWHITELISTED657(uint256 amount) private returns (bool) {	//inject NONSTANDARD NAMING
        _tokenWhitelistTxs = _tokenWhitelistTxs.ADD690(1);

        _tokenWhitelist = _tokenWhitelist.ADD690(amount);
        _accountTokenWhitelisted[msg.sender] = _accountTokenWhitelisted[msg.sender].ADD690(amount);

        assert(TOKEN.TRANSFER36(msg.sender, amount));
        emit TOKENWHITELISTTRANSFERED578(msg.sender, amount);
        return true;
    }

    function CLOSESTAGE450() private returns (bool) {	//inject NONSTANDARD NAMING
        emit STAGECLOSED164(_stage, msg.sender);
        _stage = _stage.ADD690(1);
        _tokenUsdPrice = STAGETOKENUSDPRICE610(_stage);
        _topSalesRatio = TOPSALESRATIO852(_stage);

        // Close current season
        uint16 __seasonNumber = CALCSEASON706(_stage);
        if (_season < __seasonNumber) {
            emit SEASONCLOSED519(_season, msg.sender);
            _season = __seasonNumber;
        }

        return true;
    }

    function SENDWHITELISTREFERRALREWARDS50(uint256 weiAmount) private {	//inject NONSTANDARD NAMING
        uint256 __weiRemain = weiAmount;
        for (uint16 i = 0; i < _rewards_.length; i++) {
            uint256 __weiReward = weiAmount.MUL125(_rewards_[i]).DIV352(100);
            address payable __receiver = address(uint160(_referrers_[i]));

            _weiRefRewarded = _weiRefRewarded.ADD690(__weiReward);
            _accountWeiRefRewarded[__receiver] = _accountWeiRefRewarded[__receiver].ADD690(__weiReward);
            __weiRemain = __weiRemain.SUB444(__weiReward);

            __receiver.transfer(__weiReward);
        }

        if (_pending_ > 0)
            _weiPending = _weiPending.ADD690(weiAmount.MUL125(_pending_).DIV352(100));
    }
}