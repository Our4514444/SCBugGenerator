pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

/**
 * @title https://incessant.ink
 * @author Kelvin Fichter (@kelvinfichter)
 */
contract IncessantInk {
    
    /*
     * Structs
     */

    struct Commitment {
        address creator;
        uint256 block;
        uint256 timestamp;
    }


    /*
     * Public Variables
     */

  bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }
  mapping (bytes32 => Commitment) public commitments;


    /*
     * Public Functions
     */

    /**
     * @notice Allows a user to create a commitment.
     * @param _hash Hash of the committed data.
     */
    function commit(bytes32 _hash) public {
        Commitment storage commitment = commitments[_hash];
        
        require(
            !commitmentExists(_hash),
            "Commitment with that hash already exists, try adding a salt."
        );

        commitment.creator = msg.sender;
        commitment.block = block.number;
        commitment.timestamp = block.timestamp;
    }
address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }

    /**
     * @notice Checks if a message was committed.
     * @param _message Message to check.
     * @return Commitment corresponding to the given message.
     */
    function verify(
        bytes memory _message
    )
        public
        view
        returns (Commitment memory)
    {
        bytes32 hash = keccak256(_message);
        Commitment memory commitment = commitments[hash];

        require(
            commitmentExists(hash),
            "Commitment with that hash does not exist."
        );

        return commitment;
    }
address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }


    /*
     * Private Functions
     */

    /**
     * @notice Checks if a specific commitment has been made.
     * @param _hash Hash of the commitment to check.
     * @return `true` if the commitment has been made, `false` otherwise.
     */
    function commitmentExists(bytes32 _hash) private view returns (bool) {
        return commitments[_hash].creator != address(0);
    }
address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
}