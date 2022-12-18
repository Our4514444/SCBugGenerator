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
  mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }
  bytes32 public constant rootHash = 0x20162f371d4318f677b2dc93bdda3d26c72856293a2885c2b204f212082f0a62;
    // expires Friday, January 24, 2020 12:00:00 AM GMT
  uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
  uint256 public constant expires = 1579824000;
  mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
  address public constant owner = 0x72BA1965320ab5352FD6D68235Cc3C5306a6FFA2;
  address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
  uint256 public claimed;
  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
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
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
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
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }

    function end() external {
        require(now >= expires, "experiment is not over!");
        require(msg.sender == owner, "you are not Mariano!");

        chai.transfer(msg.sender, chai.balanceOf(address(this)));
    }
bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
}