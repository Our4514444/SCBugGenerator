                                                                 

pragma solidity 0.5.17;
pragma experimental ABIEncoderV2;


interface IUniswap {
  
  function SWAPEXACTTOKENSFORETH119(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline) external returns (uint[] memory amounts);	//inject NONSTANDARD NAMING
  
  function SWAPEXACTETHFORTOKENS184(uint amountOutMin, address[] calldata path, address to, uint deadline) external payable returns (uint[] memory amounts);	//inject NONSTANDARD NAMING
}

interface IYeldDAI {
  function YDAIADDRESS289() external view returns(address);	//inject NONSTANDARD NAMING
  function INITIALPRICE811() external view returns(uint256);	//inject NONSTANDARD NAMING
  function FROMYELDDAITOYELD399() external view returns(uint256);	//inject NONSTANDARD NAMING
  function FROMDAITOYELDDAIPRICE651() external view returns(uint256);	//inject NONSTANDARD NAMING
  function YELDREWARD956() external view returns(uint256);	//inject NONSTANDARD NAMING
  function YELDDAIDECIMALS482() external view returns(uint256);	//inject NONSTANDARD NAMING
  function MINT38(address _to, uint256 _amount) external;	//inject NONSTANDARD NAMING
  function BURN645(address _to, uint256 _amount) external;	//inject NONSTANDARD NAMING
  function BALANCEOF49(address _of) external view returns(uint256);	//inject NONSTANDARD NAMING
	function CHECKIFPRICENEEDSUPDATING209() external view returns(bool);	//inject NONSTANDARD NAMING
	function UPDATEPRICE594() external;	//inject NONSTANDARD NAMING
}

interface IYeldTUSD {
  function YTUSDADDRESS47() external view returns(address);	//inject NONSTANDARD NAMING
  function INITIALPRICE811() external view returns(uint256);	//inject NONSTANDARD NAMING
  function FROMYELDTUSDTOYELD501() external view returns(uint256);	//inject NONSTANDARD NAMING
  function FROMTUSDTOYELDTUSDPRICE479() external view returns(uint256);	//inject NONSTANDARD NAMING
  function YELDREWARD956() external view returns(uint256);	//inject NONSTANDARD NAMING
  function YELDTUSDDECIMALS524() external view returns(uint256);	//inject NONSTANDARD NAMING
  function MINT38(address _to, uint256 _amount) external;	//inject NONSTANDARD NAMING
  function BURN645(address _to, uint256 _amount) external;	//inject NONSTANDARD NAMING
  function BALANCEOF49(address _of) external view returns(uint256);	//inject NONSTANDARD NAMING
	function CHECKIFPRICENEEDSUPDATING209() external view returns(bool);	//inject NONSTANDARD NAMING
	function UPDATEPRICE594() external;	//inject NONSTANDARD NAMING
}

interface IYeldUSDT {
  function YUSDTADDRESS802() external view returns(address);	//inject NONSTANDARD NAMING
  function INITIALPRICE811() external view returns(uint256);	//inject NONSTANDARD NAMING
  function FROMYELDUSDTTOYELD653() external view returns(uint256);	//inject NONSTANDARD NAMING
  function FROMUSDTTOYELDUSDTPRICE217() external view returns(uint256);	//inject NONSTANDARD NAMING
  function YELDREWARD956() external view returns(uint256);	//inject NONSTANDARD NAMING
  function YELDUSDTDECIMALS762() external view returns(uint256);	//inject NONSTANDARD NAMING
  function MINT38(address _to, uint256 _amount) external;	//inject NONSTANDARD NAMING
  function BURN645(address _to, uint256 _amount) external;	//inject NONSTANDARD NAMING
  function BALANCEOF49(address _of) external view returns(uint256);	//inject NONSTANDARD NAMING
	function CHECKIFPRICENEEDSUPDATING209() external view returns(bool);	//inject NONSTANDARD NAMING
	function UPDATEPRICE594() external;	//inject NONSTANDARD NAMING
}

