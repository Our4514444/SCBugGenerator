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
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    uint constant WAD = 10 ** 18;
    uint constant RAY = 10 ** 27;

    function rmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), RAY / 2) / RAY;
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

    function rdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, RAY), y / 2) / y;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    function wmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), WAD / 2) / WAD;
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

    function wdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, WAD), y / 2) / y;
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

}


contract Helper is DSMath {

  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  address public eth2daiAddr = 0x39755357759cE0d7f32dC8dC45414CCa409AE24e;
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  address public uniswapAddr = 0x09cabEC1eAd1c0Ba254B09efb3EE13841712bE14; // Uniswap DAI exchange
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  address public kyberAddr = 0x818E6FECD516Ecc3849DAf6845e3EC868087B755;
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  address public ethAddr = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  address public wethAddr = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  address public daiAddr = 0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359;
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  address public adminOne = 0xa7615CD307F323172331865181DC8b80a2834324;
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  address public adminTwo = 0x7284a8451d9a0e7Dc62B3a71C0593eA2eC5c5638;
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint public maxSplitAmtEth = 60000000000000000000;
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint public maxSplitAmtDai = 20000000000000000000000;
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  uint public cut = 997500000000000000; // 0.25% charge

    function setAllowance(TokenInterface _token, address _spender) internal {
        if (_token.allowance(address(this), _spender) != uint(-1)) {
            _token.approve(_spender, uint(-1));
        }
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
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
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function setSplitDai(uint amt) public isAdmin {
        maxSplitAmtDai = amt;
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function withdrawToken(address token) public isAdmin {
        uint daiBal = TokenInterface(token).balanceOf(address(this));
        TokenInterface(token).transfer(msg.sender, daiBal);
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    function withdrawEth() public payable isAdmin {
        msg.sender.transfer(address(this).balance);
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function changeFee(uint amt) public isAdmin {
        if (amt > 997000000000000000) {
            cut = 997000000000000000; // maximum fees can be 0.3%. Minimum 0%
        } else {
            cut = amt;
        }
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

}


contract SplitHelper is AdminStuffs {

    function getBest(address src, address dest, uint srcAmt) public view returns (uint bestExchange, uint destAmt) {
        uint finalSrcAmt = srcAmt;
        if (src == daiAddr) {
            finalSrcAmt = wmul(srcAmt, cut);
        }
        uint eth2DaiPrice = getRateEth2Dai(src, dest, finalSrcAmt);
        uint kyberPrice = getRateKyber(src, dest, finalSrcAmt);
        uint uniswapPrice = getRateUniswap(src, dest, finalSrcAmt);
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
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    function getRateEth2Dai(address src, address dest, uint srcAmt) internal view returns (uint destAmt) {
        if (src == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).getBuyAmount(dest, wethAddr, srcAmt);
        } else if (dest == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).getBuyAmount(wethAddr, src, srcAmt);
        }
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    function getRateKyber(address src, address dest, uint srcAmt) internal view returns (uint destAmt) {
        (uint kyberPrice,) = KyberInterface(kyberAddr).getExpectedRate(src, dest, srcAmt);
        destAmt = wmul(srcAmt, kyberPrice);
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function getRateUniswap(address src, address dest, uint srcAmt) internal view returns (uint destAmt) {
        if (src == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).getEthToTokenInputPrice(srcAmt);
        } else if (dest == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).getTokenToEthInputPrice(srcAmt);
        }
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

}


contract SplitResolver is SplitHelper {

  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event LogEthToDai(uint srcAmt, uint destAmt);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event LogDaiToEth(uint srcAmt, uint destAmt);

    function ethToDaiLoop(uint srcAmt, uint splitAmt, uint finalAmt) internal returns (uint destAmt) {
        if (srcAmt > splitAmt) {
            uint amtToSwap = splitAmt;
            uint nextSrcAmt = srcAmt - splitAmt;
            (uint bestExchange,) = getBest(ethAddr, daiAddr, amtToSwap);
            uint ethBought = finalAmt;
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
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function daiToEthLoop(uint srcAmt, uint splitAmt, uint finalAmt) internal returns (uint destAmt) {
        if (srcAmt > splitAmt) {
            uint amtToSwap = splitAmt;
            uint nextSrcAmt = srcAmt - splitAmt;
            (uint bestExchange,) = getBest(daiAddr, ethAddr, amtToSwap);
            uint ethBought = finalAmt;
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
            TokenInterface wethContract = TokenInterface(wethAddr);
            uint balanceWeth = wethContract.balanceOf(address(this));
            if (balanceWeth > 0) {
                wethContract.withdraw(balanceWeth);
            }
        } else {
            TokenInterface wethContract = TokenInterface(wethAddr);
            uint balanceWeth = wethContract.balanceOf(address(this));
            if (balanceWeth > 0) {
                wethContract.withdraw(balanceWeth);
            }
            destAmt = finalAmt;
        }
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
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
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    function swapKyber(address src, address dest, uint srcAmt) internal returns (uint destAmt) {
        uint ethAmt = src == ethAddr ? srcAmt : 0;
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
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
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
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    function daiToEthSwap(uint srcAmt, uint splitAmt, uint slippageAmt) public returns (uint destAmt) {
        require(maxSplitAmtDai >= splitAmt, "split amt > max");
        require(TokenInterface(daiAddr).transferFrom(msg.sender, address(this), srcAmt), "Token Approved?");
        uint finalSrcAmt = wmul(srcAmt, cut);
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
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

    function() external payable {}
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

}