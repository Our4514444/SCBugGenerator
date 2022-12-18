/**
 *Submitted for verification at Etherscan.io on 2020-11-02
*/

/**
 *Submitted for verification at Etherscan.io on 2020-08-31
*/

// File: contracts/Storage.sol

pragma solidity 0.5.16;

contract Storage {

function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  address public governance;
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  address public controller;

  constructor() public {
    governance = msg.sender;
  }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

  modifier onlyGovernance() {
    require(isGovernance(msg.sender), "Not governance");
    _;
  }

  function setGovernance(address _governance) public onlyGovernance {
    require(_governance != address(0), "new governance shouldn't be empty");
    governance = _governance;
  }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

  function setController(address _controller) public onlyGovernance {
    require(_controller != address(0), "new controller shouldn't be empty");
    controller = _controller;
  }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

  function isGovernance(address account) public view returns (bool) {
    return account == governance;
  }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

  function isController(address account) public view returns (bool) {
    return account == controller;
  }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}