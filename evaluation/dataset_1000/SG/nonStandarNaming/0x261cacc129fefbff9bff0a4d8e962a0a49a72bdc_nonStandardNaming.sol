                                                                 

                                                                 

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
    function SETOWNER582(address) public;	//inject NONSTANDARD NAMING
    function SETAUTHORITY296(address) public;	//inject NONSTANDARD NAMING
    function SETDELAY299(uint256) public;	//inject NONSTANDARD NAMING
    function PLANS627(bytes32) public view returns (bool);	//inject NONSTANDARD NAMING
    function PROXY206() public view returns (address);	//inject NONSTANDARD NAMING
    function DELAY672() public view returns (uint256);	//inject NONSTANDARD NAMING
    function PLOT662(address, bytes32, bytes memory, uint256) public;	//inject NONSTANDARD NAMING
    function DROP410(address, bytes32, bytes memory, uint256) public;	//inject NONSTANDARD NAMING
    function EXEC705(address, bytes32, bytes memory, uint256) public returns (bytes memory);	//inject NONSTANDARD NAMING
}

// https://github.com/makerdao/dss/blob/master/src/vat.sol
contract VatAbstract {
    function WARDS871(address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY687(address) external;	//inject NONSTANDARD NAMING
    function DENY655(address) external;	//inject NONSTANDARD NAMING
    function CAN263(address, address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function HOPE485(address) external;	//inject NONSTANDARD NAMING
    function NOPE840(address) external;	//inject NONSTANDARD NAMING
    function ILKS315(bytes32) external view returns (uint256, uint256, uint256, uint256, uint256);	//inject NONSTANDARD NAMING
    function URNS334(bytes32, address) public view returns (uint256, uint256);	//inject NONSTANDARD NAMING
    function GEM793(bytes32, address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function DAI423(address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function SIN949(address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function DEBT103() public view returns (uint256);	//inject NONSTANDARD NAMING
    function VICE220() public view returns (uint256);	//inject NONSTANDARD NAMING
    function LINE716() public view returns (uint256);	//inject NONSTANDARD NAMING
    function LIVE215() public view returns (uint256);	//inject NONSTANDARD NAMING
    function INIT140(bytes32) external;	//inject NONSTANDARD NAMING
    function FILE951(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE951(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function CAGE17() external;	//inject NONSTANDARD NAMING
    function SLIP529(bytes32, address, int256) external;	//inject NONSTANDARD NAMING
    function FLUX381(bytes32, address, address, uint256) external;	//inject NONSTANDARD NAMING
    function MOVE451(address, address, uint256) external;	//inject NONSTANDARD NAMING
    function FROB934(bytes32, address, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function FORK314(bytes32, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function GRAB526(bytes32, address, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function HEAL427(uint256) external;	//inject NONSTANDARD NAMING
    function SUCK161(address, address, uint256) external;	//inject NONSTANDARD NAMING
    function FOLD311(bytes32, address, int256) external;	//inject NONSTANDARD NAMING
}

// https://github.com/makerdao/dss/blob/master/src/jug.sol
contract JugAbstract {
    function WARDS871(address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY687(address) external;	//inject NONSTANDARD NAMING
    function DENY655(address) external;	//inject NONSTANDARD NAMING
    function ILKS315(bytes32) public view returns (uint256, uint256);	//inject NONSTANDARD NAMING
    function VAT540() public view returns (address);	//inject NONSTANDARD NAMING
    function VOW769() public view returns (address);	//inject NONSTANDARD NAMING
    function BASE133() public view returns (address);	//inject NONSTANDARD NAMING
    function INIT140(bytes32) external;	//inject NONSTANDARD NAMING
    function FILE951(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE951(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE951(bytes32, address) external;	//inject NONSTANDARD NAMING
    function DRIP14(bytes32) external returns (uint256);	//inject NONSTANDARD NAMING
}

// https://github.com/makerdao/dss/blob/master/src/pot.sol
contract PotAbstract {
    function WARDS871(address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY687(address) external;	//inject NONSTANDARD NAMING
    function DENY655(address) external;	//inject NONSTANDARD NAMING
    function PIE984(address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function PIE984() public view returns (uint256);	//inject NONSTANDARD NAMING
    function DSR761() public view returns (uint256);	//inject NONSTANDARD NAMING
    function CHI149() public view returns (uint256);	//inject NONSTANDARD NAMING
    function VAT540() public view returns (address);	//inject NONSTANDARD NAMING
    function VOW769() public view returns (address);	//inject NONSTANDARD NAMING
    function RHO258() public view returns (uint256);	//inject NONSTANDARD NAMING
    function LIVE215() public view returns (uint256);	//inject NONSTANDARD NAMING
    function FILE951(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE951(bytes32, address) external;	//inject NONSTANDARD NAMING
    function CAGE17() external;	//inject NONSTANDARD NAMING
    function DRIP14() external returns (uint256);	//inject NONSTANDARD NAMING
    function JOIN178(uint256) external;	//inject NONSTANDARD NAMING
    function EXIT385(uint256) external;	//inject NONSTANDARD NAMING
}

contract SpellAction {
    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
    string constant public description177 = "2020-07-20   MakerDAO Executive Spell";	//inject NONSTANDARD NAMING

    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.0.8/contracts.json
    address constant mcd_vat618 = 0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B;	//inject NONSTANDARD NAMING
    address constant mcd_jug27 = 0x19c0976f590D67707E62397C87829d896Dc0f1F1;	//inject NONSTANDARD NAMING
    address constant mcd_pot333 = 0x197E90f9FAD81970bA7976f33CbD77088E5D7cf7;	//inject NONSTANDARD NAMING

    uint256 constant thousand874 = 10**3;	//inject NONSTANDARD NAMING
    uint256 constant million661  = 10**6;	//inject NONSTANDARD NAMING
    uint256 constant wad773      = 10**18;	//inject NONSTANDARD NAMING
    uint256 constant ray5      = 10**27;	//inject NONSTANDARD NAMING
    uint256 constant rad340      = 10**45;	//inject NONSTANDARD NAMING

    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'

    function EXECUTE128() external {	//inject NONSTANDARD NAMING
        // Perform drips
        PotAbstract(mcd_pot333).DRIP14();

        JugAbstract(mcd_jug27).DRIP14("ETH-A");
        JugAbstract(mcd_jug27).DRIP14("BAT-A");
        JugAbstract(mcd_jug27).DRIP14("USDC-A");
        JugAbstract(mcd_jug27).DRIP14("USDC-B");
        JugAbstract(mcd_jug27).DRIP14("TUSD-A");
        JugAbstract(mcd_jug27).DRIP14("WBTC-A");
        JugAbstract(mcd_jug27).DRIP14("KNC-A");
        JugAbstract(mcd_jug27).DRIP14("ZRX-A");

        // Set the global debt ceiling
        // Existing Line: 265m
        // New Line: 345m
        VatAbstract(mcd_vat618).FILE951("Line", 345 * million661 * rad340);

        // Set the ETH-A debt ceiling
        // Existing Line: 180m
        // New Line: 220m
        VatAbstract(mcd_vat618).FILE951("ETH-A", "line", 220 * million661 * rad340);

        // Set the USDC-A debt ceiling
        // Existing Line: 40m
        // New Line: 80m
        VatAbstract(mcd_vat618).FILE951("USDC-A", "line", 80 * million661 * rad340);
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

    function DESCRIPTION297() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return SpellAction(action).description177();
    }

    function SCHEDULE557() public {	//inject NONSTANDARD NAMING
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).DELAY672();
        pause.PLOT662(action, tag, sig, eta);
    }

    function CAST428() public {	//inject NONSTANDARD NAMING
        require(!done, "spell-already-cast");
        done = true;
        pause.EXEC705(action, tag, sig, eta);
    }
}