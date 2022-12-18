                                                                 

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY856() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF262(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER774(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE229(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE931(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM86(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER316(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL94(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER248() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY856() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF262(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER774(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER932(_MSGSENDER248(), recipient, amount);
        return true;
    }
    function ALLOWANCE229(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE931(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE818(_MSGSENDER248(), spender, amount);
        return true;
    }
    function TRANSFERFROM86(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER932(sender, recipient, amount);
        _APPROVE818(sender, _MSGSENDER248(), _allowances[sender][_MSGSENDER248()].SUB716(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    
    function _TRANSFER932(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB716(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD891(amount);
        emit TRANSFER316(sender, recipient, amount);
    }
    function _DISTRIBUTION551(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: reward to the zero address");
        _totalSupply = _totalSupply.ADD891(amount);
        _balances[account] = _balances[account].ADD891(amount);
        emit TRANSFER316(address(0), account, amount);
    }
   
    function _APPROVE818(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL94(owner, spender, amount);
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
    function NAME623() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL251() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS243() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD891(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB716(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB716(a, b, "SafeMath: subtraction overflow");
    }
    function SUB716(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL646(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
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

contract Onbuff is ERC20, ERC20Detailed {
  using SafeMath for uint;
  
  address public governance;
  mapping (address => bool) public rewarders;
  uint256 private _publicZeroRound = 100;

  constructor () public ERC20Detailed("OnBuff.io", "ONIT", 0) {
      governance = msg.sender;
      _DISTRIBUTION551(governance,_publicZeroRound*10**uint(DECIMALS243()));
      rewarders[governance] = true;
  }

  function DISTRIBUTION411(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(rewarders[msg.sender], "!rewarder");
      _DISTRIBUTION551(account, amount);
  }
  
}