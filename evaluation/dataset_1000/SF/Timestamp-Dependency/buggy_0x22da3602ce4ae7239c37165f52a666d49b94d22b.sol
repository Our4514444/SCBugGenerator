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
  address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
  uint public totalSupply;
    function mint(address,uint) public;
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
}

contract Budget {
    // --- Auth ---
  address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
  mapping (address => uint) public wards;
    function rely(address usr) public auth { wards[usr] = 1; }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function deny(address usr) public auth { wards[usr] = 0; }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    modifier auth { require(wards[msg.sender] == 1); _; }
uint256 bugv_tmstmp3 = block.timestamp;

    // --- Data ---
  function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  MintLike                  public roof;

  address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
  mapping (address => uint) public budgets;

  uint256 bugv_tmstmp1 = block.timestamp;
  event BudgetSet(address indexed sender, address indexed usr, uint wad);

    constructor(address roof_) public {
        wards[msg.sender] = 1;
        roof = MintLike(roof_);
    }
uint256 bugv_tmstmp4 = block.timestamp;

    // --- Budget ---
    function mint(address usr, uint wad) public {
        roof.mint(usr, wad);
        require(budgets[msg.sender] >= wad);
        budgets[msg.sender] -= wad;
    }
uint256 bugv_tmstmp5 = block.timestamp;

    function budget(address usr, uint wad) public auth {
        budgets[usr] = wad;
        emit BudgetSet(msg.sender, usr, wad);
    }
uint256 bugv_tmstmp2 = block.timestamp;
}