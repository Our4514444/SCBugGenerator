// File: contracts/EToken2Interface.sol

pragma solidity 0.5.8;


contract RegistryICAPInterface {
    function PARSE686(bytes32 _icap) public view returns(address, bytes32, bool);	//inject NONSTANDARD NAMING
    function INSTITUTIONS678(bytes32 _institution) public view returns(address);	//inject NONSTANDARD NAMING
}


contract EToken2Interface {
    function REGISTRYICAP249() public view returns(RegistryICAPInterface);	//inject NONSTANDARD NAMING
    function BASEUNIT277(bytes32 _symbol) public view returns(uint8);	//inject NONSTANDARD NAMING
    function DESCRIPTION703(bytes32 _symbol) public view returns(string memory);	//inject NONSTANDARD NAMING
    function OWNER256(bytes32 _symbol) public view returns(address);	//inject NONSTANDARD NAMING
    function ISOWNER943(address _owner, bytes32 _symbol) public view returns(bool);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY869(bytes32 _symbol) public view returns(uint);	//inject NONSTANDARD NAMING
    function BALANCEOF1000(address _holder, bytes32 _symbol) public view returns(uint);	//inject NONSTANDARD NAMING
    function ISLOCKED572(bytes32 _symbol) public view returns(bool);	//inject NONSTANDARD NAMING

    function ISSUEASSET109(	//inject NONSTANDARD NAMING
        bytes32 _symbol,
        uint _value,
        string memory _name,
        string memory _description,
        uint8 _baseUnit,
        bool _isReissuable)
    public returns(bool);

    function REISSUEASSET267(bytes32 _symbol, uint _value) public returns(bool);	//inject NONSTANDARD NAMING
    function REVOKEASSET626(bytes32 _symbol, uint _value) public returns(bool);	//inject NONSTANDARD NAMING
    function SETPROXY405(address _address, bytes32 _symbol) public returns(bool);	//inject NONSTANDARD NAMING
    function LOCKASSET614(bytes32 _symbol) public returns(bool);	//inject NONSTANDARD NAMING

    function PROXYTRANSFERFROMTOICAPWITHREFERENCE851(	//inject NONSTANDARD NAMING
        address _from,
        bytes32 _icap,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function PROXYAPPROVE885(address _spender, uint _value, bytes32 _symbol, address _sender)	//inject NONSTANDARD NAMING
    public returns(bool);
    
    function ALLOWANCE750(address _from, address _spender, bytes32 _symbol) public view returns(uint);	//inject NONSTANDARD NAMING

    function PROXYTRANSFERFROMWITHREFERENCE67(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint _value,
        bytes32 _symbol,
        string memory _reference,
        address _sender)
    public returns(bool);

    function CHANGEOWNERSHIP129(bytes32 _symbol, address _newOwner) public returns(bool);	//inject NONSTANDARD NAMING
}

// File: contracts/AssetInterface.sol

pragma solidity 0.5.8;


contract AssetInterface {
    function _PERFORMTRANSFERWITHREFERENCE731(	//inject NONSTANDARD NAMING
        address _to,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function _PERFORMTRANSFERTOICAPWITHREFERENCE768(	//inject NONSTANDARD NAMING
        bytes32 _icap,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function _PERFORMAPPROVE306(address _spender, uint _value, address _sender)	//inject NONSTANDARD NAMING
    public returns(bool);

    function _PERFORMTRANSFERFROMWITHREFERENCE303(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function _PERFORMTRANSFERFROMTOICAPWITHREFERENCE860(	//inject NONSTANDARD NAMING
        address _from,
        bytes32 _icap,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function _PERFORMGENERIC401(bytes memory, address) public payable {	//inject NONSTANDARD NAMING
        revert();
    }
}

// File: contracts/ERC20Interface.sol

pragma solidity 0.5.8;


contract ERC20Interface {
    event TRANSFER557(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL95(address indexed from, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY869() public view returns(uint256 supply);	//inject NONSTANDARD NAMING
    function BALANCEOF1000(address _owner) public view returns(uint256 balance);	//inject NONSTANDARD NAMING
    // solhint-disable-next-line no-simple-event-func-name
    function TRANSFER812(address _to, uint256 _value) public returns(bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM130(address _from, address _to, uint256 _value) public returns(bool success);	//inject NONSTANDARD NAMING
    function APPROVE372(address _spender, uint256 _value) public returns(bool success);	//inject NONSTANDARD NAMING
    function ALLOWANCE750(address _owner, address _spender) public view returns(uint256 remaining);	//inject NONSTANDARD NAMING

    // function symbol() constant returns(string);
    function DECIMALS623() public view returns(uint8);	//inject NONSTANDARD NAMING
    // function name() constant returns(string);
}

// File: contracts/AssetProxyInterface.sol

pragma solidity 0.5.8;



contract AssetProxyInterface is ERC20Interface {
    function _FORWARDAPPROVE969(address _spender, uint _value, address _sender)	//inject NONSTANDARD NAMING
    public returns(bool);

    function _FORWARDTRANSFERFROMWITHREFERENCE875(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function _FORWARDTRANSFERFROMTOICAPWITHREFERENCE823(	//inject NONSTANDARD NAMING
        address _from,
        bytes32 _icap,
        uint _value,
        string memory _reference,
        address _sender)
    public returns(bool);

    function RECOVERTOKENS555(ERC20Interface _asset, address _receiver, uint _value)	//inject NONSTANDARD NAMING
    public returns(bool);

    function ETOKEN2397() external view returns(address); // To be replaced by the implicit getter;	//inject NONSTANDARD NAMING

    // To be replaced by the implicit getter;
    function ETOKEN2SYMBOL428() external view returns(bytes32);	//inject NONSTANDARD NAMING
}

// File: smart-contracts-common/contracts/Bytes32.sol

pragma solidity 0.5.8;


contract Bytes32 {
    function _BYTES32118(string memory _input) internal pure returns(bytes32 result) {	//inject NONSTANDARD NAMING
        assembly {
            result := mload(add(_input, 32))
        }
    }
}

// File: smart-contracts-common/contracts/ReturnData.sol

pragma solidity 0.5.8;


contract ReturnData {
    function _RETURNRETURNDATA423(bool _success) internal pure {	//inject NONSTANDARD NAMING
        assembly {
            let returndatastart := 0
            returndatacopy(returndatastart, 0, returndatasize)
            switch _success case 0 { revert(returndatastart, returndatasize) }
                default { return(returndatastart, returndatasize) }
        }
    }

    function _ASSEMBLYCALL82(address _destination, uint _value, bytes memory _data)	//inject NONSTANDARD NAMING
    internal returns(bool success) {
        assembly {
            success := call(gas, _destination, _value, add(_data, 32), mload(_data), 0, 0)
        }
    }
}

// File: contracts/AssetProxy.sol

pragma solidity 0.5.8;








                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
contract AssetProxy is ERC20Interface, AssetProxyInterface, Bytes32, ReturnData {
    // Assigned EToken2, immutable.
    EToken2Interface public etoken2;

    // Assigned symbol, immutable.
    bytes32 public etoken2Symbol;

    // Assigned name, immutable. For UI.
    string public name;
    string public symbol;

                                                                                                                                                                                                                                                                          
    function INIT451(EToken2Interface _etoken2, string memory _symbol, string memory _name)	//inject NONSTANDARD NAMING
        public returns(bool)
    {
        if (address(etoken2) != address(0)) {
            return false;
        }
        etoken2 = _etoken2;
        etoken2Symbol = _BYTES32118(_symbol);
        name = _name;
        symbol = _symbol;
        return true;
    }

                                                       
    modifier ONLYETOKEN2945() {	//inject NONSTANDARD NAMING
        if (msg.sender == address(etoken2)) {
            _;
        }
    }

                                                                   
    modifier ONLYASSETOWNER999() {	//inject NONSTANDARD NAMING
        if (etoken2.ISOWNER943(msg.sender, etoken2Symbol)) {
            _;
        }
    }

                                                                                                                                     
    function _GETASSET599() internal view returns(AssetInterface) {	//inject NONSTANDARD NAMING
        return AssetInterface(GETVERSIONFOR494(msg.sender));
    }

                                                                                                                                                                                                                                                                  
    function RECOVERTOKENS555(ERC20Interface _asset, address _receiver, uint _value)	//inject NONSTANDARD NAMING
    public ONLYASSETOWNER999() returns(bool) {
        return _asset.TRANSFER812(_receiver, _value);
    }

                                                                                            
    function TOTALSUPPLY869() public view returns(uint) {	//inject NONSTANDARD NAMING
        return etoken2.TOTALSUPPLY869(etoken2Symbol);
    }

                                                                                                                                                       
    function BALANCEOF1000(address _owner) public view returns(uint) {	//inject NONSTANDARD NAMING
        return etoken2.BALANCEOF1000(_owner, etoken2Symbol);
    }

                                                                                                                                                                                                                                              
    function ALLOWANCE750(address _from, address _spender) public view returns(uint) {	//inject NONSTANDARD NAMING
        return etoken2.ALLOWANCE750(_from, _spender, etoken2Symbol);
    }

                                                                                    
    function DECIMALS623() public view returns(uint8) {	//inject NONSTANDARD NAMING
        return etoken2.BASEUNIT277(etoken2Symbol);
    }

                                                                                                                                                                                                                 
    function TRANSFER812(address _to, uint _value) public returns(bool) {	//inject NONSTANDARD NAMING
        return TRANSFERWITHREFERENCE353(_to, _value, '');
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function TRANSFERWITHREFERENCE353(address _to, uint _value, string memory _reference)	//inject NONSTANDARD NAMING
    public returns(bool) {
        return _GETASSET599()._PERFORMTRANSFERWITHREFERENCE731(
            _to, _value, _reference, msg.sender);
    }

                                                                                                                                                                                                               
    function TRANSFERTOICAP191(bytes32 _icap, uint _value) public returns(bool) {	//inject NONSTANDARD NAMING
        return TRANSFERTOICAPWITHREFERENCE6(_icap, _value, '');
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function TRANSFERTOICAPWITHREFERENCE6(	//inject NONSTANDARD NAMING
        bytes32 _icap,
        uint _value,
        string memory _reference)
    public returns(bool) {
        return _GETASSET599()._PERFORMTRANSFERTOICAPWITHREFERENCE768(
            _icap, _value, _reference, msg.sender);
    }

                                                                                                                                                                                                                                                                
    function TRANSFERFROM130(address _from, address _to, uint _value) public returns(bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROMWITHREFERENCE352(_from, _to, _value, '');
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function TRANSFERFROMWITHREFERENCE352(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint _value,
        string memory _reference)
    public returns(bool) {
        return _GETASSET599()._PERFORMTRANSFERFROMWITHREFERENCE303(
            _from,
            _to,
            _value,
            _reference,
            msg.sender
        );
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function _FORWARDTRANSFERFROMWITHREFERENCE875(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint _value,
        string memory _reference,
        address _sender)
    public ONLYIMPLEMENTATIONFOR253(_sender) returns(bool) {
        return etoken2.PROXYTRANSFERFROMWITHREFERENCE67(
            _from,
            _to,
            _value,
            etoken2Symbol,
            _reference,
            _sender
        );
    }

                                                                                                                                                                                                                                                                          
    function TRANSFERFROMTOICAP459(address _from, bytes32 _icap, uint _value)	//inject NONSTANDARD NAMING
    public returns(bool) {
        return TRANSFERFROMTOICAPWITHREFERENCE463(_from, _icap, _value, '');
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function TRANSFERFROMTOICAPWITHREFERENCE463(	//inject NONSTANDARD NAMING
        address _from,
        bytes32 _icap,
        uint _value,
        string memory _reference)
    public returns(bool) {
        return _GETASSET599()._PERFORMTRANSFERFROMTOICAPWITHREFERENCE860(
            _from,
            _icap,
            _value,
            _reference,
            msg.sender
        );
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function _FORWARDTRANSFERFROMTOICAPWITHREFERENCE823(	//inject NONSTANDARD NAMING
        address _from,
        bytes32 _icap,
        uint _value,
        string memory _reference,
        address _sender)
    public ONLYIMPLEMENTATIONFOR253(_sender) returns(bool) {
        return etoken2.PROXYTRANSFERFROMTOICAPWITHREFERENCE851(
            _from,
            _icap,
            _value,
            _reference,
            _sender
        );
    }

                                                                                                                                                                                                                                                                                                                                                    
    function APPROVE372(address _spender, uint _value) public returns(bool) {	//inject NONSTANDARD NAMING
        return _GETASSET599()._PERFORMAPPROVE306(_spender, _value, msg.sender);
    }

                                                                                                                                                                                                                                                                                                                                                                         
    function _FORWARDAPPROVE969(address _spender, uint _value, address _sender)	//inject NONSTANDARD NAMING
    public ONLYIMPLEMENTATIONFOR253(_sender) returns(bool) {
        return etoken2.PROXYAPPROVE885(_spender, _value, etoken2Symbol, _sender);
    }

                                                                                                                                                           
    function EMITTRANSFER259(address _from, address _to, uint _value) public ONLYETOKEN2945() {	//inject NONSTANDARD NAMING
        emit TRANSFER557(_from, _to, _value);
    }

                                                                                                                                                                
    function EMITAPPROVE909(address _from, address _spender, uint _value) public ONLYETOKEN2945() {	//inject NONSTANDARD NAMING
        emit APPROVAL95(_from, _spender, _value);
    }

                                                                                                                                                                                      
    function () external payable {
        _GETASSET599()._PERFORMGENERIC401.value(msg.value)(msg.data, msg.sender);
        _RETURNRETURNDATA423(true);
    }

    // Interface functions to allow specifying ICAP addresses as strings.
    function TRANSFERTOICAP191(string memory _icap, uint _value) public returns(bool) {	//inject NONSTANDARD NAMING
        return TRANSFERTOICAPWITHREFERENCE6(_icap, _value, '');
    }

    function TRANSFERTOICAPWITHREFERENCE6(string memory _icap, uint _value, string memory _reference)	//inject NONSTANDARD NAMING
    public returns(bool) {
        return TRANSFERTOICAPWITHREFERENCE6(_BYTES32118(_icap), _value, _reference);
    }

    function TRANSFERFROMTOICAP459(address _from, string memory _icap, uint _value)	//inject NONSTANDARD NAMING
        public returns(bool)
    {
        return TRANSFERFROMTOICAPWITHREFERENCE463(_from, _icap, _value, '');
    }

    function TRANSFERFROMTOICAPWITHREFERENCE463(	//inject NONSTANDARD NAMING
        address _from,
        string memory _icap,
        uint _value,
        string memory _reference)
    public returns(bool) {
        return TRANSFERFROMTOICAPWITHREFERENCE463(_from, _BYTES32118(_icap), _value, _reference);
    }

                                                                                                          
    event UPGRADEPROPOSED267(address newVersion);	//inject NONSTANDARD NAMING
    event UPGRADEPURGED717(address newVersion);	//inject NONSTANDARD NAMING
    event UPGRADECOMMITED800(address newVersion);	//inject NONSTANDARD NAMING
    event OPTEDOUT928(address sender, address version);	//inject NONSTANDARD NAMING
    event OPTEDIN497(address sender, address version);	//inject NONSTANDARD NAMING

    // Current asset implementation contract address.
    address internal latestVersion;

    // Proposed next asset implementation contract address.
    address internal pendingVersion;

    // Upgrade freeze-time start.
    uint internal pendingVersionTimestamp;

    // Timespan for users to review the new implementation and make decision.
    uint internal constant upgrade_freeze_time855 = 3 days;	//inject NONSTANDARD NAMING

    // Asset implementation contract address that user decided to stick with.
    // 0x0 means that user uses latest version.
    mapping(address => address) internal userOptOutVersion;

                                                                                                
    modifier ONLYIMPLEMENTATIONFOR253(address _sender) {	//inject NONSTANDARD NAMING
        if (GETVERSIONFOR494(_sender) == msg.sender) {
            _;
        }
    }

                                                                                                                                                                                                  
    function GETVERSIONFOR494(address _sender) public view returns(address) {	//inject NONSTANDARD NAMING
        return userOptOutVersion[_sender] == address(0) ?
            latestVersion : userOptOutVersion[_sender];
    }

                                                                                                                                          
    function GETLATESTVERSION892() public view returns(address) {	//inject NONSTANDARD NAMING
        return latestVersion;
    }

                                                                                                                                                
    function GETPENDINGVERSION3() public view returns(address) {	//inject NONSTANDARD NAMING
        return pendingVersion;
    }

                                                                                                  
    function GETPENDINGVERSIONTIMESTAMP959() public view returns(uint) {	//inject NONSTANDARD NAMING
        return pendingVersionTimestamp;
    }

                                                                                                                                                                                                                                                                                                                       
    function PROPOSEUPGRADE158(address _newVersion) public ONLYASSETOWNER999() returns(bool) {	//inject NONSTANDARD NAMING
        // Should not already be in the upgrading process.
        if (pendingVersion != address(0)) {
            return false;
        }
        // New version address should be other than 0x0.
        if (_newVersion == address(0)) {
            return false;
        }
        // Don't apply freeze-time for the initial setup.
        if (latestVersion == address(0)) {
            latestVersion = _newVersion;
            return true;
        }
        pendingVersion = _newVersion;
        // solhint-disable-next-line not-rely-on-time
        pendingVersionTimestamp = now;
        emit UPGRADEPROPOSED267(_newVersion);
        return true;
    }

                                                                                                                                                  
    function PURGEUPGRADE869() public ONLYASSETOWNER999() returns(bool) {	//inject NONSTANDARD NAMING
        if (pendingVersion == address(0)) {
            return false;
        }
        emit UPGRADEPURGED717(pendingVersion);
        delete pendingVersion;
        delete pendingVersionTimestamp;
        return true;
    }

                                                                                                                                                                                                   
    function COMMITUPGRADE129() public returns(bool) {	//inject NONSTANDARD NAMING
        if (pendingVersion == address(0)) {
            return false;
        }
        // solhint-disable-next-line not-rely-on-time
        if (pendingVersionTimestamp + upgrade_freeze_time855 > now) {
            return false;
        }
        latestVersion = pendingVersion;
        delete pendingVersion;
        delete pendingVersionTimestamp;
        emit UPGRADECOMMITED800(latestVersion);
        return true;
    }

                                                                                                                                                                                     
    function OPTOUT100() public returns(bool) {	//inject NONSTANDARD NAMING
        if (userOptOutVersion[msg.sender] != address(0)) {
            return false;
        }
        userOptOutVersion[msg.sender] = latestVersion;
        emit OPTEDOUT928(msg.sender, latestVersion);
        return true;
    }

                                                                                                                                                                                  
    function OPTIN385() public returns(bool) {	//inject NONSTANDARD NAMING
        delete userOptOutVersion[msg.sender];
        emit OPTEDIN497(msg.sender, latestVersion);
        return true;
    }

    // Backwards compatibility.
    function MULTIASSET395() public view returns(EToken2Interface) {	//inject NONSTANDARD NAMING
        return etoken2;
    }
}