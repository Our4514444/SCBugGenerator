                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY178() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF241(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER460(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE870(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE664(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM400(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER355(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL778(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER202() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA826() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED638(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    constructor () internal {
        _owner = _MSGSENDER202();
        emit OWNERSHIPTRANSFERRED638(address(0), _owner);
    }
    function OWNER140() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }
    modifier ONLYOWNER251() {	//inject NONSTANDARD NAMING
        require(ISOWNER715(), "Ownable: caller is not the owner");
        _;
    }
    function ISOWNER715() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER202() == _owner;
    }
    function RENOUNCEOWNERSHIP0() public ONLYOWNER251 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED638(_owner, address(0));
        _owner = address(0);
    }
    function TRANSFEROWNERSHIP486(address newOwner) public ONLYOWNER251 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP166(newOwner);
    }
    function _TRANSFEROWNERSHIP166(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED638(_owner, newOwner);
        _owner = newOwner;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;
    function TOTALSUPPLY178() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF241(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER460(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER968(_MSGSENDER202(), recipient, amount);
        return true;
    }
    function ALLOWANCE870(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE664(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE272(_MSGSENDER202(), spender, amount);
        return true;
    }
    function TRANSFERFROM400(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER968(sender, recipient, amount);
        _APPROVE272(sender, _MSGSENDER202(), _allowances[sender][_MSGSENDER202()].SUB460(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE840(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE272(_MSGSENDER202(), spender, _allowances[_MSGSENDER202()][spender].ADD1000(addedValue));
        return true;
    }
    function DECREASEALLOWANCE4(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE272(_MSGSENDER202(), spender, _allowances[_MSGSENDER202()][spender].SUB460(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER968(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB460(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD1000(amount);
        emit TRANSFER355(sender, recipient, amount);
    }
    function _MINT522(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD1000(amount);
        _balances[account] = _balances[account].ADD1000(amount);
        emit TRANSFER355(address(0), account, amount);
    }
    function _BURN674(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB460(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB460(amount);
        emit TRANSFER355(account, address(0), amount);
    }
    function _APPROVE272(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL778(owner, spender, amount);
    }
    function _BURNFROM145(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN674(account, amount);
        _APPROVE272(account, _MSGSENDER202(), _allowances[account][_MSGSENDER202()].SUB460(amount, "ERC20: burn amount exceeds allowance"));
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
    function NAME594() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL243() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS986() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD1000(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB460(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB460(a, b, "SafeMath: subtraction overflow");
    }
    function SUB460(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL894(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV834(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV834(a, b, "SafeMath: division by zero");
    }
    function DIV834(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD307(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD307(a, b, "SafeMath: modulo by zero");
    }
    function MOD307(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT735(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE677(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE946(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER963(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN315(token, abi.encodeWithSelector(token.TRANSFER460.selector, to, value));
    }

    function SAFETRANSFERFROM238(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN315(token, abi.encodeWithSelector(token.TRANSFERFROM400.selector, from, to, value));
    }

    function SAFEAPPROVE369(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE870(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN315(token, abi.encodeWithSelector(token.APPROVE664.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE730(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE870(address(this), spender).ADD1000(value);
        CALLOPTIONALRETURN315(token, abi.encodeWithSelector(token.APPROVE664.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE12(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE870(address(this), spender).SUB460(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN315(token, abi.encodeWithSelector(token.APPROVE664.selector, spender, newAllowance));
    }
    function CALLOPTIONALRETURN315(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT735(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface Controller {
    function WITHDRAW507(address, uint) external;	//inject NONSTANDARD NAMING
    function BALANCEOF241(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function EARN851(address, uint) external;	//inject NONSTANDARD NAMING
}

contract insuredVault is ERC20, ERC20Detailed {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    IERC20 public token;
    
    address public governance;
    address public controller;
    
    uint public fees;
    uint public weeklyFee = 10;
    uint public initiationFee = 100;
    uint public max = 100000;
    
    uint public lastFeeCollectedBlock;
    uint public constant duration509 = 7 days; //52 weeks	//inject NONSTANDARD NAMING
    
    function CLAIMFEE332() external {	//inject NONSTANDARD NAMING
        require(block.number > lastFeeCollectedBlock.ADD1000(duration509), "claimed");
        uint _fees = BALANCE477().MUL894(weeklyFee).MUL894(max); // 0.01% / week ~ 0.5% per year
        fees.ADD1000(_fees);
        lastFeeCollectedBlock = block.number;
    }
    
    function SETWEEKLYFEE492(uint _weeklyFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        weeklyFee = _weeklyFee;
    }
    
    function SETINITIATIONFEE347(uint _initiationFee) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        initiationFee = _initiationFee;
    }
    
    constructor (address _token, address _controller) public ERC20Detailed(
        string(abi.encodePacked("yinsured ", ERC20Detailed(_token).NAME594())),
        string(abi.encodePacked("yi", ERC20Detailed(_token).SYMBOL243())),
        ERC20Detailed(_token).DECIMALS986()
    ) {
        token = IERC20(_token);
        governance = msg.sender;
        controller = _controller;
    }
    
    function BALANCE477() public view returns (uint) {	//inject NONSTANDARD NAMING
        return token.BALANCEOF241(address(this)).SUB460(fees);
    }
    
    function SETGOVERNANCE516(address _governance) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER878(address _controller) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
    
    function COLLECT237() public {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        token.SAFETRANSFER963(controller, fees);
        fees = 0;
    }
    
    function DEPOSITALL297() external {	//inject NONSTANDARD NAMING
        DEPOSIT561(token.BALANCEOF241(msg.sender));
    }
    
    function DEPOSIT561(uint _amount) public {	//inject NONSTANDARD NAMING
        uint _pool = BALANCE477();
        uint _before = token.BALANCEOF241(address(this));
        token.SAFETRANSFERFROM238(msg.sender, address(this), _amount);
        uint _after = token.BALANCEOF241(address(this));
        _amount = _after.SUB460(_before); // Additional check for deflationary tokens
        
        uint _fees = _amount.MUL894(initiationFee).DIV834(max);
        _amount = _amount.SUB460(_fees);
        fees = fees.ADD1000(_fees);
        
        uint shares = 0;
        if (TOTALSUPPLY178() == 0) {
            shares = _amount;
        } else {
            shares = (_amount.MUL894(TOTALSUPPLY178())).DIV834(_pool);
        }
        _MINT522(msg.sender, shares);
    }
    
    function WITHDRAWALL376() external {	//inject NONSTANDARD NAMING
        WITHDRAW507(BALANCEOF241(msg.sender));
    }
    
    // No rebalance implementation for lower fees and faster swaps
    function WITHDRAW507(uint _shares) public {	//inject NONSTANDARD NAMING
        uint r = (BALANCE477().MUL894(_shares)).DIV834(TOTALSUPPLY178());
        _BURN674(msg.sender, _shares);
        
        // Check balance
        uint b = token.BALANCEOF241(address(this));
        if (b < r) {
            uint _withdraw = r.SUB460(b);
            Controller(controller).WITHDRAW507(address(token), _withdraw);
            uint _after = token.BALANCEOF241(address(this));
            uint _diff = _after.SUB460(b);
            if (_diff < _withdraw) {
                r = b.ADD1000(_diff);
            }
        }
        
        token.SAFETRANSFER963(msg.sender, r);
    }
    
    function GETPRICEPERFULLSHARE910() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCE477().MUL894(1e18).DIV834(TOTALSUPPLY178());
    }
}