pragma experimental ABIEncoderV2;
pragma solidity 0.5.15;

contract IAugur {
    function CREATECHILDUNIVERSE662(bytes32 _parentPayoutDistributionHash, uint256[] memory _parentPayoutNumerators) public returns (IUniverse);	//inject NONSTANDARD NAMING
    function ISKNOWNUNIVERSE925(IUniverse _universe) public view returns (bool);	//inject NONSTANDARD NAMING
    function TRUSTEDCASHTRANSFER607(address _from, address _to, uint256 _amount) public returns (bool);	//inject NONSTANDARD NAMING
    function ISTRUSTEDSENDER150(address _address) public returns (bool);	//inject NONSTANDARD NAMING
    function ONCATEGORICALMARKETCREATED672(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, bytes32[] memory _outcomes) public returns (bool);	//inject NONSTANDARD NAMING
    function ONYESNOMARKETCREATED912(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash) public returns (bool);	//inject NONSTANDARD NAMING
    function ONSCALARMARKETCREATED978(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, int256[] memory _prices, uint256 _numTicks)  public returns (bool);	//inject NONSTANDARD NAMING
    function LOGINITIALREPORTSUBMITTED710(IUniverse _universe, address _reporter, address _market, address _initialReporter, uint256 _amountStaked, bool _isDesignatedReporter, uint256[] memory _payoutNumerators, string memory _description, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime) public returns (bool);	//inject NONSTANDARD NAMING
    function DISPUTECROWDSOURCERCREATED848(IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] memory _payoutNumerators, uint256 _size, uint256 _disputeRound) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERCONTRIBUTION318(IUniverse _universe, address _reporter, address _market, address _disputeCrowdsourcer, uint256 _amountStaked, string memory description, uint256[] memory _payoutNumerators, uint256 _currentStake, uint256 _stakeRemaining, uint256 _disputeRound) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERCOMPLETED732(IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] memory _payoutNumerators, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime, bool _pacingOn, uint256 _totalRepStakedInPayout, uint256 _totalRepStakedInMarket, uint256 _disputeRound) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGINITIALREPORTERREDEEMED105(IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] memory _payoutNumerators) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERREDEEMED101(IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] memory _payoutNumerators) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETFINALIZED741(IUniverse _universe, uint256[] memory _winningPayoutNumerators) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETMIGRATED340(IMarket _market, IUniverse _originalUniverse) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGREPORTINGPARTICIPANTDISAVOWED67(IUniverse _universe, IMarket _market) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETPARTICIPANTSDISAVOWED661(IUniverse _universe) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGCOMPLETESETSPURCHASED523(IUniverse _universe, IMarket _market, address _account, uint256 _numCompleteSets) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGCOMPLETESETSSOLD563(IUniverse _universe, IMarket _market, address _account, uint256 _numCompleteSets, uint256 _fees) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETOICHANGED926(IUniverse _universe, IMarket _market) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGTRADINGPROCEEDSCLAIMED704(IUniverse _universe, address _sender, address _market, uint256 _outcome, uint256 _numShares, uint256 _numPayoutTokens, uint256 _fees) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGUNIVERSEFORKED77(IMarket _forkingMarket) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGREPUTATIONTOKENSTRANSFERRED756(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGREPUTATIONTOKENSBURNED194(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGREPUTATIONTOKENSMINTED882(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGSHARETOKENSBALANCECHANGED74(address _account, IMarket _market, uint256 _outcome, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERTOKENSTRANSFERRED69(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERTOKENSBURNED667(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTECROWDSOURCERTOKENSMINTED339(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDISPUTEWINDOWCREATED296(IDisputeWindow _disputeWindow, uint256 _id, bool _initial) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGPARTICIPATIONTOKENSREDEEMED897(IUniverse universe, address _sender, uint256 _attoParticipationTokens, uint256 _feePayoutShare) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGTIMESTAMPSET366(uint256 _newTimestamp) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGINITIALREPORTERTRANSFERRED717(IUniverse _universe, IMarket _market, address _from, address _to) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETTRANSFERRED141(IUniverse _universe, address _from, address _to) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGPARTICIPATIONTOKENSTRANSFERRED891(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGPARTICIPATIONTOKENSBURNED109(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGPARTICIPATIONTOKENSMINTED651(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETREPBONDTRANSFERRED731(address _universe, address _from, address _to) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGWARPSYNCDATAUPDATED635(address _universe, uint256 _warpSyncHash, uint256 _marketEndTime) public returns (bool);	//inject NONSTANDARD NAMING
    function ISKNOWNFEESENDER1000(address _feeSender) public view returns (bool);	//inject NONSTANDARD NAMING
    function LOOKUP454(bytes32 _key) public view returns (address);	//inject NONSTANDARD NAMING
    function GETTIMESTAMP421() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETMAXIMUMMARKETENDDATE955() public returns (uint256);	//inject NONSTANDARD NAMING
    function ISKNOWNMARKET305(IMarket _market) public view returns (bool);	//inject NONSTANDARD NAMING
    function DERIVEPAYOUTDISTRIBUTIONHASH99(uint256[] memory _payoutNumerators, uint256 _numTicks, uint256 numOutcomes) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function LOGVALIDITYBONDCHANGED845(uint256 _validityBond) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGDESIGNATEDREPORTSTAKECHANGED138(uint256 _designatedReportStake) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGNOSHOWBONDCHANGED313(uint256 _noShowBond) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGREPORTINGFEECHANGED791(uint256 _reportingFee) public returns (bool);	//inject NONSTANDARD NAMING
    function GETUNIVERSEFORKINDEX842(IUniverse _universe) public view returns (uint256);	//inject NONSTANDARD NAMING
}

contract IAugurCreationDataGetter {
    struct MarketCreationData {
        string extraInfo;
        address marketCreator;
        bytes32[] outcomes;
        int256[] displayPrices;
        IMarket.MarketType marketType;
        uint256 recommendedTradeInterval;
    }

    function GETMARKETCREATIONDATA574(IMarket _market) public view returns (MarketCreationData memory);	//inject NONSTANDARD NAMING
}

contract IUniverseFactory {
    function CREATEUNIVERSE923(IUniverse _parentUniverse, bytes32 _parentPayoutDistributionHash, uint256[] memory _payoutNumerators) public returns (IUniverse);	//inject NONSTANDARD NAMING
}

library ContractExists {
    function EXISTS268(address _address) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint256 size;
        assembly { size := extcodesize(_address) }
        return size > 0;
    }
}

contract IOwnable {
    function GETOWNER623() public view returns (address);	//inject NONSTANDARD NAMING
    function TRANSFEROWNERSHIP400(address _newOwner) public returns (bool);	//inject NONSTANDARD NAMING
}

contract ITyped {
    function GETTYPENAME956() public view returns (bytes32);	//inject NONSTANDARD NAMING
}

contract ITime is ITyped {
    function GETTIMESTAMP421() external view returns (uint256);	//inject NONSTANDARD NAMING
}

library SafeMathUint256 {
    function MUL165(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

    function DIV536(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB85(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        return a - b;
    }

    function ADD95(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);
        return c;
    }

    function MIN991(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a <= b) {
            return a;
        } else {
            return b;
        }
    }

    function MAX908(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a >= b) {
            return a;
        } else {
            return b;
        }
    }

    function SQRT860(uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
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

    function GETUINT256MIN969() internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return 0;
    }

    function GETUINT256MAX229() internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // 2 ** 256 - 1
        return 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    }

    function ISMULTIPLEOF116(uint256 a, uint256 b) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return a % b == 0;
    }

    // Float [fixed point] Operations
    function FXPMUL90(uint256 a, uint256 b, uint256 base) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV536(MUL165(a, b), base);
    }

    function FXPDIV441(uint256 a, uint256 b, uint256 base) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV536(MUL165(a, base), b);
    }
}

interface IERC1155 {

                                                                                          
                                                                          
                                           
                                                                      
                                                                           
                                                                                                 
                                                                                                      
                                                                                                       
                                                                   
    event TRANSFERSINGLE542(	//inject NONSTANDARD NAMING
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256 id,
        uint256 value
    );

                                                                                          
                                                                          
                                          
                                                                      
                                                                           
                                                                                                 
                                                                                                      
                                                                                                      
                                                                   
    event TRANSFERBATCH96(	//inject NONSTANDARD NAMING
        address indexed operator,
        address indexed from,
        address indexed to,
        uint256[] ids,
        uint256[] values
    );

                                                   
    event APPROVALFORALL946(	//inject NONSTANDARD NAMING
        address indexed owner,
        address indexed operator,
        bool approved
    );

                                                              
                                     
                                                                                            
    event URI180(	//inject NONSTANDARD NAMING
        string value,
        uint256 indexed id
    );

                                                                                                     
                                                       
                                                                                            
                                                
                                                                                        
                                      
                                                                                                         
                                                                                       
                                                                                               
                                     
                                     
                                           
                                      
                                                                                      
    function SAFETRANSFERFROM876(	//inject NONSTANDARD NAMING
        address from,
        address to,
        uint256 id,
        uint256 value,
        bytes calldata data
    )
        external;

                                                                                                  
                                                      
                                                                                            
                                                
                                                                              
                                                                                                                 
                                      
                                                                                                         
                                                                                            
                                                                                                        
                                       
                                       
                                             
                                                      
                                                                                      
    function SAFEBATCHTRANSFERFROM466(	//inject NONSTANDARD NAMING
        address from,
        address to,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    )
        external;

                                                                                                               
                                                           
                                                                          
                                                                                   
    function SETAPPROVALFORALL567(address operator, bool approved) external;	//inject NONSTANDARD NAMING

                                                                             
                                                
                                                       
                                                                        
    function ISAPPROVEDFORALL469(address owner, address operator) external view returns (bool);	//inject NONSTANDARD NAMING

                                                       
                                                     
                                     
                                                                       
    function BALANCEOF588(address owner, uint256 id) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                
                                     
                                                                   
    function TOTALSUPPLY316(uint256 id) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                               
                                                        
                                      
                                                                        
    function BALANCEOFBATCH582(	//inject NONSTANDARD NAMING
        address[] calldata owners,
        uint256[] calldata ids
    )
        external
        view
        returns (uint256[] memory balances_);
}

contract IERC20 {
    function TOTALSUPPLY316() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF588(address owner) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER137(address to, uint256 amount) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM740(address from, address to, uint256 amount) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE179(address spender, uint256 amount) public returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE678(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING

    // solhint-disable-next-line no-simple-event-func-name
    event TRANSFER522(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL563(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract ICash is IERC20 {
}

contract IAffiliateValidator {
    function VALIDATEREFERENCE611(address _account, address _referrer) external view returns (bool);	//inject NONSTANDARD NAMING
}

contract IAffiliates {
    function SETFINGERPRINT907(bytes32 _fingerprint) external;	//inject NONSTANDARD NAMING
    function SETREFERRER497(address _referrer) external;	//inject NONSTANDARD NAMING
    function GETACCOUNTFINGERPRINT948(address _account) external returns (bytes32);	//inject NONSTANDARD NAMING
    function GETREFERRER384(address _account) external returns (address);	//inject NONSTANDARD NAMING
    function GETANDVALIDATEREFERRER947(address _account, IAffiliateValidator affiliateValidator) external returns (address);	//inject NONSTANDARD NAMING
    function AFFILIATEVALIDATORS705(address _affiliateValidator) external returns (bool);	//inject NONSTANDARD NAMING
}

contract IDisputeWindow is ITyped, IERC20 {
    function INVALIDMARKETSTOTAL551() external view returns (uint256);	//inject NONSTANDARD NAMING
    function VALIDITYBONDTOTAL411() external view returns (uint256);	//inject NONSTANDARD NAMING

    function INCORRECTDESIGNATEDREPORTTOTAL904() external view returns (uint256);	//inject NONSTANDARD NAMING
    function INITIALREPORTBONDTOTAL984() external view returns (uint256);	//inject NONSTANDARD NAMING

    function DESIGNATEDREPORTNOSHOWSTOTAL440() external view returns (uint256);	//inject NONSTANDARD NAMING
    function DESIGNATEDREPORTERNOSHOWBONDTOTAL637() external view returns (uint256);	//inject NONSTANDARD NAMING

    function INITIALIZE757(IAugur _augur, IUniverse _universe, uint256 _disputeWindowId, bool _participationTokensEnabled, uint256 _duration, uint256 _startTime) public;	//inject NONSTANDARD NAMING
    function TRUSTEDBUY603(address _buyer, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function GETUNIVERSE465() public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function GETREPUTATIONTOKEN718() public view returns (IReputationToken);	//inject NONSTANDARD NAMING
    function GETSTARTTIME853() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETENDTIME865() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETWINDOWID977() public view returns (uint256);	//inject NONSTANDARD NAMING
    function ISACTIVE622() public view returns (bool);	//inject NONSTANDARD NAMING
    function ISOVER472() public view returns (bool);	//inject NONSTANDARD NAMING
    function ONMARKETFINALIZED272() public;	//inject NONSTANDARD NAMING
    function REDEEM58(address _account) public returns (bool);	//inject NONSTANDARD NAMING
}

contract IMarket is IOwnable {
    enum MarketType {
        YES_NO,
        CATEGORICAL,
        SCALAR
    }

    function INITIALIZE757(IAugur _augur, IUniverse _universe, uint256 _endTime, uint256 _feePerCashInAttoCash, IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, address _creator, uint256 _numOutcomes, uint256 _numTicks) public;	//inject NONSTANDARD NAMING
    function DERIVEPAYOUTDISTRIBUTIONHASH99(uint256[] memory _payoutNumerators) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function DOINITIALREPORT103(uint256[] memory _payoutNumerators, string memory _description, uint256 _additionalStake) public returns (bool);	//inject NONSTANDARD NAMING
    function GETUNIVERSE465() public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function GETDISPUTEWINDOW63() public view returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETNUMBEROFOUTCOMES715() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETNUMTICKS882() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETMARKETCREATORSETTLEMENTFEEDIVISOR603() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETFORKINGMARKET324() public view returns (IMarket _market);	//inject NONSTANDARD NAMING
    function GETENDTIME865() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETWINNINGPAYOUTDISTRIBUTIONHASH959() public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETWINNINGPAYOUTNUMERATOR900(uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETWINNINGREPORTINGPARTICIPANT889() public view returns (IReportingParticipant);	//inject NONSTANDARD NAMING
    function GETREPUTATIONTOKEN718() public view returns (IV2ReputationToken);	//inject NONSTANDARD NAMING
    function GETFINALIZATIONTIME114() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETINITIALREPORTER974() public view returns (IInitialReporter);	//inject NONSTANDARD NAMING
    function GETDESIGNATEDREPORTINGENDTIME45() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETVALIDITYBONDATTOCASH188() public view returns (uint256);	//inject NONSTANDARD NAMING
    function AFFILIATEFEEDIVISOR85() external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETNUMPARTICIPANTS298() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETDISPUTEPACINGON205() public view returns (bool);	//inject NONSTANDARD NAMING
    function DERIVEMARKETCREATORFEEAMOUNT633(uint256 _amount) public view returns (uint256);	//inject NONSTANDARD NAMING
    function RECORDMARKETCREATORFEES161(uint256 _marketCreatorFees, address _sourceAccount, bytes32 _fingerprint) public returns (bool);	//inject NONSTANDARD NAMING
    function ISCONTAINERFORREPORTINGPARTICIPANT154(IReportingParticipant _reportingParticipant) public view returns (bool);	//inject NONSTANDARD NAMING
    function ISFINALIZEDASINVALID555() public view returns (bool);	//inject NONSTANDARD NAMING
    function FINALIZE450() public returns (bool);	//inject NONSTANDARD NAMING
    function ISFINALIZED222() public view returns (bool);	//inject NONSTANDARD NAMING
    function GETOPENINTEREST185() public view returns (uint256);	//inject NONSTANDARD NAMING
}

contract IReportingParticipant {
    function GETSTAKE447() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPAYOUTDISTRIBUTIONHASH553() public view returns (bytes32);	//inject NONSTANDARD NAMING
    function LIQUIDATELOSING839() public;	//inject NONSTANDARD NAMING
    function REDEEM58(address _redeemer) public returns (bool);	//inject NONSTANDARD NAMING
    function ISDISAVOWED916() public view returns (bool);	//inject NONSTANDARD NAMING
    function GETPAYOUTNUMERATOR304(uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPAYOUTNUMERATORS796() public view returns (uint256[] memory);	//inject NONSTANDARD NAMING
    function GETMARKET503() public view returns (IMarket);	//inject NONSTANDARD NAMING
    function GETSIZE962() public view returns (uint256);	//inject NONSTANDARD NAMING
}

contract IDisputeCrowdsourcer is IReportingParticipant, IERC20 {
    function INITIALIZE757(IAugur _augur, IMarket market, uint256 _size, bytes32 _payoutDistributionHash, uint256[] memory _payoutNumerators, uint256 _crowdsourcerGeneration) public;	//inject NONSTANDARD NAMING
    function CONTRIBUTE806(address _participant, uint256 _amount, bool _overload) public returns (uint256);	//inject NONSTANDARD NAMING
    function SETSIZE287(uint256 _size) public;	//inject NONSTANDARD NAMING
    function GETREMAININGTOFILL200() public view returns (uint256);	//inject NONSTANDARD NAMING
    function CORRECTSIZE4() public returns (bool);	//inject NONSTANDARD NAMING
    function GETCROWDSOURCERGENERATION673() public view returns (uint256);	//inject NONSTANDARD NAMING
}

contract IInitialReporter is IReportingParticipant, IOwnable {
    function INITIALIZE757(IAugur _augur, IMarket _market, address _designatedReporter) public;	//inject NONSTANDARD NAMING
    function REPORT802(address _reporter, bytes32 _payoutDistributionHash, uint256[] memory _payoutNumerators, uint256 _initialReportStake) public;	//inject NONSTANDARD NAMING
    function DESIGNATEDREPORTERSHOWED494() public view returns (bool);	//inject NONSTANDARD NAMING
    function INITIALREPORTERWASCORRECT565() public view returns (bool);	//inject NONSTANDARD NAMING
    function GETDESIGNATEDREPORTER518() public view returns (address);	//inject NONSTANDARD NAMING
    function GETREPORTTIMESTAMP739() public view returns (uint256);	//inject NONSTANDARD NAMING
    function MIGRATETONEWUNIVERSE438(address _designatedReporter) public;	//inject NONSTANDARD NAMING
    function RETURNREPFROMDISAVOW627() public;	//inject NONSTANDARD NAMING
}

contract IReputationToken is IERC20 {
    function MIGRATEOUTBYPAYOUT857(uint256[] memory _payoutNumerators, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function MIGRATEIN738(address _reporter, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function TRUSTEDREPORTINGPARTICIPANTTRANSFER163(address _source, address _destination, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function TRUSTEDMARKETTRANSFER634(address _source, address _destination, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function TRUSTEDUNIVERSETRANSFER390(address _source, address _destination, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function TRUSTEDDISPUTEWINDOWTRANSFER708(address _source, address _destination, uint256 _attotokens) public returns (bool);	//inject NONSTANDARD NAMING
    function GETUNIVERSE465() public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function GETTOTALMIGRATED280() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETTOTALTHEORETICALSUPPLY286() public view returns (uint256);	//inject NONSTANDARD NAMING
    function MINTFORREPORTINGPARTICIPANT907(uint256 _amountMigrated) public returns (bool);	//inject NONSTANDARD NAMING
}

contract IShareToken is ITyped, IERC1155 {
    function INITIALIZE757(IAugur _augur) external;	//inject NONSTANDARD NAMING
    function INITIALIZEMARKET384(IMarket _market, uint256 _numOutcomes, uint256 _numTicks) public;	//inject NONSTANDARD NAMING
    function UNSAFETRANSFERFROM311(address _from, address _to, uint256 _id, uint256 _value) public;	//inject NONSTANDARD NAMING
    function UNSAFEBATCHTRANSFERFROM256(address _from, address _to, uint256[] memory _ids, uint256[] memory _values) public;	//inject NONSTANDARD NAMING
    function CLAIMTRADINGPROCEEDS354(IMarket _market, address _shareHolder, bytes32 _fingerprint) external returns (uint256[] memory _outcomeFees);	//inject NONSTANDARD NAMING
    function GETMARKET503(uint256 _tokenId) external view returns (IMarket);	//inject NONSTANDARD NAMING
    function GETOUTCOME77(uint256 _tokenId) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETTOKENID49(IMarket _market, uint256 _outcome) public pure returns (uint256 _tokenId);	//inject NONSTANDARD NAMING
    function GETTOKENIDS948(IMarket _market, uint256[] memory _outcomes) public pure returns (uint256[] memory _tokenIds);	//inject NONSTANDARD NAMING
    function BUYCOMPLETESETS439(IMarket _market, address _account, uint256 _amount) external returns (bool);	//inject NONSTANDARD NAMING
    function BUYCOMPLETESETSFORTRADE395(IMarket _market, uint256 _amount, uint256 _longOutcome, address _longRecipient, address _shortRecipient) external returns (bool);	//inject NONSTANDARD NAMING
    function SELLCOMPLETESETS486(IMarket _market, address _holder, address _recipient, uint256 _amount, bytes32 _fingerprint) external returns (uint256 _creatorFee, uint256 _reportingFee);	//inject NONSTANDARD NAMING
    function SELLCOMPLETESETSFORTRADE382(IMarket _market, uint256 _outcome, uint256 _amount, address _shortParticipant, address _longParticipant, address _shortRecipient, address _longRecipient, uint256 _price, address _sourceAccount, bytes32 _fingerprint) external returns (uint256 _creatorFee, uint256 _reportingFee);	//inject NONSTANDARD NAMING
    function TOTALSUPPLYFORMARKETOUTCOME676(IMarket _market, uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOFMARKETOUTCOME598(IMarket _market, uint256 _outcome, address _account) public view returns (uint256);	//inject NONSTANDARD NAMING
    function LOWESTBALANCEOFMARKETOUTCOMES842(IMarket _market, uint256[] memory _outcomes, address _account) public view returns (uint256);	//inject NONSTANDARD NAMING
}

contract IUniverse {
    function CREATIONTIME291() external view returns (uint256);	//inject NONSTANDARD NAMING
    function MARKETBALANCE307(address) external view returns (uint256);	//inject NONSTANDARD NAMING

    function FORK659() public returns (bool);	//inject NONSTANDARD NAMING
    function UPDATEFORKVALUES890() public returns (bool);	//inject NONSTANDARD NAMING
    function GETPARENTUNIVERSE546() public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function CREATECHILDUNIVERSE662(uint256[] memory _parentPayoutNumerators) public returns (IUniverse);	//inject NONSTANDARD NAMING
    function GETCHILDUNIVERSE589(bytes32 _parentPayoutDistributionHash) public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function GETREPUTATIONTOKEN718() public view returns (IV2ReputationToken);	//inject NONSTANDARD NAMING
    function GETFORKINGMARKET324() public view returns (IMarket);	//inject NONSTANDARD NAMING
    function GETFORKENDTIME519() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETFORKREPUTATIONGOAL704() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPARENTPAYOUTDISTRIBUTIONHASH529() public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETDISPUTEROUNDDURATIONINSECONDS989(bool _initial) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCREATEDISPUTEWINDOWBYTIMESTAMP136(uint256 _timestamp, bool _initial) public returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETORCREATECURRENTDISPUTEWINDOW916(bool _initial) public returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETORCREATENEXTDISPUTEWINDOW606(bool _initial) public returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETORCREATEPREVIOUSDISPUTEWINDOW431(bool _initial) public returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETOPENINTERESTINATTOCASH379() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETTARGETREPMARKETCAPINATTOCASH279() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCACHEVALIDITYBOND297() public returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCACHEDESIGNATEDREPORTSTAKE292() public returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCACHEDESIGNATEDREPORTNOSHOWBOND347() public returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCACHEMARKETREPBOND925() public returns (uint256);	//inject NONSTANDARD NAMING
    function GETORCACHEREPORTINGFEEDIVISOR987() public returns (uint256);	//inject NONSTANDARD NAMING
    function GETDISPUTETHRESHOLDFORFORK842() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETDISPUTETHRESHOLDFORDISPUTEPACING344() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETINITIALREPORTMINVALUE714() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPAYOUTNUMERATORS796() public view returns (uint256[] memory);	//inject NONSTANDARD NAMING
    function GETREPORTINGFEEDIVISOR776() public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPAYOUTNUMERATOR304(uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETWINNINGCHILDPAYOUTNUMERATOR907(uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function ISOPENINTERESTCASH89(address) public view returns (bool);	//inject NONSTANDARD NAMING
    function ISFORKINGMARKET823() public view returns (bool);	//inject NONSTANDARD NAMING
    function GETCURRENTDISPUTEWINDOW454(bool _initial) public view returns (IDisputeWindow);	//inject NONSTANDARD NAMING
    function GETDISPUTEWINDOWSTARTTIMEANDDURATION901(uint256 _timestamp, bool _initial) public view returns (uint256, uint256);	//inject NONSTANDARD NAMING
    function ISPARENTOF873(IUniverse _shadyChild) public view returns (bool);	//inject NONSTANDARD NAMING
    function UPDATETENTATIVEWINNINGCHILDUNIVERSE197(bytes32 _parentPayoutDistributionHash) public returns (bool);	//inject NONSTANDARD NAMING
    function ISCONTAINERFORDISPUTEWINDOW483(IDisputeWindow _shadyTarget) public view returns (bool);	//inject NONSTANDARD NAMING
    function ISCONTAINERFORMARKET263(IMarket _shadyTarget) public view returns (bool);	//inject NONSTANDARD NAMING
    function ISCONTAINERFORREPORTINGPARTICIPANT154(IReportingParticipant _reportingParticipant) public view returns (bool);	//inject NONSTANDARD NAMING
    function MIGRATEMARKETOUT967(IUniverse _destinationUniverse) public returns (bool);	//inject NONSTANDARD NAMING
    function MIGRATEMARKETIN193(IMarket _market, uint256 _cashBalance, uint256 _marketOI) public returns (bool);	//inject NONSTANDARD NAMING
    function DECREMENTOPENINTEREST995(uint256 _amount) public returns (bool);	//inject NONSTANDARD NAMING
    function DECREMENTOPENINTERESTFROMMARKET691(IMarket _market) public returns (bool);	//inject NONSTANDARD NAMING
    function INCREMENTOPENINTEREST306(uint256 _amount) public returns (bool);	//inject NONSTANDARD NAMING
    function GETWINNINGCHILDUNIVERSE917() public view returns (IUniverse);	//inject NONSTANDARD NAMING
    function ISFORKING8() public view returns (bool);	//inject NONSTANDARD NAMING
    function DEPOSIT625(address _sender, uint256 _amount, address _market) public returns (bool);	//inject NONSTANDARD NAMING
    function WITHDRAW459(address _recipient, uint256 _amount, address _market) public returns (bool);	//inject NONSTANDARD NAMING
    function CREATESCALARMARKET838(uint256 _endTime, uint256 _feePerCashInAttoCash, IAffiliateValidator _affiliateValidator, uint256 _affiliateFeeDivisor, address _designatedReporterAddress, int256[] memory _prices, uint256 _numTicks, string memory _extraInfo) public returns (IMarket _newMarket);	//inject NONSTANDARD NAMING
}

contract IV2ReputationToken is IReputationToken {
    function PARENTUNIVERSE858() external returns (IUniverse);	//inject NONSTANDARD NAMING
    function BURNFORMARKET355(uint256 _amountToBurn) public returns (bool);	//inject NONSTANDARD NAMING
    function MINTFORWARPSYNC722(uint256 _amountToMint, address _target) public returns (bool);	//inject NONSTANDARD NAMING
}

library Reporting {
    uint256 private constant designated_reporting_duration_seconds81 = 1 days;	//inject NONSTANDARD NAMING
    uint256 private constant dispute_round_duration_seconds177 = 7 days;	//inject NONSTANDARD NAMING
    uint256 private constant initial_dispute_round_duration_seconds776 = 1 days;	//inject NONSTANDARD NAMING
    uint256 private constant dispute_window_buffer_seconds218 = 1 hours;	//inject NONSTANDARD NAMING
    uint256 private constant fork_duration_seconds409 = 60 days;	//inject NONSTANDARD NAMING

    uint256 private constant base_market_duration_maximum773 = 30 days; // A market of 30 day length can always be created	//inject NONSTANDARD NAMING
    uint256 private constant upgrade_cadence463 = 365 days;	//inject NONSTANDARD NAMING
    uint256 private constant initial_upgrade_timestamp153 = 1627776000; // Aug 1st 2021	//inject NONSTANDARD NAMING

    uint256 private constant initial_rep_supply437 = 11 * 10 ** 6 * 10 ** 18; // 11 Million REP	//inject NONSTANDARD NAMING

    uint256 private constant affiliate_source_cut_divisor682 = 5; // The trader gets 20% of the affiliate fee when an affiliate fee is taken	//inject NONSTANDARD NAMING

    uint256 private constant default_validity_bond240 = 10 ether; // 10 Cash (Dai)	//inject NONSTANDARD NAMING
    uint256 private constant validity_bond_floor880 = 10 ether; // 10 Cash (Dai)	//inject NONSTANDARD NAMING
    uint256 private constant default_reporting_fee_divisor471 = 10000; // .01% fees	//inject NONSTANDARD NAMING
    uint256 private constant maximum_reporting_fee_divisor279 = 10000; // Minimum .01% fees	//inject NONSTANDARD NAMING
    uint256 private constant minimum_reporting_fee_divisor943 = 3; // Maximum 33.3~% fees. Note than anything less than a value of 2 here will likely result in bugs such as divide by 0 cases.	//inject NONSTANDARD NAMING

    uint256 private constant target_invalid_markets_divisor42 = 100; // 1% of markets are expected to be invalid	//inject NONSTANDARD NAMING
    uint256 private constant target_incorrect_designated_report_markets_divisor862 = 100; // 1% of markets are expected to have an incorrect designate report	//inject NONSTANDARD NAMING
    uint256 private constant target_designated_report_no_shows_divisor623 = 20; // 5% of markets are expected to have a no show	//inject NONSTANDARD NAMING
    uint256 private constant target_rep_market_cap_multiplier475 = 5; // We multiply and divide by constants since we may want to multiply by a fractional amount	//inject NONSTANDARD NAMING

    uint256 private constant fork_threshold_divisor413 = 40; // 2.5% of the total REP supply being filled in a single dispute bond will trigger a fork	//inject NONSTANDARD NAMING
    uint256 private constant maximum_dispute_rounds503 = 20; // We ensure that after 20 rounds of disputes a fork will occur	//inject NONSTANDARD NAMING
    uint256 private constant minimum_slow_rounds284 = 8; // We ensure that at least 8 dispute rounds take DISPUTE_ROUND_DURATION_SECONDS+ seconds to complete until the next round begins	//inject NONSTANDARD NAMING

    function GETDESIGNATEDREPORTINGDURATIONSECONDS549() internal pure returns (uint256) { return designated_reporting_duration_seconds81; }	//inject NONSTANDARD NAMING
    function GETINITIALDISPUTEROUNDDURATIONSECONDS745() internal pure returns (uint256) { return initial_dispute_round_duration_seconds776; }	//inject NONSTANDARD NAMING
    function GETDISPUTEWINDOWBUFFERSECONDS802() internal pure returns (uint256) { return dispute_window_buffer_seconds218; }	//inject NONSTANDARD NAMING
    function GETDISPUTEROUNDDURATIONSECONDS197() internal pure returns (uint256) { return dispute_round_duration_seconds177; }	//inject NONSTANDARD NAMING
    function GETFORKDURATIONSECONDS532() internal pure returns (uint256) { return fork_duration_seconds409; }	//inject NONSTANDARD NAMING
    function GETBASEMARKETDURATIONMAXIMUM292() internal pure returns (uint256) { return base_market_duration_maximum773; }	//inject NONSTANDARD NAMING
    function GETUPGRADECADENCE276() internal pure returns (uint256) { return upgrade_cadence463; }	//inject NONSTANDARD NAMING
    function GETINITIALUPGRADETIMESTAMP453() internal pure returns (uint256) { return initial_upgrade_timestamp153; }	//inject NONSTANDARD NAMING
    function GETDEFAULTVALIDITYBOND1() internal pure returns (uint256) { return default_validity_bond240; }	//inject NONSTANDARD NAMING
    function GETVALIDITYBONDFLOOR50() internal pure returns (uint256) { return validity_bond_floor880; }	//inject NONSTANDARD NAMING
    function GETTARGETINVALIDMARKETSDIVISOR629() internal pure returns (uint256) { return target_invalid_markets_divisor42; }	//inject NONSTANDARD NAMING
    function GETTARGETINCORRECTDESIGNATEDREPORTMARKETSDIVISOR62() internal pure returns (uint256) { return target_incorrect_designated_report_markets_divisor862; }	//inject NONSTANDARD NAMING
    function GETTARGETDESIGNATEDREPORTNOSHOWSDIVISOR716() internal pure returns (uint256) { return target_designated_report_no_shows_divisor623; }	//inject NONSTANDARD NAMING
    function GETTARGETREPMARKETCAPMULTIPLIER971() internal pure returns (uint256) { return target_rep_market_cap_multiplier475; }	//inject NONSTANDARD NAMING
    function GETMAXIMUMREPORTINGFEEDIVISOR589() internal pure returns (uint256) { return maximum_reporting_fee_divisor279; }	//inject NONSTANDARD NAMING
    function GETMINIMUMREPORTINGFEEDIVISOR255() internal pure returns (uint256) { return minimum_reporting_fee_divisor943; }	//inject NONSTANDARD NAMING
    function GETDEFAULTREPORTINGFEEDIVISOR542() internal pure returns (uint256) { return default_reporting_fee_divisor471; }	//inject NONSTANDARD NAMING
    function GETINITIALREPSUPPLY870() internal pure returns (uint256) { return initial_rep_supply437; }	//inject NONSTANDARD NAMING
    function GETAFFILIATESOURCECUTDIVISOR162() internal pure returns (uint256) { return affiliate_source_cut_divisor682; }	//inject NONSTANDARD NAMING
    function GETFORKTHRESHOLDDIVISOR418() internal pure returns (uint256) { return fork_threshold_divisor413; }	//inject NONSTANDARD NAMING
    function GETMAXIMUMDISPUTEROUNDS562() internal pure returns (uint256) { return maximum_dispute_rounds503; }	//inject NONSTANDARD NAMING
    function GETMINIMUMSLOWROUNDS454() internal pure returns (uint256) { return minimum_slow_rounds284; }	//inject NONSTANDARD NAMING
}

contract IAugurTrading {
    function LOOKUP454(bytes32 _key) public view returns (address);	//inject NONSTANDARD NAMING
    function LOGPROFITLOSSCHANGED837(IMarket _market, address _account, uint256 _outcome, int256 _netPosition, uint256 _avgPrice, int256 _realizedProfit, int256 _frozenFunds, int256 _realizedCost) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGORDERCREATED835(IUniverse _universe, bytes32 _orderId, bytes32 _tradeGroupId) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGORDERCANCELED873(IUniverse _universe, IMarket _market, address _creator, uint256 _tokenRefund, uint256 _sharesRefund, bytes32 _orderId) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGORDERFILLED63(IUniverse _universe, address _creator, address _filler, uint256 _price, uint256 _fees, uint256 _amountFilled, bytes32 _orderId, bytes32 _tradeGroupId) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGMARKETVOLUMECHANGED299(IUniverse _universe, address _market, uint256 _volume, uint256[] memory _outcomeVolumes, uint256 _totalTrades) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGZEROXORDERFILLED703(IUniverse _universe, IMarket _market, bytes32 _orderHash, bytes32 _tradeGroupId, uint8 _orderType, address[] memory _addressData, uint256[] memory _uint256Data) public returns (bool);	//inject NONSTANDARD NAMING
    function LOGZEROXORDERCANCELED415(address _universe, address _market, address _account, uint256 _outcome, uint256 _price, uint256 _amount, uint8 _type, bytes32 _orderHash) public;	//inject NONSTANDARD NAMING
}

contract IOrders {
    function SAVEORDER835(uint256[] calldata _uints, bytes32[] calldata _bytes32s, Order.Types _type, IMarket _market, address _sender) external returns (bytes32 _orderId);	//inject NONSTANDARD NAMING
    function REMOVEORDER159(bytes32 _orderId) external returns (bool);	//inject NONSTANDARD NAMING
    function GETMARKET503(bytes32 _orderId) public view returns (IMarket);	//inject NONSTANDARD NAMING
    function GETORDERTYPE451(bytes32 _orderId) public view returns (Order.Types);	//inject NONSTANDARD NAMING
    function GETOUTCOME77(bytes32 _orderId) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETAMOUNT970(bytes32 _orderId) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPRICE284(bytes32 _orderId) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORDERCREATOR122(bytes32 _orderId) public view returns (address);	//inject NONSTANDARD NAMING
    function GETORDERSHARESESCROWED546(bytes32 _orderId) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORDERMONEYESCROWED836(bytes32 _orderId) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORDERDATAFORCANCEL857(bytes32 _orderId) public view returns (uint256, uint256, Order.Types, IMarket, uint256, address);	//inject NONSTANDARD NAMING
    function GETORDERDATAFORLOGS938(bytes32 _orderId) public view returns (Order.Types, address[] memory _addressData, uint256[] memory _uint256Data);	//inject NONSTANDARD NAMING
    function GETBETTERORDERID696(bytes32 _orderId) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETWORSEORDERID522(bytes32 _orderId) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETBESTORDERID781(Order.Types _type, IMarket _market, uint256 _outcome) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETWORSTORDERID954(Order.Types _type, IMarket _market, uint256 _outcome) public view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETLASTOUTCOMEPRICE899(IMarket _market, uint256 _outcome) public view returns (uint256);	//inject NONSTANDARD NAMING
    function GETORDERID503(Order.Types _type, IMarket _market, uint256 _amount, uint256 _price, address _sender, uint256 _blockNumber, uint256 _outcome, uint256 _moneyEscrowed, uint256 _sharesEscrowed) public pure returns (bytes32);	//inject NONSTANDARD NAMING
    function GETTOTALESCROWED923(IMarket _market) public view returns (uint256);	//inject NONSTANDARD NAMING
    function ISBETTERPRICE825(Order.Types _type, uint256 _price, bytes32 _orderId) public view returns (bool);	//inject NONSTANDARD NAMING
    function ISWORSEPRICE287(Order.Types _type, uint256 _price, bytes32 _orderId) public view returns (bool);	//inject NONSTANDARD NAMING
    function ASSERTISNOTBETTERPRICE618(Order.Types _type, uint256 _price, bytes32 _betterOrderId) public view returns (bool);	//inject NONSTANDARD NAMING
    function ASSERTISNOTWORSEPRICE186(Order.Types _type, uint256 _price, bytes32 _worseOrderId) public returns (bool);	//inject NONSTANDARD NAMING
    function RECORDFILLORDER425(bytes32 _orderId, uint256 _sharesFilled, uint256 _tokensFilled, uint256 _fill) external returns (bool);	//inject NONSTANDARD NAMING
    function SETPRICE168(IMarket _market, uint256 _outcome, uint256 _price) external returns (bool);	//inject NONSTANDARD NAMING
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

    function CREATE771(IAugur _augur, IAugurTrading _augurTrading, address _creator, uint256 _outcome, Order.Types _type, uint256 _attoshares, uint256 _price, IMarket _market, bytes32 _betterOrderId, bytes32 _worseOrderId) internal view returns (Data memory) {	//inject NONSTANDARD NAMING
        require(_outcome < _market.GETNUMBEROFOUTCOMES715(), "Order.create: Outcome is not within market range");
        require(_price != 0, "Order.create: Price may not be 0");
        require(_price < _market.GETNUMTICKS882(), "Order.create: Price is outside of market range");
        require(_attoshares > 0, "Order.create: Cannot use amount of 0");
        require(_creator != address(0), "Order.create: Creator is 0x0");

        IShareToken _shareToken = IShareToken(_augur.LOOKUP454("ShareToken"));

        return Data({
            market: _market,
            augur: _augur,
            augurTrading: _augurTrading,
            shareToken: _shareToken,
            cash: ICash(_augur.LOOKUP454("Cash")),
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

    function GETORDERID503(Order.Data memory _orderData, IOrders _orders) internal view returns (bytes32) {	//inject NONSTANDARD NAMING
        if (_orderData.id == bytes32(0)) {
            bytes32 _orderId = CALCULATEORDERID748(_orderData.orderType, _orderData.market, _orderData.amount, _orderData.price, _orderData.creator, block.number, _orderData.outcome, _orderData.moneyEscrowed, _orderData.sharesEscrowed);
            require(_orders.GETAMOUNT970(_orderId) == 0, "Order.getOrderId: New order had amount. This should not be possible");
            _orderData.id = _orderId;
        }
        return _orderData.id;
    }

    function CALCULATEORDERID748(Order.Types _type, IMarket _market, uint256 _amount, uint256 _price, address _sender, uint256 _blockNumber, uint256 _outcome, uint256 _moneyEscrowed, uint256 _sharesEscrowed) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        return sha256(abi.encodePacked(_type, _market, _amount, _price, _sender, _blockNumber, _outcome, _moneyEscrowed, _sharesEscrowed));
    }

    function GETORDERTRADINGTYPEFROMMAKERDIRECTION462(Order.TradeDirections _creatorDirection) internal pure returns (Order.Types) {	//inject NONSTANDARD NAMING
        return (_creatorDirection == Order.TradeDirections.Long) ? Order.Types.Bid : Order.Types.Ask;
    }

    function GETORDERTRADINGTYPEFROMFILLERDIRECTION508(Order.TradeDirections _fillerDirection) internal pure returns (Order.Types) {	//inject NONSTANDARD NAMING
        return (_fillerDirection == Order.TradeDirections.Long) ? Order.Types.Ask : Order.Types.Bid;
    }

    function SAVEORDER835(Order.Data memory _orderData, bytes32 _tradeGroupId, IOrders _orders) internal returns (bytes32) {	//inject NONSTANDARD NAMING
        GETORDERID503(_orderData, _orders);
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
        return _orders.SAVEORDER835(_uints, _bytes32s, _orderData.orderType, _orderData.market, _orderData.creator);
    }
}

interface IUniswapV2Pair {
    event APPROVAL563(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
    event TRANSFER522(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING

    function NAME423() external pure returns (string memory);	//inject NONSTANDARD NAMING
    function SYMBOL975() external pure returns (string memory);	//inject NONSTANDARD NAMING
    function DECIMALS162() external pure returns (uint8);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY316() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF588(address owner) external view returns (uint);	//inject NONSTANDARD NAMING
    function ALLOWANCE678(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING

    function APPROVE179(address spender, uint value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFER137(address to, uint value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM740(address from, address to, uint value) external returns (bool);	//inject NONSTANDARD NAMING

    function DOMAIN_SEPARATOR495() external view returns (bytes32);	//inject NONSTANDARD NAMING
    function PERMIT_TYPEHASH742() external pure returns (bytes32);	//inject NONSTANDARD NAMING
    function NONCES654(address owner) external view returns (uint);	//inject NONSTANDARD NAMING

    function PERMIT378(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;	//inject NONSTANDARD NAMING

    event MINT247(address indexed sender, uint amount0, uint amount1);	//inject NONSTANDARD NAMING
    event BURN146(address indexed sender, uint amount0, uint amount1, address indexed to);	//inject NONSTANDARD NAMING
    event SWAP293(	//inject NONSTANDARD NAMING
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event SYNC562(uint112 reserve0, uint112 reserve1);	//inject NONSTANDARD NAMING

    function MINIMUM_LIQUIDITY154() external pure returns (uint);	//inject NONSTANDARD NAMING
    function FACTORY173() external view returns (address);	//inject NONSTANDARD NAMING
    function TOKEN0273() external view returns (address);	//inject NONSTANDARD NAMING
    function TOKEN1336() external view returns (address);	//inject NONSTANDARD NAMING
    function GETRESERVES227() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);	//inject NONSTANDARD NAMING
    function PRICE0CUMULATIVELAST3() external view returns (uint);	//inject NONSTANDARD NAMING
    function PRICE1CUMULATIVELAST482() external view returns (uint);	//inject NONSTANDARD NAMING
    function KLAST335() external view returns (uint);	//inject NONSTANDARD NAMING

    function MINT222(address to) external returns (uint liquidity);	//inject NONSTANDARD NAMING
    function BURN852(address to) external returns (uint amount0, uint amount1);	//inject NONSTANDARD NAMING
    function SWAP363(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;	//inject NONSTANDARD NAMING
    function SKIM327(address to) external;	//inject NONSTANDARD NAMING
    function SYNC686() external;	//inject NONSTANDARD NAMING

    function INITIALIZE757(address, address) external;	//inject NONSTANDARD NAMING
}

contract Augur is IAugur, IAugurCreationDataGetter {
    using SafeMathUint256 for uint256;
    using ContractExists for address;

    enum TokenType {
        ReputationToken,
        DisputeCrowdsourcer,
        ParticipationToken
    }

    event MARKETCREATED429(IUniverse indexed universe, uint256 endTime, string extraInfo, IMarket market, address indexed marketCreator, address designatedReporter, uint256 feePerCashInAttoCash, int256[] prices, IMarket.MarketType marketType, uint256 numTicks, bytes32[] outcomes, uint256 noShowBond, uint256 timestamp);	//inject NONSTANDARD NAMING
    event INITIALREPORTSUBMITTED728(address indexed universe, address indexed reporter, address indexed market, address initialReporter, uint256 amountStaked, bool isDesignatedReporter, uint256[] payoutNumerators, string description, uint256 nextWindowStartTime, uint256 nextWindowEndTime, uint256 timestamp);	//inject NONSTANDARD NAMING
    event DISPUTECROWDSOURCERCREATED944(address indexed universe, address indexed market, address disputeCrowdsourcer, uint256[] payoutNumerators, uint256 size, uint256 disputeRound);	//inject NONSTANDARD NAMING
    event DISPUTECROWDSOURCERCONTRIBUTION933(address indexed universe, address indexed reporter, address indexed market, address disputeCrowdsourcer, uint256 amountStaked, string description, uint256[] payoutNumerators, uint256 currentStake, uint256 stakeRemaining, uint256 disputeRound, uint256 timestamp);	//inject NONSTANDARD NAMING
    event DISPUTECROWDSOURCERCOMPLETED559(address indexed universe, address indexed market, address disputeCrowdsourcer, uint256[] payoutNumerators, uint256 nextWindowStartTime, uint256 nextWindowEndTime, bool pacingOn, uint256 totalRepStakedInPayout, uint256 totalRepStakedInMarket, uint256 disputeRound, uint256 timestamp);	//inject NONSTANDARD NAMING
    event INITIALREPORTERREDEEMED200(address indexed universe, address indexed reporter, address indexed market, address initialReporter, uint256 amountRedeemed, uint256 repReceived, uint256[] payoutNumerators, uint256 timestamp);	//inject NONSTANDARD NAMING
    event DISPUTECROWDSOURCERREDEEMED76(address indexed universe, address indexed reporter, address indexed market, address disputeCrowdsourcer, uint256 amountRedeemed, uint256 repReceived, uint256[] payoutNumerators, uint256 timestamp);	//inject NONSTANDARD NAMING
    event REPORTINGPARTICIPANTDISAVOWED827(address indexed universe, address indexed market, address reportingParticipant);	//inject NONSTANDARD NAMING
    event MARKETPARTICIPANTSDISAVOWED933(address indexed universe, address indexed market);	//inject NONSTANDARD NAMING
    event MARKETFINALIZED387(address indexed universe, address indexed market, uint256 timestamp, uint256[] winningPayoutNumerators);	//inject NONSTANDARD NAMING
    event MARKETMIGRATED868(address indexed market, address indexed originalUniverse, address indexed newUniverse);	//inject NONSTANDARD NAMING
    event UNIVERSEFORKED105(address indexed universe, IMarket forkingMarket);	//inject NONSTANDARD NAMING
    event UNIVERSECREATED344(address indexed parentUniverse, address indexed childUniverse, uint256[] payoutNumerators, uint256 creationTimestamp);	//inject NONSTANDARD NAMING
    event COMPLETESETSPURCHASED694(address indexed universe, address indexed market, address indexed account, uint256 numCompleteSets, uint256 timestamp);	//inject NONSTANDARD NAMING
    event COMPLETESETSSOLD160(address indexed universe, address indexed market, address indexed account, uint256 numCompleteSets, uint256 fees, uint256 timestamp);	//inject NONSTANDARD NAMING
    event TRADINGPROCEEDSCLAIMED660(address indexed universe, address indexed sender, address market, uint256 outcome, uint256 numShares, uint256 numPayoutTokens, uint256 fees, uint256 timestamp);	//inject NONSTANDARD NAMING
    event TOKENSTRANSFERRED34(address indexed universe, address token, address indexed from, address indexed to, uint256 value, TokenType tokenType, address market);	//inject NONSTANDARD NAMING
    event TOKENSMINTED975(address indexed universe, address indexed token, address indexed target, uint256 amount, TokenType tokenType, address market, uint256 totalSupply);	//inject NONSTANDARD NAMING
    event TOKENSBURNED587(address indexed universe, address indexed token, address indexed target, uint256 amount, TokenType tokenType, address market, uint256 totalSupply);	//inject NONSTANDARD NAMING
    event TOKENBALANCECHANGED329(address indexed universe, address indexed owner, address token, TokenType tokenType, address market, uint256 balance, uint256 outcome);	//inject NONSTANDARD NAMING
    event DISPUTEWINDOWCREATED656(address indexed universe, address disputeWindow, uint256 startTime, uint256 endTime, uint256 id, bool initial);	//inject NONSTANDARD NAMING
    event INITIALREPORTERTRANSFERRED144(address indexed universe, address indexed market, address from, address to);	//inject NONSTANDARD NAMING
    event MARKETTRANSFERRED410(address indexed universe, address indexed market, address from, address to);	//inject NONSTANDARD NAMING
    event MARKETOICHANGED595(address indexed universe, address indexed market, uint256 marketOI);	//inject NONSTANDARD NAMING
    event PARTICIPATIONTOKENSREDEEMED127(address indexed universe, address indexed disputeWindow, address indexed account, uint256 attoParticipationTokens, uint256 feePayoutShare, uint256 timestamp);	//inject NONSTANDARD NAMING
    event TIMESTAMPSET893(uint256 newTimestamp);	//inject NONSTANDARD NAMING
    event VALIDITYBONDCHANGED865(address indexed universe, uint256 validityBond);	//inject NONSTANDARD NAMING
    event DESIGNATEDREPORTSTAKECHANGED418(address indexed universe, uint256 designatedReportStake);	//inject NONSTANDARD NAMING
    event NOSHOWBONDCHANGED440(address indexed universe, uint256 noShowBond);	//inject NONSTANDARD NAMING
    event REPORTINGFEECHANGED419(address indexed universe, uint256 reportingFee);	//inject NONSTANDARD NAMING
    event SHARETOKENBALANCECHANGED487(address indexed universe, address indexed account, address indexed market, uint256 outcome, uint256 balance);	//inject NONSTANDARD NAMING
    event MARKETREPBONDTRANSFERRED571(address indexed universe, address market, address from, address to);	//inject NONSTANDARD NAMING
    event WARPSYNCDATAUPDATED729(address indexed universe, uint256 warpSyncHash, uint256 marketEndTime);	//inject NONSTANDARD NAMING

    event REGISTERCONTRACT744(address contractAddress, bytes32 key);	//inject NONSTANDARD NAMING
    event FINISHDEPLOYMENT838();	//inject NONSTANDARD NAMING

    mapping(address => bool) private markets;
    mapping(address => bool) private universes;
    mapping(address => bool) private crowdsourcers;
    mapping(address => bool) private trustedSender;

    mapping(address => MarketCreationData) private marketCreationData;

    address public uploader;
    mapping(bytes32 => address) private registry;

    ITime public time;
    IUniverse public genesisUniverse;

    uint256 public forkCounter;
    mapping (address => uint256) universeForkIndex;

    uint256 public upgradeTimestamp = Reporting.GETINITIALUPGRADETIMESTAMP453();

    int256 private constant default_min_price448 = 0;	//inject NONSTANDARD NAMING
    int256 private constant default_max_price91 = 1 ether;	//inject NONSTANDARD NAMING

    uint256 constant public trade_interval_value248 = 10 ** 19; // Trade value of 10 DAI	//inject NONSTANDARD NAMING
    uint256 constant public min_trade_interval953 = 10**14; // We ignore "dust" portions of the min interval and for huge scalars have a larger min value	//inject NONSTANDARD NAMING
    uint256 constant public default_recommended_trade_interval408 = 10**17;	//inject NONSTANDARD NAMING
    uint256 private constant max_num_ticks472 = 2 ** 256 - 2;	//inject NONSTANDARD NAMING

    ICash public cash;

    modifier ONLYUPLOADER851() {	//inject NONSTANDARD NAMING
        require(msg.sender == uploader);
        _;
    }

    constructor() public {
        uploader = msg.sender;
    }

    //
    // Registry
    //

    function REGISTERCONTRACT631(bytes32 _key, address _address) public ONLYUPLOADER851 returns (bool) {	//inject NONSTANDARD NAMING
        require(registry[_key] == address(0), "Augur.registerContract: key has already been used in registry");
        require(_address.EXISTS268());
        registry[_key] = _address;
        if (_key == "ShareToken" || _key == "MarketFactory" || _key == "EthExchange") {
            trustedSender[_address] = true;
        } else if (_key == "Time") {
            time = ITime(_address);
        } else if (_key == "Cash") {
            cash = ICash(_address);
        }
        emit REGISTERCONTRACT744(_address, _key);
        return true;
    }

                                                                                                                                                                                                        
    function LOOKUP454(bytes32 _key) public view returns (address) {	//inject NONSTANDARD NAMING
        return registry[_key];
    }

    function FINISHDEPLOYMENT607() public ONLYUPLOADER851 returns (bool) {	//inject NONSTANDARD NAMING
        uploader = address(1);
        emit FINISHDEPLOYMENT838();
        return true;
    }

    //
    // Universe
    //

    function CREATEGENESISUNIVERSE47() public ONLYUPLOADER851 returns (IUniverse) {	//inject NONSTANDARD NAMING
        require(genesisUniverse == IUniverse(0));
        genesisUniverse = CREATEUNIVERSE923(IUniverse(0), bytes32(0), new uint256[](0));
        return genesisUniverse;
    }

    function CREATECHILDUNIVERSE662(bytes32 _parentPayoutDistributionHash, uint256[] memory _parentPayoutNumerators) public returns (IUniverse) {	//inject NONSTANDARD NAMING
        IUniverse _parentUniverse = GETANDVALIDATEUNIVERSE394(msg.sender);
        return CREATEUNIVERSE923(_parentUniverse, _parentPayoutDistributionHash, _parentPayoutNumerators);
    }

    function CREATEUNIVERSE923(IUniverse _parentUniverse, bytes32 _parentPayoutDistributionHash, uint256[] memory _parentPayoutNumerators) private returns (IUniverse) {	//inject NONSTANDARD NAMING
        IUniverseFactory _universeFactory = IUniverseFactory(registry["UniverseFactory"]);
        IUniverse _newUniverse = _universeFactory.CREATEUNIVERSE923(_parentUniverse, _parentPayoutDistributionHash, _parentPayoutNumerators);
        universes[address(_newUniverse)] = true;
        trustedSender[address(_newUniverse)] = true;
        emit UNIVERSECREATED344(address(_parentUniverse), address(_newUniverse), _parentPayoutNumerators, GETTIMESTAMP421());
        return _newUniverse;
    }

    function ISKNOWNUNIVERSE925(IUniverse _universe) public view returns (bool) {	//inject NONSTANDARD NAMING
        return universes[address(_universe)];
    }

    function GETUNIVERSEFORKINDEX842(IUniverse _universe) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return universeForkIndex[address(_universe)];
    }

    //
    // Crowdsourcers
    //

    function ISKNOWNCROWDSOURCER293(IDisputeCrowdsourcer _crowdsourcer) public view returns (bool) {	//inject NONSTANDARD NAMING
        return crowdsourcers[address(_crowdsourcer)];
    }

    function DISPUTECROWDSOURCERCREATED848(IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] memory _payoutNumerators, uint256 _size, uint256 _disputeRound) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.ISCONTAINERFORMARKET263(IMarket(msg.sender)));
        crowdsourcers[_disputeCrowdsourcer] = true;
        emit DISPUTECROWDSOURCERCREATED944(address(_universe), _market, _disputeCrowdsourcer, _payoutNumerators, _size, _disputeRound);
        return true;
    }

    function ISKNOWNFEESENDER1000(address _feeSender) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _feeSender == registry["ShareToken"] || markets[_feeSender];
    }

    //
    // Transfer
    //

    function TRUSTEDCASHTRANSFER607(address _from, address _to, uint256 _amount) public returns (bool) {	//inject NONSTANDARD NAMING
        require(trustedSender[msg.sender]);
        require(cash.TRANSFERFROM740(_from, _to, _amount));
        return true;
    }

    function ISTRUSTEDSENDER150(address _address) public returns (bool) {	//inject NONSTANDARD NAMING
        return trustedSender[_address];
    }

    //
    // Time
    //

                                                        
                                                         
    function GETTIMESTAMP421() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return time.GETTIMESTAMP421();
    }

    //
    // Markets
    //

    function ISKNOWNMARKET305(IMarket _market) public view returns (bool) {	//inject NONSTANDARD NAMING
        return markets[address(_market)];
    }

    function GETMAXIMUMMARKETENDDATE955() public returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 _now = GETTIMESTAMP421();
        while (_now > upgradeTimestamp) {
            upgradeTimestamp = upgradeTimestamp.ADD95(Reporting.GETUPGRADECADENCE276());
        }
        uint256 _upgradeCadenceDurationEndTime = upgradeTimestamp;
        uint256 _baseDurationEndTime = _now + Reporting.GETBASEMARKETDURATIONMAXIMUM292();
        return _baseDurationEndTime.MAX908(_upgradeCadenceDurationEndTime);
    }

    function DERIVEPAYOUTDISTRIBUTIONHASH99(uint256[] memory _payoutNumerators, uint256 _numTicks, uint256 _numOutcomes) public view returns (bytes32) {	//inject NONSTANDARD NAMING
        uint256 _sum = 0;
        // This is to force an Invalid report to be entirely payed out to Invalid
        require(_payoutNumerators[0] == 0 || _payoutNumerators[0] == _numTicks);
        require(_payoutNumerators.length == _numOutcomes, "Augur.derivePayoutDistributionHash: Malformed payout length");
        for (uint256 i = 0; i < _payoutNumerators.length; i++) {
            uint256 _value = _payoutNumerators[i];
            _sum = _sum.ADD95(_value);
        }
        require(_sum == _numTicks, "Augur.derivePayoutDistributionHash: Malformed payout sum");
        return keccak256(abi.encodePacked(_payoutNumerators));
    }

    function GETMARKETCREATIONDATA574(IMarket _market) public view returns (MarketCreationData memory) {	//inject NONSTANDARD NAMING
        return marketCreationData[address(_market)];
    }

    function GETMARKETTYPE324(IMarket _market) public view returns (IMarket.MarketType _marketType) {	//inject NONSTANDARD NAMING
        return marketCreationData[address(_market)].marketType;
    }

    function GETMARKETOUTCOMES512(IMarket _market) public view returns (bytes32[] memory _outcomes) {	//inject NONSTANDARD NAMING
        return marketCreationData[address(_market)].outcomes;
    }

    function GETMARKETRECOMMENDEDTRADEINTERVAL498(IMarket _market) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return marketCreationData[address(_market)].recommendedTradeInterval;
    }

    //
    // Logging
    //

    function ONCATEGORICALMARKETCREATED672(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, bytes32[] memory _outcomes) public returns (bool) {	//inject NONSTANDARD NAMING
        IUniverse _universe = GETANDVALIDATEUNIVERSE394(msg.sender);
        markets[address(_market)] = true;
        int256[] memory _prices = new int256[](2);
        _prices[0] = default_min_price448;
        _prices[1] = default_max_price91;
        marketCreationData[address(_market)].extraInfo = _extraInfo;
        marketCreationData[address(_market)].marketCreator = _marketCreator;
        marketCreationData[address(_market)].outcomes = _outcomes;
        marketCreationData[address(_market)].marketType = IMarket.MarketType.CATEGORICAL;
        marketCreationData[address(_market)].recommendedTradeInterval = default_recommended_trade_interval408;
        emit MARKETCREATED429(_universe, _endTime, _extraInfo, _market, _marketCreator, _designatedReporter, _feePerCashInAttoCash, _prices, IMarket.MarketType.CATEGORICAL, 100, _outcomes, _universe.GETORCACHEMARKETREPBOND925(), GETTIMESTAMP421());
        return true;
    }

    function ONYESNOMARKETCREATED912(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash) public returns (bool) {	//inject NONSTANDARD NAMING
        IUniverse _universe = GETANDVALIDATEUNIVERSE394(msg.sender);
        markets[address(_market)] = true;
        int256[] memory _prices = new int256[](2);
        _prices[0] = default_min_price448;
        _prices[1] = default_max_price91;
        marketCreationData[address(_market)].extraInfo = _extraInfo;
        marketCreationData[address(_market)].marketCreator = _marketCreator;
        marketCreationData[address(_market)].marketType = IMarket.MarketType.YES_NO;
        marketCreationData[address(_market)].recommendedTradeInterval = default_recommended_trade_interval408;
        emit MARKETCREATED429(_universe, _endTime, _extraInfo, _market, _marketCreator, _designatedReporter, _feePerCashInAttoCash, _prices, IMarket.MarketType.YES_NO, 100, new bytes32[](0), _universe.GETORCACHEMARKETREPBOND925(), GETTIMESTAMP421());
        return true;
    }

    function ONSCALARMARKETCREATED978(uint256 _endTime, string memory _extraInfo, IMarket _market, address _marketCreator, address _designatedReporter, uint256 _feePerCashInAttoCash, int256[] memory _prices, uint256 _numTicks)  public returns (bool) {	//inject NONSTANDARD NAMING
        IUniverse _universe = GETANDVALIDATEUNIVERSE394(msg.sender);
        require(_prices.length == 2);
        require(_prices[0] < _prices[1]);
        uint256 _priceRange = uint256(_prices[1] - _prices[0]);
        require(_priceRange > _numTicks);
        markets[address(_market)] = true;
        marketCreationData[address(_market)].extraInfo = _extraInfo;
        marketCreationData[address(_market)].marketCreator = _marketCreator;
        marketCreationData[address(_market)].displayPrices = _prices;
        marketCreationData[address(_market)].marketType = IMarket.MarketType.SCALAR;
        marketCreationData[address(_market)].recommendedTradeInterval = GETTRADEINTERVAL97(_priceRange, _numTicks);
        emit MARKETCREATED429(_universe, _endTime, _extraInfo, _market, _marketCreator, _designatedReporter, _feePerCashInAttoCash, _prices, IMarket.MarketType.SCALAR, _numTicks, new bytes32[](0), _universe.GETORCACHEMARKETREPBOND925(), GETTIMESTAMP421());
        return true;
    }

    function GETTRADEINTERVAL97(uint256 _displayRange, uint256 _numTicks) public pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Handle Warp Sync Market
        if (_numTicks == max_num_ticks472) {
            return min_trade_interval953;
        }
        uint256 _displayAmount = trade_interval_value248.MUL165(10**18).DIV536(_displayRange);
        uint256 _displayInterval = min_trade_interval953;
        while (_displayInterval < _displayAmount) {
            _displayInterval = _displayInterval.MUL165(10);
        }
        _displayAmount = _displayInterval;
        return _displayInterval.MUL165(_displayRange).DIV536(_numTicks).DIV536(10**18);
    }

    function LOGINITIALREPORTSUBMITTED710(IUniverse _universe, address _reporter, address _market, address _initialReporter, uint256 _amountStaked, bool _isDesignatedReporter, uint256[] memory _payoutNumerators, string memory _description, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.ISCONTAINERFORMARKET263(IMarket(msg.sender)));
        emit INITIALREPORTSUBMITTED728(address(_universe), _reporter, _market, _initialReporter, _amountStaked, _isDesignatedReporter, _payoutNumerators, _description, _nextWindowStartTime, _nextWindowEndTime, GETTIMESTAMP421());
        return true;
    }

    function LOGDISPUTECROWDSOURCERCONTRIBUTION318(IUniverse _universe, address _reporter, address _market, address _disputeCrowdsourcer, uint256 _amountStaked, string memory _description, uint256[] memory _payoutNumerators, uint256 _currentStake, uint256 _stakeRemaining, uint256 _disputeRound) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.ISCONTAINERFORMARKET263(IMarket(msg.sender)));
        emit DISPUTECROWDSOURCERCONTRIBUTION933(address(_universe), _reporter, _market, _disputeCrowdsourcer, _amountStaked, _description, _payoutNumerators, _currentStake, _stakeRemaining, _disputeRound, GETTIMESTAMP421());
        return true;
    }

    function LOGDISPUTECROWDSOURCERCOMPLETED732(IUniverse _universe, address _market, address _disputeCrowdsourcer, uint256[] memory _payoutNumerators, uint256 _nextWindowStartTime, uint256 _nextWindowEndTime, bool _pacingOn, uint256 _totalRepStakedInPayout, uint256 _totalRepStakedInMarket, uint256 _disputeRound) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.ISCONTAINERFORMARKET263(IMarket(msg.sender)));
        emit DISPUTECROWDSOURCERCOMPLETED559(address(_universe), _market, _disputeCrowdsourcer, _payoutNumerators, _nextWindowStartTime, _nextWindowEndTime, _pacingOn, _totalRepStakedInPayout, _totalRepStakedInMarket, _disputeRound, GETTIMESTAMP421());
        return true;
    }

    function LOGINITIALREPORTERREDEEMED105(IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] memory _payoutNumerators) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.ISCONTAINERFORREPORTINGPARTICIPANT154(IReportingParticipant(msg.sender)));
        emit INITIALREPORTERREDEEMED200(address(_universe), _reporter, _market, msg.sender, _amountRedeemed, _repReceived, _payoutNumerators, GETTIMESTAMP421());
        return true;
    }

    function LOGDISPUTECROWDSOURCERREDEEMED101(IUniverse _universe, address _reporter, address _market, uint256 _amountRedeemed, uint256 _repReceived, uint256[] memory _payoutNumerators) public returns (bool) {	//inject NONSTANDARD NAMING
        IDisputeCrowdsourcer _disputeCrowdsourcer = IDisputeCrowdsourcer(msg.sender);
        require(ISKNOWNCROWDSOURCER293(_disputeCrowdsourcer));
        emit DISPUTECROWDSOURCERREDEEMED76(address(_universe), _reporter, _market, address(_disputeCrowdsourcer), _amountRedeemed, _repReceived, _payoutNumerators, GETTIMESTAMP421());
        return true;
    }

    function LOGREPORTINGPARTICIPANTDISAVOWED67(IUniverse _universe, IMarket _market) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.ISCONTAINERFORREPORTINGPARTICIPANT154(IReportingParticipant(msg.sender)));
        emit REPORTINGPARTICIPANTDISAVOWED827(address(_universe), address(_market), msg.sender);
        return true;
    }

    function LOGMARKETPARTICIPANTSDISAVOWED661(IUniverse _universe) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        IMarket _market = IMarket(msg.sender);
        require(_universe.ISCONTAINERFORMARKET263(_market));
        emit MARKETPARTICIPANTSDISAVOWED933(address(_universe), address(_market));
        return true;
    }

    function LOGMARKETFINALIZED741(IUniverse _universe, uint256[] memory _winningPayoutNumerators) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        IMarket _market = IMarket(msg.sender);
        require(_universe.ISCONTAINERFORMARKET263(_market));
        emit MARKETFINALIZED387(address(_universe), address(_market), GETTIMESTAMP421(), _winningPayoutNumerators);
        return true;
    }

    function LOGMARKETMIGRATED340(IMarket _market, IUniverse _originalUniverse) public returns (bool) {	//inject NONSTANDARD NAMING
        IUniverse _newUniverse = IUniverse(msg.sender);
        require(ISKNOWNUNIVERSE925(_newUniverse));
        emit MARKETMIGRATED868(address(_market), address(_originalUniverse), address(_newUniverse));
        return true;
    }

    function LOGCOMPLETESETSPURCHASED523(IUniverse _universe, IMarket _market, address _account, uint256 _numCompleteSets) public returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == registry["ShareToken"] || (ISKNOWNUNIVERSE925(_universe) && _universe.ISOPENINTERESTCASH89(msg.sender)));
        emit COMPLETESETSPURCHASED694(address(_universe), address(_market), _account, _numCompleteSets, GETTIMESTAMP421());
        return true;
    }

    function LOGCOMPLETESETSSOLD563(IUniverse _universe, IMarket _market, address _account, uint256 _numCompleteSets, uint256 _fees) public returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == registry["ShareToken"]);
        emit COMPLETESETSSOLD160(address(_universe), address(_market), _account, _numCompleteSets, _fees, GETTIMESTAMP421());
        return true;
    }

    function LOGMARKETOICHANGED926(IUniverse _universe, IMarket _market) public returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == registry["ShareToken"]);
        emit MARKETOICHANGED595(address(_universe), address(_market), _market.GETOPENINTEREST185());
        return true;
    }

    function LOGTRADINGPROCEEDSCLAIMED704(IUniverse _universe, address _sender, address _market, uint256 _outcome, uint256 _numShares, uint256 _numPayoutTokens, uint256 _fees) public returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == registry["ShareToken"]);
        emit TRADINGPROCEEDSCLAIMED660(address(_universe), _sender, _market, _outcome, _numShares, _numPayoutTokens, _fees, GETTIMESTAMP421());
        return true;
    }

    function LOGUNIVERSEFORKED77(IMarket _forkingMarket) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(IUniverse(msg.sender)));
        forkCounter += 1;
        universeForkIndex[msg.sender] = forkCounter;
        emit UNIVERSEFORKED105(msg.sender, _forkingMarket);
        return true;
    }

    function LOGREPUTATIONTOKENSTRANSFERRED756(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.GETREPUTATIONTOKEN718() == IReputationToken(msg.sender));
        LOGTOKENSTRANSFERRED954(address(_universe), msg.sender, _from, _to, _value, TokenType.ReputationToken, address(0), _fromBalance, _toBalance, 0);
        return true;
    }

    function LOGDISPUTECROWDSOURCERTOKENSTRANSFERRED69(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool) {	//inject NONSTANDARD NAMING
        IDisputeCrowdsourcer _disputeCrowdsourcer = IDisputeCrowdsourcer(msg.sender);
        require(ISKNOWNCROWDSOURCER293(_disputeCrowdsourcer));
        LOGTOKENSTRANSFERRED954(address(_universe), msg.sender, _from, _to, _value, TokenType.DisputeCrowdsourcer, address(_disputeCrowdsourcer.GETMARKET503()), _fromBalance, _toBalance, 0);
        return true;
    }

    function LOGREPUTATIONTOKENSBURNED194(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.GETREPUTATIONTOKEN718() == IReputationToken(msg.sender));
        LOGTOKENSBURNED893(address(_universe), msg.sender, _target, _amount, TokenType.ReputationToken, address(0), _totalSupply, _balance, 0);
        return true;
    }

    function LOGREPUTATIONTOKENSMINTED882(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.GETREPUTATIONTOKEN718() == IReputationToken(msg.sender));
        LOGTOKENSMINTED407(address(_universe), msg.sender, _target, _amount, TokenType.ReputationToken, address(0), _totalSupply, _balance, 0);
        return true;
    }

    function LOGSHARETOKENSBALANCECHANGED74(address _account, IMarket _market, uint256 _outcome, uint256 _balance) public returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == registry["ShareToken"]);
        emit SHARETOKENBALANCECHANGED487(address(_market.GETUNIVERSE465()), _account, address(_market), _outcome, _balance);
        return true;
    }

    function LOGDISPUTECROWDSOURCERTOKENSBURNED667(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool) {	//inject NONSTANDARD NAMING
        IDisputeCrowdsourcer _disputeCrowdsourcer = IDisputeCrowdsourcer(msg.sender);
        require(ISKNOWNCROWDSOURCER293(_disputeCrowdsourcer));
        LOGTOKENSBURNED893(address(_universe), msg.sender, _target, _amount, TokenType.DisputeCrowdsourcer, address(_disputeCrowdsourcer.GETMARKET503()), _totalSupply, _balance, 0);
        return true;
    }

    function LOGDISPUTECROWDSOURCERTOKENSMINTED339(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool) {	//inject NONSTANDARD NAMING
        IDisputeCrowdsourcer _disputeCrowdsourcer = IDisputeCrowdsourcer(msg.sender);
        require(ISKNOWNCROWDSOURCER293(_disputeCrowdsourcer));
        LOGTOKENSMINTED407(address(_universe), msg.sender, _target, _amount, TokenType.DisputeCrowdsourcer, address(_disputeCrowdsourcer.GETMARKET503()), _totalSupply, _balance, 0);
        return true;
    }

    function LOGDISPUTEWINDOWCREATED296(IDisputeWindow _disputeWindow, uint256 _id, bool _initial) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(IUniverse(msg.sender)));
        emit DISPUTEWINDOWCREATED656(msg.sender, address(_disputeWindow), _disputeWindow.GETSTARTTIME853(), _disputeWindow.GETENDTIME865(), _id, _initial);
        return true;
    }

    function LOGPARTICIPATIONTOKENSREDEEMED897(IUniverse _universe, address _account, uint256 _attoParticipationTokens, uint256 _feePayoutShare) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.ISCONTAINERFORDISPUTEWINDOW483(IDisputeWindow(msg.sender)));
        emit PARTICIPATIONTOKENSREDEEMED127(address(_universe), msg.sender, _account, _attoParticipationTokens, _feePayoutShare, GETTIMESTAMP421());
        return true;
    }

    function LOGTIMESTAMPSET366(uint256 _newTimestamp) public returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == registry["Time"]);
        emit TIMESTAMPSET893(_newTimestamp);
        return true;
    }

    function LOGINITIALREPORTERTRANSFERRED717(IUniverse _universe, IMarket _market, address _from, address _to) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.ISCONTAINERFORMARKET263(_market));
        require(msg.sender == address(_market.GETINITIALREPORTER974()));
        emit INITIALREPORTERTRANSFERRED144(address(_universe), address(_market), _from, _to);
        return true;
    }

    function LOGMARKETTRANSFERRED141(IUniverse _universe, address _from, address _to) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        IMarket _market = IMarket(msg.sender);
        require(_universe.ISCONTAINERFORMARKET263(_market));
        emit MARKETTRANSFERRED410(address(_universe), address(_market), _from, _to);
        return true;
    }

    function LOGPARTICIPATIONTOKENSTRANSFERRED891(IUniverse _universe, address _from, address _to, uint256 _value, uint256 _fromBalance, uint256 _toBalance) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.ISCONTAINERFORDISPUTEWINDOW483(IDisputeWindow(msg.sender)));
        LOGTOKENSTRANSFERRED954(address(_universe), msg.sender, _from, _to, _value, TokenType.ParticipationToken, address(0), _fromBalance, _toBalance, 0);
        return true;
    }

    function LOGPARTICIPATIONTOKENSBURNED109(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.ISCONTAINERFORDISPUTEWINDOW483(IDisputeWindow(msg.sender)));
        LOGTOKENSBURNED893(address(_universe), msg.sender, _target, _amount, TokenType.ParticipationToken, address(0), _totalSupply, _balance, 0);
        return true;
    }

    function LOGPARTICIPATIONTOKENSMINTED651(IUniverse _universe, address _target, uint256 _amount, uint256 _totalSupply, uint256 _balance) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNUNIVERSE925(_universe));
        require(_universe.ISCONTAINERFORDISPUTEWINDOW483(IDisputeWindow(msg.sender)));
        LOGTOKENSMINTED407(address(_universe), msg.sender, _target, _amount, TokenType.ParticipationToken, address(0), _totalSupply, _balance, 0);
        return true;
    }

    function LOGTOKENSTRANSFERRED954(address _universe, address _token, address _from, address _to, uint256 _amount, TokenType _tokenType, address _market, uint256 _fromBalance, uint256 _toBalance, uint256 _outcome) private returns (bool) {	//inject NONSTANDARD NAMING
        emit TOKENSTRANSFERRED34(_universe, _token, _from, _to, _amount, _tokenType, _market);
        emit TOKENBALANCECHANGED329(_universe, _from, _token, _tokenType, _market, _fromBalance, _outcome);
        emit TOKENBALANCECHANGED329(_universe, _to, _token, _tokenType, _market, _toBalance, _outcome);
        return true;
    }

    function LOGTOKENSBURNED893(address _universe, address _token, address _target, uint256 _amount, TokenType _tokenType, address _market, uint256 _totalSupply, uint256 _balance, uint256 _outcome) private returns (bool) {	//inject NONSTANDARD NAMING
        emit TOKENSBURNED587(_universe, _token, _target, _amount, _tokenType, _market, _totalSupply);
        emit TOKENBALANCECHANGED329(_universe, _target, _token, _tokenType, _market, _balance, _outcome);
        return true;
    }

    function LOGTOKENSMINTED407(address _universe, address _token, address _target, uint256 _amount, TokenType _tokenType, address _market, uint256 _totalSupply, uint256 _balance, uint256 _outcome) private returns (bool) {	//inject NONSTANDARD NAMING
        emit TOKENSMINTED975(_universe, _token, _target, _amount, _tokenType, _market, _totalSupply);
        emit TOKENBALANCECHANGED329(_universe, _target, _token, _tokenType, _market, _balance, _outcome);
        return true;
    }

    function LOGVALIDITYBONDCHANGED845(uint256 _validityBond) public returns (bool) {	//inject NONSTANDARD NAMING
        IUniverse _universe = GETANDVALIDATEUNIVERSE394(msg.sender);
        emit VALIDITYBONDCHANGED865(address(_universe), _validityBond);
        return true;
    }

    function LOGDESIGNATEDREPORTSTAKECHANGED138(uint256 _designatedReportStake) public returns (bool) {	//inject NONSTANDARD NAMING
        IUniverse _universe = GETANDVALIDATEUNIVERSE394(msg.sender);
        emit DESIGNATEDREPORTSTAKECHANGED418(address(_universe), _designatedReportStake);
        return true;
    }

    function LOGNOSHOWBONDCHANGED313(uint256 _noShowBond) public returns (bool) {	//inject NONSTANDARD NAMING
        IUniverse _universe = GETANDVALIDATEUNIVERSE394(msg.sender);
        emit NOSHOWBONDCHANGED440(address(_universe), _noShowBond);
        return true;
    }

    function LOGREPORTINGFEECHANGED791(uint256 _reportingFee) public returns (bool) {	//inject NONSTANDARD NAMING
        IUniverse _universe = GETANDVALIDATEUNIVERSE394(msg.sender);
        emit REPORTINGFEECHANGED419(address(_universe), _reportingFee);
        return true;
    }

    function LOGMARKETREPBONDTRANSFERRED731(address _universe, address _from, address _to) public returns (bool) {	//inject NONSTANDARD NAMING
        require(ISKNOWNMARKET305(IMarket(msg.sender)));
        emit MARKETREPBONDTRANSFERRED571(_universe, msg.sender, _from, _to);
    }

    function LOGWARPSYNCDATAUPDATED635(address _universe, uint256 _warpSyncHash, uint256 _marketEndTime) public returns (bool) {	//inject NONSTANDARD NAMING
        require(msg.sender == registry["WarpSync"]);
        emit WARPSYNCDATAUPDATED729(_universe, _warpSyncHash, _marketEndTime);
    }

    function GETANDVALIDATEUNIVERSE394(address _untrustedUniverse) internal view returns (IUniverse) {	//inject NONSTANDARD NAMING
        IUniverse _universe = IUniverse(_untrustedUniverse);
        require(ISKNOWNUNIVERSE925(_universe));
        return _universe;
    }
}