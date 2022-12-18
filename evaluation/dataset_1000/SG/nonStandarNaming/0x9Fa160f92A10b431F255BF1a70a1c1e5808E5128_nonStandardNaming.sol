pragma solidity 0.5.15;

contract IAugur {
    function CREATECHILDUNIVERSE248(bytes32 _parentPayoutDistributionHash, uint256[] memory _parentPayoutNumerators) public returns (IUniverse);	//inject NONSTANDARD NAMING
    function ISKNOWNUNIVERSE951(IUniverse _universe) public view returns (bool);	//inject NONSTANDARD NAMING
    function TRUSTEDCASHTRANSFER778(address _from, address _to, uint256 _amount) public returns (bool);	//inject NONSTANDARD NAMING
    function ISTRUSTEDSENDER269(address _address) public returns (bool);	//inject NONSTANDARD NAMING
    function ONCATEGORICALMARKETCREATED11(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, bytes32[] memory _outcomes) public returns (bool);	//inject NONSTANDARD NAMING
    function ONYESNOMARKETCREATED666(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash) public returns (bool);	//inject NONSTANDARD NAMING
    function ONSCALARMARKETCREATED803(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, int256[] memory _prices, uint256 _numTicks)  public returns (bool);	//inject NONSTANDARD NAMING
    function LOGINITIALREPORTSUBMITTED24(IUniverse _universe, address _reporter, address _market, address _initialReporter, uint256 _amountStaked, bool _isDesignatedReporter, uint256[] memory _payoutNumerators, string memory _description, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime) public returns (bool);	//inject NONSTANDARD NAMING
    function DISPUTECROWDSOURCERCREATED257(IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] memory _payoutNumerators, uint256 _size, uint256 _disputeRound) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERCONTRIBUTION926(IUniverse _universe, address _reporter, address _market, address _disputeCrowdsourcer, uint256 _amountStaked, string memory description, uint256[] memory _payoutNumerators, uint256 _currentStake, uint256 _stakeRemaining, uint256 _disputeRound) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERCOMPLETED442(IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] memory _payoutNumerators, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime, bool _pacingOn, uint256 _totalRepStakedInPayout, uint256 _totalRepStakedInMarket, uint256 _disputeRound) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGINITIALREPORTERREDEEMED924(IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] memory _payoutNumerators) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERREDEEMED275(IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] memory _payoutNumerators) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETFINALIZED311(IUniverse _universe, uint256[] memory _winningPayoutNumerators) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETMIGRATED287(IMarket _market, IUniverse _originalUniverse) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGREPORTINGPARTICIPANTDISAVOWED587(IUniverse _universe, IMarket _market) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETPARTICIPANTSDISAVOWED26(IUniverse _universe) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGCOMPLETESETSPURCHASED797(IUniverse _universe, IMarket _market, address _account, uint256 _numCompleteSets) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGCOMPLETESETSSOLD676(IUniverse _universe, IMarket _market, address _account, uint256 _numCompleteSets, uint256 _fees) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETOICHANGED275(IUniverse _universe, IMarket _market) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGTRADINGPROCEEDSCLAIMED277(IUniverse _universe, address _sender, address _market, uint256 _outcome, uint256 _numShares, uint256 _numPayoutTokens, uint256 _fees) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGUNIVERSEFORKED875(IMarket _forkingMarket) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGREPUTATIONTOKENSTRANSFERRED524(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGREPUTATIONTOKENSBURNED579(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGREPUTATIONTOKENSMINTED45(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGSHARETOKENSBALANCECHANGED212(address _account, IMarket _market, uint256 _outcome, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERTOKENSTRANSFERRED570(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERTOKENSBURNED326(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERTOKENSMINTED712(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTEWINDOWCREATED77(IDisputeWindow _disputeWindow, uint256 _id, bool _initial) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGPARTICIPATIONTOKENSREDEEMED348(IUniverse universe, address _sender, uint256 _attoParticipationTokens, uint256 _feePayoutShare) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGTIMESTAMPSET430(uint256 _newTimestamp) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGINITIALREPORTERTRANSFERRED814(IUniverse _universe, IMarket _market, address _from, address _to) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETTRANSFERRED608(IUniverse _universe, address _from, address _to) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGPARTICIPATIONTOKENSTRANSFERRED794(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGPARTICIPATIONTOKENSBURNED631(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGPARTICIPATIONTOKENSMINTED333(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETREPBONDTRANSFERRED353(address _universe, address _from, address _to) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGWARPSYNCDATAUPDATED615(address _universe, uint256 _warpSyncHash, uint256 _marketEndTime) public returns (bool);	//inject NONSTANDARD NAMING
    function ISKNOWNFEESENDER450(address _feeSender) public view returns (bool);	//inject NONSTANDARD NAMING
    function LOOKUP140(bytes32 _key) public view returns (address);	//inject NONSTANDARD NAMING
    function GETTIMESTAMP91() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETMAXIMUMMARKETENDDATE533() public returns (uint256);	//inject NONSTANDARD NAMING
    function ISKNOWNMARKET357(IMarket _market) public view returns (bool);	//inject NONSTANDARD NAMING
    function DERIVEPAYOUTDISTRIBUTIONHASH849(uint256[] memory _payoutNumerators, uint256 _numTicks, uint256 numOutcomes) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function LOGVALIDITYBONDCHANGED568(uint256 _validityBond) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDESIGNATEDREPORTSTAKECHANGED379(uint256 _designatedReportStake) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGNOSHOWBONDCHANGED922(uint256 _noShowBond) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGREPORTINGFEECHANGED237(uint256 _reportingFee) public returns (bool);	//inject NONSTANDARD NAMING
    function GETUNIVERSEFORKINDEX805(IUniverse _universe) public view returns (uint256);	//inject NONSTANDARD NAMING
}

interface IAugurWallet {
    function INITIALIZE942(address _owner, address _referralAddress, bytes32 _fingerprint, address _augur, address _registry, address _registryV2, IERC20 _cash, IAffiliates _affiliates, IERC1155 _shareToken, address _createOrder, address _fillOrder, address _zeroXTrade) external;	//inject NONSTANDARD NAMING
    function TRANSFERCASH779(address _to, uint256 _amount) external;	//inject NONSTANDARD NAMING
    function EXECUTETRANSACTION655(address _to, bytes calldata _data, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
}

interface IAugurWalletRegistry {
    function ETHEXCHANGE353() external returns (IUniswapV2Pair);	//inject NONSTANDARD NAMING
    function WETH26() external returns (IWETH);	//inject NONSTANDARD NAMING
    function TOKEN0ISCASH313() external returns (bool);	//inject NONSTANDARD NAMING
}

contract IAugurWalletFactory {
    function GETCREATE2WALLETADDRESS13(address _owner) external view returns (address);	//inject NONSTANDARD NAMING
    function CREATEAUGURWALLET581(address _owner, address _referralAddress, bytes32 _fingerprint) public returns (IAugurWallet);	//inject NONSTANDARD NAMING
}

contract Context {
    function _MSGSENDER940() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA10() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

interface IRelayHub {
    // Relay management

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function STAKE754(address relayaddr, uint256 unstakeDelay) external payable;	//inject NONSTANDARD NAMING

                                                                                      
    event STAKED208(address indexed relay, uint256 stake, uint256 unstakeDelay);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                      
    function REGISTERRELAY649(uint256 transactionFee, string calldata url) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                             
    event RELAYADDED266(address indexed relay, address indexed owner, uint256 transactionFee, uint256 stake, uint256 unstakeDelay, string url);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                             
    function REMOVERELAYBYOWNER87(address relay) external;	//inject NONSTANDARD NAMING

                                                                                                                                    
    event RELAYREMOVED366(address indexed relay, uint256 unstakeTime);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                               
    function UNSTAKE985(address relay) external;	//inject NONSTANDARD NAMING

                                                                                               
    event UNSTAKED906(address indexed relay, uint256 stake);	//inject NONSTANDARD NAMING

    // States a relay can be in
    enum RelayState {
        Unknown, // The relay is unknown to the system: it has never been staked for
        Staked, // The relay has been staked for, but it is not yet active
        Registered, // The relay has registered itself, and is active (can relay calls)
        Removed    // The relay has been removed by its owner and can no longer relay calls. It must wait for its unstakeDelay to elapse before it can unstake
    }

                                                                                                                                                                        
    function GETRELAY457(address relay) external view returns (uint256 totalStake, uint256 unstakeDelay, uint256 unstakeTime, address payable owner, RelayState state);	//inject NONSTANDARD NAMING

    // Balance management

                                                                                                                                                                                                                                                                
    function DEPOSITFOR720(address target) external payable;	//inject NONSTANDARD NAMING

                                                                                                                  
    event DEPOSITED591(address indexed recipient, address indexed from, uint256 amount);	//inject NONSTANDARD NAMING

                                                                                                                               
    function BALANCEOF591(address target) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                      
    function WITHDRAW380(uint256 amount, address payable dest) external;	//inject NONSTANDARD NAMING

                                                                                    
    event WITHDRAWN142(address indexed account, address indexed dest, uint256 amount);	//inject NONSTANDARD NAMING

    // Relaying

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function CANRELAY418(	//inject NONSTANDARD NAMING
        address relay,
        address from,
        address to,
        bytes calldata encodedFunction,
        uint256 transactionFee,
        uint256 gasPrice,
        uint256 gasLimit,
        uint256 nonce,
        bytes calldata signature,
        bytes calldata approvalData
    ) external view returns (uint256 status, bytes memory recipientContext);

    // Preconditions for relaying, checked by canRelay and returned as the corresponding numeric values.
    enum PreconditionCheck {
        OK,                         // All checks passed, the call can be relayed
        WrongSignature,             // The transaction to relay is not signed by requested sender
        WrongNonce,                 // The provided nonce has already been used by the sender
        AcceptRelayedCallReverted,  // The recipient rejected this call via acceptRelayedCall
        InvalidRecipientStatusCode  // The recipient returned an invalid (reserved) status code
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function RELAYCALL258(	//inject NONSTANDARD NAMING
        address from,
        address to,
        bytes calldata encodedFunction,
        uint256 transactionFee,
        uint256 gasPrice,
        uint256 gasLimit,
        uint256 nonce,
        bytes calldata signature,
        bytes calldata approvalData
    ) external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    event CANRELAYFAILED879(address indexed relay, address indexed from, address indexed to, bytes4 selector, uint256 reason);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                    
    event TRANSACTIONRELAYED998(address indexed relay, address indexed from, address indexed to, bytes4 selector, RelayCallStatus status, uint256 charge);	//inject NONSTANDARD NAMING

    // Reason error codes for the TransactionRelayed event
    enum RelayCallStatus {
        OK,                      // The transaction was successfully relayed and execution successful - never included in the event
        RelayedCallFailed,       // The transaction was relayed, but the relayed call failed
        PreRelayedFailed,        // The transaction was not relayed due to preRelatedCall reverting
        PostRelayedFailed,       // The transaction was relayed and reverted due to postRelatedCall reverting
        RecipientBalanceChanged  // The transaction was relayed and reverted due to the recipient's balance changing
    }

                                                                                                                                                                                     
    function REQUIREDGAS137(uint256 relayedCallStipend) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                             
    function MAXPOSSIBLECHARGE433(uint256 relayedCallStipend, uint256 gasPrice, uint256 transactionFee) external view returns (uint256);	//inject NONSTANDARD NAMING

     // Relay penalization.
     // Any account can penalize relays, removing them from the system immediately, and rewarding the
    // reporter with half of the relay's stake. The other half is burned so that, even if the relay penalizes itself, it
    // still loses half of its stake.

                                                                                                                                                                                                                                                                                                             
    function PENALIZEREPEATEDNONCE167(bytes calldata unsignedTx1, bytes calldata signature1, bytes calldata unsignedTx2, bytes calldata signature2) external;	//inject NONSTANDARD NAMING

                                                                                                                                    
    function PENALIZEILLEGALTRANSACTION408(bytes calldata unsignedTx, bytes calldata signature) external;	//inject NONSTANDARD NAMING

                                                              
    event PENALIZED605(address indexed relay, address sender, uint256 amount);	//inject NONSTANDARD NAMING

                                                                     
    function GETNONCE416(address from) external view returns (uint256);	//inject NONSTANDARD NAMING
}

interface IRelayRecipient {
                                                                                                          
    function GETHUBADDR926() external view returns (address);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function ACCEPTRELAYEDCALL378(	//inject NONSTANDARD NAMING
        address relay,
        address from,
        bytes calldata encodedFunction,
        uint256 transactionFee,
        uint256 gasPrice,
        uint256 gasLimit,
        uint256 nonce,
        bytes calldata approvalData,
        uint256 maxPossibleCharge
    )
        external
        view
        returns (uint256, bytes memory);

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function PRERELAYEDCALL649(bytes calldata context) external returns (bytes32);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function POSTRELAYEDCALL792(bytes calldata context, bool success, uint256 actualCharge, bytes32 preRetVal) external;	//inject NONSTANDARD NAMING
}

contract GSNRecipient is IRelayRecipient, Context {
    // Default RelayHub address, deployed on mainnet and all testnets at the same address
    address private _relayHub = 0xD216153c06E857cD7f72665E0aF1d7D82172F494;

    uint256 constant private relayed_call_accepted949 = 0;	//inject NONSTANDARD NAMING
    uint256 constant private relayed_call_rejected998 = 11;	//inject NONSTANDARD NAMING

    // How much gas is forwarded to postRelayedCall
    uint256 constant internal post_relayed_call_max_gas337 = 100000;	//inject NONSTANDARD NAMING

                                                                                                  
    event RELAYHUBCHANGED586(address indexed oldRelayHub, address indexed newRelayHub);	//inject NONSTANDARD NAMING

                                                                                               
    function GETHUBADDR926() public view returns (address) {	//inject NONSTANDARD NAMING
        return _relayHub;
    }

                                                                                                                                                                                                                                                                                                                                                                                                              
    function _UPGRADERELAYHUB708(address newRelayHub) internal {	//inject NONSTANDARD NAMING
        address currentRelayHub = _relayHub;
        require(newRelayHub != address(0), "GSNRecipient: new RelayHub is the zero address");
        require(newRelayHub != currentRelayHub, "GSNRecipient: new RelayHub is the current one");

        emit RELAYHUBCHANGED586(currentRelayHub, newRelayHub);

        _relayHub = newRelayHub;
    }

                                                                                                                                                                                                                                       
    // This function is view for future-proofing, it may require reading from
    // storage in the future.
    function RELAYHUBVERSION310() public view returns (string memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return "1.0.0";
    }

                                                                                                                                                                                     
    function _WITHDRAWDEPOSITS44(uint256 amount, address payable payee) internal {	//inject NONSTANDARD NAMING
        IRelayHub(_relayHub).WITHDRAW380(amount, payee);
    }

    // Overrides for Context's functions: when called from RelayHub, sender and
    // data require some pre-processing: the actual sender is stored at the end
    // of the call data, which in turns means it needs to be removed from it
    // when handling said data.

                                                                                                                                                                                                                                                                                                                                                             
    function _MSGSENDER940() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        if (msg.sender != _relayHub) {
            return msg.sender;
        } else {
            return _GETRELAYEDCALLSENDER845();
        }
    }

                                                                                                                                                                                                                                                                                                                                                                   
    function _MSGDATA10() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        if (msg.sender != _relayHub) {
            return msg.data;
        } else {
            return _GETRELAYEDCALLDATA524();
        }
    }

    // Base implementations for pre and post relayedCall: only RelayHub can invoke them, and data is forwarded to the
    // internal hook.

                                                                                                                                                                                                                                                        
    function PRERELAYEDCALL649(bytes calldata context) external returns (bytes32) {	//inject NONSTANDARD NAMING
        require(msg.sender == GETHUBADDR926(), "GSNRecipient: caller is not RelayHub");
        return _PRERELAYEDCALL308(context);
    }

                                                                                                                                                                                                                                                                                                   
    function _PRERELAYEDCALL308(bytes memory context) internal returns (bytes32);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                          
    function POSTRELAYEDCALL792(bytes calldata context, bool success, uint256 actualCharge, bytes32 preRetVal) external {	//inject NONSTANDARD NAMING
        require(msg.sender == GETHUBADDR926(), "GSNRecipient: caller is not RelayHub");
        _POSTRELAYEDCALL865(context, success, actualCharge, preRetVal);
    }

                                                                                                                                                                                                                                                                                                      
    function _POSTRELAYEDCALL865(bytes memory context, bool success, uint256 actualCharge, bytes32 preRetVal) internal;	//inject NONSTANDARD NAMING

                                                                                                                                                                              
    function _APPROVERELAYEDCALL519() internal pure returns (uint256, bytes memory) {	//inject NONSTANDARD NAMING
        return _APPROVERELAYEDCALL519("");
    }

                                                                                                                                                           
    function _APPROVERELAYEDCALL519(bytes memory context) internal pure returns (uint256, bytes memory) {	//inject NONSTANDARD NAMING
        return (relayed_call_accepted949, context);
    }

                                                                                                                            
    function _REJECTRELAYEDCALL205(uint256 errorCode) internal pure returns (uint256, bytes memory) {	//inject NONSTANDARD NAMING
        return (relayed_call_rejected998 + errorCode, "");
    }

                                                                                                                                                       
    function _COMPUTECHARGE712(uint256 gas, uint256 gasPrice, uint256 serviceFee) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // The fee is expressed as a percentage. E.g. a value of 40 stands for a 40% fee, so the recipient will be
        // charged for 1.4 times the spent amount.
        return (gas * gasPrice * (100 + serviceFee)) / 100;
    }

    function _GETRELAYEDCALLSENDER845() private pure returns (address payable result) {	//inject NONSTANDARD NAMING
        // We need to read 20 bytes (an address) located at array index msg.data.length - 20. In memory, the array
        // is prefixed with a 32-byte length value, so we first add 32 to get the memory read index. However, doing
        // so would leave the address in the upper 20 bytes of the 32-byte word, which is inconvenient and would
        // require bit shifting. We therefore subtract 12 from the read index so the address lands on the lower 20
        // bytes. This can always be done due to the 32-byte prefix.

        // The final memory read index is msg.data.length - 20 + 32 - 12 = msg.data.length. Using inline assembly is the
        // easiest/most-efficient way to perform this operation.

        // These fields are not accessible from assembly
        bytes memory array = msg.data;
        uint256 index = msg.data.length;

        // solhint-disable-next-line no-inline-assembly
        assembly {
            // Load the 32 bytes word from memory with the address on the lower 20 bytes, and mask those.
            result := and(mload(add(array, index)), 0xffffffffffffffffffffffffffffffffffffffff)
        }
        return result;
    }

    function _GETRELAYEDCALLDATA524() private pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        // RelayHub appends the sender address at the end of the calldata, so in order to retrieve the actual msg.data,
        // we must strip the last 20 bytes (length of an address type) from it.

        uint256 actualDataLength = msg.data.length - 20;
        bytes memory actualData = new bytes(actualDataLength);

        for (uint256 i = 0; i < actualDataLength; ++i) {
            actualData[i] = msg.data[i];
        }

        return actualData;
    }
}

library RLPReader {

    uint8 constant string_short_start673 = 0x80;	//inject NONSTANDARD NAMING
    uint8 constant string_long_start401 = 0xb8;	//inject NONSTANDARD NAMING
    uint8 constant list_short_start837 = 0xc0;	//inject NONSTANDARD NAMING
    uint8 constant list_long_start416 = 0xf8;	//inject NONSTANDARD NAMING
    uint8 constant word_size430 = 32;	//inject NONSTANDARD NAMING

    struct RLPItem {
        uint len;
        uint memPtr;
    }

    using RLPReader for bytes;
    using RLPReader for uint;
    using RLPReader for RLPReader.RLPItem;

    // helper function to decode rlp encoded  ethereum transaction
                                                                                                                                      

    function DECODETRANSACTION94(bytes memory rawTransaction) internal pure returns (uint, uint, uint, address, uint, bytes memory){	//inject NONSTANDARD NAMING
        RLPReader.RLPItem[] memory values = rawTransaction.TORLPITEM830().TOLIST649(); // must convert to an rlpItem first!
        return (values[0].TOUINT445(), values[1].TOUINT445(), values[2].TOUINT445(), values[3].TOADDRESS319(), values[4].TOUINT445(), values[5].TOBYTES261());
    }

                                                 
    function TORLPITEM830(bytes memory item) internal pure returns (RLPItem memory) {	//inject NONSTANDARD NAMING
        if (item.length == 0)
            return RLPItem(0, 0);
        uint memPtr;
        assembly {
            memPtr := add(item, 0x20)
        }
        return RLPItem(item.length, memPtr);
    }
                                                         
    function TOLIST649(RLPItem memory item) internal pure returns (RLPItem[] memory result) {	//inject NONSTANDARD NAMING
        require(ISLIST700(item), "isList failed");
        uint items = NUMITEMS587(item);
        result = new RLPItem[](items);
        uint memPtr = item.memPtr + _PAYLOADOFFSET145(item.memPtr);
        uint dataLen;
        for (uint i = 0; i < items; i++) {
            dataLen = _ITEMLENGTH840(memPtr);
            result[i] = RLPItem(dataLen, memPtr);
            memPtr = memPtr + dataLen;
        }
    }
                           
    // @return indicator whether encoded payload is a list. negate this function call for isData.
    function ISLIST700(RLPItem memory item) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        uint8 byte0;
        uint memPtr = item.memPtr;
        assembly {
            byte0 := byte(0, mload(memPtr))
        }
        if (byte0 < list_short_start837)
            return false;
        return true;
    }
    // @return number of payload items inside an encoded list.
    function NUMITEMS587(RLPItem memory item) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint count = 0;
        uint currPtr = item.memPtr + _PAYLOADOFFSET145(item.memPtr);
        uint endPtr = item.memPtr + item.len;
        while (currPtr < endPtr) {
            currPtr = currPtr + _ITEMLENGTH840(currPtr);
            // skip over an item
            count++;
        }
        return count;
    }
    // @return entire rlp item byte length
    function _ITEMLENGTH840(uint memPtr) internal pure returns (uint len) {	//inject NONSTANDARD NAMING
        uint byte0;
        assembly {
            byte0 := byte(0, mload(memPtr))
        }
        if (byte0 < string_short_start673)
            return 1;
        else if (byte0 < string_long_start401)
            return byte0 - string_short_start673 + 1;
        else if (byte0 < list_short_start837) {
            assembly {
                let byteLen := sub(byte0, 0xb7) // # of bytes the actual length is
                memPtr := add(memPtr, 1) // skip over the first byte
                                   
                let dataLen := div(mload(memPtr), exp(256, sub(32, byteLen))) // right shifting to get the len
                len := add(dataLen, add(byteLen, 1))
            }
        }
        else if (byte0 < list_long_start416) {
            return byte0 - list_short_start837 + 1;
        }
        else {
            assembly {
                let byteLen := sub(byte0, 0xf7)
                memPtr := add(memPtr, 1)
                let dataLen := div(mload(memPtr), exp(256, sub(32, byteLen))) // right shifting to the correct length
                len := add(dataLen, add(byteLen, 1))
            }
        }
    }
    // @return number of bytes until the data
    function _PAYLOADOFFSET145(uint memPtr) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint byte0;
        assembly {
            byte0 := byte(0, mload(memPtr))
        }
        if (byte0 < string_short_start673)
            return 0;
        else if (byte0 < string_long_start401 || (byte0 >= list_short_start837 && byte0 < list_long_start416))
            return 1;
        else if (byte0 < list_short_start837)  // being explicit
            return byte0 - (string_long_start401 - 1) + 1;
        else
            return byte0 - (list_long_start416 - 1) + 1;
    }
                                               
    // @returns raw rlp encoding in bytes
    function TORLPBYTES142(RLPItem memory item) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        bytes memory result = new bytes(item.len);
        uint ptr;
        assembly {
            ptr := add(0x20, result)
        }
        COPY796(item.memPtr, ptr, item.len);
        return result;
    }

    function TOBOOLEAN48(RLPItem memory item) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        require(item.len == 1, "Invalid RLPItem. Booleans are encoded in 1 byte");
        uint result;
        uint memPtr = item.memPtr;
        assembly {
            result := byte(0, mload(memPtr))
        }
        return result == 0 ? false : true;
    }

    function TOADDRESS319(RLPItem memory item) internal pure returns (address) {	//inject NONSTANDARD NAMING
        // 1 byte for the length prefix according to RLP spec
        require(item.len <= 21, "Invalid RLPItem. Addresses are encoded in 20 bytes or less");
        return address(TOUINT445(item));
    }

    function TOUINT445(RLPItem memory item) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint offset = _PAYLOADOFFSET145(item.memPtr);
        uint len = item.len - offset;
        uint memPtr = item.memPtr + offset;
        uint result;
        assembly {
            result := div(mload(memPtr), exp(256, sub(32, len))) // shift to the correct location
        }
        return result;
    }

    function TOBYTES261(RLPItem memory item) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        uint offset = _PAYLOADOFFSET145(item.memPtr);
        uint len = item.len - offset;
        // data length
        bytes memory result = new bytes(len);
        uint destPtr;
        assembly {
            destPtr := add(0x20, result)
        }
        COPY796(item.memPtr + offset, destPtr, len);
        return result;
    }
                                                                                                                                                   
    function COPY796(uint src, uint dest, uint len) internal pure {	//inject NONSTANDARD NAMING
        // copy as many word sizes as possible
        for (; len >= word_size430; len -= word_size430) {
            assembly {
                mstore(dest, mload(src))
            }
            src += word_size430;
            dest += word_size430;
        }
        // left over bytes. Mask is used to remove unwanted bytes from the word
        uint mask = 256 ** (word_size430 - len) - 1;
        assembly {
            let srcpart := and(mload(src), not(mask)) // zero out src
            let destpart := and(mload(dest), mask) // retrieve the bytes
            mstore(dest, or(destpart, srcpart))
        }
    }
}

library ContractExists {
    function EXISTS951(address _address) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint256 size;
        assembly { size := extcodesize(_address) }
        return size > 0;
    }
}

