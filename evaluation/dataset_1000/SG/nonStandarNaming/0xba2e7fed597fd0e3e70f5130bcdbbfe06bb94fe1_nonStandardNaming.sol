                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY380() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF429(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER892(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE572(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE489(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM752(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER513(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL396(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER962() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA137() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;
    function TOTALSUPPLY380() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF429(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER892(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER373(_MSGSENDER962(), recipient, amount);
        return true;
    }
    function ALLOWANCE572(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE489(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE655(_MSGSENDER962(), spender, amount);
        return true;
    }
    function TRANSFERFROM752(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER373(sender, recipient, amount);
        _APPROVE655(sender, _MSGSENDER962(), _allowances[sender][_MSGSENDER962()].SUB390(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE319(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE655(_MSGSENDER962(), spender, _allowances[_MSGSENDER962()][spender].ADD775(addedValue));
        return true;
    }
    function DECREASEALLOWANCE601(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE655(_MSGSENDER962(), spender, _allowances[_MSGSENDER962()][spender].SUB390(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER373(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB390(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD775(amount);
        emit TRANSFER513(sender, recipient, amount);
    }
    function _MINT887(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD775(amount);
        _balances[account] = _balances[account].ADD775(amount);
        emit TRANSFER513(address(0), account, amount);
    }
    function _BURN889(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB390(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB390(amount);
        emit TRANSFER513(account, address(0), amount);
    }
    function _APPROVE655(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL396(owner, spender, amount);
    }
    function _BURNFROM198(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN889(account, amount);
        _APPROVE655(account, _MSGSENDER962(), _allowances[account][_MSGSENDER962()].SUB390(amount, "ERC20: burn amount exceeds allowance"));
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
    function NAME902() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL297() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS716() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD775(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB390(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB390(a, b, "SafeMath: subtraction overflow");
    }
    function SUB390(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL503(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV21(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV21(a, b, "SafeMath: division by zero");
    }
    function DIV21(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD960(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD960(a, b, "SafeMath: modulo by zero");
    }
    function MOD960(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT862(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE901(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE401(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER767(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN315(token, abi.encodeWithSelector(token.TRANSFER892.selector, to, value));
    }

    function SAFETRANSFERFROM569(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN315(token, abi.encodeWithSelector(token.TRANSFERFROM752.selector, from, to, value));
    }

    function SAFEAPPROVE471(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE572(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN315(token, abi.encodeWithSelector(token.APPROVE489.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE858(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE572(address(this), spender).ADD775(value);
        CALLOPTIONALRETURN315(token, abi.encodeWithSelector(token.APPROVE489.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE136(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE572(address(this), spender).SUB390(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN315(token, abi.encodeWithSelector(token.APPROVE489.selector, spender, newAllowance));
    }
    function CALLOPTIONALRETURN315(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT862(), "SafeERC20: call to non-contract");

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
    function WITHDRAW336(address, uint) external;	//inject NONSTANDARD NAMING
    function BALANCEOF429(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function EARN789(address, uint) external;	//inject NONSTANDARD NAMING
}

contract yVault is ERC20, ERC20Detailed {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    IERC20 public token;
    
    uint public min = 9500;
    uint public constant max605 = 10000;	//inject NONSTANDARD NAMING
    
    address public governance;
    address public controller;
    
    constructor (address _token, address _controller) public ERC20Detailed(
        string(abi.encodePacked("yearn ", ERC20Detailed(_token).NAME902())),
        string(abi.encodePacked("y", ERC20Detailed(_token).SYMBOL297())),
        ERC20Detailed(_token).DECIMALS716()
    ) {
        token = IERC20(_token);
        governance = msg.sender;
        controller = _controller;
    }
    
    function BALANCE283() public view returns (uint) {	//inject NONSTANDARD NAMING
        return token.BALANCEOF429(address(this))
                .ADD775(Controller(controller).BALANCEOF429(address(token)));
    }
    
    function SETMIN874(uint _min) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        min = _min;
    }
    
    function SETGOVERNANCE878(address _governance) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function SETCONTROLLER845(address _controller) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }
    
    // Custom logic in here for how much the vault allows to be borrowed
    // Sets minimum required on-hand to keep small withdrawals cheap
    function AVAILABLE600() public view returns (uint) {	//inject NONSTANDARD NAMING
        return token.BALANCEOF429(address(this)).MUL503(min).DIV21(max605);
    }
    
    function EARN789() public {	//inject NONSTANDARD NAMING
        uint _bal = AVAILABLE600();
        token.SAFETRANSFER767(controller, _bal);
        Controller(controller).EARN789(address(token), _bal);
    }
    
    function DEPOSITALL274() external {	//inject NONSTANDARD NAMING
        DEPOSIT848(token.BALANCEOF429(msg.sender));
    }
    
    function DEPOSIT848(uint _amount) public {	//inject NONSTANDARD NAMING
        uint _pool = BALANCE283();
        uint _before = token.BALANCEOF429(address(this));
        token.SAFETRANSFERFROM569(msg.sender, address(this), _amount);
        uint _after = token.BALANCEOF429(address(this));
        _amount = _after.SUB390(_before); // Additional check for deflationary tokens
        uint shares = 0;
        if (TOTALSUPPLY380() == 0) {
            shares = _amount;
        } else {
            shares = (_amount.MUL503(TOTALSUPPLY380())).DIV21(_pool);
        }
        _MINT887(msg.sender, shares);
    }
    
    function WITHDRAWALL177() external {	//inject NONSTANDARD NAMING
        WITHDRAW336(BALANCEOF429(msg.sender));
    }
    
    
    // Used to swap any borrowed reserve over the debt limit to liquidate to 'token'
    function HARVEST783(address reserve, uint amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(reserve != address(token), "token");
        IERC20(reserve).SAFETRANSFER767(controller, amount);
    }
    
    // No rebalance implementation for lower fees and faster swaps
    function WITHDRAW336(uint _shares) public {	//inject NONSTANDARD NAMING
        uint r = (BALANCE283().MUL503(_shares)).DIV21(TOTALSUPPLY380());
        _BURN889(msg.sender, _shares);
        
        // Check balance
        uint b = token.BALANCEOF429(address(this));
        if (b < r) {
            uint _withdraw = r.SUB390(b);
            Controller(controller).WITHDRAW336(address(token), _withdraw);
            uint _after = token.BALANCEOF429(address(this));
            uint _diff = _after.SUB390(b);
            if (_diff < _withdraw) {
                r = b.ADD775(_diff);
            }
        }
        
        token.SAFETRANSFER767(msg.sender, r);
    }
    
    function GETPRICEPERFULLSHARE972() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCE283().MUL503(1e18).DIV21(TOTALSUPPLY380());
    }
}