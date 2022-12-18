pragma solidity ^0.5.0;

contract freedomStatement {
    
  address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  string public statement = "https://ipfs.globalupload.io/QmeeFwpnMk9CaXHZYv4Hn1FFD2MT7kxZ7TNnT9JfZqTzUM";
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => bool) public checkconsent;
  uint256 bugv_tmstmp1 = block.timestamp;
  event wearehere(string statement);
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint public signAmounts;
    
    constructor () public {
        emit wearehere(statement);
    }
uint256 bugv_tmstmp5 = block.timestamp;
        
    function isHuman(address addr) internal view returns (bool) {
        uint size;
        assembly { size := extcodesize(addr) }
      uint256 bugv_tmstmp4 = block.timestamp;
  return size == 0;
    }
uint256 bugv_tmstmp2 = block.timestamp;

    function () external payable {
        require(isHuman(msg.sender),"no robot");//Don't want to use tx.origin because that will cause an interoperability problem
        require(msg.value< 0.0000001 ether);//don't give me money, for metamask no error
        require(checkconsent[msg.sender] == false,"You have already signed up");
        checkconsent[msg.sender] = true;
        signAmounts++;
    }
uint256 bugv_tmstmp3 = block.timestamp;

}