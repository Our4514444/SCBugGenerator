pragma solidity ^0.5.7;

interface TokenInterface {
    function ALLOWANCE75(address, address) external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF953(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE784(address, uint) external;	//inject NONSTANDARD NAMING
    function TRANSFER210(address, uint) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM546(address, address, uint) external returns (bool);	//inject NONSTANDARD NAMING
    function DEPOSIT372() external payable;	//inject NONSTANDARD NAMING
    function WITHDRAW956(uint) external;	//inject NONSTANDARD NAMING
}

interface UniswapExchange {
    function GETETHTOTOKENINPUTPRICE547(uint ethSold) external view returns (uint tokenBought);	//inject NONSTANDARD NAMING
    function GETTOKENTOETHINPUTPRICE187(uint tokenSold) external view returns (uint ethBought);	//inject NONSTANDARD NAMING
    function ETHTOTOKENSWAPINPUT939(uint minTokens, uint deadline) external payable returns (uint tokenBought);	//inject NONSTANDARD NAMING
    function TOKENTOETHSWAPINPUT141(uint tokenSold, uint minEth, uint deadline) external returns (uint ethBought);	//inject NONSTANDARD NAMING
}

interface KyberInterface {
    function TRADE205(	//inject NONSTANDARD NAMING
        address src,
        uint srcAmount,
        address dest,
        address destAddress,
        uint maxDestAmount,
        uint minConversionRate,
        address walletId
        ) external payable returns (uint);

    function GETEXPECTEDRATE778(	//inject NONSTANDARD NAMING
        address src,
        address dest,
        uint srcQty
        ) external view returns (uint, uint);
}

interface Eth2DaiInterface {
    function GETBUYAMOUNT151(address dest, address src, uint srcAmt) external view returns(uint);	//inject NONSTANDARD NAMING
	function GETPAYAMOUNT739(address src, address dest, uint destAmt) external view returns (uint);	//inject NONSTANDARD NAMING
	function SELLALLAMOUNT745(	//inject NONSTANDARD NAMING
        address src,
        uint srcAmt,
        address dest,
        uint minDest
    ) external returns (uint destAmt);
	function BUYALLAMOUNT507(	//inject NONSTANDARD NAMING
        address dest,
        uint destAmt,
        address src,
        uint maxSrc
    ) external returns (uint srcAmt);
}


contract DSMath {

    function ADD494(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x, "math-not-safe");
    }

    function SUB824(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }

    function MUL791(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }

    uint constant wad550 = 10 ** 18;	//inject NONSTANDARD NAMING
    uint constant ray285 = 10 ** 27;	//inject NONSTANDARD NAMING

    function RMUL156(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD494(MUL791(x, y), ray285 / 2) / ray285;
    }

    function RDIV983(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD494(MUL791(x, ray285), y / 2) / y;
    }

    function WMUL909(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD494(MUL791(x, y), wad550 / 2) / wad550;
    }

