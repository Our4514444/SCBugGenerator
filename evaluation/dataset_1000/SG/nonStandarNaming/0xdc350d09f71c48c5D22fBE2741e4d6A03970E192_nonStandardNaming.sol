                                                                 

pragma solidity ^0.5.4;

// Copyright (C) 2018  Argent Labs Ltd. <https://argent.xyz>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.


                                                                                                                                                                                                                                                  
interface Module {

                                                                                                                                                     
    function INIT73(BaseWallet _wallet) external;	//inject NONSTANDARD NAMING

                                                                                                                                               
    function ADDMODULE767(BaseWallet _wallet, Module _module) external;	//inject NONSTANDARD NAMING

                                                                                                                                                           
    function RECOVERTOKEN619(address _token) external;	//inject NONSTANDARD NAMING
}// Copyright (C) 2018  Argent Labs Ltd. <https://argent.xyz>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.


                                                                                                                                                             
contract BaseWallet {

    // The implementation of the proxy
    address public implementation;
    // The owner
    address public owner;
    // The authorised modules
    mapping (address => bool) public authorised;
    // The enabled static calls
    mapping (bytes4 => address) public enabled;
    // The number of modules
    uint public modules;

    event AUTHORISEDMODULE781(address indexed module, bool value);	//inject NONSTANDARD NAMING
    event ENABLEDSTATICCALL270(address indexed module, bytes4 indexed method);	//inject NONSTANDARD NAMING
    event INVOKED715(address indexed module, address indexed target, uint indexed value, bytes data);	//inject NONSTANDARD NAMING
    event RECEIVED61(uint indexed value, address indexed sender, bytes data);	//inject NONSTANDARD NAMING
    event OWNERCHANGED854(address owner);	//inject NONSTANDARD NAMING

                                                                             
    modifier MODULEONLY736 {	//inject NONSTANDARD NAMING
        require(authorised[msg.sender], "BW: msg.sender not an authorized module");
        _;
    }

                                                                                                                                                                                     
    function INIT73(address _owner, address[] calldata _modules) external {	//inject NONSTANDARD NAMING
        require(owner == address(0) && modules == 0, "BW: wallet already initialised");
        require(_modules.length > 0, "BW: construction requires at least 1 module");
        owner = _owner;
        modules = _modules.length;
        for (uint256 i = 0; i < _modules.length; i++) {
            require(authorised[_modules[i]] == false, "BW: module is already added");
            authorised[_modules[i]] = true;
            Module(_modules[i]).INIT73(this);
            emit AUTHORISEDMODULE781(_modules[i], true);
        }
        if (address(this).balance > 0) {
            emit RECEIVED61(address(this).balance, address(0), "");
        }
    }

                                                                                                                                                         
    function AUTHORISEMODULE650(address _module, bool _value) external MODULEONLY736 {	//inject NONSTANDARD NAMING
        if (authorised[_module] != _value) {
            emit AUTHORISEDMODULE781(_module, _value);
            if (_value == true) {
                modules += 1;
                authorised[_module] = true;
                Module(_module).INIT73(this);
            } else {
                modules -= 1;
                require(modules > 0, "BW: wallet must have at least one module");
                delete authorised[_module];
            }
        }
    }

                                                                                                                                                                                                                      
    function ENABLESTATICCALL823(address _module, bytes4 _method) external MODULEONLY736 {	//inject NONSTANDARD NAMING
        require(authorised[_module], "BW: must be an authorised module for static call");
        enabled[_method] = _module;
        emit ENABLEDSTATICCALL270(_module, _method);
    }

                                                                                                   
    function SETOWNER616(address _newOwner) external MODULEONLY736 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "BW: address cannot be null");
        owner = _newOwner;
        emit OWNERCHANGED854(_newOwner);
    }

                                                                                                                                                                                                                      
    function INVOKE74(address _target, uint _value, bytes calldata _data) external MODULEONLY736 returns (bytes memory _result) {	//inject NONSTANDARD NAMING
        bool success;
        // solium-disable-next-line security/no-call-value
        (success, _result) = _target.call.value(_value)(_data);
        if (!success) {
            // solium-disable-next-line security/no-inline-assembly
            assembly {
                returndatacopy(0, 0, returndatasize)
                revert(0, returndatasize)
            }
        }
        emit INVOKED715(msg.sender, _target, _value, _data);
    }

                                                                                                                                                                                                                                                                                                     
    function() external payable {
        if (msg.data.length > 0) {
            address module = enabled[msg.sig];
            if (module == address(0)) {
                emit RECEIVED61(msg.value, msg.sender, msg.data);
            } else {
                require(authorised[module], "BW: must be an authorised module for static call");
                // solium-disable-next-line security/no-inline-assembly
                assembly {
                    calldatacopy(0, 0, calldatasize())
                    let result := staticcall(gas, module, 0, calldatasize(), 0, 0)
                    returndatacopy(0, 0, returndatasize())
                    switch result
                    case 0 {revert(0, returndatasize())}
                    default {return (0, returndatasize())}
                }
            }
        }
    }
}// Copyright (C) 2018  Argent Labs Ltd. <https://argent.xyz>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.



                                                                                                               
contract Owned {

    // The owner
    address public owner;

    event OWNERCHANGED854(address indexed _newOwner);	//inject NONSTANDARD NAMING

                                                                  
    modifier ONLYOWNER492 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

                                                                                                                                    
    function CHANGEOWNER455(address _newOwner) external ONLYOWNER492 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Address must not be null");
        owner = _newOwner;
        emit OWNERCHANGED854(_newOwner);
    }
}

                                    
contract ERC20 {
    function TOTALSUPPLY21() public view returns (uint);	//inject NONSTANDARD NAMING
    function DECIMALS309() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF539(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE62(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER538(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE540(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM312(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
}// Copyright (C) 2018  Argent Labs Ltd. <https://argent.xyz>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.



                                                                                                                                                                                              
contract ModuleRegistry is Owned {

    mapping (address => Info) internal modules;
    mapping (address => Info) internal upgraders;

    event MODULEREGISTERED516(address indexed module, bytes32 name);	//inject NONSTANDARD NAMING
    event MODULEDEREGISTERED588(address module);	//inject NONSTANDARD NAMING
    event UPGRADERREGISTERED291(address indexed upgrader, bytes32 name);	//inject NONSTANDARD NAMING
    event UPGRADERDEREGISTERED571(address upgrader);	//inject NONSTANDARD NAMING

    struct Info {
        bool exists;
        bytes32 name;
    }

                                                                                                                                    
    function REGISTERMODULE686(address _module, bytes32 _name) external ONLYOWNER492 {	//inject NONSTANDARD NAMING
        require(!modules[_module].exists, "MR: module already exists");
        modules[_module] = Info({exists: true, name: _name});
        emit MODULEREGISTERED516(_module, _name);
    }

                                                                                   
    function DEREGISTERMODULE974(address _module) external ONLYOWNER492 {	//inject NONSTANDARD NAMING
        require(modules[_module].exists, "MR: module does not exist");
        delete modules[_module];
        emit MODULEDEREGISTERED588(_module);
    }

                                                                                                                                                 
    function REGISTERUPGRADER39(address _upgrader, bytes32 _name) external ONLYOWNER492 {	//inject NONSTANDARD NAMING
        require(!upgraders[_upgrader].exists, "MR: upgrader already exists");
        upgraders[_upgrader] = Info({exists: true, name: _name});
        emit UPGRADERREGISTERED291(_upgrader, _name);
    }

                                                                                           
    function DEREGISTERUPGRADER723(address _upgrader) external ONLYOWNER492 {	//inject NONSTANDARD NAMING
        require(upgraders[_upgrader].exists, "MR: upgrader does not exist");
        delete upgraders[_upgrader];
        emit UPGRADERDEREGISTERED571(_upgrader);
    }

                                                                                                                                                                                   
    function RECOVERTOKEN619(address _token) external ONLYOWNER492 {	//inject NONSTANDARD NAMING
        uint total = ERC20(_token).BALANCEOF539(address(this));
        ERC20(_token).TRANSFER538(msg.sender, total);
    }

                                                                                                                                          
    function MODULEINFO899(address _module) external view returns (bytes32) {	//inject NONSTANDARD NAMING
        return modules[_module].name;
    }

                                                                                                                                                 
    function UPGRADERINFO234(address _upgrader) external view returns (bytes32) {	//inject NONSTANDARD NAMING
        return upgraders[_upgrader].name;
    }

                                                                                                                                                        
    function ISREGISTEREDMODULE242(address _module) external view returns (bool) {	//inject NONSTANDARD NAMING
        return modules[_module].exists;
    }

                                                                                                                                                                                  
    function ISREGISTEREDMODULE242(address[] calldata _modules) external view returns (bool) {	//inject NONSTANDARD NAMING
        for (uint i = 0; i < _modules.length; i++) {
            if (!modules[_modules[i]].exists) {
                return false;
            }
        }
        return true;
    }

                                                                                                                                                                 
    function ISREGISTEREDUPGRADER260(address _upgrader) external view returns (bool) {	//inject NONSTANDARD NAMING
        return upgraders[_upgrader].exists;
    }
}// Copyright (C) 2018  Argent Labs Ltd. <https://argent.xyz>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.


                                                                                                                         
contract Storage {

                                                                             
    modifier ONLYMODULE177(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(_wallet.authorised(msg.sender), "TS: must be an authorized module to call this method");
        _;
    }
}// Copyright (C) 2018  Argent Labs Ltd. <https://argent.xyz>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.


interface IGuardianStorage{

                                                                                                                                                                       
    function ADDGUARDIAN248(BaseWallet _wallet, address _guardian) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                               
    function REVOKEGUARDIAN1000(BaseWallet _wallet, address _guardian) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                         
    function ISGUARDIAN982(BaseWallet _wallet, address _guardian) external view returns (bool);	//inject NONSTANDARD NAMING
}// Copyright (C) 2018  Argent Labs Ltd. <https://argent.xyz>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.




                                                                                                                                                                                                                                                                                                                                                          
contract GuardianStorage is IGuardianStorage, Storage {

    struct GuardianStorageConfig {
        // the list of guardians
        address[] guardians;
        // the info about guardians
        mapping (address => GuardianInfo) info;
        // the lock's release timestamp
        uint256 lock;
        // the module that set the last lock
        address locker;
    }

    struct GuardianInfo {
        bool exists;
        uint128 index;
    }

    // wallet specific storage
    mapping (address => GuardianStorageConfig) internal configs;

    // *************** External Functions ********************* //

                                                                                                                                                                       
    function ADDGUARDIAN248(BaseWallet _wallet, address _guardian) external ONLYMODULE177(_wallet) {	//inject NONSTANDARD NAMING
        GuardianStorageConfig storage config = configs[address(_wallet)];
        config.info[_guardian].exists = true;
        config.info[_guardian].index = uint128(config.guardians.push(_guardian) - 1);
    }

                                                                                                                                                                               
    function REVOKEGUARDIAN1000(BaseWallet _wallet, address _guardian) external ONLYMODULE177(_wallet) {	//inject NONSTANDARD NAMING
        GuardianStorageConfig storage config = configs[address(_wallet)];
        address lastGuardian = config.guardians[config.guardians.length - 1];
        if (_guardian != lastGuardian) {
            uint128 targetIndex = config.info[_guardian].index;
            config.guardians[targetIndex] = lastGuardian;
            config.info[lastGuardian].index = targetIndex;
        }
        config.guardians.length--;
        delete config.info[_guardian];
    }

                                                                                                                                                          
    function GUARDIANCOUNT144(BaseWallet _wallet) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return configs[address(_wallet)].guardians.length;
    }

                                                                                                                                                   
    function GETGUARDIANS145(BaseWallet _wallet) external view returns (address[] memory) {	//inject NONSTANDARD NAMING
        GuardianStorageConfig storage config = configs[address(_wallet)];
        address[] memory guardians = new address[](config.guardians.length);
        for (uint256 i = 0; i < config.guardians.length; i++) {
            guardians[i] = config.guardians[i];
        }
        return guardians;
    }

                                                                                                                                                                                                                         
    function ISGUARDIAN982(BaseWallet _wallet, address _guardian) external view returns (bool) {	//inject NONSTANDARD NAMING
        return configs[address(_wallet)].info[_guardian].exists;
    }

                                                                                                                                                                                                                    
    function SETLOCK911(BaseWallet _wallet, uint256 _releaseAfter) external ONLYMODULE177(_wallet) {	//inject NONSTANDARD NAMING
        configs[address(_wallet)].lock = _releaseAfter;
        if (_releaseAfter != 0 && msg.sender != configs[address(_wallet)].locker) {
            configs[address(_wallet)].locker = msg.sender;
        }
    }

                                                                                                                                                                   
    function ISLOCKED943(BaseWallet _wallet) external view returns (bool) {	//inject NONSTANDARD NAMING
        return configs[address(_wallet)].lock > now;
    }

                                                                                                                                                                                                                                   
    function GETLOCK679(BaseWallet _wallet) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return configs[address(_wallet)].lock;
    }

                                                                                                                                                                                                                                
    function GETLOCKER820(BaseWallet _wallet) external view returns (address) {	//inject NONSTANDARD NAMING
        return configs[address(_wallet)].locker;
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              



                                                                                         
library SafeMath {

                                                                      
    function MUL569(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                               
    function DIV774(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                  
    function SUB344(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                
    function ADD802(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                       
    function MOD71(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }

                                              
    function CEIL940(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        if(a % b == 0) {
            return c;
        }
        else {
            return c + 1;
        }
    }

    // from DSMath - operations on fixed precision floats

    uint256 constant wad246 = 10 ** 18;	//inject NONSTANDARD NAMING
    uint256 constant ray574 = 10 ** 27;	//inject NONSTANDARD NAMING

    function WMUL63(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD802(MUL569(x, y), wad246 / 2) / wad246;
    }
    function RMUL20(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD802(MUL569(x, y), ray574 / 2) / ray574;
    }
    function WDIV553(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD802(MUL569(x, wad246), y / 2) / y;
    }
    function RDIV383(uint256 x, uint256 y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD802(MUL569(x, ray574), y / 2) / y;
    }
}
// Copyright (C) 2018  Argent Labs Ltd. <https://argent.xyz>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.







                                                                                                                                                
contract BaseModule is Module {

    // Empty calldata
    bytes constant internal empty_bytes648 = "";	//inject NONSTANDARD NAMING

    // The adddress of the module registry.
    ModuleRegistry internal registry;
    // The address of the Guardian storage
    GuardianStorage internal guardianStorage;

                                                           
    modifier ONLYWHENUNLOCKED660(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        // solium-disable-next-line security/no-block-members
        require(!guardianStorage.ISLOCKED943(_wallet), "BM: wallet must be unlocked");
        _;
    }

    event MODULECREATED702(bytes32 name);	//inject NONSTANDARD NAMING
    event MODULEINITIALISED209(address wallet);	//inject NONSTANDARD NAMING

    constructor(ModuleRegistry _registry, GuardianStorage _guardianStorage, bytes32 _name) public {
        registry = _registry;
        guardianStorage = _guardianStorage;
        emit MODULECREATED702(_name);
    }

                                                                                      
    modifier ONLYWALLET645(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(_wallet), "BM: caller must be wallet");
        _;
    }

                                                                                                            
    modifier ONLYWALLETOWNER907(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this) || ISOWNER786(_wallet, msg.sender), "BM: must be an owner for the wallet");
        _;
    }

                                                                                       
    modifier STRICTONLYWALLETOWNER395(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(ISOWNER786(_wallet, msg.sender), "BM: msg.sender must be an owner for the wallet");
        _;
    }

                                                                                                                                                                           
    function INIT73(BaseWallet _wallet) public ONLYWALLET645(_wallet) {	//inject NONSTANDARD NAMING
        emit MODULEINITIALISED209(address(_wallet));
    }

                                                                                                                                                                                           
    function ADDMODULE767(BaseWallet _wallet, Module _module) external STRICTONLYWALLETOWNER395(_wallet) {	//inject NONSTANDARD NAMING
        require(registry.ISREGISTEREDMODULE242(address(_module)), "BM: module is not registered");
        _wallet.AUTHORISEMODULE650(address(_module), true);
    }

                                                                                                                                                                                                       
    function RECOVERTOKEN619(address _token) external {	//inject NONSTANDARD NAMING
        uint total = ERC20(_token).BALANCEOF539(address(this));
        ERC20(_token).TRANSFER538(address(registry), total);
    }

                                                                                                                                                                           
    function ISOWNER786(BaseWallet _wallet, address _addr) internal view returns (bool) {	//inject NONSTANDARD NAMING
        return _wallet.owner() == _addr;
    }

                                                                                                                                                                                                                                                                    
    function INVOKEWALLET849(address _wallet, address _to, uint256 _value, bytes memory _data) internal returns (bytes memory _res) {	//inject NONSTANDARD NAMING
        bool success;
        // solium-disable-next-line security/no-call-value
        (success, _res) = _wallet.call(abi.encodeWithSignature("invoke(address,uint256,bytes)", _to, _value, _data));
        if (success && _res.length > 0) { //_res is empty if _wallet is an "old" BaseWallet that can't return output values
            (_res) = abi.decode(_res, (bytes));
        } else if (_res.length > 0) {
            // solium-disable-next-line security/no-inline-assembly
            assembly {
                returndatacopy(0, 0, returndatasize)
                revert(0, returndatasize)
            }
        } else if (!success) {
            revert("BM: wallet invoke reverted");
        }
    }
}// Copyright (C) 2018  Argent Labs Ltd. <https://argent.xyz>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.



library GuardianUtils {

                                                                                                                                                                                                                                                                                                                                                                                                                  
    function ISGUARDIAN982(address[] memory _guardians, address _guardian) internal view returns (bool, address[] memory) {	//inject NONSTANDARD NAMING
        if (_guardians.length == 0 || _guardian == address(0)) {
            return (false, _guardians);
        }
        bool isFound = false;
        address[] memory updatedGuardians = new address[](_guardians.length - 1);
        uint256 index = 0;
        for (uint256 i = 0; i < _guardians.length; i++) {
            if (!isFound) {
                // check if _guardian is an account guardian
                if (_guardian == _guardians[i]) {
                    isFound = true;
                    continue;
                }
                // check if _guardian is the owner of a smart contract guardian
                if (ISCONTRACT311(_guardians[i]) && ISGUARDIANOWNER899(_guardians[i], _guardian)) {
                    isFound = true;
                    continue;
                }
            }
            if (index < updatedGuardians.length) {
                updatedGuardians[index] = _guardians[i];
                index++;
            }
        }
        return isFound ? (true, updatedGuardians) : (false, _guardians);
    }

                                                                                            
    function ISCONTRACT311(address _addr) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint32 size;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }

                                                                                                                                                                                                                                                                         
    function ISGUARDIANOWNER899(address _guardian, address _owner) internal view returns (bool) {	//inject NONSTANDARD NAMING
        address owner = address(0);
        bytes4 sig = bytes4(keccak256("owner()"));
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            let ptr := mload(0x40)
            mstore(ptr,sig)
            let result := staticcall(5000, _guardian, ptr, 0x20, ptr, 0x20)
            if eq(result, 1) {
                owner := mload(ptr)
            }
        }
        return owner == _owner;
    }
}
// Copyright (C) 2018  Argent Labs Ltd. <https://argent.xyz>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.




                                                                                                                                                                                                                                                                                                                                                                                                        
contract RelayerModuleV2 is BaseModule {

    uint256 constant internal blockbound832 = 10000;	//inject NONSTANDARD NAMING

    mapping (address => RelayerConfig) public relayer;

    struct RelayerConfig {
        uint256 nonce;
        mapping (bytes32 => bool) executedTx;
    }

    enum OwnerSignature {
        Required,
        Optional,
        Disallowed
    }

    event TRANSACTIONEXECUTED469(address indexed wallet, bool indexed success, bytes32 signedHash);	//inject NONSTANDARD NAMING

                                                                                       
    modifier ONLYEXECUTE879 {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "RM: must be called via execute()");
        _;
    }

                                                                      

                                                                                                                                                                                                                                                                                     
    function GETREQUIREDSIGNATURES822(BaseWallet _wallet, bytes memory _data) public view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function VALIDATESIGNATURES88(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        bytes memory _data,
        bytes32 _signHash,
        bytes memory _signatures
    )
        internal view returns (bool);

                                                                      

                                                                                                                                                                                                                                                                                                                                                                                                                             
    function EXECUTE655(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        bytes calldata _data,
        uint256 _nonce,
        bytes calldata _signatures,
        uint256 _gasPrice,
        uint256 _gasLimit
    )
        external
        returns (bool success)
    {
        uint startGas = gasleft();
        bytes32 signHash = GETSIGNHASH760(address(this), address(_wallet), 0, _data, _nonce, _gasPrice, _gasLimit);
        require(CHECKANDUPDATEUNIQUENESS912(_wallet, _nonce, signHash), "RM: Duplicate request");
        require(VERIFYDATA905(address(_wallet), _data), "RM: Target of _data != _wallet");
        uint256 requiredSignatures = GETREQUIREDSIGNATURES822(_wallet, _data);
        require(requiredSignatures * 65 == _signatures.length, "RM: Wrong number of signatures");
        require(requiredSignatures == 0 || VALIDATESIGNATURES88(_wallet, _data, signHash, _signatures), "RM: Invalid signatures");
        // The correctness of the refund is checked on the next line using an `if` instead of a `require`
        // in order to prevent a failing refund from being replayable in the future.
        if (VERIFYREFUND160(_wallet, _gasLimit, _gasPrice, requiredSignatures)) {
            // solium-disable-next-line security/no-call-value
            (success,) = address(this).call(_data);
            REFUND727(_wallet, startGas - gasleft(), _gasPrice, _gasLimit, requiredSignatures, msg.sender);
        }
        emit TRANSACTIONEXECUTED469(address(_wallet), success, signHash);
    }

                                                                                                      
    function GETNONCE650(BaseWallet _wallet) external view returns (uint256 nonce) {	//inject NONSTANDARD NAMING
        return relayer[address(_wallet)].nonce;
    }

                                                                                

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function GETSIGNHASH760(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value,
        bytes memory _data,
        uint256 _nonce,
        uint256 _gasPrice,
        uint256 _gasLimit
    )
        internal
        pure
        returns (bytes32)
    {
        return keccak256(
            abi.encodePacked(
                "\x19Ethereum Signed Message:\n32",
                keccak256(abi.encodePacked(byte(0x19), byte(0), _from, _to, _value, _data, _nonce, _gasPrice, _gasLimit))
        ));
    }

                                                                                                                                                                                                      
    function CHECKANDUPDATEUNIQUENESS912(BaseWallet _wallet, uint256 _nonce, bytes32 _signHash) internal returns (bool) {	//inject NONSTANDARD NAMING
        if (relayer[address(_wallet)].executedTx[_signHash] == true) {
            return false;
        }
        relayer[address(_wallet)].executedTx[_signHash] = true;
        return true;
    }

                                                                                                                                                                                                                                                            
    function CHECKANDUPDATENONCE610(BaseWallet _wallet, uint256 _nonce) internal returns (bool) {	//inject NONSTANDARD NAMING
        if (_nonce <= relayer[address(_wallet)].nonce) {
            return false;
        }
        uint256 nonceBlock = (_nonce & 0xffffffffffffffffffffffffffffffff00000000000000000000000000000000) >> 128;
        if (nonceBlock > block.number + blockbound832) {
            return false;
        }
        relayer[address(_wallet)].nonce = _nonce;
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function VALIDATESIGNATURES88(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        bytes32 _signHash,
        bytes memory _signatures,
        OwnerSignature _option
    )
        internal view returns (bool)
    {
        address lastSigner = address(0);
        address[] memory guardians;
        if (_option != OwnerSignature.Required || _signatures.length > 65) {
            guardians = guardianStorage.GETGUARDIANS145(_wallet); // guardians are only read if they may be needed
        }
        bool isGuardian;

        for (uint8 i = 0; i < _signatures.length / 65; i++) {
            address signer = RECOVERSIGNER633(_signHash, _signatures, i);

            if (i == 0) {
                if (_option == OwnerSignature.Required) {
                    // First signer must be owner
                    if (ISOWNER786(_wallet, signer)) {
                        continue;
                    }
                    return false;
                } else if (_option == OwnerSignature.Optional) {
                    // First signer can be owner
                    if (ISOWNER786(_wallet, signer)) {
                        continue;
                    }
                }
            }
            if (signer <= lastSigner) {
                return false; // Signers must be different
            }
            lastSigner = signer;
            (isGuardian, guardians) = GuardianUtils.ISGUARDIAN982(guardians, signer);
            if (!isGuardian) {
                return false;
            }
        }
        return true;
    }

                                                                                                                                                                                                                                                                   
    function RECOVERSIGNER633(bytes32 _signedHash, bytes memory _signatures, uint _index) internal pure returns (address) {	//inject NONSTANDARD NAMING
        uint8 v;
        bytes32 r;
        bytes32 s;
        // we jump 32 (0x20) as the first slot of bytes contains the length
        // we jump 65 (0x41) per signature
        // for v we load 32 bytes ending with v (the first 31 come from s) then apply a mask
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            r := mload(add(_signatures, add(0x20,mul(0x41,_index))))
            s := mload(add(_signatures, add(0x40,mul(0x41,_index))))
            v := and(mload(add(_signatures, add(0x41,mul(0x41,_index)))), 0xff)
        }
        require(v == 27 || v == 28); // solium-disable-line error-reason
        return ecrecover(_signedHash, v, r, s);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function REFUND727(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        uint _gasUsed,
        uint _gasPrice,
        uint _gasLimit,
        uint _signatures,
        address _relayer
    )
        internal
    {
        uint256 amount = 29292 + _gasUsed; // 21000 (transaction) + 7620 (execution of refund) + 672 to log the event + _gasUsed
        // only refund if gas price not null, more than 1 signatures, gas less than gasLimit
        if (_gasPrice > 0 && _signatures > 1 && amount <= _gasLimit) {
            if (_gasPrice > tx.gasprice) {
                amount = amount * tx.gasprice;
            } else {
                amount = amount * _gasPrice;
            }
            INVOKEWALLET849(address(_wallet), _relayer, amount, empty_bytes648);
        }
    }

                                                                                                                                                                                                                             
    function VERIFYREFUND160(BaseWallet _wallet, uint _gasUsed, uint _gasPrice, uint _signatures) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if (_gasPrice > 0 &&
            _signatures > 1 &&
            (address(_wallet).balance < _gasUsed * _gasPrice || _wallet.authorised(address(this)) == false)) {
            return false;
        }
        return true;
    }

                                                                          
    function FUNCTIONPREFIX840(bytes memory _data) internal pure returns (bytes4 prefix) {	//inject NONSTANDARD NAMING
        require(_data.length >= 4, "RM: Invalid functionPrefix");
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            prefix := mload(add(_data, 0x20))
        }
    }

                                                                                                                                                                                                                                          
    function VERIFYDATA905(address _wallet, bytes memory _data) private pure returns (bool) {	//inject NONSTANDARD NAMING
        require(_data.length >= 36, "RM: Invalid dataWallet");
        address dataWallet;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            //_data = {length:32}{sig:4}{_wallet:32}{...}
            dataWallet := mload(add(_data, 0x24))
        }
        return dataWallet == _wallet;
    }
}// Copyright (C) 2018  Argent Labs Ltd. <https://argent.xyz>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.





                                                                                                                                                                                                                                                                                                                                                                                                   
contract RecoveryManager is BaseModule, RelayerModuleV2 {

    bytes32 constant name791 = "RecoveryManager";	//inject NONSTANDARD NAMING

    bytes4 constant internal execute_recovery_prefix878 = bytes4(keccak256("executeRecovery(address,address)"));	//inject NONSTANDARD NAMING
    bytes4 constant internal finalize_recovery_prefix369 = bytes4(keccak256("finalizeRecovery(address)"));	//inject NONSTANDARD NAMING
    bytes4 constant internal cancel_recovery_prefix124 = bytes4(keccak256("cancelRecovery(address)"));	//inject NONSTANDARD NAMING
    bytes4 constant internal transfer_ownership_prefix852 = bytes4(keccak256("transferOwnership(address,address)"));	//inject NONSTANDARD NAMING

    struct RecoveryConfig {
        address recovery;
        uint64 executeAfter;
        uint32 guardianCount;
    }

    // Wallet specific storage
    mapping (address => RecoveryConfig) internal recoveryConfigs;

    // Recovery period
    uint256 public recoveryPeriod;
    // Lock period
    uint256 public lockPeriod;
    // Security period used for (non-recovery) ownership transfer
    uint256 public securityPeriod;
    // Security window used for (non-recovery) ownership transfer
    uint256 public securityWindow;
    // Location of the Guardian storage
    GuardianStorage public guardianStorage;

    // *************** Events *************************** //

    event RECOVERYEXECUTED109(address indexed wallet, address indexed _recovery, uint64 executeAfter);	//inject NONSTANDARD NAMING
    event RECOVERYFINALIZED790(address indexed wallet, address indexed _recovery);	//inject NONSTANDARD NAMING
    event RECOVERYCANCELED953(address indexed wallet, address indexed _recovery);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERED490(address indexed wallet, address indexed _newOwner);	//inject NONSTANDARD NAMING

    // *************** Modifiers ************************ //

                                                                             
    modifier ONLYWHENRECOVERY353(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(recoveryConfigs[address(_wallet)].executeAfter > 0, "RM: there must be an ongoing recovery");
        _;
    }

                                                                             
    modifier NOTWHENRECOVERY166(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(recoveryConfigs[address(_wallet)].executeAfter == 0, "RM: there cannot be an ongoing recovery");
        _;
    }

    // *************** Constructor ************************ //

    constructor(
        ModuleRegistry _registry,
        GuardianStorage _guardianStorage,
        uint256 _recoveryPeriod,
        uint256 _lockPeriod,
        uint256 _securityPeriod,
        uint256 _securityWindow
    )
        BaseModule(_registry, _guardianStorage, name791)
        public
    {
        require(_lockPeriod >= _recoveryPeriod && _recoveryPeriod >= _securityPeriod + _securityWindow, "RM: insecure security periods");
        guardianStorage = _guardianStorage;
        recoveryPeriod = _recoveryPeriod;
        lockPeriod = _lockPeriod;
        securityPeriod = _securityPeriod;
        securityWindow = _securityWindow;
    }

    // *************** External functions ************************ //

                                                                                                                                                                                                                                                                                                                                                                                                         
    function EXECUTERECOVERY705(BaseWallet _wallet, address _recovery) external ONLYEXECUTE879 NOTWHENRECOVERY166(_wallet) {	//inject NONSTANDARD NAMING
        require(_recovery != address(0), "RM: recovery address cannot be null");
        RecoveryConfig storage config = recoveryConfigs[address(_wallet)];
        config.recovery = _recovery;
        config.executeAfter = uint64(now + recoveryPeriod);
        config.guardianCount = uint32(guardianStorage.GUARDIANCOUNT144(_wallet));
        guardianStorage.SETLOCK911(_wallet, now + lockPeriod);
        emit RECOVERYEXECUTED109(address(_wallet), _recovery, config.executeAfter);
    }

                                                                                                                                                                                                                        
    function FINALIZERECOVERY445(BaseWallet _wallet) external ONLYWHENRECOVERY353(_wallet) {	//inject NONSTANDARD NAMING
        RecoveryConfig storage config = recoveryConfigs[address(_wallet)];
        require(uint64(now) > config.executeAfter, "RM: the recovery period is not over yet");
        _wallet.SETOWNER616(config.recovery);
        emit RECOVERYFINALIZED790(address(_wallet), config.recovery);
        guardianStorage.SETLOCK911(_wallet, 0);
        delete recoveryConfigs[address(_wallet)];
    }

                                                                                                                                                                                                         
    function CANCELRECOVERY320(BaseWallet _wallet) external ONLYEXECUTE879 ONLYWHENRECOVERY353(_wallet) {	//inject NONSTANDARD NAMING
        RecoveryConfig storage config = recoveryConfigs[address(_wallet)];
        emit RECOVERYCANCELED953(address(_wallet), config.recovery);
        guardianStorage.SETLOCK911(_wallet, 0);
        delete recoveryConfigs[address(_wallet)];
    }

                                                                                                                                                                                                                                                                                                                                             
    function TRANSFEROWNERSHIP202(BaseWallet _wallet, address _newOwner) external ONLYEXECUTE879 ONLYWHENUNLOCKED660(_wallet) {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "RM: new owner address cannot be null");
        _wallet.SETOWNER616(_newOwner);

        emit OWNERSHIPTRANSFERED490(address(_wallet), _newOwner);
    }

                                                                                                                            
    function GETRECOVERY975(BaseWallet _wallet) public view returns(address _address, uint64 _executeAfter, uint32 _guardianCount) {	//inject NONSTANDARD NAMING
        RecoveryConfig storage config = recoveryConfigs[address(_wallet)];
        return (config.recovery, config.executeAfter, config.guardianCount);
    }

    // *************** Implementation of RelayerModule methods ********************* //

    function VALIDATESIGNATURES88(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        bytes memory _data,
        bytes32 _signHash,
        bytes memory _signatures
    )
        internal view returns (bool)
    {
        bytes4 functionSignature = FUNCTIONPREFIX840(_data);
        if (functionSignature == transfer_ownership_prefix852) {
            return VALIDATESIGNATURES88(_wallet, _signHash, _signatures, OwnerSignature.Required);
        } else if (functionSignature == execute_recovery_prefix878) {
            return VALIDATESIGNATURES88(_wallet, _signHash, _signatures, OwnerSignature.Disallowed);
        } else if (functionSignature == cancel_recovery_prefix124) {
            return VALIDATESIGNATURES88(_wallet, _signHash, _signatures, OwnerSignature.Optional);
        }
    }

    function GETREQUIREDSIGNATURES822(BaseWallet _wallet, bytes memory _data) public view returns (uint256) {	//inject NONSTANDARD NAMING
        bytes4 methodId = FUNCTIONPREFIX840(_data);
        if (methodId == execute_recovery_prefix878) {
            uint walletGuardians = guardianStorage.GUARDIANCOUNT144(_wallet);
            require(walletGuardians > 0, "RM: no guardians set on wallet");
            return SafeMath.CEIL940(walletGuardians, 2);
        }
        if (methodId == finalize_recovery_prefix369) {
            return 0;
        }
        if (methodId == cancel_recovery_prefix124) {
            return SafeMath.CEIL940(recoveryConfigs[address(_wallet)].guardianCount + 1, 2);
        }
        if (methodId == transfer_ownership_prefix852) {
            uint majorityGuardians = SafeMath.CEIL940(guardianStorage.GUARDIANCOUNT144(_wallet), 2);
            return SafeMath.ADD802(majorityGuardians, 1);
        }
        revert("RM: unknown method");
    }
}