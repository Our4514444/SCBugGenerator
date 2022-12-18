                                                                 

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

// https://github.com/dapphub/ds-pause
contract DSPauseAbstract {
    function DELAY869() public view returns (uint256);	//inject NONSTANDARD NAMING
    function PLOT962(address, bytes32, bytes memory, uint256) public;	//inject NONSTANDARD NAMING
    function EXEC114(address, bytes32, bytes memory, uint256) public returns (bytes memory);	//inject NONSTANDARD NAMING
}

// https://github.com/makerdao/dss/blob/master/src/pot.sol
contract PotAbstract {
    function FILE988(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function DRIP108() external returns (uint256);	//inject NONSTANDARD NAMING
}

// https://github.com/makerdao/dss/blob/master/src/jug.sol
contract JugAbstract {
    function FILE988(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function DRIP108(bytes32) external returns (uint256);	//inject NONSTANDARD NAMING
}

// https://github.com/makerdao/dss/blob/master/src/vat.sol
contract VatAbstract {
    function ILKS38(bytes32) external view returns (uint256, uint256, uint256, uint256, uint256);	//inject NONSTANDARD NAMING
    function FILE988(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE988(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
}

// https://github.com/makerdao/dss/blob/master/src/flip.sol
contract FlipAbstract {
    function FILE988(bytes32, uint256) external;	//inject NONSTANDARD NAMING
}

// https://github.com/makerdao/flipper-mom/blob/master/src/FlipperMom.sol
contract FlipperMomAbstract {
    function RELY246(address) external;	//inject NONSTANDARD NAMING
    function DENY572(address) external;	//inject NONSTANDARD NAMING
}

contract SpellAction {
    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
    string  constant public description570 = "DEFCON-2 Emergency Spell";	//inject NONSTANDARD NAMING

    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.0.4/contracts.json
    //
    // Contract addresses pertaining to the SCD ecosystem can be found at:
    //     https://github.com/makerdao/sai#dai-v1-current-deployments
    address constant public mcd_vat906 =	//inject NONSTANDARD NAMING
        0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B;
    address constant public mcd_jug36 =	//inject NONSTANDARD NAMING
        0x19c0976f590D67707E62397C87829d896Dc0f1F1;
    address constant public mcd_pot532 =	//inject NONSTANDARD NAMING
        0x197E90f9FAD81970bA7976f33CbD77088E5D7cf7;
    address constant public mcd_flip_eth_a941 =	//inject NONSTANDARD NAMING
        0xd8a04F5412223F513DC55F839574430f5EC15531;
    address constant public mcd_flip_bat_a616 =	//inject NONSTANDARD NAMING
        0xaA745404d55f88C108A28c86abE7b5A1E7817c07;
    address constant public mcd_flip_wbtc_a300 =	//inject NONSTANDARD NAMING
        0x3E115d85D4d7253b05fEc9C0bB5b08383C2b0603;
    address constant public mcd_flip_usdc_a247 =	//inject NONSTANDARD NAMING
        0xE6ed1d09a19Bd335f051d78D5d22dF3bfF2c28B1;
    address constant public flipper_mom206 =	//inject NONSTANDARD NAMING
        0x9BdDB99625A711bf9bda237044924E34E8570f75;


    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'
    //
    uint256 constant public    zero_pct_rate851 = 1000000000000000000000000000;	//inject NONSTANDARD NAMING
    uint256 constant public   fifty_pct_rate138 = 1000000012857214317438491659;	//inject NONSTANDARD NAMING

    uint256 constant public rad942 = 10**45;	//inject NONSTANDARD NAMING
    uint256 constant public million223 = 10**6;	//inject NONSTANDARD NAMING

    function EXECUTE75() external {	//inject NONSTANDARD NAMING
        // Drip Pot and Jugs prior to all modifications.
        PotAbstract(mcd_pot532).DRIP108();
        JugAbstract(mcd_jug36).DRIP108("ETH-A");
        JugAbstract(mcd_jug36).DRIP108("BAT-A");
        JugAbstract(mcd_jug36).DRIP108("USDC-A");
        JugAbstract(mcd_jug36).DRIP108("WBTC-A");


        // MCD Modifications

        // Set the Dai Savings Rate
        // DSR_RATE is a value determined by the rate accumulator calculation
        // ex. an 8% annual rate will be 1000000002440418608258400030
        //
        uint256 DSR_RATE = zero_pct_rate851;
        PotAbstract(mcd_pot532).FILE988("dsr", DSR_RATE);

        // Set the ETH-A stability fee
        // ETH_A_FEE is a value determined by the rate accumulator calculation.
        // ex. an 8% annual rate will be 1000000002440418608258400030
        //
        uint256 ETH_A_FEE = zero_pct_rate851;
        JugAbstract(mcd_jug36).FILE988("ETH-A", "duty", ETH_A_FEE);

        // Set the BAT-A stability fee
        // BAT_A_FEE is a value determined by the rate accumulator calculation.
        // ex. an 8% annual rate will be 1000000002440418608258400030
        //
        uint256 BAT_A_FEE = zero_pct_rate851;
        JugAbstract(mcd_jug36).FILE988("BAT-A", "duty", BAT_A_FEE);

        // Set the WBTC-A stability fee
        // WBTC_A_FEE is a value determined by the rate accumulator calculation.
        // ex. an 8% annual rate will be 1000000002440418608258400030
        //
        uint256 WBTC_A_FEE = zero_pct_rate851;
        JugAbstract(mcd_jug36).FILE988("WBTC-A", "duty", WBTC_A_FEE);

        // Set the USDC stability fee
        // USDC_FEE is a value determined by the rate accumulator calculation.
        // ex. an 8% annual rate will be 1000000002440418608258400030
        //
        uint256 USDC_A_FEE = fifty_pct_rate138;
        JugAbstract(mcd_jug36).FILE988("USDC-A", "duty", USDC_A_FEE);

        // Set the USDC-A debt ceiling
        // USDC_LINE is the number of Dai that can be created with USDC token
        // collateral.
        // ex. a 40 million Dai USDC ceiling will be USDC_LINE = 40000000
        //
        // Existing Line: 20m
        // New Line: 40m
        uint256 USDC_A_LINE = 40 * million223;
        VatAbstract(mcd_vat906).FILE988("USDC-A", "line", USDC_A_LINE * rad942);

        // Set the global debt ceiling
        //
        // GLOBAL_LINE is the total number of Dai that can be created by all
        // collateral types as a whole number
        //
        (,,, uint256 saiLine,)   = VatAbstract(mcd_vat906).ILKS38("SAI");
        (,,, uint256 ethALine,)  = VatAbstract(mcd_vat906).ILKS38("ETH-A");
        (,,, uint256 batALine,)  = VatAbstract(mcd_vat906).ILKS38("BAT-A");
        (,,, uint256 wbtcALine,) = VatAbstract(mcd_vat906).ILKS38("WBTC-A");
        (,,, uint256 usdcALine,) = VatAbstract(mcd_vat906).ILKS38("USDC-A");
        uint256 GLOBAL_LINE =
            saiLine + ethALine + batALine + wbtcALine + usdcALine;
        VatAbstract(mcd_vat906).FILE988("Line", GLOBAL_LINE);

        // Set the ETH-A Flip tau
        //
        // ETH_A_FLIP_TAU is the bid lifetime
        //
        uint256 ETH_A_FLIP_TAU = 24 hours;
        FlipAbstract(mcd_flip_eth_a941).FILE988(bytes32("tau"), ETH_A_FLIP_TAU);

        // Set the BAT-A Flip tau
        //
        // BAT_A_FLIP_TAU is the bid lifetime
        //
        uint256 BAT_A_FLIP_TAU = 24 hours;
        FlipAbstract(mcd_flip_bat_a616).FILE988(bytes32("tau"), BAT_A_FLIP_TAU);

        // Set the WBTC-A Flip tau
        //
        // WBTC_A_FLIP_TAU is the bid lifetime
        //
        uint256 WBTC_A_FLIP_TAU = 24 hours;
        FlipAbstract(mcd_flip_wbtc_a300).FILE988(bytes32("tau"), WBTC_A_FLIP_TAU);

        // Set the USDC-A Flip tau
        //
        // USDC_A_FLIP_TAU is the bid lifetime
        //
        uint256 USDC_A_FLIP_TAU = 24 hours;
        FlipAbstract(mcd_flip_usdc_a247).FILE988(bytes32("tau"), USDC_A_FLIP_TAU);
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

    address constant public mcd_flip_eth_a941 =	//inject NONSTANDARD NAMING
        0xd8a04F5412223F513DC55F839574430f5EC15531;
    address constant public mcd_flip_bat_a616 =	//inject NONSTANDARD NAMING
        0xaA745404d55f88C108A28c86abE7b5A1E7817c07;
    address constant public mcd_flip_usdc_a247 =	//inject NONSTANDARD NAMING
        0xE6ed1d09a19Bd335f051d78D5d22dF3bfF2c28B1;
    address constant public mcd_flip_wbtc_a300 =	//inject NONSTANDARD NAMING
        0x3E115d85D4d7253b05fEc9C0bB5b08383C2b0603;
    address constant public flipper_mom206 =	//inject NONSTANDARD NAMING
        0x9BdDB99625A711bf9bda237044924E34E8570f75;

    uint256 constant internal million223 = 10**6;	//inject NONSTANDARD NAMING
    uint256 constant public t2020_07_01_1200utc951 = 1593604800;	//inject NONSTANDARD NAMING

    constructor() public {
        sig = abi.encodeWithSignature("execute()");
        action = address(new SpellAction());
        bytes32 _tag;
        address _action = action;
        assembly { _tag := extcodehash(_action) }
        tag = _tag;
        expiration = t2020_07_01_1200utc951;
    }

    function DESCRIPTION563() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return SpellAction(action).description570();
    }

    function SCHEDULE988() public {	//inject NONSTANDARD NAMING
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).DELAY869();
        pause.PLOT962(action, tag, sig, eta);

        // NOTE: 'eta' check should mimic the old behavior of 'done', thus
        // preventing these changes from being executed again.
    }

    function CAST39() public {	//inject NONSTANDARD NAMING
        require(!done, "spell-already-cast");
        done = true;
        pause.EXEC114(action, tag, sig, eta);
    }
}