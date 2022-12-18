pragma solidity ^0.5.2;

// File: node_modules/openzeppelin-solidity/contracts/access/Roles.sol

/**
 * @title Roles
 * @dev Library for managing addresses assigned to a Role.
 */
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

    /**
     * @dev give an account access to this role
     */
    function add(Role storage role, address account) internal {
        require(account != address(0));
        require(!has(role, account));

        role.bearer[account] = true;
    }

    /**
     * @dev remove an account's access to this role
     */
    function remove(Role storage role, address account) internal {
        require(account != address(0));
        require(has(role, account));

        role.bearer[account] = false;
    }

    /**
     * @dev check if an account has this role
     * @return bool
     */
    function has(Role storage role, address account) internal view returns (bool) {
        require(account != address(0));
        return role.bearer[account];
    }
}

// File: contracts/Adminable.sol

contract Adminable {
    using Roles for Roles.Role;

  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event AdminAdded(address indexed account);
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  event AdminRemoved(address indexed account);

  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  Roles.Role private _admins;

    constructor () internal {
        _addAdmin(msg.sender);
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyAdmin() {
        require(isAdmin(msg.sender));
        _;
    }

    function isAdmin(address account) public view returns (bool) {
        return _admins.has(account);
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function addAdmin(address account) public onlyAdmin {
        _addAdmin(account);
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    function renounceAdmin() public {
        _removeAdmin(msg.sender);
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    function _addAdmin(address account) internal {
        _admins.add(account);
        emit AdminAdded(account);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function _removeAdmin(address account) internal {
        _admins.remove(account);
        emit AdminRemoved(account);
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
}

// File: contracts/Authorizable.sol

contract Authorizable is Adminable {

  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  address public authorizedAddress;
    
    modifier onlyAuthorized() {
        require(msg.sender == authorizedAddress);
        _;
    }

    function updateAuthorizedAddress(address _address) onlyAdmin public {
        authorizedAddress = _address;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

}

// File: contracts/SoarStorage.sol

/**
    @title Soar Storage
    @author Marek Tlacbaba (marek@soar.earth)
    @dev This smart contract behave as simple storage and can be 
    accessed only by authorized caller who is responsible for any
    checks and validation. The authorized caller can updated by 
    admins so it allows to update application logic 
    and keeping data and events untouched.
*/

//TODO
// use safeMath
contract SoarStorage is Authorizable {

    /**
    Status: 
        0 - unknown
        1 - created
        2 - updated
        3 - deleted
    */
    struct ListingObject {
        address owner;
        address sponsor;
        bytes12 geohash;
        mapping (address => mapping (bytes32 => uint )) sales;
        uint256 salesCount;
        uint8 status;
    }

  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  uint public counter = 0;
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  mapping (bytes32 => ListingObject) internal listings;

  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event Listing (
        bytes32 filehash,
        address indexed owner,
        address indexed sponsor,
        string previewUrl, 
        string url, 
        string pointWKT,
        bytes12 geohash, 
        string metadata
    );

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event ListingUpdated (
        bytes32 filehash,
        address indexed owner, 
        address indexed sponsor,
        string previewUrl, 
        string url, 
        string pointWKT,
        bytes12 geohash, 
        string metadata 
    );

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event ListingDeleted (
        bytes32 filehash,
        address indexed owner,
        address indexed sponsor
    );

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Sale(
        address indexed buyer, 
        bytes32 id, 
        address indexed owner, 
        address sponsor,
        bytes32 indexed filehash,
        uint price 
    );

    function putListing (
        bytes32 _filehash,
        address _owner,
        address _sponsor,
        string memory _previewUrl, 
        string memory _url, 
        string memory _pointWKT, 
        bytes12 _geohash, 
        string memory _metadata
    ) 
        public 
        onlyAuthorized 
    {
        listings[_filehash].owner = _owner;
        listings[_filehash].sponsor = _sponsor;
        listings[_filehash].geohash = _geohash;
        listings[_filehash].status = 1;
        counter++;
        emit Listing(
            _filehash, 
            _owner,
            _sponsor, 
            _previewUrl, 
            _url, 
            _pointWKT, 
            _geohash, 
            _metadata
        );
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function updateListing (
        bytes32 _filehash,
        address _owner,
        address _sponsor,
        string memory _previewUrl, 
        string memory _url, 
        string memory _pointWKT, 
        bytes12 _geohash, 
        string memory _metadata 
    ) 
        public 
        onlyAuthorized 
    {
        listings[_filehash].geohash = _geohash;
        listings[_filehash].status = 2;
        emit ListingUpdated(
            _filehash, 
            _owner,
            _sponsor, 
            _previewUrl, 
            _url, 
            _pointWKT, 
            _geohash, 
            _metadata
        );
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function deleteListing(
        bytes32 _filehash 
    )
        public 
        onlyAuthorized 
    {
        listings[_filehash].status = 3;
        counter--;
        emit ListingDeleted(_filehash, listings[_filehash].owner, listings[_filehash].sponsor);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function putSale (
        address _buyer,
        bytes32 _id,
        bytes32 _filehash, 
        uint256 _price
    ) 
        public 
        onlyAuthorized 
    {
        listings[_filehash].sales[_buyer][_id] = _price;
        listings[_filehash].salesCount++;
        emit Sale(_buyer, _id, listings[_filehash].owner, listings[_filehash].sponsor, _filehash, _price);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function getListingDetails(bytes32 _filehash, address _user, bytes32 _id) 
        public view
        returns (
            address owner_,
            address sponsor_,
            bytes12 geohash_,
            uint8 status_,
            uint256 sale_
        )
    {
        owner_ = listings[_filehash].owner;
        sponsor_ = listings[_filehash].sponsor;
        geohash_ = listings[_filehash].geohash;
        status_ = listings[_filehash].status;
        sale_ = listings[_filehash].sales[_user][_id];
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
}