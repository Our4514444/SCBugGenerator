                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY348() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF926(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER418(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE420(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE784(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM102(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER25(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL920(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER454() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY348() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF926(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER418(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER221(_MSGSENDER454(), recipient, amount);
        return true;
    }
    function ALLOWANCE420(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE784(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE161(_MSGSENDER454(), spender, amount);
        return true;
    }
    function TRANSFERFROM102(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER221(sender, recipient, amount);
        _APPROVE161(sender, _MSGSENDER454(), _allowances[sender][_MSGSENDER454()].SUB937(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE185(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE161(_MSGSENDER454(), spender, _allowances[_MSGSENDER454()][spender].ADD974(addedValue));
        return true;
    }
    function DECREASEALLOWANCE981(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE161(_MSGSENDER454(), spender, _allowances[_MSGSENDER454()][spender].SUB937(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER221(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB937(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD974(amount);
        emit TRANSFER25(sender, recipient, amount);
    }
    function _MINT845(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD974(amount);
        _balances[account] = _balances[account].ADD974(amount);
        emit TRANSFER25(address(0), account, amount);
    }
    function _BURN874(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB937(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB937(amount);
        emit TRANSFER25(account, address(0), amount);
    }
    function _APPROVE161(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL920(owner, spender, amount);
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
    function NAME519() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL237() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS235() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD974(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB937(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB937(a, b, "SafeMath: subtraction overflow");
    }
    function SUB937(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL938(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV523(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV523(a, b, "SafeMath: division by zero");
    }
    function DIV523(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT812(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER198(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN833(token, abi.encodeWithSelector(token.TRANSFER418.selector, to, value));
    }

    function SAFETRANSFERFROM709(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN833(token, abi.encodeWithSelector(token.TRANSFERFROM102.selector, from, to, value));
    }

    function SAFEAPPROVE309(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE420(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN833(token, abi.encodeWithSelector(token.APPROVE784.selector, spender, value));
    }
    function CALLOPTIONALRETURN833(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT812(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract PLU is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;
  
  
  address public governance;
  mapping (address => bool) public minters;

  constructor () public ERC20Detailed("plouto.finance", "PLU", 18) {
      governance = msg.sender;
      _MINT845(governance,10000*10**18);
  }

  function MINT927(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(minters[msg.sender], "!minter");
      _MINT845(account, amount);
  }
  
  function SETGOVERNANCE206(address _governance) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }
  
  function ADDMINTER914(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = true;
  }
  
  function REMOVEMINTER992(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = false;
  }
}