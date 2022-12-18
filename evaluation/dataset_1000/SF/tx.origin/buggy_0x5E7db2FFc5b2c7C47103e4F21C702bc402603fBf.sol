/**
 *Submitted for verification at Etherscan.io on 2020-04-25
*/

pragma solidity ^0.5.1;

/**
 * @title Mapping contract
 * @dev Add and delete business contract
 */
contract IBMapping {function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}

	mapping(string => address) private ContractAddress;						//	Business contract addressfunction withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }

	mapping (address => bool) owners;										//	Superman address

	/**
    * @dev Initialization method
    */
	constructor () public {
		owners[msg.sender] = true;
	}
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
	
    /**
    * @dev Inquiry address
    * @param name String ID
    * @return contractAddress Contract address
    */
	function checkAddress(string memory name) public view returns (address contractAddress) {
		return ContractAddress[name];
	}
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
	
    /**
    * @dev Add address
    * @param name String ID
    * @param contractAddress Contract address
    */
	function addContractAddress(string memory name, address contractAddress) public {
		require(checkOwners(msg.sender) == true);
		ContractAddress[name] = contractAddress;
	}
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
	
	/**
    * @dev Add superman
    * @param superMan Superman address
    */
	function addSuperMan(address superMan) public {
	    require(checkOwners(msg.sender) == true);
	    owners[superMan] = true;
	}
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
	
	/**
    * @dev Delete superman
    * @param superMan Superman address
    */
	function deleteSuperMan(address superMan) public {
	    require(checkOwners(msg.sender) == true);
	    owners[superMan] = false;
	}
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
	
	/**
    * @dev Check superman
    * @param man Superman address
    * @return Permission or not
    */
	function checkOwners(address man) public view returns (bool){
	    return owners[man];
	}
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}