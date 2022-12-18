                                                                 

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
    uint public totalSupply;
    function MINT10(address,uint) public;	//inject NONSTANDARD NAMING
}

contract Budget {
    // --- Auth ---
    mapping (address => uint) public wards;
    function RELY37(address usr) public AUTH125 { wards[usr] = 1; }	//inject NONSTANDARD NAMING
    function DENY505(address usr) public AUTH125 { wards[usr] = 0; }	//inject NONSTANDARD NAMING
    modifier AUTH125 { require(wards[msg.sender] == 1); _; }	//inject NONSTANDARD NAMING

    // --- Data ---
    MintLike                  public roof;

    mapping (address => uint) public budgets;

    event BUDGETSET186(address indexed sender, address indexed usr, uint wad);	//inject NONSTANDARD NAMING

    constructor(address roof_) public {
        wards[msg.sender] = 1;
        roof = MintLike(roof_);
    }

    // --- Budget ---
    function MINT10(address usr, uint wad) public {	//inject NONSTANDARD NAMING
        roof.MINT10(usr, wad);
        require(budgets[msg.sender] >= wad);
        budgets[msg.sender] -= wad;
    }

    function BUDGET64(address usr, uint wad) public AUTH125 {	//inject NONSTANDARD NAMING
        budgets[usr] = wad;
        emit BUDGETSET186(msg.sender, usr, wad);
    }
}