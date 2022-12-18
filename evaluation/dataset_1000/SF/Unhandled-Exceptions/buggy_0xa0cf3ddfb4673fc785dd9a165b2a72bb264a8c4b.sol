/**
 *Submitted for verification at Etherscan.io on 2020-03-02
*/

pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Context {
    constructor () internal { }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
}

contract ReentrancyGuard {
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  uint256 private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
}

contract Ownable is Context {
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  address private _owner;

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor () internal {
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), _owner);
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    function owner() public view returns (address) {
        return _owner;
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function isContract(address account) internal view returns (bool) {
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function toPayable(address account) internal pure returns (address payable) {
        return address(uint160(account));
    }
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }
    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface yERC20 {
  function deposit(uint256 _amount) external;
}

// Solidity Interface

interface ICurveFi {

  function add_liquidity(
    uint256[4] calldata amounts,
    uint256 min_mint_amount
  ) external;
  function remove_liquidity_imbalance(
    uint256[4] calldata amounts,
    uint256 max_burn_amount
  ) external;
}

contract yCurveZapIn is ReentrancyGuard, Ownable {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint256;

bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  address public DAI;
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  address public yDAI;
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  address public USDC;
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  address public yUSDC;
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address public USDT;
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  address public yUSDT;
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address public TUSD;
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  address public yTUSD;
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  address public SWAP;
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  address public CURVE;

  constructor () public {
    DAI = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    yDAI = address(0x16de59092dAE5CcF4A1E6439D611fd0653f0Bd01);

    USDC = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    yUSDC = address(0xd6aD7a6750A7593E092a9B218d66C0A814a3436e);

    USDT = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    yUSDT = address(0x83f798e925BcD4017Eb265844FDDAbb448f1707D);

    TUSD = address(0x0000000000085d4780B73119b644AE5ecd22b376);
    yTUSD = address(0x73a052500105205d34Daf004eAb301916DA8190f);

    SWAP = address(0x45F783CCE6B7FF23B2ab2D70e416cdb7D6055f51);
    CURVE = address(0xdF5e0e81Dff6FAF3A7e52BA697820c5e32D806A8);

    approveToken();
  }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

  function() external payable {

  }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

  function approveToken() public {
      IERC20(DAI).safeApprove(yDAI, uint(-1));
      IERC20(yDAI).safeApprove(SWAP, uint(-1));

      IERC20(USDC).safeApprove(yUSDC, uint(-1));
      IERC20(yUSDC).safeApprove(SWAP, uint(-1));

      IERC20(USDT).safeApprove(yUSDT, uint(0));
      IERC20(USDT).safeApprove(yUSDT, uint(-1));
      IERC20(yUSDT).safeApprove(SWAP, uint(-1));

      IERC20(TUSD).safeApprove(yTUSD, uint(-1));
      IERC20(yTUSD).safeApprove(SWAP, uint(-1));
  }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

  function depositDAI(uint256 _amount)
      external
      nonReentrant
  {
      require(_amount > 0, "deposit must be greater than 0");
      IERC20(DAI).safeTransferFrom(msg.sender, address(this), _amount);
      yERC20(yDAI).deposit(_amount);
      require(IERC20(DAI).balanceOf(address(this)) == 0, "token remainder");
      ICurveFi(SWAP).add_liquidity([IERC20(yDAI).balanceOf(address(this)),0,0,0],0);
      require(IERC20(yDAI).balanceOf(address(this)) == 0, "yToken remainder");
      uint256 received = IERC20(CURVE).balanceOf(address(this));
      uint256 fivePercent = _amount.mul(5).div(100);
      uint256 min = _amount.sub(fivePercent);
      uint256 max = _amount.add(fivePercent);
      require(received <= max && received >= min, "slippage greater than 5%");
      IERC20(CURVE).safeTransfer(msg.sender, IERC20(CURVE).balanceOf(address(this)));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
  }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

  function depositUSDC(uint256 _amount)
      external
      nonReentrant
  {
      require(_amount > 0, "deposit must be greater than 0");
      IERC20(USDC).safeTransferFrom(msg.sender, address(this), _amount);
      yERC20(yUSDC).deposit(_amount);
      require(IERC20(USDC).balanceOf(address(this)) == 0, "token remainder");
      ICurveFi(SWAP).add_liquidity([0,IERC20(yUSDC).balanceOf(address(this)),0,0],0);
      require(IERC20(yUSDC).balanceOf(address(this)) == 0, "yToken remainder");
      uint256 received = IERC20(CURVE).balanceOf(address(this));
      uint256 fivePercent = _amount.mul(5).div(100);
      uint256 min = _amount.sub(fivePercent);
      uint256 max = _amount.add(fivePercent);
      require(received <= max && received >= min, "slippage greater than 5%");
      IERC20(CURVE).safeTransfer(msg.sender, IERC20(CURVE).balanceOf(address(this)));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
  }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

  function depositUSDT(uint256 _amount)
      external
      nonReentrant
  {
      require(_amount > 0, "deposit must be greater than 0");
      IERC20(USDT).safeTransferFrom(msg.sender, address(this), _amount);
      yERC20(yUSDT).deposit(_amount);
      require(IERC20(USDT).balanceOf(address(this)) == 0, "token remainder");
      ICurveFi(SWAP).add_liquidity([0,0,IERC20(yUSDT).balanceOf(address(this)),0],0);
      require(IERC20(yUSDT).balanceOf(address(this)) == 0, "yToken remainder");
      uint256 received = IERC20(CURVE).balanceOf(address(this));
      uint256 fivePercent = _amount.mul(5).div(100);
      uint256 min = _amount.sub(fivePercent);
      uint256 max = _amount.add(fivePercent);
      require(received <= max && received >= min, "slippage greater than 5%");
      IERC20(CURVE).safeTransfer(msg.sender, IERC20(CURVE).balanceOf(address(this)));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
  }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

  function depositTUSD(uint256 _amount)
      external
      nonReentrant
  {
      require(_amount > 0, "deposit must be greater than 0");
      IERC20(TUSD).safeTransferFrom(msg.sender, address(this), _amount);
      yERC20(yTUSD).deposit(_amount);
      require(IERC20(TUSD).balanceOf(address(this)) == 0, "token remainder");
      ICurveFi(SWAP).add_liquidity([0,0,0,IERC20(yTUSD).balanceOf(address(this))],0);
      require(IERC20(yTUSD).balanceOf(address(this)) == 0, "yToken remainder");
      uint256 received = IERC20(CURVE).balanceOf(address(this));
      uint256 fivePercent = _amount.mul(5).div(100);
      uint256 min = _amount.sub(fivePercent);
      uint256 max = _amount.add(fivePercent);
      require(received <= max && received >= min, "slippage greater than 5%");
      IERC20(CURVE).safeTransfer(msg.sender, IERC20(CURVE).balanceOf(address(this)));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
  }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

  // incase of half-way error
  function inCaseTokenGetsStuck(IERC20 _TokenAddress) onlyOwner public {
      uint qty = _TokenAddress.balanceOf(address(this));
      _TokenAddress.safeTransfer(msg.sender, qty);
  }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

  // incase of half-way error
  function inCaseETHGetsStuck() onlyOwner public{
      (bool result, ) = msg.sender.call.value(address(this).balance)("");
      require(result, "transfer of ETH failed");
  }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
}