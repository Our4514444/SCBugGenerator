/**
 *Submitted for verification at Etherscan.io on 2020-07-22
*/

/// flap.sol -- Surplus auction

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
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event LogNote(
        bytes4   indexed  sig,
        address  indexed  usr,
        bytes32  indexed  arg1,
        bytes32  indexed  arg2,
        bytes             data
    ) anonymous;

    modifier note {
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
    function move(address,address,uint) external;
}
interface GemLike {
    function move(address,address,uint) external;
    function burn(address,uint) external;
}

/*
   This thing lets you sell some dai in return for gems.

 - `lot` dai in return for bid
 - `bid` gems paid
 - `ttl` single bid lifetime
 - `beg` minimum bid increase
 - `end` max auction duration
*/

contract Flapper is LibNote {
    // --- Auth ---
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint) public wards;
    function rely(address usr) external note auth { wards[usr] = 1; }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    function deny(address usr) external note auth { wards[usr] = 0; }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    modifier auth {
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

  function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  mapping (uint => Bid) public bids;

  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  VatLike  public   vat;  // CDP Engine
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  GemLike  public   gem;

  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  uint256  constant ONE = 1.00E18;
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  uint256  public   beg = 1.05E18;  // 5% minimum bid increase
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  uint48   public   ttl = 3 hours;  // 3 hours bid duration         [seconds]
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  uint48   public   tau = 2 days;   // 2 days total auction length  [seconds]
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  uint256  public kicks = 0;
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  uint256  public live;  // Active Flag

    // --- Events ---
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Kick(
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
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    // --- Math ---
    function add(uint48 x, uint48 y) internal pure returns (uint48 z) {
        require((z = x + y) >= x);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    // --- Admin ---
    function file(bytes32 what, uint data) external note auth {
        if (what == "beg") beg = data;
        else if (what == "ttl") ttl = uint48(data);
        else if (what == "tau") tau = uint48(data);
        else revert("Flapper/file-unrecognized-param");
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    // --- Auction ---
    function kick(uint lot, uint bid) external auth returns (uint id) {
        require(live == 1, "Flapper/not-live");
        require(kicks < uint(-1), "Flapper/overflow");
        id = ++kicks;

        bids[id].bid = bid;
        bids[id].lot = lot;
        bids[id].guy = msg.sender;  // configurable??
        bids[id].end = add(uint48(now), tau);

        vat.move(msg.sender, address(this), lot);

        emit Kick(id, lot, bid);
    }
    function tick(uint id) external note {
        require(bids[id].end < now, "Flapper/not-finished");
        require(bids[id].tic == 0, "Flapper/bid-already-placed");
        bids[id].end = add(uint48(now), tau);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    function tend(uint id, uint lot, uint bid) external note {
        require(live == 1, "Flapper/not-live");
        require(bids[id].guy != address(0), "Flapper/guy-not-set");
        require(bids[id].tic > now || bids[id].tic == 0, "Flapper/already-finished-tic");
        require(bids[id].end > now, "Flapper/already-finished-end");

        require(lot == bids[id].lot, "Flapper/lot-not-matching");
        require(bid >  bids[id].bid, "Flapper/bid-not-higher");
        require(mul(bid, ONE) >= mul(beg, bids[id].bid), "Flapper/insufficient-increase");

        if (msg.sender != bids[id].guy) {
            gem.move(msg.sender, bids[id].guy, bids[id].bid);
            bids[id].guy = msg.sender;
        }
        gem.move(msg.sender, address(this), bid - bids[id].bid);

        bids[id].bid = bid;
        bids[id].tic = add(uint48(now), ttl);
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    function deal(uint id) external note {
        require(live == 1, "Flapper/not-live");
        require(bids[id].tic != 0 && (bids[id].tic < now || bids[id].end < now), "Flapper/not-finished");
        vat.move(address(this), bids[id].guy, bids[id].lot);
        gem.burn(address(this), bids[id].bid);
        delete bids[id];
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function cage(uint rad) external note auth {
       live = 0;
       vat.move(address(this), msg.sender, rad);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    function yank(uint id) external note {
        require(live == 0, "Flapper/still-live");
        require(bids[id].guy != address(0), "Flapper/guy-not-set");
        gem.move(address(this), bids[id].guy, bids[id].bid);
        delete bids[id];
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}

contract FlapFab {
    function newFlap(address vat, address gov) public returns (Flapper flap) {
        flap = new Flapper(vat, gov);
        flap.rely(msg.sender);
        flap.deny(address(this));
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}