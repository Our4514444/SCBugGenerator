/**
 *Submitted for verification at Etherscan.io on 2020-05-12
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

// https://github.com/dapphub/ds-pause
contract DSPauseAbstract {
    function delay() public view returns (uint256);
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    function plot(address, bytes32, bytes memory, uint256) public;
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    function exec(address, bytes32, bytes memory, uint256) public returns (bytes memory);
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
}

// https://github.com/makerdao/dss/blob/master/src/pot.sol
contract PotAbstract {
    function file(bytes32, uint256) external;
    function drip() external returns (uint256);
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
}

// https://github.com/makerdao/dss/blob/master/src/jug.sol
contract JugAbstract {
    function file(bytes32, bytes32, uint256) external;
    function drip(bytes32) external returns (uint256);
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
}

// https://github.com/makerdao/dss/blob/master/src/vat.sol
contract VatAbstract {
    function ilks(bytes32) external view returns (uint256, uint256, uint256, uint256, uint256);
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    function file(bytes32, uint256) external;
    function file(bytes32, bytes32, uint256) external;
}

// https://github.com/makerdao/dss/blob/master/src/flip.sol
contract FlipAbstract {
    function file(bytes32, uint256) external;
}

// https://github.com/makerdao/flipper-mom/blob/master/src/FlipperMom.sol
contract FlipperMomAbstract {
    function rely(address) external;
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    function deny(address) external;
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
}

contract SpellAction {
    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  string  constant public description = "DEFCON-2 Emergency Spell";

    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.0.4/contracts.json
    //
    // Contract addresses pertaining to the SCD ecosystem can be found at:
    //     https://github.com/makerdao/sai#dai-v1-current-deployments
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  address constant public MCD_VAT =
        0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address constant public MCD_JUG =
        0x19c0976f590D67707E62397C87829d896Dc0f1F1;
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  address constant public MCD_POT =
        0x197E90f9FAD81970bA7976f33CbD77088E5D7cf7;
    address constant public MCD_FLIP_ETH_A =
        0xd8a04F5412223F513DC55F839574430f5EC15531;
    address constant public MCD_FLIP_BAT_A =
        0xaA745404d55f88C108A28c86abE7b5A1E7817c07;
    address constant public MCD_FLIP_WBTC_A =
        0x3E115d85D4d7253b05fEc9C0bB5b08383C2b0603;
    address constant public MCD_FLIP_USDC_A =
        0xE6ed1d09a19Bd335f051d78D5d22dF3bfF2c28B1;
    address constant public FLIPPER_MOM =
        0x9BdDB99625A711bf9bda237044924E34E8570f75;


    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'
    //
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint256 constant public    ZERO_PCT_RATE = 1000000000000000000000000000;
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  uint256 constant public   FIFTY_PCT_RATE = 1000000012857214317438491659;

    uint256 constant public RAD = 10**45;
    uint256 constant public MILLION = 10**6;

    function execute() external {
        // Drip Pot and Jugs prior to all modifications.
        PotAbstract(MCD_POT).drip();
        JugAbstract(MCD_JUG).drip("ETH-A");
        JugAbstract(MCD_JUG).drip("BAT-A");
        JugAbstract(MCD_JUG).drip("USDC-A");
        JugAbstract(MCD_JUG).drip("WBTC-A");


        // MCD Modifications

        // Set the Dai Savings Rate
        // DSR_RATE is a value determined by the rate accumulator calculation
        // ex. an 8% annual rate will be 1000000002440418608258400030
        //
        uint256 DSR_RATE = ZERO_PCT_RATE;
        PotAbstract(MCD_POT).file("dsr", DSR_RATE);

        // Set the ETH-A stability fee
        // ETH_A_FEE is a value determined by the rate accumulator calculation.
        // ex. an 8% annual rate will be 1000000002440418608258400030
        //
        uint256 ETH_A_FEE = ZERO_PCT_RATE;
        JugAbstract(MCD_JUG).file("ETH-A", "duty", ETH_A_FEE);

        // Set the BAT-A stability fee
        // BAT_A_FEE is a value determined by the rate accumulator calculation.
        // ex. an 8% annual rate will be 1000000002440418608258400030
        //
        uint256 BAT_A_FEE = ZERO_PCT_RATE;
        JugAbstract(MCD_JUG).file("BAT-A", "duty", BAT_A_FEE);

        // Set the WBTC-A stability fee
        // WBTC_A_FEE is a value determined by the rate accumulator calculation.
        // ex. an 8% annual rate will be 1000000002440418608258400030
        //
        uint256 WBTC_A_FEE = ZERO_PCT_RATE;
        JugAbstract(MCD_JUG).file("WBTC-A", "duty", WBTC_A_FEE);

        // Set the USDC stability fee
        // USDC_FEE is a value determined by the rate accumulator calculation.
        // ex. an 8% annual rate will be 1000000002440418608258400030
        //
        uint256 USDC_A_FEE = FIFTY_PCT_RATE;
        JugAbstract(MCD_JUG).file("USDC-A", "duty", USDC_A_FEE);

        // Set the USDC-A debt ceiling
        // USDC_LINE is the number of Dai that can be created with USDC token
        // collateral.
        // ex. a 40 million Dai USDC ceiling will be USDC_LINE = 40000000
        //
        // Existing Line: 20m
        // New Line: 40m
        uint256 USDC_A_LINE = 40 * MILLION;
        VatAbstract(MCD_VAT).file("USDC-A", "line", USDC_A_LINE * RAD);

        // Set the global debt ceiling
        //
        // GLOBAL_LINE is the total number of Dai that can be created by all
        // collateral types as a whole number
        //
        (,,, uint256 saiLine,)   = VatAbstract(MCD_VAT).ilks("SAI");
        (,,, uint256 ethALine,)  = VatAbstract(MCD_VAT).ilks("ETH-A");
        (,,, uint256 batALine,)  = VatAbstract(MCD_VAT).ilks("BAT-A");
        (,,, uint256 wbtcALine,) = VatAbstract(MCD_VAT).ilks("WBTC-A");
        (,,, uint256 usdcALine,) = VatAbstract(MCD_VAT).ilks("USDC-A");
        uint256 GLOBAL_LINE =
            saiLine + ethALine + batALine + wbtcALine + usdcALine;
        VatAbstract(MCD_VAT).file("Line", GLOBAL_LINE);

        // Set the ETH-A Flip tau
        //
        // ETH_A_FLIP_TAU is the bid lifetime
        //
        uint256 ETH_A_FLIP_TAU = 24 hours;
        FlipAbstract(MCD_FLIP_ETH_A).file(bytes32("tau"), ETH_A_FLIP_TAU);

        // Set the BAT-A Flip tau
        //
        // BAT_A_FLIP_TAU is the bid lifetime
        //
        uint256 BAT_A_FLIP_TAU = 24 hours;
        FlipAbstract(MCD_FLIP_BAT_A).file(bytes32("tau"), BAT_A_FLIP_TAU);

        // Set the WBTC-A Flip tau
        //
        // WBTC_A_FLIP_TAU is the bid lifetime
        //
        uint256 WBTC_A_FLIP_TAU = 24 hours;
        FlipAbstract(MCD_FLIP_WBTC_A).file(bytes32("tau"), WBTC_A_FLIP_TAU);

        // Set the USDC-A Flip tau
        //
        // USDC_A_FLIP_TAU is the bid lifetime
        //
        uint256 USDC_A_FLIP_TAU = 24 hours;
        FlipAbstract(MCD_FLIP_USDC_A).file(bytes32("tau"), USDC_A_FLIP_TAU);
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
}

contract DssSpell {

    DSPauseAbstract  public pause =
        DSPauseAbstract(0xbE286431454714F511008713973d3B053A2d38f3);
  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address          public action;
  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  bytes32          public tag;
  function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256          public eta;
  function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  bytes            public sig;
  function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
  uint256          public expiration;
  function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  bool             public done;

    address constant public MCD_FLIP_ETH_A =
        0xd8a04F5412223F513DC55F839574430f5EC15531;
    address constant public MCD_FLIP_BAT_A =
        0xaA745404d55f88C108A28c86abE7b5A1E7817c07;
    address constant public MCD_FLIP_USDC_A =
        0xE6ed1d09a19Bd335f051d78D5d22dF3bfF2c28B1;
    address constant public MCD_FLIP_WBTC_A =
        0x3E115d85D4d7253b05fEc9C0bB5b08383C2b0603;
    address constant public FLIPPER_MOM =
        0x9BdDB99625A711bf9bda237044924E34E8570f75;

    uint256 constant internal MILLION = 10**6;
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  uint256 constant public T2020_07_01_1200UTC = 1593604800;

    constructor() public {
        sig = abi.encodeWithSignature("execute()");
        action = address(new SpellAction());
        bytes32 _tag;
        address _action = action;
        assembly { _tag := extcodehash(_action) }
        tag = _tag;
        expiration = T2020_07_01_1200UTC;
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

    function description() public view returns (string memory) {
        return SpellAction(action).description();
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

    function schedule() public {
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).delay();
        pause.plot(action, tag, sig, eta);

        // NOTE: 'eta' check should mimic the old behavior of 'done', thus
        // preventing these changes from being executed again.
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

    function cast() public {
        require(!done, "spell-already-cast");
        done = true;
        pause.exec(action, tag, sig, eta);
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}