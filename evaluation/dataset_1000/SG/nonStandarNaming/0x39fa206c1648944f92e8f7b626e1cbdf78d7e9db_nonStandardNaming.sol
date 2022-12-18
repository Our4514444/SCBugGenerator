                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY734() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF304(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER926(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE838(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE668(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM46(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER303(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL214(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER288() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY734() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF304(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER926(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER926(_MSGSENDER288(), recipient, amount);
        return true;
    }
    function ALLOWANCE838(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE668(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE418(_MSGSENDER288(), spender, amount);
        return true;
    }
    function TRANSFERFROM46(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER926(sender, recipient, amount);
        _APPROVE418(sender, _MSGSENDER288(), _allowances[sender][_MSGSENDER288()].SUB521(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE407(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE418(_MSGSENDER288(), spender, _allowances[_MSGSENDER288()][spender].ADD889(addedValue));
        return true;
    }
    function DECREASEALLOWANCE728(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE418(_MSGSENDER288(), spender, _allowances[_MSGSENDER288()][spender].SUB521(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER926(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB521(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD889(amount);
        emit TRANSFER303(sender, recipient, amount);
    }
    function _MINT376(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD889(amount);
        _balances[account] = _balances[account].ADD889(amount);
        emit TRANSFER303(address(0), account, amount);
    }
    function _BURN1000(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB521(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB521(amount);
        emit TRANSFER303(account, address(0), amount);
    }
    function _APPROVE418(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL214(owner, spender, amount);
    }
}


contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private  TokenmaxSupply = 30000*10**18;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
    function NAME668() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL755() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS608() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
    
     function MAXSUPPLY225() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return TokenmaxSupply;
    }
}


library SafeMath {
    function ADD889(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB521(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB521(a, b, "SafeMath: subtraction overflow");
    }
    function SUB521(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL160(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV2(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV2(a, b, "SafeMath: division by zero");
    }
    function DIV2(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT309(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER366(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN416(token, abi.encodeWithSelector(token.TRANSFER926.selector, to, value));
    }

    function SAFETRANSFERFROM720(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN416(token, abi.encodeWithSelector(token.TRANSFERFROM46.selector, from, to, value));
    }

    function SAFEAPPROVE644(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE838(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN416(token, abi.encodeWithSelector(token.APPROVE668.selector, spender, value));
    }
    function CALLOPTIONALRETURN416(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT309(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract DXY is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;
  
  
  address public governance;
  mapping (address => bool) public minters;

  constructor () public ERC20Detailed("DXY.FINANCE", "DXY", 18) {
      governance = tx.origin;
  }

  function MINT875(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
      
      require(TOTALSUPPLY734() + amount <= MAXSUPPLY225(), "Supply Max Reached");
      require(minters[msg.sender], "!minter");
      _MINT376(account, amount);
  }
  

  function BURN694(uint256 amount) external {	//inject NONSTANDARD NAMING
        require(amount != 0, "you cannot burn zero amount");
       _BURN1000(msg.sender, amount);
  }
    
  
  function SETGOVERNANCE32(address _governance) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }
  
  function ADDMINTER208(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = true;
  }
  
  function REMOVEMINTER291(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = false;
  }
}