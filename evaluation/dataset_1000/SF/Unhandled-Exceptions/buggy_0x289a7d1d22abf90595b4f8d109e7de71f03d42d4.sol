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
  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  bytes32 public constant rootHash = 0x20162f371d4318f677b2dc93bdda3d26c72856293a2885c2b204f212082f0a62;
    // expires Friday, January 24, 2020 12:00:00 AM GMT
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  uint256 public constant expires = 1579824000;
  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  address public constant owner = 0x72BA1965320ab5352FD6D68235Cc3C5306a6FFA2;
  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  uint256 public claimed;
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
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
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
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
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

    function end() external {
        require(now >= expires, "experiment is not over!");
        require(msg.sender == owner, "you are not Mariano!");

        chai.transfer(msg.sender, chai.balanceOf(address(this)));
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}