                                                                 

pragma solidity ^0.5.17;
pragma experimental ABIEncoderV2;

// From https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/Math.sol
// Subject to the MIT license.

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                      
    function ADD829(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                          
    function ADD829(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, errorMessage);

        return c;
    }

                                                                                                                                                                                                                                                            
    function SUB904(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB904(a, b, "SafeMath: subtraction underflow");
    }

                                                                                                                                                                                                                                                                                
    function SUB904(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                  
    function MUL242(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                  
    function MUL242(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, errorMessage);

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV66(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV66(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DIV66(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD647(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD647(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function MOD647(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract Governance {
    using SafeMath for uint;
                                         
    string public constant name100 = "Governance";	//inject NONSTANDARD NAMING

                                                                                                                                   
    uint public _quorumVotes = 400; // % of total supply required
    
                                                                                      
    uint public _proposalThreshold = 100; 

    uint public constant base717 = 10000;	//inject NONSTANDARD NAMING
    
    function SETQUORUM926(uint quorum_) external {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "Governance::setQuorum: timelock only");
        _quorumVotes = quorum_;
    }
    
    function QUORUMVOTES393() public view returns (uint) {	//inject NONSTANDARD NAMING
        return VOTER.TOTALBONDED635().MUL242(_quorumVotes).DIV66(base717);
    }
    
    function PROPOSALTHRESHOLD347() public view returns (uint) {	//inject NONSTANDARD NAMING
        return VOTER.TOTALBONDED635().MUL242(_proposalThreshold).DIV66(base717);
    }
    
    function SETTHRESHOLD312(uint threshold_) external {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "Governance::setQuorum: timelock only");
        _proposalThreshold = threshold_;
    }

                                                                                
    function PROPOSALMAXOPERATIONS673() public pure returns (uint) { return 10; } // 10 actions	//inject NONSTANDARD NAMING

                                                                                   
    function VOTINGDELAY997() public pure returns (uint) { return 1; } // 1 block	//inject NONSTANDARD NAMING

                                                               
    function VOTINGPERIOD539() public pure returns (uint) { return 40_320; } // ~7 days in blocks (assuming 15s blocks)	//inject NONSTANDARD NAMING

                                                   
    DelegateInterface public VOTER;

                                             
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

                                                                      
        uint votes;
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

                                                              
    bytes32 public constant domain_typehash180 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	//inject NONSTANDARD NAMING

                                                                               
    bytes32 public constant ballot_typehash394 = keccak256("Ballot(uint256 proposalId,bool support)");	//inject NONSTANDARD NAMING

                                                               
    event PROPOSALCREATED116(uint id, address proposer, address[] targets, uint[] values, string[] signatures, bytes[] calldatas, uint startBlock, uint endBlock, string description);	//inject NONSTANDARD NAMING

                                                                        
    event VOTECAST871(address voter, uint proposalId, bool support, uint votes);	//inject NONSTANDARD NAMING

                                                                  
    event PROPOSALCANCELED230(uint id);	//inject NONSTANDARD NAMING

                                                                                
    event PROPOSALQUEUED475(uint id, uint eta);	//inject NONSTANDARD NAMING

                                                                                  
    event PROPOSALEXECUTED654(uint id);	//inject NONSTANDARD NAMING
    
    function PROPOSEJOB747(address job) public returns (uint) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(VOTER), "Governance::proposeJob: only VOTER can propose new jobs");
        address[] memory targets;
        targets[0] = address(VOTER);
        
        string[] memory signatures;
        signatures[0] = "addJob(address)";
        
        bytes[] memory calldatas;
        calldatas[0] = abi.encode(job);
        
        uint[] memory values;
        values[0] = 0;
        
        _PROPOSE941(targets, values, signatures, calldatas, "Governance::proposeJob: New job review request");
    }

    function PROPOSE893(address[] memory targets, uint[] memory values, string[] memory signatures, bytes[] memory calldatas, string memory description) public returns (uint) {	//inject NONSTANDARD NAMING
        require(VOTER.GETPRIORVOTES549(msg.sender, block.number.SUB904(1)) > PROPOSALTHRESHOLD347(), "Governance::propose: proposer votes below proposal threshold");
        require(targets.length == values.length && targets.length == signatures.length && targets.length == calldatas.length, "Governance::propose: proposal function information arity mismatch");
        require(targets.length != 0, "Governance::propose: must provide actions");
        require(targets.length <= PROPOSALMAXOPERATIONS673(), "Governance::propose: too many actions");
        
        uint latestProposalId = latestProposalIds[msg.sender];
        if (latestProposalId != 0) {
          ProposalState proposersLatestProposalState = STATE418(latestProposalId);
          require(proposersLatestProposalState != ProposalState.Active, "Governance::propose: one live proposal per proposer, found an already active proposal");
          require(proposersLatestProposalState != ProposalState.Pending, "Governance::propose: one live proposal per proposer, found an already pending proposal");
        }

        return _PROPOSE941(targets, values, signatures, calldatas, description);
    }
    
    function _PROPOSE941(address[] memory targets, uint[] memory values, string[] memory signatures, bytes[] memory calldatas, string memory description) internal returns (uint) {	//inject NONSTANDARD NAMING
        uint startBlock = block.number.ADD829(VOTINGDELAY997());
        uint endBlock = startBlock.ADD829(VOTINGPERIOD539());

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

        emit PROPOSALCREATED116(newProposal.id, msg.sender, targets, values, signatures, calldatas, startBlock, endBlock, description);
        return newProposal.id;
    }

    function QUEUE680(uint proposalId) public {	//inject NONSTANDARD NAMING
        require(STATE418(proposalId) == ProposalState.Succeeded, "Governance::queue: proposal can only be queued if it is succeeded");
        Proposal storage proposal = proposals[proposalId];
        uint eta = block.timestamp.ADD829(delay);
        for (uint i = 0; i < proposal.targets.length; i++) {
            _QUEUEORREVERT957(proposal.targets[i], proposal.values[i], proposal.signatures[i], proposal.calldatas[i], eta);
        }
        proposal.eta = eta;
        emit PROPOSALQUEUED475(proposalId, eta);
    }

    function _QUEUEORREVERT957(address target, uint value, string memory signature, bytes memory data, uint eta) internal {	//inject NONSTANDARD NAMING
        require(!queuedTransactions[keccak256(abi.encode(target, value, signature, data, eta))], "Governance::_queueOrRevert: proposal action already queued at eta");
        QUEUETRANSACTION614(target, value, signature, data, eta);
    }

    function EXECUTE599(uint proposalId) public payable {	//inject NONSTANDARD NAMING
        require(STATE418(proposalId) == ProposalState.Queued, "Governance::execute: proposal can only be executed if it is queued");
        Proposal storage proposal = proposals[proposalId];
        proposal.executed = true;
        for (uint i = 0; i < proposal.targets.length; i++) {
            EXECUTETRANSACTION10(proposal.targets[i], proposal.values[i], proposal.signatures[i], proposal.calldatas[i], proposal.eta);
        }
        emit PROPOSALEXECUTED654(proposalId);
    }

    function CANCEL965(uint proposalId) public {	//inject NONSTANDARD NAMING
        ProposalState state = STATE418(proposalId);
        require(state != ProposalState.Executed, "Governance::cancel: cannot cancel executed proposal");

        Proposal storage proposal = proposals[proposalId];
        require(VOTER.GETPRIORVOTES549(proposal.proposer, block.number.SUB904(1)) < PROPOSALTHRESHOLD347(), "Governance::cancel: proposer above threshold");

        proposal.canceled = true;
        for (uint i = 0; i < proposal.targets.length; i++) {
            CANCELTRANSACTION628(proposal.targets[i], proposal.values[i], proposal.signatures[i], proposal.calldatas[i], proposal.eta);
        }

        emit PROPOSALCANCELED230(proposalId);
    }

    function GETACTIONS72(uint proposalId) public view returns (address[] memory targets, uint[] memory values, string[] memory signatures, bytes[] memory calldatas) {	//inject NONSTANDARD NAMING
        Proposal storage p = proposals[proposalId];
        return (p.targets, p.values, p.signatures, p.calldatas);
    }

    function GETRECEIPT857(uint proposalId, address voter) public view returns (Receipt memory) {	//inject NONSTANDARD NAMING
        return proposals[proposalId].receipts[voter];
    }

    function STATE418(uint proposalId) public view returns (ProposalState) {	//inject NONSTANDARD NAMING
        require(proposalCount >= proposalId && proposalId > 0, "Governance::state: invalid proposal id");
        Proposal storage proposal = proposals[proposalId];
        if (proposal.canceled) {
            return ProposalState.Canceled;
        } else if (block.number <= proposal.startBlock) {
            return ProposalState.Pending;
        } else if (block.number <= proposal.endBlock) {
            return ProposalState.Active;
        } else if (proposal.forVotes <= proposal.againstVotes || proposal.forVotes < QUORUMVOTES393()) {
            return ProposalState.Defeated;
        } else if (proposal.eta == 0) {
            return ProposalState.Succeeded;
        } else if (proposal.executed) {
            return ProposalState.Executed;
        } else if (block.timestamp >= proposal.eta.ADD829(grace_period180)) {
            return ProposalState.Expired;
        } else {
            return ProposalState.Queued;
        }
    }

    function CASTVOTE747(uint proposalId, bool support) public {	//inject NONSTANDARD NAMING
        return _CASTVOTE906(msg.sender, proposalId, support);
    }

    function CASTVOTEBYSIG956(uint proposalId, bool support, uint8 v, bytes32 r, bytes32 s) public {	//inject NONSTANDARD NAMING
        bytes32 domainSeparator = keccak256(abi.encode(domain_typehash180, keccak256(bytes(name100)), GETCHAINID660(), address(this)));
        bytes32 structHash = keccak256(abi.encode(ballot_typehash394, proposalId, support));
        bytes32 digest = keccak256(abi.encodePacked("\x19\x01", domainSeparator, structHash));
        address signatory = ecrecover(digest, v, r, s);
        require(signatory != address(0), "Governance::castVoteBySig: invalid signature");
        return _CASTVOTE906(signatory, proposalId, support);
    }

    function _CASTVOTE906(address voter, uint proposalId, bool support) internal {	//inject NONSTANDARD NAMING
        require(STATE418(proposalId) == ProposalState.Active, "Governance::_castVote: voting is closed");
        Proposal storage proposal = proposals[proposalId];
        Receipt storage receipt = proposal.receipts[voter];
        require(receipt.hasVoted == false, "Governance::_castVote: voter already voted");
        uint votes = VOTER.GETPRIORVOTES549(voter, proposal.startBlock);

        if (support) {
            proposal.forVotes = proposal.forVotes.ADD829(votes);
        } else {
            proposal.againstVotes = proposal.againstVotes.ADD829(votes);
        }

        receipt.hasVoted = true;
        receipt.support = support;
        receipt.votes = votes;

        emit VOTECAST871(voter, proposalId, support, votes);
    }

    function GETCHAINID660() internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint chainId;
        assembly { chainId := chainid() }
        return chainId;
    }
    
    event NEWDELAY863(uint indexed newDelay);	//inject NONSTANDARD NAMING
    event CANCELTRANSACTION419(bytes32 indexed txHash, address indexed target, uint value, string signature,  bytes data, uint eta);	//inject NONSTANDARD NAMING
    event EXECUTETRANSACTION239(bytes32 indexed txHash, address indexed target, uint value, string signature,  bytes data, uint eta);	//inject NONSTANDARD NAMING
    event QUEUETRANSACTION586(bytes32 indexed txHash, address indexed target, uint value, string signature, bytes data, uint eta);	//inject NONSTANDARD NAMING

    uint public constant grace_period180 = 14 days;	//inject NONSTANDARD NAMING
    uint public constant minimum_delay289 = 1 days;	//inject NONSTANDARD NAMING
    uint public constant maximum_delay220 = 30 days;	//inject NONSTANDARD NAMING
    
    uint public delay = minimum_delay289;

    mapping (bytes32 => bool) public queuedTransactions;

    constructor(address token_) public {
        VOTER = DelegateInterface(token_);
    }

    function() external payable { }

    function SETDELAY36(uint delay_) public {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "Timelock::setDelay: Call must come from Timelock.");
        require(delay_ >= minimum_delay289, "Timelock::setDelay: Delay must exceed minimum delay.");
        require(delay_ <= maximum_delay220, "Timelock::setDelay: Delay must not exceed maximum delay.");
        delay = delay_;

        emit NEWDELAY863(delay);
    }

    function QUEUETRANSACTION614(address target, uint value, string memory signature, bytes memory data, uint eta) public returns (bytes32) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "Timelock::queueTransaction: Call must come from admin.");
        require(eta >= GETBLOCKTIMESTAMP720().ADD829(delay), "Timelock::queueTransaction: Estimated execution block must satisfy delay.");

        bytes32 txHash = keccak256(abi.encode(target, value, signature, data, eta));
        queuedTransactions[txHash] = true;

        emit QUEUETRANSACTION586(txHash, target, value, signature, data, eta);
        return txHash;
    }

    function CANCELTRANSACTION628(address target, uint value, string memory signature, bytes memory data, uint eta) public {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "Timelock::cancelTransaction: Call must come from admin.");

        bytes32 txHash = keccak256(abi.encode(target, value, signature, data, eta));
        queuedTransactions[txHash] = false;

        emit CANCELTRANSACTION419(txHash, target, value, signature, data, eta);
    }

    function EXECUTETRANSACTION10(address target, uint value, string memory signature, bytes memory data, uint eta) public payable returns (bytes memory) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "Timelock::executeTransaction: Call must come from admin.");

        bytes32 txHash = keccak256(abi.encode(target, value, signature, data, eta));
        require(queuedTransactions[txHash], "Timelock::executeTransaction: Transaction hasn't been queued.");
        require(GETBLOCKTIMESTAMP720() >= eta, "Timelock::executeTransaction: Transaction hasn't surpassed time lock.");
        require(GETBLOCKTIMESTAMP720() <= eta.ADD829(grace_period180), "Timelock::executeTransaction: Transaction is stale.");

        queuedTransactions[txHash] = false;

        bytes memory callData;

        if (bytes(signature).length == 0) {
            callData = data;
        } else {
            callData = abi.encodePacked(bytes4(keccak256(bytes(signature))), data);
        }

        // solium-disable-next-line security/no-call-value
        (bool success, bytes memory returnData) = target.call.value(value)(callData);
        require(success, "Timelock::executeTransaction: Transaction execution reverted.");

        emit EXECUTETRANSACTION239(txHash, target, value, signature, data, eta);

        return returnData;
    }

    function GETBLOCKTIMESTAMP720() internal view returns (uint) {	//inject NONSTANDARD NAMING
        // solium-disable-next-line security/no-block-members
        return block.timestamp;
    }
}

interface DelegateInterface {
    function GETPRIORVOTES549(address account, uint blockNumber) external view returns (uint);	//inject NONSTANDARD NAMING
    function TOTALBONDED635() external view returns (uint);	//inject NONSTANDARD NAMING
}