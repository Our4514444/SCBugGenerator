/**
 *Submitted for verification at Etherscan.io on 2020-01-01
*/

pragma solidity 0.5.12;

contract BlockLoopsToken {
    // Mapeia quantos tokens cada endereco possui
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public balanceOf;
   
    // Altere essa secao para a sua necessidade
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  string public name = "Token BlockLoops";
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol = "BLKL";
  function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * (uint256(10) ** decimals);
   
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);
   
    constructor() public {
        // Inicialmente cede todos os tokens ao criador do contrato.
        balanceOf[msg.sender] = totalSupply;
       
}
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

function transfer(address to, uint256 value) public returns (bool sucess) {
    require(balanceOf[msg.sender] >=value);
   
    balanceOf[msg.sender] -= value; // deduct from sender's balance
    balanceOf[to] += value;        // add to recipient's balance
    emit Transfer(msg.sender, to, value);
    return true;
}
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

event Approval(address indexed owner, address indexed spender, uint256 value);
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

mapping(address => mapping(address => uint256)) public allowance;

function approve(address spender, uint256 value)
    public
    returns (bool sucess)
{
    allowance[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
}
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

function transferFrom(address from, address to, uint256 value)
    public
    returns (bool success)
{
    require(value <= balanceOf[from]);
    require(value <= allowance[from][msg.sender]);
       
    balanceOf[from] -= value;
    balanceOf[to] += value;
    allowance[from][msg.sender]-= value;
    emit Transfer(from, to, value);
    return true;
}
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}