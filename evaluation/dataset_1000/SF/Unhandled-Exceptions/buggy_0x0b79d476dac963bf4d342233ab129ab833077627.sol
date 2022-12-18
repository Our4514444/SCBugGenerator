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
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  address public owner;
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  address public newOwner;

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

    function acceptOwnership() public {
        require(msg.sender == newOwner);

        emit OwnershipTransferred(owner, newOwner);

        owner = newOwner;

        newOwner = address(0);
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
}


/*******************************************************************************
 * Modenero Db Contract
 */
contract ModeneroDb is Owned {
    /* Initialize all storage types. */
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  mapping(bytes32 => address)    private addressStorage;
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  mapping(bytes32 => bool)       private boolStorage;
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping(bytes32 => bytes)      private bytesStorage;
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  mapping(bytes32 => int256)     private intStorage;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping(bytes32 => string)     private stringStorage;
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
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
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

    /// @param _key The key for the record
    function getBool(bytes32 _key) external view returns (bool) {
        return boolStorage[_key];
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /// @param _key The key for the record
    function getBytes(bytes32 _key) external view returns (bytes memory) {
        return bytesStorage[_key];
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    /// @param _key The key for the record
    function getInt(bytes32 _key) external view returns (int) {
        return intStorage[_key];
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    /// @param _key The key for the record
    function getString(bytes32 _key) external view returns (string memory) {
        return stringStorage[_key];
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    /// @param _key The key for the record
    function getUint(bytes32 _key) external view returns (uint) {
        return uIntStorage[_key];
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }


    /***************************************************************************
     * Initialize all setter methods.
     */

    /// @param _key The key for the record
    function setAddress(bytes32 _key, address _value) onlyAuthByModenero external {
        addressStorage[_key] = _value;
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    /// @param _key The key for the record
    function setBool(bytes32 _key, bool _value) onlyAuthByModenero external {
        boolStorage[_key] = _value;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    /// @param _key The key for the record
    function setBytes(bytes32 _key, bytes calldata _value) onlyAuthByModenero external {
        bytesStorage[_key] = _value;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    /// @param _key The key for the record
    function setInt(bytes32 _key, int _value) onlyAuthByModenero external {
        intStorage[_key] = _value;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    /// @param _key The key for the record
    function setString(bytes32 _key, string calldata _value) onlyAuthByModenero external {
        stringStorage[_key] = _value;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    /// @param _key The key for the record
    function setUint(bytes32 _key, uint _value) onlyAuthByModenero external {
        uIntStorage[_key] = _value;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }


    /***************************************************************************
     * Initialize all delete methods.
     */

    /// @param _key The key for the record
    function deleteAddress(bytes32 _key) onlyAuthByModenero external {
        delete addressStorage[_key];
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    /// @param _key The key for the record
    function deleteBool(bytes32 _key) onlyAuthByModenero external {
        delete boolStorage[_key];
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    /// @param _key The key for the record
    function deleteBytes(bytes32 _key) onlyAuthByModenero external {
        delete bytesStorage[_key];
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    /// @param _key The key for the record
    function deleteInt(bytes32 _key) onlyAuthByModenero external {
        delete intStorage[_key];
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

    /// @param _key The key for the record
    function deleteString(bytes32 _key) onlyAuthByModenero external {
        delete stringStorage[_key];
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

    /// @param _key The key for the record
    function deleteUint(bytes32 _key) onlyAuthByModenero external {
        delete uIntStorage[_key];
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
}