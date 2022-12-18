                                                                 

pragma solidity ^0.5.4;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

                                                                                         
library SafeMath {

                                                                      
    function MUL906(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                               
    function DIV591(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                  
    function SUB363(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                
    function ADD939(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                       
    function MOD114(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }

                                              
    function CEIL942(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        if(a % b == 0) {
            return c;
        }
        else {
            return c + 1;
        }
    }
}

contract BaseLogic {

    bytes constant internal sign_hash_prefix705 = "\x19Ethereum Signed Message:\n32";	//inject NONSTANDARD NAMING

    mapping (address => uint256) keyNonce;
    AccountStorage public accountStorage;

    modifier ALLOWSELFCALLSONLY297() {	//inject NONSTANDARD NAMING
        require (msg.sender == address(this), "only internal call is allowed");
        _;
    }

    modifier ALLOWACCOUNTCALLSONLY649(Account _account) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(_account), "caller must be account");
        _;
    }

    event LOGICINITIALISED646(address wallet);	//inject NONSTANDARD NAMING

    // *************** Constructor ********************** //

    constructor(AccountStorage _accountStorage) public {
        accountStorage = _accountStorage;
    }

    // *************** Initialization ********************* //

    function INITACCOUNT89(Account _account) external ALLOWACCOUNTCALLSONLY649(_account){	//inject NONSTANDARD NAMING
        emit LOGICINITIALISED646(address(_account));
    }

    // *************** Getter ********************** //

    function GETKEYNONCE851(address _key) external view returns(uint256) {	//inject NONSTANDARD NAMING
        return keyNonce[_key];
    }

    // *************** Signature ********************** //

    function GETSIGNHASH564(bytes memory _data, uint256 _nonce) internal view returns(bytes32) {	//inject NONSTANDARD NAMING
        // use EIP 191
        // 0x1900 + this logic address + data + nonce of signing key
        bytes32 msgHash = keccak256(abi.encodePacked(byte(0x19), byte(0), address(this), _data, _nonce));
        bytes32 prefixedHash = keccak256(abi.encodePacked(sign_hash_prefix705, msgHash));
        return prefixedHash;
    }

    function VERIFYSIG597(address _signingKey, bytes memory _signature, bytes32 _signHash) internal pure {	//inject NONSTANDARD NAMING
        require(_signingKey != address(0), "invalid signing key");
        address recoveredAddr = RECOVER478(_signHash, _signature);
        require(recoveredAddr == _signingKey, "signature verification failed");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function RECOVER478(bytes32 hash, bytes memory signature) internal pure returns (address) {	//inject NONSTANDARD NAMING
        // Check the signature length
        if (signature.length != 65) {
            return (address(0));
        }

        // Divide the signature in r, s and v variables
        bytes32 r;
        bytes32 s;
        uint8 v;

        // ecrecover takes the signature parameters, and the only way to get them
        // currently is to use assembly.
        // solhint-disable-next-line no-inline-assembly
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }

        // EIP-2 still allows signature malleability for ecrecover(). Remove this possibility and make the signature
        // unique. Appendix F in the Ethereum Yellow paper (https://ethereum.github.io/yellowpaper/paper.pdf), defines
        // the valid range for s in (281): 0 < s < secp256k1n 1 2 + 1, and for v in (282): v 1 {27, 28}. Most
        // signatures from current libraries generate a unique signature with an s-value in the lower half order.
        //
        // If your library generates malleable signatures, such as s-values in the upper range, calculate a new s-value
        // with 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141 - s1 and flip v from 27 to 28 or
        // vice versa. If your library also generates signatures with 0/1 for v instead 27/28, add 27 to v to accept
        // these malleable signatures as well.
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            return address(0);
        }

        if (v != 27 && v != 28) {
            return address(0);
        }

        // If the signature is valid (and not malleable), return the signer address
        return ecrecover(hash, v, r, s);
    }

                                                                                                                                                                                                                                                         
    function GETSIGNERADDRESS7(bytes memory _b) internal pure returns (address _a) {	//inject NONSTANDARD NAMING
        require(_b.length >= 36, "invalid bytes");
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            let mask := 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            _a := and(mask, mload(add(_b, 36)))
            // b = {length:32}{method sig:4}{address:32}{...}
            // 36 is the offset of the first parameter of the data, if encoded properly.
            // 32 bytes for the length of the bytes array, and the first 4 bytes for the function signature.
            // 32 bytes is the length of the bytes array!!!!
        }
    }

    // get method id, first 4 bytes of data
    function GETMETHODID344(bytes memory _b) internal pure returns (bytes4 _a) {	//inject NONSTANDARD NAMING
        require(_b.length >= 4, "invalid data");
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            // 32 bytes is the length of the bytes array
            _a := mload(add(_b, 32))
        }
    }

    function CHECKKEYSTATUS283(address _account, uint256 _index) internal {	//inject NONSTANDARD NAMING
        // check operation key status
        if (_index > 0) {
            require(accountStorage.GETKEYSTATUS985(_account, _index) != 1, "frozen key");
        }
    }

    // _nonce is timestamp in microsecond(1/1000000 second)
    function CHECKANDUPDATENONCE942(address _key, uint256 _nonce) internal {	//inject NONSTANDARD NAMING
        require(_nonce > keyNonce[_key], "nonce too small");
        require(SafeMath.DIV591(_nonce, 1000000) <= now + 86400, "nonce too big"); // 86400=24*3600 seconds

        keyNonce[_key] = _nonce;
    }
}

