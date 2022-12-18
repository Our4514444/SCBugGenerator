                                                                 

pragma solidity 0.5.17;

library SafeMath {
    function ADD432(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }
    
    function SUB438(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }
    
    function MUL944(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function DIV467(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0);
        uint256 c = a / b;

        return c;
    }
}

interface IERC20 { // brief interface for moloch erc20 token txs
    function BALANCEOF281(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
    
    function TRANSFER263(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM514(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
}

interface IWETH { // brief interface for ether wrapping contract 
    function DEPOSIT51() payable external;	//inject NONSTANDARD NAMING
    function TRANSFER263(address dst, uint wad) external returns (bool);	//inject NONSTANDARD NAMING
}

contract ReentrancyGuard {
    uint256 private constant _not_entered699 = 1;	//inject NONSTANDARD NAMING
    uint256 private constant _entered922 = 2;	//inject NONSTANDARD NAMING

    uint256 private _status;

    constructor () internal {
        _status = _not_entered699;
    }

    modifier NONREENTRANT30() {	//inject NONSTANDARD NAMING
        require(_status != _entered922, "reentrant call");

        _status = _entered922;
        
        _;
        
        _status = _not_entered699;
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
    uint256 public summoningRate; // rate to convert into shares during summoning time (default = 1000000000000000000 wei amt. // 1 wETH => 1 share)
    uint256 public summoningTermination; // termination time for summoning tribute in moloch periods
    uint256 public summoningTime; // needed to determine the current period

    address public depositToken; // deposit token contract reference; default = wETH
    address public wETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // wrapping contract for raw payable ether

    // HARD-CODED LIMITS
    // These numbers are quite arbitrary; they are small enough to avoid overflows when doing calculations
    // with periods or shares, yet big enough to not limit reasonable use cases.
    uint256 constant max_input751 = 10**18; // maximum bound for reasonable limits	//inject NONSTANDARD NAMING
    uint256 constant max_token_whitelist_count231 = 400; // maximum number of whitelisted tokens	//inject NONSTANDARD NAMING
    uint256 constant max_token_guildbank_count949 = 200; // maximum number of tokens with non-zero balance in guildbank	//inject NONSTANDARD NAMING

    // ***************
    // EVENTS
    // ***************
    event SUMMONCOMPLETE71(address[] indexed summoners, address[] tokens, uint256 summoningTime, uint256 periodDuration, uint256 votingPeriodLength, uint256 gracePeriodLength, uint256 proposalDeposit, uint256 dilutionBound, uint256 processingReward, uint256 summonerStake, uint256 summoningDeposit, uint256 summoningRate, uint256 summoningTermination);	//inject NONSTANDARD NAMING
    event MAKESUMMONINGTRIBUTE404(address indexed memberAddress, uint256 indexed tribute, uint256 indexed shares);	//inject NONSTANDARD NAMING
    event SUBMITPROPOSAL886(address indexed applicant, uint256 sharesRequested, uint256 lootRequested, uint256 tributeOffered, address tributeToken, uint256 paymentRequested, address paymentToken, bytes32 details, bool[6] flags, uint256 proposalId, address indexed delegateKey, address indexed memberAddress);	//inject NONSTANDARD NAMING
    event SPONSORPROPOSAL633(address indexed delegateKey, address indexed memberAddress, uint256 proposalId, uint256 proposalIndex, uint256 startingPeriod);	//inject NONSTANDARD NAMING
    event SUBMITVOTE515(uint256 proposalId, uint256 indexed proposalIndex, address indexed delegateKey, address indexed memberAddress, uint8 uintVote);	//inject NONSTANDARD NAMING
    event PROCESSPROPOSAL661(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSWHITELISTPROPOSAL382(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event PROCESSGUILDKICKPROPOSAL715(uint256 indexed proposalIndex, uint256 indexed proposalId, bool didPass);	//inject NONSTANDARD NAMING
    event RAGEQUIT99(address indexed memberAddress, uint256 sharesToBurn, uint256 lootToBurn);	//inject NONSTANDARD NAMING
    event TOKENSCOLLECTED490(address indexed token, uint256 amountToCollect);	//inject NONSTANDARD NAMING
    event CANCELPROPOSAL571(uint256 indexed proposalId, address applicantAddress);	//inject NONSTANDARD NAMING
    event UPDATEDELEGATEKEY691(address indexed memberAddress, address newDelegateKey);	//inject NONSTANDARD NAMING
    event WITHDRAW41(address indexed memberAddress, address token, uint256 amount);	//inject NONSTANDARD NAMING

    // *******************
    // INTERNAL ACCOUNTING
    // *******************
    uint256 public proposalCount; // total proposals submitted
    uint256 public totalShares; // total shares across all members
    uint256 public totalLoot; // total loot across all members
    uint256 public totalGuildBankTokens; // total tokens with non-zero balance in guild bank

    address public constant guild70 = address(0xdead);	//inject NONSTANDARD NAMING
    address public constant escrow28 = address(0xbeef);	//inject NONSTANDARD NAMING
    address public constant total973 = address(0xbabe);	//inject NONSTANDARD NAMING
    mapping(address => mapping(address => uint256)) public userTokenBalances; // userTokenBalances[userAddress][tokenAddress]

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
        bytes32 details; // proposal details to add context for members 
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

    modifier ONLYMEMBER840 {	//inject NONSTANDARD NAMING
        require(members[msg.sender].shares > 0 || members[msg.sender].loot > 0, "not member");
        _;
    }

    modifier ONLYSHAREHOLDER343 {	//inject NONSTANDARD NAMING
        require(members[msg.sender].shares > 0, "not shareholder");
        _;
    }

    modifier ONLYDELEGATE139 {	//inject NONSTANDARD NAMING
        require(members[memberAddressByDelegateKey[msg.sender]].shares > 0, "not delegate");
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
        uint256 _processingReward,
        uint256 _summonerStake,
        uint256 _summoningDeposit,
        uint256 _summoningRate,
        uint256 _summoningTermination
    ) public {
        require(_votingPeriodLength <= max_input751, "_votingPeriodLength maxed");
        require(_gracePeriodLength <= max_input751, "_gracePeriodLength maxed");
        require(_dilutionBound <= max_input751, "_dilutionBound maxed");
        require(_approvedTokens.length <= max_token_whitelist_count231, "tokens maxed");
        
        depositToken = _approvedTokens[0];
        
        if (_summoningDeposit > 0) {
            totalGuildBankTokens += 1;
            UNSAFEADDTOBALANCE685(guild70, depositToken, _summoningDeposit);
        }
        
        // NOTE: move event up here, avoid stack too deep if too many approved tokens
        emit SUMMONCOMPLETE71(_summoners, _approvedTokens, now, _periodDuration, _votingPeriodLength, _gracePeriodLength, _proposalDeposit, _dilutionBound, _processingReward, _summonerStake, _summoningDeposit, _summoningRate, _summoningTermination);
        
        for (uint256 i = 0; i < _summoners.length; i++) {
            members[_summoners[i]] = Member(_summoners[i], _summonerStake, 0, true, 0, 0);
            memberAddressByDelegateKey[_summoners[i]] = _summoners[i];
        }
        
        totalShares = _summoners.length * _summonerStake;
        require(totalShares <= max_input751, "shares maxed");

        for (uint256 i = 0; i < _approvedTokens.length; i++) {
            require(!tokenWhitelist[_approvedTokens[i]], "token duplicated");
            tokenWhitelist[_approvedTokens[i]] = true;
            approvedTokens.push(_approvedTokens[i]);
        }
        
        periodDuration = _periodDuration;
        votingPeriodLength = _votingPeriodLength;
        gracePeriodLength = _gracePeriodLength;
        proposalDeposit = _proposalDeposit;
        dilutionBound = _dilutionBound;
        processingReward = _processingReward;
        summoningRate = _summoningRate;
        summoningTermination = _summoningTermination;
        summoningTime = now;
    }

    function MAKESUMMONINGTRIBUTE707(uint256 tribute) payable public {	//inject NONSTANDARD NAMING
        require(members[msg.sender].exists == true, "not member");
        require(GETCURRENTPERIOD572() <= summoningTermination, "summoning period over");        
        require(tribute >= summoningRate, "tribute insufficient");

        if (depositToken == wETH && msg.value > 0) {
            require(msg.value == tribute, "insufficient ETH");
            IWETH(wETH).DEPOSIT51();
            (bool success, ) = wETH.call.value(msg.value)("");
            require(success, "transfer failed");
            IWETH(wETH).TRANSFER263(address(this), msg.value);
        } else {
            require(IERC20(depositToken).TRANSFERFROM514(msg.sender, address(this), tribute), "transfer failed");
        }
        
        if (userTokenBalances[guild70][depositToken] == 0) {totalGuildBankTokens += 1;}
        UNSAFEADDTOBALANCE685(guild70, depositToken, tribute);
        
        uint256 shares = tribute.DIV467(summoningRate);
        require(totalShares + shares <= max_input751, "shares maxed");
        members[msg.sender].shares += shares;
        totalShares += shares;

        emit MAKESUMMONINGTRIBUTE404(msg.sender, tribute, shares);
    }
    
    function MAKEPAYMENT417(address paymentToken, uint256 payment) public {	//inject NONSTANDARD NAMING
        require(tokenWhitelist[paymentToken], "paymentToken not whitelisted");
        require(IERC20(paymentToken).TRANSFERFROM514(msg.sender, address(this), payment), "transfer failed");
        
        if (userTokenBalances[guild70][paymentToken] == 0) {totalGuildBankTokens += 1;}
        UNSAFEADDTOBALANCE685(guild70, paymentToken, payment);
    }
    
                                                                    
    function SUBMITPROPOSAL75(	//inject NONSTANDARD NAMING
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        bytes32 details
    ) payable public NONREENTRANT30 returns (uint256 proposalId) {
        require(sharesRequested.ADD432(lootRequested) <= max_input751, "shares maxed");
        require(tokenWhitelist[tributeToken], "tributeToken not whitelisted");
        require(tokenWhitelist[paymentToken], "paymentToken not whitelisted");
        require(applicant != address(0), "applicant zeroed");
        require(applicant != guild70 && applicant != escrow28 && applicant != total973, "applicant address unreservable");
        require(members[applicant].jailed == 0, "applicant jailed");

        if (tributeOffered > 0 && userTokenBalances[guild70][tributeToken] == 0) {
            require(totalGuildBankTokens < max_token_guildbank_count949, "guildbank maxed");
        }
        
        // collect tribute from proposer and store it in the Moloch until the proposal is processed
        if (tributeToken == wETH && msg.value > 0) {
            require(msg.value == tributeOffered, "insufficient ETH");
            IWETH(wETH).DEPOSIT51();
            (bool success, ) = wETH.call.value(msg.value)("");
            require(success, "transfer failed");
            IWETH(wETH).TRANSFER263(address(this), msg.value);
        } else {
            require(IERC20(tributeToken).TRANSFERFROM514(msg.sender, address(this), tributeOffered), "transfer failed");
        }
        
        UNSAFEADDTOBALANCE685(escrow28, tributeToken, tributeOffered);

        bool[6] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick]

        _SUBMITPROPOSAL325(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags);
        return proposalCount - 1; // return proposalId - contracts calling submit might want it
    }

    function SUBMITWHITELISTPROPOSAL362(address tokenToWhitelist, bytes32 details) public NONREENTRANT30 returns (uint256 proposalId) {	//inject NONSTANDARD NAMING
        require(tokenToWhitelist != address(0), "need token");
        require(!tokenWhitelist[tokenToWhitelist], "already whitelisted");
        require(approvedTokens.length < max_token_whitelist_count231, "whitelist maxed");

        bool[6] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick]
        flags[4] = true; // whitelist

        _SUBMITPROPOSAL325(address(0), 0, 0, 0, tokenToWhitelist, 0, address(0), details, flags);
        return proposalCount - 1;
    }

    function SUBMITGUILDKICKPROPOSAL817(address memberToKick, bytes32 details) public NONREENTRANT30 returns (uint256 proposalId) {	//inject NONSTANDARD NAMING
        Member memory member = members[memberToKick];

        require(member.shares > 0 || member.loot > 0, "must have share or loot");
        require(members[memberToKick].jailed == 0, "already jailed");

        bool[6] memory flags; // [sponsored, processed, didPass, cancelled, whitelist, guildkick]
        flags[5] = true; // guild kick

        _SUBMITPROPOSAL325(memberToKick, 0, 0, 0, address(0), 0, address(0), details, flags);
        return proposalCount - 1;
    }

    function _SUBMITPROPOSAL325(	//inject NONSTANDARD NAMING
        address applicant,
        uint256 sharesRequested,
        uint256 lootRequested,
        uint256 tributeOffered,
        address tributeToken,
        uint256 paymentRequested,
        address paymentToken,
        bytes32 details,
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
        emit SUBMITPROPOSAL886(applicant, sharesRequested, lootRequested, tributeOffered, tributeToken, paymentRequested, paymentToken, details, flags, proposalCount, msg.sender, memberAddress);
        proposalCount += 1;
    }

    function SPONSORPROPOSAL267(uint256 proposalId) public NONREENTRANT30 ONLYDELEGATE139 {	//inject NONSTANDARD NAMING
        // collect proposal deposit from sponsor and store it in the Moloch until the proposal is processed
        require(IERC20(depositToken).TRANSFERFROM514(msg.sender, address(this), proposalDeposit), "deposit failed");
        UNSAFEADDTOBALANCE685(escrow28, depositToken, proposalDeposit);

        Proposal storage proposal = proposals[proposalId];

        require(proposal.proposer != address(0), "unproposed");
        require(!proposal.flags[0], "already sponsored");
        require(!proposal.flags[3], "cancelled");
        require(members[proposal.applicant].jailed == 0, "applicant jailed");

        if (proposal.tributeOffered > 0 && userTokenBalances[guild70][proposal.tributeToken] == 0) {
            require(totalGuildBankTokens < max_token_guildbank_count949, "guildbank maxed");
        }

        // whitelist proposal
        if (proposal.flags[4]) {
            require(!tokenWhitelist[address(proposal.tributeToken)], "already whitelisted");
            require(!proposedToWhitelist[address(proposal.tributeToken)], "already whitelist proposed");
            require(approvedTokens.length < max_token_whitelist_count231, "whitelist maxed");
            proposedToWhitelist[address(proposal.tributeToken)] = true;

        // guild kick proposal
        } else if (proposal.flags[5]) {
            require(!proposedToKick[proposal.applicant], "kick already proposed");
            proposedToKick[proposal.applicant] = true;
        }

        // compute startingPeriod for proposal
        uint256 startingPeriod = MAX368(
            GETCURRENTPERIOD572(),
            proposalQueue.length == 0 ? 0 : proposals[proposalQueue[proposalQueue.length.SUB438(1)]].startingPeriod
        ).ADD432(1);

        proposal.startingPeriod = startingPeriod;

        address memberAddress = memberAddressByDelegateKey[msg.sender];
        proposal.sponsor = memberAddress;

        proposal.flags[0] = true; // sponsored

        // append proposal to the queue
        proposalQueue.push(proposalId);
        
        emit SPONSORPROPOSAL633(msg.sender, memberAddress, proposalId, proposalQueue.length.SUB438(1), startingPeriod);
    }

    // NOTE: In MolochV2 proposalIndex !== proposalId
    function SUBMITVOTE250(uint256 proposalIndex, uint8 uintVote) public NONREENTRANT30 ONLYDELEGATE139 {	//inject NONSTANDARD NAMING
        address memberAddress = memberAddressByDelegateKey[msg.sender];
        Member storage member = members[memberAddress];

        require(proposalIndex < proposalQueue.length, "unproposed");
        Proposal storage proposal = proposals[proposalQueue[proposalIndex]];

        require(uintVote < 3, "not < 3");
        Vote vote = Vote(uintVote);

        require(GETCURRENTPERIOD572() >= proposal.startingPeriod, "voting pending");
        require(!HASVOTINGPERIODEXPIRED787(proposal.startingPeriod), "proposal expired");
        require(proposal.votesByMember[memberAddress] == Vote.Null, "member voted");
        require(vote == Vote.Yes || vote == Vote.No, "must vote Yes or No");

        proposal.votesByMember[memberAddress] = vote;

        if (vote == Vote.Yes) {
            proposal.yesVotes = proposal.yesVotes.ADD432(member.shares);

            // set highest index (latest) yes vote - must be processed for member to ragequit
            if (proposalIndex > member.highestIndexYesVote) {
                member.highestIndexYesVote = proposalIndex;
            }

            // set maximum of total shares encountered at a yes vote - used to bound dilution for yes voters
            if (totalShares.ADD432(totalLoot) > proposal.maxTotalSharesAndLootAtYesVote) {
                proposal.maxTotalSharesAndLootAtYesVote = totalShares.ADD432(totalLoot);
            }

        } else if (vote == Vote.No) {
            proposal.noVotes = proposal.noVotes.ADD432(member.shares);
        }
     
        // NOTE: subgraph indexes by proposalId not proposalIndex since proposalIndex isn't set untill it's been sponsored but proposal is created on submission
        emit SUBMITVOTE515(proposalQueue[proposalIndex], proposalIndex, msg.sender, memberAddress, uintVote);
    }

    function PROCESSPROPOSAL61(uint256 proposalIndex) public NONREENTRANT30 {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING39(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(!proposal.flags[4] && !proposal.flags[5], "not standard proposal");

        proposal.flags[1] = true; // processed

        bool didPass = _DIDPASS63(proposalIndex);

        // Make the proposal fail if the new total number of shares and loot exceeds the limit
        if (totalShares.ADD432(totalLoot).ADD432(proposal.sharesRequested).ADD432(proposal.lootRequested) > max_input751) {
            didPass = false;
        }

        // Make the proposal fail if it is requesting more tokens as payment than the available guild bank balance
        if (proposal.paymentRequested > userTokenBalances[guild70][proposal.paymentToken]) {
            didPass = false;
        }

        // Make the proposal fail if it would result in too many tokens with non-zero balance in guild bank
        if (proposal.tributeOffered > 0 && userTokenBalances[guild70][proposal.tributeToken] == 0 && totalGuildBankTokens >= max_token_guildbank_count949) {
           didPass = false;
        }

        // PROPOSAL PASSED
        if (didPass) {
            proposal.flags[2] = true; // didPass

            // if the applicant is already a member, add to their existing shares & loot
            if (members[proposal.applicant].exists) {
                members[proposal.applicant].shares = members[proposal.applicant].shares.ADD432(proposal.sharesRequested);
                members[proposal.applicant].loot = members[proposal.applicant].loot.ADD432(proposal.lootRequested);

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
            totalShares = totalShares.ADD432(proposal.sharesRequested);
            totalLoot = totalLoot.ADD432(proposal.lootRequested);

            // if the proposal tribute is the first tokens of its kind to make it into the guild bank, increment total guild bank tokens
            if (userTokenBalances[guild70][proposal.tributeToken] == 0 && proposal.tributeOffered > 0) {
                totalGuildBankTokens += 1;
            }

            UNSAFEINTERNALTRANSFER260(escrow28, guild70, proposal.tributeToken, proposal.tributeOffered);
            UNSAFEINTERNALTRANSFER260(guild70, proposal.applicant, proposal.paymentToken, proposal.paymentRequested);

            // if the proposal spends 100% of guild bank balance for a token, decrement total guild bank tokens
            if (userTokenBalances[guild70][proposal.paymentToken] == 0 && proposal.paymentRequested > 0) {
                totalGuildBankTokens -= 1;
            }

        // PROPOSAL FAILED
        } else {
            // return all tokens to the proposer (not the applicant, because funds come from proposer)
            UNSAFEINTERNALTRANSFER260(escrow28, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        }

        _RETURNDEPOSIT681(proposal.sponsor);

        emit PROCESSPROPOSAL661(proposalIndex, proposalId, didPass);
    }

    function PROCESSWHITELISTPROPOSAL449(uint256 proposalIndex) public NONREENTRANT30 {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING39(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[4], "not whitelist proposal");

        proposal.flags[1] = true; // processed

        bool didPass = _DIDPASS63(proposalIndex);

        if (approvedTokens.length >= max_token_whitelist_count231) {
            didPass = false;
        }

        if (didPass) {
            proposal.flags[2] = true; // didPass

            tokenWhitelist[address(proposal.tributeToken)] = true;
            approvedTokens.push(proposal.tributeToken);
        }

        proposedToWhitelist[address(proposal.tributeToken)] = false;

        _RETURNDEPOSIT681(proposal.sponsor);

        emit PROCESSWHITELISTPROPOSAL382(proposalIndex, proposalId, didPass);
    }

    function PROCESSGUILDKICKPROPOSAL87(uint256 proposalIndex) public NONREENTRANT30 {	//inject NONSTANDARD NAMING
        _VALIDATEPROPOSALFORPROCESSING39(proposalIndex);

        uint256 proposalId = proposalQueue[proposalIndex];
        Proposal storage proposal = proposals[proposalId];

        require(proposal.flags[5], "not guild kick");

        proposal.flags[1] = true; // processed

        bool didPass = _DIDPASS63(proposalIndex);

        if (didPass) {
            proposal.flags[2] = true; // didPass
            Member storage member = members[proposal.applicant];
            member.jailed = proposalIndex;

            // transfer shares to loot
            member.loot = member.loot.ADD432(member.shares);
            totalShares = totalShares.SUB438(member.shares);
            totalLoot = totalLoot.ADD432(member.shares);
            member.shares = 0; // revoke all shares
        }

        proposedToKick[proposal.applicant] = false;

        _RETURNDEPOSIT681(proposal.sponsor);

        emit PROCESSGUILDKICKPROPOSAL715(proposalIndex, proposalId, didPass);
    }

    function _DIDPASS63(uint256 proposalIndex) internal view returns (bool didPass) {	//inject NONSTANDARD NAMING
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];

        didPass = proposal.yesVotes > proposal.noVotes;

        // Make the proposal fail if the dilutionBound is exceeded
        if ((totalShares.ADD432(totalLoot)).MUL944(dilutionBound) < proposal.maxTotalSharesAndLootAtYesVote) {
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

    function _VALIDATEPROPOSALFORPROCESSING39(uint256 proposalIndex) internal view {	//inject NONSTANDARD NAMING
        require(proposalIndex < proposalQueue.length, "no such proposal");
        Proposal memory proposal = proposals[proposalQueue[proposalIndex]];

        require(GETCURRENTPERIOD572() >= proposal.startingPeriod.ADD432(votingPeriodLength).ADD432(gracePeriodLength), "proposal not ready");
        require(proposal.flags[1] == false, "proposal already processed");
        require(proposalIndex == 0 || proposals[proposalQueue[proposalIndex.SUB438(1)]].flags[1], "previous proposal unprocessed");
    }

    function _RETURNDEPOSIT681(address sponsor) internal {	//inject NONSTANDARD NAMING
        UNSAFEINTERNALTRANSFER260(escrow28, msg.sender, depositToken, processingReward);
        UNSAFEINTERNALTRANSFER260(escrow28, sponsor, depositToken, proposalDeposit.SUB438(processingReward));
    }

    function RAGEQUIT155(uint256 sharesToBurn, uint256 lootToBurn) public NONREENTRANT30 ONLYMEMBER840 {	//inject NONSTANDARD NAMING
        _RAGEQUIT118(msg.sender, sharesToBurn, lootToBurn);
    }

    function _RAGEQUIT118(address memberAddress, uint256 sharesToBurn, uint256 lootToBurn) internal {	//inject NONSTANDARD NAMING
        uint256 initialTotalSharesAndLoot = totalShares.ADD432(totalLoot);

        Member storage member = members[memberAddress];

        require(member.shares >= sharesToBurn, "insufficient shares");
        require(member.loot >= lootToBurn, "insufficient loot");

        require(CANRAGEQUIT626(member.highestIndexYesVote), "cannot ragequit until highest index proposal member voted YES on is processed");

        uint256 sharesAndLootToBurn = sharesToBurn.ADD432(lootToBurn);

        // burn shares and loot
        member.shares = member.shares.SUB438(sharesToBurn);
        member.loot = member.loot.SUB438(lootToBurn);
        totalShares = totalShares.SUB438(sharesToBurn);
        totalLoot = totalLoot.SUB438(lootToBurn);

        for (uint256 i = 0; i < approvedTokens.length; i++) {
            uint256 amountToRagequit = FAIRSHARE400(userTokenBalances[guild70][approvedTokens[i]], sharesAndLootToBurn, initialTotalSharesAndLoot);
            if (amountToRagequit > 0) { // gas optimization to allow a higher maximum token limit
                // deliberately not using safemath here to keep overflows from preventing the function execution (which would break ragekicks)
                // if a token overflows, it is because the supply was artificially inflated to oblivion, so we probably don't care about it anyways
                userTokenBalances[guild70][approvedTokens[i]] -= amountToRagequit;
                userTokenBalances[memberAddress][approvedTokens[i]] += amountToRagequit;
            }
        }

        emit RAGEQUIT99(msg.sender, sharesToBurn, lootToBurn);
    }

    function RAGEKICK469(address memberToKick) public NONREENTRANT30 {	//inject NONSTANDARD NAMING
        Member storage member = members[memberToKick];

        require(member.jailed != 0, "member not jailed");
        require(member.loot > 0, "member must have loot"); // note - should be impossible for jailed member to have shares
        require(CANRAGEQUIT626(member.highestIndexYesVote), "cannot ragequit until highest index proposal member voted YES on is processed");

        _RAGEQUIT118(memberToKick, 0, member.loot);
    }

    function WITHDRAWBALANCE444(address token, uint256 amount) public NONREENTRANT30 {	//inject NONSTANDARD NAMING
        _WITHDRAWBALANCE934(token, amount);
    }

    function WITHDRAWBALANCES728(address[] memory tokens, uint256[] memory amounts, bool max) public NONREENTRANT30 {	//inject NONSTANDARD NAMING
        require(tokens.length == amounts.length, "tokens + amounts arrays must match");

        for (uint256 i=0; i < tokens.length; i++) {
            uint256 withdrawAmount = amounts[i];
            if (max) { // withdraw the maximum balance
                withdrawAmount = userTokenBalances[msg.sender][tokens[i]];
            }

            _WITHDRAWBALANCE934(tokens[i], withdrawAmount);
        }
    }
    
    function _WITHDRAWBALANCE934(address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(userTokenBalances[msg.sender][token] >= amount, "insufficient balance");
        UNSAFESUBTRACTFROMBALANCE241(msg.sender, token, amount);
        require(IERC20(token).TRANSFER263(msg.sender, amount), "transfer failed");
        emit WITHDRAW41(msg.sender, token, amount);
    }

    function COLLECTTOKENS468(address token) public NONREENTRANT30 ONLYDELEGATE139 {	//inject NONSTANDARD NAMING
        uint256 amountToCollect = IERC20(token).BALANCEOF281(address(this)).SUB438(userTokenBalances[total973][token]);
        // only collect if 1) there are tokens to collect 2) token is whitelisted 3) token has non-zero balance
        require(amountToCollect > 0, "no tokens");
        require(tokenWhitelist[token], "not whitelisted");
        require(userTokenBalances[guild70][token] > 0, "no guild balance");
        
        UNSAFEADDTOBALANCE685(guild70, token, amountToCollect);
        emit TOKENSCOLLECTED490(token, amountToCollect);
    }

    // NOTE: requires that delegate key which sent the original proposal cancels, msg.sender == proposal.proposer
    function CANCELPROPOSAL479(uint256 proposalId) public NONREENTRANT30 {	//inject NONSTANDARD NAMING
        Proposal storage proposal = proposals[proposalId];
        require(!proposal.flags[0], "proposal already sponsored");
        require(!proposal.flags[3], "proposal already cancelled");
        require(msg.sender == proposal.proposer, "only proposer cancels");

        proposal.flags[3] = true; // cancelled
        
        UNSAFEINTERNALTRANSFER260(escrow28, proposal.proposer, proposal.tributeToken, proposal.tributeOffered);
        emit CANCELPROPOSAL571(proposalId, msg.sender);
    }

    function UPDATEDELEGATEKEY931(address newDelegateKey) public NONREENTRANT30 ONLYSHAREHOLDER343 {	//inject NONSTANDARD NAMING
        require(newDelegateKey != address(0), "newDelegateKey zeroed");

        // skip checks if member is setting the delegate key to their member address
        if (newDelegateKey != msg.sender) {
            require(!members[newDelegateKey].exists, "cannot overwrite members");
            require(!members[memberAddressByDelegateKey[newDelegateKey]].exists, "cannot overwrite delegate keys");
        }

        Member storage member = members[msg.sender];
        memberAddressByDelegateKey[member.delegateKey] = address(0);
        memberAddressByDelegateKey[newDelegateKey] = msg.sender;
        member.delegateKey = newDelegateKey;

        emit UPDATEDELEGATEKEY691(msg.sender, newDelegateKey);
    }

    // can only ragequit if the latest proposal you voted YES on has been processed
    function CANRAGEQUIT626(uint256 highestIndexYesVote) public view returns (bool) {	//inject NONSTANDARD NAMING
        require(highestIndexYesVote < proposalQueue.length, "no such proposal");
        return proposals[proposalQueue[highestIndexYesVote]].flags[1];
    }

    function HASVOTINGPERIODEXPIRED787(uint256 startingPeriod) public view returns (bool) {	//inject NONSTANDARD NAMING
        return GETCURRENTPERIOD572() >= startingPeriod.ADD432(votingPeriodLength);
    }
    
                                                              
    function MAX368(uint256 x, uint256 y) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }

    function GETCURRENTPERIOD572() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now.SUB438(summoningTime).DIV467(periodDuration);
    }

    function GETPROPOSALQUEUELENGTH689() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return proposalQueue.length;
    }

    function GETPROPOSALFLAGS34(uint256 proposalId) public view returns (bool[6] memory) {	//inject NONSTANDARD NAMING
        return proposals[proposalId].flags;
    }

    function GETUSERTOKENBALANCE731(address user, address token) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return userTokenBalances[user][token];
    }

    function GETMEMBERPROPOSALVOTE310(address memberAddress, uint256 proposalIndex) public view returns (Vote) {	//inject NONSTANDARD NAMING
        require(members[memberAddress].exists, "no such member");
        require(proposalIndex < proposalQueue.length, "unproposed");
        return proposals[proposalQueue[proposalIndex]].votesByMember[memberAddress];
    }

    function GETTOKENCOUNT338() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return approvedTokens.length;
    }

                                                              
    function UNSAFEADDTOBALANCE685(address user, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        userTokenBalances[user][token] += amount;
        userTokenBalances[total973][token] += amount;
    }

    function UNSAFESUBTRACTFROMBALANCE241(address user, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        userTokenBalances[user][token] -= amount;
        userTokenBalances[total973][token] -= amount;
    }

    function UNSAFEINTERNALTRANSFER260(address from, address to, address token, uint256 amount) internal {	//inject NONSTANDARD NAMING
        UNSAFESUBTRACTFROMBALANCE241(from, token, amount);
        UNSAFEADDTOBALANCE685(to, token, amount);
    }

    function FAIRSHARE400(uint256 balance, uint256 shares, uint256 totalSharesAndLoot) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(totalSharesAndLoot != 0);

        if (balance == 0) { return 0; }

        uint256 prod = balance * shares;

        if (prod / balance == shares) { // no overflow in multiplication above?
            return prod / totalSharesAndLoot;
        }

        return (balance / totalSharesAndLoot) * shares;
    }  
}