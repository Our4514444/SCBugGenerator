                                                                 

// hevm: flattened sources of src/DssSpell.sol
pragma solidity =0.5.12 >=0.5.12;

                                                      
                               

// https://github.com/dapphub/ds-pause
interface DSPauseAbstract {
    function SETOWNER267(address) external;	//inject NONSTANDARD NAMING
    function SETAUTHORITY427(address) external;	//inject NONSTANDARD NAMING
    function SETDELAY11(uint256) external;	//inject NONSTANDARD NAMING
    function PLANS199(bytes32) external view returns (bool);	//inject NONSTANDARD NAMING
    function PROXY64() external view returns (address);	//inject NONSTANDARD NAMING
    function DELAY20() external view returns (uint256);	//inject NONSTANDARD NAMING
    function PLOT813(address, bytes32, bytes calldata, uint256) external;	//inject NONSTANDARD NAMING
    function DROP502(address, bytes32, bytes calldata, uint256) external;	//inject NONSTANDARD NAMING
    function EXEC93(address, bytes32, bytes calldata, uint256) external returns (bytes memory);	//inject NONSTANDARD NAMING
}

                                                 
                               

// https://github.com/makerdao/dss/blob/master/src/cat.sol
interface CatAbstract {
    function WARDS7(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY13(address) external;	//inject NONSTANDARD NAMING
    function DENY921(address) external;	//inject NONSTANDARD NAMING
    function BOX247() external view returns (uint256);	//inject NONSTANDARD NAMING
    function LITTER396() external view returns (uint256);	//inject NONSTANDARD NAMING
    function ILKS745(bytes32) external view returns (address, uint256, uint256);	//inject NONSTANDARD NAMING
    function LIVE369() external view returns (uint256);	//inject NONSTANDARD NAMING
    function VAT99() external view returns (address);	//inject NONSTANDARD NAMING
    function VOW981() external view returns (address);	//inject NONSTANDARD NAMING
    function FILE946(bytes32, address) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, bytes32, address) external;	//inject NONSTANDARD NAMING
    function BITE324(bytes32, address) external returns (uint256);	//inject NONSTANDARD NAMING
    function CLAW883(uint256) external;	//inject NONSTANDARD NAMING
    function CAGE170() external;	//inject NONSTANDARD NAMING
}
                                                      
                               

