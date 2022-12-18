/**
 *Submitted for verification at Etherscan.io on 2020-03-10
*/

pragma solidity ^0.5.0;

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
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
}

contract ReentrancyGuard {
  function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
  uint256 private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
    }
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}

    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
}

contract Ownable is Context {
  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  address private _owner;

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor () internal {
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), _owner);
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
    function owner() public view returns (address) {
        return _owner;
    }
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
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
  function withdraw(uint256 _amount) external;
  function getPricePerFullShare() external view returns (uint256);
}

// Solidity Interface

interface CurveFi {
  function exchange(
    int128 i,
    int128 j,
    uint256 dx,
    uint256 min_dy
  ) external;
  function get_dx_underlying(
    int128 i,
    int128 j,
    uint256 dy
  ) external view returns (uint256);
  function get_dy_underlying(
    int128 i,
    int128 j,
    uint256 dx
  ) external view returns (uint256);
  function get_dx(
    int128 i,
    int128 j,
    uint256 dy
  ) external view returns (uint256);
  function get_dy(
    int128 i,
    int128 j,
    uint256 dx
  ) external view returns (uint256);
  function get_virtual_price() external view returns (uint256);
}

interface yCurveFi {
  function add_liquidity(
    uint256[4] calldata amounts,
    uint256 min_mint_amount
  ) external;
  function remove_liquidity(
    uint256 _amount,
    uint256[4] calldata amounts
  ) external;
  function calc_token_amount(
    uint256[4] calldata amounts,
    bool deposit
  ) external view returns (uint256);
}

interface sCurveFi {
  function add_liquidity(
    uint256[2] calldata amounts,
    uint256 min_mint_amount
  ) external;
  function remove_liquidity(
    uint256 _amount,
    uint256[2] calldata amounts
  ) external;
  function calc_token_amount(
    uint256[2] calldata amounts,
    bool deposit
  ) external view returns (uint256);
}

