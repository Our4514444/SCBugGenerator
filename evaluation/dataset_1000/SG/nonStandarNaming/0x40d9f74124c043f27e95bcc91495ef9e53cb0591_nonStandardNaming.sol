                                                                 

pragma solidity 0.5.17;

library SafeMath { // wrappers over solidity arithmetic operations with overflow checks
    function ADD331(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }
    
    function SUB991(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }
    
    function MUL648(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function DIV346(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0);
        uint256 c = a / b;

        return c;
    }
}

contract ReentrancyGuard { // contract module that helps prevent reentrant calls to a function
    uint256 private constant _not_entered116 = 1;	//inject NONSTANDARD NAMING
    uint256 private constant _entered683 = 2;	//inject NONSTANDARD NAMING

    uint256 private _status;

    constructor () internal {
        _status = _not_entered116;
    }

    modifier NONREENTRANT853() {	//inject NONSTANDARD NAMING
        require(_status != _entered683, "reentrant call");

        _status = _entered683;
        
        _;
        
        _status = _not_entered116;
    }
}

interface IERC20 { // brief interface for erc20 token txs
    function BALANCEOF283(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    
    function TRANSFER948(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM417(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
}

interface IWETH { // brief interface for canonical ether token wrapper contract 
    function DEPOSIT165() payable external;	//inject NONSTANDARD NAMING
    
    function TRANSFER948(address dst, uint wad) external returns (bool);	//inject NONSTANDARD NAMING
}

contract MysticMoloch is ReentrancyGuard { 
    using SafeMath for uint256;

                                                              
    address public depositToken; // deposit token contract reference - default = wETH
    address public stakeToken; // stake token contract reference for guild voting shares 
    address public wETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // canonical ether token wrapper contract reference for proposals
    
    uint256 public proposalDeposit; // default = 10 deposit token 
    uint256 public processingReward; // default = 0.1 - amount of deposit token to give to whoever processes a proposal
    uint256 public periodDuration; // default = 17280 = 4.8 hours in seconds (5 periods per day)
    uint256 public votingPeriodLength; // default = 35 periods (7 days)
    uint256 public gracePeriodLength; // default = 35 periods (7 days)
    uint256 public dilutionBound; // default = 3 - maximum multiplier a YES voter will be obligated to pay in case of mass ragequit
    uint256 public summoningTime; // needed to determine the current period
    
    // HARD-CODED LIMITS
    // These numbers are quite arbitrary; they are small enough to avoid overflows when doing calculations
    // with periods or shares, yet big enough to not limit reasonable use cases.
    uint256 constant max_guild_bound215 = 10**36; // maximum bound for guild shares & loot (reflects guild token 18 decimal default)	//inject NONSTANDARD NAMING
    uint256 constant max_token_whitelist_count908 = 400; // maximum number of whitelisted tokens	//inject NONSTANDARD NAMING
    uint256 constant max_token_guildbank_count343 = 200; // maximum number of tokens with non-zero balance in guildbank	//inject NONSTANDARD NAMING

    // BANK TOKEN DETAILS
    string private _name = "Moloch DAO v2x Bank";
    string private _symbol = "MOL-V2X";
    uint8 private _decimals = 18;

    // **************
    // EVENT TRACKING
    // **************
    event SUBMITPROPOSAL320(address indexed applicant, uint256 sharesRequested, uint256 lootRequested, uint256 tributeOffered, address tributeToken, uint256 paymentRequested, address paymentToken, bytes32 details, uint8[7] flags, bytes data, uint256 proposalId, address indexed delegateKey, address indexed memberAddress);	//inject NONSTANDARD NAMING
    event CANCELPROPOSAL533(uint256 indexed proposalId, address applicantAddress);	//inject NONSTANDARD NAMING
    event SPONSORPROPOSAL371(address indexed delegateKey, address indexed memberAddress, uint256 proposalId, uint256 proposalIndex, uint256 startingPeriod);	//inject NONSTANDARD NAMING
    event SUBMITVOTE1(uint256 proposalId, uint256 indexed proposalIndex, address indexed delegateKey, address indexed memberAddress, uint8 uintVote);	//inject NONSTANDARD NAMING
    event PROCESSPROPOSAL734(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSACTIONPROPOSAL399(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSWHITELISTPROPOSAL818(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSGUILDKICKPROPOSAL983(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event UPDATEDELEGATEKEY608(address indexed memberAddress, address newDelegateKey);	//inject NONSTANDARD NAMING
    event TRANSFER486(address indexed from, address indexed to, uint256 amount); // guild token mint, burn & (loot) transfer tracking	//inject NONSTANDARD NAMING
    event RAGEQUIT552(address indexed memberAddress, uint256 sharesToBurn, uint256 lootToBurn);	//inject NONSTANDARD NAMING
    event TOKENSCOLLECTED308(address indexed token, uint256 amountToCollect);	//inject NONSTANDARD NAMING
    event WITHDRAW376(address indexed memberAddress, address token, uint256 amount);	//inject NONSTANDARD NAMING
    
    // *******************
    // INTERNAL ACCOUNTING
    // *******************
    address public constant guild449 = address(0xdead);	//inject NONSTANDARD NAMING
    address public constant escrow316 = address(0xdeaf);	//inject NONSTANDARD NAMING
    address public constant total993 = address(0xdeed);	//inject NONSTANDARD NAMING
    
    uint256 public proposalCount; // total proposals submitted
    uint256 public totalShares; // total shares across all members
    uint256 public totalLoot; // total loot across all members
    uint256 public totalGuildBankTokens; // total tokens with non-zero balance in guild bank

    mapping(uint256 => bytes) public actions; // proposalId => action data
    mapping(address => uint256) private balances; // guild token balances
    mapping(address => mapping(address => uint256)) private userTokenBalances; // userTokenBalances[userAddress][tokenAddress]

    enum Vote {
        Null, // default value, counted as abstention
        Yes,
        No
    }
    
    struct Member {
        address delegateKey; // the key responsible for submitting proposals & voting - defaults to member address unless updated
        uint8 exists; // always true (1) once a member has been created
        uint256 shares; // the # of voting shares assigned to this member
        uint256 loot; // the loot amount available to this member (combined with shares on ragekick) - transferable by guild token
        uint256 highestIndexYesVote; // highest proposal index # on which the member voted YES
        uint256 jailed; // set to proposalIndex of a passing guild kick proposal for this member, prevents voting on & sponsoring proposals
    }
    
    struct Proposal {
        address applicant; // the applicant who wishes to become a member - this key will be used for withdrawals (doubles as target for alt. proposals)
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

    uint256[] public proposalQueue;

    modifier ONLYDELEGATE845 {	//inject NONSTANDARD NAMING
        require(members[memberAddressByDelegateKey[msg.sender]].shares > 0, "!delegate");
        _;
    }
    
    constructor(
        address _depositToken,
        address _stakeToken,
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
        require(_depositToken != _stakeToken, "depositToken==stakeToken");
        require(_summoner.length == _summonerShares.length, "summoner!=summonerShares");
        
        for (uint256 i = 0; i < _summoner.length; i++) {
            REGISTERMEMBER709(_summoner[i], _summonerShares[i]);
            MINTGUILDTOKEN359(_summoner[i], _summonerShares[i]);
            totalShares += _summonerShares[i];
        }
        
        require(totalShares <= max_guild_bound215, "guild maxed");
        
        tokenWhitelist[_depositToken] = true;
        approvedTokens.push(_depositToken);
        
        if (_summonerDeposit > 0) {
            totalGuildBankTokens += 1;
            UNSAFEADDTOBALANCE817(guild449, _depositToken, _summonerDeposit);
        }
        
        depositToken = _depositToken;
        stakeToken = _stakeToken;
        proposalDeposit = _proposalDeposit;
        processingReward = _processingReward;
        periodDuration = _periodDuration;
        votingPeriodLength = _votingPeriodLength;
        gracePeriodLength = _gracePeriodLength;
        dilutionBound = _dilutionBound;
        summoningTime = now;
    }
    
                                                                    
    function SUBMITPROPOSAL506(	//inject NONSTANDARD NAMING
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        bytes32 details
    ) payable external NONREENTRANT853 returns (uint256 proposalId) {
        require(sharesRequested.ADD331(lootRequested) <= max_guild_bound215, "guild maxed");
        require(tokenWhitelist[tributeToken], "tributeToken!=whitelist");
        require(tokenWhitelist[paymentToken], "paymentToken!=whitelist");
        require(applicant != guild449 && applicant != escrow316 && applicant != total993, "applicant unreservable");
        require(members[applicant].jailed == 0, "applicant jailed");

        if (tributeOffered > 0 && userTokenBalances[guild449][tributeToken] == 0) {
            require(totalGuildBankTokens < max_token_guildbank_count343, "guildbank maxed");
        }
        
        // collect tribute from proposer & store it in the Moloch until the proposal is processed - if ether, wrap into wETH
        if (tributeToken == wETH && msg.value > 0) {
            require(msg.value == tributeOffered, "insufficient ETH");
            IWETH(wETH).DEPOSIT165();
            (bool success, ) = wETH.call.value(msg.value)("");
            require(success, "!transfer");
            IWETH(wETH).TRANSFER948(address(this), msg.value);
        } else {
            require(IERC20(tributeToken).TRANSFERFROM417(msg.sender, address(this), tributeOffered), "!transfer");
        }
        
        UNSAFEADDTOBALANCE817(escrow316, tributeToken, tributeOffered);

        uint8[7] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action]

        _SUBMITPROPOSAL498(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags, "");
        
        return proposalCount - 1; // return proposalId - contracts calling submit might want it
    }
    
    function SUBMITACTIONPROPOSAL64( // stages arbitrary function calls for member vote - based on Raid Guild 'Minion'	//inject NONSTANDARD NAMING
        address actionTo,
        address actionToken,
        uint256 actionTokenAmount,
        uint256 actionValue,
        bytes calldata data,
        bytes32 details
    ) external returns (uint256 proposalId) {
        
        uint8[7] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action]
        flags[6] = 1; // guild action
        
        _SUBMITPROPOSAL498(actionTo, 0, 0, actionValue, address(0), actionTokenAmount, actionToken, details, flags, data);
        
        return proposalCount - 1;
    }
    
    function SUBMITWHITELISTPROPOSAL550(address tokenToWhitelist, bytes32 details) external returns (uint256 proposalId) {	//inject NONSTANDARD NAMING
        require(tokenToWhitelist != address(0), "!token");
        require(tokenToWhitelist != stakeToken, "whitelist==stakeToken");
        require(!tokenWhitelist[tokenToWhitelist], "whitelisted");
        require(approvedTokens.length < max_token_whitelist_count908, "whitelist maxed");

        uint8[7] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action]
        flags[4] = 1; // whitelist

        _SUBMITPROPOSAL498(address(0), 0, 0, 0, tokenToWhitelist, 0, address(0), details, flags, "");
        
        return proposalCount - 1;
    }
    
    function SUBMITGUILDKICKPROPOSAL953(address memberToKick, bytes32 details) external returns (uint256 proposalId) {	//inject NONSTANDARD NAMING
        Member memory member = members[memberToKick];

        require(member.shares > 0 || member.loot > 0, "!share||loot");
        require(members[memberToKick].jailed == 0, "jailed");

        uint8[7] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick, action]
        flags[5] = 1; // guild kick

        _SUBMITPROPOSAL498(memberToKick, 0, 0, 0, address(0), 0, address(0), details, flags, "");
        
        return proposalCount - 1;
    }
    
    function _SUBMITPROPOSAL498(	//inject NONSTANDARD NAMING
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        bytes32 details,
        uint8[7] memory flags,
        bytes memory data
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
        
        if (proposal.flags[6] == 1) {
            actions[proposalCount] = data;
        }
        
        proposals[proposalCount] = proposal;
        address memberAddress = memberAddressByDelegateKey[msg.sender];
        // NOTE: argument order matters, avoid stack too deep
        emit SUBMITPROPOSAL320(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags, data, proposalCount, msg.sender, memberAddress);
        
        proposalCount += 1;
    }

    function SPONSORPROPOSAL335(uint256 proposalId) external NONREENTRANT853 ONLYDELEGATE845 {	//inject NONSTANDARD NAMING
        // collect proposal deposit from sponsor & store it in the Moloch until the proposal is processed
        require(IERC20(depositToken).TRANSFERFROM417(msg.sender, address(this), proposalDeposit), "!transfer");
        UNSAFEADDTOBALANCE817(escrow316, depositToken, proposalDeposit);

        Proposal storage proposal = proposals[proposalId];

        require(proposal.proposer != address(0), "!proposed");
        require(proposal.flags[0] == 0, "sponsored");
        require(proposal.flags[3] == 0, "cancelled");
        require(members[proposal.applicant].jailed == 0, "applicant jailed");

        if (proposal.tributeOffered > 0 && userTokenBalances[guild449][proposal.tributeToken] == 0) {
            require(totalGuildBankTokens < max_token_guildbank_count343, "guildbank maxed");
        }

        // whitelist proposal
        if (proposal.flags[4] == 1) {
            require(!tokenWhitelist[address(proposal.tributeToken)], "whitelisted");
            require(!proposedToWhitelist[address(proposal.tributeToken)], "whitelist proposed");
            require(approvedTokens.length < max_token_whitelist_count908, "whitelist maxed");
            proposedToWhitelist[address(proposal.tributeToken)] = true;

        // guild kick proposal
        } else if (proposal.flags[5] == 1) {
            require(!proposedToKick[proposal.applicant], "kick proposed");
            proposedToKick[proposal.applicant] = true;
        }

        // compute startingPeriod for proposal
        uint256 startingPeriod = MAX26(
            GETCURRENTPERIOD206(),
            proposalQueue.length == 0 ? 0 : proposals[proposalQueue[proposalQueue.length - 1]].startingPeriod
        ) + 1;

        proposal.startingPeriod = startingPeriod;

        address memberAddress = memberAddressByDelegateKey[msg.sender];
        proposal.sponsor = memberAddress;

        proposal.flags[0] = 1; // sponsored

        // append proposal to the queue
        proposalQueue.push(proposalId);
        
        emit SPONSORPROPOSAL371(msg.sender, memberAddress, proposalId, proposalQueue.length - 1, startingPeriod);
    }

    // NOTE: In MolochV2 proposalIndex != proposalId
    function SUBMITVOTE419(uint256 proposalIndex, uint8 uintVote) external ONLYDELEGATE845 {	//inject NONSTANDARD NAMING
        address memberAddress = memberAddressByDelegateKey[msg.sender];
        Member storage member = members[memberAddress];

        require(proposalIndex < proposalQueue.length, "!proposed");
        Proposal storage proposal = proposals[proposalQueue[proposalIndex]];

        require(uintVote < 3, "!<3");
        Vote vote = Vote(uintVote);

        require(GETCURRENTPERIOD206() >= proposal.startingPeriod, "pending");
        require(!HASVOTINGPERIODEXPIRED552(proposal.startingPeriod), "expired");
        require(proposal.votesByMember[memberAddress] == Vote.Null, "voted");
        require(vote == Vote.Yes || vote == Vote.No, "!Yes||No");

        proposal.votesByMember[memberAddress] = vote;

        if (vote == Vote.Yes) {
            proposal.yesVotes += member.shares;

            // set highest index (latest) yes vote - must be processed for member to ragequit
            if (proposalIndex > member.highestIndexYesVote) {
                member.highestIndexYesVote = proposalIndex;
            }

            // set maximum of total shares encountered at a yes vote - used to bound dilution for yes voters
            if (TOTALSUPPLY378() > proposal.maxTotalSharesAndLootAtYesVote) {
                proposal.maxTotalSharesAndLootAtYesVote = TOTALSUPPLY378();
            }

        } else if (vote == Vote.No) {
            proposal.noVotes += member.shares;
        }
     
        // NOTE: subgraph indexes by proposalId not proposalIndex since proposalIndex isn't set until it's been sponsored but proposal is created on submission
        emit SUBMITVOTE1(proposalQueue[proposalIndex], proposalIndex, msg.sender, memberAddress, uintVote);
    }

    function PROCESSPROPOSAL181(uint256 proposalIndex) external {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING433(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[4] == 0 && proposal.flags[5] == 0 && proposal.flags[6] == 0, "!standard");

        proposal.flags[1] = 1; // processed

        bool didPass = _DIDPASS629(proposalIndex);

        // Make the proposal fail if the new total number of shares & loot exceeds the limit
        if (TOTALSUPPLY378().ADD331(proposal.sharesRequested).ADD331(proposal.lootRequested) > max_guild_bound215) {
            didPass = false;
        }

        // Make the proposal fail if it is requesting more tokens as payment than the available guild bank balance
        if (proposal.paymentRequested > userTokenBalances[guild449][proposal.paymentToken]) {
            didPass = false;
        }

        // Make the proposal fail if it would result in too many tokens with non-zero balance in guild bank
        if (proposal.tributeOffered > 0 && userTokenBalances[guild449][proposal.tributeToken] == 0 && totalGuildBankTokens >= max_token_guildbank_count343) {
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
                REGISTERMEMBER709(proposal.applicant, proposal.sharesRequested);
            }

            // mint new guild token, shares & loot 
            MINTGUILDTOKEN359(proposal.applicant, proposal.sharesRequested + proposal.lootRequested);
            totalShares += proposal.sharesRequested;
            totalLoot += proposal.lootRequested;

            // if the proposal tribute is the first token of its kind to make it into the guild bank, increment total guild bank tokens
            if (userTokenBalances[guild449][proposal.tributeToken] == 0 && proposal.tributeOffered > 0) {
                totalGuildBankTokens += 1;
            }

            UNSAFEINTERNALTRANSFER363(escrow316, guild449, proposal.tributeToken, proposal.tributeOffered);
            UNSAFEINTERNALTRANSFER363(guild449, proposal.applicant, proposal.paymentToken, proposal.paymentRequested);

            // if the proposal spends 100% of guild bank balance for a token, decrement total guild bank tokens
            if (userTokenBalances[guild449][proposal.paymentToken] == 0 && proposal.paymentRequested > 0) {
                totalGuildBankTokens -= 1;
            }

        // PROPOSAL FAILED
        } else {
            // return all tokens to the proposer (not the applicant, because funds come from proposer)
            UNSAFEINTERNALTRANSFER363(escrow316, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        }

        _RETURNDEPOSIT42(proposal.sponsor);
        
        emit PROCESSPROPOSAL734(proposalIndex, proposalId, didPass);
    }
    
    function PROCESSACTIONPROPOSAL8(uint256 proposalIndex) external NONREENTRANT853 returns (bool, bytes memory) {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING433(proposalIndex);
        
        uint256 proposalId = proposalQueue[proposalIndex];
        bytes memory action = actions[proposalId];
        Proposal storage proposal = proposals[proposalId];
        
        require(proposal.flags[6] == 1, "!action");

        proposal.flags[1] = 1; // processed

        bool didPass = _DIDPASS629(proposalIndex);
        
        // Make the proposal fail if it is requesting more ether than the available local balance
        if (proposal.paymentToken == address(0) && proposal.tributeOffered > address(this).balance) {
            didPass = false;
        }
        
        // Make the proposal fail if it is requesting more stake token than the available local balance
        if (proposal.paymentToken == stakeToken && proposal.paymentRequested > IERC20(stakeToken).BALANCEOF283(address(this))) {
            didPass = false;
        }
        
        // Make the proposal fail if it is requesting more tokens than the available guild bank balance
        if (proposal.paymentToken != address(0) && proposal.paymentToken != stakeToken && proposal.paymentRequested > userTokenBalances[guild449][proposal.paymentToken]) {
            didPass = false;
        }

        if (didPass == true) {
            proposal.flags[2] = 1; // didPass
            (bool success, bytes memory retData) = proposal.applicant.call.value(proposal.tributeOffered)(action);
            if (proposal.paymentToken != address(0) && proposal.paymentToken != stakeToken) {
                UNSAFESUBTRACTFROMBALANCE336(guild449, proposal.paymentToken, proposal.paymentRequested);
                // if the action proposal spends 100% of guild bank balance for a token, decrement total guild bank tokens
                if (userTokenBalances[guild449][proposal.paymentToken] == 0 && proposal.paymentRequested > 0) {totalGuildBankTokens -= 1;}
            }
            return (success, retData);
        }
        
        emit PROCESSACTIONPROPOSAL399(proposalIndex, proposalId, didPass);
    }

    function PROCESSWHITELISTPROPOSAL101(uint256 proposalIndex) external {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING433(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[4] == 1, "!whitelist");

        proposal.flags[1] = 1; // processed

        bool didPass = _DIDPASS629(proposalIndex);

        if (approvedTokens.length >= max_token_whitelist_count908) {
            didPass = false;
        }

        if (didPass == true) {
            proposal.flags[2] = 1; // didPass

            tokenWhitelist[address(proposal.tributeToken)] = true;
            approvedTokens.push(proposal.tributeToken);
        }

        proposedToWhitelist[address(proposal.tributeToken)] = false;

        _RETURNDEPOSIT42(proposal.sponsor);
        
        emit PROCESSWHITELISTPROPOSAL818(proposalIndex, proposalId, didPass);
    }

    function PROCESSGUILDKICKPROPOSAL296(uint256 proposalIndex) external {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING433(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[5] == 1, "!kick");

        proposal.flags[1] = 1; // processed

        bool didPass = _DIDPASS629(proposalIndex);

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

        _RETURNDEPOSIT42(proposal.sponsor);
        
        emit PROCESSGUILDKICKPROPOSAL983(proposalIndex, proposalId, didPass);
    }

    function _DIDPASS629(uint256 proposalIndex) internal view returns (bool didPass) {	//inject NONSTANDARD NAMING
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];
        
        if (proposal.yesVotes > proposal.noVotes) {
            didPass = true;
        }
        
        // Make the proposal fail if the dilutionBound is exceeded
        if ((TOTALSUPPLY378().MUL648(dilutionBound)) < proposal.maxTotalSharesAndLootAtYesVote) {
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

    function _VALIDATEPROPOSALFORPROCESSING433(uint256 proposalIndex) internal view {	//inject NONSTANDARD NAMING
        require(proposalIndex < proposalQueue.length, "!proposal");
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];

        require(GETCURRENTPERIOD206() >= proposal.startingPeriod + votingPeriodLength + gracePeriodLength, "!ready");
        require(proposal.flags[1] == 0, "processed");
        require(proposalIndex == 0 || proposals[proposalQueue[proposalIndex - 1]].flags[1] == 1, "prior !processed");
    }

    function _RETURNDEPOSIT42(address sponsor) internal {	//inject NONSTANDARD NAMING
        UNSAFEINTERNALTRANSFER363(escrow316, msg.sender, depositToken, processingReward);
        UNSAFEINTERNALTRANSFER363(escrow316, sponsor, depositToken, proposalDeposit - processingReward);
    }

    function RAGEQUIT846(uint256 sharesToBurn, uint256 lootToBurn) external {	//inject NONSTANDARD NAMING
        require(members[msg.sender].exists == 1, "!member");
        
        _RAGEQUIT161(msg.sender, sharesToBurn, lootToBurn);
    }

    function _RAGEQUIT161(address memberAddress, uint256 sharesToBurn, uint256 lootToBurn) internal {	//inject NONSTANDARD NAMING
        uint256 initialTotalSharesAndLoot = TOTALSUPPLY378();

        Member storage member = members[memberAddress];

        require(member.shares >= sharesToBurn, "insufficient shares");
        require(member.loot >= lootToBurn, "insufficient loot");

        require(CANRAGEQUIT887(member.highestIndexYesVote), "!ragequit until highest index proposal member voted YES processes");

        uint256 sharesAndLootToBurn = sharesToBurn.ADD331(lootToBurn);

        // burn guild token, shares & loot
        BURNGUILDTOKEN372(memberAddress, sharesAndLootToBurn);
        member.shares -= sharesToBurn;
        member.loot -= lootToBurn;
        totalShares -= sharesToBurn;
        totalLoot -= lootToBurn;

        for (uint256 i = 0; i < approvedTokens.length; i++) {
            uint256 amountToRagequit = FAIRSHARE77(userTokenBalances[guild449][approvedTokens[i]], sharesAndLootToBurn, initialTotalSharesAndLoot);
            if (amountToRagequit > 0) { // gas optimization to allow a higher maximum token limit
                // deliberately not using safemath here to keep overflows from preventing the function execution (which would break ragekicks)
                // if a token overflows, it is because the supply was artificially inflated to oblivion, so we probably don't care about it anyways
                userTokenBalances[guild449][approvedTokens[i]] -= amountToRagequit;
                userTokenBalances[memberAddress][approvedTokens[i]] += amountToRagequit;
            }
        }

        emit RAGEQUIT552(memberAddress, sharesToBurn, lootToBurn);
    }

    function RAGEKICK181(address memberToKick) external {	//inject NONSTANDARD NAMING
        Member storage member = members[memberToKick];

        require(member.jailed != 0, "!jailed");
        require(member.loot > 0, "!loot"); // note - should be impossible for jailed member to have shares
        require(CANRAGEQUIT887(member.highestIndexYesVote), "!ragequit until highest index proposal member voted YES processes");

        _RAGEQUIT161(memberToKick, 0, member.loot);
    }
    
    function WITHDRAWBALANCE572(address token, uint256 amount) external NONREENTRANT853 {	//inject NONSTANDARD NAMING
        _WITHDRAWBALANCE182(token, amount);
    }

    function WITHDRAWBALANCES191(address[] calldata tokens, uint256[] calldata amounts, bool max) external NONREENTRANT853 {	//inject NONSTANDARD NAMING
        require(tokens.length == amounts.length, "tokens!=amounts");

        for (uint256 i=0; i < tokens.length; i++) {
            uint256 withdrawAmount = amounts[i];
            if (max) { // withdraw the maximum balance
                withdrawAmount = userTokenBalances[msg.sender][tokens[i]];
            }

            _WITHDRAWBALANCE182(tokens[i], withdrawAmount);
        }
    }
    
    function _WITHDRAWBALANCE182(address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(userTokenBalances[msg.sender][token] >= amount, "!balance");
        
        require(IERC20(token).TRANSFER948(msg.sender, amount), "!transfer");
        UNSAFESUBTRACTFROMBALANCE336(msg.sender, token, amount);
        
        emit WITHDRAW376(msg.sender, token, amount);
    }

    function COLLECTTOKENS6(address token) external {	//inject NONSTANDARD NAMING
        uint256 amountToCollect = IERC20(token).BALANCEOF283(address(this)) - userTokenBalances[total993][token];
        // only collect if 1) there are tokens to collect & 2) token is whitelisted
        require(amountToCollect > 0, "!amount");
        require(tokenWhitelist[token], "!whitelisted");
        
        if (userTokenBalances[guild449][token] == 0 && totalGuildBankTokens < max_token_guildbank_count343) {totalGuildBankTokens += 1;}
        UNSAFEADDTOBALANCE817(guild449, token, amountToCollect);

        emit TOKENSCOLLECTED308(token, amountToCollect);
    }

    // NOTE: requires that delegate key which sent the original proposal cancels, msg.sender == proposal.proposer
    function CANCELPROPOSAL351(uint256 proposalId) external {	//inject NONSTANDARD NAMING
        Proposal storage proposal = proposals[proposalId];
        require(proposal.flags[0] == 0, "sponsored");
        require(proposal.flags[3] == 0, "cancelled");
        require(msg.sender == proposal.proposer, "!proposer");

        proposal.flags[3] = 1; // cancelled
        
        UNSAFEINTERNALTRANSFER363(escrow316, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        
        emit CANCELPROPOSAL533(proposalId, msg.sender);
    }

    function UPDATEDELEGATEKEY933(address newDelegateKey) external {	//inject NONSTANDARD NAMING
        require(members[msg.sender].shares > 0, "caller !shareholder");
        require(newDelegateKey != address(0), "newDelegateKey==0");

        // skip checks if member is setting the delegate key to their member address
        if (newDelegateKey != msg.sender) {
            require(members[newDelegateKey].exists == 0, "cannot overwrite members");
            require(members[memberAddressByDelegateKey[newDelegateKey]].exists == 0, "cannot overwrite keys");
        }

        Member storage member = members[msg.sender];
        memberAddressByDelegateKey[member.delegateKey] = address(0);
        memberAddressByDelegateKey[newDelegateKey] = msg.sender;
        member.delegateKey = newDelegateKey;

        emit UPDATEDELEGATEKEY608(msg.sender, newDelegateKey);
    }
    
    // can only ragequit if the latest proposal you voted YES on has been processed
    function CANRAGEQUIT887(uint256 highestIndexYesVote) public view returns (bool) {	//inject NONSTANDARD NAMING
        require(highestIndexYesVote < proposalQueue.length, "!proposal");
        
        return proposals[proposalQueue[highestIndexYesVote]].flags[1] == 1;
    }

    function HASVOTINGPERIODEXPIRED552(uint256 startingPeriod) public view returns (bool) {	//inject NONSTANDARD NAMING
        return GETCURRENTPERIOD206() >= startingPeriod + votingPeriodLength;
    }
    
                                                              
    function MAX26(uint256 x, uint256 y) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }
    
    function GETCURRENTPERIOD206() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now.SUB991(summoningTime).DIV346(periodDuration);
    }
    
    function GETMEMBERPROPOSALVOTE633(address memberAddress, uint256 proposalIndex) public view returns (Vote) {	//inject NONSTANDARD NAMING
        require(members[memberAddress].exists == 1, "!member");
        require(proposalIndex < proposalQueue.length, "!proposed");
        
        return proposals[proposalQueue[proposalIndex]].votesByMember[memberAddress];
    }

    function GETPROPOSALFLAGS860(uint256 proposalId) public view returns (uint8[7] memory) {	//inject NONSTANDARD NAMING
        return proposals[proposalId].flags;
    }
    
    function GETPROPOSALQUEUELENGTH230() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return proposalQueue.length;
    }
    
    function GETTOKENCOUNT633() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return approvedTokens.length;
    }

    function GETUSERTOKENBALANCE729(address user, address token) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return userTokenBalances[user][token];
    }
    
                                                              
    function() external payable {}
    
