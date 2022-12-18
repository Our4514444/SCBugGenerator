                                                                 

pragma solidity 0.5.17; // optimization runs: 200, evm version: istanbul


interface DharmaTradeReserveV15Interface {
  event TRADE947(	//inject NONSTANDARD NAMING
    address account,
    address suppliedAsset,
    address receivedAsset,
    address retainedAsset,
    uint256 suppliedAmount,
    uint256 recievedAmount,
    uint256 retainedAmount
  );
  event ROLEMODIFIED998(Role indexed role, address account);	//inject NONSTANDARD NAMING
  event ROLEPAUSED547(Role indexed role);	//inject NONSTANDARD NAMING
  event ROLEUNPAUSED245(Role indexed role);	//inject NONSTANDARD NAMING
  event ETHERRECEIVED460(address sender, uint256 amount);	//inject NONSTANDARD NAMING
  event GASRESERVEREFILLED999(uint256 etherAmount);	//inject NONSTANDARD NAMING
  event WITHDRAWAL102(	//inject NONSTANDARD NAMING
    string indexed asset, address indexed primaryRecipient, uint256 amount
  );

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

  function TRADEDAIFORETHERV2827(	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalDaiSold);

  function TRADEDDAIFORETHER442(	//inject NONSTANDARD NAMING
    uint256 daiEquivalentAmount, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalDaiSold, uint256 totalDDaiRedeemed);

  function TRADEETHERFORDAIV2232(	//inject NONSTANDARD NAMING
    uint256 quotedDaiAmount, uint256 deadline
  ) external payable returns (uint256 totalDaiBought);

  function TRADEETHERFORDAIANDMINTDDAI45(	//inject NONSTANDARD NAMING
    uint256 quotedDaiAmount, uint256 deadline
  ) external payable returns (uint256 totalDaiBought, uint256 totalDDaiMinted);

  function TRADEDAIFORTOKEN53(	//inject NONSTANDARD NAMING
    address token,
    uint256 daiAmount,
    uint256 quotedTokenAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiSold);

  function TRADEDDAIFORTOKEN467(	//inject NONSTANDARD NAMING
    address token,
    uint256 daiEquivalentAmount,
    uint256 quotedTokenAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiSold, uint256 totalDDaiRedeemed);

  function TRADETOKENFORDAI51(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedDaiAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiBought);

  function TRADETOKENFORDAIANDMINTDDAI508(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedDaiAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiBought, uint256 totalDDaiMinted);

  function TRADETOKENFORETHER318(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedEtherAmount,
    uint256 deadline
  ) external returns (uint256 totalEtherBought);

  function TRADEETHERFORTOKEN251(	//inject NONSTANDARD NAMING
    address token, uint256 quotedTokenAmount, uint256 deadline
  ) external payable returns (uint256 totalEtherSold);

  function TRADEETHERFORTOKENUSINGETHERIZER742(	//inject NONSTANDARD NAMING
    address token,
    uint256 etherAmount,
    uint256 quotedTokenAmount,
    uint256 deadline
  ) external returns (uint256 totalEtherSold);

  function TRADETOKENFORTOKEN551(	//inject NONSTANDARD NAMING
    ERC20Interface tokenProvided,
    address tokenReceived,
    uint256 tokenProvidedAmount,
    uint256 quotedTokenReceivedAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalTokensSold);

  function TRADETOKENFORTOKENUSINGRESERVES378(	//inject NONSTANDARD NAMING
    ERC20Interface tokenProvidedFromReserves,
    address tokenReceived,
    uint256 tokenProvidedAmountFromReserves,
    uint256 quotedTokenReceivedAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalTokensSold);

  function TRADEDAIFORETHERUSINGRESERVESV2428(	//inject NONSTANDARD NAMING
    uint256 daiAmountFromReserves, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalDaiSold);

  function TRADEETHERFORDAIUSINGRESERVESANDMINTDDAIV2628(	//inject NONSTANDARD NAMING
    uint256 etherAmountFromReserves, uint256 quotedDaiAmount, uint256 deadline
  ) external returns (uint256 totalDaiBought, uint256 totalDDaiMinted);

  function TRADEDAIFORTOKENUSINGRESERVES367(	//inject NONSTANDARD NAMING
    address token,
    uint256 daiAmountFromReserves,
    uint256 quotedTokenAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiSold);

  function TRADETOKENFORDAIUSINGRESERVESANDMINTDDAI518(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmountFromReserves,
    uint256 quotedDaiAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiBought, uint256 totalDDaiMinted);

  function TRADETOKENFORETHERUSINGRESERVES89(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmountFromReserves,
    uint256 quotedEtherAmount,
    uint256 deadline
  ) external returns (uint256 totalEtherBought);

  function TRADEETHERFORTOKENUSINGRESERVES858(	//inject NONSTANDARD NAMING
    address token,
    uint256 etherAmountFromReserves,
    uint256 quotedTokenAmount,
    uint256 deadline
  ) external returns (uint256 totalEtherSold);

  function FINALIZEETHERDEPOSIT586(	//inject NONSTANDARD NAMING
    address payable smartWallet,
    address initialUserSigningKey,
    uint256 etherAmount
  ) external;

  function FINALIZEDAIDEPOSIT685(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 daiAmount
  ) external;

  function FINALIZEDHARMADAIDEPOSIT437(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 dDaiAmount
  ) external;

  function MINT724(uint256 daiAmount) external returns (uint256 dDaiMinted);	//inject NONSTANDARD NAMING

  function REDEEM400(uint256 dDaiAmount) external returns (uint256 daiReceived);	//inject NONSTANDARD NAMING

  function REDEEMUNDERLYING996(	//inject NONSTANDARD NAMING
    uint256 daiAmount
  ) external returns (uint256 dDaiSupplied);

  function TRADEDDAIFORUSDC465(	//inject NONSTANDARD NAMING
    uint256 daiEquivalentAmount, uint256 quotedUSDCAmount
  ) external returns (uint256 usdcReceived);

  function TRADEUSDCFORDDAI211(	//inject NONSTANDARD NAMING
    uint256 usdcAmount, uint256 quotedDaiEquivalentAmount
  ) external returns (uint256 dDaiMinted);

