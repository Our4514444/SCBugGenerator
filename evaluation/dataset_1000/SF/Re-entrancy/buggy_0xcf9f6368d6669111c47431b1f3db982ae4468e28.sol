/**
 *Submitted for verification at Etherscan.io on 2020-10-31
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.5.17;

interface IKeep3rV1 {
    function isKeeper(address) external returns (bool);
    function worked(address keeper) external;
}

interface ISushiswapV2Factory {
    function allPairsLength() external view returns (uint);
    function allPairs(uint) external view returns (address pair);
}

interface ISushiswapV2Pair {
    function token0() external view returns (address);
    function token1() external view returns (address);
    function balanceOf(address account) external view returns (uint);
}

interface ISushiswapV2Maker {
    function convert(address token0, address token1) external;
}

contract SushiswapV2Keep3r {
    
    modifier upkeep() {
        require(KP3R.isKeeper(msg.sender), "SushiswapV2Keep3r::isKeeper: keeper is not registered");
        _;
        KP3R.worked(msg.sender);
    }
    
    IKeep3rV1 public constant KP3R = IKeep3rV1(0x1cEB5cB57C4D4E2b2433641b95Dd330A33185A44);
    ISushiswapV2Factory public constant SV2F = ISushiswapV2Factory(0xC0AEe478e3658e2610c5F7A4A2E1777cE9e4f2Ac);
    ISushiswapV2Maker public constant SV2M = ISushiswapV2Maker(0x6684977bBED67e101BB80Fc07fCcfba655c0a64F);
    
    function count() public view returns (uint) {
        uint _count = 0;
        for (uint i = 0; i < SV2F.allPairsLength(); i++) {
            if (haveBalance(SV2F.allPairs(i))) {
                _count++;
            }
        }
        return _count;
    }
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
    
    function workableAll(uint _count) external view returns (address[] memory) {
        return (workable(_count, 0, SV2F.allPairsLength()));
    }
address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
    
    function workable(uint _count, uint start, uint end) public view returns (address[] memory) {
        address[] memory _workable = new address[](_count);
        uint index = 0;
        for (uint i = start; i < end; i++) {
            if (haveBalance(SV2F.allPairs(i))) {
                _workable[index] = SV2F.allPairs(i);
                index++;
            }
        }
        return _workable;
    }
mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
    
    function haveBalance(address pair) public view returns (bool) {
        return ISushiswapV2Pair(pair).balanceOf(address(SV2M)) > 0;
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
    
    function batch(ISushiswapV2Pair[] calldata pair) external {
        bool _worked = true;
        for (uint i = 0; i < pair.length; i++) {
            if (haveBalance(address(pair[i]))) {
                (bool success, bytes memory message) = address(SV2M).delegatecall(abi.encodeWithSignature("convert(address,address)", pair[i].token0(), pair[i].token1()));
                require(success, string(abi.encodePacked("SushiswapV2Keep3r::convert: failed [", message, "]")));
            } else {
                _worked = false;
            }
        }
        require(_worked, "SushiswapV2Keep3r::batch: job(s) failed");
    }
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
    
    function work(ISushiswapV2Pair pair) external {
        require(haveBalance(address(pair)), "SushiswapV2Keep3r::work: invalid pair");
        (bool success, bytes memory message) = address(SV2M).delegatecall(abi.encodeWithSignature("convert(address,address)", pair.token0(), pair.token1()));
        require(success,  string(abi.encodePacked("SushiswapV2Keep3r::convert: failed [", message, "]")));
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