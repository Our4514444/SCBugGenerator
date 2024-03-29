/**
 *Submitted for verification at Etherscan.io on 2020-08-30
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface MasterChef {
    function userInfo(uint, address) external view returns (uint, uint);
}

contract SushiVoterProxy {
    
    IERC20 public constant votes = IERC20(0xCE84867c3c02B05dc570d0135103d3fB9CC19433);
    MasterChef public constant chef = MasterChef(0xc2EdaD668740f1aA35E4D8f227fB8E17dcA888Cd);
    uint public constant pool = uint(12);
    
    function totalSupply() external view returns (uint) {
        return votes.totalSupply();
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
    
    function balanceOf(address _voter) external view returns (uint) {
        (uint _votes,) = chef.userInfo(pool, _voter);
        return _votes;
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
    
    constructor() public {}
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}