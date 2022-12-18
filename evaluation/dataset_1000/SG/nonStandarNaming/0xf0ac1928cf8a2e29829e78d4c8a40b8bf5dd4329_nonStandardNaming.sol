                                                                 

pragma solidity 0.5.16;











                                                                                                                                                                                                                                                                                                  
contract Proxy {
                                                                                  
  function () payable external {
    _FALLBACK969();
  }

                                                           
  function _IMPLEMENTATION143() internal view returns (address);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                         
  function _DELEGATE531(address implementation) internal {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                            
  function _WILLFALLBACK997() internal {	//inject NONSTANDARD NAMING
  }

                                                                                          
  function _FALLBACK969() internal {	//inject NONSTANDARD NAMING
    _WILLFALLBACK997();
    _DELEGATE531(_IMPLEMENTATION143());
  }
}



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
library OpenZeppelinUpgradesAddress {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT848(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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
                                                                                                                                
  event UPGRADED103(address indexed implementation);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                
  bytes32 internal constant implementation_slot120 = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;	//inject NONSTANDARD NAMING

                                                                                                            
  function _IMPLEMENTATION143() internal view returns (address impl) {	//inject NONSTANDARD NAMING
    bytes32 slot = implementation_slot120;
    assembly {
      impl := sload(slot)
    }
  }

                                                                                                                                  
  function _UPGRADETO797(address newImplementation) internal {	//inject NONSTANDARD NAMING
    _SETIMPLEMENTATION269(newImplementation);
    emit UPGRADED103(newImplementation);
  }

                                                                                                                                    
  function _SETIMPLEMENTATION269(address newImplementation) internal {	//inject NONSTANDARD NAMING
    require(OpenZeppelinUpgradesAddress.ISCONTRACT848(newImplementation), "Cannot set a proxy implementation to a non-contract address");

    bytes32 slot = implementation_slot120;

    assembly {
      sstore(slot, newImplementation)
    }
  }
}


                                                                                                                                                  
contract UpgradeabilityProxy is BaseUpgradeabilityProxy {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  constructor(address _logic, bytes memory _data) public payable {
    assert(implementation_slot120 == bytes32(uint256(keccak256('eip1967.proxy.implementation')) - 1));
    _SETIMPLEMENTATION269(_logic);
    if(_data.length > 0) {
      (bool success,) = _logic.delegatecall(_data);
      require(success);
    }
  }  
}


                                                                                                                                                                                                                                                                                                                                                                          
contract BaseAdminUpgradeabilityProxy is BaseUpgradeabilityProxy {
                                                                                                                                                                                   
  event ADMINCHANGED183(address previousAdmin, address newAdmin);	//inject NONSTANDARD NAMING

                                                                                                                                                                                       

  bytes32 internal constant admin_slot541 = 0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103;	//inject NONSTANDARD NAMING

                                                                                                                                                                                        
  modifier IFADMIN322() {	//inject NONSTANDARD NAMING
    if (msg.sender == _ADMIN811()) {
      _;
    } else {
      _FALLBACK969();
    }
  }

                                                        
  function ADMIN129() external IFADMIN322 returns (address) {	//inject NONSTANDARD NAMING
    return _ADMIN811();
  }

                                                           
  function IMPLEMENTATION323() external IFADMIN322 returns (address) {	//inject NONSTANDARD NAMING
    return _IMPLEMENTATION143();
  }

                                                                                                                                                                           
  function CHANGEADMIN347(address newAdmin) external IFADMIN322 {	//inject NONSTANDARD NAMING
    require(newAdmin != address(0), "Cannot change the admin of a proxy to the zero address");
    emit ADMINCHANGED183(_ADMIN811(), newAdmin);
    _SETADMIN971(newAdmin);
  }

                                                                                                                                                                                   
  function UPGRADETO220(address newImplementation) external IFADMIN322 {	//inject NONSTANDARD NAMING
    _UPGRADETO797(newImplementation);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function UPGRADETOANDCALL122(address newImplementation, bytes calldata data) payable external IFADMIN322 {	//inject NONSTANDARD NAMING
    _UPGRADETO797(newImplementation);
    (bool success,) = newImplementation.delegatecall(data);
    require(success);
  }

                                        
  function _ADMIN811() internal view returns (address adm) {	//inject NONSTANDARD NAMING
    bytes32 slot = admin_slot541;
    assembly {
      adm := sload(slot)
    }
  }

                                                                                                               
  function _SETADMIN971(address newAdmin) internal {	//inject NONSTANDARD NAMING
    bytes32 slot = admin_slot541;

    assembly {
      sstore(slot, newAdmin)
    }
  }

                                                                      
  function _WILLFALLBACK997() internal {	//inject NONSTANDARD NAMING
    require(msg.sender != _ADMIN811(), "Cannot call fallback function from the proxy admin");
    super._WILLFALLBACK997();
  }
}


                                                                                                                                                                              
contract AdminUpgradeabilityProxy is BaseAdminUpgradeabilityProxy, UpgradeabilityProxy {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  constructor(address _logic, address _admin, bytes memory _data) UpgradeabilityProxy(_logic, _data) public payable {
    assert(admin_slot541 == bytes32(uint256(keccak256('eip1967.proxy.admin')) - 1));
    _SETADMIN971(_admin);
  }
}



                                                                   
contract RewardProxy is AdminUpgradeabilityProxy {
                                  
                                                                                
    constructor(address _logic) AdminUpgradeabilityProxy(_logic, msg.sender, new bytes(0)) public {}
}