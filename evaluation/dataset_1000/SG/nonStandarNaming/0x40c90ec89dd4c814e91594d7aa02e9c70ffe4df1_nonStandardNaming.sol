                                                                 

pragma solidity 0.5.17;

library SafeMath { // wrappers over solidity arithmetic operations with added overflow checks
    function ADD157(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }
    
    function SUB890(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }
    
    function MUL191(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function DIV525(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0);
        uint256 c = a / b;

        return c;
    }
}

interface IERC20 { // brief interface for moloch erc20 token txs
    function BALANCEOF942(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
    
    function TRANSFER396(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM717(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
}

contract ReentrancyGuard { // contract module that helps prevent reentrant calls to a function
    uint256 private constant _not_entered760 = 1;	//inject NONSTANDARD NAMING
    uint256 private constant _entered234 = 2;	//inject NONSTANDARD NAMING

    uint256 private _status;

    constructor () internal {
        _status = _not_entered760;
    }

    modifier NONREENTRANT789() {	//inject NONSTANDARD NAMING
        require(_status != _entered234, "reentrant call");

        _status = _entered234;
        
        _;
        
        _status = _not_entered760;
    }
}

interface IWETH { // brief interface for canonical ether token wrapper contract 
    function DEPOSIT812() payable external;	//inject NONSTANDARD NAMING
    
    function TRANSFER396(address dst, uint wad) external returns (bool);	//inject NONSTANDARD NAMING
}

contract MysticMoloch is ReentrancyGuard { 
    using SafeMath for uint256;

                                                              
    address public depositToken; // deposit token contract reference; default = wETH
    address public voteToken; // wrapper token contract reference for guild voting shares 
    address public wETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // canonical ether token wrapper contract reference
    
    uint256 public proposalDeposit; // default = 10 ETH (~$1,000 worth of ETH at contract deployment)
    uint256 public processingReward; // default = 0.1 - amount of ETH to give to whoever processes a proposal
    uint256 public periodDuration; // default = 17280 = 4.8 hours in seconds (5 periods per day)
    uint256 public votingPeriodLength; // default = 35 periods (7 days)
    uint256 public gracePeriodLength; // default = 35 periods (7 days)
    uint256 public dilutionBound; // default = 3 - maximum multiplier a YES voter will be obligated to pay in case of mass ragequit
    uint256 public summoningTime; // needed to determine the current period
    
    // HARD-CODED LIMITS
    // These numbers are quite arbitrary; they are small enough to avoid overflows when doing calculations
    // with periods or shares, yet big enough to not limit reasonable use cases.
    uint256 constant max_guild_bound12 = 10**36; // maximum bound for guild shares / loot (reflects guild token 18 decimal default)	//inject NONSTANDARD NAMING
    uint256 constant max_token_whitelist_count17 = 400; // maximum number of whitelisted tokens	//inject NONSTANDARD NAMING
    uint256 constant max_token_guildbank_count197 = 200; // maximum number of tokens with non-zero balance in guildbank	//inject NONSTANDARD NAMING

    // BANK TOKEN DETAILS
    string private _name = "Moloch DAO v2x Bank";
    string private _symbol = "MOL-V2X";
    uint8 private _decimals = 18;

    // ***************
    // EVENTS
    // ***************
    event SUBMITPROPOSAL128(address indexed applicant, uint256 sharesRequested, uint256 lootRequested, uint256 tributeOffered, address tributeToken, uint256 paymentRequested, address paymentToken, bytes32 details, uint8[7] flags, bytes actionData, uint256 proposalId, address indexed delegateKey, address indexed memberAddress);	//inject NONSTANDARD NAMING
    event CANCELPROPOSAL134(uint256 indexed proposalId, address applicantAddress);	//inject NONSTANDARD NAMING
    event SPONSORPROPOSAL532(address indexed delegateKey, address indexed memberAddress, uint256 proposalId, uint256 proposalIndex, uint256 startingPeriod);	//inject NONSTANDARD NAMING
    event SUBMITVOTE908(uint256 proposalId, uint256 indexed proposalIndex, address indexed delegateKey, address indexed memberAddress, uint8 uintVote);	//inject NONSTANDARD NAMING
    event PROCESSPROPOSAL615(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSWHITELISTPROPOSAL195(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSGUILDACTIONPROPOSAL787(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSGUILDKICKPROPOSAL560(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event UPDATEDELEGATEKEY161(address indexed memberAddress, address newDelegateKey);	//inject NONSTANDARD NAMING
    event TRANSFER746(address indexed from, address indexed to, uint256 amount); // guild token mint, burn & (loot) transfer tracking	//inject NONSTANDARD NAMING
    event RAGEQUIT615(address indexed memberAddress, uint256 sharesToBurn, uint256 lootToBurn);	//inject NONSTANDARD NAMING
    event TOKENSCOLLECTED507(address indexed token, uint256 amountToCollect);	//inject NONSTANDARD NAMING
    event WITHDRAW602(address indexed memberAddress, address token, uint256 amount);	//inject NONSTANDARD NAMING
    
    // *******************
    // INTERNAL ACCOUNTING
    // *******************
    address public constant guild694 = address(0xfeed);	//inject NONSTANDARD NAMING
    address public constant escrow508 = address(0xbeef);	//inject NONSTANDARD NAMING
    address public constant total524 = address(0xbabe);	//inject NONSTANDARD NAMING
    
    uint256 public proposalCount; // total proposals submitted
    uint256 public totalShares; // total shares across all members
    uint256 public totalLoot; // total loot across all members
    uint256 public totalGuildBankTokens; // total tokens with non-zero balance in guild bank

    mapping(uint256 => Action) public actions; // proposalId => Action
    mapping(address => uint256) private balances; // guild token balances
    mapping(address => mapping(address => uint256)) private userTokenBalances; // userTokenBalances[userAddress][tokenAddress]

    enum Vote {
        Null, // default value, counted as abstention
        Yes,
        No
    }
    
    struct Member {
        address delegateKey; // the key responsible for submitting proposals and voting - defaults to member address unless updated
        uint8 exists; // always true (1) once a member has been created
        uint256 shares; // the # of voting shares assigned to this member
        uint256 loot; // the loot amount available to this member (combined with shares on ragekick) / transferable by guild token
        uint256 highestIndexYesVote; // highest proposal index # on which the member voted YES
        uint256 jailed; // set to proposalIndex of a passing guild kick proposal for this member, prevents voting on and sponsoring proposals
    }
    
    struct Action {
        address to; // target for function call
        uint256 value; // ether value in function call, if any
        bytes data; // raw data for function call
    }

    struct Proposal {
        address applicant; // the applicant who wishes to become a member - this key will be used for withdrawals (doubles as guild kick target for gkick proposals)
        address proposer; // the account that submitted the proposal (can be non-member)
        address sponsor; // the member that sponsored the proposal (moving it into the queue)
        address tributeToken; // tribute token contract reference
        address paymentToken; // payment token contract reference
        uint8[7] flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action]
        uint256 sharesRequested; // the # of shares the applicant is requesting
        uint256 lootRequested; // the amount of loot the applicant is requesting
        uint256 paymentRequested; // amount of tokens requested as payment
        uint256 tributeOffered; // amount of tokens offered as tribute
        uint256 startingPeriod; // the period in which voting can start for this proposal
        uint256 yesVotes; // the total number of YES votes for this proposal
        uint256 noVotes; // the total number of NO votes for this proposal
        uint256 maxTotalSharesAndLootAtYesVote; // the maximum # of total shares encountered at a yes vote on this proposal
        bytes32 details; // proposal details to add context for members 
        mapping(address => Vote) votesByMember; // the votes on this proposal by each member
    }

    mapping(address => bool) public tokenWhitelist;
    address[] public approvedTokens;

    mapping(address => bool) public proposedToWhitelist;
    mapping(address => bool) public proposedToKick;
    
    mapping(address => Member) public members;
    mapping(address => address) public memberAddressByDelegateKey;
    
    mapping(uint256 => Proposal) public proposals;

    uint256[] private proposalQueue;

    modifier ONLYDELEGATE13 {	//inject NONSTANDARD NAMING
        require(members[memberAddressByDelegateKey[msg.sender]].shares > 0, "not delegate");
        _;
    }
    
    constructor(
        address _depositToken,
        address _voteToken,
        address[] memory _summoner,
        uint256[] memory _summonerShares,
        uint256 _summonerDeposit,
        uint256 _proposalDeposit,
        uint256 _processingReward,
        uint256 _periodDuration,
        uint256 _votingPeriodLength,
        uint256 _gracePeriodLength,
        uint256 _dilutionBound
    ) public {
        for (uint256 i = 0; i < _summoner.length; i++) {
            REGISTERMEMBER528(_summoner[i], _summonerShares[i]);
            MINTGUILDTOKEN728(_summoner[i], _summonerShares[i]);
            totalShares += _summonerShares[i];
        }
        
        require(totalShares <= max_guild_bound12, "guild maxed");
        
        tokenWhitelist[_depositToken] = true;
        approvedTokens.push(_depositToken);
        
        if (_summonerDeposit > 0) {
            totalGuildBankTokens += 1;
            UNSAFEADDTOBALANCE996(guild694, _depositToken, _summonerDeposit);
        }
        
        depositToken = _depositToken;
        voteToken = _voteToken;
        proposalDeposit = _proposalDeposit;
        processingReward = _processingReward;
        periodDuration = _periodDuration;
        votingPeriodLength = _votingPeriodLength;
        gracePeriodLength = _gracePeriodLength;
        dilutionBound = _dilutionBound;
        summoningTime = now;
    }
    
                                                                    
    function SUBMITPROPOSAL595(	//inject NONSTANDARD NAMING
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        bytes32 details
    ) payable external NONREENTRANT789 returns (uint256 proposalId) {
        require(sharesRequested.ADD157(lootRequested) <= max_guild_bound12, "guild maxed");
        require(tokenWhitelist[tributeToken], "tributeToken not whitelisted");
        require(tokenWhitelist[paymentToken], "paymentToken not whitelisted");
        require(applicant != guild694 && applicant != escrow508 && applicant != total524, "applicant unreservable");
        require(members[applicant].jailed == 0, "applicant jailed");

        if (tributeOffered > 0 && userTokenBalances[guild694][tributeToken] == 0) {
            require(totalGuildBankTokens < max_token_guildbank_count197, "guildbank maxed");
        }
        
        // collect tribute from proposer and store it in the Moloch until the proposal is processed / if ether, wrap into wETH
        if (tributeToken == wETH && msg.value > 0) {
            require(msg.value == tributeOffered, "insufficient ETH");
            IWETH(wETH).DEPOSIT812();
            (bool success, ) = wETH.call.value(msg.value)("");
            require(success, "transfer failed");
            IWETH(wETH).TRANSFER396(address(this), msg.value);
        } else {
            require(IERC20(tributeToken).TRANSFERFROM717(msg.sender, address(this), tributeOffered), "transfer failed");
        }
        
        UNSAFEADDTOBALANCE996(escrow508, tributeToken, tributeOffered);

        uint8[7] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action]

        _SUBMITPROPOSAL458(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags, "");
        
        return proposalCount - 1; // return proposalId - contracts calling submit might want it
    }
    
    function SUBMITWHITELISTPROPOSAL880(address tokenToWhitelist, bytes32 details) external returns (uint256 proposalId) {	//inject NONSTANDARD NAMING
        require(tokenToWhitelist != address(0), "need token");
        require(tokenToWhitelist != voteToken, "whitelist/voteToken match");
        require(!tokenWhitelist[tokenToWhitelist], "already whitelisted");
        require(approvedTokens.length < max_token_whitelist_count17, "whitelist maxed");

        uint8[7] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action]
        flags[4] = 1; // whitelist

        _SUBMITPROPOSAL458(address(0), 0, 0, 0, tokenToWhitelist, 0, address(0), details, flags, "");
        
        return proposalCount - 1;
    }
    
    function SUBMITGUILDACTIONPROPOSAL2( // stages arbitrary function calls for member vote (based on Raid Guild 'Minion')	//inject NONSTANDARD NAMING
        address actionTo,
        uint256 actionValue,
        bytes calldata actionData,
        bytes32 details
    ) external returns (uint256 proposalId) {
        
        uint8[7] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action]
        flags[6] = 1; // guild action
        
        _SUBMITPROPOSAL458(actionTo, 0, 0, 0, address(0), actionValue, address(0), details, flags, actionData);
        
        return proposalCount - 1;
    }

    function SUBMITGUILDKICKPROPOSAL352(address memberToKick, bytes32 details) external returns (uint256 proposalId) {	//inject NONSTANDARD NAMING
        Member memory member = members[memberToKick];

        require(member.shares > 0 || member.loot > 0, "must have share or loot");
        require(members[memberToKick].jailed == 0, "already jailed");

        uint8[7] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action]
        flags[5] = 1; // guild kick

        _SUBMITPROPOSAL458(memberToKick, 0, 0, 0, address(0), 0, address(0), details, flags, "");
        
        return proposalCount - 1;
    }
    
    function _SUBMITPROPOSAL458(	//inject NONSTANDARD NAMING
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        bytes32 details,
        uint8[7] memory flags,
        bytes memory actionData
    ) internal {
        Proposal memory proposal = Proposal({
            applicant : applicant,
            proposer : msg.sender,
            sponsor : address(0),
            tributeToken : tributeToken,
            paymentToken : paymentToken,
            flags : flags,
            sharesRequested : sharesRequested,
            lootRequested : lootRequested,
            paymentRequested : paymentRequested,
            tributeOffered : tributeOffered,
            startingPeriod : 0,
            yesVotes : 0,
            noVotes : 0,
            maxTotalSharesAndLootAtYesVote : 0,
            details : details
        });
        
        // collect action data
        if (proposal.flags[6] == 1) {
            Action memory action = Action({
                to : applicant,
                value : paymentRequested,
                data : actionData
            });
                
            actions[proposalCount] = action;
        }
        
        proposals[proposalCount] = proposal;
        address memberAddress = memberAddressByDelegateKey[msg.sender];
        // NOTE: argument order matters, avoid stack too deep
        emit SUBMITPROPOSAL128(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags, actionData, proposalCount, msg.sender, memberAddress);
        
        proposalCount += 1;
    }

    function SPONSORPROPOSAL585(uint256 proposalId) external NONREENTRANT789 ONLYDELEGATE13 {	//inject NONSTANDARD NAMING
        // collect proposal deposit from sponsor and store it in the Moloch until the proposal is processed
        require(IERC20(depositToken).TRANSFERFROM717(msg.sender, address(this), proposalDeposit), "transfer failed");
        UNSAFEADDTOBALANCE996(escrow508, depositToken, proposalDeposit);

        Proposal storage proposal = proposals[proposalId];

        require(proposal.proposer != address(0), "unproposed");
        require(proposal.flags[0] == 0, "already sponsored");
        require(proposal.flags[3] == 0, "cancelled");
        require(members[proposal.applicant].jailed == 0, "applicant jailed");

        if (proposal.tributeOffered > 0 && userTokenBalances[guild694][proposal.tributeToken] == 0) {
            require(totalGuildBankTokens < max_token_guildbank_count197, "guildbank maxed");
        }

        // whitelist proposal
        if (proposal.flags[4] == 1) {
            require(!tokenWhitelist[address(proposal.tributeToken)], "already whitelisted");
            require(!proposedToWhitelist[address(proposal.tributeToken)], "already whitelist proposed");
            require(approvedTokens.length < max_token_whitelist_count17, "whitelist maxed");
            proposedToWhitelist[address(proposal.tributeToken)] = true;

        // guild kick proposal
        } else if (proposal.flags[5] == 1) {
            require(!proposedToKick[proposal.applicant], "kick already proposed");
            proposedToKick[proposal.applicant] = true;
        }

        // compute startingPeriod for proposal
        uint256 startingPeriod = MAX473(
            GETCURRENTPERIOD155(),
            proposalQueue.length == 0 ? 0 : proposals[proposalQueue[proposalQueue.length - 1]].startingPeriod
        ) + 1;

        proposal.startingPeriod = startingPeriod;

        address memberAddress = memberAddressByDelegateKey[msg.sender];
        proposal.sponsor = memberAddress;

        proposal.flags[0] = 1; // sponsored

        // append proposal to the queue
        proposalQueue.push(proposalId);
        
        emit SPONSORPROPOSAL532(msg.sender, memberAddress, proposalId, proposalQueue.length - 1, startingPeriod);
    }

    // NOTE: In MolochV2 proposalIndex !== proposalId
    function SUBMITVOTE746(uint256 proposalIndex, uint8 uintVote) external ONLYDELEGATE13 {	//inject NONSTANDARD NAMING
        address memberAddress = memberAddressByDelegateKey[msg.sender];
        Member storage member = members[memberAddress];

        require(proposalIndex < proposalQueue.length, "unproposed");
        Proposal storage proposal = proposals[proposalQueue[proposalIndex]];

        require(uintVote < 3, "not < 3");
        Vote vote = Vote(uintVote);

        require(GETCURRENTPERIOD155() >= proposal.startingPeriod, "voting pending");
        require(!HASVOTINGPERIODEXPIRED768(proposal.startingPeriod), "proposal expired");
        require(proposal.votesByMember[memberAddress] == Vote.Null, "member voted");
        require(vote == Vote.Yes || vote == Vote.No, "vote Yes or No");

        proposal.votesByMember[memberAddress] = vote;

        if (vote == Vote.Yes) {
            proposal.yesVotes += member.shares;

            // set highest index (latest) yes vote - must be processed for member to ragequit
            if (proposalIndex > member.highestIndexYesVote) {
                member.highestIndexYesVote = proposalIndex;
            }

            // set maximum of total shares encountered at a yes vote - used to bound dilution for yes voters
            if (TOTALSUPPLY943() > proposal.maxTotalSharesAndLootAtYesVote) {
                proposal.maxTotalSharesAndLootAtYesVote = TOTALSUPPLY943();
            }

        } else if (vote == Vote.No) {
            proposal.noVotes += member.shares;
        }
     
        // NOTE: subgraph indexes by proposalId not proposalIndex since proposalIndex isn't set until it's been sponsored but proposal is created on submission
        emit SUBMITVOTE908(proposalQueue[proposalIndex], proposalIndex, msg.sender, memberAddress, uintVote);
    }

    function PROCESSPROPOSAL407(uint256 proposalIndex) external {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING426(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[4] == 0 && proposal.flags[5] == 0 && proposal.flags[6] == 0, "not standard proposal");

        proposal.flags[1] = 1; // processed

        bool didPass = _DIDPASS691(proposalIndex);

        // Make the proposal fail if the new total number of shares and loot exceeds the limit
        if (TOTALSUPPLY943().ADD157(proposal.sharesRequested).ADD157(proposal.lootRequested) > max_guild_bound12) {
            didPass = false;
        }

        // Make the proposal fail if it is requesting more tokens as payment than the available guild bank balance
        if (proposal.paymentRequested > userTokenBalances[guild694][proposal.paymentToken]) {
            didPass = false;
        }

        // Make the proposal fail if it would result in too many tokens with non-zero balance in guild bank
        if (proposal.tributeOffered > 0 && userTokenBalances[guild694][proposal.tributeToken] == 0 && totalGuildBankTokens >= max_token_guildbank_count197) {
            didPass = false;
        }

        // PROPOSAL PASSED
        if (didPass == true) {
            proposal.flags[2] = 1; // didPass

            // if the applicant is already a member, add to their existing shares & loot
            if (members[proposal.applicant].exists == 1) {
                members[proposal.applicant].shares += proposal.sharesRequested;
                members[proposal.applicant].loot += proposal.lootRequested;

            // if the applicant is a new member, create a new record for them
            } else {
                REGISTERMEMBER528(proposal.applicant, proposal.sharesRequested);
            }

            // mint new guild token, shares, loot 
            MINTGUILDTOKEN728(proposal.applicant, proposal.sharesRequested + proposal.lootRequested);
            totalShares += proposal.sharesRequested;
            totalLoot += proposal.lootRequested;

            // if the proposal tribute is the first tokens of its kind to make it into the guild bank, increment total guild bank tokens
            if (userTokenBalances[guild694][proposal.tributeToken] == 0 && proposal.tributeOffered > 0) {
                totalGuildBankTokens += 1;
            }

            UNSAFEINTERNALTRANSFER63(escrow508, guild694, proposal.tributeToken, proposal.tributeOffered);
            UNSAFEINTERNALTRANSFER63(guild694, proposal.applicant, proposal.paymentToken, proposal.paymentRequested);

            // if the proposal spends 100% of guild bank balance for a token, decrement total guild bank tokens
            if (userTokenBalances[guild694][proposal.paymentToken] == 0 && proposal.paymentRequested > 0) {
                totalGuildBankTokens -= 1;
            }

        // PROPOSAL FAILED
        } else {
            // return all tokens to the proposer (not the applicant, because funds come from proposer)
            UNSAFEINTERNALTRANSFER63(escrow508, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        }

        _RETURNDEPOSIT837(proposal.sponsor);
        
        emit PROCESSPROPOSAL615(proposalIndex, proposalId, didPass);
    }

    function PROCESSWHITELISTPROPOSAL756(uint256 proposalIndex) external {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING426(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[4] == 1, "not whitelist proposal");

        proposal.flags[1] = 1; // processed

        bool didPass = _DIDPASS691(proposalIndex);

        if (approvedTokens.length >= max_token_whitelist_count17) {
            didPass = false;
        }

        if (didPass == true) {
            proposal.flags[2] = 1; // didPass

            tokenWhitelist[address(proposal.tributeToken)] = true;
            approvedTokens.push(proposal.tributeToken);
        }

        proposedToWhitelist[address(proposal.tributeToken)] = false;

        _RETURNDEPOSIT837(proposal.sponsor);
        
        emit PROCESSWHITELISTPROPOSAL195(proposalIndex, proposalId, didPass);
    }

    function PROCESSGUILDACTIONPROPOSAL588(uint256 proposalIndex) external returns (bytes memory) {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING426(proposalIndex);
        
        uint256 proposalId = proposalQueue[proposalIndex];
        Action storage action = actions[proposalId];
        Proposal storage proposal = proposals[proposalId];
        
        require(proposal.flags[6] == 1, "not action proposal");

        proposal.flags[1] = 1; // processed

        bool didPass = _DIDPASS691(proposalIndex);
        
        if (didPass == true) {
            proposal.flags[2] = 1; // didPass
            
            // execute call 
            (bool success, bytes memory retData) = action.to.call.value(action.value)(action.data);
            require(success, "call failure");
            
            return retData;
        }
        
        emit PROCESSGUILDACTIONPROPOSAL787(proposalIndex, proposalId, didPass);
    }

    function PROCESSGUILDKICKPROPOSAL495(uint256 proposalIndex) external {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING426(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[5] == 1, "not kick proposal");

        proposal.flags[1] = 1; // processed

        bool didPass = _DIDPASS691(proposalIndex);

        if (didPass == true) {
            proposal.flags[2] = 1; // didPass
            Member storage member = members[proposal.applicant];
            member.jailed = proposalIndex;

            // transfer shares to loot
            member.shares = 0; // revoke all shares
            member.loot += member.shares;
            totalShares -= member.shares;
            totalLoot += member.shares;
        }

        proposedToKick[proposal.applicant] = false;

        _RETURNDEPOSIT837(proposal.sponsor);
        
        emit PROCESSGUILDKICKPROPOSAL560(proposalIndex, proposalId, didPass);
    }

    function _DIDPASS691(uint256 proposalIndex) internal view returns (bool didPass) {	//inject NONSTANDARD NAMING
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];
        
        if (proposal.yesVotes > proposal.noVotes) {
            didPass = true;
        }
        
        // Make the proposal fail if the dilutionBound is exceeded
        if ((TOTALSUPPLY943().MUL191(dilutionBound)) < proposal.maxTotalSharesAndLootAtYesVote) {
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

    function _VALIDATEPROPOSALFORPROCESSING426(uint256 proposalIndex) internal view {	//inject NONSTANDARD NAMING
        require(proposalIndex < proposalQueue.length, "no such proposal");
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];

        require(GETCURRENTPERIOD155() >= proposal.startingPeriod + votingPeriodLength + gracePeriodLength, "proposal not ready");
        require(proposal.flags[1] == 0, "proposal already processed");
        require(proposalIndex == 0 || proposals[proposalQueue[proposalIndex - 1]].flags[1] == 1, "previous proposal unprocessed");
    }

    function _RETURNDEPOSIT837(address sponsor) internal {	//inject NONSTANDARD NAMING
        UNSAFEINTERNALTRANSFER63(escrow508, msg.sender, depositToken, processingReward);
        UNSAFEINTERNALTRANSFER63(escrow508, sponsor, depositToken, proposalDeposit - processingReward);
    }

    function RAGEQUIT323(uint256 sharesToBurn, uint256 lootToBurn) external {	//inject NONSTANDARD NAMING
        require(members[msg.sender].exists == 1, "not member");
        
        _RAGEQUIT911(msg.sender, sharesToBurn, lootToBurn);
    }

    function _RAGEQUIT911(address memberAddress, uint256 sharesToBurn, uint256 lootToBurn) internal {	//inject NONSTANDARD NAMING
        uint256 initialTotalSharesAndLoot = TOTALSUPPLY943();

        Member storage member = members[memberAddress];

        require(member.shares >= sharesToBurn, "insufficient shares");
        require(member.loot >= lootToBurn, "insufficient loot");

        require(CANRAGEQUIT600(member.highestIndexYesVote), "cannot ragequit until highest index proposal member voted YES on is processed");

        uint256 sharesAndLootToBurn = sharesToBurn.ADD157(lootToBurn);

        // burn tokens, shares and loot
        member.shares -= sharesToBurn;
        member.loot -= lootToBurn;
        BURNGUILDTOKEN92(memberAddress, sharesAndLootToBurn);
        totalShares -= sharesToBurn;
        totalLoot -= lootToBurn;

        for (uint256 i = 0; i < approvedTokens.length; i++) {
            uint256 amountToRagequit = FAIRSHARE715(userTokenBalances[guild694][approvedTokens[i]], sharesAndLootToBurn, initialTotalSharesAndLoot);
            if (amountToRagequit > 0) { // gas optimization to allow a higher maximum token limit
                // deliberately not using safemath here to keep overflows from preventing the function execution (which would break ragekicks)
                // if a token overflows, it is because the supply was artificially inflated to oblivion, so we probably don't care about it anyways
                userTokenBalances[guild694][approvedTokens[i]] -= amountToRagequit;
                userTokenBalances[memberAddress][approvedTokens[i]] += amountToRagequit;
            }
        }

        emit RAGEQUIT615(memberAddress, sharesToBurn, lootToBurn);
    }

    function RAGEKICK674(address memberToKick) external {	//inject NONSTANDARD NAMING
        Member storage member = members[memberToKick];

        require(member.jailed != 0, "not jailed");
        require(member.loot > 0, "no loot"); // note - should be impossible for jailed member to have shares
        require(CANRAGEQUIT600(member.highestIndexYesVote), "cannot ragequit until highest index proposal member voted YES on is processed");

        _RAGEQUIT911(memberToKick, 0, member.loot);
    }
    
    function WITHDRAWBALANCE277(address token, uint256 amount) external NONREENTRANT789 {	//inject NONSTANDARD NAMING
        _WITHDRAWBALANCE167(token, amount);
    }

    function WITHDRAWBALANCES176(address[] calldata tokens, uint256[] calldata amounts, bool max) external NONREENTRANT789 {	//inject NONSTANDARD NAMING
        require(tokens.length == amounts.length, "tokens & amounts must match");

        for (uint256 i=0; i < tokens.length; i++) {
            uint256 withdrawAmount = amounts[i];
            if (max) { // withdraw the maximum balance
                withdrawAmount = userTokenBalances[msg.sender][tokens[i]];
            }

            _WITHDRAWBALANCE167(tokens[i], withdrawAmount);
        }
    }
    
    function _WITHDRAWBALANCE167(address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(userTokenBalances[msg.sender][token] >= amount, "insufficient balance");
        
        require(IERC20(token).TRANSFER396(msg.sender, amount), "transfer failed");
        UNSAFESUBTRACTFROMBALANCE77(msg.sender, token, amount);
        
        emit WITHDRAW602(msg.sender, token, amount);
    }

    function COLLECTTOKENS492(address token) external {	//inject NONSTANDARD NAMING
        uint256 amountToCollect = IERC20(token).BALANCEOF942(address(this)) - userTokenBalances[total524][token];
        // only collect if 1) there are tokens to collect and 2) token is whitelisted
        require(amountToCollect > 0, "no tokens");
        require(tokenWhitelist[token], "not whitelisted");
        
        if (userTokenBalances[guild694][token] == 0 && totalGuildBankTokens < max_token_guildbank_count197) {totalGuildBankTokens += 1;}
        UNSAFEADDTOBALANCE996(guild694, token, amountToCollect);

        emit TOKENSCOLLECTED507(token, amountToCollect);
    }

    // NOTE: requires that delegate key which sent the original proposal cancels, msg.sender == proposal.proposer
    function CANCELPROPOSAL49(uint256 proposalId) external {	//inject NONSTANDARD NAMING
        Proposal storage proposal = proposals[proposalId];
        require(proposal.flags[0] == 0, "proposal already sponsored");
        require(proposal.flags[3] == 0, "proposal already cancelled");
        require(msg.sender == proposal.proposer, "only proposer cancels");

        proposal.flags[3] = 1; // cancelled
        
        UNSAFEINTERNALTRANSFER63(escrow508, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        
        emit CANCELPROPOSAL134(proposalId, msg.sender);
    }

    function UPDATEDELEGATEKEY435(address newDelegateKey) external {	//inject NONSTANDARD NAMING
        require(members[msg.sender].shares > 0, "not shareholder");
        require(newDelegateKey != address(0), "newDelegateKey zeroed");

        // skip checks if member is setting the delegate key to their member address
        if (newDelegateKey != msg.sender) {
            require(members[newDelegateKey].exists == 0, "cannot overwrite members");
            require(members[memberAddressByDelegateKey[newDelegateKey]].exists == 0, "cannot overwrite keys");
        }

        Member storage member = members[msg.sender];
        memberAddressByDelegateKey[member.delegateKey] = address(0);
        memberAddressByDelegateKey[newDelegateKey] = msg.sender;
        member.delegateKey = newDelegateKey;

        emit UPDATEDELEGATEKEY161(msg.sender, newDelegateKey);
    }
    
    // can only ragequit if the latest proposal you voted YES on has been processed
    function CANRAGEQUIT600(uint256 highestIndexYesVote) public view returns (bool) {	//inject NONSTANDARD NAMING
        require(highestIndexYesVote < proposalQueue.length, "no such proposal");
        
        return proposals[proposalQueue[highestIndexYesVote]].flags[1] == 1;
    }

    function HASVOTINGPERIODEXPIRED768(uint256 startingPeriod) public view returns (bool) {	//inject NONSTANDARD NAMING
        return GETCURRENTPERIOD155() >= startingPeriod + votingPeriodLength;
    }
    
                                                              
    function MAX473(uint256 x, uint256 y) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }
    
    function GETCURRENTPERIOD155() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now.SUB890(summoningTime).DIV525(periodDuration);
    }
    
    function GETMEMBERPROPOSALVOTE156(address memberAddress, uint256 proposalIndex) public view returns (Vote) {	//inject NONSTANDARD NAMING
        require(members[memberAddress].exists == 1, "not member");
        require(proposalIndex < proposalQueue.length, "unproposed");
        
        return proposals[proposalQueue[proposalIndex]].votesByMember[memberAddress];
    }

    function GETPROPOSALFLAGS885(uint256 proposalId) public view returns (uint8[7] memory) {	//inject NONSTANDARD NAMING
        return proposals[proposalId].flags;
    }
    
    function GETPROPOSALQUEUELENGTH0() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return proposalQueue.length;
    }
    
    function GETTOKENCOUNT861() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return approvedTokens.length;
    }

