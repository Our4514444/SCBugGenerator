                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;

// File: @openzeppelin/upgrades/contracts/upgradeability/Proxy.sol

                                                                                                                                                                                                                                                                                                  
contract Proxy {
                                                                                  
  function () payable external {
    _FALLBACK931();
  }

                                                           
  function _IMPLEMENTATION178() internal view returns (address);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                         
  function _DELEGATE417(address implementation) internal {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                            
  function _WILLFALLBACK721() internal {	//inject NONSTANDARD NAMING
  }

                                                                                          
  function _FALLBACK931() internal {	//inject NONSTANDARD NAMING
    _WILLFALLBACK721();
    _DELEGATE417(_IMPLEMENTATION178());
  }
}

// File: @openzeppelin/upgrades/contracts/utils/Address.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
library OpenZeppelinUpgradesAddress {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT326(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

// File: @openzeppelin/upgrades/contracts/upgradeability/BaseUpgradeabilityProxy.sol

                                                                                                                                                                                                                       
contract BaseUpgradeabilityProxy is Proxy {
                                                                                                                                
  event UPGRADED754(address indexed implementation);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                
  bytes32 internal constant implementation_slot741 = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;	//inject NONSTANDARD NAMING

                                                                                                            
  function _IMPLEMENTATION178() internal view returns (address impl) {	//inject NONSTANDARD NAMING
    bytes32 slot = implementation_slot741;
    assembly {
      impl := sload(slot)
    }
  }

                                                                                                                                  
  function _UPGRADETO489(address newImplementation) internal {	//inject NONSTANDARD NAMING
    _SETIMPLEMENTATION264(newImplementation);
    emit UPGRADED754(newImplementation);
  }

                                                                                                                                    
  function _SETIMPLEMENTATION264(address newImplementation) internal {	//inject NONSTANDARD NAMING
    require(OpenZeppelinUpgradesAddress.ISCONTRACT326(newImplementation), "Cannot set a proxy implementation to a non-contract address");

    bytes32 slot = implementation_slot741;

    assembly {
      sstore(slot, newImplementation)
    }
  }
}

// File: @openzeppelin/upgrades/contracts/upgradeability/UpgradeabilityProxy.sol

                                                                                                                                                  
contract UpgradeabilityProxy is BaseUpgradeabilityProxy {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  constructor(address _logic, bytes memory _data) public payable {
    assert(implementation_slot741 == bytes32(uint256(keccak256('eip1967.proxy.implementation')) - 1));
    _SETIMPLEMENTATION264(_logic);
    if(_data.length > 0) {
      (bool success,) = _logic.delegatecall(_data);
      require(success);
    }
  }
}

// File: @openzeppelin/upgrades/contracts/upgradeability/BaseAdminUpgradeabilityProxy.sol

                                                                                                                                                                                                                                                                                                                                                                          
contract BaseAdminUpgradeabilityProxy is BaseUpgradeabilityProxy {
                                                                                                                                                                                   
  event ADMINCHANGED15(address previousAdmin, address newAdmin);	//inject NONSTANDARD NAMING

                                                                                                                                                                                       

  bytes32 internal constant admin_slot339 = 0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103;	//inject NONSTANDARD NAMING

                                                                                                                                                                                        
  modifier IFADMIN909() {	//inject NONSTANDARD NAMING
    if (msg.sender == _ADMIN488()) {
      _;
    } else {
      _FALLBACK931();
    }
  }

                                                        
  function ADMIN85() external IFADMIN909 returns (address) {	//inject NONSTANDARD NAMING
    return _ADMIN488();
  }

                                                           
  function IMPLEMENTATION226() external IFADMIN909 returns (address) {	//inject NONSTANDARD NAMING
    return _IMPLEMENTATION178();
  }

                                                                                                                                                                           
  function CHANGEADMIN997(address newAdmin) external IFADMIN909 {	//inject NONSTANDARD NAMING
    require(newAdmin != address(0), "Cannot change the admin of a proxy to the zero address");
    emit ADMINCHANGED15(_ADMIN488(), newAdmin);
    _SETADMIN363(newAdmin);
  }

                                                                                                                                                                                   
  function UPGRADETO47(address newImplementation) external IFADMIN909 {	//inject NONSTANDARD NAMING
    _UPGRADETO489(newImplementation);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  function UPGRADETOANDCALL617(address newImplementation, bytes calldata data) payable external IFADMIN909 {	//inject NONSTANDARD NAMING
    _UPGRADETO489(newImplementation);
    (bool success,) = newImplementation.delegatecall(data);
    require(success);
  }

                                        
  function _ADMIN488() internal view returns (address adm) {	//inject NONSTANDARD NAMING
    bytes32 slot = admin_slot339;
    assembly {
      adm := sload(slot)
    }
  }

                                                                                                               
  function _SETADMIN363(address newAdmin) internal {	//inject NONSTANDARD NAMING
    bytes32 slot = admin_slot339;

    assembly {
      sstore(slot, newAdmin)
    }
  }

                                                                      
  function _WILLFALLBACK721() internal {	//inject NONSTANDARD NAMING
    require(msg.sender != _ADMIN488(), "Cannot call fallback function from the proxy admin");
    super._WILLFALLBACK721();
  }
}

// File: @openzeppelin/upgrades/contracts/upgradeability/AdminUpgradeabilityProxy.sol

                                                                                                                                                                             
contract AdminUpgradeabilityProxy is BaseAdminUpgradeabilityProxy, UpgradeabilityProxy {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  constructor(address _logic, address _admin, bytes memory _data) UpgradeabilityProxy(_logic, _data) public payable {
    assert(admin_slot339 == bytes32(uint256(keccak256('eip1967.proxy.admin')) - 1));
    _SETADMIN363(_admin);
  }
}

// File: contracts/protocol/PerpetualProxy.sol

                                                                                                                                 
contract PerpetualProxy is
    AdminUpgradeabilityProxy
{
                                                                                                                                                                                                                                                                                                                                      
    constructor(
        address logic,
        address admin,
        bytes memory data
    )
        public
        AdminUpgradeabilityProxy(
            logic,
            admin,
            data
        )
    {}

                                                                                                                                          
    function _WILLFALLBACK721()	//inject NONSTANDARD NAMING
        internal
    {                                           }
}