/**
 *Submitted for verification at Etherscan.io on 2020-07-11
*/

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;

contract TotlePrimary {
  function performSwapCollection(
    TotlePrimaryUtils.SwapCollection calldata swaps
  ) external payable {

  }
address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}
}

library TotlePrimaryUtils {
  struct Order {
    address payable exchangeHandler;
    bytes encodedPayload;
    uint256 minSourceAmount;
    uint256 maxSourceAmount;
  }

  struct Trade {
    address sourceToken;
    address destinationToken;
    uint256 amount;
    bool isSourceAmount; //true if amount is sourceToken, false if it's destinationToken
    Order[] orders;
  }

  struct Swap {
    Trade[] trades;
    uint256 minimumExchangeRate;
    uint256 minimumDestinationAmount;
    uint256 sourceAmount;
    uint256 tradeToTakeFeeFrom;
    bool takeFeeFromSource; //Takes the fee before the trade if true, takes it after if false
    address payable redirectAddress;
    bool required;
  }

  struct SwapCollection {
    Swap[] swaps;
    address payable partnerContract;
    uint256 expirationBlock;
    bytes32 id;
    uint256 maxGasPrice;
    uint8 v;
    bytes32 r;
    bytes32 s;
  }
}

contract DSMath {
    uint constant WAD = 10 ** 18;

    function add(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x, "math-not-safe");
    }
function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }
address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}

    function wmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), WAD / 2) / WAD;
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

    function wdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, WAD), y / 2) / y;
    }
address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 {
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );

uint256 bugv_tmstmp4 = block.timestamp;
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );

  function totalSupply() public view returns (uint256);
function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function balanceOf(address _who) public view returns (uint256);
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}

  function allowance(address _owner, address _spender) public view returns (uint256);
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}

  function transfer(address _to, uint256 _value) public returns (bool);
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

  function approve(address _spender, uint256 _value) public returns (bool);
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool);
address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}

  function decimals() public view returns (uint256);
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}

  //For WETH
  function deposit() external payable;
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  function withdraw(uint) external;
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}

interface DepositManagerInterface {
  function depositERC20ForUser(address _token, address _user, uint256 _amount) external;
  function depositEtherForUser(address _user) external payable;
}

interface RegistryInterface {
  function rootToChildToken(address rootToken) external returns (address childToken);
  function getWethTokenAddress() external view returns (address);
  function getDepositManagerAddress() external view returns (address);
}

