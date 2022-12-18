/**
 *Submitted for verification at Etherscan.io on 2020-09-14
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
    StableCreditProtocol public constant STABLE = StableCreditProtocol(0xB5a137bb2ab7e317756C399Fd94CA215CeCE81D6);
    
    constructor () public {}
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
    function calculateCollateralOf(address owner, address token) external view returns (uint) {
        return calculateWithdrawOf(owner, token, uint(-1));
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function calculateWithdrawMax(address token) external view returns (uint) {
        return calculateWithdraw(token, STABLE.balanceOf(msg.sender));
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
    function calculateWithdrawMaxOf(address owner, address token) external view returns (uint) {
        return calculateWithdrawOf(owner, token, STABLE.balanceOf(msg.sender));
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function calculateWithdraw(address token, uint amount) public view returns (uint) {
        return calculateWithdrawOf(msg.sender, token, amount);
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
    function credit(address owner, address token) external view returns (uint) {
        return STABLE.credit(owner, token);
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
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
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
    // Calculate maxium amount of credit a depositer will get for their token
    function calculateCreditMax(address token) external view returns (uint) {
        return calculateCreditMaxOf(msg.sender, token);
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
    function calculateCreditMaxOf(address owner, address token) public view returns (uint) {
        return calculateCredit(token, IERC20(token).balanceOf(owner));
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function calculateCredit(address token, uint amount) public view returns (uint) {
        return amount.mul(_utilization(token, amount)).div(STABLE.BASE());
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
    // Calculate how much USD required to borrow exact amount of output token
    function calculateBorrowExactOut(address token, uint outExact) external view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = address(STABLE);
        _path[1] = token;
        return UNI.getAmountsIn(outExact, _path)[0];
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
    // Calculate maximum amount of output token given amount of USD owner by owner
    function calculateBorrowMax(address token) external view returns (uint) {
        return calculateBorrowMaxOf(msg.sender, token);
    }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function calculateBorrowMaxOf(address owner, address token) public view returns (uint) {
        return calculateBorrowExactIn(token, STABLE.balanceOf(owner));
    }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    // Calculate amount of token received given exact amount of USD input
    function calculateBorrowExactIn(address token, uint inExact) public view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = address(STABLE);
        _path[1] = token;
        return UNI.getAmountsOut(inExact, _path)[1];
    }
uint256 bugv_tmstmp4 = block.timestamp;
    // Calculate amount of USD required to repay exact amount of token
    function calculateRepayExactOut(address token, uint outExact) external view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = token;
        _path[1] = address(STABLE);
        return UNI.getAmountsIn(outExact, _path)[0];
    }
uint256 bugv_tmstmp5 = block.timestamp;
    // calculate maximum amount of token repaid given USD input
    function calculateRepayMax(address token) external view returns (uint) {
        return calculateRepayMaxOf(msg.sender, token);
    }
uint256 bugv_tmstmp2 = block.timestamp;
    
    function calculateRepayMaxOf(address owner, address token) public view returns (uint) {
        return calculateRepayExactIn(token, IERC20(token).balanceOf(owner));
    }
uint256 bugv_tmstmp3 = block.timestamp;
    
    // Calculate amount of token repaid given exact amount of USD input
    function calculateRepayExactIn(address token, uint inExact) public view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = token;
        _path[1] = address(STABLE);
        return UNI.getAmountsOut(inExact, _path)[1];
    }
uint256 bugv_tmstmp1 = block.timestamp;
}