contract IOwnable {
    function GETOWNER348() public view returns (address);	//inject NONSTANDARD NAMING
    function TRANSFEROWNERSHIP855(address _newOwner) public returns (bool);	//inject NONSTANDARD NAMING
}

contract ITyped {
    function GETTYPENAME67() public view returns (bytes32);	//inject NONSTANDARD NAMING
}

contract Initializable {
    bool private initialized = false;

    modifier BEFOREINITIALIZED144 {	//inject NONSTANDARD NAMING
        require(!initialized);
        _;
    }

    function ENDINITIALIZATION790() internal BEFOREINITIALIZED144 {	//inject NONSTANDARD NAMING
        initialized = true;
    }

    function GETINITIALIZED597() public view returns (bool) {	//inject NONSTANDARD NAMING
        return initialized;
    }
}

contract AugurWallet is Initializable, IAugurWallet {
    using SafeMathUint256  for uint256;

    IAugurWalletRegistry public registry;
    mapping(address => bool) public authorizedProxies;

    uint256 private constant max_approval_amount495 = 2 ** 256 - 1;	//inject NONSTANDARD NAMING

    //keccak256("EIP712Domain(address verifyingContract)");
    bytes32 public constant domain_separator_typehash519 = 0x035aff83d86937d35b32e04f0ddc6ff469290eef2f1b692d8a815c89404d4749;	//inject NONSTANDARD NAMING

    //keccak256("AugurWalletMessage(bytes message)");
    bytes32 public constant msg_typehash173 = 0xe0e790a7bae5fba0106cf286392dd87dfd6ec8631e5631988133e4470b9e7b0d;	//inject NONSTANDARD NAMING

    // bytes4(keccak256("isValidSignature(bytes,bytes)")
    bytes4 constant internal eip1271_magic_value846 = 0x20c13b0b;	//inject NONSTANDARD NAMING

    address owner;

    bytes32 public domainSeparator;
    IERC20 public cash;

    function INITIALIZE942(address _owner, address _referralAddress, bytes32 _fingerprint, address _augur, address _registry, address _registryV2, IERC20 _cash, IAffiliates _affiliates, IERC1155 _shareToken, address _createOrder, address _fillOrder, address _zeroXTrade) external BEFOREINITIALIZED144 {	//inject NONSTANDARD NAMING
        ENDINITIALIZATION790();
        domainSeparator = keccak256(abi.encode(domain_separator_typehash519, this));
        owner = _owner;
        registry = IAugurWalletRegistry(_registryV2);
        authorizedProxies[_registry] = true;
        authorizedProxies[_registryV2] = true;
        cash = _cash;

        _cash.APPROVE4(_augur, max_approval_amount495);

        _cash.APPROVE4(_createOrder, max_approval_amount495);
        _shareToken.SETAPPROVALFORALL255(_createOrder, true);

        _cash.APPROVE4(_fillOrder, max_approval_amount495);
        _shareToken.SETAPPROVALFORALL255(_fillOrder, true);

        _cash.APPROVE4(_zeroXTrade, max_approval_amount495);

        _affiliates.SETFINGERPRINT964(_fingerprint);

        if (_referralAddress != address(0)) {
            _affiliates.SETREFERRER536(_referralAddress);
        }
    }

    function TRANSFERCASH779(address _to, uint256 _amount) external {	//inject NONSTANDARD NAMING
        require(authorizedProxies[msg.sender]);
        cash.TRANSFER511(_to, _amount);
    }

    function EXECUTETRANSACTION655(address _to, bytes calldata _data, uint256 _value) external returns (bool) {	//inject NONSTANDARD NAMING
        require(authorizedProxies[msg.sender]);
        (bool _didSucceed, bytes memory _resultData) = address(_to).call.value(_value)(_data);
        return _didSucceed;
    }

    function ADDAUTHORIZEDPROXY946(address _authorizedProxy) external returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || authorizedProxies[msg.sender] || msg.sender == address(this));
        authorizedProxies[_authorizedProxy] = true;
        return true;
    }

    function REMOVEAUTHORIZEDPROXY2(address _authorizedProxy) external returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || authorizedProxies[msg.sender] || msg.sender == address(this));
        authorizedProxies[_authorizedProxy] = false;
        return true;
    }

    function WITHDRAWALLFUNDSASDAI29(address _destination, uint256 _minExchangeRateInDai) external payable returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        IUniswapV2Pair _ethExchange = registry.ETHEXCHANGE353();
        IWETH _weth = registry.WETH26();
        bool _token0IsCash = registry.TOKEN0ISCASH313();
        uint256 _ethAmount = address(this).balance;
        (uint112 _reserve0, uint112 _reserve1, uint32 _blockTimestampLast) = _ethExchange.GETRESERVES408();
        uint256 _cashAmount = GETAMOUNTOUT26(_ethAmount, _token0IsCash ? _reserve1 : _reserve0, _token0IsCash ? _reserve0 : _reserve1);
        uint256 _exchangeRate = _cashAmount.MUL158(10**18).DIV334(_ethAmount);
        require(_minExchangeRateInDai <= _exchangeRate, "Exchange rate too low");
        _weth.DEPOSIT515.value(_ethAmount)();
        _weth.TRANSFER511(address(_ethExchange), _ethAmount);
        _ethExchange.SWAP401(_token0IsCash ? _cashAmount : 0, _token0IsCash ? 0 : _cashAmount, address(this), "");
        cash.TRANSFER511(_destination, cash.BALANCEOF591(address(this)));
        return true;
    }

    function GETAMOUNTOUT26(uint amountIn, uint reserveIn, uint reserveOut) public pure returns (uint amountOut) {	//inject NONSTANDARD NAMING
        require(amountIn > 0);
        require(reserveIn > 0 && reserveOut > 0);
        uint amountInWithFee = amountIn.MUL158(997);
        uint numerator = amountInWithFee.MUL158(reserveOut);
        uint denominator = reserveIn.MUL158(1000).ADD458(amountInWithFee);
        amountOut = numerator / denominator;
    }

    function ISVALIDSIGNATURE456(bytes calldata _data, bytes calldata _signature) external view returns (bytes4) {	//inject NONSTANDARD NAMING
        bytes32 _messageHash = GETMESSAGEHASH720(_data);
        require(_signature.length >= 65, "Signature data length incorrect");
        bytes32 _r;
        bytes32 _s;
        uint8 _v;
        bytes memory _sig = _signature;

        assembly {
            _r := mload(add(_sig, 32))
            _s := mload(add(_sig, 64))
            _v := and(mload(add(_sig, 65)), 255)
        }

        require(owner == ecrecover(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash)), _v, _r, _s), "Invalid Signature");

        return eip1271_magic_value846;
    }

                                                                       
                                                     
                             
    function GETMESSAGEHASH720(bytes memory _message) public view returns (bytes32) {	//inject NONSTANDARD NAMING
        bytes32 safeMessageHash = keccak256(abi.encode(msg_typehash173, keccak256(_message)));
        return keccak256(abi.encodePacked(byte(0x19), byte(0x01), domainSeparator, safeMessageHash));
    }

    function () external payable {}
}