    function WDIV665(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD494(MUL791(x, wad550), y / 2) / y;
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
    uint public maxSplitAmtEth = 60000000000000000000;
    uint public maxSplitAmtDai = 20000000000000000000000;
    uint public cut = 997500000000000000; // 0.25% charge

    function SETALLOWANCE718(TokenInterface _token, address _spender) internal {	//inject NONSTANDARD NAMING
        if (_token.ALLOWANCE75(address(this), _spender) != uint(-1)) {
            _token.APPROVE784(_spender, uint(-1));
        }
    }

    modifier ISADMIN163 {	//inject NONSTANDARD NAMING
        require(msg.sender == adminOne || msg.sender == adminTwo, "Not an Admin");
        _;
    }

}


contract AdminStuffs is Helper {

    function SETSPLITETH85(uint amt) public ISADMIN163 {	//inject NONSTANDARD NAMING
        maxSplitAmtEth = amt;
    }

    function SETSPLITDAI945(uint amt) public ISADMIN163 {	//inject NONSTANDARD NAMING
        maxSplitAmtDai = amt;
    }

    function WITHDRAWTOKEN690(address token) public ISADMIN163 {	//inject NONSTANDARD NAMING
        uint daiBal = TokenInterface(token).BALANCEOF953(address(this));
        TokenInterface(token).TRANSFER210(msg.sender, daiBal);
    }

    function WITHDRAWETH288() public payable ISADMIN163 {	//inject NONSTANDARD NAMING
        msg.sender.transfer(address(this).balance);
    }

    function CHANGEFEE814(uint amt) public ISADMIN163 {	//inject NONSTANDARD NAMING
        if (amt > 997000000000000000) {
            cut = 997000000000000000; // maximum fees can be 0.3%. Minimum 0%
        } else {
            cut = amt;
        }
    }

}


contract SplitHelper is AdminStuffs {

    function GETBEST70(address src, address dest, uint srcAmt) public view returns (uint bestExchange, uint destAmt) {	//inject NONSTANDARD NAMING
        uint finalSrcAmt = srcAmt;
        if (src == daiAddr) {
            finalSrcAmt = WMUL909(srcAmt, cut);
        }
        uint eth2DaiPrice = GETRATEETH2DAI908(src, dest, finalSrcAmt);
        uint kyberPrice = GETRATEKYBER791(src, dest, finalSrcAmt);
        uint uniswapPrice = GETRATEUNISWAP521(src, dest, finalSrcAmt);
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
            destAmt = WMUL909(destAmt, cut);
        }
        require(destAmt != 0, "Dest Amt = 0");
    }

    function GETRATEETH2DAI908(address src, address dest, uint srcAmt) internal view returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (src == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).GETBUYAMOUNT151(dest, wethAddr, srcAmt);
        } else if (dest == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).GETBUYAMOUNT151(wethAddr, src, srcAmt);
        }
    }

    function GETRATEKYBER791(address src, address dest, uint srcAmt) internal view returns (uint destAmt) {	//inject NONSTANDARD NAMING
        (uint kyberPrice,) = KyberInterface(kyberAddr).GETEXPECTEDRATE778(src, dest, srcAmt);
        destAmt = WMUL909(srcAmt, kyberPrice);
    }

    function GETRATEUNISWAP521(address src, address dest, uint srcAmt) internal view returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (src == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).GETETHTOTOKENINPUTPRICE547(srcAmt);
        } else if (dest == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).GETTOKENTOETHINPUTPRICE187(srcAmt);
        }
    }

}


