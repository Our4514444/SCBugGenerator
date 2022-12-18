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

  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
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
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
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
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
}