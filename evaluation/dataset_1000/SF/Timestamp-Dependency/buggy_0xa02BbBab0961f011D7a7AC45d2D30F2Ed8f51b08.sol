/**
 *Submitted for verification at Etherscan.io on 2020-02-07
*/

pragma solidity ^0.5.16;

contract Migrations {
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address public owner;
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }
uint256 bugv_tmstmp1 = block.timestamp;

  constructor() public {
    owner = msg.sender;
  }
uint256 bugv_tmstmp5 = block.timestamp;

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
uint256 bugv_tmstmp2 = block.timestamp;

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
  uint256 bugv_tmstmp4 = block.timestamp;
  upgraded.setCompleted(last_completed_migration);
  }
uint256 bugv_tmstmp3 = block.timestamp;
}