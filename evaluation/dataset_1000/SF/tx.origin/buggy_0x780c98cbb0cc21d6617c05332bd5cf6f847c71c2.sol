/**
 *Submitted for verification at Etherscan.io on 2020-01-13
*/

// File: contracts/refund/IAlphaJobsManager.sol

pragma solidity ^0.5.11;


contract IAlphaJobsManager {
    function broadcasters(address _broadcaster) public view returns (uint256 deposit, uint256 withdrawBlock);
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
}

// File: contracts/refund/Refunder.sol

pragma solidity ^0.5.11;



contract Refunder {
    // Reference to alpha JobsManager
  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  IAlphaJobsManager public alphaJobsManager;

    // Keeps track of addresses that have withdrawn their refund
  function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
  mapping (address => bool) public withdrawn;

  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event FundsReceived(address from, uint256 amount);
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event RefundWithdrawn(address indexed addr, uint256 amount);

    /**
     * @notice Refunder constructor
     * @param _alphaJobsManagerAddr Address of alpha JobsManager
     */
    constructor(address _alphaJobsManagerAddr) public {
        alphaJobsManager = IAlphaJobsManager(_alphaJobsManagerAddr);
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}

    /**
     * @dev Receive and log receipt of ETH
     */
    function() external payable {
        emit FundsReceived(msg.sender, msg.value);
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

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
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
}