contract yCurveExchange is ReentrancyGuard, Ownable {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint256;

  address public constant DAI = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);
  address public constant yDAI = address(0x16de59092dAE5CcF4A1E6439D611fd0653f0Bd01);
  address public constant USDC = address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
  address public constant yUSDC = address(0xd6aD7a6750A7593E092a9B218d66C0A814a3436e);
  address public constant USDT = address(0xdAC17F958D2ee523a2206206994597C13D831ec7);
  address public constant yUSDT = address(0x83f798e925BcD4017Eb265844FDDAbb448f1707D);
  address public constant TUSD = address(0x0000000000085d4780B73119b644AE5ecd22b376);
  address public constant yTUSD = address(0x73a052500105205d34Daf004eAb301916DA8190f);
  address public constant ySUSD = address(0xF61718057901F84C4eEC4339EF8f0D86D2B45600);
  address public constant SUSD = address(0x57Ab1ec28D129707052df4dF418D58a2D46d5f51);
  address public constant ySWAP = address(0x45F783CCE6B7FF23B2ab2D70e416cdb7D6055f51);
  address public constant yCURVE = address(0xdF5e0e81Dff6FAF3A7e52BA697820c5e32D806A8);
  address public constant sSWAP = address(0xeDf54bC005bc2Df0Cc6A675596e843D28b16A966);
  address public constant sCURVE = address(0x2b645a6A426f22fB7954dC15E583e3737B8d1434);
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint256[5] public decimals = [1,1e12,1e12,1,1];

  constructor () public {
    approveToken();
  }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

  function approveToken() public {
      IERC20(DAI).safeApprove(yDAI, uint(-1));
      IERC20(yDAI).safeApprove(ySWAP, uint(-1));

      IERC20(USDC).safeApprove(yUSDC, uint(-1));
      IERC20(yUSDC).safeApprove(ySWAP, uint(-1));

      IERC20(USDT).safeApprove(yUSDT, uint(-1));
      IERC20(yUSDT).safeApprove(ySWAP, uint(-1));

      IERC20(TUSD).safeApprove(yTUSD, uint(-1));
      IERC20(yTUSD).safeApprove(ySWAP, uint(-1));

      IERC20(SUSD).safeApprove(ySUSD, uint(-1));
      IERC20(ySUSD).safeApprove(sSWAP, uint(-1));

      IERC20(yCURVE).safeApprove(sSWAP, uint(-1));
  }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  // 0 = DAI, 1 = USDC, 2 = USDT, 3 = TUSD, 4 = SUSD
  function exchange_underlying(int128 i, int128 j, uint256 dx, uint256 min_dy) external nonReentrant {
    address _ui = get_address_underlying(i);
    IERC20(_ui).safeTransferFrom(msg.sender, address(this), dx);
    address _i = get_address(i);
    yERC20(_i).deposit(IERC20(_ui).balanceOf(address(this)));

    _exchange(i, j, dx, min_dy);

    address _j = get_address(j);
    yERC20(_j).withdraw(IERC20(_j).balanceOf(address(this)));
    address _uj = get_address_underlying(j);
    uint256 _dy = IERC20(_uj).balanceOf(address(this));
    require(_dy >= min_dy, "slippage");
    IERC20(_uj).safeTransfer(msg.sender, _dy);
  }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  function exchange(int128 i, int128 j, uint256 dx, uint256 min_dy) external nonReentrant {
    IERC20(get_address(i)).safeTransferFrom(msg.sender, address(this), dx);

    _exchange(i, j, dx, min_dy);

    address _j = get_address(j);
    uint256 _dy = IERC20(_j).balanceOf(address(this));
    require(_dy >= min_dy, "slippage");
    IERC20(_j).safeTransfer(msg.sender, _dy);
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
  // 0 = yDAI, 1 = yUSDC, 2 = yUSDT, 3 = yTUSD, 4 = ySUSD
  function _exchange(int128 i, int128 j, uint256 dx, uint256 min_dy) internal {
    if (i == 4) {
      CurveFi(sSWAP).exchange(0, 1, IERC20(get_address(i)).balanceOf(address(this)), 0);
      yCurveFi(ySWAP).remove_liquidity(IERC20(yCURVE).balanceOf(address(this)), [uint256(0),0,0,0]);
      _swap_to(j);
    } else if (j == 4) {
      uint256[4] memory amounts;
      amounts[uint256(i)] = IERC20(get_address(i)).balanceOf(address(this));
      yCurveFi(ySWAP).add_liquidity(amounts, 0);
      CurveFi(sSWAP).exchange(1, 0, IERC20(yCURVE).balanceOf(address(this)), min_dy);
    } else {
      CurveFi(ySWAP).exchange(i, j, dx, min_dy);
    }
  }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  function _swap_to(int128 j) internal {
    if (j == 0) {
      _swap_to_dai();
    } else if (j == 1) {
      _swap_to_usdc();
    } else if (j == 2) {
      _swap_to_usdt();
    } else if (j == 3) {
      _swap_to_tusd();
    }
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
  function _swap_to_dai() internal {
    uint256 _yusdc = IERC20(yUSDC).balanceOf(address(this));
    uint256 _yusdt = IERC20(yUSDT).balanceOf(address(this));
    uint256 _ytusd = IERC20(yTUSD).balanceOf(address(this));

    if (_yusdc > 0) {
      CurveFi(ySWAP).exchange(1, 0, _yusdc, 0);
    }
    if (_yusdt > 0) {
      CurveFi(ySWAP).exchange(2, 0, _yusdt, 0);
    }
    if (_ytusd > 0) {
      CurveFi(ySWAP).exchange(3, 0, _ytusd, 0);
    }
  }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  function _swap_to_usdc() internal {
    uint256 _ydai = IERC20(yDAI).balanceOf(address(this));
    uint256 _yusdt = IERC20(yUSDT).balanceOf(address(this));
    uint256 _ytusd = IERC20(yTUSD).balanceOf(address(this));

    if (_ydai > 0) {
      CurveFi(ySWAP).exchange(0, 1, _ydai, 0);
    }
    if (_yusdt > 0) {
      CurveFi(ySWAP).exchange(2, 1, _yusdt, 0);
    }
    if (_ytusd > 0) {
      CurveFi(ySWAP).exchange(3, 1, _ytusd, 0);
    }
  }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  function _swap_to_usdt() internal {
    uint256 _ydai = IERC20(yDAI).balanceOf(address(this));
    uint256 _yusdc = IERC20(yUSDC).balanceOf(address(this));
    uint256 _ytusd = IERC20(yTUSD).balanceOf(address(this));

    if (_ydai > 0) {
      CurveFi(ySWAP).exchange(0, 2, _ydai, 0);
    }
    if (_yusdc > 0) {
      CurveFi(ySWAP).exchange(1, 2, _yusdc, 0);
    }
    if (_ytusd > 0) {
      CurveFi(ySWAP).exchange(3, 2, _ytusd, 0);
    }
  }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  function _swap_to_tusd() internal {
    uint256 _ydai = IERC20(yDAI).balanceOf(address(this));
    uint256 _yusdc = IERC20(yUSDC).balanceOf(address(this));
    uint256 _yusdt = IERC20(yUSDT).balanceOf(address(this));

    if (_ydai > 0) {
      CurveFi(ySWAP).exchange(0, 3, _ydai, 0);
    }
    if (_yusdc > 0) {
      CurveFi(ySWAP).exchange(1, 3, _yusdc, 0);
    }
    if (_yusdt > 0) {
      CurveFi(ySWAP).exchange(2, 3, _yusdt, 0);
    }
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

  function get_address_underlying(int128 index) public pure returns (address) {
    if (index == 0) {
      return DAI;
    } else if (index == 1) {
      return USDC;
    } else if (index == 2) {
      return USDT;
    } else if (index == 3) {
      return TUSD;
    } else if (index == 4) {
      return SUSD;
    }
  }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  function get_address(int128 index) public pure returns (address) {
    if (index == 0) {
      return yDAI;
    } else if (index == 1) {
      return yUSDC;
    } else if (index == 2) {
      return yUSDT;
    } else if (index == 3) {
      return yTUSD;
    } else if (index == 4) {
      return ySUSD;
    }
  }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  function add_liquidity_underlying(uint256[5] calldata amounts, uint256 min_mint_amount) external nonReentrant {
    uint256[5] memory _amounts;
    if (amounts[0] > 0) {
      IERC20(DAI).safeTransferFrom(msg.sender, address(this), amounts[0]);
      yERC20(yDAI).deposit(IERC20(DAI).balanceOf(address(this)));
      _amounts[0] = IERC20(yDAI).balanceOf(address(this));
    }
    if (amounts[1] > 0) {
      IERC20(USDC).safeTransferFrom(msg.sender, address(this), amounts[1]);
      yERC20(yUSDC).deposit(IERC20(USDC).balanceOf(address(this)));
      _amounts[1] = IERC20(yUSDC).balanceOf(address(this));
    }
    if (amounts[2] > 0) {
      IERC20(USDT).safeTransferFrom(msg.sender, address(this), amounts[2]);
      yERC20(yUSDT).deposit(IERC20(USDT).balanceOf(address(this)));
      _amounts[2] = IERC20(yUSDT).balanceOf(address(this));
    }
    if (amounts[3] > 0) {
      IERC20(TUSD).safeTransferFrom(msg.sender, address(this), amounts[3]);
      yERC20(yTUSD).deposit(IERC20(TUSD).balanceOf(address(this)));
      _amounts[3] = IERC20(yTUSD).balanceOf(address(this));
    }
    if (amounts[4] > 0) {
      IERC20(SUSD).safeTransferFrom(msg.sender, address(this), amounts[4]);
      yERC20(ySUSD).deposit(IERC20(SUSD).balanceOf(address(this)));
      _amounts[4] = IERC20(ySUSD).balanceOf(address(this));
    }
    _add_liquidity(_amounts, min_mint_amount);
    IERC20(sCURVE).safeTransfer(msg.sender, IERC20(sCURVE).balanceOf(address(this)));
  }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  function add_liquidity(uint256[5] calldata amounts, uint256 min_mint_amount) external nonReentrant {
    if (amounts[0] > 0) {
      IERC20(yDAI).safeTransferFrom(msg.sender, address(this), amounts[0]);
    }
    if (amounts[1] > 0) {
      IERC20(yUSDC).safeTransferFrom(msg.sender, address(this), amounts[1]);
    }
    if (amounts[2] > 0) {
      IERC20(yUSDT).safeTransferFrom(msg.sender, address(this), amounts[2]);
    }
    if (amounts[3] > 0) {
      IERC20(yTUSD).safeTransferFrom(msg.sender, address(this), amounts[3]);
    }
    if (amounts[4] > 0) {
      IERC20(ySUSD).safeTransferFrom(msg.sender, address(this), amounts[4]);
    }
    _add_liquidity(amounts, min_mint_amount);
    IERC20(sCURVE).safeTransfer(msg.sender, IERC20(sCURVE).balanceOf(address(this)));
  }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
  function _add_liquidity(uint256[5] memory amounts, uint256 min_mint_amount) internal {
    uint256[4] memory _y;
    _y[0] = amounts[0];
    _y[1] = amounts[1];
    _y[2] = amounts[2];
    _y[3] = amounts[3];
    uint256[2] memory _s;
    _s[0] = amounts[4];

    yCurveFi(ySWAP).add_liquidity(_y, 0);
    _s[1] = IERC20(yCURVE).balanceOf(address(this));
    sCurveFi(sSWAP).add_liquidity(_s, min_mint_amount);
  }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  function remove_liquidity_underlying(uint256 _amount, uint256[5] calldata min_amounts) external nonReentrant {
    IERC20(sCURVE).safeTransferFrom(msg.sender, address(this), _amount);
    _remove_liquidity(min_amounts);
    uint256 _ydai = IERC20(yDAI).balanceOf(address(this));
    uint256 _yusdc = IERC20(yUSDC).balanceOf(address(this));
    uint256 _yusdt = IERC20(yUSDT).balanceOf(address(this));
    uint256 _ytusd = IERC20(yTUSD).balanceOf(address(this));
    uint256 _ysusd = IERC20(ySUSD).balanceOf(address(this));

    if (_ydai > 0) {
      yERC20(yDAI).withdraw(_ydai);
      IERC20(DAI).safeTransfer(msg.sender, IERC20(DAI).balanceOf(address(this)));
    }
    if (_yusdc > 0) {
      yERC20(yUSDC).withdraw(_yusdc);
      IERC20(USDC).safeTransfer(msg.sender, IERC20(USDC).balanceOf(address(this)));
    }
    if (_yusdt > 0) {
      yERC20(yUSDT).withdraw(_yusdt);
      IERC20(USDT).safeTransfer(msg.sender, IERC20(USDT).balanceOf(address(this)));
    }
    if (_ytusd > 0) {
      yERC20(yTUSD).withdraw(_ytusd);
      IERC20(TUSD).safeTransfer(msg.sender, IERC20(TUSD).balanceOf(address(this)));
    }
    if (_ysusd > 0) {
      yERC20(ySUSD).withdraw(_ysusd);
      IERC20(SUSD).safeTransfer(msg.sender, IERC20(SUSD).balanceOf(address(this)));
    }
  }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  function remove_liquidity_underlying_to(int128 j, uint256 _amount, uint256 _min_amount) external nonReentrant {
    IERC20(sCURVE).safeTransferFrom(msg.sender, address(this), _amount);
    _remove_liquidity([uint256(0),0,0,0,0]);
    _swap_to(j);
    yERC20(get_address(j)).withdraw(IERC20(j).balanceOf(address(this)));
    address _uj = get_address_underlying(j);
    uint256 _dy = IERC20(_uj).balanceOf(address(this));
    require(_dy >= _min_amount, "slippage");
    IERC20(_uj).safeTransfer(msg.sender, _dy);
  }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  function _remove_liquidity(uint256[5] memory min_amounts) internal {
    uint256[2] memory _s;
    _s[0] = min_amounts[4];
    sCurveFi(sSWAP).remove_liquidity(IERC20(sCURVE).balanceOf(address(this)), _s);
    uint256[4] memory _y;
    _y[0] = min_amounts[0];
    _y[1] = min_amounts[1];
    _y[2] = min_amounts[2];
    _y[3] = min_amounts[3];
    yCurveFi(ySWAP).remove_liquidity(IERC20(yCURVE).balanceOf(address(this)), _y);
  }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

  function get_dy_underlying(int128 i, int128 j, uint256 dx) external view returns (uint256) {
    if (i == 4) { // How much j (USDT) will I get, if I sell dx SUSD (i)
      uint256 _y = CurveFi(sSWAP).get_dy_underlying(0, 1, dx);
      return calc_withdraw_amount_y(_y, j);
      //return _y.mul(1e18).div(CurveFi(ySWAP).get_virtual_price()).div(decimals[uint256(j)]);
    } else if (j == 4) { // How much SUSD (j) will I get, if I sell dx USDT (i)
      uint256[4] memory _amounts;
      _amounts[uint256(i)] = dx;
      uint256 _y = yCurveFi(ySWAP).calc_token_amount(_amounts, true);
      return CurveFi(sSWAP).get_dy_underlying(1, 0, _y);
    } else {
      return CurveFi(ySWAP).get_dy_underlying(i, j, dx);
    }
  }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

  function calc_withdraw_amount_y(uint256 amount, int128 j) public view returns (uint256) {
    uint256 _ytotal = IERC20(yCURVE).totalSupply();

    uint256 _yDAI = IERC20(yDAI).balanceOf(ySWAP);
    uint256 _yUSDC = IERC20(yUSDC).balanceOf(ySWAP);
    uint256 _yUSDT = IERC20(yUSDT).balanceOf(ySWAP);
    uint256 _yTUSD = IERC20(yTUSD).balanceOf(ySWAP);

    uint256[4] memory _amounts;
    _amounts[0] = _yDAI.mul(amount).div(_ytotal);
    _amounts[1] = _yUSDC.mul(amount).div(_ytotal);
    _amounts[2] = _yUSDT.mul(amount).div(_ytotal);
    _amounts[3] = _yTUSD.mul(amount).div(_ytotal);

    return _calc_to(_amounts, j);
  }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  function _calc_to(uint256[4] memory _amounts, int128 j) public view returns (uint256) {
    if (j == 0) {
      return _calc_to_dai(_amounts);
    } else if (j == 1) {
      return _calc_to_usdc(_amounts);
    } else if (j == 2) {
      return _calc_to_usdt(_amounts);
    } else if (j == 3) {
      return _calc_to_tusd(_amounts);
    }
  }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

  function _calc_to_dai(uint256[4] memory _amounts) public view returns (uint256) {
    uint256 _from_usdc = CurveFi(ySWAP).get_dy(1, 0, _amounts[1]);
    uint256 _from_usdt = CurveFi(ySWAP).get_dy(2, 0, _amounts[2]);
    uint256 _from_tusd = CurveFi(ySWAP).get_dy(3, 0, _amounts[3]);
    return _amounts[0].add(_from_usdc).add(_from_usdt).add(_from_tusd);
  }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  function _calc_to_usdc(uint256[4] memory _amounts) public view returns (uint256) {
    uint256 _from_dai = CurveFi(ySWAP).get_dy(0, 1, _amounts[0]);
    uint256 _from_usdt = CurveFi(ySWAP).get_dy(2, 1, _amounts[2]);
    uint256 _from_tusd = CurveFi(ySWAP).get_dy(3, 1, _amounts[3]);
    return _amounts[1].add(_from_dai).add(_from_usdt).add(_from_tusd);
  }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  function _calc_to_usdt(uint256[4] memory _amounts) public view returns (uint256) {
    uint256 _from_dai = CurveFi(ySWAP).get_dy(0, 2, _amounts[0]);
    uint256 _from_usdc = CurveFi(ySWAP).get_dy(1, 2, _amounts[1]);
    uint256 _from_tusd = CurveFi(ySWAP).get_dy(3, 2, _amounts[3]);
    return _amounts[2].add(_from_dai).add(_from_usdc).add(_from_tusd);
  }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  function _calc_to_tusd(uint256[4] memory _amounts) public view returns (uint256) {
    uint256 _from_dai = CurveFi(ySWAP).get_dy(0, 3, _amounts[0]);
    uint256 _from_usdc = CurveFi(ySWAP).get_dy(1, 3, _amounts[1]);
    uint256 _from_usdt = CurveFi(ySWAP).get_dy(2, 3, _amounts[2]);
    return _amounts[3].add(_from_dai).add(_from_usdc).add(_from_usdt);
  }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

  function calc_withdraw_amount(uint256 amount) external view returns (uint256[5] memory) {
    uint256 _stotal = IERC20(sCURVE).totalSupply();
    uint256 _ytotal = IERC20(yCURVE).totalSupply();

    uint256 _ySUSD = IERC20(ySUSD).balanceOf(sSWAP);
    uint256 _yCURVE = IERC20(yCURVE).balanceOf(sSWAP);

    uint256 _yshares = _yCURVE.mul(amount).div(_stotal);

    uint256 _yDAI = IERC20(yDAI).balanceOf(ySWAP);
    uint256 _yUSDC = IERC20(yUSDC).balanceOf(ySWAP);
    uint256 _yUSDT = IERC20(yUSDT).balanceOf(ySWAP);
    uint256 _yTUSD = IERC20(yTUSD).balanceOf(ySWAP);

    uint256[5] memory _amounts;
    _amounts[0] = _yDAI.mul(yERC20(yDAI).getPricePerFullShare()).div(1e18);
    _amounts[1] = _yUSDC.mul(yERC20(yUSDC).getPricePerFullShare()).div(1e18);
    _amounts[2] = _yUSDT.mul(yERC20(yUSDT).getPricePerFullShare()).div(1e18);
    _amounts[3] = _yTUSD.mul(yERC20(yTUSD).getPricePerFullShare()).div(1e18);
    _amounts[4] = _ySUSD.mul(yERC20(ySUSD).getPricePerFullShare()).div(1e18);

    _amounts[0] = _amounts[0].mul(_yshares).div(_ytotal);
    _amounts[1] = _amounts[1].mul(_yshares).div(_ytotal);
    _amounts[2] = _amounts[2].mul(_yshares).div(_ytotal);
    _amounts[3] = _amounts[3].mul(_yshares).div(_ytotal);
    _amounts[4] = _amounts[4].mul(amount).div(_stotal);

    return _amounts;
  }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

  function calc_deposit_amount(uint256[5] calldata amounts) external view returns (uint256) {
    uint256[4] memory _y;
    _y[0] = amounts[0];
    _y[1] = amounts[1];
    _y[2] = amounts[2];
    _y[3] = amounts[3];
    uint256 _y_output = yCurveFi(ySWAP).calc_token_amount(_y, true);
    uint256[2] memory _s;
    _s[0] = amounts[4];
    _s[1] = _y_output;
    return sCurveFi(sSWAP).calc_token_amount(_s, true);
  }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

  // incase of half-way error
  function inCaseTokenGetsStuck(IERC20 _TokenAddress) onlyOwner public {
      uint qty = _TokenAddress.balanceOf(address(this));
      _TokenAddress.safeTransfer(msg.sender, qty);
  }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
}