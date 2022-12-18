                                                                 

pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract AdminAuth {

    address public owner;
    address public admin;

    modifier ONLYOWNER710() {	//inject NONSTANDARD NAMING
        require(owner == msg.sender);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

                                                                                                                   
                                                            
    function SETADMINBYOWNER988(address _admin) public {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        require(_admin == address(0));

        admin = _admin;
    }

                                              
                                                                
    function SETADMINBYADMIN829(address _admin) public {	//inject NONSTANDARD NAMING
        require(msg.sender == admin);

        admin = _admin;
    }

                                             
                                          
    function SETOWNERBYADMIN564(address _owner) public {	//inject NONSTANDARD NAMING
        require(msg.sender == admin);

        owner = _owner;
    }
}


contract CompoundSubscriptions is AdminAuth {

    struct CompoundHolder {
        address user;
        uint128 minRatio;
        uint128 maxRatio;
        uint128 optimalRatioBoost;
        uint128 optimalRatioRepay;
        bool boostEnabled;
    }

    struct SubPosition {
        uint arrPos;
        bool subscribed;
    }

    CompoundHolder[] public subscribers;
    mapping (address => SubPosition) public subscribersPos;

    uint public changeIndex;

    event SUBSCRIBED387(address indexed user);	//inject NONSTANDARD NAMING
    event UNSUBSCRIBED101(address indexed user);	//inject NONSTANDARD NAMING
    event UPDATED154(address indexed user);	//inject NONSTANDARD NAMING
    event PARAMUPDATES637(address indexed user, uint128, uint128, uint128, uint128, bool);	//inject NONSTANDARD NAMING

                                                                            
                                                                                                    
                                                                     
                                                                     
                                                                   
                                                                   
                                                                  
    function SUBSCRIBE330(uint128 _minRatio, uint128 _maxRatio, uint128 _optimalBoost, uint128 _optimalRepay, bool _boostEnabled) external {	//inject NONSTANDARD NAMING

        // if boost is not enabled, set max ratio to max uint
        uint128 localMaxRatio = _boostEnabled ? _maxRatio : uint128(-1);
        require(CHECKPARAMS427(_minRatio, localMaxRatio), "Must be correct params");

        SubPosition storage subInfo = subscribersPos[msg.sender];

        CompoundHolder memory subscription = CompoundHolder({
                minRatio: _minRatio,
                maxRatio: localMaxRatio,
                optimalRatioBoost: _optimalBoost,
                optimalRatioRepay: _optimalRepay,
                user: msg.sender,
                boostEnabled: _boostEnabled
            });

        changeIndex++;

        if (subInfo.subscribed) {
            subscribers[subInfo.arrPos] = subscription;

            emit UPDATED154(msg.sender);
            emit PARAMUPDATES637(msg.sender, _minRatio, localMaxRatio, _optimalBoost, _optimalRepay, _boostEnabled);
        } else {
            subscribers.push(subscription);

            subInfo.arrPos = subscribers.length - 1;
            subInfo.subscribed = true;

            emit SUBSCRIBED387(msg.sender);
        }
    }

                                           
                                                          
    function UNSUBSCRIBE933() external {	//inject NONSTANDARD NAMING
        _UNSUBSCRIBE100(msg.sender);
    }

                                                        
    function CHECKPARAMS427(uint128 _minRatio, uint128 _maxRatio) internal pure returns (bool) {	//inject NONSTANDARD NAMING

        if (_minRatio > _maxRatio) {
            return false;
        }

        return true;
    }

                                                                 
    function _UNSUBSCRIBE100(address _user) internal {	//inject NONSTANDARD NAMING
        require(subscribers.length > 0, "Must have subscribers in the list");

        SubPosition storage subInfo = subscribersPos[_user];

        require(subInfo.subscribed, "Must first be subscribed");

        address lastOwner = subscribers[subscribers.length - 1].user;

        SubPosition storage subInfo2 = subscribersPos[lastOwner];
        subInfo2.arrPos = subInfo.arrPos;

        subscribers[subInfo.arrPos] = subscribers[subscribers.length - 1];
        delete subscribers[subscribers.length - 1];
        subscribers.length--;

        changeIndex++;
        subInfo.subscribed = false;
        subInfo.arrPos = 0;

        emit UNSUBSCRIBED101(msg.sender);
    }

    function ISSUBSCRIBED721(address _user) public view returns (bool) {	//inject NONSTANDARD NAMING
        SubPosition storage subInfo = subscribersPos[_user];

        return subInfo.subscribed;
    }

    function GETHOLDER847(address _user) public view returns (CompoundHolder memory) {	//inject NONSTANDARD NAMING
        SubPosition storage subInfo = subscribersPos[_user];

        return subscribers[subInfo.arrPos];
    }

                                                               
    function GETSUBSCRIBERS516() public view returns (CompoundHolder[] memory) {	//inject NONSTANDARD NAMING
        return subscribers;
    }

                                                               
    function GETSUBSCRIBERSBYPAGE258(uint _page, uint _perPage) public view returns (CompoundHolder[] memory) {	//inject NONSTANDARD NAMING
        CompoundHolder[] memory holders = new CompoundHolder[](_perPage);

        uint start = _page * _perPage;
        uint end = start + _perPage;

        uint count = 0;
        for (uint i=start; i<end; i++) {
            holders[count] = subscribers[i];
            count++;
        }

        return holders;
    }

                                                    

                                                   
    function UNSUBSCRIBEBYADMIN135(address _user) public ONLYOWNER710 {	//inject NONSTANDARD NAMING
        SubPosition storage subInfo = subscribersPos[_user];

        if (subInfo.subscribed) {
            _UNSUBSCRIBE100(_user);
        }
    }
}