interface IYeldUSDC {
  function YUSDCADDRESS907() external view returns(address);	//inject NONSTANDARD NAMING
  function INITIALPRICE811() external view returns(uint256);	//inject NONSTANDARD NAMING
  function FROMYELDUSDCTOYELD470() external view returns(uint256);	//inject NONSTANDARD NAMING
  function FROMUSDCTOYELDUSDCPRICE650() external view returns(uint256);	//inject NONSTANDARD NAMING
  function YELDREWARD956() external view returns(uint256);	//inject NONSTANDARD NAMING
  function YELDUSDCDECIMALS518() external view returns(uint256);	//inject NONSTANDARD NAMING
  function MINT38(address _to, uint256 _amount) external;	//inject NONSTANDARD NAMING
  function BURN645(address _to, uint256 _amount) external;	//inject NONSTANDARD NAMING
  function BALANCEOF49(address _of) external view returns(uint256);	//inject NONSTANDARD NAMING
	function CHECKIFPRICENEEDSUPDATING209() external view returns(bool);	//inject NONSTANDARD NAMING
	function UPDATEPRICE594() external;	//inject NONSTANDARD NAMING
}

interface IERC20 {
    function TOTALSUPPLY189() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF49(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER531(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE592(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE748(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM580(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER940(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL201(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    

    function _MSGSENDER676() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA901() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; 
        return msg.data;
    }
}

contract Ownable is Context {
    address payable private _owner;

    event OWNERSHIPTRANSFERRED491(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    constructor () internal {
        _owner = _MSGSENDER676();
        emit OWNERSHIPTRANSFERRED491(address(0), _owner);
    }
    function OWNER861() public view returns (address payable) {	//inject NONSTANDARD NAMING
        return _owner;
    }
    modifier ONLYOWNER718() {	//inject NONSTANDARD NAMING
        require(ISOWNER291(), "Ownable: caller is not the owner");
        _;
    }
    function ISOWNER291() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER676() == _owner;
    }
    function RENOUNCEOWNERSHIP724() public ONLYOWNER718 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED491(_owner, address(0));
        _owner = address(0);
    }
    function TRANSFEROWNERSHIP229(address payable newOwner) public ONLYOWNER718 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP233(newOwner);
    }
    function _TRANSFEROWNERSHIP233(address payable newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED491(_owner, newOwner);
        _owner = newOwner;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 _totalSupply;
    function TOTALSUPPLY189() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF49(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER531(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER745(_MSGSENDER676(), recipient, amount);
        return true;
    }
    function ALLOWANCE592(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE748(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE1(_MSGSENDER676(), spender, amount);
        return true;
    }
    function TRANSFERFROM580(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER745(sender, recipient, amount);
        _APPROVE1(sender, _MSGSENDER676(), _allowances[sender][_MSGSENDER676()].SUB294(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE831(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE1(_MSGSENDER676(), spender, _allowances[_MSGSENDER676()][spender].ADD511(addedValue));
        return true;
    }
    function DECREASEALLOWANCE479(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE1(_MSGSENDER676(), spender, _allowances[_MSGSENDER676()][spender].SUB294(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER745(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB294(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD511(amount);
        emit TRANSFER940(sender, recipient, amount);
    }
    function _MINT607(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD511(amount);
        _balances[account] = _balances[account].ADD511(amount);
        emit TRANSFER940(address(0), account, amount);
    }
    function _BURN22(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB294(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB294(amount);
        emit TRANSFER940(account, address(0), amount);
    }
    function _APPROVE1(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL201(owner, spender, amount);
    }
    function _BURNFROM277(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN22(account, amount);
        _APPROVE1(account, _MSGSENDER676(), _allowances[account][_MSGSENDER676()].SUB294(amount, "ERC20: burn amount exceeds allowance"));
    }
}

contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
    function NAME969() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL567() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS241() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

contract ReentrancyGuard {
    uint256 private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
    }

    modifier NONREENTRANT4() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
}

library SafeMath {
    function ADD511(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB294(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB294(a, b, "SafeMath: subtraction overflow");
    }
    function SUB294(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL360(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV972(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV972(a, b, "SafeMath: division by zero");
    }
    function DIV972(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD207(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD207(a, b, "SafeMath: modulo by zero");
    }
    function MOD207(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT459(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE76(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE543(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER946(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN889(token, abi.encodeWithSelector(token.TRANSFER531.selector, to, value));
    }

    function SAFETRANSFERFROM606(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN889(token, abi.encodeWithSelector(token.TRANSFERFROM580.selector, from, to, value));
    }

    function SAFEAPPROVE104(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE592(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN889(token, abi.encodeWithSelector(token.APPROVE748.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE206(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE592(address(this), spender).ADD511(value);
        CALLOPTIONALRETURN889(token, abi.encodeWithSelector(token.APPROVE748.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE986(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE592(address(this), spender).SUB294(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN889(token, abi.encodeWithSelector(token.APPROVE748.selector, spender, newAllowance));
    }
    function CALLOPTIONALRETURN889(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT459(), "SafeERC20: call to non-contract");

        
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { 
            
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface Compound {
    function MINT38 ( uint256 mintAmount ) external returns ( uint256 );	//inject NONSTANDARD NAMING
    function REDEEM433(uint256 redeemTokens) external returns (uint256);	//inject NONSTANDARD NAMING
    function EXCHANGERATESTORED62() external view returns (uint);	//inject NONSTANDARD NAMING
}

interface Fulcrum {
    function MINT38(address receiver, uint256 amount) external payable returns (uint256 mintAmount);	//inject NONSTANDARD NAMING
    function BURN645(address receiver, uint256 burnAmount) external returns (uint256 loanAmountPaid);	//inject NONSTANDARD NAMING
    function ASSETBALANCEOF76(address _owner) external view returns (uint256 balance);	//inject NONSTANDARD NAMING
}

interface ILendingPoolAddressesProvider {
    function GETLENDINGPOOL653() external view returns (address);	//inject NONSTANDARD NAMING
}

interface Aave {
    function DEPOSIT442(address _reserve, uint256 _amount, uint16 _referralCode) external;	//inject NONSTANDARD NAMING
}

interface AToken {
    function REDEEM433(uint256 amount) external;	//inject NONSTANDARD NAMING
}

interface IIEarnManager {
    function RECOMMEND250(address _token) external view returns (	//inject NONSTANDARD NAMING
      string memory choice,
      uint256 capr,
      uint256 iapr,
      uint256 aapr,
      uint256 dapr
    );
}

contract Structs {
    struct Val {
        uint256 value;
    }

    enum ActionType {
        Deposit,   
        Withdraw  
    }

    enum AssetDenomination {
        Wei 
    }

    enum AssetReference {
        Delta 
    }

    struct AssetAmount {
        bool sign; 
        AssetDenomination denomination;
        AssetReference ref;
        uint256 value;
    }

    struct ActionArgs {
        ActionType actionType;
        uint256 accountId;
        AssetAmount amount;
        uint256 primaryMarketId;
        uint256 secondaryMarketId;
        address otherAddress;
        uint256 otherAccountId;
        bytes data;
    }

    struct Info {
        address owner;  
        uint256 number; 
    }

    struct Wei {
        bool sign; 
        uint256 value;
    }
}

contract DyDx is Structs {
    function GETACCOUNTWEI353(Info memory account, uint256 marketId) public view returns (Wei memory);	//inject NONSTANDARD NAMING
    function OPERATE213(Info[] memory, ActionArgs[] memory) public;	//inject NONSTANDARD NAMING
}

interface LendingPoolAddressesProvider {
    function GETLENDINGPOOL653() external view returns (address);	//inject NONSTANDARD NAMING
    function GETLENDINGPOOLCORE553() external view returns (address);	//inject NONSTANDARD NAMING
}

contract yUSDT is ERC20, ERC20Detailed, ReentrancyGuard, Structs, Ownable {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint256;

  uint256 public pool;
  address public token;
  address public compound;
  address public fulcrum;
  address public aave;
  address public aavePool;
  address public aaveToken;
  address public dydx;
  uint256 public dToken;
  address public apr;
  address public chai;
  
  address public uniswapRouter = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
  address public usdt = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
  address public weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
  address payable public retirementYeldTreasury;
  IYeldUSDT public yeldUSDTInstance;
  IERC20 public yeldToken;
  uint256 public maximumTokensToBurn = 50000 * 1e18;

  
  
  
  mapping(address => uint256) public staked; 
  mapping(address => uint256) public deposited; 
  mapping(bytes32 => uint256) public numberOfParticipants;

  enum Lender {
      NONE,
      DYDX,
      COMPOUND,
      AAVE,
      FULCRUM
  }

  Lender public provider = Lender.NONE;

  constructor (address _yeldToken, address _yeldUSDTAddress, address payable _retirementYeldTreasury) public payable ERC20Detailed("yearn USDT", "yUSDT", 18) {
    token = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    apr = address(0xdD6d648C991f7d47454354f4Ef326b04025a48A8);
    dydx = address(0x1E0447b19BB6EcFdAe1e4AE1694b0C3659614e4e);
    aave = address(0x24a42fD28C976A61Df5D00D0599C34c4f90748c8);
    aavePool = address(0x3dfd23A6c5E8BbcFc9581d2E864a68feb6a076d3);
    fulcrum = address(0x493C57C4763932315A328269E1ADaD09653B9081);
    aaveToken = address(0xfC1E690f61EFd961294b3e1Ce3313fBD8aa4f85d);
    compound = address(0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643);
    chai = address(0x06AF07097C9Eeb7fD685c692751D5C66dB49c215);
    dToken = 3;
    yeldUSDTInstance = IYeldUSDT(_yeldUSDTAddress);
    yeldToken = IERC20(_yeldToken);
    retirementYeldTreasury = _retirementYeldTreasury;
    APPROVETOKEN590();
  }

  
  function () external payable {}

  
  function SETUNISWAPROUTER9(address _uniswapRouter) public ONLYOWNER718 {	//inject NONSTANDARD NAMING
    uniswapRouter = _uniswapRouter;
  }

  function EXTRACTTOKENSIFSTUCK616(address _token, uint256 _amount) public ONLYOWNER718 {	//inject NONSTANDARD NAMING
    IERC20(_token).TRANSFER531(msg.sender, _amount);
  }

  function EXTRACTETHIFSTUCK210() public ONLYOWNER718 {	//inject NONSTANDARD NAMING
    OWNER861().transfer(address(this).balance);
  }

  function DEPOSIT442(uint256 _amount)	//inject NONSTANDARD NAMING
      external
      NONREENTRANT4
  {
    require(_amount > 0, "deposit must be greater than 0");
    pool = CALCPOOLVALUEINTOKEN319();
    IERC20(token).SAFETRANSFERFROM606(msg.sender, address(this), _amount);

    
    uint256 userYeldBalance = yeldToken.BALANCEOF49(msg.sender);
    uint256 amountTwoPercent = _amount.MUL360(2).DIV972(100);
    require(userYeldBalance >= amountTwoPercent, 'Your YELD balance must be 2% or higher of the amount to deposit');
		if (yeldUSDTInstance.CHECKIFPRICENEEDSUPDATING209()) yeldUSDTInstance.UPDATEPRICE594();
    if (CHECKIFREDEEMABLEBALANCE543()) REDEEMYELD756();
    
    staked[msg.sender] = staked[msg.sender].ADD511(_amount);
    uint256 yeldUSDTToReceive = _amount.MUL360(yeldUSDTInstance.FROMUSDTTOYELDUSDTPRICE217()).DIV972(10 ** yeldUSDTInstance.YELDUSDTDECIMALS762());
    deposited[msg.sender] = deposited[msg.sender].ADD511(yeldUSDTToReceive);
    yeldUSDTInstance.MINT38(msg.sender, yeldUSDTToReceive);
    

    
    uint256 shares = 0;
    if (pool == 0) {
      shares = _amount;
      pool = _amount;
    } else {
      shares = (_amount.MUL360(_totalSupply)).DIV972(pool);
    }
    pool = CALCPOOLVALUEINTOKEN319();
    _MINT607(msg.sender, shares);
  }

	
	function CHECKIFREDEEMABLEBALANCE543() public view returns(bool) {	//inject NONSTANDARD NAMING
		uint256 myYeldUSDTBalance = yeldUSDTInstance.BALANCEOF49(msg.sender);
    return myYeldUSDTBalance != 0;
	}

  function REDEEMYELD756() public {	//inject NONSTANDARD NAMING
    if (yeldUSDTInstance.CHECKIFPRICENEEDSUPDATING209()) yeldUSDTInstance.UPDATEPRICE594();
    if (CHECKIFREDEEMABLEBALANCE543()) {
      uint256 myYeldUSDTBalance = yeldUSDTInstance.BALANCEOF49(msg.sender);
      uint256 yeldToRedeem = myYeldUSDTBalance.DIV972(yeldUSDTInstance.FROMYELDUSDTTOYELD653()).DIV972(10 ** yeldUSDTInstance.YELDUSDTDECIMALS762());
      yeldUSDTInstance.BURN645(msg.sender, deposited[msg.sender]);
      deposited[msg.sender] = 0;
      yeldToken.TRANSFER531(msg.sender, yeldToRedeem);
    }
  }

  
  function USDTTOETH596(uint256 _amount) internal returns(uint256) {	//inject NONSTANDARD NAMING
      IERC20(usdt).SAFEAPPROVE104(uniswapRouter, 0);
      IERC20(usdt).SAFEAPPROVE104(uniswapRouter, _amount);
      address[] memory path = new address[](2);
      path[0] = usdt;
      path[1] = weth;
      
      
      
      
      uint[] memory amounts = IUniswap(uniswapRouter).SWAPEXACTTOKENSFORETH119(_amount, uint(0), path, address(this), now.ADD511(1800));
      return amounts[1];
  }

  
  
  function BUYNBURN566(uint256 _ethToSwap) internal returns(uint256) {	//inject NONSTANDARD NAMING
    address[] memory path = new address[](2);
    path[0] = weth;
    path[1] = address(yeldToken);
    
    uint[] memory amounts = IUniswap(uniswapRouter).SWAPEXACTETHFORTOKENS184.value(_ethToSwap)(uint(0), path, address(0), now.ADD511(1800));
    return amounts[1];
  }

  
  function WITHDRAW535(uint256 _shares)	//inject NONSTANDARD NAMING
      external
      NONREENTRANT4
  {
      require(_shares > 0, "withdraw must be greater than 0");
      uint256 ibalance = BALANCEOF49(msg.sender);
      require(_shares <= ibalance, "insufficient balance");
      pool = CALCPOOLVALUEINTOKEN319();
      uint256 r = (pool.MUL360(_shares)).DIV972(_totalSupply);
      _balances[msg.sender] = _balances[msg.sender].SUB294(_shares, "redeem amount exceeds balance");
      _totalSupply = _totalSupply.SUB294(_shares);
      emit TRANSFER940(msg.sender, address(0), _shares);
      uint256 b = IERC20(token).BALANCEOF49(address(this));
      if (b < r) {
        _WITHDRAWSOME868(r.SUB294(b));
      }

      
      if (yeldUSDTInstance.CHECKIFPRICENEEDSUPDATING209()) yeldUSDTInstance.UPDATEPRICE594();
      if (CHECKIFREDEEMABLEBALANCE543()) REDEEMYELD756();
      
      
      uint256 halfProfits = (r.SUB294(staked[msg.sender])).DIV972(2);
      uint256 stakingProfits = USDTTOETH596(halfProfits);

      uint256 tokensAlreadyBurned = yeldToken.BALANCEOF49(address(0));
      if (tokensAlreadyBurned < maximumTokensToBurn) {
        
        uint256 ethToSwap = stakingProfits.MUL360(98).DIV972(100);
        
        BUYNBURN566(ethToSwap);
        
        uint256 retirementYeld = stakingProfits.MUL360(2).DIV972(100);
        
        retirementYeldTreasury.transfer(retirementYeld);
      } else {
        
        uint256 retirementYeld = stakingProfits;
        
        retirementYeldTreasury.transfer(retirementYeld);
      }
      

      IERC20(token).SAFETRANSFER946(msg.sender, r);
      pool = CALCPOOLVALUEINTOKEN319();
  }

  function RECOMMEND250() public view returns (Lender) {	//inject NONSTANDARD NAMING
    (,uint256 capr,uint256 iapr,uint256 aapr,uint256 dapr) = IIEarnManager(apr).RECOMMEND250(token);
    uint256 max = 0;
    if (capr > max) {
      max = capr;
    }
    if (iapr > max) {
      max = iapr;
    }
    if (aapr > max) {
      max = aapr;
    }
    if (dapr > max) {
      max = dapr;
    }

    Lender newProvider = Lender.NONE;
    if (max == capr) {
      newProvider = Lender.COMPOUND;
    } else if (max == iapr) {
      newProvider = Lender.FULCRUM;
    } else if (max == aapr) {
      newProvider = Lender.AAVE;
    } else if (max == dapr) {
      newProvider = Lender.DYDX;
    }
    return newProvider;
  }

  function GETAAVE716() public view returns (address) {	//inject NONSTANDARD NAMING
    return LendingPoolAddressesProvider(aave).GETLENDINGPOOL653();
  }
  function GETAAVECORE737() public view returns (address) {	//inject NONSTANDARD NAMING
    return LendingPoolAddressesProvider(aave).GETLENDINGPOOLCORE553();
  }

  function APPROVETOKEN590() public {	//inject NONSTANDARD NAMING
      IERC20(token).SAFEAPPROVE104(compound, uint(-1));
      IERC20(token).SAFEAPPROVE104(dydx, uint(-1));
      IERC20(token).SAFEAPPROVE104(GETAAVECORE737(), uint(-1));
      IERC20(token).SAFEAPPROVE104(fulcrum, uint(-1));
  }

  function BALANCE488() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return IERC20(token).BALANCEOF49(address(this));
  }
  function BALANCEDYDXAVAILABLE146() public view returns (uint256) {	//inject NONSTANDARD NAMING
      return IERC20(token).BALANCEOF49(dydx);
  }
  function BALANCEDYDX555() public view returns (uint256) {	//inject NONSTANDARD NAMING
      Wei memory bal = DyDx(dydx).GETACCOUNTWEI353(Info(address(this), 0), dToken);
      return bal.value;
  }
  function BALANCECOMPOUND433() public view returns (uint256) {	//inject NONSTANDARD NAMING
      return IERC20(compound).BALANCEOF49(address(this));
  }
  function BALANCECOMPOUNDINTOKEN283() public view returns (uint256) {	//inject NONSTANDARD NAMING
    
    uint256 b = BALANCECOMPOUND433();
    if (b > 0) {
      b = b.MUL360(Compound(compound).EXCHANGERATESTORED62()).DIV972(1e18);
    }
    return b;
  }
  function BALANCEFULCRUMAVAILABLE48() public view returns (uint256) {	//inject NONSTANDARD NAMING
      return IERC20(chai).BALANCEOF49(fulcrum);
  }
  function BALANCEFULCRUMINTOKEN412() public view returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 b = BALANCEFULCRUM129();
    if (b > 0) {
      b = Fulcrum(fulcrum).ASSETBALANCEOF76(address(this));
    }
    return b;
  }
  function BALANCEFULCRUM129() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return IERC20(fulcrum).BALANCEOF49(address(this));
  }
  function BALANCEAAVEAVAILABLE663() public view returns (uint256) {	//inject NONSTANDARD NAMING
      return IERC20(token).BALANCEOF49(aavePool);
  }
  function BALANCEAAVE43() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return IERC20(aaveToken).BALANCEOF49(address(this));
  }

  function REBALANCE1000() public {	//inject NONSTANDARD NAMING
    Lender newProvider = RECOMMEND250();

    if (newProvider != provider) {
      _WITHDRAWALL554();
    }

    if (BALANCE488() > 0) {
      if (newProvider == Lender.DYDX) {
        _SUPPLYDYDX606(BALANCE488());
      } else if (newProvider == Lender.FULCRUM) {
        _SUPPLYFULCRUM452(BALANCE488());
      } else if (newProvider == Lender.COMPOUND) {
        _SUPPLYCOMPOUND977(BALANCE488());
      } else if (newProvider == Lender.AAVE) {
        _SUPPLYAAVE195(BALANCE488());
      }
    }

    provider = newProvider;
  }

  function _WITHDRAWALL554() internal {	//inject NONSTANDARD NAMING
    uint256 amount = BALANCECOMPOUND433();
    if (amount > 0) {
      _WITHDRAWSOMECOMPOUND70(BALANCECOMPOUNDINTOKEN283().SUB294(1));
    }
    amount = BALANCEDYDX555();
    if (amount > 0) {
      if (amount > BALANCEDYDXAVAILABLE146()) {
        amount = BALANCEDYDXAVAILABLE146();
      }
      _WITHDRAWDYDX769(amount);
    }
    amount = BALANCEFULCRUM129();
    if (amount > 0) {
      if (amount > BALANCEFULCRUMAVAILABLE48().SUB294(1)) {
        amount = BALANCEFULCRUMAVAILABLE48().SUB294(1);
      }
      _WITHDRAWSOMEFULCRUM145(amount);
    }
    amount = BALANCEAAVE43();
    if (amount > 0) {
      if (amount > BALANCEAAVEAVAILABLE663()) {
        amount = BALANCEAAVEAVAILABLE663();
      }
      _WITHDRAWAAVE981(amount);
    }
  }

  function _WITHDRAWSOMECOMPOUND70(uint256 _amount) internal {	//inject NONSTANDARD NAMING
    uint256 b = BALANCECOMPOUND433();
    uint256 bT = BALANCECOMPOUNDINTOKEN283();
    require(bT >= _amount, "insufficient funds");
    
    uint256 amount = (b.MUL360(_amount)).DIV972(bT).ADD511(1);
    _WITHDRAWCOMPOUND699(amount);
  }

  function _WITHDRAWSOMEFULCRUM145(uint256 _amount) internal {	//inject NONSTANDARD NAMING
    uint256 b = BALANCEFULCRUM129();
    uint256 bT = BALANCEFULCRUMINTOKEN412();
    require(bT >= _amount, "insufficient funds");
    
    uint256 amount = (b.MUL360(_amount)).DIV972(bT).ADD511(1);
    _WITHDRAWFULCRUM224(amount);
  }


  function _WITHDRAWSOME868(uint256 _amount) internal returns (bool) {	//inject NONSTANDARD NAMING
    uint256 origAmount = _amount;

    uint256 amount = BALANCECOMPOUND433();
    if (amount > 0) {
      if (_amount > BALANCECOMPOUNDINTOKEN283().SUB294(1)) {
        _WITHDRAWSOMECOMPOUND70(BALANCECOMPOUNDINTOKEN283().SUB294(1));
        _amount = origAmount.SUB294(IERC20(token).BALANCEOF49(address(this)));
      } else {
        _WITHDRAWSOMECOMPOUND70(_amount);
        return true;
      }
    }

    amount = BALANCEDYDX555();
    if (amount > 0) {
      if (_amount > BALANCEDYDXAVAILABLE146()) {
        _WITHDRAWDYDX769(BALANCEDYDXAVAILABLE146());
        _amount = origAmount.SUB294(IERC20(token).BALANCEOF49(address(this)));
      } else {
        _WITHDRAWDYDX769(_amount);
        return true;
      }
    }

    amount = BALANCEFULCRUM129();
    if (amount > 0) {
      if (_amount > BALANCEFULCRUMAVAILABLE48().SUB294(1)) {
        amount = BALANCEFULCRUMAVAILABLE48().SUB294(1);
        _WITHDRAWSOMEFULCRUM145(BALANCEFULCRUMAVAILABLE48().SUB294(1));
        _amount = origAmount.SUB294(IERC20(token).BALANCEOF49(address(this)));
      } else {
        _WITHDRAWSOMEFULCRUM145(amount);
        return true;
      }
    }

    amount = BALANCEAAVE43();
    if (amount > 0) {
      if (_amount > BALANCEAAVEAVAILABLE663()) {
        _WITHDRAWAAVE981(BALANCEAAVEAVAILABLE663());
        _amount = origAmount.SUB294(IERC20(token).BALANCEOF49(address(this)));
      } else {
        _WITHDRAWAAVE981(_amount);
        return true;
      }
    }

    return true;
  }

  function _SUPPLYDYDX606(uint256 amount) internal {	//inject NONSTANDARD NAMING
      Info[] memory infos = new Info[](1);
      infos[0] = Info(address(this), 0);

      AssetAmount memory amt = AssetAmount(true, AssetDenomination.Wei, AssetReference.Delta, amount);
      ActionArgs memory act;
      act.actionType = ActionType.Deposit;
      act.accountId = 0;
      act.amount = amt;
      act.primaryMarketId = dToken;
      act.otherAddress = address(this);

      ActionArgs[] memory args = new ActionArgs[](1);
      args[0] = act;

      DyDx(dydx).OPERATE213(infos, args);
  }

  function _SUPPLYAAVE195(uint amount) internal {	//inject NONSTANDARD NAMING
      Aave(GETAAVE716()).DEPOSIT442(token, amount, 0);
  }
  function _SUPPLYFULCRUM452(uint amount) internal {	//inject NONSTANDARD NAMING
      require(Fulcrum(fulcrum).MINT38(address(this), amount) > 0, "FULCRUM: supply failed");
  }
  function _SUPPLYCOMPOUND977(uint amount) internal {	//inject NONSTANDARD NAMING
      require(Compound(compound).MINT38(amount) == 0, "COMPOUND: supply failed");
  }
  function _WITHDRAWAAVE981(uint amount) internal {	//inject NONSTANDARD NAMING
      AToken(aaveToken).REDEEM433(amount);
  }
  function _WITHDRAWFULCRUM224(uint amount) internal {	//inject NONSTANDARD NAMING
      require(Fulcrum(fulcrum).BURN645(address(this), amount) > 0, "FULCRUM: withdraw failed");
  }
  function _WITHDRAWCOMPOUND699(uint amount) internal {	//inject NONSTANDARD NAMING
      require(Compound(compound).REDEEM433(amount) == 0, "COMPOUND: withdraw failed");
  }

  function _WITHDRAWDYDX769(uint256 amount) internal {	//inject NONSTANDARD NAMING
      Info[] memory infos = new Info[](1);
      infos[0] = Info(address(this), 0);

      AssetAmount memory amt = AssetAmount(false, AssetDenomination.Wei, AssetReference.Delta, amount);
      ActionArgs memory act;
      act.actionType = ActionType.Withdraw;
      act.accountId = 0;
      act.amount = amt;
      act.primaryMarketId = dToken;
      act.otherAddress = address(this);

      ActionArgs[] memory args = new ActionArgs[](1);
      args[0] = act;

      DyDx(dydx).OPERATE213(infos, args);
  }

  function CALCPOOLVALUEINTOKEN319() public view returns (uint) {	//inject NONSTANDARD NAMING
    return BALANCECOMPOUNDINTOKEN283()
      .ADD511(BALANCEFULCRUMINTOKEN412())
      .ADD511(BALANCEDYDX555())
      .ADD511(BALANCEAAVE43())
      .ADD511(BALANCE488());
  }

  function GETPRICEPERFULLSHARE906() public view returns (uint) {	//inject NONSTANDARD NAMING
    uint _pool = CALCPOOLVALUEINTOKEN319();
    return _pool.MUL360(1e18).DIV972(_totalSupply);
  }
}