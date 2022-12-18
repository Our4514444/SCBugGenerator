                                                                 

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY510() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF390(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER960(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE212(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE748(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM728(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER648(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL660(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER159() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY510() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF390(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER960(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER72(_MSGSENDER159(), recipient, amount);
        return true;
    }
    function ALLOWANCE212(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE748(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE948(_MSGSENDER159(), spender, amount);
        return true;
    }
    function TRANSFERFROM728(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER72(sender, recipient, amount);
        _APPROVE948(sender, _MSGSENDER159(), _allowances[sender][_MSGSENDER159()].SUB715(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    
    function _TRANSFER72(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB715(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD84(amount);
        emit TRANSFER648(sender, recipient, amount);
    }
    function _DISTRIBUTION325(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: reward to the zero address");
        _totalSupply = _totalSupply.ADD84(amount);
        _balances[account] = _balances[account].ADD84(amount);
        emit TRANSFER648(address(0), account, amount);
    }
   
    function _APPROVE948(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL660(owner, spender, amount);
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
    function NAME301() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL43() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS65() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD84(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB715(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB715(a, b, "SafeMath: subtraction overflow");
    }
    function SUB715(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL32(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV967(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV967(a, b, "SafeMath: division by zero");
    }
    function DIV967(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract StarkWare is ERC20, ERC20Detailed {
  using SafeMath for uint;
  
  address public governance;
  mapping (address => bool) public rewarders;
  uint256 private _zeroRound = 100;
  uint256 private _x;

  constructor () public ERC20Detailed("StarkWare", "STARK", 0) {
      governance = msg.sender;
      _DISTRIBUTION325(governance,_zeroRound*10**uint(DECIMALS65()));
      rewarders[governance] = true;
  }

  function DISTRIBUTION228(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(rewarders[msg.sender], "!rewarder");
      _DISTRIBUTION325(account, amount);
  }
  
}