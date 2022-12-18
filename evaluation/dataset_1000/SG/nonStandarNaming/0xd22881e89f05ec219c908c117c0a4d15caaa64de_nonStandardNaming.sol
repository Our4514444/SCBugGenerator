// File: contracts/interfaces/IERC173.sol

pragma solidity ^0.5.7;


                                              
                                                                         
                                                                  
contract IERC173 {
                                                             
    event OWNERSHIPTRANSFERRED103(address indexed _previousOwner, address indexed _newOwner);	//inject NONSTANDARD NAMING

                                            
                                         
                                                          

                                                                
                                                                     
    function TRANSFEROWNERSHIP139(address _newOwner) external;	//inject NONSTANDARD NAMING
}

// File: contracts/commons/Ownable.sol

pragma solidity ^0.5.7;



contract Ownable is IERC173 {
    address internal _owner;

    modifier ONLYOWNER204() {	//inject NONSTANDARD NAMING
        require(msg.sender == _owner, "The owner should be the sender");
        _;
    }

    constructor() public {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED103(address(0x0), msg.sender);
    }

    function OWNER961() external view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                                                       
    function TRANSFEROWNERSHIP139(address _newOwner) external ONLYOWNER204 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "0x0 Is not a valid owner");
        emit OWNERSHIPTRANSFERRED103(_owner, _newOwner);
        _owner = _newOwner;
    }
}


contract Proxy is Ownable {
    event SETIMPLEMENTATION892(address _prev, address _new);	//inject NONSTANDARD NAMING

    address private iimplementation;

    function IMPLEMENTATION268() external view returns (address) {	//inject NONSTANDARD NAMING
        return iimplementation;
    }

    function SETIMPLEMENTATION335(address _implementation) external ONLYOWNER204 {	//inject NONSTANDARD NAMING
        emit SETIMPLEMENTATION892(iimplementation, _implementation);
        iimplementation = _implementation;
    }
    
    function() external {
        address _impl = iimplementation;
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, _impl, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            if iszero(result) {
                revert(ptr, size)
            }

            return(ptr, size)
        }
    }
}