    function FAIRSHARE77(uint256 balance, uint256 shares, uint256 totalSharesAndLoot) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(totalSharesAndLoot != 0);

        if (balance == 0) { return 0; }

        uint256 prod = balance * shares;

        if (prod / balance == shares) { // no overflow in multiplication above?
            return prod / totalSharesAndLoot;
        }

        return (balance / totalSharesAndLoot) * shares;
    }
    
    function REGISTERMEMBER709(address newMember, uint256 shares) internal {	//inject NONSTANDARD NAMING
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
    
    function UNSAFEADDTOBALANCE817(address user, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        userTokenBalances[user][token] += amount;
        userTokenBalances[total993][token] += amount;
    }
    
    function UNSAFEINTERNALTRANSFER363(address from, address to, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        UNSAFESUBTRACTFROMBALANCE336(from, token, amount);
        UNSAFEADDTOBALANCE817(to, token, amount);
    }

    function UNSAFESUBTRACTFROMBALANCE336(address user, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        userTokenBalances[user][token] -= amount;
        userTokenBalances[total993][token] -= amount;
    }
    
                                                                             
    // GETTER FUNCTIONS
    function BALANCEOF283(address account) external view returns (uint256) { 	//inject NONSTANDARD NAMING
        return balances[account];
    }
    
    function NAME497() external view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL567() external view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS528() external view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
    
    function TOTALSUPPLY378() public view returns (uint256) { 	//inject NONSTANDARD NAMING
        return totalShares + totalLoot;
    }
    
    // BALANCE MGMT FUNCTIONS
    function BURNGUILDTOKEN372(address memberAddress, uint256 amount) internal {	//inject NONSTANDARD NAMING
        balances[memberAddress] -= amount;
        
        emit TRANSFER486(memberAddress, address(0), amount);
    }
    
    function CLAIMSHARES871(uint256 amount) external NONREENTRANT853 {	//inject NONSTANDARD NAMING
        require(IERC20(stakeToken).TRANSFERFROM417(msg.sender, address(this), amount), "!transfer"); // deposit stake token & claim shares (1:1)
        
        // if the sender is already a member, add to their existing shares 
        if (members[msg.sender].exists == 1) {
            members[msg.sender].shares = members[msg.sender].shares.ADD331(amount);

        // if the sender is a new member, create a new record for them
        } else {
            REGISTERMEMBER709(msg.sender, amount);
        }

        // mint new guild token & shares 
        MINTGUILDTOKEN359(msg.sender, amount);
        totalShares += amount;
            
        require(totalShares <= max_guild_bound215, "guild maxed");
    }
    
    function CONVERTSHARESTOLOOT780(uint256 sharesToLoot) external {	//inject NONSTANDARD NAMING
        members[msg.sender].shares -= sharesToLoot;
        members[msg.sender].loot += sharesToLoot;
    }
    
    function MINTGUILDTOKEN359(address memberAddress, uint256 amount) internal {	//inject NONSTANDARD NAMING
        balances[memberAddress] += amount;
        
        emit TRANSFER486(address(0), memberAddress, amount);
    }

    // LOOT TRANSFER FUNCTION
    function TRANSFER948(address receiver, uint256 lootToTransfer) external returns (bool) {	//inject NONSTANDARD NAMING
        members[msg.sender].loot -= lootToTransfer;
        members[receiver].loot += lootToTransfer;
        
        balances[msg.sender] -= lootToTransfer;
        balances[receiver] += lootToTransfer;
        
        emit TRANSFER486(msg.sender, receiver, lootToTransfer);
        
        return true;
    }
}

