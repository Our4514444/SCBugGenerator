                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY897() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF449(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER706(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE469(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE282(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM907(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER361(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL251(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER169() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY897() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF449(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER706(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER596(_MSGSENDER169(), recipient, amount);
        return true;
    }
    function ALLOWANCE469(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE282(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE967(_MSGSENDER169(), spender, amount);
        return true;
    }
    function TRANSFERFROM907(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER596(sender, recipient, amount);
        _APPROVE967(sender, _MSGSENDER169(), _allowances[sender][_MSGSENDER169()].SUB309(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE821(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE967(_MSGSENDER169(), spender, _allowances[_MSGSENDER169()][spender].ADD475(addedValue));
        return true;
    }
    function DECREASEALLOWANCE457(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE967(_MSGSENDER169(), spender, _allowances[_MSGSENDER169()][spender].SUB309(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER596(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB309(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD475(amount);
        emit TRANSFER361(sender, recipient, amount);
    }
    function _MINT982(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD475(amount);
        _balances[account] = _balances[account].ADD475(amount);
        emit TRANSFER361(address(0), account, amount);
    }
    function _BURN244(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB309(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB309(amount);
        emit TRANSFER361(account, address(0), amount);
    }
    function _APPROVE967(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL251(owner, spender, amount);
    }
}


contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private  TokenmaxSupply = 45000*10**18;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
    function NAME979() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL656() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS53() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
    
     function MAXSUPPLY663() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return TokenmaxSupply;
    }
}


library SafeMath {
    function ADD475(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB309(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB309(a, b, "SafeMath: subtraction overflow");
    }
    function SUB309(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL655(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV595(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV595(a, b, "SafeMath: division by zero");
    }
    function DIV595(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT681(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

library SafeERC20 {
    using SafeMath for uint;
    using Address for address;

    function SAFETRANSFER825(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN660(token, abi.encodeWithSelector(token.TRANSFER706.selector, to, value));
    }

    function SAFETRANSFERFROM531(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN660(token, abi.encodeWithSelector(token.TRANSFERFROM907.selector, from, to, value));
    }

    function SAFEAPPROVE121(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE469(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN660(token, abi.encodeWithSelector(token.APPROVE282.selector, spender, value));
    }
    function CALLOPTIONALRETURN660(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT681(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract YFILEND is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;
  
  
  address public governance;
  mapping (address => bool) public minters;

  constructor () public ERC20Detailed("Yfilend", "Yfild", 18) {
      governance = tx.origin;
  }

  function MINT20(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
      
      require(TOTALSUPPLY897() + amount <= MAXSUPPLY663(), "Supply Max Reached");
      require(minters[msg.sender], "!minter");
      _MINT982(account, amount);
  }
  

  function SETGOVERNANCE169(address _governance) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }
  
  function ADDMINTER22(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = true;
  }
  
  function REMOVEMINTER59(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = false;
  }
}