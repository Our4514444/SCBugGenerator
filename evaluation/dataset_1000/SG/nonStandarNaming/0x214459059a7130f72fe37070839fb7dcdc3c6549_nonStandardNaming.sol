pragma solidity ^0.5.1;

contract ProofOfAddress {
    mapping (address=>string) public proofs;

    function REGISTER141(string memory kinAddress) public{	//inject NONSTANDARD NAMING
        proofs[msg.sender] = kinAddress;
    }
}