contract MysticMolochSummoner { 
    MysticMoloch private baal;

    event SUMMONMOLOCH225(address indexed baal, address depositToken, address stakeToken, address[] summoner, uint256[] summonerShares, uint256 summoningDeposit, uint256 proposalDeposit, uint256 processingReward, uint256 periodDuration, uint256 votingPeriodLength, uint256 gracePeriodLength, uint256 dilutionBound, uint256 summoningTime);	//inject NONSTANDARD NAMING
 
    function SUMMONMOLOCH139(	//inject NONSTANDARD NAMING
        address _depositToken,
        address _stakeToken,
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
        baal = new MysticMoloch(
            _depositToken,
            _stakeToken,
            _summoner,
            _summonerShares,
            _summonerDeposit,
            _proposalDeposit,
            _processingReward,
            _periodDuration,
            _votingPeriodLength,
            _gracePeriodLength,
            _dilutionBound);
        
        require(IERC20(_depositToken).TRANSFERFROM417(msg.sender, address(baal), _summonerDeposit), "!transfer"); // transfer summoner deposit to new moloch

        emit SUMMONMOLOCH225(address(baal), _depositToken, _stakeToken, _summoner, _summonerShares, _summonerDeposit, _proposalDeposit, _processingReward, _periodDuration, _votingPeriodLength, _gracePeriodLength, _dilutionBound, now);
    }
}