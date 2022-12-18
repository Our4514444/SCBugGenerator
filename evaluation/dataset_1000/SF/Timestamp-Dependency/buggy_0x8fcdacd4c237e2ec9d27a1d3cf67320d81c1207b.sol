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
address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}
}

contract ReentrancyGuard {
  address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}
  uint256 private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
    }
function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
uint256 bugv_tmstmp2 = block.timestamp;
}

contract Ownable is Context {
  function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address private _owner;

  uint256 bugv_tmstmp1 = block.timestamp;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor () internal {
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), _owner);
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
    function owner() public view returns (address) {
        return _owner;
    }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }
uint256 bugv_tmstmp3 = block.timestamp;
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
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
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256[5] public decimals = [1,1e12,1e12,1,1];

  constructor () public {
    approveToken();
  }
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  function exchange(int128 i, int128 j, uint256 dx, uint256 min_dy) external nonReentrant {
    IERC20(get_address(i)).safeTransferFrom(msg.sender, address(this), dx);

    _exchange(i, j, dx, min_dy);

    address _j = get_address(j);
    uint256 _dy = IERC20(_j).balanceOf(address(this));
    require(_dy >= min_dy, "slippage");
    IERC20(_j).safeTransfer(msg.sender, _dy);
  }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
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
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
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
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
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
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}

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
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
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
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
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
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

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
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

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
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
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
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

  function _calc_to_dai(uint256[4] memory _amounts) public view returns (uint256) {
    uint256 _from_usdc = CurveFi(ySWAP).get_dy(1, 0, _amounts[1]);
    uint256 _from_usdt = CurveFi(ySWAP).get_dy(2, 0, _amounts[2]);
    uint256 _from_tusd = CurveFi(ySWAP).get_dy(3, 0, _amounts[3]);
    return _amounts[0].add(_from_usdc).add(_from_usdt).add(_from_tusd);
  }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  function _calc_to_usdc(uint256[4] memory _amounts) public view returns (uint256) {
    uint256 _from_dai = CurveFi(ySWAP).get_dy(0, 1, _amounts[0]);
    uint256 _from_usdt = CurveFi(ySWAP).get_dy(2, 1, _amounts[2]);
    uint256 _from_tusd = CurveFi(ySWAP).get_dy(3, 1, _amounts[3]);
    return _amounts[1].add(_from_dai).add(_from_usdt).add(_from_tusd);
  }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
  function _calc_to_usdt(uint256[4] memory _amounts) public view returns (uint256) {
    uint256 _from_dai = CurveFi(ySWAP).get_dy(0, 2, _amounts[0]);
    uint256 _from_usdc = CurveFi(ySWAP).get_dy(1, 2, _amounts[1]);
    uint256 _from_tusd = CurveFi(ySWAP).get_dy(3, 2, _amounts[3]);
    return _amounts[2].add(_from_dai).add(_from_usdc).add(_from_tusd);
  }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  function _calc_to_tusd(uint256[4] memory _amounts) public view returns (uint256) {
    uint256 _from_dai = CurveFi(ySWAP).get_dy(0, 3, _amounts[0]);
    uint256 _from_usdc = CurveFi(ySWAP).get_dy(1, 3, _amounts[1]);
    uint256 _from_usdt = CurveFi(ySWAP).get_dy(2, 3, _amounts[2]);
    return _amounts[3].add(_from_dai).add(_from_usdc).add(_from_usdt);
  }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
uint256 bugv_tmstmp4 = block.timestamp;

  // incase of half-way error
  function inCaseTokenGetsStuck(IERC20 _TokenAddress) onlyOwner public {
      uint qty = _TokenAddress.balanceOf(address(this));
      _TokenAddress.safeTransfer(msg.sender, qty);
  }
uint256 bugv_tmstmp5 = block.timestamp;
}