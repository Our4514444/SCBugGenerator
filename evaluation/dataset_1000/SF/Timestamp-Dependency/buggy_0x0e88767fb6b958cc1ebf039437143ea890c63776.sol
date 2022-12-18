/**
 *Submitted for verification at Etherscan.io on 2020-10-19
*/

// File: contracts/Migrations.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

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
  uint256 bugv_tmstmp4 = block.timestamp;
  owner = msg.sender;
  }
uint256 bugv_tmstmp2 = block.timestamp;

  function setCompleted(uint completed) public restricted {
  uint256 bugv_tmstmp5 = block.timestamp;
  last_completed_migration = completed;
  }
uint256 bugv_tmstmp3 = block.timestamp;
}