library LibBytes {

    using LibBytes for bytes;

                                               
                                               
                                                
                                                             
    function EQUALS118(	//inject NONSTANDARD NAMING
        bytes memory lhs,
        bytes memory rhs
    )
        internal
        pure
        returns (bool equal)
    {
        // Keccak gas cost is 30 + numWords * 6. This is a cheap way to compare.
        // We early exit on unequal lengths, but keccak would also correctly
        // handle this.
        return lhs.length == rhs.length && keccak256(lhs) == keccak256(rhs);
    }

                                                                      
                                          
                                                                               
    function CONTENTADDRESS114(bytes memory input)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256 memoryAddress)
    {
        assembly {
            memoryAddress := add(input, 32)
        }
        return memoryAddress;
    }

                                                                           
                                                    
                                                        
                                              
    function MEMCOPY555(	//inject NONSTANDARD NAMING
        uint256 dest,
        uint256 source,
        uint256 length
    )
        internal
        pure
    {
        if (length < 32) {
            // Handle a partial word by reading destination and masking
            // off the bits we are interested in.
            // This correctly handles overlap, zero lengths and source == dest
            assembly {
                let mask := sub(exp(256, sub(32, length)), 1)
                let s := and(mload(source), not(mask))
                let d := and(mload(dest), mask)
                mstore(dest, or(s, d))
            }
        } else {
            // Skip the O(length) loop when source == dest.
            if (source == dest) {
                return;
            }

            // For large copies we copy whole words at a time. The final
            // word is aligned to the end of the range (instead of after the
            // previous) to handle partial words. So a copy will look like this:
            //
            //  ####
            //      ####
            //          ####
            //            ####
            //
            // We handle overlap in the source and destination range by
            // changing the copying direction. This prevents us from
            // overwriting parts of source that we still need to copy.
            //
            // This correctly handles source == dest
            //
            if (source > dest) {
                assembly {
                    // We subtract 32 from `sEnd` and `dEnd` because it
                    // is easier to compare with in the loop, and these
                    // are also the addresses we need for copying the
                    // last bytes.
                    length := sub(length, 32)
                    let sEnd := add(source, length)
                    let dEnd := add(dest, length)

                    // Remember the last 32 bytes of source
                    // This needs to be done here and not after the loop
                    // because we may have overwritten the last bytes in
                    // source already due to overlap.
                    let last := mload(sEnd)

                    // Copy whole words front to back
                    // Note: the first check is always true,
                    // this could have been a do-while loop.
                    // solhint-disable-next-line no-empty-blocks
                    for {} lt(source, sEnd) {} {
                        mstore(dest, mload(source))
                        source := add(source, 32)
                        dest := add(dest, 32)
                    }

                    // Write the last 32 bytes
                    mstore(dEnd, last)
                }
            } else {
                assembly {
                    // We subtract 32 from `sEnd` and `dEnd` because those
                    // are the starting points when copying a word at the end.
                    length := sub(length, 32)
                    let sEnd := add(source, length)
                    let dEnd := add(dest, length)

                    // Remember the first 32 bytes of source
                    // This needs to be done here and not after the loop
                    // because we may have overwritten the first bytes in
                    // source already due to overlap.
                    let first := mload(source)

                    // Copy whole words back to front
                    // We use a signed comparisson here to allow dEnd to become
                    // negative (happens when source and dest < 32). Valid
                    // addresses in local memory will never be larger than
                    // 2**255, so they can be safely re-interpreted as signed.
                    // Note: the first check is always true,
                    // this could have been a do-while loop.
                    // solhint-disable-next-line no-empty-blocks
                    for {} slt(dest, dEnd) {} {
                        mstore(dEnd, mload(sEnd))
                        sEnd := sub(sEnd, 32)
                        dEnd := sub(dEnd, 32)
                    }

                    // Write the first 32 bytes
                    mstore(dest, first)
                }
            }
        }
    }

                                                
                                                     
                                                                 
                                                            
                                                                       
    function SLICE367(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 from,
        uint256 to
    )
        internal
        pure
        returns (bytes memory result)
    {
        // Ensure that the from and to positions are valid positions for a slice within
        // the byte array that is being used.
        if (from > to) {
            revert();
        }
        if (to > b.length) {
            revert();
        }

        // Create a new bytes structure and copy contents
        result = new bytes(to - from);
        MEMCOPY555(
            result.CONTENTADDRESS114(),
            b.CONTENTADDRESS114() + from,
            result.length
        );
        return result;
    }

                                                                            
                                                                                       
                                                                 
                                                            
                                                                       
                                                                                                                   
    function SLICEDESTRUCTIVE907(	//inject NONSTANDARD NAMING
        bytes memory b,
        uint256 from,
        uint256 to
    )
        internal
        pure
        returns (bytes memory result)
    {
        // Ensure that the from and to positions are valid positions for a slice within
        // the byte array that is being used.
        if (from > to) {
            revert();
        }
        if (to > b.length) {
            revert();
        }

        // Create a new bytes structure around [from, to) in-place.
        assembly {
            result := add(b, from)
            mstore(result, sub(to, from))
        }
        return result;
    }

                                                                            
                                                  
                                             
    function POPLASTBYTE732(bytes memory b)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (bytes1 result)
    {
        if (b.length == 0) {
            revert();
        }

        // Store last byte.
        result = b[b.length - 1];

        assembly {
            // Decrement length of byte array.
            let newLen := sub(mload(b), 1)
            mstore(b, newLen)
        }
        return result;
    }
}

