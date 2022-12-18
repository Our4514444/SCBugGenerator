                                                                 

pragma solidity 0.5.3;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
library SafeMath {
    function MUL151(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function DIV537(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING

        require(b > 0);
        uint256 c = a / b;

        return c;
    }

    function SUB439(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    function ADD641(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }
}

interface IERC20 {
    function TRANSFER129(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE707(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM235(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY706() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF609(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE466(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER404(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL324(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER400() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA792() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED286(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER400();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED286(address(0), msgSender);
    }

                                                                     
    function OWNER521() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER312() {	//inject NONSTANDARD NAMING
        require(ISOWNER760(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER760() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER400() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP776() public ONLYOWNER312 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED286(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP191(address newOwner) public ONLYOWNER312 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP570(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP570(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED286(_owner, newOwner);
        _owner = newOwner;
    }
}

contract ReentrancyGuard {
    bool private _notEntered;

    constructor () internal {
        // Storing an initial non-zero value makes deployment a bit more
        // expensive, but in exchange the refund on every call to nonReentrant
        // will be lower in amount. Since refunds are capped to a percetange of
        // the total transaction's gas, it is best to keep them low in cases
        // like this one, to increase the likelihood of the full refund coming
        // into effect.
        _notEntered = true;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT455() {	//inject NONSTANDARD NAMING
        // On the first call to nonReentrant, _notEntered will be true
        require(_notEntered, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _notEntered = false;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _notEntered = true;
    }
}

contract LAO is Ownable, ReentrancyGuard {
    using SafeMath for uint256;

                                                              
    uint256 public periodDuration; // default = 17280 = 4.8 hours in seconds (5 periods per day)
    uint256 public votingPeriodLength; // default = 35 periods (7 days)
    uint256 public gracePeriodLength; // default = 35 periods (7 days)
    uint256 public proposalDeposit; // default = 10 ETH (~$1,000 worth of ETH at contract deployment)
    uint256 public dilutionBound; // default = 3 - maximum multiplier a YES voter will be obligated to pay in case of mass ragequit
    uint256 public processingReward; // default = 0.1 - amount of ETH to give to whoever processes a proposal
    uint256 public summoningTime; // needed to determine the current period

    address public depositToken; // deposit token contract reference; default = wETH
                                                                                    
    uint256 constant paymentperiod809 = 90 days; // 90 days - 1 day is for test only!	//inject NONSTANDARD NAMING
    uint256 public lastPaymentTime; // this will set as 'now' in constructor = summoningTime
    address public laoFundAddress; // this field MUST be set in constructor or set to default to summoner here
    uint256 public adminFeeDenominator = 200; // initial denominator
   
    // HARD-CODED LIMITS
    // These numbers are quite arbitrary; they are small enough to avoid overflows when doing calculations
    // with periods or shares, yet big enough to not limit reasonable use cases.
    uint256 constant max_voting_period_length814 = 10**18; // maximum length of voting period	//inject NONSTANDARD NAMING
    uint256 constant max_grace_period_length273 = 10**18; // maximum length of grace period	//inject NONSTANDARD NAMING
    uint256 constant max_dilution_bound189 = 10**18; // maximum dilution bound	//inject NONSTANDARD NAMING
    uint256 constant max_number_of_shares_and_loot878 = 10**18; // maximum number of shares that can be minted	//inject NONSTANDARD NAMING
    uint256 constant max_token_whitelist_count293 = 200; // maximum number of whitelisted tokens, default is 400	//inject NONSTANDARD NAMING
    uint256 constant max_token_guildbank_count754 = 100; // maximum number of tokens with non-zero balance in guildbank, default is 200	//inject NONSTANDARD NAMING

    // ***************
    // EVENTS
    // ***************
    event SUMMONCOMPLETE487(address indexed summoner, address[] tokens, uint256 summoningTime, uint256 periodDuration, uint256 votingPeriodLength, uint256 gracePeriodLength, uint256 proposalDeposit, uint256 dilutionBound, uint256 processingReward);	//inject NONSTANDARD NAMING
    event SUBMITPROPOSAL994(address indexed applicant, uint256 sharesRequested, uint256 lootRequested, uint256 tributeOffered, address tributeToken, uint256 paymentRequested, address paymentToken, string details, bool[6] flags, uint256 proposalId, address indexed delegateKey, address indexed memberAddress);	//inject NONSTANDARD NAMING
    event SPONSORPROPOSAL635(address indexed delegateKey, address indexed memberAddress, uint256 proposalId, uint256 proposalIndex, uint256 startingPeriod);	//inject NONSTANDARD NAMING
    event SUBMITVOTE879(uint256 proposalId, uint256 indexed proposalIndex, address indexed delegateKey, address indexed memberAddress, uint8 uintVote);	//inject NONSTANDARD NAMING
    event PROCESSPROPOSAL474(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSWHITELISTPROPOSAL649(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSGUILDKICKPROPOSAL54(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event RAGEQUIT430(address indexed memberAddress, uint256 sharesToBurn, uint256 lootToBurn);	//inject NONSTANDARD NAMING
    event TOKENSCOLLECTED671(address indexed token, uint256 amountToCollect);	//inject NONSTANDARD NAMING
    event CANCELPROPOSAL976(uint256 indexed proposalId, address applicantAddress);	//inject NONSTANDARD NAMING
    event UPDATEDELEGATEKEY828(address indexed memberAddress, address newDelegateKey);	//inject NONSTANDARD NAMING
    event WITHDRAW739(address indexed memberAddress, address token, uint256 amount);	//inject NONSTANDARD NAMING

    // *******************
    // INTERNAL ACCOUNTING
    // *******************
    uint256 public proposalCount = 0; // total proposals submitted
    uint256 public totalShares = 0; // total shares across all members
    uint256 public totalLoot = 0; // total loot across all members

    uint256 public totalGuildBankTokens = 0; // total tokens with non-zero balance in guild bank

    address public constant guild133 = address(0xdead);	//inject NONSTANDARD NAMING
    address public constant escrow522 = address(0xbeef);	//inject NONSTANDARD NAMING
    address public constant total32 = address(0xbabe);	//inject NONSTANDARD NAMING
    mapping (address => mapping(address => uint256)) public userTokenBalances; // userTokenBalances[userAddress][tokenAddress]

    enum Vote {
        Null, // default value, counted as abstention
        Yes,
        No
    }

    struct Member {
        address delegateKey; // the key responsible for submitting proposals and voting - defaults to member address unless updated
        uint256 shares; // the # of voting shares assigned to this member
        uint256 loot; // the loot amount available to this member (combined with shares on ragequit)
        bool exists; // always true once a member has been created
        uint256 highestIndexYesVote; // highest proposal index # on which the member voted YES
        uint256 jailed; // set to proposalIndex of a passing guild kick proposal for this member, prevents voting on and sponsoring proposals
    }

    struct Proposal {
        address applicant; // the applicant who wishes to become a member - this key will be used for withdrawals (doubles as guild kick target for gkick proposals)
        address proposer; // the account that submitted the proposal (can be non-member)
        address sponsor; // the member that sponsored the proposal (moving it into the queue)
        uint256 sharesRequested; // the # of shares the applicant is requesting
        uint256 lootRequested; // the amount of loot the applicant is requesting
        uint256 tributeOffered; // amount of tokens offered as tribute
        address tributeToken; // tribute token contract reference
        uint256 paymentRequested; // amount of tokens requested as payment
        address paymentToken; // payment token contract reference
        uint256 startingPeriod; // the period in which voting can start for this proposal
        uint256 yesVotes; // the total number of YES votes for this proposal
        uint256 noVotes; // the total number of NO votes for this proposal
        bool[6] flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick]
        string details; // proposal details - could be IPFS hash, plaintext, or JSON
        uint256 maxTotalSharesAndLootAtYesVote; // the maximum # of total shares encountered at a yes vote on this proposal
        mapping(address => Vote) votesByMember; // the votes on this proposal by each member
    }

    mapping(address => bool) public tokenWhitelist;
    address[] public approvedTokens;

    mapping(address => bool) public proposedToWhitelist;
    mapping(address => bool) public proposedToKick;

    mapping(address => Member) public members;
    mapping(address => address) public memberAddressByDelegateKey;

    mapping(uint256 => Proposal) public proposals;

    uint256[] public proposalQueue;

    modifier ONLYMEMBER381 {	//inject NONSTANDARD NAMING
        require(members[msg.sender].shares > 0 || members[msg.sender].loot > 0, "not a member");
        _;
    }

    modifier ONLYSHAREHOLDER672 {	//inject NONSTANDARD NAMING
        require(members[msg.sender].shares > 0, "not a shareholder");
        _;
    }

    modifier ONLYDELEGATE58 {	//inject NONSTANDARD NAMING
        require(members[memberAddressByDelegateKey[msg.sender]].shares > 0, "not a delegate");
        _;
    }

    constructor(
        address _summoner,
        address[] memory _approvedTokens,
        uint256 _periodDuration,
        uint256 _votingPeriodLength,
        uint256 _gracePeriodLength,
        uint256 _proposalDeposit,
        uint256 _dilutionBound,
        uint256 _processingReward,
        address _laoFundAddress
    ) public {
        require(_summoner != address(0), "summoner cannot be 0");
        require(_periodDuration > 0, "_periodDuration cannot be 0");
        require(_votingPeriodLength > 0, "_votingPeriodLength cannot be 0");
        require(_votingPeriodLength <= max_voting_period_length814, "_votingPeriodLength exceeds limit");
        require(_gracePeriodLength <= max_grace_period_length273, "_gracePeriodLength exceeds limit");
        require(_dilutionBound > 0, "_dilutionBound cannot be 0");
        require(_dilutionBound <= max_dilution_bound189, "_dilutionBound exceeds limit");
        require(_approvedTokens.length > 0, "need at least one approved token");
        require(_approvedTokens.length <= max_token_whitelist_count293, "too many tokens");
        require(_proposalDeposit >= _processingReward, "_proposalDeposit cannot be smaller than _processingReward");
        require(_laoFundAddress != address(0), "laoFundAddress cannot be 0");
        depositToken = _approvedTokens[0];
        // NOTE: move event up here, avoid stack too deep if too many approved tokens
        emit SUMMONCOMPLETE487(_summoner, _approvedTokens, now, _periodDuration, _votingPeriodLength, _gracePeriodLength, _proposalDeposit, _dilutionBound, _processingReward);

        for (uint256 i = 0; i < _approvedTokens.length; i++) {
            require(_approvedTokens[i] != address(0), "_approvedToken cannot be 0");
            require(!tokenWhitelist[_approvedTokens[i]], "duplicate approved token");
            tokenWhitelist[_approvedTokens[i]] = true;
            approvedTokens.push(_approvedTokens[i]);
        }

        periodDuration = _periodDuration;
        votingPeriodLength = _votingPeriodLength;
        gracePeriodLength = _gracePeriodLength;
        proposalDeposit = _proposalDeposit;
        dilutionBound = _dilutionBound;
        processingReward = _processingReward;

        summoningTime = now;
        laoFundAddress = _laoFundAddress; // LAO add on for adminFee
        lastPaymentTime = now;  // LAO add on for adminFee
        members[_summoner] = Member(_summoner, 1, 0, true, 0, 0);
        memberAddressByDelegateKey[_summoner] = _summoner;
        totalShares = 1;
    }
    
                                                                                                                                                                                                                 
    // @dev Owner can change amount of adminFee and direction of funds 
    // @param adminFeeDenominator must be >= 200. Greater than 200, will equal 0.5% or less of assets  
    // @param laoFundAddress - where the Owner wants the funds to go 
    function SETADMINFEE823(uint256 _adminFeeDenominator, address _laoFundAddress) public NONREENTRANT455 ONLYOWNER312{	//inject NONSTANDARD NAMING
        require(_adminFeeDenominator >= 200);
        adminFeeDenominator = _adminFeeDenominator; 
        laoFundAddress = _laoFundAddress;
    } 
    
    function WITHDRAWADMINFEE975() public NONREENTRANT455 {	//inject NONSTANDARD NAMING
        require(now >= lastPaymentTime.ADD641(paymentperiod809), "90 days have not passed since last withdrawal");
        lastPaymentTime = lastPaymentTime.ADD641(paymentperiod809); // set it to the next payment period 
        // local variables to save gas by reading from storage only 1x
        uint256 denominator = adminFeeDenominator; 
        address recipient = laoFundAddress;
        
        for (uint256 i = 0; i < approvedTokens.length; i++) {
            address token = approvedTokens[i];
            uint256 amount = userTokenBalances[guild133][token] / denominator;
            if (amount > 0) { // otherwise skip for efficiency, only tokens with a balance
               userTokenBalances[guild133][token] -= amount;
               userTokenBalances[recipient][token] += amount;
            }
        } 
    } 
    
                                                                    
    function SUBMITPROPOSAL961(	//inject NONSTANDARD NAMING
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        string memory details
    ) public NONREENTRANT455 returns (uint256 proposalId) {
        require(sharesRequested.ADD641(lootRequested) <= max_number_of_shares_and_loot878, "too many shares requested");
        require(tokenWhitelist[tributeToken], "tributeToken is not whitelisted");
        require(tokenWhitelist[paymentToken], "payment is not whitelisted");
        require(applicant != address(0), "applicant cannot be 0");
        require(applicant != guild133 && applicant != escrow522 && applicant != total32, "applicant address cannot be reserved");
        require(members[applicant].jailed == 0, "proposal applicant must not be jailed");

        if (tributeOffered > 0 && userTokenBalances[guild133][tributeToken] == 0) {
            require(totalGuildBankTokens < max_token_guildbank_count754, 'cannot submit more tribute proposals for new tokens - guildbank is full');
        }

        // collect tribute from proposer and store it in the LAO until the proposal is processed
        require(IERC20(tributeToken).TRANSFERFROM235(msg.sender, address(this), tributeOffered), "tribute token transfer failed");
        UNSAFEADDTOBALANCE390(escrow522, tributeToken, tributeOffered);

        bool[6] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick]

        _SUBMITPROPOSAL977(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags);
        return proposalCount - 1; // return proposalId - contracts calling submit might want it
    }

    function SUBMITWHITELISTPROPOSAL772(address tokenToWhitelist, string memory details) public NONREENTRANT455 returns (uint256 proposalId) {	//inject NONSTANDARD NAMING
        require(tokenToWhitelist != address(0), "must provide token address");
        require(!tokenWhitelist[tokenToWhitelist], "cannot already have whitelisted the token");
        require(approvedTokens.length < max_token_whitelist_count293, "cannot submit more whitelist proposals");

        bool[6] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick]
        flags[4] = true; // whitelist

        _SUBMITPROPOSAL977(address(0), 0, 0, 0, tokenToWhitelist, 0, address(0), details, flags);
        return proposalCount - 1;
    }

    function SUBMITGUILDKICKPROPOSAL222(address memberToKick, string memory details) public NONREENTRANT455 returns (uint256 proposalId) {	//inject NONSTANDARD NAMING
        Member memory member = members[memberToKick];

        require(member.shares > 0 || member.loot > 0, "member must have at least one share or one loot");
        require(members[memberToKick].jailed == 0, "member must not already be jailed");

        bool[6] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick]
        flags[5] = true; // guild kick

        _SUBMITPROPOSAL977(memberToKick, 0, 0, 0, address(0), 0, address(0), details, flags);
        return proposalCount - 1;
    }

    function _SUBMITPROPOSAL977(	//inject NONSTANDARD NAMING
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        string memory details,
        bool[6] memory flags
    ) internal {
        Proposal memory proposal = Proposal({
            applicant : applicant,
            proposer : msg.sender,
            sponsor : address(0),
            sharesRequested : sharesRequested,
            lootRequested : lootRequested,
            tributeOffered : tributeOffered,
            tributeToken : tributeToken,
            paymentRequested : paymentRequested,
            paymentToken : paymentToken,
            startingPeriod : 0,
            yesVotes : 0,
            noVotes : 0,
            flags : flags,
            details : details,
            maxTotalSharesAndLootAtYesVote : 0
        });

        proposals[proposalCount] = proposal;
        address memberAddress = memberAddressByDelegateKey[msg.sender];
        // NOTE: argument order matters, avoid stack too deep
        emit SUBMITPROPOSAL994(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags, proposalCount, msg.sender, memberAddress);
        proposalCount += 1;
    }

    function SPONSORPROPOSAL724(uint256 proposalId) public NONREENTRANT455 ONLYDELEGATE58 {	//inject NONSTANDARD NAMING
        // collect proposal deposit from sponsor and store it in the LAO until the proposal is processed
        require(IERC20(depositToken).TRANSFERFROM235(msg.sender, address(this), proposalDeposit), "proposal deposit token transfer failed");
        UNSAFEADDTOBALANCE390(escrow522, depositToken, proposalDeposit);

        Proposal storage proposal = proposals[proposalId];

        require(proposal.proposer != address(0), 'proposal must have been proposed');
        require(!proposal.flags[0], "proposal has already been sponsored");
        require(!proposal.flags[3], "proposal has been cancelled");
        require(members[proposal.applicant].jailed == 0, "proposal applicant must not be jailed");

        if (proposal.tributeOffered > 0 && userTokenBalances[guild133][proposal.tributeToken] == 0) {
            require(totalGuildBankTokens < max_token_guildbank_count754, 'cannot sponsor more tribute proposals for new tokens - guildbank is full');
        }

        // whitelist proposal
        if (proposal.flags[4]) {
            require(!tokenWhitelist[address(proposal.tributeToken)], "cannot already have whitelisted the token");
            require(!proposedToWhitelist[address(proposal.tributeToken)], 'already proposed to whitelist');
            require(approvedTokens.length < max_token_whitelist_count293, "cannot sponsor more whitelist proposals");
            proposedToWhitelist[address(proposal.tributeToken)] = true;

        // guild kick proposal
        } else if (proposal.flags[5]) {
            require(!proposedToKick[proposal.applicant], 'already proposed to kick');
            proposedToKick[proposal.applicant] = true;
        }

        // compute startingPeriod for proposal
        uint256 startingPeriod = MAX914(
            GETCURRENTPERIOD364(),
            proposalQueue.length == 0 ? 0 : proposals[proposalQueue[proposalQueue.length.SUB439(1)]].startingPeriod
        ).ADD641(1);

        proposal.startingPeriod = startingPeriod;

        address memberAddress = memberAddressByDelegateKey[msg.sender];
        proposal.sponsor = memberAddress;

        proposal.flags[0] = true; // sponsored

        // append proposal to the queue
        proposalQueue.push(proposalId);
        
        emit SPONSORPROPOSAL635(msg.sender, memberAddress, proposalId, proposalQueue.length.SUB439(1), startingPeriod);
    }

    // NOTE: In MolochV2/LAO proposalIndex !== proposalId
    function SUBMITVOTE383(uint256 proposalIndex, uint8 uintVote) public NONREENTRANT455 ONLYDELEGATE58 {	//inject NONSTANDARD NAMING
        address memberAddress = memberAddressByDelegateKey[msg.sender];
        Member storage member = members[memberAddress];

        require(proposalIndex < proposalQueue.length, "proposal does not exist");
        Proposal storage proposal = proposals[proposalQueue[proposalIndex]];

        require(uintVote < 3, "must be less than 3");
        Vote vote = Vote(uintVote);

        require(GETCURRENTPERIOD364() >= proposal.startingPeriod, "voting period has not started");
        require(!HASVOTINGPERIODEXPIRED118(proposal.startingPeriod), "proposal voting period has expired");
        require(proposal.votesByMember[memberAddress] == Vote.Null, "member has already voted");
        require(vote == Vote.Yes || vote == Vote.No, "vote must be either Yes or No");

        proposal.votesByMember[memberAddress] = vote;

        if (vote == Vote.Yes) {
            proposal.yesVotes = proposal.yesVotes.ADD641(member.shares);

            // set highest index (latest) yes vote - must be processed for member to ragequit
            if (proposalIndex > member.highestIndexYesVote) {
                member.highestIndexYesVote = proposalIndex;
            }

            // set maximum of total shares encountered at a yes vote - used to bound dilution for yes voters
            if (totalShares.ADD641(totalLoot) > proposal.maxTotalSharesAndLootAtYesVote) {
                proposal.maxTotalSharesAndLootAtYesVote = totalShares.ADD641(totalLoot);
            }

        } else if (vote == Vote.No) {
            proposal.noVotes = proposal.noVotes.ADD641(member.shares);
        }
     
        // NOTE: subgraph indexes by proposalId not proposalIndex since proposalIndex isn't set untill it's been sponsored but proposal is created on submission
        emit SUBMITVOTE879(proposalQueue[proposalIndex], proposalIndex, msg.sender, memberAddress, uintVote);
    }

    function PROCESSPROPOSAL622(uint256 proposalIndex) public NONREENTRANT455 {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING221(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(!proposal.flags[4] && !proposal.flags[5], "must be a standard proposal");

        proposal.flags[1] = true; // processed

        bool didPass = _DIDPASS438(proposalIndex);

        // Make the proposal fail if the new total number of shares and loot exceeds the limit
        if (totalShares.ADD641(totalLoot).ADD641(proposal.sharesRequested).ADD641(proposal.lootRequested) > max_number_of_shares_and_loot878) {
            didPass = false;
        }

        // Make the proposal fail if it is requesting more tokens as payment than the available guild bank balance
        if (proposal.paymentRequested > userTokenBalances[guild133][proposal.paymentToken]) {
            didPass = false;
        }

        // Make the proposal fail if it would result in too many tokens with non-zero balance in guild bank
        if (proposal.tributeOffered > 0 && userTokenBalances[guild133][proposal.tributeToken] == 0 && totalGuildBankTokens >= max_token_guildbank_count754) {
           didPass = false;
        }

        // PROPOSAL PASSED
        if (didPass) {
            proposal.flags[2] = true; // didPass

            // if the applicant is already a member, add to their existing shares & loot
            if (members[proposal.applicant].exists) {
                members[proposal.applicant].shares = members[proposal.applicant].shares.ADD641(proposal.sharesRequested);
                members[proposal.applicant].loot = members[proposal.applicant].loot.ADD641(proposal.lootRequested);

            // the applicant is a new member, create a new record for them
            } else {
                // if the applicant address is already taken by a member's delegateKey, reset it to their member address
                if (members[memberAddressByDelegateKey[proposal.applicant]].exists) {
                    address memberToOverride = memberAddressByDelegateKey[proposal.applicant];
                    memberAddressByDelegateKey[memberToOverride] = memberToOverride;
                    members[memberToOverride].delegateKey = memberToOverride;
                }

                // use applicant address as delegateKey by default
                members[proposal.applicant] = Member(proposal.applicant, proposal.sharesRequested, proposal.lootRequested, true, 0, 0);
                memberAddressByDelegateKey[proposal.applicant] = proposal.applicant;
            }

            // mint new shares & loot
            totalShares = totalShares.ADD641(proposal.sharesRequested);
            totalLoot = totalLoot.ADD641(proposal.lootRequested);

            // if the proposal tribute is the first tokens of its kind to make it into the guild bank, increment total guild bank tokens
            if (userTokenBalances[guild133][proposal.tributeToken] == 0 && proposal.tributeOffered > 0) {
                totalGuildBankTokens += 1;
            }

            UNSAFEINTERNALTRANSFER431(escrow522, guild133, proposal.tributeToken, proposal.tributeOffered);
            UNSAFEINTERNALTRANSFER431(guild133, proposal.applicant, proposal.paymentToken, proposal.paymentRequested);

            // if the proposal spends 100% of guild bank balance for a token, decrement total guild bank tokens
            if (userTokenBalances[guild133][proposal.paymentToken] == 0 && proposal.paymentRequested > 0) {
                totalGuildBankTokens -= 1;
            }

        // PROPOSAL FAILED
        } else {
            // return all tokens to the proposer (not the applicant, because funds come from proposer)
            UNSAFEINTERNALTRANSFER431(escrow522, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        }

        _RETURNDEPOSIT485(proposal.sponsor);

        emit PROCESSPROPOSAL474(proposalIndex, proposalId, didPass);
    }

    function PROCESSWHITELISTPROPOSAL78(uint256 proposalIndex) public NONREENTRANT455 {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING221(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[4], "must be a whitelist proposal");

        proposal.flags[1] = true; // processed

        bool didPass = _DIDPASS438(proposalIndex);

        if (approvedTokens.length >= max_token_whitelist_count293) {
            didPass = false;
        }

        if (didPass) {
            proposal.flags[2] = true; // didPass

            tokenWhitelist[address(proposal.tributeToken)] = true;
            approvedTokens.push(proposal.tributeToken);
        }

        proposedToWhitelist[address(proposal.tributeToken)] = false;

        _RETURNDEPOSIT485(proposal.sponsor);

        emit PROCESSWHITELISTPROPOSAL649(proposalIndex, proposalId, didPass);
    }

    function PROCESSGUILDKICKPROPOSAL700(uint256 proposalIndex) public NONREENTRANT455 {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING221(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[5], "must be a guild kick proposal");

        proposal.flags[1] = true; // processed

        bool didPass = _DIDPASS438(proposalIndex);

        if (didPass) {
            proposal.flags[2] = true; // didPass
            Member storage member = members[proposal.applicant];
            member.jailed = proposalIndex;

            // transfer shares to loot
            member.loot = member.loot.ADD641(member.shares);
            totalShares = totalShares.SUB439(member.shares);
            totalLoot = totalLoot.ADD641(member.shares);
            member.shares = 0; // revoke all shares
        }

        proposedToKick[proposal.applicant] = false;

        _RETURNDEPOSIT485(proposal.sponsor);

        emit PROCESSGUILDKICKPROPOSAL54(proposalIndex, proposalId, didPass);
    }

    function _DIDPASS438(uint256 proposalIndex) internal view returns  (bool didPass) {	//inject NONSTANDARD NAMING
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];

        didPass = proposal.yesVotes > proposal.noVotes;

        // Make the proposal fail if the dilutionBound is exceeded
        if ((totalShares.ADD641(totalLoot)).MUL151(dilutionBound) < proposal.maxTotalSharesAndLootAtYesVote) {
            didPass = false;
        }

        // Make the proposal fail if the applicant is jailed
        // - for standard proposals, we don't want the applicant to get any shares/loot/payment
        // - for guild kick proposals, we should never be able to propose to kick a jailed member (or have two kick proposals active), so it doesn't matter
        if (members[proposal.applicant].jailed != 0) {
            didPass = false;
        }

        return didPass;
    }

    function _VALIDATEPROPOSALFORPROCESSING221(uint256 proposalIndex) internal view {	//inject NONSTANDARD NAMING
        require(proposalIndex < proposalQueue.length, "proposal does not exist");
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];

        require(GETCURRENTPERIOD364() >= proposal.startingPeriod.ADD641(votingPeriodLength).ADD641(gracePeriodLength), "proposal is not ready to be processed");
        require(proposal.flags[1] == false, "proposal has already been processed");
        require(proposalIndex == 0 || proposals[proposalQueue[proposalIndex.SUB439(1)]].flags[1], "previous proposal must be processed");
    }

    function _RETURNDEPOSIT485(address sponsor) internal {	//inject NONSTANDARD NAMING
        UNSAFEINTERNALTRANSFER431(escrow522, msg.sender, depositToken, processingReward);
        UNSAFEINTERNALTRANSFER431(escrow522, sponsor, depositToken, proposalDeposit.SUB439(processingReward));
    }

    function RAGEQUIT100(uint256 sharesToBurn, uint256 lootToBurn) public NONREENTRANT455 ONLYMEMBER381 {	//inject NONSTANDARD NAMING
        _RAGEQUIT979(msg.sender, sharesToBurn, lootToBurn);
    }

    function _RAGEQUIT979(address memberAddress, uint256 sharesToBurn, uint256 lootToBurn) internal {	//inject NONSTANDARD NAMING
        uint256 initialTotalSharesAndLoot = totalShares.ADD641(totalLoot);

        Member storage member = members[memberAddress];

        require(member.shares >= sharesToBurn, "insufficient shares");
        require(member.loot >= lootToBurn, "insufficient loot");

        require(CANRAGEQUIT435(member.highestIndexYesVote), "cannot ragequit until highest index proposal member voted YES on is processed");

        uint256 sharesAndLootToBurn = sharesToBurn.ADD641(lootToBurn);

        // burn shares and loot
        member.shares = member.shares.SUB439(sharesToBurn);
        member.loot = member.loot.SUB439(lootToBurn);
        totalShares = totalShares.SUB439(sharesToBurn);
        totalLoot = totalLoot.SUB439(lootToBurn);

        for (uint256 i = 0; i < approvedTokens.length; i++) {
            uint256 amountToRagequit = FAIRSHARE110(userTokenBalances[guild133][approvedTokens[i]], sharesAndLootToBurn, initialTotalSharesAndLoot);
            if (amountToRagequit > 0) { // gas optimization to allow a higher maximum token limit
                // deliberately not using safemath here to keep overflows from preventing the function execution (which would break ragekicks)
                // if a token overflows, it is because the supply was artificially inflated to oblivion, so we probably don't care about it anyways
                userTokenBalances[guild133][approvedTokens[i]] -= amountToRagequit;
                userTokenBalances[memberAddress][approvedTokens[i]] += amountToRagequit;
            }
        }

        emit RAGEQUIT430(msg.sender, sharesToBurn, lootToBurn);
    }

    function RAGEKICK135(address memberToKick) public NONREENTRANT455 {	//inject NONSTANDARD NAMING
        Member storage member = members[memberToKick];

        require(member.jailed != 0, "member must be in jail");
        require(member.loot > 0, "member must have some loot"); // note - should be impossible for jailed member to have shares
        require(CANRAGEQUIT435(member.highestIndexYesVote), "cannot ragequit until highest index proposal member voted YES on is processed");

        _RAGEQUIT979(memberToKick, 0, member.loot);
    }

    function WITHDRAWBALANCE190(address token, uint256 amount) public NONREENTRANT455 {	//inject NONSTANDARD NAMING
        _WITHDRAWBALANCE887(token, amount);
    }

    function WITHDRAWBALANCES73(address[] memory tokens, uint256[] memory amounts, bool max) public NONREENTRANT455 {	//inject NONSTANDARD NAMING
        require(tokens.length == amounts.length, "tokens and amounts arrays must be matching lengths");

        for (uint256 i=0; i < tokens.length; i++) {
            uint256 withdrawAmount = amounts[i];
            if (max) { // withdraw the maximum balance
                withdrawAmount = userTokenBalances[msg.sender][tokens[i]];
            }

            _WITHDRAWBALANCE887(tokens[i], withdrawAmount);
        }
    }
    
    function _WITHDRAWBALANCE887(address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(userTokenBalances[msg.sender][token] >= amount, "insufficient balance");
        UNSAFESUBTRACTFROMBALANCE958(msg.sender, token, amount);
        require(IERC20(token).TRANSFER129(msg.sender, amount), "transfer failed");
        emit WITHDRAW739(msg.sender, token, amount);
    }

    function COLLECTTOKENS367(address token) public ONLYDELEGATE58 NONREENTRANT455 {	//inject NONSTANDARD NAMING
        uint256 amountToCollect = IERC20(token).BALANCEOF609(address(this)).SUB439(userTokenBalances[total32][token]);
        // only collect if 1) there are tokens to collect 2) token is whitelisted 3) token has non-zero balance
        require(amountToCollect > 0, 'no tokens to collect');
        require(tokenWhitelist[token], 'token to collect must be whitelisted');
        require(userTokenBalances[guild133][token] > 0, 'token to collect must have non-zero guild bank balance');
        
        UNSAFEADDTOBALANCE390(guild133, token, amountToCollect);
        emit TOKENSCOLLECTED671(token, amountToCollect);
    }

    // NOTE: requires that delegate key which sent the original proposal cancels, msg.sender == proposal.proposer
    function CANCELPROPOSAL954(uint256 proposalId) public NONREENTRANT455 {	//inject NONSTANDARD NAMING
        Proposal storage proposal = proposals[proposalId];
        require(!proposal.flags[0], "proposal has already been sponsored");
        require(!proposal.flags[3], "proposal has already been cancelled");
        require(msg.sender == proposal.proposer, "solely the proposer can cancel");

        proposal.flags[3] = true; // cancelled
        
        UNSAFEINTERNALTRANSFER431(escrow522, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        emit CANCELPROPOSAL976(proposalId, msg.sender);
    }

    function UPDATEDELEGATEKEY686(address newDelegateKey) public NONREENTRANT455 ONLYSHAREHOLDER672 {	//inject NONSTANDARD NAMING
        require(newDelegateKey != address(0), "newDelegateKey cannot be 0");

        // skip checks if member is setting the delegate key to their member address
        if (newDelegateKey != msg.sender) {
            require(!members[newDelegateKey].exists, "cannot overwrite existing members");
            require(!members[memberAddressByDelegateKey[newDelegateKey]].exists, "cannot overwrite existing delegate keys");
        }

        Member storage member = members[msg.sender];
        memberAddressByDelegateKey[member.delegateKey] = address(0);
        memberAddressByDelegateKey[newDelegateKey] = msg.sender;
        member.delegateKey = newDelegateKey;

        emit UPDATEDELEGATEKEY828(msg.sender, newDelegateKey);
    }

    // can only ragequit if the latest proposal you voted YES on has been processed
    function CANRAGEQUIT435(uint256 highestIndexYesVote) public view returns (bool) {	//inject NONSTANDARD NAMING
        require(highestIndexYesVote < proposalQueue.length, "proposal does not exist");
        return proposals[proposalQueue[highestIndexYesVote]].flags[1];
    }

    function HASVOTINGPERIODEXPIRED118(uint256 startingPeriod) public view returns (bool) {	//inject NONSTANDARD NAMING
        return GETCURRENTPERIOD364() >= startingPeriod.ADD641(votingPeriodLength);
    }

                                                              
    function MAX914(uint256 x, uint256 y) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }

    function GETCURRENTPERIOD364() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now.SUB439(summoningTime).DIV537(periodDuration);
    }

    function GETPROPOSALQUEUELENGTH279() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return proposalQueue.length;
    }

    function GETPROPOSALFLAGS809(uint256 proposalId) public view returns (bool[6] memory) {	//inject NONSTANDARD NAMING
        return proposals[proposalId].flags;
    }

    function GETUSERTOKENBALANCE954(address user, address token) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return userTokenBalances[user][token];
    }

    function GETMEMBERPROPOSALVOTE423(address memberAddress, uint256 proposalIndex) public view returns (Vote) {	//inject NONSTANDARD NAMING
        require(members[memberAddress].exists, "member does not exist");
        require(proposalIndex < proposalQueue.length, "proposal does not exist");
        return proposals[proposalQueue[proposalIndex]].votesByMember[memberAddress];
    }

    function GETTOKENCOUNT863() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return approvedTokens.length;
    }

                                                              
    function UNSAFEADDTOBALANCE390(address user, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        userTokenBalances[user][token] += amount;
        userTokenBalances[total32][token] += amount;
    }

    function UNSAFESUBTRACTFROMBALANCE958(address user, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        userTokenBalances[user][token] -= amount;
        userTokenBalances[total32][token] -= amount;
    }

    function UNSAFEINTERNALTRANSFER431(address from, address to, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        UNSAFESUBTRACTFROMBALANCE958(from, token, amount);
        UNSAFEADDTOBALANCE390(to, token, amount);
    }

    function FAIRSHARE110(uint256 balance, uint256 shares, uint256 totalShares) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(totalShares != 0);

        if (balance == 0) { return 0; }

        uint256 prod = balance * shares;

        if (prod / balance == shares) { // no overflow in multiplication above?
            return prod / totalShares;
        }

        return (balance / totalShares) * shares;
    }
}