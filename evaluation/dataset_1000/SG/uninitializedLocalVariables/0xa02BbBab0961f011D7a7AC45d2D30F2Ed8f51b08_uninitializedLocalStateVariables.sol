/**
 *Submitted for verification at Etherscan.io on 2020-02-07
*/

pragma solidity ^0.5.16;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() public {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded ;	//inject UNINIT LOCAL/STATE VAR

    upgraded.setCompleted(last_completed_migration);
  }
}