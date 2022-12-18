                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             


pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY752() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF574(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER992(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE13(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE111(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM372(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER598(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL821(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER583() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY752() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF574(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER992(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        //require(!_tokenSaleMode || msg.sender == governance, "token sale is ongoing");
        _TRANSFER325(_MSGSENDER583(), recipient, amount);
        return true;
    }
    function ALLOWANCE13(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE111(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE988(_MSGSENDER583(), spender, amount);
        return true;
    }
    function TRANSFERFROM372(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        //require(!_tokenSaleMode || msg.sender == governance, "token sale is ongoing");
        _TRANSFER325(sender, recipient, amount);
        _APPROVE988(sender, _MSGSENDER583(), _allowances[sender][_MSGSENDER583()].SUB332(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE956(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE988(_MSGSENDER583(), spender, _allowances[_MSGSENDER583()][spender].ADD121(addedValue));
        return true;
    }
    function DECREASEALLOWANCE47(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE988(_MSGSENDER583(), spender, _allowances[_MSGSENDER583()][spender].SUB332(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER325(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        //require(!_tokenSaleMode || msg.sender == governance, "token sale is ongoing");
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB332(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD121(amount);
        emit TRANSFER598(sender, recipient, amount);
    }
    function _MINT495(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD121(amount);
        _balances[account] = _balances[account].ADD121(amount);
        emit TRANSFER598(address(0), account, amount);
    }
    function _BURN824(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB332(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB332(amount);
        emit TRANSFER598(account, address(0), amount);
    }
    function _APPROVE988(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL821(owner, spender, amount);
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
    function NAME919() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL883() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS457() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD121(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB332(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB332(a, b, "SafeMath: subtraction overflow");
    }
    function SUB332(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL29(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV769(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV769(a, b, "SafeMath: division by zero");
    }
    function DIV769(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT912(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER108(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        //require(!_tokenSaleMode || msg.sender == governance, "token sale is ongoing");
        CALLOPTIONALRETURN498(token, abi.encodeWithSelector(token.TRANSFER992.selector, to, value));
    }

    function SAFETRANSFERFROM762(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        //require(!_tokenSaleMode || msg.sender == governance, "token sale is ongoing");
        CALLOPTIONALRETURN498(token, abi.encodeWithSelector(token.TRANSFERFROM372.selector, from, to, value));
    }

    function SAFEAPPROVE683(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE13(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN498(token, abi.encodeWithSelector(token.APPROVE111.selector, spender, value));
    }
    function CALLOPTIONALRETURN498(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT912(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract POLKACoinFinance is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;
  uint256 public tokenSalePrice = 0.00004 ether;
  bool public _tokenSaleMode = true;
  address public governance;
  mapping (address => bool) public minters;


  constructor () public ERC20Detailed("PolkaCoin.Network", "PKC", 18) {
      governance = msg.sender;
      minters[msg.sender] = true;
  }

  function MINT14(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
      require(minters[msg.sender], "!minter");
      _MINT495(account, amount);
  }

   function BURN806(uint256 amount) public {	//inject NONSTANDARD NAMING
      _BURN824(msg.sender, amount);
  }

  function SETGOVERNANCE196(address _governance) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }

  function ADDMINTER354(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = true;
  }

  function REMOVEMINTER456(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = false;
  }

  function BUYTOKEN12() public payable {	//inject NONSTANDARD NAMING
      require(_tokenSaleMode, "token sale is over");
      uint256 newTokens = SafeMath.MUL29(SafeMath.DIV769(msg.value, tokenSalePrice),1e18);
      _MINT495(msg.sender, newTokens);

  }

  function() external payable {
      BUYTOKEN12();
  }

  function ENDTOKENSALE232() public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      _tokenSaleMode = false;
  }

   function WITHDRAW751() external {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      msg.sender.transfer(address(this).balance);
  }

}