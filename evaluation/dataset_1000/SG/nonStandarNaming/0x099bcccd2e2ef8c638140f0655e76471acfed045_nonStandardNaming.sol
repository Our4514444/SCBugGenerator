pragma solidity ^0.5.7;

contract Ownable {
    address public owner;
    
    event SETOWNER432(address _owner);	//inject NONSTANDARD NAMING

    modifier ONLYOWNER436() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        emit SETOWNER432(msg.sender);
        owner = msg.sender; 
    }

                                                                                                                 
    function SETOWNER930(address _to) external ONLYOWNER436 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        emit SETOWNER432(_to);
        owner = _to;
        return true;
    } 
}

interface Oracle {
    function GETRATE394(bytes32 currency, bytes calldata data) external returns (uint256, uint256);	//inject NONSTANDARD NAMING
}

library SafeCast {
    function TOUINT8151(uint256 _v) internal pure returns (uint8) {	//inject NONSTANDARD NAMING
        require(_v < 2 ** 8, "uint8 overflow");
        return uint8(_v);
    }

    function TOUINT40163(uint256 _v) internal pure returns (uint40) {	//inject NONSTANDARD NAMING
        require(_v < 2 ** 40, "uint40 overflow");
        return uint40(_v);
    }

    function TOUINT208765(uint256 _v) internal pure returns (uint208) {	//inject NONSTANDARD NAMING
        require(_v < 2 ** 208, "uint208 overflow");
        return uint208(_v);
    }
}

contract SimpleOracle is Ownable {
    using SafeCast for uint256;

    event DELEGATEDCALL124(	//inject NONSTANDARD NAMING
        address requester,
        address to
    );

    event DELIVEREDRATE166(	//inject NONSTANDARD NAMING
        address requester,
        bytes32 currency,
        uint256 deliverTimestamp,
        uint256 rate,
        uint256 decimals
    );

    event UPDATEDRATE815(	//inject NONSTANDARD NAMING
        address delegate,
        bytes32 currency,
        uint256 timestamp,
        uint256 rate,
        uint256 decimals
    );
    
    event SETEXPIRATIONTIME828(uint256 _time);	//inject NONSTANDARD NAMING
    event SETURL480(string _url);	//inject NONSTANDARD NAMING
    event SETFALLBACK538(address _fallback);	//inject NONSTANDARD NAMING
    event SETDELEGATE54(address _delegate);	//inject NONSTANDARD NAMING

    Oracle public fallback;
    address public delegate;
    uint256 public expiration = 6 hours;

    mapping(bytes32 => Rate) public rates;

    string private iurl;

    struct Rate {
        uint8 decimals;
        uint40 timestamp; 
        uint208 value;
    }

    modifier DELEGATEOROWNER595() {	//inject NONSTANDARD NAMING
        require(msg.sender == delegate || msg.sender == owner, "Not authorized");
        _;
    }

    function URL687() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return iurl;
    }

    function SETEXPIRATIONTIME207(uint256 _time) external ONLYOWNER436 {	//inject NONSTANDARD NAMING
        expiration = _time;
        emit SETEXPIRATIONTIME828(_time);
    }

    function SETURL517(string calldata _url) external ONLYOWNER436 {	//inject NONSTANDARD NAMING
        iurl = _url;
        emit SETURL480(_url);
    }

    function SETFALLBACK216(Oracle _fallback) external ONLYOWNER436 {	//inject NONSTANDARD NAMING
        fallback = _fallback;
        emit SETFALLBACK538(address(_fallback));
    }

    function SETDELEGATE860(address _delegate) external ONLYOWNER436 {	//inject NONSTANDARD NAMING
        delegate = _delegate;
        emit SETDELEGATE54(_delegate);
    }
    
    function UPDATERATE173(	//inject NONSTANDARD NAMING
        bytes32 _currency,
        uint256 _value,
        uint256 _timestamp,
        uint256 _decimals
    ) external DELEGATEOROWNER595 {
        require(_timestamp <= block.timestamp, "Future rate");
        require(_timestamp + expiration > block.timestamp, "Rate expired");

        rates[_currency] = Rate(
            _decimals.TOUINT8151(),
            _timestamp.TOUINT40163(),
            _value.TOUINT208765()
        );

        emit UPDATEDRATE815(
            msg.sender,
            _currency,
            _timestamp,
            _value,
            _decimals
        );
    }

    function ISEXPIRED109(uint256 timestamp) internal view returns (bool) {	//inject NONSTANDARD NAMING
        return timestamp <= now - expiration;
    }

    function GETRATE394(bytes32 _currency, bytes calldata _data) external returns (uint256, uint256) {	//inject NONSTANDARD NAMING
        if (address(fallback) != address(0)) {
            emit DELEGATEDCALL124(msg.sender, address(fallback));
            return fallback.GETRATE394(_currency, _data);
        }

        Rate memory rate = rates[_currency];
        require(rate.timestamp + expiration > block.timestamp);
        emit DELIVEREDRATE166(msg.sender, _currency, rate.timestamp, rate.value, rate.decimals);
        return (rate.value, rate.decimals);
    }
}