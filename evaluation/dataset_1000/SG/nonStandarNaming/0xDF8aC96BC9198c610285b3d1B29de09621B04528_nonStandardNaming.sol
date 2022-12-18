                                                                 

pragma solidity ^0.5.4;

contract Owned {

    // The owner
    address public owner;

    event OWNERCHANGED108(address indexed _newOwner);	//inject NONSTANDARD NAMING

                                                                  
    modifier ONLYOWNER283 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

                                                                                                                                    
    function CHANGEOWNER753(address _newOwner) external ONLYOWNER283 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Address must not be null");
        owner = _newOwner;
        emit OWNERCHANGED108(_newOwner);
    }
}

contract LogicManager is Owned {

    event UPDATELOGICSUBMITTED996(address indexed logic, bool value);	//inject NONSTANDARD NAMING
    event UPDATELOGICCANCELLED547(address indexed logic);	//inject NONSTANDARD NAMING
    event UPDATELOGICDONE12(address indexed logic, bool value);	//inject NONSTANDARD NAMING

    struct pending {
        bool value;
        uint dueTime;
    }

    // The authorized logic modules
    mapping (address => bool) public authorized;

                                                                                                                                                                                
    address[] public authorizedLogics;

    // updated logics and their due time of becoming effective
    mapping (address => pending) public pendingLogics;

    // pending time before updated logics take effect
    struct pendingTime {
        uint curPendingTime;
        uint nextPendingTime;
        uint dueTime;
    }

    pendingTime public pt;

    // how many authorized logics
    uint public logicCount;

    constructor(address[] memory _initialLogics, uint256 _pendingTime) public
    {
        for (uint i = 0; i < _initialLogics.length; i++) {
            address logic = _initialLogics[i];
            authorized[logic] = true;
            logicCount += 1;
        }
        authorizedLogics = _initialLogics;

        pt.curPendingTime = _pendingTime;
        pt.nextPendingTime = _pendingTime;
        pt.dueTime = now;
    }

    function SUBMITUPDATEPENDINGTIME96(uint _pendingTime) external ONLYOWNER283 {	//inject NONSTANDARD NAMING
        pt.nextPendingTime = _pendingTime;
        pt.dueTime = pt.curPendingTime + now;
    }

    function TRIGGERUPDATEPENDINGTIME808() external {	//inject NONSTANDARD NAMING
        require(pt.dueTime <= now, "too early to trigger updatePendingTime");
        pt.curPendingTime = pt.nextPendingTime;
    }

    function ISAUTHORIZED238(address _logic) external view returns (bool) {	//inject NONSTANDARD NAMING
        return authorized[_logic];
    }

    function GETAUTHORIZEDLOGICS997() external view returns (address[] memory) {	//inject NONSTANDARD NAMING
        return authorizedLogics;
    }

    function SUBMITUPDATE844(address _logic, bool _value) external ONLYOWNER283 {	//inject NONSTANDARD NAMING
        pending storage p = pendingLogics[_logic];
        p.value = _value;
        p.dueTime = now + pt.curPendingTime;
        emit UPDATELOGICSUBMITTED996(_logic, _value);
    }

    function CANCELUPDATE140(address _logic) external ONLYOWNER283 {	//inject NONSTANDARD NAMING
        delete pendingLogics[_logic];
        emit UPDATELOGICCANCELLED547(_logic);
    }

    function TRIGGERUPDATELOGIC477(address _logic) external {	//inject NONSTANDARD NAMING
        pending memory p = pendingLogics[_logic];
        require(p.dueTime > 0, "pending logic not found");
        require(p.dueTime <= now, "too early to trigger updateLogic");
        UPDATELOGIC384(_logic, p.value);
        delete pendingLogics[_logic];
    }

    function UPDATELOGIC384(address _logic, bool _value) internal {	//inject NONSTANDARD NAMING
        if (authorized[_logic] != _value) {
            if(_value) {
                logicCount += 1;
                authorized[_logic] = true;
                authorizedLogics.push(_logic);
            }
            else {
                logicCount -= 1;
                require(logicCount > 0, "must have at least one logic module");
                delete authorized[_logic];
                REMOVELOGIC387(_logic);
            }
            emit UPDATELOGICDONE12(_logic, _value);
        }
    }

    function REMOVELOGIC387(address _logic) internal {	//inject NONSTANDARD NAMING
        uint len = authorizedLogics.length;
        address lastLogic = authorizedLogics[len - 1];
        if (_logic != lastLogic) {
            for (uint i = 0; i < len; i++) {
                 if (_logic == authorizedLogics[i]) {
                     authorizedLogics[i] = lastLogic;
                     break;
                 }
            }
        }
        authorizedLogics.length--;
    }
}