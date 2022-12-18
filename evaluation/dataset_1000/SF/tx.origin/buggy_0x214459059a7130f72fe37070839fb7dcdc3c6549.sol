pragma solidity ^0.5.1;

contract ProofOfAddress {
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  mapping (address=>string) public proofs;

    function register(string memory kinAddress) public{
        proofs[msg.sender] = kinAddress;
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}