pragma solidity ^0.5.7;



library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        assert(c >= a);
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return a / b;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}



interface IERC20{
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract Ownable {
    address internal _owner;

  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }

    function owner() public view returns (address) {
        return _owner;
    }
function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}

    modifier onlyOwner() {
        require(msg.sender == _owner);
        _;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0));
        _owner = newOwner;
        emit OwnershipTransferred(_owner, newOwner);
    }
bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }

    function rescueTokens(address tokenAddress, address receiver, uint256 amount) external onlyOwner {
        IERC20 _token = IERC20(tokenAddress);
        require(receiver != address(0));
        uint256 balance = _token.balanceOf(address(this));

        require(balance >= amount);
        assert(_token.transfer(receiver, amount));
    }
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function withdrawEther(address payable to, uint256 amount) external onlyOwner {
        require(to != address(0));

        uint256 balance = address(this).balance;

        require(balance >= amount);
        to.transfer(amount);
    }
function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
}


contract Pausable is Ownable {
    bool private _paused;

  function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
  event Paused(address account);
  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  event Unpaused(address account);

    constructor () internal {
        _paused = false;
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    function paused() public view returns (bool) {
        return _paused;
    }
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}

    modifier whenNotPaused() {
        require(!_paused);
        _;
    }

    modifier whenPaused() {
        require(_paused);
        _;
    }

    function pause() external onlyOwner whenNotPaused {
        _paused = true;
        emit Paused(msg.sender);
    }
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}

    function unpause() external onlyOwner whenPaused {
        _paused = false;
        emit Unpaused(msg.sender);
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
}


