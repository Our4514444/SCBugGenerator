                                                                 

pragma solidity 0.5.17; // optimization runs: 200, evm version: istanbul


interface IERC20 {
    function TRANSFER243(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE976(address, uint256) external returns (bool);	//inject NONSTANDARD NAMING
    function BALANCEOF725(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE688(address, address) external view returns (uint256);	//inject NONSTANDARD NAMING
}


                                                                         
                                                                         
                                                                          
                                                                        
                                                                       
                                                                         
                                                                    
                                                                          
                                                                         
                                                                       
                                                               
                
contract ApprovalBufferV1 {
                                                          
    function () external payable {}
    
                                                                 
    function TRADEETHFORERC20172(	//inject NONSTANDARD NAMING
        IERC20 tokenToReceive,
        uint256 tokenAmountExpected,
        address payable target,
        bytes calldata data
    ) external payable returns (uint256 tokenAmountReceived) {
        // Call into the provided target, supplying ETH and data.
        (bool ok,) = target.call.value(address(this).balance)(data);
        
        // Revert with reason if the call was not successful.
        _REVERTONFAILURE902(ok);
        
        // Determine the total token balance of this contract.
        tokenAmountReceived = tokenToReceive.BALANCEOF725(address(this));
        
        // Ensure that enough tokens were received.
        require(
            tokenAmountReceived >= tokenAmountExpected,
            "Trade did not result in the expected amount of tokens."
        );
        
        // Transfer the tokens to the caller and revert on failure.
        ok = (tokenToReceive.TRANSFER243(msg.sender, tokenAmountReceived));
        require(ok, "ERC20 transfer out failed.");
    }

                                                                 
    function TRADEERC20FORETH254(	//inject NONSTANDARD NAMING
        IERC20 tokenToGive,
        uint256 ethExpected,
        address target,
        bytes calldata data
    ) external returns (uint256 ethReceived) {
        // Ensure that target has allowance to transfer tokens.
        if (tokenToGive.ALLOWANCE688(address(this), target) != uint256(-1)) {
            tokenToGive.APPROVE976(target, uint256(-1));
        }
        
        // Call into the provided target, providing data.
        (bool ok,) = target.call(data);
        
        // Revert with reason if the call was not successful.
        _REVERTONFAILURE902(ok);
        
        // Determine the total Ether balance of this contract.
        ethReceived = address(this).balance;

        // Ensure that enough Ether was received.
        require(
            ethReceived >= ethExpected,
            "Trade did not result in the expected amount of Ether."
        );
   
        // Transfer the Ether to the caller and revert on failure.
        (ok, ) = msg.sender.call.gas(4999).value(ethReceived)("");

        // Revert with reason if the call was not successful.
        _REVERTONFAILURE902(ok);
    }

                                                                 
    function TRADEERC20FORERC20715(	//inject NONSTANDARD NAMING
        IERC20 tokenToGive,
        IERC20 tokenToReceive,
        uint256 tokenAmountExpected,
        address payable target,
        bytes calldata data
    ) external payable returns (uint256 tokenAmountReceived) {
        // Ensure that target has allowance to transfer tokens.
        if (tokenToGive.ALLOWANCE688(address(this), target) != uint256(-1)) {
            tokenToGive.APPROVE976(target, uint256(-1));
        }
        
        // Call into the provided target, providing data.
        (bool ok,) = target.call(data);
        
        // Revert with reason if the call was not successful.
        _REVERTONFAILURE902(ok);
        
        // Determine the total token balance of this contract.
        tokenAmountReceived = tokenToReceive.BALANCEOF725(address(this));
        
        // Ensure that enough tokens were received.
        require(
            tokenAmountReceived >= tokenAmountExpected,
            "Trade did not result in the expected amount of tokens."
        );
        
        // Transfer the tokens to the caller and revert on failure.
        ok = (tokenToReceive.TRANSFER243(msg.sender, tokenAmountReceived));
        require(ok, "ERC20 transfer out failed.");
    }

                                                            
    function _REVERTONFAILURE902(bool ok) internal pure {	//inject NONSTANDARD NAMING
        if (!ok) {
            assembly {
                returndatacopy(0, 0, returndatasize)
                revert(0, returndatasize)
            }
        }
    }
}