    function GETUSERTOKENBALANCE24(address user, address token) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return userTokenBalances[user][token];
    }
    
                                                              
    function() external payable {}
    
    function FAIRSHARE715(uint256 balance, uint256 shares, uint256 totalSharesAndLoot) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(totalSharesAndLoot != 0);

        if (balance == 0) { return 0; }

        uint256 prod = balance * shares;

        if (prod / balance == shares) { // no overflow in multiplication above?
            return prod / totalSharesAndLoot;
        }

        return (balance / totalSharesAndLoot) * shares;
    }
    
    function REGISTERMEMBER528(address newMember, uint256 shares) internal {	//inject NONSTANDARD NAMING
        // if new member is already taken by a member's delegateKey, reset it to their member address
        if (members[memberAddressByDelegateKey[newMember]].exists == 1) {
            address memberToOverride = memberAddressByDelegateKey[newMember];
            memberAddressByDelegateKey[memberToOverride] = memberToOverride;
            members[memberToOverride].delegateKey = memberToOverride;
        }
        
        members[newMember] = Member({
            delegateKey : newMember,
            exists : 1, // 'true'
            shares : shares,
            loot : 0,
            highestIndexYesVote : 0,
            jailed : 0
        });

        memberAddressByDelegateKey[newMember] = newMember;
    }
    
    function UNSAFEADDTOBALANCE996(address user, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        userTokenBalances[user][token] += amount;
        userTokenBalances[total524][token] += amount;
    }
    
    function UNSAFEINTERNALTRANSFER63(address from, address to, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        UNSAFESUBTRACTFROMBALANCE77(from, token, amount);
        UNSAFEADDTOBALANCE996(to, token, amount);
    }

    function UNSAFESUBTRACTFROMBALANCE77(address user, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        userTokenBalances[user][token] -= amount;
        userTokenBalances[total524][token] -= amount;
    }
    
                                                                             
    // GETTER FUNCTIONS
    function BALANCEOF942(address account) external view returns (uint256) { 	//inject NONSTANDARD NAMING
        return balances[account];
    }
    
    function NAME965() external view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL31() external view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS119() external view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
    
    function TOTALSUPPLY943() public view returns (uint256) { 	//inject NONSTANDARD NAMING
        return totalShares + totalLoot;
    }
    
    // BALANCE MGMT FUNCTIONS
    function BURNGUILDTOKEN92(address memberAddress, uint256 amount) internal {	//inject NONSTANDARD NAMING
        balances[memberAddress] -= amount;
        
        emit TRANSFER746(memberAddress, address(0), amount);
    }
    
    function CLAIMSHARES886(uint256 amount) external NONREENTRANT789 {	//inject NONSTANDARD NAMING
        require(IERC20(voteToken).TRANSFERFROM717(msg.sender, address(0xdead), amount), "transfer failed"); // burn vote wrapper token and claim shares (1:1)
        
        // if the sender is already a member, add to their existing shares 
        if (members[msg.sender].exists == 1) {
            members[msg.sender].shares = members[msg.sender].shares.ADD157(amount);

            // if the sender is a new member, create a new record for them
            } else {
                REGISTERMEMBER528(msg.sender, amount);
            }

        // mint new guild token & shares 
        MINTGUILDTOKEN728(msg.sender, amount);
        totalShares += amount;
            
        require(totalShares <= max_guild_bound12, "guild maxed");
    }
    
    function CONVERTSHARESTOLOOT148(uint256 sharesToLoot) external {	//inject NONSTANDARD NAMING
        members[msg.sender].shares -= sharesToLoot;
        members[msg.sender].loot += sharesToLoot;
    }
    
    function MINTGUILDTOKEN728(address memberAddress, uint256 amount) internal {	//inject NONSTANDARD NAMING
        balances[memberAddress] += amount;
        
        emit TRANSFER746(address(0), memberAddress, amount);
    }

    // LOOT TRANSFER FUNCTION
    function TRANSFER396(address receiver, uint256 lootToTransfer) external {	//inject NONSTANDARD NAMING
        members[msg.sender].loot = members[msg.sender].loot.SUB890(lootToTransfer);
        members[receiver].loot = members[receiver].loot.ADD157(lootToTransfer);
        
        balances[msg.sender] -= lootToTransfer;
        balances[receiver] += lootToTransfer;
        
        emit TRANSFER746(msg.sender, receiver, lootToTransfer);
    }
}

