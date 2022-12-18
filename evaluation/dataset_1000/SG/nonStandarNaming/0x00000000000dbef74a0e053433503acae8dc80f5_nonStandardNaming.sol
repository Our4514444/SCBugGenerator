                                                                 

pragma solidity 0.5.11; // optimization runs: 200, evm version: petersburg
// WARNING - `executeActionWithAtomicBatchCalls` has a `bytes[]` argument that
// requires ABIEncoderV2. Exercise caution when calling that specific function.
pragma experimental ABIEncoderV2;


interface DharmaSmartWalletImplementationV1Interface {
  event CALLSUCCESS126(	//inject NONSTANDARD NAMING
    bytes32 actionID,
    bool rolledBack,
    uint256 nonce,
    address to,
    bytes data,
    bytes returnData
  );

  event CALLFAILURE950(	//inject NONSTANDARD NAMING
    bytes32 actionID,
    uint256 nonce,
    address to,
    bytes data,
    string revertReason
  );

  // ABIEncoderV2 uses an array of Calls for executing generic batch calls.
  struct Call {
    address to;
    bytes data;
  }

  // ABIEncoderV2 uses an array of CallReturns for handling generic batch calls.
  struct CallReturn {
    bool ok;
    bytes returnData;
  }

  function WITHDRAWETHER542(	//inject NONSTANDARD NAMING
    uint256 amount,
    address payable recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function EXECUTEACTION295(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok, bytes memory returnData);

  function RECOVER45(address newUserSigningKey) external;	//inject NONSTANDARD NAMING

  function EXECUTEACTIONWITHATOMICBATCHCALLS806(	//inject NONSTANDARD NAMING
    Call[] calldata calls,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool[] memory ok, bytes[] memory returnData);

  function GETNEXTGENERICACTIONID484(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETGENERICACTIONID836(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETNEXTGENERICATOMICBATCHACTIONID333(	//inject NONSTANDARD NAMING
    Call[] calldata calls,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETGENERICATOMICBATCHACTIONID471(	//inject NONSTANDARD NAMING
    Call[] calldata calls,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);
}


interface DharmaSmartWalletImplementationV3Interface {
  event CANCEL154(uint256 cancelledNonce);	//inject NONSTANDARD NAMING
  event ETHWITHDRAWAL401(uint256 amount, address recipient);	//inject NONSTANDARD NAMING
}


interface DharmaSmartWalletImplementationV4Interface {
  event ESCAPED265();	//inject NONSTANDARD NAMING

  function SETESCAPEHATCH690(	//inject NONSTANDARD NAMING
    address account,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function REMOVEESCAPEHATCH146(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function PERMANENTLYDISABLEESCAPEHATCH240(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function ESCAPE568() external;	//inject NONSTANDARD NAMING
}


interface DharmaSmartWalletImplementationV7Interface {
  // Fires when a new user signing key is set on the smart wallet.
  event NEWUSERSIGNINGKEY303(address userSigningKey);	//inject NONSTANDARD NAMING

  // Fires when an error occurs as part of an attempted action.
  event EXTERNALERROR905(address indexed source, string revertReason);	//inject NONSTANDARD NAMING

  // The smart wallet recognizes DAI, USDC, ETH, and SAI as supported assets.
  enum AssetType {
    DAI,
    USDC,
    ETH,
    SAI
  }

  // Actions, or protected methods (i.e. not deposits) each have an action type.
  enum ActionType {
    Cancel,
    SetUserSigningKey,
    Generic,
    GenericAtomicBatch,
    SAIWithdrawal,
    USDCWithdrawal,
    ETHWithdrawal,
    SetEscapeHatch,
    RemoveEscapeHatch,
    DisableEscapeHatch,
    DAIWithdrawal,
    SignatureVerification,
    DAIBorrow,
    USDCBorrow
  }

  function INITIALIZE975(address userSigningKey) external;	//inject NONSTANDARD NAMING

  function REPAYANDDEPOSIT150() external;	//inject NONSTANDARD NAMING

  function WITHDRAWDAI315(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function WITHDRAWUSDC318(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function CANCEL696(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata signature
  ) external;

  function SETUSERSIGNINGKEY688(	//inject NONSTANDARD NAMING
    address userSigningKey,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function MIGRATESAITODAI170() external;	//inject NONSTANDARD NAMING

  function MIGRATECSAITODDAI387() external;	//inject NONSTANDARD NAMING

  function MIGRATECDAITODDAI447() external;	//inject NONSTANDARD NAMING

  function MIGRATECUSDCTODUSDC667() external;	//inject NONSTANDARD NAMING

  function GETBALANCES557() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiBalance,
    uint256 usdcBalance,
    uint256 etherBalance,
    uint256 dDaiUnderlyingDaiBalance,
    uint256 dUsdcUnderlyingUsdcBalance,
    uint256 dEtherUnderlyingEtherBalance // always returns zero
  );

  function GETUSERSIGNINGKEY324() external view returns (address userSigningKey);	//inject NONSTANDARD NAMING

  function GETNONCE585() external view returns (uint256 nonce);	//inject NONSTANDARD NAMING

  function GETNEXTCUSTOMACTIONID181(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETCUSTOMACTIONID641(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETVERSION267() external pure returns (uint256 version);	//inject NONSTANDARD NAMING
}


interface ERC20Interface {
  function TRANSFER110(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE141(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

  function BALANCEOF379(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
  function ALLOWANCE980(	//inject NONSTANDARD NAMING
    address owner, address spender
  ) external view returns (uint256);
}


interface ERC1271Interface {
  function ISVALIDSIGNATURE165(	//inject NONSTANDARD NAMING
    bytes calldata data, bytes calldata signature
  ) external view returns (bytes4 magicValue);
}


interface CTokenInterface {
  function REDEEM218(uint256 redeemAmount) external returns (uint256 err);	//inject NONSTANDARD NAMING
  function TRANSFER110(address recipient, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE141(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

  function BALANCEOF379(address account) external view returns (uint256 balance);	//inject NONSTANDARD NAMING
  function ALLOWANCE980(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface DTokenInterface {
  // These external functions trigger accrual on the dToken and backing cToken.
  function MINT37(uint256 underlyingToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING
  function REDEEM218(uint256 dTokensToBurn) external returns (uint256 underlyingReceived);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYING483(uint256 underlyingToReceive) external returns (uint256 dTokensBurned);	//inject NONSTANDARD NAMING

  // These external functions only trigger accrual on the dToken.
  function MINTVIACTOKEN11(uint256 cTokensToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING

  // View and pure functions do not trigger accrual on the dToken or the cToken.
  function BALANCEOFUNDERLYING522(address account) external view returns (uint256 underlyingBalance);	//inject NONSTANDARD NAMING
}


interface USDCV1Interface {
  function ISBLACKLISTED446(address _account) external view returns (bool);	//inject NONSTANDARD NAMING
  function PAUSED245() external view returns (bool);	//inject NONSTANDARD NAMING
}


interface DharmaKeyRegistryInterface {
  function GETKEY723() external view returns (address key);	//inject NONSTANDARD NAMING
}


interface DharmaEscapeHatchRegistryInterface {
  function SETESCAPEHATCH690(address newEscapeHatch) external;	//inject NONSTANDARD NAMING

  function REMOVEESCAPEHATCH146() external;	//inject NONSTANDARD NAMING

  function PERMANENTLYDISABLEESCAPEHATCH240() external;	//inject NONSTANDARD NAMING

  function GETESCAPEHATCH814() external view returns (	//inject NONSTANDARD NAMING
    bool exists, address escapeHatch
  );
}


interface SaiToDaiMigratorInterface {
  function SWAPSAITODAI371(uint256 balance) external;	//inject NONSTANDARD NAMING
}


interface RevertReasonHelperInterface {
  function REASON496(uint256 code) external pure returns (string memory);	//inject NONSTANDARD NAMING
}


library Address {
  function ISCONTRACT780(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
    uint256 size;
    assembly { size := extcodesize(account) }
    return size > 0;
  }
}


library ECDSA {
  function RECOVER45(	//inject NONSTANDARD NAMING
    bytes32 hash, bytes memory signature
  ) internal pure returns (address) {
    if (signature.length != 65) {
      return (address(0));
    }

    bytes32 r;
    bytes32 s;
    uint8 v;

    assembly {
      r := mload(add(signature, 0x20))
      s := mload(add(signature, 0x40))
      v := byte(0, mload(add(signature, 0x60)))
    }

    if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
      return address(0);
    }

    if (v != 27 && v != 28) {
      return address(0);
    }

    return ecrecover(hash, v, r, s);
  }

  function TOETHSIGNEDMESSAGEHASH151(bytes32 hash) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
contract DharmaSmartWalletImplementationV7 is
  DharmaSmartWalletImplementationV1Interface,
  DharmaSmartWalletImplementationV3Interface,
  DharmaSmartWalletImplementationV4Interface,
  DharmaSmartWalletImplementationV7Interface,
  ERC1271Interface {
  using Address for address;
  using ECDSA for bytes32;
  // WARNING: DO NOT REMOVE OR REORDER STORAGE WHEN WRITING NEW IMPLEMENTATIONS!

  // The user signing key associated with this account is in storage slot 0.
  // It is the core differentiator when it comes to the account in question.
  address private _userSigningKey;

  // The nonce associated with this account is in storage slot 1. Every time a
  // signature is submitted, it must have the appropriate nonce, and once it has
  // been accepted the nonce will be incremented.
  uint256 private _nonce;

  // The self-call context flag is in storage slot 2. Some protected functions
  // may only be called externally from calls originating from other methods on
  // this contract, which enables appropriate exception handling on reverts.
  // Any storage should only be set immediately preceding a self-call and should
  // be cleared upon entering the protected function being called.
  bytes4 internal _selfCallContext;

  // END STORAGE DECLARATIONS - DO NOT REMOVE OR REORDER STORAGE ABOVE HERE!

  // The smart wallet version will be used when constructing valid signatures.
  uint256 internal constant _dharma_smart_wallet_version789 = 7;	//inject NONSTANDARD NAMING

  // DharmaKeyRegistryV2 holds a public key for verifying meta-transactions.
  DharmaKeyRegistryInterface internal constant _dharma_key_registry40 = (	//inject NONSTANDARD NAMING
    DharmaKeyRegistryInterface(0x000000000D38df53b45C5733c7b34000dE0BDF52)
  );

  // Account recovery is facilitated using a hard-coded recovery manager,
  // controlled by Dharma and implementing appropriate timelocks.
  address internal constant _account_recovery_manager587 = address(	//inject NONSTANDARD NAMING
    0x0000000000DfEd903aD76996FC07BF89C0127B1E
  );

  // Users can designate an "escape hatch" account with the ability to sweep all
  // funds from their smart wallet by using the Dharma Escape Hatch Registry.
  DharmaEscapeHatchRegistryInterface internal constant _escape_hatch_registry341 = (	//inject NONSTANDARD NAMING
    DharmaEscapeHatchRegistryInterface(0x00000000005280B515004B998a944630B6C663f8)
  );

  // Interface with dDai, dUSDC, Dai, USDC, Sai, cSai, cDai, cUSDC, & migrator.
  DTokenInterface internal constant _ddai54 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000001876eB1444c986fD502e618c587430 // mainnet
  );

  DTokenInterface internal constant _dusdc949 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000008943c65cAf789FFFCF953bE156f6f8 // mainnet
  );

  ERC20Interface internal constant _dai848 = ERC20Interface(	//inject NONSTANDARD NAMING
    0x6B175474E89094C44Da98b954EedeAC495271d0F // mainnet
  );

  ERC20Interface internal constant _usdc983 = ERC20Interface(	//inject NONSTANDARD NAMING
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 // mainnet
  );

  ERC20Interface internal constant _sai420 = ERC20Interface(	//inject NONSTANDARD NAMING
    0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359 // mainnet
  );

  CTokenInterface internal constant _csai412 = CTokenInterface(	//inject NONSTANDARD NAMING
    0xF5DCe57282A584D2746FaF1593d3121Fcac444dC // mainnet
  );

  CTokenInterface internal constant _cdai946 = CTokenInterface(	//inject NONSTANDARD NAMING
    0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643 // mainnet
  );

  CTokenInterface internal constant _cusdc56 = CTokenInterface(	//inject NONSTANDARD NAMING
    0x39AA39c021dfbaE8faC545936693aC917d5E7563 // mainnet
  );

  SaiToDaiMigratorInterface internal constant _migrator408 = SaiToDaiMigratorInterface(	//inject NONSTANDARD NAMING
    0xc73e0383F3Aff3215E6f04B0331D58CeCf0Ab849 // mainnet
  );

  USDCV1Interface internal constant _usdc_naughty885 = USDCV1Interface(	//inject NONSTANDARD NAMING
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 // mainnet
  );

  // The "revert reason helper" contains a collection of revert reason strings.
  RevertReasonHelperInterface internal constant _revert_reason_helper99 = (	//inject NONSTANDARD NAMING
    RevertReasonHelperInterface(0xE24257338d0c15f3Dd00Ed59fcA9e50CfB167bA8)
  );

  // Compound returns a value of 0 to indicate success, or lack of an error.
  uint256 internal constant _compound_success953 = 0;	//inject NONSTANDARD NAMING

  // ERC-1271 must return this magic value when `isValidSignature` is called.
  bytes4 internal constant _erc_1271_magic_value343 = bytes4(0x20c13b0b);	//inject NONSTANDARD NAMING

  // Minimum supported deposit & non-maximum withdrawal size is .001 underlying.
  uint256 private constant _just_under_one_1000th_dai451 = 999999999999999;	//inject NONSTANDARD NAMING
  uint256 private constant _just_under_one_1000th_usdc313 = 999;	//inject NONSTANDARD NAMING

  // Specify the amount of gas to supply when making Ether transfers.
  uint256 private constant _eth_transfer_gas34 = 4999;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function INITIALIZE975(address userSigningKey) external {	//inject NONSTANDARD NAMING
    // Ensure that this function is only callable during contract construction.
    assembly { if extcodesize(address) { revert(0, 0) } }

    // Set up the user's signing key and emit a corresponding event.
    _SETUSERSIGNINGKEY18(userSigningKey);

    // Approve the dDai contract to transfer Dai on behalf of this contract.
    if (_SETFULLAPPROVAL254(AssetType.DAI)) {
      // Get the current Dai balance on this contract.
      uint256 daiBalance = _dai848.BALANCEOF379(address(this));

      // Try to deposit the full Dai balance to Dharma Dai.
      _DEPOSITDHARMATOKEN223(AssetType.DAI, daiBalance);
    }

    // Approve the dUSDC contract to transfer USDC on behalf of this contract.
    if (_SETFULLAPPROVAL254(AssetType.USDC)) {
      // Get the current USDC balance on this contract.
      uint256 usdcBalance = _usdc983.BALANCEOF379(address(this));

      // Try to deposit the full Dai balance to Dharma USDC.
      _DEPOSITDHARMATOKEN223(AssetType.USDC, usdcBalance);
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                   
  function REPAYANDDEPOSIT150() external {	//inject NONSTANDARD NAMING
    // Get the current Dai balance on this contract.
    uint256 daiBalance = _dai848.BALANCEOF379(address(this));

    // If there is any Dai balance, check for adequate approval for dDai.
    if (daiBalance > 0) {
      uint256 daiAllowance = _dai848.ALLOWANCE980(address(this), address(_ddai54));
      // If allowance is insufficient, try to set it before depositing.
      if (daiAllowance < daiBalance) {
        if (_SETFULLAPPROVAL254(AssetType.DAI)) {
          // Deposit the full available Dai balance to Dharma Dai.
          _DEPOSITDHARMATOKEN223(AssetType.DAI, daiBalance);
        }
      // Otherwise, just go ahead and try the Dai deposit.
      } else {
        // Deposit the full available Dai balance to Dharma Dai.
        _DEPOSITDHARMATOKEN223(AssetType.DAI, daiBalance);
      }
    }

    // Get the current USDC balance on this contract.
    uint256 usdcBalance = _usdc983.BALANCEOF379(address(this));

    // If there is any USDC balance, check for adequate approval for dUSDC.
    if (usdcBalance > 0) {
      uint256 usdcAllowance = _usdc983.ALLOWANCE980(address(this), address(_dusdc949));
      // If allowance is insufficient, try to set it before depositing.
      if (usdcAllowance < usdcBalance) {
        if (_SETFULLAPPROVAL254(AssetType.USDC)) {
          // Deposit the full available USDC balance to Dharma USDC.
          _DEPOSITDHARMATOKEN223(AssetType.USDC, usdcBalance);
        }
      // Otherwise, just go ahead and try the USDC deposit.
      } else {
        // Deposit the full available USDC balance to Dharma USDC.
        _DEPOSITDHARMATOKEN223(AssetType.USDC, usdcBalance);
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function WITHDRAWDAI315(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE909(
      ActionType.DAIWithdrawal,
      abi.encode(amount, recipient),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Ensure that an amount of at least 0.001 Dai has been supplied.
    require(amount > _just_under_one_1000th_dai451, _REVERTREASON441(0));

    // Ensure that a non-zero recipient has been supplied.
    require(recipient != address(0), _REVERTREASON441(1));

    // Set the self-call context in order to call _withdrawDaiAtomic.
    _selfCallContext = this.WITHDRAWDAI315.selector;

    // Make the atomic self-call - if redeemUnderlying fails on dDai, it will
    // succeed but nothing will happen except firing an ExternalError event. If
    // the second part of the self-call (the Dai transfer) fails, it will revert
    // and roll back the first part of the call as well as fire an ExternalError
    // event after returning from the failed call.
    bytes memory returnData;
    (ok, returnData) = address(this).call(abi.encodeWithSelector(
      this._WITHDRAWDAIATOMIC129.selector, amount, recipient
    ));

    // If the atomic call failed, emit an event signifying a transfer failure.
    if (!ok) {
      emit EXTERNALERROR905(address(_dai848), _REVERTREASON441(2));
    } else {
      // Set ok to false if the call succeeded but the withdrawal failed.
      ok = abi.decode(returnData, (bool));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function _WITHDRAWDAIATOMIC129(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient
  ) external returns (bool success) {
    // Ensure caller is this contract and self-call context is correctly set.
    _ENFORCESELFCALLFROM1000(this.WITHDRAWDAI315.selector);

    // If amount = 0xfff...fff, withdraw the maximum amount possible.
    bool maxWithdraw = (amount == uint256(-1));
    if (maxWithdraw) {
      // First attempt to redeem all dDai if there is a balance.
      _WITHDRAWMAXFROMDHARMATOKEN991(AssetType.DAI);

      // Then transfer all Dai to recipient if there is a balance.
      require(_TRANSFERMAX385(_dai848, recipient, false));
      success = true;
    } else {
      // Attempt to withdraw specified Dai from Dharma Dai before proceeding.
      if (_WITHDRAWFROMDHARMATOKEN329(AssetType.DAI, amount)) {
        // At this point Dai transfer should never fail - wrap it just in case.
        require(_dai848.TRANSFER110(recipient, amount));
        success = true;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function WITHDRAWUSDC318(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE909(
      ActionType.USDCWithdrawal,
      abi.encode(amount, recipient),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Ensure that an amount of at least 0.001 USDC has been supplied.
    require(amount > _just_under_one_1000th_usdc313, _REVERTREASON441(3));

    // Ensure that a non-zero recipient has been supplied.
    require(recipient != address(0), _REVERTREASON441(1));

    // Set the self-call context in order to call _withdrawUSDCAtomic.
    _selfCallContext = this.WITHDRAWUSDC318.selector;

    // Make the atomic self-call - if redeemUnderlying fails on dUSDC, it will
    // succeed but nothing will happen except firing an ExternalError event. If
    // the second part of the self-call (USDC transfer) fails, it will revert
    // and roll back the first part of the call as well as fire an ExternalError
    // event after returning from the failed call.
    bytes memory returnData;
    (ok, returnData) = address(this).call(abi.encodeWithSelector(
      this._WITHDRAWUSDCATOMIC457.selector, amount, recipient
    ));
    if (!ok) {
      // Find out why USDC transfer reverted (doesn't give revert reasons).
      _DIAGNOSEANDEMITUSDCSPECIFICERROR552(_usdc983.TRANSFER110.selector);
    } else {
      // Set ok to false if the call succeeded but the withdrawal failed.
      ok = abi.decode(returnData, (bool));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function _WITHDRAWUSDCATOMIC457(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient
  ) external returns (bool success) {
    // Ensure caller is this contract and self-call context is correctly set.
    _ENFORCESELFCALLFROM1000(this.WITHDRAWUSDC318.selector);

    // If amount = 0xfff...fff, withdraw the maximum amount possible.
    bool maxWithdraw = (amount == uint256(-1));
    if (maxWithdraw) {
      // Attempt to redeem all dUSDC from Dharma USDC if there is a balance.
      _WITHDRAWMAXFROMDHARMATOKEN991(AssetType.USDC);

      // Then transfer all USDC to recipient if there is a balance.
      require(_TRANSFERMAX385(_usdc983, recipient, false));
      success = true;
    } else {
      // Attempt to withdraw specified USDC from Dharma USDC before proceeding.
      if (_WITHDRAWFROMDHARMATOKEN329(AssetType.USDC, amount)) {
        // Ensure that the USDC transfer does not fail.
        require(_usdc983.TRANSFER110(recipient, amount));
        success = true;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function WITHDRAWETHER542(	//inject NONSTANDARD NAMING
    uint256 amount,
    address payable recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE909(
      ActionType.ETHWithdrawal,
      abi.encode(amount, recipient),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Ensure that a non-zero amount of Ether has been supplied.
    require(amount > 0, _REVERTREASON441(4));

    // Ensure that a non-zero recipient has been supplied.
    require(recipient != address(0), _REVERTREASON441(1));

    // Attempt to transfer Ether to the recipient and emit an appropriate event.
    ok = _TRANSFERETH846(recipient, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function CANCEL696(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata signature
  ) external {
    // Get the current nonce.
    uint256 nonceToCancel = _nonce;

    // Ensure the caller or the supplied signature is valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE909(
      ActionType.Cancel,
      abi.encode(),
      minimumActionGas,
      signature,
      signature
    );

    // Emit an event to validate that the nonce is no longer valid.
    emit CANCEL154(nonceToCancel);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function EXECUTEACTION295(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok, bytes memory returnData) {
    // Ensure that the `to` address is a contract and is not this contract.
    _ENSUREVALIDGENERICCALLTARGET521(to);

    // Ensure caller and/or supplied signatures are valid and increment nonce.
    (bytes32 actionID, uint256 nonce) = _VALIDATEACTIONANDINCREMENTNONCE909(
      ActionType.Generic,
      abi.encode(to, data),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Note: from this point on, there are no reverts (apart from out-of-gas or
    // call-depth-exceeded) originating from this action. However, the call
    // itself may revert, in which case the function will return `false`, along
    // with the revert reason encoded as bytes, and fire an CallFailure event.

    // Perform the action via low-level call and set return values using result.
    (ok, returnData) = to.call(data);

    // Emit a CallSuccess or CallFailure event based on the outcome of the call.
    if (ok) {
      // Note: while the call succeeded, the action may still have "failed"
      // (for example, successful calls to Compound can still return an error).
      emit CALLSUCCESS126(actionID, false, nonce, to, data, returnData);
    } else {
      // Note: while the call failed, the nonce will still be incremented, which
      // will invalidate all supplied signatures.
      emit CALLFAILURE950(actionID, nonce, to, data, string(returnData));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function SETUSERSIGNINGKEY688(	//inject NONSTANDARD NAMING
    address userSigningKey,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE909(
      ActionType.SetUserSigningKey,
      abi.encode(userSigningKey),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Set new user signing key on smart wallet and emit a corresponding event.
    _SETUSERSIGNINGKEY18(userSigningKey);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function SETESCAPEHATCH690(	//inject NONSTANDARD NAMING
    address account,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE909(
      ActionType.SetEscapeHatch,
      abi.encode(account),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Ensure that an escape hatch account has been provided.
    require(account != address(0), _REVERTREASON441(5));

    // Set a new escape hatch for the smart wallet unless it has been disabled.
    _escape_hatch_registry341.SETESCAPEHATCH690(account);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function REMOVEESCAPEHATCH146(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE909(
      ActionType.RemoveEscapeHatch,
      abi.encode(),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Remove the escape hatch for the smart wallet if one is currently set.
    _escape_hatch_registry341.REMOVEESCAPEHATCH146();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function PERMANENTLYDISABLEESCAPEHATCH240(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE909(
      ActionType.DisableEscapeHatch,
      abi.encode(),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Permanently disable the escape hatch mechanism for this smart wallet.
    _escape_hatch_registry341.PERMANENTLYDISABLEESCAPEHATCH240();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function ESCAPE568() external {	//inject NONSTANDARD NAMING
    // Get the escape hatch account, if one exists, for this account.
    (bool exists, address escapeHatch) = _escape_hatch_registry341.GETESCAPEHATCH814();

    // Ensure that an escape hatch is currently set for this smart wallet.
    require(exists, _REVERTREASON441(6));

    // Ensure that the escape hatch account is the caller.
    require(msg.sender == escapeHatch, _REVERTREASON441(7));

    // Attempt to redeem all dDai for Dai on Dharma Dai.
    _WITHDRAWMAXFROMDHARMATOKEN991(AssetType.DAI);

    // Attempt to redeem all dUSDC for USDC on Dharma USDC.
    _WITHDRAWMAXFROMDHARMATOKEN991(AssetType.USDC);

    // Attempt to transfer the total Dai balance to the caller.
    _TRANSFERMAX385(_dai848, msg.sender, true);

    // Attempt to transfer the total USDC balance to the caller.
    _TRANSFERMAX385(_usdc983, msg.sender, true);

    // Attempt to transfer any residual cSai to the caller.
    _TRANSFERMAX385(ERC20Interface(address(_csai412)), msg.sender, true);

    // Attempt to transfer any residual cDai to the caller.
    _TRANSFERMAX385(ERC20Interface(address(_cdai946)), msg.sender, true);

    // Attempt to transfer any residual cUSDC to the caller.
    _TRANSFERMAX385(ERC20Interface(address(_cusdc56)), msg.sender, true);

    // Attempt to transfer any residual dDai to the caller.
    _TRANSFERMAX385(ERC20Interface(address(_ddai54)), msg.sender, true);

    // Attempt to transfer any residual dUSDC to the caller.
    _TRANSFERMAX385(ERC20Interface(address(_dusdc949)), msg.sender, true);

    // Determine if there is Ether at this address that should be transferred.
    uint256 balance = address(this).balance;
    if (balance > 0) {
      // Attempt to transfer any Ether to caller and emit an appropriate event.
      _TRANSFERETH846(msg.sender, balance);
    }

    // Emit an `Escaped` event.
    emit ESCAPED265();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function RECOVER45(address newUserSigningKey) external {	//inject NONSTANDARD NAMING
    require(msg.sender == _account_recovery_manager587, _REVERTREASON441(8));

    // Increment nonce to prevent signature reuse should original key be reset.
    _nonce++;

    // Set up the user's new dharma key and emit a corresponding event.
    _SETUSERSIGNINGKEY18(newUserSigningKey);
  }

                                                                                                                                                                                                                                 
  function MIGRATESAITODAI170() external {	//inject NONSTANDARD NAMING
    // Swap the current Sai balance on this contract for Dai.
    _SWAPSAIFORDAI483(_sai420.BALANCEOF379(address(this)));
  }

                                                                                                                                                                                                                                                                                                            
  function MIGRATECSAITODDAI387() external {	//inject NONSTANDARD NAMING
    // Get the current cSai balance for this account.
    uint256 redeemAmount = _csai412.BALANCEOF379(address(this));

    // Only perform the call to redeem if there is a non-zero balance.
    if (redeemAmount > 0) {
      // Get the current Sai balance on this contract.
      uint256 currentSaiBalance = _sai420.BALANCEOF379(address(this));

      // Redeem underlying balance from cSai and revert if unsuccessful.
      require(_csai412.REDEEM218(redeemAmount) == _compound_success953, _REVERTREASON441(9));

      // Calculate difference between pre-redeem and post-redeem Sai balances.
      uint256 saiBalance = _sai420.BALANCEOF379(address(this)) - currentSaiBalance;

      // Swap any Sai for Dai and get the newly-swapped Dai balance.
      uint256 daiBalance = _SWAPSAIFORDAI483(saiBalance);
      
      // If the dDai allowance is insufficient, set it before depositing.
      if (_dai848.ALLOWANCE980(address(this), address(_ddai54)) < daiBalance) {
        require(_dai848.APPROVE141(address(_ddai54), uint256(-1)), _REVERTREASON441(10));
      }
      
      // Deposit the new Dai balance on Dharma Dai.
      _ddai54.MINT37(daiBalance);
    }
  }

                                                                                                                                                                                                                                                                                    
  function MIGRATECDAITODDAI447() external {	//inject NONSTANDARD NAMING
     _MIGRATECTOKENTODTOKEN814(AssetType.DAI);
  }

                                                                                                                                                                                                                                                                                
  function MIGRATECUSDCTODUSDC667() external {	//inject NONSTANDARD NAMING
     _MIGRATECTOKENTODTOKEN814(AssetType.USDC);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function GETBALANCES557() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiBalance,
    uint256 usdcBalance,
    uint256 etherBalance,
    uint256 dDaiUnderlyingDaiBalance,
    uint256 dUsdcUnderlyingUsdcBalance,
    uint256 dEtherUnderlyingEtherBalance // always returns 0
  ) {
    daiBalance = _dai848.BALANCEOF379(address(this));
    usdcBalance = _usdc983.BALANCEOF379(address(this));
    etherBalance = address(this).balance;
    dDaiUnderlyingDaiBalance = _ddai54.BALANCEOFUNDERLYING522(address(this));
    dUsdcUnderlyingUsdcBalance = _dusdc949.BALANCEOFUNDERLYING522(address(this));
  }

                                                                                                                                                     
  function GETUSERSIGNINGKEY324() external view returns (address userSigningKey) {	//inject NONSTANDARD NAMING
    userSigningKey = _userSigningKey;
  }

                                                                                                                                                                                                                                             
  function GETNONCE585() external view returns (uint256 nonce) {	//inject NONSTANDARD NAMING
    nonce = _nonce;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function GETNEXTCUSTOMACTIONID181(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID28(
      action,
      _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS901(action, amount, recipient),
      _nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY102()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function GETCUSTOMACTIONID641(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID28(
      action,
      _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS901(action, amount, recipient),
      nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY102()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function GETNEXTGENERICACTIONID484(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID28(
      ActionType.Generic,
      abi.encode(to, data),
      _nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY102()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function GETGENERICACTIONID836(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID28(
      ActionType.Generic,
      abi.encode(to, data),
      nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY102()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function ISVALIDSIGNATURE165(	//inject NONSTANDARD NAMING
    bytes calldata data, bytes calldata signatures
  ) external view returns (bytes4 magicValue) {
    // Get message hash digest and any additional context from data argument.
    bytes32 digest;
    bytes memory context;

    if (data.length == 32) {
      digest = abi.decode(data, (bytes32));
    } else {
      require(data.length >= 64, _REVERTREASON441(30));
      (digest, context) = abi.decode(data, (bytes32, bytes));
    }

    // Get Dharma signature & user signature from combined signatures argument.
    require(signatures.length == 130, _REVERTREASON441(11));
    bytes memory signaturesInMemory = signatures;
    bytes32 r;
    bytes32 s;
    uint8 v;
    assembly {
      r := mload(add(signaturesInMemory, 0x20))
      s := mload(add(signaturesInMemory, 0x40))
      v := byte(0, mload(add(signaturesInMemory, 0x60)))
    }
    bytes memory dharmaSignature = abi.encodePacked(r, s, v);

    assembly {
      r := mload(add(signaturesInMemory, 0x61))
      s := mload(add(signaturesInMemory, 0x81))
      v := byte(0, mload(add(signaturesInMemory, 0xa1)))
    }
    bytes memory userSignature = abi.encodePacked(r, s, v);

    // Validate user signature with `SignatureVerification` as the action type.
    require(
      _VALIDATEUSERSIGNATURE736(
        digest,
        ActionType.SignatureVerification,
        context,
        _userSigningKey,
        userSignature
      ),
      _REVERTREASON441(12)
    );

    // Recover Dharma signature against key returned from Dharma Key Registry.
    require(
      _GETDHARMASIGNINGKEY102() == digest.RECOVER45(dharmaSignature),
      _REVERTREASON441(13)
    );

    // Return the ERC-1271 magic value to indicate success.
    magicValue = _erc_1271_magic_value343;
  }

                                                                                                                                                 
  function GETVERSION267() external pure returns (uint256 version) {	//inject NONSTANDARD NAMING
    version = _dharma_smart_wallet_version789;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function EXECUTEACTIONWITHATOMICBATCHCALLS806(	//inject NONSTANDARD NAMING
    Call[] memory calls,
    uint256 minimumActionGas,
    bytes memory userSignature,
    bytes memory dharmaSignature
  ) public returns (bool[] memory ok, bytes[] memory returnData) {
    // Ensure that each `to` address is a contract and is not this contract.
    for (uint256 i = 0; i < calls.length; i++) {
      _ENSUREVALIDGENERICCALLTARGET521(calls[i].to);
    }

    // Ensure caller and/or supplied signatures are valid and increment nonce.
    (bytes32 actionID, uint256 nonce) = _VALIDATEACTIONANDINCREMENTNONCE909(
      ActionType.GenericAtomicBatch,
      abi.encode(calls),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Note: from this point on, there are no reverts (apart from out-of-gas or
    // call-depth-exceeded) originating from this contract. However, one of the
    // calls may revert, in which case the function will return `false`, along
    // with the revert reason encoded as bytes, and fire an CallFailure event.

    // Specify length of returned values in order to work with them in memory.
    ok = new bool[](calls.length);
    returnData = new bytes[](calls.length);

    // Set self-call context to call _executeActionWithAtomicBatchCallsAtomic.
    _selfCallContext = this.EXECUTEACTIONWITHATOMICBATCHCALLS806.selector;

    // Make the atomic self-call - if any call fails, calls that preceded it
    // will be rolled back and calls that follow it will not be made.
    (bool externalOk, bytes memory rawCallResults) = address(this).call(
      abi.encodeWithSelector(
        this._EXECUTEACTIONWITHATOMICBATCHCALLSATOMIC138.selector, calls
      )
    );

    // Parse data returned from self-call into each call result and store / log.
    CallReturn[] memory callResults = abi.decode(rawCallResults, (CallReturn[]));
    for (uint256 i = 0; i < callResults.length; i++) {
      Call memory currentCall = calls[i];

      // Set the status and the return data / revert reason from the call.
      ok[i] = callResults[i].ok;
      returnData[i] = callResults[i].returnData;

      // Emit CallSuccess or CallFailure event based on the outcome of the call.
      if (callResults[i].ok) {
        // Note: while the call succeeded, the action may still have "failed".
        emit CALLSUCCESS126(
          actionID,
          !externalOk, // If another call failed this will have been rolled back
          nonce,
          currentCall.to,
          currentCall.data,
          callResults[i].returnData
        );
      } else {
        // Note: while the call failed, the nonce will still be incremented,
        // which will invalidate all supplied signatures.
        emit CALLFAILURE950(
          actionID,
          nonce,
          currentCall.to,
          currentCall.data,
          string(callResults[i].returnData)
        );

        // exit early - any calls after the first failed call will not execute.
        break;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function _EXECUTEACTIONWITHATOMICBATCHCALLSATOMIC138(	//inject NONSTANDARD NAMING
    Call[] memory calls
  ) public returns (CallReturn[] memory callResults) {
    // Ensure caller is this contract and self-call context is correctly set.
    _ENFORCESELFCALLFROM1000(this.EXECUTEACTIONWITHATOMICBATCHCALLS806.selector);

    bool rollBack = false;
    callResults = new CallReturn[](calls.length);

    for (uint256 i = 0; i < calls.length; i++) {
      // Perform low-level call and set return values using result.
      (bool ok, bytes memory returnData) = calls[i].to.call(calls[i].data);
      callResults[i] = CallReturn({ok: ok, returnData: returnData});
      if (!ok) {
        // Exit early - any calls after the first failed call will not execute.
        rollBack = true;
        break;
      }
    }

    if (rollBack) {
      // Wrap in length encoding and revert (provide data instead of a string).
      bytes memory callResultsBytes = abi.encode(callResults);
      assembly { revert(add(32, callResultsBytes), mload(callResultsBytes)) }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function GETNEXTGENERICATOMICBATCHACTIONID333(	//inject NONSTANDARD NAMING
    Call[] memory calls,
    uint256 minimumActionGas
  ) public view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID28(
      ActionType.GenericAtomicBatch,
      abi.encode(calls),
      _nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY102()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function GETGENERICATOMICBATCHACTIONID471(	//inject NONSTANDARD NAMING
    Call[] memory calls,
    uint256 nonce,
    uint256 minimumActionGas
  ) public view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID28(
      ActionType.GenericAtomicBatch,
      abi.encode(calls),
      nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY102()
    );
  }

                                                                                                                                                                                                                                                                                                                                       
  function _SETUSERSIGNINGKEY18(address userSigningKey) internal {	//inject NONSTANDARD NAMING
    // Ensure that a user signing key is set on this smart wallet.
    require(userSigningKey != address(0), _REVERTREASON441(14));

    _userSigningKey = userSigningKey;
    emit NEWUSERSIGNINGKEY303(userSigningKey);
  }

                                                                                                                                                                                                                                                                                                                  
  function _SWAPSAIFORDAI483(uint256 saiToSwap) internal returns (uint256 dai) {	//inject NONSTANDARD NAMING
    // If the balance is non-zero, check if migrator has adequate approval.
    if (saiToSwap > 0) {
      uint256 allowance = _sai420.ALLOWANCE980(address(this), address(_migrator408));
      
      // Ensure that allowance is sufficient before calling the migrator.
      if (saiToSwap > allowance) {
        // Approve migrator contract to transfer Sai on behalf of this wallet.
        require(
          _sai420.APPROVE141(address(_migrator408), uint256(-1)), _REVERTREASON441(15)
        );
      }

      // Get the current Dai balance on this contract.
      uint256 currentDaiBalance = _dai848.BALANCEOF379(address(this));

      // Call migrator contract to swap the supplied Sai balance for Dai.
      _migrator408.SWAPSAITODAI371(saiToSwap);

      // Return the difference between the pre-swap and post-swap Dai balances.
      dai = _dai848.BALANCEOF379(address(this)) - currentDaiBalance;

      // Ensure that the Sai-to-Dai exchange rate was at least 1-to-1.
      require(dai >= saiToSwap, _REVERTREASON441(16));
    } else {
      // Explicitly specify a change in balance of zero if no swap occurred.
      dai = 0;
    }
  }

                                                                                                                                                                                                                                                                                                                                                                     
  function _SETFULLAPPROVAL254(AssetType asset) internal returns (bool ok) {	//inject NONSTANDARD NAMING
    // Get asset's underlying token address and corresponding dToken address.
    address token;
    address dToken;
    if (asset == AssetType.DAI) {
      token = address(_dai848);
      dToken = address(_ddai54);
    } else {
      token = address(_usdc983);
      dToken = address(_dusdc949);
    }

    // Approve dToken contract to transfer underlying on behalf of this wallet.
    (ok, ) = address(token).call(abi.encodeWithSelector(
      // Note: since both Tokens have the same interface, just use DAI's.
      _dai848.APPROVE141.selector, dToken, uint256(-1)
    ));

    // Emit a corresponding event if the approval failed.
    if (!ok) {
      if (asset == AssetType.DAI) {
        emit EXTERNALERROR905(address(_dai848), _REVERTREASON441(17));
      } else {
        // Find out why USDC transfer reverted (it doesn't give revert reasons).
        _DIAGNOSEANDEMITUSDCSPECIFICERROR552(_usdc983.APPROVE141.selector);
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
  function _DEPOSITDHARMATOKEN223(AssetType asset, uint256 balance) internal {	//inject NONSTANDARD NAMING
    // Only perform a deposit if the balance is at least .001 Dai or USDC.
    if (
      asset == AssetType.DAI && balance > _just_under_one_1000th_dai451 ||
      asset == AssetType.USDC && balance > _just_under_one_1000th_usdc313
    ) {
      // Get dToken address for the asset type.
      address dToken = asset == AssetType.DAI ? address(_ddai54) : address(_dusdc949);

      // Attempt to mint the balance on the dToken contract.
      (bool ok, bytes memory data) = dToken.call(abi.encodeWithSelector(
        // Note: since both dTokens have the same interface, just use dDai's.
        _ddai54.MINT37.selector, balance
      ));

      // Log an external error if something went wrong with the attempt.
      _CHECKDHARMATOKENINTERACTIONANDLOGANYERRORS224(
        asset, _ddai54.MINT37.selector, ok, data
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function _WITHDRAWFROMDHARMATOKEN329(	//inject NONSTANDARD NAMING
    AssetType asset, uint256 balance
  ) internal returns (bool success) {
    // Get dToken address for the asset type. (No custom ETH withdrawal action.)
    address dToken = asset == AssetType.DAI ? address(_ddai54) : address(_dusdc949);

    // Attempt to redeem the underlying balance from the dToken contract.
    (bool ok, bytes memory data) = dToken.call(abi.encodeWithSelector(
      // Note: function selector is the same for each dToken so just use dDai's.
      _ddai54.REDEEMUNDERLYING483.selector, balance
    ));

    // Log an external error if something went wrong with the attempt.
    success = _CHECKDHARMATOKENINTERACTIONANDLOGANYERRORS224(
      asset, _ddai54.REDEEMUNDERLYING483.selector, ok, data
    );
  }

                                                                                                                                                                                                                                                                                                                                      
  function _WITHDRAWMAXFROMDHARMATOKEN991(AssetType asset) internal {	//inject NONSTANDARD NAMING
    // Get dToken address for the asset type. (No custom ETH withdrawal action.)
    address dToken = asset == AssetType.DAI ? address(_ddai54) : address(_dusdc949);

    // Try to retrieve the current dToken balance for this account.
    ERC20Interface dTokenBalance;
    (bool ok, bytes memory data) = dToken.call(abi.encodeWithSelector(
      dTokenBalance.BALANCEOF379.selector, address(this)
    ));

    uint256 redeemAmount = 0;
    if (ok && data.length == 32) {
      redeemAmount = abi.decode(data, (uint256));
    } else {
      // Something went wrong with the balance check - log an ExternalError.
      _CHECKDHARMATOKENINTERACTIONANDLOGANYERRORS224(
        asset, dTokenBalance.BALANCEOF379.selector, ok, data
      );
    }

    // Only perform the call to redeem if there is a non-zero balance.
    if (redeemAmount > 0) {
      // Attempt to redeem the underlying balance from the dToken contract.
      (ok, data) = dToken.call(abi.encodeWithSelector(
        // Function selector is the same for all dTokens, so just use dDai's.
        _ddai54.REDEEM218.selector, redeemAmount
      ));

      // Log an external error if something went wrong with the attempt.
      _CHECKDHARMATOKENINTERACTIONANDLOGANYERRORS224(
        asset, _ddai54.REDEEM218.selector, ok, data
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function _TRANSFERMAX385(	//inject NONSTANDARD NAMING
    ERC20Interface token, address recipient, bool suppressRevert
  ) internal returns (bool success) {
    // Get the current balance on the smart wallet for the supplied ERC20 token.
    uint256 balance = 0;
    bool balanceCheckWorked = true;
    if (!suppressRevert) {
      balance = token.BALANCEOF379(address(this));
    } else {
      // Try to retrieve current token balance for this account with 1/2 gas.
      (bool ok, bytes memory data) = address(token).call.gas(gasleft() / 2)(
        abi.encodeWithSelector(token.BALANCEOF379.selector, address(this))
      );

      if (ok && data.length == 32) {
        balance = abi.decode(data, (uint256));
      } else {
        // Something went wrong with the balance check.
        balanceCheckWorked = false;
      }
    }

    // Only perform the call to transfer if there is a non-zero balance.
    if (balance > 0) {
      if (!suppressRevert) {
        // Perform the transfer and pass along the returned boolean (or revert).
        success = token.TRANSFER110(recipient, balance);
      } else {
        // Attempt transfer with 1/2 gas, allow reverts, and return call status.
        (success, ) = address(token).call.gas(gasleft() / 2)(
          abi.encodeWithSelector(token.TRANSFER110.selector, recipient, balance)
        );
      }
    } else {
      // Skip the transfer and return true as long as the balance check worked.
      success = balanceCheckWorked;
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function _TRANSFERETH846(	//inject NONSTANDARD NAMING
    address payable recipient, uint256 amount
  ) internal returns (bool success) {
    // Attempt to transfer any Ether to caller and emit an event if it fails.
    (success, ) = recipient.call.gas(_eth_transfer_gas34).value(amount)("");
    if (!success) {
      emit EXTERNALERROR905(recipient, _REVERTREASON441(18));
    } else {
      emit ETHWITHDRAWAL401(amount, recipient);
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function _VALIDATEACTIONANDINCREMENTNONCE909(	//inject NONSTANDARD NAMING
    ActionType action,
    bytes memory arguments,
    uint256 minimumActionGas,
    bytes memory userSignature,
    bytes memory dharmaSignature
  ) internal returns (bytes32 actionID, uint256 actionNonce) {
    // Ensure that the current gas exceeds the minimum required action gas.
    // This prevents griefing attacks where an attacker can invalidate a
    // signature without providing enough gas for the action to succeed. Also
    // note that some gas will be spent before this check is reached - supplying
    // ~30,000 additional gas should suffice when submitting transactions. To
    // skip this requirement, supply zero for the minimumActionGas argument.
    if (minimumActionGas != 0) {
      require(gasleft() >= minimumActionGas, _REVERTREASON441(19));
    }

    // Get the current nonce for the action to be performed.
    actionNonce = _nonce;

    // Get the user signing key that will be used to verify their signature.
    address userSigningKey = _userSigningKey;

    // Get the Dharma signing key that will be used to verify their signature.
    address dharmaSigningKey = _GETDHARMASIGNINGKEY102();

    // Determine the actionID - this serves as the signature hash.
    actionID = _GETACTIONID28(
      action,
      arguments,
      actionNonce,
      minimumActionGas,
      userSigningKey,
      dharmaSigningKey
    );

    // Compute the message hash - the hashed, EIP-191-0x45-prefixed action ID.
    bytes32 messageHash = actionID.TOETHSIGNEDMESSAGEHASH151();

    // Actions other than Cancel require both signatures; Cancel only needs one.
    if (action != ActionType.Cancel) {
      // Validate user signing key signature unless it is `msg.sender`.
      if (msg.sender != userSigningKey) {
        require(
          _VALIDATEUSERSIGNATURE736(
            messageHash, action, arguments, userSigningKey, userSignature
          ),
          _REVERTREASON441(20)
        );
      }

      // Validate Dharma signing key signature unless it is `msg.sender`.
      if (msg.sender != dharmaSigningKey) {
        require(
          dharmaSigningKey == messageHash.RECOVER45(dharmaSignature),
          _REVERTREASON441(21)
        );
      }
    } else {
      // Validate signing key signature unless user or Dharma is `msg.sender`.
      if (msg.sender != userSigningKey && msg.sender != dharmaSigningKey) {
        require(
          dharmaSigningKey == messageHash.RECOVER45(dharmaSignature) ||
          _VALIDATEUSERSIGNATURE736(
            messageHash, action, arguments, userSigningKey, userSignature
          ),
          _REVERTREASON441(22)
        );
      }
    }

    // Increment nonce in order to prevent reuse of signatures after the call.
    _nonce++;
  }

                                                                                                                                                                                                                                                                                   
  function _MIGRATECTOKENTODTOKEN814(AssetType token) internal {	//inject NONSTANDARD NAMING
    CTokenInterface cToken;
    DTokenInterface dToken;

    if (token == AssetType.DAI) {
      cToken = _cdai946;
      dToken = _ddai54;
    } else {
      cToken = _cusdc56;
      dToken = _dusdc949;
    }

    // Get the current cToken balance for this account.
    uint256 balance = cToken.BALANCEOF379(address(this));

    // Only perform the conversion if there is a non-zero balance.
    if (balance > 0) {    
      // If the allowance is insufficient, set it before depositing.
      if (cToken.ALLOWANCE980(address(this), address(dToken)) < balance) {
        require(cToken.APPROVE141(address(dToken), uint256(-1)), _REVERTREASON441(23));
      }
      
      // Deposit the new balance on the Dharma Token.
      require(dToken.MINTVIACTOKEN11(balance) > 0, _REVERTREASON441(24));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function _CHECKDHARMATOKENINTERACTIONANDLOGANYERRORS224(	//inject NONSTANDARD NAMING
    AssetType asset,
    bytes4 functionSelector,
    bool ok,
    bytes memory data
  ) internal returns (bool success) {
    // Log an external error if something went wrong with the attempt.
    if (ok) {
      if (data.length == 32) {
        uint256 amount = abi.decode(data, (uint256));
        if (amount > 0) {
          success = true;
        } else {
          // Get called contract address, name of contract, and function name.
          (address account, string memory name, string memory functionName) = (
            _GETDHARMATOKENDETAILS638(asset, functionSelector)
          );

          emit EXTERNALERROR905(
            account,
            string(
              abi.encodePacked(
                name,
                " contract did not provide any tokens when calling ",
                functionName,
                "."
              )
            )
          );         
        }
      } else {
        // Get called contract address, name of contract, and function name.
        (address account, string memory name, string memory functionName) = (
          _GETDHARMATOKENDETAILS638(asset, functionSelector)
        );

        emit EXTERNALERROR905(
          account,
          string(
            abi.encodePacked(
              name,
              " contract returned malformed data while attempting to call ",
              functionName,
              "."
            )
          )
        );        
      }
      
    } else {
      // Get called contract address, name of contract, and function name.
      (address account, string memory name, string memory functionName) = (
        _GETDHARMATOKENDETAILS638(asset, functionSelector)
      );

      // Decode the revert reason in the event one was returned.
      string memory revertReason = _DECODEREVERTREASON356(data);

      emit EXTERNALERROR905(
        account,
        string(
          abi.encodePacked(
            name,
            " contract reverted while attempting to call ",
            functionName,
            ": ",
            revertReason
          )
        )
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                       
  function _DIAGNOSEANDEMITUSDCSPECIFICERROR552(bytes4 functionSelector) internal {	//inject NONSTANDARD NAMING
    // Determine the name of the function that was called on USDC.
    string memory functionName;
    if (functionSelector == _usdc983.TRANSFER110.selector) {
      functionName = "transfer";
    } else {
      functionName = "approve";
    }

    // Find out why USDC transfer reverted (it doesn't give revert reasons).
    if (_usdc_naughty885.ISBLACKLISTED446(address(this))) {
      emit EXTERNALERROR905(
        address(_usdc983),
        string(
          abi.encodePacked(
            functionName, " failed - USDC has blacklisted this user."
          )
        )
      );
    } else { // Note: `else if` breaks coverage.
      if (_usdc_naughty885.PAUSED245()) {
        emit EXTERNALERROR905(
          address(_usdc983),
          string(
            abi.encodePacked(
              functionName, " failed - USDC contract is currently paused."
            )
          )
        );
      } else {
        emit EXTERNALERROR905(
          address(_usdc983),
          string(
            abi.encodePacked(
              "USDC contract reverted on ", functionName, "."
            )
          )
        );
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function _ENFORCESELFCALLFROM1000(bytes4 selfCallContext) internal {	//inject NONSTANDARD NAMING
    // Ensure caller is this contract and self-call context is correctly set.
    require(
      msg.sender == address(this) && _selfCallContext == selfCallContext,
      _REVERTREASON441(25)
    );

    // Clear the self-call context.
    delete _selfCallContext;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function _VALIDATEUSERSIGNATURE736(	//inject NONSTANDARD NAMING
    bytes32 messageHash,
    ActionType action,
    bytes memory arguments,
    address userSigningKey,
    bytes memory userSignature
  ) internal view returns (bool valid) {
    if (!userSigningKey.ISCONTRACT780()) {
      valid = userSigningKey == messageHash.RECOVER45(userSignature);
    } else {
      bytes memory data = abi.encode(messageHash, action, arguments);
      valid = (
        ERC1271Interface(userSigningKey).ISVALIDSIGNATURE165(
          data, userSignature
        ) == _erc_1271_magic_value343
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                       
  function _GETDHARMASIGNINGKEY102() internal view returns (	//inject NONSTANDARD NAMING
    address dharmaSigningKey
  ) {
    dharmaSigningKey = _dharma_key_registry40.GETKEY723();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function _GETACTIONID28(	//inject NONSTANDARD NAMING
    ActionType action,
    bytes memory arguments,
    uint256 nonce,
    uint256 minimumActionGas,
    address userSigningKey,
    address dharmaSigningKey
  ) internal view returns (bytes32 actionID) {
    // actionID is constructed according to EIP-191-0x45 to prevent replays.
    actionID = keccak256(
      abi.encodePacked(
        address(this),
        _dharma_smart_wallet_version789,
        userSigningKey,
        dharmaSigningKey,
        nonce,
        minimumActionGas,
        action,
        arguments
      )
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function _GETDHARMATOKENDETAILS638(	//inject NONSTANDARD NAMING
    AssetType asset,
    bytes4 functionSelector
  ) internal pure returns (
    address account,
    string memory name,
    string memory functionName
  ) {
    if (asset == AssetType.DAI) {
      account = address(_ddai54);
      name = "Dharma Dai";
    } else {
      account = address(_dusdc949);
      name = "Dharma USD Coin";
    }

    // Note: since both dTokens have the same interface, just use dDai's.
    if (functionSelector == _ddai54.MINT37.selector) {
      functionName = "mint";
    } else {
      if (functionSelector == ERC20Interface(account).BALANCEOF379.selector) {
        functionName = "balanceOf";
      } else {
        functionName = string(abi.encodePacked(
          "redeem",
          functionSelector == _ddai54.REDEEM218.selector ? "" : "Underlying"
        ));
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function _ENSUREVALIDGENERICCALLTARGET521(address to) internal view {	//inject NONSTANDARD NAMING
    require(to.ISCONTRACT780(), _REVERTREASON441(26));

    require(to != address(this), _REVERTREASON441(27));

    require(to != address(_escape_hatch_registry341), _REVERTREASON441(28));
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS901(	//inject NONSTANDARD NAMING
    ActionType action, uint256 amount, address recipient
  ) internal pure returns (bytes memory arguments) {
    // Ensure that the action type is a valid custom action type.
    require(
      action == ActionType.Cancel ||
      action == ActionType.SetUserSigningKey ||
      action == ActionType.DAIWithdrawal ||
      action == ActionType.USDCWithdrawal ||
      action == ActionType.ETHWithdrawal ||
      action == ActionType.SetEscapeHatch ||
      action == ActionType.RemoveEscapeHatch ||
      action == ActionType.DisableEscapeHatch,
      _REVERTREASON441(29)
    );

    // Use action type to determine parameters to include in returned arguments.
    if (
      action == ActionType.Cancel ||
      action == ActionType.RemoveEscapeHatch ||
      action == ActionType.DisableEscapeHatch
    ) {
      // Ignore parameters for Cancel, RemoveEscapeHatch, or DisableEscapeHatch.
      arguments = abi.encode();
    } else if (
      action == ActionType.SetUserSigningKey ||
      action == ActionType.SetEscapeHatch
    ) {
      // Ignore `amount` parameter for other, non-withdrawal actions.
      arguments = abi.encode(recipient);
    } else {
      // Use both `amount` and `recipient` parameters for withdrawals.
      arguments = abi.encode(amount, recipient);
    }
  }

                                                                                                                                                                                                                                                                                        
  function _DECODEREVERTREASON356(	//inject NONSTANDARD NAMING
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
      revertReason = _REVERTREASON441(uint256(-1));
    }
  }

                                                                                                                                                                                                                                                                 
  function _REVERTREASON441(	//inject NONSTANDARD NAMING
    uint256 code
  ) internal pure returns (string memory reason) {
    reason = _revert_reason_helper99.REASON496(code);
  }
}