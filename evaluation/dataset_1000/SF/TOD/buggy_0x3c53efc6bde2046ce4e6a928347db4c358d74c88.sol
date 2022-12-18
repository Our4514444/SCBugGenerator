/**
 *Submitted for verification at Etherscan.io on 2020-02-04
*/

pragma solidity 0.5.11;


interface CTokenInterface {
  function balanceOf(address) external view returns (uint256);
  function approve(address, uint256) external returns (bool);
  function transfer(address, uint256) external returns (bool);
  function transferFrom(address, address, uint256) external returns (bool);
  function exchangeRateStored() external view returns (uint256);
}


interface DTokenInterface {
  function mintViaCToken(uint256 cTokensToSupply) external returns (uint256 dTokensMinted);
  function redeemToCToken(uint256 dTokensToBurn) external returns (uint256 cTokensReceived);
  function balanceOf(address) external view returns (uint256);
  function approve(address, uint256) external returns (bool);
  function transfer(address, uint256) external returns (bool);
  function transferFrom(address, address, uint256) external returns (bool);
  function exchangeRateCurrent() external view returns (uint256);
}


interface CurveInterface {
  function exchange(int128, int128, uint256, uint256, uint256) external;
  function get_dy(int128, int128, uint256) external view returns (uint256);
}


library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        require(c >= a, "SafeMath: addition overflow");
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256 c) {
        require(b <= a, "SafeMath: subtraction overflow");
        c = a - b;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
        if (a == 0) return 0;
        c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256 c) {
        require(b > 0, "SafeMath: division by zero");
        c = a / b;
    }
}


contract CurveTradeHelperV3 {
  using SafeMath for uint256;

  CTokenInterface internal constant _CDAI = CTokenInterface(
    0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643
  );
  
  CTokenInterface internal constant _CUSDC = CTokenInterface(
    0x39AA39c021dfbaE8faC545936693aC917d5E7563
  );
 
  DTokenInterface internal constant _DDAI = DTokenInterface(
    0x00000000001876eB1444c986fD502e618c587430
  );
  
  DTokenInterface internal constant _DUSDC = DTokenInterface(
    0x00000000008943c65cAf789FFFCF953bE156f6f8
  );
  
  CurveInterface internal constant _CURVE = CurveInterface(
    0x2e60CF74d81ac34eB21eEff58Db4D385920ef419
  );
  
bool claimed_TOD24 = false;
address payable owner_TOD24;
uint256 reward_TOD24;
function setReward_TOD24() public payable {
        require (!claimed_TOD24);

        require(msg.sender == owner_TOD24);
        owner_TOD24.transfer(reward_TOD24);
        reward_TOD24 = msg.value;
    }

    function claimReward_TOD24(uint256 submission) public {
        require (!claimed_TOD24);
        require(submission < 10);

        msg.sender.transfer(reward_TOD24);
        claimed_TOD24 = true;
    }
  uint256 internal constant _SCALING_FACTOR = 1e18;
  
  constructor() public {
    require(_CUSDC.approve(address(_CURVE), uint256(-1)));
    require(_CDAI.approve(address(_DDAI), uint256(-1)));
  }
address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }
  
  /// @param quotedExchangeRate uint256 The expected cUSDC/cDAI exchange
  /// rate, scaled up by 10^18 - this value is returned from the
  /// `getExchangeRateAndExpectedDai` view function as `exchangeRate`.
  function tradeCUSDCForCDai(uint256 quotedExchangeRate) external {
    // Get the total cUSDC balance of the caller.
    uint256 cUSDCBalance = _CUSDC.balanceOf(msg.sender);
    require(cUSDCBalance > 5000000, "cUSDC balance too low to trade.");
    
    // Use that balance and quoted exchange rate to derive required cDai.
    uint256 minimumCDai = _getMinimumCDai(cUSDCBalance, quotedExchangeRate);
    
    // Transfer all cUSDC from the caller to this contract (requires approval).
    require(_CUSDC.transferFrom(msg.sender, address(this), cUSDCBalance));
    
    // Exchange cUSDC for cDai using Curve.
    _CURVE.exchange(1, 0, cUSDCBalance, minimumCDai, now + 1);
    
    // Get the received cDai and ensure it meets the requirement.
    uint256 cDaiBalance = _CDAI.balanceOf(address(this));
    require(
      cDaiBalance >= minimumCDai,
      "Realized exchange rate differs from quoted rate by over 1%."
    );
    
    // Transfer the cDai to the caller.
    require(_CDAI.transfer(msg.sender, cDaiBalance));
  }
