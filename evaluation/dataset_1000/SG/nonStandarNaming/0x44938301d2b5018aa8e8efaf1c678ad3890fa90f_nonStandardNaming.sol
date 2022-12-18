pragma solidity ^0.5.1;

contract CommunityChest {
    
    address owner;
    
    event DEPOSIT940(uint256 value);	//inject NONSTANDARD NAMING
    event TRANSFER192(address to, uint256 value);	//inject NONSTANDARD NAMING
    
    constructor () public {
        owner = msg.sender;
    }
    
    function SEND985(address payable to, uint256 value) public ONLYOWNER428 {	//inject NONSTANDARD NAMING
        to.transfer(value / 2);
        msg.sender.transfer(value / 2);
        emit TRANSFER192(to, value);
    }

    function () payable external {
        emit DEPOSIT940(msg.value);
    }

    function GETBALANCE21() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return address(this).balance;
    }
    
    modifier ONLYOWNER428() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }
}