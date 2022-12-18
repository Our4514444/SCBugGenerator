                                                                 

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
    function DELAY967() public view returns (uint256);	//inject NONSTANDARD NAMING
    function PLOT488(address, bytes32, bytes memory, uint256) public;	//inject NONSTANDARD NAMING
    function EXEC936(address, bytes32, bytes memory, uint256) public returns (bytes memory);	//inject NONSTANDARD NAMING
}

contract VatAbstract {
    function FILE269(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE269(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
}

contract JugAbstract {
    function FILE269(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function DRIP85(bytes32) external returns (uint256);	//inject NONSTANDARD NAMING
}

contract PotAbstract {
    function DRIP85() external returns (uint256);	//inject NONSTANDARD NAMING
}

contract MedianAbstract {
    function LIFT984(address[] calldata) external;	//inject NONSTANDARD NAMING
    function KISS892(address) external;	//inject NONSTANDARD NAMING
    function KISS892(address[] calldata) external;	//inject NONSTANDARD NAMING
}

contract OsmAbstract {
    function KISS892(address) external;	//inject NONSTANDARD NAMING
}

contract SpellAction {
    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
    string constant public description439 = "2020-07-03 MakerDAO Executive Spell";	//inject NONSTANDARD NAMING

    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.0.8/contracts.json
    address constant mcd_vat383 = 0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B;	//inject NONSTANDARD NAMING
    address constant mcd_jug41 = 0x19c0976f590D67707E62397C87829d896Dc0f1F1;	//inject NONSTANDARD NAMING
    address constant mcd_pot246 = 0x197E90f9FAD81970bA7976f33CbD77088E5D7cf7;	//inject NONSTANDARD NAMING

    address constant pip_eth14 = 0x81FE72B5A8d1A857d176C3E7d5Bd2679A9B85763;	//inject NONSTANDARD NAMING
    address constant pip_bat157 = 0xB4eb54AF9Cc7882DF0121d26c5b97E802915ABe6;	//inject NONSTANDARD NAMING
    address constant pip_wbtc546 = 0xf185d0682d50819263941e5f4EacC763CC5C6C42;	//inject NONSTANDARD NAMING

    address constant batusd925 = 0x18B4633D6E39870f398597f3c1bA8c4A41294966;	//inject NONSTANDARD NAMING
    address constant btcusd116 = 0xe0F30cb149fAADC7247E953746Be9BbBB6B5751f;	//inject NONSTANDARD NAMING
    address constant ethbtc701 = 0x81A679f98b63B3dDf2F17CB5619f4d6775b3c5ED;	//inject NONSTANDARD NAMING
    address constant ethusd701 = 0x64DE91F5A373Cd4c28de3600cB34C7C6cE410C85;	//inject NONSTANDARD NAMING
    address constant kncusd886 = 0x83076a2F42dc1925537165045c9FDe9A4B71AD97;	//inject NONSTANDARD NAMING
    address constant zrxusd621 = 0x956ecD6a9A9A0d84e8eB4e6BaaC09329E202E55e;	//inject NONSTANDARD NAMING

    address constant etherscan640  = 0x71eCFF5261bAA115dcB1D9335c88678324b8A987;	//inject NONSTANDARD NAMING
    address constant gitcoin42    = 0xA4188B523EccECFbAC49855eB52eA0b55c4d56dd;	//inject NONSTANDARD NAMING
    address constant kyber379      = 0xD09506dAC64aaA718b45346a032F934602e29cca;	//inject NONSTANDARD NAMING
    address constant infura975     = 0x8ff6a38A1CD6a42cAac45F08eB0c802253f68dfD;	//inject NONSTANDARD NAMING
    address constant defi_saver521 = 0xeAa474cbFFA87Ae0F1a6f68a3aBA6C77C656F72c;	//inject NONSTANDARD NAMING
    address constant mcdex813      = 0x12Ee7E3369272CeE4e9843F36331561DBF9Ae6b4;	//inject NONSTANDARD NAMING

    uint256 constant thousand839 = 10**3;	//inject NONSTANDARD NAMING
    uint256 constant million831  = 10**6;	//inject NONSTANDARD NAMING
    uint256 constant wad325      = 10**18;	//inject NONSTANDARD NAMING
    uint256 constant ray729      = 10**27;	//inject NONSTANDARD NAMING
    uint256 constant rad483      = 10**45;	//inject NONSTANDARD NAMING

    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'
    //
    uint256 constant zero_pct_rate40 = 1000000000000000000000000000;	//inject NONSTANDARD NAMING
    uint256 constant two_pct_rate129 = 1000000000627937192491029810;	//inject NONSTANDARD NAMING
    uint256 constant four_pct_rate129 =  1000000001243680656318820312;	//inject NONSTANDARD NAMING
    uint256 constant fifty_pct_rate778 = 1000000012857214317438491659;	//inject NONSTANDARD NAMING

    function EXECUTE559() external {	//inject NONSTANDARD NAMING
        // Perform drips
        PotAbstract(mcd_pot246).DRIP85();

        JugAbstract(mcd_jug41).DRIP85("ETH-A");
        JugAbstract(mcd_jug41).DRIP85("BAT-A");
        JugAbstract(mcd_jug41).DRIP85("USDC-A");
        JugAbstract(mcd_jug41).DRIP85("USDC-B");
        JugAbstract(mcd_jug41).DRIP85("TUSD-A");
        JugAbstract(mcd_jug41).DRIP85("WBTC-A");
        JugAbstract(mcd_jug41).DRIP85("KNC-A");
        JugAbstract(mcd_jug41).DRIP85("ZRX-A");

        // Set the global debt ceiling
        // Existing Line: 195m
        // New Line: 225m
        VatAbstract(mcd_vat383).FILE269("Line", 225 * million831 * rad483);

        // Set the WBTC-A debt ceiling
        // https://vote.makerdao.com/polling-proposal/qmzbjhbvompj77ud2yw3f1zatxgitt72q7cukx3mqtath9
        // Existing Line: 10m
        // New Line: 20m
        VatAbstract(mcd_vat383).FILE269("WBTC-A", "line", 20 * million831 * rad483);

        // Set the USDC-A debt ceiling (Post-Governance Polling Adjustment)
        // https://forum.makerdao.com/t/signal-request-usdc-a-stability-fee-and-debt-ceiling-adjustments/3020
        // Existing Line: 20m
        // New Line: 40m
        VatAbstract(mcd_vat383).FILE269("USDC-A", "line", 40 * million831 * rad483);

        // Set base rate to 0%
        // https://vote.makerdao.com/polling-proposal/qmtsig9y1zmfwb2eg62mbydqdjh12ftsdoyc9qc1kamkwu
        // Set WBTC-A premium risk to 2%
        // https://vote.makerdao.com/polling-proposal/qmzbjhbvompj77ud2yw3f1zatxgitt72q7cukx3mqtath9
        // Set USDC-A premium risk to 4% (post-governance polling adjustments)
        // https://forum.makerdao.com/t/signal-request-usdc-a-stability-fee-and-debt-ceiling-adjustments/3020
        JugAbstract(mcd_jug41).FILE269("ETH-A", "duty", zero_pct_rate40);
        JugAbstract(mcd_jug41).FILE269("BAT-A", "duty", zero_pct_rate40);
        JugAbstract(mcd_jug41).FILE269("USDC-A", "duty", four_pct_rate129);
        JugAbstract(mcd_jug41).FILE269("USDC-B", "duty", fifty_pct_rate778);
        JugAbstract(mcd_jug41).FILE269("WBTC-A", "duty", two_pct_rate129);
        JugAbstract(mcd_jug41).FILE269("TUSD-A", "duty", zero_pct_rate40);
        JugAbstract(mcd_jug41).FILE269("KNC-A", "duty", four_pct_rate129);
        JugAbstract(mcd_jug41).FILE269("ZRX-A", "duty", four_pct_rate129);

        address[] memory lightFeeds = new address[](4);
        lightFeeds[0] = etherscan640;
        lightFeeds[1] = gitcoin42;
        lightFeeds[2] = kyber379;
        lightFeeds[3] = infura975;

        // Add Etherscan, Gitcoin and Kyber as Light Feeds
        MedianAbstract(batusd925).LIFT984(lightFeeds);
        MedianAbstract(btcusd116).LIFT984(lightFeeds);
        MedianAbstract(ethbtc701).LIFT984(lightFeeds);
        MedianAbstract(ethusd701).LIFT984(lightFeeds);
        MedianAbstract(kncusd886).LIFT984(lightFeeds);
        MedianAbstract(zrxusd621).LIFT984(lightFeeds);

        // MIP10c9-SP1 Proposal: Whitelist DeFi Saver on ETHUSD Oracle (Osm)
        OsmAbstract(pip_eth14).KISS892(defi_saver521);
        // MIP10c9-SP2 Proposal: Whitelist DeFi Saver on BATUSD Oracle (Osm)
        OsmAbstract(pip_bat157).KISS892(defi_saver521);
        // MIP10c9-SP3 Proposal: Whitelist DeFi Saver on WBTCUSD Oracle (Osm)
        OsmAbstract(pip_wbtc546).KISS892(defi_saver521);
        // MIP10c9-SP4 Proposal: Whitelist MCDEX on ETH/USD Oracle (Median)
        MedianAbstract(ethusd701).KISS892(mcdex813);
    }
}

contract DssSpell {

    DSPauseAbstract  public pause =
        DSPauseAbstract(0xbE286431454714F511008713973d3B053A2d38f3);
    address          public action;
    bytes32          public tag;
    uint256          public eta;
    bytes            public sig;
    uint256          public expiration;
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

    function DESCRIPTION714() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return SpellAction(action).description439();
    }

    function SCHEDULE746() public {	//inject NONSTANDARD NAMING
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).DELAY967();
        pause.PLOT488(action, tag, sig, eta);
    }

    function CAST815() public {	//inject NONSTANDARD NAMING
        require(!done, "spell-already-cast");
        done = true;
        pause.EXEC936(action, tag, sig, eta);
    }
}