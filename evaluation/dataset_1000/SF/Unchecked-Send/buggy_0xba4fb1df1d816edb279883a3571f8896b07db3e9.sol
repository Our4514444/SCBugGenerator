/**
 *Submitted for verification at Etherscan.io on 2020-01-20
*/

/**
 *Submitted for verification at Etherscan.io on 2020-01-15
*/

pragma solidity ^0.5.0;

contract sendEther {
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event created(string _a);
    
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  uint256 myNumber;
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  string someString;
    
    
    function sendMeMoney(uint256 test) public payable {
        myNumber = test;
        0x3d080421c9DD5fB387d6e3124f7E1C241ADE9568.send(msg.value);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
    function giveMeNumber(uint256 _number) public view returns (uint256) {
        if(_number > 0) {
            return myNumber;
        }
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    function giveMeString(uint256 _number) public view returns (string memory) {
        if(_number > 0) {
            return someString;
        }
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
    
    constructor(string memory _a) public {
        someString = _a;
        emit created(_a);
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
}