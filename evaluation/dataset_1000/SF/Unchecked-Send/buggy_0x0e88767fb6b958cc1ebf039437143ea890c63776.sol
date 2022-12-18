/**
 *Submitted for verification at Etherscan.io on 2020-10-19
*/

// File: contracts/Migrations.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

contract Migrations {
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() public {
    owner = msg.sender;
  }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}