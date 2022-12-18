/**
 *Submitted for verification at Etherscan.io on 2020-07-20
*/

pragma solidity ^0.5.1;

contract ERC20 {
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
}

contract MultiSendContract {
    
    constructor() public {}
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
    
    function multiSendToken(ERC20 token, address[] memory recipients, uint256[] memory values) public {
        require(recipients.length <= 265);
        require(recipients.length == values.length);
        
        for (uint256 i = 0; i < recipients.length; i++) {
            token.transferFrom(msg.sender, recipients[i], values[i]);
        }
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}