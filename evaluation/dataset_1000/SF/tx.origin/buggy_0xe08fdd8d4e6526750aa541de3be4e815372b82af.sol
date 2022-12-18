/**
 *Submitted for verification at Etherscan.io on 2020-09-08
*/

pragma solidity 0.5.17;

interface IToken {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract DropToken { // transfer msg.sender token to recipients per approved drop amount w/ msg.
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event DropTKN(bytes32 indexed message);
    
    function dropTKN(address[] calldata recipients, address tokenAddress, uint256 amount, bytes32 message) external {
        IToken token = IToken(tokenAddress);
        uint256 amounts = amount / recipients.length;
        for (uint256 i = 0; i < recipients.length; i++) {
	    token.transferFrom(msg.sender, recipients[i], amounts);}
	    emit DropTKN(message);
    }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
}