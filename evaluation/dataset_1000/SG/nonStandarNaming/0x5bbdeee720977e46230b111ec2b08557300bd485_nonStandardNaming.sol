                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY989() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF74(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER55(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE387(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE864(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM351(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER611(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL123(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER939() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY989() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF74(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER55(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER429(_MSGSENDER939(), recipient, amount);
        return true;
    }
    function ALLOWANCE387(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE864(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE189(_MSGSENDER939(), spender, amount);
        return true;
    }
    function TRANSFERFROM351(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER429(sender, recipient, amount);
        _APPROVE189(sender, _MSGSENDER939(), _allowances[sender][_MSGSENDER939()].SUB902(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE850(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE189(_MSGSENDER939(), spender, _allowances[_MSGSENDER939()][spender].ADD518(addedValue));
        return true;
    }
    function DECREASEALLOWANCE236(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE189(_MSGSENDER939(), spender, _allowances[_MSGSENDER939()][spender].SUB902(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER429(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB902(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD518(amount);
        emit TRANSFER611(sender, recipient, amount);
    }
    function _MINT777(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD518(amount);
        _balances[account] = _balances[account].ADD518(amount);
        emit TRANSFER611(address(0), account, amount);
    }
    function _BURN552(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].SUB902(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB902(amount);
        emit TRANSFER611(account, address(0), amount);
    }
    function _APPROVE189(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL123(owner, spender, amount);
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
    function NAME785() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL497() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS623() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD518(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB902(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB902(a, b, "SafeMath: subtraction overflow");
    }
    function SUB902(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL462(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV656(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV656(a, b, "SafeMath: division by zero");
    }
    function DIV656(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract SilkyFinance is ERC20, ERC20Detailed {
  using SafeMath for uint;
  uint256 _total = 10000;
  constructor () public ERC20Detailed("Silky Finance", "SILKY", 18) {
      _MINT777( msg.sender, _total*10**uint(DECIMALS623()) );
  }
}