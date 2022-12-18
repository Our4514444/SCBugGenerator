                                                                 

pragma solidity 0.5.15;
pragma experimental ABIEncoderV2;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                                    
    function ADD713(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB364(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB364(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB364(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                                
    function MUL793(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV330(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV330(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV330(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MOD960(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD960(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function MOD960(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}


interface TimelockInterface {
    function DELAY950() external view returns (uint256);	//inject NONSTANDARD NAMING
    function GRACE_PERIOD608() external view returns (uint256);	//inject NONSTANDARD NAMING
    function ACCEPTADMIN157() external;	//inject NONSTANDARD NAMING
    function QUEUEDTRANSACTIONS429(bytes32 hash) external view returns (bool);	//inject NONSTANDARD NAMING
    function QUEUETRANSACTION758(address target, uint256 value, string calldata signature, bytes calldata data, uint256 eta) external returns (bytes32);	//inject NONSTANDARD NAMING
    function CANCELTRANSACTION208(address target, uint256 value, string calldata signature, bytes calldata data, uint256 eta) external;	//inject NONSTANDARD NAMING
    function EXECUTETRANSACTION577(address target, uint256 value, string calldata signature, bytes calldata data, uint256 eta) external payable returns (bytes memory);	//inject NONSTANDARD NAMING
}

interface YAMInterface {
    function GETPRIORVOTES568(address account, uint256 blockNumber) external view returns (uint256);	//inject NONSTANDARD NAMING
    function _ACCEPTGOV217() external;	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

// Original work from Compound: https://github.com/compound-finance/compound-protocol/blob/master/contracts/Governance/GovernorAlpha.sol
// Modified to work in the YAM system

// all votes work on underlying _yamBalances[address], not balanceOf(address)

// Original audit: https://blog.openzeppelin.com/compound-alpha-governance-system-audit/
// Overview:
//    No Critical
//    High:
//      Issue:
//        Approved proposal may be impossible to queue, cancel or execute
//        Fixed with `proposalMaxOperations`
//      Issue:
//        Queued proposal with repeated actions cannot be executed
//        Fixed by explicitly disallow proposals with repeated actions to be queued in the Timelock contract.
//
// Changes made by YAM after audit:
//    Formatting, naming, & uint256 instead of uint
//    Since YAM supply changes, updated quorum & proposal requirements
//    If any uint96, changed to uint256 to match YAM as opposed to comp


contract GovernorAlpha {
                                         
    string public constant name742 = "YAM Governor Alpha";	//inject NONSTANDARD NAMING

                                                                                                                                   
    function QUORUMVOTES505() public view returns (uint256) { return 200000 * 10**24; } // 4% of YAM	//inject NONSTANDARD NAMING

                                                                                      
    function PROPOSALTHRESHOLD421() public view returns (uint256) { return 50000 * 10**24; } // 1% of YAM	//inject NONSTANDARD NAMING

                                                                                
    function PROPOSALMAXOPERATIONS100() public pure returns (uint256) { return 10; } // 10 actions	//inject NONSTANDARD NAMING

                                                                                   
    function VOTINGDELAY951() public pure returns (uint256) { return 1; } // 1 block	//inject NONSTANDARD NAMING

                                                               
    function VOTINGPERIOD17() public pure returns (uint256) { return 12345; } // ~2 days in blocks (assuming 14s blocks)	//inject NONSTANDARD NAMING

                                                             
    TimelockInterface public timelock;

                                                            
    YAMInterface public yam;

                                                    
    address public guardian;

                                             
    uint256 public proposalCount;

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

                                                              
    bytes32 public constant domain_typehash368 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	//inject NONSTANDARD NAMING

                                                                               
    bytes32 public constant ballot_typehash804 = keccak256("Ballot(uint256 proposalId,bool support)");	//inject NONSTANDARD NAMING

                                                               
    event PROPOSALCREATED458(uint256 id, address proposer, address[] targets, uint[] values, string[] signatures, bytes[] calldatas, uint256 startBlock, uint256 endBlock, string description);	//inject NONSTANDARD NAMING

                                                                        
    event VOTECAST479(address voter, uint256 proposalId, bool support, uint256 votes);	//inject NONSTANDARD NAMING

                                                                  
    event PROPOSALCANCELED871(uint256 id);	//inject NONSTANDARD NAMING

                                                                                
    event PROPOSALQUEUED521(uint256 id, uint256 eta);	//inject NONSTANDARD NAMING

                                                                                  
    event PROPOSALEXECUTED413(uint256 id);	//inject NONSTANDARD NAMING

    constructor(address timelock_, address yam_) public {
        timelock = TimelockInterface(timelock_);
        yam = YAMInterface(yam_);
        guardian = msg.sender;
    }

    function PROPOSE887(	//inject NONSTANDARD NAMING
        address[] memory targets,
        uint[] memory values,
        string[] memory signatures,
        bytes[] memory calldatas,
        string memory description
    )
        public
        returns (uint256)
    {
        require(yam.GETPRIORVOTES568(msg.sender, SUB256987(block.number, 1)) >= PROPOSALTHRESHOLD421(), "GovernorAlpha::propose: proposer votes below proposal threshold");
        require(targets.length == values.length && targets.length == signatures.length && targets.length == calldatas.length, "GovernorAlpha::propose: proposal function information arity mismatch");
        require(targets.length != 0, "GovernorAlpha::propose: must provide actions");
        require(targets.length <= PROPOSALMAXOPERATIONS100(), "GovernorAlpha::propose: too many actions");

        uint256 latestProposalId = latestProposalIds[msg.sender];
        if (latestProposalId != 0) {
          ProposalState proposersLatestProposalState = STATE405(latestProposalId);
          require(proposersLatestProposalState != ProposalState.Active, "GovernorAlpha::propose: one live proposal per proposer, found an already active proposal");
          require(proposersLatestProposalState != ProposalState.Pending, "GovernorAlpha::propose: one live proposal per proposer, found an already pending proposal");
        }

        uint256 startBlock = ADD256819(block.number, VOTINGDELAY951());
        uint256 endBlock = ADD256819(startBlock, VOTINGPERIOD17());

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

        emit PROPOSALCREATED458(
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

    function QUEUE552(uint256 proposalId)	//inject NONSTANDARD NAMING
        public
    {
        require(STATE405(proposalId) == ProposalState.Succeeded, "GovernorAlpha::queue: proposal can only be queued if it is succeeded");
        Proposal storage proposal = proposals[proposalId];
        uint256 eta = ADD256819(block.timestamp, timelock.DELAY950());
        for (uint256 i = 0; i < proposal.targets.length; i++) {
            _QUEUEORREVERT297(
                proposal.targets[i],
                proposal.values[i],
                proposal.signatures[i],
                proposal.calldatas[i],
                eta
            );
        }
        proposal.eta = eta;
        emit PROPOSALQUEUED521(proposalId, eta);
    }

    function _QUEUEORREVERT297(	//inject NONSTANDARD NAMING
        address target,
        uint256 value,
        string memory signature,
        bytes memory data,
        uint256 eta
    )
        internal
    {
        require(!timelock.QUEUEDTRANSACTIONS429(
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

        timelock.QUEUETRANSACTION758(target, value, signature, data, eta);
    }

    function EXECUTE869(uint256 proposalId)	//inject NONSTANDARD NAMING
        public
        payable
    {
        require(STATE405(proposalId) == ProposalState.Queued, "GovernorAlpha::execute: proposal can only be executed if it is queued");
        Proposal storage proposal = proposals[proposalId];
        proposal.executed = true;
        for (uint256 i = 0; i < proposal.targets.length; i++) {
            timelock.EXECUTETRANSACTION577.value(proposal.values[i])(proposal.targets[i], proposal.values[i], proposal.signatures[i], proposal.calldatas[i], proposal.eta);
        }
        emit PROPOSALEXECUTED413(proposalId);
    }

    function CANCEL59(uint256 proposalId)	//inject NONSTANDARD NAMING
        public
    {
        ProposalState state = STATE405(proposalId);
        require(state != ProposalState.Executed, "GovernorAlpha::cancel: cannot cancel executed proposal");

        Proposal storage proposal = proposals[proposalId];
        require(msg.sender == guardian || yam.GETPRIORVOTES568(proposal.proposer, SUB256987(block.number, 1)) < PROPOSALTHRESHOLD421(), "GovernorAlpha::cancel: proposer above threshold");

        proposal.canceled = true;
        for (uint256 i = 0; i < proposal.targets.length; i++) {
            timelock.CANCELTRANSACTION208(proposal.targets[i], proposal.values[i], proposal.signatures[i], proposal.calldatas[i], proposal.eta);
        }

        emit PROPOSALCANCELED871(proposalId);
    }

    function GETACTIONS137(uint256 proposalId)	//inject NONSTANDARD NAMING
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

    function GETRECEIPT499(uint256 proposalId, address voter)	//inject NONSTANDARD NAMING
        public
        view
        returns (Receipt memory)
    {
        return proposals[proposalId].receipts[voter];
    }

    function STATE405(uint256 proposalId)	//inject NONSTANDARD NAMING
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
        } else if (proposal.forVotes <= proposal.againstVotes || proposal.forVotes < QUORUMVOTES505()) {
            return ProposalState.Defeated;
        } else if (proposal.eta == 0) {
            return ProposalState.Succeeded;
        } else if (proposal.executed) {
            return ProposalState.Executed;
        } else if (block.timestamp >= ADD256819(proposal.eta, timelock.GRACE_PERIOD608())) {
            return ProposalState.Expired;
        } else {
            return ProposalState.Queued;
        }
    }

    function CASTVOTE659(uint256 proposalId, bool support)	//inject NONSTANDARD NAMING
        public
    {
        return _CASTVOTE344(msg.sender, proposalId, support);
    }

    function CASTVOTEBYSIG198(	//inject NONSTANDARD NAMING
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
                domain_typehash368,
                keccak256(bytes(name742)),
                GETCHAINID87(),
                address(this)
            )
        );

        bytes32 structHash = keccak256(
            abi.encode(
                ballot_typehash804,
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
        return _CASTVOTE344(signatory, proposalId, support);
    }

    function _CASTVOTE344(	//inject NONSTANDARD NAMING
        address voter,
        uint256 proposalId,
        bool support
    )
        internal
    {
        require(STATE405(proposalId) == ProposalState.Active, "GovernorAlpha::_castVote: voting is closed");
        Proposal storage proposal = proposals[proposalId];
        Receipt storage receipt = proposal.receipts[voter];
        require(receipt.hasVoted == false, "GovernorAlpha::_castVote: voter already voted");
        uint256 votes = yam.GETPRIORVOTES568(voter, proposal.startBlock);

        if (support) {
            proposal.forVotes = ADD256819(proposal.forVotes, votes);
        } else {
            proposal.againstVotes = ADD256819(proposal.againstVotes, votes);
        }

        receipt.hasVoted = true;
        receipt.support = support;
        receipt.votes = votes;

        emit VOTECAST479(voter, proposalId, support, votes);
    }

    function __ACCEPTADMIN69()	//inject NONSTANDARD NAMING
        public
    {
        require(msg.sender == guardian, "GovernorAlpha::__acceptAdmin: sender must be gov guardian");
        timelock.ACCEPTADMIN157();
    }

    function __ABDICATE561()	//inject NONSTANDARD NAMING
        public
    {
        require(msg.sender == guardian, "GovernorAlpha::__abdicate: sender must be gov guardian");
        guardian = address(0);
    }

    function __QUEUESETTIMELOCKPENDINGADMIN18(	//inject NONSTANDARD NAMING
        address newPendingAdmin,
        uint256 eta
    )
        public
    {
        require(msg.sender == guardian, "GovernorAlpha::__queueSetTimelockPendingAdmin: sender must be gov guardian");
        timelock.QUEUETRANSACTION758(address(timelock), 0, "setPendingAdmin(address)", abi.encode(newPendingAdmin), eta);
    }

    function __EXECUTESETTIMELOCKPENDINGADMIN445(	//inject NONSTANDARD NAMING
        address newPendingAdmin,
        uint256 eta
    )
        public
    {
        require(msg.sender == guardian, "GovernorAlpha::__executeSetTimelockPendingAdmin: sender must be gov guardian");
        timelock.EXECUTETRANSACTION577(address(timelock), 0, "setPendingAdmin(address)", abi.encode(newPendingAdmin), eta);
    }

    function ADD256819(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "addition overflow");
        return c;
    }

    function SUB256987(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "subtraction underflow");
        return a - b;
    }

    function GETCHAINID87() internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 chainId;
        assembly { chainId := chainid() }
        return chainId;
    }
}