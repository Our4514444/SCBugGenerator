                                                                 

pragma solidity 0.5.17; // optimization runs: 200, evm version: istanbul


interface DharmaTradeReserveV7Interface {
  event ROLEMODIFIED713(Role indexed role, address account);	//inject NONSTANDARD NAMING
  event ROLEPAUSED658(Role indexed role);	//inject NONSTANDARD NAMING
  event ROLEUNPAUSED884(Role indexed role);	//inject NONSTANDARD NAMING
  
  event ETHERRECEIVED45(address sender, uint256 amount);	//inject NONSTANDARD NAMING

  enum Role {           // #
    DEPOSIT_MANAGER,    // 0
    ADJUSTER,           // 1
    WITHDRAWAL_MANAGER, // 2
    RESERVE_TRADER,     // 3
    PAUSER              // 4
  }

  struct RoleStatus {
    address account;
    bool paused;
  }

  function TRADEDAIFORETHER788(	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalDaiSold);

  function TRADEETHERFORDAI108(	//inject NONSTANDARD NAMING
    uint256 quotedDaiAmount, uint256 deadline
  ) external payable returns (uint256 totalDaiBought);

  function TRADEDAIFORTOKEN19(	//inject NONSTANDARD NAMING
    address token, uint256 daiAmount, uint256 quotedTokenAmount, uint256 deadline, bool routeThroughEther
  ) external returns (uint256 totalDaiSold);

  function TRADETOKENFORDAI434(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmount, uint256 quotedDaiAmount, uint256 deadline, bool routeThroughEther
  ) external returns (uint256 totalDaiBought);

  function TRADETOKENFORETHER398(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmount, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalEtherBought);

  function TRADEETHERFORTOKEN580(	//inject NONSTANDARD NAMING
    address token, uint256 quotedTokenAmount, uint256 deadline
  ) external payable returns (uint256 totalEtherSold);

  function TRADEETHERFORTOKENUSINGETHERIZER524(	//inject NONSTANDARD NAMING
    address token, uint256 etherAmount, uint256 quotedTokenAmount, uint256 deadline
  ) external returns (uint256 totalEtherSold);

  function TRADEDAIFORETHERUSINGRESERVES700(	//inject NONSTANDARD NAMING
    uint256 daiAmountFromReserves, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalDaiSold);

  function TRADEETHERFORDAIUSINGRESERVESANDMINTDDAI4(	//inject NONSTANDARD NAMING
    uint256 etherAmountFromReserves, uint256 quotedDaiAmount, uint256 deadline
  ) external returns (uint256 totalDaiBought, uint256 totalDDaiMinted);

  function TRADEDAIFORTOKENUSINGRESERVES451(	//inject NONSTANDARD NAMING
    address token, uint256 daiAmountFromReserves, uint256 quotedTokenAmount, uint256 deadline, bool routeThroughEther
  ) external returns (uint256 totalDaiSold);

  function TRADETOKENFORDAIUSINGRESERVESANDMINTDDAI605(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmountFromReserves, uint256 quotedDaiAmount, uint256 deadline, bool routeThroughEther
  ) external returns (uint256 totalDaiBought, uint256 totalDDaiMinted);

  function TRADETOKENFORETHERUSINGRESERVES668(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmountFromReserves, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalEtherBought);

  function TRADEETHERFORTOKENUSINGRESERVES186(	//inject NONSTANDARD NAMING
    address token, uint256 etherAmountFromReserves, uint256 quotedTokenAmount, uint256 deadline
  ) external returns (uint256 totalEtherSold);

  function FINALIZEETHERDEPOSIT619(	//inject NONSTANDARD NAMING
    address payable smartWallet,
    address initialUserSigningKey,
    uint256 etherAmount
  ) external;

  function FINALIZEDAIDEPOSIT141(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 daiAmount
  ) external;

  function FINALIZEDHARMADAIDEPOSIT255(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 dDaiAmount
  ) external;

  function MINT94(uint256 daiAmount) external returns (uint256 dDaiMinted);	//inject NONSTANDARD NAMING

  function REDEEM804(uint256 dDaiAmount) external returns (uint256 daiReceived);	//inject NONSTANDARD NAMING

  function TRADEDDAIFORUSDC118(	//inject NONSTANDARD NAMING
    uint256 daiEquivalentAmount, uint256 quotedUSDCAmount
  ) external returns (uint256 usdcReceived);

  function TRADEUSDCFORDDAI492(	//inject NONSTANDARD NAMING
    uint256 usdcAmount, uint256 quotedDaiEquivalentAmount
  ) external returns (uint256 dDaiMinted);

