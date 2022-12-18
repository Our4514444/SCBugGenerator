                                                                 

pragma solidity 0.5.17;

interface IToken {
    function TRANSFERFROM164(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
}

contract DropToken { // transfer msg.sender token to recipients per approved drop amount w/ msg.
    event DROPTKN594(bytes32 indexed message);	//inject NONSTANDARD NAMING
    
    function DROPTKN453(address[] calldata recipients, address tokenAddress, uint256 amount, bytes32 message) external {	//inject NONSTANDARD NAMING
        IToken token = IToken(tokenAddress);
        uint256 amounts = amount / recipients.length;
        for (uint256 i = 0; i < recipients.length; i++) {
	    token.TRANSFERFROM164(msg.sender, recipients[i], amounts);}
	    emit DROPTKN594(message);
    }
}