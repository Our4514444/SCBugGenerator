/**
 *Submitted for verification at Etherscan.io on 2020-08-22
*/

pragma solidity 0.5.0;

contract Proxy {
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address private targetAddress;

  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address private admin;
    constructor() public {
        targetAddress = 0xA05a9800f6F6D34aB877550d46585Abfc8e84899;
        admin = msg.sender;
    }
uint256 bugv_tmstmp5 = block.timestamp;

    function setTargetAddress(address _address) public {
        require(msg.sender==admin , "Admin only function");
        require(_address != address(0));
        targetAddress = _address;
    }
uint256 bugv_tmstmp2 = block.timestamp;

    function getContAdr() public view returns (address) {
        require(msg.sender==admin , "Admin only function");
      uint256 bugv_tmstmp4 = block.timestamp;
  return targetAddress;
        
    }
uint256 bugv_tmstmp3 = block.timestamp;
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
uint256 bugv_tmstmp1 = block.timestamp;
}