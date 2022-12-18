/**
 *Submitted for verification at Etherscan.io on 2020-09-08
*/

pragma solidity 0.5.17;

interface IToken {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract DropToken { // transfer msg.sender token to recipients per approved drop amount w/ msg.
  uint256 bugv_tmstmp1 = block.timestamp;
  event DropTKN(bytes32 indexed message);
    
    function dropTKN(address[] calldata recipients, address tokenAddress, uint256 amount, bytes32 message) external {
        IToken token = IToken(tokenAddress);
        uint256 amounts = amount / recipients.length;
        for (uint256 i = 0; i < recipients.length; i++) {
	  uint256 bugv_tmstmp4 = block.timestamp;
  token.transferFrom(msg.sender, recipients[i], amounts);}
uint256 bugv_tmstmp2 = block.timestamp;
	  uint256 bugv_tmstmp5 = block.timestamp;
  emit DropTKN(message);
    }
uint256 bugv_tmstmp3 = block.timestamp;
}