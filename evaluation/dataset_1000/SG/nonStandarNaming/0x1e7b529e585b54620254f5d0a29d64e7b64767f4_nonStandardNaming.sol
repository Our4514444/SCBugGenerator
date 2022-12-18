                                                                 

pragma solidity 0.5.11; // optimization runs: 200, evm version: petersburg


interface DharmaReserveManagerV2Interface {
  event ROLEMODIFIED846(Role indexed role, address account);	//inject NONSTANDARD NAMING
  event ROLEPAUSED79(Role indexed role);	//inject NONSTANDARD NAMING
  event ROLEUNPAUSED847(Role indexed role);	//inject NONSTANDARD NAMING

  enum Role {
    DEPOSIT_MANAGER,
    ADJUSTER,
    PAUSER
  }

  struct RoleStatus {
    address account;
    bool paused;
  }

  function FINALIZEDAIDEPOSIT227(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 daiAmount
  ) external;

  function FINALIZEDHARMADAIDEPOSIT294(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 dDaiAmount
  ) external;

  function MINT463(uint256 daiAmount) external returns (uint256 dDaiMinted);	//inject NONSTANDARD NAMING
  
  function REDEEM710(uint256 dDaiAmount) external returns (uint256 daiReceived);	//inject NONSTANDARD NAMING
  
  function TRADEDDAIFORUSDC902(	//inject NONSTANDARD NAMING
    uint256 daiEquivalentAmount,
    uint256 quotedDaiToUSDCExchangeRate
  ) external returns (uint256 usdcReceived);
  
  function TRADEUSDCFORDDAI71(	//inject NONSTANDARD NAMING
    uint256 usdcAmount,
    uint256 quotedUSDCToDaiExchangeRate
  ) external returns (uint256 dDaiMinted);