// https://github.com/makerdao/dss-chain-log
interface ChainlogAbstract {
    function WARDS7(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY13(address) external;	//inject NONSTANDARD NAMING
    function DENY921(address) external;	//inject NONSTANDARD NAMING
    function KEYS69() external view returns (bytes32[] memory);	//inject NONSTANDARD NAMING
    function VERSION66() external view returns (string memory);	//inject NONSTANDARD NAMING
    function IPFS609() external view returns (string memory);	//inject NONSTANDARD NAMING
    function SETVERSION498(string calldata) external;	//inject NONSTANDARD NAMING
    function SETSHA256SUM324(string calldata) external;	//inject NONSTANDARD NAMING
    function SETIPFS263(string calldata) external;	//inject NONSTANDARD NAMING
    function SETADDRESS104(bytes32,address) external;	//inject NONSTANDARD NAMING
    function REMOVEADDRESS459(bytes32) external;	//inject NONSTANDARD NAMING
    function COUNT554() external view returns (uint256);	//inject NONSTANDARD NAMING
    function GET76(uint256) external view returns (bytes32,address);	//inject NONSTANDARD NAMING
    function LIST244() external view returns (bytes32[] memory);	//inject NONSTANDARD NAMING
    function GETADDRESS536(bytes32) external view returns (address);	//inject NONSTANDARD NAMING
}

                                                  
                               

// https://github.com/makerdao/dss/blob/master/src/flip.sol
interface FlipAbstract {
    function WARDS7(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY13(address usr) external;	//inject NONSTANDARD NAMING
    function DENY921(address usr) external;	//inject NONSTANDARD NAMING
    function BIDS118(uint256) external view returns (uint256, uint256, address, uint48, uint48, address, address, uint256);	//inject NONSTANDARD NAMING
    function VAT99() external view returns (address);	//inject NONSTANDARD NAMING
    function CAT5() external view returns (address);	//inject NONSTANDARD NAMING
    function ILK8() external view returns (bytes32);	//inject NONSTANDARD NAMING
    function BEG825() external view returns (uint256);	//inject NONSTANDARD NAMING
    function TTL47() external view returns (uint48);	//inject NONSTANDARD NAMING
    function TAU777() external view returns (uint48);	//inject NONSTANDARD NAMING
    function KICKS645() external view returns (uint256);	//inject NONSTANDARD NAMING
    function FILE946(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function KICK938(address, address, uint256, uint256, uint256) external returns (uint256);	//inject NONSTANDARD NAMING
    function TICK114(uint256) external;	//inject NONSTANDARD NAMING
    function TEND776(uint256, uint256, uint256) external;	//inject NONSTANDARD NAMING
    function DENT900(uint256, uint256, uint256) external;	//inject NONSTANDARD NAMING
    function DEAL961(uint256) external;	//inject NONSTANDARD NAMING
    function YANK476(uint256) external;	//inject NONSTANDARD NAMING
}

                                                     
                               

// https://github.com/makerdao/dss/blob/master/src/join.sol
interface GemJoinAbstract {
    function WARDS7(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY13(address) external;	//inject NONSTANDARD NAMING
    function DENY921(address) external;	//inject NONSTANDARD NAMING
    function VAT99() external view returns (address);	//inject NONSTANDARD NAMING
    function ILK8() external view returns (bytes32);	//inject NONSTANDARD NAMING
    function GEM95() external view returns (address);	//inject NONSTANDARD NAMING
    function DEC940() external view returns (uint256);	//inject NONSTANDARD NAMING
    function LIVE369() external view returns (uint256);	//inject NONSTANDARD NAMING
    function CAGE170() external;	//inject NONSTANDARD NAMING
    function JOIN104(address, uint256) external;	//inject NONSTANDARD NAMING
    function EXIT448(address, uint256) external;	//inject NONSTANDARD NAMING
}

                                                         
                               

// https://github.com/makerdao/ilk-registry
interface IlkRegistryAbstract {
    function WARDS7(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY13(address) external;	//inject NONSTANDARD NAMING
    function DENY921(address) external;	//inject NONSTANDARD NAMING
    function VAT99() external view returns (address);	//inject NONSTANDARD NAMING
    function CAT5() external view returns (address);	//inject NONSTANDARD NAMING
    function SPOT869() external view returns (address);	//inject NONSTANDARD NAMING
    function ILKDATA538(bytes32) external view returns (	//inject NONSTANDARD NAMING
        uint256, address, address, address, address, uint256, string memory, string memory
    );
    function ILKS745() external view returns (bytes32[] memory);	//inject NONSTANDARD NAMING
    function ILKS745(uint) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function ADD179(address) external;	//inject NONSTANDARD NAMING
    function REMOVE147(bytes32) external;	//inject NONSTANDARD NAMING
    function UPDATE205(bytes32) external;	//inject NONSTANDARD NAMING
    function REMOVEAUTH907(bytes32) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, address) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, bytes32, address) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, bytes32, string calldata) external;	//inject NONSTANDARD NAMING
    function COUNT554() external view returns (uint256);	//inject NONSTANDARD NAMING
    function LIST244() external view returns (bytes32[] memory);	//inject NONSTANDARD NAMING
    function LIST244(uint256, uint256) external view returns (bytes32[] memory);	//inject NONSTANDARD NAMING
    function GET76(uint256) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function INFO790(bytes32) external view returns (	//inject NONSTANDARD NAMING
        string memory, string memory, uint256, address, address, address, address
    );
    function POS356(bytes32) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GEM95(bytes32) external view returns (address);	//inject NONSTANDARD NAMING
    function PIP796(bytes32) external view returns (address);	//inject NONSTANDARD NAMING
    function JOIN104(bytes32) external view returns (address);	//inject NONSTANDARD NAMING
    function FLIP144(bytes32) external view returns (address);	//inject NONSTANDARD NAMING
    function DEC940(bytes32) external view returns (uint256);	//inject NONSTANDARD NAMING
    function SYMBOL253(bytes32) external view returns (string memory);	//inject NONSTANDARD NAMING
    function NAME360(bytes32) external view returns (string memory);	//inject NONSTANDARD NAMING
}

                                                 
                               

// https://github.com/makerdao/dss/blob/master/src/jug.sol
interface JugAbstract {
    function WARDS7(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY13(address) external;	//inject NONSTANDARD NAMING
    function DENY921(address) external;	//inject NONSTANDARD NAMING
    function ILKS745(bytes32) external view returns (uint256, uint256);	//inject NONSTANDARD NAMING
    function VAT99() external view returns (address);	//inject NONSTANDARD NAMING
    function VOW981() external view returns (address);	//inject NONSTANDARD NAMING
    function BASE716() external view returns (address);	//inject NONSTANDARD NAMING
    function INIT376(bytes32) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, address) external;	//inject NONSTANDARD NAMING
    function DRIP756(bytes32) external returns (uint256);	//inject NONSTANDARD NAMING
}

                                                    
                               

// https://github.com/makerdao/median
interface MedianAbstract {
    function WARDS7(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY13(address) external;	//inject NONSTANDARD NAMING
    function DENY921(address) external;	//inject NONSTANDARD NAMING
    function AGE532() external view returns (uint32);	//inject NONSTANDARD NAMING
    function WAT3() external view returns (bytes32);	//inject NONSTANDARD NAMING
    function BAR504() external view returns (uint256);	//inject NONSTANDARD NAMING
    function ORCL304(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function BUD785(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function SLOT117(uint8) external view returns (address);	//inject NONSTANDARD NAMING
    function READ321() external view returns (uint256);	//inject NONSTANDARD NAMING
    function PEEK464() external view returns (uint256, bool);	//inject NONSTANDARD NAMING
    function LIFT40(address[] calldata) external;	//inject NONSTANDARD NAMING
    function DROP502(address[] calldata) external;	//inject NONSTANDARD NAMING
    function SETBAR661(uint256) external;	//inject NONSTANDARD NAMING
    function KISS522(address) external;	//inject NONSTANDARD NAMING
    function DISS625(address) external;	//inject NONSTANDARD NAMING
    function KISS522(address[] calldata) external;	//inject NONSTANDARD NAMING
    function DISS625(address[] calldata) external;	//inject NONSTANDARD NAMING
    function POKE252(uint256[] calldata, uint256[] calldata, uint8[] calldata, bytes32[] calldata, bytes32[] calldata) external;	//inject NONSTANDARD NAMING
}

                                                 
                               

// https://github.com/makerdao/osm
interface OsmAbstract {
    function WARDS7(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY13(address) external;	//inject NONSTANDARD NAMING
    function DENY921(address) external;	//inject NONSTANDARD NAMING
    function STOPPED966() external view returns (uint256);	//inject NONSTANDARD NAMING
    function SRC577() external view returns (address);	//inject NONSTANDARD NAMING
    function HOP945() external view returns (uint16);	//inject NONSTANDARD NAMING
    function ZZZ477() external view returns (uint64);	//inject NONSTANDARD NAMING
    function CUR876() external view returns (uint128, uint128);	//inject NONSTANDARD NAMING
    function NXT164() external view returns (uint128, uint128);	//inject NONSTANDARD NAMING
    function BUD785(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function STOP415() external;	//inject NONSTANDARD NAMING
    function START480() external;	//inject NONSTANDARD NAMING
    function CHANGE358(address) external;	//inject NONSTANDARD NAMING
    function STEP48(uint16) external;	//inject NONSTANDARD NAMING
    function VOID193() external;	//inject NONSTANDARD NAMING
    function PASS88() external view returns (bool);	//inject NONSTANDARD NAMING
    function POKE252() external;	//inject NONSTANDARD NAMING
    function PEEK464() external view returns (bytes32, bool);	//inject NONSTANDARD NAMING
    function PEEP58() external view returns (bytes32, bool);	//inject NONSTANDARD NAMING
    function READ321() external view returns (bytes32);	//inject NONSTANDARD NAMING
    function KISS522(address) external;	//inject NONSTANDARD NAMING
    function DISS625(address) external;	//inject NONSTANDARD NAMING
    function KISS522(address[] calldata) external;	//inject NONSTANDARD NAMING
    function DISS625(address[] calldata) external;	//inject NONSTANDARD NAMING
}

                                                    
                               


// https://github.com/makerdao/osm-mom
interface OsmMomAbstract {
    function OWNER578() external view returns (address);	//inject NONSTANDARD NAMING
    function AUTHORITY871() external view returns (address);	//inject NONSTANDARD NAMING
    function OSMS630(bytes32) external view returns (address);	//inject NONSTANDARD NAMING
    function SETOSM508(bytes32, address) external;	//inject NONSTANDARD NAMING
    function SETOWNER267(address) external;	//inject NONSTANDARD NAMING
    function SETAUTHORITY427(address) external;	//inject NONSTANDARD NAMING
    function STOP415(bytes32) external;	//inject NONSTANDARD NAMING
}

                                                  
                               

// https://github.com/makerdao/dss/blob/master/src/spot.sol
interface SpotAbstract {
    function WARDS7(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY13(address) external;	//inject NONSTANDARD NAMING
    function DENY921(address) external;	//inject NONSTANDARD NAMING
    function ILKS745(bytes32) external view returns (address, uint256);	//inject NONSTANDARD NAMING
    function VAT99() external view returns (address);	//inject NONSTANDARD NAMING
    function PAR480() external view returns (uint256);	//inject NONSTANDARD NAMING
    function LIVE369() external view returns (uint256);	//inject NONSTANDARD NAMING
    function FILE946(bytes32, bytes32, address) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function POKE252(bytes32) external;	//inject NONSTANDARD NAMING
    function CAGE170() external;	//inject NONSTANDARD NAMING
}

                                                 
                               

// https://github.com/makerdao/dss/blob/master/src/vat.sol
interface VatAbstract {
    function WARDS7(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function RELY13(address) external;	//inject NONSTANDARD NAMING
    function DENY921(address) external;	//inject NONSTANDARD NAMING
    function CAN655(address, address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function HOPE619(address) external;	//inject NONSTANDARD NAMING
    function NOPE867(address) external;	//inject NONSTANDARD NAMING
    function ILKS745(bytes32) external view returns (uint256, uint256, uint256, uint256, uint256);	//inject NONSTANDARD NAMING
    function URNS10(bytes32, address) external view returns (uint256, uint256);	//inject NONSTANDARD NAMING
    function GEM95(bytes32, address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DAI554(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function SIN196(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function DEBT731() external view returns (uint256);	//inject NONSTANDARD NAMING
    function VICE771() external view returns (uint256);	//inject NONSTANDARD NAMING
    function LINE503() external view returns (uint256);	//inject NONSTANDARD NAMING
    function LIVE369() external view returns (uint256);	//inject NONSTANDARD NAMING
    function INIT376(bytes32) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE946(bytes32, bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function CAGE170() external;	//inject NONSTANDARD NAMING
    function SLIP153(bytes32, address, int256) external;	//inject NONSTANDARD NAMING
    function FLUX877(bytes32, address, address, uint256) external;	//inject NONSTANDARD NAMING
    function MOVE332(address, address, uint256) external;	//inject NONSTANDARD NAMING
    function FROB618(bytes32, address, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function FORK284(bytes32, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function GRAB856(bytes32, address, address, address, int256, int256) external;	//inject NONSTANDARD NAMING
    function HEAL663(uint256) external;	//inject NONSTANDARD NAMING
    function SUCK511(address, address, uint256) external;	//inject NONSTANDARD NAMING
    function FOLD653(bytes32, address, int256) external;	//inject NONSTANDARD NAMING
}

                       
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

                             

                                                               
                                                          
                                                           
                                                                  
                                                              
                                                          
                                                             
                                                          
                                                             
                                                           
                                                          
                                                               

contract SpellAction {
    // MAINNET ADDRESSES
    //
    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.1.4/contracts.json
    address constant mcd_vat936         = 0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B;	//inject NONSTANDARD NAMING
    address constant mcd_cat301         = 0xa5679C04fc3d9d8b0AaB1F0ab83555b301cA70Ea;	//inject NONSTANDARD NAMING
    address constant mcd_jug470         = 0x19c0976f590D67707E62397C87829d896Dc0f1F1;	//inject NONSTANDARD NAMING
    address constant mcd_spot250        = 0x65C79fcB50Ca1594B025960e539eD7A9a6D434A3;	//inject NONSTANDARD NAMING
    address constant mcd_pot480         = 0x197E90f9FAD81970bA7976f33CbD77088E5D7cf7;	//inject NONSTANDARD NAMING
    address constant mcd_end24         = 0xaB14d3CE3F733CACB76eC2AbE7d2fcb00c99F3d5;	//inject NONSTANDARD NAMING
    address constant flipper_mom768     = 0xc4bE7F74Ee3743bDEd8E0fA218ee5cf06397f472;	//inject NONSTANDARD NAMING
    address constant osm_mom230         = 0x76416A4d5190d071bfed309861527431304aA14f;	//inject NONSTANDARD NAMING
    address constant ilk_registry211    = 0x8b4ce5DCbb01e0e1f0521cd8dCfb31B308E52c24;	//inject NONSTANDARD NAMING
    address constant changelog371       = 0xdA0Ab1e0017DEbCd72Be8599041a2aa3bA7e740F;	//inject NONSTANDARD NAMING

    address constant bal675            = 0xba100000625a3754423978a60c9317c58a424e3D;	//inject NONSTANDARD NAMING
    address constant mcd_join_bal_a833 = 0x4a03Aa7fb3973d8f0221B466EefB53D0aC195f55;	//inject NONSTANDARD NAMING
    address constant mcd_flip_bal_a54 = 0xb2b9bd446eE5e58036D2876fce62b7Ab7334583e;	//inject NONSTANDARD NAMING
    address constant pip_bal191        = 0x3ff860c0F28D69F392543A16A397D0dAe85D16dE;	//inject NONSTANDARD NAMING

    address constant yfi955            = 0x0bc529c00C6401aEF6D220BE8C6Ea1667F6Ad93e;	//inject NONSTANDARD NAMING
    address constant mcd_join_yfi_a263 = 0x3ff33d9162aD47660083D7DC4bC02Fb231c81677;	//inject NONSTANDARD NAMING
    address constant mcd_flip_yfi_a565 = 0xEe4C9C36257afB8098059a4763A374a4ECFE28A7;	//inject NONSTANDARD NAMING
    address constant pip_yfi218        = 0x5F122465bCf86F45922036970Be6DD7F58820214;	//inject NONSTANDARD NAMING

    // Decimals & precision
    uint256 constant thousand556 = 10 ** 3;	//inject NONSTANDARD NAMING
    uint256 constant million365  = 10 ** 6;	//inject NONSTANDARD NAMING
    uint256 constant wad275      = 10 ** 18;	//inject NONSTANDARD NAMING
    uint256 constant ray420      = 10 ** 27;	//inject NONSTANDARD NAMING
    uint256 constant rad293      = 10 ** 45;	//inject NONSTANDARD NAMING

    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'
    //
    // A table of rates can be found at
    //    https://ipfs.io/ipfs/QmefQMseb3AiTapiAKKexdKHig8wroKuZbmLtPLv4u2YwW
    uint256 constant four_percent_rate317 = 1000000001243680656318820312;	//inject NONSTANDARD NAMING
    uint256 constant five_percent_rate954 = 1000000001547125957863212448;	//inject NONSTANDARD NAMING

    function EXECUTE629() external {	//inject NONSTANDARD NAMING
        // Set the global debt ceiling
        // 1476 (current DC) + 4 (BAL-A) + 7 (YFI-A) - 50 (ETH-A decrease) - 10 (ETH-B decrease)
        // + 40 (WBTC-A increase) + 5 (LINK-A increase) - 7.5 (USDT-A decrease) - 0.75 (MANA-A decrease)
        VatAbstract(mcd_vat936).FILE946("Line", (1463 * million365 + 750 * thousand556) * rad293);

        // Set the ETH-A debt ceiling
        //
        // Existing debt ceiling: 540 million
        // New debt ceiling: 490 million
        VatAbstract(mcd_vat936).FILE946("ETH-A", "line", 490 * million365 * rad293);

        // Set the ETH-B debt ceiling
        //
        // Existing debt ceiling: 20 million
        // New debt ceiling: 10 million
        VatAbstract(mcd_vat936).FILE946("ETH-B", "line", 10 * million365 * rad293);

        // Set the WBTC-A debt ceiling
        //
        // Existing debt ceiling: 120 million
        // New debt ceiling: 160 million
        VatAbstract(mcd_vat936).FILE946("WBTC-A", "line", 160 * million365 * rad293);

        // Set the MANA-A debt ceiling
        //
        // Existing debt ceiling: 1 million
        // New debt ceiling: 250 thousand
        VatAbstract(mcd_vat936).FILE946("MANA-A", "line", 250 * thousand556 * rad293);

        // Set the USDT-A debt ceiling
        //
        // Existing debt ceiling: 10 million
        // New debt ceiling: 2.5 million
        VatAbstract(mcd_vat936).FILE946("USDT-A", "line", (2 * million365 + 500 * thousand556) * rad293);

        // Set the LINK-A debt ceiling
        //
        // Existing debt ceiling: 5 million
        // New debt ceiling: 10 million
        VatAbstract(mcd_vat936).FILE946("LINK-A", "line", 10 * million365 * rad293);

        // Set the ETH-B stability fee
        //
        // Previous: 6%
        // New: 4%
        JugAbstract(mcd_jug470).DRIP756("ETH-B");
        JugAbstract(mcd_jug470).FILE946("ETH-B", "duty", four_percent_rate317);

        // Version bump chainlog (due new collateral types)
        ChainlogAbstract(changelog371).SETVERSION498("1.1.4");

        //
        // Add BAL-A
        //
        bytes32 ilk = "BAL-A";

        // Sanity checks
        require(GemJoinAbstract(mcd_join_bal_a833).VAT99() == mcd_vat936, "join-vat-not-match");
        require(GemJoinAbstract(mcd_join_bal_a833).ILK8() == ilk, "join-ilk-not-match");
        require(GemJoinAbstract(mcd_join_bal_a833).GEM95() == bal675, "join-gem-not-match");
        require(GemJoinAbstract(mcd_join_bal_a833).DEC940() == 18, "join-dec-not-match");
        require(FlipAbstract(mcd_flip_bal_a54).VAT99() == mcd_vat936, "flip-vat-not-match");
        require(FlipAbstract(mcd_flip_bal_a54).CAT5() == mcd_cat301, "flip-cat-not-match");
        require(FlipAbstract(mcd_flip_bal_a54).ILK8() == ilk, "flip-ilk-not-match");

        // Add the new flip and join to the Chainlog
        ChainlogAbstract(changelog371).SETADDRESS104("BAL", bal675);
        ChainlogAbstract(changelog371).SETADDRESS104("PIP_BAL", pip_bal191);
        ChainlogAbstract(changelog371).SETADDRESS104("MCD_JOIN_BAL_A", mcd_join_bal_a833);
        ChainlogAbstract(changelog371).SETADDRESS104("MCD_FLIP_BAL_A", mcd_flip_bal_a54);

        // Set the BAL PIP in the Spotter
        SpotAbstract(mcd_spot250).FILE946(ilk, "pip", pip_bal191);

        // Set the BAL-A Flipper in the Cat
        CatAbstract(mcd_cat301).FILE946(ilk, "flip", mcd_flip_bal_a54);

        // Init BAL-A ilk in Vat & Jug
        VatAbstract(mcd_vat936).INIT376(ilk);
        JugAbstract(mcd_jug470).INIT376(ilk);

        // Allow BAL-A Join to modify Vat registry
        VatAbstract(mcd_vat936).RELY13(mcd_join_bal_a833);
        // Allow the BAL-A Flipper to reduce the Cat litterbox on deal()
        CatAbstract(mcd_cat301).RELY13(mcd_flip_bal_a54);
        // Allow Cat to kick auctions in BAL-A Flipper
        FlipAbstract(mcd_flip_bal_a54).RELY13(mcd_cat301);
        // Allow End to yank auctions in BAL-A Flipper
        FlipAbstract(mcd_flip_bal_a54).RELY13(mcd_end24);
        // Allow FlipperMom to access to the BAL-A Flipper
        FlipAbstract(mcd_flip_bal_a54).RELY13(flipper_mom768);
        // Disallow Cat to kick auctions in BAL-A Flipper
        // !!!!!!!! Only for certain collaterals that do not trigger liquidations like USDC-A)
        // FlipperMomAbstract(FLIPPER_MOM).deny(MCD_FLIP_BAL_A);

        // Allow OsmMom to access to the BAL Osm
        // !!!!!!!! Only if PIP_BAL = Osm and hasn't been already relied due a previous deployed ilk
        OsmAbstract(pip_bal191).RELY13(osm_mom230);
        // Whitelist Osm to read the Median data (only necessary if it is the first time the token is being added to an ilk)
        // !!!!!!!! Only if PIP_BAL = Osm, its src is a Median and hasn't been already whitelisted due a previous deployed ilk
        MedianAbstract(OsmAbstract(pip_bal191).SRC577()).KISS522(pip_bal191);
        // Whitelist Spotter to read the Osm data (only necessary if it is the first time the token is being added to an ilk)
        // !!!!!!!! Only if PIP_BAL = Osm or PIP_BAL = Median and hasn't been already whitelisted due a previous deployed ilk
        OsmAbstract(pip_bal191).KISS522(mcd_spot250);
        // Whitelist End to read the Osm data (only necessary if it is the first time the token is being added to an ilk)
        // !!!!!!!! Only if PIP_BAL = Osm or PIP_BAL = Median and hasn't been already whitelisted due a previous deployed ilk
        OsmAbstract(pip_bal191).KISS522(mcd_end24);
        // Set BAL Osm in the OsmMom for new ilk
        // !!!!!!!! Only if PIP_BAL = Osm
        OsmMomAbstract(osm_mom230).SETOSM508(ilk, pip_bal191);

        // Set the global debt ceiling (end of spell)
        // VatAbstract(MCD_VAT).file("Line", 1220 * MILLION * RAD);
        // Set the BAL-A debt ceiling
        VatAbstract(mcd_vat936).FILE946(ilk, "line", 4 * million365 * rad293);
        // Set the BAL-A dust
        VatAbstract(mcd_vat936).FILE946(ilk, "dust", 100 * rad293);
        // Set the Lot size
        CatAbstract(mcd_cat301).FILE946(ilk, "dunk", 50 * thousand556 * rad293);
        // Set the BAL-A liquidation penalty (e.g. 13% => X = 113)
        CatAbstract(mcd_cat301).FILE946(ilk, "chop", 113 * wad275 / 100);
        // Set the BAL-A stability fee (e.g. 1% = 1000000000315522921573372069)
        JugAbstract(mcd_jug470).FILE946(ilk, "duty", five_percent_rate954);
        // Set the BAL-A percentage between bids (e.g. 3% => X = 103)
        FlipAbstract(mcd_flip_bal_a54).FILE946("beg", 103 * wad275 / 100);
        // Set the BAL-A time max time between bids
        FlipAbstract(mcd_flip_bal_a54).FILE946("ttl", 6 hours);
        // Set the BAL-A max auction duration to
        FlipAbstract(mcd_flip_bal_a54).FILE946("tau", 6 hours);
        // Set the BAL-A min collateralization ratio (e.g. 150% => X = 150)
        SpotAbstract(mcd_spot250).FILE946(ilk, "mat", 175 * ray420 / 100);

        // Update BAL-A spot value in Vat
        SpotAbstract(mcd_spot250).POKE252(ilk);

        // Add new ilk to the IlkRegistry
        IlkRegistryAbstract(ilk_registry211).ADD179(mcd_join_bal_a833);


        //
        // Add YFI-A
        //
        ilk = "YFI-A";

        // Sanity checks
        require(GemJoinAbstract(mcd_join_yfi_a263).VAT99() == mcd_vat936, "join-vat-not-match");
        require(GemJoinAbstract(mcd_join_yfi_a263).ILK8() == ilk, "join-ilk-not-match");
        require(GemJoinAbstract(mcd_join_yfi_a263).GEM95() == yfi955, "join-gem-not-match");
        require(GemJoinAbstract(mcd_join_yfi_a263).DEC940() == 18, "join-dec-not-match");
        require(FlipAbstract(mcd_flip_yfi_a565).VAT99() == mcd_vat936, "flip-vat-not-match");
        require(FlipAbstract(mcd_flip_yfi_a565).CAT5() == mcd_cat301, "flip-cat-not-match");
        require(FlipAbstract(mcd_flip_yfi_a565).ILK8() == ilk, "flip-ilk-not-match");

        // Add the new flip and join to the Chainlog
        ChainlogAbstract(changelog371).SETADDRESS104("YFI", yfi955);
        ChainlogAbstract(changelog371).SETADDRESS104("PIP_YFI", pip_yfi218);
        ChainlogAbstract(changelog371).SETADDRESS104("MCD_JOIN_YFI_A", mcd_join_yfi_a263);
        ChainlogAbstract(changelog371).SETADDRESS104("MCD_FLIP_YFI_A", mcd_flip_yfi_a565);

        // Set the YFI PIP in the Spotter
        SpotAbstract(mcd_spot250).FILE946(ilk, "pip", pip_yfi218);

        // Set the YFI-A Flipper in the Cat
        CatAbstract(mcd_cat301).FILE946(ilk, "flip", mcd_flip_yfi_a565);

        // Init YFI-A ilk in Vat & Jug
        VatAbstract(mcd_vat936).INIT376(ilk);
        JugAbstract(mcd_jug470).INIT376(ilk);

        // Allow YFI-A Join to modify Vat registry
        VatAbstract(mcd_vat936).RELY13(mcd_join_yfi_a263);
        // Allow the YFI-A Flipper to reduce the Cat litterbox on deal()
        CatAbstract(mcd_cat301).RELY13(mcd_flip_yfi_a565);
        // Allow Cat to kick auctions in YFI-A Flipper
        FlipAbstract(mcd_flip_yfi_a565).RELY13(mcd_cat301);
        // Allow End to yank auctions in YFI-A Flipper
        FlipAbstract(mcd_flip_yfi_a565).RELY13(mcd_end24);
        // Allow FlipperMom to access to the YFI-A Flipper
        FlipAbstract(mcd_flip_yfi_a565).RELY13(flipper_mom768);
        // Disallow Cat to kick auctions in YFI-A Flipper
        // !!!!!!!! Only for certain collaterals that do not trigger liquidations like USDC-A)
        // FlipperMomAbstract(FLIPPER_MOM).deny(MCD_FLIP_YFI_A);

        // Allow OsmMom to access to the YFI Osm
        // !!!!!!!! Only if PIP_YFI = Osm and hasn't been already relied due a previous deployed ilk
        OsmAbstract(pip_yfi218).RELY13(osm_mom230);
        // Whitelist Osm to read the Median data (only necessary if it is the first time the token is being added to an ilk)
        // !!!!!!!! Only if PIP_YFI = Osm, its src is a Median and hasn't been already whitelisted due a previous deployed ilk
        MedianAbstract(OsmAbstract(pip_yfi218).SRC577()).KISS522(pip_yfi218);
        // Whitelist Spotter to read the Osm data (only necessary if it is the first time the token is being added to an ilk)
        // !!!!!!!! Only if PIP_YFI = Osm or PIP_YFI = Median and hasn't been already whitelisted due a previous deployed ilk
        OsmAbstract(pip_yfi218).KISS522(mcd_spot250);
        // Whitelist End to read the Osm data (only necessary if it is the first time the token is being added to an ilk)
        // !!!!!!!! Only if PIP_YFI = Osm or PIP_YFI = Median and hasn't been already whitelisted due a previous deployed ilk
        OsmAbstract(pip_yfi218).KISS522(mcd_end24);
        // Set YFI Osm in the OsmMom for new ilk
        // !!!!!!!! Only if PIP_YFI = Osm
        OsmMomAbstract(osm_mom230).SETOSM508(ilk, pip_yfi218);

        // Set the global debt ceiling (end of spell)
        // VatAbstract(MCD_VAT).file("Line", 1227 * MILLION * RAD);
        // Set the YFI-A debt ceiling
        VatAbstract(mcd_vat936).FILE946(ilk, "line", 7 * million365 * rad293);
        // Set the YFI-A dust
        VatAbstract(mcd_vat936).FILE946(ilk, "dust", 100 * rad293);
        // Set the Lot size
        CatAbstract(mcd_cat301).FILE946(ilk, "dunk", 50 * thousand556 * rad293);
        // Set the YFI-A liquidation penalty (e.g. 13% => X = 113)
        CatAbstract(mcd_cat301).FILE946(ilk, "chop", 113 * wad275 / 100);
        // Set the YFI-A stability fee (e.g. 1% = 1000000000315522921573372069)
        JugAbstract(mcd_jug470).FILE946(ilk, "duty", four_percent_rate317);
        // Set the YFI-A percentage between bids (e.g. 3% => X = 103)
        FlipAbstract(mcd_flip_yfi_a565).FILE946("beg", 103 * wad275 / 100);
        // Set the YFI-A time max time between bids
        FlipAbstract(mcd_flip_yfi_a565).FILE946("ttl", 6 hours);
        // Set the YFI-A max auction duration to
        FlipAbstract(mcd_flip_yfi_a565).FILE946("tau", 6 hours);
        // Set the YFI-A min collateralization ratio (e.g. 150% => X = 150)
        SpotAbstract(mcd_spot250).FILE946(ilk, "mat", 175 * ray420 / 100);

        // Update YFI-A spot value in Vat
        SpotAbstract(mcd_spot250).POKE252(ilk);

        // Add new ilk to the IlkRegistry
        IlkRegistryAbstract(ilk_registry211).ADD179(mcd_join_yfi_a263);
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
    // Hash: seth keccak -- "$(wget https://raw.githubusercontent.com/makerdao/community/8413dc97baa7b6ccb8eb8fb1a007c15741d8d7e4/governance/votes/Executive%20vote%20-%20November%206%2C%202020.md -q -O - 2>/dev/null)"
    string constant public description709 =	//inject NONSTANDARD NAMING
        "2020-11-06 MakerDAO Executive Spell | Hash: 0x958c24628791d50feb4a0c84fcbe4f88e20c8eefc3c1cb3c7e1af21e5388ebba";

    constructor() public {
        sig = abi.encodeWithSignature("execute()");
        action = address(new SpellAction());
        bytes32 _tag;
        address _action = action;
        assembly { _tag := extcodehash(_action) }
        tag = _tag;
        expiration = now + 30 days;
    }

    modifier OFFICEHOURS7 {	//inject NONSTANDARD NAMING
        uint day = (now / 1 days + 3) % 7;
        require(day < 5, "Can only be cast on a weekday");
        uint hour = now / 1 hours % 24;
        require(hour >= 14 && hour < 21, "Outside office hours");
        _;
    }

    function SCHEDULE641() public {	//inject NONSTANDARD NAMING
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).DELAY20();
        pause.PLOT813(action, tag, sig, eta);
    }

    function CAST915() public OFFICEHOURS7 {	//inject NONSTANDARD NAMING
        require(!done, "spell-already-cast");
        done = true;
        pause.EXEC93(action, tag, sig, eta);
    }
}