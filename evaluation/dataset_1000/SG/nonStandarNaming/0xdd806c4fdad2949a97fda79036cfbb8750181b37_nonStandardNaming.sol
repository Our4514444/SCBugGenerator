pragma solidity 0.5.7;
pragma experimental ABIEncoderV2;


                                                                                        
interface IERC20 {
    function TRANSFER522(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE352(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM776(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY978() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF175(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE556(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER433(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL847(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                                   
library SafeMath {
                                                                                
    function MUL110(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath::mul: Integer overflow");

        return c;
    }

                                                                                                                         
    function DIV837(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath::div: Invalid divisor zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB835(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath::sub: Integer underflow");
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD439(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath::add: Integer overflow");

        return c;
    }

                                                                                                                                                 
    function MOD196(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath::mod: Invalid divisor zero");
        return a % b;
    }
}

                                                             
contract Void {}


                                                               
contract Governance {
    using SafeMath for uint;

    event EXECUTE554(uint indexed proposalId);	//inject NONSTANDARD NAMING
    event PROPOSE858(uint indexed proposalId, address indexed proposer, address indexed target, bytes data);	//inject NONSTANDARD NAMING
    event REMOVEVOTE275(uint indexed proposalId, address indexed voter);	//inject NONSTANDARD NAMING
    event TERMINATE261(uint indexed proposalId);	//inject NONSTANDARD NAMING
    event VOTE117(uint indexed proposalId, address indexed voter, bool approve, uint weight);	//inject NONSTANDARD NAMING

    enum Result { Pending, Yes, No }

    struct Proposal {
        Result result;
        address target;
        bytes data;
        address proposer;
        address feeRecipient;
        uint fee;
        uint startTime;
        uint yesCount;
        uint noCount;
    }

    uint public constant open_vote_period804 = 2 days;	//inject NONSTANDARD NAMING
    uint public constant veto_period889 = 2 days;	//inject NONSTANDARD NAMING
    uint public constant total_vote_period28 = open_vote_period804 + veto_period889;	//inject NONSTANDARD NAMING

    uint public proposalFee;
    IERC20 public token;
    Void public void;

    Proposal[] public proposals;

    // Proposal Id => Voter => Yes Votes
    mapping(uint => mapping(address => uint)) public yesVotes;

    // Proposal Id => Voter => No Votes
    mapping(uint => mapping(address => uint)) public noVotes;

    // Voter => Deposit
    mapping (address => uint) public deposits;

    // Voter => Withdraw timestamp
    mapping (address => uint) public withdrawTimes;

    constructor(IERC20 _token, uint _initialProposalFee) public {
        token = _token;
        proposalFee = _initialProposalFee;
        void = new Void();
    }

    function DEPOSIT565(uint amount) public {	//inject NONSTANDARD NAMING
        require(token.TRANSFERFROM776(msg.sender, address(this), amount), "Governance::deposit: Transfer failed");
        deposits[msg.sender] = deposits[msg.sender].ADD439(amount);
    }

    function WITHDRAW797(uint amount) public {	//inject NONSTANDARD NAMING
        require(TIME929() > withdrawTimes[msg.sender], "Governance::withdraw: Voters with an active proposal cannot withdraw");
        deposits[msg.sender] = deposits[msg.sender].SUB835(amount);
        require(token.TRANSFER522(msg.sender, amount), "Governance::withdraw: Transfer failed");
    }

    function PROPOSE75(address target, bytes memory data) public returns (uint) {	//inject NONSTANDARD NAMING
        return PROPOSEWITHFEERECIPIENT840(msg.sender, target, data);
    }

    function PROPOSEWITHFEERECIPIENT840(address feeRecipient, address target, bytes memory data) public returns (uint) {	//inject NONSTANDARD NAMING
        require(msg.sender != address(this) && target != address(token), "Governance::proposeWithFeeRecipient: Invalid proposal");
        require(token.TRANSFERFROM776(msg.sender, address(this), proposalFee), "Governance::proposeWithFeeRecipient: Transfer failed");

        uint proposalId = proposals.length;

        // Create a new proposal and vote yes
        Proposal memory proposal;
        proposal.target = target;
        proposal.data = data;
        proposal.proposer = msg.sender;
        proposal.feeRecipient = feeRecipient;
        proposal.fee = proposalFee;
        proposal.startTime = TIME929();
        proposal.yesCount = proposalFee;

        proposals.push(proposal);

        emit PROPOSE858(proposalId, msg.sender, target, data);

        return proposalId;
    }

    function VOTEYES353(uint proposalId) public {	//inject NONSTANDARD NAMING
        Proposal storage proposal = proposals[proposalId];
        require(TIME929() <= proposal.startTime.ADD439(open_vote_period804), "Governance::voteYes: Proposal is no longer accepting yes votes");

        uint proposalEndTime = proposal.startTime.ADD439(total_vote_period28);
        if (proposalEndTime > withdrawTimes[msg.sender]) withdrawTimes[msg.sender] = proposalEndTime;

        uint weight = deposits[msg.sender].SUB835(yesVotes[proposalId][msg.sender]);
        proposal.yesCount = proposal.yesCount.ADD439(weight);
        yesVotes[proposalId][msg.sender] = deposits[msg.sender];

        emit VOTE117(proposalId, msg.sender, true, weight);
    }

    function VOTENO665(uint proposalId) public {	//inject NONSTANDARD NAMING
        Proposal storage proposal = proposals[proposalId];
        require(proposal.result == Result.Pending, "Governance::voteNo: Proposal is already finalized");

        uint proposalEndTime = proposal.startTime.ADD439(total_vote_period28);
        uint _time = TIME929();
        require(_time <= proposalEndTime, "Governance::voteNo: Proposal is no longer in voting period");

        uint _deposit = deposits[msg.sender];
        uint weight = _deposit.SUB835(noVotes[proposalId][msg.sender]);
        proposal.noCount = proposal.noCount.ADD439(weight);
        noVotes[proposalId][msg.sender] = _deposit;

        emit VOTE117(proposalId, msg.sender, false, weight);

        // Finalize the vote and burn the proposal fee if no votes outnumber yes votes and open voting has ended
        if (_time > proposal.startTime.ADD439(open_vote_period804) && proposal.noCount >= proposal.yesCount) {
            proposal.result = Result.No;
            require(token.TRANSFER522(address(void), proposal.fee), "Governance::voteNo: Transfer to void failed");
            emit TERMINATE261(proposalId);
        } else if (proposalEndTime > withdrawTimes[msg.sender]) {
            withdrawTimes[msg.sender] = proposalEndTime;
        }

    }

    function REMOVEVOTE168(uint proposalId) public {	//inject NONSTANDARD NAMING
        Proposal storage proposal = proposals[proposalId];
        require(proposal.result == Result.Pending, "Governance::removeVote: Proposal is already finalized");
        require(TIME929() <= proposal.startTime.ADD439(total_vote_period28), "Governance::removeVote: Proposal is no longer in voting period");

        proposal.yesCount = proposal.yesCount.SUB835(yesVotes[proposalId][msg.sender]);
        proposal.noCount = proposal.noCount.SUB835(noVotes[proposalId][msg.sender]);
        delete yesVotes[proposalId][msg.sender];
        delete noVotes[proposalId][msg.sender];

        emit REMOVEVOTE275(proposalId, msg.sender);
    }

    function FINALIZE191(uint proposalId) public {	//inject NONSTANDARD NAMING
        Proposal storage proposal = proposals[proposalId];
        require(proposal.result == Result.Pending, "Governance::finalize: Proposal is already finalized");
        uint _time = TIME929();

        if (proposal.yesCount > proposal.noCount) {
            require(_time > proposal.startTime.ADD439(total_vote_period28), "Governance::finalize: Proposal cannot be executed until end of veto period");

            proposal.result = Result.Yes;
            require(token.TRANSFER522(proposal.feeRecipient, proposal.fee), "Governance::finalize: Return proposal fee failed");
            proposal.target.call(proposal.data);

            emit EXECUTE554(proposalId);
        } else {
            require(_time > proposal.startTime.ADD439(open_vote_period804), "Governance::finalize: Proposal cannot be terminated until end of yes vote period");

            proposal.result = Result.No;
            require(token.TRANSFER522(address(void), proposal.fee), "Governance::finalize: Transfer to void failed");

            emit TERMINATE261(proposalId);
        }
    }

    function SETPROPOSALFEE619(uint fee) public {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "Governance::setProposalFee: Proposal fee can only be set via governance");
        proposalFee = fee;
    }

    function TIME929() public view returns (uint) {	//inject NONSTANDARD NAMING
        return block.timestamp;
    }

    function GETPROPOSAL751(uint proposalId) external view returns (Proposal memory) {	//inject NONSTANDARD NAMING
        return proposals[proposalId];
    }

    function GETPROPOSALSCOUNT93() external view returns (uint) {	//inject NONSTANDARD NAMING
        return proposals.length;
    }

}


                                                                                                                             
contract HumanityGovernance is Governance {

    constructor(IERC20 humanity, uint proposalFee) public
        Governance(humanity, proposalFee) {}

}