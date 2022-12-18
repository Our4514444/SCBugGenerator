                                                                 

pragma solidity ^0.5.1;

                                                                           
contract IBMapping {
	mapping(string => address) private ContractAddress;						//	Business contract address
	mapping (address => bool) owners;										//	Superman address

	                                           
	constructor () public {
		owners[msg.sender] = true;
	}
	
                                                                                                                    
	function CHECKADDRESS67(string memory name) public view returns (address contractAddress) {	//inject NONSTANDARD NAMING
		return ContractAddress[name];
	}
	
                                                                                                               
	function ADDCONTRACTADDRESS303(string memory name, address contractAddress) public {	//inject NONSTANDARD NAMING
		require(CHECKOWNERS68(msg.sender) == true);
		ContractAddress[name] = contractAddress;
	}
	
	                                                                         
	function ADDSUPERMAN125(address superMan) public {	//inject NONSTANDARD NAMING
	    require(CHECKOWNERS68(msg.sender) == true);
	    owners[superMan] = true;
	}
	
	                                                                            
	function DELETESUPERMAN299(address superMan) public {	//inject NONSTANDARD NAMING
	    require(CHECKOWNERS68(msg.sender) == true);
	    owners[superMan] = false;
	}
	
	                                                                                                      
	function CHECKOWNERS68(address man) public view returns (bool){	//inject NONSTANDARD NAMING
	    return owners[man];
	}
}