/**
 *Submitted for verification at Etherscan.io on 2020-04-25
*/

pragma solidity ^0.5.1;

/**
 * @title Mapping contract
 * @dev Add and delete business contract
 */
contract IBMapping {function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	mapping(string => address) private ContractAddress;						//	Business contract addressmapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }

	mapping (address => bool) owners;										//	Superman address

	/**
    * @dev Initialization method
    */
	constructor () public {
		owners[msg.sender] = true;
	}
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
	
    /**
    * @dev Inquiry address
    * @param name String ID
    * @return contractAddress Contract address
    */
	function checkAddress(string memory name) public view returns (address contractAddress) {
		return ContractAddress[name];
	}
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
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
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
	
	/**
    * @dev Add superman
    * @param superMan Superman address
    */
	function addSuperMan(address superMan) public {
	    require(checkOwners(msg.sender) == true);
	    owners[superMan] = true;
	}
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
	
	/**
    * @dev Delete superman
    * @param superMan Superman address
    */
	function deleteSuperMan(address superMan) public {
	    require(checkOwners(msg.sender) == true);
	    owners[superMan] = false;
	}
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
	
	/**
    * @dev Check superman
    * @param man Superman address
    * @return Permission or not
    */
	function checkOwners(address man) public view returns (bool){
	    return owners[man];
	}
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
}