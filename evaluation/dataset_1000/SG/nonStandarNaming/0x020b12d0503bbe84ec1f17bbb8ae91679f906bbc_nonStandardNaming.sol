                                                                 

pragma solidity 0.5.17;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                                    
    function ADD415(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB185(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB185(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB185(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                                
    function MUL370(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV926(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV926(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV926(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MOD949(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD949(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function MOD949(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY91() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF256(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER364(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE584(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE751(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM810(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER858(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL914(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _not_entered945 = 1;	//inject NONSTANDARD NAMING
    uint256 private constant _entered945 = 2;	//inject NONSTANDARD NAMING

    uint256 private _status;

    constructor () internal {
        _status = _not_entered945;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT833() {	//inject NONSTANDARD NAMING
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _entered945, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _entered945;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _not_entered945;
    }
}

contract Moloch is ReentrancyGuard {
    using SafeMath for uint256;

                                                              
    uint256 public periodDuration; // default = 17280 = 4.8 hours in seconds (5 periods per day)
    uint256 public votingPeriodLength; // default = 35 periods (7 days)
    uint256 public gracePeriodLength; // default = 35 periods (7 days)
    uint256 public proposalDeposit; // default = 10 ETH (~$1,000 worth of ETH at contract deployment)
    uint256 public dilutionBound; // default = 3 - maximum multiplier a YES voter will be obligated to pay in case of mass ragequit
    uint256 public processingReward; // default = 0.1 - amount of ETH to give to whoever processes a proposal
    uint256 public summoningTime; // needed to determine the current period
    
    address public depositToken; // deposit token contract reference; default = wETH

    // HARD-CODED LIMITS
    // These numbers are quite arbitrary; they are small enough to avoid overflows when doing calculations
    // with periods or shares, yet big enough to not limit reasonable use cases.
    uint256 constant max_voting_period_length373 = 10**18; // maximum length of voting period	//inject NONSTANDARD NAMING
    uint256 constant max_grace_period_length875 = 10**18; // maximum length of grace period	//inject NONSTANDARD NAMING
    uint256 constant max_dilution_bound712 = 10**18; // maximum dilution bound	//inject NONSTANDARD NAMING
    uint256 constant max_number_of_shares_and_loot131 = 10**18; // maximum number of shares that can be minted	//inject NONSTANDARD NAMING
    uint256 constant max_token_whitelist_count560 = 400; // maximum number of whitelisted tokens	//inject NONSTANDARD NAMING
    uint256 constant max_token_guildbank_count798 = 200; // maximum number of tokens with non-zero balance in guildbank	//inject NONSTANDARD NAMING

    // ***************
    // EVENTS
    // ***************
    event SUMMONCOMPLETE39(address[] indexed summoners, address[] tokens, uint256 summoningTime, uint256 periodDuration, uint256 votingPeriodLength, uint256 gracePeriodLength, uint256 proposalDeposit, uint256 dilutionBound, uint256 processingReward);	//inject NONSTANDARD NAMING
    event SUBMITPROPOSAL593(address indexed applicant, uint256 sharesRequested, uint256 lootRequested, uint256 tributeOffered, address tributeToken, uint256 paymentRequested, address paymentToken, string details, bool[6] flags, uint256 proposalId, address indexed delegateKey, address indexed memberAddress);	//inject NONSTANDARD NAMING
    event SPONSORPROPOSAL965(address indexed delegateKey, address indexed memberAddress, uint256 proposalId, uint256 proposalIndex, uint256 startingPeriod);	//inject NONSTANDARD NAMING
    event SUBMITVOTE426(uint256 proposalId, uint256 indexed proposalIndex, address indexed delegateKey, address indexed memberAddress, uint8 uintVote);	//inject NONSTANDARD NAMING
    event PROCESSPROPOSAL404(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSWHITELISTPROPOSAL798(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSGUILDKICKPROPOSAL258(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event RAGEQUIT159(address indexed memberAddress, uint256 sharesToBurn, uint256 lootToBurn);	//inject NONSTANDARD NAMING
    event TOKENSCOLLECTED963(address indexed token, uint256 amountToCollect);	//inject NONSTANDARD NAMING
    event CANCELPROPOSAL265(uint256 indexed proposalId, address applicantAddress);	//inject NONSTANDARD NAMING
    event UPDATEDELEGATEKEY837(address indexed memberAddress, address newDelegateKey);	//inject NONSTANDARD NAMING
    event WITHDRAW164(address indexed memberAddress, address token, uint256 amount);	//inject NONSTANDARD NAMING

    // *******************
    // INTERNAL ACCOUNTING
    // *******************
    uint256 public proposalCount = 0; // total proposals submitted
    uint256 public totalShares = 0; // total shares across all members
    uint256 public totalLoot = 0; // total loot across all members
    uint256 public totalGuildBankTokens = 0; // total tokens with non-zero balance in guild bank

    address public constant guild671 = address(0xdead);	//inject NONSTANDARD NAMING
    address public constant escrow236 = address(0xbeef);	//inject NONSTANDARD NAMING
    address public constant total228 = address(0xbabe);	//inject NONSTANDARD NAMING
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

    modifier ONLYMEMBER65 {	//inject NONSTANDARD NAMING
        require(members[msg.sender].shares > 0 || members[msg.sender].loot > 0, "not a member");
        _;
    }

    modifier ONLYSHAREHOLDER490 {	//inject NONSTANDARD NAMING
        require(members[msg.sender].shares > 0, "not a shareholder");
        _;
    }

    modifier ONLYDELEGATE381 {	//inject NONSTANDARD NAMING
        require(members[memberAddressByDelegateKey[msg.sender]].shares > 0, "not a delegate");
        _;
    }

    constructor(
        address[] memory _summoners,
        address[] memory _approvedTokens,
        uint256 _periodDuration,
        uint256 _votingPeriodLength,
        uint256 _gracePeriodLength,
        uint256 _proposalDeposit,
        uint256 _dilutionBound,
        uint256 _processingReward
    ) public {
        require(_periodDuration > 0, "_periodDuration cannot be 0");
        require(_votingPeriodLength > 0, "_votingPeriodLength cannot be 0");
        require(_votingPeriodLength <= max_voting_period_length373, "_votingPeriodLength exceeds limit");
        require(_gracePeriodLength <= max_grace_period_length875, "_gracePeriodLength exceeds limit");
        require(_dilutionBound > 0, "_dilutionBound cannot be 0");
        require(_dilutionBound <= max_dilution_bound712, "_dilutionBound exceeds limit");
        require(_approvedTokens.length > 0, "need at least one approved token");
        require(_approvedTokens.length <= max_token_whitelist_count560, "too many tokens");
        require(_proposalDeposit >= _processingReward, "_proposalDeposit cannot be smaller than _processingReward");
        
        depositToken = _approvedTokens[0];
        // NOTE: move event up here, avoid stack too deep if too many approved tokens
        emit SUMMONCOMPLETE39(_summoners, _approvedTokens, now, _periodDuration, _votingPeriodLength, _gracePeriodLength, _proposalDeposit, _dilutionBound, _processingReward);
        
        for (uint256 i = 0; i < _summoners.length; i++) {
            require(_summoners[i] != address(0), "summoner cannot be 0");
            members[_summoners[i]] = Member(_summoners[i], 1, 0, true, 0, 0);
            memberAddressByDelegateKey[_summoners[i]] = _summoners[i];
        }

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
        totalShares = _summoners.length;
    }

                                                                    
    function SUBMITPROPOSAL854(	//inject NONSTANDARD NAMING
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        string memory details
    ) public NONREENTRANT833 returns (uint256 proposalId) {
        require(sharesRequested.ADD415(lootRequested) <= max_number_of_shares_and_loot131, "too many shares requested");
        require(tokenWhitelist[tributeToken], "tributeToken is not whitelisted");
        require(tokenWhitelist[paymentToken], "payment is not whitelisted");
        require(applicant != address(0), "applicant cannot be 0");
        require(applicant != guild671 && applicant != escrow236 && applicant != total228, "applicant address cannot be reserved");
        require(members[applicant].jailed == 0, "proposal applicant must not be jailed");

        if (tributeOffered > 0 && userTokenBalances[guild671][tributeToken] == 0) {
            require(totalGuildBankTokens < max_token_guildbank_count798, 'cannot submit more tribute proposals for new tokens - guildbank is full');
        }

        // collect tribute from proposer and store it in the Moloch until the proposal is processed
        require(IERC20(tributeToken).TRANSFERFROM810(msg.sender, address(this), tributeOffered), "tribute token transfer failed");
        UNSAFEADDTOBALANCE519(escrow236, tributeToken, tributeOffered);

        bool[6] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick]

        _SUBMITPROPOSAL779(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags);
        return proposalCount - 1; // return proposalId - contracts calling submit might want it
    }

    function SUBMITWHITELISTPROPOSAL287(address tokenToWhitelist, string memory details) public NONREENTRANT833 returns (uint256 proposalId) {	//inject NONSTANDARD NAMING
        require(tokenToWhitelist != address(0), "must provide token address");
        require(!tokenWhitelist[tokenToWhitelist], "cannot already have whitelisted the token");
        require(approvedTokens.length < max_token_whitelist_count560, "cannot submit more whitelist proposals");

        bool[6] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick]
        flags[4] = true; // whitelist

        _SUBMITPROPOSAL779(address(0), 0, 0, 0, tokenToWhitelist, 0, address(0), details, flags);
        return proposalCount - 1;
    }

    function SUBMITGUILDKICKPROPOSAL783(address memberToKick, string memory details) public NONREENTRANT833 returns (uint256 proposalId) {	//inject NONSTANDARD NAMING
        Member memory member = members[memberToKick];

        require(member.shares > 0 || member.loot > 0, "member must have at least one share or one loot");
        require(members[memberToKick].jailed == 0, "member must not already be jailed");

        bool[6] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick]
        flags[5] = true; // guild kick

        _SUBMITPROPOSAL779(memberToKick, 0, 0, 0, address(0), 0, address(0), details, flags);
        return proposalCount - 1;
    }

    function _SUBMITPROPOSAL779(	//inject NONSTANDARD NAMING
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
        emit SUBMITPROPOSAL593(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags, proposalCount, msg.sender, memberAddress);
        proposalCount += 1;
    }

    function SPONSORPROPOSAL142(uint256 proposalId) public NONREENTRANT833 ONLYDELEGATE381 {	//inject NONSTANDARD NAMING
        // collect proposal deposit from sponsor and store it in the Moloch until the proposal is processed
        require(IERC20(depositToken).TRANSFERFROM810(msg.sender, address(this), proposalDeposit), "proposal deposit token transfer failed");
        UNSAFEADDTOBALANCE519(escrow236, depositToken, proposalDeposit);

        Proposal storage proposal = proposals[proposalId];

        require(proposal.proposer != address(0), 'proposal must have been proposed');
        require(!proposal.flags[0], "proposal has already been sponsored");
        require(!proposal.flags[3], "proposal has been cancelled");
        require(members[proposal.applicant].jailed == 0, "proposal applicant must not be jailed");

        if (proposal.tributeOffered > 0 && userTokenBalances[guild671][proposal.tributeToken] == 0) {
            require(totalGuildBankTokens < max_token_guildbank_count798, 'cannot sponsor more tribute proposals for new tokens - guildbank is full');
        }

        // whitelist proposal
        if (proposal.flags[4]) {
            require(!tokenWhitelist[address(proposal.tributeToken)], "cannot already have whitelisted the token");
            require(!proposedToWhitelist[address(proposal.tributeToken)], 'already proposed to whitelist');
            require(approvedTokens.length < max_token_whitelist_count560, "cannot sponsor more whitelist proposals");
            proposedToWhitelist[address(proposal.tributeToken)] = true;

        // guild kick proposal
        } else if (proposal.flags[5]) {
            require(!proposedToKick[proposal.applicant], 'already proposed to kick');
            proposedToKick[proposal.applicant] = true;
        }

        // compute startingPeriod for proposal
        uint256 startingPeriod = MAX311(
            GETCURRENTPERIOD672(),
            proposalQueue.length == 0 ? 0 : proposals[proposalQueue[proposalQueue.length.SUB185(1)]].startingPeriod
        ).ADD415(1);

        proposal.startingPeriod = startingPeriod;

        address memberAddress = memberAddressByDelegateKey[msg.sender];
        proposal.sponsor = memberAddress;

        proposal.flags[0] = true; // sponsored

        // append proposal to the queue
        proposalQueue.push(proposalId);
        
        emit SPONSORPROPOSAL965(msg.sender, memberAddress, proposalId, proposalQueue.length.SUB185(1), startingPeriod);
    }

    // NOTE: In MolochV2 proposalIndex !== proposalId
    function SUBMITVOTE95(uint256 proposalIndex, uint8 uintVote) public NONREENTRANT833 ONLYDELEGATE381 {	//inject NONSTANDARD NAMING
        address memberAddress = memberAddressByDelegateKey[msg.sender];
        Member storage member = members[memberAddress];

        require(proposalIndex < proposalQueue.length, "proposal does not exist");
        Proposal storage proposal = proposals[proposalQueue[proposalIndex]];

        require(uintVote < 3, "must be less than 3");
        Vote vote = Vote(uintVote);

        require(GETCURRENTPERIOD672() >= proposal.startingPeriod, "voting period has not started");
        require(!HASVOTINGPERIODEXPIRED892(proposal.startingPeriod), "proposal voting period has expired");
        require(proposal.votesByMember[memberAddress] == Vote.Null, "member has already voted");
        require(vote == Vote.Yes || vote == Vote.No, "vote must be either Yes or No");

        proposal.votesByMember[memberAddress] = vote;

        if (vote == Vote.Yes) {
            proposal.yesVotes = proposal.yesVotes.ADD415(member.shares);

            // set highest index (latest) yes vote - must be processed for member to ragequit
            if (proposalIndex > member.highestIndexYesVote) {
                member.highestIndexYesVote = proposalIndex;
            }

            // set maximum of total shares encountered at a yes vote - used to bound dilution for yes voters
            if (totalShares.ADD415(totalLoot) > proposal.maxTotalSharesAndLootAtYesVote) {
                proposal.maxTotalSharesAndLootAtYesVote = totalShares.ADD415(totalLoot);
            }

        } else if (vote == Vote.No) {
            proposal.noVotes = proposal.noVotes.ADD415(member.shares);
        }
     
        // NOTE: subgraph indexes by proposalId not proposalIndex since proposalIndex isn't set untill it's been sponsored but proposal is created on submission
        emit SUBMITVOTE426(proposalQueue[proposalIndex], proposalIndex, msg.sender, memberAddress, uintVote);
    }

    function PROCESSPROPOSAL791(uint256 proposalIndex) public NONREENTRANT833 {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING559(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(!proposal.flags[4] && !proposal.flags[5], "must be a standard proposal");

        proposal.flags[1] = true; // processed

        bool didPass = _DIDPASS850(proposalIndex);

        // Make the proposal fail if the new total number of shares and loot exceeds the limit
        if (totalShares.ADD415(totalLoot).ADD415(proposal.sharesRequested).ADD415(proposal.lootRequested) > max_number_of_shares_and_loot131) {
            didPass = false;
        }

        // Make the proposal fail if it is requesting more tokens as payment than the available guild bank balance
        if (proposal.paymentRequested > userTokenBalances[guild671][proposal.paymentToken]) {
            didPass = false;
        }

        // Make the proposal fail if it would result in too many tokens with non-zero balance in guild bank
        if (proposal.tributeOffered > 0 && userTokenBalances[guild671][proposal.tributeToken] == 0 && totalGuildBankTokens >= max_token_guildbank_count798) {
           didPass = false;
        }

        // PROPOSAL PASSED
        if (didPass) {
            proposal.flags[2] = true; // didPass

            // if the applicant is already a member, add to their existing shares & loot
            if (members[proposal.applicant].exists) {
                members[proposal.applicant].shares = members[proposal.applicant].shares.ADD415(proposal.sharesRequested);
                members[proposal.applicant].loot = members[proposal.applicant].loot.ADD415(proposal.lootRequested);

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
            totalShares = totalShares.ADD415(proposal.sharesRequested);
            totalLoot = totalLoot.ADD415(proposal.lootRequested);

            // if the proposal tribute is the first tokens of its kind to make it into the guild bank, increment total guild bank tokens
            if (userTokenBalances[guild671][proposal.tributeToken] == 0 && proposal.tributeOffered > 0) {
                totalGuildBankTokens += 1;
            }

            UNSAFEINTERNALTRANSFER936(escrow236, guild671, proposal.tributeToken, proposal.tributeOffered);
            UNSAFEINTERNALTRANSFER936(guild671, proposal.applicant, proposal.paymentToken, proposal.paymentRequested);

            // if the proposal spends 100% of guild bank balance for a token, decrement total guild bank tokens
            if (userTokenBalances[guild671][proposal.paymentToken] == 0 && proposal.paymentRequested > 0) {
                totalGuildBankTokens -= 1;
            }

        // PROPOSAL FAILED
        } else {
            // return all tokens to the proposer (not the applicant, because funds come from proposer)
            UNSAFEINTERNALTRANSFER936(escrow236, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        }

        _RETURNDEPOSIT88(proposal.sponsor);

        emit PROCESSPROPOSAL404(proposalIndex, proposalId, didPass);
    }

    function PROCESSWHITELISTPROPOSAL980(uint256 proposalIndex) public NONREENTRANT833 {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING559(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[4], "must be a whitelist proposal");

        proposal.flags[1] = true; // processed

        bool didPass = _DIDPASS850(proposalIndex);

        if (approvedTokens.length >= max_token_whitelist_count560) {
            didPass = false;
        }

        if (didPass) {
            proposal.flags[2] = true; // didPass

            tokenWhitelist[address(proposal.tributeToken)] = true;
            approvedTokens.push(proposal.tributeToken);
        }

        proposedToWhitelist[address(proposal.tributeToken)] = false;

        _RETURNDEPOSIT88(proposal.sponsor);

        emit PROCESSWHITELISTPROPOSAL798(proposalIndex, proposalId, didPass);
    }

    function PROCESSGUILDKICKPROPOSAL282(uint256 proposalIndex) public NONREENTRANT833 {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING559(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[5], "must be a guild kick proposal");

        proposal.flags[1] = true; // processed

        bool didPass = _DIDPASS850(proposalIndex);

        if (didPass) {
            proposal.flags[2] = true; // didPass
            Member storage member = members[proposal.applicant];
            member.jailed = proposalIndex;

            // transfer shares to loot
            member.loot = member.loot.ADD415(member.shares);
            totalShares = totalShares.SUB185(member.shares);
            totalLoot = totalLoot.ADD415(member.shares);
            member.shares = 0; // revoke all shares
        }

        proposedToKick[proposal.applicant] = false;

        _RETURNDEPOSIT88(proposal.sponsor);

        emit PROCESSGUILDKICKPROPOSAL258(proposalIndex, proposalId, didPass);
    }

    function _DIDPASS850(uint256 proposalIndex) internal view returns (bool didPass) {	//inject NONSTANDARD NAMING
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];

        didPass = proposal.yesVotes > proposal.noVotes;

        // Make the proposal fail if the dilutionBound is exceeded
        if ((totalShares.ADD415(totalLoot)).MUL370(dilutionBound) < proposal.maxTotalSharesAndLootAtYesVote) {
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

    function _VALIDATEPROPOSALFORPROCESSING559(uint256 proposalIndex) internal view {	//inject NONSTANDARD NAMING
        require(proposalIndex < proposalQueue.length, "proposal does not exist");
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];

        require(GETCURRENTPERIOD672() >= proposal.startingPeriod.ADD415(votingPeriodLength).ADD415(gracePeriodLength), "proposal is not ready to be processed");
        require(proposal.flags[1] == false, "proposal has already been processed");
        require(proposalIndex == 0 || proposals[proposalQueue[proposalIndex.SUB185(1)]].flags[1], "previous proposal must be processed");
    }

    function _RETURNDEPOSIT88(address sponsor) internal {	//inject NONSTANDARD NAMING
        UNSAFEINTERNALTRANSFER936(escrow236, msg.sender, depositToken, processingReward);
        UNSAFEINTERNALTRANSFER936(escrow236, sponsor, depositToken, proposalDeposit.SUB185(processingReward));
    }

    function RAGEQUIT617(uint256 sharesToBurn, uint256 lootToBurn) public NONREENTRANT833 ONLYMEMBER65 {	//inject NONSTANDARD NAMING
        _RAGEQUIT436(msg.sender, sharesToBurn, lootToBurn);
    }

    function _RAGEQUIT436(address memberAddress, uint256 sharesToBurn, uint256 lootToBurn) internal {	//inject NONSTANDARD NAMING
        uint256 initialTotalSharesAndLoot = totalShares.ADD415(totalLoot);

        Member storage member = members[memberAddress];

        require(member.shares >= sharesToBurn, "insufficient shares");
        require(member.loot >= lootToBurn, "insufficient loot");

        require(CANRAGEQUIT158(member.highestIndexYesVote), "cannot ragequit until highest index proposal member voted YES on is processed");

        uint256 sharesAndLootToBurn = sharesToBurn.ADD415(lootToBurn);

        // burn shares and loot
        member.shares = member.shares.SUB185(sharesToBurn);
        member.loot = member.loot.SUB185(lootToBurn);
        totalShares = totalShares.SUB185(sharesToBurn);
        totalLoot = totalLoot.SUB185(lootToBurn);

        for (uint256 i = 0; i < approvedTokens.length; i++) {
            uint256 amountToRagequit = FAIRSHARE905(userTokenBalances[guild671][approvedTokens[i]], sharesAndLootToBurn, initialTotalSharesAndLoot);
            if (amountToRagequit > 0) { // gas optimization to allow a higher maximum token limit
                // deliberately not using safemath here to keep overflows from preventing the function execution (which would break ragekicks)
                // if a token overflows, it is because the supply was artificially inflated to oblivion, so we probably don't care about it anyways
                userTokenBalances[guild671][approvedTokens[i]] -= amountToRagequit;
                userTokenBalances[memberAddress][approvedTokens[i]] += amountToRagequit;
            }
        }

        emit RAGEQUIT159(msg.sender, sharesToBurn, lootToBurn);
    }

    function RAGEKICK376(address memberToKick) public NONREENTRANT833 {	//inject NONSTANDARD NAMING
        Member storage member = members[memberToKick];

        require(member.jailed != 0, "member must be in jail");
        require(member.loot > 0, "member must have some loot"); // note - should be impossible for jailed member to have shares
        require(CANRAGEQUIT158(member.highestIndexYesVote), "cannot ragequit until highest index proposal member voted YES on is processed");

        _RAGEQUIT436(memberToKick, 0, member.loot);
    }

    function WITHDRAWBALANCE563(address token, uint256 amount) public NONREENTRANT833 {	//inject NONSTANDARD NAMING
        _WITHDRAWBALANCE190(token, amount);
    }

    function WITHDRAWBALANCES679(address[] memory tokens, uint256[] memory amounts, bool max) public NONREENTRANT833 {	//inject NONSTANDARD NAMING
        require(tokens.length == amounts.length, "tokens and amounts arrays must be matching lengths");

        for (uint256 i=0; i < tokens.length; i++) {
            uint256 withdrawAmount = amounts[i];
            if (max) { // withdraw the maximum balance
                withdrawAmount = userTokenBalances[msg.sender][tokens[i]];
            }

            _WITHDRAWBALANCE190(tokens[i], withdrawAmount);
        }
    }
    
    function _WITHDRAWBALANCE190(address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(userTokenBalances[msg.sender][token] >= amount, "insufficient balance");
        UNSAFESUBTRACTFROMBALANCE759(msg.sender, token, amount);
        require(IERC20(token).TRANSFER364(msg.sender, amount), "transfer failed");
        emit WITHDRAW164(msg.sender, token, amount);
    }

    function COLLECTTOKENS854(address token) public ONLYDELEGATE381 NONREENTRANT833 {	//inject NONSTANDARD NAMING
        uint256 amountToCollect = IERC20(token).BALANCEOF256(address(this)).SUB185(userTokenBalances[total228][token]);
        // only collect if 1) there are tokens to collect 2) token is whitelisted 3) token has non-zero balance
        require(amountToCollect > 0, 'no tokens to collect');
        require(tokenWhitelist[token], 'token to collect must be whitelisted');
        require(userTokenBalances[guild671][token] > 0, 'token to collect must have non-zero guild bank balance');
        
        UNSAFEADDTOBALANCE519(guild671, token, amountToCollect);
        emit TOKENSCOLLECTED963(token, amountToCollect);
    }

    // NOTE: requires that delegate key which sent the original proposal cancels, msg.sender == proposal.proposer
    function CANCELPROPOSAL180(uint256 proposalId) public NONREENTRANT833 {	//inject NONSTANDARD NAMING
        Proposal storage proposal = proposals[proposalId];
        require(!proposal.flags[0], "proposal has already been sponsored");
        require(!proposal.flags[3], "proposal has already been cancelled");
        require(msg.sender == proposal.proposer, "solely the proposer can cancel");

        proposal.flags[3] = true; // cancelled
        
        UNSAFEINTERNALTRANSFER936(escrow236, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        emit CANCELPROPOSAL265(proposalId, msg.sender);
    }

    function UPDATEDELEGATEKEY327(address newDelegateKey) public NONREENTRANT833 ONLYSHAREHOLDER490 {	//inject NONSTANDARD NAMING
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

        emit UPDATEDELEGATEKEY837(msg.sender, newDelegateKey);
    }

    // can only ragequit if the latest proposal you voted YES on has been processed
    function CANRAGEQUIT158(uint256 highestIndexYesVote) public view returns (bool) {	//inject NONSTANDARD NAMING
        require(highestIndexYesVote < proposalQueue.length, "proposal does not exist");
        return proposals[proposalQueue[highestIndexYesVote]].flags[1];
    }

    function HASVOTINGPERIODEXPIRED892(uint256 startingPeriod) public view returns (bool) {	//inject NONSTANDARD NAMING
        return GETCURRENTPERIOD672() >= startingPeriod.ADD415(votingPeriodLength);
    }

                                                              
    function MAX311(uint256 x, uint256 y) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }

    function GETCURRENTPERIOD672() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now.SUB185(summoningTime).DIV926(periodDuration);
    }

    function GETPROPOSALQUEUELENGTH155() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return proposalQueue.length;
    }

    function GETPROPOSALFLAGS373(uint256 proposalId) public view returns (bool[6] memory) {	//inject NONSTANDARD NAMING
        return proposals[proposalId].flags;
    }

    function GETUSERTOKENBALANCE999(address user, address token) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return userTokenBalances[user][token];
    }

    function GETMEMBERPROPOSALVOTE763(address memberAddress, uint256 proposalIndex) public view returns (Vote) {	//inject NONSTANDARD NAMING
        require(members[memberAddress].exists, "member does not exist");
        require(proposalIndex < proposalQueue.length, "proposal does not exist");
        return proposals[proposalQueue[proposalIndex]].votesByMember[memberAddress];
    }

    function GETTOKENCOUNT860() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return approvedTokens.length;
    }

                                                              
    function UNSAFEADDTOBALANCE519(address user, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        userTokenBalances[user][token] += amount;
        userTokenBalances[total228][token] += amount;
    }

    function UNSAFESUBTRACTFROMBALANCE759(address user, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        userTokenBalances[user][token] -= amount;
        userTokenBalances[total228][token] -= amount;
    }

    function UNSAFEINTERNALTRANSFER936(address from, address to, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        UNSAFESUBTRACTFROMBALANCE759(from, token, amount);
        UNSAFEADDTOBALANCE519(to, token, amount);
    }

    function FAIRSHARE905(uint256 balance, uint256 shares, uint256 totalSharesAndLoot) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(totalSharesAndLoot != 0);

        if (balance == 0) { return 0; }

        uint256 prod = balance * shares;

        if (prod / balance == shares) { // no overflow in multiplication above?
            return prod / totalSharesAndLoot;
        }

        return (balance / totalSharesAndLoot) * shares;
    }
}

contract MolochSummoner {
    // presented by OpenESQ || LexDAO LLC ~ Use at own risk! || chat with us: lexdao.chat 
    Moloch private baal;
    address[] public molochs;

    event SUMMONED138(address indexed baal, address[] indexed _summoner);	//inject NONSTANDARD NAMING

    function SUMMONMOLOCH37(	//inject NONSTANDARD NAMING
        address[] memory _summoners,
        address[] memory _approvedTokens,
        uint256 _periodDuration,
        uint256 _votingPeriodLength,
        uint256 _gracePeriodLength,
        uint256 _proposalDeposit,
        uint256 _dilutionBound,
        uint256 _processingReward) public {

        baal = new Moloch(
            _summoners,
            _approvedTokens,
            _periodDuration,
            _votingPeriodLength,
            _gracePeriodLength,
            _proposalDeposit,
            _dilutionBound,
            _processingReward);

        molochs.push(address(baal));
        emit SUMMONED138(address(baal), _summoners);
    }

    function GETMOLOCHCOUNT898() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return molochs.length;
    }
}