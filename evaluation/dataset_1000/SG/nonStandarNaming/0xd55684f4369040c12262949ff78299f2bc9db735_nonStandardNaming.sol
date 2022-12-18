                                                                 

pragma solidity 0.5.16;


                                                                                                                                                                                                                                                                                                  
contract Proxy {
                                                                                  
  function () payable external {
    _FALLBACK255();
  }

                                                           
  function _IMPLEMENTATION133() internal view returns (address);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                         
  function _DELEGATE411(address implementation) internal {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                            
  function _WILLFALLBACK348() internal {	//inject NONSTANDARD NAMING
  }

                                                                                          
  function _FALLBACK255() internal {	//inject NONSTANDARD NAMING
    _WILLFALLBACK348();
    _DELEGATE411(_IMPLEMENTATION133());
  }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
library OpenZeppelinUpgradesAddress {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT497(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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
                                                                                                                                
  event UPGRADED689(address indexed implementation);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                
  bytes32 internal constant implementation_slot977 = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;	//inject NONSTANDARD NAMING

                                                                                                            
  function _IMPLEMENTATION133() internal view returns (address impl) {	//inject NONSTANDARD NAMING
    bytes32 slot = implementation_slot977;
    assembly {
      impl := sload(slot)
    }
  }

                                                                                                                                  
  function _UPGRADETO322(address newImplementation) internal {	//inject NONSTANDARD NAMING
    _SETIMPLEMENTATION936(newImplementation);
    emit UPGRADED689(newImplementation);
  }

                                                                                                                                    
  function _SETIMPLEMENTATION936(address newImplementation) internal {	//inject NONSTANDARD NAMING
    require(OpenZeppelinUpgradesAddress.ISCONTRACT497(newImplementation), "Cannot set a proxy implementation to a non-contract address");

    bytes32 slot = implementation_slot977;

    assembly {
      sstore(slot, newImplementation)
    }
  }
}

                                                                                                                                                  
contract UpgradeabilityProxy is BaseUpgradeabilityProxy {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  constructor(address _logic, bytes memory _data) public payable {
    assert(implementation_slot977 == bytes32(uint256(keccak256('eip1967.proxy.implementation')) - 1));
    _SETIMPLEMENTATION936(_logic);
    if(_data.length > 0) {
      (bool success,) = _logic.delegatecall(_data);
      require(success);
    }
  }  
}

                                                                                                                                                                                                                                                                                                                                                                          
contract BaseAdminUpgradeabilityProxy is BaseUpgradeabilityProxy {
                                                                                                                                                                                   
  event ADMINCHANGED116(address previousAdmin, address newAdmin);	//inject NONSTANDARD NAMING

                                                                                                                                                                                       

  bytes32 internal constant admin_slot699 = 0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103;	//inject NONSTANDARD NAMING

                                                                                                                                                                                        
  modifier IFADMIN320() {	//inject NONSTANDARD NAMING
    if (msg.sender == _ADMIN689()) {
      _;
    } else {
      _FALLBACK255();
    }
  }

                                                        
  function ADMIN125() external IFADMIN320 returns (address) {	//inject NONSTANDARD NAMING
    return _ADMIN689();
  }

                                                           
  function IMPLEMENTATION89() external IFADMIN320 returns (address) {	//inject NONSTANDARD NAMING
    return _IMPLEMENTATION133();
  }

                                                                                                                                                                           
  function CHANGEADMIN749(address newAdmin) external IFADMIN320 {	//inject NONSTANDARD NAMING
    require(newAdmin != address(0), "Cannot change the admin of a proxy to the zero address");
    emit ADMINCHANGED116(_ADMIN689(), newAdmin);
    _SETADMIN29(newAdmin);
  }

                                                                                                                                                                                   
  function UPGRADETO38(address newImplementation) external IFADMIN320 {	//inject NONSTANDARD NAMING
    _UPGRADETO322(newImplementation);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function UPGRADETOANDCALL816(address newImplementation, bytes calldata data) payable external IFADMIN320 {	//inject NONSTANDARD NAMING
    _UPGRADETO322(newImplementation);
    (bool success,) = newImplementation.delegatecall(data);
    require(success);
  }

                                        
  function _ADMIN689() internal view returns (address adm) {	//inject NONSTANDARD NAMING
    bytes32 slot = admin_slot699;
    assembly {
      adm := sload(slot)
    }
  }

                                                                                                               
  function _SETADMIN29(address newAdmin) internal {	//inject NONSTANDARD NAMING
    bytes32 slot = admin_slot699;

    assembly {
      sstore(slot, newAdmin)
    }
  }

                                                                      
  function _WILLFALLBACK348() internal {	//inject NONSTANDARD NAMING
    require(msg.sender != _ADMIN689(), "Cannot call fallback function from the proxy admin");
    super._WILLFALLBACK348();
  }
}

                                                                                                                                                                
contract InitializableUpgradeabilityProxy is BaseUpgradeabilityProxy {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function INITIALIZE378(address _logic, bytes memory _data) public payable {	//inject NONSTANDARD NAMING
    require(_IMPLEMENTATION133() == address(0));
    assert(implementation_slot977 == bytes32(uint256(keccak256('eip1967.proxy.implementation')) - 1));
    _SETIMPLEMENTATION936(_logic);
    if(_data.length > 0) {
      (bool success,) = _logic.delegatecall(_data);
      require(success);
    }
  }  
}

                                                                                                                                                                                            
contract InitializableAdminUpgradeabilityProxy is BaseAdminUpgradeabilityProxy, InitializableUpgradeabilityProxy {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function INITIALIZE378(address _logic, address _admin, bytes memory _data) public payable {	//inject NONSTANDARD NAMING
    require(_IMPLEMENTATION133() == address(0));
    InitializableUpgradeabilityProxy.INITIALIZE378(_logic, _data);
    assert(admin_slot699 == bytes32(uint256(keccak256('eip1967.proxy.admin')) - 1));
    _SETADMIN29(_admin);
  }
}

                                                                                                                                                                                                                                                                                                                                                                                           
contract VaultProxy is InitializableAdminUpgradeabilityProxy {
}