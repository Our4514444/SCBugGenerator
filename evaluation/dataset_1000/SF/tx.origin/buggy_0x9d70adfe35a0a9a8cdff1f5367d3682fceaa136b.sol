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

  function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function owner() public view returns (address) {
        return _owner;
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

    function rescueTokens(address tokenAddress, address receiver, uint256 amount) external onlyOwner {
        IERC20 _token = IERC20(tokenAddress);
        require(receiver != address(0));
        uint256 balance = _token.balanceOf(address(this));

        require(balance >= amount);
        assert(_token.transfer(receiver, amount));
    }

    function withdrawEther(address payable to, uint256 amount) external onlyOwner {
        require(to != address(0));

        uint256 balance = address(this).balance;

        require(balance >= amount);
        to.transfer(amount);
    }
}


contract Pausable is Ownable {
    bool private _paused;

  function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
  event Paused(address account);
  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  event Unpaused(address account);

    constructor () internal {
        _paused = false;
    }

    function paused() public view returns (bool) {
        return _paused;
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

    function unpause() external onlyOwner whenPaused {
        _paused = false;
        emit Unpaused(msg.sender);
    }
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
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
  function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
  event Mint(address indexed to, uint256 value);
  function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
  event MinterChanged(address account, bool state);

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;

    bool private _allowWhitelistRegistration;
    mapping(address => address) private _referrer;
    mapping(address => uint256) private _refCount;

  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  event TokenSaleWhitelistRegistered(address indexed addr, address indexed refAddr);
  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  event TokenSaleWhitelistTransferred(address indexed previousAddr, address indexed _newAddr);
  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  event TokenSaleWhitelistRegistrationEnabled();
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
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

  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event Donate(address indexed account, uint256 amount);

    constructor() public {
        _minter[msg.sender] = true;
        _allowWhitelistRegistration = true;

        emit TokenSaleWhitelistRegistrationEnabled();

        _referrer[msg.sender] = msg.sender;
        emit TokenSaleWhitelistRegistered(msg.sender, msg.sender);
    }
function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }


    function () external payable {
        emit Donate(msg.sender, msg.value);
    }
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}


    function name() public view returns (string memory) {
        return _name;
    }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }


    function decimals() public view returns (uint8) {
        return _decimals;
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

    function cap() public view returns (uint256) {
        return _cap;
    }
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
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
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

    function approve(address spender, uint256 value) public returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowed[msg.sender][spender].add(addedValue));
        return true;
    }
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowed[msg.sender][spender].sub(subtractedValue));
        return true;
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    function transferFrom(address from, address to, uint256 value) public whenNotPaused returns (bool) {
        require(_allowed[from][msg.sender] >= value);
        _transfer(from, to, value);
        _approve(from, msg.sender, _allowed[from][msg.sender].sub(value));
        return true;
    }
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}

    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

    function _approve(address owner, address spender, uint256 value) internal {
        require(owner != address(0));
        require(spender != address(0));

        _allowed[owner][spender] = value;
        emit Approval(owner, spender, value);
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

    modifier onlyMinter() {
        require(_minter[msg.sender]);
        _;
    }

    function isMinter(address account) public view returns (bool) {
        return _minter[account];
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

    function setMinterState(address account, bool state) external onlyOwner {
        _minter[account] = state;
        emit MinterChanged(account, state);
    }
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }

    function mint(address to, uint256 value) public onlyMinter returns (bool) {
        _mint(to, value);
        return true;
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}

    function _mint(address account, uint256 value) internal {
        require(_totalSupply.add(value) <= _cap);
        require(account != address(0));

        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Mint(account, value);
        emit Transfer(address(0), account, value);
    }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }

    modifier onlyInWhitelist() {
        require(_referrer[msg.sender] != address(0));
        _;
    }

    function allowWhitelistRegistration() public view returns (bool) {
        return _allowWhitelistRegistration;
    }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }

    function inWhitelist(address account) public view returns (bool) {
        return _referrer[account] != address(0);
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}


    function referrer(address account) public view returns (address) {
        return _referrer[account];
    }
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}

    function refCount(address account) public view returns (uint256) {
        return _refCount[account];
    }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }


    function disableTokenSaleWhitelistRegistration() external onlyOwner {
        _allowWhitelistRegistration = false;
        emit TokenSaleWhitelistRegistrationDisabled();
    }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
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
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }

    function transferWhitelist(address account) external onlyInWhitelist {
        require(isNotContract(account));

        _refCount[account]    = _refCount[msg.sender];
        _refCount[msg.sender] = 0;
        _referrer[account]    = _referrer[msg.sender];
        _referrer[msg.sender] = address(0);

        emit TokenSaleWhitelistTransferred(msg.sender, account);
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}


    function isNotContract(address addr) internal view returns (bool) {
        uint size;
        assembly {
            size := extcodesize(addr)
        }
        return size == 0;
    }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
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
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
}