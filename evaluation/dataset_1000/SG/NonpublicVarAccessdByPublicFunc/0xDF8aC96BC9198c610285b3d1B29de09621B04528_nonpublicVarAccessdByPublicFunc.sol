/**
 *Submitted for verification at Etherscan.io on 2020-01-14
*/

pragma solidity ^0.5.4;

contract Owned {

    // The owner
    address internal owner;

    event OwnerChanged(address indexed _newOwner);

    /**
     * @dev Throws if the sender is not the owner.
     */
    modifier onlyOwner {
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    /**
     * @dev Lets the owner transfer ownership of the contract to a new owner.
     * @param _newOwner The new owner.
     */
    function changeOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Address must not be null");
        owner = _newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit OwnerChanged(_newOwner);
    }
}

contract LogicManager is Owned {

    event UpdateLogicSubmitted(address indexed logic, bool value);
    event UpdateLogicCancelled(address indexed logic);
    event UpdateLogicDone(address indexed logic, bool value);

    struct pending {
        bool value;
        uint dueTime;
    }

    // The authorized logic modules
    mapping (address => bool) internal authorized;

    /*
    array
    index 0: AccountLogic address
          1: TransferLogic address
          2: DualsigsLogic address
          3: DappLogic address
          4: ...
     */
    address[] internal authorizedLogics;

    // updated logics and their due time of becoming effective
    mapping (address => pending) internal pendingLogics;

    // pending time before updated logics take effect
    struct pendingTime {
        uint curPendingTime;
        uint nextPendingTime;
        uint dueTime;
    }

    pendingTime internal pt;

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

    function submitUpdatePendingTime(uint _pendingTime) external onlyOwner {
        pt.nextPendingTime = _pendingTime;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        pt.dueTime = pt.curPendingTime + now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function triggerUpdatePendingTime() external {
        require(pt.dueTime <= now, "too early to trigger updatePendingTime");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        pt.curPendingTime = pt.nextPendingTime;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function isAuthorized(address _logic) external view returns (bool) {
        return authorized[_logic];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getAuthorizedLogics() external view returns (address[] memory) {
        return authorizedLogics;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function submitUpdate(address _logic, bool _value) external onlyOwner {
        pending storage p = pendingLogics[_logic];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        p.value = _value;
        p.dueTime = now + pt.curPendingTime;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit UpdateLogicSubmitted(_logic, _value);
    }

    function cancelUpdate(address _logic) external onlyOwner {
        delete pendingLogics[_logic];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit UpdateLogicCancelled(_logic);
    }

    function triggerUpdateLogic(address _logic) external {
        pending memory p = pendingLogics[_logic];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(p.dueTime > 0, "pending logic not found");
        require(p.dueTime <= now, "too early to trigger updateLogic");
        updateLogic(_logic, p.value);
        delete pendingLogics[_logic];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function updateLogic(address _logic, bool _value) internal {
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
                removeLogic(_logic);
            }
            emit UpdateLogicDone(_logic, _value);
        }
    }

    function removeLogic(address _logic) internal {
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