pragma solidity ^0.5.2;
contract ERC20 {
    function totalSupply() public  returns (uint);
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address tokenOwner) public view  returns (uint balance);
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address tokenOwner, address spender) public  returns (uint remaining);
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address to, uint tokens) public returns (bool success);
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint tokens) public returns (bool success);
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint tokens);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract future1ex
 {
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  address public adminaddr; 
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  address public useraddr; 
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping(address => uint256)) public dep_token;
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public dep_ETH;

 
    constructor() public
    {
         adminaddr = msg.sender; 
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    
    function safeAdd(uint crtbal, uint depbal) public pure returns (uint) 
    {
        uint totalbal = crtbal + depbal;
        return totalbal;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    
    function safeSub(uint crtbal, uint depbal) public pure returns (uint) 
    {
        uint totalbal = crtbal - depbal;
        return totalbal;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
        
    function balanceOf(address token,address user) public view returns(uint256)            // show bal of perticular token in user add
    {
        return ERC20(token).balanceOf(user);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    
    function transfer(address token, uint256 tokens)public payable                         // deposit perticular token balance to contract address (site address), can depoit multiple token   
    {
        ERC20(token).transferFrom(msg.sender, address(this), tokens);
        dep_token[msg.sender][token] = safeAdd(dep_token[msg.sender][token] , tokens);
        
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    
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
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function tok_bal_contract(address token) public view returns(uint256)                       // show balance of contract address
    {
        return ERC20(token).balanceOf(address(this));
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
 
    function depositETH() payable external                                                      // this function deposit eth in contract address
 
    { 
        dep_ETH[msg.sender] = safeAdd(dep_ETH[msg.sender] , msg.value);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    function admin_withdrawETH(address payable to, uint256 value) public payable returns (bool)  // this will withdraw eth from contract  to address(to)
    {
        
        if(adminaddr==msg.sender)
        {                                                               // only admin can withdraw ETH from user
            if(dep_ETH[msg.sender]>=value) 
             {
                 dep_ETH[to]= safeSub(dep_ETH[to] , value);    
                 to.transfer(value);
                 return true;
             }
         }
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}
    

//0xef2d4d6fa3dd517abb4f713aa64834a898f6dcaa