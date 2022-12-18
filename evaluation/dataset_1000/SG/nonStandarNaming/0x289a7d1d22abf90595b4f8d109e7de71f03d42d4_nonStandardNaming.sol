                                                                 

// Built by @nanexcool - 2020

pragma solidity ^0.5.15;

interface Chai {
    function BALANCEOF457(address who) external view returns (uint256 wad);	//inject NONSTANDARD NAMING
    function TRANSFER675(address who, uint256 wad) external returns (bool ok);	//inject NONSTANDARD NAMING
}

contract AztecChaiAirdrop {

    // all of these constants will one day be `immutable` ;)
    Chai public constant chai709 = Chai(0x06AF07097C9Eeb7fD685c692751D5C66dB49c215);	//inject NONSTANDARD NAMING
    bytes32 public constant roothash73 = 0x20162f371d4318f677b2dc93bdda3d26c72856293a2885c2b204f212082f0a62;	//inject NONSTANDARD NAMING
    // expires Friday, January 24, 2020 12:00:00 AM GMT
    uint256 public constant expires684 = 1579824000;	//inject NONSTANDARD NAMING
    address public constant owner772 = 0x72BA1965320ab5352FD6D68235Cc3C5306a6FFA2;	//inject NONSTANDARD NAMING
    uint256 public claimed;
    mapping (address => uint256) public done;

    function CLAIM324(bytes32[] calldata proof) external {	//inject NONSTANDARD NAMING
        require(now < expires684, "experiment is over!");
        require(done[msg.sender] == 0, "claimed!");
        require(VERIFY426(proof, msg.sender), "nope!");

        done[msg.sender] = 1;
        claimed++;

        require(chai709.TRANSFER675(msg.sender, 1 ether), "could not transfer chai");
    }

    // https://rstormsf.github.io/slides-merkleairdrop/#/14
    function VERIFY426(bytes32[] memory proof, address who) public pure returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 computedHash = keccak256(abi.encodePacked(who));

        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];

            if (computedHash < proofElement) {
            computedHash = keccak256(abi.encodePacked(computedHash, proofElement));
            } else {
            computedHash = keccak256(abi.encodePacked(proofElement, computedHash));
            }
        }

        return computedHash == roothash73;
    }

    function END216() external {	//inject NONSTANDARD NAMING
        require(now >= expires684, "experiment is not over!");
        require(msg.sender == owner772, "you are not Mariano!");

        chai709.TRANSFER675(msg.sender, chai709.BALANCEOF457(address(this)));
    }
}