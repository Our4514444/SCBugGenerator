                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface SmartWalletChecker {
    function CHECK158(address) external view returns (bool);	//inject NONSTANDARD NAMING
}

contract SmartWalletWhitelist {
    
    mapping(address => bool) public wallets;
    address public dao;
    address public checker;
    address public future_checker;
    
    event APPROVEWALLET784(address);	//inject NONSTANDARD NAMING
    event REVOKEWALLET319(address);	//inject NONSTANDARD NAMING
    
    constructor(address _dao) public {
        dao = _dao;
        wallets[0xF147b8125d2ef93FB6965Db97D6746952a133934] = true;
        emit APPROVEWALLET784(0xF147b8125d2ef93FB6965Db97D6746952a133934);
    }
    
    function COMMITSETCHECKER513(address _checker) external {	//inject NONSTANDARD NAMING
        require(msg.sender == dao, "!dao");
        future_checker = _checker;
    }
    
    function APPLYSETCHECKER698() external {	//inject NONSTANDARD NAMING
        require(msg.sender == dao, "!dao");
        checker = future_checker;
    }
    
    function APPROVEWALLET824(address _wallet) public {	//inject NONSTANDARD NAMING
        require(msg.sender == dao, "!dao");
        wallets[_wallet] = true;
        
        emit APPROVEWALLET784(_wallet);
    }
    function REVOKEWALLET823(address _wallet) external {	//inject NONSTANDARD NAMING
        require(msg.sender == dao, "!dao");
        wallets[_wallet] = false;
        
        emit REVOKEWALLET319(_wallet);
    }
    
    function CHECK158(address _wallet) external view returns (bool) {	//inject NONSTANDARD NAMING
        bool _check = wallets[_wallet];
        if (_check) {
            return _check;
        } else {
            if (checker != address(0)) {
                return SmartWalletChecker(checker).CHECK158(_wallet);
            }
        }
        return false;
    }
}