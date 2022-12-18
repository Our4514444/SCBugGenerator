/**
 *Submitted for verification at Etherscan.io on 2020-02-12
*/

pragma solidity ^0.5.0;


/**
 * @title EthereumProxy
 * @notice This contract performs an ethereum transfer and stores a reference
 */
contract EthereumProxy {
  // Event to declare a transfer with a reference
bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event TransferWithReference(address to, uint256 amount, bytes indexed paymentReference);

  // Fallback function returns funds to the sender
  function() external payable {
    revert("not payable fallback");
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
  * @notice Performs an ethereum transfer with a reference
  * @param _to Transfer recipient
  * @param _paymentReference Reference of the payment related
  */
  function transferWithReference(address payable _to, bytes calldata _paymentReference)
    external
    payable
  {
    _to.transfer(msg.value);
    emit TransferWithReference(_to, msg.value, _paymentReference);
  }
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
}