contract Swapper {
  address public constant maticRegistry = 0x33a02E6cC863D393d6Bf231B697b82F6e499cA71;

  function swap(
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection calldata swapCollection
  ) external {
    primary.performSwapCollection.value(address(this).balance)(swapCollection);
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

  function fetchReturnData() internal pure returns (bool success) {
    assembly {
      switch returndatasize()
      case 0 {
        success := 1
      }
      case 32 {
        returndatacopy(0, 0, 32)
        success := mload(0)
      }
      default {
        revert(0, 0)
      }
    }
  }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}

  function getBalance(address token) public view returns (uint256) {
    return token == address(0)
      ? address(this).balance
      : ERC20(token).balanceOf(address(this));
  }

  function claim(address payable user, address token) public {
    claim(user, token, getBalance(token));
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

  function claim(address payable user, address token, uint amount) public {
    require(amount > 0, 'Claim amount must be positive');

    uint balance = getBalance(token);
    if (balance < amount) {
      amount = balance;
    }

    if (token == address(0)) {
      user.transfer(amount);
    } else {
      safeTransfer(token, user, amount);
    }
  }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}

  function depositMaticMax(address payable user, address token) public {
    depositMatic(user, token, getBalance(token));
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

  function depositMatic(address payable user, address token, uint amount) public {
    require(amount > 0, 'Deposit amount must be positive');
    RegistryInterface maticRegistryContract = RegistryInterface(maticRegistry);

    uint balance = getBalance(token);
    uint _amount = balance < amount ? balance : amount;
    address _token = token == address(0) ? maticRegistryContract.getWethTokenAddress() : token;
    address childToken = maticRegistryContract.rootToChildToken(_token);
    require(childToken != address(0), "Child token not registered");

    address maticDepositManager = maticRegistryContract.getDepositManagerAddress();
    if (token == address(0)) {
      ERC20(_token).deposit.value(_amount)();
      approve(_token, maticDepositManager);
      DepositManagerInterface(maticDepositManager).depositERC20ForUser(_token, user, _amount);
    } else {
      approve(_token, maticDepositManager);
      DepositManagerInterface(maticDepositManager).depositERC20ForUser(_token, user, _amount);
    }
  }

  function safeTransfer(address _tokenAddress, address _to, uint256 _value) internal returns (bool success) {
    (success,) = _tokenAddress.call(abi.encodeWithSignature("transfer(address,uint256)", _to, _value));
    require(success, "Transfer failed");

    return fetchReturnData();
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

  function approve(address token, address spender) public {
    safeApprove(token, spender, getBalance(token));
  }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function safeApprove(address _tokenAddress, address _spender, uint256 _value) internal returns (bool success) {
    (success,) = _tokenAddress.call(abi.encodeWithSignature("approve(address,uint256)", _spender, _value));
    require(success, "Approve failed");

    return fetchReturnData();
  }
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}

  function destroy(address payable user) external {
    selfdestruct(user);
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

  function() external payable {

  }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
}


contract SwapperFactory is DSMath {
  address public admin;
  address public swapperLibrary;
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
  uint public maxCommission;

uint256 bugv_tmstmp5 = block.timestamp;
  event SwapPerformed(
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

uint256 bugv_tmstmp2 = block.timestamp;
  event MaticSwapPerformed(
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

uint256 bugv_tmstmp3 = block.timestamp;
  event TransferPerformed(
    address indexed user,
    address token,
    string uniqueId
  );

uint256 bugv_tmstmp1 = block.timestamp;
  event MaticTransferPerformed(
    address indexed user,
    address token,
    string uniqueId
  );

  modifier onlyAdmin() {
    require(msg.sender == admin, 'Only the admin address can call this function.');
    _;
  }

  struct Commission {
    uint amount;
    address payable destination;
  }

  constructor(address _swapperLibrary) public {
    admin = msg.sender;
    swapperLibrary = _swapperLibrary;
    maxCommission = 5*10**16;
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

  function performSwap(
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public onlyAdmin() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');
    require(swapCollection.swaps[0].redirectAddress == user, 'User address does not match swap redirect address');

    Swapper swapper = createClone(user, srcToken, dstToken, uniqueId);
    takeCommission(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.getBalance(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.approve(srcToken, tokenTransferProxy);
    }

    swapper.swap(primary, swapCollection);
    swapper.destroy(user);

    emit SwapPerformed(user, srcToken, dstToken, uniqueId);
  }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

  function maticSwap(
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public onlyAdmin() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');

    Swapper swapper = createClone(user, srcToken, dstToken, uniqueId);
    require(
      swapCollection.swaps[0].redirectAddress == user ||
      swapCollection.swaps[0].redirectAddress == address(swapper),
      'User address does not match swap redirect address');
    takeCommission(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.getBalance(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.approve(srcToken, tokenTransferProxy);
    }

    swapper.swap(primary, swapCollection);
    swapper.depositMaticMax(user, dstToken);
    swapper.destroy(user);

    emit MaticSwapPerformed(user, srcToken, dstToken, uniqueId);
  }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function performTransfer(
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public onlyAdmin() {
    Swapper swapper = createClone(user, token, token, uniqueId);
    takeCommission(swapper, token, commission);
    swapper.claim(user, token);
    swapper.destroy(user);

    emit TransferPerformed(user, token, uniqueId);
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

  function maticTransfer(
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public onlyAdmin() {
    Swapper swapper = createClone(user, token, token, uniqueId);
    takeCommission(swapper, token, commission);
    swapper.depositMaticMax(user, token);
    swapper.destroy(user);

    emit MaticTransferPerformed(user, token, uniqueId);
  }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function takeCommission(
    Swapper swapper,
    address token,
    Commission[] memory commission
  ) internal onlyAdmin() {
    checkCommission(swapper, token, commission);
    for (uint i = 0; i < commission.length; i++) {
      require(swapper.getBalance(token) > commission[i].amount, 'Swapper balance not enough for commission');
      swapper.claim(commission[i].destination, token, commission[i].amount);
    }
  }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

  function checkCommission(
    Swapper swapper,
    address token,
    Commission[] memory commission
  ) internal view onlyAdmin() {
    uint _totalBal = swapper.getBalance(token);
    uint _commissionAmt;
    if(_totalBal == 0) return;
    for (uint i = 0; i < commission.length; i++) {
      _commissionAmt += commission[i].amount;
    }
    uint _maxCommissionAmt = wmul(_totalBal, maxCommission);
    require(_maxCommissionAmt >= _commissionAmt, "Over commission");
  }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

  function claimBalance(
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    address token
  ) public onlyAdmin() {
    Swapper swapper = createClone(user, srcToken, dstToken, uniqueId);
    swapper.claim(user, token);
    swapper.destroy(user);
  }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

  function createClone(
    address user,
    address srcToken,
    address dstToken,
    string memory uniqueId
  ) private onlyAdmin() returns (Swapper) {
    bytes32 salt = computeCloneSalt(user, srcToken, dstToken, uniqueId);
    bytes memory bytecode = getCloneBytecode();

    address payable cloneAddress = computeAddress(salt);
    if (!isContract(cloneAddress)) {
      assembly {
        cloneAddress := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
      }
    }

    return Swapper(cloneAddress);
  }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

  function getCloneBytecode() public view returns (bytes memory) {
    bytes20 targetBytes = bytes20(swapperLibrary);

    bytes memory bytecode = new bytes(0x37);
    assembly {
      mstore(add(bytecode, 0x20), 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
      mstore(add(bytecode, 0x34), targetBytes)
      mstore(add(bytecode, 0x48), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
    }

    return bytecode;
  }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function isContract(address _address) public view returns (bool) {
    uint32 size;
    assembly {
      size := extcodesize(_address)
    }
    return (size > 0);
  }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

  function computeCloneSalt(address user, address srcToken, address dstToken, string memory uniqueId) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(user, srcToken, dstToken, uniqueId));
  }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

  function computeAddress(bytes32 salt) public view returns (address payable) {
    bytes32 data = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(getCloneBytecode())));
    return address(bytes20(data << 96));
  }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}