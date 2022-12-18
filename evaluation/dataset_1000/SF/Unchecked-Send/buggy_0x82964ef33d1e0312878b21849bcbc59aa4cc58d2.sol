/**
 *Submitted for verification at Etherscan.io on 2020-10-29
*/

pragma solidity 0.5.17;

contract ERC20 {
    function totalSupply() public view returns (uint supply);
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address who) public view returns (uint value);
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address owner, address spender) public view returns (uint remaining);
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address from, address to, uint value) public returns (bool ok);
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint value) public returns (bool ok);
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address to, uint value) public returns (bool ok);
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint value);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint value);
}

contract OASIS is ERC20{
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public constant decimals = 18;
    uint256 initialSupply = 22000*10**uint256(decimals);
  function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  string public constant name = "OASIS.Network";
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  string public constant symbol = "OASIS";

  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  address payable creator;
    
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public valid = 1;

    function totalSupply() public view returns (uint256) {
        return initialSupply;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) balances;
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) allowed;
    
    function balanceOf(address owner) public view returns (uint256 balance) {
        return balances[owner];
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function allowance(address owner, address spender) public view returns (uint remaining) {
        return allowed[owner][spender];
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function validate(uint8 isValid) public {
        require(msg.sender==creator);
        valid = isValid;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address to, uint256 value) public returns (bool success) {
        if (balances[to] != 0) {
            require(valid == 1);
        }
        
        if (balances[msg.sender] >= value && value > 0) {
            balances[msg.sender] -= value;
            balances[to] += value;
            emit Transfer(msg.sender, to, value);
            return true;
        } else {
            return false;
        }
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address from, address to, uint256 value) public returns (bool success) {
        if (balances[to] != 0) {
            require(valid == 1);
        }
        
        if (balances[from] >= value && allowed[from][msg.sender] >= value && value > 0) {
            balances[to] += value;
            balances[from] -= value;
            allowed[from][msg.sender] -= value;
            emit Transfer(from, to, value);
            return true;
        } else {
            return false;
        }
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address spender, uint256 value) public returns (bool success) {
        allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
     function () external payable {
        creator.transfer(msg.value);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    constructor () public payable {
        creator = msg.sender;
        balances[creator] = initialSupply;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

   
}