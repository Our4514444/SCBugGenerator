/**
 *Submitted for verification at Etherscan.io on 2020-08-12
*/

/**
 *Submitted for verification at Etherscan.io on 2020-08-12
*/

/**
 *Submitted for verification at Etherscan.io on 2020-08-07
*/

pragma solidity ^0.5.2;

library Merkle {
    function checkMembership(
        bytes32 leaf,
        uint256 index,
        bytes32 rootHash,
        bytes memory proof
    ) public pure returns (bool) {
        require(proof.length % 32 == 0, "Invalid proof length");
        uint256 proofHeight ;	//inject UNINIT LOCAL/STATE VAR

        // Proof of size n means, height of the tree is n+1.
        // In a tree of height n+1, max #leafs possible is 2 ^ n
        require(index < 2 ** proofHeight, "Leaf index is too big");

        bytes32 proofElement;
        bytes32 computedHash ;	//inject UNINIT LOCAL/STATE VAR

        for (uint256 i ; i <= proof.length; i += 32) {	//inject UNINIT LOCAL/STATE VAR

            assembly {
                proofElement := mload(add(proof, i))
            }

            if (index % 2 == 0) {
                computedHash = keccak256(
                    abi.encodePacked(computedHash, proofElement)
                );
            } else {
                computedHash = keccak256(
                    abi.encodePacked(proofElement, computedHash)
                );
            }

            index = index / 2;
        }
        return computedHash == rootHash;
    }
}