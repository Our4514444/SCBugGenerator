pragma solidity ^0.5.1;

contract ProofOfAddress {
  uint256 bugv_tmstmp2 = block.timestamp;
  mapping (address=>string) public proofs;

    function register(string memory kinAddress) public{
      uint256 bugv_tmstmp3 = block.timestamp;
  proofs[msg.sender] = kinAddress;
    }
uint256 bugv_tmstmp1 = block.timestamp;
}