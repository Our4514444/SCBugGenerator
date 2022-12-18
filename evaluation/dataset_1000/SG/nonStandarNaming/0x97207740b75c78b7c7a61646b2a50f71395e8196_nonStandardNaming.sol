                                                                 

pragma solidity 0.5.11;


interface DTokenInterface {
  function TOTALSUPPLY565() external view returns (uint256);	//inject NONSTANDARD NAMING
  function TOTALSUPPLYUNDERLYING885() external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOFUNDERLYING241(address account) external view returns (uint256 underlyingBalance);	//inject NONSTANDARD NAMING
  function EXCHANGERATECURRENT972() external view returns (uint256 dTokenExchangeRate);	//inject NONSTANDARD NAMING
  function SUPPLYRATEPERBLOCK408() external view returns (uint256 dTokenInterestRate);	//inject NONSTANDARD NAMING
  function ACCRUALBLOCKNUMBER337() external view returns (uint256 blockNumber);	//inject NONSTANDARD NAMING
  function GETSURPLUS481() external view returns (uint256 cTokenSurplus);	//inject NONSTANDARD NAMING
  function GETSURPLUSUNDERLYING122() external view returns (uint256 underlyingSurplus);	//inject NONSTANDARD NAMING
  function GETSPREADPERBLOCK82() external view returns (uint256 rateSpread);	//inject NONSTANDARD NAMING
  function GETVERSION924() external pure returns (uint256 version);	//inject NONSTANDARD NAMING
}


contract DharmaUSDCSummarizer {
  DTokenInterface internal constant _dusdc785 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000008943c65cAf789FFFCF953bE156f6f8
  );

  function SUMMARIZE665() external view returns (	//inject NONSTANDARD NAMING
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
    getVersion = _dusdc785.GETVERSION924(); 
    totalSupply = _dusdc785.TOTALSUPPLY565();
    totalSupplyUnderlying = _dusdc785.TOTALSUPPLYUNDERLYING885();
    exchangeRateCurrent = _dusdc785.EXCHANGERATECURRENT972();
    supplyRatePerBlock = _dusdc785.SUPPLYRATEPERBLOCK408();
    accrualBlockNumber = _dusdc785.ACCRUALBLOCKNUMBER337();
    getSpreadPerBlock = _dusdc785.GETSPREADPERBLOCK82();
    getSurplus = _dusdc785.GETSURPLUS481();
    getSurplusUnderlying = _dusdc785.GETSURPLUSUNDERLYING122();
  }

  function BRIEFLYSUMMARIZE617() external view returns (	//inject NONSTANDARD NAMING
    uint256 exchangeRateCurrent,
    uint256 supplyRatePerBlock,
    uint256 getSurplusUnderlying
  ) {
    exchangeRateCurrent = _dusdc785.EXCHANGERATECURRENT972();
    supplyRatePerBlock = _dusdc785.SUPPLYRATEPERBLOCK408();
    getSurplusUnderlying = _dusdc785.GETSURPLUSUNDERLYING122();
  }
 
  function SUMMARIZEASARRAY784() external view returns (	//inject NONSTANDARD NAMING
    uint256[9] memory data
  ) {
    data[0] = _dusdc785.GETVERSION924(); 
    data[1] = _dusdc785.TOTALSUPPLY565();
    data[2] = _dusdc785.TOTALSUPPLYUNDERLYING885();
    data[3] = _dusdc785.EXCHANGERATECURRENT972();
    data[4] = _dusdc785.SUPPLYRATEPERBLOCK408();
    data[5] = _dusdc785.ACCRUALBLOCKNUMBER337();
    data[6] = _dusdc785.GETSPREADPERBLOCK82();
    data[7] = _dusdc785.GETSURPLUS481();
    data[8] = _dusdc785.GETSURPLUSUNDERLYING122();
  }

  function BRIEFLYSUMMARIZEASARRAY919() external view returns (	//inject NONSTANDARD NAMING
    uint256[3] memory data
  ) {
    data[0] = _dusdc785.EXCHANGERATECURRENT972();
    data[1] = _dusdc785.SUPPLYRATEPERBLOCK408();
    data[2] = _dusdc785.GETSURPLUSUNDERLYING122();
  }
}