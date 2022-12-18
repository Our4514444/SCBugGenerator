/**
 *Submitted for verification at Etherscan.io on 2020-08-24
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;

interface SmartWalletChecker {
    function check(address) external view returns (bool);
}

contract SmartWalletWhitelist {
    
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => bool) public wallets;
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  address public dao;
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  address public checker;
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  address public future_checker;
    
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event ApproveWallet(address);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event RevokeWallet(address);
    
    constructor(address _dao) public {
        dao = _dao;
        wallets[0xF147b8125d2ef93FB6965Db97D6746952a133934] = true;
        emit ApproveWallet(0xF147b8125d2ef93FB6965Db97D6746952a133934);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    
    function commitSetChecker(address _checker) external {
        require(msg.sender == dao, "!dao");
        future_checker = _checker;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    
    function applySetChecker() external {
        require(msg.sender == dao, "!dao");
        checker = future_checker;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function approveWallet(address _wallet) public {
        require(msg.sender == dao, "!dao");
        wallets[_wallet] = true;
        
        emit ApproveWallet(_wallet);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    function revokeWallet(address _wallet) external {
        require(msg.sender == dao, "!dao");
        wallets[_wallet] = false;
        
        emit RevokeWallet(_wallet);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    function check(address _wallet) external view returns (bool) {
        bool _check = wallets[_wallet];
        if (_check) {
            return _check;
        } else {
            if (checker != address(0)) {
                return SmartWalletChecker(checker).check(_wallet);
            }
        }
        return false;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}