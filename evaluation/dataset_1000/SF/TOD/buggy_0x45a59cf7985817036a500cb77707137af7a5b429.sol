/**
 *Submitted for verification at Etherscan.io on 2020-02-17
*/

pragma solidity 0.5.11;


interface DTokenInterface {
  function totalSupply() external view returns (uint256);
  function totalSupplyUnderlying() external view returns (uint256);
  function balanceOfUnderlying(address account) external view returns (uint256 underlyingBalance);
  function exchangeRateCurrent() external view returns (uint256 dTokenExchangeRate);
  function supplyRatePerBlock() external view returns (uint256 dTokenInterestRate);
  function accrualBlockNumber() external view returns (uint256 blockNumber);
  function getSurplus() external view returns (uint256 cTokenSurplus);
  function getSurplusUnderlying() external view returns (uint256 underlyingSurplus);
  function getSpreadPerBlock() external view returns (uint256 rateSpread);
  function getVersion() external pure returns (uint256 version);
}


contract DharmaDaiSummarizer {
  DTokenInterface internal constant _DDAI = DTokenInterface(
    0x00000000001876eB1444c986fD502e618c587430
  );

  function summarize() external view returns (
    uint256 getVersion,
    uint256 totalSupply,
    uint256 totalSupplyUnderlying,
    uint256 exchangeRateCurrent,
    uint256 supplyRatePerBlock,
    uint256 accrualBlockNumber,
    uint256 getSpreadPerBlock,
    uint256 getSurplus,
    uint256 getSurplusUnderlying
  ) {
    getVersion = _DDAI.getVersion(); 
    totalSupply = _DDAI.totalSupply();
    totalSupplyUnderlying = _DDAI.totalSupplyUnderlying();
    exchangeRateCurrent = _DDAI.exchangeRateCurrent();
    supplyRatePerBlock = _DDAI.supplyRatePerBlock();
    accrualBlockNumber = _DDAI.accrualBlockNumber();
    getSpreadPerBlock = _DDAI.getSpreadPerBlock();
    getSurplus = _DDAI.getSurplus();
    getSurplusUnderlying = _DDAI.getSurplusUnderlying();
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

  function brieflySummarize() external view returns (
    uint256 exchangeRateCurrent,
    uint256 supplyRatePerBlock,
    uint256 getSurplusUnderlying
  ) {
    exchangeRateCurrent = _DDAI.exchangeRateCurrent();
    supplyRatePerBlock = _DDAI.supplyRatePerBlock();
    getSurplusUnderlying = _DDAI.getSurplusUnderlying();
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
 
  function summarizeAsArray() external view returns (
    uint256[9] memory data
  ) {
    data[0] = _DDAI.getVersion(); 
    data[1] = _DDAI.totalSupply();
    data[2] = _DDAI.totalSupplyUnderlying();
    data[3] = _DDAI.exchangeRateCurrent();
    data[4] = _DDAI.supplyRatePerBlock();
    data[5] = _DDAI.accrualBlockNumber();
    data[6] = _DDAI.getSpreadPerBlock();
    data[7] = _DDAI.getSurplus();
    data[8] = _DDAI.getSurplusUnderlying();
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

  function brieflySummarizeAsArray() external view returns (
    uint256[3] memory data
  ) {
    data[0] = _DDAI.exchangeRateCurrent();
    data[1] = _DDAI.supplyRatePerBlock();
    data[2] = _DDAI.getSurplusUnderlying();
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