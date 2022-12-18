/**
 *Submitted for verification at Etherscan.io on 2019-12-07
*/

pragma solidity ^0.5.10;

/*******************************************************************************
 *
 * Copyright (c) 2019 Modenero Corp.
 * Released under the MIT License.
 *
 * ModeneroDb - An eternal database, providing a sustainable storage solution
 *              for use throughout the upgrade lifecycle of managing contracts.
 *
 * Version 19.12.7
 *
 * https://modenero.com
 * support@modenero.com
 */


/*******************************************************************************
 * Owned contract
 */
contract Owned {
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  address public newOwner;

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function acceptOwnership() public {
        require(msg.sender == newOwner);

        emit OwnershipTransferred(owner, newOwner);

        owner = newOwner;

        newOwner = address(0);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
}


/*******************************************************************************
 * Modenero Db Contract
 */
contract ModeneroDb is Owned {
    /* Initialize all storage types. */
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  mapping(bytes32 => address)    private addressStorage;
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  mapping(bytes32 => bool)       private boolStorage;
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  mapping(bytes32 => bytes)      private bytesStorage;
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  mapping(bytes32 => int256)     private intStorage;
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  mapping(bytes32 => string)     private stringStorage;
  function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  mapping(bytes32 => uint256)    private uIntStorage;

    /**
     * @dev Only allow access from the latest version of a Modenero contract
     *      or authorized Modnenero administrator.
     */
    modifier onlyAuthByModenero() {
        /***********************************************************************
         * The owner is only allowed to set the authorized contracts upon
         * deployment, to register the initial contracts, afterwards their
         * direct access is permanently disabled.
         */
        if (msg.sender == owner) {
            /* Verify owner's write access has not already been disabled. */
            require(boolStorage[keccak256(
                abi.encodePacked('owner.auth.disabled'))] != true);
        } else {
            /* Verify write access is only permitted to authorized accounts. */
            require(boolStorage[keccak256(
                abi.encodePacked(msg.sender, '.has.auth'))] == true);
        }

        _;      // function code is inserted here
    }

    /***************************************************************************
     * Initialize all getter methods.
     */

    /// @param _key The key for the record
    function getAddress(bytes32 _key) external view returns (address) {
        return addressStorage[_key];
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function getBool(bytes32 _key) external view returns (bool) {
        return boolStorage[_key];
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function getBytes(bytes32 _key) external view returns (bytes memory) {
        return bytesStorage[_key];
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function getInt(bytes32 _key) external view returns (int) {
        return intStorage[_key];
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function getString(bytes32 _key) external view returns (string memory) {
        return stringStorage[_key];
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function getUint(bytes32 _key) external view returns (uint) {
        return uIntStorage[_key];
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}


    /***************************************************************************
     * Initialize all setter methods.
     */

    /// @param _key The key for the record
    function setAddress(bytes32 _key, address _value) onlyAuthByModenero external {
        addressStorage[_key] = _value;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function setBool(bytes32 _key, bool _value) onlyAuthByModenero external {
        boolStorage[_key] = _value;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function setBytes(bytes32 _key, bytes calldata _value) onlyAuthByModenero external {
        bytesStorage[_key] = _value;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function setInt(bytes32 _key, int _value) onlyAuthByModenero external {
        intStorage[_key] = _value;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function setString(bytes32 _key, string calldata _value) onlyAuthByModenero external {
        stringStorage[_key] = _value;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function setUint(bytes32 _key, uint _value) onlyAuthByModenero external {
        uIntStorage[_key] = _value;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}


    /***************************************************************************
     * Initialize all delete methods.
     */

    /// @param _key The key for the record
    function deleteAddress(bytes32 _key) onlyAuthByModenero external {
        delete addressStorage[_key];
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function deleteBool(bytes32 _key) onlyAuthByModenero external {
        delete boolStorage[_key];
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function deleteBytes(bytes32 _key) onlyAuthByModenero external {
        delete bytesStorage[_key];
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function deleteInt(bytes32 _key) onlyAuthByModenero external {
        delete intStorage[_key];
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function deleteString(bytes32 _key) onlyAuthByModenero external {
        delete stringStorage[_key];
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _key The key for the record
    function deleteUint(bytes32 _key) onlyAuthByModenero external {
        delete uIntStorage[_key];
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
}