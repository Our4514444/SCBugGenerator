/**
 *Submitted for verification at Etherscan.io on 2020-03-06
*/

pragma solidity 0.5.12;

// https://github.com/dapphub/ds-pause
contract DSPauseAbstract {
    function delay() public view returns (uint256);
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function plot(address, bytes32, bytes memory, uint256) public;
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    function exec(address, bytes32, bytes memory, uint256) public returns (bytes memory);
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
}

// https://github.com/makerdao/dss/blob/master/src/pot.sol
contract PotAbstract {
    function file(bytes32, uint256) external;
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    function file(bytes32, address) external;
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    function drip() external returns (uint256);
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
}

// https://github.com/makerdao/dss/blob/master/src/jug.sol
contract JugAbstract {
    function ilks(bytes32) public view returns (uint256, uint256);
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    function drip(bytes32) external returns (uint256);
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
}


contract SpellAction {
    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  string  constant public description = "2020-03-06 Weekly Executive: DSR spread adjustment";

    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.0.3/contracts.json
    //
    // Contract addresses pertaining to the SCD ecosystem can be found at:
    //     https://github.com/makerdao/sai#dai-v1-current-deployments
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  address constant public MCD_PAUSE = 0xbE286431454714F511008713973d3B053A2d38f3;
  function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  address constant public MCD_JUG = 0x19c0976f590D67707E62397C87829d896Dc0f1F1;
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  address constant public MCD_POT = 0x197E90f9FAD81970bA7976f33CbD77088E5D7cf7;

    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'
    //
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  uint256 constant public SEVEN_PCT_RATE = 1000000002145441671308778766;
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  uint256 constant public EIGHT_PCT_RATE = 1000000002440418608258400030;

    function execute() external {

        // Drip Pot and Jugs prior to all modifications.
        PotAbstract(MCD_POT).drip();
        JugAbstract(MCD_JUG).drip("ETH-A");
        JugAbstract(MCD_JUG).drip("BAT-A");


        // MCD Modifications


        // Set the Dai Savings Rate
        // DSR_RATE is a value determined by the rate accumulator calculation (see above)
        //  ex. an 8% annual rate will be 1000000002440418608258400030
        //
        // Poll: Dai Savings Rate Spread Adjustment - March 2, 2020
        // https://vote.makerdao.com/polling-proposal/qmccrai2s7twl6y6yyhrznysnkbengrqg4ibhpw8cnhunp
        //
        // Existing Rate: 8%
        // New Rate: 7%
        uint256 DSR_RATE = SEVEN_PCT_RATE;
        PotAbstract(MCD_POT).file("dsr", DSR_RATE);


        // Set the ETH-A stability fee
        //
        // Poll: Dai Stability Fee Adjustment - March 2, 2020
        // https://vote.makerdao.com/polling-proposal/qmacgdz8euruq4lsqyzgjhumhexu5jnhihbmgbh54law7s
        //
        // Existing Rate: 8%
        // New Rate: 8%
        // Since the rate is not changing this week, we want to ensure that no other
        //  spell has changed the state preemptively. We want to avoid a situation where
        //  the stability fee is lower than the DSR.
        (uint256 dutyETH,) = JugAbstract(MCD_JUG).ilks("ETH-A");
        require(dutyETH == EIGHT_PCT_RATE, "Unexpected ETH-A Stability Fee");

    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
}

contract DssSpell {

    DSPauseAbstract  public pause =
        DSPauseAbstract(0xbE286431454714F511008713973d3B053A2d38f3);
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  address          public action;
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  bytes32          public tag;
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  uint256          public eta;
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  bytes            public sig;
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  uint256          public expiration;
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
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

        // NOTE: 'eta' check should mimic the old behavior of 'done', thus
        // preventing these SCD changes from being executed again.


        // Set the Sai stability fee
        //
        // Poll: Sai Stability Fee Adjustment - March 2, 2020
        // https://vote.makerdao.com/polling-proposal/qme4mhhlcuvcg7pwyfh1pdgqwp45abrdtvrdwvcbfggunj
        //
        // Existing Rate: 9.5%
        // New Rate: 9.5%
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