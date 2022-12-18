                                                                 

pragma solidity ^0.5.9;

interface IRBAC {
  event ROLECREATED780(uint256 role);	//inject NONSTANDARD NAMING
  event BEARERADDED67(address indexed account, uint256 role);	//inject NONSTANDARD NAMING
  event BEARERREMOVED737(address indexed account, uint256 role);	//inject NONSTANDARD NAMING

  function ADDROOTROLE359(string calldata roleDescription) external returns(uint256);	//inject NONSTANDARD NAMING
  function REMOVEBEARER423(address account, uint256 role) external;	//inject NONSTANDARD NAMING
  function ADDROLE458(string calldata roleDescription, uint256 admin) external returns(uint256);	//inject NONSTANDARD NAMING
  function TOTALROLES296() external view returns(uint256);	//inject NONSTANDARD NAMING
  function HASROLE648(address account, uint256 role) external view returns(bool);	//inject NONSTANDARD NAMING
  function ADDBEARER640(address account, uint256 role) external;	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER249() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA538() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED678(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor (address _o) internal {
        require(_o != address(0), "Owner cannot be 0");
        _owner = _o;
        emit OWNERSHIPTRANSFERRED678(address(0), _o);
    }

                                                                     
    function OWNER816() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER477() {	//inject NONSTANDARD NAMING
        require(ISOWNER100(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER100() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER249() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP675() public ONLYOWNER477 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED678(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP835(address newOwner) public ONLYOWNER477 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP269(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP269(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED678(_owner, newOwner);
        _owner = newOwner;
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
    uint constant bulk_length830 = 50;	//inject NONSTANDARD NAMING
    address[] private users;

    AuctionDetails private auctionDetails;

                                                     
    mapping(uint => BidStatus) private bidStatuses;
    
                                                                
    mapping(address => BidList) private userBids;

    IRBAC private _rbacManager;
                                                                                
    modifier ONLYADMIN604() {	//inject NONSTANDARD NAMING
      require(ISADMIN278(), "RBAC: caller is not the admin");
      _;
    }

                                                                        
    function ISADMIN278() public view returns (bool) {	//inject NONSTANDARD NAMING
      return _rbacManager.HASROLE648(msg.sender, 0);
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

    //-----------------------------------------------------------------------------------
    // View Functions
    //-----------------------------------------------------------------------------------
    function GETAUCTIONDETAILS270() external view returns (uint bookingId, string memory name, string memory ticker, bool isClosed) {	//inject NONSTANDARD NAMING
        return (auctionDetails.bookingId, auctionDetails.name, auctionDetails.ticker, auctionDetails.isClosed);
    }

    function GETUSERSLEN251() external view returns(uint) {	//inject NONSTANDARD NAMING
        return users.length;
    }

    function GETUSERSITEM999(uint _ind) external view returns(address) {	//inject NONSTANDARD NAMING
        if( _ind >= users.length ) {
            return address(0);
        }
        return users[_ind];
    }

    function GETBIDLISTLEN690(address _user) external view returns(uint) {	//inject NONSTANDARD NAMING
        if (userBids[_user].timeInit==0) {
		return 0;
        }

        return userBids[_user].bids.length;
    }

    function GETBIDLISTHASH37(address _user, uint _ind) external view returns(uint) {	//inject NONSTANDARD NAMING
        if (userBids[_user].timeInit==0 || _ind >= userBids[_user].bids.length) {
		return 0;
        }

        return userBids[_user].bids[_ind];
    }

    function GETBIDLISTITEM860(address _user, uint _ind) external view returns(uint status, uint timeUpdate) {	//inject NONSTANDARD NAMING
        if (userBids[_user].timeInit==0 || _ind >= userBids[_user].bids.length) {
          return (0,0);
        }

        return (uint(bidStatuses[userBids[_user].bids[_ind]].status), bidStatuses[userBids[_user].bids[_ind]].timeUpdate);
    }

    //-----------------------------------------------------------------------------------
    // Transact Functions
    //-----------------------------------------------------------------------------------
    event BIDUPDATED349(uint indexed _hashBid, uint8 _newStatus);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                    
    function WRITEBID776(address _user, uint _hashBid, StatusName _newStatus) external returns (bool) {	//inject NONSTANDARD NAMING
        require(auctionDetails.isClosed == false, "Auction is already closed");
        require(ISADMIN278() || msg.sender == _user, "Only admin or bid owner can write bids");
        require(_newStatus == StatusName.NEW || _newStatus == StatusName.FUNDED || _newStatus == StatusName.CANCELED, "Wrong status id passed");
        require(_hashBid != 0, "Bid hash cannot be zero");

        return _WRITEBID549(_user, _hashBid, _newStatus);
    }

    function _WRITEBID549(address _user, uint _hashBid, StatusName _newStatus) internal returns (bool) {	//inject NONSTANDARD NAMING
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
                    return _SETBIDSTATE712(_hashBid, _newStatus);
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
        emit BIDUPDATED349(_hashBid, uint8(_newStatus));
        return true;
    }

    event BATCHBIDSUPDATED950(uint indexed bulkId, uint processedCount);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function WRITEBIDSBATCH188(uint _bulkId, address[] calldata _bidUsers, uint[] calldata _hashBids,	//inject NONSTANDARD NAMING
                 StatusName[] calldata _newStatuses) external ONLYADMIN604 returns (bool)
    {
        require(_bidUsers.length == _hashBids.length, "Input arrays should be of the same size");
        require(_bidUsers.length == _newStatuses.length, "Input arrays should be of the same size");
        require(auctionDetails.isClosed == false, "Auction is already closed");
        require(_bidUsers.length <= bulk_length830, "Array length can not be larger than BULK_LENGTH");

        uint _procCount = 0;

        uint[bulk_length830] memory _itemsToSave;
        uint _itemsLength = 0;

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
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
            _WRITEBID549(_bidUsers[_itemsToSave[k]], _hashBids[_itemsToSave[k]], _newStatuses[_itemsToSave[k]]);
        }

        emit BATCHBIDSUPDATED950(_bulkId, _procCount);
        return true;
    }

    event BIDSTATECHANGED826(uint indexed _hashBid, StatusName indexed _newStatus);	//inject NONSTANDARD NAMING

    function _SETBIDSTATE712( uint _hashBid, StatusName _newStatus ) internal returns (bool) {	//inject NONSTANDARD NAMING
        require(bidStatuses[_hashBid].status != StatusName.CANCELED, "Bid status is CANCELLED, no more changes allowed");

        // check allowed statuses transitions
        if (bidStatuses[_hashBid].status == StatusName.FUNDED && _newStatus==StatusName.NEW) {
          revert('Status change not allowed: from FUNDED to NEW');
        }

        bidStatuses[_hashBid].status = _newStatus;
        bidStatuses[_hashBid].userStatusUpdate = msg.sender;
        bidStatuses[_hashBid].timeUpdate = now;
        emit BIDSTATECHANGED826(_hashBid, _newStatus);
        return true;
    }

    event AUCTIONCLOSED952();	//inject NONSTANDARD NAMING

    // NOT EMITTED -- _err = 3; _errMsqg = "Closing status in blockchain does not correspond to action"
    function CLOSEAUCTION125(string calldata _name, string calldata _ticker) external ONLYADMIN604 returns (bool) {	//inject NONSTANDARD NAMING
        require(auctionDetails.isClosed==false, "Auction is already closed");
        auctionDetails.isClosed = true;
        auctionDetails.name = _name;
        auctionDetails.ticker = _ticker;
        emit AUCTIONCLOSED952();
        return true;
    }
}