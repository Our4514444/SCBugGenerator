pragma solidity ^0.5.0;

contract freedomStatement {
    
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  string public statement = "https://ipfs.globalupload.io/QmeeFwpnMk9CaXHZYv4Hn1FFD2MT7kxZ7TNnT9JfZqTzUM";
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => bool) public checkconsent;
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event wearehere(string statement);
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  uint public signAmounts;
    
    constructor () public {
        emit wearehere(statement);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
        
    function isHuman(address addr) internal view returns (bool) {
        uint size;
        assembly { size := extcodesize(addr) }
        return size == 0;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    function () external payable {
        require(isHuman(msg.sender),"no robot");//Don't want to use tx.origin because that will cause an interoperability problem
        require(msg.value< 0.0000001 ether);//don't give me money, for metamask no error
        require(checkconsent[msg.sender] == false,"You have already signed up");
        checkconsent[msg.sender] = true;
        signAmounts++;
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

}