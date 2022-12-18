/**
 *Submitted for verification at Etherscan.io on 2020-11-01
*/

pragma solidity ^0.5.17;



// -------------------------
// BurnableToken
// -------------------------

// -------------------------
// safemath library
// -------------------------

contract SafeMath {
    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a); c = a - b; }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);} function safeMul(uint a, uint b) public pure returns (uint c) { c = a * b; require(a == 0 || c / a == b); }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);} function safeDiv(uint a, uint b) public pure returns (uint c) { require(b > 0);
        c = a / b;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
}

// ------------------------
// ERC Token interface
// ------------------------

contract ERC20Interface
{
    function totalSupply() public view returns (uint);
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address tokenOwner) public view returns (uint balance);
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    
	function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address to, uint tokens) public returns (bool success);
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    
	function approve(address spender, uint tokens) public returns (bool success);
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom (address from, address to, uint tokens) public returns (bool success);
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    function burn(uint256 _value) public {_burn(msg.sender, _value);}
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    
    function _burn(address sender, uint amount) public {
        
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint tokens);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    
}


// ------------------------
// token
// ------------------------

contract APECASINOCOIN is ERC20Interface, SafeMath
{
  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  string public name;
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals;
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  bool public firstTransfor;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  address public burnaddress = 0x000000000000000000000000000000000000dEaD;
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  uint public burnPRCNTNum = 1;
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  uint public burnPRCNTDen = 10;
    
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public _totalSupply;
    
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint) balances;
  function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(address =>uint)) allowed;
    
    constructor() public
    {
        name = "APE CASINO COIN";
        symbol = "APECASINO";
        decimals = 18;
        _totalSupply = 777000000000000000000;
        
        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    
    function totalSupply() public view returns (uint) 
    {
    return _totalSupply - balances[address(0)];
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    
    function balanceOf(address tokenOwner) public view returns (uint balance) 
    {
    return balances[tokenOwner];
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    
    function allowance (address tokenOwner, address spender) public view returns (uint remaining) 
    {
    return allowed[tokenOwner][spender];
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    
    function approve(address spender, uint tokens) public returns (bool success) 
    {
    allowed[msg.sender][spender] = tokens;
    emit Approval(msg.sender, spender, tokens);
    return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    // ------------------------
    // Address 0x000000000000000000000000000000000000dEaD represents Ethereums global token burn address
    // ------------------------
    
    function transfer(address to, uint tokens) public returns (bool success)
    {
    balances[msg.sender] = safeSub(balances[msg.sender], tokens);
    balances[to] = safeAdd(balances[to], tokens - ((tokens * burnPRCNTNum) / burnPRCNTDen));
    
    _burn(burnaddress, tokens);
    emit Transfer(msg.sender, to, tokens - ((tokens * burnPRCNTNum) / burnPRCNTDen));
    emit Transfer(msg.sender, burnaddress, ((tokens * burnPRCNTNum) / burnPRCNTDen));
    return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
    function transferFrom(address from, address to, uint tokens) public returns (bool success) 
{
    balances[from] = safeSub(balances[from], tokens);
    allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], (tokens - ((tokens * burnPRCNTNum) / burnPRCNTDen)));
    balances[to] = safeAdd(balances[to], (tokens - ((tokens * burnPRCNTNum) / burnPRCNTDen)));    
    _burn(burnaddress, tokens);
        
	emit Transfer(from, to, (tokens - ((tokens * burnPRCNTNum) / burnPRCNTDen)));
	emit Transfer(from, burnaddress, ((tokens * burnPRCNTNum) / burnPRCNTDen));
    return true; 
}
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function _burn(address burnAddress, uint amount) public
{
    balances[burnAddress] = 
    safeAdd(balances[burnAddress], ((amount * burnPRCNTNum) / burnPRCNTDen));
}
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
 
}