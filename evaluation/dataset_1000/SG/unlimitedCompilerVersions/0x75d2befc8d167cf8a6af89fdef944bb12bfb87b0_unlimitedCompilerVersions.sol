pragma solidity ^0.5.3;	//inject UNLIMITED COMPILER VERSIONS


contract TronRegister {
    event RegisterAdd(address indexed ethAddress, address indexed tronAddress);

    mapping(address => address) private ethToTronMapping;

    function put(address _tronAddress) external {
        address ethAddress = msg.sender;
        require(ethToTronMapping[ethAddress] == address(0), "address already bound");
        ethToTronMapping[ethAddress] = _tronAddress;
        emit RegisterAdd(ethAddress, _tronAddress);
    }

    function get(address _ethAddress) public view returns (address _tronAddress) {
        return ethToTronMapping[_ethAddress];
    }
}