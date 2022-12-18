                                                                 

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;

contract TotlePrimary {
  function PERFORMSWAPCOLLECTION60(	//inject NONSTANDARD NAMING
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
    uint constant wad644 = 10 ** 18;	//inject NONSTANDARD NAMING

    function ADD927(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x, "math-not-safe");
    }

    function SUB706(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }

    function MUL208(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }

    function WMUL239(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD927(MUL208(x, y), wad644 / 2) / wad644;
    }

    function WDIV648(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD927(MUL208(x, wad644), y / 2) / y;
    }
}

                                                                                        
contract ERC20 {
  event TRANSFER932(	//inject NONSTANDARD NAMING
    address indexed from,
    address indexed to,
    uint256 value
  );

  event APPROVAL238(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );

  function TOTALSUPPLY79() public view returns (uint256);	//inject NONSTANDARD NAMING

  function BALANCEOF247(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING

  function ALLOWANCE656(address _owner, address _spender) public view returns (uint256);	//inject NONSTANDARD NAMING

  function TRANSFER332(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

  function APPROVE163(address _spender, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

  function TRANSFERFROM65(address _from, address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

  function DECIMALS635() public view returns (uint256);	//inject NONSTANDARD NAMING

  //For WETH
  function DEPOSIT68() external payable;	//inject NONSTANDARD NAMING
  function WITHDRAW837(uint) external;	//inject NONSTANDARD NAMING
}

interface DepositManagerInterface {
  function DEPOSITERC20FORUSER707(address _token, address _user, uint256 _amount) external;	//inject NONSTANDARD NAMING
  function DEPOSITETHERFORUSER253(address _user) external payable;	//inject NONSTANDARD NAMING
}

interface RegistryInterface {
  function ROOTTOCHILDTOKEN134(address rootToken) external returns (address childToken);	//inject NONSTANDARD NAMING
  function GETWETHTOKENADDRESS44() external view returns (address);	//inject NONSTANDARD NAMING
  function GETDEPOSITMANAGERADDRESS168() external view returns (address);	//inject NONSTANDARD NAMING
}

contract Swapper {
  address public constant maticregistry422 = 0x56B082d0a590A7ce5d170402D6f7f88B58F71988;	//inject NONSTANDARD NAMING

  function SWAP787(	//inject NONSTANDARD NAMING
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection calldata swapCollection
  ) external {
    primary.PERFORMSWAPCOLLECTION60.value(address(this).balance)(swapCollection);
  }

  function FETCHRETURNDATA354() internal pure returns (bool success) {	//inject NONSTANDARD NAMING
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

  function GETBALANCE760(address token) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return token == address(0)
      ? address(this).balance
      : ERC20(token).BALANCEOF247(address(this));
  }

  function CLAIM906(address payable user, address token) public {	//inject NONSTANDARD NAMING
    CLAIM906(user, token, GETBALANCE760(token));
  }

  function CLAIM906(address payable user, address token, uint amount) public {	//inject NONSTANDARD NAMING
    require(amount > 0, 'Claim amount must be positive');

    uint balance = GETBALANCE760(token);
    if (balance < amount) {
      amount = balance;
    }

    if (token == address(0)) {
      user.transfer(amount);
    } else {
      SAFETRANSFER174(token, user, amount);
    }
  }

  function DEPOSITMATICMAX351(address payable user, address token) public {	//inject NONSTANDARD NAMING
    DEPOSITMATIC361(user, token, GETBALANCE760(token));
  }

  function DEPOSITMATIC361(address payable user, address token, uint amount) public {	//inject NONSTANDARD NAMING
    require(amount > 0, 'Deposit amount must be positive');
    RegistryInterface maticRegistryContract = RegistryInterface(maticregistry422);

    uint balance = GETBALANCE760(token);
    uint _amount = balance < amount ? balance : amount;
    address _token = token == address(0) ? maticRegistryContract.GETWETHTOKENADDRESS44() : token;
    address childToken = maticRegistryContract.ROOTTOCHILDTOKEN134(_token);
    require(childToken != address(0), "Child token not registered");

    address maticDepositManager = maticRegistryContract.GETDEPOSITMANAGERADDRESS168();
    if (token == address(0)) {
      ERC20(_token).DEPOSIT68.value(_amount)();
      APPROVE163(_token, maticDepositManager);
      DepositManagerInterface(maticDepositManager).DEPOSITERC20FORUSER707(_token, user, _amount);
    } else {
      APPROVE163(_token, maticDepositManager);
      DepositManagerInterface(maticDepositManager).DEPOSITERC20FORUSER707(_token, user, _amount);
    }
  }

  function SAFETRANSFER174(address _tokenAddress, address _to, uint256 _value) internal returns (bool success) {	//inject NONSTANDARD NAMING
    (success,) = _tokenAddress.call(abi.encodeWithSignature("transfer(address,uint256)", _to, _value));
    require(success, "Transfer failed");

    return FETCHRETURNDATA354();
  }

  function APPROVE163(address token, address spender) public {	//inject NONSTANDARD NAMING
    SAFEAPPROVE562(token, spender, GETBALANCE760(token));
  }

  function SAFEAPPROVE562(address _tokenAddress, address _spender, uint256 _value) internal returns (bool success) {	//inject NONSTANDARD NAMING
    (success,) = _tokenAddress.call(abi.encodeWithSignature("approve(address,uint256)", _spender, _value));
    require(success, "Approve failed");

    return FETCHRETURNDATA354();
  }

  function DESTROY266(address payable user) external {	//inject NONSTANDARD NAMING
    selfdestruct(user);
  }

  function() external payable {

  }
}

contract SwapperFactory is DSMath {
  address public admin;
  address public swapperLibrary;
  uint public maxCommission;

  event SWAPPERFORMED424(	//inject NONSTANDARD NAMING
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

  event MATICSWAPPERFORMED563(	//inject NONSTANDARD NAMING
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

  event TRANSFERPERFORMED756(	//inject NONSTANDARD NAMING
    address indexed user,
    address token,
    string uniqueId
  );

  event MATICTRANSFERPERFORMED656(	//inject NONSTANDARD NAMING
    address indexed user,
    address token,
    string uniqueId
  );

  modifier ONLYADMIN202() {	//inject NONSTANDARD NAMING
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

  function PERFORMSWAP369(	//inject NONSTANDARD NAMING
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public ONLYADMIN202() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');
    require(swapCollection.swaps[0].redirectAddress == user, 'User address does not match swap redirect address');

    Swapper swapper = CREATECLONE247(user, srcToken, dstToken, uniqueId);
    TAKECOMMISSION264(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.GETBALANCE760(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.APPROVE163(srcToken, tokenTransferProxy);
    }

    swapper.SWAP787(primary, swapCollection);
    swapper.DESTROY266(user);

    emit SWAPPERFORMED424(user, srcToken, dstToken, uniqueId);
  }

  function MATICSWAP633(	//inject NONSTANDARD NAMING
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public ONLYADMIN202() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');

    Swapper swapper = CREATECLONE247(user, srcToken, dstToken, uniqueId);
    require(
      swapCollection.swaps[0].redirectAddress == user ||
      swapCollection.swaps[0].redirectAddress == address(swapper),
      'User address does not match swap redirect address');
    TAKECOMMISSION264(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.GETBALANCE760(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.APPROVE163(srcToken, tokenTransferProxy);
    }

    swapper.SWAP787(primary, swapCollection);
    swapper.DEPOSITMATICMAX351(user, dstToken);
    swapper.DESTROY266(user);

    emit MATICSWAPPERFORMED563(user, srcToken, dstToken, uniqueId);
  }

  function PERFORMTRANSFER248(	//inject NONSTANDARD NAMING
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public ONLYADMIN202() {
    Swapper swapper = CREATECLONE247(user, token, token, uniqueId);
    TAKECOMMISSION264(swapper, token, commission);
    swapper.CLAIM906(user, token);
    swapper.DESTROY266(user);

    emit TRANSFERPERFORMED756(user, token, uniqueId);
  }

  function MATICTRANSFER260(	//inject NONSTANDARD NAMING
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public ONLYADMIN202() {
    Swapper swapper = CREATECLONE247(user, token, token, uniqueId);
    TAKECOMMISSION264(swapper, token, commission);
    swapper.DEPOSITMATICMAX351(user, token);
    swapper.DESTROY266(user);

    emit MATICTRANSFERPERFORMED656(user, token, uniqueId);
  }

  function TAKECOMMISSION264(	//inject NONSTANDARD NAMING
    Swapper swapper,
    address token,
    Commission[] memory commission
  ) internal ONLYADMIN202() {
    CHECKCOMMISSION523(swapper, token, commission);
    for (uint i = 0; i < commission.length; i++) {
      require(swapper.GETBALANCE760(token) > commission[i].amount, 'Swapper balance not enough for commission');
      swapper.CLAIM906(commission[i].destination, token, commission[i].amount);
    }
  }

  function CHECKCOMMISSION523(	//inject NONSTANDARD NAMING
    Swapper swapper,
    address token,
    Commission[] memory commission
  ) internal view ONLYADMIN202() {
    uint _totalBal = swapper.GETBALANCE760(token);
    uint _commissionAmt;
    if(_totalBal == 0) return;
    for (uint i = 0; i < commission.length; i++) {
      _commissionAmt += commission[i].amount;
    }
    uint _maxCommissionAmt = WMUL239(_totalBal, maxCommission);
    require(_maxCommissionAmt >= _commissionAmt, "Over commission");
  }

  function CLAIMBALANCE109(	//inject NONSTANDARD NAMING
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    address token
  ) public ONLYADMIN202() {
    Swapper swapper = CREATECLONE247(user, srcToken, dstToken, uniqueId);
    swapper.CLAIM906(user, token);
    swapper.DESTROY266(user);
  }

  function CREATECLONE247(	//inject NONSTANDARD NAMING
    address user,
    address srcToken,
    address dstToken,
    string memory uniqueId
  ) private ONLYADMIN202() returns (Swapper) {
    bytes32 salt = COMPUTECLONESALT992(user, srcToken, dstToken, uniqueId);
    bytes memory bytecode = GETCLONEBYTECODE80();

    address payable cloneAddress = COMPUTEADDRESS707(salt);
    if (!ISCONTRACT586(cloneAddress)) {
      assembly {
        cloneAddress := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
      }
    }

    return Swapper(cloneAddress);
  }

  function GETCLONEBYTECODE80() public view returns (bytes memory) {	//inject NONSTANDARD NAMING
    bytes20 targetBytes = bytes20(swapperLibrary);

    bytes memory bytecode = new bytes(0x37);
    assembly {
      mstore(add(bytecode, 0x20), 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
      mstore(add(bytecode, 0x34), targetBytes)
      mstore(add(bytecode, 0x48), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
    }

    return bytecode;
  }

  function ISCONTRACT586(address _address) public view returns (bool) {	//inject NONSTANDARD NAMING
    uint32 size;
    assembly {
      size := extcodesize(_address)
    }
    return (size > 0);
  }

  function COMPUTECLONESALT992(address user, address srcToken, address dstToken, string memory uniqueId) public pure returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked(user, srcToken, dstToken, uniqueId));
  }

  function COMPUTEADDRESS707(bytes32 salt) public view returns (address payable) {	//inject NONSTANDARD NAMING
    bytes32 data = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(GETCLONEBYTECODE80())));
    return address(bytes20(data << 96));
  }
}