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

  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
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
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
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
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}


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
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}