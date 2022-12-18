/**
 *Submitted for verification at Etherscan.io on 2020-04-25
*/

pragma solidity ^0.5.1;

/**
 * @title Mapping contract
 * @dev Add and delete business contract
 */
contract IBMapping {address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

	mapping(string => address) private ContractAddress;						//	Business contract addressfunction bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	mapping (address => bool) owners;										//	Superman address

	/**
    * @dev Initialization method
    */
	constructor () public {
		owners[msg.sender] = true;
	}
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
	
    /**
    * @dev Inquiry address
    * @param name String ID
    * @return contractAddress Contract address
    */
	function checkAddress(string memory name) public view returns (address contractAddress) {
		return ContractAddress[name];
	}
uint256 bugv_tmstmp4 = block.timestamp;
	
    /**
    * @dev Add address
    * @param name String ID
    * @param contractAddress Contract address
    */
	function addContractAddress(string memory name, address contractAddress) public {
		require(checkOwners(msg.sender) == true);
		ContractAddress[name] = contractAddress;
	}
uint256 bugv_tmstmp5 = block.timestamp;
	
	/**
    * @dev Add superman
    * @param superMan Superman address
    */
	function addSuperMan(address superMan) public {
	    require(checkOwners(msg.sender) == true);
	    owners[superMan] = true;
	}
uint256 bugv_tmstmp2 = block.timestamp;
	
	/**
    * @dev Delete superman
    * @param superMan Superman address
    */
	function deleteSuperMan(address superMan) public {
	    require(checkOwners(msg.sender) == true);
	    owners[superMan] = false;
	}
uint256 bugv_tmstmp3 = block.timestamp;
	
	/**
    * @dev Check superman
    * @param man Superman address
    * @return Permission or not
    */
	function checkOwners(address man) public view returns (bool){
	    return owners[man];
	}
uint256 bugv_tmstmp1 = block.timestamp;
}