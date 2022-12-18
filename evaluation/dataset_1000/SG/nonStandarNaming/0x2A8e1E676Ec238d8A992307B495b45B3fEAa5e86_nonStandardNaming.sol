                                                                 

                                                                 

pragma solidity 0.5.11;

                                                                                                                                                                                                                                                                                                  
contract Proxy {
                                                                                  
  function () payable external {
    _FALLBACK57();
  }

                                                           
  function _IMPLEMENTATION985() internal view returns (address);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                         
  function _DELEGATE394(address implementation) internal {	//inject NONSTANDARD NAMING
    assembly {
      // Copy msg.data. We take full control of memory in this inline assembly
      // block because it will not return to Solidity code. We overwrite the
      // Solidity scratch pad at memory position 0.
      calldatacopy(0, 0, calldatasize)

      // Call the implementation.
      // out and outsize are 0 because we don't know the size yet.
      let result := delegatecall(gas, implementation, 0, calldatasize, 0, 0)

      // Copy the returned data.
      returndatacopy(0, 0, returndatasize)

      switch result
      // delegatecall returns 0 on error.
      case 0 { revert(0, returndatasize) }
      default { return(0, returndatasize) }
    }
  }

                                                                                                                                                                                                            
  function _WILLFALLBACK37() internal {	//inject NONSTANDARD NAMING
  }

                                                                                          
  function _FALLBACK57() internal {	//inject NONSTANDARD NAMING
    _WILLFALLBACK37();
    _DELEGATE394(_IMPLEMENTATION985());
  }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
library OpenZeppelinUpgradesAddress {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT34(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint256 size;
        // XXX Currently there is no better way to check if there is a contract in an address
        // than to check the size of the code at that address.
        // See https://ethereum.stackexchange.com/a/14016/36603
        // for more details about how this works.
        // TODO Check this again before the Serenity release, because all addresses will be
        // contracts then.
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

                                                                                                                                                                                                                       
contract BaseUpgradeabilityProxy is Proxy {
                                                                                                                                
  event UPGRADED216(address indexed implementation);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                
  bytes32 internal constant implementation_slot790 = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;	//inject NONSTANDARD NAMING

                                                                                                            
  function _IMPLEMENTATION985() internal view returns (address impl) {	//inject NONSTANDARD NAMING
    bytes32 slot = implementation_slot790;
    assembly {
      impl := sload(slot)
    }
  }

                                                                                                                                  
  function _UPGRADETO878(address newImplementation) internal {	//inject NONSTANDARD NAMING
    _SETIMPLEMENTATION404(newImplementation);
    emit UPGRADED216(newImplementation);
  }

                                                                                                                                    
  function _SETIMPLEMENTATION404(address newImplementation) internal {	//inject NONSTANDARD NAMING
    require(OpenZeppelinUpgradesAddress.ISCONTRACT34(newImplementation), "Cannot set a proxy implementation to a non-contract address");

    bytes32 slot = implementation_slot790;

    assembly {
      sstore(slot, newImplementation)
    }
  }
}


                                                                                                                                                                                                                                                                                                
contract Governable {
    // Storage position of the owner and pendingOwner of the contract
    bytes32	//inject NONSTANDARD NAMING
        private constant governorposition259 = 0x7bea13895fa79d2831e0a9e28edede30099005a50d652d8957cf8a607ee6ca4a;
    //keccak256("OUSD.governor");

    bytes32	//inject NONSTANDARD NAMING
        private constant pendinggovernorposition39 = 0x44c4d30b2eaad5130ad70c3ba6972730566f3e6359ab83e800d905c61b1c51db;
    //keccak256("OUSD.pending.governor");

    event PENDINGGOVERNORSHIPTRANSFER603(	//inject NONSTANDARD NAMING
        address indexed previousGovernor,
        address indexed newGovernor
    );

    event GOVERNORSHIPTRANSFERRED737(	//inject NONSTANDARD NAMING
        address indexed previousGovernor,
        address indexed newGovernor
    );

                                                                                                  
    constructor() internal {
        _SETGOVERNOR310(msg.sender);
        emit GOVERNORSHIPTRANSFERRED737(address(0), _GOVERNOR356());
    }

                                                                        
    function GOVERNOR325() public view returns (address) {	//inject NONSTANDARD NAMING
        return _GOVERNOR356();
    }

    function _GOVERNOR356() internal view returns (address governorOut) {	//inject NONSTANDARD NAMING
        bytes32 position = governorposition259;
        assembly {
            governorOut := sload(position)
        }
    }

    function _PENDINGGOVERNOR806()	//inject NONSTANDARD NAMING
        internal
        view
        returns (address pendingGovernor)
    {
        bytes32 position = pendinggovernorposition39;
        assembly {
            pendingGovernor := sload(position)
        }
    }

                                                                                    
    modifier ONLYGOVERNOR811() {	//inject NONSTANDARD NAMING
        require(ISGOVERNOR290(), "Caller is not the Governor");
        _;
    }

                                                                               
    function ISGOVERNOR290() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _GOVERNOR356();
    }

    function _SETGOVERNOR310(address newGovernor) internal {	//inject NONSTANDARD NAMING
        bytes32 position = governorposition259;
        assembly {
            sstore(position, newGovernor)
        }
    }

    function _SETPENDINGGOVERNOR797(address newGovernor) internal {	//inject NONSTANDARD NAMING
        bytes32 position = pendinggovernorposition39;
        assembly {
            sstore(position, newGovernor)
        }
    }

                                                                                                                                                                                                                                                 
    function TRANSFERGOVERNANCE291(address _newGovernor) external ONLYGOVERNOR811 {	//inject NONSTANDARD NAMING
        _SETPENDINGGOVERNOR797(_newGovernor);
        emit PENDINGGOVERNORSHIPTRANSFER603(_GOVERNOR356(), _newGovernor);
    }

                                                                                                                                             
    function CLAIMGOVERNANCE443() external {	//inject NONSTANDARD NAMING
        require(
            msg.sender == _PENDINGGOVERNOR806(),
            "Only the pending Governor can complete the claim"
        );
        _CHANGEGOVERNOR466(msg.sender);
    }

                                                                                                                                                      
    function _CHANGEGOVERNOR466(address _newGovernor) internal {	//inject NONSTANDARD NAMING
        require(_newGovernor != address(0), "New Governor is address(0)");
        emit GOVERNORSHIPTRANSFERRED737(_GOVERNOR356(), _newGovernor);
        _SETGOVERNOR310(_newGovernor);
    }
}

                                                                                                                                                                
contract InitializeGovernedUpgradeabilityProxy is
    Governable,
    BaseUpgradeabilityProxy
{
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function INITIALIZE320(	//inject NONSTANDARD NAMING
        address _logic,
        address _initGovernor,
        bytes memory _data
    ) public payable ONLYGOVERNOR811 {
        require(_IMPLEMENTATION985() == address(0));
        assert(
            implementation_slot790 ==
                bytes32(uint256(keccak256("eip1967.proxy.implementation")) - 1)
        );
        _SETIMPLEMENTATION404(_logic);
        if (_data.length > 0) {
            (bool success, ) = _logic.delegatecall(_data);
            require(success);
        }
        _CHANGEGOVERNOR466(_initGovernor);
    }

                                                                                     
    function ADMIN279() external view returns (address) {	//inject NONSTANDARD NAMING
        return _GOVERNOR356();
    }

                                                                 
    function IMPLEMENTATION346() external view returns (address) {	//inject NONSTANDARD NAMING
        return _IMPLEMENTATION985();
    }

                                                                                                                                                                                             
    function UPGRADETO97(address newImplementation) external ONLYGOVERNOR811 {	//inject NONSTANDARD NAMING
        _UPGRADETO878(newImplementation);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function UPGRADETOANDCALL478(address newImplementation, bytes calldata data)	//inject NONSTANDARD NAMING
        external
        payable
        ONLYGOVERNOR811
    {
        _UPGRADETO878(newImplementation);
        (bool success, ) = newImplementation.delegatecall(data);
        require(success);
    }
}

                                                                     
contract OUSDProxy is InitializeGovernedUpgradeabilityProxy {

}