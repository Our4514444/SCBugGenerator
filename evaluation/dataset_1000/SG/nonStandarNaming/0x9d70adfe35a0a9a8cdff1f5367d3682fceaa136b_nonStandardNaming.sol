pragma solidity ^0.5.7;



library SafeMath {
    function ADD604(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        c = a + b;
        assert(c >= a);
        return c;
    }

    function SUB476(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function MUL827(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV728(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return a / b;
    }

    function MOD329(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}



interface IERC20{
    function NAME121() external view returns (string memory);	//inject NONSTANDARD NAMING
    function SYMBOL759() external view returns (string memory);	//inject NONSTANDARD NAMING
    function DECIMALS763() external view returns (uint8);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY758() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF918(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER304(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM337(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE869(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE643(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER231(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL175(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


contract Ownable {
    address internal _owner;

    event OWNERSHIPTRANSFERRED750(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED750(address(0), _owner);
    }

    function OWNER139() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

    modifier ONLYOWNER416() {	//inject NONSTANDARD NAMING
        require(msg.sender == _owner);
        _;
    }

    function TRANSFEROWNERSHIP254(address newOwner) external ONLYOWNER416 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        _owner = newOwner;
        emit OWNERSHIPTRANSFERRED750(_owner, newOwner);
    }

    function RESCUETOKENS736(address tokenAddress, address receiver, uint256 amount) external ONLYOWNER416 {	//inject NONSTANDARD NAMING
        IERC20 _token = IERC20(tokenAddress);
        require(receiver != address(0));
        uint256 balance = _token.BALANCEOF918(address(this));

        require(balance >= amount);
        assert(_token.TRANSFER304(receiver, amount));
    }

    function WITHDRAWETHER474(address payable to, uint256 amount) external ONLYOWNER416 {	//inject NONSTANDARD NAMING
        require(to != address(0));

        uint256 balance = address(this).balance;

        require(balance >= amount);
        to.transfer(amount);
    }
}


contract Pausable is Ownable {
    bool private _paused;

    event PAUSED196(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED37(address account);	//inject NONSTANDARD NAMING

    constructor () internal {
        _paused = false;
    }

    function PAUSED923() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

    modifier WHENNOTPAUSED150() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

    modifier WHENPAUSED377() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

    function PAUSE600() external ONLYOWNER416 WHENNOTPAUSED150 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED196(msg.sender);
    }

    function UNPAUSE624() external ONLYOWNER416 WHENPAUSED377 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED37(msg.sender);
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
    event MINT52(address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event MINTERCHANGED110(address account, bool state);	//inject NONSTANDARD NAMING

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;

    bool private _allowWhitelistRegistration;
    mapping(address => address) private _referrer;
    mapping(address => uint256) private _refCount;

    event TOKENSALEWHITELISTREGISTERED705(address indexed addr, address indexed refAddr);	//inject NONSTANDARD NAMING
    event TOKENSALEWHITELISTTRANSFERRED753(address indexed previousAddr, address indexed _newAddr);	//inject NONSTANDARD NAMING
    event TOKENSALEWHITELISTREGISTRATIONENABLED265();	//inject NONSTANDARD NAMING
    event TOKENSALEWHITELISTREGISTRATIONDISABLED723();	//inject NONSTANDARD NAMING

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

    event DONATE211(address indexed account, uint256 amount);	//inject NONSTANDARD NAMING

    constructor() public {
        _minter[msg.sender] = true;
        _allowWhitelistRegistration = true;

        emit TOKENSALEWHITELISTREGISTRATIONENABLED265();

        _referrer[msg.sender] = msg.sender;
        emit TOKENSALEWHITELISTREGISTERED705(msg.sender, msg.sender);
    }


    function () external payable {
        emit DONATE211(msg.sender, msg.value);
    }


    function NAME121() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL759() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }


    function DECIMALS763() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }

    function CAP665() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }

    function TOTALSUPPLY758() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF918(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

    function ALLOWANCE643(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

    function TRANSFER304(address to, uint256 value) public WHENNOTPAUSED150 returns (bool) {	//inject NONSTANDARD NAMING
        if (_allowWhitelistRegistration && value == _whitelistRegistrationValue
        && INWHITELIST475(to) && !INWHITELIST475(msg.sender) && ISNOTCONTRACT342(msg.sender)) {
            // Register whitelist for TM Token-Sale
            _REGWHITELIST858(msg.sender, to);
            return true;
        } else {
            // Normal Transfer
            _TRANSFER630(msg.sender, to, value);
            return true;
        }
    }

    function APPROVE869(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE145(msg.sender, spender, value);
        return true;
    }

    function INCREASEALLOWANCE775(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE145(msg.sender, spender, _allowed[msg.sender][spender].ADD604(addedValue));
        return true;
    }

    function DECREASEALLOWANCE557(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE145(msg.sender, spender, _allowed[msg.sender][spender].SUB476(subtractedValue));
        return true;
    }

    function TRANSFERFROM337(address from, address to, uint256 value) public WHENNOTPAUSED150 returns (bool) {	//inject NONSTANDARD NAMING
        require(_allowed[from][msg.sender] >= value);
        _TRANSFER630(from, to, value);
        _APPROVE145(from, msg.sender, _allowed[from][msg.sender].SUB476(value));
        return true;
    }

    function _TRANSFER630(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB476(value);
        _balances[to] = _balances[to].ADD604(value);
        emit TRANSFER231(from, to, value);
    }

    function _APPROVE145(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0));
        require(spender != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL175(owner, spender, value);
    }

    modifier ONLYMINTER588() {	//inject NONSTANDARD NAMING
        require(_minter[msg.sender]);
        _;
    }

    function ISMINTER799(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minter[account];
    }

    function SETMINTERSTATE72(address account, bool state) external ONLYOWNER416 {	//inject NONSTANDARD NAMING
        _minter[account] = state;
        emit MINTERCHANGED110(account, state);
    }

    function MINT106(address to, uint256 value) public ONLYMINTER588 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT628(to, value);
        return true;
    }

    function _MINT628(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(_totalSupply.ADD604(value) <= _cap);
        require(account != address(0));

        _totalSupply = _totalSupply.ADD604(value);
        _balances[account] = _balances[account].ADD604(value);
        emit MINT52(account, value);
        emit TRANSFER231(address(0), account, value);
    }

    modifier ONLYINWHITELIST213() {	//inject NONSTANDARD NAMING
        require(_referrer[msg.sender] != address(0));
        _;
    }

    function ALLOWWHITELISTREGISTRATION267() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _allowWhitelistRegistration;
    }

    function INWHITELIST475(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _referrer[account] != address(0);
    }


    function REFERRER495(address account) public view returns (address) {	//inject NONSTANDARD NAMING
        return _referrer[account];
    }

    function REFCOUNT717(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _refCount[account];
    }


    function DISABLETOKENSALEWHITELISTREGISTRATION924() external ONLYOWNER416 {	//inject NONSTANDARD NAMING
        _allowWhitelistRegistration = false;
        emit TOKENSALEWHITELISTREGISTRATIONDISABLED723();
    }


    function _REGWHITELIST858(address account, address refAccount) internal {	//inject NONSTANDARD NAMING
        _refCount[refAccount] = _refCount[refAccount].ADD604(1);
        _referrer[account] = refAccount;

        emit TOKENSALEWHITELISTREGISTERED705(account, refAccount);

        // Whitelist Registration Referral Reward
        _TRANSFER630(msg.sender, address(this), _whitelistRegistrationValue);
        address cursor = account;
        uint256 remain = _whitelistRegistrationValue;
        for(uint i = 0; i < _whitelistRefRewards.length; i++) {
            address receiver = _referrer[cursor];

            if (cursor != receiver) {
                if (_refCount[receiver] > i) {
                    _TRANSFER630(address(this), receiver, _whitelistRefRewards[i]);
                    remain = remain.SUB476(_whitelistRefRewards[i]);
                }
            } else {
               // _transfer(address(this), refAccount, remain);
                break;
            }

            cursor = _referrer[cursor];
        }
    }

    function TRANSFERWHITELIST768(address account) external ONLYINWHITELIST213 {	//inject NONSTANDARD NAMING
        require(ISNOTCONTRACT342(account));

        _refCount[account]    = _refCount[msg.sender];
        _refCount[msg.sender] = 0;
        _referrer[account]    = _referrer[msg.sender];
        _referrer[msg.sender] = address(0);

        emit TOKENSALEWHITELISTTRANSFERRED753(msg.sender, account);
    }


    function ISNOTCONTRACT342(address addr) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint size;
        assembly {
            size := extcodesize(addr)
        }
        return size == 0;
    }

    function CALCULATETHEREWARDOFDIRECTWHITELISTREGISTRATION454(address whitelistedAccount) external view returns (uint256 reward) {	//inject NONSTANDARD NAMING
        if (!INWHITELIST475(whitelistedAccount)) {
            return 0;
        }

        address cursor = whitelistedAccount;
        uint256 remain = _whitelistRegistrationValue;
        for(uint i = 1; i < _whitelistRefRewards.length; i++) {
            address receiver = _referrer[cursor];

            if (cursor != receiver) {
                if (_refCount[receiver] > i) {
                    remain = remain.SUB476(_whitelistRefRewards[i]);
                }
            } else {
                reward = reward.ADD604(remain);
                break;
            }

            cursor = _referrer[cursor];
        }

        return reward;
    }
}