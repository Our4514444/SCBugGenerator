                                                                 

pragma solidity ^0.5.12;

interface IConditionalTokens {
    function REPORTPAYOUTS894(bytes32 questionId, uint256[] calldata payouts) external;	//inject NONSTANDARD NAMING
}

interface IRealitio {
    function GETCONTENTHASH529(bytes32 questionId) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function GETOPENINGTS743(bytes32 questionId) external view returns (uint32);	//inject NONSTANDARD NAMING
    function RESULTFOR952(bytes32 questionId) external view returns (bytes32);	//inject NONSTANDARD NAMING
}

contract RealitioProxy {
  IConditionalTokens public conditionalTokens;
  IRealitio public realitio;
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

  function RESOLVE393(	//inject NONSTANDARD NAMING
    bytes32 questionId,
    uint256 templateId,
    string calldata question,
    uint256 numOutcomes
  ) external {
    // check that the given templateId and question match the questionId
    bytes32 contentHash = keccak256(abi.encodePacked(templateId, realitio.GETOPENINGTS743(questionId), question));
    require(contentHash == realitio.GETCONTENTHASH529(questionId), "Content hash mismatch");

    uint256[] memory payouts;

    if (templateId == 0 || templateId == 2) {
      // binary or single-select
      payouts = GETSINGLESELECTPAYOUTS64(questionId, numOutcomes);
    } else if (templateId == nuancedBinaryTemplateId) {
      payouts = GETNUANCEDBINARYPAYOUTS812(questionId, numOutcomes);
    } else {
      revert("Unknown templateId");
    }

    conditionalTokens.REPORTPAYOUTS894(questionId, payouts);
  }

  function GETSINGLESELECTPAYOUTS64(bytes32 questionId, uint256 numOutcomes) internal view returns (uint256[] memory) {	//inject NONSTANDARD NAMING
    uint256[] memory payouts = new uint256[](numOutcomes);

    uint256 answer = uint256(realitio.RESULTFOR952(questionId));

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

  function GETNUANCEDBINARYPAYOUTS812(bytes32 questionId, uint256 numOutcomes) internal view returns (uint256[] memory) {	//inject NONSTANDARD NAMING
    require(numOutcomes == 2, "Number of outcomes expected to be 2");
    uint256[] memory payouts = new uint256[](2);

    uint256 answer = uint256(realitio.RESULTFOR952(questionId));

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
}