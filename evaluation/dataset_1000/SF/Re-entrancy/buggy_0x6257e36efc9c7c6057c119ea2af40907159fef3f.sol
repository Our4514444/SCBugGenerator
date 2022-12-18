/**
 *Submitted for verification at Etherscan.io on 2020-09-21
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

contract Faketroller {
    
    function balanceOf(address _vault) external view returns (uint) {
        return 0;
    }
bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
}