contract MysticMolochSummoner { 
    MysticMoloch private baal;

    event SUMMONMOLOCH172(address indexed baal, address depositToken, address voteToken, address[] indexed summoner, uint256[] indexed summonerShares, uint256 summoningDeposit, uint256 proposalDeposit, uint256 processingReward, uint256 periodDuration, uint256 votingPeriodLength, uint256 gracePeriodLength, uint256 dilutionBound, uint256 summoningTime);	//inject NONSTANDARD NAMING
 
    function SUMMONMOLOCH827(	//inject NONSTANDARD NAMING
        address _depositToken,
        address _voteToken,
        address[] memory _summoner,
        uint256[] memory _summonerShares,
        uint256 _summonerDeposit,
        uint256 _proposalDeposit,
        uint256 _processingReward,
        uint256 _periodDuration,
        uint256 _votingPeriodLength,
        uint256 _gracePeriodLength,
        uint256 _dilutionBound
    ) public {
        require(_depositToken != _voteToken, "deposit/voteToken match");
        require(_summoner.length == _summonerShares.length, "summoner/shares mismatch");
        require(IERC20(_depositToken).TRANSFERFROM717(msg.sender, address(baal), _summonerDeposit), "transfer failed"); // transfer summoner deposit to new moloch
        
        baal = new MysticMoloch(
            _depositToken,
            _voteToken,
            _summoner,
            _summonerShares,
            _summonerDeposit,
            _proposalDeposit,
            _processingReward,
            _periodDuration,
            _votingPeriodLength,
            _gracePeriodLength,
            _dilutionBound);

        emit SUMMONMOLOCH172(address(baal), _depositToken, _voteToken, _summoner, _summonerShares, _summonerDeposit, _proposalDeposit, _processingReward, _periodDuration, _votingPeriodLength, _gracePeriodLength, _dilutionBound, now);
    }
}