  function WITHDRAWUSDC925(address recipient, uint256 usdcAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWDAI59(address recipient, uint256 daiAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWDHARMADAI554(address recipient, uint256 dDaiAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWUSDCTOPRIMARYRECIPIENT625(uint256 usdcAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWDAITOPRIMARYRECIPIENT76(uint256 usdcAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWETHER510(	//inject NONSTANDARD NAMING
    address payable recipient, uint256 etherAmount
  ) external;

  function WITHDRAW489(	//inject NONSTANDARD NAMING
    ERC20Interface token, address recipient, uint256 amount
  ) external returns (bool success);

  function CALLANY171(	//inject NONSTANDARD NAMING
    address payable target, uint256 amount, bytes calldata data
  ) external returns (bool ok, bytes memory returnData);

  function SETDAILIMIT911(uint256 daiAmount) external;	//inject NONSTANDARD NAMING

  function SETETHERLIMIT312(uint256 daiAmount) external;	//inject NONSTANDARD NAMING

  function SETPRIMARYUSDCRECIPIENT953(address recipient) external;	//inject NONSTANDARD NAMING

  function SETPRIMARYDAIRECIPIENT290(address recipient) external;	//inject NONSTANDARD NAMING

  function SETROLE429(Role role, address account) external;	//inject NONSTANDARD NAMING

  function REMOVEROLE760(Role role) external;	//inject NONSTANDARD NAMING

  function PAUSE405(Role role) external;	//inject NONSTANDARD NAMING

  function UNPAUSE354(Role role) external;	//inject NONSTANDARD NAMING

  function ISPAUSED490(Role role) external view returns (bool paused);	//inject NONSTANDARD NAMING

  function ISROLE620(Role role) external view returns (bool hasRole);	//inject NONSTANDARD NAMING

  function ISDHARMASMARTWALLET522(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) external view returns (bool dharmaSmartWallet);

  function GETDEPOSITMANAGER751() external view returns (address depositManager);	//inject NONSTANDARD NAMING

  function GETADJUSTER321() external view returns (address adjuster);	//inject NONSTANDARD NAMING

  function GETRESERVETRADER542() external view returns (address reserveTrader);	//inject NONSTANDARD NAMING

  function GETWITHDRAWALMANAGER608() external view returns (address withdrawalManager);	//inject NONSTANDARD NAMING

  function GETPAUSER344() external view returns (address pauser);	//inject NONSTANDARD NAMING

  function GETRESERVES293() external view returns (	//inject NONSTANDARD NAMING
    uint256 dai, uint256 dDai, uint256 dDaiUnderlying
  );

  function GETDAILIMIT732() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 dDaiAmount
  );

  function GETETHERLIMIT244() external view returns (uint256 etherAmount);	//inject NONSTANDARD NAMING

  function GETPRIMARYUSDCRECIPIENT541() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  );

  function GETPRIMARYDAIRECIPIENT404() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  );

  function GETIMPLEMENTATION446() external view returns (address implementation);	//inject NONSTANDARD NAMING

  function GETVERSION688() external view returns (uint256 version);	//inject NONSTANDARD NAMING
}


interface ERC20Interface {
  function BALANCEOF728(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function APPROVE348(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function ALLOWANCE991(address, address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER941(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM349(address, address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
}


interface DTokenInterface {
  function MINT94(uint256 underlyingToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING
  function REDEEM804(uint256 dTokensToBurn) external returns (uint256 underlyingReceived);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYING930(uint256 underlyingToReceive) external returns (uint256 dTokensBurned);	//inject NONSTANDARD NAMING
  function BALANCEOF728(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOFUNDERLYING632(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER941(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE348(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function EXCHANGERATECURRENT869() external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface TradeHelperInterface {
  function TRADEUSDCFORDDAI492(uint256 amountUSDC, uint256 quotedDaiEquivalentAmount) external returns (uint256 dDaiMinted);	//inject NONSTANDARD NAMING
  function TRADEDDAIFORUSDC118(uint256 amountDai, uint256 quotedUSDCAmount) external returns (uint256 usdcReceived);	//inject NONSTANDARD NAMING
  function GETEXPECTEDDAI806(uint256 usdc) external view returns (uint256 dai);	//inject NONSTANDARD NAMING
  function GETEXPECTEDUSDC333(uint256 dai) external view returns (uint256 usdc);	//inject NONSTANDARD NAMING
}


interface UniswapV1Interface {
  function ETHTOTOKENSWAPINPUT826(	//inject NONSTANDARD NAMING
    uint256 minTokens, uint256 deadline
  ) external payable returns (uint256 tokensBought);

  function TOKENTOETHTRANSFEROUTPUT484(	//inject NONSTANDARD NAMING
    uint256 ethBought, uint256 maxTokens, uint256 deadline, address recipient
  ) external returns (uint256 tokensSold);
}


interface UniswapV2Interface {
  function SWAPTOKENSFOREXACTTOKENS459(	//inject NONSTANDARD NAMING
    uint256 amountOut,
    uint256 amountInMax,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);

  function SWAPEXACTTOKENSFORTOKENS718(	//inject NONSTANDARD NAMING
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);
  
  function SWAPEXACTTOKENSFORETH666(	//inject NONSTANDARD NAMING
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);
  
  function SWAPETHFOREXACTTOKENS846(	//inject NONSTANDARD NAMING
    uint256 amountOut,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external payable returns (uint256[] memory amounts);
}


interface EtherReceiverInterface {
  function SETTLEETHER105() external;	//inject NONSTANDARD NAMING
}


library SafeMath {
  function ADD644(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    c = a + b;
    require(c >= a, "SafeMath: addition overflow");
    return c;
  }

  function MUL186(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) return 0;
    uint256 c = a * b;
    require(c / a == b, "SafeMath: multiplication overflow");
    return c;
  }

  function DIV494(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b > 0, "SafeMath: division by zero");
    return a / b;
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
contract TwoStepOwnable {
  event OWNERSHIPTRANSFERRED999(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );

  address private _owner;

  address private _newPotentialOwner;

                                                                                                                          
  function TRANSFEROWNERSHIP621(address newOwner) external ONLYOWNER880 {	//inject NONSTANDARD NAMING
    require(
      newOwner != address(0),
      "TwoStepOwnable: new potential owner is the zero address."
    );

    _newPotentialOwner = newOwner;
  }

                                                                                                                    
  function CANCELOWNERSHIPTRANSFER374() external ONLYOWNER880 {	//inject NONSTANDARD NAMING
    delete _newPotentialOwner;
  }

                                                                                                                                                   
  function ACCEPTOWNERSHIP549() external {	//inject NONSTANDARD NAMING
    require(
      msg.sender == _newPotentialOwner,
      "TwoStepOwnable: current owner must set caller as new potential owner."
    );

    delete _newPotentialOwner;

    emit OWNERSHIPTRANSFERRED999(_owner, msg.sender);

    _owner = msg.sender;
  }

                                                               
  function OWNER419() external view returns (address) {	//inject NONSTANDARD NAMING
    return _owner;
  }

                                                                      
  function ISOWNER322() public view returns (bool) {	//inject NONSTANDARD NAMING
    return msg.sender == _owner;
  }

                                                                           
  modifier ONLYOWNER880() {	//inject NONSTANDARD NAMING
    require(ISOWNER322(), "TwoStepOwnable: caller is not the owner.");
    _;
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
contract DharmaTradeReserveV7Implementation is DharmaTradeReserveV7Interface, TwoStepOwnable {
  using SafeMath for uint256;

  // Maintain a role status mapping with assigned accounts and paused states.
  mapping(uint256 => RoleStatus) private _roles;

  // Maintain a "primary recipient" the withdrawal manager can transfer Dai to.
  address private _primaryDaiRecipient;

  // Maintain a "primary recipient" the withdrawal manager can transfer USDC to.
  address private _primaryUSDCRecipient;

  // Maintain a maximum allowable transfer size (in Dai) for the deposit manager.
  uint256 private _daiLimit;

  // Maintain a maximum allowable transfer size (in Ether) for the deposit manager.
  uint256 private _etherLimit;

  bool private _originatesFromReserveTrader; // unused, don't change storage layout

  uint256 private constant _version984 = 6;	//inject NONSTANDARD NAMING

  // This contract interacts with USDC, Dai, and Dharma Dai.
  ERC20Interface internal constant _usdc437 = ERC20Interface(	//inject NONSTANDARD NAMING
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 // mainnet
  );

  ERC20Interface internal constant _dai511 = ERC20Interface(	//inject NONSTANDARD NAMING
    0x6B175474E89094C44Da98b954EedeAC495271d0F // mainnet
  );
  
  ERC20Interface internal constant _etherizer390 = ERC20Interface(	//inject NONSTANDARD NAMING
    0x723B51b72Ae89A3d0c2a2760f0458307a1Baa191
  );

  DTokenInterface internal constant _ddai74 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000001876eB1444c986fD502e618c587430
  );

  TradeHelperInterface internal constant _trade_helper873 = TradeHelperInterface(	//inject NONSTANDARD NAMING
    0x9328F2Fb3e85A4d24Adc2f68F82737183e85691d
  );

  UniswapV1Interface internal constant _uniswap_dai449 = UniswapV1Interface(	//inject NONSTANDARD NAMING
    0x2a1530C4C41db0B0b2bB646CB5Eb1A67b7158667
  );
  
  UniswapV2Interface internal constant _uniswap_router789 = UniswapV2Interface(	//inject NONSTANDARD NAMING
    0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
  );
  
  EtherReceiverInterface internal constant _eth_receiver318 = EtherReceiverInterface(	//inject NONSTANDARD NAMING
    0x0EBE1a9CBF4e27D507A5f1b51CC308B727D956C6
  );
  
  address internal constant _weth837 = address(	//inject NONSTANDARD NAMING
    0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
  );

  // The "Create2 Header" is used to compute smart wallet deployment addresses.
  bytes21 internal constant _create2_header748 = bytes21(	//inject NONSTANDARD NAMING
    0xfffc00c80b0000007f73004edb00094cad80626d8d // control character + factory
  );

  // The "Wallet creation code" header & footer are also used to derive wallets.
  bytes internal constant _wallet_creation_code_header141 = hex"60806040526040516104423803806104428339818101604052602081101561002657600080fd5b810190808051604051939291908464010000000082111561004657600080fd5b90830190602082018581111561005b57600080fd5b825164010000000081118282018810171561007557600080fd5b82525081516020918201929091019080838360005b838110156100a257818101518382015260200161008a565b50505050905090810190601f1680156100cf5780820380516001836020036101000a031916815260200191505b5060405250505060006100e661019e60201b60201c565b6001600160a01b0316826040518082805190602001908083835b6020831061011f5780518252601f199092019160209182019101610100565b6001836020036101000a038019825116818451168082178552505050505050905001915050600060405180830381855af49150503d806000811461017f576040519150601f19603f3d011682016040523d82523d6000602084013e610184565b606091505b5050905080610197573d6000803e3d6000fd5b50506102be565b60405160009081906060906e26750c571ce882b17016557279adaa9083818181855afa9150503d80600081146101f0576040519150601f19603f3d011682016040523d82523d6000602084013e6101f5565b606091505b509150915081819061029f576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825283818151815260200191508051906020019080838360005b8381101561026457818101518382015260200161024c565b50505050905090810190601f1680156102915780820380516001836020036101000a031916815260200191505b509250505060405180910390fd5b508080602001905160208110156102b557600080fd5b50519392505050565b610175806102cd6000396000f3fe608060405261001461000f610016565b61011c565b005b60405160009081906060906e26750c571ce882b17016557279adaa9083818181855afa9150503d8060008114610068576040519150601f19603f3d011682016040523d82523d6000602084013e61006d565b606091505b50915091508181906100fd5760405162461bcd60e51b81526004018080602001828103825283818151815260200191508051906020019080838360005b838110156100c25781810151838201526020016100aa565b50505050905090810190601f1680156100ef5780820380516001836020036101000a031916815260200191505b509250505060405180910390fd5b5080806020019051602081101561011357600080fd5b50519392505050565b3660008037600080366000845af43d6000803e80801561013b573d6000f35b3d6000fdfea265627a7a7231582020202020202055706772616465426561636f6e50726f7879563120202020202064736f6c634300050b003200000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000024c4d66de8000000000000000000000000";	//inject NONSTANDARD NAMING
  bytes28 internal constant _wallet_creation_code_footer376 = bytes28(	//inject NONSTANDARD NAMING
    0x00000000000000000000000000000000000000000000000000000000
  );


  // Include a payable fallback so that the contract can receive Ether payments.
  function () external payable {
    emit ETHERRECEIVED45(msg.sender, msg.value);
  }

  function INITIALIZE338() external {	//inject NONSTANDARD NAMING
    // Approve Uniswap router to transfer Dai on behalf of this contract.
    if (_dai511.ALLOWANCE991(address(this), address(_uniswap_router789)) != uint256(-1)) {
      bool ok = _dai511.APPROVE348(address(_uniswap_router789), uint256(-1));
      require(ok, "Dai approval for Uniswap router failed.");
    }    
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function TRADEDAIFORETHER788(	//inject NONSTANDARD NAMING
    uint256 daiAmount,
    uint256 quotedEtherAmount,
    uint256 deadline
  ) external returns (uint256 totalDaiSold) {
    // Transfer the Dai from the caller and revert on failure.
    bool ok = (_dai511.TRANSFERFROM349(msg.sender, address(this), daiAmount));
    require(ok, "Dai transfer in failed.");

    // Trade the Dai for the quoted Ether amount on Uniswap and send to caller.
    totalDaiSold = _uniswap_dai449.TOKENTOETHTRANSFEROUTPUT484(
      quotedEtherAmount, daiAmount, deadline, msg.sender
    );
  }

  function TRADETOKENFORETHER398(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmount, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalEtherBought) {
    // Transfer the tokens from the caller and revert on failure.
    bool ok = (token.TRANSFERFROM349(msg.sender, address(this), tokenAmount));
    require(ok, "Token transfer in failed.");
    
    // Approve Uniswap router to transfer tokens on behalf of this contract.
    _GRANTUNISWAPROUTERAPPROVALIFNECESSARY818(token);

    // Establish path from target token to Ether.
    address[] memory path = new address[](2);
    path[0] = address(token);
    path[1] = _weth837;

    // Trade tokens for quoted Ether amount on Uniswap (send to this contract).
    uint256[] memory amounts = new uint256[](2);
    amounts = _uniswap_router789.SWAPEXACTTOKENSFORETH666(
      tokenAmount, quotedEtherAmount, path, address(this), deadline
    );
    totalEtherBought = amounts[1];
    
    // Send quoted Ether amount to caller and revert with reason on failure.
    (ok, ) = msg.sender.call.value(quotedEtherAmount)("");
    if (!ok) {
      assembly {
        returndatacopy(0, 0, returndatasize)
        revert(0, returndatasize)
      }
    }
  }

  function TRADEDAIFORTOKEN19(	//inject NONSTANDARD NAMING
    address token, uint256 daiAmount, uint256 quotedTokenAmount, uint256 deadline, bool routeThroughEther
  ) external returns (uint256 totalDaiSold) {
    // Transfer the Dai from the caller and revert on failure.
    bool ok = (_dai511.TRANSFERFROM349(msg.sender, address(this), daiAmount));
    require(ok, "Dai transfer in failed.");
    
    // Establish path (direct or routed through Ether) from Dai to target token.
    uint256 pathLength = routeThroughEther ? 3 : 2;
    address[] memory path = new address[](pathLength);
    path[0] = address(_dai511);
    
    if (routeThroughEther) {
      path[1] = _weth837;
    }
    
    path[pathLength - 1] = token;
    
    // Trade the Dai for the quoted token amount on Uniswap and send to caller.
    uint256[] memory amounts = new uint256[](pathLength);
    amounts = _uniswap_router789.SWAPTOKENSFOREXACTTOKENS459(
      quotedTokenAmount, daiAmount, path, msg.sender, deadline
    );
    
    totalDaiSold = amounts[0];
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function TRADEDAIFORETHERUSINGRESERVES700(	//inject NONSTANDARD NAMING
    uint256 daiAmountFromReserves, uint256 quotedEtherAmount, uint256 deadline
  ) external ONLYOWNEROR451(Role.RESERVE_TRADER) returns (uint256 totalDaiSold) {
    // Redeem dDai if the current Dai balance is less than is required.
    uint256 daiBalance = _dai511.BALANCEOF728(address(this));
    if (daiBalance < daiAmountFromReserves) {
      uint256 additionalDaiRequired = daiAmountFromReserves - daiBalance;
      _ddai74.REDEEMUNDERLYING930(additionalDaiRequired);
    }

    // Trade the Dai for the quoted Ether amount on Uniswap.
    totalDaiSold = _uniswap_dai449.TOKENTOETHTRANSFEROUTPUT484(
      quotedEtherAmount,
      daiAmountFromReserves,
      deadline,
      address(_eth_receiver318)
    );
    
    // Move the Ether from the receiver to this contract (gas workaround).
    _eth_receiver318.SETTLEETHER105();
  }

  function TRADETOKENFORETHERUSINGRESERVES668(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmountFromReserves, uint256 quotedEtherAmount, uint256 deadline
  ) external ONLYOWNEROR451(Role.RESERVE_TRADER) returns (uint256 totalEtherBought) {
    // Approve Uniswap router to transfer tokens on behalf of this contract.
    _GRANTUNISWAPROUTERAPPROVALIFNECESSARY818(token);

    // Establish path from target token to Ether.
    address[] memory path = new address[](2);
    path[0] = address(token);
    path[1] = _weth837;

    // Trade tokens for quoted Ether amount on Uniswap (send to this contract).
    uint256[] memory amounts = new uint256[](2);
    amounts = _uniswap_router789.SWAPEXACTTOKENSFORETH666(
      tokenAmountFromReserves, quotedEtherAmount, path, address(this), deadline
    );
    totalEtherBought = amounts[1];
  }

                                                                                                                                                                                                                                                                                                                                                                       
  function TRADEETHERFORDAI108(	//inject NONSTANDARD NAMING
    uint256 quotedDaiAmount,
    uint256 deadline
  ) external payable returns (uint256 totalDaiBought) {
    // Trade the Ether for the quoted Dai amount on Uniswap.
    totalDaiBought = _uniswap_dai449.ETHTOTOKENSWAPINPUT826.value(msg.value)(
      quotedDaiAmount, deadline
    );

    // Transfer the Dai to the caller and revert on failure.
    bool ok = (_dai511.TRANSFER941(msg.sender, quotedDaiAmount));
    require(ok, "Dai transfer out failed.");
  }

  function TRADEETHERFORTOKEN580(	//inject NONSTANDARD NAMING
    address token, uint256 quotedTokenAmount, uint256 deadline
  ) external payable returns (uint256 totalEtherSold) {
    // Establish path from Ether to target token.
    address[] memory path = new address[](2);
    path[0] = _weth837;
    path[1] = address(token);
      
    // Trade Ether for quoted token amount on Uniswap and send to caller.
    uint256[] memory amounts = new uint256[](2);
    amounts = _uniswap_router789.SWAPETHFOREXACTTOKENS846.value(msg.value)(
      quotedTokenAmount, path, msg.sender, deadline
    );
    totalEtherSold = amounts[0];
  }

  function TRADEETHERFORTOKENUSINGETHERIZER524(	//inject NONSTANDARD NAMING
    address token, uint256 etherAmount, uint256 quotedTokenAmount, uint256 deadline
  ) external returns (uint256 totalEtherSold) {
    // Transfer the Ether from the caller and revert on failure.
    bool ok = (_etherizer390.TRANSFERFROM349(msg.sender, address(this), etherAmount));
    require(ok, "Ether transfer in failed.");
      
    // Establish path from Ether to target token.
    address[] memory path = new address[](2);
    path[0] = _weth837;
    path[1] = address(token);
      
    // Trade Ether for quoted token amount on Uniswap and send to caller.
    uint256[] memory amounts = new uint256[](2);
    amounts = _uniswap_router789.SWAPETHFOREXACTTOKENS846.value(etherAmount)(
      quotedTokenAmount, path, msg.sender, deadline
    );
    totalEtherSold = amounts[0];
  }
 
  function TRADETOKENFORDAI434(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmount, uint256 quotedDaiAmount, uint256 deadline, bool routeThroughEther
  ) external returns (uint256 totalDaiBought) {
    // Transfer the token from the caller and revert on failure.
    bool ok = (token.TRANSFERFROM349(msg.sender, address(this), tokenAmount));
    require(ok, "Token transfer in failed.");
    
    // Approve Uniswap router to transfer tokens on behalf of this contract.
    _GRANTUNISWAPROUTERAPPROVALIFNECESSARY818(token);
    
    // Establish path (direct or routed through Ether) from target token to Dai.
    uint256 pathLength = routeThroughEther ? 3 : 2;
    address[] memory path = new address[](pathLength);
    path[0] = address(token);
    
    if (routeThroughEther) {
      path[1] = _weth837;
    }

    path[pathLength - 1] = address(_dai511);
    
    // Trade the Dai for the quoted token amount on Uniswap and send to caller.
    uint256[] memory amounts = new uint256[](pathLength);
    amounts = _uniswap_router789.SWAPEXACTTOKENSFORTOKENS718(
      tokenAmount, quotedDaiAmount, path, msg.sender, deadline
    );
    
    totalDaiBought = amounts[pathLength - 1];
    
    // Transfer the Dai to the caller and revert on failure.
    ok = (_dai511.TRANSFER941(msg.sender, quotedDaiAmount));
    require(ok, "Dai transfer out failed.");
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function TRADEETHERFORDAIUSINGRESERVESANDMINTDDAI4(	//inject NONSTANDARD NAMING
    uint256 etherAmountFromReserves, uint256 quotedDaiAmount, uint256 deadline
  ) external ONLYOWNEROR451(Role.RESERVE_TRADER) returns (
    uint256 totalDaiBought, uint256 totalDDaiMinted
  ) {
    // Trade the Ether for the quoted Dai amount on Uniswap.
    totalDaiBought = _uniswap_dai449.ETHTOTOKENSWAPINPUT826.value(
      etherAmountFromReserves
    )(
      quotedDaiAmount, deadline
    );

    // Mint dDai using the received Dai.
    totalDDaiMinted = _ddai74.MINT94(totalDaiBought);
  }

  function TRADEETHERFORTOKENUSINGRESERVES186(	//inject NONSTANDARD NAMING
    address token, uint256 etherAmountFromReserves, uint256 quotedTokenAmount, uint256 deadline
  ) external ONLYOWNEROR451(Role.RESERVE_TRADER) returns (uint256 totalEtherSold) {
    // Establish path from Ether to target token.
    address[] memory path = new address[](2);
    path[0] = _weth837;
    path[1] = address(token);
      
    // Trade Ether for quoted token amount on Uniswap and send to this contract.
    uint256[] memory amounts = new uint256[](2);
    amounts = _uniswap_router789.SWAPETHFOREXACTTOKENS846.value(etherAmountFromReserves)(
      quotedTokenAmount, path, address(this), deadline
    );
    totalEtherSold = amounts[0];
  }

  function TRADEDAIFORTOKENUSINGRESERVES451(	//inject NONSTANDARD NAMING
    address token, uint256 daiAmountFromReserves, uint256 quotedTokenAmount, uint256 deadline, bool routeThroughEther
  ) external ONLYOWNEROR451(Role.RESERVE_TRADER) returns (uint256 totalDaiSold) {
    // Redeem dDai if the current Dai balance is less than is required.
    uint256 daiBalance = _dai511.BALANCEOF728(address(this));
    if (daiBalance < daiAmountFromReserves) {
      uint256 additionalDaiRequired = daiAmountFromReserves - daiBalance;
      _ddai74.REDEEMUNDERLYING930(additionalDaiRequired);
    }
    
    // Establish path (direct or routed through Ether) from Dai to target token.
    uint256 pathLength = routeThroughEther ? 3 : 2;
    address[] memory path = new address[](pathLength);
    path[0] = address(_dai511);
    
    if (routeThroughEther) {
      path[1] = _weth837;
    }

    path[pathLength - 1] = token;
    
    // Trade the Dai for the quoted token amount on Uniswap.
    uint256[] memory amounts = new uint256[](pathLength);
    amounts = _uniswap_router789.SWAPTOKENSFOREXACTTOKENS459(
      quotedTokenAmount, daiAmountFromReserves, path, address(this), deadline
    );
    
    totalDaiSold = amounts[0];
  }

  function TRADETOKENFORDAIUSINGRESERVESANDMINTDDAI605(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmountFromReserves, uint256 quotedDaiAmount, uint256 deadline, bool routeThroughEther
  ) external ONLYOWNEROR451(Role.RESERVE_TRADER) returns (
    uint256 totalDaiBought, uint256 totalDDaiMinted
  ) {
    // Approve Uniswap router to transfer tokens on behalf of this contract.
    _GRANTUNISWAPROUTERAPPROVALIFNECESSARY818(token);
    
    // Establish path (direct or routed through Ether) from target token to Dai.
    uint256 pathLength = routeThroughEther ? 3 : 2;
    address[] memory path = new address[](pathLength);
    path[0] = address(token);
    
    if (routeThroughEther) {
      path[1] = _weth837;
    }

    path[pathLength - 1] = address(_dai511);
    
    // Trade the Dai for the quoted token amount on Uniswap.
    uint256[] memory amounts = new uint256[](pathLength);
    amounts = _uniswap_router789.SWAPEXACTTOKENSFORTOKENS718(
      tokenAmountFromReserves, quotedDaiAmount, path, address(this), deadline
    );
    
    totalDaiBought = amounts[pathLength - 1];
    
    // Mint dDai using the received Dai.
    totalDDaiMinted = _ddai74.MINT94(totalDaiBought);
  }
  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function FINALIZEDAIDEPOSIT141(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 daiAmount
  ) external ONLYOWNEROR451(Role.DEPOSIT_MANAGER) {
    // Ensure that the recipient is indeed a smart wallet.
    require(
      _ISSMARTWALLET520(smartWallet, initialUserSigningKey),
      "Could not resolve smart wallet using provided signing key."
    );

    // Ensure that the amount to transfer is lower than the limit.
    require(daiAmount < _daiLimit, "Transfer size exceeds the limit.");

    // Transfer the Dai to the specified smart wallet.
    require(_dai511.TRANSFER941(smartWallet, daiAmount), "Dai transfer failed.");
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function FINALIZEDHARMADAIDEPOSIT255(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 dDaiAmount
  ) external ONLYOWNEROR451(Role.DEPOSIT_MANAGER) {
    // Ensure that the recipient is indeed a smart wallet.
    require(
      _ISSMARTWALLET520(smartWallet, initialUserSigningKey),
      "Could not resolve smart wallet using provided signing key."
    );

    // Get the current dDai exchange rate.
    uint256 exchangeRate = _ddai74.EXCHANGERATECURRENT869();

    // Ensure that an exchange rate was actually returned.
    require(exchangeRate != 0, "Could not retrieve dDai exchange rate.");

    // Get the equivalent Dai amount of the transfer.
    uint256 daiEquivalent = (dDaiAmount.MUL186(exchangeRate)) / 1e18;

    // Ensure that the amount to transfer is lower than the limit.
    require(daiEquivalent < _daiLimit, "Transfer size exceeds the limit.");

    // Transfer the dDai to the specified smart wallet.
    require(_ddai74.TRANSFER941(smartWallet, dDaiAmount), "dDai transfer failed.");
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function FINALIZEETHERDEPOSIT619(	//inject NONSTANDARD NAMING
    address payable smartWallet,
    address initialUserSigningKey,
    uint256 etherAmount
  ) external ONLYOWNEROR451(Role.DEPOSIT_MANAGER) {
    // Ensure that the recipient is indeed a smart wallet.
    require(
      _ISSMARTWALLET520(smartWallet, initialUserSigningKey),
      "Could not resolve smart wallet using provided signing key."
    );

    // Ensure that the amount to transfer is lower than the limit.
    require(etherAmount < _etherLimit, "Transfer size exceeds the limit.");

    // Transfer the Ether to the specified smart wallet.
    bool ok;
    (ok, ) = smartWallet.call.value(etherAmount)("");
    if (!ok) {
      assembly {
        returndatacopy(0, 0, returndatasize)
        revert(0, returndatasize)
      }
    }
  }

                                                                                                                                                                                                                                                                               
  function MINT94(	//inject NONSTANDARD NAMING
    uint256 daiAmount
  ) external ONLYOWNEROR451(Role.ADJUSTER) returns (uint256 dDaiMinted) {
    // Use the specified amount of Dai to mint dDai.
    dDaiMinted = _ddai74.MINT94(daiAmount);
  }

                                                                                                                                                                                                                                                                                    
  function REDEEM804(	//inject NONSTANDARD NAMING
    uint256 dDaiAmount
  ) external ONLYOWNEROR451(Role.ADJUSTER) returns (uint256 daiReceived) {
    // Redeem the specified amount of dDai for Dai.
    daiReceived = _ddai74.REDEEM804(dDaiAmount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function TRADEUSDCFORDDAI492(	//inject NONSTANDARD NAMING
    uint256 usdcAmount,
    uint256 quotedDaiEquivalentAmount
  ) external ONLYOWNEROR451(Role.ADJUSTER) returns (uint256 dDaiMinted) {
    dDaiMinted = _trade_helper873.TRADEUSDCFORDDAI492(
       usdcAmount, quotedDaiEquivalentAmount
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function TRADEDDAIFORUSDC118(	//inject NONSTANDARD NAMING
    uint256 daiEquivalentAmount,
    uint256 quotedUSDCAmount
  ) external ONLYOWNEROR451(Role.ADJUSTER) returns (uint256 usdcReceived) {
    usdcReceived = _trade_helper873.TRADEDDAIFORUSDC118(
      daiEquivalentAmount, quotedUSDCAmount
    );
  }

                                                                                                                                                                                                                                                                                        
  function WITHDRAWUSDCTOPRIMARYRECIPIENT625(	//inject NONSTANDARD NAMING
    uint256 usdcAmount
  ) external ONLYOWNEROR451(Role.WITHDRAWAL_MANAGER) {
    // Get the current primary recipient.
    address primaryRecipient = _primaryUSDCRecipient;
    require(
      primaryRecipient != address(0), "No USDC primary recipient currently set."
    );

    // Transfer the supplied USDC amount to the primary recipient.
    bool ok = _usdc437.TRANSFER941(primaryRecipient, usdcAmount);
    require(ok, "USDC transfer failed.");
  }

                                                                                                                                                                                                                                                                                    
  function WITHDRAWDAITOPRIMARYRECIPIENT76(	//inject NONSTANDARD NAMING
    uint256 daiAmount
  ) external ONLYOWNEROR451(Role.WITHDRAWAL_MANAGER) {
    // Get the current primary recipient.
    address primaryRecipient = _primaryDaiRecipient;
    require(
      primaryRecipient != address(0), "No Dai primary recipient currently set."
    );

    // Transfer the supplied Dai amount to the primary recipient.
    bool ok = _dai511.TRANSFER941(primaryRecipient, daiAmount);
    require(ok, "Dai transfer failed.");
  }

                                                                                                                                                                                                                                             
  function WITHDRAWUSDC925(	//inject NONSTANDARD NAMING
    address recipient, uint256 usdcAmount
  ) external ONLYOWNER880 {
    // Transfer the USDC to the specified recipient.
    require(_usdc437.TRANSFER941(recipient, usdcAmount), "USDC transfer failed.");
  }

                                                                                                                                                                                                                                        
  function WITHDRAWDAI59(	//inject NONSTANDARD NAMING
    address recipient, uint256 daiAmount
  ) external ONLYOWNER880 {
    // Transfer the Dai to the specified recipient.
    require(_dai511.TRANSFER941(recipient, daiAmount), "Dai transfer failed.");
  }

                                                                                                                                                                                                                                                               
  function WITHDRAWDHARMADAI554(	//inject NONSTANDARD NAMING
    address recipient, uint256 dDaiAmount
  ) external ONLYOWNER880 {
    // Transfer the dDai to the specified recipient.
    require(_ddai74.TRANSFER941(recipient, dDaiAmount), "dDai transfer failed.");
  }

                                                                                                                                                                                                                                                  
  function WITHDRAWETHER510(	//inject NONSTANDARD NAMING
    address payable recipient, uint256 etherAmount
  ) external ONLYOWNER880 {
    bool ok;

    // Transfer the Ether to the specified recipient.
    (ok, ) = recipient.call.value(etherAmount)("");
    if (!ok) {
      assembly {
        returndatacopy(0, 0, returndatasize)
        revert(0, returndatasize)
      }
    }
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function WITHDRAW489(	//inject NONSTANDARD NAMING
    ERC20Interface token, address recipient, uint256 amount
  ) external ONLYOWNER880 returns (bool success) {
    // Transfer the token to the specified recipient.
    success = token.TRANSFER941(recipient, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function CALLANY171(	//inject NONSTANDARD NAMING
    address payable target, uint256 amount, bytes calldata data
  ) external ONLYOWNER880 returns (bool ok, bytes memory returnData) {
    // Call the specified target and supply the specified data.
    (ok, returnData) = target.call.value(amount)(data);
  }

                                                                                                                                                                                                                       
  function SETDAILIMIT911(uint256 daiAmount) external ONLYOWNER880 {	//inject NONSTANDARD NAMING
    // Set the new limit.
    _daiLimit = daiAmount;
  }

                                                                                                                                                                                                                           
  function SETETHERLIMIT312(uint256 etherAmount) external ONLYOWNER880 {	//inject NONSTANDARD NAMING
    // Set the new limit.
    _etherLimit = etherAmount;
  }

                                                                                                                                                                                                
  function SETPRIMARYUSDCRECIPIENT953(address recipient) external ONLYOWNER880 {	//inject NONSTANDARD NAMING
    // Set the new primary recipient.
    _primaryUSDCRecipient = recipient;
  }

                                                                                                                                                                                               
  function SETPRIMARYDAIRECIPIENT290(address recipient) external ONLYOWNER880 {	//inject NONSTANDARD NAMING
    // Set the new primary recipient.
    _primaryDaiRecipient = recipient;
  }

                                                                                                                                                                                                                                                                            
  function PAUSE405(Role role) external ONLYOWNEROR451(Role.PAUSER) {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];
    require(!storedRoleStatus.paused, "Role in question is already paused.");
    storedRoleStatus.paused = true;
    emit ROLEPAUSED658(role);
  }

                                                                                                                                                                         
  function UNPAUSE354(Role role) external ONLYOWNER880 {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];
    require(storedRoleStatus.paused, "Role in question is already unpaused.");
    storedRoleStatus.paused = false;
    emit ROLEUNPAUSED884(role);
  }

                                                                                                                                                                                                                                                                                                        
  function SETROLE429(Role role, address account) external ONLYOWNER880 {	//inject NONSTANDARD NAMING
    require(account != address(0), "Must supply an account.");
    _SETROLE219(role, account);
  }

                                                                                                                                                                                                                                                               
  function REMOVEROLE760(Role role) external ONLYOWNER880 {	//inject NONSTANDARD NAMING
    _SETROLE219(role, address(0));
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function ISPAUSED490(Role role) external view returns (bool paused) {	//inject NONSTANDARD NAMING
    paused = _ISPAUSED0(role);
  }

                                                                                                                                                                                                                            
  function ISROLE620(Role role) external view returns (bool hasRole) {	//inject NONSTANDARD NAMING
    hasRole = _ISROLE951(role);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function ISDHARMASMARTWALLET522(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) external view returns (bool dharmaSmartWallet) {
    dharmaSmartWallet = _ISSMARTWALLET520(smartWallet, initialUserSigningKey);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function GETDEPOSITMANAGER751() external view returns (address depositManager) {	//inject NONSTANDARD NAMING
    depositManager = _roles[uint256(Role.DEPOSIT_MANAGER)].account;
  }

                                                                                                                                                                                                                                                                                                                
  function GETADJUSTER321() external view returns (address adjuster) {	//inject NONSTANDARD NAMING
    adjuster = _roles[uint256(Role.ADJUSTER)].account;
  }

                                                                                                                                                                                                                                                                                                                             
  function GETRESERVETRADER542() external view returns (address reserveTrader) {	//inject NONSTANDARD NAMING
    reserveTrader = _roles[uint256(Role.RESERVE_TRADER)].account;
  }

                                                                                                                                                                                                                                                                                                                                
  function GETWITHDRAWALMANAGER608() external view returns (address withdrawalManager) {	//inject NONSTANDARD NAMING
    withdrawalManager = _roles[uint256(Role.WITHDRAWAL_MANAGER)].account;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function GETPAUSER344() external view returns (address pauser) {	//inject NONSTANDARD NAMING
    pauser = _roles[uint256(Role.PAUSER)].account;
  }

                                                                                                                                                                                                                                                  
  function GETRESERVES293() external view returns (	//inject NONSTANDARD NAMING
    uint256 dai, uint256 dDai, uint256 dDaiUnderlying
  ) {
    dai = _dai511.BALANCEOF728(address(this));
    dDai = _ddai74.BALANCEOF728(address(this));
    dDaiUnderlying = _ddai74.BALANCEOFUNDERLYING632(address(this));
  }

                                                                                                                                                                                                                                                                               
  function GETDAILIMIT732() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 dDaiAmount
  ) {
    daiAmount = _daiLimit;
    dDaiAmount = (daiAmount.MUL186(1e18)).DIV494(_ddai74.EXCHANGERATECURRENT869());
  }

                                                                                                                                                                                                                               
  function GETETHERLIMIT244() external view returns (uint256 etherAmount) {	//inject NONSTANDARD NAMING
    etherAmount = _etherLimit;
  }

                                                                                                                                                                 
  function GETPRIMARYUSDCRECIPIENT541() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  ) {
    recipient = _primaryUSDCRecipient;
  }

                                                                                                                                                               
  function GETPRIMARYDAIRECIPIENT404() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  ) {
    recipient = _primaryDaiRecipient;
  }

  function GETIMPLEMENTATION446() external view returns (	//inject NONSTANDARD NAMING
    address implementation
  ) {
    (bool ok, bytes memory returnData) = address(
      0x2Cf7C0333D9b7F94BbF55B9701227E359F92fD31
    ).staticcall("");
    require(ok && returnData.length == 32, "Invalid implementation.");
    implementation = abi.decode(returnData, (address));
  }

  function GETVERSION688() external view returns (uint256 version) {	//inject NONSTANDARD NAMING
    version = _version984;
  }
  
  function _GRANTUNISWAPROUTERAPPROVALIFNECESSARY818(ERC20Interface token) internal {	//inject NONSTANDARD NAMING
    // Approve Uniswap router to transfer tokens on behalf of this contract.
    if (token.ALLOWANCE991(address(this), address(_uniswap_router789)) != uint256(-1)) {
      bool ok = token.APPROVE348(address(_uniswap_router789), uint256(-1));
      require(ok, "Token approval for Uniswap router failed.");
    }
  }

                                                                                                                                                                                                                                                                                                                                                                  
  function _SETROLE219(Role role, address account) internal {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];

    if (account != storedRoleStatus.account) {
      storedRoleStatus.account = account;
      emit ROLEMODIFIED713(role, account);
    }
  }

                                                                                                                                                                                                                            
  function _ISROLE951(Role role) internal view returns (bool hasRole) {	//inject NONSTANDARD NAMING
    hasRole = msg.sender == _roles[uint256(role)].account;
  }

                                                                                                                                                                                                                        
  function _ISPAUSED0(Role role) internal view returns (bool paused) {	//inject NONSTANDARD NAMING
    paused = _roles[uint256(role)].paused;
  }

                                                                                                                                                                                                                                                                                                                                                     
  function _ISSMARTWALLET520(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) internal pure returns (bool) {
    // Derive the keccak256 hash of the smart wallet initialization code.
    bytes32 initCodeHash = keccak256(
      abi.encodePacked(
        _wallet_creation_code_header141,
        initialUserSigningKey,
        _wallet_creation_code_footer376
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
                _create2_header748, // pass in control character + factory address.
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

                                                                                                                                                                                                                                                                      
  modifier ONLYOWNEROR451(Role role) {	//inject NONSTANDARD NAMING
    if (!ISOWNER322()) {
      require(_ISROLE951(role), "Caller does not have a required role.");
      require(!_ISPAUSED0(role), "Role in question is currently paused.");
    }
    _;
  }
}