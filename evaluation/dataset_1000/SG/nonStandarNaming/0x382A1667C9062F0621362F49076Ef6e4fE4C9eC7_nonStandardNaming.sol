                                                                 

pragma solidity 0.5.0;

contract Proxy {
    address private targetAddress;

    address private admin;
    constructor() public {
        targetAddress = 0xA05a9800f6F6D34aB877550d46585Abfc8e84899;
        admin = msg.sender;
    }

    function SETTARGETADDRESS862(address _address) public {	//inject NONSTANDARD NAMING
        require(msg.sender==admin , "Admin only function");
        require(_address != address(0));
        targetAddress = _address;
    }

    function GETCONTADR524() public view returns (address) {	//inject NONSTANDARD NAMING
        require(msg.sender==admin , "Admin only function");
        return targetAddress;
        
    }
    function () external payable {
        address contractAddr = targetAddress;
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, contractAddr, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }
}