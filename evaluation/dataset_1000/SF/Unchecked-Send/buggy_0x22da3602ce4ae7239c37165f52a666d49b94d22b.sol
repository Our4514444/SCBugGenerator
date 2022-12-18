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
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  uint public totalSupply;
    function mint(address,uint) public;
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
}

contract Budget {
    // --- Auth ---
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint) public wards;
    function rely(address usr) public auth { wards[usr] = 1; }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    function deny(address usr) public auth { wards[usr] = 0; }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    modifier auth { require(wards[msg.sender] == 1); _; }

    // --- Data ---
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  MintLike                  public roof;

  function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint) public budgets;

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event BudgetSet(address indexed sender, address indexed usr, uint wad);

    constructor(address roof_) public {
        wards[msg.sender] = 1;
        roof = MintLike(roof_);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    // --- Budget ---
    function mint(address usr, uint wad) public {
        roof.mint(usr, wad);
        require(budgets[msg.sender] >= wad);
        budgets[msg.sender] -= wad;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    function budget(address usr, uint wad) public auth {
        budgets[usr] = wad;
        emit BudgetSet(msg.sender, usr, wad);
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
}