pragma solidity ^0.5.7;

interface TokenInterface {
    function allowance(address, address) external view returns (uint);
    function balanceOf(address) external view returns (uint);
    function approve(address, uint) external;
    function transfer(address, uint) external returns (bool);
    function transferFrom(address, address, uint) external returns (bool);
    function deposit() external payable;
    function withdraw(uint) external;
}

interface UniswapExchange {
    function getEthToTokenInputPrice(uint ethSold) external view returns (uint tokenBought);
    function getTokenToEthInputPrice(uint tokenSold) external view returns (uint ethBought);
    function ethToTokenSwapInput(uint minTokens, uint deadline) external payable returns (uint tokenBought);
    function tokenToEthSwapInput(uint tokenSold, uint minEth, uint deadline) external returns (uint ethBought);
}

interface KyberInterface {
    function trade(
        address src,
        uint srcAmount,
        address dest,
        address destAddress,
        uint maxDestAmount,
        uint minConversionRate,
        address walletId
        ) external payable returns (uint);

    function getExpectedRate(
        address src,
        address dest,
        uint srcQty
        ) external view returns (uint, uint);
}

interface Eth2DaiInterface {
    function getBuyAmount(address dest, address src, uint srcAmt) external view returns(uint);
	function getPayAmount(address src, address dest, uint destAmt) external view returns (uint);
	function sellAllAmount(
        address src,
        uint srcAmt,
        address dest,
        uint minDest
    ) external returns (uint destAmt);
	function buyAllAmount(
        address dest,
        uint destAmt,
        address src,
        uint maxSrc
    ) external returns (uint srcAmt);
}


contract DSMath {

    function add(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x, "math-not-safe");
    }

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }

    uint constant WAD = 10 ** 18;
    uint constant RAY = 10 ** 27;

    function rmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), RAY / 2) / RAY;
    }

    function rdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, RAY), y / 2) / y;
    }

    function wmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), WAD / 2) / WAD;
    }

    function wdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, WAD), y / 2) / y;
    }

}


contract Helper is DSMath {

    address public eth2daiAddr ;	//inject UNINIT LOCAL/STATE VAR

    address public uniswapAddr ; // Uniswap DAI exchange	//inject UNINIT LOCAL/STATE VAR

    address public kyberAddr ;	//inject UNINIT LOCAL/STATE VAR

    address public ethAddr ;	//inject UNINIT LOCAL/STATE VAR

    address public wethAddr ;	//inject UNINIT LOCAL/STATE VAR

    address public daiAddr ;	//inject UNINIT LOCAL/STATE VAR

    address public adminOne ;	//inject UNINIT LOCAL/STATE VAR

    address public adminTwo ;	//inject UNINIT LOCAL/STATE VAR

    uint public maxSplitAmtEth ;	//inject UNINIT LOCAL/STATE VAR

    uint public maxSplitAmtDai ;	//inject UNINIT LOCAL/STATE VAR

    uint public cut ; // 0.25% charge	//inject UNINIT LOCAL/STATE VAR


    function setAllowance(TokenInterface _token, address _spender) internal {
        if (_token.allowance(address(this), _spender) != uint(-1)) {
            _token.approve(_spender, uint(-1));
        }
    }

    modifier isAdmin {
        require(msg.sender == adminOne || msg.sender == adminTwo, "Not an Admin");
        _;
    }

}


contract AdminStuffs is Helper {

    function setSplitEth(uint amt) public isAdmin {
        maxSplitAmtEth = amt;
    }

    function setSplitDai(uint amt) public isAdmin {
        maxSplitAmtDai = amt;
    }

    function withdrawToken(address token) public isAdmin {
        uint daiBal ;	//inject UNINIT LOCAL/STATE VAR

        TokenInterface(token).transfer(msg.sender, daiBal);
    }

    function withdrawEth() public payable isAdmin {
        msg.sender.transfer(address(this).balance);
    }

    function changeFee(uint amt) public isAdmin {
        if (amt > 997000000000000000) {
            cut = 997000000000000000; // maximum fees can be 0.3%. Minimum 0%
        } else {
            cut = amt;
        }
    }

}


contract SplitHelper is AdminStuffs {

    function getBest(address src, address dest, uint srcAmt) public view returns (uint bestExchange, uint destAmt) {
        uint finalSrcAmt ;	//inject UNINIT LOCAL/STATE VAR

        if (src == daiAddr) {
            finalSrcAmt = wmul(srcAmt, cut);
        }
        uint eth2DaiPrice ;	//inject UNINIT LOCAL/STATE VAR

        uint kyberPrice ;	//inject UNINIT LOCAL/STATE VAR

        uint uniswapPrice ;	//inject UNINIT LOCAL/STATE VAR

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
            destAmt = wmul(destAmt, cut);
        }
        require(destAmt != 0, "Dest Amt = 0");
    }

    function getRateEth2Dai(address src, address dest, uint srcAmt) internal view returns (uint destAmt) {
        if (src == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).getBuyAmount(dest, wethAddr, srcAmt);
        } else if (dest == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).getBuyAmount(wethAddr, src, srcAmt);
        }
    }

    function getRateKyber(address src, address dest, uint srcAmt) internal view returns (uint destAmt) {
        (uint kyberPrice,) = KyberInterface(kyberAddr).getExpectedRate(src, dest, srcAmt);
        destAmt = wmul(srcAmt, kyberPrice);
    }

    function getRateUniswap(address src, address dest, uint srcAmt) internal view returns (uint destAmt) {
        if (src == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).getEthToTokenInputPrice(srcAmt);
        } else if (dest == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).getTokenToEthInputPrice(srcAmt);
        }
    }

}


