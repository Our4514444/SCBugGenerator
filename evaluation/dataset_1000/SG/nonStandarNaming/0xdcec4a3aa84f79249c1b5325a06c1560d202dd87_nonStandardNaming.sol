                                                                 

pragma solidity ^0.5.15;
pragma experimental ABIEncoderV2;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                                    
    function ADD73(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB928(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB928(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB928(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                                
    function MUL694(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV209(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV209(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV209(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MOD666(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD666(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function MOD666(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

// Original work from Compound: https://github.com/compound-finance/compound-protocol/blob/master/contracts/Governance/GovernorAlpha.sol
// Modified to work in the YAM system


contract DualGovernorAlpha {
                                         
    string public constant name266 = "YAM Governor Alpha";	//inject NONSTANDARD NAMING

                                                                                                                                   
    function QUORUMVOTES299() public view returns (uint256) { return 100000 * 10**24; } // 4% of YAM	//inject NONSTANDARD NAMING

                                                                                      
    function PROPOSALTHRESHOLD393() public view returns (uint256) { return 25000 * 10**24; } // 1% of YAM	//inject NONSTANDARD NAMING

                                                                                
    function PROPOSALMAXOPERATIONS613() public pure returns (uint256) { return 10; } // 10 actions	//inject NONSTANDARD NAMING

                                                                                   
    function VOTINGDELAY555() public pure returns (uint256) { return 1; } // 1 block	//inject NONSTANDARD NAMING

                                                               
    function VOTINGPERIOD245() public pure returns (uint256) { return 18514; } // ~2 days in blocks (assuming 14s blocks)	//inject NONSTANDARD NAMING

                                                             
    TimelockInterface public timelock;

                                                            
    YAMInterface public yam;

                                                    
    address public guardian;

                                             
    uint256 public proposalCount;

                                                 
    address[] public incentivizers;

    struct Proposal {
        // Unique id for looking up a proposal
        uint256 id;

        // Creator of the proposal
        address proposer;

        // The timestamp that the proposal will be available for execution, set once the vote succeeds
        uint256 eta;

        // the ordered list of target addresses for calls to be made
        address[] targets;

        // The ordered list of values (i.e. msg.value) to be passed to the calls to be made
        uint[] values;

        // The ordered list of function signatures to be called
        string[] signatures;

        // The ordered list of calldata to be passed to each call
        bytes[] calldatas;

        // The block at which voting begins: holders must delegate their votes prior to this block
        uint256 startBlock;

        // The block at which voting ends: votes must be cast prior to this block
        uint256 endBlock;

        // Current number of votes in favor of this proposal
        uint256 forVotes;

        // Current number of votes in opposition to this proposal
        uint256 againstVotes;

        // Flag marking whether the proposal has been canceled
        bool canceled;

        // Flag marking whether the proposal has been executed
        bool executed;

        // Receipts of ballots for the entire set of voters
        mapping (address => Receipt) receipts;
    }

    // Ballot receipt record for a voter
    struct Receipt {
        // Whether or not a vote has been cast
        bool hasVoted;

        // Whether or not the voter supports the proposal
        bool support;

        // The number of votes the voter had, which were cast
        uint256 votes;
    }

    // Possible states that a proposal may be in
    enum ProposalState {
        Pending,
        Active,
        Canceled,
        Defeated,
        Succeeded,
        Queued,
        Expired,
        Executed
    }

                                                                  
    mapping (uint256 => Proposal) public proposals;

                                                     
    mapping (address => uint256) public latestProposalIds;

                                                              
    bytes32 public constant domain_typehash424 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	//inject NONSTANDARD NAMING

                                                                               
    bytes32 public constant ballot_typehash783 = keccak256("Ballot(uint256 proposalId,bool support)");	//inject NONSTANDARD NAMING

                                                               
    event PROPOSALCREATED503(uint256 id, address proposer, address[] targets, uint[] values, string[] signatures, bytes[] calldatas, uint256 startBlock, uint256 endBlock, string description);	//inject NONSTANDARD NAMING

                                                                        
    event VOTECAST582(address voter, uint256 proposalId, bool support, uint256 votes);	//inject NONSTANDARD NAMING

                                                                  
    event PROPOSALCANCELED318(uint256 id);	//inject NONSTANDARD NAMING

                                                                                
    event PROPOSALQUEUED606(uint256 id, uint256 eta);	//inject NONSTANDARD NAMING

                                                                                  
    event PROPOSALEXECUTED141(uint256 id);	//inject NONSTANDARD NAMING

    constructor(address timelock_, address yam_, address[] memory incentivizers_) public {
        timelock = TimelockInterface(timelock_);
        yam = YAMInterface(yam_);
        incentivizers = incentivizers_;
        guardian = address(0x8b4f1616751117C38a0f84F9A146cca191ea3EC5);
    }

    function GETINCENTIVIZERS493()	//inject NONSTANDARD NAMING
        public
        view
        returns (address[] memory)
    {
        address[] memory incs = incentivizers;
        return incs;
    }

    function ADDINCENTIVIZER664(address incentivizer)	//inject NONSTANDARD NAMING
        public
    {
        // as a sanity check, make sure it has the function and there is no error
        // otherwise could brick governance
        Incentivizer(incentivizer).GETPRIORVOTES88(guardian, block.number - 1);

        require(msg.sender == address(timelock), "GovernorAlpha::!timelock");
        incentivizers.push(incentivizer);
    }

    function REMOVEINCENTIVIZER735(uint256 index)	//inject NONSTANDARD NAMING
        public
    {
        require(msg.sender == address(timelock), "GovernorAlpha::!timelock");
        if (index >= incentivizers.length) return;

        if (index != incentivizers.length-1) {
          incentivizers[index] = incentivizers[incentivizers.length - 1];
        }

        incentivizers.length--;
    }

    function GETPRIORVOTES88(address account, uint256 blockNumber)	//inject NONSTANDARD NAMING
        public
        returns (uint256)
    {
        // -- get prior votes for yam
        require(blockNumber < block.number, "Gov::getPriorVotes: not yet determined");

        uint256 votes = yam.GETPRIORVOTES88(account, blockNumber);
        for (uint256 i = 0; i < incentivizers.length; i++) {
            // get prior votes for staking (stakers get full pool power)
            votes = SafeMath.ADD73(votes, Incentivizer(incentivizers[i]).GETPRIORVOTES88(account, blockNumber));
        }
        return votes;
    }

    function GETCURRENTVOTES477(address account)	//inject NONSTANDARD NAMING
        public
        returns (uint256)
    {
        uint256 votes = yam.GETCURRENTVOTES477(account);
        for (uint256 i = 0; i < incentivizers.length; i++) {
            // get prior votes for staking (stakers get full pool power)
            votes = SafeMath.ADD73(votes, Incentivizer(incentivizers[i]).GETCURRENTVOTES477(account));
        }
        return votes;
    }

    function PROPOSE6(	//inject NONSTANDARD NAMING
        address[] memory targets,
        uint[] memory values,
        string[] memory signatures,
        bytes[] memory calldatas,
        string memory description
    )
        public
        returns (uint256)
    {
        require(GETPRIORVOTES88(msg.sender, SUB256342(block.number, 1)) >= PROPOSALTHRESHOLD393(), "GovernorAlpha::propose: proposer votes below proposal threshold");
        require(targets.length == values.length && targets.length == signatures.length && targets.length == calldatas.length, "GovernorAlpha::propose: proposal function information arity mismatch");
        require(targets.length != 0, "GovernorAlpha::propose: must provide actions");
        require(targets.length <= PROPOSALMAXOPERATIONS613(), "GovernorAlpha::propose: too many actions");

        uint256 latestProposalId = latestProposalIds[msg.sender];
        if (latestProposalId != 0) {
          ProposalState proposersLatestProposalState = STATE310(latestProposalId);
          require(proposersLatestProposalState != ProposalState.Active, "GovernorAlpha::propose: one live proposal per proposer, found an already active proposal");
          require(proposersLatestProposalState != ProposalState.Pending, "GovernorAlpha::propose: one live proposal per proposer, found an already pending proposal");
        }

        uint256 startBlock = ADD256998(block.number, VOTINGDELAY555());
        uint256 endBlock = ADD256998(startBlock, VOTINGPERIOD245());

        proposalCount++;
        Proposal memory newProposal = Proposal({
            id: proposalCount,
            proposer: msg.sender,
            eta: 0,
            targets: targets,
            values: values,
            signatures: signatures,
            calldatas: calldatas,
            startBlock: startBlock,
            endBlock: endBlock,
            forVotes: 0,
            againstVotes: 0,
            canceled: false,
            executed: false
        });

        proposals[newProposal.id] = newProposal;
        latestProposalIds[newProposal.proposer] = newProposal.id;

        emit PROPOSALCREATED503(
            newProposal.id,
            msg.sender,
            targets,
            values,
            signatures,
            calldatas,
            startBlock,
            endBlock,
            description
        );
        return newProposal.id;
    }

    function QUEUE838(uint256 proposalId)	//inject NONSTANDARD NAMING
        public
    {
        require(STATE310(proposalId) == ProposalState.Succeeded, "GovernorAlpha::queue: proposal can only be queued if it is succeeded");
        Proposal storage proposal = proposals[proposalId];
        uint256 eta = ADD256998(block.timestamp, timelock.DELAY931());
        for (uint256 i = 0; i < proposal.targets.length; i++) {
            _QUEUEORREVERT326(
                proposal.targets[i],
                proposal.values[i],
                proposal.signatures[i],
                proposal.calldatas[i],
                eta
            );
        }
        proposal.eta = eta;
        emit PROPOSALQUEUED606(proposalId, eta);
    }

    function _QUEUEORREVERT326(	//inject NONSTANDARD NAMING
        address target,
        uint256 value,
        string memory signature,
        bytes memory data,
        uint256 eta
    )
        internal
    {
        require(!timelock.QUEUEDTRANSACTIONS2(
              keccak256(
                  abi.encode(
                      target,
                      value,
                      signature,
                      data,
                      eta
                  )
              )
          ),
          "GovernorAlpha::_queueOrRevert: proposal action already queued at eta"
        );

        timelock.QUEUETRANSACTION675(target, value, signature, data, eta);
    }

    function EXECUTE802(uint256 proposalId)	//inject NONSTANDARD NAMING
        public
        payable
    {
        require(STATE310(proposalId) == ProposalState.Queued, "GovernorAlpha::execute: proposal can only be executed if it is queued");
        Proposal storage proposal = proposals[proposalId];
        proposal.executed = true;
        for (uint256 i = 0; i < proposal.targets.length; i++) {
            timelock.EXECUTETRANSACTION112.value(proposal.values[i])(proposal.targets[i], proposal.values[i], proposal.signatures[i], proposal.calldatas[i], proposal.eta);
        }
        emit PROPOSALEXECUTED141(proposalId);
    }

    function CANCEL209(uint256 proposalId)	//inject NONSTANDARD NAMING
        public
    {
        ProposalState state = STATE310(proposalId);
        require(state != ProposalState.Executed, "GovernorAlpha::cancel: cannot cancel executed proposal");

        Proposal storage proposal = proposals[proposalId];
        require(msg.sender == guardian || GETPRIORVOTES88(proposal.proposer, SUB256342(block.number, 1)) < PROPOSALTHRESHOLD393(), "GovernorAlpha::cancel: proposer above threshold");

        proposal.canceled = true;
        for (uint256 i = 0; i < proposal.targets.length; i++) {
            timelock.CANCELTRANSACTION535(proposal.targets[i], proposal.values[i], proposal.signatures[i], proposal.calldatas[i], proposal.eta);
        }

        emit PROPOSALCANCELED318(proposalId);
    }

    function GETACTIONS615(uint256 proposalId)	//inject NONSTANDARD NAMING
        public
        view
        returns (
            address[] memory targets,
            uint[] memory values,
            string[] memory signatures,
            bytes[] memory calldatas
        )
    {
        Proposal storage p = proposals[proposalId];
        return (p.targets, p.values, p.signatures, p.calldatas);
    }

    function GETRECEIPT417(uint256 proposalId, address voter)	//inject NONSTANDARD NAMING
        public
        view
        returns (Receipt memory)
    {
        return proposals[proposalId].receipts[voter];
    }

    function STATE310(uint256 proposalId)	//inject NONSTANDARD NAMING
        public
        view
        returns (ProposalState)
    {
        require(proposalCount >= proposalId && proposalId > 0, "GovernorAlpha::state: invalid proposal id");
        Proposal storage proposal = proposals[proposalId];
        if (proposal.canceled) {
            return ProposalState.Canceled;
        } else if (block.number <= proposal.startBlock) {
            return ProposalState.Pending;
        } else if (block.number <= proposal.endBlock) {
            return ProposalState.Active;
        } else if (proposal.forVotes <= proposal.againstVotes || proposal.forVotes < QUORUMVOTES299()) {
            return ProposalState.Defeated;
        } else if (proposal.eta == 0) {
            return ProposalState.Succeeded;
        } else if (proposal.executed) {
            return ProposalState.Executed;
        } else if (block.timestamp >= ADD256998(proposal.eta, timelock.GRACE_PERIOD16())) {
            return ProposalState.Expired;
        } else {
            return ProposalState.Queued;
        }
    }

    function CASTVOTE463(uint256 proposalId, bool support)	//inject NONSTANDARD NAMING
        public
    {
        return _CASTVOTE974(msg.sender, proposalId, support);
    }

    function CASTVOTEBYSIG340(	//inject NONSTANDARD NAMING
        uint256 proposalId,
        bool support,
        uint8 v,
        bytes32 r,
        bytes32 s
    )
        public
    {
        bytes32 domainSeparator = keccak256(
            abi.encode(
                domain_typehash424,
                keccak256(bytes(name266)),
                GETCHAINID307(),
                address(this)
            )
        );

        bytes32 structHash = keccak256(
            abi.encode(
                ballot_typehash783,
                proposalId,
                support
            )
        );

        bytes32 digest = keccak256(
            abi.encodePacked(
                "\x19\x01",
                domainSeparator,
                structHash
            )
        );

        address signatory = ecrecover(digest, v, r, s);
        require(signatory != address(0), "GovernorAlpha::castVoteBySig: invalid signature");
        return _CASTVOTE974(signatory, proposalId, support);
    }

    function _CASTVOTE974(	//inject NONSTANDARD NAMING
        address voter,
        uint256 proposalId,
        bool support
    )
        internal
    {
        require(STATE310(proposalId) == ProposalState.Active, "GovernorAlpha::_castVote: voting is closed");
        Proposal storage proposal = proposals[proposalId];
        Receipt storage receipt = proposal.receipts[voter];
        require(receipt.hasVoted == false, "GovernorAlpha::_castVote: voter already voted");
        uint256 votes = GETPRIORVOTES88(voter, proposal.startBlock);

        if (support) {
            proposal.forVotes = ADD256998(proposal.forVotes, votes);
        } else {
            proposal.againstVotes = ADD256998(proposal.againstVotes, votes);
        }

        receipt.hasVoted = true;
        receipt.support = support;
        receipt.votes = votes;

        emit VOTECAST582(voter, proposalId, support, votes);
    }

    function __ACCEPTADMIN756()	//inject NONSTANDARD NAMING
        public
    {
        require(msg.sender == guardian, "GovernorAlpha::__acceptAdmin: sender must be gov guardian");
        timelock.ACCEPTADMIN291();
    }

    function __ABDICATE283()	//inject NONSTANDARD NAMING
        public
    {
        require(msg.sender == guardian, "GovernorAlpha::__abdicate: sender must be gov guardian");
        guardian = address(0);
    }

    function ADD256998(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "addition overflow");
        return c;
    }

    function SUB256342(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "subtraction underflow");
        return a - b;
    }

    function GETCHAINID307() internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 chainId;
        assembly { chainId := chainid() }
        return chainId;
    }
}

interface TimelockInterface {
    function DELAY931() external view returns (uint256);	//inject NONSTANDARD NAMING
    function GRACE_PERIOD16() external view returns (uint256);	//inject NONSTANDARD NAMING
    function ACCEPTADMIN291() external;	//inject NONSTANDARD NAMING
    function QUEUEDTRANSACTIONS2(bytes32 hash) external view returns (bool);	//inject NONSTANDARD NAMING
    function QUEUETRANSACTION675(address target, uint256 value, string calldata signature, bytes calldata data, uint256 eta) external returns (bytes32);	//inject NONSTANDARD NAMING
    function CANCELTRANSACTION535(address target, uint256 value, string calldata signature, bytes calldata data, uint256 eta) external;	//inject NONSTANDARD NAMING
    function EXECUTETRANSACTION112(address target, uint256 value, string calldata signature, bytes calldata data, uint256 eta) external payable returns (bytes memory);	//inject NONSTANDARD NAMING
}

interface YAMInterface {
    function GETPRIORVOTES88(address account, uint256 blockNumber) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETCURRENTVOTES477(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function _ACCEPTGOV450() external;	//inject NONSTANDARD NAMING
}

interface Incentivizer {
    function GETPRIORVOTES88(address account, uint256 blockNumber) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETCURRENTVOTES477(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
}