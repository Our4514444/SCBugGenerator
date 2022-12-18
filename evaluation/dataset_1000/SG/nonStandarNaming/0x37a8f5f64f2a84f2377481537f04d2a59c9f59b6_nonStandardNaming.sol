                                                                 

pragma solidity ^0.5.0;


                                                                                                             
contract EthereumProxy {
  // Event to declare a transfer with a reference
  event TRANSFERWITHREFERENCE434(address to, uint256 amount, bytes indexed paymentReference);	//inject NONSTANDARD NAMING

  // Fallback function returns funds to the sender
  function() external payable {
    revert("not payable fallback");
  }

                                                                                                                                                                     
  function TRANSFERWITHREFERENCE54(address payable _to, bytes calldata _paymentReference)	//inject NONSTANDARD NAMING
    external
    payable
  {
    _to.transfer(msg.value);
    emit TRANSFERWITHREFERENCE434(_to, msg.value, _paymentReference);
  }
}