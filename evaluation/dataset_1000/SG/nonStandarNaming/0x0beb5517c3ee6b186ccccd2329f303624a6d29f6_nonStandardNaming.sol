                                                                 

                                                                                                                                                                                           
pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY662() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF49(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER844(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE350(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE897(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM364(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER798(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL350(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER192() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    address admin;

    uint burnFee = 2;

    bool firstTransfer = false;
    uint public firstBlock;


    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY662() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF49(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER844(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER479(_MSGSENDER192(), recipient, amount);
        return true;
    }
    function ALLOWANCE350(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE897(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE502(_MSGSENDER192(), spender, amount);
        return true;
    }
    function TRANSFERFROM364(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER479(sender, recipient, amount);
        _APPROVE502(sender, _MSGSENDER192(), _allowances[sender][_MSGSENDER192()].SUB910(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE704(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE502(_MSGSENDER192(), spender, _allowances[_MSGSENDER192()][spender].ADD510(addedValue));
        return true;
    }
    function DECREASEALLOWANCE654(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE502(_MSGSENDER192(), spender, _allowances[_MSGSENDER192()][spender].SUB910(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER479(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        
        uint amountRec = amount;
        uint amountLimit = 151e18;
        uint amountBurn = 0;

      if(sender != admin && recipient != admin){   //this is for the initial Pool Liquidity
            
            if((block.number < firstBlock + 20) ){  
                 require(amount < amountLimit);
                amountBurn = amount.MUL853(burnFee).DIV484(100);
                amountRec = amount.SUB910(amountBurn);
            } else {
                amountBurn = amount.MUL853(burnFee).DIV484(100);
                amountRec = amount.SUB910(amountBurn);
            }

        } else {
            
        }
        

        _balances[sender] = _balances[sender].SUB910(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD510(amountRec);
        _totalSupply = _totalSupply.SUB910(amountBurn);

         if(!firstTransfer){
            firstTransfer = true;
            //set First Block
            firstBlock = block.number;

        }

        emit TRANSFER798(sender, recipient, amountRec);
        emit TRANSFER798(sender, address(0), amountBurn);
        
    }



    function ADDBALANCE368(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: add to the zero address");

        _balances[account] = _balances[account].ADD510(amount);
        _totalSupply = _totalSupply.ADD510(amount);
        emit TRANSFER798(address(0), account, amount);
    }



    function _APPROVE502(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL350(owner, spender, amount);
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
    function NAME541() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL331() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS723() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD510(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB910(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB910(a, b, "SafeMath: subtraction overflow");
    }
    function SUB910(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL853(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV484(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV484(a, b, "SafeMath: division by zero");
    }
    function DIV484(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT855(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}



contract dKore is ERC20, ERC20Detailed {
    using SafeMath for uint;

  
  constructor () public ERC20Detailed("dK0re", "DK0RE", 18) {
      admin = msg.sender;
      ADDBALANCE368(admin,5000e18);  //Initial tokens for Uniswap Liquidity Pool
  }



  function() external payable {

  }

   function WITHDRAW962() external {	//inject NONSTANDARD NAMING
      require(msg.sender == admin, "!not allowed");
      msg.sender.transfer(address(this).balance);
  }

  function GETFIRSTBLOCKTIME73() view external returns (uint) {	//inject NONSTANDARD NAMING
      return(block.number - firstBlock);
  }

}