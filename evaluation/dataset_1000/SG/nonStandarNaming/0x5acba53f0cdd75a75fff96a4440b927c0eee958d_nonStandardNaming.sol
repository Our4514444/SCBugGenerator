                                                                 

pragma solidity 0.5.11; // optimization runs: 200, evm version: petersburg


interface DTokenInterface {
  // Events (replicate Compound's events)
  event MINT630(address minter, uint256 mintAmount, uint256 mintTokens);	//inject NONSTANDARD NAMING
  event REDEEM15(address redeemer, uint256 redeemAmount, uint256 redeemTokens);	//inject NONSTANDARD NAMING

  // external functions (trigger accrual)
  function MINT171(uint256 underlyingToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING
  function MINTVIACTOKEN665(uint256 cTokensToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING
  function REDEEM651(uint256 dTokensToBurn) external returns (uint256 underlyingReceived);	//inject NONSTANDARD NAMING
  function REDEEMTOCTOKEN812(uint256 dTokensToBurn) external returns (uint256 cTokensReceived);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYING800(uint256 underelyingToReceive) external returns (uint256 dTokensBurned);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYINGTOCTOKEN743(uint256 underlyingToReceive) external returns (uint256 dTokensBurned);	//inject NONSTANDARD NAMING
  function TRANSFERUNDERLYING132(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERUNDERLYINGFROM234(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
  function PULLSURPLUS940() external returns (uint256 cTokenSurplus);	//inject NONSTANDARD NAMING
  function ACCRUEINTEREST948() external;	//inject NONSTANDARD NAMING

  // view functions (do not trigger accrual)
  function TOTALSUPPLYUNDERLYING594() external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOFUNDERLYING276(address account) external view returns (uint256 underlyingBalance);	//inject NONSTANDARD NAMING
  function GETSURPLUS138() external view returns (uint256 cTokenSurplus);	//inject NONSTANDARD NAMING
  function GETSURPLUSUNDERLYING372() external view returns (uint256 underlyingSurplus);	//inject NONSTANDARD NAMING
  function EXCHANGERATECURRENT22() external view returns (uint256 dTokenExchangeRate);	//inject NONSTANDARD NAMING
  function SUPPLYRATEPERBLOCK387() external view returns (uint256 dTokenInterestRate);	//inject NONSTANDARD NAMING
  function GETSPREADPERBLOCK506() external view returns (uint256 rateSpread);	//inject NONSTANDARD NAMING
  function GETVERSION677() external pure returns (uint256 version);	//inject NONSTANDARD NAMING
}


interface CTokenInterface {
  function MINT171(uint256 mintAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING
  function REDEEM651(uint256 redeemAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYING800(uint256 redeemAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING
  function BALANCEOF805(address account) external view returns (uint256 balance);	//inject NONSTANDARD NAMING
  function BALANCEOFUNDERLYING276(address account) external returns (uint256 balance);	//inject NONSTANDARD NAMING
  function EXCHANGERATECURRENT22() external returns (uint256 exchangeRate);	//inject NONSTANDARD NAMING
  function TRANSFER23(address recipient, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM485(address sender, address recipient, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  
  function SUPPLYRATEPERBLOCK387() external view returns (uint256 rate);	//inject NONSTANDARD NAMING
  function EXCHANGERATESTORED229() external view returns (uint256 rate);	//inject NONSTANDARD NAMING
  function ACCRUALBLOCKNUMBER354() external view returns (uint256 blockNumber);	//inject NONSTANDARD NAMING
}


interface ERC20Interface {
    event TRANSFER693(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL636(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
    function TRANSFER23(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE629(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE553(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM485(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY670() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF805(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface SpreadRegistryInterface {
  function GETDAISPREADPERBLOCK292() external view returns (uint256 daiSpreadPerBlock);	//inject NONSTANDARD NAMING
}


library SafeMath {
  function ADD604(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    require(c >= a, "SafeMath: addition overflow");

    return c;
  }

  function SUB100(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b <= a, "SafeMath: subtraction overflow");
    uint256 c = a - b;

    return c;
  }

  function MUL490(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }

    uint256 c = a * b;
    require(c / a == b, "SafeMath: multiplication overflow");

    return c;
  }

  function DIV965(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b > 0, "SafeMath: division by zero");
    uint256 c = a / b;

    return c;
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
contract DharmaDaiPrototype1 is ERC20Interface, DTokenInterface {
  using SafeMath for uint256;

  uint256 internal constant _dharma_dai_version636 = 0;	//inject NONSTANDARD NAMING

  string internal constant _name466 = "Dharma Dai (Prototype 1)";	//inject NONSTANDARD NAMING
  string internal constant _symbol139 = "dDai-p1";	//inject NONSTANDARD NAMING
  uint8 internal constant _decimals46 = 8; // to match cDai	//inject NONSTANDARD NAMING

  uint256 internal constant _scaling_factor220 = 1e18;	//inject NONSTANDARD NAMING
  uint256 internal constant _half_of_scaling_factor499 = 5e17;	//inject NONSTANDARD NAMING
  uint256 internal constant _compound_success532 = 0;	//inject NONSTANDARD NAMING

  CTokenInterface internal constant _cdai826 = CTokenInterface(	//inject NONSTANDARD NAMING
    0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643 // mainnet
  );

  ERC20Interface internal constant _dai839 = ERC20Interface(	//inject NONSTANDARD NAMING
    0x6B175474E89094C44Da98b954EedeAC495271d0F // mainnet
  );

  SpreadRegistryInterface internal constant _spread271 = SpreadRegistryInterface(	//inject NONSTANDARD NAMING
    0xA143fD004B3c26f8FAeDeb9224eC03585e63d041
  );

  // Note: this is just an EOA for the initial prototype.
  address internal constant _vault808 = 0x7e4A8391C728fEd9069B2962699AB416628B19Fa;	//inject NONSTANDARD NAMING

  mapping (address => uint256) private _balances;

  mapping (address => mapping (address => uint256)) private _allowances;

  uint256 private _totalSupply;

  // TODO: pack these more tightly in storage
  uint256 private _blockLastUpdated;
  uint256 private _dDaiExchangeRate;
  uint256 private _cDaiExchangeRate;

  constructor() public {
    // Approve cDai to transfer Dai on behalf of this contract in order to mint.
    require(_dai839.APPROVE553(address(_cdai826), uint256(-1)));

    _blockLastUpdated = block.number;
    _dDaiExchangeRate = 1e28; // 1 Dai == 1 dDai to start
    _cDaiExchangeRate = _cdai826.EXCHANGERATECURRENT22();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function MINT171(	//inject NONSTANDARD NAMING
    uint256 daiToSupply
  ) external ACCRUES967 returns (uint256 dDaiMinted) {
    // Pull in Dai - ensure that this contract has sufficient allowance.
    require(
      _dai839.TRANSFERFROM485(msg.sender, address(this), daiToSupply),
      "Dai transfer failed."
    );

    // Use the cDai to mint Dai and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(_cdai826).call(abi.encodeWithSelector(
      _cdai826.MINT171.selector, daiToSupply
    ));

    _CHECKCOMPOUNDINTERACTION64(_cdai826.MINT171.selector, ok, data);

    // Determine the dDai to mint using the exchange rate.
    dDaiMinted = (daiToSupply.MUL490(_scaling_factor220)).DIV965(_dDaiExchangeRate);

    // Mint dDai to the caller.
    _MINT409(msg.sender, daiToSupply, dDaiMinted);
  }

                                                                                                                                                                                                                                                                                                                                                                                                               
  function MINTVIACTOKEN665(	//inject NONSTANDARD NAMING
    uint256 cDaiToSupply
  ) external ACCRUES967 returns (uint256 dDaiMinted) {
    // Pull in cDai - ensure that this contract has sufficient allowance.
    (bool ok, bytes memory data) = address(_cdai826).call(abi.encodeWithSelector(
      _cdai826.TRANSFERFROM485.selector, msg.sender, address(this), cDaiToSupply
    ));

    _CHECKCOMPOUNDINTERACTION64(_cdai826.TRANSFERFROM485.selector, ok, data);

    // Determine the Dai equivalent of the supplied cDai amount.
    uint256 daiEquivalent = cDaiToSupply.MUL490(_cDaiExchangeRate) / _scaling_factor220;

    // Determine the dDai to mint using the exchange rate.
    dDaiMinted = (daiEquivalent.MUL490(_scaling_factor220)).DIV965(_dDaiExchangeRate);

    // Mint dDai to the caller.
    _MINT409(msg.sender, daiEquivalent, dDaiMinted);
  }

                                                                                                                                                                                                                                                                                                        
  function REDEEM651(	//inject NONSTANDARD NAMING
    uint256 dDaiToBurn
  ) external ACCRUES967 returns (uint256 daiReceived) {
    // Determine the underlying Dai value of the dDai to be burned.
    daiReceived = dDaiToBurn.MUL490(_dDaiExchangeRate) / _scaling_factor220;

    // Burn the dDai.
    _BURN163(msg.sender, daiReceived, dDaiToBurn);

    // Use the cDai to redeem Dai and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(_cdai826).call(abi.encodeWithSelector(
      _cdai826.REDEEMUNDERLYING800.selector, daiReceived
    ));

    _CHECKCOMPOUNDINTERACTION64(_cdai826.REDEEMUNDERLYING800.selector, ok, data);

    // Send the Dai to the redeemer.
    require(_dai839.TRANSFER23(msg.sender, daiReceived), "Dai transfer failed.");
  }

                                                                                                                                                                                                                                                                                       
  function REDEEMTOCTOKEN812(	//inject NONSTANDARD NAMING
    uint256 dDaiToBurn
  ) external ACCRUES967 returns (uint256 cDaiReceived) {
    // Determine the underlying Dai value of the dDai to be burned.
    uint256 daiEquivalent = dDaiToBurn.MUL490(_dDaiExchangeRate) / _scaling_factor220;

    // Determine the amount of cDai corresponding to the redeemed Dai value.
    cDaiReceived = (daiEquivalent.MUL490(_scaling_factor220)).DIV965(_cDaiExchangeRate);

    // Burn the dDai.
    _BURN163(msg.sender, daiEquivalent, dDaiToBurn);

    // Transfer the cDai to the caller and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(_cdai826).call(abi.encodeWithSelector(
      _cdai826.TRANSFER23.selector, msg.sender, cDaiReceived
    ));

    _CHECKCOMPOUNDINTERACTION64(_cdai826.TRANSFER23.selector, ok, data);
  }

                                                                                                                                                                                                                                                                                                                                                                                  
  function REDEEMUNDERLYING800(	//inject NONSTANDARD NAMING
    uint256 daiToReceive
  ) external ACCRUES967 returns (uint256 dDaiBurned) {
    // Determine the dDai to redeem using the exchange rate.
    dDaiBurned = (daiToReceive.MUL490(_scaling_factor220)).DIV965(_dDaiExchangeRate);

    // Burn the dDai.
    _BURN163(msg.sender, daiToReceive, dDaiBurned);

    // Use the cDai to redeem Dai and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(_cdai826).call(abi.encodeWithSelector(
      _cdai826.REDEEMUNDERLYING800.selector, daiToReceive
    ));

    _CHECKCOMPOUNDINTERACTION64(_cdai826.REDEEMUNDERLYING800.selector, ok, data);

    // Send the Dai to the redeemer.
    require(_dai839.TRANSFER23(msg.sender, daiToReceive), "Dai transfer failed.");
  }

                                                                                                                                                                                                                                                                                                                                                            
  function REDEEMUNDERLYINGTOCTOKEN743(	//inject NONSTANDARD NAMING
    uint256 daiToReceive
  ) external ACCRUES967 returns (uint256 dDaiBurned) {
    // Determine the dDai to redeem using the exchange rate.
    dDaiBurned = (daiToReceive.MUL490(_scaling_factor220)).DIV965(_dDaiExchangeRate);

    // Burn the dDai.
    _BURN163(msg.sender, daiToReceive, dDaiBurned);

    // Determine the amount of cDai corresponding to the redeemed Dai value.
    uint256 cDaiToReceive = daiToReceive.MUL490(_scaling_factor220).DIV965(_cDaiExchangeRate);

    // Transfer the cDai to the caller and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(_cdai826).call(abi.encodeWithSelector(
      _cdai826.TRANSFER23.selector, msg.sender, cDaiToReceive
    ));

    _CHECKCOMPOUNDINTERACTION64(_cdai826.TRANSFER23.selector, ok, data);
  }

                                                                                                                                                                                 
  function PULLSURPLUS940() external ACCRUES967 returns (uint256 cDaiSurplus) {	//inject NONSTANDARD NAMING
    // Determine the cDai surplus (difference between total dDai and total cDai)
    (, cDaiSurplus) = _GETSURPLUS610();

    // Transfer the cDai to the vault and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(_cdai826).call(abi.encodeWithSelector(
      _cdai826.TRANSFER23.selector, _vault808, cDaiSurplus
    ));

    _CHECKCOMPOUNDINTERACTION64(_cdai826.TRANSFER23.selector, ok, data);
  }

                                                                                                                                     
  function ACCRUEINTEREST948() external ACCRUES967 {	//inject NONSTANDARD NAMING
    // The `accrues()` modifier contains all function logic.
  }

                                                                                                                                                                                                                                                                                        
  function TRANSFER23(address recipient, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
    _TRANSFER328(msg.sender, recipient, amount);
    return true;
  }

                                                                                                                                                                                                                                                                                                          
  function TRANSFERUNDERLYING132(	//inject NONSTANDARD NAMING
    address recipient, uint256 amount
  ) external ACCRUES967 returns (bool) {
    // Determine the dDai to transfer using the exchange rate
    uint256 dDaiAmount = (amount.MUL490(_scaling_factor220)).DIV965(_dDaiExchangeRate);

    _TRANSFER328(msg.sender, recipient, dDaiAmount);
    return true;
  }

                                                                                                                                                                                                                                                                                                                
  function APPROVE553(address spender, uint256 value) external returns (bool) {	//inject NONSTANDARD NAMING
    _APPROVE56(msg.sender, spender, value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                          
  function TRANSFERFROM485(	//inject NONSTANDARD NAMING
    address sender, address recipient, uint256 amount
  ) external returns (bool) {
    _TRANSFER328(sender, recipient, amount);
    uint256 allowance = _allowances[sender][msg.sender];
    if (allowance != uint256(-1)) {
      _APPROVE56(sender, msg.sender, allowance.SUB100(amount));
    }
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                     
  function TRANSFERUNDERLYINGFROM234(	//inject NONSTANDARD NAMING
    address sender, address recipient, uint256 amount
  ) external ACCRUES967 returns (bool) {
    // Determine the dDai to transfer using the exchange rate
    uint256 dDaiAmount = (amount.MUL490(_scaling_factor220)).DIV965(_dDaiExchangeRate);

    _TRANSFER328(sender, recipient, dDaiAmount);
    uint256 allowance = _allowances[sender][msg.sender];
    if (allowance != uint256(-1)) {
      _APPROVE56(sender, msg.sender, allowance.SUB100(dDaiAmount));
    }
    return true;
  }

                                                                                                                                                                                                                                                                                                                     
  function INCREASEALLOWANCE163(	//inject NONSTANDARD NAMING
    address spender, uint256 addedValue
  ) external returns (bool) {
    _APPROVE56(
      msg.sender, spender, _allowances[msg.sender][spender].ADD604(addedValue)
    );
    return true;
  }

                                                                                                                                                                                                                                                                                                                        
  function DECREASEALLOWANCE779(	//inject NONSTANDARD NAMING
    address spender, uint256 subtractedValue
  ) external returns (bool) {
    _APPROVE56(
      msg.sender, spender, _allowances[msg.sender][spender].SUB100(subtractedValue)
    );
    return true;
  }

                                                                                                                                                                  
  function GETSURPLUS138() external view returns (uint256 cDaiSurplus) {	//inject NONSTANDARD NAMING
    // Determine the Dai surplus (difference between total dDai and total Dai)
    (, cDaiSurplus) = _GETSURPLUS610();
  }

                                                                                                                                                                                       
  function GETSURPLUSUNDERLYING372() external view returns (uint256 daiSurplus) {	//inject NONSTANDARD NAMING
    // Determine the Dai surplus (difference between total dDai and total Dai)
    (daiSurplus, ) = _GETSURPLUS610();
  }

                                                                                                                                                                   
  function ACCRUALBLOCKNUMBER354() external view returns (uint256 blockNumber) {	//inject NONSTANDARD NAMING
    blockNumber = _blockLastUpdated;
  }

                                                                                                                                                
  function EXCHANGERATECURRENT22() external view returns (uint256 dDaiExchangeRate) {	//inject NONSTANDARD NAMING
    // Get most recent dDai exchange rate by determining accrued interest
    (dDaiExchangeRate,,) = _GETACCRUEDINTEREST70();
  }

                                                                                                                                                            
  function SUPPLYRATEPERBLOCK387() external view returns (uint256 dDaiInterestRate) {	//inject NONSTANDARD NAMING
    (dDaiInterestRate,) = _GETRATEPERBLOCK111();
  }

                                                                                                                                                                             
  function GETSPREADPERBLOCK506() external view returns (uint256 rateSpread) {	//inject NONSTANDARD NAMING
    (uint256 dDaiInterestRate, uint256 cDaiInterestRate) = _GETRATEPERBLOCK111();
    rateSpread = cDaiInterestRate - dDaiInterestRate;
  }

                                                                                                   
  function TOTALSUPPLY670() external view returns (uint256) {	//inject NONSTANDARD NAMING
    return _totalSupply;
  }

                                                                                                                       
  function TOTALSUPPLYUNDERLYING594() external view returns (uint256) {	//inject NONSTANDARD NAMING
    (uint256 dDaiExchangeRate,,) = _GETACCRUEDINTEREST70();

    // Determine the total value of all issued dDai in Dai
    return _totalSupply.MUL490(dDaiExchangeRate) / _scaling_factor220;
  }

                                                                                                                                                                                                         
  function BALANCEOF805(address account) external view returns (uint256 dDai) {	//inject NONSTANDARD NAMING
    dDai = _balances[account];
  }

                                                                                                                                                                                                                                                 
  function BALANCEOFUNDERLYING276(	//inject NONSTANDARD NAMING
    address account
  ) external view returns (uint256 daiBalance) {
    // Get most recent dDai exchange rate by determining accrued interest
    (uint256 dDaiExchangeRate,,) = _GETACCRUEDINTEREST70();

    // Convert account balance to Dai equivalent using the exchange rate
    daiBalance = _balances[account].MUL490(dDaiExchangeRate) / _scaling_factor220;
  }

                                                                                                                                                                                                                                                                                                                                                                                  
  function ALLOWANCE629(address owner, address spender) external view returns (uint256) {	//inject NONSTANDARD NAMING
    return _allowances[owner][spender];
  }

                                                                                                        
  function NAME156() external pure returns (string memory) {	//inject NONSTANDARD NAMING
    return _name466;
  }

                                                                                                            
  function SYMBOL847() external pure returns (string memory) {	//inject NONSTANDARD NAMING
    return _symbol139;
  }

                                                                                                                                    
  function DECIMALS716() external pure returns (uint8) {	//inject NONSTANDARD NAMING
    return _decimals46;
  }

                                                                                                                               
  function GETVERSION677() external pure returns (uint256 version) {	//inject NONSTANDARD NAMING
    version = _dharma_dai_version636;
  }

                                                                                                                                                                                                                                                                                                                                                                        
  function _MINT409(address account, uint256 exchanged, uint256 amount) internal {	//inject NONSTANDARD NAMING
    _totalSupply = _totalSupply.ADD604(amount);
    _balances[account] = _balances[account].ADD604(amount);

    emit MINT630(account, exchanged, amount);
    emit TRANSFER693(address(0), account, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                    
  function _BURN163(address account, uint256 exchanged, uint256 amount) internal {	//inject NONSTANDARD NAMING
    uint256 balancePriorToBurn = _balances[account];
    require(
      balancePriorToBurn >= amount, "Supplied amount exceeds account balance."
    );

    _totalSupply = _totalSupply.SUB100(amount);
    _balances[account] = balancePriorToBurn - amount; // overflow checked above

    emit TRANSFER693(account, address(0), amount);
    emit REDEEM15(account, exchanged, amount);
  }

                                                                                                                                                                                                                                                                                                                                             
  function _TRANSFER328(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
    require(sender != address(0), "ERC20: transfer from the zero address");
    require(recipient != address(0), "ERC20: transfer to the zero address");

    _balances[sender] = _balances[sender].SUB100(amount);
    _balances[recipient] = _balances[recipient].ADD604(amount);
    emit TRANSFER693(sender, recipient, amount);
  }

                                                                                                                                                                                                                                                                                                                                             
  function _APPROVE56(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
    require(owner != address(0), "ERC20: approve from the zero address");
    require(spender != address(0), "ERC20: approve to the zero address");

    _allowances[owner][spender] = value;
    emit APPROVAL636(owner, spender, value);
  }

                                                                                                                                                                                                                                                                                                                                   
  function _GETACCRUEDINTEREST70() internal view returns (	//inject NONSTANDARD NAMING
    uint256 dDaiExchangeRate, uint256 cDaiExchangeRate, bool fullyAccrued
  ) {
    // Get the number of blocks since the last time interest was accrued.
    uint256 blockDelta = block.number - _blockLastUpdated;
    fullyAccrued = (blockDelta == 0);

    // Skip calculation and read from storage if interest was already accrued.
    if (fullyAccrued) {
      dDaiExchangeRate = _dDaiExchangeRate;
      cDaiExchangeRate = _cDaiExchangeRate;
    } else {
      // Use cDai exchange rate to calculate the interest rate over the period.
      cDaiExchangeRate = _GETCURRENTEXCHANGERATE671();
      uint256 cDaiInterestRate = (
        (cDaiExchangeRate.MUL490(_scaling_factor220)).DIV965(_cDaiExchangeRate)
      );

      // Get the current spread and calculate interest rate over the period.
      uint256 spreadInterestRate = _POW464(
        _spread271.GETDAISPREADPERBLOCK292().ADD604(_scaling_factor220), blockDelta
      );

      // Use total cDai interest, less the spread, to set dDai exchange rate.
      dDaiExchangeRate = spreadInterestRate >= cDaiInterestRate
        ? _dDaiExchangeRate
        : _dDaiExchangeRate.MUL490(
          _scaling_factor220.ADD604(cDaiInterestRate - spreadInterestRate)
        ) / _scaling_factor220;
    }
  }

                                                                                                                                                                                                                                                        
  function _GETCURRENTEXCHANGERATE671() internal view returns (uint256 exchangeRate) {	//inject NONSTANDARD NAMING
    uint256 storedExchangeRate = _cdai826.EXCHANGERATESTORED229();
    uint256 blockDelta = block.number.SUB100(_cdai826.ACCRUALBLOCKNUMBER354());

    if (blockDelta == 0) return storedExchangeRate;

    exchangeRate = blockDelta == 0 ? storedExchangeRate : storedExchangeRate.ADD604(
      storedExchangeRate.MUL490(
        _cdai826.SUPPLYRATEPERBLOCK387().MUL490(blockDelta)
      ) / _scaling_factor220
    );
  }

                                                                                                                                                                                                        
  function _GETSURPLUS610() internal view returns (	//inject NONSTANDARD NAMING
    uint256 daiSurplus, uint256 cDaiSurplus
  ) {
    (uint256 dDaiExchangeRate, uint256 cDaiExchangeRate,) = _GETACCRUEDINTEREST70();

    // Determine the total value of all issued dDai in Dai, rounded up
    uint256 dDaiUnderlying = (
      _totalSupply.MUL490(dDaiExchangeRate) / _scaling_factor220
    ).ADD604(1);

    // Compare to total underlying Dai value of all cDai held by this contract
    daiSurplus = (
      _cdai826.BALANCEOF805(address(this)).MUL490(cDaiExchangeRate) / _scaling_factor220
    ).SUB100(dDaiUnderlying);

    // Determine the cDai equivalent of this surplus amount
    cDaiSurplus = (daiSurplus.MUL490(_scaling_factor220)).DIV965(cDaiExchangeRate);
  }

                                                                                                                                                                                         
  function _GETRATEPERBLOCK111() internal view returns (	//inject NONSTANDARD NAMING
    uint256 dDaiSupplyRate, uint256 cDaiSupplyRate
  ) {
    uint256 spread = _spread271.GETDAISPREADPERBLOCK292();
    cDaiSupplyRate = _cdai826.SUPPLYRATEPERBLOCK387();
    dDaiSupplyRate = (spread < cDaiSupplyRate ? cDaiSupplyRate - spread : 0);
  }

                                                                                                                                                                                                                                                                                                                                                                              
  function _POW464(uint256 floatIn, uint256 power) internal pure returns (uint256 floatOut) {	//inject NONSTANDARD NAMING
    floatOut = power % 2 != 0 ? floatIn : _scaling_factor220;

    for (power /= 2; power != 0; power /= 2) {
      floatIn = (floatIn.MUL490(floatIn)).ADD604(_half_of_scaling_factor499) / _scaling_factor220;

      if (power % 2 != 0) {
        floatOut = (floatIn.MUL490(floatOut)).ADD604(_half_of_scaling_factor499) / _scaling_factor220;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function _CHECKCOMPOUNDINTERACTION64(	//inject NONSTANDARD NAMING
    bytes4 functionSelector, bool ok, bytes memory data
  ) internal pure {
    // Determine if something went wrong with the attempt.
    if (ok) {
      uint256 compoundError = abi.decode(data, (uint256)); // throws on no data
      if (compoundError != _compound_success532) {
        revert(
          string(
            abi.encodePacked(
              "Compound cDai contract returned error code ",
              uint8((compoundError / 10) + 48),
              uint8((compoundError % 10) + 48),
              " while attempting to call ",
              _GETFUNCTIONNAME605(functionSelector),
              "."
            )
          )
        );
      }
    } else {
      revert(
        string(
          abi.encodePacked(
            "Compound cDai contract reverted while attempting to call ",
            _GETFUNCTIONNAME605(functionSelector),
            ": ",
            _DECODEREVERTREASON821(data)
          )
        )
      );
    }
  }

                                                                                                                                                                                                                         
  function _GETFUNCTIONNAME605(	//inject NONSTANDARD NAMING
    bytes4 functionSelector
  ) internal pure returns (string memory functionName) {
    if (functionSelector == _cdai826.MINT171.selector) {
      functionName = 'mint';
    } else if (functionSelector == _cdai826.REDEEMUNDERLYING800.selector) {
      functionName = 'redeemUnderlying';
    } else if (functionSelector == _cdai826.TRANSFERFROM485.selector) {
      functionName = 'transferFrom';
    } else if (functionSelector == _cdai826.TRANSFER23.selector) {
      functionName = 'transfer';
    } else {
      functionName = 'an unknown function';
    }
  }

                                                                                                                                                                                                                                                                                        
  function _DECODEREVERTREASON821(	//inject NONSTANDARD NAMING
    bytes memory revertData
  ) internal pure returns (string memory revertReason) {
    // Solidity prefixes revert reason with 0x08c379a0 -> Error(string) selector
    if (
      revertData.length > 68 && // prefix (4) + position (32) + length (32)
      revertData[0] == byte(0x08) &&
      revertData[1] == byte(0xc3) &&
      revertData[2] == byte(0x79) &&
      revertData[3] == byte(0xa0)
    ) {
      // Get the revert reason without the prefix from the revert data.
      bytes memory revertReasonBytes = new bytes(revertData.length - 4);
      for (uint256 i = 4; i < revertData.length; i++) {
        revertReasonBytes[i - 4] = revertData[i];
      }

      // Decode the resultant revert reason as a string.
      revertReason = abi.decode(revertReasonBytes, (string));
    } else {
      // Simply return the default, with no revert reason.
      revertReason = "(no revert reason)";
    }
  }

                                                                                                                                                                                                                                                                                                  
  modifier ACCRUES967() {	//inject NONSTANDARD NAMING
    (
      uint256 dDaiExchangeRate, uint256 cDaiExchangeRate, bool fullyAccrued
    ) = _GETACCRUEDINTEREST70();

    if (!fullyAccrued) {
      // Update storage with dDai + cDai exchange rates as of the current block
      _blockLastUpdated = block.number;
      _dDaiExchangeRate = dDaiExchangeRate;
      _cDaiExchangeRate = cDaiExchangeRate;
    }

    _;
  }
}