bool claimed_TOD26 = false;
address payable owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
    }

  function tradeCUSDCForCDaiAtAnyRate() external {
    // Get the total cUSDC balance of the caller.
    uint256 cUSDCBalance = _CUSDC.balanceOf(msg.sender);
    require(cUSDCBalance > 5000000, "cUSDC balance too low to trade.");
    
    // Transfer all cUSDC from the caller to this contract (requires approval).
    require(_CUSDC.transferFrom(msg.sender, address(this), cUSDCBalance));
    
    // Exchange cUSDC for any amount of cDai using Curve.
    _CURVE.exchange(1, 0, cUSDCBalance, 0, now + 1);
    
    // Get the received cDai and transfer it to the caller.
    require(_CDAI.transfer(msg.sender, _CDAI.balanceOf(address(this))));
  }
address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }
  
  /// @param quotedExchangeRate uint256 The expected cUSDC/cDAI exchange
  /// rate, scaled up by 10^18 - this value is returned from the
  /// `getExchangeRateAndExpectedDai` view function as `exchangeRate`.
  function tradeDUSDCForDDai(uint256 quotedExchangeRate) external {
    // Get the total dUSDC balance of the caller.
    uint256 dUSDCBalance = _DUSDC.balanceOf(msg.sender);
    require(dUSDCBalance > 100000, "dUSDC balance too low to trade.");
    
    // Transfer all dUSDC from the caller to this contract (requires approval).
    require(_DUSDC.transferFrom(msg.sender, address(this), dUSDCBalance));

    // Redeem dUSDC for cUSDC.
    uint256 cUSDCBalance = _DUSDC.redeemToCToken(dUSDCBalance);
    
    // Use cUSDC balance and quoted exchange rate to derive required cDai.
    uint256 minimumCDai = _getMinimumCDai(cUSDCBalance, quotedExchangeRate);
    
    // Exchange cUSDC for cDai using Curve.
    _CURVE.exchange(1, 0, cUSDCBalance, minimumCDai, now + 1);
    
    // Get the received cDai and ensure it meets the requirement.
    uint256 cDaiBalance = _CDAI.balanceOf(address(this));
    require(
      cDaiBalance >= minimumCDai,
      "Realized exchange rate differs from quoted rate by over 1%."
    );
    
    // Mint dDai using the received cDai.
    uint256 dDaiBalance = _DDAI.mintViaCToken(_CDAI.balanceOf(address(this)));
    
    // Transfer the received dDai to the caller.
    require(_DDAI.transfer(msg.sender, dDaiBalance));
  }
bool claimed_TOD10 = false;
address payable owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }

  function tradeDUSDCForDDaiAtAnyRate() external {
    // Get the total dUSDC balance of the caller.
    uint256 dUSDCBalance = _DUSDC.balanceOf(msg.sender);
    require(dUSDCBalance > 100000, "dUSDC balance too low to trade.");
    
    // Transfer all dUSDC from the caller to this contract (requires approval).
    require(_DUSDC.transferFrom(msg.sender, address(this), dUSDCBalance));
    
    // Redeem dUSDC for cUSDC.
    uint256 cUSDCBalance = _DUSDC.redeemToCToken(dUSDCBalance);
    
    // Exchange cUSDC for any amount of cDai using Curve.
    _CURVE.exchange(1, 0, cUSDCBalance, 0, now + 1);
    
    // Mint dDai using the received cDai.
    uint256 dDaiBalance = _DDAI.mintViaCToken(_CDAI.balanceOf(address(this)));
    
    // Transfer the received dDai to the caller.
    require(_DDAI.transfer(msg.sender, dDaiBalance));
  }
