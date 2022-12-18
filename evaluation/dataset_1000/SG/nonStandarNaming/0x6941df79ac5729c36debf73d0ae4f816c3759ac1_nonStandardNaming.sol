                                                                 

pragma solidity 0.5.12;

// https://github.com/dapphub/ds-pause
contract DSPauseAbstract {
    function DELAY979() public view returns (uint256);	//inject NONSTANDARD NAMING
    function PLOT799(address, bytes32, bytes memory, uint256) public;	//inject NONSTANDARD NAMING
    function EXEC939(address, bytes32, bytes memory, uint256) public returns (bytes memory);	//inject NONSTANDARD NAMING
}

// https://github.com/makerdao/dss/blob/master/src/pot.sol
contract PotAbstract {
    function FILE826(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function FILE826(bytes32, address) external;	//inject NONSTANDARD NAMING
    function DRIP585() external returns (uint256);	//inject NONSTANDARD NAMING
}

// https://github.com/makerdao/dss/blob/master/src/jug.sol
contract JugAbstract {
    function ILKS128(bytes32) public view returns (uint256, uint256);	//inject NONSTANDARD NAMING
    function DRIP585(bytes32) external returns (uint256);	//inject NONSTANDARD NAMING
}


contract SpellAction {
    // Provides a descriptive tag for bot consumption
    // This should be modified weekly to provide a summary of the actions
    string  constant public description565 = "2020-03-06 Weekly Executive: DSR spread adjustment";	//inject NONSTANDARD NAMING

    // The contracts in this list should correspond to MCD core contracts, verify
    //  against the current release list at:
    //     https://changelog.makerdao.com/releases/mainnet/1.0.3/contracts.json
    //
    // Contract addresses pertaining to the SCD ecosystem can be found at:
    //     https://github.com/makerdao/sai#dai-v1-current-deployments
    address constant public mcd_pause498 = 0xbE286431454714F511008713973d3B053A2d38f3;	//inject NONSTANDARD NAMING
    address constant public mcd_jug131 = 0x19c0976f590D67707E62397C87829d896Dc0f1F1;	//inject NONSTANDARD NAMING
    address constant public mcd_pot420 = 0x197E90f9FAD81970bA7976f33CbD77088E5D7cf7;	//inject NONSTANDARD NAMING

    // Many of the settings that change weekly rely on the rate accumulator
    // described at https://docs.makerdao.com/smart-contract-modules/rates-module
    // To check this yourself, use the following rate calculation (example 8%):
    //
    // $ bc -l <<< 'scale=27; e( l(1.08)/(60 * 60 * 24 * 365) )'
    //
    uint256 constant public seven_pct_rate163 = 1000000002145441671308778766;	//inject NONSTANDARD NAMING
    uint256 constant public eight_pct_rate638 = 1000000002440418608258400030;	//inject NONSTANDARD NAMING

    function EXECUTE653() external {	//inject NONSTANDARD NAMING

        // Drip Pot and Jugs prior to all modifications.
        PotAbstract(mcd_pot420).DRIP585();
        JugAbstract(mcd_jug131).DRIP585("ETH-A");
        JugAbstract(mcd_jug131).DRIP585("BAT-A");


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
        uint256 DSR_RATE = seven_pct_rate163;
        PotAbstract(mcd_pot420).FILE826("dsr", DSR_RATE);


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
        (uint256 dutyETH,) = JugAbstract(mcd_jug131).ILKS128("ETH-A");
        require(dutyETH == eight_pct_rate638, "Unexpected ETH-A Stability Fee");

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

    function DESCRIPTION324() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return SpellAction(action).description565();
    }

    function SCHEDULE809() public {	//inject NONSTANDARD NAMING
        require(now <= expiration, "This contract has expired");
        require(eta == 0, "This spell has already been scheduled");
        eta = now + DSPauseAbstract(pause).DELAY979();
        pause.PLOT799(action, tag, sig, eta);

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

    function CAST974() public {	//inject NONSTANDARD NAMING
        require(!done, "spell-already-cast");
        done = true;
        pause.EXEC939(action, tag, sig, eta);
    }
}