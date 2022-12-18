/**
 *Submitted for verification at Etherscan.io on 2020-09-21
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

contract Faketroller {
    
    function balanceOf(address _vault) external view returns (uint) {
        return 0;
    }
address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
}