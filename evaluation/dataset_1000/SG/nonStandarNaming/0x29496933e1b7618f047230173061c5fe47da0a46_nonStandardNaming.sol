                                                                 

pragma solidity 0.5.17; // optimization runs: 200, evm version: istanbul


interface DharmaTradeReserveV14Interface {
  event TRADE123(	//inject NONSTANDARD NAMING
    address account,
    address suppliedAsset,
    address receivedAsset,
    address retainedAsset,
    uint256 suppliedAmount,
    uint256 recievedAmount,
    uint256 retainedAmount
  );
  event ROLEMODIFIED193(Role indexed role, address account);	//inject NONSTANDARD NAMING
  event ROLEPAUSED938(Role indexed role);	//inject NONSTANDARD NAMING
  event ROLEUNPAUSED846(Role indexed role);	//inject NONSTANDARD NAMING
  event ETHERRECEIVED318(address sender, uint256 amount);	//inject NONSTANDARD NAMING
  event GASRESERVEREFILLED635(uint256 etherAmount);	//inject NONSTANDARD NAMING

  enum Role {            // #
    DEPOSIT_MANAGER,     // 0
    ADJUSTER,            // 1
    WITHDRAWAL_MANAGER,  // 2
    RESERVE_TRADER,      // 3
    PAUSER,              // 4
    GAS_RESERVE_REFILLER // 5
  }
  
  enum TradeType {
    DAI_TO_TOKEN,
    DAI_TO_ETH,
    ETH_TO_DAI,
    TOKEN_TO_DAI,
    ETH_TO_TOKEN,
    TOKEN_TO_ETH,
    TOKEN_TO_TOKEN
  }

  struct RoleStatus {
    address account;
    bool paused;
  }

  function TRADEDAIFORETHERV2440(	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalDaiSold);

  function TRADEETHERFORDAIV2572(	//inject NONSTANDARD NAMING
    uint256 quotedDaiAmount, uint256 deadline
  ) external payable returns (uint256 totalDaiBought);

  function TRADEDAIFORTOKEN720(	//inject NONSTANDARD NAMING
    address token,
    uint256 daiAmount,
    uint256 quotedTokenAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiSold);

  function TRADETOKENFORDAI869(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedDaiAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiBought);

  function TRADETOKENFORETHER329(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedEtherAmount,
    uint256 deadline
  ) external returns (uint256 totalEtherBought);

  function TRADEETHERFORTOKEN881(	//inject NONSTANDARD NAMING
    address token, uint256 quotedTokenAmount, uint256 deadline
  ) external payable returns (uint256 totalEtherSold);

  function TRADEETHERFORTOKENUSINGETHERIZER659(	//inject NONSTANDARD NAMING
    address token,
    uint256 etherAmount,
    uint256 quotedTokenAmount,
    uint256 deadline
  ) external returns (uint256 totalEtherSold);

  function TRADETOKENFORTOKEN719(	//inject NONSTANDARD NAMING
    ERC20Interface tokenProvided,
    address tokenReceived,
    uint256 tokenProvidedAmount,
    uint256 quotedTokenReceivedAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalTokensSold);

  function TRADETOKENFORTOKENUSINGRESERVES507(	//inject NONSTANDARD NAMING
    ERC20Interface tokenProvidedFromReserves,
    address tokenReceived,
    uint256 tokenProvidedAmountFromReserves,
    uint256 quotedTokenReceivedAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalTokensSold);

  function TRADEDAIFORETHERUSINGRESERVESV2406(	//inject NONSTANDARD NAMING
    uint256 daiAmountFromReserves, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalDaiSold);

  function TRADEETHERFORDAIUSINGRESERVESANDMINTDDAIV245(	//inject NONSTANDARD NAMING
    uint256 etherAmountFromReserves, uint256 quotedDaiAmount, uint256 deadline
  ) external returns (uint256 totalDaiBought, uint256 totalDDaiMinted);

  function TRADEDAIFORTOKENUSINGRESERVES943(	//inject NONSTANDARD NAMING
    address token,
    uint256 daiAmountFromReserves,
    uint256 quotedTokenAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiSold);

  function TRADETOKENFORDAIUSINGRESERVESANDMINTDDAI268(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmountFromReserves,
    uint256 quotedDaiAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiBought, uint256 totalDDaiMinted);

  function TRADETOKENFORETHERUSINGRESERVES830(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmountFromReserves,
    uint256 quotedEtherAmount,
    uint256 deadline
  ) external returns (uint256 totalEtherBought);

  function TRADEETHERFORTOKENUSINGRESERVES423(	//inject NONSTANDARD NAMING
    address token,
    uint256 etherAmountFromReserves,
    uint256 quotedTokenAmount,
    uint256 deadline
  ) external returns (uint256 totalEtherSold);

  function FINALIZEETHERDEPOSIT150(	//inject NONSTANDARD NAMING
    address payable smartWallet,
    address initialUserSigningKey,
    uint256 etherAmount
  ) external;

  function FINALIZEDAIDEPOSIT202(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 daiAmount
  ) external;

  function FINALIZEDHARMADAIDEPOSIT728(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 dDaiAmount
  ) external;

  function MINT772(uint256 daiAmount) external returns (uint256 dDaiMinted);	//inject NONSTANDARD NAMING

  function REDEEM974(uint256 dDaiAmount) external returns (uint256 daiReceived);	//inject NONSTANDARD NAMING

  function TRADEDDAIFORUSDC662(	//inject NONSTANDARD NAMING
    uint256 daiEquivalentAmount, uint256 quotedUSDCAmount
  ) external returns (uint256 usdcReceived);

  function TRADEUSDCFORDDAI543(	//inject NONSTANDARD NAMING
    uint256 usdcAmount, uint256 quotedDaiEquivalentAmount
  ) external returns (uint256 dDaiMinted);

