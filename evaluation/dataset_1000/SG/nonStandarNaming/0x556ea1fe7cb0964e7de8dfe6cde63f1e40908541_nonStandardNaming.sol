pragma solidity 0.5.8;


                                                                                     
contract Proxy {
    
                                                                                                                                                                              
    function IMPLEMENTATION710() public view returns (address);	//inject NONSTANDARD NAMING

                                                                                                                                                                                     
    function() external payable {
        address _impl = IMPLEMENTATION710();
        require(_impl != address(0), "Proxy: implementation contract not set");
        
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, _impl, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }
}


                                                                                                                                                          
contract UpgradeabilityProxy is Proxy {

    // Event, it will be emitted every time the implementation gets upgraded.
    event UPGRADED232(address indexed currentImplementation, address indexed newImplementation);	//inject NONSTANDARD NAMING

    // Storage position of the address of the current implementation
    bytes32 private constant implementationposition602 = keccak256("DUSD.proxy.implementation");	//inject NONSTANDARD NAMING

                                                               
    function IMPLEMENTATION710() public view returns (address impl) {	//inject NONSTANDARD NAMING
        bytes32 position = implementationposition602;
        assembly {
          impl := sload(position)
        }
    }

                                                                                                                                                              
    function _SETIMPLEMENTATION829(address newImplementation) internal {	//inject NONSTANDARD NAMING
        bytes32 position = implementationposition602;
        assembly {
          sstore(position, newImplementation)
        }
    }

                                                                                                                                                          
    function _UPGRADETO721(address newImplementation) internal {	//inject NONSTANDARD NAMING
        address currentImplementation = IMPLEMENTATION710();
        require(currentImplementation != newImplementation, "UpgradeabilityProxy: newImplementation is the same as currentImplementation");
        emit UPGRADED232(currentImplementation, newImplementation);
        _SETIMPLEMENTATION829(newImplementation);
    }
}


                                                                                                                                   
contract DUSDProxy is UpgradeabilityProxy {

    // Event to show ownership has been transferred.
    event PROXYOWNERSHIPTRANSFERRED290(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    // Event to show ownership transfer is pending.
    event NEWPENDINGOWNER631(address currentOwner, address pendingOwner);	//inject NONSTANDARD NAMING
    
    // Storage position of the owner and pendingOwner of the contract.
    bytes32 private constant proxyownerposition199 = keccak256("DUSD.proxy.owner");	//inject NONSTANDARD NAMING
    bytes32 private constant pendingproxyownerposition233 = keccak256("DUSD.pending.proxy.owner");	//inject NONSTANDARD NAMING

                                                                                                        
    constructor() public {
        _SETUPGRADEABILITYOWNER856(0xfe30e619cc2915C905Ca45C1BA8311109A3cBdB1);
    }

                                                                                    
    modifier ONLYPROXYOWNER710() {	//inject NONSTANDARD NAMING
        require(msg.sender == PROXYOWNER909(), "DUSDProxy: the caller must be the proxy Owner");
        _;
    }

                                                                                      
    modifier ONLYPENDINGPROXYOWNER633() {	//inject NONSTANDARD NAMING
        require(msg.sender == PENDINGPROXYOWNER915(), "DUSDProxy: the caller must be the pending proxy Owner");
        _;
    }

                                                                                                              
    function PROXYOWNER909() public view returns (address owner) {	//inject NONSTANDARD NAMING
        bytes32 position = proxyownerposition199;
        assembly {
            owner := sload(position)
        }
    }

                                                                                                                              
    function PENDINGPROXYOWNER915() public view returns (address pendingOwner) {	//inject NONSTANDARD NAMING
        bytes32 position = pendingproxyownerposition233;
        assembly {
            pendingOwner := sload(position)
        }
    }

                                                             
    function _SETUPGRADEABILITYOWNER856(address newProxyOwner) internal {	//inject NONSTANDARD NAMING
        bytes32 position = proxyownerposition199;
        assembly {
            sstore(position, newProxyOwner)
        }
    }

                                                                     
    function _SETPENDINGUPGRADEABILITYOWNER306(address newPendingProxyOwner) internal {	//inject NONSTANDARD NAMING
        bytes32 position = pendingproxyownerposition233;
        assembly {
            sstore(position, newPendingProxyOwner)
        }
    }

                                                                                                                    
    function TRANSFERPROXYOWNERSHIP318(address newOwner) external ONLYPROXYOWNER710 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "DUSDProxy: cannot transfer control of the proxy owner to the zero address");
        _SETPENDINGUPGRADEABILITYOWNER306(newOwner);
        emit NEWPENDINGOWNER631(PROXYOWNER909(), newOwner);
    }

                                                                                 
    function CLAIMPROXYOWNERSHIP303() external ONLYPENDINGPROXYOWNER633 {	//inject NONSTANDARD NAMING
        emit PROXYOWNERSHIPTRANSFERRED290(PROXYOWNER909(), PENDINGPROXYOWNER915());
        _SETUPGRADEABILITYOWNER856(PENDINGPROXYOWNER915());
        _SETPENDINGUPGRADEABILITYOWNER306(address(0));
    }

                                                                                                                                                                                      
    function UPGRADETO391(address implementation) external ONLYPROXYOWNER710 {	//inject NONSTANDARD NAMING
        _UPGRADETO721(implementation);
    }
}