contract Owned {

    // The owner
    address public owner;

    event OWNERCHANGED591(address indexed _newOwner);	//inject NONSTANDARD NAMING

                                                                  
    modifier ONLYOWNER109 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

                                                                                                                                    
    function CHANGEOWNER848(address _newOwner) external ONLYOWNER109 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Address must not be null");
        owner = _newOwner;
        emit OWNERCHANGED591(_newOwner);
    }
}

contract LogicManager is Owned {

    event UPDATELOGICSUBMITTED913(address indexed logic, bool value);	//inject NONSTANDARD NAMING
    event UPDATELOGICCANCELLED921(address indexed logic);	//inject NONSTANDARD NAMING
    event UPDATELOGICDONE179(address indexed logic, bool value);	//inject NONSTANDARD NAMING

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

    function SUBMITUPDATEPENDINGTIME279(uint _pendingTime) external ONLYOWNER109 {	//inject NONSTANDARD NAMING
        pt.nextPendingTime = _pendingTime;
        pt.dueTime = pt.curPendingTime + now;
    }

    function TRIGGERUPDATEPENDINGTIME616() external {	//inject NONSTANDARD NAMING
        require(pt.dueTime <= now, "too early to trigger updatePendingTime");
        pt.curPendingTime = pt.nextPendingTime;
    }

    function ISAUTHORIZED205(address _logic) external view returns (bool) {	//inject NONSTANDARD NAMING
        return authorized[_logic];
    }

    function GETAUTHORIZEDLOGICS165() external view returns (address[] memory) {	//inject NONSTANDARD NAMING
        return authorizedLogics;
    }

    function SUBMITUPDATE757(address _logic, bool _value) external ONLYOWNER109 {	//inject NONSTANDARD NAMING
        pending storage p = pendingLogics[_logic];
        p.value = _value;
        p.dueTime = now + pt.curPendingTime;
        emit UPDATELOGICSUBMITTED913(_logic, _value);
    }

    function CANCELUPDATE622(address _logic) external ONLYOWNER109 {	//inject NONSTANDARD NAMING
        delete pendingLogics[_logic];
        emit UPDATELOGICCANCELLED921(_logic);
    }

    function TRIGGERUPDATELOGIC86(address _logic) external {	//inject NONSTANDARD NAMING
        pending memory p = pendingLogics[_logic];
        require(p.dueTime > 0, "pending logic not found");
        require(p.dueTime <= now, "too early to trigger updateLogic");
        UPDATELOGIC773(_logic, p.value);
        delete pendingLogics[_logic];
    }

    function UPDATELOGIC773(address _logic, bool _value) internal {	//inject NONSTANDARD NAMING
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
                REMOVELOGIC903(_logic);
            }
            emit UPDATELOGICDONE179(_logic, _value);
        }
    }

    function REMOVELOGIC903(address _logic) internal {	//inject NONSTANDARD NAMING
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


contract AccountStorage {

    modifier ALLOWACCOUNTCALLSONLY649(Account _account) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(_account), "caller must be account");
        _;
    }

    modifier ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777(address payable _account) {	//inject NONSTANDARD NAMING
        require(LogicManager(Account(_account).manager()).ISAUTHORIZED205(msg.sender), "not an authorized logic");
        _;
    }

    struct KeyItem {
        address pubKey;
        uint256 status;
    }

    struct BackupAccount {
        address backup;
        uint256 effectiveDate;//means not effective until this timestamp
        uint256 expiryDate;//means effective until this timestamp
    }

    struct DelayItem {
        bytes32 hash;
        uint256 dueTime;
    }

    struct Proposal {
        bytes32 hash;
        address[] approval;
    }

    // account => quantity of operation keys (index >= 1)
    mapping (address => uint256) operationKeyCount;

    // account => index => KeyItem
    mapping (address => mapping(uint256 => KeyItem)) keyData;

    // account => index => backup account
    mapping (address => mapping(uint256 => BackupAccount)) backupData;

                                                                                                                                                                            
    mapping (address => mapping(bytes4 => DelayItem)) delayData;

    // client account => proposer account => proposed actionId => Proposal
    mapping (address => mapping(address => mapping(bytes4 => Proposal))) proposalData;

    // *************** keyCount ********************** //

    function GETOPERATIONKEYCOUNT843(address _account) external view returns(uint256) {	//inject NONSTANDARD NAMING
        return operationKeyCount[_account];
    }

    function INCREASEKEYCOUNT100(address payable _account) external ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777(_account) {	//inject NONSTANDARD NAMING
        operationKeyCount[_account] = operationKeyCount[_account] + 1;
    }

    // *************** keyData ********************** //

    function GETKEYDATA791(address _account, uint256 _index) public view returns(address) {	//inject NONSTANDARD NAMING
        KeyItem memory item = keyData[_account][_index];
        return item.pubKey;
    }

    function SETKEYDATA118(address payable _account, uint256 _index, address _key) external ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777(_account) {	//inject NONSTANDARD NAMING
        require(_key != address(0), "invalid _key value");
        KeyItem storage item = keyData[_account][_index];
        item.pubKey = _key;
    }

    // *************** keyStatus ********************** //

    function GETKEYSTATUS985(address _account, uint256 _index) external view returns(uint256) {	//inject NONSTANDARD NAMING
        KeyItem memory item = keyData[_account][_index];
        return item.status;
    }

    function SETKEYSTATUS502(address payable _account, uint256 _index, uint256 _status) external ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777(_account) {	//inject NONSTANDARD NAMING
        KeyItem storage item = keyData[_account][_index];
        item.status = _status;
    }

    // *************** backupData ********************** //

    function GETBACKUPADDRESS467(address _account, uint256 _index) external view returns(address) {	//inject NONSTANDARD NAMING
        BackupAccount memory b = backupData[_account][_index];
        return b.backup;
    }

    function GETBACKUPEFFECTIVEDATE454(address _account, uint256 _index) external view returns(uint256) {	//inject NONSTANDARD NAMING
        BackupAccount memory b = backupData[_account][_index];
        return b.effectiveDate;
    }

    function GETBACKUPEXPIRYDATE26(address _account, uint256 _index) external view returns(uint256) {	//inject NONSTANDARD NAMING
        BackupAccount memory b = backupData[_account][_index];
        return b.expiryDate;
    }

    function SETBACKUP188(address payable _account, uint256 _index, address _backup, uint256 _effective, uint256 _expiry)	//inject NONSTANDARD NAMING
        external
        ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777(_account)
    {
        BackupAccount storage b = backupData[_account][_index];
        b.backup = _backup;
        b.effectiveDate = _effective;
        b.expiryDate = _expiry;
    }

    function SETBACKUPEXPIRYDATE135(address payable _account, uint256 _index, uint256 _expiry)	//inject NONSTANDARD NAMING
        external
        ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777(_account)
    {
        BackupAccount storage b = backupData[_account][_index];
        b.expiryDate = _expiry;
    }

    function CLEARBACKUPDATA940(address payable _account, uint256 _index) external ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777(_account) {	//inject NONSTANDARD NAMING
        delete backupData[_account][_index];
    }

    // *************** delayData ********************** //

    function GETDELAYDATAHASH264(address payable _account, bytes4 _actionId) external view returns(bytes32) {	//inject NONSTANDARD NAMING
        DelayItem memory item = delayData[_account][_actionId];
        return item.hash;
    }

    function GETDELAYDATADUETIME291(address payable _account, bytes4 _actionId) external view returns(uint256) {	//inject NONSTANDARD NAMING
        DelayItem memory item = delayData[_account][_actionId];
        return item.dueTime;
    }

    function SETDELAYDATA183(address payable _account, bytes4 _actionId, bytes32 _hash, uint256 _dueTime) external ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777(_account) {	//inject NONSTANDARD NAMING
        DelayItem storage item = delayData[_account][_actionId];
        item.hash = _hash;
        item.dueTime = _dueTime;
    }

    function CLEARDELAYDATA632(address payable _account, bytes4 _actionId) external ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777(_account) {	//inject NONSTANDARD NAMING
        delete delayData[_account][_actionId];
    }

    // *************** proposalData ********************** //

    function GETPROPOSALDATAHASH105(address _client, address _proposer, bytes4 _actionId) external view returns(bytes32) {	//inject NONSTANDARD NAMING
        Proposal memory p = proposalData[_client][_proposer][_actionId];
        return p.hash;
    }

    function GETPROPOSALDATAAPPROVAL429(address _client, address _proposer, bytes4 _actionId) external view returns(address[] memory) {	//inject NONSTANDARD NAMING
        Proposal memory p = proposalData[_client][_proposer][_actionId];
        return p.approval;
    }

    function SETPROPOSALDATA391(address payable _client, address _proposer, bytes4 _actionId, bytes32 _hash, address _approvedBackup)	//inject NONSTANDARD NAMING
        external
        ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777(_client)
    {
        Proposal storage p = proposalData[_client][_proposer][_actionId];
        if (p.hash > 0) {
            if (p.hash == _hash) {
                for (uint256 i = 0; i < p.approval.length; i++) {
                    require(p.approval[i] != _approvedBackup, "backup already exists");
                }
                p.approval.push(_approvedBackup);
            } else {
                p.hash = _hash;
                p.approval.length = 0;
            }
        } else {
            p.hash = _hash;
            p.approval.push(_approvedBackup);
        }
    }

    function CLEARPROPOSALDATA272(address payable _client, address _proposer, bytes4 _actionId) external ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777(_client) {	//inject NONSTANDARD NAMING
        delete proposalData[_client][_proposer][_actionId];
    }


    // *************** init ********************** //
    function INITACCOUNT89(Account _account, address[] calldata _keys, address[] calldata _backups)	//inject NONSTANDARD NAMING
        external
        ALLOWACCOUNTCALLSONLY649(_account)
    {
        require(GETKEYDATA791(address(_account), 0) == address(0), "AccountStorage: account already initialized!");
        require(_keys.length > 0, "empty keys array");

        operationKeyCount[address(_account)] = _keys.length - 1;

        for (uint256 index = 0; index < _keys.length; index++) {
            address _key = _keys[index];
            require(_key != address(0), "_key cannot be 0x0");
            KeyItem storage item = keyData[address(_account)][index];
            item.pubKey = _key;
            item.status = 0;
        }

        // avoid backup duplication if _backups.length > 1
        // normally won't check duplication, in most cases only one initial backup when initialization
        if (_backups.length > 1) {
            address[] memory bkps = _backups;
            for (uint256 i = 0; i < _backups.length; i++) {
                for (uint256 j = 0; j < i; j++) {
                    require(bkps[j] != _backups[i], "duplicate backup");
                }
            }
        }

        for (uint256 index = 0; index < _backups.length; index++) {
            address _backup = _backups[index];
            require(_backup != address(0), "backup cannot be 0x0");
            require(_backup != address(_account), "cannot be backup of oneself");

            backupData[address(_account)][index] = BackupAccount(_backup, now, uint256(-1));
        }
    }
}