contract SplitResolver is SplitHelper {

    event LogEthToDai(uint srcAmt, uint destAmt);
    event LogDaiToEth(uint srcAmt, uint destAmt);

    function ethToDaiLoop(uint srcAmt, uint splitAmt, uint finalAmt) internal returns (uint destAmt) {
        if (srcAmt > splitAmt) {
            uint amtToSwap ;	//inject UNINIT LOCAL/STATE VAR

            uint nextSrcAmt ;	//inject UNINIT LOCAL/STATE VAR

            (uint bestExchange,) = getBest(ethAddr, daiAddr, amtToSwap);
            uint ethBought ;	//inject UNINIT LOCAL/STATE VAR

            if (bestExchange == 0) {
                ethBought += swapEth2Dai(wethAddr, daiAddr, amtToSwap);
            } else if (bestExchange == 1) {
                ethBought += swapKyber(ethAddr, daiAddr, amtToSwap);
            } else {
                ethBought += swapUniswap(ethAddr, daiAddr, amtToSwap);
            }
            destAmt = ethToDaiLoop(nextSrcAmt, splitAmt, ethBought);
        } else if (srcAmt > 0) {
            destAmt = finalAmt;
            destAmt += swapKyber(ethAddr, daiAddr, srcAmt);
        } else {
            destAmt = finalAmt;
        }
    }

    function daiToEthLoop(uint srcAmt, uint splitAmt, uint finalAmt) internal returns (uint destAmt) {
        if (srcAmt > splitAmt) {
            uint amtToSwap ;	//inject UNINIT LOCAL/STATE VAR

            uint nextSrcAmt ;	//inject UNINIT LOCAL/STATE VAR

            (uint bestExchange,) = getBest(daiAddr, ethAddr, amtToSwap);
            uint ethBought ;	//inject UNINIT LOCAL/STATE VAR

            if (bestExchange == 0) {
                ethBought += swapEth2Dai(daiAddr, wethAddr, amtToSwap);
            } else if (bestExchange == 1) {
                ethBought += swapKyber(daiAddr, ethAddr, amtToSwap);
            } else {
                ethBought += swapUniswap(daiAddr, ethAddr, amtToSwap);
            }
            destAmt = daiToEthLoop(nextSrcAmt, splitAmt, ethBought);
        } else if (srcAmt > 0) {
            destAmt = finalAmt;
            destAmt += swapKyber(daiAddr, ethAddr, srcAmt);
            TokenInterface wethContract ;	//inject UNINIT LOCAL/STATE VAR

            uint balanceWeth ;	//inject UNINIT LOCAL/STATE VAR

            if (balanceWeth > 0) {
                wethContract.withdraw(balanceWeth);
            }
        } else {
            TokenInterface wethContract ;	//inject UNINIT LOCAL/STATE VAR

            uint balanceWeth ;	//inject UNINIT LOCAL/STATE VAR

            if (balanceWeth > 0) {
                wethContract.withdraw(balanceWeth);
            }
            destAmt = finalAmt;
        }
    }

    function swapEth2Dai(address src, address dest, uint srcAmt) internal returns (uint destAmt) {
        if (src == wethAddr) {
            TokenInterface(wethAddr).deposit.value(srcAmt)();
        }
        destAmt = Eth2DaiInterface(eth2daiAddr).sellAllAmount(
                src,
                srcAmt,
                dest,
                0
            );
    }

    function swapKyber(address src, address dest, uint srcAmt) internal returns (uint destAmt) {
        uint ethAmt ;	//inject UNINIT LOCAL/STATE VAR

        destAmt = KyberInterface(kyberAddr).trade.value(ethAmt)(
                src,
                srcAmt,
                dest,
                address(this),
                2**255,
                0,
                adminOne
            );
    }

    function swapUniswap(address src, address dest, uint srcAmt) internal returns (uint destAmt) {
        if (src == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).ethToTokenSwapInput.value(srcAmt)(uint(0), uint(1899063809));
        } else if (dest == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).tokenToEthSwapInput(srcAmt, uint(0), uint(1899063809));
        }
    }

}


contract SplitSwap is SplitResolver {

    function ethToDaiSwap(uint splitAmt, uint slippageAmt) public payable returns (uint destAmt) { // srcAmt = msg.value
        require(maxSplitAmtEth >= splitAmt, "split amt > max");
        destAmt = ethToDaiLoop(msg.value, splitAmt, 0);
        destAmt = wmul(destAmt, cut);
        require(destAmt > slippageAmt, "Dest Amt < slippage");
        require(TokenInterface(daiAddr).transfer(msg.sender, destAmt), "Not enough DAI to transfer");
        emit LogEthToDai(msg.value, destAmt);
    }

    function daiToEthSwap(uint srcAmt, uint splitAmt, uint slippageAmt) public returns (uint destAmt) {
        require(maxSplitAmtDai >= splitAmt, "split amt > max");
        require(TokenInterface(daiAddr).transferFrom(msg.sender, address(this), srcAmt), "Token Approved?");
        uint finalSrcAmt ;	//inject UNINIT LOCAL/STATE VAR

        destAmt = daiToEthLoop(finalSrcAmt, splitAmt, 0);
        require(destAmt > slippageAmt, "Dest Amt < slippage");
        msg.sender.transfer(destAmt);
        emit LogDaiToEth(finalSrcAmt, destAmt);
    }

}


contract InstaSwap is SplitSwap {

    constructor() public {
        setAllowance(TokenInterface(daiAddr), eth2daiAddr);
        setAllowance(TokenInterface(daiAddr), kyberAddr);
        setAllowance(TokenInterface(daiAddr), uniswapAddr);
        setAllowance(TokenInterface(wethAddr), eth2daiAddr);
        setAllowance(TokenInterface(wethAddr), wethAddr);
    }

    function() external payable {}

}