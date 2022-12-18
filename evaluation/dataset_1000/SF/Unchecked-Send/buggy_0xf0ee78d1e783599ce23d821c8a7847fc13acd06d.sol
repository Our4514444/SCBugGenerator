pragma solidity ^0.5.2;

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  address private _owner;

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @return the address of the owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Allows the current owner to relinquish control of the contract.
     * @notice Renouncing to ownership will leave the contract without an owner.
     * It will not be possible to call the functions with the `onlyOwner`
     * modifier anymore.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}

// File: contracts/whitelisting/MgnOwnableMock.sol

contract MgnOwnableMock is Ownable {

    // user => amount
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint) public lockedTokenBalances;

    function lock(uint256 _amount, address _beneficiary) public onlyOwner {
        lockedTokenBalances[_beneficiary] = _amount;
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
}