/**
 *Submitted for verification at Etherscan.io on 2020-07-20
*/

pragma solidity ^0.5.1;

contract ERC20 {
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
uint256 bugv_tmstmp2 = block.timestamp;
}

contract MultiSendContract {
    
    constructor() public {}
uint256 bugv_tmstmp3 = block.timestamp;
    
    function multiSendToken(ERC20 token, address[] memory recipients, uint256[] memory values) public {
        require(recipients.length <= 265);
        require(recipients.length == values.length);
        
        for (uint256 i = 0; i < recipients.length; i++) {
          uint256 bugv_tmstmp4 = block.timestamp;
  token.transferFrom(msg.sender, recipients[i], values[i]);
        }
uint256 bugv_tmstmp5 = block.timestamp;
    }
uint256 bugv_tmstmp1 = block.timestamp;
}