  function REFILLGASRESERVE703(uint256 etherAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWUSDC40(address recipient, uint256 usdcAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWDAI666(address recipient, uint256 daiAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWDHARMADAI754(address recipient, uint256 dDaiAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWUSDCTOPRIMARYRECIPIENT336(uint256 usdcAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWDAITOPRIMARYRECIPIENT369(uint256 usdcAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWETHERTOPRIMARYRECIPIENT433(uint256 etherAmount) external;	//inject NONSTANDARD NAMING

  function WITHDRAWETHER229(	//inject NONSTANDARD NAMING
    address payable recipient, uint256 etherAmount
  ) external;

  function WITHDRAW684(	//inject NONSTANDARD NAMING
    ERC20Interface token, address recipient, uint256 amount
  ) external returns (bool success);

  function CALLANY557(	//inject NONSTANDARD NAMING
    address payable target, uint256 amount, bytes calldata data
  ) external returns (bool ok, bytes memory returnData);

  function SETDAILIMIT386(uint256 daiAmount) external;	//inject NONSTANDARD NAMING

  function SETETHERLIMIT912(uint256 daiAmount) external;	//inject NONSTANDARD NAMING

  function SETPRIMARYUSDCRECIPIENT378(address recipient) external;	//inject NONSTANDARD NAMING

  function SETPRIMARYDAIRECIPIENT363(address recipient) external;	//inject NONSTANDARD NAMING

  function SETPRIMARYETHERRECIPIENT642(address recipient) external;	//inject NONSTANDARD NAMING

  function SETROLE781(Role role, address account) external;	//inject NONSTANDARD NAMING

  function REMOVEROLE115(Role role) external;	//inject NONSTANDARD NAMING

  function PAUSE266(Role role) external;	//inject NONSTANDARD NAMING

  function UNPAUSE113(Role role) external;	//inject NONSTANDARD NAMING

  function ISPAUSED569(Role role) external view returns (bool paused);	//inject NONSTANDARD NAMING

  function ISROLE397(Role role) external view returns (bool hasRole);	//inject NONSTANDARD NAMING

  function ISDHARMASMARTWALLET850(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) external view returns (bool dharmaSmartWallet);

  function GETDEPOSITMANAGER441() external view returns (address depositManager);	//inject NONSTANDARD NAMING

  function GETADJUSTER200() external view returns (address adjuster);	//inject NONSTANDARD NAMING

  function GETRESERVETRADER976() external view returns (address reserveTrader);	//inject NONSTANDARD NAMING

  function GETWITHDRAWALMANAGER645() external view returns (	//inject NONSTANDARD NAMING
    address withdrawalManager
  );

  function GETPAUSER557() external view returns (address pauser);	//inject NONSTANDARD NAMING

  function GETGASRESERVEREFILLER162() external view returns (	//inject NONSTANDARD NAMING
    address gasReserveRefiller
  );

  function GETRESERVES973() external view returns (	//inject NONSTANDARD NAMING
    uint256 dai, uint256 dDai, uint256 dDaiUnderlying
  );

  function GETDAILIMIT5() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 dDaiAmount
  );

  function GETETHERLIMIT540() external view returns (uint256 etherAmount);	//inject NONSTANDARD NAMING

  function GETPRIMARYUSDCRECIPIENT642() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  );

  function GETPRIMARYDAIRECIPIENT35() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  );

  function GETPRIMARYETHERRECIPIENT447() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  );

  function GETIMPLEMENTATION747() external view returns (address implementation);	//inject NONSTANDARD NAMING

  function GETINSTANCE510() external pure returns (address instance);	//inject NONSTANDARD NAMING

  function GETVERSION701() external view returns (uint256 version);	//inject NONSTANDARD NAMING
}


interface ERC20Interface {
  function BALANCEOF748(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function APPROVE441(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function ALLOWANCE289(address, address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER71(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM982(address, address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
}


interface DTokenInterface {
  function REDEEM400(	//inject NONSTANDARD NAMING
    uint256 dTokensToBurn
  ) external returns (uint256 underlyingReceived);
  function BALANCEOF748(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOFUNDERLYING513(address) external view returns (uint256);	//inject NONSTANDARD NAMING
  function APPROVE441(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
  function EXCHANGERATECURRENT327() external view returns (uint256);	//inject NONSTANDARD NAMING
}


interface DharmaDaiExchangerInterface {
  function MINTTO315(	//inject NONSTANDARD NAMING
    address account, uint256 daiToSupply
  ) external returns (uint256 dDaiMinted);
  function REDEEMUNDERLYINGTO697(	//inject NONSTANDARD NAMING
    address account, uint256 daiToReceive
  ) external returns (uint256 dDaiBurned);
}


interface TradeHelperInterface {
  function TRADEUSDCFORDDAI211(	//inject NONSTANDARD NAMING
    uint256 amountUSDC,
    uint256 quotedDaiEquivalentAmount
  ) external returns (uint256 dDaiMinted);
  function TRADEDDAIFORUSDC465(	//inject NONSTANDARD NAMING
    uint256 amountDai,
    uint256 quotedUSDCAmount
  ) external returns (uint256 usdcReceived);
  function GETEXPECTEDDAI814(uint256 usdc) external view returns (uint256 dai);	//inject NONSTANDARD NAMING
  function GETEXPECTEDUSDC737(uint256 dai) external view returns (uint256 usdc);	//inject NONSTANDARD NAMING
}


interface UniswapV2Interface {
  function SWAPTOKENSFOREXACTTOKENS526(	//inject NONSTANDARD NAMING
    uint256 amountOut,
    uint256 amountInMax,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);

  function SWAPEXACTTOKENSFORTOKENS126(	//inject NONSTANDARD NAMING
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);

  function SWAPEXACTTOKENSFORETH520(	//inject NONSTANDARD NAMING
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);

  function SWAPTOKENSFOREXACTETH607(	//inject NONSTANDARD NAMING
    uint256 amountOut,
    uint256 amountInMax,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external returns (uint256[] memory amounts);

  function SWAPETHFOREXACTTOKENS744(	//inject NONSTANDARD NAMING
    uint256 amountOut,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external payable returns (uint256[] memory amounts);

  function SWAPEXACTETHFORTOKENS646(	//inject NONSTANDARD NAMING
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
  ) external payable returns (uint256[] memory amounts);
}


interface EtherReceiverInterface {
  function SETTLEETHER876() external;	//inject NONSTANDARD NAMING
}


library SafeMath {
  function ADD189(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    c = a + b;
    require(c >= a, "SafeMath: addition overflow");
    return c;
  }

  function SUB129(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b <= a, "SafeMath: subtraction overflow");
    return a - b;
  }

  function MUL710(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) return 0;
    uint256 c = a * b;
    require(c / a == b, "SafeMath: multiplication overflow");
    return c;
  }

  function DIV668(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b > 0, "SafeMath: division by zero");
    return a / b;
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
contract TwoStepOwnable {
  event OWNERSHIPTRANSFERRED566(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );

  address private _owner;

  address private _newPotentialOwner;

                                                                                                                          
  function TRANSFEROWNERSHIP573(address newOwner) external ONLYOWNER364 {	//inject NONSTANDARD NAMING
    require(
      newOwner != address(0),
      "TwoStepOwnable: new potential owner is the zero address."
    );

    _newPotentialOwner = newOwner;
  }

                                                                                                                    
  function CANCELOWNERSHIPTRANSFER235() external ONLYOWNER364 {	//inject NONSTANDARD NAMING
    delete _newPotentialOwner;
  }

                                                                                                                                                   
  function ACCEPTOWNERSHIP588() external {	//inject NONSTANDARD NAMING
    require(
      msg.sender == _newPotentialOwner,
      "TwoStepOwnable: current owner must set caller as new potential owner."
    );

    delete _newPotentialOwner;

    emit OWNERSHIPTRANSFERRED566(_owner, msg.sender);

    _owner = msg.sender;
  }

                                                               
  function OWNER561() external view returns (address) {	//inject NONSTANDARD NAMING
    return _owner;
  }

                                                                      
  function ISOWNER918() public view returns (bool) {	//inject NONSTANDARD NAMING
    return msg.sender == _owner;
  }

                                                                           
  modifier ONLYOWNER364() {	//inject NONSTANDARD NAMING
    require(ISOWNER918(), "TwoStepOwnable: caller is not the owner.");
    _;
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract DharmaTradeReserveV15ImplementationStaging is DharmaTradeReserveV15Interface, TwoStepOwnable {
  using SafeMath for uint256;

  // Maintain a role status mapping with assigned accounts and paused states.
  mapping(uint256 => RoleStatus) private _roles;

  // Maintain a "primary recipient" the withdrawal manager can transfer Dai to.
  address private _primaryDaiRecipient;

  // Maintain a "primary recipient" the withdrawal manager can transfer USDC to.
  address private _primaryUSDCRecipient;

  // Maintain a maximum allowable Dai transfer size for the deposit manager.
  uint256 private _daiLimit;

  // Maintain a maximum allowable Ether transfer size for the deposit manager.
  uint256 private _etherLimit;

  bool private _unused; // unused, don't change storage layout

  // Maintain a "primary recipient" where withdrawal manager can transfer Ether.
  address private _primaryEtherRecipient;

  uint256 private constant _version297 = 1015;	//inject NONSTANDARD NAMING

  // This contract interacts with USDC, Dai, and Dharma Dai.
  ERC20Interface internal constant _usdc80 = ERC20Interface(	//inject NONSTANDARD NAMING
    0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48 // mainnet
  );

  ERC20Interface internal constant _dai577 = ERC20Interface(	//inject NONSTANDARD NAMING
    0x6B175474E89094C44Da98b954EedeAC495271d0F // mainnet
  );

  ERC20Interface internal constant _etherizer252 = ERC20Interface(	//inject NONSTANDARD NAMING
    0x723B51b72Ae89A3d0c2a2760f0458307a1Baa191
  );

  DTokenInterface internal constant _ddai292 = DTokenInterface(	//inject NONSTANDARD NAMING
    0x00000000001876eB1444c986fD502e618c587430
  );

  DharmaDaiExchangerInterface internal constant _ddai_exchanger24 = (	//inject NONSTANDARD NAMING
    DharmaDaiExchangerInterface(
      0x83E02F0b169be417C38d1216fc2a5134C48Af44a
    )
  );

  TradeHelperInterface internal constant _trade_helper57 = TradeHelperInterface(	//inject NONSTANDARD NAMING
    0x9328F2Fb3e85A4d24Adc2f68F82737183e85691d
  );

  UniswapV2Interface internal constant _uniswap_router444 = UniswapV2Interface(	//inject NONSTANDARD NAMING
    0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D
  );

  EtherReceiverInterface internal constant _eth_receiver754 = (	//inject NONSTANDARD NAMING
    EtherReceiverInterface(
      0xaf84687D21736F5E06f738c6F065e88890465E7c
    )
  );

  address internal constant _weth617 = address(	//inject NONSTANDARD NAMING
    0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
  );

  address internal constant _gas_reserve355 = address(	//inject NONSTANDARD NAMING
    0x09cd826D4ABA4088E1381A1957962C946520952d // staging version
  );

  // The "Create2 Header" is used to compute smart wallet deployment addresses.
  bytes21 internal constant _create2_header977 = bytes21(	//inject NONSTANDARD NAMING
    0xff8D1e00b000e56d5BcB006F3a008Ca6003b9F0033 // control character + factory
  );

  // The "Wallet creation code" header & footer are also used to derive wallets.
  bytes internal constant _wallet_creation_code_header662 = hex"60806040526040516104423803806104428339818101604052602081101561002657600080fd5b810190808051604051939291908464010000000082111561004657600080fd5b90830190602082018581111561005b57600080fd5b825164010000000081118282018810171561007557600080fd5b82525081516020918201929091019080838360005b838110156100a257818101518382015260200161008a565b50505050905090810190601f1680156100cf5780820380516001836020036101000a031916815260200191505b5060405250505060006100e661019e60201b60201c565b6001600160a01b0316826040518082805190602001908083835b6020831061011f5780518252601f199092019160209182019101610100565b6001836020036101000a038019825116818451168082178552505050505050905001915050600060405180830381855af49150503d806000811461017f576040519150601f19603f3d011682016040523d82523d6000602084013e610184565b606091505b5050905080610197573d6000803e3d6000fd5b50506102be565b60405160009081906060906eb45d6593312ac9fde193f3d06336449083818181855afa9150503d80600081146101f0576040519150601f19603f3d011682016040523d82523d6000602084013e6101f5565b606091505b509150915081819061029f576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825283818151815260200191508051906020019080838360005b8381101561026457818101518382015260200161024c565b50505050905090810190601f1680156102915780820380516001836020036101000a031916815260200191505b509250505060405180910390fd5b508080602001905160208110156102b557600080fd5b50519392505050565b610175806102cd6000396000f3fe608060405261001461000f610016565b61011c565b005b60405160009081906060906eb45d6593312ac9fde193f3d06336449083818181855afa9150503d8060008114610068576040519150601f19603f3d011682016040523d82523d6000602084013e61006d565b606091505b50915091508181906100fd5760405162461bcd60e51b81526004018080602001828103825283818151815260200191508051906020019080838360005b838110156100c25781810151838201526020016100aa565b50505050905090810190601f1680156100ef5780820380516001836020036101000a031916815260200191505b509250505060405180910390fd5b5080806020019051602081101561011357600080fd5b50519392505050565b3660008037600080366000845af43d6000803e80801561013b573d6000f35b3d6000fdfea265627a7a723158203c578cc1552f1d1b48134a72934fe12fb89a29ff396bd514b9a4cebcacc5cacc64736f6c634300050b003200000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000024c4d66de8000000000000000000000000";	//inject NONSTANDARD NAMING
  bytes28 internal constant _wallet_creation_code_footer344 = bytes28(	//inject NONSTANDARD NAMING
    0x00000000000000000000000000000000000000000000000000000000
  );

  string internal constant _transfer_size_exceeded209 = string(	//inject NONSTANDARD NAMING
    "Transfer size exceeds limit."
  );

  function INITIALIZE503() external ONLYOWNER364 {	//inject NONSTANDARD NAMING
    require(_dai577.APPROVE441(address(_ddai_exchanger24), uint256(-1)));
    require(_ddai292.APPROVE441(address(_ddai_exchanger24), uint256(-1)));
  }

  // Include a payable fallback so that the contract can receive Ether payments.
  function () external payable {
    emit ETHERRECEIVED460(msg.sender, msg.value);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function TRADEDAIFORETHERV2827(	//inject NONSTANDARD NAMING
    uint256 daiAmount,
    uint256 quotedEtherAmount,
    uint256 deadline
  ) external returns (uint256 totalDaiSold) {
    // Transfer the Dai from the caller and revert on failure.
    _TRANSFERINTOKEN679(_dai577, msg.sender, daiAmount);

    // Trade Dai for Ether.
    totalDaiSold = _TRADEDAIFORETHER968(
      daiAmount, quotedEtherAmount, deadline, false
    );
  }

  function TRADEDDAIFORETHER442(	//inject NONSTANDARD NAMING
    uint256 daiEquivalentAmount, uint256 quotedEtherAmount, uint256 deadline
  ) external returns (uint256 totalDaiSold, uint256 totalDDaiRedeemed) {
    // Transfer in sufficient dDai and use it to mint Dai.
    totalDDaiRedeemed = _TRANSFERANDREDEEMDDAI157(daiEquivalentAmount);

    // Trade minted Dai for Ether.
    totalDaiSold = _TRADEDAIFORETHER968(
      daiEquivalentAmount, quotedEtherAmount, deadline, false
    );
  }

  function TRADETOKENFORETHER318(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedEtherAmount,
    uint256 deadline
  ) external returns (uint256 totalEtherBought) {
    // Transfer the tokens from the caller and revert on failure.
    _TRANSFERINTOKEN679(token, msg.sender, tokenAmount);

    // Trade tokens for Ether.
    totalEtherBought = _TRADETOKENFORETHER924(
      token, tokenAmount, quotedEtherAmount, deadline, false
    );

    // Transfer the quoted Ether amount to the caller.
    _TRANSFERETHER176(msg.sender, quotedEtherAmount);
  }

  function TRADEDAIFORTOKEN53(	//inject NONSTANDARD NAMING
    address token,
    uint256 daiAmount,
    uint256 quotedTokenAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiSold) {
    // Transfer the Dai from the caller and revert on failure.
    _TRANSFERINTOKEN679(_dai577, msg.sender, daiAmount);

    // Trade Dai for specified token.
    totalDaiSold = _TRADEDAIFORTOKEN457(
      token, daiAmount, quotedTokenAmount, deadline, routeThroughEther, false
    );
  }

  function TRADEDDAIFORTOKEN467(	//inject NONSTANDARD NAMING
    address token,
    uint256 daiEquivalentAmount,
    uint256 quotedTokenAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiSold, uint256 totalDDaiRedeemed) {
    // Transfer in sufficient dDai and use it to mint Dai.
    totalDDaiRedeemed = _TRANSFERANDREDEEMDDAI157(daiEquivalentAmount);

    // Trade minted Dai for specified token.
    totalDaiSold = _TRADEDAIFORTOKEN457(
      token,
      daiEquivalentAmount,
      quotedTokenAmount,
      deadline,
      routeThroughEther,
      false
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function TRADEDAIFORETHERUSINGRESERVESV2428(	//inject NONSTANDARD NAMING
    uint256 daiAmountFromReserves, uint256 quotedEtherAmount, uint256 deadline
  ) external ONLYOWNEROR491(Role.RESERVE_TRADER) returns (uint256 totalDaiSold) {
    // Redeem dDai if the current Dai balance is less than is required.
    _REDEEMDDAIIFNECESSARY922(daiAmountFromReserves);

    // Trade Dai for Ether using reserves.
    totalDaiSold = _TRADEDAIFORETHER968(
      daiAmountFromReserves, quotedEtherAmount, deadline, true
    );
  }

  function TRADETOKENFORETHERUSINGRESERVES89(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmountFromReserves,
    uint256 quotedEtherAmount,
    uint256 deadline
  ) external ONLYOWNEROR491(Role.RESERVE_TRADER) returns (
    uint256 totalEtherBought
  ) {
    // Trade tokens for Ether using reserves.
    totalEtherBought = _TRADETOKENFORETHER924(
      token, tokenAmountFromReserves, quotedEtherAmount, deadline, true
    );
  }

                                                                                                                                                                                                                                                                                                                                                                         
  function TRADEETHERFORDAIV2232(	//inject NONSTANDARD NAMING
    uint256 quotedDaiAmount,
    uint256 deadline
  ) external payable returns (uint256 totalDaiBought) {
    // Trade Ether for Dai.
    totalDaiBought = _TRADEETHERFORDAI729(
      msg.value, quotedDaiAmount, deadline, false
    );

    // Transfer the Dai to the caller and revert on failure.
    _TRANSFERTOKEN276(_dai577, msg.sender, quotedDaiAmount);
  }

  function TRADEETHERFORDAIANDMINTDDAI45(	//inject NONSTANDARD NAMING
    uint256 quotedDaiAmount, uint256 deadline
  ) external payable returns (uint256 totalDaiBought, uint256 totalDDaiMinted) {
    // Trade Ether for Dai.
    totalDaiBought = _TRADEETHERFORDAI729(
      msg.value, quotedDaiAmount, deadline, false
    );

    // Mint dDai to caller using quoted amount (retained amount stays in Dai).
    totalDDaiMinted = _MINTDDAI951(quotedDaiAmount, true);
  }

  function TRADEETHERFORTOKEN251(	//inject NONSTANDARD NAMING
    address token, uint256 quotedTokenAmount, uint256 deadline
  ) external payable returns (uint256 totalEtherSold) {
    // Trade Ether for the specified token.
    totalEtherSold = _TRADEETHERFORTOKEN134(
      token, msg.value, quotedTokenAmount, deadline, false
    );
  }

  function TRADEETHERFORTOKENUSINGETHERIZER742(	//inject NONSTANDARD NAMING
    address token,
    uint256 etherAmount,
    uint256 quotedTokenAmount,
    uint256 deadline
  ) external returns (uint256 totalEtherSold) {
    // Transfer the Ether from the caller and revert on failure.
    _TRANSFERINTOKEN679(_etherizer252, msg.sender, etherAmount);

    // Trade Ether for the specified token.
    totalEtherSold = _TRADEETHERFORTOKEN134(
      token, etherAmount, quotedTokenAmount, deadline, false
    );
  }

  function TRADETOKENFORDAI51(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedDaiAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiBought) {
    // Transfer the token from the caller and revert on failure.
    _TRANSFERINTOKEN679(token, msg.sender, tokenAmount);

    // Trade the token for Dai.
    totalDaiBought = _TRADETOKENFORDAI385(
      token, tokenAmount, quotedDaiAmount, deadline, routeThroughEther, false
    );

    // Transfer the quoted Dai amount to the caller and revert on failure.
    _TRANSFERTOKEN276(_dai577, msg.sender, quotedDaiAmount);
  }

  function TRADETOKENFORDAIANDMINTDDAI508(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedDaiAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalDaiBought, uint256 totalDDaiMinted) {
    // Transfer the token from the caller and revert on failure.
    _TRANSFERINTOKEN679(token, msg.sender, tokenAmount);

    // Trade the token for Dai.
    totalDaiBought = _TRADETOKENFORDAI385(
      token, tokenAmount, quotedDaiAmount, deadline, routeThroughEther, false
    );

    // Mint dDai to caller using quoted amount (retained amount stays in Dai).
    totalDDaiMinted = _MINTDDAI951(quotedDaiAmount, true);
  }

  function TRADETOKENFORTOKEN551(	//inject NONSTANDARD NAMING
    ERC20Interface tokenProvided,
    address tokenReceived,
    uint256 tokenProvidedAmount,
    uint256 quotedTokenReceivedAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external returns (uint256 totalTokensSold) {
    // Transfer the token from the caller and revert on failure.
    _TRANSFERINTOKEN679(tokenProvided, msg.sender, tokenProvidedAmount);

    totalTokensSold = _TRADETOKENFORTOKEN359(
      msg.sender,
      tokenProvided,
      tokenReceived,
      tokenProvidedAmount,
      quotedTokenReceivedAmount,
      deadline,
      routeThroughEther
    );
  }

  function TRADETOKENFORTOKENUSINGRESERVES378(	//inject NONSTANDARD NAMING
    ERC20Interface tokenProvidedFromReserves,
    address tokenReceived,
    uint256 tokenProvidedAmountFromReserves,
    uint256 quotedTokenReceivedAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external ONLYOWNEROR491(Role.RESERVE_TRADER) returns (
    uint256 totalTokensSold
  ) {
    totalTokensSold = _TRADETOKENFORTOKEN359(
      address(this),
      tokenProvidedFromReserves,
      tokenReceived,
      tokenProvidedAmountFromReserves,
      quotedTokenReceivedAmount,
      deadline,
      routeThroughEther
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function TRADEETHERFORDAIUSINGRESERVESANDMINTDDAIV2628(	//inject NONSTANDARD NAMING
    uint256 etherAmountFromReserves, uint256 quotedDaiAmount, uint256 deadline
  ) external ONLYOWNEROR491(Role.RESERVE_TRADER) returns (
    uint256 totalDaiBought, uint256 totalDDaiMinted
  ) {
    // Trade Ether for Dai using reserves.
    totalDaiBought = _TRADEETHERFORDAI729(
      etherAmountFromReserves, quotedDaiAmount, deadline, true
    );

    // Mint dDai using the received Dai.
    totalDDaiMinted = _MINTDDAI951(totalDaiBought, false);
  }

  function TRADEETHERFORTOKENUSINGRESERVES858(	//inject NONSTANDARD NAMING
    address token,
    uint256 etherAmountFromReserves,
    uint256 quotedTokenAmount,
    uint256 deadline
  ) external ONLYOWNEROR491(Role.RESERVE_TRADER) returns (uint256 totalEtherSold) {
    // Trade Ether for token using reserves.
    totalEtherSold = _TRADEETHERFORTOKEN134(
      token, etherAmountFromReserves, quotedTokenAmount, deadline, true
    );
  }

  function TRADEDAIFORTOKENUSINGRESERVES367(	//inject NONSTANDARD NAMING
    address token,
    uint256 daiAmountFromReserves,
    uint256 quotedTokenAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external ONLYOWNEROR491(Role.RESERVE_TRADER) returns (uint256 totalDaiSold) {
    // Redeem dDai if the current Dai balance is less than is required.
    _REDEEMDDAIIFNECESSARY922(daiAmountFromReserves);

    // Trade Dai for token using reserves.
    totalDaiSold = _TRADEDAIFORTOKEN457(
      token,
      daiAmountFromReserves,
      quotedTokenAmount,
      deadline,
      routeThroughEther,
      true
    );
  }

  function TRADETOKENFORDAIUSINGRESERVESANDMINTDDAI518(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmountFromReserves,
    uint256 quotedDaiAmount,
    uint256 deadline,
    bool routeThroughEther
  ) external ONLYOWNEROR491(Role.RESERVE_TRADER) returns (
    uint256 totalDaiBought, uint256 totalDDaiMinted
  ) {
    // Trade the token for Dai using reserves.
    totalDaiBought = _TRADETOKENFORDAI385(
      token,
      tokenAmountFromReserves,
      quotedDaiAmount,
      deadline,
      routeThroughEther,
      true
    );

    // Mint dDai using the received Dai.
    totalDDaiMinted = _MINTDDAI951(totalDaiBought, false);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function FINALIZEDAIDEPOSIT685(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 daiAmount
  ) external ONLYOWNEROR491(Role.DEPOSIT_MANAGER) {
    // Ensure that the recipient is indeed a smart wallet.
    _ENSURESMARTWALLET741(smartWallet, initialUserSigningKey);

    // Ensure that the amount to transfer is lower than the limit.
    require(daiAmount < _daiLimit, _transfer_size_exceeded209);

    // Transfer the Dai to the specified smart wallet.
    _TRANSFERTOKEN276(_dai577, smartWallet, daiAmount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  function FINALIZEDHARMADAIDEPOSIT437(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey, uint256 dDaiAmount
  ) external ONLYOWNEROR491(Role.DEPOSIT_MANAGER) {
    // Ensure that the recipient is indeed a smart wallet.
    _ENSURESMARTWALLET741(smartWallet, initialUserSigningKey);

    // Get the current dDai exchange rate.
    uint256 exchangeRate = _ddai292.EXCHANGERATECURRENT327();

    // Ensure that an exchange rate was actually returned.
    require(exchangeRate != 0, "Invalid dDai exchange rate.");

    // Get the equivalent Dai amount of the transfer.
    uint256 daiEquivalent = (dDaiAmount.MUL710(exchangeRate)) / 1e18;

    // Ensure that the amount to transfer is lower than the limit.
    require(daiEquivalent < _daiLimit, _transfer_size_exceeded209);

    // Transfer the dDai to the specified smart wallet.
    _TRANSFERTOKEN276(ERC20Interface(address(_ddai292)), smartWallet, dDaiAmount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function FINALIZEETHERDEPOSIT586(	//inject NONSTANDARD NAMING
    address payable smartWallet,
    address initialUserSigningKey,
    uint256 etherAmount
  ) external ONLYOWNEROR491(Role.DEPOSIT_MANAGER) {
    // Ensure that the recipient is indeed a smart wallet.
    _ENSURESMARTWALLET741(smartWallet, initialUserSigningKey);

    // Ensure that the amount to transfer is lower than the limit.
    require(etherAmount < _etherLimit, _transfer_size_exceeded209);

    // Transfer the Ether to the specified smart wallet.
    _TRANSFERETHER176(smartWallet, etherAmount);
  }

                                                                                                                                                                                                                                                                               
  function MINT724(	//inject NONSTANDARD NAMING
    uint256 daiAmount
  ) external ONLYOWNEROR491(Role.ADJUSTER) returns (uint256 dDaiMinted) {
    // Use the specified amount of Dai to mint dDai.
    dDaiMinted = _MINTDDAI951(daiAmount, false);
  }

                                                                                                                                                                                                                                                                                    
  function REDEEM400(	//inject NONSTANDARD NAMING
    uint256 dDaiAmount
  ) external ONLYOWNEROR491(Role.ADJUSTER) returns (uint256 daiReceived) {
    // Redeem the specified amount of dDai for Dai.
    daiReceived = _ddai292.REDEEM400(dDaiAmount);
  }

                                                                                                                                                                                                                                                                                                   
  function REDEEMUNDERLYING996(	//inject NONSTANDARD NAMING
    uint256 daiAmount
  ) external ONLYOWNEROR491(Role.ADJUSTER) returns (uint256 dDaiSupplied) {
    // Redeem the specified amount of dDai for Dai.
    dDaiSupplied = _ddai_exchanger24.REDEEMUNDERLYINGTO697(address(this), daiAmount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function TRADEUSDCFORDDAI211(	//inject NONSTANDARD NAMING
    uint256 usdcAmount,
    uint256 quotedDaiEquivalentAmount
  ) external ONLYOWNEROR491(Role.ADJUSTER) returns (uint256 dDaiMinted) {
    dDaiMinted = _trade_helper57.TRADEUSDCFORDDAI211(
       usdcAmount, quotedDaiEquivalentAmount
    );
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function TRADEDDAIFORUSDC465(	//inject NONSTANDARD NAMING
    uint256 daiEquivalentAmount,
    uint256 quotedUSDCAmount
  ) external ONLYOWNEROR491(Role.ADJUSTER) returns (uint256 usdcReceived) {
    usdcReceived = _trade_helper57.TRADEDDAIFORUSDC465(
      daiEquivalentAmount, quotedUSDCAmount
    );
  }

  function REFILLGASRESERVE703(	//inject NONSTANDARD NAMING
    uint256 etherAmount
  ) external ONLYOWNEROR491(Role.GAS_RESERVE_REFILLER) {
    // Transfer the Ether to the gas reserve.
    _TRANSFERETHER176(_gas_reserve355, etherAmount);

    emit GASRESERVEREFILLED999(etherAmount);
  }

                                                                                                                                                                                                                                                                                              
  function WITHDRAWUSDCTOPRIMARYRECIPIENT336(	//inject NONSTANDARD NAMING
    uint256 usdcAmount
  ) external ONLYOWNEROR491(Role.WITHDRAWAL_MANAGER) {
    // Get the current primary recipient.
    address primaryRecipient = _primaryUSDCRecipient;

    _ENSUREPRIMARYRECIPIENTISSETANDEMITEVENT198(
      primaryRecipient, "USDC", usdcAmount
    );

    // Transfer the supplied USDC amount to the primary recipient.
    _TRANSFERTOKEN276(_usdc80, primaryRecipient, usdcAmount);

  }

                                                                                                                                                                                                                                                                                          
  function WITHDRAWDAITOPRIMARYRECIPIENT369(	//inject NONSTANDARD NAMING
    uint256 daiAmount
  ) external ONLYOWNEROR491(Role.WITHDRAWAL_MANAGER) {
    // Get the current primary recipient.
    address primaryRecipient = _primaryDaiRecipient;

    _ENSUREPRIMARYRECIPIENTISSETANDEMITEVENT198(
      primaryRecipient, "Dai", daiAmount
    );

    // Transfer the supplied Dai amount to the primary recipient.
    _TRANSFERTOKEN276(_dai577, primaryRecipient, daiAmount);
  }

                                                                                                                                                                                                                                                                                                  
  function WITHDRAWETHERTOPRIMARYRECIPIENT433(	//inject NONSTANDARD NAMING
    uint256 etherAmount
  ) external ONLYOWNEROR491(Role.WITHDRAWAL_MANAGER) {
    // Get the current primary recipient.
    address primaryRecipient = _primaryEtherRecipient;

    _ENSUREPRIMARYRECIPIENTISSETANDEMITEVENT198(
      primaryRecipient, "Ether", etherAmount
    );

    // Transfer the supplied Ether amount to the primary recipient.
    _TRANSFERETHER176(primaryRecipient, etherAmount);
  }

                                                                                                                                                                                                                                             
  function WITHDRAWUSDC40(	//inject NONSTANDARD NAMING
    address recipient, uint256 usdcAmount
  ) external ONLYOWNER364 {
    // Transfer the USDC to the specified recipient.
    _TRANSFERTOKEN276(_usdc80, recipient, usdcAmount);
  }

                                                                                                                                                                                                                                        
  function WITHDRAWDAI666(	//inject NONSTANDARD NAMING
    address recipient, uint256 daiAmount
  ) external ONLYOWNER364 {
    // Transfer the Dai to the specified recipient.
    _TRANSFERTOKEN276(_dai577, recipient, daiAmount);
  }

                                                                                                                                                                                                                                                               
  function WITHDRAWDHARMADAI754(	//inject NONSTANDARD NAMING
    address recipient, uint256 dDaiAmount
  ) external ONLYOWNER364 {
    // Transfer the dDai to the specified recipient.
    _TRANSFERTOKEN276(ERC20Interface(address(_ddai292)), recipient, dDaiAmount);
  }

                                                                                                                                                                                                                                                  
  function WITHDRAWETHER229(	//inject NONSTANDARD NAMING
    address payable recipient, uint256 etherAmount
  ) external ONLYOWNER364 {
    // Transfer the Ether to the specified recipient.
    _TRANSFERETHER176(recipient, etherAmount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function WITHDRAW684(	//inject NONSTANDARD NAMING
    ERC20Interface token, address recipient, uint256 amount
  ) external ONLYOWNER364 returns (bool success) {
    // Transfer the token to the specified recipient.
    success = token.TRANSFER71(recipient, amount);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  function CALLANY557(	//inject NONSTANDARD NAMING
    address payable target, uint256 amount, bytes calldata data
  ) external ONLYOWNER364 returns (bool ok, bytes memory returnData) {
    // Call the specified target and supply the specified data.
    (ok, returnData) = target.call.value(amount)(data);
  }

                                                                                                                                                                                                                   
  function SETDAILIMIT386(uint256 daiAmount) external ONLYOWNER364 {	//inject NONSTANDARD NAMING
    // Set the new limit.
    _daiLimit = daiAmount;
  }

                                                                                                                                                                                                                       
  function SETETHERLIMIT912(uint256 etherAmount) external ONLYOWNER364 {	//inject NONSTANDARD NAMING
    // Set the new limit.
    _etherLimit = etherAmount;
  }

                                                                                                                                                                                                
  function SETPRIMARYUSDCRECIPIENT378(address recipient) external ONLYOWNER364 {	//inject NONSTANDARD NAMING
    // Set the new primary recipient.
    _primaryUSDCRecipient = recipient;
  }

                                                                                                                                                                                               
  function SETPRIMARYDAIRECIPIENT363(address recipient) external ONLYOWNER364 {	//inject NONSTANDARD NAMING
    // Set the new primary recipient.
    _primaryDaiRecipient = recipient;
  }

                                                                                                                                                                                                 
  function SETPRIMARYETHERRECIPIENT642(address recipient) external ONLYOWNER364 {	//inject NONSTANDARD NAMING
    // Set the new primary recipient.
    _primaryEtherRecipient = recipient;
  }

                                                                                                                                                                                                                                                                            
  function PAUSE266(Role role) external ONLYOWNEROR491(Role.PAUSER) {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];
    require(!storedRoleStatus.paused, "Role is already paused.");
    storedRoleStatus.paused = true;
    emit ROLEPAUSED547(role);
  }

                                                                                                                                                                         
  function UNPAUSE113(Role role) external ONLYOWNER364 {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];
    require(storedRoleStatus.paused, "Role is already unpaused.");
    storedRoleStatus.paused = false;
    emit ROLEUNPAUSED245(role);
  }

                                                                                                                                                                                                                                                                                                        
  function SETROLE781(Role role, address account) external ONLYOWNER364 {	//inject NONSTANDARD NAMING
    require(account != address(0), "Must supply an account.");
    _SETROLE675(role, account);
  }

                                                                                                                                                                                                                                                               
  function REMOVEROLE115(Role role) external ONLYOWNER364 {	//inject NONSTANDARD NAMING
    _SETROLE675(role, address(0));
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function ISPAUSED569(Role role) external view returns (bool paused) {	//inject NONSTANDARD NAMING
    paused = _ISPAUSED482(role);
  }

                                                                                                                                                                                                                            
  function ISROLE397(Role role) external view returns (bool hasRole) {	//inject NONSTANDARD NAMING
    hasRole = _ISROLE166(role);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  function ISDHARMASMARTWALLET850(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) external view returns (bool dharmaSmartWallet) {
    dharmaSmartWallet = _ISSMARTWALLET386(smartWallet, initialUserSigningKey);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function GETDEPOSITMANAGER441() external view returns (address depositManager) {	//inject NONSTANDARD NAMING
    depositManager = _roles[uint256(Role.DEPOSIT_MANAGER)].account;
  }

                                                                                                                                                                                                                                                                                                                
  function GETADJUSTER200() external view returns (address adjuster) {	//inject NONSTANDARD NAMING
    adjuster = _roles[uint256(Role.ADJUSTER)].account;
  }

                                                                                                                                                                                                                                                                                                                             
  function GETRESERVETRADER976() external view returns (address reserveTrader) {	//inject NONSTANDARD NAMING
    reserveTrader = _roles[uint256(Role.RESERVE_TRADER)].account;
  }

                                                                                                                                                                                                                                                                                                                                                              
  function GETWITHDRAWALMANAGER645() external view returns (	//inject NONSTANDARD NAMING
    address withdrawalManager
  ) {
    withdrawalManager = _roles[uint256(Role.WITHDRAWAL_MANAGER)].account;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function GETPAUSER557() external view returns (address pauser) {	//inject NONSTANDARD NAMING
    pauser = _roles[uint256(Role.PAUSER)].account;
  }

  function GETGASRESERVEREFILLER162() external view returns (	//inject NONSTANDARD NAMING
    address gasReserveRefiller
  ) {
    gasReserveRefiller = _roles[uint256(Role.GAS_RESERVE_REFILLER)].account;
  }

                                                                                                                                                                                                                                                  
  function GETRESERVES973() external view returns (	//inject NONSTANDARD NAMING
    uint256 dai, uint256 dDai, uint256 dDaiUnderlying
  ) {
    dai = _dai577.BALANCEOF748(address(this));
    dDai = _ddai292.BALANCEOF748(address(this));
    dDaiUnderlying = _ddai292.BALANCEOFUNDERLYING513(address(this));
  }

                                                                                                                                                                                                                                                                               
  function GETDAILIMIT5() external view returns (	//inject NONSTANDARD NAMING
    uint256 daiAmount, uint256 dDaiAmount
  ) {
    daiAmount = _daiLimit;
    dDaiAmount = (daiAmount.MUL710(1e18)).DIV668(_ddai292.EXCHANGERATECURRENT327());
  }

                                                                                                                                                                                                                               
  function GETETHERLIMIT540() external view returns (uint256 etherAmount) {	//inject NONSTANDARD NAMING
    etherAmount = _etherLimit;
  }

                                                                                                                                                                 
  function GETPRIMARYUSDCRECIPIENT642() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  ) {
    recipient = _primaryUSDCRecipient;
  }

                                                                                                                                                               
  function GETPRIMARYDAIRECIPIENT35() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  ) {
    recipient = _primaryDaiRecipient;
  }

                                                                                                                                                                   
  function GETPRIMARYETHERRECIPIENT447() external view returns (	//inject NONSTANDARD NAMING
    address recipient
  ) {
    recipient = _primaryEtherRecipient;
  }

                                                                                                                                                                                                         
  function GETIMPLEMENTATION747() external view returns (	//inject NONSTANDARD NAMING
    address implementation
  ) {
    (bool ok, bytes memory returnData) = address(
      0x481B1a16E6675D33f8BBb3a6A58F5a9678649718
    ).staticcall("");
    require(ok && returnData.length == 32, "Invalid implementation.");
    implementation = abi.decode(returnData, (address));
  }

                                                                                                                                                                                                    
  function GETINSTANCE510() external pure returns (address instance) {	//inject NONSTANDARD NAMING
    instance = address(0x2040F2f2bB228927235Dc24C33e99E3A0a7922c1);
  }

  function GETVERSION701() external view returns (uint256 version) {	//inject NONSTANDARD NAMING
    version = _version297;
  }

  function _GRANTUNISWAPROUTERAPPROVALIFNECESSARY86(	//inject NONSTANDARD NAMING
    ERC20Interface token, uint256 amount
  ) internal {
    if (token.ALLOWANCE289(address(this), address(_uniswap_router444)) < amount) {
      // Try removing router approval first as a workaround for unusual tokens.
      (bool success, bytes memory data) = address(token).call(
        abi.encodeWithSelector(
          token.APPROVE441.selector, address(_uniswap_router444), uint256(0)
        )
      );

      // Approve Uniswap router to transfer tokens on behalf of this contract.
      (success, data) = address(token).call(
        abi.encodeWithSelector(
          token.APPROVE441.selector, address(_uniswap_router444), uint256(-1)
        )
      );

      if (!success) {
        // Some janky tokens only allow setting approval up to current balance.
        (success, data) = address(token).call(
          abi.encodeWithSelector(
            token.APPROVE441.selector, address(_uniswap_router444), amount
          )
        );
      }

      require(
        success && (data.length == 0 || abi.decode(data, (bool))),
        "Uniswap router token approval failed."
      );
    }
  }

  function _TRADEETHERFORDAI729(	//inject NONSTANDARD NAMING
    uint256 etherAmount,
    uint256 quotedDaiAmount,
    uint256 deadline,
    bool fromReserves
  ) internal returns (uint256 totalDaiBought) {
    // Establish path from Ether to Dai.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS932(
      _weth617, address(_dai577), false
    );

    // Trade Ether for Dai on Uniswap (send to this contract).
    amounts = _uniswap_router444.SWAPEXACTETHFORTOKENS646.value(etherAmount)(
      quotedDaiAmount, path, address(this), deadline
    );
    totalDaiBought = amounts[1];

    _FIRETRADEEVENT733(
      fromReserves,
      TradeType.ETH_TO_DAI,
      address(0),
      etherAmount,
      quotedDaiAmount,
      totalDaiBought.SUB129(quotedDaiAmount)
    );
  }

  function _TRADEDAIFORETHER968(	//inject NONSTANDARD NAMING
    uint256 daiAmount,
    uint256 quotedEtherAmount,
    uint256 deadline,
    bool fromReserves
  ) internal returns (uint256 totalDaiSold) {
    // Establish path from Dai to Ether.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS932(
      address(_dai577), _weth617, false
    );

    // Trade Dai for quoted Ether amount on Uniswap (send to correct recipient).
    amounts = _uniswap_router444.SWAPTOKENSFOREXACTETH607(
      quotedEtherAmount,
      daiAmount,
      path,
      fromReserves ? address(this) : msg.sender,
      deadline
    );
    totalDaiSold = amounts[0];

    _FIRETRADEEVENT733(
      fromReserves,
      TradeType.DAI_TO_ETH,
      address(0),
      daiAmount,
      quotedEtherAmount,
      daiAmount.SUB129(totalDaiSold)
    );
  }

  function _TRADEETHERFORTOKEN134(	//inject NONSTANDARD NAMING
    address token,
    uint256 etherAmount,
    uint256 quotedTokenAmount,
    uint256 deadline,
    bool fromReserves
  ) internal returns (uint256 totalEtherSold) {
    // Establish path from Ether to target token.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS932(
      _weth617, address(token), false
    );

    // Trade Ether for the quoted token amount and send to correct recipient.
    amounts = _uniswap_router444.SWAPETHFOREXACTTOKENS744.value(etherAmount)(
      quotedTokenAmount,
      path,
      fromReserves ? address(this) : msg.sender,
      deadline
    );
    totalEtherSold = amounts[0];

    _FIRETRADEEVENT733(
      fromReserves,
      TradeType.ETH_TO_TOKEN,
      address(token),
      etherAmount,
      quotedTokenAmount,
      etherAmount.SUB129(totalEtherSold)
    );
  }

  function _TRADETOKENFORETHER924(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedEtherAmount,
    uint256 deadline,
    bool fromReserves
  ) internal returns (uint256 totalEtherBought) {
    // Approve Uniswap router to transfer tokens on behalf of this contract.
    _GRANTUNISWAPROUTERAPPROVALIFNECESSARY86(token, tokenAmount);

    // Establish path from target token to Ether.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS932(
      address(token), _weth617, false
    );

    // Trade tokens for quoted Ether amount on Uniswap (send to this contract).
    amounts = _uniswap_router444.SWAPEXACTTOKENSFORETH520(
      tokenAmount, quotedEtherAmount, path, address(this), deadline
    );
    totalEtherBought = amounts[1];

    _FIRETRADEEVENT733(
      fromReserves,
      TradeType.TOKEN_TO_ETH,
      address(token),
      tokenAmount,
      quotedEtherAmount,
      totalEtherBought.SUB129(quotedEtherAmount)
    );
  }

  function _TRADEDAIFORTOKEN457(	//inject NONSTANDARD NAMING
    address token,
    uint256 daiAmount,
    uint256 quotedTokenAmount,
    uint256 deadline,
    bool routeThroughEther,
    bool fromReserves
  ) internal returns (uint256 totalDaiSold) {
    // Establish path (direct or routed through Ether) from Dai to target token.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS932(
      address(_dai577), address(token), routeThroughEther
    );

    // Trade Dai for quoted token amount and send to correct recipient.
    amounts = _uniswap_router444.SWAPTOKENSFOREXACTTOKENS526(
      quotedTokenAmount,
      daiAmount,
      path,
      fromReserves ? address(this) : msg.sender,
      deadline
    );

    totalDaiSold = amounts[0];

    _FIRETRADEEVENT733(
      fromReserves,
      TradeType.DAI_TO_TOKEN,
      address(token),
      daiAmount,
      quotedTokenAmount,
      daiAmount.SUB129(totalDaiSold)
    );
  }

  function _TRADETOKENFORDAI385(	//inject NONSTANDARD NAMING
    ERC20Interface token,
    uint256 tokenAmount,
    uint256 quotedDaiAmount,
    uint256 deadline,
    bool routeThroughEther,
    bool fromReserves
  ) internal returns (uint256 totalDaiBought) {
    // Approve Uniswap router to transfer tokens on behalf of this contract.
    _GRANTUNISWAPROUTERAPPROVALIFNECESSARY86(token, tokenAmount);

    // Establish path (direct or routed through Ether) from target token to Dai.
    (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS932(
      address(token), address(_dai577), routeThroughEther
    );

    // Trade Dai for the quoted token amount on Uniswap (send to this contract).
    amounts = _uniswap_router444.SWAPEXACTTOKENSFORTOKENS126(
      tokenAmount, quotedDaiAmount, path, address(this), deadline
    );

    totalDaiBought = amounts[path.length - 1];

    _FIRETRADEEVENT733(
      fromReserves,
      TradeType.TOKEN_TO_DAI,
      address(token),
      tokenAmount,
      quotedDaiAmount,
      totalDaiBought.SUB129(quotedDaiAmount)
    );
  }

  function _TRADETOKENFORTOKEN359(	//inject NONSTANDARD NAMING
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
    _GRANTUNISWAPROUTERAPPROVALIFNECESSARY86(tokenProvided, tokenProvidedAmount);

    if (routeThroughEther == false) {
      // Establish direct path between tokens.
      (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS932(
        address(tokenProvided), tokenReceived, false
      );

      // Trade for the quoted token amount on Uniswap and send to recipient.
      amounts = _uniswap_router444.SWAPTOKENSFOREXACTTOKENS526(
        quotedTokenReceivedAmount,
        tokenProvidedAmount,
        path,
        recipient,
        deadline
      );

     totalTokensSold = amounts[0];
     retainedAmount = tokenProvidedAmount.SUB129(totalTokensSold);
    } else {
      // Establish path between provided token and WETH.
      (address[] memory path, uint256[] memory amounts) = _CREATEPATHANDAMOUNTS932(
        address(tokenProvided), _weth617, false
      );

      // Trade all provided tokens for WETH on Uniswap (send to this contract).
      amounts = _uniswap_router444.SWAPEXACTTOKENSFORTOKENS126(
        tokenProvidedAmount, 0, path, address(this), deadline
      );
      retainedAmount = amounts[1];

      // Establish path between WETH and received token.
      (path, amounts) = _CREATEPATHANDAMOUNTS932(
        _weth617, tokenReceived, false
      );

      // Trade bought WETH for received token on Uniswap and send to recipient.
      amounts = _uniswap_router444.SWAPTOKENSFOREXACTTOKENS526(
        quotedTokenReceivedAmount, retainedAmount, path, recipient, deadline
      );

     totalTokensSold = amounts[0];
     retainedAmount = retainedAmount.SUB129(totalTokensSold);
    }

    emit TRADE947(
      recipient,
      address(tokenProvided),
      tokenReceived,
      routeThroughEther ? _weth617 : address(tokenProvided),
      tokenProvidedAmount,
      quotedTokenReceivedAmount,
      retainedAmount
    );
  }

                                                                                                                                                                                                                                                                                                                                                                  
  function _SETROLE675(Role role, address account) internal {	//inject NONSTANDARD NAMING
    RoleStatus storage storedRoleStatus = _roles[uint256(role)];

    if (account != storedRoleStatus.account) {
      storedRoleStatus.account = account;
      emit ROLEMODIFIED998(role, account);
    }
  }

  function _FIRETRADEEVENT733(	//inject NONSTANDARD NAMING
    bool fromReserves,
    TradeType tradeType,
    address token,
    uint256 suppliedAmount,
    uint256 receivedAmount,
    uint256 retainedAmount
  ) internal {
    uint256 t = uint256(tradeType);

    emit TRADE947(
      fromReserves ? address(this) : msg.sender,
      t < 2 ? address(_dai577) : (t % 2 == 0 ? address(0) : token),
      (t > 1 && t < 4) ? address(_dai577) : (t % 2 == 0 ? token : address(0)),
      t < 4 ? address(_dai577) : address(0),
      suppliedAmount,
      receivedAmount,
      retainedAmount
    );
  }

                                                                                                                                                                                                                            
  function _ISROLE166(Role role) internal view returns (bool hasRole) {	//inject NONSTANDARD NAMING
    hasRole = msg.sender == _roles[uint256(role)].account;
  }

                                                                                                                                                                                                                        
  function _ISPAUSED482(Role role) internal view returns (bool paused) {	//inject NONSTANDARD NAMING
    paused = _roles[uint256(role)].paused;
  }

                                                                                                                                                                                                                                                                                                                                                     
  function _ISSMARTWALLET386(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) internal pure returns (bool) {
    // Derive the keccak256 hash of the smart wallet initialization code.
    bytes32 initCodeHash = keccak256(
      abi.encodePacked(
        _wallet_creation_code_header662,
        initialUserSigningKey,
        _wallet_creation_code_footer344
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
                _create2_header977, // pass in control character + factory address.
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

  function _REDEEMDDAIIFNECESSARY922(uint256 daiAmountFromReserves) internal {	//inject NONSTANDARD NAMING
    uint256 daiBalance = _dai577.BALANCEOF748(address(this));
    if (daiBalance < daiAmountFromReserves) {
      uint256 additionalDaiRequired = daiAmountFromReserves - daiBalance;
      _ddai_exchanger24.REDEEMUNDERLYINGTO697(address(this), additionalDaiRequired);
    }
  }

  function _TRANSFERTOKEN276(	//inject NONSTANDARD NAMING
    ERC20Interface token, address to, uint256 amount
  ) internal {
    (bool success, bytes memory data) = address(token).call(
      abi.encodeWithSelector(token.TRANSFER71.selector, to, amount)
    );
    require(
      success && (data.length == 0 || abi.decode(data, (bool))),
      'Transfer out failed.'
    );
  }

  function _TRANSFERETHER176(address recipient, uint256 etherAmount) internal {	//inject NONSTANDARD NAMING
    // Send quoted Ether amount to recipient and revert with reason on failure.
    (bool ok, ) = recipient.call.value(etherAmount)("");
    if (!ok) {
      assembly {
        returndatacopy(0, 0, returndatasize)
        revert(0, returndatasize)
      }
    }
  }

  function _TRANSFERINTOKEN679(	//inject NONSTANDARD NAMING
    ERC20Interface token, address from, uint256 amount
  ) internal {
    (bool success, bytes memory data) = address(token).call(
      abi.encodeWithSelector(
        token.TRANSFERFROM982.selector, from, address(this), amount
      )
    );

    require(
      success && (data.length == 0 || abi.decode(data, (bool))),
      'Transfer in failed.'
    );
  }

  function _MINTDDAI951(	//inject NONSTANDARD NAMING
    uint256 dai, bool sendToCaller
  ) internal returns (uint256 dDai) {
    dDai = _ddai_exchanger24.MINTTO315(
      sendToCaller ? msg.sender : address(this), dai
    );
  }

  function _TRANSFERANDREDEEMDDAI157(	//inject NONSTANDARD NAMING
    uint256 daiEquivalentAmount
  ) internal returns (uint256 totalDDaiRedeemed) {
    // Determine dDai to redeem using exchange rate and daiEquivalentAmount.
    uint256 exchangeRate = _ddai292.EXCHANGERATECURRENT327();
    totalDDaiRedeemed = (
      (daiEquivalentAmount.MUL710(1e18)).ADD189(exchangeRate.SUB129(1)) // NOTE: round up
    ).DIV668(exchangeRate);

    // Transfer the dDai from the caller and revert on failure.
    _TRANSFERINTOKEN679(
      ERC20Interface(address(_ddai292)), msg.sender, totalDDaiRedeemed
    );

    // Redeem the dDai for Dai.
    _ddai_exchanger24.REDEEMUNDERLYINGTO697(address(this), daiEquivalentAmount);
  }

  function _ENSURESMARTWALLET741(	//inject NONSTANDARD NAMING
    address smartWallet, address initialUserSigningKey
  ) internal pure {
    require(
      _ISSMARTWALLET386(smartWallet, initialUserSigningKey),
      "Cannot resolve smart wallet using provided signing key."
    );
  }

  function _CREATEPATHANDAMOUNTS932(	//inject NONSTANDARD NAMING
    address start, address end, bool routeThroughEther
  ) internal pure returns (address[] memory, uint256[] memory) {
    uint256 pathLength = routeThroughEther ? 3 : 2;
    address[] memory path = new address[](pathLength);
    path[0] = start;

    if (routeThroughEther) {
      path[1] = _weth617;
    }

    path[pathLength - 1] = end;

    return (path, new uint256[](pathLength));
  }

  function _ENSUREPRIMARYRECIPIENTISSETANDEMITEVENT198(	//inject NONSTANDARD NAMING
    address primaryRecipient, string memory asset, uint256 amount
  ) internal {
    if (primaryRecipient == address(0)) {
      revert(string(abi.encodePacked(
        asset, " does not have a primary recipient assigned."
      )));
    }

    emit WITHDRAWAL102(asset, primaryRecipient, amount);
  }

                                                                                                                                                                                                                                                                      
  modifier ONLYOWNEROR491(Role role) {	//inject NONSTANDARD NAMING
    if (!ISOWNER918()) {
      require(_ISROLE166(role), "Caller does not have a required role.");
      require(!_ISPAUSED482(role), "Role in question is currently paused.");
    }
    _;
  }
}