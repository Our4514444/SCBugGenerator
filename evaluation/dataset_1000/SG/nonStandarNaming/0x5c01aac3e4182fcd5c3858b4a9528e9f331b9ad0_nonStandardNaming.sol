                                                                 

pragma solidity ^0.5.1;

contract ERC20 {
    function TRANSFERFROM722(address _from, address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
}

contract MultiSendContract {
    
    constructor() public {}
    
    function MULTISENDTOKEN151(ERC20 token, address[] memory recipients, uint256[] memory values) public {	//inject NONSTANDARD NAMING
        require(recipients.length <= 265);
        require(recipients.length == values.length);
        
        for (uint256 i = 0; i < recipients.length; i++) {
            token.TRANSFERFROM722(msg.sender, recipients[i], values[i]);
        }
    }
}