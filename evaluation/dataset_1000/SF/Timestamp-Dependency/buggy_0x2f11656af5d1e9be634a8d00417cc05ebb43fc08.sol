/**
 *Submitted for verification at Etherscan.io on 2020-10-27
*/

// File: contracts/lib/interface/IRouterRegistry.sol

pragma solidity ^0.5.5;


/**
 * @title RouterRegistry interface for routing
 */
interface IRouterRegistry {
    enum RouterOperation { Add, Remove, Refresh }

    function registerRouter() external;

    function deregisterRouter() external;

    function refreshRouter() external;

    event RouterUpdated(RouterOperation indexed op, address indexed routerAddress);
}

// File: contracts/RouterRegistry.sol

pragma solidity ^0.5.5;


/**
 * @title Router Registry contract for external routers to join the Celer Network
 * @notice Implementation of a global registry to enable external routers to join
 */
contract RouterRegistry is IRouterRegistry {
    // mapping to store the registered routers address as key 
    // and the lastest registered/refreshed block number as value
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping(address => uint) public routerInfo;

    /**
     * @notice An external router could register to join the Celer Network
     */
    function registerRouter() external {
        require(routerInfo[msg.sender] == 0, "Router address already exists");

        routerInfo[msg.sender] = block.number;

        emit RouterUpdated(RouterOperation.Add, msg.sender);
    }
uint256 bugv_tmstmp2 = block.timestamp;

    /**
     * @notice An in-network router could deregister to leave the network
     */
    function deregisterRouter() external {
        require(routerInfo[msg.sender] != 0, "Router address does not exist");

        delete routerInfo[msg.sender];

      uint256 bugv_tmstmp4 = block.timestamp;
  emit RouterUpdated(RouterOperation.Remove, msg.sender);
    }
uint256 bugv_tmstmp3 = block.timestamp;

    /**
     * @notice Refresh the existed router's block number
     */
    function refreshRouter() external {
        require(routerInfo[msg.sender] != 0, "Router address does not exist");

        routerInfo[msg.sender] = block.number;

      uint256 bugv_tmstmp5 = block.timestamp;
  emit RouterUpdated(RouterOperation.Refresh, msg.sender);
    }
uint256 bugv_tmstmp1 = block.timestamp;
}