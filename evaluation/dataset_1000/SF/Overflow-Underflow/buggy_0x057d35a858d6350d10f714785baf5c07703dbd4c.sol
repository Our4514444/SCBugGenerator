/**
 *Submitted for verification at Etherscan.io on 2020-07-03
*/

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

pragma solidity 0.5.12;

contract DSPauseAbstract {
    function delay() public view returns (uint256);
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    function plot(address, bytes32, bytes memory, uint256) public;
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
    function exec(address, bytes32, bytes memory, uint256) public returns (bytes memory);
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
}

contract VatAbstract {
    function file(bytes32, uint256) external;
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
    function file(bytes32, bytes32, uint256) external;
}

contract JugAbstract {
    function file(bytes32, bytes32, uint256) external;
    function drip(bytes32) external returns (uint256);
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
}

contract PotAbstract {
    function drip() external returns (uint256);
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}

contract MedianAbstract {
    function lift(address[] calldata) external;
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
    function kiss(address) external;
    function kiss(address[] calldata) external;
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}

contract OsmAbstract {
    function kiss(address) external;
}

contract SpellAction {
    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
    string constant public description = "2020-07-03 MakerDAO Executive Spell";

    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.0.8/contracts.json
    address constant MCD_VAT = 0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B;
  function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address constant MCD_JUG = 0x19c0976f590D67707E62397C87829d896Dc0f1F1;
  mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }
  address constant MCD_POT = 0x197E90f9FAD81970bA7976f33CbD77088E5D7cf7;

  mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
  address constant PIP_ETH = 0x81FE72B5A8d1A857d176C3E7d5Bd2679A9B85763;
  function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}
  address constant PIP_BAT = 0xB4eb54AF9Cc7882DF0121d26c5b97E802915ABe6;
  mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }
  address constant PIP_WBTC = 0xf185d0682d50819263941e5f4EacC763CC5C6C42;

  function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}
  address constant BATUSD = 0x18B4633D6E39870f398597f3c1bA8c4A41294966;
  mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }
  address constant BTCUSD = 0xe0F30cb149fAADC7247E953746Be9BbBB6B5751f;
  mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  address constant ETHBTC = 0x81A679f98b63B3dDf2F17CB5619f4d6775b3c5ED;
  function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address constant ETHUSD = 0x64DE91F5A373Cd4c28de3600cB34C7C6cE410C85;
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address constant KNCUSD = 0x83076a2F42dc1925537165045c9FDe9A4B71AD97;
  function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}
  address constant ZRXUSD = 0x956ecD6a9A9A0d84e8eB4e6BaaC09329E202E55e;

  mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }
  address constant ETHERSCAN  = 0x71eCFF5261bAA115dcB1D9335c88678324b8A987;
  mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }
  address constant GITCOIN    = 0xA4188B523EccECFbAC49855eB52eA0b55c4d56dd;
  mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }
  address constant KYBER      = 0xD09506dAC64aaA718b45346a032F934602e29cca;
  mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  address constant INFURA     = 0x8ff6a38A1CD6a42cAac45F08eB0c802253f68dfD;
  mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }
  address constant DEFI_SAVER = 0xeAa474cbFFA87Ae0F1a6f68a3aBA6C77C656F72c;
  function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
  address constant MCDEX      = 0x12Ee7E3369272CeE4e9843F36331561DBF9Ae6b4;

    uint256 constant THOUSAND = 10**3;
    uint256 constant MILLION  = 10**6;
    uint256 constant WAD      = 10**18;
    uint256 constant RAY      = 10**27;
    uint256 constant RAD      = 10**45;

    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'
    //
  function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint256 constant ZERO_PCT_RATE = 1000000000000000000000000000;
  function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
  uint256 constant TWO_PCT_RATE = 1000000000627937192491029810;
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  uint256 constant FOUR_PCT_RATE =  1000000001243680656318820312;
  function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
  uint256 constant FIFTY_PCT_RATE = 1000000012857214317438491659;

    function execute() external {
        // Perform drips
        PotAbstract(MCD_POT).drip();

        JugAbstract(MCD_JUG).drip("ETH-A");
        JugAbstract(MCD_JUG).drip("BAT-A");
        JugAbstract(MCD_JUG).drip("USDC-A");
        JugAbstract(MCD_JUG).drip("USDC-B");
        JugAbstract(MCD_JUG).drip("TUSD-A");
        JugAbstract(MCD_JUG).drip("WBTC-A");
        JugAbstract(MCD_JUG).drip("KNC-A");
        JugAbstract(MCD_JUG).drip("ZRX-A");

        // Set the global debt ceiling
        // Existing Line: 195m
        // New Line: 225m
        VatAbstract(MCD_VAT).file("Line", 225 * MILLION * RAD);

        // Set the WBTC-A debt ceiling
        // https://vote.makerdao.com/polling-proposal/qmzbjhbvompj77ud2yw3f1zatxgitt72q7cukx3mqtath9
        // Existing Line: 10m
        // New Line: 20m
        VatAbstract(MCD_VAT).file("WBTC-A", "line", 20 * MILLION * RAD);

        // Set the USDC-A debt ceiling (Post-Governance Polling Adjustment)
        // https://forum.makerdao.com/t/signal-request-usdc-a-stability-fee-and-debt-ceiling-adjustments/3020
        // Existing Line: 20m
        // New Line: 40m
        VatAbstract(MCD_VAT).file("USDC-A", "line", 40 * MILLION * RAD);

        // Set base rate to 0%
        // https://vote.makerdao.com/polling-proposal/qmtsig9y1zmfwb2eg62mbydqdjh12ftsdoyc9qc1kamkwu
        // Set WBTC-A premium risk to 2%
        // https://vote.makerdao.com/polling-proposal/qmzbjhbvompj77ud2yw3f1zatxgitt72q7cukx3mqtath9
        // Set USDC-A premium risk to 4% (post-governance polling adjustments)
        // https://forum.makerdao.com/t/signal-request-usdc-a-stability-fee-and-debt-ceiling-adjustments/3020
        JugAbstract(MCD_JUG).file("ETH-A", "duty", ZERO_PCT_RATE);
        JugAbstract(MCD_JUG).file("BAT-A", "duty", ZERO_PCT_RATE);
        JugAbstract(MCD_JUG).file("USDC-A", "duty", FOUR_PCT_RATE);
        JugAbstract(MCD_JUG).file("USDC-B", "duty", FIFTY_PCT_RATE);
        JugAbstract(MCD_JUG).file("WBTC-A", "duty", TWO_PCT_RATE);
        JugAbstract(MCD_JUG).file("TUSD-A", "duty", ZERO_PCT_RATE);
        JugAbstract(MCD_JUG).file("KNC-A", "duty", FOUR_PCT_RATE);
        JugAbstract(MCD_JUG).file("ZRX-A", "duty", FOUR_PCT_RATE);

        address[] memory lightFeeds = new address[](4);
        lightFeeds[0] = ETHERSCAN;
        lightFeeds[1] = GITCOIN;
        lightFeeds[2] = KYBER;
        lightFeeds[3] = INFURA;

        // Add Etherscan, Gitcoin and Kyber as Light Feeds
        MedianAbstract(BATUSD).lift(lightFeeds);
        MedianAbstract(BTCUSD).lift(lightFeeds);
        MedianAbstract(ETHBTC).lift(lightFeeds);
        MedianAbstract(ETHUSD).lift(lightFeeds);
        MedianAbstract(KNCUSD).lift(lightFeeds);
        MedianAbstract(ZRXUSD).lift(lightFeeds);

        // MIP10c9-SP1 Proposal: Whitelist DeFi Saver on ETHUSD Oracle (Osm)
        OsmAbstract(PIP_ETH).kiss(DEFI_SAVER);
        // MIP10c9-SP2 Proposal: Whitelist DeFi Saver on BATUSD Oracle (Osm)
        OsmAbstract(PIP_BAT).kiss(DEFI_SAVER);
        // MIP10c9-SP3 Proposal: Whitelist DeFi Saver on WBTCUSD Oracle (Osm)
        OsmAbstract(PIP_WBTC).kiss(DEFI_SAVER);
        // MIP10c9-SP4 Proposal: Whitelist MCDEX on ETH/USD Oracle (Median)
        MedianAbstract(ETHUSD).kiss(MCDEX);
    }
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
}

contract DssSpell {

    DSPauseAbstract  public pause =
        DSPauseAbstract(0xbE286431454714F511008713973d3B053A2d38f3);
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  address          public action;
  mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
  bytes32          public tag;
  function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint256          public eta;
  function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
  bytes            public sig;
  function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint256          public expiration;
  function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
  bool             public done;

    constructor() public {
        sig = abi.encodeWithSignature("execute()");
        action = address(new SpellAction());
        bytes32 _tag;
        address _action = action;
        assembly { _tag := extcodehash(_action) }
        tag = _tag;
        expiration = now + 30 days;
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }

    function description() public view returns (string memory) {
        return SpellAction(action).description();
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function schedule() public {
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).delay();
        pause.plot(action, tag, sig, eta);
    }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }

    function cast() public {
        require(!done, "spell-already-cast");
        done = true;
        pause.exec(action, tag, sig, eta);
    }
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
}