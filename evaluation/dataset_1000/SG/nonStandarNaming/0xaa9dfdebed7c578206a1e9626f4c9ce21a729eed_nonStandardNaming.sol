pragma solidity ^0.5.2;

// File: node_modules/openzeppelin-solidity/contracts/access/Roles.sol

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD8(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS706(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE318(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS706(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS706(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

// File: contracts/Adminable.sol

contract Adminable {
    using Roles for Roles.Role;

    event ADMINADDED153(address indexed account);	//inject NONSTANDARD NAMING
    event ADMINREMOVED997(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _admins;

    constructor () internal {
        _ADDADMIN404(msg.sender);
    }

    modifier ONLYADMIN862() {	//inject NONSTANDARD NAMING
        require(ISADMIN480(msg.sender));
        _;
    }

    function ISADMIN480(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _admins.HAS706(account);
    }

    function ADDADMIN577(address account) public ONLYADMIN862 {	//inject NONSTANDARD NAMING
        _ADDADMIN404(account);
    }

    function RENOUNCEADMIN486() public {	//inject NONSTANDARD NAMING
        _REMOVEADMIN93(msg.sender);
    }

    function _ADDADMIN404(address account) internal {	//inject NONSTANDARD NAMING
        _admins.ADD8(account);
        emit ADMINADDED153(account);
    }

    function _REMOVEADMIN93(address account) internal {	//inject NONSTANDARD NAMING
        _admins.REMOVE318(account);
        emit ADMINREMOVED997(account);
    }
}

// File: contracts/Authorizable.sol

contract Authorizable is Adminable {

    address public authorizedAddress;
    
    modifier ONLYAUTHORIZED416() {	//inject NONSTANDARD NAMING
        require(msg.sender == authorizedAddress);
        _;
    }

    function UPDATEAUTHORIZEDADDRESS700(address _address) ONLYADMIN862 public {	//inject NONSTANDARD NAMING
        authorizedAddress = _address;
    }

}

// File: contracts/SoarStorage.sol

                                                                                                                                                                                                                                                                                                                                                                                 

//TODO
// use safeMath
contract SoarStorage is Authorizable {

                                                                                                           
    struct ListingObject {
        address owner;
        address sponsor;
        bytes12 geohash;
        mapping (address => mapping (bytes32 => uint )) sales;
        uint256 salesCount;
        uint8 status;
    }

    uint public counter = 0;
    mapping (bytes32 => ListingObject) internal listings;

    event LISTING974 (	//inject NONSTANDARD NAMING
        bytes32 filehash,
        address indexed owner,
        address indexed sponsor,
        string previewUrl, 
        string url, 
        string pointWKT,
        bytes12 geohash, 
        string metadata
    );

    event LISTINGUPDATED919 (	//inject NONSTANDARD NAMING
        bytes32 filehash,
        address indexed owner, 
        address indexed sponsor,
        string previewUrl, 
        string url, 
        string pointWKT,
        bytes12 geohash, 
        string metadata 
    );

    event LISTINGDELETED262 (	//inject NONSTANDARD NAMING
        bytes32 filehash,
        address indexed owner,
        address indexed sponsor
    );

    event SALE961(	//inject NONSTANDARD NAMING
        address indexed buyer, 
        bytes32 id, 
        address indexed owner, 
        address sponsor,
        bytes32 indexed filehash,
        uint price 
    );

    function PUTLISTING749 (	//inject NONSTANDARD NAMING
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
        ONLYAUTHORIZED416 
    {
        listings[_filehash].owner = _owner;
        listings[_filehash].sponsor = _sponsor;
        listings[_filehash].geohash = _geohash;
        listings[_filehash].status = 1;
        counter++;
        emit LISTING974(
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

    function UPDATELISTING401 (	//inject NONSTANDARD NAMING
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
        ONLYAUTHORIZED416 
    {
        listings[_filehash].geohash = _geohash;
        listings[_filehash].status = 2;
        emit LISTINGUPDATED919(
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

    function DELETELISTING988(	//inject NONSTANDARD NAMING
        bytes32 _filehash 
    )
        public 
        ONLYAUTHORIZED416 
    {
        listings[_filehash].status = 3;
        counter--;
        emit LISTINGDELETED262(_filehash, listings[_filehash].owner, listings[_filehash].sponsor);
    }

    function PUTSALE124 (	//inject NONSTANDARD NAMING
        address _buyer,
        bytes32 _id,
        bytes32 _filehash, 
        uint256 _price
    ) 
        public 
        ONLYAUTHORIZED416 
    {
        listings[_filehash].sales[_buyer][_id] = _price;
        listings[_filehash].salesCount++;
        emit SALE961(_buyer, _id, listings[_filehash].owner, listings[_filehash].sponsor, _filehash, _price);
    }

    function GETLISTINGDETAILS628(bytes32 _filehash, address _user, bytes32 _id) 	//inject NONSTANDARD NAMING
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
}