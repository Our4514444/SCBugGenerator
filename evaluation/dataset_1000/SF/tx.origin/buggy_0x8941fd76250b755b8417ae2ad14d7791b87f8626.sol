/**
 *Submitted for verification at Etherscan.io on 2020-09-15
*/

pragma solidity ^0.5.17;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

library SafeMath {
    function add(uint a, uint b) internal pure returns (uint) {
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function sub(uint a, uint b) internal pure returns (uint) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    function sub(uint a, uint b, string memory errorMessage) internal pure returns (uint) {
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function mul(uint a, uint b) internal pure returns (uint) {
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function div(uint a, uint b) internal pure returns (uint) {
        return div(a, b, "SafeMath: division by zero");
    }
    function div(uint a, uint b, string memory errorMessage) internal pure returns (uint) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

interface UniswapRouter {
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
    function factory() external view returns (address);
}

interface UniswapFactory {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

interface StableCreditProtocol {
    function utilization(address token) external view returns (uint);
    function BASE() external view returns (uint);
    function MAX() external view returns (uint);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function balances(address owner, address token) external view returns (uint);
    function credit(address owner, address token) external view returns (uint);
}

contract StableCreditHelper {
    using SafeMath for uint;
    
    UniswapRouter public constant UNI = UniswapRouter(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    StableCreditProtocol public constant STABLE = StableCreditProtocol(0x20D5BFBa0f5c726AAd09956FD7398Acdac048858);
    
    constructor () public {}
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
    
    // How much system liquidity is provided by this asset
    function _utilization(address token, uint amount) internal view returns (uint) {
        uint _max = STABLE.MAX();
        uint _base = STABLE.BASE();
        address _pair = UniswapFactory(UNI.factory()).getPair(token, address(STABLE));
        uint _ratio = _base.sub(_base.mul(STABLE.balanceOf(_pair).add(amount)).div(STABLE.totalSupply()));
        if (_ratio == 0) {
            return _max;
        }
        return  _ratio > _max ? _max : _ratio;
    }
    function calculateCollateral(address token) external view returns (uint) {
        return calculateWithdraw(token, uint(-1));
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
    function calculateCollateralOf(address owner, address token) external view returns (uint) {
        return calculateWithdrawOf(owner, token, uint(-1));
    }
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
    function calculateWithdrawMax(address token) external view returns (uint) {
        return calculateWithdraw(token, STABLE.balanceOf(msg.sender));
    }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
    function calculateWithdrawMaxOf(address owner, address token) external view returns (uint) {
        return calculateWithdrawOf(owner, token, STABLE.balanceOf(msg.sender));
    }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
    function calculateWithdraw(address token, uint amount) public view returns (uint) {
        return calculateWithdrawOf(msg.sender, token, amount);
    }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
    function credit(address owner, address token) external view returns (uint) {
        return STABLE.credit(owner, token);
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
    function calculateWithdrawOf(address owner, address token, uint amount) public view returns (uint output) {
        address _pair = UniswapFactory(UNI.factory()).getPair(token, address(STABLE));
        uint _supply = IERC20(_pair).totalSupply();
        uint _balance = IERC20(token).balanceOf(_pair);
        uint _share = STABLE.balances(owner, token);
        output = _balance.mul(_share).div(_supply);
        
        uint _credit = STABLE.credit(owner, token);
        if (_credit < amount) {
            amount = _credit;
        }
        output = output.mul(amount).div(_credit);
    }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
    // Calculate maxium amount of credit a depositer will get for their token
    function calculateCreditMax(address token) external view returns (uint) {
        return calculateCreditMaxOf(msg.sender, token);
    }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
    function calculateCreditMaxOf(address owner, address token) public view returns (uint) {
        return calculateCredit(token, IERC20(token).balanceOf(owner));
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
    function calculateCredit(address token, uint amount) public view returns (uint) {
        return amount.mul(_utilization(token, amount)).div(STABLE.BASE());
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    // Calculate how much USD required to borrow exact amount of output token
    function calculateBorrowExactOut(address token, uint outExact) external view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = address(STABLE);
        _path[1] = token;
        return UNI.getAmountsIn(outExact, _path)[0];
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
    // Calculate maximum amount of output token given amount of USD owner by owner
    function calculateBorrowMax(address token) external view returns (uint) {
        return calculateBorrowMaxOf(msg.sender, token);
    }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
    function calculateBorrowMaxOf(address owner, address token) public view returns (uint) {
        return calculateBorrowExactIn(token, STABLE.balanceOf(owner));
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    // Calculate amount of token received given exact amount of USD input
    function calculateBorrowExactIn(address token, uint inExact) public view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = address(STABLE);
        _path[1] = token;
        return UNI.getAmountsOut(inExact, _path)[1];
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
    // Calculate amount of USD required to repay exact amount of token
    function calculateRepayExactOut(address token, uint outExact) external view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = token;
        _path[1] = address(STABLE);
        return UNI.getAmountsIn(outExact, _path)[0];
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
    // calculate maximum amount of token repaid given USD input
    function calculateRepayMax(address token) external view returns (uint) {
        return calculateRepayMaxOf(msg.sender, token);
    }
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
    
    function calculateRepayMaxOf(address owner, address token) public view returns (uint) {
        return calculateRepayExactIn(token, IERC20(token).balanceOf(owner));
    }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
    
    // Calculate amount of token repaid given exact amount of USD input
    function calculateRepayExactIn(address token, uint inExact) public view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = token;
        _path[1] = address(STABLE);
        return UNI.getAmountsOut(inExact, _path)[1];
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}