/**
 *Submitted for verification at Etherscan.io on 2020-01-13
*/

// File: contracts/refund/IAlphaJobsManager.sol

pragma solidity ^0.5.11;


contract IAlphaJobsManager {
    function broadcasters(address _broadcaster) public view returns (uint256 deposit, uint256 withdrawBlock);
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
}

// File: contracts/refund/Refunder.sol

pragma solidity ^0.5.11;



contract Refunder {
    // Reference to alpha JobsManager
  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  IAlphaJobsManager public alphaJobsManager;

    // Keeps track of addresses that have withdrawn their refund
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  mapping (address => bool) public withdrawn;

  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event FundsReceived(address from, uint256 amount);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event RefundWithdrawn(address indexed addr, uint256 amount);

    /**
     * @notice Refunder constructor
     * @param _alphaJobsManagerAddr Address of alpha JobsManager
     */
    constructor(address _alphaJobsManagerAddr) public {
        alphaJobsManager = IAlphaJobsManager(_alphaJobsManagerAddr);
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    /**
     * @dev Receive and log receipt of ETH
     */
    function() external payable {
        emit FundsReceived(msg.sender, msg.value);
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
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
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
}