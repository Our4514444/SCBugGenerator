/**
 *Submitted for verification at Etherscan.io on 2020-10-21
*/

pragma solidity ^0.5.9;

interface IRBAC {
  event RoleCreated(uint256 role);
  event BearerAdded(address indexed account, uint256 role);
  event BearerRemoved(address indexed account, uint256 role);

  function addRootRole(string calldata roleDescription) external returns(uint256);
  function removeBearer(address account, uint256 role) external;
  function addRole(string calldata roleDescription, uint256 admin) external returns(uint256);
  function totalRoles() external view returns(uint256);
  function hasRole(address account, uint256 role) external view returns(bool);
  function addBearer(address account, uint256 role) external;
}

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
bool claimed_TOD14 = false;
address payable owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public payable {
        require (!claimed_TOD14);

        require(msg.sender == owner_TOD14);
        owner_TOD14.transfer(reward_TOD14);
        reward_TOD14 = msg.value;
    }

    function claimReward_TOD14(uint256 submission) public {
        require (!claimed_TOD14);
        require(submission < 10);

        msg.sender.transfer(reward_TOD14);
        claimed_TOD14 = true;
    }
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
address payable winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
address payable winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }
}

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
  bool claimed_TOD18 = false;
address payable owner_TOD18;
uint256 reward_TOD18;
function setReward_TOD18() public payable {
        require (!claimed_TOD18);

        require(msg.sender == owner_TOD18);
        owner_TOD18.transfer(reward_TOD18);
        reward_TOD18 = msg.value;
    }

    function claimReward_TOD18(uint256 submission) public {
        require (!claimed_TOD18);
        require(submission < 10);

        msg.sender.transfer(reward_TOD18);
        claimed_TOD18 = true;
    }
  address private _owner;

  address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor (address _o) internal {
        require(_o != address(0), "Owner cannot be 0");
        _owner = _o;
        emit OwnershipTransferred(address(0), _o);
    }
bool claimed_TOD36 = false;
address payable owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        msg.sender.transfer(reward_TOD36);
        claimed_TOD36 = true;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }
address payable winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Returns true if the caller is the current owner.
     */
    function isOwner() public view returns (bool) {
        return _msgSender() == _owner;
    }
bool claimed_TOD28 = false;
address payable owner_TOD28;
uint256 reward_TOD28;
function setReward_TOD28() public payable {
        require (!claimed_TOD28);

        require(msg.sender == owner_TOD28);
        owner_TOD28.transfer(reward_TOD28);
        reward_TOD28 = msg.value;
    }

    function claimReward_TOD28(uint256 submission) public {
        require (!claimed_TOD28);
        require(submission < 10);

        msg.sender.transfer(reward_TOD28);
        claimed_TOD28 = true;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
bool claimed_TOD38 = false;
address payable owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public payable {
        require (!claimed_TOD38);

        require(msg.sender == owner_TOD38);
        owner_TOD38.transfer(reward_TOD38);
        reward_TOD38 = msg.value;
    }

    function claimReward_TOD38(uint256 submission) public {
        require (!claimed_TOD38);
        require(submission < 10);

        msg.sender.transfer(reward_TOD38);
        claimed_TOD38 = true;
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
bool claimed_TOD40 = false;
address payable owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public payable {
        require (!claimed_TOD40);

        require(msg.sender == owner_TOD40);
        owner_TOD40.transfer(reward_TOD40);
        reward_TOD40 = msg.value;
    }

    function claimReward_TOD40(uint256 submission) public {
        require (!claimed_TOD40);
        require(submission < 10);

        msg.sender.transfer(reward_TOD40);
        claimed_TOD40 = true;
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
bool claimed_TOD32 = false;
address payable owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public payable {
        require (!claimed_TOD32);

        require(msg.sender == owner_TOD32);
        owner_TOD32.transfer(reward_TOD32);
        reward_TOD32 = msg.value;
    }

    function claimReward_TOD32(uint256 submission) public {
        require (!claimed_TOD32);
        require(submission < 10);

        msg.sender.transfer(reward_TOD32);
        claimed_TOD32 = true;
    }
}

contract vnxAuctionSC is Ownable {

    //-----------------------------------------------------------------------------------
    // Data Structures
    //-----------------------------------------------------------------------------------
    enum StatusName {NEW, FUNDED, CANCELED}

    struct AuctionDetails {
        uint bookingId;
        // name and ticker should remain empty until the closure (with close function) of the auction
        string name;
        string ticker;
        bool isClosed;
    }

    struct BidStatus {
        StatusName status; // 0: New; 1: Paid; 2: Canceled
        address user; // user who initiated a bid
        address userStatusUpdate; // user who updated the status to present state (can be either user or admin)
        uint timeUpdate;
    }

    struct BidList {
        uint[] bids;  // Bid hashes, the key to bidStatuses mapping
        uint timeInit;
    }

    //-----------------------------------------------------------------------------------
    // Variables, Instances, Mappings
    //-----------------------------------------------------------------------------------
  address payable winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }
  uint constant BULK_LENGTH = 50;
  address payable winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }
  address[] private users;

  address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
    }
  AuctionDetails private auctionDetails;

    /* Bid's uint(Hash) is a param to this mapping */
  bool claimed_TOD20 = false;
