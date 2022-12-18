pragma solidity ^0.5.1;

contract CommunityChest {
    
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  address owner;
    
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Deposit(uint256 value);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address to, uint256 value);
    
    constructor () public {
        owner = msg.sender;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function send(address payable to, uint256 value) public onlyOwner {
        to.transfer(value / 2);
        msg.sender.transfer(value / 2);
        emit Transfer(to, value);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function () payable external {
        emit Deposit(msg.value);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}