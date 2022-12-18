                                                                 

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY497() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF113(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER748(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE67(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE493(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM815(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER801(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL501(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER941() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY497() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF113(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER748(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER199(_MSGSENDER941(), recipient, amount);
        return true;
    }
    function ALLOWANCE67(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE493(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE748(_MSGSENDER941(), spender, amount);
        return true;
    }
    function TRANSFERFROM815(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER199(sender, recipient, amount);
        _APPROVE748(sender, _MSGSENDER941(), _allowances[sender][_MSGSENDER941()].SUB299(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE998(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE748(_MSGSENDER941(), spender, _allowances[_MSGSENDER941()][spender].ADD540(addedValue));
        return true;
    }
    function DECREASEALLOWANCE421(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE748(_MSGSENDER941(), spender, _allowances[_MSGSENDER941()][spender].SUB299(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER199(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB299(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD540(amount);
        emit TRANSFER801(sender, recipient, amount);
    }
    function _STAKE983(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: stake to the zero address");
        _totalSupply = _totalSupply.ADD540(amount);
        _balances[account] = _balances[account].ADD540(amount);
        emit TRANSFER801(address(0), account, amount);
    }
    function _BURN710(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB299(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB299(amount);
        emit TRANSFER801(account, address(0), amount);
    }
    function _APPROVE748(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL501(owner, spender, amount);
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
    function NAME846() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL130() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS245() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD540(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB299(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB299(a, b, "SafeMath: subtraction overflow");
    }
    function SUB299(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL626(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV920(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV920(a, b, "SafeMath: division by zero");
    }
    function DIV920(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract HamMoneyToken is ERC20, ERC20Detailed {
  using SafeMath for uint;
  
  address public governance;
  mapping (address => bool) public stakers;
  uint256 private _seed = 120;

  constructor () public ERC20Detailed("HAM.MONEY", "$HAM", 0) {
      governance = msg.sender;
      _STAKE983(governance,_seed*10**uint(DECIMALS245()));
      stakers[governance] = true;
  }

  function STAKE7(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(stakers[msg.sender], "!rewarder");
      _STAKE983(account, amount);
  }
  
}