address payable owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public payable {
        require (!claimed_TOD20);

        require(msg.sender == owner_TOD20);
        owner_TOD20.transfer(reward_TOD20);
        reward_TOD20 = msg.value;
    }

    function claimReward_TOD20(uint256 submission) public {
        require (!claimed_TOD20);
        require(submission < 10);

        msg.sender.transfer(reward_TOD20);
        claimed_TOD20 = true;
    }
  mapping(uint => BidStatus) private bidStatuses;
    
    /* User who initiated the bids is a param to this mapping */
  bool claimed_TOD34 = false;
address payable owner_TOD34;
uint256 reward_TOD34;
function setReward_TOD34() public payable {
        require (!claimed_TOD34);

        require(msg.sender == owner_TOD34);
        owner_TOD34.transfer(reward_TOD34);
        reward_TOD34 = msg.value;
    }

    function claimReward_TOD34(uint256 submission) public {
        require (!claimed_TOD34);
        require(submission < 10);

        msg.sender.transfer(reward_TOD34);
        claimed_TOD34 = true;
    }
  mapping(address => BidList) private userBids;

  bool claimed_TOD2 = false;
address payable owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        msg.sender.transfer(reward_TOD2);
        claimed_TOD2 = true;
    }
  IRBAC private _rbacManager;
    /**
     * @dev Throws if called by any account other than the admin
     */
    modifier onlyAdmin() {
      require(isAdmin(), "RBAC: caller is not the admin");
      _;
    }

    /**
     * @dev Returns true if the caller is the admin role
     */
    function isAdmin() public view returns (bool) {
      return _rbacManager.hasRole(msg.sender, 0);
    }
address payable winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
    }

    //-----------------------------------------------------------------------------------
    // Smart contract Constructor
    //-----------------------------------------------------------------------------------
    // name and ticker should remain empty until the closure (with close function) of the auction
    constructor (uint _bookingId, address _manager) public Ownable(_manager) {
        require(_bookingId != 0, "Booking ID should not be zero");
        require(_manager != address(0), "RBAC manager should not be zero");

        _rbacManager = IRBAC(_manager);
        
        auctionDetails.bookingId = _bookingId;
    }
address payable winner_TOD15;
function play_TOD15(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD15 = msg.sender;
        }
    }

function getReward_TOD15() payable public{
     
       winner_TOD15.transfer(msg.value);
    }

    //-----------------------------------------------------------------------------------
    // View Functions
    //-----------------------------------------------------------------------------------
    function getAuctionDetails() external view returns (uint bookingId, string memory name, string memory ticker, bool isClosed) {
        return (auctionDetails.bookingId, auctionDetails.name, auctionDetails.ticker, auctionDetails.isClosed);
    }
bool claimed_TOD16 = false;
address payable owner_TOD16;
uint256 reward_TOD16;
function setReward_TOD16() public payable {
        require (!claimed_TOD16);

        require(msg.sender == owner_TOD16);
        owner_TOD16.transfer(reward_TOD16);
        reward_TOD16 = msg.value;
    }

    function claimReward_TOD16(uint256 submission) public {
        require (!claimed_TOD16);
        require(submission < 10);

        msg.sender.transfer(reward_TOD16);
        claimed_TOD16 = true;
    }

    function getUsersLen() external view returns(uint) {
        return users.length;
    }
