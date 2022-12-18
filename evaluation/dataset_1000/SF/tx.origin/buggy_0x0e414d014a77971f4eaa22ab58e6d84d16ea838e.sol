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
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
  IConditionalTokens public conditionalTokens;
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
  IRealitio public realitio;
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
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
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
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
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
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
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}

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
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}