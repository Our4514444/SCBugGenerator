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
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    uint constant WAD = 10 ** 18;
    uint constant RAY = 10 ** 27;

    function rmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), RAY / 2) / RAY;
    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function rdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, RAY), y / 2) / y;
    }
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}

    function wmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), WAD / 2) / WAD;
    }
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function wdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, WAD), y / 2) / y;
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}

}


contract Helper is DSMath {

  address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
  address public eth2daiAddr = 0x39755357759cE0d7f32dC8dC45414CCa409AE24e;
  address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
  address public uniswapAddr = 0x09cabEC1eAd1c0Ba254B09efb3EE13841712bE14; // Uniswap DAI exchange
  function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address public kyberAddr = 0x818E6FECD516Ecc3849DAf6845e3EC868087B755;
  address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
  address public ethAddr = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
  address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
  address public wethAddr = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
  address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
  address public daiAddr = 0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359;
  function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address public adminOne = 0xa7615CD307F323172331865181DC8b80a2834324;
  function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address public adminTwo = 0x7284a8451d9a0e7Dc62B3a71C0593eA2eC5c5638;
  function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint public maxSplitAmtEth = 50000000000000000000;
  address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
  uint public maxSplitAmtDai = 20000000000000000000000;
  function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint public cut = 997500000000000000; // 0.25% charge

    function setAllowance(TokenInterface _token, address _spender) internal {
        if (_token.allowance(address(this), _spender) != uint(-1)) {
            _token.approve(_spender, uint(-1));
        }
    }
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    modifier isAdmin {
        require(msg.sender == adminOne || msg.sender == adminTwo, "Not an Admin");
        _;
    }
uint256 bugv_tmstmp1 = block.timestamp;

}


contract AdminStuffs is Helper {

    function setSplitEth(uint amt) public isAdmin {
        maxSplitAmtEth = amt;
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    function setSplitDai(uint amt) public isAdmin {
        maxSplitAmtDai = amt;
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function withdrawToken(address token) public isAdmin {
        uint daiBal = TokenInterface(token).balanceOf(address(this));
        TokenInterface(token).transfer(msg.sender, daiBal);
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function withdrawEth() public payable isAdmin {
        msg.sender.transfer(address(this).balance);
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function changeFee(uint amt) public isAdmin {
        if (amt > 997000000000000000) {
            cut = 997000000000000000; // maximum fees can be 0.3%. Minimum 0%
        } else {
            cut = amt;
        }
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

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
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

    function getRateEth2Dai(address src, address dest, uint srcAmt) public view returns (uint destAmt) {
        if (src == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).getBuyAmount(dest, wethAddr, srcAmt);
        } else if (dest == ethAddr) {
            destAmt = Eth2DaiInterface(eth2daiAddr).getBuyAmount(wethAddr, src, srcAmt);
        }
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

    function getRateKyber(address src, address dest, uint srcAmt) public view returns (uint destAmt) {
        (uint kyberPrice,) = KyberInterface(kyberAddr).getExpectedRate(src, dest, srcAmt);
        destAmt = wmul(srcAmt, kyberPrice);
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    function getRateUniswap(address src, address dest, uint srcAmt) public view returns (uint destAmt) {
        if (src == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).getEthToTokenInputPrice(srcAmt);
        } else if (dest == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).getTokenToEthInputPrice(srcAmt);
        }
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

}


contract SplitResolver is SplitHelper {

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
            (uint bestExchange,) = getBest(ethAddr, daiAddr, srcAmt);
            destAmt = finalAmt;
            if (bestExchange == 0) {
                destAmt += swapEth2Dai(wethAddr, daiAddr, srcAmt);
            } else if (bestExchange == 1) {
                destAmt += swapKyber(ethAddr, daiAddr, srcAmt);
            } else {
                destAmt += swapUniswap(ethAddr, daiAddr, srcAmt);
            }
        } else {
            destAmt = finalAmt;
        }
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

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
            (uint bestExchange,) = getBest(daiAddr, ethAddr, srcAmt);
            destAmt = finalAmt;
            if (bestExchange == 0) {
                destAmt += swapEth2Dai(daiAddr, wethAddr, srcAmt);
            } else if (bestExchange == 1) {
                destAmt += swapKyber(daiAddr, ethAddr, srcAmt);
            } else {
                destAmt += swapUniswap(daiAddr, ethAddr, srcAmt);
            }
            TokenInterface wethContract = TokenInterface(wethAddr);
            uint balanceWeth = wethContract.balanceOf(address(this));
            wethContract.withdraw(balanceWeth);
        } else {
            TokenInterface wethContract = TokenInterface(wethAddr);
            uint balanceWeth = wethContract.balanceOf(address(this));
            wethContract.withdraw(balanceWeth);
            destAmt = finalAmt;
        }
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

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
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function swapKyber(address src, address dest, uint srcAmt) internal returns (uint destAmt) {
        destAmt = KyberInterface(kyberAddr).trade.value(srcAmt)(
                src,
                srcAmt,
                dest,
                address(this),
                2**255,
                0,
                adminOne
            );
    }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function swapUniswap(address src, address dest, uint srcAmt) internal returns (uint destAmt) {
        if (src == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).ethToTokenSwapInput.value(srcAmt)(uint(0), uint(1899063809));
        } else if (dest == ethAddr) {
            destAmt = UniswapExchange(uniswapAddr).tokenToEthSwapInput(srcAmt, uint(0), uint(1899063809));
        }
    }
uint256 bugv_tmstmp4 = block.timestamp;

}


contract SplitSwap is SplitResolver {

    function ethToDaiSwap(uint splitAmt, uint slippageAmt) public payable returns (uint destAmt) { // srcAmt = msg.value
        require(maxSplitAmtEth >= splitAmt, "split amt > max");
        destAmt = ethToDaiLoop(msg.value, splitAmt, 0);
        destAmt = wmul(destAmt, cut);
        require(destAmt > slippageAmt, "Dest Amt < slippage");
        require(TokenInterface(daiAddr).transfer(msg.sender, destAmt), "Not enough DAI to transfer");
    }
uint256 bugv_tmstmp5 = block.timestamp;

    function daiToEthSwap(uint srcAmt, uint splitAmt, uint slippageAmt) public payable returns (uint destAmt) {
        require(maxSplitAmtDai >= splitAmt, "split amt > max");
        require(TokenInterface(daiAddr).transferFrom(msg.sender, address(this), srcAmt), "Token Approved?");
        uint finalSrcAmt = wmul(srcAmt, cut);
        destAmt = daiToEthLoop(finalSrcAmt, splitAmt, 0);
        require(destAmt > slippageAmt, "Dest Amt < slippage");
        msg.sender.transfer(destAmt);
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
uint256 bugv_tmstmp2 = block.timestamp;

    function() external payable {}
uint256 bugv_tmstmp3 = block.timestamp;

}