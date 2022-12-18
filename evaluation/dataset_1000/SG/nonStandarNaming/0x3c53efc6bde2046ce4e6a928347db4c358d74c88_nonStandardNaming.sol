                                                                 

pragma solidity 0.5.11;


interface CTokenInterface {
  function BALANCEOF517(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function APPROVE574(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFER934(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM461(address, address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function EXCHANGERATESTORED202() external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface DTokenInterface {
  function MINTVIACTOKEN914(uint256 cTokensToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING
  function REDEEMTOCTOKEN669(uint256 dTokensToBurn) external returns (uint256 cTokensReceived);	//inject NONSTANDARD NAMING
  function BALANCEOF517(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function APPROVE574(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFER934(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM461(address, address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function EXCHANGERATECURRENT250() external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface CurveInterface {
  function EXCHANGE372(int128, int128, uint256, uint256, uint256) external;	//inject NONSTANDARD NAMING
  function GET_DY825(int128, int128, uint256) external view returns (uint256);	//inject NONSTANDARD NAMING
}


library SafeMath {
    function ADD391(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a, "SafeMath: addition overflow");
    }

    function SUB537(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        c = a - b;
    }

    function MUL716(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        if (a == 0) return 0;
        c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
    }

    function DIV5(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        require(b > 0, "SafeMath: division by zero");
        c = a / b;
    }
}


contract CurveTradeHelperV3 {
  using SafeMath for uint256;

  CTokenInterface internal constant _cdai637 = CTokenInterface(	//inject NONSTANDARD NAMING
    0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643
  );
  
  CTokenInterface internal constant _cusdc384 = CTokenInterface(	//inject NONSTANDARD NAMING
    0x39AA39c021dfbaE8faC545936693aC917d5E7563
  );
 
  DTokenInterface internal constant _ddai633 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000001876eB1444c986fD502e618c587430
  );
  
  DTokenInterface internal constant _dusdc322 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000008943c65cAf789FFFCF953bE156f6f8
  );
  
  CurveInterface internal constant _curve556 = CurveInterface(	//inject NONSTANDARD NAMING
    0x2e60CF74d81ac34eB21eEff58Db4D385920ef419
  );
  
  uint256 internal constant _scaling_factor496 = 1e18;	//inject NONSTANDARD NAMING
  
  constructor() public {
    require(_cusdc384.APPROVE574(address(_curve556), uint256(-1)));
    require(_cdai637.APPROVE574(address(_ddai633), uint256(-1)));
  }
  
                                                                        
                                                                
                                                                      
  function TRADECUSDCFORCDAI973(uint256 quotedExchangeRate) external {	//inject NONSTANDARD NAMING
    // Get the total cUSDC balance of the caller.
    uint256 cUSDCBalance = _cusdc384.BALANCEOF517(msg.sender);
    require(cUSDCBalance > 5000000, "cUSDC balance too low to trade.");
    
    // Use that balance and quoted exchange rate to derive required cDai.
    uint256 minimumCDai = _GETMINIMUMCDAI544(cUSDCBalance, quotedExchangeRate);
    
    // Transfer all cUSDC from the caller to this contract (requires approval).
    require(_cusdc384.TRANSFERFROM461(msg.sender, address(this), cUSDCBalance));
    
    // Exchange cUSDC for cDai using Curve.
    _curve556.EXCHANGE372(1, 0, cUSDCBalance, minimumCDai, now + 1);
    
    // Get the received cDai and ensure it meets the requirement.
    uint256 cDaiBalance = _cdai637.BALANCEOF517(address(this));
    require(
      cDaiBalance >= minimumCDai,
      "Realized exchange rate differs from quoted rate by over 1%."
    );
    
    // Transfer the cDai to the caller.
    require(_cdai637.TRANSFER934(msg.sender, cDaiBalance));
  }

  function TRADECUSDCFORCDAIATANYRATE391() external {	//inject NONSTANDARD NAMING
    // Get the total cUSDC balance of the caller.
    uint256 cUSDCBalance = _cusdc384.BALANCEOF517(msg.sender);
    require(cUSDCBalance > 5000000, "cUSDC balance too low to trade.");
    
    // Transfer all cUSDC from the caller to this contract (requires approval).
    require(_cusdc384.TRANSFERFROM461(msg.sender, address(this), cUSDCBalance));
    
    // Exchange cUSDC for any amount of cDai using Curve.
    _curve556.EXCHANGE372(1, 0, cUSDCBalance, 0, now + 1);
    
    // Get the received cDai and transfer it to the caller.
    require(_cdai637.TRANSFER934(msg.sender, _cdai637.BALANCEOF517(address(this))));
  }
  
                                                                        
                                                                
                                                                      
  function TRADEDUSDCFORDDAI409(uint256 quotedExchangeRate) external {	//inject NONSTANDARD NAMING
    // Get the total dUSDC balance of the caller.
    uint256 dUSDCBalance = _dusdc322.BALANCEOF517(msg.sender);
    require(dUSDCBalance > 100000, "dUSDC balance too low to trade.");
    
    // Transfer all dUSDC from the caller to this contract (requires approval).
    require(_dusdc322.TRANSFERFROM461(msg.sender, address(this), dUSDCBalance));

    // Redeem dUSDC for cUSDC.
    uint256 cUSDCBalance = _dusdc322.REDEEMTOCTOKEN669(dUSDCBalance);
    
    // Use cUSDC balance and quoted exchange rate to derive required cDai.
    uint256 minimumCDai = _GETMINIMUMCDAI544(cUSDCBalance, quotedExchangeRate);
    
    // Exchange cUSDC for cDai using Curve.
    _curve556.EXCHANGE372(1, 0, cUSDCBalance, minimumCDai, now + 1);
    
    // Get the received cDai and ensure it meets the requirement.
    uint256 cDaiBalance = _cdai637.BALANCEOF517(address(this));
    require(
      cDaiBalance >= minimumCDai,
      "Realized exchange rate differs from quoted rate by over 1%."
    );
    
    // Mint dDai using the received cDai.
    uint256 dDaiBalance = _ddai633.MINTVIACTOKEN914(_cdai637.BALANCEOF517(address(this)));
    
    // Transfer the received dDai to the caller.
    require(_ddai633.TRANSFER934(msg.sender, dDaiBalance));
  }

  function TRADEDUSDCFORDDAIATANYRATE272() external {	//inject NONSTANDARD NAMING
    // Get the total dUSDC balance of the caller.
    uint256 dUSDCBalance = _dusdc322.BALANCEOF517(msg.sender);
    require(dUSDCBalance > 100000, "dUSDC balance too low to trade.");
    
    // Transfer all dUSDC from the caller to this contract (requires approval).
    require(_dusdc322.TRANSFERFROM461(msg.sender, address(this), dUSDCBalance));
    
    // Redeem dUSDC for cUSDC.
    uint256 cUSDCBalance = _dusdc322.REDEEMTOCTOKEN669(dUSDCBalance);
    
    // Exchange cUSDC for any amount of cDai using Curve.
    _curve556.EXCHANGE372(1, 0, cUSDCBalance, 0, now + 1);
    
    // Mint dDai using the received cDai.
    uint256 dDaiBalance = _ddai633.MINTVIACTOKEN914(_cdai637.BALANCEOF517(address(this)));
    
    // Transfer the received dDai to the caller.
    require(_ddai633.TRANSFER934(msg.sender, dDaiBalance));
  }

  function GETEXCHANGERATEANDEXPECTEDDAI84(uint256 usdc) external view returns (	//inject NONSTANDARD NAMING
    uint256 exchangeRate,
    uint256 exchangeRateUnderlying,
    uint256 dai
  ) {
    if (usdc == 0) {
      return (0, 0, 0);
    }

    uint256 cUSDCEquivalent = (
      usdc.MUL716(_scaling_factor496)
    ).DIV5(_cusdc384.EXCHANGERATESTORED202());
    
    uint256 cDaiEquivalent;
    (exchangeRate, cDaiEquivalent) = _GETEXCHANGERATEANDEXPECTEDCDAI97(
      cUSDCEquivalent
    );
    
    dai = (
      cDaiEquivalent.MUL716(_cdai637.EXCHANGERATESTORED202())
    ).DIV5(_scaling_factor496);
    
    // Account for decimals and scale up 1e18 to get USDC/Dai rate
    exchangeRateUnderlying = (dai.MUL716(1e6)).DIV5(usdc);
  }

  function GETEXCHANGERATEANDEXPECTEDDAIFORACCOUNTWITHCUSDC562(	//inject NONSTANDARD NAMING
    address account
  ) external view returns (
    uint256 exchangeRate,
    uint256 exchangeRateUnderlying,
    uint256 usdc,
    uint256 dai
  ) {
    // Get the total cUSDC balance of the caller.
    uint256 cUSDCBalance = _cusdc384.BALANCEOF517(account);
    
    if (cUSDCBalance == 0) {
      return (0, 0, 0, 0);
    }
    
    usdc = cUSDCBalance.MUL716(
      _cusdc384.EXCHANGERATESTORED202()
    ).DIV5(_scaling_factor496);
    
    uint256 cDaiEquivalent;
    (exchangeRate, cDaiEquivalent) = _GETEXCHANGERATEANDEXPECTEDCDAI97(
      cUSDCBalance
    );
    
    dai = (
      cDaiEquivalent.MUL716(_cdai637.EXCHANGERATESTORED202())
    ).DIV5(_scaling_factor496);
    
    // Account for decimals and scale up 1e18 to get USDC/Dai rate
    exchangeRateUnderlying = (dai.MUL716(1e6)).DIV5(usdc);
  }

  function GETEXCHANGERATEANDEXPECTEDDAIFORACCOUNTWITHDUSDC689(	//inject NONSTANDARD NAMING
    address account
  ) external view returns (
    uint256 exchangeRate,
    uint256 exchangeRateUnderlying,
    uint256 usdc,
    uint256 dai
  ) {
    // Get the total dUSDC balance of the caller.
    uint256 dUSDCBalance = _dusdc322.BALANCEOF517(account);
    
    if (dUSDCBalance == 0) {
      return (0, 0, 0, 0);
    }
    
    usdc = dUSDCBalance.MUL716(
      _dusdc322.EXCHANGERATECURRENT250()
    ).DIV5(_scaling_factor496);

    uint256 cUSDCEquivalent = (
      usdc.MUL716(_scaling_factor496)
    ).DIV5(_cusdc384.EXCHANGERATESTORED202());
    
    uint256 cDaiEquivalent;
    (exchangeRate, cDaiEquivalent) = _GETEXCHANGERATEANDEXPECTEDCDAI97(
      cUSDCEquivalent
    );
    
    dai = (
      cDaiEquivalent.MUL716(_cdai637.EXCHANGERATESTORED202())
    ).DIV5(_scaling_factor496);
    
    // Account for decimals and scale up 1e18 to get USDC/Dai rate
    exchangeRateUnderlying = (dai.MUL716(1e6)).DIV5(usdc);
  }

  function _GETEXCHANGERATEANDEXPECTEDCDAI97(uint256 cUSDC) internal view returns (	//inject NONSTANDARD NAMING
    uint256 exchangeRate,
    uint256 cDai
  ) {
    cDai = _curve556.GET_DY825(1, 0, cUSDC);
    if (cDai == 0) {
      exchangeRate = 0;
    } else {
      exchangeRate = (cUSDC.MUL716(_scaling_factor496)).DIV5(cDai);
    }
  }

  function _GETMINIMUMCDAI544(uint256 cUSDC, uint256 quotedExchangeRate) internal pure returns (	//inject NONSTANDARD NAMING
    uint256 minimumCDai
) {
    uint256 quotedCDai = (cUSDC.MUL716(quotedExchangeRate)).DIV5(_scaling_factor496);
    minimumCDai = (quotedCDai.MUL716(99)).DIV5(100);
  }
}