  function REFILLGASRESERVE108(uint256 etherAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWUSDC266(address recipient, uint256 usdcAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWDAI126(address recipient, uint256 daiAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWDHARMADAI886(address recipient, uint256 dDaiAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWUSDCTOPRIMARYRECIPIENT511(uint256 usdcAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWDAITOPRIMARYRECIPIENT912(uint256 usdcAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWETHER802(	//inject NONSTANDARD NAMING
    address payable recipient, uint256 etherAmount
  ) external;

  function WITHDRAW171(	//inject NONSTANDARD NAMING
    ERC20Interface token, address recipient, uint256 amount
  ) external returns (bool success);

  function CALLANY469(	//inject NONSTANDARD NAMING
    address payable target, uint256 amount, bytes calldata data
  ) external returns (bool ok, bytes memory returnData);

  function SETDAILIMIT607(uint256 daiAmount) external;	//inject NONSTANDARD NAMING

  function SETETHERLIMIT840(uint256 daiAmount) external;	//inject NONSTANDARD NAMING

  function SETPRIMARYUSDCRECIPIENT899(address recipient) external;	//inject NONSTANDARD NAMING

  function SETPRIMARYDAIRECIPIENT37(address recipient) external;	//inject NONSTANDARD NAMING

  function SETROLE12(Role role, address account) external;	//inject NONSTANDARD NAMING

  function REMOVEROLE990(Role role) external;	//inject NONSTANDARD NAMING

  function PAUSE17(Role role) external;	//inject NONSTANDARD NAMING

  function UNPAUSE224(Role role) external;	//inject NONSTANDARD NAMING

  function ISPAUSED319(Role role) external view returns (bool paused);	//inject NONSTANDARD NAMING

  function ISROLE907(Role role) external view returns (bool hasRole);	//inject NONSTANDARD NAMING

  function ISDHARMASMARTWALLET519(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) external view returns (bool dharmaSmartWallet);

  function GETDEPOSITMANAGER889() external view returns (address depositManager);	//inject NONSTANDARD NAMING

  function GETADJUSTER886() external view returns (address adjuster);	//inject NONSTANDARD NAMING

  function GETRESERVETRADER854() external view returns (address reserveTrader);	//inject NONSTANDARD NAMING

  function GETWITHDRAWALMANAGER733() external view returns (address withdrawalManager);	//inject NONSTANDARD NAMING

  function GETPAUSER917() external view returns (address pauser);	//inject NONSTANDARD NAMING

  function GETGASRESERVEREFILLER157() external view returns (address gasReserveRefiller);	//inject NONSTANDARD NAMING

  function GETRESERVES105() external view returns (	//inject NONSTANDARD NAMING
    uint256 dai, uint256 dDai, uint256 dDaiUnderlying
  );

  function GETDAILIMIT10() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 dDaiAmount
  );

  function GETETHERLIMIT625() external view returns (uint256 etherAmount);	//inject NONSTANDARD NAMING

  function GETPRIMARYUSDCRECIPIENT443() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  );

  function GETPRIMARYDAIRECIPIENT62() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  );

  function GETIMPLEMENTATION308() external view returns (address implementation);	//inject NONSTANDARD NAMING
  
  function GETINSTANCE864() external pure returns (address instance);	//inject NONSTANDARD NAMING

  function GETVERSION511() external view returns (uint256 version);	//inject NONSTANDARD NAMING
}


interface ERC20Interface {
  function BALANCEOF94(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function APPROVE747(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function ALLOWANCE400(address, address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER913(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM615(address, address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
}


interface DTokenInterface {
  function MINT772(uint256 underlyingToSupply) external returns (uint256 dTokensMinted);	//inject NONSTANDARD NAMING
  function REDEEM974(uint256 dTokensToBurn) external returns (uint256 underlyingReceived);	//inject NONSTANDARD NAMING
  function REDEEMUNDERLYING402(uint256 underlyingToReceive) external returns (uint256 dTokensBurned);	//inject NONSTANDARD NAMING
  function BALANCEOF94(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOFUNDERLYING314(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER913(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE747(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function EXCHANGERATECURRENT71() external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface TradeHelperInterface {
  function TRADEUSDCFORDDAI543(	//inject NONSTANDARD NAMING
    uint256 amountUSDC,
    uint256 quotedDaiEquivalentAmount
  ) external returns (uint256 dDaiMinted);
  function TRADEDDAIFORUSDC662(	//inject NONSTANDARD NAMING
    uint256 amountDai,
    uint256 quotedUSDCAmount
  ) external returns (uint256 usdcReceived);
  function GETEXPECTEDDAI745(uint256 usdc) external view returns (uint256 dai);	//inject NONSTANDARD NAMING
  function GETEXPECTEDUSDC838(uint256 dai) external view returns (uint256 usdc);	//inject NONSTANDARD NAMING
}


interface UniswapV2Interface {
  function SWAPTOKENSFOREXACTTOKENS911(	//inject NONSTANDARD NAMING
    uint256 amountOut,
    uint256 amountInMax,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);

  function SWAPEXACTTOKENSFORTOKENS592(	//inject NONSTANDARD NAMING
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);
  
  function SWAPEXACTTOKENSFORETH51(	//inject NONSTANDARD NAMING
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);
  
  function SWAPTOKENSFOREXACTETH120(	//inject NONSTANDARD NAMING
    uint256 amountOut,
    uint256 amountInMax,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);
  
  function SWAPETHFOREXACTTOKENS719(	//inject NONSTANDARD NAMING
    uint256 amountOut,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external payable returns (uint256[] memory amounts);
  
  function SWAPEXACTETHFORTOKENS545(	//inject NONSTANDARD NAMING
    uint256 amountOutMin, 
    address[] calldata path,
    address to,
    uint256 deadline
  ) external payable returns (uint256[] memory amounts);
}


interface EtherReceiverInterface {
  function SETTLEETHER469() external;	//inject NONSTANDARD NAMING
}


library SafeMath {
  function ADD131(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    c = a + b;
    require(c >= a, "SafeMath: addition overflow");
    return c;
  }

  function SUB548(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b <= a, "SafeMath: subtraction overflow");
    return a - b;
  }

  function MUL764(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) return 0;
    uint256 c = a * b;
    require(c / a == b, "SafeMath: multiplication overflow");
    return c;
  }

  function DIV362(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b > 0, "SafeMath: division by zero");
    return a / b;
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
contract TwoStepOwnable {
  event OWNERSHIPTRANSFERRED362(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );

  address private _owner;

  address private _newPotentialOwner;

                                                                                                                          
  function TRANSFEROWNERSHIP395(address newOwner) external ONLYOWNER664 {	//inject NONSTANDARD NAMING
    require(
      newOwner != address(0),
      "TwoStepOwnable: new potential owner is the zero address."
    );

    _newPotentialOwner = newOwner;
  }

                                                                                                                    
  function CANCELOWNERSHIPTRANSFER396() external ONLYOWNER664 {	//inject NONSTANDARD NAMING
    delete _newPotentialOwner;
  }

                                                                                                                                                   
  function ACCEPTOWNERSHIP976() external {	//inject NONSTANDARD NAMING
    require(
      msg.sender == _newPotentialOwner,
      "TwoStepOwnable: current owner must set caller as new potential owner."
    );

    delete _newPotentialOwner;

    emit OWNERSHIPTRANSFERRED362(_owner, msg.sender);

    _owner = msg.sender;
  }

                                                               
  function OWNER654() external view returns (address) {	//inject NONSTANDARD NAMING
    return _owner;
  }

                                                                      
  function ISOWNER774() public view returns (bool) {	//inject NONSTANDARD NAMING
    return msg.sender == _owner;
  }

                                                                           
  modifier ONLYOWNER664() {	//inject NONSTANDARD NAMING
    require(ISOWNER774(), "TwoStepOwnable: caller is not the owner.");
    _;
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
contract DharmaTradeReserveV14ImplementationStaging is DharmaTradeReserveV14Interface, TwoStepOwnable {
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

  uint256 private constant _version227 = 1014;	//inject NONSTANDARD NAMING

  // This contract interacts with USDC, Dai, and Dharma Dai.
  ERC20Interface internal constant _usdc486 = ERC20Interface(	//inject NONSTANDARD NAMING
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 // mainnet
  );

  ERC20Interface internal constant _dai150 = ERC20Interface(	//inject NONSTANDARD NAMING
    0x6B175474E89094C44Da98b954EedeAC495271d0F // mainnet
  );

  ERC20Interface internal constant _etherizer821 = ERC20Interface(	//inject NONSTANDARD NAMING
    0x723B51b72Ae89A3d0c2a2760f0458307a1Baa191
  );

  DTokenInterface internal constant _ddai920 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000001876eB1444c986fD502e618c587430
  );

  TradeHelperInterface internal constant _trade_helper819 = TradeHelperInterface(	//inject NONSTANDARD NAMING
    0x9328F2Fb3e85A4d24Adc2f68F82737183e85691d
  );
  
  UniswapV2Interface internal constant _uniswap_router106 = UniswapV2Interface(	//inject NONSTANDARD NAMING
    0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
  );
  
  EtherReceiverInterface internal constant _eth_receiver902 = EtherReceiverInterface(	//inject NONSTANDARD NAMING
    0xaf84687D21736F5E06f738c6F065e88890465E7c
  );
  
  address internal constant _weth754 = address(	//inject NONSTANDARD NAMING
    0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
  );
  
  address internal constant _gas_reserve331 = address(	//inject NONSTANDARD NAMING
    0x09cd826D4ABA4088E1381A1957962C946520952d // staging version
  );

  // The "Create2 Header" is used to compute smart wallet deployment addresses.
  bytes21 internal constant _create2_header594 = bytes21(	//inject NONSTANDARD NAMING
    0xff8D1e00b000e56d5BcB006F3a008Ca6003b9F0033 // control character + factory
  );
  
  // The "Wallet creation code" header & footer are also used to derive wallets.
  bytes internal constant _wallet_creation_code_header837 = hex"60806040526040516104423803806104428339818101604052602081101561002657600080fd5b810190808051604051939291908464010000000082111561004657600080fd5b90830190602082018581111561005b57600080fd5b825164010000000081118282018810171561007557600080fd5b82525081516020918201929091019080838360005b838110156100a257818101518382015260200161008a565b50505050905090810190601f1680156100cf5780820380516001836020036101000a031916815260200191505b5060405250505060006100e661019e60201b60201c565b6001600160a01b0316826040518082805190602001908083835b6020831061011f5780518252601f199092019160209182019101610100565b6001836020036101000a038019825116818451168082178552505050505050905001915050600060405180830381855af49150503d806000811461017f576040519150601f19603f3d011682016040523d82523d6000602084013e610184565b606091505b5050905080610197573d6000803e3d6000fd5b50506102be565b60405160009081906060906eb45d6593312ac9fde193f3d06336449083818181855afa9150503d80600081146101f0576040519150601f19603f3d011682016040523d82523d6000602084013e6101f5565b606091505b509150915081819061029f576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825283818151815260200191508051906020019080838360005b8381101561026457818101518382015260200161024c565b50505050905090810190601f1680156102915780820380516001836020036101000a031916815260200191505b509250505060405180910390fd5b508080602001905160208110156102b557600080fd5b50519392505050565b610175806102cd6000396000f3fe608060405261001461000f610016565b61011c565b005b60405160009081906060906eb45d6593312ac9fde193f3d06336449083818181855afa9150503d8060008114610068576040519150601f19603f3d011682016040523d82523d6000602084013e61006d565b606091505b50915091508181906100fd5760405162461bcd60e51b81526004018080602001828103825283818151815260200191508051906020019080838360005b838110156100c25781810151838201526020016100aa565b50505050905090810190601f1680156100ef5780820380516001836020036101000a031916815260200191505b509250505060405180910390fd5b5080806020019051602081101561011357600080fd5b50519392505050565b3660008037600080366000845af43d6000803e80801561013b573d6000f35b3d6000fdfea265627a7a723158203c578cc1552f1d1b48134a72934fe12fb89a29ff396bd514b9a4cebcacc5cacc64736f6c634300050b003200000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000024c4d66de8000000000000000000000000";	//inject NONSTANDARD NAMING
  bytes28 internal constant _wallet_creation_code_footer914 = bytes28(	//inject NONSTANDARD NAMING
    0x00000000000000000000000000000000000000000000000000000000
  );

  // Include a payable fallback so that the contract can receive Ether payments.
  function () external payable {
    emit ETHERRECEIVED318(msg.sender, msg.value);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function TRADEDAIFORETHERV2440(	//inject NONSTANDARD NAMING
    uint256 daiAmount,
    uint256 quotedEtherAmount,
    uint256 deadline
  ) external returns (uint256 totalDaiSold) {
    // Transfer the Dai from the caller and revert on failure.
    _TRANSFERINTOKEN461(_dai150, msg.sender, daiAmount);
    
    // Trade Dai for Ether.
    totalDaiSold = _TRADEDAIFORETHER517(
      daiAmount, quotedEtherAmount, deadline, false
    );
  }

  function TRADETOKENFORETHER329(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmount, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalEtherBought) {
    // Transfer the tokens from the caller and revert on failure.
    _TRANSFERINTOKEN461(token, msg.sender, tokenAmount);
    
    // Trade tokens for Ether.
    totalEtherBought = _TRADETOKENFORETHER601(
      token, tokenAmount, quotedEtherAmount, deadline, false
    );

    // Transfer the quoted Ether amount to the caller.
    _TRANSFERETHER715(msg.sender, quotedEtherAmount);
  }

  function TRADEDAIFORTOKEN720(	//inject NONSTANDARD NAMING
    address token, uint256 daiAmount, uint256 quotedTokenAmount, uint256 deadline, bool routeThroughEther
  ) external returns (uint256 totalDaiSold) {
    // Transfer the Dai from the caller and revert on failure.
    _TRANSFERINTOKEN461(_dai150, msg.sender, daiAmount);

    // Trade Dai for specified token.
    totalDaiSold = _TRADEDAIFORTOKEN317(
      token, daiAmount, quotedTokenAmount, deadline, routeThroughEther, false
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function TRADEDAIFORETHERUSINGRESERVESV2406(	//inject NONSTANDARD NAMING
    uint256 daiAmountFromReserves, uint256 quotedEtherAmount, uint256 deadline
  ) external ONLYOWNEROR338(Role.RESERVE_TRADER) returns (uint256 totalDaiSold) {
    // Redeem dDai if the current Dai balance is less than is required.
    _REDEEMDDAIIFNECESSARY816(daiAmountFromReserves);

    // Trade Dai for Ether using reserves.
    totalDaiSold = _TRADEDAIFORETHER517(
      daiAmountFromReserves, quotedEtherAmount, deadline, true
    );
  }

  function TRADETOKENFORETHERUSINGRESERVES830(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmountFromReserves, uint256 quotedEtherAmount, uint256 deadline
  ) external ONLYOWNEROR338(Role.RESERVE_TRADER) returns (uint256 totalEtherBought) {
    // Trade tokens for Ether using reserves.
    totalEtherBought = _TRADETOKENFORETHER601(
      token, tokenAmountFromReserves, quotedEtherAmount, deadline, true
    );
  }

                                                                                                                                                                                                                                                                                                                                                                         
  function TRADEETHERFORDAIV2572(	//inject NONSTANDARD NAMING
    uint256 quotedDaiAmount,
    uint256 deadline
  ) external payable returns (uint256 totalDaiBought) {
    // Trade Ether for Dai.
    totalDaiBought = _TRADEETHERFORDAI771(
      msg.value, quotedDaiAmount, deadline, false
    );

    // Transfer the Dai to the caller and revert on failure.
    _TRANSFERTOKEN273(_dai150, msg.sender, quotedDaiAmount);
  }

  function TRADEETHERFORTOKEN881(	//inject NONSTANDARD NAMING
    address token, uint256 quotedTokenAmount, uint256 deadline
  ) external payable returns (uint256 totalEtherSold) {
    // Trade Ether for the specified token.
    totalEtherSold = _TRADEETHERFORTOKEN385(
      token, msg.value, quotedTokenAmount, deadline, false
    );
  }

  function TRADEETHERFORTOKENUSINGETHERIZER659(	//inject NONSTANDARD NAMING
    address token, uint256 etherAmount, uint256 quotedTokenAmount, uint256 deadline
  ) external returns (uint256 totalEtherSold) {
    // Transfer the Ether from the caller and revert on failure.
    _TRANSFERINTOKEN461(_etherizer821, msg.sender, etherAmount);

    // Trade Ether for the specified token.
    totalEtherSold = _TRADEETHERFORTOKEN385(
      token, etherAmount, quotedTokenAmount, deadline, false
    );
  }
  
  function TRADETOKENFORDAI869(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmount, uint256 quotedDaiAmount, uint256 deadline, bool routeThroughEther
  ) external returns (uint256 totalDaiBought) {
    // Transfer the token from the caller and revert on failure.
    _TRANSFERINTOKEN461(token, msg.sender, tokenAmount);
    
    // Trade the token for Dai.
    totalDaiBought = _TRADETOKENFORDAI359(
      token, tokenAmount, quotedDaiAmount, deadline, routeThroughEther, false
    );
    
    // Transfer the quoted Dai amount to the caller and revert on failure.
    _TRANSFERTOKEN273(_dai150, msg.sender, quotedDaiAmount);
  }

  function TRADETOKENFORTOKEN719(	//inject NONSTANDARD NAMING
    ERC20Interface tokenProvided,
    address tokenReceived,
    uint256 tokenProvidedAmount,
    uint256 quotedTokenReceivedAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalTokensSold) {
    // Transfer the token from the caller and revert on failure.
    _TRANSFERINTOKEN461(tokenProvided, msg.sender, tokenProvidedAmount);
    
    totalTokensSold = _TRADETOKENFORTOKEN109(
      msg.sender,
      tokenProvided,
      tokenReceived,
      tokenProvidedAmount,
      quotedTokenReceivedAmount,
      deadline,
      routeThroughEther
    );
  }

  function TRADETOKENFORTOKENUSINGRESERVES507(	//inject NONSTANDARD NAMING
    ERC20Interface tokenProvidedFromReserves,
    address tokenReceived,
    uint256 tokenProvidedAmountFromReserves,
    uint256 quotedTokenReceivedAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external ONLYOWNEROR338(Role.RESERVE_TRADER)  returns (uint256 totalTokensSold) {
    totalTokensSold = _TRADETOKENFORTOKEN109(
      address(this),
      tokenProvidedFromReserves,
      tokenReceived,
      tokenProvidedAmountFromReserves,
      quotedTokenReceivedAmount,
      deadline,
      routeThroughEther
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function TRADEETHERFORDAIUSINGRESERVESANDMINTDDAIV245(	//inject NONSTANDARD NAMING
    uint256 etherAmountFromReserves, uint256 quotedDaiAmount, uint256 deadline
  ) external ONLYOWNEROR338(Role.RESERVE_TRADER) returns (
    uint256 totalDaiBought, uint256 totalDDaiMinted
  ) {
    // Trade Ether for Dai using reserves.
    totalDaiBought = _TRADEETHERFORDAI771(
      etherAmountFromReserves, quotedDaiAmount, deadline, true
    );

    // Mint dDai using the received Dai.
    totalDDaiMinted = _ddai920.MINT772(totalDaiBought);
  }

  function TRADEETHERFORTOKENUSINGRESERVES423(	//inject NONSTANDARD NAMING
    address token, uint256 etherAmountFromReserves, uint256 quotedTokenAmount, uint256 deadline
  ) external ONLYOWNEROR338(Role.RESERVE_TRADER) returns (uint256 totalEtherSold) {
    // Trade Ether for token using reserves.
    totalEtherSold = _TRADEETHERFORTOKEN385(
      token, etherAmountFromReserves, quotedTokenAmount, deadline, true
    );
  }

  function TRADEDAIFORTOKENUSINGRESERVES943(	//inject NONSTANDARD NAMING
    address token, uint256 daiAmountFromReserves, uint256 quotedTokenAmount, uint256 deadline, bool routeThroughEther
  ) external ONLYOWNEROR338(Role.RESERVE_TRADER) returns (uint256 totalDaiSold) {
    // Redeem dDai if the current Dai balance is less than is required.
    _REDEEMDDAIIFNECESSARY816(daiAmountFromReserves);
    
    // Trade Dai for token using reserves.
    totalDaiSold = _TRADEDAIFORTOKEN317(
      token, daiAmountFromReserves, quotedTokenAmount, deadline, routeThroughEther, true
    );
  }

  function TRADETOKENFORDAIUSINGRESERVESANDMINTDDAI268(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 tokenAmountFromReserves, uint256 quotedDaiAmount, uint256 deadline, bool routeThroughEther
  ) external ONLYOWNEROR338(Role.RESERVE_TRADER) returns (
    uint256 totalDaiBought, uint256 totalDDaiMinted
  ) {
    // Trade the token for Dai using reserves.
    totalDaiBought = _TRADETOKENFORDAI359(
      token, tokenAmountFromReserves, quotedDaiAmount, deadline, routeThroughEther, true
    );
    
    // Mint dDai using the received Dai.
    totalDDaiMinted = _ddai920.MINT772(totalDaiBought);
  }
  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function FINALIZEDAIDEPOSIT202(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 daiAmount
  ) external ONLYOWNEROR338(Role.DEPOSIT_MANAGER) {
    // Ensure that the recipient is indeed a smart wallet.
    _ENSURESMARTWALLET583(smartWallet, initialUserSigningKey);

    // Ensure that the amount to transfer is lower than the limit.
    require(daiAmount < _daiLimit, "Transfer size exceeds the limit.");

    // Transfer the Dai to the specified smart wallet.
    _TRANSFERTOKEN273(_dai150, smartWallet, daiAmount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function FINALIZEDHARMADAIDEPOSIT728(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 dDaiAmount
  ) external ONLYOWNEROR338(Role.DEPOSIT_MANAGER) {
    // Ensure that the recipient is indeed a smart wallet.
    _ENSURESMARTWALLET583(smartWallet, initialUserSigningKey);

    // Get the current dDai exchange rate.
    uint256 exchangeRate = _ddai920.EXCHANGERATECURRENT71();

    // Ensure that an exchange rate was actually returned.
    require(exchangeRate != 0, "Could not retrieve dDai exchange rate.");

    // Get the equivalent Dai amount of the transfer.
    uint256 daiEquivalent = (dDaiAmount.MUL764(exchangeRate)) / 1e18;

    // Ensure that the amount to transfer is lower than the limit.
    require(daiEquivalent < _daiLimit, "Transfer size exceeds the limit.");

    // Transfer the dDai to the specified smart wallet.
    _TRANSFERTOKEN273(ERC20Interface(address(_ddai920)), smartWallet, dDaiAmount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function FINALIZEETHERDEPOSIT150(	//inject NONSTANDARD NAMING
    address payable smartWallet,
    address initialUserSigningKey,
    uint256 etherAmount
  ) external ONLYOWNEROR338(Role.DEPOSIT_MANAGER) {
    // Ensure that the recipient is indeed a smart wallet.
    _ENSURESMARTWALLET583(smartWallet, initialUserSigningKey);

    // Ensure that the amount to transfer is lower than the limit.
    require(etherAmount < _etherLimit, "Transfer size exceeds the limit.");

    // Transfer the Ether to the specified smart wallet.
    _TRANSFERETHER715(smartWallet, etherAmount);
  }

                                                                                                                                                                                                                                                                               
  function MINT772(	//inject NONSTANDARD NAMING
    uint256 daiAmount
  ) external ONLYOWNEROR338(Role.ADJUSTER) returns (uint256 dDaiMinted) {
    // Use the specified amount of Dai to mint dDai.
    dDaiMinted = _ddai920.MINT772(daiAmount);
  }

                                                                                                                                                                                                                                                                                    
  function REDEEM974(	//inject NONSTANDARD NAMING
    uint256 dDaiAmount
  ) external ONLYOWNEROR338(Role.ADJUSTER) returns (uint256 daiReceived) {
    // Redeem the specified amount of dDai for Dai.
    daiReceived = _ddai920.REDEEM974(dDaiAmount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function TRADEUSDCFORDDAI543(	//inject NONSTANDARD NAMING
    uint256 usdcAmount,
    uint256 quotedDaiEquivalentAmount
  ) external ONLYOWNEROR338(Role.ADJUSTER) returns (uint256 dDaiMinted) {
    dDaiMinted = _trade_helper819.TRADEUSDCFORDDAI543(
       usdcAmount, quotedDaiEquivalentAmount
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function TRADEDDAIFORUSDC662(	//inject NONSTANDARD NAMING
    uint256 daiEquivalentAmount,
    uint256 quotedUSDCAmount
  ) external ONLYOWNEROR338(Role.ADJUSTER) returns (uint256 usdcReceived) {
    usdcReceived = _trade_helper819.TRADEDDAIFORUSDC662(
      daiEquivalentAmount, quotedUSDCAmount
    );
  }
  
  function REFILLGASRESERVE108(uint256 etherAmount) external ONLYOWNEROR338(Role.GAS_RESERVE_REFILLER) {	//inject NONSTANDARD NAMING
    // Transfer the Ether to the gas reserve.
    _TRANSFERETHER715(_gas_reserve331, etherAmount);
    
    emit GASRESERVEREFILLED635(etherAmount);
  }

                                                                                                                                                                                                                                                                                        
  function WITHDRAWUSDCTOPRIMARYRECIPIENT511(	//inject NONSTANDARD NAMING
    uint256 usdcAmount
  ) external ONLYOWNEROR338(Role.WITHDRAWAL_MANAGER) {
    // Get the current primary recipient.
    address primaryRecipient = _primaryUSDCRecipient;
    require(
      primaryRecipient != address(0), "No USDC primary recipient currently set."
    );

    // Transfer the supplied USDC amount to the primary recipient.
    _TRANSFERTOKEN273(_usdc486, primaryRecipient, usdcAmount);
  }

                                                                                                                                                                                                                                                                                    
  function WITHDRAWDAITOPRIMARYRECIPIENT912(	//inject NONSTANDARD NAMING
    uint256 daiAmount
  ) external ONLYOWNEROR338(Role.WITHDRAWAL_MANAGER) {
    // Get the current primary recipient.
    address primaryRecipient = _primaryDaiRecipient;
    require(
      primaryRecipient != address(0), "No Dai primary recipient currently set."
    );

    // Transfer the supplied Dai amount to the primary recipient.
    _TRANSFERTOKEN273(_dai150, primaryRecipient, daiAmount);
  }

                                                                                                                                                                                                                                             
  function WITHDRAWUSDC266(	//inject NONSTANDARD NAMING
    address recipient, uint256 usdcAmount
  ) external ONLYOWNER664 {
    // Transfer the USDC to the specified recipient.
    _TRANSFERTOKEN273(_usdc486, recipient, usdcAmount);
  }

                                                                                                                                                                                                                                        
  function WITHDRAWDAI126(	//inject NONSTANDARD NAMING
    address recipient, uint256 daiAmount
  ) external ONLYOWNER664 {
    // Transfer the Dai to the specified recipient.
    _TRANSFERTOKEN273(_dai150, recipient, daiAmount);
  }

                                                                                                                                                                                                                                                               
  function WITHDRAWDHARMADAI886(	//inject NONSTANDARD NAMING
    address recipient, uint256 dDaiAmount
  ) external ONLYOWNER664 {
    // Transfer the dDai to the specified recipient.
    _TRANSFERTOKEN273(ERC20Interface(address(_ddai920)), recipient, dDaiAmount);
  }

                                                                                                                                                                                                                                                  
  function WITHDRAWETHER802(	//inject NONSTANDARD NAMING
    address payable recipient, uint256 etherAmount
  ) external ONLYOWNER664 {
    // Transfer the Ether to the specified recipient.
    _TRANSFERETHER715(recipient, etherAmount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function WITHDRAW171(	//inject NONSTANDARD NAMING
    ERC20Interface token, address recipient, uint256 amount
  ) external ONLYOWNER664 returns (bool success) {
    // Transfer the token to the specified recipient.
    success = token.TRANSFER913(recipient, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function CALLANY469(	//inject NONSTANDARD NAMING
    address payable target, uint256 amount, bytes calldata data
  ) external ONLYOWNER664 returns (bool ok, bytes memory returnData) {
    // Call the specified target and supply the specified data.
    (ok, returnData) = target.call.value(amount)(data);
  }

                                                                                                                                                                                                                       
  function SETDAILIMIT607(uint256 daiAmount) external ONLYOWNER664 {	//inject NONSTANDARD NAMING
    // Set the new limit.
    _daiLimit = daiAmount;
  }

                                                                                                                                                                                                                           
  function SETETHERLIMIT840(uint256 etherAmount) external ONLYOWNER664 {	//inject NONSTANDARD NAMING
    // Set the new limit.
    _etherLimit = etherAmount;
  }

                                                                                                                                                                                                
  function SETPRIMARYUSDCRECIPIENT899(address recipient) external ONLYOWNER664 {	//inject NONSTANDARD NAMING
    // Set the new primary recipient.
    _primaryUSDCRecipient = recipient;
  }

                                                                                                                                                                                               
  function SETPRIMARYDAIRECIPIENT37(address recipient) external ONLYOWNER664 {	//inject NONSTANDARD NAMING
    // Set the new primary recipient.
    _primaryDaiRecipient = recipient;
  }

                                                                                                                                                                                                                                                                            
  function PAUSE17(Role role) external ONLYOWNEROR338(Role.PAUSER) {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];
    require(!storedRoleStatus.paused, "Role in question is already paused.");
    storedRoleStatus.paused = true;
    emit ROLEPAUSED938(role);
  }

                                                                                                                                                                         
  function UNPAUSE224(Role role) external ONLYOWNER664 {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];
    require(storedRoleStatus.paused, "Role in question is already unpaused.");
    storedRoleStatus.paused = false;
    emit ROLEUNPAUSED846(role);
  }

                                                                                                                                                                                                                                                                                                        
  function SETROLE12(Role role, address account) external ONLYOWNER664 {	//inject NONSTANDARD NAMING
    require(account != address(0), "Must supply an account.");
    _SETROLE78(role, account);
  }

                                                                                                                                                                                                                                                               
  function REMOVEROLE990(Role role) external ONLYOWNER664 {	//inject NONSTANDARD NAMING
    _SETROLE78(role, address(0));
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function ISPAUSED319(Role role) external view returns (bool paused) {	//inject NONSTANDARD NAMING
    paused = _ISPAUSED263(role);
  }

                                                                                                                                                                                                                            
  function ISROLE907(Role role) external view returns (bool hasRole) {	//inject NONSTANDARD NAMING
    hasRole = _ISROLE256(role);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function ISDHARMASMARTWALLET519(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) external view returns (bool dharmaSmartWallet) {
    dharmaSmartWallet = _ISSMARTWALLET164(smartWallet, initialUserSigningKey);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function GETDEPOSITMANAGER889() external view returns (address depositManager) {	//inject NONSTANDARD NAMING
    depositManager = _roles[uint256(Role.DEPOSIT_MANAGER)].account;
  }

                                                                                                                                                                                                                                                                                                                
  function GETADJUSTER886() external view returns (address adjuster) {	//inject NONSTANDARD NAMING
    adjuster = _roles[uint256(Role.ADJUSTER)].account;
  }

                                                                                                                                                                                                                                                                                                                             
  function GETRESERVETRADER854() external view returns (address reserveTrader) {	//inject NONSTANDARD NAMING
    reserveTrader = _roles[uint256(Role.RESERVE_TRADER)].account;
  }

                                                                                                                                                                                                                                                                                                                                
  function GETWITHDRAWALMANAGER733() external view returns (address withdrawalManager) {	//inject NONSTANDARD NAMING
    withdrawalManager = _roles[uint256(Role.WITHDRAWAL_MANAGER)].account;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function GETPAUSER917() external view returns (address pauser) {	//inject NONSTANDARD NAMING
    pauser = _roles[uint256(Role.PAUSER)].account;
  }
  
  function GETGASRESERVEREFILLER157() external view returns (address gasReserveRefiller) {	//inject NONSTANDARD NAMING
    gasReserveRefiller = _roles[uint256(Role.GAS_RESERVE_REFILLER)].account;
  }

                                                                                                                                                                                                                                                  
  function GETRESERVES105() external view returns (	//inject NONSTANDARD NAMING
    uint256 dai, uint256 dDai, uint256 dDaiUnderlying
  ) {
    dai = _dai150.BALANCEOF94(address(this));
    dDai = _ddai920.BALANCEOF94(address(this));
    dDaiUnderlying = _ddai920.BALANCEOFUNDERLYING314(address(this));
  }

                                                                                                                                                                                                                                                                               
  function GETDAILIMIT10() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 dDaiAmount
  ) {
    daiAmount = _daiLimit;
    dDaiAmount = (daiAmount.MUL764(1e18)).DIV362(_ddai920.EXCHANGERATECURRENT71());
  }

                                                                                                                                                                                                                               
  function GETETHERLIMIT625() external view returns (uint256 etherAmount) {	//inject NONSTANDARD NAMING
    etherAmount = _etherLimit;
  }

                                                                                                                                                                 
  function GETPRIMARYUSDCRECIPIENT443() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  ) {
    recipient = _primaryUSDCRecipient;
  }

                                                                                                                                                               
  function GETPRIMARYDAIRECIPIENT62() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  ) {
    recipient = _primaryDaiRecipient;
  }

                                                                                                                                                                                                         
  function GETIMPLEMENTATION308() external view returns (	//inject NONSTANDARD NAMING
    address implementation
  ) {
    (bool ok, bytes memory returnData) = address(
      0x481B1a16E6675D33f8BBb3a6A58F5a9678649718
    ).staticcall("");
    require(ok && returnData.length == 32, "Invalid implementation.");
    implementation = abi.decode(returnData, (address));
  }

                                                                                                                                                                                                      
  function GETINSTANCE864() external pure returns (address instance) {	//inject NONSTANDARD NAMING
    instance = address(0x09cd826D4ABA4088E1381A1957962C946520952d);
  }

  function GETVERSION511() external view returns (uint256 version) {	//inject NONSTANDARD NAMING
    version = _version227;
  }
  
  function _GRANTUNISWAPROUTERAPPROVALIFNECESSARY412(ERC20Interface token, uint256 amount) internal {	//inject NONSTANDARD NAMING
    if (token.ALLOWANCE400(address(this), address(_uniswap_router106)) < amount) {
      // Try removing approval for Uniswap router first as a workaround for unusual tokens.
      (bool success, bytes memory data) = address(token).call(
        abi.encodeWithSelector(
          token.APPROVE747.selector, address(_uniswap_router106), uint256(0)
        )
      );

      // Grant approval for Uniswap router to transfer tokens on behalf of this contract.
      (success, data) = address(token).call(
        abi.encodeWithSelector(
          token.APPROVE747.selector, address(_uniswap_router106), uint256(-1)
        )
      );

      if (!success) {
        // Some really janky tokens only allow setting approval up to current balance.
        (success, data) = address(token).call(
          abi.encodeWithSelector(
            token.APPROVE747.selector, address(_uniswap_router106), amount
          )
        );
      }

      require(
        success && (data.length == 0 || abi.decode(data, (bool))),
        "Token approval for Uniswap router failed."
      );
    }
  }
  
  function _TRADEETHERFORDAI771(	//inject NONSTANDARD NAMING
    uint256 etherAmount, uint256 quotedDaiAmount, uint256 deadline, bool fromReserves
  ) internal returns (uint256 totalDaiBought) {
    // Establish path from Ether to Dai.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS612(
      _weth754, address(_dai150), false
    );
   
    // Trade Ether for Dai on Uniswap (send to this contract).
    amounts = _uniswap_router106.SWAPEXACTETHFORTOKENS545.value(etherAmount)(
      quotedDaiAmount, path, address(this), deadline
    );
    totalDaiBought = amounts[1];

    _FIRETRADEEVENT248(
      fromReserves,
      TradeType.ETH_TO_DAI,
      address(0),
      etherAmount,
      quotedDaiAmount,
      totalDaiBought.SUB548(quotedDaiAmount)
    );
  }

  function _TRADEDAIFORETHER517(	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 quotedEtherAmount, uint256 deadline, bool fromReserves
  ) internal returns (uint256 totalDaiSold) {
    // Establish path from Dai to Ether.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS612(
      address(_dai150), _weth754, false
    );

    // Trade Dai for quoted Ether amount on Uniswap (send to appropriate recipient).
    amounts = _uniswap_router106.SWAPTOKENSFOREXACTETH120(
      quotedEtherAmount, daiAmount, path, fromReserves ? address(this) : msg.sender, deadline
    );
    totalDaiSold = amounts[0];

    _FIRETRADEEVENT248(
      fromReserves,
      TradeType.DAI_TO_ETH,
      address(0),
      daiAmount,
      quotedEtherAmount,
      daiAmount.SUB548(totalDaiSold)
    );
  }

  function _TRADEETHERFORTOKEN385(	//inject NONSTANDARD NAMING
    address token, uint256 etherAmount, uint256 quotedTokenAmount, uint256 deadline, bool fromReserves
  ) internal returns (uint256 totalEtherSold) {
    // Establish path from Ether to target token.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS612(
      _weth754, address(token), false
    );
      
    // Trade Ether for quoted token amount on Uniswap and send to appropriate recipient.
    amounts = _uniswap_router106.SWAPETHFOREXACTTOKENS719.value(etherAmount)(
      quotedTokenAmount, path, fromReserves ? address(this) : msg.sender, deadline
    );
    totalEtherSold = amounts[0];

    _FIRETRADEEVENT248(
      fromReserves,
      TradeType.ETH_TO_TOKEN,
      address(token),
      etherAmount,
      quotedTokenAmount,
      etherAmount.SUB548(totalEtherSold)
    );
  }

  function _TRADETOKENFORETHER601(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedEtherAmount,
    uint256 deadline,
    bool fromReserves
  ) internal returns (uint256 totalEtherBought) {
    // Approve Uniswap router to transfer tokens on behalf of this contract.
    _GRANTUNISWAPROUTERAPPROVALIFNECESSARY412(token, tokenAmount);

    // Establish path from target token to Ether.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS612(
      address(token), _weth754, false
    );

    // Trade tokens for quoted Ether amount on Uniswap (send to this contract).
    amounts = _uniswap_router106.SWAPEXACTTOKENSFORETH51(
      tokenAmount, quotedEtherAmount, path, address(this), deadline
    );
    totalEtherBought = amounts[1];

    _FIRETRADEEVENT248(
      fromReserves,
      TradeType.TOKEN_TO_ETH,
      address(token),
      tokenAmount,
      quotedEtherAmount,
      totalEtherBought.SUB548(quotedEtherAmount)
    );
  }

  function _TRADEDAIFORTOKEN317(	//inject NONSTANDARD NAMING
    address token,
    uint256 daiAmount,
    uint256 quotedTokenAmount,
    uint256 deadline,
    bool routeThroughEther,
    bool fromReserves
  ) internal returns (uint256 totalDaiSold) {
    // Establish path (direct or routed through Ether) from Dai to target token.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS612(
      address(_dai150), address(token), routeThroughEther
    );
    
    // Trade the Dai for the quoted token amount on Uniswap and send to appropriate recipient.
    amounts = _uniswap_router106.SWAPTOKENSFOREXACTTOKENS911(
      quotedTokenAmount, daiAmount, path, fromReserves ? address(this) : msg.sender, deadline
    );
    
    totalDaiSold = amounts[0];
    
    _FIRETRADEEVENT248(
      fromReserves,
      TradeType.DAI_TO_TOKEN,
      address(token),
      daiAmount,
      quotedTokenAmount,
      daiAmount.SUB548(totalDaiSold)
    );
  }

  function _TRADETOKENFORDAI359(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedDaiAmount,
    uint256 deadline,
    bool routeThroughEther,
    bool fromReserves
  ) internal returns (uint256 totalDaiBought) {
    // Approve Uniswap router to transfer tokens on behalf of this contract.
    _GRANTUNISWAPROUTERAPPROVALIFNECESSARY412(token, tokenAmount);
    
    // Establish path (direct or routed through Ether) from target token to Dai.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS612(
      address(token), address(_dai150), routeThroughEther
    );
    
    // Trade the Dai for the quoted token amount on Uniswap (send to this contract).
    amounts = _uniswap_router106.SWAPEXACTTOKENSFORTOKENS592(
      tokenAmount, quotedDaiAmount, path, address(this), deadline
    );
    
    totalDaiBought = amounts[path.length - 1];

    _FIRETRADEEVENT248(
      fromReserves,
      TradeType.TOKEN_TO_DAI,
      address(token),
      tokenAmount,
      quotedDaiAmount,
      totalDaiBought.SUB548(quotedDaiAmount)
    );
  }

  function _TRADETOKENFORTOKEN109(	//inject NONSTANDARD NAMING
    address recipient,
    ERC20Interface tokenProvided,
    address tokenReceived,
    uint256 tokenProvidedAmount,
    uint256 quotedTokenReceivedAmount,
    uint256 deadline,
    bool routeThroughEther
  ) internal returns (uint256 totalTokensSold) {
    uint256 retainedAmount;

    // Approve Uniswap router to transfer tokens on behalf of this contract.
    _GRANTUNISWAPROUTERAPPROVALIFNECESSARY412(tokenProvided, tokenProvidedAmount);
    
    if (routeThroughEther == false) {
      // Establish direct path between tokens.
      (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS612(
        address(tokenProvided), tokenReceived, false
      );

      // Trade for the quoted token amount on Uniswap and send to recipient.
      amounts = _uniswap_router106.SWAPTOKENSFOREXACTTOKENS911(
        quotedTokenReceivedAmount, tokenProvidedAmount, path, recipient, deadline
      );
    
     totalTokensSold = amounts[0];
     retainedAmount = tokenProvidedAmount.SUB548(totalTokensSold);
    } else {
      // Establish path between provided token and WETH.
      (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS612(
        address(tokenProvided), _weth754, false
      );

      // Trade all provided tokens for WETH on Uniswap and send to this contract.
      amounts = _uniswap_router106.SWAPEXACTTOKENSFORTOKENS592(
        tokenProvidedAmount, 0, path, address(this), deadline
      );
      retainedAmount = amounts[1];

      // Establish path between WETH and received token.
      (path, amounts) = _CREATEPATHANDAMOUNTS612(
        _weth754, tokenReceived, false
      );

      // Trade bought WETH for received token on Uniswap and send to recipient.
      amounts = _uniswap_router106.SWAPTOKENSFOREXACTTOKENS911(
        quotedTokenReceivedAmount, retainedAmount, path, recipient, deadline
      );
    
     totalTokensSold = amounts[0];
     retainedAmount = retainedAmount.SUB548(totalTokensSold);
    }

    emit TRADE123(
      recipient,
      address(tokenProvided),
      tokenReceived,
      routeThroughEther ? _weth754 : address(tokenProvided),
      tokenProvidedAmount,
      quotedTokenReceivedAmount,
      retainedAmount
    );
  }

                                                                                                                                                                                                                                                                                                                                                                  
  function _SETROLE78(Role role, address account) internal {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];

    if (account != storedRoleStatus.account) {
      storedRoleStatus.account = account;
      emit ROLEMODIFIED193(role, account);
    }
  }
  
  function _FIRETRADEEVENT248(	//inject NONSTANDARD NAMING
    bool fromReserves,
    TradeType tradeType,
    address token,
    uint256 suppliedAmount,
    uint256 receivedAmount,
    uint256 retainedAmount
  ) internal {
    uint256 t = uint256(tradeType);
    
    emit TRADE123(
      fromReserves ? address(this) : msg.sender,
      t < 2 ? address(_dai150) : (t % 2 == 0 ? address(0) : token),
      (t > 1 && t < 4) ? address(_dai150) : (t % 2 == 0 ? token : address(0)),
      t < 4 ? address(_dai150) : address(0),
      suppliedAmount,
      receivedAmount,
      retainedAmount
    );  
  }

                                                                                                                                                                                                                            
  function _ISROLE256(Role role) internal view returns (bool hasRole) {	//inject NONSTANDARD NAMING
    hasRole = msg.sender == _roles[uint256(role)].account;
  }

                                                                                                                                                                                                                        
  function _ISPAUSED263(Role role) internal view returns (bool paused) {	//inject NONSTANDARD NAMING
    paused = _roles[uint256(role)].paused;
  }

                                                                                                                                                                                                                                                                                                                                                     
  function _ISSMARTWALLET164(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) internal pure returns (bool) {
    // Derive the keccak256 hash of the smart wallet initialization code.
    bytes32 initCodeHash = keccak256(
      abi.encodePacked(
        _wallet_creation_code_header837,
        initialUserSigningKey,
        _wallet_creation_code_footer914
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
                _create2_header594, // pass in control character + factory address.
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
  
  function _REDEEMDDAIIFNECESSARY816(uint256 daiAmountFromReserves) internal {	//inject NONSTANDARD NAMING
    uint256 daiBalance = _dai150.BALANCEOF94(address(this));
    if (daiBalance < daiAmountFromReserves) {
      uint256 additionalDaiRequired = daiAmountFromReserves - daiBalance;
      _ddai920.REDEEMUNDERLYING402(additionalDaiRequired);
    }
  }
  
  function _TRANSFERTOKEN273(ERC20Interface token, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
    (bool success, bytes memory data) = address(token).call(
      abi.encodeWithSelector(token.TRANSFER913.selector, to, amount)
    );
    require(
      success && (data.length == 0 || abi.decode(data, (bool))),
      'Transfer out failed.'
    );
  }
  
  function _TRANSFERETHER715(address recipient, uint256 etherAmount) internal {	//inject NONSTANDARD NAMING
    // Send quoted Ether amount to recipient and revert with reason on failure.
    (bool ok, ) = recipient.call.value(etherAmount)("");
    if (!ok) {
      assembly {
        returndatacopy(0, 0, returndatasize)
        revert(0, returndatasize)
      }
    }
  }

  function _TRANSFERINTOKEN461(ERC20Interface token, address from, uint256 amount) internal {	//inject NONSTANDARD NAMING
    (bool success, bytes memory data) = address(token).call(
      abi.encodeWithSelector(token.TRANSFERFROM615.selector, from, address(this), amount)
    );

    require(
      success && (data.length == 0 || abi.decode(data, (bool))),
      'Transfer in failed.'
    );
  }
  
  function _ENSURESMARTWALLET583(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) internal pure {
    require(
      _ISSMARTWALLET164(smartWallet, initialUserSigningKey),
      "Could not resolve smart wallet using provided signing key."
    );
  }
  
  function _CREATEPATHANDAMOUNTS612(	//inject NONSTANDARD NAMING
    address start, address end, bool routeThroughEther
  ) internal pure returns (address[] memory, uint256[] memory) {
    uint256 pathLength = routeThroughEther ? 3 : 2;
    address[] memory path = new address[](pathLength);
    path[0] = start;
    
    if (routeThroughEther) {
      path[1] = _weth754;
    }

    path[pathLength - 1] = end;

    return (path, new uint256[](pathLength));
  }

                                                                                                                                                                                                                                                                      
  modifier ONLYOWNEROR338(Role role) {	//inject NONSTANDARD NAMING
    if (!ISOWNER774()) {
      require(_ISROLE256(role), "Caller does not have a required role.");
      require(!_ISPAUSED263(role), "Role in question is currently paused.");
    }
    _;
  }
}