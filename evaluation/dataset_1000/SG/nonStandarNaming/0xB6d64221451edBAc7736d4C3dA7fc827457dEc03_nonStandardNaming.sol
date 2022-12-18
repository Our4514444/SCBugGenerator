                                                                 

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

pragma solidity ^0.5.4;

                                                                                                                                                                                                                                                  
interface Module {

                                                                                                                                                     
    function INIT417(BaseWallet _wallet) external;	//inject NONSTANDARD NAMING

                                                                                                                                               
    function ADDMODULE340(BaseWallet _wallet, Module _module) external;	//inject NONSTANDARD NAMING

                                                                                                                                                           
    function RECOVERTOKEN717(address _token) external;	//inject NONSTANDARD NAMING
}

                                                                                                                                                             
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

    event AUTHORISEDMODULE327(address indexed module, bool value);	//inject NONSTANDARD NAMING
    event ENABLEDSTATICCALL975(address indexed module, bytes4 indexed method);	//inject NONSTANDARD NAMING
    event INVOKED214(address indexed module, address indexed target, uint indexed value, bytes data);	//inject NONSTANDARD NAMING
    event RECEIVED625(uint indexed value, address indexed sender, bytes data);	//inject NONSTANDARD NAMING
    event OWNERCHANGED50(address owner);	//inject NONSTANDARD NAMING

                                                                             
    modifier MODULEONLY116 {	//inject NONSTANDARD NAMING
        require(authorised[msg.sender], "BW: msg.sender not an authorized module");
        _;
    }

                                                                                                                                                                                     
    function INIT417(address _owner, address[] calldata _modules) external {	//inject NONSTANDARD NAMING
        require(owner == address(0) && modules == 0, "BW: wallet already initialised");
        require(_modules.length > 0, "BW: construction requires at least 1 module");
        owner = _owner;
        modules = _modules.length;
        for (uint256 i = 0; i < _modules.length; i++) {
            require(authorised[_modules[i]] == false, "BW: module is already added");
            authorised[_modules[i]] = true;
            Module(_modules[i]).INIT417(this);
            emit AUTHORISEDMODULE327(_modules[i], true);
        }
        if (address(this).balance > 0) {
            emit RECEIVED625(address(this).balance, address(0), "");
        }
    }

                                                                                                                                                         
    function AUTHORISEMODULE120(address _module, bool _value) external MODULEONLY116 {	//inject NONSTANDARD NAMING
        if (authorised[_module] != _value) {
            emit AUTHORISEDMODULE327(_module, _value);
            if (_value == true) {
                modules += 1;
                authorised[_module] = true;
                Module(_module).INIT417(this);
            } else {
                modules -= 1;
                require(modules > 0, "BW: wallet must have at least one module");
                delete authorised[_module];
            }
        }
    }

                                                                                                                                                                                                                      
    function ENABLESTATICCALL639(address _module, bytes4 _method) external MODULEONLY116 {	//inject NONSTANDARD NAMING
        require(authorised[_module], "BW: must be an authorised module for static call");
        enabled[_method] = _module;
        emit ENABLEDSTATICCALL975(_module, _method);
    }

                                                                                                   
    function SETOWNER272(address _newOwner) external MODULEONLY116 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "BW: address cannot be null");
        owner = _newOwner;
        emit OWNERCHANGED50(_newOwner);
    }

                                                                                                                                                                                                                      
    function INVOKE679(address _target, uint _value, bytes calldata _data) external MODULEONLY116 returns (bytes memory _result) {	//inject NONSTANDARD NAMING
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
        emit INVOKED214(msg.sender, _target, _value, _data);
    }

                                                                                                                                                                                                                                                                                                     
    function() external payable {
        if (msg.data.length > 0) {
            address module = enabled[msg.sig];
            if (module == address(0)) {
                emit RECEIVED625(msg.value, msg.sender, msg.data);
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
}