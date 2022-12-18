                                                                 

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;

contract TotlePrimary {
  function PERFORMSWAPCOLLECTION807(	//inject NONSTANDARD NAMING
    TotlePrimaryUtils.SwapCollection calldata swaps
  ) external payable {

  }
}

library TotlePrimaryUtils {
  struct Order {
    address payable exchangeHandler;
    bytes encodedPayload;
    uint256 minSourceAmount;
    uint256 maxSourceAmount;
  }

  struct Trade {
    address sourceToken;
    address destinationToken;
    uint256 amount;
    bool isSourceAmount; //true if amount is sourceToken, false if it's destinationToken
    Order[] orders;
  }

  struct Swap {
    Trade[] trades;
    uint256 minimumExchangeRate;
    uint256 minimumDestinationAmount;
    uint256 sourceAmount;
    uint256 tradeToTakeFeeFrom;
    bool takeFeeFromSource; //Takes the fee before the trade if true, takes it after if false
    address payable redirectAddress;
    bool required;
  }

  struct SwapCollection {
    Swap[] swaps;
    address payable partnerContract;
    uint256 expirationBlock;
    bytes32 id;
    uint256 maxGasPrice;
    uint8 v;
    bytes32 r;
    bytes32 s;
  }
}

contract DSMath {
    uint constant wad62 = 10 ** 18;	//inject NONSTANDARD NAMING

    function ADD834(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x, "math-not-safe");
    }

    function SUB934(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }

    function MUL849(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }

    function WMUL85(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD834(MUL849(x, y), wad62 / 2) / wad62;
    }

    function WDIV469(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD834(MUL849(x, wad62), y / 2) / y;
    }
}

                                                                                        
contract ERC20 {
  event TRANSFER419(	//inject NONSTANDARD NAMING
    address indexed from,
    address indexed to,
    uint256 value
  );

  event APPROVAL709(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );

  function TOTALSUPPLY428() public view returns (uint256);	//inject NONSTANDARD NAMING

  function BALANCEOF208(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING

  function ALLOWANCE708(address _owner, address _spender) public view returns (uint256);	//inject NONSTANDARD NAMING

  function TRANSFER289(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

  function APPROVE447(address _spender, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

  function TRANSFERFROM374(address _from, address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

  function DECIMALS951() public view returns (uint256);	//inject NONSTANDARD NAMING

  //For WETH
  function DEPOSIT769() external payable;	//inject NONSTANDARD NAMING
  function WITHDRAW749(uint) external;	//inject NONSTANDARD NAMING
}

interface DepositManagerInterface {
  function DEPOSITERC20FORUSER10(address _token, address _user, uint256 _amount) external;	//inject NONSTANDARD NAMING
  function DEPOSITETHERFORUSER892(address _user) external payable;	//inject NONSTANDARD NAMING
}

interface RegistryInterface {
  function ROOTTOCHILDTOKEN195(address rootToken) external returns (address childToken);	//inject NONSTANDARD NAMING
  function GETWETHTOKENADDRESS775() external view returns (address);	//inject NONSTANDARD NAMING
  function GETDEPOSITMANAGERADDRESS370() external view returns (address);	//inject NONSTANDARD NAMING
}

contract Swapper {
  address public constant maticregistry939 = 0x33a02E6cC863D393d6Bf231B697b82F6e499cA71;	//inject NONSTANDARD NAMING

  function SWAP196(	//inject NONSTANDARD NAMING
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection calldata swapCollection
  ) external {
    primary.PERFORMSWAPCOLLECTION807.value(address(this).balance)(swapCollection);
  }

  function FETCHRETURNDATA580() internal pure returns (bool success) {	//inject NONSTANDARD NAMING
    assembly {
      switch returndatasize()
      case 0 {
        success := 1
      }
      case 32 {
        returndatacopy(0, 0, 32)
        success := mload(0)
      }
      default {
        revert(0, 0)
      }
    }
  }

  function GETBALANCE944(address token) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return token == address(0)
      ? address(this).balance
      : ERC20(token).BALANCEOF208(address(this));
  }

  function CLAIM203(address payable user, address token) public {	//inject NONSTANDARD NAMING
    CLAIM203(user, token, GETBALANCE944(token));
  }

  function CLAIM203(address payable user, address token, uint amount) public {	//inject NONSTANDARD NAMING
    require(amount > 0, 'Claim amount must be positive');

    uint balance = GETBALANCE944(token);
    if (balance < amount) {
      amount = balance;
    }

    if (token == address(0)) {
      user.transfer(amount);
    } else {
      SAFETRANSFER385(token, user, amount);
    }
  }

  function DEPOSITMATICMAX687(address payable user, address token) public {	//inject NONSTANDARD NAMING
    DEPOSITMATIC119(user, token, GETBALANCE944(token));
  }

  function DEPOSITMATIC119(address payable user, address token, uint amount) public {	//inject NONSTANDARD NAMING
    require(amount > 0, 'Deposit amount must be positive');
    RegistryInterface maticRegistryContract = RegistryInterface(maticregistry939);

    uint balance = GETBALANCE944(token);
    uint _amount = balance < amount ? balance : amount;
    address _token = token == address(0) ? maticRegistryContract.GETWETHTOKENADDRESS775() : token;
    address childToken = maticRegistryContract.ROOTTOCHILDTOKEN195(_token);
    require(childToken != address(0), "Child token not registered");

    address maticDepositManager = maticRegistryContract.GETDEPOSITMANAGERADDRESS370();
    if (token == address(0)) {
      ERC20(_token).DEPOSIT769.value(_amount)();
      APPROVE447(_token, maticDepositManager);
      DepositManagerInterface(maticDepositManager).DEPOSITERC20FORUSER10(_token, user, _amount);
    } else {
      APPROVE447(_token, maticDepositManager);
      DepositManagerInterface(maticDepositManager).DEPOSITERC20FORUSER10(_token, user, _amount);
    }
  }

  function SAFETRANSFER385(address _tokenAddress, address _to, uint256 _value) internal returns (bool success) {	//inject NONSTANDARD NAMING
    (success,) = _tokenAddress.call(abi.encodeWithSignature("transfer(address,uint256)", _to, _value));
    require(success, "Transfer failed");

    return FETCHRETURNDATA580();
  }

  function APPROVE447(address token, address spender) public {	//inject NONSTANDARD NAMING
    SAFEAPPROVE335(token, spender, GETBALANCE944(token));
  }

  function SAFEAPPROVE335(address _tokenAddress, address _spender, uint256 _value) internal returns (bool success) {	//inject NONSTANDARD NAMING
    (success,) = _tokenAddress.call(abi.encodeWithSignature("approve(address,uint256)", _spender, _value));
    require(success, "Approve failed");

    return FETCHRETURNDATA580();
  }

  function DESTROY646(address payable user) external {	//inject NONSTANDARD NAMING
    selfdestruct(user);
  }

  function() external payable {

  }
}


contract SwapperFactory is DSMath {
  address public admin;
  address public swapperLibrary;
  uint public maxCommission;

  event SWAPPERFORMED756(	//inject NONSTANDARD NAMING
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

  event MATICSWAPPERFORMED188(	//inject NONSTANDARD NAMING
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

  event TRANSFERPERFORMED665(	//inject NONSTANDARD NAMING
    address indexed user,
    address token,
    string uniqueId
  );

  event MATICTRANSFERPERFORMED383(	//inject NONSTANDARD NAMING
    address indexed user,
    address token,
    string uniqueId
  );

  modifier ONLYADMIN802() {	//inject NONSTANDARD NAMING
    require(msg.sender == admin, 'Only the admin address can call this function.');
    _;
  }

  struct Commission {
    uint amount;
    address payable destination;
  }

  constructor(address _swapperLibrary) public {
    admin = msg.sender;
    swapperLibrary = _swapperLibrary;
    maxCommission = 5*10**16;
  }

  function PERFORMSWAP785(	//inject NONSTANDARD NAMING
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public ONLYADMIN802() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');
    require(swapCollection.swaps[0].redirectAddress == user, 'User address does not match swap redirect address');

    Swapper swapper = CREATECLONE717(user, srcToken, dstToken, uniqueId);
    TAKECOMMISSION382(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.GETBALANCE944(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.APPROVE447(srcToken, tokenTransferProxy);
    }

    swapper.SWAP196(primary, swapCollection);
    swapper.DESTROY646(user);

    emit SWAPPERFORMED756(user, srcToken, dstToken, uniqueId);
  }

  function MATICSWAP999(	//inject NONSTANDARD NAMING
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public ONLYADMIN802() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');

    Swapper swapper = CREATECLONE717(user, srcToken, dstToken, uniqueId);
    require(
      swapCollection.swaps[0].redirectAddress == user ||
      swapCollection.swaps[0].redirectAddress == address(swapper),
      'User address does not match swap redirect address');
    TAKECOMMISSION382(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.GETBALANCE944(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.APPROVE447(srcToken, tokenTransferProxy);
    }

    swapper.SWAP196(primary, swapCollection);
    swapper.DEPOSITMATICMAX687(user, dstToken);
    swapper.DESTROY646(user);

    emit MATICSWAPPERFORMED188(user, srcToken, dstToken, uniqueId);
  }

  function PERFORMTRANSFER795(	//inject NONSTANDARD NAMING
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public ONLYADMIN802() {
    Swapper swapper = CREATECLONE717(user, token, token, uniqueId);
    TAKECOMMISSION382(swapper, token, commission);
    swapper.CLAIM203(user, token);
    swapper.DESTROY646(user);

    emit TRANSFERPERFORMED665(user, token, uniqueId);
  }

  function MATICTRANSFER138(	//inject NONSTANDARD NAMING
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public ONLYADMIN802() {
    Swapper swapper = CREATECLONE717(user, token, token, uniqueId);
    TAKECOMMISSION382(swapper, token, commission);
    swapper.DEPOSITMATICMAX687(user, token);
    swapper.DESTROY646(user);

    emit MATICTRANSFERPERFORMED383(user, token, uniqueId);
  }

  function TAKECOMMISSION382(	//inject NONSTANDARD NAMING
    Swapper swapper,
    address token,
    Commission[] memory commission
  ) internal ONLYADMIN802() {
    CHECKCOMMISSION244(swapper, token, commission);
    for (uint i = 0; i < commission.length; i++) {
      require(swapper.GETBALANCE944(token) > commission[i].amount, 'Swapper balance not enough for commission');
      swapper.CLAIM203(commission[i].destination, token, commission[i].amount);
    }
  }

  function CHECKCOMMISSION244(	//inject NONSTANDARD NAMING
    Swapper swapper,
    address token,
    Commission[] memory commission
  ) internal view ONLYADMIN802() {
    uint _totalBal = swapper.GETBALANCE944(token);
    uint _commissionAmt;
    if(_totalBal == 0) return;
    for (uint i = 0; i < commission.length; i++) {
      _commissionAmt += commission[i].amount;
    }
    uint _maxCommissionAmt = WMUL85(_totalBal, maxCommission);
    require(_maxCommissionAmt >= _commissionAmt, "Over commission");
  }

  function CLAIMBALANCE526(	//inject NONSTANDARD NAMING
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    address token
  ) public ONLYADMIN802() {
    Swapper swapper = CREATECLONE717(user, srcToken, dstToken, uniqueId);
    swapper.CLAIM203(user, token);
    swapper.DESTROY646(user);
  }

  function CREATECLONE717(	//inject NONSTANDARD NAMING
    address user,
    address srcToken,
    address dstToken,
    string memory uniqueId
  ) private ONLYADMIN802() returns (Swapper) {
    bytes32 salt = COMPUTECLONESALT469(user, srcToken, dstToken, uniqueId);
    bytes memory bytecode = GETCLONEBYTECODE398();

    address payable cloneAddress = COMPUTEADDRESS46(salt);
    if (!ISCONTRACT560(cloneAddress)) {
      assembly {
        cloneAddress := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
      }
    }

    return Swapper(cloneAddress);
  }

  function GETCLONEBYTECODE398() public view returns (bytes memory) {	//inject NONSTANDARD NAMING
    bytes20 targetBytes = bytes20(swapperLibrary);

    bytes memory bytecode = new bytes(0x37);
    assembly {
      mstore(add(bytecode, 0x20), 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
      mstore(add(bytecode, 0x34), targetBytes)
      mstore(add(bytecode, 0x48), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
    }

    return bytecode;
  }

  function ISCONTRACT560(address _address) public view returns (bool) {	//inject NONSTANDARD NAMING
    uint32 size;
    assembly {
      size := extcodesize(_address)
    }
    return (size > 0);
  }

  function COMPUTECLONESALT469(address user, address srcToken, address dstToken, string memory uniqueId) public pure returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked(user, srcToken, dstToken, uniqueId));
  }

  function COMPUTEADDRESS46(bytes32 salt) public view returns (address payable) {	//inject NONSTANDARD NAMING
    bytes32 data = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(GETCLONEBYTECODE398())));
    return address(bytes20(data << 96));
  }
}