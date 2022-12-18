                                                                 

pragma solidity ^0.5.16;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier RESTRICTED912() {	//inject NONSTANDARD NAMING
    if (msg.sender == owner) _;
  }

  constructor() public {
    owner = msg.sender;
  }

  function SETCOMPLETED608(uint completed) public RESTRICTED912 {	//inject NONSTANDARD NAMING
    last_completed_migration = completed;
  }

  function UPGRADE726(address new_address) public RESTRICTED912 {	//inject NONSTANDARD NAMING
    Migrations upgraded = Migrations(new_address);
    upgraded.SETCOMPLETED608(last_completed_migration);
  }
}