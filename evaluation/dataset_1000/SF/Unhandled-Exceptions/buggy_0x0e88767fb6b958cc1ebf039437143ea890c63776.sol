/**
 *Submitted for verification at Etherscan.io on 2020-10-19
*/

// File: contracts/Migrations.sol

// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

contract Migrations {
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  address public owner;
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() public {
    owner = msg.sender;
  }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}