                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY505() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF222(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER806(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE564(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE841(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM722(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER697(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL785(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER45() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA479() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;
    function TOTALSUPPLY505() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF222(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER806(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER238(_MSGSENDER45(), recipient, amount);
        return true;
    }
    function ALLOWANCE564(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE841(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE979(_MSGSENDER45(), spender, amount);
        return true;
    }
    function TRANSFERFROM722(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER238(sender, recipient, amount);
        _APPROVE979(sender, _MSGSENDER45(), _allowances[sender][_MSGSENDER45()].SUB681(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE152(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE979(_MSGSENDER45(), spender, _allowances[_MSGSENDER45()][spender].ADD576(addedValue));
        return true;
    }
    function DECREASEALLOWANCE694(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE979(_MSGSENDER45(), spender, _allowances[_MSGSENDER45()][spender].SUB681(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER238(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB681(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD576(amount);
        emit TRANSFER697(sender, recipient, amount);
    }
    function _MINT452(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD576(amount);
        _balances[account] = _balances[account].ADD576(amount);
        emit TRANSFER697(address(0), account, amount);
    }
    function _BURN972(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB681(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB681(amount);
        emit TRANSFER697(account, address(0), amount);
    }
    function _APPROVE979(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL785(owner, spender, amount);
    }
    function _BURNFROM265(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN972(account, amount);
        _APPROVE979(account, _MSGSENDER45(), _allowances[account][_MSGSENDER45()].SUB681(amount, "ERC20: burn amount exceeds allowance"));
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
    function NAME957() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL879() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS430() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD576(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB681(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB681(a, b, "SafeMath: subtraction overflow");
    }
    function SUB681(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL139(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV674(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV674(a, b, "SafeMath: division by zero");
    }
    function DIV674(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD513(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD513(a, b, "SafeMath: modulo by zero");
    }
    function MOD513(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT611(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE195(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE396(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER285(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN695(token, abi.encodeWithSelector(token.TRANSFER806.selector, to, value));
    }

    function SAFETRANSFERFROM822(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN695(token, abi.encodeWithSelector(token.TRANSFERFROM722.selector, from, to, value));
    }

    function SAFEAPPROVE452(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE564(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN695(token, abi.encodeWithSelector(token.APPROVE841.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE692(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE564(address(this), spender).ADD576(value);
        CALLOPTIONALRETURN695(token, abi.encodeWithSelector(token.APPROVE841.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE590(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE564(address(this), spender).SUB681(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN695(token, abi.encodeWithSelector(token.APPROVE841.selector, spender, newAllowance));
    }
    function CALLOPTIONALRETURN695(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT611(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface WETH {
    function DEPOSIT771() external payable;	//inject NONSTANDARD NAMING
    function WITHDRAW804(uint wad) external;	//inject NONSTANDARD NAMING
    event DEPOSIT714(address indexed dst, uint wad);	//inject NONSTANDARD NAMING
    event WITHDRAWAL10(address indexed src, uint wad);	//inject NONSTANDARD NAMING
}

interface Controller {
    function WITHDRAW804(address, uint) external;	//inject NONSTANDARD NAMING
    function BALANCEOF222(address) external view returns (uint);	//inject NONSTANDARD NAMING
    function EARN293(address, uint) external;	//inject NONSTANDARD NAMING
}

contract yVault is ERC20, ERC20Detailed {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;

    IERC20 public token;

    uint public min = 9990;
    uint public constant max377 = 10000;	//inject NONSTANDARD NAMING

    address public governance;
    address public controller;

    constructor (address _token, address _controller) public ERC20Detailed(
        string(abi.encodePacked("yearn ", ERC20Detailed(_token).NAME957())),
        string(abi.encodePacked("y", ERC20Detailed(_token).SYMBOL879())),
        ERC20Detailed(_token).DECIMALS430()
    ) {
        token = IERC20(_token);
        governance = msg.sender;
        controller = _controller;
    }

    function BALANCE967() public view returns (uint) {	//inject NONSTANDARD NAMING
        return token.BALANCEOF222(address(this))
                .ADD576(Controller(controller).BALANCEOF222(address(token)));
    }

    function SETMIN82(uint _min) external {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        min = _min;
    }

    function SETGOVERNANCE781(address _governance) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }

    function SETCONTROLLER870(address _controller) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }

    // Custom logic in here for how much the vault allows to be borrowed
    // Sets minimum required on-hand to keep small withdrawals cheap
    function AVAILABLE140() public view returns (uint) {	//inject NONSTANDARD NAMING
        return token.BALANCEOF222(address(this)).MUL139(min).DIV674(max377);
    }

    function EARN293() public {	//inject NONSTANDARD NAMING
        uint _bal = AVAILABLE140();
        token.SAFETRANSFER285(controller, _bal);
        Controller(controller).EARN293(address(token), _bal);
    }

    function DEPOSITALL734() external {	//inject NONSTANDARD NAMING
        DEPOSIT771(token.BALANCEOF222(msg.sender));
    }

    function DEPOSIT771(uint _amount) public {	//inject NONSTANDARD NAMING
        uint _pool = BALANCE967();
        uint _before = token.BALANCEOF222(address(this));
        token.SAFETRANSFERFROM822(msg.sender, address(this), _amount);
        uint _after = token.BALANCEOF222(address(this));
        _amount = _after.SUB681(_before); // Additional check for deflationary tokens
        uint shares = 0;
        if (TOTALSUPPLY505() == 0) {
            shares = _amount;
        } else {
            shares = (_amount.MUL139(TOTALSUPPLY505())).DIV674(_pool);
        }
        _MINT452(msg.sender, shares);
    }

    function DEPOSITETH132() public payable {	//inject NONSTANDARD NAMING
        uint _pool = BALANCE967();
        uint _before = token.BALANCEOF222(address(this));
        uint _amount = msg.value;
        WETH(address(token)).DEPOSIT771.value(_amount)();
        uint _after = token.BALANCEOF222(address(this));
        _amount = _after.SUB681(_before); // Additional check for deflationary tokens
        uint shares = 0;
        if (TOTALSUPPLY505() == 0) {
            shares = _amount;
        } else {
            shares = (_amount.MUL139(TOTALSUPPLY505())).DIV674(_pool);
        }
        _MINT452(msg.sender, shares);
    }

    function WITHDRAWALL120() external {	//inject NONSTANDARD NAMING
        WITHDRAW804(BALANCEOF222(msg.sender));
    }

    function WITHDRAWALLETH132() external {	//inject NONSTANDARD NAMING
        WITHDRAWETH121(BALANCEOF222(msg.sender));
    }


    // Used to swap any borrowed reserve over the debt limit to liquidate to 'token'
    function HARVEST500(address reserve, uint amount) external {	//inject NONSTANDARD NAMING
        require(msg.sender == controller, "!controller");
        require(reserve != address(token), "token");
        IERC20(reserve).SAFETRANSFER285(controller, amount);
    }

    // No rebalance implementation for lower fees and faster swaps
    function WITHDRAW804(uint _shares) public {	//inject NONSTANDARD NAMING
        uint r = (BALANCE967().MUL139(_shares)).DIV674(TOTALSUPPLY505());
        _BURN972(msg.sender, _shares);

        // Check balance
        uint b = token.BALANCEOF222(address(this));
        if (b < r) {
            uint _withdraw = r.SUB681(b);
            Controller(controller).WITHDRAW804(address(token), _withdraw);
            uint _after = token.BALANCEOF222(address(this));
            uint _diff = _after.SUB681(b);
            if (_diff < _withdraw) {
                r = b.ADD576(_diff);
            }
        }

        token.SAFETRANSFER285(msg.sender, r);
    }

    // No rebalance implementation for lower fees and faster swaps
    function WITHDRAWETH121(uint _shares) public {	//inject NONSTANDARD NAMING
        uint r = (BALANCE967().MUL139(_shares)).DIV674(TOTALSUPPLY505());
        _BURN972(msg.sender, _shares);

        // Check balance
        uint b = token.BALANCEOF222(address(this));
        if (b < r) {
            uint _withdraw = r.SUB681(b);
            Controller(controller).WITHDRAW804(address(token), _withdraw);
            uint _after = token.BALANCEOF222(address(this));
            uint _diff = _after.SUB681(b);
            if (_diff < _withdraw) {
                r = b.ADD576(_diff);
            }
        }

        WETH(address(token)).WITHDRAW804(r);
        address(msg.sender).transfer(r);
    }

    function GETPRICEPERFULLSHARE948() public view returns (uint) {	//inject NONSTANDARD NAMING
        return BALANCE967().MUL139(1e18).DIV674(TOTALSUPPLY505());
    }
}