library SafeMathUint256 {
    function MUL158(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function DIV334(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB40(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        return a - b;
    }

    function ADD458(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);
        return c;
    }

    function MIN618(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a <= b) {
            return a;
        } else {
            return b;
        }
    }

    function MAX400(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a >= b) {
            return a;
        } else {
            return b;
        }
    }

    function SQRT634(uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        if (y > 3) {
            uint256 x = (y + 1) / 2;
            z = y;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }

    function GETUINT256MIN187() internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return 0;
    }

    function GETUINT256MAX665() internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // 2 ** 256 - 1
        return 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    }

    function ISMULTIPLEOF496(uint256 a, uint256 b) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return a % b == 0;
    }

    // Float [fixed point] Operations
    function FXPMUL369(uint256 a, uint256 b, uint256 base) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV334(MUL158(a, b), base);
    }

    function FXPDIV477(uint256 a, uint256 b, uint256 base) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV334(MUL158(a, base), b);
    }
}

interface IERC1155 {

                                                                                          
                                                                          
                                           
                                                                      
                                                                           
                                                                                                 
                                                                                                      
                                                                                                       
                                                                   
    event TRANSFERSINGLE733(	//inject NONSTANDARD NAMING
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256 id,
        uint256 value
    );

                                                                                          
                                                                          
                                          
                                                                      
                                                                           
                                                                                                 
                                                                                                      
                                                                                                      
                                                                   
    event TRANSFERBATCH926(	//inject NONSTANDARD NAMING
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256[] ids,
        uint256[] values
    );

                                                   
    event APPROVALFORALL308(	//inject NONSTANDARD NAMING
        address indexed owner,
        address indexed operator,
        bool approved
    );

                                                              
                                     
                                                                                            
    event URI968(	//inject NONSTANDARD NAMING
        string value,
        uint256 indexed id
    );

                                                                                                     
                                                       
                                                                                            
                                                
                                                                                        
                                      
                                                                                                         
                                                                                       
                                                                                               
                                     
                                     
                                           
                                      
                                                                                      
    function SAFETRANSFERFROM627(	//inject NONSTANDARD NAMING
        address from,
        address to,
        uint256 id,
        uint256 value,
        bytes calldata data
    )
        external;

                                                                                                  
                                                      
                                                                                            
                                                
                                                                              
                                                                                                                 
                                      
                                                                                                         
                                                                                            
                                                                                                        
                                       
                                       
                                             
                                                      
                                                                                      
    function SAFEBATCHTRANSFERFROM986(	//inject NONSTANDARD NAMING
        address from,
        address to,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    )
        external;

                                                                                                               
                                                           
                                                                          
                                                                                   
    function SETAPPROVALFORALL255(address operator, bool approved) external;	//inject NONSTANDARD NAMING

                                                                             
                                                
                                                       
                                                                        
    function ISAPPROVEDFORALL410(address owner, address operator) external view returns (bool);	//inject NONSTANDARD NAMING

                                                       
                                                     
                                     
                                                                       
