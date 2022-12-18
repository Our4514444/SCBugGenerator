pragma solidity ^0.5.7;

interface TokenInterface {
    function ALLOWANCE804(address, address) external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF616(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE521(address, uint) external;	//inject NONSTANDARD NAMING
    function TRANSFER693(address, uint) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM766(address, address, uint) external returns (bool);	//inject NONSTANDARD NAMING
    function DEPOSIT544() external payable;	//inject NONSTANDARD NAMING
    function WITHDRAW178(uint) external;	//inject NONSTANDARD NAMING
}

interface UniswapExchange {
    function GETETHTOTOKENINPUTPRICE934(uint ethSold) external view returns (uint tokenBought);	//inject NONSTANDARD NAMING
    function GETTOKENTOETHINPUTPRICE181(uint tokenSold) external view returns (uint ethBought);	//inject NONSTANDARD NAMING
    function ETHTOTOKENSWAPINPUT95(uint minTokens, uint deadline) external payable returns (uint tokenBought);	//inject NONSTANDARD NAMING
    function TOKENTOETHSWAPINPUT275(uint tokenSold, uint minEth, uint deadline) external returns (uint ethBought);	//inject NONSTANDARD NAMING
}

interface KyberInterface {
    function TRADE128(	//inject NONSTANDARD NAMING
        address src,
        uint srcAmount,
        address dest,
        address destAddress,
        uint maxDestAmount,
        uint minConversionRate,
        address walletId
        ) external payable returns (uint);

    function GETEXPECTEDRATE342(	//inject NONSTANDARD NAMING
        address src,
        address dest,
        uint srcQty
        ) external view returns (uint, uint);
}

interface Eth2DaiInterface {
    function GETBUYAMOUNT791(address dest, address src, uint srcAmt) external view returns(uint);	//inject NONSTANDARD NAMING
	function GETPAYAMOUNT696(address src, address dest, uint destAmt) external view returns (uint);	//inject NONSTANDARD NAMING
	function SELLALLAMOUNT539(	//inject NONSTANDARD NAMING
        address src,
        uint srcAmt,
        address dest,
        uint minDest
    ) external returns (uint destAmt);
	function BUYALLAMOUNT470(	//inject NONSTANDARD NAMING
        address dest,
        uint destAmt,
        address src,
        uint maxSrc
    ) external returns (uint srcAmt);
}


contract DSMath {

    function ADD571(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x, "math-not-safe");
    }

    function SUB392(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }

    function MUL334(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }

    uint constant wad596 = 10 ** 18;	//inject NONSTANDARD NAMING
    uint constant ray406 = 10 ** 27;	//inject NONSTANDARD NAMING

    function RMUL42(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD571(MUL334(x, y), ray406 / 2) / ray406;
    }

    function RDIV591(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD571(MUL334(x, ray406), y / 2) / y;
    }

    function WMUL119(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD571(MUL334(x, y), wad596 / 2) / wad596;
    }

    function WDIV340(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD571(MUL334(x, wad596), y / 2) / y;
    }

}


contract Helper is DSMath {

    address public eth2daiAddr = 0x39755357759cE0d7f32dC8dC45414CCa409AE24e;
    address public uniswapAddr = 0x09cabEC1eAd1c0Ba254B09efb3EE13841712bE14; // Uniswap DAI exchange
    address public kyberAddr = 0x818E6FECD516Ecc3849DAf6845e3EC868087B755;
    address public ethAddr = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    address public wethAddr = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public daiAddr = 0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359;
    address public adminOne = 0xa7615CD307F323172331865181DC8b80a2834324;
    address public adminTwo = 0x7284a8451d9a0e7Dc62B3a71C0593eA2eC5c5638;
    uint public maxSplitAmtEth = 50000000000000000000;
    uint public maxSplitAmtDai = 20000000000000000000000;
    uint public cut = 997500000000000000; // 0.25% charge

    function SETALLOWANCE807(TokenInterface _token, address _spender) internal {	//inject NONSTANDARD NAMING
        if (_token.ALLOWANCE804(address(this), _spender) != uint(-1)) {
            _token.APPROVE521(_spender, uint(-1));
        }
    }

    modifier ISADMIN198 {	//inject NONSTANDARD NAMING
        require(msg.sender == adminOne || msg.sender == adminTwo, "Not an Admin");
        _;
    }

}


