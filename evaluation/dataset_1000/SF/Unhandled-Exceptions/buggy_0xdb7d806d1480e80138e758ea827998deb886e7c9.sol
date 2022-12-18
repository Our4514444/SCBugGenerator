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
function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
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
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}

    function wmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), WAD / 2) / WAD;
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

    function wdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, WAD), y / 2) / y;
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 {
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );

function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );

  function totalSupply() public view returns (uint256);
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  function balanceOf(address _who) public view returns (uint256);
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

  function allowance(address _owner, address _spender) public view returns (uint256);
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}

  function transfer(address _to, uint256 _value) public returns (bool);
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

  function approve(address _spender, uint256 _value) public returns (bool);
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool);
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }

  function decimals() public view returns (uint256);
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }

  //For WETH
  function deposit() external payable;
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  function withdraw(uint) external;
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
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
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
  address public constant maticRegistry = 0x33a02E6cC863D393d6Bf231B697b82F6e499cA71;

  function swap(
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection calldata swapCollection
  ) external {
    primary.performSwapCollection.value(address(this).balance)(swapCollection);
  }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
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
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  function getBalance(address token) public view returns (uint256) {
    return token == address(0)
      ? address(this).balance
      : ERC20(token).balanceOf(address(this));
  }

  function claim(address payable user, address token) public {
    claim(user, token, getBalance(token));
  }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

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
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

  function depositMaticMax(address payable user, address token) public {
    depositMatic(user, token, getBalance(token));
  }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
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
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

  function approve(address token, address spender) public {
    safeApprove(token, spender, getBalance(token));
  }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

  function safeApprove(address _tokenAddress, address _spender, uint256 _value) internal returns (bool success) {
    (success,) = _tokenAddress.call(abi.encodeWithSignature("approve(address,uint256)", _spender, _value));
    require(success, "Approve failed");

    return fetchReturnData();
  }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

  function destroy(address payable user) external {
    selfdestruct(user);
  }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

  function() external payable {

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
}


contract SwapperFactory is DSMath {
function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  address public admin;
bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  address public swapperLibrary;
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint public maxCommission;

function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event SwapPerformed(
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event MaticSwapPerformed(
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event TransferPerformed(
    address indexed user,
    address token,
    string uniqueId
  );

function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
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
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
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
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

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
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
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
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

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
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
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
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

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
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

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
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

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
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

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
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

  function isContract(address _address) public view returns (bool) {
    uint32 size;
    assembly {
      size := extcodesize(_address)
    }
    return (size > 0);
  }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

  function computeCloneSalt(address user, address srcToken, address dstToken, string memory uniqueId) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(user, srcToken, dstToken, uniqueId));
  }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

  function computeAddress(bytes32 salt) public view returns (address payable) {
    bytes32 data = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(getCloneBytecode())));
    return address(bytes20(data << 96));
  }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
}