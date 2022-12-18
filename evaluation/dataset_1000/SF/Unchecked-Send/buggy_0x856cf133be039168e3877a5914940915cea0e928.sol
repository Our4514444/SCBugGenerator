pragma solidity ^0.5.1;

contract Token{
    
    // ERC20 Token, with the addition of symbol, name and decimals and a
    // fixed supply
    
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  string public constant symbol = 'NGN-TIG';
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  string public constant name = 'NGN Tigereum';
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public constant decimals = 2;
    uint public constant _totalSupply = 100000000 * 10**uint(decimals);
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  string public webAddress;
    
    // Balances for each account
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) balances;
    
    // Owner of account approves the transfer of an amount to another account
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(address => uint256)) allowed;
    
    constructor() public {
        balances[msg.sender] = _totalSupply;
        owner = msg.sender;
        webAddress = "https://tigereum.io";
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    
    function totalSupply() public pure returns (uint) {
        return _totalSupply;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    
    // Get the token balance for account { tokenOwner }
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    
    // Transfer the balance from owner's account to another account
    function transfer(address to, uint tokens) public returns (bool success) {
        require( balances[msg.sender] >= tokens && tokens > 0 );
        balances[msg.sender] -= tokens;
        balances[to] += tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    // Send {tokens} amount of tokens from address {from} to address {to}
    // The transferFrom method is used for a withdraw workflow, allowing contracts to send
    // tokens on your behalf
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        require( allowed[from][msg.sender] >= tokens && balances[from] >= tokens && tokens > 0 );
        balances[from] -= tokens;
        allowed[from][msg.sender] -= tokens;
        balances[to] += tokens;
        emit Transfer(from, to, tokens);
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
    // Allow {spender} to withdraw from your account, multiple times, up to the {tokens} amount.
    function approve(address sender, uint256 tokens) public returns (bool success) {
        allowed[msg.sender][sender] = tokens;
        emit Approval(msg.sender, sender, tokens);
        return true;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
    
    
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed _from, address indexed _to, uint256 _amount);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed _owner, address indexed _to, uint256 _amount);
}