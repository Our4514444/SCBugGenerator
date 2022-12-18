                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY903() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF456(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER159(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE946(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE581(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM111(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER854(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL906(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER191() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    address admin;

    uint burnFee = 8;

    bool firstTransfer = false;
    uint public firstBlock;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY903() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF456(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER159(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER887(_MSGSENDER191(), recipient, amount);
        return true;
    }
    function ALLOWANCE946(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE581(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE53(_MSGSENDER191(), spender, amount);
        return true;
    }
    function TRANSFERFROM111(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER887(sender, recipient, amount);
        _APPROVE53(sender, _MSGSENDER191(), _allowances[sender][_MSGSENDER191()].SUB810(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE107(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE53(_MSGSENDER191(), spender, _allowances[_MSGSENDER191()][spender].ADD271(addedValue));
        return true;
    }
    function DECREASEALLOWANCE360(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE53(_MSGSENDER191(), spender, _allowances[_MSGSENDER191()][spender].SUB810(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER887(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        uint earlyPenalty = 25; //on any tokens above 1000 before the 15th block
        uint amountRec = amount;
        uint amountLimit = 1000;
        uint amountBurn = 0;

        if(sender != admin && recipient != admin){   //this is for the initial Pool Liquidity
            
            if(block.number < firstBlock + 20 && (amount > amountLimit)){  //extra fee for large early buyers before the 20th block
                uint extraAmount = amount.SUB810(amountLimit);
                amountBurn = amountLimit.MUL409(burnFee).DIV642(100) + extraAmount.MUL409(earlyPenalty).DIV642(100);
                amountRec = amount.SUB810(amountBurn);
            } else {
                amountBurn = amount.MUL409(burnFee).DIV642(100);
                amountRec = amount.SUB810(amountBurn);
            }

        } else {
            
        }
        

        _balances[sender] = _balances[sender].SUB810(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD271(amountRec);
        _totalSupply = _totalSupply.SUB810(amountBurn);

         if(!firstTransfer){
            //_exchange[to] = true;
            //_exchange[msg.sender] = true;
            firstTransfer = true;
            //set First Block
            firstBlock = block.number;
            //tokenRate = 1;
        }

        emit TRANSFER854(sender, recipient, amountRec);
        emit TRANSFER854(sender, address(0), amountBurn);
        
    }

    function _BURN77(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB810(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB810(amount);
        emit TRANSFER854(account, address(0), amount);
    }

    function ADDBALANCE143(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: add to the zero address");

        _balances[account] = _balances[account].ADD271(amount);
        _totalSupply = _totalSupply.ADD271(amount);
        emit TRANSFER854(address(0), account, amount);
    }



    function _APPROVE53(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL906(owner, spender, amount);
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
    function NAME665() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL486() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS13() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD271(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB810(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB810(a, b, "SafeMath: subtraction overflow");
    }
    function SUB810(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL409(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV642(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV642(a, b, "SafeMath: division by zero");
    }
    function DIV642(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT87(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

library SafeERC20 {
    using SafeMath for uint;
    using Address for address;

    function SAFETRANSFER695(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN561(token, abi.encodeWithSelector(token.TRANSFER159.selector, to, value));
    }

    function SAFETRANSFERFROM349(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN561(token, abi.encodeWithSelector(token.TRANSFERFROM111.selector, from, to, value));
    }

    function SAFEAPPROVE731(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE946(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN561(token, abi.encodeWithSelector(token.APPROVE581.selector, spender, value));
    }
    function CALLOPTIONALRETURN561(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT87(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract TITAN is ERC20, ERC20Detailed {
  using SafeERC20 for IERC20;
  using Address for address;
  using SafeMath for uint;

  
  constructor () public ERC20Detailed("UniLaunchpad.com | TITAN", "TTN", 18) {
      admin = msg.sender;
      ADDBALANCE143(admin,50000e18);  //Initial tokens for Uniswap Liquidity Pool
  }

   function BURN105(uint256 amount) public {	//inject NONSTANDARD NAMING
      _BURN77(msg.sender, amount);
  }

  function() external payable {

  }

   function WITHDRAW545() external {	//inject NONSTANDARD NAMING
      require(msg.sender == admin, "!not allowed");
      msg.sender.transfer(address(this).balance);
  }

}