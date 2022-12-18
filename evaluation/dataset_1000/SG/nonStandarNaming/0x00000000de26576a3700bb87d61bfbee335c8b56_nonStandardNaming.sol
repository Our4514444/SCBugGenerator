                                                                 

pragma solidity 0.5.11; // optimization runs: 200, evm version: petersburg


                                                                                                                                 
interface DTokenInterface {
  // Events bear similarity to Compound's supply-related events.
  event MINT407(address minter, uint256 mintAmount, uint256 mintDTokens);	//inject NONSTANDARD NAMING
  event REDEEM553(address redeemer, uint256 redeemAmount, uint256 redeemDTokens);	//inject NONSTANDARD NAMING
  event ACCRUE488(uint256 dTokenExchangeRate, uint256 cTokenExchangeRate);	//inject NONSTANDARD NAMING
  event COLLECTSURPLUS551(uint256 surplusAmount, uint256 surplusCTokens);	//inject NONSTANDARD NAMING

  // The block number and cToken + dToken exchange rates are updated on accrual.
  struct AccrualIndex {
    uint112 dTokenExchangeRate;
    uint112 cTokenExchangeRate;
    uint32 block;
  }

  // These external functions trigger accrual on the dToken and backing cToken.
  function MINT563(uint256 underlyingToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING
  function REDEEM75(uint256 dTokensToBurn) external returns (uint256 underlyingReceived);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYING64(uint256 underelyingToReceive) external returns (uint256 dTokensBurned);	//inject NONSTANDARD NAMING
  function PULLSURPLUS757() external returns (uint256 cTokenSurplus);	//inject NONSTANDARD NAMING

  // These external functions only trigger accrual on the dToken.
  function MINTVIACTOKEN770(uint256 cTokensToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING
  function REDEEMTOCTOKEN726(uint256 dTokensToBurn) external returns (uint256 cTokensReceived);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYINGTOCTOKEN611(uint256 underlyingToReceive) external returns (uint256 dTokensBurned);	//inject NONSTANDARD NAMING
  function ACCRUEINTEREST220() external;	//inject NONSTANDARD NAMING
  function TRANSFERUNDERLYING2(	//inject NONSTANDARD NAMING
    address recipient, uint256 underlyingEquivalentAmount
  ) external returns (bool success);
  function TRANSFERUNDERLYINGFROM690(	//inject NONSTANDARD NAMING
    address sender, address recipient, uint256 underlyingEquivalentAmount
  ) external returns (bool success);

  // This function provides basic meta-tx support and does not trigger accrual.
  function MODIFYALLOWANCEVIAMETATRANSACTION366(	//inject NONSTANDARD NAMING
    address owner,
    address spender,
    uint256 value,
    bool increase,
    uint256 expiration,
    bytes32 salt,
    bytes calldata signatures
  ) external returns (bool success);

  // View and pure functions do not trigger accrual on the dToken or the cToken.
  function GETMETATRANSACTIONMESSAGEHASH305(	//inject NONSTANDARD NAMING
    bytes4 functionSelector, bytes calldata arguments, uint256 expiration, bytes32 salt
  ) external view returns (bytes32 digest, bool valid);
  function TOTALSUPPLYUNDERLYING219() external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOFUNDERLYING920(address account) external view returns (uint256 underlyingBalance);	//inject NONSTANDARD NAMING
  function EXCHANGERATECURRENT467() external view returns (uint256 dTokenExchangeRate);	//inject NONSTANDARD NAMING
  function SUPPLYRATEPERBLOCK660() external view returns (uint256 dTokenInterestRate);	//inject NONSTANDARD NAMING
  function ACCRUALBLOCKNUMBER688() external view returns (uint256 blockNumber);	//inject NONSTANDARD NAMING
  function GETSURPLUS894() external view returns (uint256 cTokenSurplus);	//inject NONSTANDARD NAMING
  function GETSURPLUSUNDERLYING912() external view returns (uint256 underlyingSurplus);	//inject NONSTANDARD NAMING
  function GETSPREADPERBLOCK419() external view returns (uint256 rateSpread);	//inject NONSTANDARD NAMING
  function GETVERSION34() external pure returns (uint256 version);	//inject NONSTANDARD NAMING
  function GETCTOKEN728() external pure returns (address cToken);	//inject NONSTANDARD NAMING
  function GETUNDERLYING315() external pure returns (address underlying);	//inject NONSTANDARD NAMING
}


interface ERC20Interface {
  event TRANSFER874(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
  event APPROVAL865(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

  function TRANSFER645(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
  function ALLOWANCE699(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
  function APPROVE381(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM635(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

  function TOTALSUPPLY894() external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF612(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface ERC1271Interface {
  function ISVALIDSIGNATURE303(	//inject NONSTANDARD NAMING
    bytes calldata data, bytes calldata signature
  ) external view returns (bytes4 magicValue);
}


interface CTokenInterface {
  function MINT563(uint256 mintAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING
  function REDEEM75(uint256 redeemAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYING64(uint256 redeemAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING
  function ACCRUEINTEREST220() external returns (uint256 err);	//inject NONSTANDARD NAMING
  function TRANSFER645(address recipient, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM635(address sender, address recipient, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE381(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
  function BALANCEOFUNDERLYING920(address account) external returns (uint256 balance);	//inject NONSTANDARD NAMING
  function EXCHANGERATECURRENT467() external returns (uint256 exchangeRate);	//inject NONSTANDARD NAMING

  function GETCASH594() external view returns (uint256);	//inject NONSTANDARD NAMING
  function TOTALSUPPLY894() external view returns (uint256 supply);	//inject NONSTANDARD NAMING
  function TOTALBORROWS121() external view returns (uint256 borrows);	//inject NONSTANDARD NAMING
  function TOTALRESERVES725() external view returns (uint256 reserves);	//inject NONSTANDARD NAMING
  function INTERESTRATEMODEL715() external view returns (address model);	//inject NONSTANDARD NAMING
  function RESERVEFACTORMANTISSA291() external view returns (uint256 factor);	//inject NONSTANDARD NAMING
  function SUPPLYRATEPERBLOCK660() external view returns (uint256 rate);	//inject NONSTANDARD NAMING
  function EXCHANGERATESTORED444() external view returns (uint256 rate);	//inject NONSTANDARD NAMING
  function ACCRUALBLOCKNUMBER688() external view returns (uint256 blockNumber);	//inject NONSTANDARD NAMING
  function BALANCEOF612(address account) external view returns (uint256 balance);	//inject NONSTANDARD NAMING
  function ALLOWANCE699(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface CUSDCInterestRateModelInterface {
  function GETBORROWRATE421(	//inject NONSTANDARD NAMING
    uint256 cash, uint256 borrows, uint256 reserves
  ) external view returns (uint256 err, uint256 borrowRate);
}


library SafeMath {
    function ADD29(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    function SUB831(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;
        return c;
    }

    function MUL485(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) return 0;
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }

    function DIV834(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        return c;
    }

    function MOD500(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}


                                                                                                                                                                                            
contract DharmaTokenOverrides {
                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function _GETCURRENTCTOKENRATES650() internal view returns (	//inject NONSTANDARD NAMING
    uint256 exchangeRate, uint256 supplyRate
  );

                                                                                                                                          
  function _GETUNDERLYINGNAME921() internal pure returns (string memory underlyingName);	//inject NONSTANDARD NAMING

                                                                                                                                                     
  function _GETUNDERLYING943() internal pure returns (address underlying);	//inject NONSTANDARD NAMING

                                                                                                                                          
  function _GETCTOKENSYMBOL233() internal pure returns (string memory cTokenSymbol);	//inject NONSTANDARD NAMING

                                                                                                                                            
  function _GETCTOKEN875() internal pure returns (address cToken);	//inject NONSTANDARD NAMING

                                                                                                                      
  function _GETDTOKENNAME760() internal pure returns (string memory dTokenName);	//inject NONSTANDARD NAMING

                                                                                                                          
  function _GETDTOKENSYMBOL268() internal pure returns (string memory dTokenSymbol);	//inject NONSTANDARD NAMING

                                                                                                                                                                                            
  function _GETVAULT21() internal pure returns (address vault);	//inject NONSTANDARD NAMING
}


                                                                                                                                               
contract DharmaTokenHelpers is DharmaTokenOverrides {
  using SafeMath for uint256;

  uint8 internal constant _decimals795 = 8; // matches cToken decimals	//inject NONSTANDARD NAMING
  uint256 internal constant _scaling_factor640 = 1e18;	//inject NONSTANDARD NAMING
  uint256 internal constant _scaling_factor_minus_one732 = 999999999999999999;	//inject NONSTANDARD NAMING
  uint256 internal constant _half_of_scaling_factor49 = 5e17;	//inject NONSTANDARD NAMING
  uint256 internal constant _compound_success570 = 0;	//inject NONSTANDARD NAMING
  uint256 internal constant _max_uint_112239 = 5192296858534827628530496329220095;	//inject NONSTANDARD NAMING
                                                        
  uint256 internal constant _max_unmalleable_s274 = (	//inject NONSTANDARD NAMING
    0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0
  );
                                                       

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function _CHECKCOMPOUNDINTERACTION622(	//inject NONSTANDARD NAMING
    bytes4 functionSelector, bool ok, bytes memory data
  ) internal pure {
    CTokenInterface cToken;
    if (ok) {
      if (
        functionSelector == cToken.TRANSFER645.selector ||
        functionSelector == cToken.TRANSFERFROM635.selector
      ) {
        require(
          abi.decode(data, (bool)), string(
            abi.encodePacked(
              "Compound ",
              _GETCTOKENSYMBOL233(),
              " contract returned false on calling ",
              _GETFUNCTIONNAME621(functionSelector),
              "."
            )
          )
        );
      } else {
        uint256 compoundError = abi.decode(data, (uint256)); // throw on no data
        if (compoundError != _compound_success570) {
          revert(
            string(
              abi.encodePacked(
                "Compound ",
                _GETCTOKENSYMBOL233(),
                " contract returned error code ",
                uint8((compoundError / 10) + 48),
                uint8((compoundError % 10) + 48),
                " on calling ",
                _GETFUNCTIONNAME621(functionSelector),
                "."
              )
            )
          );
        }
      }
    } else {
      revert(
        string(
          abi.encodePacked(
            "Compound ",
            _GETCTOKENSYMBOL233(),
            " contract reverted while attempting to call ",
            _GETFUNCTIONNAME621(functionSelector),
            ": ",
            _DECODEREVERTREASON755(data)
          )
        )
      );
    }
  }

                                                                                                                                                                                                                         
  function _GETFUNCTIONNAME621(	//inject NONSTANDARD NAMING
    bytes4 functionSelector
  ) internal pure returns (string memory functionName) {
    CTokenInterface cToken;
    if (functionSelector == cToken.MINT563.selector) {
      functionName = "mint";
    } else if (functionSelector == cToken.REDEEM75.selector) {
      functionName = "redeem";
    } else if (functionSelector == cToken.REDEEMUNDERLYING64.selector) {
      functionName = "redeemUnderlying";
    } else if (functionSelector == cToken.TRANSFERFROM635.selector) {
      functionName = "transferFrom";
    } else if (functionSelector == cToken.TRANSFER645.selector) {
      functionName = "transfer";
    } else if (functionSelector == cToken.ACCRUEINTEREST220.selector) {
      functionName = "accrueInterest";
    } else {
      functionName = "an unknown function";
    }
  }

                                                                                                                                                                                                                                                                                        
  function _DECODEREVERTREASON755(	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                         
  function _GETTRANSFERFAILUREMESSAGE697() internal pure returns (	//inject NONSTANDARD NAMING
    string memory message
  ) {
    message = string(
      abi.encodePacked(_GETUNDERLYINGNAME921(), " transfer failed.")
    );
  }

                                                                                                                                                                                                                                                    
  function _SAFEUINT112501(uint256 input) internal pure returns (uint112 output) {	//inject NONSTANDARD NAMING
    require(input <= _max_uint_112239, "Overflow on conversion to uint112.");
    output = uint112(input);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function _FROMUNDERLYING738(	//inject NONSTANDARD NAMING
    uint256 underlying, uint256 exchangeRate, bool roundUp
  ) internal pure returns (uint256 amount) {
    if (roundUp) {
      amount = (
        (underlying.MUL485(_scaling_factor640)).ADD29(exchangeRate.SUB831(1))
      ).DIV834(exchangeRate);
    } else {
      amount = (underlying.MUL485(_scaling_factor640)).DIV834(exchangeRate);
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function _TOUNDERLYING522(	//inject NONSTANDARD NAMING
    uint256 amount, uint256 exchangeRate, bool roundUp
  ) internal pure returns (uint256 underlying) {
    if (roundUp) {
      underlying = (
        (amount.MUL485(exchangeRate).ADD29(_scaling_factor_minus_one732)
      ) / _scaling_factor640);
    } else {
      underlying = amount.MUL485(exchangeRate) / _scaling_factor640;
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function _FROMUNDERLYINGANDBACK863(	//inject NONSTANDARD NAMING
    uint256 underlying, uint256 exchangeRate, bool roundUpOne, bool roundUpTwo
  ) internal pure returns (uint256 amount, uint256 adjustedUnderlying) {
    amount = _FROMUNDERLYING738(underlying, exchangeRate, roundUpOne);
    adjustedUnderlying = _TOUNDERLYING522(amount, exchangeRate, roundUpTwo);
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
contract DharmaTokenV1 is ERC20Interface, DTokenInterface, DharmaTokenHelpers {
  // Set the version of the Dharma Token as a constant.
  uint256 private constant _dtoken_version457 = 1;	//inject NONSTANDARD NAMING

  // Set block number and dToken + cToken exchange rate in slot zero on accrual.
  AccrualIndex private _accrualIndex;

  // Slot one tracks the total issued dTokens.
  uint256 private _totalSupply;

  // Slots two and three are entrypoints into balance and allowance mappings.
  mapping (address => uint256) private _balances;
  mapping (address => mapping (address => uint256)) private _allowances;

  // Slot four is an entrypoint into a mapping for used meta-transaction hashes.
  mapping (bytes32 => bool) private _executedMetaTxs;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function MINT563(	//inject NONSTANDARD NAMING
    uint256 underlyingToSupply
  ) external returns (uint256 dTokensMinted) {
    // Instantiate interfaces for the underlying token and the backing cToken.
    ERC20Interface underlying = ERC20Interface(_GETUNDERLYING943());
    CTokenInterface cToken = CTokenInterface(_GETCTOKEN875());

    // Pull in underlying - ensure that this contract has sufficient allowance.
    require(
      underlying.TRANSFERFROM635(msg.sender, address(this), underlyingToSupply),
      _GETTRANSFERFAILUREMESSAGE697()
    );

    // Use underlying to mint cTokens and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(cToken).call(abi.encodeWithSelector(
      cToken.MINT563.selector, underlyingToSupply
    ));
    _CHECKCOMPOUNDINTERACTION622(cToken.MINT563.selector, ok, data);

    // Accrue after the Compound mint to avoid duplicating accrual calculations.
    (uint256 dTokenExchangeRate, uint256 cTokenExchangeRate) = _ACCRUE980(false);

    // Get underlying equivalent of minted cTokens to prevent "dust" griefing.
    (, uint256 underlyingEquivalent) = _FROMUNDERLYINGANDBACK863(
      underlyingToSupply, cTokenExchangeRate, false, false
    );

    // Determine dTokens to mint using underlying equivalent and exchange rate.
    dTokensMinted = _FROMUNDERLYING738(
      underlyingEquivalent, dTokenExchangeRate, false
    );

    // Mint dTokens to the caller.
    _MINT933(msg.sender, underlyingToSupply, dTokensMinted);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function MINTVIACTOKEN770(	//inject NONSTANDARD NAMING
    uint256 cTokensToSupply
  ) external returns (uint256 dTokensMinted) {
    // Instantiate the interface for the backing cToken.
    CTokenInterface cToken = CTokenInterface(_GETCTOKEN875());

    // Pull in cTokens - ensure that this contract has sufficient allowance.
    (bool ok, bytes memory data) = address(cToken).call(abi.encodeWithSelector(
      cToken.TRANSFERFROM635.selector, msg.sender, address(this), cTokensToSupply
    ));
    _CHECKCOMPOUNDINTERACTION622(cToken.TRANSFERFROM635.selector, ok, data);

    // Accrue interest and retrieve current cToken and dToken exchange rates.
    (uint256 dTokenExchangeRate, uint256 cTokenExchangeRate) = _ACCRUE980(true);

    // Determine the underlying equivalent of the supplied cToken amount.
    uint256 underlyingEquivalent = _TOUNDERLYING522(
      cTokensToSupply, cTokenExchangeRate, false
    );

    // Determine dTokens to mint using underlying equivalent and exchange rate.
    dTokensMinted = _FROMUNDERLYING738(
      underlyingEquivalent, dTokenExchangeRate, false
    );

    // Mint dTokens to the caller.
    _MINT933(msg.sender, underlyingEquivalent, dTokensMinted);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                     
  function REDEEM75(	//inject NONSTANDARD NAMING
    uint256 dTokensToBurn
  ) external returns (uint256 underlyingReceived) {
    // Instantiate interfaces for the underlying token and the backing cToken.
    ERC20Interface underlying = ERC20Interface(_GETUNDERLYING943());
    CTokenInterface cToken = CTokenInterface(_GETCTOKEN875());

    // Accrue interest and retrieve current dToken and cToken exchange rates.
    (uint256 dTokenExchangeRate, uint256 cTokenExchangeRate) = _ACCRUE980(true);

    // Determine the equivalent underlying value of the dTokens to be burned.
    uint256 underlyingEquivalent = _TOUNDERLYING522(
      dTokensToBurn, dTokenExchangeRate, false
    );

    // Get minted cTokens and underlying equivalent to prevent "dust" griefing.
    uint256 cTokenEquivalent;
    (cTokenEquivalent, underlyingReceived) = _FROMUNDERLYINGANDBACK863(
      underlyingEquivalent, cTokenExchangeRate, false, false
    );

    // Burn the dTokens.
    _BURN928(msg.sender, underlyingReceived, dTokensToBurn);

    // Use cTokens to redeem underlying and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(cToken).call(abi.encodeWithSelector(
      cToken.REDEEM75.selector, cTokenEquivalent
    ));
    _CHECKCOMPOUNDINTERACTION622(cToken.REDEEM75.selector, ok, data);

    // Send the redeemed underlying tokens to the caller.
    require(
      underlying.TRANSFER645(msg.sender, underlyingReceived),
      _GETTRANSFERFAILUREMESSAGE697()
    );
  }

                                                                                                                                                                                                                                                                                                                                     
  function REDEEMTOCTOKEN726(	//inject NONSTANDARD NAMING
    uint256 dTokensToBurn
  ) external returns (uint256 cTokensReceived) {
    // Instantiate the interface for the backing cToken.
    CTokenInterface cToken = CTokenInterface(_GETCTOKEN875());

    // Accrue interest and retrieve current cToken and dToken exchange rates.
    (uint256 dTokenExchangeRate, uint256 cTokenExchangeRate) = _ACCRUE980(true);

    // Determine the underlying token value of the dTokens to be burned.
    uint256 underlyingEquivalent = _TOUNDERLYING522(
      dTokensToBurn, dTokenExchangeRate, false
    );

    // Determine amount of cTokens corresponding to underlying equivalent value.
    cTokensReceived = _FROMUNDERLYING738(
      underlyingEquivalent, cTokenExchangeRate, false
    );

    // Burn the dTokens.
    _BURN928(msg.sender, underlyingEquivalent, dTokensToBurn);

    // Transfer cTokens to the caller and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(cToken).call(abi.encodeWithSelector(
      cToken.TRANSFER645.selector, msg.sender, cTokensReceived
    ));
    _CHECKCOMPOUNDINTERACTION622(cToken.TRANSFER645.selector, ok, data);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function REDEEMUNDERLYING64(	//inject NONSTANDARD NAMING
    uint256 underlyingToReceive
  ) external returns (uint256 dTokensBurned) {
    // Instantiate interfaces for the underlying token and the backing cToken.
    ERC20Interface underlying = ERC20Interface(_GETUNDERLYING943());
    CTokenInterface cToken = CTokenInterface(_GETCTOKEN875());

    // Use cTokens to redeem underlying and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(cToken).call(abi.encodeWithSelector(
      cToken.REDEEMUNDERLYING64.selector, underlyingToReceive
    ));
    _CHECKCOMPOUNDINTERACTION622(cToken.REDEEMUNDERLYING64.selector, ok, data);

    // Accrue after the Compound redeem to avoid duplicating calculations.
    (uint256 dTokenExchangeRate, uint256 cTokenExchangeRate) = _ACCRUE980(false);

    // Get underlying equivalent of redeemed cTokens to prevent "dust" griefing.
    (, uint256 underlyingEquivalent) = _FROMUNDERLYINGANDBACK863(
      underlyingToReceive, cTokenExchangeRate, true, true // rounding up both
    );

    // Determine the dTokens to redeem using the exchange rate, rounding up.
    dTokensBurned = _FROMUNDERLYING738(
      underlyingEquivalent, dTokenExchangeRate, true
    );

    // Burn the dTokens.
    _BURN928(msg.sender, underlyingToReceive, dTokensBurned);

    // Send the redeemed underlying tokens to the caller.
    require(
      underlying.TRANSFER645(msg.sender, underlyingToReceive),
      _GETTRANSFERFAILUREMESSAGE697()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                       
  function REDEEMUNDERLYINGTOCTOKEN611(	//inject NONSTANDARD NAMING
    uint256 underlyingToReceive
  ) external returns (uint256 dTokensBurned) {
    // Instantiate the interface for the backing cToken.
    CTokenInterface cToken = CTokenInterface(_GETCTOKEN875());

    // Accrue interest and retrieve current cToken and dToken exchange rates.
    (uint256 dTokenExchangeRate, uint256 cTokenExchangeRate) = _ACCRUE980(true);

    // Get received cTokens and underlying equivalent (prevent "dust" griefing).
    (
      uint256 cTokensToReceive, uint256 underlyingEquivalent
    ) = _FROMUNDERLYINGANDBACK863(
      underlyingToReceive, cTokenExchangeRate, false, true // round down cTokens
    );

    // Determine redeemed dTokens using equivalent underlying value, rounded up.
    dTokensBurned = _FROMUNDERLYING738(
      underlyingEquivalent, dTokenExchangeRate, true
    );

    // Burn the dTokens.
    _BURN928(msg.sender, underlyingToReceive, dTokensBurned);

    // Transfer cTokens to the caller and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(cToken).call(abi.encodeWithSelector(
      cToken.TRANSFER645.selector, msg.sender, cTokensToReceive
    ));
    _CHECKCOMPOUNDINTERACTION622(cToken.TRANSFER645.selector, ok, data);
  }

                                                                                                                                                                                                                                                                                                                                     
  function PULLSURPLUS757() external returns (uint256 cTokenSurplus) {	//inject NONSTANDARD NAMING
    // Instantiate the interface for the backing cToken.
    CTokenInterface cToken = CTokenInterface(_GETCTOKEN875());

    // Accrue interest on the cToken and ensure that the operation succeeds.
    (bool ok, bytes memory data) = address(cToken).call(abi.encodeWithSelector(
      cToken.ACCRUEINTEREST220.selector
    ));
    _CHECKCOMPOUNDINTERACTION622(cToken.ACCRUEINTEREST220.selector, ok, data);

    // Accrue interest on the dToken, reusing the stored cToken exchange rate.
    _ACCRUE980(false);

    // Determine cToken surplus in underlying (cToken value - dToken value).
    uint256 underlyingSurplus;
    (underlyingSurplus, cTokenSurplus) = _GETSURPLUS520();

    // Transfer cToken surplus to vault and ensure that the operation succeeds.
    (ok, data) = address(cToken).call(abi.encodeWithSelector(
      cToken.TRANSFER645.selector, _GETVAULT21(), cTokenSurplus
    ));
    _CHECKCOMPOUNDINTERACTION622(cToken.TRANSFER645.selector, ok, data);

    emit COLLECTSURPLUS551(underlyingSurplus, cTokenSurplus);
  }

                                                                                                                                                                                                                                                                     
  function ACCRUEINTEREST220() external {	//inject NONSTANDARD NAMING
    // Accrue interest on the dToken.
    _ACCRUE980(true);
  }

                                                                                                                                                                                                                                                                                               
  function TRANSFER645(	//inject NONSTANDARD NAMING
    address recipient, uint256 amount
  ) external returns (bool success) {
    _TRANSFER137(msg.sender, recipient, amount);
    success = true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                
  function TRANSFERUNDERLYING2(	//inject NONSTANDARD NAMING
    address recipient, uint256 underlyingEquivalentAmount
  ) external returns (bool success) {
    // Accrue interest and retrieve the current dToken exchange rate.
    (uint256 dTokenExchangeRate, ) = _ACCRUE980(true);

    // Determine dToken amount to transfer using the exchange rate, rounded up.
    uint256 dTokenAmount = _FROMUNDERLYING738(
      underlyingEquivalentAmount, dTokenExchangeRate, true
    );

    // Transfer the dTokens.
    _TRANSFER137(msg.sender, recipient, dTokenAmount);
    success = true;
  }

                                                                                                                                                                                                                                                                                                                 
  function APPROVE381(	//inject NONSTANDARD NAMING
    address spender, uint256 value
  ) external returns (bool success) {
    _APPROVE895(msg.sender, spender, value);
    success = true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                      
  function TRANSFERFROM635(	//inject NONSTANDARD NAMING
    address sender, address recipient, uint256 amount
  ) external returns (bool success) {
    _TRANSFERFROM969(sender, recipient, amount);
    success = true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function TRANSFERUNDERLYINGFROM690(	//inject NONSTANDARD NAMING
    address sender, address recipient, uint256 underlyingEquivalentAmount
  ) external returns (bool success) {
    // Accrue interest and retrieve the current dToken exchange rate.
    (uint256 dTokenExchangeRate, ) = _ACCRUE980(true);

    // Determine dToken amount to transfer using the exchange rate, rounded up.
    uint256 dTokenAmount = _FROMUNDERLYING738(
      underlyingEquivalentAmount, dTokenExchangeRate, true
    );

    // Transfer the dTokens and adjust allowance accordingly.
    _TRANSFERFROM969(sender, recipient, dTokenAmount);
    success = true;
  }

                                                                                                                                                                                                                                                                                                                      
  function INCREASEALLOWANCE972(	//inject NONSTANDARD NAMING
    address spender, uint256 addedValue
  ) external returns (bool success) {
    _APPROVE895(
      msg.sender, spender, _allowances[msg.sender][spender].ADD29(addedValue)
    );
    success = true;
  }

                                                                                                                                                                                                                                                                                                                         
  function DECREASEALLOWANCE522(	//inject NONSTANDARD NAMING
    address spender, uint256 subtractedValue
  ) external returns (bool success) {
    _APPROVE895(
      msg.sender, spender, _allowances[msg.sender][spender].SUB831(subtractedValue)
    );
    success = true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function MODIFYALLOWANCEVIAMETATRANSACTION366(	//inject NONSTANDARD NAMING
    address owner,
    address spender,
    uint256 value,
    bool increase,
    uint256 expiration,
    bytes32 salt,
    bytes calldata signatures
  ) external returns (bool success) {
    require(expiration == 0 || now <= expiration, "Meta-transaction expired.");

    // Construct the meta-transaction's message hash based on relevant context.
    bytes memory context = abi.encodePacked(
      address(this),
      // _DTOKEN_VERSION,
      this.MODIFYALLOWANCEVIAMETATRANSACTION366.selector,
      expiration,
      salt,
      abi.encode(owner, spender, value, increase)
    );
    bytes32 messageHash = keccak256(context);

    // Ensure message hash has never been used before and register it as used.
    require(!_executedMetaTxs[messageHash], "Meta-transaction already used.");
    _executedMetaTxs[messageHash] = true;

    // Construct the digest to compare signatures against using EIP-191 0x45.
    bytes32 digest = keccak256(
      abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash)
    );

    // Calculate new allowance by applying modification to current allowance.
    uint256 currentAllowance = _allowances[owner][spender];
    uint256 newAllowance = (
      increase ? currentAllowance.ADD29(value) : currentAllowance.SUB831(value)
    );

    // Use EIP-1271 if owner is a contract - otherwise, use ecrecover.
    if (_ISCONTRACT152(owner)) {
      // Validate via ERC-1271 against the owner account.
      bytes memory data = abi.encode(digest, context);
      bytes4 magic = ERC1271Interface(owner).ISVALIDSIGNATURE303(data, signatures);
      require(magic == bytes4(0x20c13b0b), "Invalid signatures.");
    } else {
      // Validate via ecrecover against the owner account.
      _VERIFYRECOVER430(owner, digest, signatures);
    }

    // Modify the allowance.
    _APPROVE895(owner, spender, newAllowance);
    success = true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function GETMETATRANSACTIONMESSAGEHASH305(	//inject NONSTANDARD NAMING
    bytes4 functionSelector,
    bytes calldata arguments,
    uint256 expiration,
    bytes32 salt
  ) external view returns (bytes32 messageHash, bool valid) {
    // Construct the meta-transaction's message hash based on relevant context.
    messageHash = keccak256(
      abi.encodePacked(
        address(this), functionSelector, expiration, salt, arguments
      )
    );

    // The meta-transaction is valid if it has not been used and is not expired.
    valid = (
      !_executedMetaTxs[messageHash] && (expiration == 0 || now <= expiration)
    );
  }

                                                                                                     
  function TOTALSUPPLY894() external view returns (uint256 dTokenTotalSupply) {	//inject NONSTANDARD NAMING
    dTokenTotalSupply = _totalSupply;
  }

                                                                                                                                               
  function TOTALSUPPLYUNDERLYING219() external view returns (	//inject NONSTANDARD NAMING
    uint256 dTokenTotalSupplyInUnderlying
  ) {
    (uint256 dTokenExchangeRate, ,) = _GETEXCHANGERATES658(true);

    // Determine total value of all issued dTokens, denominated as underlying.
    dTokenTotalSupplyInUnderlying = _TOUNDERLYING522(
      _totalSupply, dTokenExchangeRate, false
    );
  }

                                                                                                                                                                                                             
  function BALANCEOF612(address account) external view returns (uint256 dTokens) {	//inject NONSTANDARD NAMING
    dTokens = _balances[account];
  }

                                                                                                                                                                                                                                                                   
  function BALANCEOFUNDERLYING920(	//inject NONSTANDARD NAMING
    address account
  ) external view returns (uint256 underlyingBalance) {
    // Get most recent dToken exchange rate by determining accrued interest.
    (uint256 dTokenExchangeRate, ,) = _GETEXCHANGERATES658(true);

    // Convert account balance to underlying equivalent using the exchange rate.
    underlyingBalance = _TOUNDERLYING522(
      _balances[account], dTokenExchangeRate, false
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                    
  function ALLOWANCE699(	//inject NONSTANDARD NAMING
    address owner, address spender
  ) external view returns (uint256 dTokenAllowance) {
    dTokenAllowance = _allowances[owner][spender];
  }

                                                                                                                                                  
  function EXCHANGERATECURRENT467() external view returns (	//inject NONSTANDARD NAMING
    uint256 dTokenExchangeRate
  ) {
    // Get most recent dToken exchange rate by determining accrued interest.
    (dTokenExchangeRate, ,) = _GETEXCHANGERATES658(true);
  }

                                                                                                                                                              
  function SUPPLYRATEPERBLOCK660() external view returns (	//inject NONSTANDARD NAMING
    uint256 dTokenInterestRate
  ) {
    (dTokenInterestRate,) = _GETRATEPERBLOCK951();
  }

                                                                                                                                                                     
  function ACCRUALBLOCKNUMBER688() external view returns (uint256 blockNumber) {	//inject NONSTANDARD NAMING
    blockNumber = _accrualIndex.block;
  }

                                                                                                                                                                                                              
  function GETSURPLUS894() external view returns (uint256 cTokenSurplus) {	//inject NONSTANDARD NAMING
    // Determine the cToken (cToken underlying value - dToken underlying value).
    (, cTokenSurplus) = _GETSURPLUS520();
  }

                                                                                                                                                                                                                                                                                      
  function GETSURPLUSUNDERLYING912() external view returns (	//inject NONSTANDARD NAMING
    uint256 underlyingSurplus
  ) {
    // Determine cToken surplus in underlying (cToken value - dToken value).
    (underlyingSurplus, ) = _GETSURPLUS520();
  }

                                                                                                                                                                                                                   
  function GETSPREADPERBLOCK419() external view returns (uint256 rateSpread) {	//inject NONSTANDARD NAMING
    (
      uint256 dTokenInterestRate, uint256 cTokenInterestRate
    ) = _GETRATEPERBLOCK951();
    rateSpread = cTokenInterestRate.SUB831(dTokenInterestRate);
  }

                                                                                                          
  function NAME362() external pure returns (string memory dTokenName) {	//inject NONSTANDARD NAMING
    dTokenName = _GETDTOKENNAME760();
  }

                                                                                                              
  function SYMBOL953() external pure returns (string memory dTokenSymbol) {	//inject NONSTANDARD NAMING
    dTokenSymbol = _GETDTOKENSYMBOL268();
  }

                                                                                                                                      
  function DECIMALS744() external pure returns (uint8 dTokenDecimals) {	//inject NONSTANDARD NAMING
    dTokenDecimals = _decimals795;
  }

                                                                                                         
  function GETVERSION34() external pure returns (uint256 version) {	//inject NONSTANDARD NAMING
    version = _dtoken_version457;
  }

                                                                                                                                                        
  function GETCTOKEN728() external pure returns (address cToken) {	//inject NONSTANDARD NAMING
    cToken = _GETCTOKEN875();
  }

                                                                                                                                                                        
  function GETUNDERLYING315() external pure returns (address underlying) {	//inject NONSTANDARD NAMING
    underlying = _GETUNDERLYING943();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function _ACCRUE980(bool compute) private returns (	//inject NONSTANDARD NAMING
    uint256 dTokenExchangeRate, uint256 cTokenExchangeRate
  ) {
    bool alreadyAccrued;
    (
      dTokenExchangeRate, cTokenExchangeRate, alreadyAccrued
    ) = _GETEXCHANGERATES658(compute);

    if (!alreadyAccrued) {
      // Update storage with dToken + cToken exchange rates as of current block.
      AccrualIndex storage accrualIndex = _accrualIndex;
      accrualIndex.dTokenExchangeRate = _SAFEUINT112501(dTokenExchangeRate);
      accrualIndex.cTokenExchangeRate = _SAFEUINT112501(cTokenExchangeRate);
      accrualIndex.block = uint32(block.number);
      emit ACCRUE488(dTokenExchangeRate, cTokenExchangeRate);
    }
  }

                                                                                                                                                                                                                                                                                                                                                                       
  function _MINT933(address account, uint256 exchanged, uint256 amount) private {	//inject NONSTANDARD NAMING
    require(
      exchanged > 0 && amount > 0, "Mint failed: insufficient funds supplied."
    );
    _totalSupply = _totalSupply.ADD29(amount);
    _balances[account] = _balances[account].ADD29(amount);

    emit MINT407(account, exchanged, amount);
    emit TRANSFER874(address(0), account, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                   
  function _BURN928(address account, uint256 exchanged, uint256 amount) private {	//inject NONSTANDARD NAMING
    require(
      exchanged > 0 && amount > 0, "Redeem failed: insufficient funds supplied."
    );

    uint256 balancePriorToBurn = _balances[account];
    require(
      balancePriorToBurn >= amount, "Supplied amount exceeds account balance."
    );

    _totalSupply = _totalSupply.SUB831(amount);
    _balances[account] = balancePriorToBurn - amount; // overflow checked above

    emit TRANSFER874(account, address(0), amount);
    emit REDEEM553(account, exchanged, amount);
  }

                                                                                                                                                                                                                                                                                                                                            
  function _TRANSFER137(	//inject NONSTANDARD NAMING
    address sender, address recipient, uint256 amount
  ) private {
    require(sender != address(0), "ERC20: transfer from the zero address");
    require(recipient != address(0), "ERC20: transfer to the zero address");

    uint256 senderBalance = _balances[sender];
    require(senderBalance >= amount, "Insufficient funds.");

    _balances[sender] = senderBalance - amount; // overflow checked above.
    _balances[recipient] = _balances[recipient].ADD29(amount);

    emit TRANSFER874(sender, recipient, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function _TRANSFERFROM969(	//inject NONSTANDARD NAMING
    address sender, address recipient, uint256 amount
  ) private {
    _TRANSFER137(sender, recipient, amount);
    uint256 callerAllowance = _allowances[sender][msg.sender];
    if (callerAllowance != uint256(-1)) {
      require(callerAllowance >= amount, "Insufficient allowance.");
      _APPROVE895(sender, msg.sender, callerAllowance - amount); // overflow safe.
    }
  }

                                                                                                                                                                                                                                                                                                                                            
  function _APPROVE895(address owner, address spender, uint256 value) private {	//inject NONSTANDARD NAMING
    require(owner != address(0), "ERC20: approve for the zero address");
    require(spender != address(0), "ERC20: approve to the zero address");

    _allowances[owner][spender] = value;
    emit APPROVAL865(owner, spender, value);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function _GETEXCHANGERATES658(bool compute) private view returns (	//inject NONSTANDARD NAMING
    uint256 dTokenExchangeRate, uint256 cTokenExchangeRate, bool fullyAccrued
  ) {
    // Get the stored accrual block and dToken + cToken exhange rates.
    AccrualIndex memory accrualIndex = _accrualIndex;
    uint256 storedDTokenExchangeRate = uint256(accrualIndex.dTokenExchangeRate);
    uint256 storedCTokenExchangeRate = uint256(accrualIndex.cTokenExchangeRate);
    uint256 accrualBlock = uint256(accrualIndex.block);

    // Use stored exchange rates if an accrual has already occurred this block.
    fullyAccrued = (accrualBlock == block.number);
    if (fullyAccrued) {
      dTokenExchangeRate = storedDTokenExchangeRate;
      cTokenExchangeRate = storedCTokenExchangeRate;
    } else {
      // Only compute cToken exchange rate if it has not accrued this block.
      if (compute) {
        // Get current cToken exchange rate; inheriting contract overrides this.
        (cTokenExchangeRate,) = _GETCURRENTCTOKENRATES650();
      } else {
        // Otherwise, get the stored cToken exchange rate.
        cTokenExchangeRate = CTokenInterface(_GETCTOKEN875()).EXCHANGERATESTORED444();
      }

      // Determine the cToken interest earned during the period.
      uint256 cTokenInterest = (
        (cTokenExchangeRate.MUL485(_scaling_factor640)).DIV834(storedCTokenExchangeRate)
      ).SUB831(_scaling_factor640);

      // Calculate dToken exchange rate by applying 90% of the cToken interest.
      dTokenExchangeRate = storedDTokenExchangeRate.MUL485(
        _scaling_factor640.ADD29(cTokenInterest.MUL485(9) / 10)
      ) / _scaling_factor640;
    }
  }

                                                                                                                                                                                                                                 
  function _GETSURPLUS520() private view returns (	//inject NONSTANDARD NAMING
    uint256 underlyingSurplus, uint256 cTokenSurplus
  ) {
    // Instantiate the interface for the backing cToken.
    CTokenInterface cToken = CTokenInterface(_GETCTOKEN875());

    (
      uint256 dTokenExchangeRate, uint256 cTokenExchangeRate,
    ) = _GETEXCHANGERATES658(true);

    // Determine value of all issued dTokens in the underlying, rounded up.
    uint256 dTokenUnderlying = _TOUNDERLYING522(
      _totalSupply, dTokenExchangeRate, true
    );

    // Determine value of all retained cTokens in the underlying, rounded down.
    uint256 cTokenUnderlying = _TOUNDERLYING522(
      cToken.BALANCEOF612(address(this)), cTokenExchangeRate, false
    );

    // Determine the size of the surplus in terms of underlying amount.
    underlyingSurplus = cTokenUnderlying > dTokenUnderlying
      ? cTokenUnderlying - dTokenUnderlying // overflow checked above
      : 0;

    // Determine the cToken equivalent of this surplus amount.
    cTokenSurplus = underlyingSurplus == 0
      ? 0
      : _FROMUNDERLYING738(underlyingSurplus, cTokenExchangeRate, false);
  }

                                                                                                                                                                                                         
  function _GETRATEPERBLOCK951() private view returns (	//inject NONSTANDARD NAMING
    uint256 dTokenSupplyRate, uint256 cTokenSupplyRate
  ) {
    (, cTokenSupplyRate) = _GETCURRENTCTOKENRATES650();
    dTokenSupplyRate = cTokenSupplyRate.MUL485(9) / 10;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function _ISCONTRACT152(address account) private view returns (bool isContract) {	//inject NONSTANDARD NAMING
    uint256 size;
    assembly { size := extcodesize(account) }
    isContract = size > 0;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                         
  function _VERIFYRECOVER430(	//inject NONSTANDARD NAMING
    address account, bytes32 digest, bytes memory signature
  ) private pure {
    // Ensure the signature length is correct.
    require(
      signature.length == 65,
      "Must supply a single 65-byte signature when owner is not a contract."
    );

    // Divide the signature in r, s and v variables.
    bytes32 r;
    bytes32 s;
    uint8 v;
    assembly {
      r := mload(add(signature, 0x20))
      s := mload(add(signature, 0x40))
      v := byte(0, mload(add(signature, 0x60)))
    }

    require(
      uint256(s) <= _max_unmalleable_s274,
      "Signature `s` value cannot be potentially malleable."
    );

    require(v == 27 || v == 28, "Signature `v` value not permitted.");

    require(account == ecrecover(digest, v, r, s), "Invalid signature.");
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
contract DharmaUSDCImplementationV1 is DharmaTokenV1 {
  string internal constant _name344 = "Dharma USD Coin";	//inject NONSTANDARD NAMING
  string internal constant _symbol687 = "dUSDC";	//inject NONSTANDARD NAMING
  string internal constant _underlying_name96 = "USD Coin";	//inject NONSTANDARD NAMING
  string internal constant _ctoken_symbol328 = "cUSDC";	//inject NONSTANDARD NAMING

  CTokenInterface internal constant _cusdc413 = CTokenInterface(	//inject NONSTANDARD NAMING
    0x39AA39c021dfbaE8faC545936693aC917d5E7563 // mainnet
  );

  ERC20Interface internal constant _usdc392 = ERC20Interface(	//inject NONSTANDARD NAMING
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 // mainnet
  );

  address internal constant _vault340 = 0x7e4A8391C728fEd9069B2962699AB416628B19Fa;	//inject NONSTANDARD NAMING

  uint256 internal constant _scaling_factor_squared460 = 1e36;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                             
  function _GETCURRENTCTOKENRATES650() internal view returns (	//inject NONSTANDARD NAMING
    uint256 exchangeRate, uint256 supplyRate
  ) {
    // Determine number of blocks that have elapsed since last cUSDC accrual.
    uint256 blockDelta = block.number.SUB831(_cusdc413.ACCRUALBLOCKNUMBER688());

    // Return stored values if accrual has already been performed this block.
    if (blockDelta == 0) return (
      _cusdc413.EXCHANGERATESTORED444(), _cusdc413.SUPPLYRATEPERBLOCK660()
    );

    // Determine total "cash" held by cUSDC contract.
    uint256 cash = _usdc392.BALANCEOF612(address(_cusdc413));

    // Get the latest interest rate model from the cUSDC contract.
    CUSDCInterestRateModelInterface interestRateModel = (
      CUSDCInterestRateModelInterface(_cusdc413.INTERESTRATEMODEL715())
    );

    // Get the current stored total borrows, reserves, and reserve factor.
    uint256 borrows = _cusdc413.TOTALBORROWS121();
    uint256 reserves = _cusdc413.TOTALRESERVES725();
    uint256 reserveFactor = _cusdc413.RESERVEFACTORMANTISSA291();

    // Get accumulated borrow interest via interest rate model and block delta.
    (uint256 err, uint256 borrowRate) = interestRateModel.GETBORROWRATE421(
      cash, borrows, reserves
    );
    require(
      err == _compound_success570, "Interest Rate Model borrow rate check failed."
    );

    uint256 interest = borrowRate.MUL485(blockDelta).MUL485(borrows) / _scaling_factor640;

    // Update total borrows and reserves using calculated accumulated interest.
    borrows = borrows.ADD29(interest);
    reserves = reserves.ADD29(reserveFactor.MUL485(interest) / _scaling_factor640);

    // Get "underlying": (cash + borrows - reserves)
    uint256 underlying = (cash.ADD29(borrows)).SUB831(reserves);

    // Determine cUSDC exchange rate: underlying / total supply
    exchangeRate = (underlying.MUL485(_scaling_factor640)).DIV834(_cusdc413.TOTALSUPPLY894());

    // Get "borrows per" by dividing total borrows by underlying and scaling up.
    uint256 borrowsPer = (
      borrows.MUL485(_scaling_factor_squared460)
    ).DIV834(underlying);

    // Supply rate is borrow interest * (1 - reserveFactor) * borrowsPer
    supplyRate = (
      interest.MUL485(_scaling_factor640.SUB831(reserveFactor)).MUL485(borrowsPer)
    ) / _scaling_factor_squared460;
  }

                                                                                                                                          
  function _GETUNDERLYINGNAME921() internal pure returns (string memory underlyingName) {	//inject NONSTANDARD NAMING
    underlyingName = _underlying_name96;
  }

                                                                                                                                                     
  function _GETUNDERLYING943() internal pure returns (address underlying) {	//inject NONSTANDARD NAMING
    underlying = address(_usdc392);
  }

                                                                                                                                          
  function _GETCTOKENSYMBOL233() internal pure returns (string memory cTokenSymbol) {	//inject NONSTANDARD NAMING
    cTokenSymbol = _ctoken_symbol328;
  }

                                                                                                                                            
  function _GETCTOKEN875() internal pure returns (address cToken) {	//inject NONSTANDARD NAMING
    cToken = address(_cusdc413);
  }

                                                                                                                      
  function _GETDTOKENNAME760() internal pure returns (string memory dTokenName) {	//inject NONSTANDARD NAMING
    dTokenName = _name344;
  }

                                                                                                                          
  function _GETDTOKENSYMBOL268() internal pure returns (string memory dTokenSymbol) {	//inject NONSTANDARD NAMING
    dTokenSymbol = _symbol687;
  }

                                                                                                                                                                                            
  function _GETVAULT21() internal pure returns (address vault) {	//inject NONSTANDARD NAMING
    vault = _vault340;
  }
}