  function WITHDRAWUSDC319(address recipient, uint256 usdcAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWDAI918(address recipient, uint256 daiAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWDHARMADAI949(address recipient, uint256 dDaiAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAW172(	//inject NONSTANDARD NAMING
    ERC20Interface token, address recipient, uint256 amount
  ) external returns (bool success);

  function CALL948(	//inject NONSTANDARD NAMING
    address payable target, uint256 amount, bytes calldata data
  ) external returns (bool ok, bytes memory returnData);
  
  function SETLIMIT231(uint256 daiAmount) external;	//inject NONSTANDARD NAMING

  function SETROLE953(Role role, address account) external;	//inject NONSTANDARD NAMING

  function REMOVEROLE946(Role role) external;	//inject NONSTANDARD NAMING

  function PAUSE9(Role role) external;	//inject NONSTANDARD NAMING

  function UNPAUSE775(Role role) external;	//inject NONSTANDARD NAMING

  function ISPAUSED167(Role role) external view returns (bool paused);	//inject NONSTANDARD NAMING

  function ISROLE873(Role role) external view returns (bool hasRole);	//inject NONSTANDARD NAMING

  function ISDHARMASMARTWALLET454(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) external view returns (bool dharmaSmartWallet);

  function GETDEPOSITMANAGER528() external view returns (address operator);	//inject NONSTANDARD NAMING

  function GETADJUSTER751() external view returns (address recoverer);	//inject NONSTANDARD NAMING

  function GETPAUSER177() external view returns (address pauser);	//inject NONSTANDARD NAMING
  
  function GETRESERVES460() external view returns (	//inject NONSTANDARD NAMING
    uint256 dai, uint256 dDai, uint256 dDaiUnderlying
  );
  
  function GETLIMIT30() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 dDaiAmount
  );
}

interface ERC20Interface {
  function BALANCEOF313(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function APPROVE251(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFER761(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
}

interface DTokenInterface {
  function MINT463(uint256 underlyingToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING
  function REDEEM710(uint256 dTokensToBurn) external returns (uint256 underlyingReceived);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYING242(uint256 underlyingToReceive) external returns (uint256 dTokensBurned);	//inject NONSTANDARD NAMING
  function BALANCEOF313(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOFUNDERLYING558(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER761(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE251(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function EXCHANGERATECURRENT315() external view returns (uint256);	//inject NONSTANDARD NAMING
}

interface TradeHelperInterface {
  function TRADEUSDCFORDDAI71(uint256 amountUSDC, uint256 quotedExchangeRate) external returns (uint256 dDaiMinted);	//inject NONSTANDARD NAMING
  function TRADEDDAIFORUSDC902(uint256 amountDai, uint256 quotedExchangeRate) external returns (uint256 usdcReceived);	//inject NONSTANDARD NAMING
  function GETEXCHANGERATEANDEXPECTEDDAI566(uint256 usdc) external view returns (uint256 exchangeRate, uint256 exchangeRateUnderlying, uint256 dai);	//inject NONSTANDARD NAMING
  function GETEXCHANGERATEANDEXPECTEDUSDC319(uint256 dai) external view returns (uint256 exchangeRate, uint256 exchangeRateUnderlying, uint256 usdc);	//inject NONSTANDARD NAMING
}


library SafeMath {
  function MUL955(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) return 0;
    uint256 c = a * b;
    require(c / a == b, "SafeMath: multiplication overflow");
    return c;
  }

  function DIV117(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b > 0, "SafeMath: division by zero");
    return a / b;
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
contract TwoStepOwnable {
  event OWNERSHIPTRANSFERRED622(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );

  address private _owner;

  address private _newPotentialOwner;

                                                                                            
  constructor() internal {
    _owner = tx.origin;
    emit OWNERSHIPTRANSFERRED622(address(0), _owner);
  }

                                                                                                                          
  function TRANSFEROWNERSHIP821(address newOwner) external ONLYOWNER404 {	//inject NONSTANDARD NAMING
    require(
      newOwner != address(0),
      "TwoStepOwnable: new potential owner is the zero address."
    );

    _newPotentialOwner = newOwner;
  }

                                                                                                                    
  function CANCELOWNERSHIPTRANSFER742() external ONLYOWNER404 {	//inject NONSTANDARD NAMING
    delete _newPotentialOwner;
  }

                                                                                                                                                   
  function ACCEPTOWNERSHIP451() external {	//inject NONSTANDARD NAMING
    require(
      msg.sender == _newPotentialOwner,
      "TwoStepOwnable: current owner must set caller as new potential owner."
    );

    delete _newPotentialOwner;

    emit OWNERSHIPTRANSFERRED622(_owner, msg.sender);

    _owner = msg.sender;
  }

                                                               
  function OWNER646() external view returns (address) {	//inject NONSTANDARD NAMING
    return _owner;
  }

                                                                      
  function ISOWNER28() public view returns (bool) {	//inject NONSTANDARD NAMING
    return msg.sender == _owner;
  }

                                                                           
  modifier ONLYOWNER404() {	//inject NONSTANDARD NAMING
    require(ISOWNER28(), "TwoStepOwnable: caller is not the owner.");
    _;
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
contract DharmaReserveManagerV2 is DharmaReserveManagerV2Interface, TwoStepOwnable {
  using SafeMath for uint256;

  // Maintain a role status mapping with assigned accounts and paused states.
  mapping(uint256 => RoleStatus) private _roles;
  
  // Maintain a maximum allowable transfer size (in Dai) for the deposit manager.
  uint256 private _limit;

  // This contract interacts with USDC, Dai, and Dharma Dai.
  ERC20Interface internal constant _usdc666 = ERC20Interface(	//inject NONSTANDARD NAMING
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 // mainnet
  );

  ERC20Interface internal constant _dai122 = ERC20Interface(	//inject NONSTANDARD NAMING
    0x6B175474E89094C44Da98b954EedeAC495271d0F // mainnet
  );

  DTokenInterface internal constant _ddai493 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000001876eB1444c986fD502e618c587430
  );
  
  TradeHelperInterface internal constant _trade_helper407 = TradeHelperInterface(	//inject NONSTANDARD NAMING
    0xb5f23a203F02D2e595BBC96F5a499814CD8cA186
  );

  // The "Create2 Header" is used to compute smart wallet deployment addresses.
  bytes21 internal constant _create2_header531 = bytes21(	//inject NONSTANDARD NAMING
    0xfffc00c80b0000007f73004edb00094cad80626d8d // control character + factory
  );
  
  // The "Wallet creation code" header & footer are also used to derive wallets.
  bytes internal constant _wallet_creation_code_header493 = hex"60806040526040516104423803806104428339818101604052602081101561002657600080fd5b810190808051604051939291908464010000000082111561004657600080fd5b90830190602082018581111561005b57600080fd5b825164010000000081118282018810171561007557600080fd5b82525081516020918201929091019080838360005b838110156100a257818101518382015260200161008a565b50505050905090810190601f1680156100cf5780820380516001836020036101000a031916815260200191505b5060405250505060006100e661019e60201b60201c565b6001600160a01b0316826040518082805190602001908083835b6020831061011f5780518252601f199092019160209182019101610100565b6001836020036101000a038019825116818451168082178552505050505050905001915050600060405180830381855af49150503d806000811461017f576040519150601f19603f3d011682016040523d82523d6000602084013e610184565b606091505b5050905080610197573d6000803e3d6000fd5b50506102be565b60405160009081906060906e26750c571ce882b17016557279adaa9083818181855afa9150503d80600081146101f0576040519150601f19603f3d011682016040523d82523d6000602084013e6101f5565b606091505b509150915081819061029f576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825283818151815260200191508051906020019080838360005b8381101561026457818101518382015260200161024c565b50505050905090810190601f1680156102915780820380516001836020036101000a031916815260200191505b509250505060405180910390fd5b508080602001905160208110156102b557600080fd5b50519392505050565b610175806102cd6000396000f3fe608060405261001461000f610016565b61011c565b005b60405160009081906060906e26750c571ce882b17016557279adaa9083818181855afa9150503d8060008114610068576040519150601f19603f3d011682016040523d82523d6000602084013e61006d565b606091505b50915091508181906100fd5760405162461bcd60e51b81526004018080602001828103825283818151815260200191508051906020019080838360005b838110156100c25781810151838201526020016100aa565b50505050905090810190601f1680156100ef5780820380516001836020036101000a031916815260200191505b509250505060405180910390fd5b5080806020019051602081101561011357600080fd5b50519392505050565b3660008037600080366000845af43d6000803e80801561013b573d6000f35b3d6000fdfea265627a7a7231582020202020202055706772616465426561636f6e50726f7879563120202020202064736f6c634300050b003200000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000024c4d66de8000000000000000000000000";	//inject NONSTANDARD NAMING
  bytes28 internal constant _wallet_creation_code_footer991 = bytes28(	//inject NONSTANDARD NAMING
    0x00000000000000000000000000000000000000000000000000000000
  );

                                                                                                                                                                                       
  constructor() public {
    // Call Dai to set an allowance for Dharma Dai in order to mint dDai.
    require(_dai122.APPROVE251(address(_ddai493), uint256(-1)));
    
    // Call USDC to set an allowance for the trade helper contract.
    require(_usdc666.APPROVE251(address(_trade_helper407), uint256(-1)));
  
    // Call dDai to set an allowance for the trade helper contract.
    require(_ddai493.APPROVE251(address(_trade_helper407), uint256(-1)));  
    
    // Set the initial limit to 300 Dai.
    _limit = 300 * 1e18;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function FINALIZEDAIDEPOSIT227(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 daiAmount
  ) external ONLYOWNEROR854(Role.DEPOSIT_MANAGER) {
    // Ensure that the recipient is indeed a smart wallet.
    require(
      _ISSMARTWALLET122(smartWallet, initialUserSigningKey),
      "Could not resolve smart wallet using provided signing key."
    );
    
    // Ensure that the amount to transfer is lower than the limit.
    require(daiAmount < _limit, "Transfer size exceeds the limit.");
    
    // Transfer the Dai to the specified smart wallet.
    require(_dai122.TRANSFER761(smartWallet, daiAmount), "Dai transfer failed.");
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function FINALIZEDHARMADAIDEPOSIT294(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 dDaiAmount
  ) external ONLYOWNEROR854(Role.DEPOSIT_MANAGER) {
    // Ensure that the recipient is indeed a smart wallet.
    require(
      _ISSMARTWALLET122(smartWallet, initialUserSigningKey),
      "Could not resolve smart wallet using provided signing key."
    );
    
    // Get the current dDai exchange rate.
    uint256 exchangeRate = _ddai493.EXCHANGERATECURRENT315();

    // Ensure that an exchange rate was actually returned.
    require(exchangeRate != 0, "Could not retrieve dDai exchange rate.");
    
    // Get the equivalent Dai amount of the transfer.
    uint256 daiEquivalent = (dDaiAmount.MUL955(exchangeRate)) / 1e18;
    
    // Ensure that the amount to transfer is lower than the limit.
    require(daiEquivalent < _limit, "Transfer size exceeds the limit.");

    // Transfer the dDai to the specified smart wallet.
    require(_ddai493.TRANSFER761(smartWallet, dDaiAmount), "dDai transfer failed.");
  }

                                                                                                                                                                                                                                                                               
  function MINT463(	//inject NONSTANDARD NAMING
    uint256 daiAmount
  ) external ONLYOWNEROR854(Role.ADJUSTER) returns (uint256 dDaiMinted) {
    // Use the specified amount of Dai to mint dDai.
    dDaiMinted = _ddai493.MINT463(daiAmount);
  }

                                                                                                                                                                                                                                                                                     
  function REDEEM710(	//inject NONSTANDARD NAMING
    uint256 dDaiAmount
  ) external ONLYOWNEROR854(Role.ADJUSTER) returns (uint256 daiReceived) {
    // Redeem the specified amount of dDai for Dai.
    daiReceived = _ddai493.REDEEM710(dDaiAmount);
  }
  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function TRADEUSDCFORDDAI71(	//inject NONSTANDARD NAMING
    uint256 usdcAmount,
    uint256 quotedUSDCToDaiExchangeRate
  ) external ONLYOWNEROR854(Role.ADJUSTER) returns (uint256 dDaiMinted) {
    dDaiMinted = _trade_helper407.TRADEUSDCFORDDAI71(
       usdcAmount, quotedUSDCToDaiExchangeRate
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function TRADEDDAIFORUSDC902(	//inject NONSTANDARD NAMING
    uint256 daiEquivalentAmount,
    uint256 quotedDaiToUSDCExchangeRate
  ) external ONLYOWNEROR854(Role.ADJUSTER) returns (uint256 usdcReceived) {
    usdcReceived = _trade_helper407.TRADEDDAIFORUSDC902(
       daiEquivalentAmount, quotedDaiToUSDCExchangeRate
    );
  }

                                                                                                                                                                                                                                             
  function WITHDRAWUSDC319(	//inject NONSTANDARD NAMING
    address recipient, uint256 usdcAmount
  ) external ONLYOWNER404 {
    // Transfer the USDC to the specified recipient.
    require(_usdc666.TRANSFER761(recipient, usdcAmount), "USDC transfer failed.");
  }

                                                                                                                                                                                                                                        
  function WITHDRAWDAI918(	//inject NONSTANDARD NAMING
    address recipient, uint256 daiAmount
  ) external ONLYOWNER404 {
    // Transfer the Dai to the specified recipient.
    require(_dai122.TRANSFER761(recipient, daiAmount), "Dai transfer failed.");
  }

                                                                                                                                                                                                                                                               
  function WITHDRAWDHARMADAI949(	//inject NONSTANDARD NAMING
    address recipient, uint256 dDaiAmount
  ) external ONLYOWNER404 {
    // Transfer the dDai to the specified recipient.
    require(_ddai493.TRANSFER761(recipient, dDaiAmount), "dDai transfer failed.");
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function WITHDRAW172(	//inject NONSTANDARD NAMING
    ERC20Interface token, address recipient, uint256 amount
  ) external ONLYOWNER404 returns (bool success) {
    // Transfer the token to the specified recipient.
    success = token.TRANSFER761(recipient, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function CALL948(	//inject NONSTANDARD NAMING
    address payable target, uint256 amount, bytes calldata data
  ) external ONLYOWNER404 returns (bool ok, bytes memory returnData) {
    // Call the specified target and supply the specified data.
    (ok, returnData) = target.call.value(amount)(data);
  }

                                                                                                                                                                                                                       
  function SETLIMIT231(uint256 daiAmount) external ONLYOWNER404 {	//inject NONSTANDARD NAMING
    // Set the new limit.
    _limit = daiAmount;
  }

                                                                                                                                                                                                                                                                                                                                                        
  function PAUSE9(Role role) external ONLYOWNEROR854(Role.PAUSER) {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];
    require(!storedRoleStatus.paused, "Role in question is already paused.");
    storedRoleStatus.paused = true;
    emit ROLEPAUSED79(role);
  }

                                                                                                                                                                                                                                                     
  function UNPAUSE775(Role role) external ONLYOWNER404 {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];
    require(storedRoleStatus.paused, "Role in question is already unpaused.");
    storedRoleStatus.paused = false;
    emit ROLEUNPAUSED847(role);
  }

                                                                                                                                                                                                                                                                                                                                                                                    
  function SETROLE953(Role role, address account) external ONLYOWNER404 {	//inject NONSTANDARD NAMING
    require(account != address(0), "Must supply an account.");
    _SETROLE842(role, account);
  }

                                                                                                                                                                                                                                                                                                                                           
  function REMOVEROLE946(Role role) external ONLYOWNER404 {	//inject NONSTANDARD NAMING
    _SETROLE842(role, address(0));
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function ISPAUSED167(Role role) external view returns (bool paused) {	//inject NONSTANDARD NAMING
    paused = _ISPAUSED751(role);
  }

                                                                                                                                                                                                                                                                                                        
  function ISROLE873(Role role) external view returns (bool hasRole) {	//inject NONSTANDARD NAMING
    hasRole = _ISROLE125(role);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function ISDHARMASMARTWALLET454(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) external view returns (bool dharmaSmartWallet) {
    dharmaSmartWallet = _ISSMARTWALLET122(smartWallet, initialUserSigningKey);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function GETDEPOSITMANAGER528() external view returns (address depositManager) {	//inject NONSTANDARD NAMING
    depositManager = _roles[uint256(Role.DEPOSIT_MANAGER)].account;
  }

                                                                                                                                                                                                                                                                                                                
  function GETADJUSTER751() external view returns (address adjuster) {	//inject NONSTANDARD NAMING
    adjuster = _roles[uint256(Role.ADJUSTER)].account;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function GETPAUSER177() external view returns (address pauser) {	//inject NONSTANDARD NAMING
    pauser = _roles[uint256(Role.PAUSER)].account;
  }

                                                                                                                                                                                                                                                   
  function GETRESERVES460() external view returns (	//inject NONSTANDARD NAMING
    uint256 dai, uint256 dDai, uint256 dDaiUnderlying
  ) {
    dai = _dai122.BALANCEOF313(address(this));
    dDai = _ddai493.BALANCEOF313(address(this));
    dDaiUnderlying = _ddai493.BALANCEOFUNDERLYING558(address(this));
  }

                                                                                                                                                                                                                                                                                 
  function GETLIMIT30() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 dDaiAmount
  ) {
    daiAmount = _limit;
    dDaiAmount = (daiAmount.MUL955(1e18)).DIV117(_ddai493.EXCHANGERATECURRENT315());   
  }

                                                                                                                                                                                                                                                                                                                                                                  
  function _SETROLE842(Role role, address account) internal {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];

    if (account != storedRoleStatus.account) {
      storedRoleStatus.account = account;
      emit ROLEMODIFIED846(role, account);
    }
  }

                                                                                                                                                                                                                                                                                                        
  function _ISROLE125(Role role) internal view returns (bool hasRole) {	//inject NONSTANDARD NAMING
    hasRole = msg.sender == _roles[uint256(role)].account;
  }

                                                                                                                                                                                                                                                                                                    
  function _ISPAUSED751(Role role) internal view returns (bool paused) {	//inject NONSTANDARD NAMING
    paused = _roles[uint256(role)].paused;
  }

                                                                                                                                                                                                                                                                                                                                   
  function _ISSMARTWALLET122(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) internal pure returns (bool) {
    // Derive the keccak256 hash of the smart wallet initialization code.
    bytes32 initCodeHash = keccak256(
      abi.encodePacked(
        _wallet_creation_code_header493,
        initialUserSigningKey,
        _wallet_creation_code_footer991
      )
    );

    // Attempt to derive a smart wallet address that matches the one provided.
    address target;
    for (uint256 nonce = 0; nonce < 10; nonce++) {
      target = address(          // derive the target deployment address.
        uint160(                 // downcast to match the address type.
          uint256(               // cast to uint to truncate upper digits.
            keccak256(           // compute CREATE2 hash using all inputs.
              abi.encodePacked(  // pack all inputs to the hash together.
                _create2_header531, // pass in control character + factory address.
                nonce,           // pass in current nonce as the salt.
                initCodeHash     // pass in hash of contract creation code.
              )
            )
          )
        )
      );

      // Exit early if the provided smart wallet matches derived target address.
      if (target == smartWallet) {
        return true;
      }

      // Otherwise, increment the nonce and derive a new salt.
      nonce++;
    }

    // Explicity recognize no target was found matching provided smart wallet.
    return false;
  }

                                                                                                                                                                                                                                                                                                                                                  
  modifier ONLYOWNEROR854(Role role) {	//inject NONSTANDARD NAMING
    if (!ISOWNER28()) {
      require(_ISROLE125(role), "Caller does not have a required role.");
      require(!_ISPAUSED751(role), "Role in question is currently paused.");
    }
    _;
  }
}