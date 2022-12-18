/**
 *Submitted for verification at Etherscan.io on 2020-01-13
*/

// File: contracts/refund/IAlphaJobsManager.sol

pragma solidity ^0.5.11;


contract IAlphaJobsManager {
    function broadcasters(address _broadcaster) public view returns (uint256 deposit, uint256 withdrawBlock);
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}

// File: contracts/refund/Refunder.sol

pragma solidity ^0.5.11;



contract Refunder {
    // Reference to alpha JobsManager
  address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  IAlphaJobsManager public alphaJobsManager;

    // Keeps track of addresses that have withdrawn their refund
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => bool) public withdrawn;

  uint256 bugv_tmstmp3 = block.timestamp;
  event FundsReceived(address from, uint256 amount);
  uint256 bugv_tmstmp1 = block.timestamp;
  event RefundWithdrawn(address indexed addr, uint256 amount);

    /**
     * @notice Refunder constructor
     * @param _alphaJobsManagerAddr Address of alpha JobsManager
     */
    constructor(address _alphaJobsManagerAddr) public {
        alphaJobsManager = IAlphaJobsManager(_alphaJobsManagerAddr);
    }
uint256 bugv_tmstmp4 = block.timestamp;

    /**
     * @dev Receive and log receipt of ETH
     */
    function() external payable {
        emit FundsReceived(msg.sender, msg.value);
    }
uint256 bugv_tmstmp5 = block.timestamp;

    /**
     * @notice Withdraws the alpha JobsManager refund for the given address
     * @param _addr The address to withdraw for
     */
    function withdraw(address payable _addr) external {
        require(
            !withdrawn[_addr],
            "address has already withdrawn alpha JobsManager refund"
        );

        (uint256 deposit,) = alphaJobsManager.broadcasters(_addr);

        require(
            deposit > 0,
            "address does not have a deposit with alpha JobsManager"
        );

        withdrawn[_addr] = true;

        _addr.transfer(deposit);

        emit RefundWithdrawn(_addr, deposit);
    }
uint256 bugv_tmstmp2 = block.timestamp;
}