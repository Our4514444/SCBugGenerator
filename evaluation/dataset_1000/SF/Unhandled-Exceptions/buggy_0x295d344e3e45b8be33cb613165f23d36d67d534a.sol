pragma solidity ^0.5.0;
contract ClothesStores{
	function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

	mapping (uint => address) Indicador;
	
	struct Person{
		string name;
		string nick;
		string email;
	}
    function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

	Person[] private personProperties;
	function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}

	event createdPerson(string name,string nick,string email);
	
	function createPerson(string memory _name, string memory _nick, string memory _email) public {
	   uint identificador = personProperties.push(Person(_name,_nick,_email))-1;
	    Indicador[identificador]=msg.sender;
	    emit createdPerson(_name,_nick,_email);
	}
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
	
	function getPersonProperties(uint _identificador) external view returns(string memory, string memory, string memory)  {
	    
	    //require(Indicador[_identificador]==msg.sender);
	    
	    Person memory People = personProperties[_identificador];
	    
	    return (People.name,People.nick,People.email);
	}
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
}