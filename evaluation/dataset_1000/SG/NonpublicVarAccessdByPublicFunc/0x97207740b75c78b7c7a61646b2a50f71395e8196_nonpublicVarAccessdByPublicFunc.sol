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


contract DharmaUSDCSummarizer {
  DTokenInterface internal constant _DUSDC = DTokenInterface(
    0x00000000008943c65cAf789FFFCF953bE156f6f8
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
    getVersion = _DUSDC.getVersion(); 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    totalSupply = _DUSDC.totalSupply();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    totalSupplyUnderlying = _DUSDC.totalSupplyUnderlying();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    exchangeRateCurrent = _DUSDC.exchangeRateCurrent();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    supplyRatePerBlock = _DUSDC.supplyRatePerBlock();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    accrualBlockNumber = _DUSDC.accrualBlockNumber();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    getSpreadPerBlock = _DUSDC.getSpreadPerBlock();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    getSurplus = _DUSDC.getSurplus();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    getSurplusUnderlying = _DUSDC.getSurplusUnderlying();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function brieflySummarize() external view returns (
    uint256 exchangeRateCurrent,
    uint256 supplyRatePerBlock,
    uint256 getSurplusUnderlying
  ) {
    exchangeRateCurrent = _DUSDC.exchangeRateCurrent();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    supplyRatePerBlock = _DUSDC.supplyRatePerBlock();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    getSurplusUnderlying = _DUSDC.getSurplusUnderlying();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }
 
  function summarizeAsArray() external view returns (
    uint256[9] memory data
  ) {
    data[0] = _DUSDC.getVersion(); 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    data[1] = _DUSDC.totalSupply();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    data[2] = _DUSDC.totalSupplyUnderlying();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    data[3] = _DUSDC.exchangeRateCurrent();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    data[4] = _DUSDC.supplyRatePerBlock();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    data[5] = _DUSDC.accrualBlockNumber();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    data[6] = _DUSDC.getSpreadPerBlock();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    data[7] = _DUSDC.getSurplus();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    data[8] = _DUSDC.getSurplusUnderlying();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function brieflySummarizeAsArray() external view returns (
    uint256[3] memory data
  ) {
    data[0] = _DUSDC.exchangeRateCurrent();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    data[1] = _DUSDC.supplyRatePerBlock();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    data[2] = _DUSDC.getSurplusUnderlying();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }
}