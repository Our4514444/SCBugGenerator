                                     

pragma solidity 0.5.17;

library TBTCConstants {
    // This is intended to make it easy to update system params
    // During testing swap this out with another constats contract

    // System Parameters
    uint256 public constant beneficiary_fee_divisor377 = 1000;  // 1/1000 = 10 bps = 0.1% = 0.001	//inject NONSTANDARD NAMING
    uint256 public constant satoshi_multiplier284 = 10 ** 10; // multiplier to convert satoshi to TBTC token units	//inject NONSTANDARD NAMING
    uint256 public constant deposit_term_length881 = 180 * 24 * 60 * 60; // 180 days in seconds	//inject NONSTANDARD NAMING
    uint256 public constant tx_proof_difficulty_factor720 = 6; // confirmations on the Bitcoin chain	//inject NONSTANDARD NAMING

    // Redemption Flow
    uint256 public constant redemption_signature_timeout583 = 2 * 60 * 60;  // seconds	//inject NONSTANDARD NAMING
    uint256 public constant increase_fee_timer481 = 4 * 60 * 60;  // seconds	//inject NONSTANDARD NAMING
    uint256 public constant redemption_proof_timeout8 = 6 * 60 * 60;  // seconds	//inject NONSTANDARD NAMING
    uint256 public constant minimum_redemption_fee698 = 2000; // satoshi	//inject NONSTANDARD NAMING

    // Funding Flow
    uint256 public constant funding_proof_timeout538 = 3 * 60 * 60; // seconds	//inject NONSTANDARD NAMING
    uint256 public constant formation_timeout17 = 3 * 60 * 60; // seconds	//inject NONSTANDARD NAMING

    // Liquidation Flow
    uint256 public constant courtesy_call_duration614 = 6 * 60 * 60; // seconds	//inject NONSTANDARD NAMING
    uint256 public constant auction_duration689 = 24 * 60 * 60; // seconds	//inject NONSTANDARD NAMING
    uint256 public constant permitted_fee_bumps101 = 5; // number of times the fee can be increased	//inject NONSTANDARD NAMING

    // Getters for easy access
    function GETBENEFICIARYREWARDDIVISOR723() public pure returns (uint256) { return beneficiary_fee_divisor377; }	//inject NONSTANDARD NAMING
    function GETSATOSHIMULTIPLIER0() public pure returns (uint256) { return satoshi_multiplier284; }	//inject NONSTANDARD NAMING
    function GETDEPOSITTERM992() public pure returns (uint256) { return deposit_term_length881; }	//inject NONSTANDARD NAMING
    function GETTXPROOFDIFFICULTYFACTOR883() public pure returns (uint256) { return tx_proof_difficulty_factor720; }	//inject NONSTANDARD NAMING

    function GETSIGNATURETIMEOUT320() public pure returns (uint256) { return redemption_signature_timeout583; }	//inject NONSTANDARD NAMING
    function GETINCREASEFEETIMER845() public pure returns (uint256) { return increase_fee_timer481; }	//inject NONSTANDARD NAMING
    function GETREDEMPTIONPROOFTIMEOUT331() public pure returns (uint256) { return redemption_proof_timeout8; }	//inject NONSTANDARD NAMING
    function GETMINIMUMREDEMPTIONFEE574() public pure returns (uint256) { return minimum_redemption_fee698; }	//inject NONSTANDARD NAMING

    function GETFUNDINGTIMEOUT711() public pure returns (uint256) { return funding_proof_timeout538; }	//inject NONSTANDARD NAMING
    function GETSIGNINGGROUPFORMATIONTIMEOUT498() public pure returns (uint256) { return formation_timeout17; }	//inject NONSTANDARD NAMING

    function GETCOURTESYCALLTIMEOUT467() public pure returns (uint256) { return courtesy_call_duration614; }	//inject NONSTANDARD NAMING
    function GETAUCTIONDURATION879() public pure returns (uint256) { return auction_duration689; }	//inject NONSTANDARD NAMING
    function GETPERMITTEDFEEBUMPS365() public pure returns (uint256) {return permitted_fee_bumps101; }	//inject NONSTANDARD NAMING
}