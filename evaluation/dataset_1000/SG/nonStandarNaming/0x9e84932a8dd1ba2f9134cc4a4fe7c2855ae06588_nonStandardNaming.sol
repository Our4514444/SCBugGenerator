                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY351() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF194(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER133(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE826(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE112(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM531(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER956(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL76(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER101() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA617() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED963(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    constructor () internal {
        _owner = _MSGSENDER101();
        emit OWNERSHIPTRANSFERRED963(address(0), _owner);
    }
    function OWNER33() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }
    modifier ONLYOWNER685() {	//inject NONSTANDARD NAMING
        require(ISOWNER232(), "Ownable: caller is not the owner");
        _;
    }
    function ISOWNER232() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER101() == _owner;
    }
    function RENOUNCEOWNERSHIP952() public ONLYOWNER685 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED963(_owner, address(0));
        _owner = address(0);
    }
    function TRANSFEROWNERSHIP618(address newOwner) public ONLYOWNER685 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP530(newOwner);
    }
    function _TRANSFEROWNERSHIP530(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED963(_owner, newOwner);
        _owner = newOwner;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;
    function TOTALSUPPLY351() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF194(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER133(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER482(_MSGSENDER101(), recipient, amount);
        return true;
    }
    function ALLOWANCE826(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE112(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE658(_MSGSENDER101(), spender, amount);
        return true;
    }
    function TRANSFERFROM531(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER482(sender, recipient, amount);
        _APPROVE658(sender, _MSGSENDER101(), _allowances[sender][_MSGSENDER101()].SUB574(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE924(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE658(_MSGSENDER101(), spender, _allowances[_MSGSENDER101()][spender].ADD951(addedValue));
        return true;
    }
    function DECREASEALLOWANCE300(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE658(_MSGSENDER101(), spender, _allowances[_MSGSENDER101()][spender].SUB574(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER482(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB574(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD951(amount);
        emit TRANSFER956(sender, recipient, amount);
    }
    function _MINT920(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD951(amount);
        _balances[account] = _balances[account].ADD951(amount);
        emit TRANSFER956(address(0), account, amount);
    }
    function _BURN647(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB574(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB574(amount);
        emit TRANSFER956(account, address(0), amount);
    }
    function _APPROVE658(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL76(owner, spender, amount);
    }
    function _BURNFROM381(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN647(account, amount);
        _APPROVE658(account, _MSGSENDER101(), _allowances[account][_MSGSENDER101()].SUB574(amount, "ERC20: burn amount exceeds allowance"));
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
    function NAME657() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL339() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS28() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

contract ReentrancyGuard {
    uint256 private _guardCounter;

    constructor () internal {
        _guardCounter = 1;
    }

    modifier NONREENTRANT586() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
}

library SafeMath {
    function ADD951(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB574(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB574(a, b, "SafeMath: subtraction overflow");
    }
    function SUB574(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL156(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV42(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV42(a, b, "SafeMath: division by zero");
    }
    function DIV42(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD405(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD405(a, b, "SafeMath: modulo by zero");
    }
    function MOD405(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT158(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE414(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE146(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER448(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN791(token, abi.encodeWithSelector(token.TRANSFER133.selector, to, value));
    }

    function SAFETRANSFERFROM370(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN791(token, abi.encodeWithSelector(token.TRANSFERFROM531.selector, from, to, value));
    }

    function SAFEAPPROVE277(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE826(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN791(token, abi.encodeWithSelector(token.APPROVE112.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE971(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE826(address(this), spender).ADD951(value);
        CALLOPTIONALRETURN791(token, abi.encodeWithSelector(token.APPROVE112.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE576(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE826(address(this), spender).SUB574(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN791(token, abi.encodeWithSelector(token.APPROVE112.selector, spender, newAllowance));
    }
    function CALLOPTIONALRETURN791(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT158(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface Controller {
    function WITHDRAW855(address token, uint amount) external;	//inject NONSTANDARD NAMING
}

contract yVault is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint256;

  uint256 public balance;
  address public token;
  address public governance;
  address public controller;

  constructor (address _token, address _controller) public ERC20Detailed(
      string(abi.encodePacked("yearn ", ERC20Detailed(_token).NAME657())),
      string(abi.encodePacked("y", ERC20Detailed(_token).SYMBOL339())),
      ERC20Detailed(_token).DECIMALS28()
  ) {
    token = _token;
    governance = msg.sender;
    controller = _controller;
  }
  
  function SETGOVERNANCE488(address _governance) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }
  
  function SETCONTROLLER134(address _controller) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      controller = _controller;
  }
  
  function BORROW119(uint amount) public {	//inject NONSTANDARD NAMING
      require(msg.sender == controller, "!controller");
      IERC20(token).SAFETRANSFER448(controller, amount);
  }

  function DEPOSIT91(uint256 _amount)	//inject NONSTANDARD NAMING
      external
  {
      require(_amount > 0, "<0");

      IERC20(token).SAFETRANSFERFROM370(msg.sender, address(this), _amount);

      // Calculate pool shares
      uint256 shares = 0;
      if (balance == 0) {
        shares = _amount;
      } else {
        shares = (_amount.MUL156(TOTALSUPPLY351())).DIV42(balance);
      }
      balance = balance.ADD951(_amount);
      _MINT920(msg.sender, shares);
  }

  // No rebalance implementation for lower fees and faster swaps
  function WITHDRAW855(uint256 _shares)	//inject NONSTANDARD NAMING
      external
  {
      require(_shares > 0, "<0");

      uint256 yBalance = BALANCEOF194(msg.sender);
      require(_shares <= yBalance, "!balance");

      uint256 r = (balance.MUL156(_shares)).DIV42(TOTALSUPPLY351());
      _BURN647(msg.sender, _shares);

      // Check balance
      uint256 b = IERC20(token).BALANCEOF194(address(this));
      if (b < r) {
        Controller(controller).WITHDRAW855(token, r.SUB574(b));
      }

      IERC20(token).SAFETRANSFER448(msg.sender, r);
      balance = balance.SUB574(r);
  }

  function GETPRICEPERFULLSHARE688() public view returns (uint) {	//inject NONSTANDARD NAMING
    return balance.MUL156(uint(1)**DECIMALS28()).DIV42(TOTALSUPPLY351());
  }
}