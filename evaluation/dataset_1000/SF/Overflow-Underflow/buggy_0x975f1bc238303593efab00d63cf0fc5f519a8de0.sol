/**
 *Submitted for verification at Etherscan.io on 2020-02-16
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
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
}

contract ReentrancyGuard {
  mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }
  uint256 private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
    }
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }

    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
}

contract Ownable is Context {
  function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}
  address private _owner;

  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor () internal {
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), _owner);
    }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
    function owner() public view returns (address) {
        return _owner;
    }
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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

contract yCurveZap is ReentrancyGuard, Ownable {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint256;

mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }
  address public DAI;
mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  address public yDAI;
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address public USDC;
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address public yUSDC;
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}
  address public USDT;
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }
  address public yUSDT;
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }
  address public TUSD;
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  address public yTUSD;
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  address public SWAP;
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }
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
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}

  function() external payable {

  }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  function approveToken() public {
      IERC20(DAI).safeApprove(yDAI, uint(-1));
      IERC20(yDAI).safeApprove(SWAP, uint(-1));

      IERC20(USDC).safeApprove(yUSDC, uint(-1));
      IERC20(yUSDC).safeApprove(SWAP, uint(-1));

      IERC20(USDT).safeApprove(yUSDT, uint(-1));
      IERC20(yUSDT).safeApprove(SWAP, uint(-1));

      IERC20(TUSD).safeApprove(yTUSD, uint(-1));
      IERC20(yTUSD).safeApprove(SWAP, uint(-1));
  }
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
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
      IERC20(CURVE).safeTransfer(msg.sender, IERC20(CURVE).balanceOf(address(this)));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
  }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
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
      IERC20(CURVE).safeTransfer(msg.sender, IERC20(CURVE).balanceOf(address(this)));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
  }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
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
      IERC20(CURVE).safeTransfer(msg.sender, IERC20(CURVE).balanceOf(address(this)));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
  }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
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
      IERC20(CURVE).safeTransfer(msg.sender, IERC20(CURVE).balanceOf(address(this)));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
  }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  function withdrawDAI(uint256 _amount)
      external
      nonReentrant
  {
      require(_amount > 0, "deposit must be greater than 0");
      IERC20(CURVE).safeTransferFrom(msg.sender, address(this), _amount);
      ICurveFi(SWAP).remove_liquidity_imbalance([IERC20(CURVE).balanceOf(address(this)),0,0,0],uint256(-1));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
      IERC20(yDAI).safeTransfer(msg.sender, IERC20(yDAI).balanceOf(address(this)));
      require(IERC20(yDAI).balanceOf(address(this)) == 0, "yToken remainder");
  }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }

  function withdrawUSDC(uint256 _amount)
      external
      nonReentrant
  {
      require(_amount > 0, "deposit must be greater than 0");
      IERC20(CURVE).safeTransferFrom(msg.sender, address(this), _amount);
      ICurveFi(SWAP).remove_liquidity_imbalance([0,IERC20(CURVE).balanceOf(address(this)),0,0],uint256(-1));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
      IERC20(yUSDC).safeTransfer(msg.sender, IERC20(yUSDC).balanceOf(address(this)));
      require(IERC20(yUSDC).balanceOf(address(this)) == 0, "yToken remainder");
  }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  function withdrawUSDT(uint256 _amount)
      external
      nonReentrant
  {
      require(_amount > 0, "deposit must be greater than 0");
      IERC20(CURVE).safeTransferFrom(msg.sender, address(this), _amount);
      ICurveFi(SWAP).remove_liquidity_imbalance([0,0,IERC20(CURVE).balanceOf(address(this)),0],uint256(-1));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
      IERC20(yUSDT).safeTransfer(msg.sender, IERC20(yUSDT).balanceOf(address(this)));
      require(IERC20(yUSDT).balanceOf(address(this)) == 0, "yToken remainder");
  }
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }

  function withdrawTUSD(uint256 _amount)
      external
      nonReentrant
  {
      require(_amount > 0, "deposit must be greater than 0");
      IERC20(CURVE).safeTransferFrom(msg.sender, address(this), _amount);
      ICurveFi(SWAP).remove_liquidity_imbalance([0,0,0,IERC20(CURVE).balanceOf(address(this))],uint256(-1));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
      IERC20(yTUSD).safeTransfer(msg.sender, IERC20(yUSDT).balanceOf(address(this)));
      require(IERC20(yTUSD).balanceOf(address(this)) == 0, "yToken remainder");
  }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }

  // incase of half-way error
  function inCaseTokenGetsStuck(IERC20 _TokenAddress) onlyOwner public {
      uint qty = _TokenAddress.balanceOf(address(this));
      _TokenAddress.safeTransfer(msg.sender, qty);
  }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

  // incase of half-way error
  function inCaseETHGetsStuck() onlyOwner public{
      (bool result, ) = msg.sender.call.value(address(this).balance)("");
      require(result, "transfer of ETH failed");
  }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
}