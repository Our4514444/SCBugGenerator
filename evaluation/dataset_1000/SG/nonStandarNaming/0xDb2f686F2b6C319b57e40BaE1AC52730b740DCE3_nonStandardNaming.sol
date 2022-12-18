                                                                 

                                                                 

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY504() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF237(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER450(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE831(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE5(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM998(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER1(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL292(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    function ADD637(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB277(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB277(a, b, "SafeMath: subtraction overflow");
    }
    function SUB277(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL26(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV731(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV731(a, b, "SafeMath: division by zero");
    }
    function DIV731(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

contract ERC20 is IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY504() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF237(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER450(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER842(msg.sender, recipient, amount);
        return true;
    }
    function ALLOWANCE831(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE5(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE270(msg.sender, spender, amount);
        return true;
    }
    function TRANSFERFROM998(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER842(sender, recipient, amount);
        _APPROVE270(sender, msg.sender, _allowances[sender][msg.sender].SUB277(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE759(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE270(msg.sender, spender, _allowances[msg.sender][spender].ADD637(addedValue));
        return true;
    }
    function DECREASEALLOWANCE149(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE270(msg.sender, spender, _allowances[msg.sender][spender].SUB277(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER842(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB277(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD637(amount);
        emit TRANSFER1(sender, recipient, amount);
    }
    function _MINT974(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD637(amount);
        _balances[account] = _balances[account].ADD637(amount);
        emit TRANSFER1(address(0), account, amount);
    }
    function _BURN737(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB277(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB277(amount);
        emit TRANSFER1(account, address(0), amount);
    }
    function _APPROVE270(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL292(owner, spender, amount);
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
    function NAME451() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL988() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS769() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

interface BondingCurve {
    function CALCULATEPURCHASERETURN575(uint _supply,  uint _reserveBalance, uint32 _reserveRatio, uint _depositAmount) external view returns (uint);	//inject NONSTANDARD NAMING
    function CALCULATESALERETURN516(uint _supply, uint _reserveBalance, uint32 _reserveRatio, uint _sellAmount) external view returns (uint);	//inject NONSTANDARD NAMING
}

contract ContinuousToken is ERC20 {
    using SafeMath for uint;

    uint public scale = 10**18;
    uint public reserveBalance = 1*10**15;
    uint32 public reserveRatio;
    
    BondingCurve constant public curve983 = BondingCurve(0x16F6664c16beDE5d70818654dEfef11769D40983);	//inject NONSTANDARD NAMING

    function _BUY132(uint _amount) internal returns (uint _bought) {	//inject NONSTANDARD NAMING
        _bought = _CONTINUOUSMINT229(_amount);
    }

    function _SELL839(uint _amount) internal returns (uint _sold) {	//inject NONSTANDARD NAMING
        _sold = _CONTINUOUSBURN160(_amount);
    }

    function CALCULATECONTINUOUSMINTRETURN134(uint _amount) public view returns (uint mintAmount) {	//inject NONSTANDARD NAMING
        return curve983.CALCULATEPURCHASERETURN575(TOTALSUPPLY504(), reserveBalance, uint32(reserveRatio), _amount);
    }

    function CALCULATECONTINUOUSBURNRETURN992(uint _amount) public view returns (uint burnAmount) {	//inject NONSTANDARD NAMING
        return curve983.CALCULATESALERETURN516(TOTALSUPPLY504(), reserveBalance, uint32(reserveRatio), _amount);
    }

    function _CONTINUOUSMINT229(uint _deposit) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint amount = CALCULATECONTINUOUSMINTRETURN134(_deposit);
        reserveBalance = reserveBalance.ADD637(_deposit);
        return amount;
    }

    function _CONTINUOUSBURN160(uint _amount) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint reimburseAmount = CALCULATECONTINUOUSBURNRETURN992(_amount);
        reserveBalance = reserveBalance.SUB277(reimburseAmount);
        return reimburseAmount;
    }
}

contract EminenceCurrency is ContinuousToken, ERC20Detailed {
    mapping(address => bool) public gamemasters;
    mapping(address => bool) public npcs;
    
    event ADDGM67(address indexed newGM, address indexed gm);	//inject NONSTANDARD NAMING
    event REVOKEGM14(address indexed newGM, address indexed gm);	//inject NONSTANDARD NAMING
    event ADDNPC588(address indexed newNPC, address indexed gm);	//inject NONSTANDARD NAMING
    event REVOKENPC27(address indexed newNPC, address indexed gm);	//inject NONSTANDARD NAMING
    event CASHSHOPBUY675(address _from, uint  _amount, uint _deposit);	//inject NONSTANDARD NAMING
    event CASHSHOPSELL617(address _from, uint  _amount, uint _reimbursement);	//inject NONSTANDARD NAMING
    
    IERC20 constant public dai181 = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);	//inject NONSTANDARD NAMING
    
    constructor (string memory name, string memory symbol, uint32 _reserveRatio) public ERC20Detailed(name, symbol, 18) {
        gamemasters[msg.sender] = true;
        reserveRatio = _reserveRatio;
        _MINT974(msg.sender, 1*scale);
    }
    function ADDNPC104(address _npc) external {	//inject NONSTANDARD NAMING
        require(gamemasters[msg.sender], "!gm");
        npcs[_npc] = true;
        emit ADDNPC588(_npc, msg.sender);
    }
    function REVOKENPC612(address _npc) external {	//inject NONSTANDARD NAMING
        require(gamemasters[msg.sender], "!gm");
        npcs[_npc] = false;
        emit REVOKENPC27(_npc, msg.sender);
    }
    function ADDGM515(address _gm) external {	//inject NONSTANDARD NAMING
        require(gamemasters[msg.sender]||gamemasters[tx.origin], "!gm");
        gamemasters[_gm] = true;
        emit ADDGM67(_gm, msg.sender);
    }
    function REVOKEGM446(address _gm) external {	//inject NONSTANDARD NAMING
        require(gamemasters[msg.sender], "!gm");
        gamemasters[_gm] = false;
        emit REVOKEGM14(_gm, msg.sender);
    }
    function AWARD325(address _to, uint _amount) external {	//inject NONSTANDARD NAMING
        require(gamemasters[msg.sender], "!gm");
        _MINT974(_to, _amount);
    }
    function CLAIM937(address _from, uint _amount) external {	//inject NONSTANDARD NAMING
        require(gamemasters[msg.sender]||npcs[msg.sender], "!gm");
        _BURN737(_from, _amount);
    }
    function BUY84(uint _amount, uint _min) external returns (uint _bought) {	//inject NONSTANDARD NAMING
        _bought = _BUY132(_amount);
        require(_bought >= _min, "slippage");
        dai181.TRANSFERFROM998(msg.sender, address(this), _amount);
        _MINT974(msg.sender, _bought);
        emit CASHSHOPBUY675(msg.sender, _bought, _amount);
    }
    function SELL825(uint _amount, uint _min) external returns (uint _bought) {	//inject NONSTANDARD NAMING
        _bought = _SELL839(_amount);
        require(_bought >= _min, "slippage");
        _BURN737(msg.sender, _amount);
        dai181.TRANSFER450(msg.sender, _bought);
        emit CASHSHOPSELL617(msg.sender, _amount, _bought);
    }
}