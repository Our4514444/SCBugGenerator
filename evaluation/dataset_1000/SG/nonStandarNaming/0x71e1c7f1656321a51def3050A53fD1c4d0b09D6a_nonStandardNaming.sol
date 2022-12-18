                                                                 

                                                                                                                                                                                                                                                                                                                                                                 
pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY951() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF673(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER845(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE312(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE261(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM335(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER777(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL279(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER421() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    address admin;

    uint burnFee = 5;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY951() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF673(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER845(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER26(_MSGSENDER421(), recipient, amount);
        return true;
    }
    function ALLOWANCE312(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE261(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE388(_MSGSENDER421(), spender, amount);
        return true;
    }
    function TRANSFERFROM335(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER26(sender, recipient, amount);
        _APPROVE388(sender, _MSGSENDER421(), _allowances[sender][_MSGSENDER421()].SUB895(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE995(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE388(_MSGSENDER421(), spender, _allowances[_MSGSENDER421()][spender].ADD669(addedValue));
        return true;
    }
    function DECREASEALLOWANCE129(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE388(_MSGSENDER421(), spender, _allowances[_MSGSENDER421()][spender].SUB895(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER26(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        uint amountRec = amount;
        uint amountBurn = 0;

        if(sender != admin && recipient != admin){   //this is for the initial Pool Liquidity
            amountBurn = amount.MUL617(burnFee).DIV601(100);
            amountRec = amount.SUB895(amountBurn);
        }
        

        _balances[sender] = _balances[sender].SUB895(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD669(amountRec);
        _totalSupply = _totalSupply.SUB895(amountBurn);

        emit TRANSFER777(sender, recipient, amountRec);
        emit TRANSFER777(sender, address(0), amountBurn);
        
    }

    function _BURN262(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB895(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB895(amount);
        emit TRANSFER777(account, address(0), amount);
    }

    function ADDBALANCE637(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: add to the zero address");

        _balances[account] = _balances[account].ADD669(amount);
        _totalSupply = _totalSupply.ADD669(amount);
        emit TRANSFER777(address(0), account, amount);
    }



    function _APPROVE388(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL279(owner, spender, amount);
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
    function NAME434() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL165() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS848() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD669(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB895(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB895(a, b, "SafeMath: subtraction overflow");
    }
    function SUB895(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL617(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV601(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV601(a, b, "SafeMath: division by zero");
    }
    function DIV601(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT589(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

library SafeERC20 {
    using SafeMath for uint;
    using Address for address;

    function SAFETRANSFER564(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN364(token, abi.encodeWithSelector(token.TRANSFER845.selector, to, value));
    }

    function SAFETRANSFERFROM981(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN364(token, abi.encodeWithSelector(token.TRANSFERFROM335.selector, from, to, value));
    }

    function SAFEAPPROVE905(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE312(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN364(token, abi.encodeWithSelector(token.APPROVE261.selector, spender, value));
    }
    function CALLOPTIONALRETURN364(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT589(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract VEGA is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;

  
  constructor () public ERC20Detailed("UniLaunchpad.com | VEGA", "VGA", 18) {
      admin = msg.sender;
      ADDBALANCE637(admin,300000e18);  //Initial tokens for Uniswap Liquidity Pool
  }

   function BURN677(uint256 amount) public {	//inject NONSTANDARD NAMING
      _BURN262(msg.sender, amount);
  }

  function() external payable {

  }

   function WITHDRAW713() external {	//inject NONSTANDARD NAMING
      require(msg.sender == admin, "!not allowed");
      msg.sender.transfer(address(this).balance);
  }

}