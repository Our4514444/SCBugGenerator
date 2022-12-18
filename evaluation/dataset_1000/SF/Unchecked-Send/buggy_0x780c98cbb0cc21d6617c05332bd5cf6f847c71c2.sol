/**
 *Submitted for verification at Etherscan.io on 2020-01-13
*/

// File: contracts/refund/IAlphaJobsManager.sol

pragma solidity ^0.5.11;


contract IAlphaJobsManager {
    function broadcasters(address _broadcaster) public view returns (uint256 deposit, uint256 withdrawBlock);
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
}

// File: contracts/refund/Refunder.sol

pragma solidity ^0.5.11;



contract Refunder {
    // Reference to alpha JobsManager
  function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  IAlphaJobsManager public alphaJobsManager;

    // Keeps track of addresses that have withdrawn their refund
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => bool) public withdrawn;

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event FundsReceived(address from, uint256 amount);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event RefundWithdrawn(address indexed addr, uint256 amount);

    /**
     * @notice Refunder constructor
     * @param _alphaJobsManagerAddr Address of alpha JobsManager
     */
    constructor(address _alphaJobsManagerAddr) public {
        alphaJobsManager = IAlphaJobsManager(_alphaJobsManagerAddr);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Receive and log receipt of ETH
     */
    function() external payable {
        emit FundsReceived(msg.sender, msg.value);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}