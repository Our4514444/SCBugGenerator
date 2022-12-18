                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY911() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF175(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER824(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE733(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE677(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM373(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER911(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL195(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER666() internal view returns (address payable) {	//inject NONSTANDARD NAMING
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
    function BALANCEOF175(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER824(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER837(_MSGSENDER666(), recipient, amount);
        return true;
    }
    function ALLOWANCE733(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE677(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE459(_MSGSENDER666(), spender, amount);
        return true;
    }
    function TRANSFERFROM373(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER837(sender, recipient, amount);
        _APPROVE459(sender, _MSGSENDER666(), _allowances[sender][_MSGSENDER666()].SUB360(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE150(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE459(_MSGSENDER666(), spender, _allowances[_MSGSENDER666()][spender].ADD598(addedValue));
        return true;
    }
    function DECREASEALLOWANCE831(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE459(_MSGSENDER666(), spender, _allowances[_MSGSENDER666()][spender].SUB360(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER837(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB360(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD598(amount);
        emit TRANSFER911(sender, recipient, amount);
    }
    function _MINT695(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD598(amount);
        _balances[account] = _balances[account].ADD598(amount);
        emit TRANSFER911(address(0), account, amount);
    }
    function _BURN948(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB360(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB360(amount);
        emit TRANSFER911(account, address(0), amount);
    }
    function _APPROVE459(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL195(owner, spender, amount);
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
    function NAME608() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL966() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS310() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD598(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB360(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB360(a, b, "SafeMath: subtraction overflow");
    }
    function SUB360(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL856(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV185(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV185(a, b, "SafeMath: division by zero");
    }
    function DIV185(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT473(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER166(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN469(token, abi.encodeWithSelector(token.TRANSFER824.selector, to, value));
    }

    function SAFETRANSFERFROM57(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN469(token, abi.encodeWithSelector(token.TRANSFERFROM373.selector, from, to, value));
    }

    function SAFEAPPROVE747(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE733(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN469(token, abi.encodeWithSelector(token.APPROVE677.selector, spender, value));
    }
    function CALLOPTIONALRETURN469(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT473(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract LFI is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;


  address public governance;
  mapping (address => bool) public minters;

  constructor () public ERC20Detailed("LaFi.Finance", "LFI", 18) {
      governance = msg.sender;
  }

  function MINT245(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(minters[msg.sender], "!minter");
      _MINT695(account, amount);
  }

  function SETGOVERNANCE261(address _governance) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }

  function ADDMINTER850(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = true;
  }

  function REMOVEMINTER213(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = false;
  }
}