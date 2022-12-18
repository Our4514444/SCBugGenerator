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

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }
bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }
bool not_called_re_ent6 = true;
function bug_re_ent6() public{
        require(not_called_re_ent6);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent6 = false;
    }

    function wmul(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, y), WAD / 2) / WAD;
    }
uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }

    function wdiv(uint x, uint y) internal pure returns (uint z) {
        z = add(mul(x, WAD), y / 2) / y;
    }
mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   //bug
        redeemableEther_re_ent4[msg.sender] = 0;
    }
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 {
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );

address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );

  function totalSupply() public view returns (uint256);
mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }

  function balanceOf(address _who) public view returns (uint256);
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }

  function allowance(address _owner, address _spender) public view returns (uint256);
mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   //bug
        redeemableEther_re_ent18[msg.sender] = 0;
    }

  function transfer(address _to, uint256 _value) public returns (bool);
mapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }

  function approve(address _spender, uint256 _value) public returns (bool);
address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool);
mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }

  function decimals() public view returns (uint256);
bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }

  //For WETH
  function deposit() external payable;
bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }
  function withdraw(uint) external;
address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
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
uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
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
mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }

  function getBalance(address token) public view returns (uint256) {
    return token == address(0)
      ? address(this).balance
      : ERC20(token).balanceOf(address(this));
  }

  function claim(address payable user, address token) public {
    claim(user, token, getBalance(token));
  }
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
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
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }

  function depositMaticMax(address payable user, address token) public {
    depositMatic(user, token, getBalance(token));
  }
mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
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
uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }

  function approve(address token, address spender) public {
    safeApprove(token, spender, getBalance(token));
  }
mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }

  function safeApprove(address _tokenAddress, address _spender, uint256 _value) internal returns (bool success) {
    (success,) = _tokenAddress.call(abi.encodeWithSignature("approve(address,uint256)", _spender, _value));
    require(success, "Approve failed");

    return fetchReturnData();
  }
mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)=msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }

  function destroy(address payable user) external {
    selfdestruct(user);
  }
mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }

  function() external payable {

  }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }
}


contract SwapperFactory is DSMath {
  address public admin;
  address public swapperLibrary;
  uint public maxCommission;

mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  event SwapPerformed(
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
  event MaticSwapPerformed(
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  event TransferPerformed(
    address indexed user,
    address token,
    string uniqueId
  );

bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
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
mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
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
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
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
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
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
mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
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
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
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
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
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
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
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
bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
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
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
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

  function isContract(address _address) public view returns (bool) {
    uint32 size;
    assembly {
      size := extcodesize(_address)
    }
    return (size > 0);
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

  function computeCloneSalt(address user, address srcToken, address dstToken, string memory uniqueId) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(user, srcToken, dstToken, uniqueId));
  }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }

  function computeAddress(bytes32 salt) public view returns (address payable) {
    bytes32 data = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(getCloneBytecode())));
    return address(bytes20(data << 96));
  }
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
}