contract AdminStuffs is Helper {

    function SETSPLITETH434(uint amt) public ISADMIN198 {	//inject NONSTANDARD NAMING
        maxSplitAmtEth = amt;
    }

    function SETSPLITDAI616(uint amt) public ISADMIN198 {	//inject NONSTANDARD NAMING
        maxSplitAmtDai = amt;
    }

    function WITHDRAWTOKEN483(address token) public ISADMIN198 {	//inject NONSTANDARD NAMING
        uint daiBal = TokenInterface(token).BALANCEOF616(address(this));
        TokenInterface(token).TRANSFER693(msg.sender, daiBal);
    }

    function WITHDRAWETH269() public payable ISADMIN198 {	//inject NONSTANDARD NAMING
        msg.sender.transfer(address(this).balance);
    }

    function CHANGEFEE31(uint amt) public ISADMIN198 {	//inject NONSTANDARD NAMING
        if (amt > 997000000000000000) {
            cut = 997000000000000000; // maximum fees can be 0.3%. Minimum 0%
        } else {
            cut = amt;
        }
    }

}


contract SplitHelper is AdminStuffs {

    function GETBEST401(address src, address dest, uint srcAmt) public view returns (uint bestExchange, uint destAmt) {	//inject NONSTANDARD NAMING
        uint finalSrcAmt = srcAmt;
        if (src == daiAddr) {
            finalSrcAmt = WMUL119(srcAmt, cut);
        }
        uint eth2DaiPrice = GETRATEETH2DAI953(src, dest, finalSrcAmt);
        uint kyberPrice = GETRATEKYBER807(src, dest, finalSrcAmt);
        uint uniswapPrice = GETRATEUNISWAP996(src, dest, finalSrcAmt);
        if (eth2DaiPrice > kyberPrice && eth2DaiPrice > uniswapPrice) {
            destAmt = eth2DaiPrice;
            bestExchange = 0;
        } else if (kyberPrice > uniswapPrice && kyberPrice > eth2DaiPrice) {
            destAmt = kyberPrice;
            bestExchange = 1;
        } else {
            destAmt = uniswapPrice;
            bestExchange = 2;
        }
        if (dest == daiAddr) {
            destAmt = WMUL119(destAmt, cut);
        }
        require(destAmt != 0, "Dest Amt = 0");
    }

    function GETRATEETH2DAI953(address src, address dest, uint srcAmt) public view returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (src == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).GETBUYAMOUNT791(dest, wethAddr, srcAmt);
        } else if (dest == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).GETBUYAMOUNT791(wethAddr, src, srcAmt);
        }
    }

    function GETRATEKYBER807(address src, address dest, uint srcAmt) public view returns (uint destAmt) {	//inject NONSTANDARD NAMING
        (uint kyberPrice,) = KyberInterface(kyberAddr).GETEXPECTEDRATE342(src, dest, srcAmt);
        destAmt = WMUL119(srcAmt, kyberPrice);
    }

    function GETRATEUNISWAP996(address src, address dest, uint srcAmt) public view returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (src == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).GETETHTOTOKENINPUTPRICE934(srcAmt);
        } else if (dest == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).GETTOKENTOETHINPUTPRICE181(srcAmt);
        }
    }

}


