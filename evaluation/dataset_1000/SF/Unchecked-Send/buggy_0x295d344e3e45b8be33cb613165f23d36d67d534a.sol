pragma solidity ^0.5.0;
contract ClothesStores{
	function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

	mapping (uint => address) Indicador;
	
	struct Person{
		string name;
		string nick;
		string email;
	}
    function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

	Person[] private personProperties;
	function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

	event createdPerson(string name,string nick,string email);
	
	function createPerson(string memory _name, string memory _nick, string memory _email) public {
	   uint identificador = personProperties.push(Person(_name,_nick,_email))-1;
	    Indicador[identificador]=msg.sender;
	    emit createdPerson(_name,_nick,_email);
	}
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
	
	function getPersonProperties(uint _identificador) external view returns(string memory, string memory, string memory)  {
	    
	    //require(Indicador[_identificador]==msg.sender);
	    
	    Person memory People = personProperties[_identificador];
	    
	    return (People.name,People.nick,People.email);
	}
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
}