address payable winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
    }

    function getUsersItem(uint _ind) external view returns(address) {
        if( _ind >= users.length ) {
            return address(0);
        }
        return users[_ind];
    }
bool claimed_TOD12 = false;
address payable owner_TOD12;
uint256 reward_TOD12;
function setReward_TOD12() public payable {
        require (!claimed_TOD12);

        require(msg.sender == owner_TOD12);
        owner_TOD12.transfer(reward_TOD12);
        reward_TOD12 = msg.value;
    }

    function claimReward_TOD12(uint256 submission) public {
        require (!claimed_TOD12);
        require(submission < 10);

        msg.sender.transfer(reward_TOD12);
        claimed_TOD12 = true;
    }

    function getBidListLen(address _user) external view returns(uint) {
        if (userBids[_user].timeInit==0) {
		return 0;
        }

        return userBids[_user].bids.length;
    }
address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }

    function getBidListHash(address _user, uint _ind) external view returns(uint) {
        if (userBids[_user].timeInit==0 || _ind >= userBids[_user].bids.length) {
		return 0;
        }

        return userBids[_user].bids[_ind];
    }
address payable winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }

    function getBidListItem(address _user, uint _ind) external view returns(uint status, uint timeUpdate) {
        if (userBids[_user].timeInit==0 || _ind >= userBids[_user].bids.length) {
          return (0,0);
        }

        return (uint(bidStatuses[userBids[_user].bids[_ind]].status), bidStatuses[userBids[_user].bids[_ind]].timeUpdate);
    }
bool claimed_TOD24 = false;
address payable owner_TOD24;
uint256 reward_TOD24;
function setReward_TOD24() public payable {
        require (!claimed_TOD24);

        require(msg.sender == owner_TOD24);
        owner_TOD24.transfer(reward_TOD24);
        reward_TOD24 = msg.value;
    }

    function claimReward_TOD24(uint256 submission) public {
        require (!claimed_TOD24);
        require(submission < 10);

        msg.sender.transfer(reward_TOD24);
        claimed_TOD24 = true;
    }

    //-----------------------------------------------------------------------------------
    // Transact Functions
    //-----------------------------------------------------------------------------------
  bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }
  event BidUpdated(uint indexed _hashBid, uint8 _newStatus);

    /**
    * IMPORTANT -- In case of value overflow no event is sent due to THROW (revert) -- this is rollback
    * @dev writes a bid to the blockchain
    * @param _user      The address of a user which has the corrersponding hashBid.
    * @param _hashBid   The hash of bid for the user to see/confirm his/her bid.
    * @param _newStatus The status of the bid.
    */
    function writeBid(address _user, uint _hashBid, StatusName _newStatus) external returns (bool) {
        require(auctionDetails.isClosed == false, "Auction is already closed");
        require(isAdmin() || msg.sender == _user, "Only admin or bid owner can write bids");
        require(_newStatus == StatusName.NEW || _newStatus == StatusName.FUNDED || _newStatus == StatusName.CANCELED, "Wrong status id passed");
        require(_hashBid != 0, "Bid hash cannot be zero");

        return _writeBid(_user, _hashBid, _newStatus);
    }
address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }

    function _writeBid(address _user, uint _hashBid, StatusName _newStatus) internal returns (bool) {
        if (bidStatuses[_hashBid].timeUpdate != 0) { // bid already exists, simply update
            if (bidStatuses[_hashBid].status==_newStatus) { // no new actual status applied: simply report success without rewrite
		return true;
            } else {
                // check if _user owns _hashBid
                bool isBidOwner = false;
                for (uint i = 0; i<userBids[_user].bids.length; i++) {
                    if (userBids[_user].bids[i]==_hashBid) {
                        isBidOwner = true;
                    }
                }

                if (!isBidOwner) {
                    return false;
                } else {
                    return _setBidState(_hashBid, _newStatus);
                }
            }
        }

        // Bid not exist yet
        if (userBids[_user].timeInit == 0) { // no such user registered yet
            users.push(_user);
            userBids[_user].timeInit = now;
        }

        userBids[_user].bids.push(_hashBid);
        BidStatus memory bidStatus;
        bidStatus.status = _newStatus;
        bidStatus.user = _user;
        bidStatus.userStatusUpdate = msg.sender;
        bidStatus.timeUpdate = now;
        bidStatuses[_hashBid] = bidStatus;
        emit BidUpdated(_hashBid, uint8(_newStatus));
        return true;
    }
