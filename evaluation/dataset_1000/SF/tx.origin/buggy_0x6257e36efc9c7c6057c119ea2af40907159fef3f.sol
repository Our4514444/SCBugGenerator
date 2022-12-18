/**
 *Submitted for verification at Etherscan.io on 2020-09-21
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

contract Faketroller {
    
    function balanceOf(address _vault) external view returns (uint) {
        return 0;
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}