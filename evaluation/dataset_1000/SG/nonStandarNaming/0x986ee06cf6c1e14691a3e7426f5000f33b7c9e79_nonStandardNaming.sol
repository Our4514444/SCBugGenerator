                                                                 

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY159() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF145(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER176(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE95(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE304(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM773(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER837(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL926(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

interface IDetailed {
    function NAME297() external view returns (string memory);	//inject NONSTANDARD NAMING
    function SYMBOL326() external view returns (string memory);	//inject NONSTANDARD NAMING
    function DECIMALS176() external view returns (uint8);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER136() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA351() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;
    function TOTALSUPPLY159() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF145(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER176(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER489(_MSGSENDER136(), recipient, amount);
        return true;
    }
    function ALLOWANCE95(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE304(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE516(_MSGSENDER136(), spender, amount);
        return true;
    }
    function TRANSFERFROM773(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER489(sender, recipient, amount);
        _APPROVE516(sender, _MSGSENDER136(), _allowances[sender][_MSGSENDER136()].SUB845(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE403(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE516(_MSGSENDER136(), spender, _allowances[_MSGSENDER136()][spender].ADD576(addedValue));
        return true;
    }
    function DECREASEALLOWANCE974(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE516(_MSGSENDER136(), spender, _allowances[_MSGSENDER136()][spender].SUB845(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER489(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB845(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD576(amount);
        emit TRANSFER837(sender, recipient, amount);
    }
    function _MINT529(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD576(amount);
        _balances[account] = _balances[account].ADD576(amount);
        emit TRANSFER837(address(0), account, amount);
    }
    function _BURN399(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB845(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB845(amount);
        emit TRANSFER837(account, address(0), amount);
    }
    function _APPROVE516(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL926(owner, spender, amount);
    }
    function _BURNFROM277(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN399(account, amount);
        _APPROVE516(account, _MSGSENDER136(), _allowances[account][_MSGSENDER136()].SUB845(amount, "ERC20: burn amount exceeds allowance"));
    }
}

library SafeMath {
    function ADD576(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB845(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB845(a, b, "SafeMath: subtraction overflow");
    }
    function SUB845(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL976(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV411(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV411(a, b, "SafeMath: division by zero");
    }
    function DIV411(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD423(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD423(a, b, "SafeMath: modulo by zero");
    }
    function MOD423(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT707(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE923(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE210(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER339(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN266(token, abi.encodeWithSelector(token.TRANSFER176.selector, to, value));
    }

    function SAFETRANSFERFROM914(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN266(token, abi.encodeWithSelector(token.TRANSFERFROM773.selector, from, to, value));
    }

    function SAFEAPPROVE363(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE95(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN266(token, abi.encodeWithSelector(token.APPROVE304.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE580(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE95(address(this), spender).ADD576(value);
        CALLOPTIONALRETURN266(token, abi.encodeWithSelector(token.APPROVE304.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE392(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE95(address(this), spender).SUB845(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN266(token, abi.encodeWithSelector(token.APPROVE304.selector, spender, newAllowance));
    }
    function CALLOPTIONALRETURN266(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT707(), "SafeERC20: call to non-contract");

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
    function WITHDRAW322(address, uint) external;	//inject NONSTANDARD NAMING
    function BALANCEOF145(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function EARN317(address, uint) external;	//inject NONSTANDARD NAMING
}

contract yVault is ERC20 {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;

    IERC20 public token;

    uint public min = 9990;
    uint public constant max885 = 10000;	//inject NONSTANDARD NAMING

    address public governance;
    address public controller;
    
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (address _token, address _controller) public {
        _name = string(abi.encodePacked("yearn ", IDetailed(_token).NAME297()));
        _symbol = string(abi.encodePacked("yv", IDetailed(_token).SYMBOL326()));
        _decimals = IDetailed(_token).DECIMALS176();
        
        token = IERC20(_token);
        governance = msg.sender;
        controller = _controller;
    }
    
    function SETNAME646(string calldata name) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        _name = name;
    }
    
    function SETSYMBOL710(string calldata symbol) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        _symbol = symbol;
    }

    function BALANCE487() public view returns (uint) {	//inject NONSTANDARD NAMING
        return token.BALANCEOF145(address(this))
                .ADD576(Controller(controller).BALANCEOF145(address(token)));
    }

    function SETMIN708(uint _min) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        min = _min;
    }

    function SETGOVERNANCE698(address _governance) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }

    function SETCONTROLLER968(address _controller) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }

    // Custom logic in here for how much the vault allows to be borrowed
    // Sets minimum required on-hand to keep small withdrawals cheap
    function AVAILABLE523() public view returns (uint) {	//inject NONSTANDARD NAMING
        return token.BALANCEOF145(address(this)).MUL976(min).DIV411(max885);
    }

    function EARN317() public {	//inject NONSTANDARD NAMING
        uint _bal = AVAILABLE523();
        token.SAFETRANSFER339(controller, _bal);
        Controller(controller).EARN317(address(token), _bal);
    }

    function DEPOSITALL964() external {	//inject NONSTANDARD NAMING
        DEPOSIT405(token.BALANCEOF145(msg.sender));
    }

    function DEPOSIT405(uint _amount) public {	//inject NONSTANDARD NAMING
        uint _pool = BALANCE487();
        uint _before = token.BALANCEOF145(address(this));
        token.SAFETRANSFERFROM914(msg.sender, address(this), _amount);
        uint _after = token.BALANCEOF145(address(this));
        _amount = _after.SUB845(_before); // Additional check for deflationary tokens
        uint shares = 0;
        if (TOTALSUPPLY159() == 0) {
            shares = _amount;
        } else {
            shares = (_amount.MUL976(TOTALSUPPLY159())).DIV411(_pool);
        }
        _MINT529(msg.sender, shares);
    }

    function WITHDRAWALL921() external {	//inject NONSTANDARD NAMING
        WITHDRAW322(BALANCEOF145(msg.sender));
    }

    // No rebalance implementation for lower fees and faster swaps
    function WITHDRAW322(uint _shares) public {	//inject NONSTANDARD NAMING
        uint r = (BALANCE487().MUL976(_shares)).DIV411(TOTALSUPPLY159());
        _BURN399(msg.sender, _shares);

        // Check balance
        uint b = token.BALANCEOF145(address(this));
        if (b < r) {
            uint _withdraw = r.SUB845(b);
            Controller(controller).WITHDRAW322(address(token), _withdraw);
            uint _after = token.BALANCEOF145(address(this));
            uint _diff = _after.SUB845(b);
            if (_diff < _withdraw) {
                r = b.ADD576(_diff);
            }
        }

        token.SAFETRANSFER339(msg.sender, r);
    }

    function GETPRICEPERFULLSHARE225() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCE487().MUL976(1e18).DIV411(TOTALSUPPLY159());
    }
}