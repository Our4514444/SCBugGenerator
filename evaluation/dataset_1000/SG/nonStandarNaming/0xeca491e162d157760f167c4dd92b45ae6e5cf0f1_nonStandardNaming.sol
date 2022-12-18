                                                                 

pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

contract GovernorAlpha {
                                         
    string public constant name66 = "Uniswap Governor Alpha v2";	//inject NONSTANDARD NAMING

                                                                                                                                   
    function QUORUMVOTES339() public pure returns (uint) { return 30_000_000e18; } // 3% of Uni	//inject NONSTANDARD NAMING

                                                                                      
    function PROPOSALTHRESHOLD362() public pure returns (uint) { return 3_000_000e18; } // 0.3% of Uni	//inject NONSTANDARD NAMING

                                                                                
    function PROPOSALMAXOPERATIONS763() public pure returns (uint) { return 10; } // 10 actions	//inject NONSTANDARD NAMING

                                                                                   
    function VOTINGDELAY551() public pure returns (uint) { return 1; } // 1 block	//inject NONSTANDARD NAMING

                                                               
    function VOTINGPERIOD130() public pure returns (uint) { return 40_320; } // ~7 days in blocks (assuming 15s blocks)	//inject NONSTANDARD NAMING

                                                            
    TimelockInterface public constant timelock384 = TimelockInterface(0x1a9C8182C09F50C8318d769245beA52c32BE35BC);	//inject NONSTANDARD NAMING

                                                           
    UniInterface public constant uni450 = UniInterface(0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984);	//inject NONSTANDARD NAMING

                                             
    uint public proposalCount;

    struct Proposal {
                                                       
        uint id;

                                           
        address proposer;

                                                                                                               
        uint eta;

                                                                             
        address[] targets;

                                                                                                    
        uint[] values;

                                                                        
        string[] signatures;

                                                                          
        bytes[] calldatas;

                                                                                                           
        uint startBlock;

                                                                                          
        uint endBlock;

                                                                     
        uint forVotes;

                                                                          
        uint againstVotes;

                                                                       
        bool canceled;

                                                                       
        bool executed;

                                                                    
        mapping (address => Receipt) receipts;
    }

                                                 
    struct Receipt {
                                                       
        bool hasVoted;

                                                                  
        bool support;

                                                                      
        uint96 votes;
    }

                                                         
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

                                                                  
    mapping (uint => Proposal) public proposals;

                                                     
    mapping (address => uint) public latestProposalIds;

                                                              
    bytes32 public constant domain_typehash596 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	//inject NONSTANDARD NAMING

                                                                               
    bytes32 public constant ballot_typehash401 = keccak256("Ballot(uint256 proposalId,bool support)");	//inject NONSTANDARD NAMING

                                                               
    event PROPOSALCREATED316(uint id, address proposer, address[] targets, uint[] values, string[] signatures, bytes[] calldatas, uint startBlock, uint endBlock, string description);	//inject NONSTANDARD NAMING

                                                                        
    event VOTECAST717(address voter, uint proposalId, bool support, uint votes);	//inject NONSTANDARD NAMING

                                                                  
    event PROPOSALCANCELED816(uint id);	//inject NONSTANDARD NAMING

                                                                                
    event PROPOSALQUEUED813(uint id, uint eta);	//inject NONSTANDARD NAMING

                                                                                  
    event PROPOSALEXECUTED406(uint id);	//inject NONSTANDARD NAMING

    function PROPOSE370(address[] memory targets, uint[] memory values, string[] memory signatures, bytes[] memory calldatas, string memory description) public returns (uint) {	//inject NONSTANDARD NAMING
        require(uni450.GETPRIORVOTES224(msg.sender, SUB256281(block.number, 1)) > PROPOSALTHRESHOLD362(), "GovernorAlpha::propose: proposer votes below proposal threshold");
        require(targets.length == values.length && targets.length == signatures.length && targets.length == calldatas.length, "GovernorAlpha::propose: proposal function information arity mismatch");
        require(targets.length != 0, "GovernorAlpha::propose: must provide actions");
        require(targets.length <= PROPOSALMAXOPERATIONS763(), "GovernorAlpha::propose: too many actions");

        uint latestProposalId = latestProposalIds[msg.sender];
        if (latestProposalId != 0) {
          ProposalState proposersLatestProposalState = STATE862(latestProposalId);
          require(proposersLatestProposalState != ProposalState.Active, "GovernorAlpha::propose: one live proposal per proposer, found an already active proposal");
          require(proposersLatestProposalState != ProposalState.Pending, "GovernorAlpha::propose: one live proposal per proposer, found an already pending proposal");
        }

        uint startBlock = ADD256506(block.number, VOTINGDELAY551());
        uint endBlock = ADD256506(startBlock, VOTINGPERIOD130());

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

        emit PROPOSALCREATED316(newProposal.id, msg.sender, targets, values, signatures, calldatas, startBlock, endBlock, description);
        return newProposal.id;
    }

    function QUEUE640(uint proposalId) public {	//inject NONSTANDARD NAMING
        require(STATE862(proposalId) == ProposalState.Succeeded, "GovernorAlpha::queue: proposal can only be queued if it is succeeded");
        Proposal storage proposal = proposals[proposalId];
        uint eta = ADD256506(block.timestamp, timelock384.DELAY876());
        for (uint i = 0; i < proposal.targets.length; i++) {
            _QUEUEORREVERT722(proposal.targets[i], proposal.values[i], proposal.signatures[i], proposal.calldatas[i], eta);
        }
        proposal.eta = eta;
        emit PROPOSALQUEUED813(proposalId, eta);
    }

    function _QUEUEORREVERT722(address target, uint value, string memory signature, bytes memory data, uint eta) internal {	//inject NONSTANDARD NAMING
        require(!timelock384.QUEUEDTRANSACTIONS810(keccak256(abi.encode(target, value, signature, data, eta))), "GovernorAlpha::_queueOrRevert: proposal action already queued at eta");
        timelock384.QUEUETRANSACTION255(target, value, signature, data, eta);
    }

    function EXECUTE172(uint proposalId) public payable {	//inject NONSTANDARD NAMING
        require(STATE862(proposalId) == ProposalState.Queued, "GovernorAlpha::execute: proposal can only be executed if it is queued");
        Proposal storage proposal = proposals[proposalId];
        proposal.executed = true;
        for (uint i = 0; i < proposal.targets.length; i++) {
            timelock384.EXECUTETRANSACTION708.value(proposal.values[i])(proposal.targets[i], proposal.values[i], proposal.signatures[i], proposal.calldatas[i], proposal.eta);
        }
        emit PROPOSALEXECUTED406(proposalId);
    }

    function CANCEL586(uint proposalId) public {	//inject NONSTANDARD NAMING
        ProposalState state = STATE862(proposalId);
        require(state != ProposalState.Executed, "GovernorAlpha::cancel: cannot cancel executed proposal");

        Proposal storage proposal = proposals[proposalId];
        require(uni450.GETPRIORVOTES224(proposal.proposer, SUB256281(block.number, 1)) < PROPOSALTHRESHOLD362(), "GovernorAlpha::cancel: proposer above threshold");

        proposal.canceled = true;
        for (uint i = 0; i < proposal.targets.length; i++) {
            timelock384.CANCELTRANSACTION90(proposal.targets[i], proposal.values[i], proposal.signatures[i], proposal.calldatas[i], proposal.eta);
        }

        emit PROPOSALCANCELED816(proposalId);
    }

    function GETACTIONS391(uint proposalId) public view returns (address[] memory targets, uint[] memory values, string[] memory signatures, bytes[] memory calldatas) {	//inject NONSTANDARD NAMING
        Proposal storage p = proposals[proposalId];
        return (p.targets, p.values, p.signatures, p.calldatas);
    }

    function GETRECEIPT304(uint proposalId, address voter) public view returns (Receipt memory) {	//inject NONSTANDARD NAMING
        return proposals[proposalId].receipts[voter];
    }

    function STATE862(uint proposalId) public view returns (ProposalState) {	//inject NONSTANDARD NAMING
        require(proposalCount >= proposalId && proposalId > 0, "GovernorAlpha::state: invalid proposal id");
        Proposal storage proposal = proposals[proposalId];
        if (proposal.canceled) {
            return ProposalState.Canceled;
        } else if (block.number <= proposal.startBlock) {
            return ProposalState.Pending;
        } else if (block.number <= proposal.endBlock) {
            return ProposalState.Active;
        } else if (proposal.forVotes <= proposal.againstVotes || proposal.forVotes < QUORUMVOTES339()) {
            return ProposalState.Defeated;
        } else if (proposal.eta == 0) {
            return ProposalState.Succeeded;
        } else if (proposal.executed) {
            return ProposalState.Executed;
        } else if (block.timestamp >= ADD256506(proposal.eta, timelock384.GRACE_PERIOD95())) {
            return ProposalState.Expired;
        } else {
            return ProposalState.Queued;
        }
    }

    function CASTVOTE741(uint proposalId, bool support) public {	//inject NONSTANDARD NAMING
        return _CASTVOTE695(msg.sender, proposalId, support);
    }

    function CASTVOTEBYSIG793(uint proposalId, bool support, uint8 v, bytes32 r, bytes32 s) public {	//inject NONSTANDARD NAMING
        bytes32 domainSeparator = keccak256(abi.encode(domain_typehash596, keccak256(bytes(name66)), GETCHAINID643(), address(this)));
        bytes32 structHash = keccak256(abi.encode(ballot_typehash401, proposalId, support));
        bytes32 digest = keccak256(abi.encodePacked("\x19\x01", domainSeparator, structHash));
        address signatory = ecrecover(digest, v, r, s);
        require(signatory != address(0), "GovernorAlpha::castVoteBySig: invalid signature");
        return _CASTVOTE695(signatory, proposalId, support);
    }

    function __ACCEPTADMIN50() public {	//inject NONSTANDARD NAMING
        timelock384.ACCEPTADMIN483();
    }

    function _CASTVOTE695(address voter, uint proposalId, bool support) internal {	//inject NONSTANDARD NAMING
        require(STATE862(proposalId) == ProposalState.Active, "GovernorAlpha::_castVote: voting is closed");
        Proposal storage proposal = proposals[proposalId];
        Receipt storage receipt = proposal.receipts[voter];
        require(receipt.hasVoted == false, "GovernorAlpha::_castVote: voter already voted");
        uint96 votes = uni450.GETPRIORVOTES224(voter, proposal.startBlock);

        if (support) {
            proposal.forVotes = ADD256506(proposal.forVotes, votes);
        } else {
            proposal.againstVotes = ADD256506(proposal.againstVotes, votes);
        }

        receipt.hasVoted = true;
        receipt.support = support;
        receipt.votes = votes;

        emit VOTECAST717(voter, proposalId, support, votes);
    }

    function ADD256506(uint256 a, uint256 b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "addition overflow");
        return c;
    }

    function SUB256281(uint256 a, uint256 b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, "subtraction underflow");
        return a - b;
    }

    function GETCHAINID643() internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint chainId;
        assembly { chainId := chainid() }
        return chainId;
    }
}

interface TimelockInterface {
    function DELAY876() external view returns (uint);	//inject NONSTANDARD NAMING
    function GRACE_PERIOD95() external view returns (uint);	//inject NONSTANDARD NAMING
    function ACCEPTADMIN483() external;	//inject NONSTANDARD NAMING
    function QUEUEDTRANSACTIONS810(bytes32 hash) external view returns (bool);	//inject NONSTANDARD NAMING
    function QUEUETRANSACTION255(address target, uint value, string calldata signature, bytes calldata data, uint eta) external returns (bytes32);	//inject NONSTANDARD NAMING
    function CANCELTRANSACTION90(address target, uint value, string calldata signature, bytes calldata data, uint eta) external;	//inject NONSTANDARD NAMING
    function EXECUTETRANSACTION708(address target, uint value, string calldata signature, bytes calldata data, uint eta) external payable returns (bytes memory);	//inject NONSTANDARD NAMING
}

interface UniInterface {
    function GETPRIORVOTES224(address account, uint blockNumber) external view returns (uint96);	//inject NONSTANDARD NAMING
}