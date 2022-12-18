/**
 *Submitted for verification at Etherscan.io on 2020-08-28
*/

pragma solidity 0.5.17;
contract ERC20Interface {
    function totalSupply() public view returns (uint);
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    function balanceOf(address tokenOwner) public view returns (uint balance);
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    function transfer(address to, uint tokens) public returns (bool success);
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    function approve(address spender, uint tokens) public returns (bool success);
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Transfer(address indexed from, address indexed to, uint tokens);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
contract SafeMath {
    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a); c = a - b; }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  } function safeMul(uint a, uint b) public pure returns (uint c) { c = a * b; require(a == 0 || c / a == b); }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
} function safeDiv(uint a, uint b) public pure returns (uint c) { require(b > 0);
        c = a / b;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
}
contract PimpCoin is ERC20Interface, SafeMath {
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  string public name;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  string public symbol;
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  uint8 public decimals;
    
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint256 public _totalSupply;
    
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  mapping(address => uint) balances;
  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping(address => mapping(address => uint)) allowed;
    
    constructor() public {
        name = "PimpCoin";
        symbol = "PIMP";
        decimals = 10;
        _totalSupply = 10000000;
        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    function totalSupply() public view returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
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
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
}