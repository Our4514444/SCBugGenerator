/**
 *Submitted for verification at Etherscan.io on 2020-04-25
*/

pragma solidity ^0.5.1;

/**
 * @title Mapping contract
 * @dev Add and delete business contract
 */
contract IBMapping {bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

	mapping(string => address) private ContractAddress;						//	Business contract addressfunction bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

	mapping (address => bool) owners;										//	Superman address

	/**
    * @dev Initialization method
    */
	constructor () public {
		owners[msg.sender] = true;
	}
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
	
    /**
    * @dev Inquiry address
    * @param name String ID
    * @return contractAddress Contract address
    */
	function checkAddress(string memory name) public view returns (address contractAddress) {
		return ContractAddress[name];
	}
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
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
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
	
	/**
    * @dev Add superman
    * @param superMan Superman address
    */
	function addSuperMan(address superMan) public {
	    require(checkOwners(msg.sender) == true);
	    owners[superMan] = true;
	}
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
	
	/**
    * @dev Delete superman
    * @param superMan Superman address
    */
	function deleteSuperMan(address superMan) public {
	    require(checkOwners(msg.sender) == true);
	    owners[superMan] = false;
	}
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
	
	/**
    * @dev Check superman
    * @param man Superman address
    * @return Permission or not
    */
	function checkOwners(address man) public view returns (bool){
	    return owners[man];
	}
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}