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

  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
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
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
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
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
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
bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
}