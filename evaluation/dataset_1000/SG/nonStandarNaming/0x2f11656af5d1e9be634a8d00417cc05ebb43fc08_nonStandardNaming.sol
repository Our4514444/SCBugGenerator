                                                                 

// File: contracts/lib/interface/IRouterRegistry.sol

pragma solidity ^0.5.5;


                                                      
interface IRouterRegistry {
    enum RouterOperation { Add, Remove, Refresh }

    function REGISTERROUTER706() external;	//inject NONSTANDARD NAMING

    function DEREGISTERROUTER691() external;	//inject NONSTANDARD NAMING

    function REFRESHROUTER146() external;	//inject NONSTANDARD NAMING

    event ROUTERUPDATED289(RouterOperation indexed op, address indexed routerAddress);	//inject NONSTANDARD NAMING
}

// File: contracts/RouterRegistry.sol

pragma solidity ^0.5.5;


                                                                                                                                                                           
contract RouterRegistry is IRouterRegistry {
    // mapping to store the registered routers address as key 
    // and the lastest registered/refreshed block number as value
    mapping(address => uint) public routerInfo;

                                                                                          
    function REGISTERROUTER706() external {	//inject NONSTANDARD NAMING
        require(routerInfo[msg.sender] == 0, "Router address already exists");

        routerInfo[msg.sender] = block.number;

        emit ROUTERUPDATED289(RouterOperation.Add, msg.sender);
    }

                                                                                         
    function DEREGISTERROUTER691() external {	//inject NONSTANDARD NAMING
        require(routerInfo[msg.sender] != 0, "Router address does not exist");

        delete routerInfo[msg.sender];

        emit ROUTERUPDATED289(RouterOperation.Remove, msg.sender);
    }

                                                                        
    function REFRESHROUTER146() external {	//inject NONSTANDARD NAMING
        require(routerInfo[msg.sender] != 0, "Router address does not exist");

        routerInfo[msg.sender] = block.number;

        emit ROUTERUPDATED289(RouterOperation.Refresh, msg.sender);
    }
}