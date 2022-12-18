/**
 *Submitted for verification at Etherscan.io on 2020-09-21
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

contract Faketroller {
    
    function balanceOf(address _vault) external view returns (uint) {
        return 0;
    }
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
}