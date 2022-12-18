                                                                 

// File: contracts/Migrations.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier RESTRICTED268() {	//inject NONSTANDARD NAMING
    if (msg.sender == owner) _;
  }

  constructor() public {
    owner = msg.sender;
  }

  function SETCOMPLETED191(uint completed) public RESTRICTED268 {	//inject NONSTANDARD NAMING
    last_completed_migration = completed;
  }
}