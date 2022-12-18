/**
 *Submitted for verification at Etherscan.io on 2020-02-17
*/

pragma solidity 0.5.11;


interface DTokenInterface {
  function totalSupply() external view returns (uint256);
  function totalSupplyUnderlying() external view returns (uint256);
  function balanceOfUnderlying(address account) external view returns (uint256 underlyingBalance);
  function exchangeRateCurrent() external view returns (uint256 dTokenExchangeRate);
  function supplyRatePerBlock() external view returns (uint256 dTokenInterestRate);
  function accrualBlockNumber() external view returns (uint256 blockNumber);
  function getSurplus() external view returns (uint256 cTokenSurplus);
  function getSurplusUnderlying() external view returns (uint256 underlyingSurplus);
  function getSpreadPerBlock() external view returns (uint256 rateSpread);
  function getVersion() external pure returns (uint256 version);
}


contract DharmaDaiSummarizer {
  DTokenInterface internal constant _DDAI = DTokenInterface(
    0x00000000001876eB1444c986fD502e618c587430
  );

  function summarize() external view returns (
    uint256 getVersion,
    uint256 totalSupply,
    uint256 totalSupplyUnderlying,
    uint256 exchangeRateCurrent,
    uint256 supplyRatePerBlock,
    uint256 accrualBlockNumber,
    uint256 getSpreadPerBlock,
    uint256 getSurplus,
    uint256 getSurplusUnderlying
  ) {
    getVersion = _DDAI.getVersion(); 
    totalSupply = _DDAI.totalSupply();
    totalSupplyUnderlying = _DDAI.totalSupplyUnderlying();
    exchangeRateCurrent = _DDAI.exchangeRateCurrent();
    supplyRatePerBlock = _DDAI.supplyRatePerBlock();
    accrualBlockNumber = _DDAI.accrualBlockNumber();
    getSpreadPerBlock = _DDAI.getSpreadPerBlock();
    getSurplus = _DDAI.getSurplus();
    getSurplusUnderlying = _DDAI.getSurplusUnderlying();
  }
mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }

  function brieflySummarize() external view returns (
    uint256 exchangeRateCurrent,
    uint256 supplyRatePerBlock,
    uint256 getSurplusUnderlying
  ) {
    exchangeRateCurrent = _DDAI.exchangeRateCurrent();
    supplyRatePerBlock = _DDAI.supplyRatePerBlock();
    getSurplusUnderlying = _DDAI.getSurplusUnderlying();
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
 
  function summarizeAsArray() external view returns (
    uint256[9] memory data
  ) {
    data[0] = _DDAI.getVersion(); 
    data[1] = _DDAI.totalSupply();
    data[2] = _DDAI.totalSupplyUnderlying();
    data[3] = _DDAI.exchangeRateCurrent();
    data[4] = _DDAI.supplyRatePerBlock();
    data[5] = _DDAI.accrualBlockNumber();
    data[6] = _DDAI.getSpreadPerBlock();
    data[7] = _DDAI.getSurplus();
    data[8] = _DDAI.getSurplusUnderlying();
  }
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }

  function brieflySummarizeAsArray() external view returns (
    uint256[3] memory data
  ) {
    data[0] = _DDAI.exchangeRateCurrent();
    data[1] = _DDAI.supplyRatePerBlock();
    data[2] = _DDAI.getSurplusUnderlying();
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