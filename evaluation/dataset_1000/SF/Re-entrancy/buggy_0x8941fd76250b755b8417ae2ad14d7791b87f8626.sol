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
mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
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
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
    }
    function calculateCollateralOf(address owner, address token) external view returns (uint) {
        return calculateWithdrawOf(owner, token, uint(-1));
    }
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
    function calculateWithdrawMax(address token) external view returns (uint) {
        return calculateWithdraw(token, STABLE.balanceOf(msg.sender));
    }
mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }
    function calculateWithdrawMaxOf(address owner, address token) external view returns (uint) {
        return calculateWithdrawOf(owner, token, STABLE.balanceOf(msg.sender));
    }
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }
    function calculateWithdraw(address token, uint amount) public view returns (uint) {
        return calculateWithdrawOf(msg.sender, token, amount);
    }
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }
    function credit(address owner, address token) external view returns (uint) {
        return STABLE.credit(owner, token);
    }
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
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
bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
    // Calculate maxium amount of credit a depositer will get for their token
    function calculateCreditMax(address token) external view returns (uint) {
        return calculateCreditMaxOf(msg.sender, token);
    }
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }
    function calculateCreditMaxOf(address owner, address token) public view returns (uint) {
        return calculateCredit(token, IERC20(token).balanceOf(owner));
    }
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
    function calculateCredit(address token, uint amount) public view returns (uint) {
        return amount.mul(_utilization(token, amount)).div(STABLE.BASE());
    }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
    // Calculate how much USD required to borrow exact amount of output token
    function calculateBorrowExactOut(address token, uint outExact) external view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = address(STABLE);
        _path[1] = token;
        return UNI.getAmountsIn(outExact, _path)[0];
    }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }
    // Calculate maximum amount of output token given amount of USD owner by owner
    function calculateBorrowMax(address token) external view returns (uint) {
        return calculateBorrowMaxOf(msg.sender, token);
    }
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
    function calculateBorrowMaxOf(address owner, address token) public view returns (uint) {
        return calculateBorrowExactIn(token, STABLE.balanceOf(owner));
    }
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
    // Calculate amount of token received given exact amount of USD input
    function calculateBorrowExactIn(address token, uint inExact) public view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = address(STABLE);
        _path[1] = token;
        return UNI.getAmountsOut(inExact, _path)[1];
    }
address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
    // Calculate amount of USD required to repay exact amount of token
    function calculateRepayExactOut(address token, uint outExact) external view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = token;
        _path[1] = address(STABLE);
        return UNI.getAmountsIn(outExact, _path)[0];
    }
mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
    // calculate maximum amount of token repaid given USD input
    function calculateRepayMax(address token) external view returns (uint) {
        return calculateRepayMaxOf(msg.sender, token);
    }
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
    
    function calculateRepayMaxOf(address owner, address token) public view returns (uint) {
        return calculateRepayExactIn(token, IERC20(token).balanceOf(owner));
    }
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
    
    // Calculate amount of token repaid given exact amount of USD input
    function calculateRepayExactIn(address token, uint inExact) public view returns (uint) {
        address[] memory _path = new address[](2);
        _path[0] = token;
        _path[1] = address(STABLE);
        return UNI.getAmountsOut(inExact, _path)[1];
    }
bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
}