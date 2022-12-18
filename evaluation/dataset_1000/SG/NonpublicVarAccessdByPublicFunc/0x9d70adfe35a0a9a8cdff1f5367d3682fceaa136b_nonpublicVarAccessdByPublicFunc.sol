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

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function owner() public view returns (address) {
        return _owner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    modifier onlyOwner() {
        require(msg.sender == _owner);
        _;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0));
        _owner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit OwnershipTransferred(_owner, newOwner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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

    event Paused(address account);
    event Unpaused(address account);

    constructor () internal {
        _paused = false;
    }

    function paused() public view returns (bool) {
        return _paused;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
        _paused = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Paused(msg.sender);
    }

    function unpause() external onlyOwner whenPaused {
        _paused = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Unpaused(msg.sender);
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
    event Mint(address indexed to, uint256 value);
    event MinterChanged(address account, bool state);

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;

    bool private _allowWhitelistRegistration;
    mapping(address => address) private _referrer;
    mapping(address => uint256) private _refCount;

    event TokenSaleWhitelistRegistered(address indexed addr, address indexed refAddr);
    event TokenSaleWhitelistTransferred(address indexed previousAddr, address indexed _newAddr);
    event TokenSaleWhitelistRegistrationEnabled();
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

    event Donate(address indexed account, uint256 amount);

    constructor() public {
        _minter[msg.sender] = true;
        _allowWhitelistRegistration = true;

        emit TokenSaleWhitelistRegistrationEnabled();

        _referrer[msg.sender] = msg.sender;
        emit TokenSaleWhitelistRegistered(msg.sender, msg.sender);
    }


    function () external payable {
        emit Donate(msg.sender, msg.value);
    }


    function name() public view returns (string memory) {
        return _name;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function symbol() public view returns (string memory) {
        return _symbol;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }


    function decimals() public view returns (uint8) {
        return _decimals;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function cap() public view returns (uint256) {
        return _cap;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function transfer(address to, uint256 value) public whenNotPaused returns (bool) {
        if (_allowWhitelistRegistration && value == _whitelistRegistrationValue	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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

    function approve(address spender, uint256 value) public returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowed[msg.sender][spender].add(addedValue));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowed[msg.sender][spender].sub(subtractedValue));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public whenNotPaused returns (bool) {
        require(_allowed[from][msg.sender] >= value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _transfer(from, to, value);
        _approve(from, msg.sender, _allowed[from][msg.sender].sub(value));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return true;
    }

    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }

    function _approve(address owner, address spender, uint256 value) internal {
        require(owner != address(0));
        require(spender != address(0));

        _allowed[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    modifier onlyMinter() {
        require(_minter[msg.sender]);
        _;
    }

    function isMinter(address account) public view returns (bool) {
        return _minter[account];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function setMinterState(address account, bool state) external onlyOwner {
        _minter[account] = state;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit MinterChanged(account, state);
    }

    function mint(address to, uint256 value) public onlyMinter returns (bool) {
        _mint(to, value);
        return true;
    }

    function _mint(address account, uint256 value) internal {
        require(_totalSupply.add(value) <= _cap);
        require(account != address(0));

        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Mint(account, value);
        emit Transfer(address(0), account, value);
    }

    modifier onlyInWhitelist() {
        require(_referrer[msg.sender] != address(0));
        _;
    }

    function allowWhitelistRegistration() public view returns (bool) {
        return _allowWhitelistRegistration;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function inWhitelist(address account) public view returns (bool) {
        return _referrer[account] != address(0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }


    function referrer(address account) public view returns (address) {
        return _referrer[account];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function refCount(address account) public view returns (uint256) {
        return _refCount[account];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }


    function disableTokenSaleWhitelistRegistration() external onlyOwner {
        _allowWhitelistRegistration = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit TokenSaleWhitelistRegistrationDisabled();
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

    function transferWhitelist(address account) external onlyInWhitelist {
        require(isNotContract(account));

        _refCount[account]    = _refCount[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _refCount[msg.sender] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _referrer[account]    = _referrer[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _referrer[msg.sender] = address(0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        emit TokenSaleWhitelistTransferred(msg.sender, account);
    }


    function isNotContract(address addr) internal view returns (bool) {
        uint size;
        assembly {
            size := extcodesize(addr)
        }
        return size == 0;
    }

    function calculateTheRewardOfDirectWhitelistRegistration(address whitelistedAccount) external view returns (uint256 reward) {
        if (!inWhitelist(whitelistedAccount)) {
            return 0;
        }

        address cursor = whitelistedAccount;
        uint256 remain = _whitelistRegistrationValue;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        for(uint i = 1; i < _whitelistRefRewards.length; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            address receiver = _referrer[cursor];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

            if (cursor != receiver) {
                if (_refCount[receiver] > i) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                    remain = remain.sub(_whitelistRefRewards[i]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                }
            } else {
                reward = reward.add(remain);
                break;
            }

            cursor = _referrer[cursor];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        return reward;
    }
}