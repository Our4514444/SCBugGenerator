/**
 *Submitted for verification at Etherscan.io on 2019-12-14
*/

// Copyright (C) 2019 lucasvo

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

pragma solidity 0.5.12;

contract MintLike {
  function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  uint public totalSupply;
    function mint(address,uint) public;
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
}

contract Budget {
    // --- Auth ---
  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  mapping (address => uint) public wards;
    function rely(address usr) public auth { wards[usr] = 1; }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
    function deny(address usr) public auth { wards[usr] = 0; }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    modifier auth { require(wards[msg.sender] == 1); _; }

    // --- Data ---
  function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
  MintLike                  public roof;

  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  mapping (address => uint) public budgets;

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event BudgetSet(address indexed sender, address indexed usr, uint wad);

    constructor(address roof_) public {
        wards[msg.sender] = 1;
        roof = MintLike(roof_);
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

    // --- Budget ---
    function mint(address usr, uint wad) public {
        roof.mint(usr, wad);
        require(budgets[msg.sender] >= wad);
        budgets[msg.sender] -= wad;
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

    function budget(address usr, uint wad) public auth {
        budgets[usr] = wad;
        emit BudgetSet(msg.sender, usr, wad);
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
}