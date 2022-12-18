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
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
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

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
}

contract ReentrancyGuard {
  address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
  uint256 private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
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

    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
uint256 bugv_tmstmp2 = block.timestamp;
}

contract Ownable is Context {
  address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
  address private _owner;

  uint256 bugv_tmstmp1 = block.timestamp;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor () internal {
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), _owner);
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
    function owner() public view returns (address) {
        return _owner;
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }
uint256 bugv_tmstmp3 = block.timestamp;
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
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
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
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

address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
  address public DAI;
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address public yDAI;
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address public USDC;
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address public yUSDC;
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
  address public USDT;
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address public yUSDT;
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
  address public TUSD;
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address public yTUSD;
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address public SWAP;
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

  function() external payable {

  }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

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
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

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
      uint256 min = (_amount.sub(fivePercent)).mul(1e12);
      uint256 max = (_amount.add(fivePercent)).mul(1e12);
      require(received <= max && received >= min, "slippage greater than 5%");

      IERC20(CURVE).safeTransfer(msg.sender, IERC20(CURVE).balanceOf(address(this)));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
  }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

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
      uint256 min = (_amount.sub(fivePercent)).mul(1e12);
      uint256 max = (_amount.add(fivePercent)).mul(1e12);
      require(received <= max && received >= min, "slippage greater than 5%");

      IERC20(CURVE).safeTransfer(msg.sender, IERC20(CURVE).balanceOf(address(this)));
      require(IERC20(CURVE).balanceOf(address(this)) == 0, "CURVE remainder");
  }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  // incase of half-way error
  function inCaseTokenGetsStuck(IERC20 _TokenAddress) onlyOwner public {
      uint qty = _TokenAddress.balanceOf(address(this));
      _TokenAddress.safeTransfer(msg.sender, qty);
  }
uint256 bugv_tmstmp4 = block.timestamp;

  // incase of half-way error
  function inCaseETHGetsStuck() onlyOwner public{
      (bool result, ) = msg.sender.call.value(address(this).balance)("");
      require(result, "transfer of ETH failed");
  }
uint256 bugv_tmstmp5 = block.timestamp;
}