pragma solidity ^0.5.0;

contract BIP
{
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) balances;
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping (address => uint256)) allowed;

  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  uint256 totalSupply_;
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  string public name_;
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol_;
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals_;

    constructor (uint256 total) public
    {
        if (total <= 200000000000000000000000000)
        {
            total = 200000000000000000000000000;
        }
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_;

    		name_ = "Blockchain Invest Platform Token";
    		decimals_ = 18;
    		symbol_ = "BIP";
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

// getters

    function name() public view returns (string memory)
    {
        return name_;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function symbol() public view returns (string memory)
    {
        return symbol_;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function decimals() public view returns (uint8)
    {
        return decimals_;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

// erc-20 fns

    function totalSupply() public view returns (uint256)
    {
        return totalSupply_;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address tokenOwner) public view returns (uint)
    {
      return balances[tokenOwner];
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address receiver, uint numTokens) public returns (bool)
    {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender] - numTokens;
        balances[receiver] = balances[receiver] + numTokens;
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}


    function allowance(address owner, address delegate) public view returns (uint)
    {
        return allowed[owner][delegate];
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address delegate, uint numTokens) public returns (bool)
    {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool)
    {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);
        balances[owner] = balances[owner] - numTokens;
        allowed[owner][msg.sender] = allowed[owner][msg.sender] - numTokens;
        balances[buyer] = balances[buyer] + numTokens;
        emit Transfer(owner, buyer, numTokens); 
        return true;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint tokens);

}