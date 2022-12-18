/**
 *Submitted for verification at Etherscan.io on 2020-03-06
*/

pragma solidity 0.5.12;

// https://github.com/dapphub/ds-pause
contract DSPauseAbstract {
    function delay() public view returns (uint256);
    function plot(address, bytes32, bytes memory, uint256) public;
    function exec(address, bytes32, bytes memory, uint256) public returns (bytes memory);
}

// https://github.com/makerdao/dss/blob/master/src/pot.sol
contract PotAbstract {
    function file(bytes32, uint256) external;
    function file(bytes32, address) external;
    function drip() external returns (uint256);
}

// https://github.com/makerdao/dss/blob/master/src/jug.sol
contract JugAbstract {
    function ilks(bytes32) public view returns (uint256, uint256);
    function drip(bytes32) external returns (uint256);
}


contract SpellAction {
    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
    string  constant public description = "2020-03-06 Weekly Executive: DSR spread adjustment";

    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.0.3/contracts.json
    //
    // Contract addresses pertaining to the SCD ecosystem can be found at:
    //     https://github.com/makerdao/sai#dai-v1-current-deployments
    address constant public MCD_PAUSE = 0xbE286431454714F511008713973d3B053A2d38f3;
    address constant internal MCD_JUG = 0x19c0976f590D67707E62397C87829d896Dc0f1F1;
    address constant internal MCD_POT = 0x197E90f9FAD81970bA7976f33CbD77088E5D7cf7;

    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'
    //
    uint256 constant internal SEVEN_PCT_RATE = 1000000002145441671308778766;
    uint256 constant internal EIGHT_PCT_RATE = 1000000002440418608258400030;

    function execute() external {

        // Drip Pot and Jugs prior to all modifications.
        PotAbstract(MCD_POT).drip();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        JugAbstract(MCD_JUG).drip("ETH-A");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        JugAbstract(MCD_JUG).drip("BAT-A");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC


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
        uint256 DSR_RATE = SEVEN_PCT_RATE;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        PotAbstract(MCD_POT).file("dsr", DSR_RATE);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC


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
        (uint256 dutyETH,) = JugAbstract(MCD_JUG).ilks("ETH-A");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(dutyETH == EIGHT_PCT_RATE, "Unexpected ETH-A Stability Fee");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    }
}

contract DssSpell {

    DSPauseAbstract  internal pause =
        DSPauseAbstract(0xbE286431454714F511008713973d3B053A2d38f3);
    address          internal action;
    bytes32          internal tag;
    uint256          internal eta;
    bytes            internal sig;
    uint256          internal expiration;
    bool             internal done;

    constructor() public {
        sig = abi.encodeWithSignature("execute()");
        action = address(new SpellAction());
        bytes32 _tag;
        address _action = action;
        assembly { _tag := extcodehash(_action) }
        tag = _tag;
        expiration = now + 30 days;
    }

    function description() public view returns (string memory) {
        return SpellAction(action).description();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function schedule() public {
        require(now <= expiration, "This contract has expired");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(eta == 0, "This spell has already been scheduled");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        eta = now + DSPauseAbstract(pause).delay();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        pause.plot(action, tag, sig, eta);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

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

    function cast() public {
        require(!done, "spell-already-cast");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        done = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        pause.exec(action, tag, sig, eta);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}