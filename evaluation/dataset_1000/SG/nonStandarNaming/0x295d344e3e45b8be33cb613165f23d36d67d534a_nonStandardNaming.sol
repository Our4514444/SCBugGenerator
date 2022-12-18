pragma solidity ^0.5.0;
contract ClothesStores{
	
	mapping (uint => address) Indicador;
	
	struct Person{
		string name;
		string nick;
		string email;
	}
    
	Person[] private personProperties;
	
	event CREATEDPERSON584(string name,string nick,string email);	//inject NONSTANDARD NAMING
	
	function CREATEPERSON868(string memory _name, string memory _nick, string memory _email) public {	//inject NONSTANDARD NAMING
	   uint identificador = personProperties.push(Person(_name,_nick,_email))-1;
	    Indicador[identificador]=msg.sender;
	    emit CREATEDPERSON584(_name,_nick,_email);
	}
	
	function GETPERSONPROPERTIES644(uint _identificador) external view returns(string memory, string memory, string memory)  {	//inject NONSTANDARD NAMING
	    
	    //require(Indicador[_identificador]==msg.sender);
	    
	    Person memory People = personProperties[_identificador];
	    
	    return (People.name,People.nick,People.email);
	}
}