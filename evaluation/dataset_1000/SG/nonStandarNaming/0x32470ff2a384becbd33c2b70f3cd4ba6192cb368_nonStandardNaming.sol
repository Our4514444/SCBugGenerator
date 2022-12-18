                                                                             

pragma solidity ^0.5.3;

                                                                                                   
library SafeMath {
                                                                                
    function MUL724(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                         
    function DIV615(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB840(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD539(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD62(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED130(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED130(address(0), _owner);
    }

                                                        
    function OWNER713() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER137() {	//inject NONSTANDARD NAMING
        require(ISOWNER996());
        _;
    }

                                                                                 
    function ISOWNER996() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP296() public ONLYOWNER137 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED130(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP108(address newOwner) public ONLYOWNER137 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP511(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP511(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED130(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                        
interface IERC20 {
    function TRANSFER980(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE49(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM148(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY928() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF56(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE124(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER150(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL153(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                             
    function TOTALSUPPLY928() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF56(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE124(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER980(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER251(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE49(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE316(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM148(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER251(from, to, value);
        _APPROVE316(from, msg.sender, _allowed[from][msg.sender].SUB840(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE478(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE316(msg.sender, spender, _allowed[msg.sender][spender].ADD539(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE689(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE316(msg.sender, spender, _allowed[msg.sender][spender].SUB840(subtractedValue));
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER251(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB840(value);
        _balances[to] = _balances[to].ADD539(value);
        emit TRANSFER150(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT431(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD539(value);
        _balances[account] = _balances[account].ADD539(value);
        emit TRANSFER150(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN482(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB840(value);
        _balances[account] = _balances[account].SUB840(value);
        emit TRANSFER150(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE316(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL153(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM109(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN482(account, value);
        _APPROVE316(account, msg.sender, _allowed[account][msg.sender].SUB840(value));
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

                                                     
    function NAME173() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL868() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS705() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

                                                                                                                                                                                                                                                                            
library SafeERC20 {
    using SafeMath for uint256;

    function SAFETRANSFER315(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(token.TRANSFER980(to, value));
    }

    function SAFETRANSFERFROM68(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(token.TRANSFERFROM148(from, to, value));
    }

    function SAFEAPPROVE977(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require((value == 0) || (token.ALLOWANCE124(msg.sender, spender) == 0));
        require(token.APPROVE49(spender, value));
    }

    function SAFEINCREASEALLOWANCE862(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE124(address(this), spender).ADD539(value);
        require(token.APPROVE49(spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE954(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE124(address(this), spender).SUB840(value);
        require(token.APPROVE49(spender, newAllowance));
    }
}

contract MoneyMarketInterface {
  function GETSUPPLYBALANCE818(address account, address asset) public view returns (uint);	//inject NONSTANDARD NAMING
  function SUPPLY18(address asset, uint amount) public returns (uint);	//inject NONSTANDARD NAMING
  function WITHDRAW651(address asset, uint requestedAmount) public returns (uint);	//inject NONSTANDARD NAMING
}

contract LoanEscrow {
  using SafeERC20 for IERC20;
  using SafeMath for uint256;

  address public constant dai_address433 = 0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359;  // 0x9Ad61E35f8309aF944136283157FABCc5AD371E5;	//inject NONSTANDARD NAMING
  IERC20 public dai = IERC20(dai_address433);

  address public constant money_market_address431 = 0x3FDA67f7583380E67ef93072294a7fAc882FD7E7;  // 0x6732c278C58FC90542cce498981844A073D693d7;	//inject NONSTANDARD NAMING
  MoneyMarketInterface public moneyMarket = MoneyMarketInterface(money_market_address431);

  event DEPOSITED671(address indexed from, uint256 daiAmount);	//inject NONSTANDARD NAMING
  event PULLED885(address indexed to, uint256 daiAmount);	//inject NONSTANDARD NAMING
  event INTERESTWITHDRAWN96(address indexed to, uint256 daiAmount);	//inject NONSTANDARD NAMING

  mapping(address => uint256) public deposits;
  mapping(address => uint256) public pulls;
  uint256 public deposited;
  uint256 public pulled;

  modifier ONLYBLOCKIMMO184() {	//inject NONSTANDARD NAMING
    require(msg.sender == BLOCKIMMO487());
    _;
  }

  function BLOCKIMMO487() public returns (address);	//inject NONSTANDARD NAMING

  function WITHDRAWINTEREST236() public ONLYBLOCKIMMO184 {	//inject NONSTANDARD NAMING
    uint256 amountInterest = moneyMarket.GETSUPPLYBALANCE818(address(this), dai_address433).ADD539(pulled).SUB840(deposited);
    require(amountInterest > 0, "no interest");

    uint256 errorCode = moneyMarket.WITHDRAW651(dai_address433, amountInterest);
    require(errorCode == 0, "withdraw failed");

    dai.SAFETRANSFER315(msg.sender, amountInterest);
    emit INTERESTWITHDRAWN96(msg.sender, amountInterest);
  }

  function DEPOSIT498(address _from, uint256 _amountDai) internal {	//inject NONSTANDARD NAMING
    require(_from != address(0) && _amountDai > 0, "invalid parameter(s)");
    dai.SAFETRANSFERFROM68(msg.sender, address(this), _amountDai);

    require(dai.ALLOWANCE124(address(this), money_market_address431) == 0, "non-zero initial moneyMarket allowance");
    require(dai.APPROVE49(money_market_address431, _amountDai), "approving moneyMarket failed");

    uint256 errorCode = moneyMarket.SUPPLY18(dai_address433, _amountDai);
    require(errorCode == 0, "supply failed");
    require(dai.ALLOWANCE124(address(this), money_market_address431) == 0, "allowance not fully consumed by moneyMarket");

    deposits[_from] = deposits[_from].ADD539(_amountDai);
    deposited = deposited.ADD539(_amountDai);
    emit DEPOSITED671(_from, _amountDai);
  }

  function PULL968(address _to, uint256 _amountDai, bool refund) internal {	//inject NONSTANDARD NAMING
    uint256 errorCode = moneyMarket.WITHDRAW651(dai_address433, _amountDai);
    require(errorCode == 0, "withdraw failed");

    if (refund) {
      deposits[_to] = deposits[_to].SUB840(_amountDai);
      deposited = deposited.SUB840(_amountDai);
    } else {
      pulls[_to] = pulls[_to].ADD539(_amountDai);
      pulled = pulled.ADD539(_amountDai);
    }

    dai.SAFETRANSFER315(_to, _amountDai);
    emit PULLED885(_to, _amountDai);
  }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
contract DividendDistributingToken is ERC20, LoanEscrow {
  using SafeMath for uint256;

  uint256 public constant points_per_dai565 = uint256(10) ** 32;	//inject NONSTANDARD NAMING

  uint256 public pointsPerToken = 0;
  mapping(address => uint256) public credits;
  mapping(address => uint256) public lastPointsPerToken;

  event DIVIDENDSDEPOSITED556(address indexed depositor, uint256 amount);	//inject NONSTANDARD NAMING
  event DIVIDENDSCOLLECTED611(address indexed collector, uint256 amount);	//inject NONSTANDARD NAMING

  function COLLECTOWEDDIVIDENDS313() public {	//inject NONSTANDARD NAMING
    CREDITACCOUNT800(msg.sender);

    uint256 _dai = credits[msg.sender].DIV615(points_per_dai565);
    credits[msg.sender] = 0;

    PULL968(msg.sender, _dai, false);
    emit DIVIDENDSCOLLECTED611(msg.sender, _dai);
  }

  function DEPOSITDIVIDENDS200() public {  // dividends	//inject NONSTANDARD NAMING
    uint256 amount = dai.ALLOWANCE124(msg.sender, address(this));

    uint256 fee = amount.DIV615(100);
    dai.SAFETRANSFERFROM68(msg.sender, BLOCKIMMO487(), fee);

    DEPOSIT498(msg.sender, amount.SUB840(fee));

    pointsPerToken = pointsPerToken.ADD539(amount.SUB840(fee).MUL724(points_per_dai565).DIV615(TOTALSUPPLY928()));
    emit DIVIDENDSDEPOSITED556(msg.sender, amount);
  }

  function CREDITACCOUNT800(address _account) internal {	//inject NONSTANDARD NAMING
    uint256 amount = BALANCEOF56(_account).MUL724(pointsPerToken.SUB840(lastPointsPerToken[_account]));
    credits[_account] = credits[_account].ADD539(amount);
    lastPointsPerToken[_account] = pointsPerToken;
  }
}

contract LandRegistryInterface {
  function GETPROPERTY231(string memory _eGrid) public view returns (address property);	//inject NONSTANDARD NAMING
}

contract LandRegistryProxyInterface {
  function OWNER713() public view returns (address);	//inject NONSTANDARD NAMING
  function LANDREGISTRY842() public view returns (LandRegistryInterface);	//inject NONSTANDARD NAMING
}

contract WhitelistInterface {
  function CHECKROLE54(address _operator, string memory _permission) public view;	//inject NONSTANDARD NAMING
}

contract WhitelistProxyInterface {
  function WHITELIST784() public view returns (WhitelistInterface);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
contract TokenizedProperty is DividendDistributingToken, ERC20Detailed, Ownable {
  address public constant land_registry_proxy_address470 = 0xe72AD2A335AE18e6C7cdb6dAEB64b0330883CD56;  // 0x0f5Ea0A652E851678Ebf77B69484bFcD31F9459B;	//inject NONSTANDARD NAMING
  address public constant whitelist_proxy_address100 = 0x7223b032180CDb06Be7a3D634B1E10032111F367;  // 0xEC8bE1A5630364292E56D01129E8ee8A9578d7D8;	//inject NONSTANDARD NAMING

  LandRegistryProxyInterface public registryProxy = LandRegistryProxyInterface(land_registry_proxy_address470);
  WhitelistProxyInterface public whitelistProxy = WhitelistProxyInterface(whitelist_proxy_address100);

  uint256 public constant num_tokens40 = 1000000;	//inject NONSTANDARD NAMING

  string public managementCompany;
  mapping(address => uint256) public lastTransferBlock;
  mapping(address => uint256) public minTransferAccepted;

  event MINTRANSFERSET726(address indexed account, uint256 minTransfer);	//inject NONSTANDARD NAMING
  event MANAGEMENTCOMPANYSET58(string managementCompany);	//inject NONSTANDARD NAMING
  event UNTOKENIZEREQUEST898();	//inject NONSTANDARD NAMING
  event GENERIC189(string generic);	//inject NONSTANDARD NAMING

  modifier ISVALID346() {	//inject NONSTANDARD NAMING
    LandRegistryInterface registry = LandRegistryInterface(registryProxy.LANDREGISTRY842());
    require(registry.GETPROPERTY231(NAME173()) == address(this), "invalid TokenizedProperty");
    _;
  }

  constructor(string memory _eGrid, string memory _grundstuck) public ERC20Detailed(_eGrid, _grundstuck, 18) {
    uint256 totalSupply = num_tokens40 * (uint256(10) ** DECIMALS705());
    _MINT431(msg.sender, totalSupply);
  }

  function BLOCKIMMO487() public returns (address) {	//inject NONSTANDARD NAMING
    return registryProxy.OWNER713();
  }

  function EMITGENERICPROPOSAL554(string memory _generic) public ISVALID346 ONLYOWNER137 {	//inject NONSTANDARD NAMING
    emit GENERIC189(_generic);
  }

  function SETMANAGEMENTCOMPANY957(string memory _managementCompany) public ISVALID346 ONLYOWNER137 {	//inject NONSTANDARD NAMING
    managementCompany = _managementCompany;
    emit MANAGEMENTCOMPANYSET58(managementCompany);
  }

  function SETMINTRANSFER160(uint256 _amount) public {	//inject NONSTANDARD NAMING
    minTransferAccepted[msg.sender] = _amount;
    emit MINTRANSFERSET726(msg.sender, _amount);
  }

  function TRANSFER980(address _to, uint256 _value) public ISVALID346 returns (bool) {	//inject NONSTANDARD NAMING
    require(_value >= minTransferAccepted[_to], "_value must exceed _to's minTransferAccepted");
    TRANSFERBOOKKEEPING377(msg.sender, _to);
    return super.TRANSFER980(_to, _value);
  }

  function TRANSFERFROM148(address _from, address _to, uint256 _value) public ISVALID346 returns (bool) {	//inject NONSTANDARD NAMING
    TRANSFERBOOKKEEPING377(_from, _to);
    return super.TRANSFERFROM148(_from, _to, _value);
  }

  function UNTOKENIZE607() public ISVALID346 ONLYOWNER137 {	//inject NONSTANDARD NAMING
    emit UNTOKENIZEREQUEST898();
  }

  function TRANSFERBOOKKEEPING377(address _from, address _to) internal {	//inject NONSTANDARD NAMING
    whitelistProxy.WHITELIST784().CHECKROLE54(_to, "authorized");

    CREDITACCOUNT800(_from);  // required for dividends...
    CREDITACCOUNT800(_to);

    lastTransferBlock[_from] = block.number;  // required for voting...
    lastTransferBlock[_to] = block.number;
  }
}