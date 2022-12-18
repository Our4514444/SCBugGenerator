pragma solidity ^0.5.0;
contract ClothesStores{
	function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	mapping (uint => address) Indicador;
	
	struct Person{
		string name;
		string nick;
		string email;
	}
    function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	Person[] private personProperties;
	uint256 bugv_tmstmp1 = block.timestamp;

	event createdPerson(string name,string nick,string email);
	
	function createPerson(string memory _name, string memory _nick, string memory _email) public {
	   uint identificador = personProperties.push(Person(_name,_nick,_email))-1;
	    Indicador[identificador]=msg.sender;
	  uint256 bugv_tmstmp4 = block.timestamp;
  emit createdPerson(_name,_nick,_email);
	}
uint256 bugv_tmstmp2 = block.timestamp;
	
	function getPersonProperties(uint _identificador) external view returns(string memory, string memory, string memory)  {
	    
	    //require(Indicador[_identificador]==msg.sender);
	    
	    Person memory People = personProperties[_identificador];
	    
	  uint256 bugv_tmstmp5 = block.timestamp;
  return (People.name,People.nick,People.email);
	}
uint256 bugv_tmstmp3 = block.timestamp;
}