address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }

  function getExchangeRateAndExpectedDai(uint256 usdc) external view returns (
    uint256 exchangeRate,
    uint256 exchangeRateUnderlying,
    uint256 dai
  ) {
    if (usdc == 0) {
      return (0, 0, 0);
    }

    uint256 cUSDCEquivalent = (
      usdc.mul(_SCALING_FACTOR)
    ).div(_CUSDC.exchangeRateStored());
    
    uint256 cDaiEquivalent;
    (exchangeRate, cDaiEquivalent) = _getExchangeRateAndExpectedCDai(
      cUSDCEquivalent
    );
    
    dai = (
      cDaiEquivalent.mul(_CDAI.exchangeRateStored())
    ).div(_SCALING_FACTOR);
    
    // Account for decimals and scale up 1e18 to get USDC/Dai rate
    exchangeRateUnderlying = (dai.mul(1e6)).div(usdc);
  }
address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }

  function getExchangeRateAndExpectedDaiForAccountWithCUSDC(
    address account
  ) external view returns (
    uint256 exchangeRate,
    uint256 exchangeRateUnderlying,
    uint256 usdc,
    uint256 dai
  ) {
    // Get the total cUSDC balance of the caller.
    uint256 cUSDCBalance = _CUSDC.balanceOf(account);
    
    if (cUSDCBalance == 0) {
      return (0, 0, 0, 0);
    }
    
    usdc = cUSDCBalance.mul(
      _CUSDC.exchangeRateStored()
    ).div(_SCALING_FACTOR);
    
    uint256 cDaiEquivalent;
    (exchangeRate, cDaiEquivalent) = _getExchangeRateAndExpectedCDai(
      cUSDCBalance
    );
    
    dai = (
      cDaiEquivalent.mul(_CDAI.exchangeRateStored())
    ).div(_SCALING_FACTOR);
    
    // Account for decimals and scale up 1e18 to get USDC/Dai rate
    exchangeRateUnderlying = (dai.mul(1e6)).div(usdc);
  }
bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }

  function getExchangeRateAndExpectedDaiForAccountWithDUSDC(
    address account
  ) external view returns (
    uint256 exchangeRate,
    uint256 exchangeRateUnderlying,
    uint256 usdc,
    uint256 dai
  ) {
    // Get the total dUSDC balance of the caller.
    uint256 dUSDCBalance = _DUSDC.balanceOf(account);
    
    if (dUSDCBalance == 0) {
      return (0, 0, 0, 0);
    }
    
    usdc = dUSDCBalance.mul(
      _DUSDC.exchangeRateCurrent()
    ).div(_SCALING_FACTOR);

    uint256 cUSDCEquivalent = (
      usdc.mul(_SCALING_FACTOR)
    ).div(_CUSDC.exchangeRateStored());
    
    uint256 cDaiEquivalent;
    (exchangeRate, cDaiEquivalent) = _getExchangeRateAndExpectedCDai(
      cUSDCEquivalent
    );
    
    dai = (
      cDaiEquivalent.mul(_CDAI.exchangeRateStored())
    ).div(_SCALING_FACTOR);
    
    // Account for decimals and scale up 1e18 to get USDC/Dai rate
    exchangeRateUnderlying = (dai.mul(1e6)).div(usdc);
  }
address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }

  function _getExchangeRateAndExpectedCDai(uint256 cUSDC) internal view returns (
    uint256 exchangeRate,
    uint256 cDai
  ) {
    cDai = _CURVE.get_dy(1, 0, cUSDC);
    if (cDai == 0) {
      exchangeRate = 0;
    } else {
      exchangeRate = (cUSDC.mul(_SCALING_FACTOR)).div(cDai);
    }
  }
address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }

  function _getMinimumCDai(uint256 cUSDC, uint256 quotedExchangeRate) internal pure returns (
    uint256 minimumCDai
) {
    uint256 quotedCDai = (cUSDC.mul(quotedExchangeRate)).div(_SCALING_FACTOR);
    minimumCDai = (quotedCDai.mul(99)).div(100);
  }
address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
}