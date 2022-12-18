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
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }

    function acceptOwnership() public {
        require(msg.sender == newOwner);

        emit OwnershipTransferred(owner, newOwner);

        owner = newOwner;

        newOwner = address(0);
    }
}


/*******************************************************************************
 * Modenero Db Contract
 */
contract ModeneroDb is Owned {
    /* Initialize all storage types. */
    mapping(bytes32 => address)    private addressStorage;
    mapping(bytes32 => bool)       private boolStorage;
    mapping(bytes32 => bytes)      private bytesStorage;
    mapping(bytes32 => int256)     private intStorage;
    mapping(bytes32 => string)     private stringStorage;
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
    function getAddress(bytes32 _key) public view returns (address) {	//inject PUBLIC FUNC TO EXTERNAL
        return addressStorage[_key];
    }

    /// @param _key The key for the record
    function getBool(bytes32 _key) public view returns (bool) {	//inject PUBLIC FUNC TO EXTERNAL
        return boolStorage[_key];
    }

    /// @param _key The key for the record
    function getBytes(bytes32 _key) public view returns (bytes memory) {	//inject PUBLIC FUNC TO EXTERNAL
        return bytesStorage[_key];
    }

    /// @param _key The key for the record
    function getInt(bytes32 _key) public view returns (int) {	//inject PUBLIC FUNC TO EXTERNAL
        return intStorage[_key];
    }

    /// @param _key The key for the record
    function getString(bytes32 _key) public view returns (string memory) {	//inject PUBLIC FUNC TO EXTERNAL
        return stringStorage[_key];
    }

    /// @param _key The key for the record
    function getUint(bytes32 _key) public view returns (uint) {	//inject PUBLIC FUNC TO EXTERNAL
        return uIntStorage[_key];
    }


    /***************************************************************************
     * Initialize all setter methods.
     */

    /// @param _key The key for the record
    function setAddress(bytes32 _key, address _value) onlyAuthByModenero public {	//inject PUBLIC FUNC TO EXTERNAL
        addressStorage[_key] = _value;
    }

    /// @param _key The key for the record
    function setBool(bytes32 _key, bool _value) onlyAuthByModenero public {	//inject PUBLIC FUNC TO EXTERNAL
        boolStorage[_key] = _value;
    }

    /// @param _key The key for the record
    function setBytes(bytes32 _key, bytes calldata _value) onlyAuthByModenero external {
        bytesStorage[_key] = _value;
    }

    /// @param _key The key for the record
    function setInt(bytes32 _key, int _value) onlyAuthByModenero public {	//inject PUBLIC FUNC TO EXTERNAL
        intStorage[_key] = _value;
    }

    /// @param _key The key for the record
    function setString(bytes32 _key, string calldata _value) onlyAuthByModenero external {
        stringStorage[_key] = _value;
    }

    /// @param _key The key for the record
    function setUint(bytes32 _key, uint _value) onlyAuthByModenero public {	//inject PUBLIC FUNC TO EXTERNAL
        uIntStorage[_key] = _value;
    }


    /***************************************************************************
     * Initialize all delete methods.
     */

    /// @param _key The key for the record
    function deleteAddress(bytes32 _key) onlyAuthByModenero public {	//inject PUBLIC FUNC TO EXTERNAL
        delete addressStorage[_key];
    }

    /// @param _key The key for the record
    function deleteBool(bytes32 _key) onlyAuthByModenero public {	//inject PUBLIC FUNC TO EXTERNAL
        delete boolStorage[_key];
    }

    /// @param _key The key for the record
    function deleteBytes(bytes32 _key) onlyAuthByModenero public {	//inject PUBLIC FUNC TO EXTERNAL
        delete bytesStorage[_key];
    }

    /// @param _key The key for the record
    function deleteInt(bytes32 _key) onlyAuthByModenero public {	//inject PUBLIC FUNC TO EXTERNAL
        delete intStorage[_key];
    }

    /// @param _key The key for the record
    function deleteString(bytes32 _key) onlyAuthByModenero public {	//inject PUBLIC FUNC TO EXTERNAL
        delete stringStorage[_key];
    }

    /// @param _key The key for the record
    function deleteUint(bytes32 _key) onlyAuthByModenero public {	//inject PUBLIC FUNC TO EXTERNAL
        delete uIntStorage[_key];
    }
}