contract SplitResolver is SplitHelper {

    event LOGETHTODAI272(uint srcAmt, uint destAmt);	//inject NONSTANDARD NAMING
    event LOGDAITOETH306(uint srcAmt, uint destAmt);	//inject NONSTANDARD NAMING

    function ETHTODAILOOP490(uint srcAmt, uint splitAmt, uint finalAmt) internal returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (srcAmt > splitAmt) {
            uint amtToSwap = splitAmt;
            uint nextSrcAmt = srcAmt - splitAmt;
            (uint bestExchange,) = GETBEST70(ethAddr, daiAddr, amtToSwap);
            uint ethBought = finalAmt;
            if (bestExchange == 0) {
                ethBought += SWAPETH2DAI875(wethAddr, daiAddr, amtToSwap);
            } else if (bestExchange == 1) {
                ethBought += SWAPKYBER714(ethAddr, daiAddr, amtToSwap);
            } else {
                ethBought += SWAPUNISWAP91(ethAddr, daiAddr, amtToSwap);
            }
            destAmt = ETHTODAILOOP490(nextSrcAmt, splitAmt, ethBought);
        } else if (srcAmt > 0) {
            destAmt = finalAmt;
            destAmt += SWAPKYBER714(ethAddr, daiAddr, srcAmt);
        } else {
            destAmt = finalAmt;
        }
    }

    function DAITOETHLOOP541(uint srcAmt, uint splitAmt, uint finalAmt) internal returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (srcAmt > splitAmt) {
            uint amtToSwap = splitAmt;
            uint nextSrcAmt = srcAmt - splitAmt;
            (uint bestExchange,) = GETBEST70(daiAddr, ethAddr, amtToSwap);
            uint ethBought = finalAmt;
            if (bestExchange == 0) {
                ethBought += SWAPETH2DAI875(daiAddr, wethAddr, amtToSwap);
            } else if (bestExchange == 1) {
                ethBought += SWAPKYBER714(daiAddr, ethAddr, amtToSwap);
            } else {
                ethBought += SWAPUNISWAP91(daiAddr, ethAddr, amtToSwap);
            }
            destAmt = DAITOETHLOOP541(nextSrcAmt, splitAmt, ethBought);
        } else if (srcAmt > 0) {
            destAmt = finalAmt;
            destAmt += SWAPKYBER714(daiAddr, ethAddr, srcAmt);
            TokenInterface wethContract = TokenInterface(wethAddr);
            uint balanceWeth = wethContract.BALANCEOF953(address(this));
            if (balanceWeth > 0) {
                wethContract.WITHDRAW956(balanceWeth);
            }
        } else {
            TokenInterface wethContract = TokenInterface(wethAddr);
            uint balanceWeth = wethContract.BALANCEOF953(address(this));
            if (balanceWeth > 0) {
                wethContract.WITHDRAW956(balanceWeth);
            }
            destAmt = finalAmt;
        }
    }

    function SWAPETH2DAI875(address src, address dest, uint srcAmt) internal returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (src == wethAddr) {
            TokenInterface(wethAddr).DEPOSIT372.value(srcAmt)();
        }
        destAmt = Eth2DaiInterface(eth2daiAddr).SELLALLAMOUNT745(
                src,
                srcAmt,
                dest,
                0
            );
    }

    function SWAPKYBER714(address src, address dest, uint srcAmt) internal returns (uint destAmt) {	//inject NONSTANDARD NAMING
        uint ethAmt = src == ethAddr ? srcAmt : 0;
        destAmt = KyberInterface(kyberAddr).TRADE205.value(ethAmt)(
                src,
                srcAmt,
                dest,
                address(this),
                2**255,
                0,
                adminOne
            );
    }

    function SWAPUNISWAP91(address src, address dest, uint srcAmt) internal returns (uint destAmt) {	//inject NONSTANDARD NAMING
        if (src == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).ETHTOTOKENSWAPINPUT939.value(srcAmt)(uint(0), uint(1899063809));
        } else if (dest == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).TOKENTOETHSWAPINPUT141(srcAmt, uint(0), uint(1899063809));
        }
    }

}


contract SplitSwap is SplitResolver {

    function ETHTODAISWAP222(uint splitAmt, uint slippageAmt) public payable returns (uint destAmt) { // srcAmt = msg.value	//inject NONSTANDARD NAMING
        require(maxSplitAmtEth >= splitAmt, "split amt > max");
        destAmt = ETHTODAILOOP490(msg.value, splitAmt, 0);
        destAmt = WMUL909(destAmt, cut);
        require(destAmt > slippageAmt, "Dest Amt < slippage");
        require(TokenInterface(daiAddr).TRANSFER210(msg.sender, destAmt), "Not enough DAI to transfer");
        emit LOGETHTODAI272(msg.value, destAmt);
    }

    function DAITOETHSWAP535(uint srcAmt, uint splitAmt, uint slippageAmt) public returns (uint destAmt) {	//inject NONSTANDARD NAMING
        require(maxSplitAmtDai >= splitAmt, "split amt > max");
        require(TokenInterface(daiAddr).TRANSFERFROM546(msg.sender, address(this), srcAmt), "Token Approved?");
        uint finalSrcAmt = WMUL909(srcAmt, cut);
        destAmt = DAITOETHLOOP541(finalSrcAmt, splitAmt, 0);
        require(destAmt > slippageAmt, "Dest Amt < slippage");
        msg.sender.transfer(destAmt);
        emit LOGDAITOETH306(finalSrcAmt, destAmt);
    }

}


contract InstaSwap is SplitSwap {

    constructor() public {
        SETALLOWANCE718(TokenInterface(daiAddr), eth2daiAddr);
        SETALLOWANCE718(TokenInterface(daiAddr), kyberAddr);
        SETALLOWANCE718(TokenInterface(daiAddr), uniswapAddr);
        SETALLOWANCE718(TokenInterface(wethAddr), eth2daiAddr);
        SETALLOWANCE718(TokenInterface(wethAddr), wethAddr);
    }

    function() external payable {}

}