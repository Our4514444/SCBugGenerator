                                                                 

pragma solidity ^0.5.2;



interface IERC20 {

    function TOTALSUPPLY727() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF218(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

    function TRANSFER70(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE258(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    function APPROVE343(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM34(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER842(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL210(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

pragma solidity ^0.5.2;

library SafeMath {
   
    function ADD969(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB67(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    function MUL322(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
      
         if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV350(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
      
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        return c;
    }

    function MOD829(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

pragma solidity ^0.5.2;

contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    function TOTALSUPPLY727() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }


    function BALANCEOF218(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

   
    function TRANSFER70(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER250(msg.sender, recipient, amount);
        return true;
    }

   
    function ALLOWANCE258(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE343(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE786(msg.sender, spender, value);
        return true;
    }

   
    function TRANSFERFROM34(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER250(sender, recipient, amount);
        _APPROVE786(sender, msg.sender, _allowances[sender][msg.sender].SUB67(amount));
        return true;
    }

   
    function INCREASEALLOWANCE238(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE786(msg.sender, spender, _allowances[msg.sender][spender].ADD969(addedValue));
        return true;
    }

  
    function DECREASEALLOWANCE80(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE786(msg.sender, spender, _allowances[msg.sender][spender].SUB67(subtractedValue));
        return true;
    }

   
    function _TRANSFER250(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB67(amount);
        _balances[recipient] = _balances[recipient].ADD969(amount);
        emit TRANSFER842(sender, recipient, amount);
    }

 
    function _MINT612(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD969(amount);
        _balances[account] = _balances[account].ADD969(amount);
        emit TRANSFER842(address(0), account, amount);
    }

    function _BURN380(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _totalSupply = _totalSupply.SUB67(value);
        _balances[account] = _balances[account].SUB67(value);
        emit TRANSFER842(account, address(0), value);
    }
  
    function _APPROVE786(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit APPROVAL210(owner, spender, value);
    }

  
    function _BURNFROM22(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN380(account, amount);
        _APPROVE786(account, msg.sender, _allowances[account][msg.sender].SUB67(amount));
    }
}


pragma solidity ^0.5.2;

contract GlobalStaking is ERC20 {

    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor(string memory name, string memory symbol, uint8 decimals, uint256 totalSupply, address payable feeReceiver, address tokenOwnerAddress) public payable {
      _name = name;
      _symbol = symbol;
      _decimals = decimals;

     _MINT612(tokenOwnerAddress, totalSupply);
      feeReceiver.transfer(msg.value);
    }

    function BURN19(uint256 value) public {	//inject NONSTANDARD NAMING
      _BURN380(msg.sender, value);
    }

    function NAME478() public view returns (string memory) {	//inject NONSTANDARD NAMING
      return _name;
    }

   function SYMBOL65() public view returns (string memory) {	//inject NONSTANDARD NAMING
      return _symbol;
    }

  function DECIMALS120() public view returns (uint8) {	//inject NONSTANDARD NAMING
      return _decimals;
    }
}