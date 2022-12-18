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

  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
uint256 bugv_tmstmp2 = block.timestamp;

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

      uint256 bugv_tmstmp4 = block.timestamp;
  require(
            commitmentExists(hash),
            "Commitment with that hash does not exist."
        );

        return commitment;
    }
uint256 bugv_tmstmp3 = block.timestamp;


    /*
     * Private Functions
     */

    /**
     * @notice Checks if a specific commitment has been made.
     * @param _hash Hash of the commitment to check.
     * @return `true` if the commitment has been made, `false` otherwise.
     */
    function commitmentExists(bytes32 _hash) private view returns (bool) {
      uint256 bugv_tmstmp5 = block.timestamp;
  return commitments[_hash].creator != address(0);
    }
uint256 bugv_tmstmp1 = block.timestamp;
}