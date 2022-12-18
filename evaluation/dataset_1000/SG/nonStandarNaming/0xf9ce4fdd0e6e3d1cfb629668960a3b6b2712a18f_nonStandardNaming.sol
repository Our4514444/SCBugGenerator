                                                                             

pragma solidity 0.5.4;

library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD193(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS733(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE704(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS733(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS733(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

contract PauserRole {
    using Roles for Roles.Role;

    event PAUSERADDED287(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED966(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    constructor () internal {
        _ADDPAUSER864(msg.sender);
    }

    modifier ONLYPAUSER179() {	//inject NONSTANDARD NAMING
        require(ISPAUSER984(msg.sender));
        _;
    }

    function ISPAUSER984(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS733(account);
    }

    function ADDPAUSER93(address account) public ONLYPAUSER179 {	//inject NONSTANDARD NAMING
        _ADDPAUSER864(account);
    }

    function RENOUNCEPAUSER968() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER238(msg.sender);
    }

    function _ADDPAUSER864(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD193(account);
        emit PAUSERADDED287(account);
    }

    function _REMOVEPAUSER238(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE704(account);
        emit PAUSERREMOVED966(account);
    }
}

contract Pausable is PauserRole {
    event PAUSED502(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED333(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

                                                                               
    function PAUSED212() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED382() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED143() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE266() public ONLYPAUSER179 WHENNOTPAUSED382 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED502(msg.sender);
    }

                                                                                   
    function UNPAUSE478() public ONLYPAUSER179 WHENPAUSED143 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED333(msg.sender);
    }
}

library SafeMath {
                                                                                  
    function MUL570(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV85(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB457(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD193(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD731(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

interface IERC20 {
    function TRANSFER903(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE976(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM59(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY691() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF794(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE632(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER971(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL200(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER23(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN175(token, abi.encodeWithSelector(token.TRANSFER903.selector, to, value));
    }

    function SAFETRANSFERFROM536(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN175(token, abi.encodeWithSelector(token.TRANSFERFROM59.selector, from, to, value));
    }

    function SAFEAPPROVE15(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require((value == 0) || (token.ALLOWANCE632(address(this), spender) == 0));
        CALLOPTIONALRETURN175(token, abi.encodeWithSelector(token.APPROVE976.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE326(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE632(address(this), spender).ADD193(value);
        CALLOPTIONALRETURN175(token, abi.encodeWithSelector(token.APPROVE976.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE723(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE632(address(this), spender).SUB457(value);
        CALLOPTIONALRETURN175(token, abi.encodeWithSelector(token.APPROVE976.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                      
    function CALLOPTIONALRETURN175(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.

        require(address(token).ISCONTRACT109());

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success);

        if (returndata.length > 0) { // Return data is optional
            require(abi.decode(returndata, (bool)));
        }
    }
}

library Address {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT109(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint256 size;
        // XXX Currently there is no better way to check if there is a contract in an address
        // than to check the size of the code at that address.
        // See https://ethereum.stackexchange.com/a/14016/36603
        // for more details about how this works.
        // TODO Check this again before the Serenity release, because all addresses will be
        // contracts then.
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

contract ReentrancyGuard {
                                                                       
    uint256 private _guardCounter;

    constructor () internal {
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT140() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter);
    }
}

contract Crowdsale is ReentrancyGuard {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    // The token being sold
    IERC20 private _token;

    // Address where funds are collected
    address payable private _wallet;

    // How many token units a buyer gets per wei.
    // The rate is the conversion between wei and the smallest and indivisible token unit.
    // So, if you are using a rate of 1 with a ERC20Detailed token with 3 decimals called TOK
    // 1 wei will give you 1 unit, or 0.001 TOK.
    uint256 private _rate;

    // Amount of wei raised
    uint256 private _weiRaised;

                                                                                                                                                                                                                                               
    event TOKENSPURCHASED462(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    constructor (uint256 rate, address payable wallet, IERC20 token) public {
        require(rate > 0);
        require(wallet != address(0));
        require(address(token) != address(0));

        _rate = rate;
        _wallet = wallet;
        _token = token;
    }

                                                                                                                                                                                                                                                                                          
    function () external payable {
        BUYTOKENS449(msg.sender);
    }

                                                    
    function TOKEN645() public view returns (IERC20) {	//inject NONSTANDARD NAMING
        return _token;
    }

                                                                     
    function WALLET450() public view returns (address payable) {	//inject NONSTANDARD NAMING
        return _wallet;
    }

                                                                              
    function RATE907() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _rate;
    }

                                                        
    function WEIRAISED530() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _weiRaised;
    }

                                                                                                                                                                                                                                                          
    function BUYTOKENS449(address beneficiary) public NONREENTRANT140 payable {	//inject NONSTANDARD NAMING
        uint256 weiAmount = _WEIAMOUNT155();
        _PREVALIDATEPURCHASE309(beneficiary, weiAmount);

        // calculate token amount to be created
        uint256 tokens = _GETTOKENAMOUNT642(weiAmount);

        // update state
        _weiRaised = _weiRaised.ADD193(weiAmount);

        _PROCESSPURCHASE50(beneficiary, tokens);
        emit TOKENSPURCHASED462(msg.sender, beneficiary, weiAmount, tokens);

        _UPDATEPURCHASINGSTATE600(beneficiary, weiAmount);

        _FORWARDFUNDS203();
        _POSTVALIDATEPURCHASE426(beneficiary, weiAmount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function _PREVALIDATEPURCHASE309(address beneficiary, uint256 weiAmount) internal view {	//inject NONSTANDARD NAMING
        require(beneficiary != address(0));
        require(weiAmount != 0);
    }

                                                                                                                                                                                                                                                                                                
    function _POSTVALIDATEPURCHASE426(address beneficiary, uint256 weiAmount) internal view {	//inject NONSTANDARD NAMING
        // solhint-disable-previous-line no-empty-blocks
    }

                                                                                                                                                                                                                                                                                 
    function _DELIVERTOKENS439(address beneficiary, uint256 tokenAmount) internal {	//inject NONSTANDARD NAMING
        _token.SAFETRANSFER23(beneficiary, tokenAmount);
    }

                                                                                                                                                                                                                                                                   
    function _PROCESSPURCHASE50(address beneficiary, uint256 tokenAmount) internal {	//inject NONSTANDARD NAMING
        _DELIVERTOKENS439(beneficiary, tokenAmount);
    }

                                                                                                                                                                                                                                                                       
    function _UPDATEPURCHASINGSTATE600(address beneficiary, uint256 weiAmount) internal {	//inject NONSTANDARD NAMING
        // solhint-disable-previous-line no-empty-blocks
    }

                                                                                                                                                                                                                                                  
    function _GETTOKENAMOUNT642(uint256 weiAmount) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return weiAmount.MUL570(_rate);
    }

                                                                                
    function _FORWARDFUNDS203() internal {	//inject NONSTANDARD NAMING
        _wallet.transfer(msg.value);
    }

                                                                                   
    function _WEIAMOUNT155() internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return msg.value;
    }
}

contract CappedCrowdsale is Crowdsale {
    using SafeMath for uint256;

    uint256 private _cap;

                                                                                                                                                     
    constructor (uint256 cap) public {
        require(cap > 0);
        _cap = cap;
    }

                                                        
    function CAP83() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }

                                                                                                               
    function CAPREACHED523() public view returns (bool) {	//inject NONSTANDARD NAMING
        return WEIRAISED530() >= _cap;
    }

                                                                                                                                                                                             
    function _PREVALIDATEPURCHASE309(address beneficiary, uint256 weiAmount) internal view {	//inject NONSTANDARD NAMING
        super._PREVALIDATEPURCHASE309(beneficiary, weiAmount);
        require(WEIRAISED530().ADD193(weiAmount) <= _cap);
    }
}

contract TimedCrowdsale is Crowdsale {
    using SafeMath for uint256;

    uint256 private _openingTime;
    uint256 private _closingTime;

                                                                                                                                                 
    event TIMEDCROWDSALEEXTENDED791(uint256 prevClosingTime, uint256 newClosingTime);	//inject NONSTANDARD NAMING

                                                                   
    modifier ONLYWHILEOPEN530 {	//inject NONSTANDARD NAMING
        require(ISOPEN418());
        _;
    }

                                                                                                                                                                                     
    constructor (uint256 openingTime, uint256 closingTime) public {
        // solhint-disable-next-line not-rely-on-time
        require(openingTime >= block.timestamp);
        require(closingTime > openingTime);

        _openingTime = openingTime;
        _closingTime = closingTime;
    }

                                                          
    function OPENINGTIME562() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _openingTime;
    }

                                                          
    function CLOSINGTIME732() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _closingTime;
    }

                                                                              
    function ISOPEN418() public view returns (bool) {	//inject NONSTANDARD NAMING
        // solhint-disable-next-line not-rely-on-time
        return block.timestamp >= _openingTime && block.timestamp <= _closingTime;
    }

                                                                                                                                                             
    function HASCLOSED284() public view returns (bool) {	//inject NONSTANDARD NAMING
        // solhint-disable-next-line not-rely-on-time
        return block.timestamp > _closingTime;
    }

                                                                                                                                                                                         
    function _PREVALIDATEPURCHASE309(address beneficiary, uint256 weiAmount) internal ONLYWHILEOPEN530 view {	//inject NONSTANDARD NAMING
        super._PREVALIDATEPURCHASE309(beneficiary, weiAmount);
    }

                                                                                                
    function _EXTENDTIME754(uint256 newClosingTime) internal {	//inject NONSTANDARD NAMING
        require(!HASCLOSED284());
        require(newClosingTime > _closingTime);

        emit TIMEDCROWDSALEEXTENDED791(_closingTime, newClosingTime);
        _closingTime = newClosingTime;
    }
}

contract FinalizableCrowdsale is TimedCrowdsale {
    using SafeMath for uint256;

    bool private _finalized;

    event CROWDSALEFINALIZED350();	//inject NONSTANDARD NAMING

    constructor () internal {
        _finalized = false;
    }

                                                                                   
    function FINALIZED952() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _finalized;
    }

                                                                                                                                                       
    function FINALIZE645() public {	//inject NONSTANDARD NAMING
        require(!_finalized);
        require(HASCLOSED284());

        _finalized = true;

        _FINALIZATION972();
        emit CROWDSALEFINALIZED350();
    }

                                                                                                                                                                                                          
    function _FINALIZATION972() internal {	//inject NONSTANDARD NAMING
        // solhint-disable-previous-line no-empty-blocks
    }
}

contract PostDeliveryCrowdsale is TimedCrowdsale {
    using SafeMath for uint256;

    mapping(address => uint256) private _balances;

                                                                                                                                
    function WITHDRAWTOKENS210(address beneficiary) public {	//inject NONSTANDARD NAMING
        require(HASCLOSED284());
        uint256 amount = _balances[beneficiary];
        require(amount > 0);
        _balances[beneficiary] = 0;
        _DELIVERTOKENS439(beneficiary, amount);
    }

                                                         
    function BALANCEOF794(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                     
    function _PROCESSPURCHASE50(address beneficiary, uint256 tokenAmount) internal {	//inject NONSTANDARD NAMING
        _balances[beneficiary] = _balances[beneficiary].ADD193(tokenAmount);
    }

}

contract MoneyMarketInterface {
  function GETSUPPLYBALANCE740(address account, address asset) public view returns (uint);	//inject NONSTANDARD NAMING
  function SUPPLY633(address asset, uint amount) public returns (uint);	//inject NONSTANDARD NAMING
  function WITHDRAW472(address asset, uint requestedAmount) public returns (uint);	//inject NONSTANDARD NAMING
}

contract LoanEscrow is Pausable {
  using SafeERC20 for IERC20;
  using SafeMath for uint256;

  // configurable to any ERC20 (i.e. xCHF)
  IERC20 public dai = IERC20(0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359);  // 0x9Ad61E35f8309aF944136283157FABCc5AD371E5  // 0xB4272071eCAdd69d933AdcD19cA99fe80664fc08
  MoneyMarketInterface public moneyMarket = MoneyMarketInterface(0x3FDA67f7583380E67ef93072294a7fAc882FD7E7);  // 0x6732c278C58FC90542cce498981844A073D693d7

  event DEPOSITED482(address indexed from, uint256 daiAmount);	//inject NONSTANDARD NAMING
  event INTERESTWITHDRAWN748(address indexed to, uint256 daiAmount);	//inject NONSTANDARD NAMING
  event PULLED51(address indexed to, uint256 daiAmount);	//inject NONSTANDARD NAMING

  mapping(address => uint256) public deposits;
  mapping(address => uint256) public pulls;
  uint256 public deposited;
  uint256 public pulled;

  modifier ONLYBLOCKIMMO660() {	//inject NONSTANDARD NAMING
    require(msg.sender == BLOCKIMMO269(), "onlyBlockimmo");
    _;
  }

  function BLOCKIMMO269() public view returns (address);	//inject NONSTANDARD NAMING

  function WITHDRAWINTEREST610() public ONLYBLOCKIMMO660 {	//inject NONSTANDARD NAMING
    uint256 amountInterest = moneyMarket.GETSUPPLYBALANCE740(address(this), address(dai)).ADD193(dai.BALANCEOF794(address(this))).ADD193(pulled).SUB457(deposited);
    require(amountInterest > 0, "no interest");

    uint256 errorCode = (amountInterest > dai.BALANCEOF794(address(this))) ? moneyMarket.WITHDRAW472(address(dai), amountInterest.SUB457(dai.BALANCEOF794(address(this)))) : 0;
    require(errorCode == 0, "withdraw failed");

    dai.SAFETRANSFER23(msg.sender, amountInterest);
    emit INTERESTWITHDRAWN748(msg.sender, amountInterest);
  }

  function WITHDRAWMONEYMARKET925(uint256 _amountDai) public ONLYBLOCKIMMO660 {	//inject NONSTANDARD NAMING
    uint256 errorCode = moneyMarket.WITHDRAW472(address(dai), _amountDai);
    require(errorCode == 0, "withdraw failed");
  }

  function DEPOSIT339(address _from, uint256 _amountDai) internal {	//inject NONSTANDARD NAMING
    require(_from != address(0) && _amountDai > 0, "invalid parameter(s)");

    dai.SAFETRANSFERFROM536(msg.sender, address(this), _amountDai);

    if (!PAUSED212()) {
      dai.SAFEAPPROVE15(address(moneyMarket), _amountDai);

      uint256 errorCode = moneyMarket.SUPPLY633(address(dai), _amountDai);
      require(errorCode == 0, "supply failed");
      require(dai.ALLOWANCE632(address(this), address(moneyMarket)) == 0, "allowance not fully consumed by moneyMarket");
    }

    deposits[_from] = deposits[_from].ADD193(_amountDai);
    deposited = deposited.ADD193(_amountDai);
    emit DEPOSITED482(_from, _amountDai);
  }

  function PULL896(address _to, uint256 _amountDai, bool _refund) internal {	//inject NONSTANDARD NAMING
    require(_to != address(0) && _amountDai > 0, "invalid parameter(s)");

    uint256 errorCode = (_amountDai > dai.BALANCEOF794(address(this))) ? moneyMarket.WITHDRAW472(address(dai), _amountDai.SUB457(dai.BALANCEOF794(address(this)))) : 0;
    require(errorCode == 0, "withdraw failed");

    if (_refund) {
      deposits[_to] = deposits[_to].SUB457(_amountDai);
      deposited = deposited.SUB457(_amountDai);
    } else {
      pulls[_to] = pulls[_to].ADD193(_amountDai);
      pulled = pulled.ADD193(_amountDai);
    }

    dai.SAFETRANSFER23(_to, _amountDai);
    emit PULLED51(_to, _amountDai);
  }
}

contract LandRegistryProxyInterface {
  function OWNER259() public view returns (address);	//inject NONSTANDARD NAMING
}

contract WhitelistInterface {
  function CHECKROLE579(address _operator, string memory _role) public view;	//inject NONSTANDARD NAMING
  function HASROLE285(address _operator, string memory _role) public view returns (bool);	//inject NONSTANDARD NAMING
}

contract WhitelistProxyInterface {
  function WHITELIST448() public view returns (WhitelistInterface);	//inject NONSTANDARD NAMING
}

contract TokenSale is CappedCrowdsale, FinalizableCrowdsale, LoanEscrow, PostDeliveryCrowdsale {
  LandRegistryProxyInterface public registryProxy = LandRegistryProxyInterface(0xe72AD2A335AE18e6C7cdb6dAEB64b0330883CD56);  // 0x0f5Ea0A652E851678Ebf77B69484bFcD31F9459B;
  WhitelistProxyInterface public whitelistProxy = WhitelistProxyInterface(0x7223b032180CDb06Be7a3D634B1E10032111F367);  // 0xEC8bE1A5630364292E56D01129E8ee8A9578d7D8;

  mapping(address => bool) public claimedRefund;
  uint256 public goal;
  mapping(address => bool) public reversed;
  uint256 public totalTokens;

  constructor (
    uint256 _cap,
    uint256 _closingTime,
    uint256 _goal,
    uint256 _openingTime,
    uint256 _rate,
    IERC20 _token,
    address payable _wallet
  )
  public
    Crowdsale(_rate, _wallet, _token)
    CappedCrowdsale(_cap)
    FinalizableCrowdsale()
    TimedCrowdsale(_openingTime, _closingTime)
    PostDeliveryCrowdsale()
  {
    goal = _goal;
  }

  function BLOCKIMMO269() public view returns (address) {	//inject NONSTANDARD NAMING
    return registryProxy.OWNER259();
  }

  function CLAIMREFUND113(address _refundee) public {	//inject NONSTANDARD NAMING
    require(FINALIZED952() && !GOALREACHED387());
    require(!claimedRefund[_refundee]);

    claimedRefund[_refundee] = true;
    PULL896(_refundee, deposits[_refundee], true);
  }

  function GOALREACHED387() public view returns (bool) {	//inject NONSTANDARD NAMING
    return WEIRAISED530() >= goal;
  }

  function HASCLOSED284() public view returns (bool) {	//inject NONSTANDARD NAMING
    return CAPREACHED523() || super.HASCLOSED284();
  }

  function REVERSE341(address _account) public {	//inject NONSTANDARD NAMING
    require(!FINALIZED952());
    require(!reversed[_account]);
    WhitelistInterface whitelist = whitelistProxy.WHITELIST448();
    require(!whitelist.HASROLE285(_account, "authorized"));

    reversed[_account] = true;
    PULL896(_account, deposits[_account], true);
  }

  function TOTALTOKENSSOLD446() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _GETTOKENAMOUNT642(WEIRAISED530());
  }

  function WITHDRAWTOKENS210(address beneficiary) public {  // airdrop remaining tokens to investors proportionally	//inject NONSTANDARD NAMING
    require(FINALIZED952() && GOALREACHED387(), "withdrawTokens requires the TokenSale to be successfully finalized");
    require(!reversed[beneficiary]);

    uint256 extra = totalTokens.SUB457(TOTALTOKENSSOLD446()).MUL570(BALANCEOF794(beneficiary)).DIV85(TOTALTOKENSSOLD446());
    _DELIVERTOKENS439(beneficiary, extra);

    super.WITHDRAWTOKENS210(beneficiary);
  }

  function WEIRAISED530() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return deposited;
  }

  function _GETTOKENAMOUNT642(uint256 weiAmount) internal view returns (uint256) {	//inject NONSTANDARD NAMING
    return weiAmount.DIV85(RATE907());
  }

  function _FINALIZATION972() internal {	//inject NONSTANDARD NAMING
    require(msg.sender == BLOCKIMMO269() || msg.sender == WALLET450());
    super._FINALIZATION972();

    totalTokens = TOKEN645().BALANCEOF794(address(this));

    if (GOALREACHED387()) {
      uint256 fee = WEIRAISED530().DIV85(100);

      PULL896(BLOCKIMMO269(), fee, false);
      PULL896(WALLET450(), WEIRAISED530().SUB457(fee), false);
    } else {
      TOKEN645().SAFETRANSFER23(WALLET450(), totalTokens);
    }
  }

  function _PROCESSPURCHASE50(address beneficiary, uint256 tokenAmount) internal {	//inject NONSTANDARD NAMING
    super._PROCESSPURCHASE50(beneficiary, tokenAmount);
    DEPOSIT339(beneficiary, tokenAmount.MUL570(RATE907()));
  }

  function _PREVALIDATEPURCHASE309(address beneficiary, uint256 weiAmount) internal view {	//inject NONSTANDARD NAMING
    require(msg.value == 0 && weiAmount % RATE907() == 0, "rounding loss");
    require(!reversed[beneficiary]);

    super._PREVALIDATEPURCHASE309(beneficiary, weiAmount);

    WhitelistInterface whitelist = whitelistProxy.WHITELIST448();
    whitelist.CHECKROLE579(beneficiary, "authorized");
    require(deposits[beneficiary].ADD193(weiAmount) <= 100000e18 || whitelist.HASROLE285(beneficiary, "uncapped"));
  }

  function _WEIAMOUNT155() internal view returns (uint256) {	//inject NONSTANDARD NAMING
    return dai.ALLOWANCE632(msg.sender, address(this));
  }
}