    function BALANCEOF591(address owner, uint256 id) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                
                                     
                                                                   
    function TOTALSUPPLY627(uint256 id) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                               
                                                        
                                      
                                                                        
    function BALANCEOFBATCH473(	//inject NONSTANDARD NAMING
        address[] calldata owners,
        uint256[] calldata ids
    )
        external
        view
        returns (uint256[] memory balances_);
}

contract IERC20 {
    function TOTALSUPPLY627() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF591(address owner) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER511(address to, uint256 amount) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM943(address from, address to, uint256 amount) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE4(address spender, uint256 amount) public returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE84(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING

    // solhint-disable-next-line no-simple-event-func-name
    event TRANSFER19(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL385(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract ICash is IERC20 {
}

contract IAffiliateValidator {
    function VALIDATEREFERENCE281(address _account, address _referrer) external view returns (bool);	//inject NONSTANDARD NAMING
}

contract IAffiliates {
    function SETFINGERPRINT964(bytes32 _fingerprint) external;	//inject NONSTANDARD NAMING
    function SETREFERRER536(address _referrer) external;	//inject NONSTANDARD NAMING
    function GETACCOUNTFINGERPRINT224(address _account) external returns (bytes32);	//inject NONSTANDARD NAMING
    function GETREFERRER958(address _account) external returns (address);	//inject NONSTANDARD NAMING
    function GETANDVALIDATEREFERRER657(address _account, IAffiliateValidator affiliateValidator) external returns (address);	//inject NONSTANDARD NAMING
    function AFFILIATEVALIDATORS830(address _affiliateValidator) external returns (bool);	//inject NONSTANDARD NAMING
}

contract IDisputeWindow is ITyped, IERC20 {
    function INVALIDMARKETSTOTAL100() external view returns (uint256);	//inject NONSTANDARD NAMING
    function VALIDITYBONDTOTAL594() external view returns (uint256);	//inject NONSTANDARD NAMING

    function INCORRECTDESIGNATEDREPORTTOTAL13() external view returns (uint256);	//inject NONSTANDARD NAMING
    function INITIALREPORTBONDTOTAL91() external view returns (uint256);	//inject NONSTANDARD NAMING

    function DESIGNATEDREPORTNOSHOWSTOTAL629() external view returns (uint256);	//inject NONSTANDARD NAMING
    function DESIGNATEDREPORTERNOSHOWBONDTOTAL944() external view returns (uint256);	//inject NONSTANDARD NAMING

    function INITIALIZE942(IAugur _augur, IUniverse _universe, uint256 _disputeWindowId, bool _participationTokensEnabled, uint256 _duration, uint256 _startTime) public;	//inject NONSTANDARD NAMING
    function TRUSTEDBUY676(address _buyer, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function GETUNIVERSE855() public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function GETREPUTATIONTOKEN566() public view returns (IReputationToken);	//inject NONSTANDARD NAMING
    function GETSTARTTIME619() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETENDTIME836() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETWINDOWID10() public view returns (uint256);	//inject NONSTANDARD NAMING
    function ISACTIVE388() public view returns (bool);	//inject NONSTANDARD NAMING
    function ISOVER660() public view returns (bool);	//inject NONSTANDARD NAMING
    function ONMARKETFINALIZED636() public;	//inject NONSTANDARD NAMING
    function REDEEM142(address _account) public returns (bool);	//inject NONSTANDARD NAMING
}

contract IMarket is IOwnable {
    enum MarketType {
        YES_NO,
        CATEGORICAL,
        SCALAR
    }

    function INITIALIZE942(IAugur _augur, IUniverse _universe, uint256 _endTime, uint256 _feePerCashInAttoCash, IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, address _creator, uint256 _numOutcomes, uint256 _numTicks) public;	//inject NONSTANDARD NAMING
    function DERIVEPAYOUTDISTRIBUTIONHASH849(uint256[] memory _payoutNumerators) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function DOINITIALREPORT811(uint256[] memory _payoutNumerators, string memory _description, uint256 _additionalStake) public returns (bool);	//inject NONSTANDARD NAMING
    function GETUNIVERSE855() public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function GETDISPUTEWINDOW418() public view returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETNUMBEROFOUTCOMES768() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETNUMTICKS407() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETMARKETCREATORSETTLEMENTFEEDIVISOR594() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETFORKINGMARKET806() public view returns (IMarket _market);	//inject NONSTANDARD NAMING
    function GETENDTIME836() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETWINNINGPAYOUTDISTRIBUTIONHASH301() public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETWINNINGPAYOUTNUMERATOR388(uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETWINNINGREPORTINGPARTICIPANT462() public view returns (IReportingParticipant);	//inject NONSTANDARD NAMING
    function GETREPUTATIONTOKEN566() public view returns (IV2ReputationToken);	//inject NONSTANDARD NAMING
    function GETFINALIZATIONTIME776() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETINITIALREPORTER622() public view returns (IInitialReporter);	//inject NONSTANDARD NAMING
    function GETDESIGNATEDREPORTINGENDTIME785() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETVALIDITYBONDATTOCASH531() public view returns (uint256);	//inject NONSTANDARD NAMING
    function AFFILIATEFEEDIVISOR206() external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETNUMPARTICIPANTS418() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETDISPUTEPACINGON932() public view returns (bool);	//inject NONSTANDARD NAMING
    function DERIVEMARKETCREATORFEEAMOUNT372(uint256 _amount) public view returns (uint256);	//inject NONSTANDARD NAMING
    function RECORDMARKETCREATORFEES6(uint256 _marketCreatorFees, address _sourceAccount, bytes32 _fingerprint) public returns (bool);	//inject NONSTANDARD NAMING
    function ISCONTAINERFORREPORTINGPARTICIPANT338(IReportingParticipant _reportingParticipant) public view returns (bool);	//inject NONSTANDARD NAMING
    function ISFINALIZEDASINVALID788() public view returns (bool);	//inject NONSTANDARD NAMING
    function FINALIZE218() public returns (bool);	//inject NONSTANDARD NAMING
    function ISFINALIZED992() public view returns (bool);	//inject NONSTANDARD NAMING
    function GETOPENINTEREST212() public view returns (uint256);	//inject NONSTANDARD NAMING
}

contract IReportingParticipant {
    function GETSTAKE797() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPAYOUTDISTRIBUTIONHASH52() public view returns (bytes32);	//inject NONSTANDARD NAMING
    function LIQUIDATELOSING810() public;	//inject NONSTANDARD NAMING
    function REDEEM142(address _redeemer) public returns (bool);	//inject NONSTANDARD NAMING
    function ISDISAVOWED878() public view returns (bool);	//inject NONSTANDARD NAMING
    function GETPAYOUTNUMERATOR82(uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPAYOUTNUMERATORS228() public view returns (uint256[] memory);	//inject NONSTANDARD NAMING
    function GETMARKET363() public view returns (IMarket);	//inject NONSTANDARD NAMING
    function GETSIZE787() public view returns (uint256);	//inject NONSTANDARD NAMING
}

contract IInitialReporter is IReportingParticipant, IOwnable {
    function INITIALIZE942(IAugur _augur, IMarket _market, address _designatedReporter) public;	//inject NONSTANDARD NAMING
    function REPORT971(address _reporter, bytes32 _payoutDistributionHash, uint256[] memory _payoutNumerators, uint256 _initialReportStake) public;	//inject NONSTANDARD NAMING
    function DESIGNATEDREPORTERSHOWED795() public view returns (bool);	//inject NONSTANDARD NAMING
    function INITIALREPORTERWASCORRECT60() public view returns (bool);	//inject NONSTANDARD NAMING
    function GETDESIGNATEDREPORTER665() public view returns (address);	//inject NONSTANDARD NAMING
    function GETREPORTTIMESTAMP533() public view returns (uint256);	//inject NONSTANDARD NAMING
    function MIGRATETONEWUNIVERSE945(address _designatedReporter) public;	//inject NONSTANDARD NAMING
    function RETURNREPFROMDISAVOW519() public;	//inject NONSTANDARD NAMING
}

contract IReputationToken is IERC20 {
    function MIGRATEOUTBYPAYOUT214(uint256[] memory _payoutNumerators, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function MIGRATEIN144(address _reporter, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function TRUSTEDREPORTINGPARTICIPANTTRANSFER758(address _source, address _destination, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function TRUSTEDMARKETTRANSFER150(address _source, address _destination, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function TRUSTEDUNIVERSETRANSFER918(address _source, address _destination, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function TRUSTEDDISPUTEWINDOWTRANSFER778(address _source, address _destination, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function GETUNIVERSE855() public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function GETTOTALMIGRATED77() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETTOTALTHEORETICALSUPPLY668() public view returns (uint256);	//inject NONSTANDARD NAMING
    function MINTFORREPORTINGPARTICIPANT114(uint256 _amountMigrated) public returns (bool);	//inject NONSTANDARD NAMING
}

contract IShareToken is ITyped, IERC1155 {
    function INITIALIZE942(IAugur _augur) external;	//inject NONSTANDARD NAMING
    function INITIALIZEMARKET606(IMarket _market, uint256 _numOutcomes, uint256 _numTicks) public;	//inject NONSTANDARD NAMING
    function UNSAFETRANSFERFROM729(address _from, address _to, uint256 _id, uint256 _value) public;	//inject NONSTANDARD NAMING
    function UNSAFEBATCHTRANSFERFROM834(address _from, address _to, uint256[] memory _ids, uint256[] memory _values) public;	//inject NONSTANDARD NAMING
    function CLAIMTRADINGPROCEEDS616(IMarket _market, address _shareHolder, bytes32 _fingerprint) external returns (uint256[] memory _outcomeFees);	//inject NONSTANDARD NAMING
    function GETMARKET363(uint256 _tokenId) external view returns (IMarket);	//inject NONSTANDARD NAMING
    function GETOUTCOME673(uint256 _tokenId) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETTOKENID879(IMarket _market, uint256 _outcome) public pure returns (uint256 _tokenId);	//inject NONSTANDARD NAMING
    function GETTOKENIDS962(IMarket _market, uint256[] memory _outcomes) public pure returns (uint256[] memory _tokenIds);	//inject NONSTANDARD NAMING
    function BUYCOMPLETESETS849(IMarket _market, address _account, uint256 _amount) external returns (bool);	//inject NONSTANDARD NAMING
    function BUYCOMPLETESETSFORTRADE587(IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient) external returns (bool);	//inject NONSTANDARD NAMING
    function SELLCOMPLETESETS771(IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint) external returns (uint256 _creatorFee, uint256 _reportingFee);	//inject NONSTANDARD NAMING
    function SELLCOMPLETESETSFORTRADE80(IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint) external returns (uint256 _creatorFee, uint256 _reportingFee);	//inject NONSTANDARD NAMING
    function TOTALSUPPLYFORMARKETOUTCOME66(IMarket _market, uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOFMARKETOUTCOME324(IMarket _market, uint256 _outcome, address _account) public view returns (uint256);	//inject NONSTANDARD NAMING
    function LOWESTBALANCEOFMARKETOUTCOMES131(IMarket _market, uint256[] memory _outcomes, address _account) public view returns (uint256);	//inject NONSTANDARD NAMING
}

contract IUniverse {
    function CREATIONTIME373() external view returns (uint256);	//inject NONSTANDARD NAMING
    function MARKETBALANCE816(address) external view returns (uint256);	//inject NONSTANDARD NAMING

    function FORK132() public returns (bool);	//inject NONSTANDARD NAMING
    function UPDATEFORKVALUES367() public returns (bool);	//inject NONSTANDARD NAMING
    function GETPARENTUNIVERSE324() public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function CREATECHILDUNIVERSE248(uint256[] memory _parentPayoutNumerators) public returns (IUniverse);	//inject NONSTANDARD NAMING
    function GETCHILDUNIVERSE548(bytes32 _parentPayoutDistributionHash) public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function GETREPUTATIONTOKEN566() public view returns (IV2ReputationToken);	//inject NONSTANDARD NAMING
    function GETFORKINGMARKET806() public view returns (IMarket);	//inject NONSTANDARD NAMING
    function GETFORKENDTIME220() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETFORKREPUTATIONGOAL363() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPARENTPAYOUTDISTRIBUTIONHASH472() public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETDISPUTEROUNDDURATIONINSECONDS592(bool _initial) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCREATEDISPUTEWINDOWBYTIMESTAMP229(uint256 _timestamp, bool _initial) public returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETORCREATECURRENTDISPUTEWINDOW421(bool _initial) public returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETORCREATENEXTDISPUTEWINDOW497(bool _initial) public returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETORCREATEPREVIOUSDISPUTEWINDOW679(bool _initial) public returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETOPENINTERESTINATTOCASH42() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETTARGETREPMARKETCAPINATTOCASH454() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCACHEVALIDITYBOND784() public returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCACHEDESIGNATEDREPORTSTAKE857() public returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCACHEDESIGNATEDREPORTNOSHOWBOND324() public returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCACHEMARKETREPBOND352() public returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCACHEREPORTINGFEEDIVISOR513() public returns (uint256);	//inject NONSTANDARD NAMING
    function GETDISPUTETHRESHOLDFORFORK234() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETDISPUTETHRESHOLDFORDISPUTEPACING452() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETINITIALREPORTMINVALUE955() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPAYOUTNUMERATORS228() public view returns (uint256[] memory);	//inject NONSTANDARD NAMING
    function GETREPORTINGFEEDIVISOR757() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPAYOUTNUMERATOR82(uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETWINNINGCHILDPAYOUTNUMERATOR662(uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function ISOPENINTERESTCASH859(address) public view returns (bool);	//inject NONSTANDARD NAMING
    function ISFORKINGMARKET962() public view returns (bool);	//inject NONSTANDARD NAMING
    function GETCURRENTDISPUTEWINDOW867(bool _initial) public view returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETDISPUTEWINDOWSTARTTIMEANDDURATION969(uint256 _timestamp, bool _initial) public view returns (uint256, uint256);	//inject NONSTANDARD NAMING
    function ISPARENTOF544(IUniverse _shadyChild) public view returns (bool);	//inject NONSTANDARD NAMING
    function UPDATETENTATIVEWINNINGCHILDUNIVERSE480(bytes32 _parentPayoutDistributionHash) public returns (bool);	//inject NONSTANDARD NAMING
    function ISCONTAINERFORDISPUTEWINDOW675(IDisputeWindow _shadyTarget) public view returns (bool);	//inject NONSTANDARD NAMING
    function ISCONTAINERFORMARKET910(IMarket _shadyTarget) public view returns (bool);	//inject NONSTANDARD NAMING
    function ISCONTAINERFORREPORTINGPARTICIPANT338(IReportingParticipant _reportingParticipant) public view returns (bool);	//inject NONSTANDARD NAMING
    function MIGRATEMARKETOUT407(IUniverse _destinationUniverse) public returns (bool);	//inject NONSTANDARD NAMING
    function MIGRATEMARKETIN597(IMarket _market, uint256 _cashBalance, uint256 _marketOI) public returns (bool);	//inject NONSTANDARD NAMING
    function DECREMENTOPENINTEREST266(uint256 _amount) public returns (bool);	//inject NONSTANDARD NAMING
    function DECREMENTOPENINTERESTFROMMARKET764(IMarket _market) public returns (bool);	//inject NONSTANDARD NAMING
    function INCREMENTOPENINTEREST919(uint256 _amount) public returns (bool);	//inject NONSTANDARD NAMING
    function GETWINNINGCHILDUNIVERSE184() public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function ISFORKING819() public view returns (bool);	//inject NONSTANDARD NAMING
    function DEPOSIT515(address _sender, uint256 _amount, address _market) public returns (bool);	//inject NONSTANDARD NAMING
    function WITHDRAW380(address _recipient, uint256 _amount, address _market) public returns (bool);	//inject NONSTANDARD NAMING
    function CREATESCALARMARKET791(uint256 _endTime, uint256 _feePerCashInAttoCash, IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, int256[] memory _prices, uint256 _numTicks, string memory _extraInfo) public returns (IMarket _newMarket);	//inject NONSTANDARD NAMING
}

contract IV2ReputationToken is IReputationToken {
    function PARENTUNIVERSE864() external returns (IUniverse);	//inject NONSTANDARD NAMING
    function BURNFORMARKET807(uint256 _amountToBurn) public returns (bool);	//inject NONSTANDARD NAMING
    function MINTFORWARPSYNC621(uint256 _amountToMint, address _target) public returns (bool);	//inject NONSTANDARD NAMING
}

contract IAugurTrading {
    function LOOKUP140(bytes32 _key) public view returns (address);	//inject NONSTANDARD NAMING
    function LOGPROFITLOSSCHANGED753(IMarket _market, address _account, uint256 _outcome, int256 _netPosition, uint256 _avgPrice, int256 _realizedProfit, int256 _frozenFunds, int256 _realizedCost) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGORDERCREATED206(IUniverse _universe, bytes32 _orderId, bytes32 _tradeGroupId) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGORDERCANCELED335(IUniverse _universe, IMarket _market, address _creator, uint256 _tokenRefund, uint256 _sharesRefund, bytes32 _orderId) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGORDERFILLED297(IUniverse _universe, address _creator, address _filler, uint256 _price, uint256 _fees, uint256 _amountFilled, bytes32 _orderId, bytes32 _tradeGroupId) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETVOLUMECHANGED433(IUniverse _universe, address _market, uint256 _volume, uint256[] memory _outcomeVolumes, uint256 _totalTrades) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGZEROXORDERFILLED348(IUniverse _universe, IMarket _market, bytes32 _orderHash, bytes32 _tradeGroupId, uint8 _orderType, address[] memory _addressData, uint256[] memory _uint256Data) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGZEROXORDERCANCELED258(address _universe, address _market, address _account, uint256 _outcome, uint256 _price, uint256 _amount, uint8 _type, bytes32 _orderHash) public;	//inject NONSTANDARD NAMING
}

contract IOrders {
    function SAVEORDER275(uint256[] calldata _uints, bytes32[] calldata _bytes32s, Order.Types _type, IMarket _market, address _sender) external returns (bytes32 _orderId);	//inject NONSTANDARD NAMING
    function REMOVEORDER871(bytes32 _orderId) external returns (bool);	//inject NONSTANDARD NAMING
    function GETMARKET363(bytes32 _orderId) public view returns (IMarket);	//inject NONSTANDARD NAMING
    function GETORDERTYPE300(bytes32 _orderId) public view returns (Order.Types);	//inject NONSTANDARD NAMING
    function GETOUTCOME673(bytes32 _orderId) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETAMOUNT635(bytes32 _orderId) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPRICE918(bytes32 _orderId) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORDERCREATOR657(bytes32 _orderId) public view returns (address);	//inject NONSTANDARD NAMING
    function GETORDERSHARESESCROWED794(bytes32 _orderId) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORDERMONEYESCROWED578(bytes32 _orderId) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORDERDATAFORCANCEL62(bytes32 _orderId) public view returns (uint256, uint256, Order.Types, IMarket, uint256, address);	//inject NONSTANDARD NAMING
    function GETORDERDATAFORLOGS506(bytes32 _orderId) public view returns (Order.Types, address[] memory _addressData, uint256[] memory _uint256Data);	//inject NONSTANDARD NAMING
    function GETBETTERORDERID657(bytes32 _orderId) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETWORSEORDERID257(bytes32 _orderId) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETBESTORDERID759(Order.Types _type, IMarket _market, uint256 _outcome) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETWORSTORDERID896(Order.Types _type, IMarket _market, uint256 _outcome) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETLASTOUTCOMEPRICE76(IMarket _market, uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORDERID990(Order.Types _type, IMarket _market, uint256 _amount, uint256 _price, address _sender, uint256 _blockNumber, uint256 _outcome, uint256 _moneyEscrowed, uint256 _sharesEscrowed) public pure returns (bytes32);	//inject NONSTANDARD NAMING
    function GETTOTALESCROWED477(IMarket _market) public view returns (uint256);	//inject NONSTANDARD NAMING
    function ISBETTERPRICE14(Order.Types _type, uint256 _price, bytes32 _orderId) public view returns (bool);	//inject NONSTANDARD NAMING
    function ISWORSEPRICE444(Order.Types _type, uint256 _price, bytes32 _orderId) public view returns (bool);	//inject NONSTANDARD NAMING
    function ASSERTISNOTBETTERPRICE439(Order.Types _type, uint256 _price, bytes32 _betterOrderId) public view returns (bool);	//inject NONSTANDARD NAMING
    function ASSERTISNOTWORSEPRICE1000(Order.Types _type, uint256 _price, bytes32 _worseOrderId) public returns (bool);	//inject NONSTANDARD NAMING
    function RECORDFILLORDER744(bytes32 _orderId, uint256 _sharesFilled, uint256 _tokensFilled, uint256 _fill) external returns (bool);	//inject NONSTANDARD NAMING
    function SETPRICE297(IMarket _market, uint256 _outcome, uint256 _price) external returns (bool);	//inject NONSTANDARD NAMING
}

library Order {
    using SafeMathUint256 for uint256;

    enum Types {
        Bid, Ask
    }

    enum TradeDirections {
        Long, Short
    }

    struct Data {
        // Contracts
        IMarket market;
        IAugur augur;
        IAugurTrading augurTrading;
        IShareToken shareToken;
        ICash cash;

        // Order
        bytes32 id;
        address creator;
        uint256 outcome;
        Order.Types orderType;
        uint256 amount;
        uint256 price;
        uint256 sharesEscrowed;
        uint256 moneyEscrowed;
        bytes32 betterOrderId;
        bytes32 worseOrderId;
    }

    function CREATE416(IAugur _augur, IAugurTrading _augurTrading, address _creator, uint256 _outcome, Order.Types _type, uint256 _attoshares, uint256 _price, IMarket _market, bytes32 _betterOrderId, bytes32 _worseOrderId) internal view returns (Data memory) {	//inject NONSTANDARD NAMING
        require(_outcome < _market.GETNUMBEROFOUTCOMES768(), "Order.create: Outcome is not within market range");
        require(_price != 0, "Order.create: Price may not be 0");
        require(_price < _market.GETNUMTICKS407(), "Order.create: Price is outside of market range");
        require(_attoshares > 0, "Order.create: Cannot use amount of 0");
        require(_creator != address(0), "Order.create: Creator is 0x0");

        IShareToken _shareToken = IShareToken(_augur.LOOKUP140("ShareToken"));

        return Data({
            market: _market,
            augur: _augur,
            augurTrading: _augurTrading,
            shareToken: _shareToken,
            cash: ICash(_augur.LOOKUP140("Cash")),
            id: 0,
            creator: _creator,
            outcome: _outcome,
            orderType: _type,
            amount: _attoshares,
            price: _price,
            sharesEscrowed: 0,
            moneyEscrowed: 0,
            betterOrderId: _betterOrderId,
            worseOrderId: _worseOrderId
        });
    }

    //
    // "public" functions
    //

    function GETORDERID990(Order.Data memory _orderData, IOrders _orders) internal view returns (bytes32) {	//inject NONSTANDARD NAMING
        if (_orderData.id == bytes32(0)) {
            bytes32 _orderId = CALCULATEORDERID807(_orderData.orderType, _orderData.market, _orderData.amount, _orderData.price, _orderData.creator, block.number, _orderData.outcome, _orderData.moneyEscrowed, _orderData.sharesEscrowed);
            require(_orders.GETAMOUNT635(_orderId) == 0, "Order.getOrderId: New order had amount. This should not be possible");
            _orderData.id = _orderId;
        }
        return _orderData.id;
    }

    function CALCULATEORDERID807(Order.Types _type, IMarket _market, uint256 _amount, uint256 _price, address _sender, uint256 _blockNumber, uint256 _outcome, uint256 _moneyEscrowed, uint256 _sharesEscrowed) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        return sha256(abi.encodePacked(_type, _market, _amount, _price, _sender, _blockNumber, _outcome, _moneyEscrowed, _sharesEscrowed));
    }

    function GETORDERTRADINGTYPEFROMMAKERDIRECTION173(Order.TradeDirections _creatorDirection) internal pure returns (Order.Types) {	//inject NONSTANDARD NAMING
        return (_creatorDirection == Order.TradeDirections.Long) ? Order.Types.Bid : Order.Types.Ask;
    }

    function GETORDERTRADINGTYPEFROMFILLERDIRECTION605(Order.TradeDirections _fillerDirection) internal pure returns (Order.Types) {	//inject NONSTANDARD NAMING
        return (_fillerDirection == Order.TradeDirections.Long) ? Order.Types.Ask : Order.Types.Bid;
    }

    function SAVEORDER275(Order.Data memory _orderData, bytes32 _tradeGroupId, IOrders _orders) internal returns (bytes32) {	//inject NONSTANDARD NAMING
        GETORDERID990(_orderData, _orders);
        uint256[] memory _uints = new uint256[](5);
        _uints[0] = _orderData.amount;
        _uints[1] = _orderData.price;
        _uints[2] = _orderData.outcome;
        _uints[3] = _orderData.moneyEscrowed;
        _uints[4] = _orderData.sharesEscrowed;
        bytes32[] memory _bytes32s = new bytes32[](4);
        _bytes32s[0] = _orderData.betterOrderId;
        _bytes32s[1] = _orderData.worseOrderId;
        _bytes32s[2] = _tradeGroupId;
        _bytes32s[3] = _orderData.id;
        return _orders.SAVEORDER275(_uints, _bytes32s, _orderData.orderType, _orderData.market, _orderData.creator);
    }
}

interface IUniswapV2Factory {
    event PAIRCREATED463(address indexed token0, address indexed token1, address pair, uint);	//inject NONSTANDARD NAMING

    function FEETO594() external view returns (address);	//inject NONSTANDARD NAMING
    function FEETOSETTER287() external view returns (address);	//inject NONSTANDARD NAMING

    function GETPAIR705(address tokenA, address tokenB) external view returns (address pair);	//inject NONSTANDARD NAMING
    function ALLPAIRS103(uint) external view returns (address pair);	//inject NONSTANDARD NAMING
    function ALLPAIRSLENGTH258() external view returns (uint);	//inject NONSTANDARD NAMING

    function CREATEPAIR181(address tokenA, address tokenB) external returns (address pair);	//inject NONSTANDARD NAMING

    function SETFEETO492(address) external;	//inject NONSTANDARD NAMING
    function SETFEETOSETTER395(address) external;	//inject NONSTANDARD NAMING
}

interface IUniswapV2Pair {
    event APPROVAL385(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
    event TRANSFER19(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING

    function NAME883() external pure returns (string memory);	//inject NONSTANDARD NAMING
    function SYMBOL417() external pure returns (string memory);	//inject NONSTANDARD NAMING
    function DECIMALS877() external pure returns (uint8);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY627() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF591(address owner) external view returns (uint);	//inject NONSTANDARD NAMING
    function ALLOWANCE84(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING

    function APPROVE4(address spender, uint value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER511(address to, uint value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM943(address from, address to, uint value) external returns (bool);	//inject NONSTANDARD NAMING

    function DOMAIN_SEPARATOR295() external view returns (bytes32);	//inject NONSTANDARD NAMING
    function PERMIT_TYPEHASH89() external pure returns (bytes32);	//inject NONSTANDARD NAMING
    function NONCES61(address owner) external view returns (uint);	//inject NONSTANDARD NAMING

    function PERMIT809(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;	//inject NONSTANDARD NAMING

    event MINT371(address indexed sender, uint amount0, uint amount1);	//inject NONSTANDARD NAMING
    event BURN449(address indexed sender, uint amount0, uint amount1, address indexed to);	//inject NONSTANDARD NAMING
    event SWAP459(	//inject NONSTANDARD NAMING
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event SYNC284(uint112 reserve0, uint112 reserve1);	//inject NONSTANDARD NAMING

    function MINIMUM_LIQUIDITY108() external pure returns (uint);	//inject NONSTANDARD NAMING
    function FACTORY510() external view returns (address);	//inject NONSTANDARD NAMING
    function TOKEN032() external view returns (address);	//inject NONSTANDARD NAMING
    function TOKEN1110() external view returns (address);	//inject NONSTANDARD NAMING
    function GETRESERVES408() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);	//inject NONSTANDARD NAMING
    function PRICE0CUMULATIVELAST167() external view returns (uint);	//inject NONSTANDARD NAMING
    function PRICE1CUMULATIVELAST410() external view returns (uint);	//inject NONSTANDARD NAMING
    function KLAST393() external view returns (uint);	//inject NONSTANDARD NAMING

    function MINT517(address to) external returns (uint liquidity);	//inject NONSTANDARD NAMING
    function BURN245(address to) external returns (uint amount0, uint amount1);	//inject NONSTANDARD NAMING
    function SWAP401(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;	//inject NONSTANDARD NAMING
    function SKIM558(address to) external;	//inject NONSTANDARD NAMING
    function SYNC261() external;	//inject NONSTANDARD NAMING

    function INITIALIZE942(address, address) external;	//inject NONSTANDARD NAMING
}

interface IWETH {
    function DEPOSIT515() external payable;	//inject NONSTANDARD NAMING
    function BALANCEOF591(address owner) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER511(address to, uint value) external returns (bool);	//inject NONSTANDARD NAMING
    function WITHDRAW380(uint) external;	//inject NONSTANDARD NAMING
}

contract AugurWalletRegistry is Initializable, GSNRecipient {
    using LibBytes for bytes;
    using ContractExists for address;

    using SafeMathUint256  for uint256;

    enum GSNRecipientERC20FeeErrorCodes {
        OK,
        TX_COST_TOO_HIGH,
        INSUFFICIENT_BALANCE
    }

    event EXECUTETRANSACTIONSTATUS609(bool success, bool fundingSuccess);	//inject NONSTANDARD NAMING

    IAugur public augur;
    IAugurTrading public augurTrading;

    IERC20 public cash;
    IUniswapV2Pair public ethExchange;
    IWETH public WETH;
    bool public token0IsCash;
    IAugurWalletFactory public augurWalletFactory;

    uint256 private constant max_approval_amount495 = 2 ** 256 - 1;	//inject NONSTANDARD NAMING

    uint256 private constant max_tx_fee_in_eth347 = 10**17;	//inject NONSTANDARD NAMING

    function INITIALIZE942(IAugur _augur, IAugurTrading _augurTrading) public payable BEFOREINITIALIZED144 returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.value >= max_tx_fee_in_eth347, "Must provide initial Max TX Fee Deposit");
        ENDINITIALIZATION790();
        augur = _augur;
        cash = IERC20(_augur.LOOKUP140("Cash"));

        augurTrading = _augurTrading;
        WETH = IWETH(_augurTrading.LOOKUP140("WETH9"));
        augurWalletFactory = IAugurWalletFactory(_augurTrading.LOOKUP140("AugurWalletFactory"));
        IUniswapV2Factory _uniswapFactory = IUniswapV2Factory(_augur.LOOKUP140("UniswapV2Factory"));
        address _ethExchangeAddress = _uniswapFactory.GETPAIR705(address(WETH), address(cash));
        if (_ethExchangeAddress == address(0)) {
            _ethExchangeAddress = _uniswapFactory.CREATEPAIR181(address(WETH), address(cash));
        }
        ethExchange = IUniswapV2Pair(_ethExchangeAddress);
        token0IsCash = ethExchange.TOKEN032() == address(cash);

        IRelayHub(GETHUBADDR926()).DEPOSITFOR720.value(address(this).balance)(address(this));
        return true;
    }

    function ACCEPTRELAYEDCALL378(	//inject NONSTANDARD NAMING
        address,
        address _from,
        bytes calldata _encodedFunction,
        uint256,
        uint256,
        uint256,
        uint256,
        bytes calldata,
        uint256 _maxPossibleCharge
    )
        external
        view
        returns (uint256 _reason, bytes memory _context)
    {
        // executeWalletTransaction is the only encodedFunction that can succesfully be called through the relayHub
        uint256 _payment = GETPAYMENTFROMENCODEDFUNCTION725(_encodedFunction);
        GSNRecipientERC20FeeErrorCodes _code = GETACCEPTRELAYCALLSTATUS594(_from, _payment, _maxPossibleCharge);
        if (_code != GSNRecipientERC20FeeErrorCodes.OK) {
            return _REJECTRELAYEDCALL205(uint256(_code));
        }
        uint256 _initialEth = address(this).balance;
        return _APPROVERELAYEDCALL519(abi.encode(_from, _initialEth));
    }

    function GETPAYMENTFROMENCODEDFUNCTION725(bytes memory _encodedFunction) private pure returns (uint256) {	//inject NONSTANDARD NAMING
        bytes memory _encodedFunctionParams = _encodedFunction.SLICEDESTRUCTIVE907(4, _encodedFunction.length);
        (address _to, bytes memory _data, uint256 _value, uint256 _payment, address _affilate, bytes32 _fingerprint) = abi.decode(_encodedFunctionParams, (address, bytes, uint256, uint256, address, bytes32));
        return _payment;
    }

    function GETACCEPTRELAYCALLSTATUS594(address _from, uint256 _payment, uint256 _maxPossibleCharge) private view returns (GSNRecipientERC20FeeErrorCodes _code) {	//inject NONSTANDARD NAMING
        (uint112 _reserve0, uint112 _reserve1, uint32 _blockTimestampLast) = ethExchange.GETRESERVES408();
        uint256 _maxDaiNeeded = GETAMOUNTIN969(_maxPossibleCharge, token0IsCash ? _reserve0 : _reserve1, token0IsCash ? _reserve1 : _reserve0);
        if (_maxDaiNeeded > _payment) {
            return GSNRecipientERC20FeeErrorCodes.TX_COST_TOO_HIGH;
        }
        if (cash.BALANCEOF591(GETCREATE2WALLETADDRESS13(_from)) < _payment) {
            return GSNRecipientERC20FeeErrorCodes.INSUFFICIENT_BALANCE;
        }
        return GSNRecipientERC20FeeErrorCodes.OK;
    }

    function _PRERELAYEDCALL308(bytes memory _context) internal returns (bytes32) { }	//inject NONSTANDARD NAMING

    function _POSTRELAYEDCALL865(bytes memory _context, bool, uint256 _actualCharge, bytes32) internal {	//inject NONSTANDARD NAMING
        (address _from, uint256 _initialEth) = abi.decode(_context, (address, uint256));

        // Refund any excess ETH paid back to the wallet
        uint256 _ethPaid = address(this).balance.SUB40(_initialEth);
        uint256 _ethRefund = _ethPaid.SUB40(_actualCharge);
        (bool _success,) = address(_from).call.value(_ethRefund)("");
        require(_success);

        // Top off Relay Hub balance with whatever ETH we have
        uint256 _depositAmount = address(this).balance;
        _depositAmount = _depositAmount.MIN618(2 ether); // This is the maximum single RelayHub deposit
        IRelayHub(GETHUBADDR926()).DEPOSITFOR720.value(_depositAmount)(address(this));
    }

    function GETETHFROMWALLET659(IAugurWallet _wallet, uint256 _cashAmount) private {	//inject NONSTANDARD NAMING
        (uint112 _reserve0, uint112 _reserve1, uint32 _blockTimestampLast) = ethExchange.GETRESERVES408();
        uint256 _ethAmount = GETAMOUNTOUT26(_cashAmount, token0IsCash ? _reserve0 : _reserve1, token0IsCash ? _reserve1 : _reserve0);
        _wallet.TRANSFERCASH779(address(ethExchange), _cashAmount);
        ethExchange.SWAP401(token0IsCash ? 0 : _ethAmount, token0IsCash ? _ethAmount : 0, address(this), "");
        WETH.WITHDRAW380(_ethAmount);
    }

    // Returns whether the signer eth balance was funded as desired
    function FUNDMSGSENDER930(uint256 _desiredSignerBalance, uint256 _maxExchangeRateInDai) private returns (bool) {	//inject NONSTANDARD NAMING
        address _msgSender = address(_MSGSENDER940());
        IAugurWallet _wallet = GETWALLET775(_msgSender);
        uint256 _msgSenderBalance = _msgSender.balance;
        if (_msgSenderBalance >= _desiredSignerBalance) {
            return true;
        }
        uint256 _ethDelta = _desiredSignerBalance - _msgSenderBalance;
        (uint112 _reserve0, uint112 _reserve1, uint32 _blockTimestampLast) = ethExchange.GETRESERVES408();
        uint256 _cashAmount = GETAMOUNTIN969(_ethDelta, token0IsCash ? _reserve0 : _reserve1, token0IsCash ? _reserve1 : _reserve0);
        uint256 _exchangeRate = _cashAmount.MUL158(10**18).DIV334(_ethDelta);
        if (_maxExchangeRateInDai < _exchangeRate) {
            return false;
        }
        _wallet.TRANSFERCASH779(address(ethExchange), _cashAmount);
        ethExchange.SWAP401(token0IsCash ? 0 : _ethDelta, token0IsCash ? _ethDelta : 0, address(this), "");
        WETH.WITHDRAW380(_ethDelta);
        (bool _success,) = _msgSender.call.value(_ethDelta)("");
        return _success;
    }

    function GETAMOUNTOUT26(uint amountIn, uint reserveIn, uint reserveOut) public pure returns (uint amountOut) {	//inject NONSTANDARD NAMING
        require(amountIn > 0);
        require(reserveIn > 0 && reserveOut > 0);
        uint amountInWithFee = amountIn.MUL158(997);
        uint numerator = amountInWithFee.MUL158(reserveOut);
        uint denominator = reserveIn.MUL158(1000).ADD458(amountInWithFee);
        amountOut = numerator / denominator;
    }

    function GETAMOUNTIN969(uint amountOut, uint reserveIn, uint reserveOut) public pure returns (uint amountIn) {	//inject NONSTANDARD NAMING
        require(amountOut > 0);
        require(reserveIn > 0 && reserveOut > 0);
        uint numerator = reserveIn.MUL158(amountOut).MUL158(1000);
        uint denominator = reserveOut.SUB40(amountOut).MUL158(997);
        amountIn = (numerator / denominator).ADD458(1);
    }

    function CREATEAUGURWALLET581(address _referralAddress, bytes32 _fingerprint) private returns (IAugurWallet) {	//inject NONSTANDARD NAMING
        return augurWalletFactory.CREATEAUGURWALLET581(_MSGSENDER940(), _referralAddress, _fingerprint);
    }

    function GETCREATE2WALLETADDRESS13(address _owner) public view returns (address) {	//inject NONSTANDARD NAMING
        return augurWalletFactory.GETCREATE2WALLETADDRESS13(_owner);
    }

                                                                                                                                                                              
    function GETWALLET775(address _account) public view returns (IAugurWallet) {	//inject NONSTANDARD NAMING
        address _walletAddress = GETCREATE2WALLETADDRESS13(_account);
        if (!_walletAddress.EXISTS951()) {
            return IAugurWallet(0);
        }
        return IAugurWallet(_walletAddress);
    }

    // 1. Create a user's wallet if it does not exist
    // 2. Get funds from the wallet to compensate this contract for paying the relayer
    // 3. Execute the transaction and return success status, or revert if appropriate
    // 4. Fund the signer with ETH as specified
    function EXECUTEWALLETTRANSACTION774(address _to, bytes calldata _data, uint256 _value, uint256 _payment, address _referralAddress, bytes32 _fingerprint, uint256 _desiredSignerBalance, uint256 _maxExchangeRateInDai, bool _revertOnFailure) external {	//inject NONSTANDARD NAMING
        address _user = _MSGSENDER940();
        IAugurWallet _wallet = GETWALLET775(_user);
        if (_wallet == IAugurWallet(0)) {
            _wallet = CREATEAUGURWALLET581(_referralAddress, _fingerprint);
        }
        // If the user is having this sent via relay we need to reimburse this contract for paying the relayer. We do the payment here to avoid hard coded gas stipend problems in GSN V1
        if (_user != msg.sender) {
            GETETHFROMWALLET659(_wallet, _payment);
        }
        bool _success = _wallet.EXECUTETRANSACTION655(_to, _data, _value);
        // We need to be able to fail in order to get accurate gas estimates. We only allow this however when not using the relayhub since otherwise funds could be drained this way
        if (_user == msg.sender && _revertOnFailure) {
            require(_success, "Transaction Execution Failed");
        }
        // We keep the signing account's ETH balance funded up to an offchain provided value so it can send txs itself without the use of a relay
        bool _fundingSuccess = FUNDMSGSENDER930(_desiredSignerBalance, _maxExchangeRateInDai);
        emit EXECUTETRANSACTIONSTATUS609(_success, _fundingSuccess);
    }

    function GETRELAYMESSAGEHASH53(	//inject NONSTANDARD NAMING
        address relay,
        address from,
        address to,
        bytes memory encodedFunction,
        uint256 transactionFee,
        uint256 gasPrice,
        uint256 gasLimit,
        uint256 nonce) public view returns (bytes32) {
        bytes memory packed = abi.encodePacked("rlx:", from, to, encodedFunction, transactionFee, gasPrice, gasLimit, nonce, GETHUBADDR926());
        return keccak256(abi.encodePacked(packed, relay));
    }

    function () external payable {}
}