/**
 *Submitted for verification at Etherscan.io on 2020-07-20
*/

pragma solidity ^0.5.1;

contract ERC20 {
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}

contract MultiSendContract {
    
    constructor() public {}
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
    
    function multiSendToken(ERC20 token, address[] memory recipients, uint256[] memory values) public {
        require(recipients.length <= 265);
        require(recipients.length == values.length);
        
        for (uint256 i = 0; i < recipients.length; i++) {
            token.transferFrom(msg.sender, recipients[i], values[i]);
        }
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}