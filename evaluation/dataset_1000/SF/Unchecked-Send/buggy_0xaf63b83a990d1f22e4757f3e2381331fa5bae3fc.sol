pragma solidity ^0.5.3;

contract TokenERC20 {
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public balanceOf;
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}
contract multiSend{
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  address public baseAddr = 0x500Df47E1dF0ef06039218dCF0960253D89D6658;
	TokenERC20 bcontract = TokenERC20(baseAddr);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event cannotAirdrop(address indexed addr, uint balance, uint etherBalance);
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  uint public distributedAmount = 2001200;

    function() external payable { 
        revert();
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
    
    function sendOutToken(address[] memory addrs) public {
        for(uint i=0;i<addrs.length;i++){
            if(addrs[i] == address(0)) continue;
            if(bcontract.balanceOf(addrs[i]) >0 || addrs[i].balance < 1 finney){ 
                emit cannotAirdrop(addrs[i],bcontract.balanceOf(addrs[i]),addrs[i].balance);
            }else{
                bcontract.transferFrom(msg.sender,addrs[i], 100 * (10 ** uint256(18)));
                distributedAmount += 100;
            } 
        }
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
}