bool claimed_TOD26 = false;
address payable owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
    }

  address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }
  event BatchBidsUpdated(uint indexed bulkId, uint processedCount);

    /**
    * @dev writes bids in a bulk to the blockchain
    * Bids state changes in the batch must be sorted by the time of their occurence in the system
    *
    * @param _bulkId The unique ID of the bulk which is calculated on the client side (by the admin) as a hash of some bulk bids' data
    * @param _bidUsers The array of addresses of users which have the corrersponding hashBid.
    * @param _hashBids The array of hashes of bids for users to see/confirm their bids.
    * @param _newStatuses The array of statuses of the bids.
    */
    function writeBidsBatch(uint _bulkId, address[] calldata _bidUsers, uint[] calldata _hashBids,
                 StatusName[] calldata _newStatuses) external onlyAdmin returns (bool)
    {
        require(_bidUsers.length == _hashBids.length, "Input arrays should be of the same size");
        require(_bidUsers.length == _newStatuses.length, "Input arrays should be of the same size");
        require(auctionDetails.isClosed == false, "Auction is already closed");
        require(_bidUsers.length <= BULK_LENGTH, "Array length can not be larger than BULK_LENGTH");

        uint _procCount = 0;

        uint[BULK_LENGTH] memory _itemsToSave;
        uint _itemsLength = 0;

	/**
	*  _writeBid behaviour (write new bid or update bid status) depends on all bid write transactions being committed to the blockchain before _writeBid is called 
	*  so it will not work correctly when the batch contains new bid and subsequent status changes of this bid in the same batch
	*  in which case _writeBid will erroneously consider state changes as new bids with the same hashes from the same user
	*
	*  The following loop makes sure that only one (the latest) transaction for each unique bid in the batch will pass through to _writeBid call
	*/
        for (uint j = 0; j<_bidUsers.length; j++) { // run through all input entries
            if (_bidUsers[j] == address(0) || _hashBids[j] == 0 ) {
                revert('Wrong input parameters');
            }

            for (uint k = 0; k < _itemsLength; k++) { // check previously saved entries
                if (_bidUsers[_itemsToSave[k]]==_bidUsers[j]) { // got the same user as current item
                    if (_hashBids[_itemsToSave[k]]==_hashBids[j]) { // got the same bid hash, update status
                        _itemsToSave[k] = j;
                        continue;
                    }
                }
            }
            _itemsToSave[_itemsLength++] = j;
        }

        for (uint k = 0; k < _itemsLength; k++) { // store filtered entries        
            _procCount = _procCount + 1;
            _writeBid(_bidUsers[_itemsToSave[k]], _hashBids[_itemsToSave[k]], _newStatuses[_itemsToSave[k]]);
        }

        emit BatchBidsUpdated(_bulkId, _procCount);
        return true;
    }
address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }

  address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }
  event BidStateChanged(uint indexed _hashBid, StatusName indexed _newStatus);

    function _setBidState( uint _hashBid, StatusName _newStatus ) internal returns (bool) {
        require(bidStatuses[_hashBid].status != StatusName.CANCELED, "Bid status is CANCELLED, no more changes allowed");

        // check allowed statuses transitions
        if (bidStatuses[_hashBid].status == StatusName.FUNDED && _newStatus==StatusName.NEW) {
          revert('Status change not allowed: from FUNDED to NEW');
        }

        bidStatuses[_hashBid].status = _newStatus;
        bidStatuses[_hashBid].userStatusUpdate = msg.sender;
        bidStatuses[_hashBid].timeUpdate = now;
        emit BidStateChanged(_hashBid, _newStatus);
        return true;
    }
bool claimed_TOD10 = false;
address payable owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }

  address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
  event AuctionClosed();

    // NOT EMITTED -- _err = 3; _errMsqg = "Closing status in blockchain does not correspond to action"
    function closeAuction(string calldata _name, string calldata _ticker) external onlyAdmin returns (bool) {
        require(auctionDetails.isClosed==false, "Auction is already closed");
        auctionDetails.isClosed = true;
        auctionDetails.name = _name;
        auctionDetails.ticker = _ticker;
        emit AuctionClosed();
        return true;
    }
address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }
}