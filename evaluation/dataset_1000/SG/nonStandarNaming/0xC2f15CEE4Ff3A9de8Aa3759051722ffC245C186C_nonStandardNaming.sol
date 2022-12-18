                                                                 

                                                                                                                    

pragma solidity 0.5.17;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER22() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA792() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED961(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER22();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED961(address(0), msgSender);
    }

                                                                     
    function OWNER541() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER818() {	//inject NONSTANDARD NAMING
        require(ISOWNER249(), "unauthorized");
        _;
    }

                                                                            
    function ISOWNER249() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER22() == _owner;
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP304(address newOwner) public ONLYOWNER818 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP421(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP421(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED961(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD750(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB8(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB8(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB8(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL18(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV972(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV972(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV972(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b != 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                  
    function DIVCEIL624(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIVCEIL624(a, b, "SafeMath: division by zero");
    }

                                                                                                  
    function DIVCEIL624(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b != 0, errorMessage);

        if (a == 0) {
            return 0;
        }
        uint256 c = ((a - 1) / b) + 1;

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD462(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD462(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD462(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }

    function MIN256277(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return _a < _b ? _a : _b;
    }
}

interface IWeth {
    function DEPOSIT121() external payable;	//inject NONSTANDARD NAMING
    function WITHDRAW738(uint256 wad) external;	//inject NONSTANDARD NAMING
}

contract IERC20 {
    string public name;
    uint8 public decimals;
    string public symbol;
    function TOTALSUPPLY227() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF962(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE108(address _owner, address _spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE662(address _spender, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER889(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM91(address _from, address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER596(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL532(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract IWethERC20 is IWeth, IERC20 {}

contract Constants {

    uint256 internal constant wei_precision277 = 10**18;	//inject NONSTANDARD NAMING
    uint256 internal constant wei_percent_precision186 = 10**20;	//inject NONSTANDARD NAMING

    uint256 internal constant days_in_a_year387 = 365;	//inject NONSTANDARD NAMING
    uint256 internal constant one_month621 = 2628000; // approx. seconds in a month	//inject NONSTANDARD NAMING

    IWethERC20 public constant wethtoken598 = IWethERC20(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);	//inject NONSTANDARD NAMING
    address public constant bzrxtokenaddress381 = 0x56d811088235F11C8920698a204A5010a788f4b3;	//inject NONSTANDARD NAMING
    address public constant vbzrxtokenaddress832 = 0xB72B31907C1C95F3650b64b2469e08EdACeE5e8F;	//inject NONSTANDARD NAMING
}

interface IPriceFeedsExt {
  function LATESTANSWER56() external view returns (int256);	//inject NONSTANDARD NAMING
}

contract PriceFeeds is Constants, Ownable {
    using SafeMath for uint256;

    // address(1) is used as a stand-in for the non-existent token representing the fast-gas price on Chainlink
    address internal constant fastgas_pricefeed_address303 = address(1);	//inject NONSTANDARD NAMING

    event GLOBALPRICINGPAUSED424(	//inject NONSTANDARD NAMING
        address indexed sender,
        bool isPaused
    );

    mapping (address => IPriceFeedsExt) public pricesFeeds;     // token => pricefeed
    mapping (address => uint256) public decimals;               // decimals of supported tokens

    bool public globalPricingPaused = false;

    constructor()
        public
    {
        // set decimals for ether
        decimals[address(wethtoken598)] = 18;
    }

    function QUERYRATE316(	//inject NONSTANDARD NAMING
        address sourceToken,
        address destToken)
        public
        view
        returns (uint256 rate, uint256 precision)
    {
        require(!globalPricingPaused, "pricing is paused");
        return _QUERYRATE14(
            sourceToken,
            destToken
        );
    }

    function QUERYPRECISION665(	//inject NONSTANDARD NAMING
        address sourceToken,
        address destToken)
        public
        view
        returns (uint256)
    {
        return sourceToken != destToken ?
            _GETDECIMALPRECISION328(sourceToken, destToken) :
            wei_precision277;
    }

                                                                                                                           
    function QUERYRETURN795(	//inject NONSTANDARD NAMING
        address sourceToken,
        address destToken,
        uint256 sourceAmount)
        public
        view
        returns (uint256 destAmount)
    {
        if (globalPricingPaused) {
            return 0;
        }
        (uint256 rate, uint256 precision) = _QUERYRATE14(
            sourceToken,
            destToken
        );

        destAmount = sourceAmount
            .MUL18(rate)
            .DIV972(precision);
    }

    function CHECKPRICEDISAGREEMENT364(	//inject NONSTANDARD NAMING
        address sourceToken,
        address destToken,
        uint256 sourceAmount,
        uint256 destAmount,
        uint256 maxSlippage)
        public
        view
        returns (uint256 sourceToDestSwapRate)
    {
        require(!globalPricingPaused, "pricing is paused");
        (uint256 rate, uint256 precision) = _QUERYRATE14(
            sourceToken,
            destToken
        );

        sourceToDestSwapRate = destAmount
            .MUL18(precision)
            .DIV972(sourceAmount);

        uint256 spreadValue = sourceToDestSwapRate > rate ?
            sourceToDestSwapRate - rate :
            rate - sourceToDestSwapRate;

        if (spreadValue != 0) {
            spreadValue = spreadValue
                .MUL18(wei_percent_precision186)
                .DIV972(sourceToDestSwapRate);

            require(
                spreadValue <= maxSlippage,
                "price disagreement"
            );
        }
    }

    function AMOUNTINETH373(	//inject NONSTANDARD NAMING
        address tokenAddress,
        uint256 amount)
        public
        view
        returns (uint256 ethAmount)
    {
        if (tokenAddress == address(wethtoken598)) {
            ethAmount = amount;
        } else {
            (uint toEthRate, uint256 toEthPrecision) = QUERYRATE316(
                tokenAddress,
                address(wethtoken598)
            );
            ethAmount = amount
                .MUL18(toEthRate)
                .DIV972(toEthPrecision);
        }
    }

    function GETMAXDRAWDOWN854(	//inject NONSTANDARD NAMING
        address loanToken,
        address collateralToken,
        uint256 loanAmount,
        uint256 collateralAmount,
        uint256 margin)
        public
        view
        returns (uint256 maxDrawdown)
    {
        uint256 loanToCollateralAmount;
        if (collateralToken == loanToken) {
            loanToCollateralAmount = loanAmount;
        } else {
            (uint256 rate, uint256 precision) = QUERYRATE316(
                loanToken,
                collateralToken
            );
            loanToCollateralAmount = loanAmount
                .MUL18(rate)
                .DIV972(precision);
        }

        uint256 combined = loanToCollateralAmount
            .ADD750(
                loanToCollateralAmount
                    .MUL18(margin)
                    .DIV972(wei_percent_precision186)
                );

        maxDrawdown = collateralAmount > combined ?
            collateralAmount - combined :
            0;
    }

    function GETCURRENTMARGINANDCOLLATERALSIZE415(	//inject NONSTANDARD NAMING
        address loanToken,
        address collateralToken,
        uint256 loanAmount,
        uint256 collateralAmount)
        public
        view
        returns (uint256 currentMargin, uint256 collateralInEthAmount)
    {
        (currentMargin,) = GETCURRENTMARGIN214(
            loanToken,
            collateralToken,
            loanAmount,
            collateralAmount
        );

        collateralInEthAmount = AMOUNTINETH373(
            collateralToken,
            collateralAmount
        );
    }

    function GETCURRENTMARGIN214(	//inject NONSTANDARD NAMING
        address loanToken,
        address collateralToken,
        uint256 loanAmount,
        uint256 collateralAmount)
        public
        view
        returns (uint256 currentMargin, uint256 collateralToLoanRate)
    {
        uint256 collateralToLoanAmount;
        if (collateralToken == loanToken) {
            collateralToLoanAmount = collateralAmount;
            collateralToLoanRate = wei_precision277;
        } else {
            uint256 collateralToLoanPrecision;
            (collateralToLoanRate, collateralToLoanPrecision) = QUERYRATE316(
                collateralToken,
                loanToken
            );

            collateralToLoanRate = collateralToLoanRate
                .MUL18(wei_precision277)
                .DIV972(collateralToLoanPrecision);

            collateralToLoanAmount = collateralAmount
                .MUL18(collateralToLoanRate)
                .DIV972(wei_precision277);
        }

        if (loanAmount != 0 && collateralToLoanAmount >= loanAmount) {
            currentMargin = collateralToLoanAmount
                .SUB8(loanAmount)
                .MUL18(wei_percent_precision186)
                .DIV972(loanAmount);
        }
    }

    function SHOULDLIQUIDATE144(	//inject NONSTANDARD NAMING
        address loanToken,
        address collateralToken,
        uint256 loanAmount,
        uint256 collateralAmount,
        uint256 maintenanceMargin)
        public
        view
        returns (bool)
    {
        (uint256 currentMargin,) = GETCURRENTMARGIN214(
            loanToken,
            collateralToken,
            loanAmount,
            collateralAmount
        );

        return currentMargin <= maintenanceMargin;
    }

    function GETFASTGASPRICE27(	//inject NONSTANDARD NAMING
        address payToken)
        external
        view
        returns (uint256)
    {
        uint256 gasPrice = _GETFASTGASPRICE448();
        if (payToken != address(wethtoken598) && payToken != address(0)) {
            require(!globalPricingPaused, "pricing is paused");
            (uint256 rate, uint256 precision) = _QUERYRATE14(
                address(wethtoken598),
                payToken
            );
            gasPrice = gasPrice
                .MUL18(rate)
                .DIV972(precision);
        }
        return gasPrice;
    }


                                   

    function SETPRICEFEED140(	//inject NONSTANDARD NAMING
        address[] calldata tokens,
        IPriceFeedsExt[] calldata feeds)
        external
        ONLYOWNER818
    {
        require(tokens.length == feeds.length, "count mismatch");

        for (uint256 i = 0; i < tokens.length; i++) {
            pricesFeeds[tokens[i]] = feeds[i];
        }
    }

    function SETDECIMALS207(	//inject NONSTANDARD NAMING
        IERC20[] calldata tokens)
        external
        ONLYOWNER818
    {
        for (uint256 i = 0; i < tokens.length; i++) {
            decimals[address(tokens[i])] = tokens[i].decimals();
        }
    }

    function SETGLOBALPRICINGPAUSED142(	//inject NONSTANDARD NAMING
        bool isPaused)
        external
        ONLYOWNER818
    {
        globalPricingPaused = isPaused;

        emit GLOBALPRICINGPAUSED424(
            msg.sender,
            isPaused
        );
    }

                                      

    function _QUERYRATE14(	//inject NONSTANDARD NAMING
        address sourceToken,
        address destToken)
        internal
        view
        returns (uint256 rate, uint256 precision)
    {
        if (sourceToken != destToken) {
            uint256 sourceRate = _QUERYRATECALL319(sourceToken);
            uint256 destRate = _QUERYRATECALL319(destToken);

            rate = sourceRate
                .MUL18(wei_precision277)
                .DIV972(destRate);

            precision = _GETDECIMALPRECISION328(sourceToken, destToken);
        } else {
            rate = wei_precision277;
            precision = wei_precision277;
        }
    }

    function _QUERYRATECALL319(	//inject NONSTANDARD NAMING
        address token)
        internal
        view
        returns (uint256 rate)
    {
        if (token != address(wethtoken598)) {
            IPriceFeedsExt _Feed = pricesFeeds[token];
            require(address(_Feed) != address(0), "unsupported price feed");
            rate = uint256(_Feed.LATESTANSWER56());
            require(rate != 0 && (rate >> 128) == 0, "price error");
        } else {
            rate = wei_precision277;
        }
    }

    function _GETDECIMALPRECISION328(	//inject NONSTANDARD NAMING
        address sourceToken,
        address destToken)
        internal
        view
        returns(uint256)
    {
        if (sourceToken == destToken) {
            return wei_precision277;
        } else {
            uint256 sourceTokenDecimals = decimals[sourceToken];
            if (sourceTokenDecimals == 0)
                sourceTokenDecimals = IERC20(sourceToken).decimals();

            uint256 destTokenDecimals = decimals[destToken];
            if (destTokenDecimals == 0)
                destTokenDecimals = IERC20(destToken).decimals();

            if (destTokenDecimals >= sourceTokenDecimals)
                return 10**(SafeMath.SUB8(18, destTokenDecimals-sourceTokenDecimals));
            else
                return 10**(SafeMath.ADD750(18, sourceTokenDecimals-destTokenDecimals));
        }
    }

    function _GETFASTGASPRICE448()	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256 gasPrice)
    {
        gasPrice = uint256(pricesFeeds[fastgas_pricefeed_address303].LATESTANSWER56());
        require(gasPrice != 0 && (gasPrice >> 128) == 0, "gas price error");
    }
}