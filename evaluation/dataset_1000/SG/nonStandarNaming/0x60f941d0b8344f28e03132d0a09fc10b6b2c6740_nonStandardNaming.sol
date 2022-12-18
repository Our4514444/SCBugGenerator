                                                                 

                               

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
    event LOGNOTE671(	//inject NONSTANDARD NAMING
        bytes4   indexed  sig,
        address  indexed  usr,
        bytes32  indexed  arg1,
        bytes32  indexed  arg2,
        bytes             data
    ) anonymous;

    modifier NOTE813 {	//inject NONSTANDARD NAMING
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

interface VatLike {
    function MOVE974(address,address,uint) external;	//inject NONSTANDARD NAMING
}
interface GemLike {
    function MOVE974(address,address,uint) external;	//inject NONSTANDARD NAMING
    function BURN882(address,uint) external;	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                          

contract Flapper is LibNote {
    // --- Auth ---
    mapping (address => uint) public wards;
    function RELY111(address usr) external NOTE813 AUTH819 { wards[usr] = 1; }	//inject NONSTANDARD NAMING
    function DENY750(address usr) external NOTE813 AUTH819 { wards[usr] = 0; }	//inject NONSTANDARD NAMING
    modifier AUTH819 {	//inject NONSTANDARD NAMING
        require(wards[msg.sender] == 1, "Flapper/not-authorized");
        _;
    }

    // --- Data ---
    struct Bid {
        uint256 bid;  // gems paid               [wad]
        uint256 lot;  // dai in return for bid   [rad]
        address guy;  // high bidder
        uint48  tic;  // bid expiry time         [unix epoch time]
        uint48  end;  // auction expiry time     [unix epoch time]
    }

    mapping (uint => Bid) public bids;

    VatLike  public   vat;  // CDP Engine
    GemLike  public   gem;

    uint256  constant one994 = 1.00E18;	//inject NONSTANDARD NAMING
    uint256  public   beg = 1.05E18;  // 5% minimum bid increase
    uint48   public   ttl = 3 hours;  // 3 hours bid duration         [seconds]
    uint48   public   tau = 2 days;   // 2 days total auction length  [seconds]
    uint256  public kicks = 0;
    uint256  public live;  // Active Flag

    // --- Events ---
    event KICK164(	//inject NONSTANDARD NAMING
      uint256 id,
      uint256 lot,
      uint256 bid
    );

    // --- Init ---
    constructor(address vat_, address gem_) public {
        wards[msg.sender] = 1;
        vat = VatLike(vat_);
        gem = GemLike(gem_);
        live = 1;
    }

    // --- Math ---
    function ADD691(uint48 x, uint48 y) internal pure returns (uint48 z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x);
    }
    function MUL670(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x);
    }

    // --- Admin ---
    function FILE106(bytes32 what, uint data) external NOTE813 AUTH819 {	//inject NONSTANDARD NAMING
        if (what == "beg") beg = data;
        else if (what == "ttl") ttl = uint48(data);
        else if (what == "tau") tau = uint48(data);
        else revert("Flapper/file-unrecognized-param");
    }

    // --- Auction ---
    function KICK8(uint lot, uint bid) external AUTH819 returns (uint id) {	//inject NONSTANDARD NAMING
        require(live == 1, "Flapper/not-live");
        require(kicks < uint(-1), "Flapper/overflow");
        id = ++kicks;

        bids[id].bid = bid;
        bids[id].lot = lot;
        bids[id].guy = msg.sender;  // configurable??
        bids[id].end = ADD691(uint48(now), tau);

        vat.MOVE974(msg.sender, address(this), lot);

        emit KICK164(id, lot, bid);
    }
    function TICK384(uint id) external NOTE813 {	//inject NONSTANDARD NAMING
        require(bids[id].end < now, "Flapper/not-finished");
        require(bids[id].tic == 0, "Flapper/bid-already-placed");
        bids[id].end = ADD691(uint48(now), tau);
    }
    function TEND479(uint id, uint lot, uint bid) external NOTE813 {	//inject NONSTANDARD NAMING
        require(live == 1, "Flapper/not-live");
        require(bids[id].guy != address(0), "Flapper/guy-not-set");
        require(bids[id].tic > now || bids[id].tic == 0, "Flapper/already-finished-tic");
        require(bids[id].end > now, "Flapper/already-finished-end");

        require(lot == bids[id].lot, "Flapper/lot-not-matching");
        require(bid >  bids[id].bid, "Flapper/bid-not-higher");
        require(MUL670(bid, one994) >= MUL670(beg, bids[id].bid), "Flapper/insufficient-increase");

        if (msg.sender != bids[id].guy) {
            gem.MOVE974(msg.sender, bids[id].guy, bids[id].bid);
            bids[id].guy = msg.sender;
        }
        gem.MOVE974(msg.sender, address(this), bid - bids[id].bid);

        bids[id].bid = bid;
        bids[id].tic = ADD691(uint48(now), ttl);
    }
    function DEAL715(uint id) external NOTE813 {	//inject NONSTANDARD NAMING
        require(live == 1, "Flapper/not-live");
        require(bids[id].tic != 0 && (bids[id].tic < now || bids[id].end < now), "Flapper/not-finished");
        vat.MOVE974(address(this), bids[id].guy, bids[id].lot);
        gem.BURN882(address(this), bids[id].bid);
        delete bids[id];
    }

    function CAGE298(uint rad) external NOTE813 AUTH819 {	//inject NONSTANDARD NAMING
       live = 0;
       vat.MOVE974(address(this), msg.sender, rad);
    }
    function YANK870(uint id) external NOTE813 {	//inject NONSTANDARD NAMING
        require(live == 0, "Flapper/still-live");
        require(bids[id].guy != address(0), "Flapper/guy-not-set");
        gem.MOVE974(address(this), bids[id].guy, bids[id].bid);
        delete bids[id];
    }
}

contract FlapFab {
    function NEWFLAP917(address vat, address gov) public returns (Flapper flap) {	//inject NONSTANDARD NAMING
        flap = new Flapper(vat, gov);
        flap.RELY111(msg.sender);
        flap.DENY750(address(this));
    }
}