contract TmToken is Ownable, Pausable, IERC20 {
    using SafeMath for uint256;

    string private  _name     = "TM Token";
    string private  _symbol   = "TM";
    uint8 private   _decimals = 6;                   // 6 decimals
    uint256 private _cap      = 10000000000000000;   // 10 billion cap, that is 10000000000.000000
    uint256 private _totalSupply;

    mapping (address => bool) private _minter;
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  event Mint(address indexed to, uint256 value);
  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  event MinterChanged(address account, bool state);

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;

    bool private _allowWhitelistRegistration;
    mapping(address => address) private _referrer;
    mapping(address => uint256) private _refCount;

  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  event TokenSaleWhitelistRegistered(address indexed addr, address indexed refAddr);
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event TokenSaleWhitelistTransferred(address indexed previousAddr, address indexed _newAddr);
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event TokenSaleWhitelistRegistrationEnabled();
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event TokenSaleWhitelistRegistrationDisabled();

    uint256 private _whitelistRegistrationValue = 101000000;   // 101 Token, 101.000000
    uint256[15] private _whitelistRefRewards = [                // 100% Reward
    31000000,  // 31 Token for Level.1
    20000000,  // 20 Token for Level.2
    10000000,  // 10 Token for Level.3
    10000000,  // 10 Token for Level.4
    10000000,  // 10 Token for Level.5
    5000000,   //  5 Token for Level.6
    4000000,   //  4 Token for Level.7
    3000000,   //  3 Token for Level.8
    2000000,   //  2 Token for Level.9
    1000000,   //  1 Token for Level.10
    1000000,   //  1 Token for Level.11
    1000000,   //  1 Token for Level.12
    1000000,   //  1 Token for Level.13
    1000000,   //  1 Token for Level.14
    1000000    //  1 Token for Level.15
    ];

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Donate(address indexed account, uint256 amount);

    constructor() public {
        _minter[msg.sender] = true;
        _allowWhitelistRegistration = true;

        emit TokenSaleWhitelistRegistrationEnabled();

        _referrer[msg.sender] = msg.sender;
        emit TokenSaleWhitelistRegistered(msg.sender, msg.sender);
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }


    function () external payable {
        emit Donate(msg.sender, msg.value);
    }
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }


    function name() public view returns (string memory) {
        return _name;
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}


    function decimals() public view returns (uint8) {
        return _decimals;
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

    function cap() public view returns (uint256) {
        return _cap;
    }
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }

    function transfer(address to, uint256 value) public whenNotPaused returns (bool) {
        if (_allowWhitelistRegistration && value == _whitelistRegistrationValue
        && inWhitelist(to) && !inWhitelist(msg.sender) && isNotContract(msg.sender)) {
            // Register whitelist for TM Token-Sale
            _regWhitelist(msg.sender, to);
            return true;
        } else {
            // Normal Transfer
            _transfer(msg.sender, to, value);
            return true;
        }
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }

    function approve(address spender, uint256 value) public returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowed[msg.sender][spender].add(addedValue));
        return true;
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowed[msg.sender][spender].sub(subtractedValue));
        return true;
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

    function transferFrom(address from, address to, uint256 value) public whenNotPaused returns (bool) {
        require(_allowed[from][msg.sender] >= value);
        _transfer(from, to, value);
        _approve(from, msg.sender, _allowed[from][msg.sender].sub(value));
        return true;
    }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

    function _approve(address owner, address spender, uint256 value) internal {
        require(owner != address(0));
        require(spender != address(0));

        _allowed[owner][spender] = value;
        emit Approval(owner, spender, value);
    }
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    modifier onlyMinter() {
        require(_minter[msg.sender]);
        _;
    }

    function isMinter(address account) public view returns (bool) {
        return _minter[account];
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

    function setMinterState(address account, bool state) external onlyOwner {
        _minter[account] = state;
        emit MinterChanged(account, state);
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    function mint(address to, uint256 value) public onlyMinter returns (bool) {
        _mint(to, value);
        return true;
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

    function _mint(address account, uint256 value) internal {
        require(_totalSupply.add(value) <= _cap);
        require(account != address(0));

        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Mint(account, value);
        emit Transfer(address(0), account, value);
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    modifier onlyInWhitelist() {
        require(_referrer[msg.sender] != address(0));
        _;
    }

    function allowWhitelistRegistration() public view returns (bool) {
        return _allowWhitelistRegistration;
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

    function inWhitelist(address account) public view returns (bool) {
        return _referrer[account] != address(0);
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }


    function referrer(address account) public view returns (address) {
        return _referrer[account];
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function refCount(address account) public view returns (uint256) {
        return _refCount[account];
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}


    function disableTokenSaleWhitelistRegistration() external onlyOwner {
        _allowWhitelistRegistration = false;
        emit TokenSaleWhitelistRegistrationDisabled();
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }


    function _regWhitelist(address account, address refAccount) internal {
        _refCount[refAccount] = _refCount[refAccount].add(1);
        _referrer[account] = refAccount;

        emit TokenSaleWhitelistRegistered(account, refAccount);

        // Whitelist Registration Referral Reward
        _transfer(msg.sender, address(this), _whitelistRegistrationValue);
        address cursor = account;
        uint256 remain = _whitelistRegistrationValue;
        for(uint i = 0; i < _whitelistRefRewards.length; i++) {
            address receiver = _referrer[cursor];

            if (cursor != receiver) {
                if (_refCount[receiver] > i) {
                    _transfer(address(this), receiver, _whitelistRefRewards[i]);
                    remain = remain.sub(_whitelistRefRewards[i]);
                }
            } else {
               // _transfer(address(this), refAccount, remain);
                break;
            }

            cursor = _referrer[cursor];
        }
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function transferWhitelist(address account) external onlyInWhitelist {
        require(isNotContract(account));

        _refCount[account]    = _refCount[msg.sender];
        _refCount[msg.sender] = 0;
        _referrer[account]    = _referrer[msg.sender];
        _referrer[msg.sender] = address(0);

        emit TokenSaleWhitelistTransferred(msg.sender, account);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}


    function isNotContract(address addr) internal view returns (bool) {
        uint size;
        assembly {
            size := extcodesize(addr)
        }
        return size == 0;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    function calculateTheRewardOfDirectWhitelistRegistration(address whitelistedAccount) external view returns (uint256 reward) {
        if (!inWhitelist(whitelistedAccount)) {
            return 0;
        }

        address cursor = whitelistedAccount;
        uint256 remain = _whitelistRegistrationValue;
        for(uint i = 1; i < _whitelistRefRewards.length; i++) {
            address receiver = _referrer[cursor];

            if (cursor != receiver) {
                if (_refCount[receiver] > i) {
                    remain = remain.sub(_whitelistRefRewards[i]);
                }
            } else {
                reward = reward.add(remain);
                break;
            }

            cursor = _referrer[cursor];
        }

        return reward;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
}