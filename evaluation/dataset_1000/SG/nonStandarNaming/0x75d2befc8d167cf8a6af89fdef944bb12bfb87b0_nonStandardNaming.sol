pragma solidity >=0.5.3 <0.6.0;


contract TronRegister {
    event REGISTERADD316(address indexed ethAddress, address indexed tronAddress);	//inject NONSTANDARD NAMING

    mapping(address => address) private ethToTronMapping;

    function PUT967(address _tronAddress) external {	//inject NONSTANDARD NAMING
        address ethAddress = msg.sender;
        require(ethToTronMapping[ethAddress] == address(0), "address already bound");
        ethToTronMapping[ethAddress] = _tronAddress;
        emit REGISTERADD316(ethAddress, _tronAddress);
    }

    function GET257(address _ethAddress) public view returns (address _tronAddress) {	//inject NONSTANDARD NAMING
        return ethToTronMapping[_ethAddress];
    }
}