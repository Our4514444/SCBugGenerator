                                                                 

pragma solidity 0.5.11; // optimization runs: 200, evm version: petersburg


interface DTokenInterface {
  event MINT565(address minter, uint256 mintAmount, uint256 mintTokens);	//inject NONSTANDARD NAMING
  event REDEEM669(address redeemer, uint256 redeemAmount, uint256 redeemTokens);	//inject NONSTANDARD NAMING

  function MINT412(uint256 underlyingToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING

  function REDEEM445(uint256 dTokenToBurn) external returns (uint256 underlyingReceived);	//inject NONSTANDARD NAMING

  function REDEEMUNDERLYING821(uint256 underelyingToReceive) external returns (uint256 dTokensBurned);	//inject NONSTANDARD NAMING

  function PULLSURPLUS538() external returns (uint256 cTokenSurplus);	//inject NONSTANDARD NAMING

  function ACCRUEINTEREST269() external;	//inject NONSTANDARD NAMING

  function BALANCEOFUNDERLYING399(address account) external returns (uint256 underlyingBalance);	//inject NONSTANDARD NAMING

  function GETSURPLUS472() external returns (uint256 cDaiSurplus);	//inject NONSTANDARD NAMING

  function EXCHANGERATECURRENT569() external returns (uint256 dTokenExchangeRate);	//inject NONSTANDARD NAMING

  function SUPPLYRATEPERBLOCK798() external view returns (uint256 dTokenInterestRate);	//inject NONSTANDARD NAMING

  function GETSPREADPERBLOCK191() external view returns (uint256 rateSpread);	//inject NONSTANDARD NAMING

  function GETVERSION843() external pure returns (uint256 version);	//inject NONSTANDARD NAMING
}


interface CTokenInterface {
  function MINT412(uint256 mintAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING

  function REDEEM445(uint256 redeemAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING

  function REDEEMUNDERLYING821(uint256 redeemAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING

  function BALANCEOF746(address account) external returns (uint256 balance);	//inject NONSTANDARD NAMING

  function BALANCEOFUNDERLYING399(address account) external returns (uint256 balance);	//inject NONSTANDARD NAMING

  function EXCHANGERATECURRENT569() external returns (uint256 exchangeRate);	//inject NONSTANDARD NAMING

  function TRANSFER167(address recipient, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

  function SUPPLYRATEPERBLOCK798() external view returns (uint256 rate);	//inject NONSTANDARD NAMING
}


interface ERC20Interface {
    event TRANSFER43(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL992(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
    function TRANSFER167(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE126(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE713(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM229(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY558() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF746(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
}


library SafeMath {
  function ADD860(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    require(c >= a, "SafeMath: addition overflow");

    return c;
  }

  function SUB77(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b <= a, "SafeMath: subtraction overflow");
    uint256 c = a - b;

    return c;
  }

  function MUL742(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }

    uint256 c = a * b;
    require(c / a == b, "SafeMath: multiplication overflow");

    return c;
  }

  function DIV213(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b > 0, "SafeMath: division by zero");
    uint256 c = a / b;

    return c;
  }

  function MOD645(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b != 0, "SafeMath: modulo by zero");
    return a % b;
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                    
contract DharmaDaiPrototype0 is ERC20Interface, DTokenInterface {
  using SafeMath for uint256;

  uint256 internal constant _dharma_dai_version673 = 0;	//inject NONSTANDARD NAMING

  // Note: this is a constant for the proof-of-concept but will be configurable.
  // 5% APR interest assuming 15 second block time & 2,102,400 blocks per year
  uint256 internal constant _rate_per_block748 = 1000000023782344094;	//inject NONSTANDARD NAMING

  string internal constant _name313 = "Dharma Dai (Prototype 0)";	//inject NONSTANDARD NAMING
  string internal constant _symbol376 = "dDai-p0";	//inject NONSTANDARD NAMING
  uint8 internal constant _decimals201 = 8; // to match cDai	//inject NONSTANDARD NAMING

  uint256 internal constant _scaling_factor32 = 1e18;	//inject NONSTANDARD NAMING
  uint256 internal constant _scaling_factor_squared306 = 1e36;	//inject NONSTANDARD NAMING
  uint256 internal constant _half_of_scaling_factor450 = 5e17;	//inject NONSTANDARD NAMING
  uint256 internal constant _compound_success538 = 0;	//inject NONSTANDARD NAMING

  CTokenInterface internal constant _cdai645 = CTokenInterface(	//inject NONSTANDARD NAMING
    0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643 // mainnet
  );

  ERC20Interface internal constant _dai504 = ERC20Interface(	//inject NONSTANDARD NAMING
    0x6B175474E89094C44Da98b954EedeAC495271d0F // mainnet
  );

  // Note: this is just an EOA for the initial prototype.
  address internal constant _vault119 = 0x7e4A8391C728fEd9069B2962699AB416628B19Fa;	//inject NONSTANDARD NAMING

  mapping (address => uint256) private _balances;

  mapping (address => mapping (address => uint256)) private _allowances;

  uint256 private _totalSupply;

  // TODO: pack these more tightly in storage
  uint256 private _blockLastUpdated;
  uint256 private _dDaiExchangeRate;
  uint256 private _cDaiExchangeRate;

  constructor() public {
    _blockLastUpdated = block.number;
    _dDaiExchangeRate = _scaling_factor32;
    _cDaiExchangeRate = _cdai645.EXCHANGERATECURRENT569();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function MINT412(	//inject NONSTANDARD NAMING
    uint256 daiToSupply
  ) external ACCRUES452 returns (uint256 dDaiMinted) {
    // Determine the dDai to mint using the exchange rate
    dDaiMinted = daiToSupply.MUL742(_scaling_factor_squared306).DIV213(_dDaiExchangeRate);

    // Pull in Dai (requires that this contract has sufficient allowance)
    require(
      _dai504.TRANSFERFROM229(msg.sender, address(this), daiToSupply),
      "Dai transfer failed."
    );

    // Use the Dai to mint cDai (TODO: include error code in revert reason)
    require(_cdai645.MINT412(daiToSupply) == _compound_success538, "cDai mint failed.");

    // Mint dDai to the caller
    _MINT187(msg.sender, daiToSupply, dDaiMinted);
  }

                                                                                                                                                                                                                                                                                                        
  function REDEEM445(	//inject NONSTANDARD NAMING
    uint256 dDaiToBurn
  ) external ACCRUES452 returns (uint256 daiReceived) {
    // Determine the underlying Dai value of the dDai to be burned
    daiReceived = dDaiToBurn.MUL742(_dDaiExchangeRate) / _scaling_factor32;

    // Burn the dDai
    _BURN853(msg.sender, daiReceived, dDaiToBurn);

    // Use the cDai to redeem Dai  (TODO: include error code in revert reason)
    require(
      _cdai645.REDEEMUNDERLYING821(daiReceived) == _compound_success538,
      "cDai redeem failed."
    );

    // Send the Dai to the redeemer
    require(_dai504.TRANSFER167(msg.sender, daiReceived), "Dai transfer failed.");
  }

                                                                                                                                                                                                                                                                                                                                                                                  
  function REDEEMUNDERLYING821(	//inject NONSTANDARD NAMING
    uint256 daiToReceive
  ) external ACCRUES452 returns (uint256 dDaiBurned) {
    // Determine the dDai to redeem using the exchange rate
    dDaiBurned = daiToReceive.MUL742(_scaling_factor_squared306).DIV213(_dDaiExchangeRate);

    // Burn the dDai
    _BURN853(msg.sender, daiToReceive, dDaiBurned);

    // Use the cDai to redeem Dai  (TODO: include error code in revert reason)
    require(
      _cdai645.REDEEMUNDERLYING821(daiToReceive) == _compound_success538,
      "cDai redeem failed."
    );

    // Send the Dai to the redeemer
    require(_dai504.TRANSFER167(msg.sender, daiToReceive), "Dai transfer failed.");
  }

                                                                                                                                                                                 
  function PULLSURPLUS538() external ACCRUES452 returns (uint256 cDaiSurplus) {	//inject NONSTANDARD NAMING
    // Determine the cDai surplus (difference between total dDai and total cDai)
    cDaiSurplus = _GETSURPLUS581();

    // Send the cDai surplus to the vault
    require(_cdai645.TRANSFER167(_vault119, cDaiSurplus), "cDai transfer failed.");
  }

                                                                                                                                     
  function ACCRUEINTEREST269() external ACCRUES452 {	//inject NONSTANDARD NAMING
    // The `accrues()` modifier contains all function logic.
  }

                                                                                                                                                                                                                                                                                        
  function TRANSFER167(address recipient, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
    _TRANSFER590(msg.sender, recipient, amount);
    return true;
  }

                                                                                                                                                                                                                                                                                                                
  function APPROVE713(address spender, uint256 value) external returns (bool) {	//inject NONSTANDARD NAMING
    _APPROVE640(msg.sender, spender, value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                          
  function TRANSFERFROM229(	//inject NONSTANDARD NAMING
    address sender, address recipient, uint256 amount
  ) external returns (bool) {
    _TRANSFER590(sender, recipient, amount);
    uint256 allowance = _allowances[sender][msg.sender];
    if (allowance != uint256(-1)) {
      _APPROVE640(sender, msg.sender, allowance.SUB77(amount));
    }
    return true;
  }

                                                                                                                                                                                                                                                                                                                     
  function INCREASEALLOWANCE47(	//inject NONSTANDARD NAMING
    address spender, uint256 addedValue
  ) external returns (bool) {
    _APPROVE640(
      msg.sender, spender, _allowances[msg.sender][spender].ADD860(addedValue)
    );
    return true;
  }

                                                                                                                                                                                                                                                                                                                        
  function DECREASEALLOWANCE393(	//inject NONSTANDARD NAMING
    address spender, uint256 subtractedValue
  ) external returns (bool) {
    _APPROVE640(
      msg.sender, spender, _allowances[msg.sender][spender].SUB77(subtractedValue)
    );
    return true;
  }

                                                                                                                                                                                                                                                 
  function BALANCEOFUNDERLYING399(	//inject NONSTANDARD NAMING
    address account
  ) external returns (uint256 daiBalance) {
    // Get most recent dDai exchange rate by determining accrued interest
    (uint256 dDaiExchangeRate,,) = _GETACCRUEDINTEREST723();

    // Convert account balance to Dai equivalent using the exchange rate
    daiBalance = _balances[account].MUL742(dDaiExchangeRate) / _scaling_factor32;
  }

                                                                                                                                                          
  function GETSURPLUS472() external ACCRUES452 returns (uint256 cDaiSurplus) {	//inject NONSTANDARD NAMING
    // Determine the cDai surplus (difference between total dDai and total cDai)
    cDaiSurplus = _GETSURPLUS581();
  }

                                                                                                                                                
  function EXCHANGERATECURRENT569() external returns (uint256 dDaiExchangeRate) {	//inject NONSTANDARD NAMING
    // Get most recent dDai exchange rate by determining accrued interest
    (dDaiExchangeRate,,) = _GETACCRUEDINTEREST723();
  }

                                                                                                                                                            
  function SUPPLYRATEPERBLOCK798() external view returns (uint256 dDaiInterestRate) {	//inject NONSTANDARD NAMING
    (dDaiInterestRate,) = _GETRATEPERBLOCK838();
  }

                                                                                                                                                                             
  function GETSPREADPERBLOCK191() external view returns (uint256 rateSpread) {	//inject NONSTANDARD NAMING
    (uint256 dDaiInterestRate, uint256 cDaiInterestRate) = _GETRATEPERBLOCK838();
    rateSpread = cDaiInterestRate - dDaiInterestRate;
  }

                                                                                                   
  function TOTALSUPPLY558() external view returns (uint256) {	//inject NONSTANDARD NAMING
    return _totalSupply;
  }

                                                                                                                                                                                                         
  function BALANCEOF746(address account) external view returns (uint256 dDai) {	//inject NONSTANDARD NAMING
    dDai = _balances[account];
  }

                                                                                                                                                                                                                                                                                                                                                                                  
  function ALLOWANCE126(address owner, address spender) external view returns (uint256) {	//inject NONSTANDARD NAMING
    return _allowances[owner][spender];
  }

                                                                                                        
  function NAME123() external pure returns (string memory) {	//inject NONSTANDARD NAMING
    return _name313;
  }

                                                                                                            
  function SYMBOL627() external pure returns (string memory) {	//inject NONSTANDARD NAMING
    return _symbol376;
  }

                                                                                                                                    
  function DECIMALS346() external pure returns (uint8) {	//inject NONSTANDARD NAMING
    return _decimals201;
  }

                                                                                                                               
  function GETVERSION843() external pure returns (uint256 version) {	//inject NONSTANDARD NAMING
    version = _dharma_dai_version673;
  }

                                                                                                                                                                                                                                                                                                                                                                        
  function _MINT187(address account, uint256 exchanged, uint256 amount) internal {	//inject NONSTANDARD NAMING
    _totalSupply = _totalSupply.ADD860(amount);
    _balances[account] = _balances[account].ADD860(amount);

    emit MINT565(account, exchanged, amount);
    emit TRANSFER43(address(0), account, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                    
  function _BURN853(address account, uint256 exchanged, uint256 amount) internal {	//inject NONSTANDARD NAMING
    uint256 balancePriorToBurn = _balances[account];
    require(
      balancePriorToBurn >= amount, "Supplied amount exceeds account balance."
    );

    _totalSupply = _totalSupply.SUB77(amount);
    _balances[account] = balancePriorToBurn - amount; // overflow checked above

    emit TRANSFER43(account, address(0), amount);
    emit REDEEM669(account, exchanged, amount);
  }

                                                                                                                                                                                                                                                                                                                                             
  function _TRANSFER590(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
    require(sender != address(0), "ERC20: transfer from the zero address");
    require(recipient != address(0), "ERC20: transfer to the zero address");

    _balances[sender] = _balances[sender].SUB77(amount);
    _balances[recipient] = _balances[recipient].ADD860(amount);
    emit TRANSFER43(sender, recipient, amount);
  }

                                                                                                                                                                                                                                                                                                                                             
  function _APPROVE640(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
    require(owner != address(0), "ERC20: approve from the zero address");
    require(spender != address(0), "ERC20: approve to the zero address");

    _allowances[owner][spender] = value;
    emit APPROVAL992(owner, spender, value);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                      
  function _GETACCRUEDINTEREST723() internal            returns (	//inject NONSTANDARD NAMING
    uint256 dDaiExchangeRate, uint256 cDaiExchangeRate, bool fullyAccrued
  ) {
    // Get the number of blocks since the last time interest was accrued
    uint256 blocksToAccrueInterest = block.number - _blockLastUpdated;
    fullyAccrued = (blocksToAccrueInterest == 0);

    // Skip calculation and read from storage if interest was accrued this block
    if (fullyAccrued) {
      dDaiExchangeRate = _dDaiExchangeRate;
      cDaiExchangeRate = _cDaiExchangeRate;
    } else {
      // Calculate the accrued interest over the period
      uint256 defaultInterest = _POW262(_rate_per_block748, blocksToAccrueInterest);

      // Retrieve the latest exchange rate for cDai
      cDaiExchangeRate = _cdai645.EXCHANGERATECURRENT569();

      // Calculate the accrued interest for Compound over the period
      uint256 cDaiInterest = (
        cDaiExchangeRate.MUL742(_scaling_factor32).DIV213(_cDaiExchangeRate)
      );

      // Take the lesser of the two and use it to adjust the dDai exchange rate
      dDaiExchangeRate = _dDaiExchangeRate.MUL742(
        defaultInterest > cDaiInterest ? cDaiInterest : defaultInterest
      ) / _scaling_factor32;
    }
  }

                                                                                                                                                                          
  function _GETSURPLUS581() internal            returns (uint256 cDaiSurplus) {	//inject NONSTANDARD NAMING
    // Determine the total value of all issued dDai in Dai, rounded up
    uint256 dDaiUnderlying = (
      _totalSupply.MUL742(_dDaiExchangeRate) / _scaling_factor32
    ).ADD860(1);

    // Compare to total underlying Dai value of all cDai held by this contract
    uint256 daiSurplus = (
      _cdai645.BALANCEOFUNDERLYING399(address(this)).SUB77(dDaiUnderlying)
    );

    // Determine the cDai equivalent of this surplus amount
    cDaiSurplus = daiSurplus.MUL742(_scaling_factor_squared306).DIV213(_cDaiExchangeRate);
  }

                                                                                                                                                                                         
  function _GETRATEPERBLOCK838() internal view returns (	//inject NONSTANDARD NAMING
    uint256 dDaiSupplyRate, uint256 cDaiSupplyRate
  ) {
    cDaiSupplyRate = _cdai645.SUPPLYRATEPERBLOCK798(); // NOTE: accrue on Compound first?
    dDaiSupplyRate = (
      _rate_per_block748 < cDaiSupplyRate ? _rate_per_block748 : cDaiSupplyRate
    );
  }

                                                                                                                                                                                                                                                                                                                                                                              
  function _POW262(uint256 floatIn, uint256 power) internal pure returns (uint256 floatOut) {	//inject NONSTANDARD NAMING
    floatOut = power % 2 != 0 ? floatIn : _scaling_factor32;

    for (power /= 2; power != 0; power /= 2) {
      floatIn = (floatIn.MUL742(floatIn)).ADD860(_half_of_scaling_factor450) / _scaling_factor32;

      if (power % 2 != 0) {
        floatOut = (floatIn.MUL742(floatOut)).ADD860(_half_of_scaling_factor450) / _scaling_factor32;
      }
    }
  }

                                                                                                                                                                                                                                                                                                  
  modifier ACCRUES452() {	//inject NONSTANDARD NAMING
    (
      uint256 dDaiExchangeRate, uint256 cDaiExchangeRate, bool fullyAccrued
    ) = _GETACCRUEDINTEREST723();

    if (!fullyAccrued) {
      // Update storage with dDai + cDai exchange rates as of the current block
      _blockLastUpdated = block.number;
      _dDaiExchangeRate = dDaiExchangeRate;
      _cDaiExchangeRate = cDaiExchangeRate;
    }

    _;
  }
}