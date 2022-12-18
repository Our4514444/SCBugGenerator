/**
 *Submitted for verification at Etherscan.io on 2020-09-08
*/

pragma solidity 0.5.17;

interface IToken {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract DropToken { // transfer msg.sender token to recipients per approved drop amount w/ msg.
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event DropTKN(bytes32 indexed message);
    
    function dropTKN(address[] calldata recipients, address tokenAddress, uint256 amount, bytes32 message) external {
        IToken token = IToken(tokenAddress);
        uint256 amounts = amount / recipients.length;
        for (uint256 i = 0; i < recipients.length; i++) {
	    token.transferFrom(msg.sender, recipients[i], amounts);}
	    emit DropTKN(message);
    }
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
}