contract Account {

    // The implementation of the proxy
    address public implementation;

    // Logic manager
    address public manager;
    
    // The enabled static calls
    mapping (bytes4 => address) public enabled;

    event ENABLEDSTATICCALL400(address indexed module, bytes4 indexed method);	//inject NONSTANDARD NAMING
    event INVOKED488(address indexed module, address indexed target, uint indexed value, bytes data);	//inject NONSTANDARD NAMING
    event RECEIVED737(uint indexed value, address indexed sender, bytes data);	//inject NONSTANDARD NAMING

    event ACCOUNTINIT253(address indexed account);	//inject NONSTANDARD NAMING
    event MANAGERCHANGED259(address indexed mgr);	//inject NONSTANDARD NAMING

    modifier ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777 {	//inject NONSTANDARD NAMING
        require(LogicManager(manager).ISAUTHORIZED205(msg.sender), "not an authorized logic");
        _;
    }

    function INIT358(address _manager, address _accountStorage, address[] calldata _logics, address[] calldata _keys, address[] calldata _backups)	//inject NONSTANDARD NAMING
        external
    {
        require(manager == address(0), "Account: account already initialized");
        require(_manager != address(0) && _accountStorage != address(0), "Account: address is null");
        manager = _manager;

        for (uint i = 0; i < _logics.length; i++) {
            address logic = _logics[i];
            require(LogicManager(manager).ISAUTHORIZED205(logic), "must be authorized logic");

            BaseLogic(logic).INITACCOUNT89(this);
        }

        AccountStorage(_accountStorage).INITACCOUNT89(this, _keys, _backups);

        emit ACCOUNTINIT253(address(this));
    }

    function INVOKE587(address _target, uint _value, bytes calldata _data)	//inject NONSTANDARD NAMING
        external
        ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777
        returns (bytes memory _res)
    {
        bool success;
        // solium-disable-next-line security/no-call-value
        (success, _res) = _target.call.value(_value)(_data);
        require(success, "call to target failed");
        emit INVOKED488(msg.sender, _target, _value, _data);
    }

                                                                                                                                                                                                                
    function ENABLESTATICCALL287(address _module, bytes4 _method) external ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777 {	//inject NONSTANDARD NAMING
        enabled[_method] = _module;
        emit ENABLEDSTATICCALL400(_module, _method);
    }

    function CHANGEMANAGER896(address _newMgr) external ALLOWAUTHORIZEDLOGICCONTRACTSCALLSONLY777 {	//inject NONSTANDARD NAMING
        require(_newMgr != address(0), "address cannot be null");
        require(_newMgr != manager, "already changed");
        manager = _newMgr;
        emit MANAGERCHANGED259(_newMgr);
    }

                                                                                                                                                                                                                                                                                                      
    function() external payable {
        if(msg.data.length > 0) {
            address logic = enabled[msg.sig];
            if(logic == address(0)) {
                emit RECEIVED737(msg.value, msg.sender, msg.data);
            }
            else {
                require(LogicManager(manager).ISAUTHORIZED205(logic), "must be an authorized logic for static call");
                // solium-disable-next-line security/no-inline-assembly
                assembly {
                    calldatacopy(0, 0, calldatasize())
                    let result := staticcall(gas, logic, 0, calldatasize(), 0, 0)
                    returndatacopy(0, 0, returndatasize())
                    switch result
                    case 0 {revert(0, returndatasize())}
                    default {return (0, returndatasize())}
                }
            }
        }
    }
}