/**
 *Submitted for verification at Etherscan.io on 2020-04-30
*/

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
    function setOwner(address) public;
    function setAuthority(address) public;
    function setDelay(uint256) public;
    function plans(bytes32) public view returns (bool);
    function proxy() public view returns (address);
    function delay() public view returns (uint256);
    function plot(address, bytes32, bytes memory, uint256) public;
    function drop(address, bytes32, bytes memory, uint256) public;
    function exec(address, bytes32, bytes memory, uint256) public returns (bytes memory);
}

// https://github.com/makerdao/dss/blob/master/src/vat.sol
contract VatAbstract {
    function wards(address) public view returns (uint256);
    function rely(address) external;
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
    function deny(address) external;
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
    function can(address, address) public view returns (uint256);
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
    function hope(address) external;
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    function nope(address) external;
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
    function ilks(bytes32) external view returns (uint256, uint256, uint256, uint256, uint256);
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    function urns(bytes32, address) public view returns (uint256, uint256);
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
    function gem(bytes32, address) public view returns (uint256);
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
    function dai(address) public view returns (uint256);
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    function sin(address) public view returns (uint256);
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    function debt() public view returns (uint256);
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
    function vice() public view returns (uint256);
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    function Line() public view returns (uint256);
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    function live() public view returns (uint256);
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
    function init(bytes32) external;
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    function file(bytes32, uint256) external;
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    function file(bytes32, bytes32, uint256) external;
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
    function cage() external;
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    function slip(bytes32, address, int256) external;
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    function flux(bytes32, address, address, uint256) external;
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function move(address, address, uint256) external;
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    function frob(bytes32, address, address, address, int256, int256) external;
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    function fork(bytes32, address, address, int256, int256) external;
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    function grab(bytes32, address, address, address, int256, int256) external;
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    function heal(uint256) external;
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    function suck(address, address, uint256) external;
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    function fold(bytes32, address, int256) external;
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
}

contract SpellAction {
    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
    string constant public description = "2020-04-29 MakerDAO Executive Spell";

    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.0.5/contracts.json
    //
    // Contract addresses pertaining to the SCD ecosystem can be found at:
    //     https://github.com/makerdao/sai#dai-v1-current-deployments
    address constant public MCD_VAT = 0x35D1b3F3D7966A1DFe207aa4514C12a259A0492B;

    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'
    //

    uint256 constant public RAD = 10**45;
    uint256 constant public MILLION = 10**6;

    function execute() external {
        // MCD Modifications

        // Set the ETH-A debt ceiling
        // ETH_LINE is the number of Dai that can be created with WETH token collateral
        //  ex. a 100 million Dai ETH ceiling will be ETH_LINE = 100,000,000
        // Existing Line: 100m
        // New Line: 120m
        uint256 ETH_LINE = 120 * MILLION;
        VatAbstract(MCD_VAT).file("ETH-A", "line", ETH_LINE * RAD);

        // set the global debt ceiling to 143,000,000
        uint256 GLOBAL_LINE = 143 * MILLION;
        VatAbstract(MCD_VAT).file("Line", GLOBAL_LINE * RAD);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
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
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function description() public view returns (string memory) {
        return SpellAction(action).description();
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    function schedule() public {
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).delay();
        pause.plot(action, tag, sig, eta);
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

    function cast() public {
        require(!done, "spell-already-cast");
        done = true;
        pause.exec(action, tag, sig, eta);
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}