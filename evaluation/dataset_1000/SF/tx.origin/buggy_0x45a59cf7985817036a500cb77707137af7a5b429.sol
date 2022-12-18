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
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
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
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
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
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}

  function brieflySummarizeAsArray() external view returns (
    uint256[3] memory data
  ) {
    data[0] = _DDAI.exchangeRateCurrent();
    data[1] = _DDAI.supplyRatePerBlock();
    data[2] = _DDAI.getSurplusUnderlying();
  }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}