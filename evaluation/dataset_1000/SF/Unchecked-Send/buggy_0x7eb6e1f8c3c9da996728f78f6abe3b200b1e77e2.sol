/**
 *Submitted for verification at Etherscan.io on 2020-02-12
*/

/**
 *Submitted for verification at Etherscan.io on 2019-06-19
*/

pragma solidity ^0.5.0;


interface ERC20 {
    function totalSupply() external view returns (uint supply);
    function balanceOf(address _owner) external view returns (uint balance);
    function transfer(address _to, uint _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint _value) external returns (bool success);
    function approve(address _spender, uint _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint remaining);
    function decimals() external view returns(uint digits);
    function allocateTo(address recipient, uint256 value) external;
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}


contract KyberNetworkProxyInterface {
    function maxGasPrice() external view returns(uint);
    function getUserCapInWei(address user) external view returns(uint);
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
    function getUserCapInTokenWei(address user, ERC20 token) external view returns(uint);
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
    function enabled() external view returns(bool);
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
    function info(bytes32 id) external view returns(uint);
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function getExpectedRate(ERC20 src, ERC20 dest, uint srcQty) public
        returns (uint expectedRate, uint slippageRate);
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

    function tradeWithHint(ERC20 src, uint srcAmount, ERC20 dest, address destAddress, uint maxDestAmount,
        uint minConversionRate, address walletId, bytes memory hint) public payable returns(uint);
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function trade(ERC20 src, uint srcAmount, ERC20 dest, address destAddress, uint maxDestAmount,
        uint minConversionRate, address walletId) public payable returns(uint);
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}

    function swapEtherToToken(ERC20 token, uint minConversionRate) external payable returns(uint);
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
    function swapTokenToEther(ERC20 token, uint tokenQty, uint minRate) external payable returns(uint);
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    function swapTokenToToken(ERC20 src, uint srcAmount, ERC20 dest, uint minConversionRate) public returns(uint);
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
}

interface ExchangeInterface {
    function swapEtherToToken (uint _ethAmount, address _tokenAddress, uint _maxAmount) payable external returns(uint, uint);
    function swapTokenToEther (address _tokenAddress, uint _amount, uint _maxAmount) external returns(uint);

    function getExpectedRate(address src, address dest, uint srcQty) external
        returns (uint expectedRate, uint slippageRate);
}

contract Eth2DaiInterface {
    function getBuyAmount(ERC20 tokenToBuy, ERC20 tokenToPay, uint256 amountToPay) external view returns(uint256 amountBought);
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
	function getPayAmount(ERC20 tokenToPay, ERC20 tokenToBuy, uint amountToBuy) public view returns (uint amountPaid);
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

	function sellAllAmount(ERC20 pay_gem, uint pay_amt, ERC20 buy_gem, uint min_fill_amount) public returns (uint fill_amt);
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
	function buyAllAmount(ERC20 buy_gem, uint buy_amt, ERC20 pay_gem, uint max_fill_amount) public returns (uint fill_amt);
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
}

contract TokenInterface {
    function allowance(address, address) public returns (uint);
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address) public returns (uint);
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address, uint) public;
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address, uint) public returns (bool);
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address, address, uint) public returns (bool);
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    function deposit() public payable;
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function withdraw(uint) public;
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
}

contract DSMath {
    function add(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function min(uint x, uint y) internal pure returns (uint z) {
        return x <= y ? x : y;
    }
    function max(uint x, uint y) internal pure returns (uint z) {
        return x >= y ? x : y;
    }
    function imin(int x, int y) internal pure returns (int z) {
        return x <= y ? x : y;
    }
    function imax(int x, int y) internal pure returns (int z) {
        return x >= y ? x : y;
    }

    uint constant WAD = 10 ** 18;
    uint constant RAY = 10 ** 27;

    function wmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), WAD / 2) / WAD;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    function rmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), RAY / 2) / RAY;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    function wdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, WAD), y / 2) / y;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    function rdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, RAY), y / 2) / y;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    // This famous algorithm is called "exponentiation by squaring"
    // and calculates x^n with x as fixed-point and n as regular unsigned.
    //
    // It's O(log n), instead of O(n) for naive repeated multiplication.
    //
    // These facts are why it works:
    //
    //  If n is even, then x^n = (x^2)^(n/2).
    //  If n is odd,  then x^n = x * x^(n-1),
    //   and applying the equation for even x gives
    //    x^n = x * (x^2)^((n-1) / 2).
    //
    //  Also, EVM division is flooring and
    //    floor[(n-1) / 2] = floor[n / 2].
    //
    function rpow(uint x, uint n) internal pure returns (uint z) {
        z = n % 2 != 0 ? x : RAY;

        for (n /= 2; n != 0; n /= 2) {
            x = rmul(x, x);

            if (n % 2 != 0) {
                z = rmul(z, x);
            }
        }
    }
}

contract Eth2DaiWrapper is ExchangeInterface, DSMath {

    address public constant KYBER_ETH_ADDRESS = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    // Kovan
    // address public constant OTC_ADDRESS = 0x4A6bC4e803c62081ffEbCc8d227B5a87a58f1F8F;
    // address public constant WETH_ADDRESS = 0xd0A1E359811322d97991E03f863a0C30C2cF029C;
    
    // Mainnet
    address public constant OTC_ADDRESS = 0x794e6e91555438aFc3ccF1c5076A74F42133d08D;
    address public constant WETH_ADDRESS = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function swapEtherToToken (uint _ethAmount, address _tokenAddress, uint _maxAmount) external payable returns(uint, uint) {
        require(ERC20(WETH_ADDRESS).approve(OTC_ADDRESS, _ethAmount));
        TokenInterface(WETH_ADDRESS).deposit.value(_ethAmount)();

        uint daiBought = Eth2DaiInterface(OTC_ADDRESS).sellAllAmount(ERC20(WETH_ADDRESS), _ethAmount,
                 ERC20(_tokenAddress), 0);

        ERC20(_tokenAddress).transfer(msg.sender, daiBought);

        return (daiBought, 0);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    function swapTokenToEther (address _tokenAddress, uint _amount, uint _maxAmount) external returns(uint) {
        require(ERC20(_tokenAddress).approve(OTC_ADDRESS, _amount));

        uint ethBought = Eth2DaiInterface(OTC_ADDRESS).sellAllAmount(ERC20(_tokenAddress), _amount,
         ERC20(WETH_ADDRESS), 0);

        TokenInterface(WETH_ADDRESS).withdraw(ethBought);

        msg.sender.transfer(ethBought);

        return ethBought;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    function getExpectedRate(address _src, address _dest, uint _srcQty) public returns (uint, uint) {
        if(_src == KYBER_ETH_ADDRESS) {
            return (wdiv(Eth2DaiInterface(OTC_ADDRESS).getBuyAmount(ERC20(_dest), ERC20(WETH_ADDRESS), _srcQty), _srcQty), 0);
        } else if (_dest == KYBER_ETH_ADDRESS) {
            return (wdiv(Eth2DaiInterface(OTC_ADDRESS).getBuyAmount(ERC20(WETH_ADDRESS), ERC20(_src), _srcQty), _srcQty), 0);
        }
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

    function() payable external {
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}