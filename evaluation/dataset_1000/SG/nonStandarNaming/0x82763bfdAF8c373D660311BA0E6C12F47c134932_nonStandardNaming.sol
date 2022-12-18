                                                                 

// SPDX-License-Identifier: AGPL-3.0
// The MegaPoker
//
// Copyright (C) 2020 Maker Ecosystem Growth Holdings, INC.
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

interface OsmLike {
    function POKE99() external;	//inject NONSTANDARD NAMING
    function PASS299() external view returns (bool);	//inject NONSTANDARD NAMING
}

interface SpotLike {
    function POKE99(bytes32) external;	//inject NONSTANDARD NAMING
}

contract MegaPoker {
    OsmLike constant eth678  = OsmLike(0x81FE72B5A8d1A857d176C3E7d5Bd2679A9B85763);	//inject NONSTANDARD NAMING
    OsmLike constant bat416  = OsmLike(0xB4eb54AF9Cc7882DF0121d26c5b97E802915ABe6);	//inject NONSTANDARD NAMING
    OsmLike constant wbtc611 = OsmLike(0xf185d0682d50819263941e5f4EacC763CC5C6C42);	//inject NONSTANDARD NAMING
    OsmLike constant knc625  = OsmLike(0xf36B79BD4C0904A5F350F1e4f776B81208c13069);	//inject NONSTANDARD NAMING
    OsmLike constant zrx291  = OsmLike(0x7382c066801E7Acb2299aC8562847B9883f5CD3c);	//inject NONSTANDARD NAMING
    OsmLike constant mana708 = OsmLike(0x8067259EA630601f319FccE477977E55C6078C13);	//inject NONSTANDARD NAMING
    OsmLike constant usdt777 = OsmLike(0x7a5918670B0C390aD25f7beE908c1ACc2d314A3C);	//inject NONSTANDARD NAMING
    OsmLike constant comp837 = OsmLike(0xBED0879953E633135a48a157718Aa791AC0108E4);	//inject NONSTANDARD NAMING
    OsmLike constant link206 = OsmLike(0x9B0C694C6939b5EA9584e9b61C7815E8d97D9cC7);	//inject NONSTANDARD NAMING
    OsmLike constant lrc746  = OsmLike(0x9eb923339c24c40Bef2f4AF4961742AA7C23EF3a);	//inject NONSTANDARD NAMING
    SpotLike constant spot926 = SpotLike(0x65C79fcB50Ca1594B025960e539eD7A9a6D434A3);	//inject NONSTANDARD NAMING

    function POKE99() external {	//inject NONSTANDARD NAMING
        if ( eth678.PASS299())  eth678.POKE99();
        if ( bat416.PASS299())  bat416.POKE99();
        if (wbtc611.PASS299()) wbtc611.POKE99();
        if ( knc625.PASS299())  knc625.POKE99();
        if ( zrx291.PASS299())  zrx291.POKE99();
        if (mana708.PASS299()) mana708.POKE99();
        if (usdt777.PASS299()) usdt777.POKE99();
        if (comp837.PASS299()) comp837.POKE99();
        if (link206.PASS299()) link206.POKE99();
        if ( lrc746.PASS299())  lrc746.POKE99();

        spot926.POKE99("ETH-A");
        spot926.POKE99("BAT-A");
        spot926.POKE99("WBTC-A");
        spot926.POKE99("KNC-A");
        spot926.POKE99("ZRX-A");
        spot926.POKE99("MANA-A");
        spot926.POKE99("USDT-A");
        spot926.POKE99("COMP-A");
        spot926.POKE99("LINK-A");
        spot926.POKE99("LRC-A");
        spot926.POKE99("ETH-B");
    }

    // Use for poking OSMs prior to collateral being added
    function POKETEMP673() external {	//inject NONSTANDARD NAMING
        if ( eth678.PASS299())  eth678.POKE99();
        if ( bat416.PASS299())  bat416.POKE99();
        if (wbtc611.PASS299()) wbtc611.POKE99();
        if ( knc625.PASS299())  knc625.POKE99();
        if ( zrx291.PASS299())  zrx291.POKE99();
        if (mana708.PASS299()) mana708.POKE99();
        if (usdt777.PASS299()) usdt777.POKE99();
        if (comp837.PASS299()) comp837.POKE99();
        if (link206.PASS299()) link206.POKE99();
        if ( lrc746.PASS299())  lrc746.POKE99();

        spot926.POKE99("ETH-A");
        spot926.POKE99("BAT-A");
        spot926.POKE99("WBTC-A");
        spot926.POKE99("KNC-A");
        spot926.POKE99("ZRX-A");
        spot926.POKE99("MANA-A");
        spot926.POKE99("USDT-A");
        spot926.POKE99("COMP-A");
        spot926.POKE99("LINK-A");
        spot926.POKE99("LRC-A");
        spot926.POKE99("ETH-B");
    }
}