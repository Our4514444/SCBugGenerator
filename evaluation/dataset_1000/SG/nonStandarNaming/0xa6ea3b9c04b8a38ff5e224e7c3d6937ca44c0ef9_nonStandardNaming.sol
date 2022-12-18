                                                                 

                                    

// Copyright (C) 2018 Rain <rainbreak@riseup.net>
//
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

pragma solidity >=0.5.12;

contract LibNote {
    event LOGNOTE731(	//inject NONSTANDARD NAMING
        bytes4   indexed  sig,
        address  indexed  usr,
        bytes32  indexed  arg1,
        bytes32  indexed  arg2,
        bytes             data
    ) anonymous;

    modifier NOTE701 {	//inject NONSTANDARD NAMING
        _;
        assembly {
            // log an 'anonymous' event with a constant 6 words of calldata
            // and four indexed topics: selector, caller, arg1 and arg2
            let mark := msize()                       // end of memory ensures zero
            mstore(0x40, add(mark, 288))              // update free memory pointer
            mstore(mark, 0x20)                        // bytes type data offset
            mstore(add(mark, 0x20), 224)              // bytes size (padded)
            calldatacopy(add(mark, 0x40), 0, 224)     // bytes payload
            log4(mark, 288,                           // calldata
                 shl(224, shr(224, calldataload(0))), // msg.sig
                 caller(),                            // msg.sender
                 calldataload(4),                     // arg1
                 calldataload(36)                     // arg2
                )
        }
    }
}

interface GemLike {
    function DECIMALS544() external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER702(address,uint) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM771(address,address,uint) external returns (bool);	//inject NONSTANDARD NAMING
}

interface VatLike {
    function SLIP440(bytes32,address,int) external;	//inject NONSTANDARD NAMING
    function MOVE854(address,address,uint) external;	//inject NONSTANDARD NAMING
}

contract GemJoin is LibNote {
    // --- Auth ---
    mapping (address => uint) public wards;
    function RELY773(address usr) external NOTE701 AUTH219 { wards[usr] = 1; }	//inject NONSTANDARD NAMING
    function DENY77(address usr) external NOTE701 AUTH219 { wards[usr] = 0; }	//inject NONSTANDARD NAMING
    modifier AUTH219 {	//inject NONSTANDARD NAMING
        require(wards[msg.sender] == 1, "GemJoin/not-authorized");
        _;
    }

    VatLike public vat;   // CDP Engine
    bytes32 public ilk;   // Collateral Type
    GemLike public gem;
    uint    public dec;
    uint    public live;  // Active Flag

    constructor(address vat_, bytes32 ilk_, address gem_) public {
        wards[msg.sender] = 1;
        live = 1;
        vat = VatLike(vat_);
        ilk = ilk_;
        gem = GemLike(gem_);
        dec = gem.DECIMALS544();
    }
    function CAGE846() external NOTE701 AUTH219 {	//inject NONSTANDARD NAMING
        live = 0;
    }
    function JOIN649(address usr, uint wad) external NOTE701 {	//inject NONSTANDARD NAMING
        require(live == 1, "GemJoin/not-live");
        require(int(wad) >= 0, "GemJoin/overflow");
        vat.SLIP440(ilk, usr, int(wad));
        require(gem.TRANSFERFROM771(msg.sender, address(this), wad), "GemJoin/failed-transfer");
    }
    function EXIT728(address usr, uint wad) external NOTE701 {	//inject NONSTANDARD NAMING
        require(wad <= 2 ** 255, "GemJoin/overflow");
        vat.SLIP440(ilk, msg.sender, -int(wad));
        require(gem.TRANSFER702(usr, wad), "GemJoin/failed-transfer");
    }
}