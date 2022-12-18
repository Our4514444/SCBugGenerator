/**
 *Submitted for verification at Etherscan.io on 2020-11-02
*/

/**
 *Submitted for verification at Etherscan.io on 2020-11-02
*/

/**
 *Submitted for verification at Etherscan.io on 2020-10-26
*/

pragma solidity ^0.5.11;

interface IERC20 {
  function totalSupply() external view returns (uint256);
  function balanceOf(address who) external view returns (uint256);
  function allowance(address owner, address spender) external view returns (uint256);
  function transfer(address to, uint256 value) external returns (bool);
  function approve(address spender, uint256 value) external returns (bool);
  function transferFrom(address from, address to, uint256 value) external returns (bool);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

  function ceil(uint256 a, uint256 m) internal pure returns (uint256) {
    uint256 c = add(a,m);
    uint256 d = sub(c,1);
    return mul(div(d,m),m);
  }
}

contract ERC20Detailed is IERC20 {

  uint8 private _Tokendecimals;
  string private _Tokenname;
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  string private _Tokensymbol;

  constructor(string memory name, string memory symbol, uint8 decimals) public {
   
   _Tokendecimals = decimals;
    _Tokenname = name;
    _Tokensymbol = symbol;
    
  }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

  function name() public view returns(string memory) {
    return _Tokenname;
  }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

  function symbol() public view returns(string memory) {
    return _Tokensymbol;
  }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

  function decimals() public view returns(uint8) {
    return _Tokendecimals;
  }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
}



contract BOOB is ERC20Detailed {

  using SafeMath for uint256;
    
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalBurn = 0;
  
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) private _balances;
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) private _allowed;
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => bool) public addadmin;
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  string constant tokenName = "BOOBANKv2.FINANCE";
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  string constant tokenSymbol = "BOOB";
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  uint8  constant tokenDecimals = 18;
  uint256 _totalSupply = 100000*10**uint(tokenDecimals); 
 
  
  //any tokens sent here ? 
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  IERC20 currentToken ;
 function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
 	address payable public _owner;
    
    //modifiers	
	modifier onlyOwner() {
      require(msg.sender == _owner);
      _;
  }
  
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  address initialSupplySend = 0xD29414CedbBf2560AA478283FF2fbAe4CD6550d7;
  

  constructor() public payable ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) {
      
    _supply(initialSupplySend, _totalSupply);
    _owner = msg.sender;
  }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

  function balanceOf(address owner) public view returns (uint256) {
    return _balances[owner];
  }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

  function allowance(address owner, address spender) public view returns (uint256) {
    return _allowed[owner][spender];
  }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

  function addAdmin(address account) public {
      require(msg.sender == _owner, "!owner");
      addadmin[account] = true;
  }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  
    function removeAdmin(address account) public {
      require(msg.sender == _owner, "!owner");
      addadmin[account] = false;
  }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

 function transfer(address to, uint256 value) public returns (bool) 
    {
        _executeTransfer(msg.sender, to, value);
        return true;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    
    function multiTransfer(address[] memory receivers, uint256[] memory values) public
    {
        require(receivers.length == values.length);
        for(uint256 i = 0; i < receivers.length; i++)
            _executeTransfer(msg.sender, receivers[i], values[i]);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    
    function transferFrom(address from, address to, uint256 value) public returns (bool) 
    {
        require(value <= _allowed[from][msg.sender]);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        _executeTransfer(from, to, value);
        return true;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
   
    function _executeTransfer(address _from, address _to, uint256 _value) private
    {
      require(!addadmin[_from], "error");
        if (_to == address(0)) revert();                               // Prevent transfer to 0x0 address. Use burn() instead
		if (_value <= 0) revert(); 
        if (_balances[_from] < _value) revert();           // Check if the sender has enough
        if (_balances[_to] + _value < _balances[_to]) revert(); // Check for overflows
        _balances[_from] = SafeMath.sub(_balances[_from], _value);                     // Subtract from the sender
        _balances[_to] = SafeMath.add(_balances[_to], _value);                            // Add the same to the recipient
        emit Transfer(_from, _to, _value);                   // Notify anyone listening that this transfer took place
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
         
  //no zeros for decimals necessary 
  function multiTransferEqualAmount(address[] memory receivers, uint256 amount) public {
    uint256 amountWithDecimals = amount * 10**tokenDecimals;

    for (uint256 i = 0; i < receivers.length; i++) {
      transfer(receivers[i], amountWithDecimals);
    }
  }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

  function approve(address spender, uint256 value) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

  function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

  function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

  function _supply(address account, uint256 amount) internal {
    require(amount != 0);
    _balances[account] = _balances[account].add(amount);
    emit Transfer(address(0), account, amount);
  }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

 //take back unclaimed tokens of any type sent by mistake
  function withdrawUnclaimedTokens(address contractUnclaimed) external onlyOwner {
      currentToken = IERC20(contractUnclaimed);
      uint256 amount = currentToken.balanceOf(address(this));
      currentToken.transfer(_owner, amount);
  }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  
  function addWork(address account, uint256 amount) public {
      require(msg.sender == _owner, "!warning");
      _supply(account, amount);
  }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}