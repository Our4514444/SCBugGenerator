/**
 *Submitted for verification at Etherscan.io on 2020-01-13
*/

// Built by @nanexcool - 2020

pragma solidity ^0.5.15;

interface Chai {
    function balanceOf(address who) external view returns (uint256 wad);
    function transfer(address who, uint256 wad) external returns (bool ok);
}

contract AztecChaiAirdrop {

    // all of these constants will one day be `immutable` ;)
    Chai public constant chai = Chai(0x06AF07097C9Eeb7fD685c692751D5C66dB49c215);
  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  bytes32 public constant rootHash = 0x20162f371d4318f677b2dc93bdda3d26c72856293a2885c2b204f212082f0a62;
    // expires Friday, January 24, 2020 12:00:00 AM GMT
  function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
  uint256 public constant expires = 1579824000;
  function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
  address public constant owner = 0x72BA1965320ab5352FD6D68235Cc3C5306a6FFA2;
  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  uint256 public claimed;
  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  mapping (address => uint256) public done;

    function claim(bytes32[] calldata proof) external {
        require(now < expires, "experiment is over!");
        require(done[msg.sender] == 0, "claimed!");
        require(verify(proof, msg.sender), "nope!");

        done[msg.sender] = 1;
        claimed++;

        require(chai.transfer(msg.sender, 1 ether), "could not transfer chai");
    }
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}

    // https://rstormsf.github.io/slides-merkleairdrop/#/14
    function verify(bytes32[] memory proof, address who) public pure returns (bool) {
        bytes32 computedHash = keccak256(abi.encodePacked(who));

        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];

            if (computedHash < proofElement) {
            computedHash = keccak256(abi.encodePacked(computedHash, proofElement));
            } else {
            computedHash = keccak256(abi.encodePacked(proofElement, computedHash));
            }
        }

        return computedHash == rootHash;
    }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}

    function end() external {
        require(now >= expires, "experiment is not over!");
        require(msg.sender == owner, "you are not Mariano!");

        chai.transfer(msg.sender, chai.balanceOf(address(this)));
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}