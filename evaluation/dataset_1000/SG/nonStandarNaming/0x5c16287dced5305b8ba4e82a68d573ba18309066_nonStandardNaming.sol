                                                                 

pragma solidity 0.5.17; // optimization runs: 200, evm version: istanbul
// WARNING - `executeActionWithAtomicBatchCalls` has a `bytes[]` argument that
// requires ABIEncoderV2. Exercise caution when calling that specific function.
pragma experimental ABIEncoderV2;


interface DharmaSmartWalletImplementationV1Interface {
  event CALLSUCCESS857(	//inject NONSTANDARD NAMING
    bytes32 actionID,
    bool rolledBack,
    uint256 nonce,
    address to,
    uint256 value,
    bytes data,
    bytes returnData
  );

  event CALLFAILURE435(	//inject NONSTANDARD NAMING
    bytes32 actionID,
    uint256 nonce,
    address to,
    uint256 value,
    bytes data,
    string revertReason
  );

  // ABIEncoderV2 uses an array of Calls for executing generic batch calls.
  struct Call {
    address to;
    uint96 value;
    bytes data;
  }

  // ABIEncoderV2 uses an array of CallReturns for handling generic batch calls.
  struct CallReturn {
    bool ok;
    bytes returnData;
  }

  function WITHDRAWETHER426(	//inject NONSTANDARD NAMING
    uint256 amount,
    address payable recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function EXECUTEACTION780(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok, bytes memory returnData);

  function RECOVER590(address newUserSigningKey) external;	//inject NONSTANDARD NAMING

  function EXECUTEACTIONWITHATOMICBATCHCALLS573(	//inject NONSTANDARD NAMING
    Call[] calldata calls,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool[] memory ok, bytes[] memory returnData);

  function GETNEXTGENERICACTIONID811(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETGENERICACTIONID770(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETNEXTGENERICATOMICBATCHACTIONID250(	//inject NONSTANDARD NAMING
    Call[] calldata calls,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETGENERICATOMICBATCHACTIONID610(	//inject NONSTANDARD NAMING
    Call[] calldata calls,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);
}


interface DharmaSmartWalletImplementationV3Interface {
  event CANCEL652(uint256 cancelledNonce);	//inject NONSTANDARD NAMING
  event ETHWITHDRAWAL396(uint256 amount, address recipient);	//inject NONSTANDARD NAMING
}


interface DharmaSmartWalletImplementationV4Interface {
  event ESCAPED535();	//inject NONSTANDARD NAMING

  function SETESCAPEHATCH178(	//inject NONSTANDARD NAMING
    address account,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function REMOVEESCAPEHATCH402(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function PERMANENTLYDISABLEESCAPEHATCH301(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function ESCAPE99(address token) external;	//inject NONSTANDARD NAMING

}


interface DharmaSmartWalletImplementationV7Interface {
  // Fires when a new user signing key is set on the smart wallet.
  event NEWUSERSIGNINGKEY492(address userSigningKey);	//inject NONSTANDARD NAMING

  // Fires when an error occurs as part of an attempted action.
  event EXTERNALERROR942(address indexed source, string revertReason);	//inject NONSTANDARD NAMING

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
    TradeEthForDai,
    DAIBorrow,
    USDCBorrow
  }

  function INITIALIZE213(address userSigningKey) external;	//inject NONSTANDARD NAMING

  function REPAYANDDEPOSIT879() external;	//inject NONSTANDARD NAMING

  function WITHDRAWDAI726(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function WITHDRAWUSDC355(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok);

  function CANCEL55(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata signature
  ) external;

  function SETUSERSIGNINGKEY681(	//inject NONSTANDARD NAMING
    address userSigningKey,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external;

  function MIGRATESAITODAI315() external;	//inject NONSTANDARD NAMING

  function MIGRATECSAITODDAI497() external;	//inject NONSTANDARD NAMING

  function MIGRATECDAITODDAI114() external;	//inject NONSTANDARD NAMING

  function MIGRATECUSDCTODUSDC181() external;	//inject NONSTANDARD NAMING

  function GETBALANCES85() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiBalance,
    uint256 usdcBalance,
    uint256 etherBalance,
    uint256 dDaiUnderlyingDaiBalance,
    uint256 dUsdcUnderlyingUsdcBalance,
    uint256 dEtherUnderlyingEtherBalance // always returns zero
  );

  function GETUSERSIGNINGKEY558() external view returns (address userSigningKey);	//inject NONSTANDARD NAMING

  function GETNONCE522() external view returns (uint256 nonce);	//inject NONSTANDARD NAMING

  function GETNEXTCUSTOMACTIONID319(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETCUSTOMACTIONID998(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETVERSION619() external pure returns (uint256 version);	//inject NONSTANDARD NAMING
}


interface DharmaSmartWalletImplementationV8Interface {
  function TRADEETHFORDAIANDMINTDDAI128(	//inject NONSTANDARD NAMING
    uint256 ethToSupply,
    uint256 minimumDaiReceived,
    address target,
    bytes calldata data,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok, bytes memory returnData);

  function GETNEXTETHFORDAIACTIONID544(	//inject NONSTANDARD NAMING
    uint256 ethToSupply,
    uint256 minimumDaiReceived,
    address target,
    bytes calldata data,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);

  function GETETHFORDAIACTIONID702(	//inject NONSTANDARD NAMING
    uint256 ethToSupply,
    uint256 minimumDaiReceived,
    address target,
    bytes calldata data,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID);
}


interface DharmaSmartWalletImplementationV12Interface {
  function SETAPPROVAL499(address token, uint256 amount) external;	//inject NONSTANDARD NAMING
}

interface DharmaSmartWalletImplementationV13Interface {
  function REDEEMALLDDAI445() external;	//inject NONSTANDARD NAMING
  function REDEEMALLDUSDC458() external;	//inject NONSTANDARD NAMING
}


interface ERC20Interface {
  function TRANSFER800(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE542(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

  function BALANCEOF151(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
  function ALLOWANCE201(	//inject NONSTANDARD NAMING
    address owner, address spender
  ) external view returns (uint256);
}


interface ERC1271Interface {
  function ISVALIDSIGNATURE674(	//inject NONSTANDARD NAMING
    bytes calldata data, bytes calldata signature
  ) external view returns (bytes4 magicValue);
}


interface DTokenInterface {
  // These external functions trigger accrual on the dToken and backing cToken.
  function MINT315(uint256 underlyingToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING
  function REDEEM655(uint256 dTokensToBurn) external returns (uint256 underlyingReceived);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYING883(uint256 underlyingToReceive) external returns (uint256 dTokensBurned);	//inject NONSTANDARD NAMING

  // These external functions only trigger accrual on the dToken.
  function MINTVIACTOKEN918(uint256 cTokensToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING

  // View and pure functions do not trigger accrual on the dToken or the cToken.
  function BALANCEOFUNDERLYING347(address account) external view returns (uint256 underlyingBalance);	//inject NONSTANDARD NAMING
}


interface DharmaKeyRegistryInterface {
  function GETKEY633() external view returns (address key);	//inject NONSTANDARD NAMING
}


interface DharmaEscapeHatchRegistryInterface {
  function SETESCAPEHATCH178(address newEscapeHatch) external;	//inject NONSTANDARD NAMING

  function REMOVEESCAPEHATCH402() external;	//inject NONSTANDARD NAMING

  function PERMANENTLYDISABLEESCAPEHATCH301() external;	//inject NONSTANDARD NAMING

  function GETESCAPEHATCH195() external view returns (	//inject NONSTANDARD NAMING
    bool exists, address escapeHatch
  );
}


interface RevertReasonHelperInterface {
  function REASON288(uint256 code) external pure returns (string memory);	//inject NONSTANDARD NAMING
}


interface EtherizedInterface {
  function TRIGGERETHERTRANSFER819(	//inject NONSTANDARD NAMING
    address payable target, uint256 value
  ) external returns (bool success);
}


library Address {
  function ISCONTRACT795(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
    uint256 size;
    assembly { size := extcodesize(account) }
    return size > 0;
  }
}


library ECDSA {
  function RECOVER590(	//inject NONSTANDARD NAMING
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

  function TOETHSIGNEDMESSAGEHASH601(bytes32 hash) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
  }
}


contract Etherized is EtherizedInterface {
  address private constant _etherizer480 = address(	//inject NONSTANDARD NAMING
    0x723B51b72Ae89A3d0c2a2760f0458307a1Baa191 
  );

  function TRIGGERETHERTRANSFER819(	//inject NONSTANDARD NAMING
    address payable target, uint256 amount
  ) external returns (bool success) {
    require(msg.sender == _etherizer480, "Etherized: only callable by Etherizer");
    (success, ) = target.call.value(amount)("");
    if (!success) {
      assembly {
        returndatacopy(0, 0, returndatasize())
        revert(0, returndatasize())
      }
    }
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
contract DharmaSmartWalletImplementationV14 is
  DharmaSmartWalletImplementationV1Interface,
  DharmaSmartWalletImplementationV3Interface,
  DharmaSmartWalletImplementationV4Interface,
  DharmaSmartWalletImplementationV7Interface,
  DharmaSmartWalletImplementationV8Interface,
  DharmaSmartWalletImplementationV12Interface,
  DharmaSmartWalletImplementationV13Interface,
  ERC1271Interface,
  Etherized {
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
  uint256 internal constant _dharma_smart_wallet_version936 = 14;	//inject NONSTANDARD NAMING

  // DharmaKeyRegistryV2 holds a public key for verifying meta-transactions.
  DharmaKeyRegistryInterface internal constant _dharma_key_registry92 = (	//inject NONSTANDARD NAMING
    DharmaKeyRegistryInterface(0x000000000D38df53b45C5733c7b34000dE0BDF52)
  );

  // Account recovery is facilitated using a hard-coded recovery manager,
  // controlled by Dharma and implementing appropriate timelocks.
  address internal constant _account_recovery_manager251 = address(	//inject NONSTANDARD NAMING
    0x0000000000DfEd903aD76996FC07BF89C0127B1E
  );

  // Users can designate an "escape hatch" account with the ability to sweep any
  // funds from their smart wallet by using the Dharma Escape Hatch Registry.
  DharmaEscapeHatchRegistryInterface internal constant _escape_hatch_registry399 = (	//inject NONSTANDARD NAMING
    DharmaEscapeHatchRegistryInterface(0x00000000005280B515004B998a944630B6C663f8)
  );

  // Interface with dDai and dUSDC contracts.
  DTokenInterface internal constant _ddai566 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000001876eB1444c986fD502e618c587430 // mainnet
  );

  DTokenInterface internal constant _dusdc30 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000008943c65cAf789FFFCF953bE156f6f8 // mainnet
  );

  // The "revert reason helper" contains a collection of revert reason strings.
  RevertReasonHelperInterface internal constant _revert_reason_helper609 = (	//inject NONSTANDARD NAMING
    RevertReasonHelperInterface(0x9C0ccB765D3f5035f8b5Dd30fE375d5F4997D8E4)
  );

  // The "Trade Bot" enables limit orders using unordered meta-transactions.
  address internal constant _trade_bot378 = address(	//inject NONSTANDARD NAMING
    0x8bFB7aC05bF9bDC6Bc3a635d4dd209c8Ba39E554
  );

  // ERC-1271 must return this magic value when `isValidSignature` is called.
  bytes4 internal constant _erc_1271_magic_value298 = bytes4(0x20c13b0b);	//inject NONSTANDARD NAMING

  // Specify the amount of gas to supply when making Ether transfers.
  uint256 private constant _eth_transfer_gas743 = 4999;	//inject NONSTANDARD NAMING

                                                      
  function () external payable {}

                                                                                                                                                                                                                                                                                                           
  function INITIALIZE213(address userSigningKey) external {	//inject NONSTANDARD NAMING
    // Ensure that this function is only callable during contract construction.
    assembly { if extcodesize(address) { revert(0, 0) } }

    // Set up the user's signing key and emit a corresponding event.
    _SETUSERSIGNINGKEY556(userSigningKey);
  }

                                                                            
  function REDEEMALLDDAI445() external {	//inject NONSTANDARD NAMING
    _WITHDRAWMAXFROMDHARMATOKEN16(AssetType.DAI);
  }

                                                                                  
  function REDEEMALLDUSDC458() external {	//inject NONSTANDARD NAMING
    _WITHDRAWMAXFROMDHARMATOKEN16(AssetType.USDC);
  }

                                                          
  function REPAYANDDEPOSIT879() external {	//inject NONSTANDARD NAMING
    revert("Deprecated.");
  }

                                                          
  function WITHDRAWDAI726(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    revert("Deprecated.");
  }

                                                          
  function WITHDRAWUSDC355(	//inject NONSTANDARD NAMING
    uint256 amount,
    address recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    revert("Deprecated.");
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function WITHDRAWETHER426(	//inject NONSTANDARD NAMING
    uint256 amount,
    address payable recipient,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok) {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE460(
      ActionType.ETHWithdrawal,
      abi.encode(amount, recipient),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Ensure that a non-zero amount of Ether has been supplied.
    if (amount == 0) {
      revert(_REVERTREASON242(4));
    }

    // Ensure that a non-zero recipient has been supplied.
    if (recipient == address(0)) {
      revert(_REVERTREASON242(1));
    }

    // Attempt to transfer Ether to the recipient and emit an appropriate event.
    ok = _TRANSFERETH343(recipient, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function CANCEL55(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata signature
  ) external {
    // Get the current nonce.
    uint256 nonceToCancel = _nonce;

    // Ensure the caller or the supplied signature is valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE460(
      ActionType.Cancel,
      abi.encode(),
      minimumActionGas,
      signature,
      signature
    );

    // Emit an event to validate that the nonce is no longer valid.
    emit CANCEL652(nonceToCancel);
  }

                                                          
  function EXECUTEACTION780(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok, bytes memory returnData) {
    revert("Deprecated.");
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function SETUSERSIGNINGKEY681(	//inject NONSTANDARD NAMING
    address userSigningKey,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE460(
      ActionType.SetUserSigningKey,
      abi.encode(userSigningKey),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Set new user signing key on smart wallet and emit a corresponding event.
    _SETUSERSIGNINGKEY556(userSigningKey);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function SETESCAPEHATCH178(	//inject NONSTANDARD NAMING
    address account,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE460(
      ActionType.SetEscapeHatch,
      abi.encode(account),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Ensure that an escape hatch account has been provided.
    if (account == address(0)) {
      revert(_REVERTREASON242(5));
    }

    // Set a new escape hatch for the smart wallet unless it has been disabled.
    _escape_hatch_registry399.SETESCAPEHATCH178(account);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function REMOVEESCAPEHATCH402(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE460(
      ActionType.RemoveEscapeHatch,
      abi.encode(),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Remove the escape hatch for the smart wallet if one is currently set.
    _escape_hatch_registry399.REMOVEESCAPEHATCH402();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function PERMANENTLYDISABLEESCAPEHATCH301(	//inject NONSTANDARD NAMING
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external {
    // Ensure caller and/or supplied signatures are valid and increment nonce.
    _VALIDATEACTIONANDINCREMENTNONCE460(
      ActionType.DisableEscapeHatch,
      abi.encode(),
      minimumActionGas,
      userSignature,
      dharmaSignature
    );

    // Permanently disable the escape hatch mechanism for this smart wallet.
    _escape_hatch_registry399.PERMANENTLYDISABLEESCAPEHATCH301();
  }

                                                          
  function TRADEETHFORDAIANDMINTDDAI128(	//inject NONSTANDARD NAMING
    uint256 ethToSupply,
    uint256 minimumDaiReceived,
    address target,
    bytes calldata data,
    uint256 minimumActionGas,
    bytes calldata userSignature,
    bytes calldata dharmaSignature
  ) external returns (bool ok, bytes memory returnData) {
    revert("Deprecated.");
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function ESCAPE99(address token) external {	//inject NONSTANDARD NAMING
    // Get the escape hatch account, if one exists, for this account.
    (bool exists, address escapeHatch) = _escape_hatch_registry399.GETESCAPEHATCH195();

    // Ensure that an escape hatch is currently set for this smart wallet.
    if (!exists) {
      revert(_REVERTREASON242(6));
    }

    // Ensure that the escape hatch account is the caller.
    if (msg.sender != escapeHatch) {
      revert(_REVERTREASON242(7));
    }

    if (token == address(0)) {
      // Determine if there is Ether at this address that should be transferred.
      uint256 balance = address(this).balance;
      if (balance > 0) {
        // Attempt to transfer any Ether to caller and emit an appropriate event.
        _TRANSFERETH343(msg.sender, balance);
      }
    } else {
      // Attempt to transfer all tokens to the caller.
      _TRANSFERMAX66(ERC20Interface(address(token)), msg.sender, false);
    }

    // Emit an `Escaped` event.
    emit ESCAPED535();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function RECOVER590(address newUserSigningKey) external {	//inject NONSTANDARD NAMING
    // Only the Account Recovery Manager contract may call this function.
    if (msg.sender != _account_recovery_manager251) {
      revert(_REVERTREASON242(8));
    }

    // Increment nonce to prevent signature reuse should original key be reset.
    _nonce++;

    // Set up the user's new dharma key and emit a corresponding event.
    _SETUSERSIGNINGKEY556(newUserSigningKey);
  }

  function SETAPPROVAL499(address token, uint256 amount) external {	//inject NONSTANDARD NAMING
    // Only the Trade Bot contract may call this function.
    if (msg.sender != _trade_bot378) {
      revert("Only the Trade Bot may call this function.");
    }

    ERC20Interface(token).APPROVE542(_trade_bot378, amount);
  }

                                                          
  function MIGRATESAITODAI315() external {	//inject NONSTANDARD NAMING
    revert("Deprecated.");
  }

                                                          
  function MIGRATECSAITODDAI497() external {	//inject NONSTANDARD NAMING
    revert("Deprecated.");
  }

                                                          
  function MIGRATECDAITODDAI114() external {	//inject NONSTANDARD NAMING
     revert("Deprecated.");
  }

                                                          
  function MIGRATECUSDCTODUSDC181() external {	//inject NONSTANDARD NAMING
     revert("Deprecated.");
  }

                                                          
  function GETBALANCES85() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiBalance,
    uint256 usdcBalance,
    uint256 etherBalance,
    uint256 dDaiUnderlyingDaiBalance,
    uint256 dUsdcUnderlyingUsdcBalance,
    uint256 dEtherUnderlyingEtherBalance // always returns 0
  ) {
    revert("Deprecated.");
  }

                                                                                                                                                     
  function GETUSERSIGNINGKEY558() external view returns (address userSigningKey) {	//inject NONSTANDARD NAMING
    userSigningKey = _userSigningKey;
  }

                                                                                                                                                                                                                                             
  function GETNONCE522() external view returns (uint256 nonce) {	//inject NONSTANDARD NAMING
    nonce = _nonce;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function GETNEXTCUSTOMACTIONID319(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID247(
      action,
      _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS7(action, amount, recipient),
      _nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY288()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function GETCUSTOMACTIONID998(	//inject NONSTANDARD NAMING
    ActionType action,
    uint256 amount,
    address recipient,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID247(
      action,
      _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS7(action, amount, recipient),
      nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY288()
    );
  }

                                                          
  function GETNEXTGENERICACTIONID811(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    revert("Deprecated.");
  }

                                                          
  function GETGENERICACTIONID770(	//inject NONSTANDARD NAMING
    address to,
    bytes calldata data,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    revert("Deprecated.");
  }

                                                          
  function GETNEXTETHFORDAIACTIONID544(	//inject NONSTANDARD NAMING
    uint256 ethToSupply,
    uint256 minimumDaiReceived,
    address target,
    bytes calldata data,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    revert("Deprecated.");
  }

                                                          
  function GETETHFORDAIACTIONID702(	//inject NONSTANDARD NAMING
    uint256 ethToSupply,
    uint256 minimumDaiReceived,
    address target,
    bytes calldata data,
    uint256 nonce,
    uint256 minimumActionGas
  ) external view returns (bytes32 actionID) {
    revert("Deprecated.");
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function ISVALIDSIGNATURE674(	//inject NONSTANDARD NAMING
    bytes calldata data, bytes calldata signatures
  ) external view returns (bytes4 magicValue) {
    // Get message hash digest and any additional context from data argument.
    bytes32 digest;
    bytes memory context;

    if (data.length == 32) {
      digest = abi.decode(data, (bytes32));
    } else {
      if (data.length < 64) {
        revert(_REVERTREASON242(30));
      }
      (digest, context) = abi.decode(data, (bytes32, bytes));
    }

    // Get Dharma signature & user signature from combined signatures argument.
    if (signatures.length != 130) {
      revert(_REVERTREASON242(11));
    }
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
    if (
      !_VALIDATEUSERSIGNATURE797(
        digest,
        ActionType.SignatureVerification,
        context,
        _userSigningKey,
        userSignature
      )
    ) {
      revert(_REVERTREASON242(12));
    }

    // Recover Dharma signature against key returned from Dharma Key Registry.
    if (_GETDHARMASIGNINGKEY288() != digest.RECOVER590(dharmaSignature)) {
      revert(_REVERTREASON242(13));
    }

    // Return the ERC-1271 magic value to indicate success.
    magicValue = _erc_1271_magic_value298;
  }

                                                                                                                                                                                                                        
  function GETIMPLEMENTATION841() external view returns (address implementation) {	//inject NONSTANDARD NAMING
    (bool ok, bytes memory returnData) = address(
      0x000000000026750c571ce882B17016557279ADaa
    ).staticcall("");
    require(ok && returnData.length == 32, "Invalid implementation.");
    implementation = abi.decode(returnData, (address));
  }

                                                                                                                                                 
  function GETVERSION619() external pure returns (uint256 version) {	//inject NONSTANDARD NAMING
    version = _dharma_smart_wallet_version936;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function EXECUTEACTIONWITHATOMICBATCHCALLS573(	//inject NONSTANDARD NAMING
    Call[] memory calls,
    uint256 minimumActionGas,
    bytes memory userSignature,
    bytes memory dharmaSignature
  ) public returns (bool[] memory ok, bytes[] memory returnData) {
    // Ensure that each `to` address is a contract and is not this contract.
    for (uint256 i = 0; i < calls.length; i++) {
      if (calls[i].value == 0) {
        _ENSUREVALIDGENERICCALLTARGET283(calls[i].to);
      }
    }

    // Ensure caller and/or supplied signatures are valid and increment nonce.
    (bytes32 actionID, uint256 nonce) = _VALIDATEACTIONANDINCREMENTNONCE460(
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
    _selfCallContext = this.EXECUTEACTIONWITHATOMICBATCHCALLS573.selector;

    // Make the atomic self-call - if any call fails, calls that preceded it
    // will be rolled back and calls that follow it will not be made.
    (bool externalOk, bytes memory rawCallResults) = address(this).call(
      abi.encodeWithSelector(
        this._EXECUTEACTIONWITHATOMICBATCHCALLSATOMIC347.selector, calls
      )
    );

    // Ensure that self-call context has been cleared.
    if (!externalOk) {
      delete _selfCallContext;
    }

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
        emit CALLSUCCESS857(
          actionID,
          !externalOk, // If another call failed this will have been rolled back
          nonce,
          currentCall.to,
          uint256(currentCall.value),
          currentCall.data,
          callResults[i].returnData
        );
      } else {
        // Note: while the call failed, the nonce will still be incremented,
        // which will invalidate all supplied signatures.
        emit CALLFAILURE435(
          actionID,
          nonce,
          currentCall.to,
          uint256(currentCall.value),
          currentCall.data,
          _DECODEREVERTREASON385(callResults[i].returnData)
        );

        // exit early - any calls after the first failed call will not execute.
        break;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function _EXECUTEACTIONWITHATOMICBATCHCALLSATOMIC347(	//inject NONSTANDARD NAMING
    Call[] memory calls
  ) public returns (CallReturn[] memory callResults) {
    // Ensure caller is this contract and self-call context is correctly set.
    _ENFORCESELFCALLFROM123(this.EXECUTEACTIONWITHATOMICBATCHCALLS573.selector);

    bool rollBack = false;
    callResults = new CallReturn[](calls.length);

    for (uint256 i = 0; i < calls.length; i++) {
      // Perform low-level call and set return values using result.
      (bool ok, bytes memory returnData) = calls[i].to.call.value(
        uint256(calls[i].value)
      )(calls[i].data);
      callResults[i] = CallReturn({ok: ok, returnData: returnData});
      if (!ok) {
        // Exit early - any calls after the first failed call will not execute.
        rollBack = true;
        break;
      }
    }

    if (rollBack) {
      // Wrap in length encoding and revert (provide bytes instead of a string).
      bytes memory callResultsBytes = abi.encode(callResults);
      assembly { revert(add(32, callResultsBytes), mload(callResultsBytes)) }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function SIMULATEACTIONWITHATOMICBATCHCALLS972(	//inject NONSTANDARD NAMING
    Call[] memory calls
  ) public            returns (bool[] memory ok, bytes[] memory returnData) {
    // Ensure that each `to` address is a contract and is not this contract.
    for (uint256 i = 0; i < calls.length; i++) {
      if (calls[i].value == 0) {
        _ENSUREVALIDGENERICCALLTARGET283(calls[i].to);
      }
    }

    // Specify length of returned values in order to work with them in memory.
    ok = new bool[](calls.length);
    returnData = new bytes[](calls.length);

    // Set self-call context to call _simulateActionWithAtomicBatchCallsAtomic.
    _selfCallContext = this.SIMULATEACTIONWITHATOMICBATCHCALLS972.selector;

    // Make the atomic self-call - if any call fails, calls that preceded it
    // will be rolled back and calls that follow it will not be made.
    (bool mustBeFalse, bytes memory rawCallResults) = address(this).call(
      abi.encodeWithSelector(
        this._SIMULATEACTIONWITHATOMICBATCHCALLSATOMIC741.selector, calls
      )
    );

    // Note: this should never be the case, but check just to be extra safe.
    if (mustBeFalse) {
      revert("Simulation call must revert!");
    }

    // Ensure that self-call context has been cleared.
    delete _selfCallContext;

    // Parse data returned from self-call into each call result and store / log.
    CallReturn[] memory callResults = abi.decode(rawCallResults, (CallReturn[]));
    for (uint256 i = 0; i < callResults.length; i++) {
      // Set the status and the return data / revert reason from the call.
      ok[i] = callResults[i].ok;
      returnData[i] = callResults[i].returnData;

      if (!callResults[i].ok) {
        // exit early - any calls after the first failed call will not execute.
        break;
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function _SIMULATEACTIONWITHATOMICBATCHCALLSATOMIC741(	//inject NONSTANDARD NAMING
    Call[] memory calls
  ) public returns (CallReturn[] memory callResults) {
    // Ensure caller is this contract and self-call context is correctly set.
    _ENFORCESELFCALLFROM123(this.SIMULATEACTIONWITHATOMICBATCHCALLS972.selector);

    callResults = new CallReturn[](calls.length);

    for (uint256 i = 0; i < calls.length; i++) {
      // Perform low-level call and set return values using result.
      (bool ok, bytes memory returnData) = calls[i].to.call.value(
        uint256(calls[i].value)
      )(calls[i].data);
      callResults[i] = CallReturn({ok: ok, returnData: returnData});
      if (!ok) {
        // Exit early - any calls after the first failed call will not execute.
        break;
      }
    }

    // Wrap in length encoding and revert (provide bytes instead of a string).
    bytes memory callResultsBytes = abi.encode(callResults);
    assembly { revert(add(32, callResultsBytes), mload(callResultsBytes)) }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function GETNEXTGENERICATOMICBATCHACTIONID250(	//inject NONSTANDARD NAMING
    Call[] memory calls,
    uint256 minimumActionGas
  ) public view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID247(
      ActionType.GenericAtomicBatch,
      abi.encode(calls),
      _nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY288()
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function GETGENERICATOMICBATCHACTIONID610(	//inject NONSTANDARD NAMING
    Call[] memory calls,
    uint256 nonce,
    uint256 minimumActionGas
  ) public view returns (bytes32 actionID) {
    // Determine the actionID - this serves as a signature hash for an action.
    actionID = _GETACTIONID247(
      ActionType.GenericAtomicBatch,
      abi.encode(calls),
      nonce,
      minimumActionGas,
      _userSigningKey,
      _GETDHARMASIGNINGKEY288()
    );
  }

                                                                                                                                                                                                                                                                                                                                       
  function _SETUSERSIGNINGKEY556(address userSigningKey) internal {	//inject NONSTANDARD NAMING
    // Ensure that a user signing key is set on this smart wallet.
    if (userSigningKey == address(0)) {
      revert(_REVERTREASON242(14));
    }

    _userSigningKey = userSigningKey;
    emit NEWUSERSIGNINGKEY492(userSigningKey);
  }

                                                                                                                                                                                                                                                                                                                                      
  function _WITHDRAWMAXFROMDHARMATOKEN16(AssetType asset) internal {	//inject NONSTANDARD NAMING
    // Get dToken address for the asset type. (No custom ETH withdrawal action.)
    address dToken = asset == AssetType.DAI ? address(_ddai566) : address(_dusdc30);

    // Try to retrieve the current dToken balance for this account.
    ERC20Interface dTokenBalance;
    (bool ok, bytes memory data) = dToken.call(abi.encodeWithSelector(
      dTokenBalance.BALANCEOF151.selector, address(this)
    ));

    uint256 redeemAmount = 0;
    if (ok && data.length == 32) {
      redeemAmount = abi.decode(data, (uint256));
    } else {
      // Something went wrong with the balance check - log an ExternalError.
      _CHECKDHARMATOKENINTERACTIONANDLOGANYERRORS202(
        asset, dTokenBalance.BALANCEOF151.selector, ok, data
      );
    }

    // Only perform the call to redeem if there is a non-zero balance.
    if (redeemAmount > 0) {
      // Attempt to redeem the underlying balance from the dToken contract.
      (ok, data) = dToken.call(abi.encodeWithSelector(
        // Function selector is the same for all dTokens, so just use dDai's.
        _ddai566.REDEEM655.selector, redeemAmount
      ));

      // Log an external error if something went wrong with the attempt.
      _CHECKDHARMATOKENINTERACTIONANDLOGANYERRORS202(
        asset, _ddai566.REDEEM655.selector, ok, data
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function _TRANSFERMAX66(	//inject NONSTANDARD NAMING
    ERC20Interface token, address recipient, bool suppressRevert
  ) internal returns (bool success) {
    // Get the current balance on the smart wallet for the supplied ERC20 token.
    uint256 balance = 0;
    bool balanceCheckWorked = true;
    if (!suppressRevert) {
      balance = token.BALANCEOF151(address(this));
    } else {
      // Try to retrieve current token balance for this account with 1/2 gas.
      (bool ok, bytes memory data) = address(token).call.gas(gasleft() / 2)(
        abi.encodeWithSelector(token.BALANCEOF151.selector, address(this))
      );

      if (ok && data.length >= 32) {
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
        success = token.TRANSFER800(recipient, balance);
      } else {
        // Attempt transfer with 1/2 gas, allow reverts, and return call status.
        (success, ) = address(token).call.gas(gasleft() / 2)(
          abi.encodeWithSelector(token.TRANSFER800.selector, recipient, balance)
        );
      }
    } else {
      // Skip the transfer and return true as long as the balance check worked.
      success = balanceCheckWorked;
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function _TRANSFERETH343(	//inject NONSTANDARD NAMING
    address payable recipient, uint256 amount
  ) internal returns (bool success) {
    // Attempt to transfer any Ether to caller and emit an event if it fails.
    (success, ) = recipient.call.gas(_eth_transfer_gas743).value(amount)("");
    if (!success) {
      emit EXTERNALERROR942(recipient, _REVERTREASON242(18));
    } else {
      emit ETHWITHDRAWAL396(amount, recipient);
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function _VALIDATEACTIONANDINCREMENTNONCE460(	//inject NONSTANDARD NAMING
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
      if (gasleft() < minimumActionGas) {
        revert(_REVERTREASON242(19));
      }
    }

    // Get the current nonce for the action to be performed.
    actionNonce = _nonce;

    // Get the user signing key that will be used to verify their signature.
    address userSigningKey = _userSigningKey;

    // Get the Dharma signing key that will be used to verify their signature.
    address dharmaSigningKey = _GETDHARMASIGNINGKEY288();

    // Determine the actionID - this serves as the signature hash.
    actionID = _GETACTIONID247(
      action,
      arguments,
      actionNonce,
      minimumActionGas,
      userSigningKey,
      dharmaSigningKey
    );

    // Compute the message hash - the hashed, EIP-191-0x45-prefixed action ID.
    bytes32 messageHash = actionID.TOETHSIGNEDMESSAGEHASH601();

    // Actions other than Cancel require both signatures; Cancel only needs one.
    if (action != ActionType.Cancel) {
      // Validate user signing key signature unless it is `msg.sender`.
      if (msg.sender != userSigningKey) {
        if (
          !_VALIDATEUSERSIGNATURE797(
            messageHash, action, arguments, userSigningKey, userSignature
          )
        ) {
          revert(_REVERTREASON242(20));
        }
      }

      // Validate Dharma signing key signature unless it is `msg.sender`.
      if (msg.sender != dharmaSigningKey) {
        if (dharmaSigningKey != messageHash.RECOVER590(dharmaSignature)) {
          revert(_REVERTREASON242(21));
        }
      }
    } else {
      // Validate signing key signature unless user or Dharma is `msg.sender`.
      if (msg.sender != userSigningKey && msg.sender != dharmaSigningKey) {
        if (
          dharmaSigningKey != messageHash.RECOVER590(dharmaSignature) &&
          !_VALIDATEUSERSIGNATURE797(
            messageHash, action, arguments, userSigningKey, userSignature
          )
        ) {
          revert(_REVERTREASON242(22));
        }
      }
    }

    // Increment nonce in order to prevent reuse of signatures after the call.
    _nonce++;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function _CHECKDHARMATOKENINTERACTIONANDLOGANYERRORS202(	//inject NONSTANDARD NAMING
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
            _GETDHARMATOKENDETAILS369(asset, functionSelector)
          );

          emit EXTERNALERROR942(
            account,
            string(
              abi.encodePacked(
                name,
                " gave no tokens calling ",
                functionName,
                "."
              )
            )
          );
        }
      } else {
        // Get called contract address, name of contract, and function name.
        (address account, string memory name, string memory functionName) = (
          _GETDHARMATOKENDETAILS369(asset, functionSelector)
        );

        emit EXTERNALERROR942(
          account,
          string(
            abi.encodePacked(
              name,
              " gave bad data calling ",
              functionName,
              "."
            )
          )
        );
      }

    } else {
      // Get called contract address, name of contract, and function name.
      (address account, string memory name, string memory functionName) = (
        _GETDHARMATOKENDETAILS369(asset, functionSelector)
      );

      // Decode the revert reason in the event one was returned.
      string memory revertReason = _DECODEREVERTREASON385(data);

      emit EXTERNALERROR942(
        account,
        string(
          abi.encodePacked(
            name,
            " reverted calling ",
            functionName,
            ": ",
            revertReason
          )
        )
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function _ENFORCESELFCALLFROM123(bytes4 selfCallContext) internal {	//inject NONSTANDARD NAMING
    // Ensure caller is this contract and self-call context is correctly set.
    if (msg.sender != address(this) || _selfCallContext != selfCallContext) {
      revert(_REVERTREASON242(25));
    }

    // Clear the self-call context.
    delete _selfCallContext;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function _VALIDATEUSERSIGNATURE797(	//inject NONSTANDARD NAMING
    bytes32 messageHash,
    ActionType action,
    bytes memory arguments,
    address userSigningKey,
    bytes memory userSignature
  ) internal view returns (bool valid) {
    if (!userSigningKey.ISCONTRACT795()) {
      valid = userSigningKey == messageHash.RECOVER590(userSignature);
    } else {
      bytes memory data = abi.encode(messageHash, action, arguments);
      valid = (
        ERC1271Interface(userSigningKey).ISVALIDSIGNATURE674(
          data, userSignature
        ) == _erc_1271_magic_value298
      );
    }
  }

                                                                                                                                                                                                                                                                                                                                                                       
  function _GETDHARMASIGNINGKEY288() internal view returns (	//inject NONSTANDARD NAMING
    address dharmaSigningKey
  ) {
    dharmaSigningKey = _dharma_key_registry92.GETKEY633();
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
  function _GETACTIONID247(	//inject NONSTANDARD NAMING
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
        _dharma_smart_wallet_version936,
        userSigningKey,
        dharmaSigningKey,
        nonce,
        minimumActionGas,
        action,
        arguments
      )
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function _GETDHARMATOKENDETAILS369(	//inject NONSTANDARD NAMING
    AssetType asset,
    bytes4 functionSelector
  ) internal pure returns (
    address account,
    string memory name,
    string memory functionName
  ) {
    if (asset == AssetType.DAI) {
      account = address(_ddai566);
      name = "Dharma Dai";
    } else {
      account = address(_dusdc30);
      name = "Dharma USD Coin";
    }

    // Note: since both dTokens have the same interface, just use dDai's.
    if (functionSelector == _ddai566.MINT315.selector) {
      functionName = "mint";
    } else {
      if (functionSelector == ERC20Interface(account).BALANCEOF151.selector) {
        functionName = "balanceOf";
      } else {
        functionName = string(abi.encodePacked(
          "redeem",
          functionSelector == _ddai566.REDEEM655.selector ? "" : "Underlying"
        ));
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function _ENSUREVALIDGENERICCALLTARGET283(address to) internal view {	//inject NONSTANDARD NAMING
    if (!to.ISCONTRACT795()) {
      revert(_REVERTREASON242(26));
    }

    if (to == address(this)) {
      revert(_REVERTREASON242(27));
    }

    if (to == address(_escape_hatch_registry399)) {
      revert(_REVERTREASON242(28));
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function _VALIDATECUSTOMACTIONTYPEANDGETARGUMENTS7(	//inject NONSTANDARD NAMING
    ActionType action, uint256 amount, address recipient
  ) internal pure returns (bytes memory arguments) {
    // Ensure that the action type is a valid custom action type.
    bool validActionType = (
      action == ActionType.Cancel ||
      action == ActionType.SetUserSigningKey ||
      action == ActionType.DAIWithdrawal ||
      action == ActionType.USDCWithdrawal ||
      action == ActionType.ETHWithdrawal ||
      action == ActionType.SetEscapeHatch ||
      action == ActionType.RemoveEscapeHatch ||
      action == ActionType.DisableEscapeHatch
    );
    if (!validActionType) {
      revert(_REVERTREASON242(29));
    }

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

                                                                                                                                                                                                                                                                                        
  function _DECODEREVERTREASON385(	//inject NONSTANDARD NAMING
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
      revertReason = _REVERTREASON242(uint256(-1));
    }
  }

                                                                                                                                                                                                                                                                 
  function _REVERTREASON242(	//inject NONSTANDARD NAMING
    uint256 code
  ) internal pure returns (string memory reason) {
    reason = _revert_reason_helper609.REASON288(code);
  }
}