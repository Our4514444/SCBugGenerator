pragma solidity >=0.5.3 <0.6.0;


contract TronRegister {
    event RegisterAdd(address indexed ethAddress, address indexed tronAddress);

    mapping(address => address) private ethToTronMapping;

    function put(address _tronAddress) external {
        address ethAddress = msg.sender;
        require(ethToTronMapping[ethAddress] == address(0), "address already bound");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ethToTronMapping[ethAddress] = _tronAddress;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit RegisterAdd(ethAddress, _tronAddress);
    }

    function get(address _ethAddress) public view returns (address _tronAddress) {
        return ethToTronMapping[_ethAddress];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}