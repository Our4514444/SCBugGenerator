pragma solidity ^0.5.1;

contract ProofOfAddress {
    mapping (address=>string) internal proofs;

    function register(string memory kinAddress) public{
        proofs[msg.sender] = kinAddress;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}