                                                                 

pragma solidity 0.5.16;


interface IERC20 {
    function TRANSFER175(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
    function BALANCEOF300(address) external view returns (uint256);	//inject NONSTANDARD NAMING
}

                
contract EthToDaiTradeHelperV2 {
    IERC20 internal constant _dai346 = IERC20(	//inject NONSTANDARD NAMING
        0x6B175474E89094C44Da98b954EedeAC495271d0F
    );
    
    function TRADE540(	//inject NONSTANDARD NAMING
        address payable target, bytes calldata data
    ) external payable returns (uint256 daiReceived) {
        // Call into the provided target, supplying ETH and data.
        (bool ok,) = target.call.value(address(this).balance)(data);
        
        // Revert with reason if the call was not successful.
        _REVERTONFAILURE712(ok);
        
        // Determine the total Dai balance of this contract.
        daiReceived = _dai346.BALANCEOF300(address(this));
        
        // Transfer the Dai to the caller and revert on failure.
        ok = (_dai346.TRANSFER175(msg.sender, daiReceived));
        require(ok, "Dai transfer out failed.");
    }
    
    function _REVERTONFAILURE712(bool ok) internal pure {	//inject NONSTANDARD NAMING
        if (!ok) {
            assembly {
                returndatacopy(0, 0, returndatasize)
                revert(0, returndatasize)
            }
        }
    }
}