/**
 *Submitted for verification at Etherscan.io on 2020-02-07
*/

pragma solidity ^0.5.16;

contract Migrations {
  address public owner;
  uint internal last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() public {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }
}