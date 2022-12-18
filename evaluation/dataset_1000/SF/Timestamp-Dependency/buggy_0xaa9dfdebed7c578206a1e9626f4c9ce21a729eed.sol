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

  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event AdminAdded(address indexed account);
  uint256 bugv_tmstmp4 = block.timestamp;
  event AdminRemoved(address indexed account);

  address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  Roles.Role private _admins;

    constructor () internal {
        _addAdmin(msg.sender);
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    modifier onlyAdmin() {
        require(isAdmin(msg.sender));
        _;
    }

    function isAdmin(address account) public view returns (bool) {
        return _admins.has(account);
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function addAdmin(address account) public onlyAdmin {
        _addAdmin(account);
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function renounceAdmin() public {
        _removeAdmin(msg.sender);
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function _addAdmin(address account) internal {
        _admins.add(account);
        emit AdminAdded(account);
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    function _removeAdmin(address account) internal {
        _admins.remove(account);
        emit AdminRemoved(account);
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
}

// File: contracts/Authorizable.sol

contract Authorizable is Adminable {

  function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address public authorizedAddress;
    
    modifier onlyAuthorized() {
        require(msg.sender == authorizedAddress);
        _;
    }

    function updateAuthorizedAddress(address _address) onlyAdmin public {
        authorizedAddress = _address;
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

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

  address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  uint public counter = 0;
  function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (bytes32 => ListingObject) internal listings;

  uint256 bugv_tmstmp5 = block.timestamp;
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

  uint256 bugv_tmstmp2 = block.timestamp;
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

  uint256 bugv_tmstmp3 = block.timestamp;
  event ListingDeleted (
        bytes32 filehash,
        address indexed owner,
        address indexed sponsor
    );

  uint256 bugv_tmstmp1 = block.timestamp;
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
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

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
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

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
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

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
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

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
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}