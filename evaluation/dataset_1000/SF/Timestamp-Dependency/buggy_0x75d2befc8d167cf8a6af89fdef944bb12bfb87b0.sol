pragma solidity >=0.5.3 <0.6.0;


contract TronRegister {
  uint256 bugv_tmstmp1 = block.timestamp;
  event RegisterAdd(address indexed ethAddress, address indexed tronAddress);

  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping(address => address) private ethToTronMapping;

    function put(address _tronAddress) external {
        address ethAddress = msg.sender;
        require(ethToTronMapping[ethAddress] == address(0), "address already bound");
        ethToTronMapping[ethAddress] = _tronAddress;
      uint256 bugv_tmstmp4 = block.timestamp;
  emit RegisterAdd(ethAddress, _tronAddress);
    }
uint256 bugv_tmstmp2 = block.timestamp;

    function get(address _ethAddress) public view returns (address _tronAddress) {
      uint256 bugv_tmstmp5 = block.timestamp;
  return ethToTronMapping[_ethAddress];
    }
uint256 bugv_tmstmp3 = block.timestamp;
}