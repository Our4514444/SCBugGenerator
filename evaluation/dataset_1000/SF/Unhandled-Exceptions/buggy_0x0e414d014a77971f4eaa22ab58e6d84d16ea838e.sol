/**
 *Submitted for verification at Etherscan.io on 2020-03-26
*/

pragma solidity ^0.5.12;

interface IConditionalTokens {
    function reportPayouts(bytes32 questionId, uint256[] calldata payouts) external;
}

interface IRealitio {
    function getContentHash(bytes32 questionId) external view returns (bytes32);
    function getOpeningTS(bytes32 questionId) external view returns (uint32);
    function resultFor(bytes32 questionId) external view returns (bytes32);
}

contract RealitioProxy {
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  IConditionalTokens public conditionalTokens;
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  IRealitio public realitio;
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  uint256 public nuancedBinaryTemplateId;

  constructor(
    IConditionalTokens _conditionalTokens,
    IRealitio _realitio,
    uint256 _nuancedBinaryTemplateId
  ) public {
    conditionalTokens = _conditionalTokens;
    realitio = _realitio;
    nuancedBinaryTemplateId = _nuancedBinaryTemplateId;
  }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

  function resolve(
    bytes32 questionId,
    uint256 templateId,
    string calldata question,
    uint256 numOutcomes
  ) external {
    // check that the given templateId and question match the questionId
    bytes32 contentHash = keccak256(abi.encodePacked(templateId, realitio.getOpeningTS(questionId), question));
    require(contentHash == realitio.getContentHash(questionId), "Content hash mismatch");

    uint256[] memory payouts;

    if (templateId == 0 || templateId == 2) {
      // binary or single-select
      payouts = getSingleSelectPayouts(questionId, numOutcomes);
    } else if (templateId == nuancedBinaryTemplateId) {
      payouts = getNuancedBinaryPayouts(questionId, numOutcomes);
    } else {
      revert("Unknown templateId");
    }

    conditionalTokens.reportPayouts(questionId, payouts);
  }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

  function getSingleSelectPayouts(bytes32 questionId, uint256 numOutcomes) internal view returns (uint256[] memory) {
    uint256[] memory payouts = new uint256[](numOutcomes);

    uint256 answer = uint256(realitio.resultFor(questionId));

    if (answer == uint256(-1)) {
      for (uint256 i = 0; i < numOutcomes; i++) {
        payouts[i] = 1;
      }
    } else {
      require(answer < numOutcomes, "Answer must be between 0 and numOutcomes");
      payouts[answer] = 1;
    }

    return payouts;
  }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

  function getNuancedBinaryPayouts(bytes32 questionId, uint256 numOutcomes) internal view returns (uint256[] memory) {
    require(numOutcomes == 2, "Number of outcomes expected to be 2");
    uint256[] memory payouts = new uint256[](2);

    uint256 answer = uint256(realitio.resultFor(questionId));

    if (answer == uint256(-1)) {
      payouts[0] = 1;
      payouts[1] = 1;
    } else {
      require(answer < 5, "Answer must be between 0 and 4");
      payouts[0] = 4 - answer;
      payouts[1] = answer;
    }

    return payouts;
  }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}