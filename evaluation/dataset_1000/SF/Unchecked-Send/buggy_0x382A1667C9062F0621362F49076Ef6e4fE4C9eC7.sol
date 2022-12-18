/**
 *Submitted for verification at Etherscan.io on 2020-08-22
*/

pragma solidity 0.5.0;

contract Proxy {
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  address private targetAddress;

  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  address private admin;
    constructor() public {
        targetAddress = 0xA05a9800f6F6D34aB877550d46585Abfc8e84899;
        admin = msg.sender;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function setTargetAddress(address _address) public {
        require(msg.sender==admin , "Admin only function");
        require(_address != address(0));
        targetAddress = _address;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    function getContAdr() public view returns (address) {
        require(msg.sender==admin , "Admin only function");
        return targetAddress;
        
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
    function () external payable {
        address contractAddr = targetAddress;
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, contractAddr, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}