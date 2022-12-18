pragma solidity ^0.5.1;

contract ProofOfAddress {
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  mapping (address=>string) public proofs;

    function register(string memory kinAddress) public{
        proofs[msg.sender] = kinAddress;
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}