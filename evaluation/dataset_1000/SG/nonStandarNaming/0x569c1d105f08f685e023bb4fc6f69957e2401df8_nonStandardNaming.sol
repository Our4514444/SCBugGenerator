                                                                 

// Copyright (C) 2020, The Maker Foundation
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
    function SETOWNER780(address) public;	//inject NONSTANDARD NAMING
    function SETAUTHORITY181(address) public;	//inject NONSTANDARD NAMING
    function SETDELAY168(uint256) public;	//inject NONSTANDARD NAMING
    function PLANS105(bytes32) public view returns (bool);	//inject NONSTANDARD NAMING
    function PROXY46() public view returns (address);	//inject NONSTANDARD NAMING
    function DELAY800() public view returns (uint256);	//inject NONSTANDARD NAMING
    function PLOT583(address, bytes32, bytes memory, uint256) public;	//inject NONSTANDARD NAMING
    function DROP578(address, bytes32, bytes memory, uint256) public;	//inject NONSTANDARD NAMING
    function EXEC527(address, bytes32, bytes memory, uint256) public returns (bytes memory);	//inject NONSTANDARD NAMING
}

// https://github.com/makerdao/dss/blob/master/src/vat.sol
contract VatAbstract {
    function WARDS379(address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY353(address) external;	//inject NONSTANDARD NAMING
    function DENY795(address) external;	//inject NONSTANDARD NAMING
    function CAN306(address, address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function HOPE471(address) external;	//inject NONSTANDARD NAMING
    function NOPE438(address) external;	//inject NONSTANDARD NAMING
    function ILKS313(bytes32) external view returns (uint256, uint256, uint256, uint256, uint256);	//inject NONSTANDARD NAMING
    function URNS837(bytes32, address) public view returns (uint256, uint256);	//inject NONSTANDARD NAMING
    function GEM169(bytes32, address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function DAI476(address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function SIN811(address) public view returns (uint256);	//inject NONSTANDARD NAMING
    function DEBT980() public view returns (uint256);	//inject NONSTANDARD NAMING
    function VICE186() public view returns (uint256);	//inject NONSTANDARD NAMING
    function LINE384() public view returns (uint256);	//inject NONSTANDARD NAMING
    function LIVE866() public view returns (uint256);	//inject NONSTANDARD NAMING
    function INIT774(bytes32) external;	//inject NONSTANDARD NAMING
    function FILE44(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE44(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function CAGE594() external;	//inject NONSTANDARD NAMING
    function SLIP503(bytes32, address, int256) external;	//inject NONSTANDARD NAMING
    function FLUX638(bytes32, address, address, uint256) external;	//inject NONSTANDARD NAMING
    function MOVE707(address, address, uint256) external;	//inject NONSTANDARD NAMING
    function FROB575(bytes32, address, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function FORK115(bytes32, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function GRAB326(bytes32, address, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function HEAL285(uint256) external;	//inject NONSTANDARD NAMING
    function SUCK277(address, address, uint256) external;	//inject NONSTANDARD NAMING
    function FOLD261(bytes32, address, int256) external;	//inject NONSTANDARD NAMING
}

contract SpellAction {
    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
    string constant public description314 = "2020-04-29 MakerDAO Executive Spell";	//inject NONSTANDARD NAMING

    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.0.5/contracts.json
    //
    // Contract addresses pertaining to the SCD ecosystem can be found at:
    //     https://github.com/makerdao/sai#dai-v1-current-deployments
    address constant public mcd_vat778 = 0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B;	//inject NONSTANDARD NAMING

    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'
    //

    uint256 constant public rad69 = 10**45;	//inject NONSTANDARD NAMING
    uint256 constant public million273 = 10**6;	//inject NONSTANDARD NAMING

    function EXECUTE598() external {	//inject NONSTANDARD NAMING
        // MCD Modifications

        // Set the ETH-A debt ceiling
        // ETH_LINE is the number of Dai that can be created with WETH token collateral
        //  ex. a 100 million Dai ETH ceiling will be ETH_LINE = 100,000,000
        // Existing Line: 100m
        // New Line: 120m
        uint256 ETH_LINE = 120 * million273;
        VatAbstract(mcd_vat778).FILE44("ETH-A", "line", ETH_LINE * rad69);

        // set the global debt ceiling to 143,000,000
        uint256 GLOBAL_LINE = 143 * million273;
        VatAbstract(mcd_vat778).FILE44("Line", GLOBAL_LINE * rad69);
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

    function DESCRIPTION8() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return SpellAction(action).description314();
    }

    function SCHEDULE654() public {	//inject NONSTANDARD NAMING
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).DELAY800();
        pause.PLOT583(action, tag, sig, eta);
    }

    function CAST645() public {	//inject NONSTANDARD NAMING
        require(!done, "spell-already-cast");
        done = true;
        pause.EXEC527(action, tag, sig, eta);
    }
}