pragma solidity ^0.5.3;

// counter.market smart contracts:
//  1) Proxy - delegatecalls into current exchange code, maintains storage of exchange state
//  2) Registry - stores information on the latest exchange contract version and user approvals
//  3) Treasury (this one) - takes custody of funds, moves them between token accounts, authorizing exchange code via Registry

// Counter contracts are deployed at predefined addresses which can be hardcoded.
contract FixedAddress {
    address constant proxyaddress622 = 0x1234567896326230a28ee368825D11fE6571Be4a;	//inject NONSTANDARD NAMING
    address constant treasuryaddress288 = 0x12345678979f29eBc99E00bdc5693ddEa564cA80;	//inject NONSTANDARD NAMING
    address constant registryaddress788 = 0x12345678982cB986Dd291B50239295E3Cb10Cdf6;	//inject NONSTANDARD NAMING

    function GETREGISTRY480() internal pure returns (RegistryInterface) {	//inject NONSTANDARD NAMING
        return RegistryInterface(registryaddress788);
    }
}

// External contracts access Registry via one of these methods
interface RegistryInterface {
    function GETOWNER822() external view returns (address);	//inject NONSTANDARD NAMING
    function GETEXCHANGECONTRACT330() external view returns (address);	//inject NONSTANDARD NAMING
    function CONTRACTAPPROVED617(address traderAddr) external view returns (bool);	//inject NONSTANDARD NAMING
    function CONTRACTAPPROVEDBOTH43(address traderAddr1, address traderAddr2) external view returns (bool);	//inject NONSTANDARD NAMING
    function ACCEPTNEXTEXCHANGECONTRACT289() external;	//inject NONSTANDARD NAMING
}

// Access modifiers on restricted Treasury methods
contract AccessModifiers is FixedAddress {

    // Only the owner of the Registry contract may invoke this method.
    modifier ONLYREGISTRYOWNER476() {	//inject NONSTANDARD NAMING
        require (msg.sender == GETREGISTRY480().GETOWNER822(), "onlyRegistryOwner() method called by non-owner.");
        _;
    }

    // Method should be called by the current exchange (by delegatecall from Proxy), and trader should have approved
    // the latest Exchange code.
    modifier ONLYAPPROVEDEXCHANGE777(address trader) {	//inject NONSTANDARD NAMING
        require (msg.sender == proxyaddress622, "onlyApprovedExchange() called not by exchange proxy.");
        require (GETREGISTRY480().CONTRACTAPPROVED617(trader), "onlyApprovedExchange() requires approval of the latest contract code by trader.");
        _;
    }

    // The same as above, but checks approvals of two traders simultaneously.
    modifier ONLYAPPROVEDEXCHANGEBOTH899(address trader1, address trader2) {	//inject NONSTANDARD NAMING
        require (msg.sender == proxyaddress622, "onlyApprovedExchange() called not by exchange proxy.");
        require (GETREGISTRY480().CONTRACTAPPROVEDBOTH43(trader1, trader2), "onlyApprovedExchangeBoth() requires approval of the latest contract code by both traders.");
        _;
    }

}

// External contracts access Treasury via one of these methods
interface TreasuryInterface {
    function WITHDRAWETHER284(address traderAddr, address payable withdrawalAddr, uint amount) external;	//inject NONSTANDARD NAMING
    function WITHDRAWERC20TOKEN291(uint16 tokenCode, address traderAddr, address withdrawalAddr, uint amount) external;	//inject NONSTANDARD NAMING
    function TRANSFERTOKENS131(uint16 tokenCode, address fromAddr, address toAddr, uint amount) external;	//inject NONSTANDARD NAMING
    function TRANSFERTOKENSTWICE449(uint16 tokenCode, address fromAddr, address toAddr1, uint amount1, address toAddr2, uint amount2) external;	//inject NONSTANDARD NAMING
    function EXCHANGETOKENS222(uint16 tokenCode1, uint16 tokenCode2, address addr1, address addr2, address addrFee, uint amount1, uint fee1, uint amount2, uint fee2) external;	//inject NONSTANDARD NAMING
}

// Treasury responsibilities:
//  - storing the mapping of token codes to token contract addresses
//  - processing deposits to/withdrawals from/transfers between token accounts within itself
//  - processing emergency releases

// Treasury is required because Counter is not a wallet-to-wallet exchange, and requires deposits and
// withdrawals in order to be able to trade. Having full control over settlement order enables Counter
// to be responsive on its UI by settling trades and withdrawals in background. The former
// operations are authorized by ECDSA signatures collected from users and effected on-chain by the
// Counter arbiter services.

