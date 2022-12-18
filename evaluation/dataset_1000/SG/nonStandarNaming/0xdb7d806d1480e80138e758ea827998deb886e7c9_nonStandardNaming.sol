                                                                 

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;

contract TotlePrimary {
  function PERFORMSWAPCOLLECTION754(	//inject NONSTANDARD NAMING
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
    uint constant wad26 = 10 ** 18;	//inject NONSTANDARD NAMING

    function ADD786(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x, "math-not-safe");
    }

    function SUB725(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x, "ds-math-sub-underflow");
    }

    function MUL818(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x, "math-not-safe");
    }

    function WMUL256(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD786(MUL818(x, y), wad26 / 2) / wad26;
    }

    function WDIV937(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD786(MUL818(x, wad26), y / 2) / y;
    }
}

                                                                                        
contract ERC20 {
  event TRANSFER178(	//inject NONSTANDARD NAMING
    address indexed from,
    address indexed to,
    uint256 value
  );

  event APPROVAL46(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );

  function TOTALSUPPLY105() public view returns (uint256);	//inject NONSTANDARD NAMING

  function BALANCEOF530(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING

  function ALLOWANCE304(address _owner, address _spender) public view returns (uint256);	//inject NONSTANDARD NAMING

  function TRANSFER783(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

  function APPROVE54(address _spender, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

  function TRANSFERFROM251(address _from, address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING

  function DECIMALS210() public view returns (uint256);	//inject NONSTANDARD NAMING

  //For WETH
  function DEPOSIT854() external payable;	//inject NONSTANDARD NAMING
  function WITHDRAW904(uint) external;	//inject NONSTANDARD NAMING
}

interface DepositManagerInterface {
  function DEPOSITERC20FORUSER530(address _token, address _user, uint256 _amount) external;	//inject NONSTANDARD NAMING
  function DEPOSITETHERFORUSER440(address _user) external payable;	//inject NONSTANDARD NAMING
}

interface RegistryInterface {
  function ROOTTOCHILDTOKEN706(address rootToken) external returns (address childToken);	//inject NONSTANDARD NAMING
  function GETWETHTOKENADDRESS502() external view returns (address);	//inject NONSTANDARD NAMING
  function GETDEPOSITMANAGERADDRESS533() external view returns (address);	//inject NONSTANDARD NAMING
}

contract Swapper {
  address public constant maticregistry33 = 0x33a02E6cC863D393d6Bf231B697b82F6e499cA71;	//inject NONSTANDARD NAMING

  function SWAP251(	//inject NONSTANDARD NAMING
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection calldata swapCollection
  ) external {
    primary.PERFORMSWAPCOLLECTION754.value(address(this).balance)(swapCollection);
  }

  function FETCHRETURNDATA252() internal pure returns (bool success) {	//inject NONSTANDARD NAMING
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

  function GETBALANCE692(address token) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return token == address(0)
      ? address(this).balance
      : ERC20(token).BALANCEOF530(address(this));
  }

  function CLAIM564(address payable user, address token) public {	//inject NONSTANDARD NAMING
    CLAIM564(user, token, GETBALANCE692(token));
  }

  function CLAIM564(address payable user, address token, uint amount) public {	//inject NONSTANDARD NAMING
    require(amount > 0, 'Claim amount must be positive');

    uint balance = GETBALANCE692(token);
    if (balance < amount) {
      amount = balance;
    }

    if (token == address(0)) {
      user.transfer(amount);
    } else {
      SAFETRANSFER575(token, user, amount);
    }
  }

  function DEPOSITMATICMAX853(address payable user, address token) public {	//inject NONSTANDARD NAMING
    DEPOSITMATIC789(user, token, GETBALANCE692(token));
  }

  function DEPOSITMATIC789(address payable user, address token, uint amount) public {	//inject NONSTANDARD NAMING
    require(amount > 0, 'Deposit amount must be positive');
    RegistryInterface maticRegistryContract = RegistryInterface(maticregistry33);

    uint balance = GETBALANCE692(token);
    uint _amount = balance < amount ? balance : amount;
    address _token = token == address(0) ? maticRegistryContract.GETWETHTOKENADDRESS502() : token;
    address childToken = maticRegistryContract.ROOTTOCHILDTOKEN706(_token);
    require(childToken != address(0), "Child token not registered");

    address maticDepositManager = maticRegistryContract.GETDEPOSITMANAGERADDRESS533();
    if (token == address(0)) {
      ERC20(_token).DEPOSIT854.value(_amount)();
      APPROVE54(_token, maticDepositManager);
      DepositManagerInterface(maticDepositManager).DEPOSITERC20FORUSER530(_token, user, _amount);
    } else {
      APPROVE54(_token, maticDepositManager);
      DepositManagerInterface(maticDepositManager).DEPOSITERC20FORUSER530(_token, user, _amount);
    }
  }

  function SAFETRANSFER575(address _tokenAddress, address _to, uint256 _value) internal returns (bool success) {	//inject NONSTANDARD NAMING
    (success,) = _tokenAddress.call(abi.encodeWithSignature("transfer(address,uint256)", _to, _value));
    require(success, "Transfer failed");

    return FETCHRETURNDATA252();
  }

  function APPROVE54(address token, address spender) public {	//inject NONSTANDARD NAMING
    SAFEAPPROVE65(token, spender, GETBALANCE692(token));
  }

  function SAFEAPPROVE65(address _tokenAddress, address _spender, uint256 _value) internal returns (bool success) {	//inject NONSTANDARD NAMING
    (success,) = _tokenAddress.call(abi.encodeWithSignature("approve(address,uint256)", _spender, _value));
    require(success, "Approve failed");

    return FETCHRETURNDATA252();
  }

  function DESTROY582(address payable user) external {	//inject NONSTANDARD NAMING
    selfdestruct(user);
  }

  function() external payable {

  }
}


contract SwapperFactory is DSMath {
  address public admin;
  address public swapperLibrary;
  uint public maxCommission;

  event SWAPPERFORMED553(	//inject NONSTANDARD NAMING
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

  event MATICSWAPPERFORMED855(	//inject NONSTANDARD NAMING
    address indexed user,
    address srcToken,
    address dstToken,
    string uniqueId
  );

  event TRANSFERPERFORMED595(	//inject NONSTANDARD NAMING
    address indexed user,
    address token,
    string uniqueId
  );

  event MATICTRANSFERPERFORMED588(	//inject NONSTANDARD NAMING
    address indexed user,
    address token,
    string uniqueId
  );

  modifier ONLYADMIN432() {	//inject NONSTANDARD NAMING
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

  function PERFORMSWAP565(	//inject NONSTANDARD NAMING
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public ONLYADMIN432() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');
    require(swapCollection.swaps[0].redirectAddress == user, 'User address does not match swap redirect address');

    Swapper swapper = CREATECLONE472(user, srcToken, dstToken, uniqueId);
    TAKECOMMISSION218(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.GETBALANCE692(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.APPROVE54(srcToken, tokenTransferProxy);
    }

    swapper.SWAP251(primary, swapCollection);
    swapper.DESTROY582(user);

    emit SWAPPERFORMED553(user, srcToken, dstToken, uniqueId);
  }

  function MATICSWAP968(	//inject NONSTANDARD NAMING
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    Commission[] memory commission,
    TotlePrimary primary,
    TotlePrimaryUtils.SwapCollection memory swapCollection
  ) public ONLYADMIN432() {
    require(swapCollection.swaps.length == 1, 'Must only be 1 swap');
    require(swapCollection.swaps[0].trades[0].sourceToken == srcToken, 'Incorrect source token for swap');

    Swapper swapper = CREATECLONE472(user, srcToken, dstToken, uniqueId);
    require(
      swapCollection.swaps[0].redirectAddress == user ||
      swapCollection.swaps[0].redirectAddress == address(swapper),
      'User address does not match swap redirect address');
    TAKECOMMISSION218(swapper, srcToken, commission);

    require(swapCollection.swaps[0].sourceAmount == swapper.GETBALANCE692(srcToken), 'Token balance does not match swap amount');

    if (srcToken != address(0)) {
      address tokenTransferProxy = 0x74758AcFcE059f503a7E6B0fC2c8737600f9F2c4;
      swapper.APPROVE54(srcToken, tokenTransferProxy);
    }

    swapper.SWAP251(primary, swapCollection);
    swapper.DEPOSITMATICMAX853(user, dstToken);
    swapper.DESTROY582(user);

    emit MATICSWAPPERFORMED855(user, srcToken, dstToken, uniqueId);
  }

  function PERFORMTRANSFER838(	//inject NONSTANDARD NAMING
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public ONLYADMIN432() {
    Swapper swapper = CREATECLONE472(user, token, token, uniqueId);
    TAKECOMMISSION218(swapper, token, commission);
    swapper.CLAIM564(user, token);
    swapper.DESTROY582(user);

    emit TRANSFERPERFORMED595(user, token, uniqueId);
  }

  function MATICTRANSFER653(	//inject NONSTANDARD NAMING
    address payable user,
    address token,
    string memory uniqueId,
    Commission[] memory commission
  ) public ONLYADMIN432() {
    Swapper swapper = CREATECLONE472(user, token, token, uniqueId);
    TAKECOMMISSION218(swapper, token, commission);
    swapper.DEPOSITMATICMAX853(user, token);
    swapper.DESTROY582(user);

    emit MATICTRANSFERPERFORMED588(user, token, uniqueId);
  }

  function TAKECOMMISSION218(	//inject NONSTANDARD NAMING
    Swapper swapper,
    address token,
    Commission[] memory commission
  ) internal ONLYADMIN432() {
    CHECKCOMMISSION515(swapper, token, commission);
    for (uint i = 0; i < commission.length; i++) {
      require(swapper.GETBALANCE692(token) > commission[i].amount, 'Swapper balance not enough for commission');
      swapper.CLAIM564(commission[i].destination, token, commission[i].amount);
    }
  }

  function CHECKCOMMISSION515(	//inject NONSTANDARD NAMING
    Swapper swapper,
    address token,
    Commission[] memory commission
  ) internal view ONLYADMIN432() {
    uint _totalBal = swapper.GETBALANCE692(token);
    uint _commissionAmt;
    if(_totalBal == 0) return;
    for (uint i = 0; i < commission.length; i++) {
      _commissionAmt += commission[i].amount;
    }
    uint _maxCommissionAmt = WMUL256(_totalBal, maxCommission);
    require(_maxCommissionAmt >= _commissionAmt, "Over commission");
  }

  function CLAIMBALANCE634(	//inject NONSTANDARD NAMING
    address payable user,
    address srcToken,
    address dstToken,
    string memory uniqueId,
    address token
  ) public ONLYADMIN432() {
    Swapper swapper = CREATECLONE472(user, srcToken, dstToken, uniqueId);
    swapper.CLAIM564(user, token);
    swapper.DESTROY582(user);
  }

  function CREATECLONE472(	//inject NONSTANDARD NAMING
    address user,
    address srcToken,
    address dstToken,
    string memory uniqueId
  ) private ONLYADMIN432() returns (Swapper) {
    bytes32 salt = COMPUTECLONESALT991(user, srcToken, dstToken, uniqueId);
    bytes memory bytecode = GETCLONEBYTECODE837();

    address payable cloneAddress = COMPUTEADDRESS66(salt);
    if (!ISCONTRACT759(cloneAddress)) {
      assembly {
        cloneAddress := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
      }
    }

    return Swapper(cloneAddress);
  }

  function GETCLONEBYTECODE837() public view returns (bytes memory) {	//inject NONSTANDARD NAMING
    bytes20 targetBytes = bytes20(swapperLibrary);

    bytes memory bytecode = new bytes(0x37);
    assembly {
      mstore(add(bytecode, 0x20), 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
      mstore(add(bytecode, 0x34), targetBytes)
      mstore(add(bytecode, 0x48), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
    }

    return bytecode;
  }

  function ISCONTRACT759(address _address) public view returns (bool) {	//inject NONSTANDARD NAMING
    uint32 size;
    assembly {
      size := extcodesize(_address)
    }
    return (size > 0);
  }

  function COMPUTECLONESALT991(address user, address srcToken, address dstToken, string memory uniqueId) public pure returns (bytes32) {	//inject NONSTANDARD NAMING
    return keccak256(abi.encodePacked(user, srcToken, dstToken, uniqueId));
  }

  function COMPUTEADDRESS66(bytes32 salt) public view returns (address payable) {	//inject NONSTANDARD NAMING
    bytes32 data = keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(GETCLONEBYTECODE837())));
    return address(bytes20(data << 96));
  }
}