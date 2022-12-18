pragma solidity ^0.5.2;
contract ERC20 {
    function totalSupply() public  returns (uint);
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    function balanceOf(address tokenOwner) public view  returns (uint balance);
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    function allowance(address tokenOwner, address spender) public  returns (uint remaining);
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function transfer(address to, uint tokens) public returns (bool success);
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    function approve(address spender, uint tokens) public returns (bool success);
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
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

contract future1new
 {
  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address public adminaddr; 
  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  address public useraddr; 
  function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  mapping (address => mapping(address => uint256)) public dep_token;


 
    constructor() public
    {
         adminaddr = msg.sender; 
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    
    function safeAdd(uint crtbal, uint depbal) public pure returns (uint) 
    {
        uint totalbal = crtbal + depbal;
        return totalbal;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
    
    function safeSub(uint crtbal, uint depbal) public pure returns (uint) 
    {
        uint totalbal = crtbal - depbal;
        return totalbal;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
        
    function balanceOf(address token,address user) public view returns(uint256)            // show bal of perticular token in user add
    {
        return ERC20(token).balanceOf(user);
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    
    function transfer(address token, uint256 tokens)public payable                         // deposit perticular token balance to contract address (site address), can depoit multiple token   
    {
        ERC20(token).transferFrom(msg.sender, address(this), tokens);
        dep_token[msg.sender][token] = safeAdd(dep_token[msg.sender][token] , tokens);
        
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    
     function admin_token_withdraw(address token, address to, uint256 tokens)public payable  // withdraw perticular token balance from contract to user    
    {
        if(adminaddr==msg.sender)
        {                                                              // here only admin can withdraw token                    
            if(dep_token[to][token]>=tokens) 
            {
                dep_token[to][token] = safeSub(dep_token[to][token] , tokens) ;   
                ERC20(token).transfer(to, tokens);
            }
        }
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
    
    function tok_bal_contract(address token) public view returns(uint256)                       // show balance of contract address
    {
        return ERC20(token).balanceOf(address(this));
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    
 
    function depositETH() payable external                                                      // this function deposit eth in contract address
 
    { 
        
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    function admin_withdrawETH(address payable to, uint256 value) public payable returns (bool)  // this will withdraw eth from contract  to address(to)
    {
        
        if(adminaddr==msg.sender)
        {                                                               // only admin can withdraw ETH from user
            
   
                 to.transfer(value);
                 return true;

         }
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
}