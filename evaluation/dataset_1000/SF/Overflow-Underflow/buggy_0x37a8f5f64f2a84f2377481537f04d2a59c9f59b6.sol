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
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event TransferWithReference(address to, uint256 amount, bytes indexed paymentReference);

  // Fallback function returns funds to the sender
  function() external payable {
    revert("not payable fallback");
  }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
}