pragma solidity ^0.5.1;

contract ProofOfAddress {
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address=>string) public proofs;

    function register(string memory kinAddress) public{
        proofs[msg.sender] = kinAddress;
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}