contract SplitResolver is SplitHelper {

    function ETHTODAILOOP20(uint srcAmt, uint splitAmt, uint finalAmt) internal returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (srcAmt > splitAmt) {
            uint amtToSwap = splitAmt;
            uint nextSrcAmt = srcAmt - splitAmt;
            (uint bestExchange,) = GETBEST401(ethAddr, daiAddr, amtToSwap);
            uint ethBought = finalAmt;
            if (bestExchange == 0) {
                ethBought += SWAPETH2DAI616(wethAddr, daiAddr, amtToSwap);
            } else if (bestExchange == 1) {
                ethBought += SWAPKYBER993(ethAddr, daiAddr, amtToSwap);
            } else {
                ethBought += SWAPUNISWAP273(ethAddr, daiAddr, amtToSwap);
            }
            destAmt = ETHTODAILOOP20(nextSrcAmt, splitAmt, ethBought);
        } else if (srcAmt > 0) {
            (uint bestExchange,) = GETBEST401(ethAddr, daiAddr, srcAmt);
            destAmt = finalAmt;
            if (bestExchange == 0) {
                destAmt += SWAPETH2DAI616(wethAddr, daiAddr, srcAmt);
            } else if (bestExchange == 1) {
                destAmt += SWAPKYBER993(ethAddr, daiAddr, srcAmt);
            } else {
                destAmt += SWAPUNISWAP273(ethAddr, daiAddr, srcAmt);
            }
        } else {
            destAmt = finalAmt;
        }
    }

    function DAITOETHLOOP501(uint srcAmt, uint splitAmt, uint finalAmt) internal returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (srcAmt > splitAmt) {
            uint amtToSwap = splitAmt;
            uint nextSrcAmt = srcAmt - splitAmt;
            (uint bestExchange,) = GETBEST401(daiAddr, ethAddr, amtToSwap);
            uint ethBought = finalAmt;
            if (bestExchange == 0) {
                ethBought += SWAPETH2DAI616(daiAddr, wethAddr, amtToSwap);
            } else if (bestExchange == 1) {
                ethBought += SWAPKYBER993(daiAddr, ethAddr, amtToSwap);
            } else {
                ethBought += SWAPUNISWAP273(daiAddr, ethAddr, amtToSwap);
            }
            destAmt = DAITOETHLOOP501(nextSrcAmt, splitAmt, ethBought);
        } else if (srcAmt > 0) {
            (uint bestExchange,) = GETBEST401(daiAddr, ethAddr, srcAmt);
            destAmt = finalAmt;
            if (bestExchange == 0) {
                destAmt += SWAPETH2DAI616(daiAddr, wethAddr, srcAmt);
            } else if (bestExchange == 1) {
                destAmt += SWAPKYBER993(daiAddr, ethAddr, srcAmt);
            } else {
                destAmt += SWAPUNISWAP273(daiAddr, ethAddr, srcAmt);
            }
            TokenInterface wethContract = TokenInterface(wethAddr);
            uint balanceWeth = wethContract.BALANCEOF616(address(this));
            wethContract.WITHDRAW178(balanceWeth);
        } else {
            TokenInterface wethContract = TokenInterface(wethAddr);
            uint balanceWeth = wethContract.BALANCEOF616(address(this));
            wethContract.WITHDRAW178(balanceWeth);
            destAmt = finalAmt;
        }
    }

    function SWAPETH2DAI616(address src, address dest, uint srcAmt) internal returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (src == wethAddr) {
            TokenInterface(wethAddr).DEPOSIT544.value(srcAmt)();
        }
        destAmt = Eth2DaiInterface(eth2daiAddr).SELLALLAMOUNT539(
                src,
                srcAmt,
                dest,
                0
            );
    }

    function SWAPKYBER993(address src, address dest, uint srcAmt) internal returns (uint destAmt) {	//inject NONSTANDARD NAMING
        destAmt = KyberInterface(kyberAddr).TRADE128.value(srcAmt)(
                src,
                srcAmt,
                dest,
                address(this),
                2**255,
                0,
                adminOne
            );
    }

    function SWAPUNISWAP273(address src, address dest, uint srcAmt) internal returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (src == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).ETHTOTOKENSWAPINPUT95.value(srcAmt)(uint(0), uint(1899063809));
        } else if (dest == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).TOKENTOETHSWAPINPUT275(srcAmt, uint(0), uint(1899063809));
        }
    }

}


contract SplitSwap is SplitResolver {

    function ETHTODAISWAP419(uint splitAmt, uint slippageAmt) public payable returns (uint destAmt) { // srcAmt = msg.value	//inject NONSTANDARD NAMING
        require(maxSplitAmtEth >= splitAmt, "split amt > max");
        destAmt = ETHTODAILOOP20(msg.value, splitAmt, 0);
        destAmt = WMUL119(destAmt, cut);
        require(destAmt > slippageAmt, "Dest Amt < slippage");
        require(TokenInterface(daiAddr).TRANSFER693(msg.sender, destAmt), "Not enough DAI to transfer");
    }

    function DAITOETHSWAP389(uint srcAmt, uint splitAmt, uint slippageAmt) public payable returns (uint destAmt) {	//inject NONSTANDARD NAMING
        require(maxSplitAmtDai >= splitAmt, "split amt > max");
        require(TokenInterface(daiAddr).TRANSFERFROM766(msg.sender, address(this), srcAmt), "Token Approved?");
        uint finalSrcAmt = WMUL119(srcAmt, cut);
        destAmt = DAITOETHLOOP501(finalSrcAmt, splitAmt, 0);
        require(destAmt > slippageAmt, "Dest Amt < slippage");
        msg.sender.transfer(destAmt);
    }

}


contract InstaSwap is SplitSwap {

    constructor() public {
        SETALLOWANCE807(TokenInterface(daiAddr), eth2daiAddr);
        SETALLOWANCE807(TokenInterface(daiAddr), kyberAddr);
        SETALLOWANCE807(TokenInterface(daiAddr), uniswapAddr);
        SETALLOWANCE807(TokenInterface(wethAddr), eth2daiAddr);
        SETALLOWANCE807(TokenInterface(wethAddr), wethAddr);
    }

    function() external payable {}

}