// Because user signatures are effected on the contract via an intermediary (the Counter arbiter),
// there is inherent trust issue where a trader may assume that the Counter may refuse to apply some
// operations on-chain (especially withdrawals), or may simply experience prolonged downtime. Hence
// the need for the emergency release (ER) feature, which is an ability to withdraw funds from Counter
// directly. It works as follows:
//  1) any trader may initiate a cooldown of two days for all token accounts of the same address
//  2) this cooldown is reset by invoking withdrawal or exchange on this address - these are the
//     operations which require explicit consent in the form of digital signature and thus mean
//     that a) exchange is operational b) the user trusts it
//  3) in case the cooldown have not been reset by any means within two day period, the user may withdraw
//     the entirety of their funds from Treasury.
//
// A note should be made regarding 2) - Counter does _not_ have an ability to reset the ER cooldown
// arbitrarily long, as trade signatures contain an explicit expiration date, and withdrawals have a
// nonce which makes them eligible to be applied once.

contract Treasury is AccessModifiers, TreasuryInterface {
    // *** Constants.

    uint constant emergency_release_challenge_period622 = 2 days;	//inject NONSTANDARD NAMING

    // *** Variables.

    // Treasury can be "paused" by the registry owner to effectively freeze fund movement
    // (sans emergency releases).
    bool active = false;

    // Mapping from token codes (uint16) into corresponding ERC-20 contract addresses.
    // Each token code can only be assigned once for security reasons. Token code 0 is
    // always Ether.
    mapping (uint16 => address) public tokenContracts;

    // Balance of a specific token account, in lowest denomination (wei for Ether).
    // uint176 key is composite of u16 token code (bits 160..175) and address (bits 0..159).
    mapping (uint176 => uint) public tokenAmounts;

    // *** Events

    event SETACTIVE128(bool active);	//inject NONSTANDARD NAMING
    event CHANGETOKENINFO455(uint16 tokenCode, address tokenContract);	//inject NONSTANDARD NAMING
    event STARTEMERGENCYRELEASE918(address account);	//inject NONSTANDARD NAMING
    event DEPOSIT699(uint16 tokenCode, address account, uint amount);	//inject NONSTANDARD NAMING
    event WITHDRAWAL205(uint16 tokenCode, address traderAddr, address withdrawalAddr, uint amount);	//inject NONSTANDARD NAMING
    event EMERGENCYRELEASE658(uint16 tokenCode, address account, uint amount);	//inject NONSTANDARD NAMING

    // Emergency release status for an address (_not_ for the token account):
    //     == 0 - escape release challenge inactive
    //     != 0 - timestamp after which ER can be executed
    mapping (address => uint) public emergencyReleaseSince;

    // *** Constructor

    constructor () public {
    }

    // *** Modifiers

    modifier ONLYACTIVE896() {	//inject NONSTANDARD NAMING
        require (active, "Inactive treasury only allows withdrawals.");
        _;
    }

    modifier EMERGENCYRELEASEPOSSIBLE33(address trader) {	//inject NONSTANDARD NAMING
        uint deadline = emergencyReleaseSince[trader];
        require (deadline > 0 && block.timestamp > deadline, "Challenge should be active and deadline expired.");
        _;
    }

    // *** Admin methods (mostly self-explanatory)

    function SETACTIVE21(bool _active) external ONLYREGISTRYOWNER476() {	//inject NONSTANDARD NAMING
        active = _active;

        emit SETACTIVE128(active);
    }

    function CHANGETOKENINFO169(uint16 tokenCode, address tokenContract) external ONLYREGISTRYOWNER476() {	//inject NONSTANDARD NAMING
        require (tokenCode != 0,
                 "Token code of zero is reserved for Ether.");

        require (tokenContracts[tokenCode] == address(0),
                 "Token contract address can be assigned only once.");

        tokenContracts[tokenCode] = tokenContract;

        emit CHANGETOKENINFO455(tokenCode, tokenContract);
    }

    // *** Emergency release initiation and reset

    // This method is invoked by the user to start the ER cooldown
    function STARTEMERGENCYRELEASE185() external {	//inject NONSTANDARD NAMING
        emergencyReleaseSince[msg.sender] = block.timestamp + emergency_release_challenge_period622;

        emit STARTEMERGENCYRELEASE918(msg.sender);
    }

    // This private method resets the UR cooldown for when executing successful trades/withdrawals
    function RESETEMERGENCYRELEASE739(address traderAddr) private {	//inject NONSTANDARD NAMING
        if (emergencyReleaseSince[traderAddr] != 0) {
            emergencyReleaseSince[traderAddr] = 0;
        }
    }

    // *** Fund movement methods

    // * Deposits (initiated by and paid for by the trader)

    function DEPOSITETHER78(address account) external payable {	//inject NONSTANDARD NAMING
        emit DEPOSIT699(0, account, msg.value);

        ADDBALANCE12(0, account, msg.value);
    }

    function DEPOSITERC20TOKEN66(uint176 tokenAccount, uint amount) external {	//inject NONSTANDARD NAMING
        uint16 tokenCode = uint16(tokenAccount >> 160);
        address tokenContract = tokenContracts[tokenCode];

        require (tokenContract != address(0), "Registered token contract.");

        // Need a preliminary .approve() call
        require (SAFETRANSFERFROM525(tokenContract, msg.sender, address(this), amount),
                 "Could not transfer ERC-20 tokens using transferFrom.");

        address account = address(tokenAccount);
        emit DEPOSIT699(tokenCode, account, amount);

        ADDBALANCE12(tokenCode, account, amount);
    }

    // * Emergency release (initiated by and paid for by the trader)

    function EMERGENCYRELEASEETHER144() external EMERGENCYRELEASEPOSSIBLE33(msg.sender) {	//inject NONSTANDARD NAMING
        uint amount = DEDUCTFULLBALANCE717(0, msg.sender);

        emit EMERGENCYRELEASE658(0, msg.sender, amount);

        msg.sender.transfer(amount);
    }

    function EMERGENCYRELEASEERC20TOKEN526(uint16 tokenCode) external EMERGENCYRELEASEPOSSIBLE33(msg.sender) {	//inject NONSTANDARD NAMING
        uint amount = DEDUCTFULLBALANCE717(tokenCode, msg.sender);

        emit EMERGENCYRELEASE658(tokenCode, msg.sender, amount);

        address tokenContract = tokenContracts[tokenCode];
        require (tokenContract != address(0), "Registered token contract.");

        require (SAFETRANSFER792(tokenContract, msg.sender, amount),
                 "Could not transfer ERC-20 tokens using transfer.");
    }

    // * Regular withdrawal (authorized by the trader, initiated and paid for by Counter)
    //   Requires trader approval of exchange contract.
    //   Resets ER.

    function WITHDRAWETHER284(address traderAddr, address payable withdrawalAddr, uint amount) external	//inject NONSTANDARD NAMING
        ONLYACTIVE896()
        ONLYAPPROVEDEXCHANGE777(traderAddr) {

        DEDUCTBALANCE206(0, traderAddr, amount);
        RESETEMERGENCYRELEASE739(traderAddr);

        emit WITHDRAWAL205(0, traderAddr, withdrawalAddr, amount);

        withdrawalAddr.transfer(amount);
    }

    function WITHDRAWERC20TOKEN291(uint16 tokenCode, address traderAddr, address withdrawalAddr, uint amount) external	//inject NONSTANDARD NAMING
        ONLYACTIVE896()
        ONLYAPPROVEDEXCHANGE777(traderAddr) {

        DEDUCTBALANCE206(tokenCode, traderAddr, amount);
        RESETEMERGENCYRELEASE739(traderAddr);

        address tokenContract = tokenContracts[tokenCode];
        require (tokenContract != address(0), "Registered token contract.");

        require (SAFETRANSFER792(tokenContract, withdrawalAddr, amount),
                 "Could not transfer ERC-20 tokens using transfer.");

        emit WITHDRAWAL205(tokenCode, traderAddr, withdrawalAddr, amount);
    }

    // * Funds transfer between token accounts within Treasury
    //   Initiated and paid for by Counter as part of trade or withdrawal fee collection.
    //   Requires trader approval of exchange contract.
    //   There are three specializations to save gas on inter-contract method calls.
    //   Resets ER.

    // Case 1 - transfer tokens from one account to another
    // Example usecase: withdrawal fee collection
    function TRANSFERTOKENS131(uint16 tokenCode, address fromAddr, address toAddr, uint amount) external	//inject NONSTANDARD NAMING
        ONLYACTIVE896() ONLYAPPROVEDEXCHANGE777(fromAddr) {

        RESETEMERGENCYRELEASE739(fromAddr);

        DEDUCTBALANCE206(tokenCode, fromAddr, amount);
        ADDBALANCE12(tokenCode, toAddr, amount);
    }

    // Case 2 - transfer tokens from one account to two accounts, splitting arbitrarily.
    function TRANSFERTOKENSTWICE449(uint16 tokenCode, address fromAddr, address toAddr1, uint amount1, address toAddr2, uint amount2) external	//inject NONSTANDARD NAMING
        ONLYACTIVE896() ONLYAPPROVEDEXCHANGE777(fromAddr) {

        RESETEMERGENCYRELEASE739(fromAddr);

        DEDUCTBALANCE206(tokenCode, fromAddr, amount1 + amount2);

        ADDBALANCE12(tokenCode, toAddr1, amount1);
        ADDBALANCE12(tokenCode, toAddr2, amount2);
    }

    // Case 3 - transfer tokens of one type from A to B, tokens of another type from B to A,
    //          and deduct a fee from both transfers to a third account C.
    // Example usecase: any trade on Counter
    function EXCHANGETOKENS222(	//inject NONSTANDARD NAMING
        uint16 tokenCode1, uint16 tokenCode2,
        address addr1, address addr2, address addrFee,
        uint amount1, uint fee1,
        uint amount2, uint fee2) external ONLYACTIVE896() ONLYAPPROVEDEXCHANGEBOTH899(addr1, addr2) {

        RESETEMERGENCYRELEASE739(addr1);
        RESETEMERGENCYRELEASE739(addr2);

        DEDUCTBALANCE206(tokenCode1, addr1, amount1 + fee1);
        DEDUCTBALANCE206(tokenCode2, addr2, amount2 + fee2);

        ADDBALANCE12(tokenCode1, addr2, amount1);
        ADDBALANCE12(tokenCode2, addr1, amount2);
        ADDBALANCE12(tokenCode1, addrFee, fee1);
        ADDBALANCE12(tokenCode2, addrFee, fee2);
    }

    // * Token account balance management routines.
    //   Construct uint176 ids, check for over- and underflows.

    function DEDUCTBALANCE206(uint tokenCode, address addr, uint amount) private {	//inject NONSTANDARD NAMING
        uint176 tokenAccount = uint176(tokenCode) << 160 | uint176(addr);
        uint before = tokenAmounts[tokenAccount];
        require (before >= amount, "Enough funds.");
        tokenAmounts[tokenAccount] = before - amount;
    }

    function DEDUCTFULLBALANCE717(uint tokenCode, address addr) private returns (uint amount) {	//inject NONSTANDARD NAMING
        uint176 tokenAccount = uint176(tokenCode) << 160 | uint176(addr);
        amount = tokenAmounts[tokenAccount];
        tokenAmounts[tokenAccount] = 0;
    }

    function ADDBALANCE12(uint tokenCode, address addr, uint amount) private {	//inject NONSTANDARD NAMING
        uint176 tokenAccount = uint176(tokenCode) << 160 | uint176(addr);
        uint before = tokenAmounts[tokenAccount];
        require (before + amount >= before, "No overflow.");
        tokenAmounts[tokenAccount] = before + amount;
    }

    // * Safe ERC-20 transfer() and transferFrom() invocations
    //   Work correctly with those tokens that do not return (bool success) and thus are not
    //   strictly speaking ERC-20 compatible, but unfortunately are quite widespread.

    function SAFETRANSFER792(address tokenContract, address to, uint value) internal returns (bool success)	//inject NONSTANDARD NAMING
    {
        // bytes4(keccak256("transfer(address,uint256)")) = 0xa9059cbb
        (bool call_success, bytes memory return_data) = tokenContract.call(abi.encodeWithSelector(0xa9059cbb, to, value));

        success = false;

        if (call_success) {
            if (return_data.length == 0) {
                // transfer() doesn't have a return value
                success = true;

            } else if (return_data.length == 32) {
                // check returned bool
                assembly { success := mload(add(return_data, 0x20)) }
            }

        }
    }

    function SAFETRANSFERFROM525(address tokenContract, address from, address to, uint value) internal returns (bool success)	//inject NONSTANDARD NAMING
    {
        // bytes4(keccak256("transferFrom(address,address,uint256)")) = 0x23b872dd
        (bool call_success, bytes memory return_data) = tokenContract.call(abi.encodeWithSelector(0x23b872dd, from, to, value));

        success = false;

        if (call_success) {
            if (return_data.length == 0) {
                success = true;

            } else if (return_data.length == 32) {
                assembly { success := mload(add(return_data, 0x20)) }
            }

        }
    }

}