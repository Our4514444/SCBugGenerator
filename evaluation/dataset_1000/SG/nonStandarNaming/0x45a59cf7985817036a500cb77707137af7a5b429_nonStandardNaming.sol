                                                                 

pragma solidity 0.5.11;


interface DTokenInterface {
  function TOTALSUPPLY885() external view returns (uint256);	//inject NONSTANDARD NAMING
  function TOTALSUPPLYUNDERLYING853() external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOFUNDERLYING609(address account) external view returns (uint256 underlyingBalance);	//inject NONSTANDARD NAMING
  function EXCHANGERATECURRENT924() external view returns (uint256 dTokenExchangeRate);	//inject NONSTANDARD NAMING
  function SUPPLYRATEPERBLOCK562() external view returns (uint256 dTokenInterestRate);	//inject NONSTANDARD NAMING
  function ACCRUALBLOCKNUMBER330() external view returns (uint256 blockNumber);	//inject NONSTANDARD NAMING
  function GETSURPLUS996() external view returns (uint256 cTokenSurplus);	//inject NONSTANDARD NAMING
  function GETSURPLUSUNDERLYING994() external view returns (uint256 underlyingSurplus);	//inject NONSTANDARD NAMING
  function GETSPREADPERBLOCK912() external view returns (uint256 rateSpread);	//inject NONSTANDARD NAMING
  function GETVERSION893() external pure returns (uint256 version);	//inject NONSTANDARD NAMING
}


contract DharmaDaiSummarizer {
  DTokenInterface internal constant _ddai508 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000001876eB1444c986fD502e618c587430
  );

  function SUMMARIZE913() external view returns (	//inject NONSTANDARD NAMING
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
    getVersion = _ddai508.GETVERSION893(); 
    totalSupply = _ddai508.TOTALSUPPLY885();
    totalSupplyUnderlying = _ddai508.TOTALSUPPLYUNDERLYING853();
    exchangeRateCurrent = _ddai508.EXCHANGERATECURRENT924();
    supplyRatePerBlock = _ddai508.SUPPLYRATEPERBLOCK562();
    accrualBlockNumber = _ddai508.ACCRUALBLOCKNUMBER330();
    getSpreadPerBlock = _ddai508.GETSPREADPERBLOCK912();
    getSurplus = _ddai508.GETSURPLUS996();
    getSurplusUnderlying = _ddai508.GETSURPLUSUNDERLYING994();
  }

  function BRIEFLYSUMMARIZE619() external view returns (	//inject NONSTANDARD NAMING
    uint256 exchangeRateCurrent,
    uint256 supplyRatePerBlock,
    uint256 getSurplusUnderlying
  ) {
    exchangeRateCurrent = _ddai508.EXCHANGERATECURRENT924();
    supplyRatePerBlock = _ddai508.SUPPLYRATEPERBLOCK562();
    getSurplusUnderlying = _ddai508.GETSURPLUSUNDERLYING994();
  }
 
  function SUMMARIZEASARRAY416() external view returns (	//inject NONSTANDARD NAMING
    uint256[9] memory data
  ) {
    data[0] = _ddai508.GETVERSION893(); 
    data[1] = _ddai508.TOTALSUPPLY885();
    data[2] = _ddai508.TOTALSUPPLYUNDERLYING853();
    data[3] = _ddai508.EXCHANGERATECURRENT924();
    data[4] = _ddai508.SUPPLYRATEPERBLOCK562();
    data[5] = _ddai508.ACCRUALBLOCKNUMBER330();
    data[6] = _ddai508.GETSPREADPERBLOCK912();
    data[7] = _ddai508.GETSURPLUS996();
    data[8] = _ddai508.GETSURPLUSUNDERLYING994();
  }

  function BRIEFLYSUMMARIZEASARRAY608() external view returns (	//inject NONSTANDARD NAMING
    uint256[3] memory data
  ) {
    data[0] = _ddai508.EXCHANGERATECURRENT924();
    data[1] = _ddai508.SUPPLYRATEPERBLOCK562();
    data[2] = _ddai508.GETSURPLUSUNDERLYING994();
  }
}