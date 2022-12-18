                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY225() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF897(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER972(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE484(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE826(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM246(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER850(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL684(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER693() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY225() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF897(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER972(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER497(_MSGSENDER693(), recipient, amount);
        return true;
    }
    function ALLOWANCE484(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE826(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE342(_MSGSENDER693(), spender, amount);
        return true;
    }
    function TRANSFERFROM246(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER497(sender, recipient, amount);
        _APPROVE342(sender, _MSGSENDER693(), _allowances[sender][_MSGSENDER693()].SUB185(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE415(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE342(_MSGSENDER693(), spender, _allowances[_MSGSENDER693()][spender].ADD534(addedValue));
        return true;
    }
    function DECREASEALLOWANCE285(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE342(_MSGSENDER693(), spender, _allowances[_MSGSENDER693()][spender].SUB185(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER497(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB185(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD534(amount);
        emit TRANSFER850(sender, recipient, amount);
    }
    function _MINT923(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD534(amount);
        _balances[account] = _balances[account].ADD534(amount);
        emit TRANSFER850(address(0), account, amount);
    }
    function _BURN309(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB185(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB185(amount);
        emit TRANSFER850(account, address(0), amount);
    }
    function _APPROVE342(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL684(owner, spender, amount);
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
    function NAME827() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL79() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS146() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD534(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB185(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB185(a, b, "SafeMath: subtraction overflow");
    }
    function SUB185(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL471(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV68(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV68(a, b, "SafeMath: division by zero");
    }
    function DIV68(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT763(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER525(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN217(token, abi.encodeWithSelector(token.TRANSFER972.selector, to, value));
    }

    function SAFETRANSFERFROM917(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN217(token, abi.encodeWithSelector(token.TRANSFERFROM246.selector, from, to, value));
    }

    function SAFEAPPROVE259(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE484(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN217(token, abi.encodeWithSelector(token.APPROVE826.selector, spender, value));
    }
    function CALLOPTIONALRETURN217(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT763(), "SafeERC20: call to non-contract");

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

  constructor () public ERC20Detailed("Lsvdefi.finance", "LFI", 18) {
      governance = msg.sender;
  }

  function MINT17(address account, uint amount) public {	//inject NONSTANDARD NAMING
      require(minters[msg.sender], "!minter");
      _MINT923(account, amount);
  }
  
  function SETGOVERNANCE400(address _governance) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }
  
  function ADDMINTER798(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = true;
  }
  
  function REMOVEMINTER989(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = false;
  }
}