                                                                 

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

interface DSPauseAbstract {
    function SETOWNER212(address) external;	//inject NONSTANDARD NAMING
    function SETAUTHORITY231(address) external;	//inject NONSTANDARD NAMING
    function SETDELAY790(uint256) external;	//inject NONSTANDARD NAMING
    function PLANS637(bytes32) external view returns (bool);	//inject NONSTANDARD NAMING
    function PROXY146() external view returns (address);	//inject NONSTANDARD NAMING
    function DELAY105() external view returns (uint256);	//inject NONSTANDARD NAMING
    function PLOT827(address, bytes32, bytes calldata, uint256) external;	//inject NONSTANDARD NAMING
    function DROP155(address, bytes32, bytes calldata, uint256) external;	//inject NONSTANDARD NAMING
    function EXEC974(address, bytes32, bytes calldata, uint256) external returns (bytes memory);	//inject NONSTANDARD NAMING
}

interface VatAbstract {
    function WARDS633(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY532(address) external;	//inject NONSTANDARD NAMING
    function DENY278(address) external;	//inject NONSTANDARD NAMING
    function CAN469(address, address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function HOPE959(address) external;	//inject NONSTANDARD NAMING
    function NOPE314(address) external;	//inject NONSTANDARD NAMING
    function ILKS905(bytes32) external view returns (uint256, uint256, uint256, uint256, uint256);	//inject NONSTANDARD NAMING
    function URNS197(bytes32, address) external view returns (uint256, uint256);	//inject NONSTANDARD NAMING
    function GEM685(bytes32, address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DAI892(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function SIN862(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DEBT616() external view returns (uint256);	//inject NONSTANDARD NAMING
    function VICE598() external view returns (uint256);	//inject NONSTANDARD NAMING
    function LINE898() external view returns (uint256);	//inject NONSTANDARD NAMING
    function LIVE487() external view returns (uint256);	//inject NONSTANDARD NAMING
    function INIT851(bytes32) external;	//inject NONSTANDARD NAMING
    function FILE985(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE985(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function CAGE225() external;	//inject NONSTANDARD NAMING
    function SLIP883(bytes32, address, int256) external;	//inject NONSTANDARD NAMING
    function FLUX520(bytes32, address, address, uint256) external;	//inject NONSTANDARD NAMING
    function MOVE98(address, address, uint256) external;	//inject NONSTANDARD NAMING
    function FROB716(bytes32, address, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function FORK598(bytes32, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function GRAB401(bytes32, address, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function HEAL151(uint256) external;	//inject NONSTANDARD NAMING
    function SUCK262(address, address, uint256) external;	//inject NONSTANDARD NAMING
    function FOLD609(bytes32, address, int256) external;	//inject NONSTANDARD NAMING
}

contract SpellAction {
    // MAINNET ADDRESSES
    //
    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.1.3/contracts.json

    address constant mcd_vat603 = 0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B;	//inject NONSTANDARD NAMING

    // Decimals & precision
    uint256 constant thousand943 = 10 ** 3;	//inject NONSTANDARD NAMING
    uint256 constant million548  = 10 ** 6;	//inject NONSTANDARD NAMING
    uint256 constant wad224      = 10 ** 18;	//inject NONSTANDARD NAMING
    uint256 constant ray120      = 10 ** 27;	//inject NONSTANDARD NAMING
    uint256 constant rad190      = 10 ** 45;	//inject NONSTANDARD NAMING

    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'
    //
    // A table of rates can be found at
    //    https://ipfs.io/ipfs/QmefQMseb3AiTapiAKKexdKHig8wroKuZbmLtPLv4u2YwW

    function EXECUTE793() external {	//inject NONSTANDARD NAMING
        // Proving the Pause Proxy has access to the MCD core system at the execution time
        require(VatAbstract(mcd_vat603).WARDS633(address(this)) == 1, "no-access");
    }
}

contract DssSpell {
    DSPauseAbstract public pause =
        DSPauseAbstract(0xbE286431454714F511008713973d3B053A2d38f3);
    address         public action;
    bytes32         public tag;
    uint256         public eta;
    bytes           public sig;
    uint256         public expiration;
    bool            public done;

    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
    // Hash: seth keccak -- "$(wget https://raw.githubusercontent.com/makerdao/community/d5e2a373bf043380dffd958a8e09339927e988f0/governance/votes/Executive%20vote%20-%20October%2026%2C%202020.md -q -O - 2>/dev/null)"
    string constant public description446 =	//inject NONSTANDARD NAMING
        "2020-10-26 MakerDAO Executive Spell | Hash: 0xf4c67a6aa3a86d8378010ffc320219938f2f96ef16ca718284e16e52ccff30b7";

    // MIP14: Protocol Dai Transfer
    // Hash: seth keccak -- "$(wget https://raw.githubusercontent.com/makerdao/mips/3eb4e3d26ac79d93874dea07d095a0d991a14d20/MIP14/mip14.md -q -O - 2>/dev/null)"
    string constant public mip15449 = "0x70f6c28c1b5ef1657a8a901636f31f9479ff5d32c251dd4eda84b8c00655fdba";	//inject NONSTANDARD NAMING

    // MIP20: Target Price Adjustment Module (Vox)
    // Hash: seth keccak -- "$(wget https://raw.githubusercontent.com/makerdao/mips/f6515e96cf4dae6b7e22fb11f5acac81fa5e1d9f/MIP20/mip20.md -q -O - 2>/dev/null)"
    string constant public mip20124 = "0x35330368b523195aa63e235f5879e9f3d9a0f0d81437d477261dc00a35cda463";	//inject NONSTANDARD NAMING

    // MIP21: Real World Assets - Off-Chain Asset Backed Lender
    // Hash: seth keccak -- "$(wget https://raw.githubusercontent.com/makerdao/mips/945da898f0f2ab8d7ebf3ff1672c66d05894dd2a/MIP21/MIP21.md -q -O - 2>/dev/null)"
    string constant public mip21861 = "0xb538ef266caf65ccb76e8c49a74b57ca50fc4e0d9a303370ad4b0bb277a8164c";	//inject NONSTANDARD NAMING

    // MIP22: Centrifuge Direct Liquidation Module
    // Hash: seth keccak -- "$(wget https://raw.githubusercontent.com/makerdao/mips/00dae04b115863517d90e1e1b898c2ace59ad19b/MIP22/mip22.md -q -O - 2>/dev/null)"
    string constant public mip22530 = "0xc6945ad6c8c2a5842f8335737eb2f9ea3abdf865a301d14111d6fe802b06f034";	//inject NONSTANDARD NAMING

    // MIP23: Domain Structure and Roles
    // Hash: seth keccak -- "$(wget https://raw.githubusercontent.com/makerdao/mips/3eb4e3d26ac79d93874dea07d095a0d991a14d20/MIP23/mip23.md -q -O - 2>/dev/null)"
    string constant public mip2342 = "0xa94258d039103585da7a3c8de095e9907215ce431141fcfdd9b4f5986e07d59a";	//inject NONSTANDARD NAMING

    // MIP13c3-SP3: Declaration of Intent - Strategic Reserves Fund
    // Hash: seth keccak -- "$(wget https://raw.githubusercontent.com/makerdao/mips/7d402e6bdf8ce914063acb0a2bf1b7f3ddf1b844/MIP13/MIP13c3-Subproposals/MIP13c3-SP3.md -q -O - 2>/dev/null)"
    string constant public mip13c3sp3117 = "0x9ebab3236920efbb2f82f4e37eca51dc8b50895d8b1fa592daaa6441eec682e9";	//inject NONSTANDARD NAMING

    // MIP13c3-SP4: Declaration of Intent & Commercial Points - Off-Chain Asset Backed Lender to onboard Real World Assets as Collateral for a DAI loan
    // Hash: seth keccak -- "$(wget https://raw.githubusercontent.com/makerdao/mips/b7d3edcbf11d60c8babecf46eaccdc0abf815867/MIP13/MIP13c3-Subproposals/MIP13c3-SP4.md -q -O - 2>/dev/null)"
    string constant public mip13c3sp4797 = "0x39ff7fa18f4f9845d214a37823f2f6dfd24bf93540785483b0332d1286307bc6";	//inject NONSTANDARD NAMING

    // MIP13c3-SP5: Declaration of Intent: Maker to commence onboarding work of Centrifuge based Collateral
    // Hash: seth keccak -- "$(wget https://raw.githubusercontent.com/makerdao/mips/c07e3641f0a45dac2835ac24ec28a9d17a639a23/MIP13/MIP13c3-Subproposals/MIP13c3-SP5.md -q -O - 2>/dev/null)"
    string constant public mip13c3sp5685 = "0xda7fc22f756a2b0535c44d187fd0316d986adcacd397ee2060007d20b515956c";	//inject NONSTANDARD NAMING

    constructor() public {
        sig = abi.encodeWithSignature("execute()");
        action = address(new SpellAction());
        bytes32 _tag;
        address _action = action;
        assembly { _tag := extcodehash(_action) }
        tag = _tag;
        expiration = now + 4 days + 2 hours;
    }

    modifier OFFICEHOURS358 {	//inject NONSTANDARD NAMING
        uint day = (now / 1 days + 3) % 7;
        require(day < 5, "Can only be cast on a weekday");
        uint hour = now / 1 hours % 24;
        require(hour >= 14 && hour < 21, "Outside office hours");
        _;
    }

    function SCHEDULE201() public {	//inject NONSTANDARD NAMING
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).DELAY105();
        pause.PLOT827(action, tag, sig, eta);
    }

    function CAST938() public                   {	//inject NONSTANDARD NAMING
        require(!done, "spell-already-cast");
        done = true;
        pause.EXEC974(action, tag, sig, eta);
    }
}