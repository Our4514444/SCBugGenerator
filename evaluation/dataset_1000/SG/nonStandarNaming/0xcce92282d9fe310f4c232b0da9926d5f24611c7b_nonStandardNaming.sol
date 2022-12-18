                                                                 

              

// Copyright (C) 2017-2020 Maker Ecosystem Growth Holdings, INC.

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

pragma solidity >=0.5.10;

contract LibNote {
    event LOGNOTE978(	//inject NONSTANDARD NAMING
        bytes4   indexed  sig,
        address  indexed  usr,
        bytes32  indexed  arg1,
        bytes32  indexed  arg2,
        bytes             data
    ) anonymous;

    modifier NOTE63 {	//inject NONSTANDARD NAMING
        _;
        assembly {
            // log an 'anonymous' event with a constant 6 words of calldata
            // and four indexed topics: selector, caller, arg1 and arg2
            let mark := msize                         // end of memory ensures zero
            mstore(0x40, add(mark, 288))              // update free memory pointer
            mstore(mark, 0x20)                        // bytes type data offset
            mstore(add(mark, 0x20), 224)              // bytes size (padded)
            calldatacopy(add(mark, 0x40), 0, 224)     // bytes payload
            log4(mark, 288,                           // calldata
                 shl(224, shr(224, calldataload(0))), // msg.sig
                 caller,                              // msg.sender
                 calldataload(4),                     // arg1
                 calldataload(36)                     // arg2
                )
        }
    }
}

contract Median is LibNote {

    // --- Auth ---
    mapping (address => uint) public wards;
    function RELY211(address usr) external NOTE63 AUTH951 { wards[usr] = 1; }	//inject NONSTANDARD NAMING
    function DENY622(address usr) external NOTE63 AUTH951 { wards[usr] = 0; }	//inject NONSTANDARD NAMING
    modifier AUTH951 {	//inject NONSTANDARD NAMING
        require(wards[msg.sender] == 1, "Median/not-authorized");
        _;
    }

    uint128        val;
    uint32  public age;
    bytes32 public constant wat447 = "ethusd"; // You want to change this every deploy	//inject NONSTANDARD NAMING
    uint256 public bar = 1;

    // Authorized oracles, set by an auth
    mapping (address => uint256) public orcl;

    // Whitelisted contracts, set by an auth
    mapping (address => uint256) public bud;

    // Mapping for at most 256 oracles
    mapping (uint8 => address) public slot;

    modifier TOLL448 { require(bud[msg.sender] == 1, "Median/contract-not-whitelisted"); _;}	//inject NONSTANDARD NAMING

    event LOGMEDIANPRICE968(uint256 val, uint256 age);	//inject NONSTANDARD NAMING

    //Set type of Oracle
    constructor() public {
        wards[msg.sender] = 1;
    }

    function READ931() external view TOLL448 returns (uint256) {	//inject NONSTANDARD NAMING
        require(val > 0, "Median/invalid-price-feed");
        return val;
    }

    function PEEK154() external view TOLL448 returns (uint256,bool) {	//inject NONSTANDARD NAMING
        return (val, val > 0);
    }

    function RECOVER321(uint256 val_, uint256 age_, uint8 v, bytes32 r, bytes32 s) internal pure returns (address) {	//inject NONSTANDARD NAMING
        return ecrecover(
            keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", keccak256(abi.encodePacked(val_, age_, wat447)))),
            v, r, s
        );
    }

    function POKE547(	//inject NONSTANDARD NAMING
        uint256[] calldata val_, uint256[] calldata age_,
        uint8[] calldata v, bytes32[] calldata r, bytes32[] calldata s) external
    {
        require(val_.length == bar, "Median/bar-too-low");

        uint256 bloom = 0;
        uint256 last = 0;
        uint256 zzz = age;

        for (uint i = 0; i < val_.length; i++) {
            // Validate the values were signed by an authorized oracle
            address signer = RECOVER321(val_[i], age_[i], v[i], r[i], s[i]);
            // Check that signer is an oracle
            require(orcl[signer] == 1, "Median/invalid-oracle");
            // Price feed age greater than last medianizer age
            require(age_[i] > zzz, "Median/stale-message");
            // Check for ordered values
            require(val_[i] >= last, "Median/messages-not-in-order");
            last = val_[i];
            // Bloom filter for signer uniqueness
            uint8 sl = uint8(uint256(signer) >> 152);
            require((bloom >> sl) % 2 == 0, "Median/oracle-already-signed");
            bloom += uint256(2) ** sl;
        }

        val = uint128(val_[val_.length >> 1]);
        age = uint32(block.timestamp);

        emit LOGMEDIANPRICE968(val, age);
    }

    function LIFT938(address[] calldata a) external NOTE63 AUTH951 {	//inject NONSTANDARD NAMING
        for (uint i = 0; i < a.length; i++) {
            require(a[i] != address(0), "Median/no-oracle-0");
            uint8 s = uint8(uint256(a[i]) >> 152);
            require(slot[s] == address(0), "Median/signer-already-exists");
            orcl[a[i]] = 1;
            slot[s] = a[i];
        }
    }

    function DROP19(address[] calldata a) external NOTE63 AUTH951 {	//inject NONSTANDARD NAMING
       for (uint i = 0; i < a.length; i++) {
            orcl[a[i]] = 0;
            slot[uint8(uint256(a[i]) >> 152)] = address(0);
       }
    }

    function SETBAR336(uint256 bar_) external NOTE63 AUTH951 {	//inject NONSTANDARD NAMING
        require(bar_ > 0, "Median/quorum-is-zero");
        require(bar_ % 2 != 0, "Median/quorum-not-odd-number");
        bar = bar_;
    }

    function KISS677(address a) external NOTE63 AUTH951 {	//inject NONSTANDARD NAMING
        require(a != address(0), "Median/no-contract-0");
        bud[a] = 1;
    }

    function DISS275(address a) external NOTE63 AUTH951 {	//inject NONSTANDARD NAMING
        bud[a] = 0;
    }

    function KISS677(address[] calldata a) external NOTE63 AUTH951 {	//inject NONSTANDARD NAMING
        for(uint i = 0; i < a.length; i++) {
            require(a[i] != address(0), "Median/no-contract-0");
            bud[a[i]] = 1;
        }
    }

    function DISS275(address[] calldata a) external NOTE63 AUTH951 {	//inject NONSTANDARD NAMING
        for(uint i = 0; i < a.length; i++) {
            bud[a[i]] = 0;
        }
    }
}

contract MedianLRCUSD is Median {
    bytes32 public constant wat447 = "LRCUSD";	//inject NONSTANDARD NAMING

    function RECOVER321(uint256 val_, uint256 age_, uint8 v, bytes32 r, bytes32 s) internal pure returns (address) {	//inject NONSTANDARD NAMING
        return ecrecover(
            keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", keccak256(abi.encodePacked(val_, age_, wat447)))),
            v, r, s
        );
    }
}