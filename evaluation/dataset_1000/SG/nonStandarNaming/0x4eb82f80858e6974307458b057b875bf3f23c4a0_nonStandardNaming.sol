                                                                 

// File: contracts/external/proxy/Proxy.sol

pragma solidity 0.5.7;


                                                                                                       
contract Proxy {
                                                                                                                                                                                    
    function () external payable {
        address _impl = IMPLEMENTATION321();
        require(_impl != address(0));

        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, _impl, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
            }
    }

                                                                                                                                                                               
    function IMPLEMENTATION321() public view returns (address);	//inject NONSTANDARD NAMING
}

// File: contracts/external/proxy/UpgradeabilityProxy.sol

pragma solidity 0.5.7;



                                                                                                                                                         
contract UpgradeabilityProxy is Proxy {
                                                                                                                                                                                    
    event UPGRADED491(address indexed implementation);	//inject NONSTANDARD NAMING

    // Storage position of the address of the current implementation
    bytes32 private constant implementation_position602 = keccak256("org.govblocks.proxy.implementation");	//inject NONSTANDARD NAMING

                                              
    constructor() public {}

                                                                                                                             
    function IMPLEMENTATION321() public view returns (address impl) {	//inject NONSTANDARD NAMING
        bytes32 position = implementation_position602;
        assembly {
            impl := sload(position)
        }
    }

                                                                                                                                                              
    function _SETIMPLEMENTATION747(address _newImplementation) internal {	//inject NONSTANDARD NAMING
        bytes32 position = implementation_position602;
        assembly {
        sstore(position, _newImplementation)
        }
    }

                                                                                                                                                          
    function _UPGRADETO833(address _newImplementation) internal {	//inject NONSTANDARD NAMING
        address currentImplementation = IMPLEMENTATION321();
        require(currentImplementation != _newImplementation);
        _SETIMPLEMENTATION747(_newImplementation);
        emit UPGRADED491(_newImplementation);
    }
}

// File: contracts/external/proxy/OwnedUpgradeabilityProxy.sol

pragma solidity 0.5.7;



                                                                                                                                                  
contract OwnedUpgradeabilityProxy is UpgradeabilityProxy {
                                                                                                                                                                                                                
    event PROXYOWNERSHIPTRANSFERRED484(address previousOwner, address newOwner);	//inject NONSTANDARD NAMING

    // Storage position of the owner of the contract
    bytes32 private constant proxy_owner_position989 = keccak256("org.govblocks.proxy.owner");	//inject NONSTANDARD NAMING

                                                                                                        
    constructor(address _implementation) public {
        _SETUPGRADEABILITYOWNER623(msg.sender);
        _UPGRADETO833(_implementation);
    }

                                                                               
    modifier ONLYPROXYOWNER152() {	//inject NONSTANDARD NAMING
        require(msg.sender == PROXYOWNER262());
        _;
    }

                                                                                               
    function PROXYOWNER262() public view returns (address owner) {	//inject NONSTANDARD NAMING
        bytes32 position = proxy_owner_position989;
        assembly {
            owner := sload(position)
        }
    }

                                                                                                                                                                  
    function TRANSFERPROXYOWNERSHIP177(address _newOwner) public ONLYPROXYOWNER152 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0));
        _SETUPGRADEABILITYOWNER623(_newOwner);
        emit PROXYOWNERSHIPTRANSFERRED484(PROXYOWNER262(), _newOwner);
    }

                                                                                                                                                                                        
    function UPGRADETO199(address _implementation) public ONLYPROXYOWNER152 {	//inject NONSTANDARD NAMING
        _UPGRADETO833(_implementation);
    }

                                                        
    function _SETUPGRADEABILITYOWNER623(address _newProxyOwner) internal {	//inject NONSTANDARD NAMING
        bytes32 position = proxy_owner_position989;
        assembly {
            sstore(position, _newProxyOwner)
        }
    }
}

// File: contracts/external/govblocks-protocol/Governed.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

pragma solidity 0.5.7;


contract IMaster {
    mapping(address => bool) public whitelistedSponsor;
    function DAPPTOKEN422() public view returns(address);	//inject NONSTANDARD NAMING
    function ISINTERNAL553(address _address) public view returns(bool);	//inject NONSTANDARD NAMING
    function GETLATESTADDRESS608(bytes2 _module) public view returns(address);	//inject NONSTANDARD NAMING
    function ISAUTHORIZEDTOGOVERN241(address _toCheck) public view returns(bool);	//inject NONSTANDARD NAMING
}


contract Governed {

    address public masterAddress; // Name of the dApp, needs to be set by contracts inheriting this contract

                                                                                       
    modifier ONLYAUTHORIZEDTOGOVERN564() {	//inject NONSTANDARD NAMING
        IMaster ms = IMaster(masterAddress);
        require(ms.GETLATESTADDRESS608("GV") == msg.sender, "Not authorized");
        _;
    }

                                                         
    function ISAUTHORIZEDTOGOVERN241(address _toCheck) public view returns(bool) {	//inject NONSTANDARD NAMING
        IMaster ms = IMaster(masterAddress);
        return (ms.GETLATESTADDRESS608("GV") == _toCheck);
    } 

}

// File: contracts/external/govblocks-protocol/interfaces/IMemberRoles.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

pragma solidity 0.5.7;


contract IMemberRoles {

    event MEMBERROLE687(uint256 indexed roleId, bytes32 roleName, string roleDescription);	//inject NONSTANDARD NAMING
    
    enum Role {UnAssigned, AdvisoryBoard, TokenHolder, DisputeResolution}

    function SETINITITORADDRESS405(address _initiator) external;	//inject NONSTANDARD NAMING

                                 
                                      
                                                    
                                                                  
    function ADDROLE149(bytes32 _roleName, string memory _roleDescription, address _authorized) public;	//inject NONSTANDARD NAMING

                                                          
                                               
                                       
                                                                                                          
    function UPDATEROLE761(address _memberAddress, uint _roleId, bool _active) public;	//inject NONSTANDARD NAMING

                                                                                                       
                                                              
                                                                 
    function CHANGEAUTHORIZED70(uint _roleId, address _authorized) public;	//inject NONSTANDARD NAMING

                                          
    function TOTALROLES250() public view returns(uint256);	//inject NONSTANDARD NAMING

                                                                  
                                           
                              
                                                                      
    function MEMBERS670(uint _memberRoleId) public view returns(uint, address[] memory allMemberAddress);	//inject NONSTANDARD NAMING

                                     
                                           
                                                                                
    function NUMBEROFMEMBERS53(uint _memberRoleId) public view returns(uint);	//inject NONSTANDARD NAMING
    
                                                                                                   
    function AUTHORIZED887(uint _memberRoleId) public view returns(address);	//inject NONSTANDARD NAMING

                                                                              
    function ROLES411(address _memberAddress) public view returns(uint[] memory assignedRoles);	//inject NONSTANDARD NAMING

                                                                       
                                               
                                                                    
                                                              
    function CHECKROLE395(address _memberAddress, uint _roleId) public view returns(bool);   	//inject NONSTANDARD NAMING
}

// File: contracts/interfaces/IMarketRegistry.sol

pragma solidity 0.5.7;

contract IMarketRegistry {

    enum MarketType {
      HourlyMarket,
      DailyMarket,
      WeeklyMarket
    }
    address public owner;
    address public tokenController;
    address public marketUtility;
    bool public marketCreationPaused;

    mapping(address => bool) public isMarket;
    function() external payable{}

    function MARKETDISPUTESTATUS379(address _marketAddress) public view returns(uint _status);	//inject NONSTANDARD NAMING

    function BURNDISPUTEDPROPOSALTOKENS735(uint _proposaId) external;	//inject NONSTANDARD NAMING

    function ISWHITELISTEDSPONSOR353(address _address) public view returns(bool);	//inject NONSTANDARD NAMING

    function TRANSFERASSETS22(address _asset, address _to, uint _amount) external;	//inject NONSTANDARD NAMING

                                                                                                                                                           
    function INITIATE546(address _defaultAddress, address _marketConfig, address _plotToken, address payable[] memory _configParams) public;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function CREATEGOVERNANCEPROPOSAL360(string memory proposalTitle, string memory description, string memory solutionHash, bytes memory actionHash, uint256 stakeForDispute, address user, uint256 ethSentToPool, uint256 tokenSentToPool, uint256 proposedValue) public {	//inject NONSTANDARD NAMING
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function SETUSERGLOBALPREDICTIONDATA866(address _user,uint _value, uint _predictionPoints, address _predictionAsset, uint _prediction,uint _leverage) public{	//inject NONSTANDARD NAMING
    }

                                                                                                                                                                                                                                                                             
    function CALLCLAIMEDEVENT925(address _user , uint[] memory _reward, address[] memory predictionAssets, uint incentives, address incentiveToken) public {	//inject NONSTANDARD NAMING
    }

                                                                                                                                                                                                                                                             
    function CALLMARKETRESULTEVENT367(uint[] memory _totalReward, uint _winningOption, uint _closeValue, uint roundId) public {	//inject NONSTANDARD NAMING
    }
}

// File: contracts/interfaces/IbLOTToken.sol

pragma solidity 0.5.7;

contract IbLOTToken {
    function INITIATEBLOT606(address _defaultMinter) external;	//inject NONSTANDARD NAMING
    function CONVERTTOPLOT383(address _of, address _to, uint256 amount) public;	//inject NONSTANDARD NAMING
}

// File: contracts/interfaces/ITokenController.sol

pragma solidity 0.5.7;

contract ITokenController {
	address public token;
    address public bLOTToken;

                                                                                                              
    function SWAPBLOT11(address _of, address _to, uint256 amount) public;	//inject NONSTANDARD NAMING

    function TOTALBALANCEOF853(address _of)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256 amount);

    function TRANSFERFROM761(address _token, address _of, address _to, uint256 amount) public;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                  
    function TOKENSLOCKEDATTIME613(address _of, bytes32 _reason, uint256 _time)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256 amount);

                                                                                                                                               
    function BURNCOMMISSIONTOKENS798(uint256 amount) external returns(bool);	//inject NONSTANDARD NAMING
 
    function INITIATEVESTING823(address _vesting) external;	//inject NONSTANDARD NAMING

    function LOCKFORGOVERNANCEVOTE961(address _of, uint _days) public;	//inject NONSTANDARD NAMING

    function TOTALSUPPLY132() public view returns (uint256);	//inject NONSTANDARD NAMING

    function MINT562(address _member, uint _amount) public;	//inject NONSTANDARD NAMING

}

// File: contracts/interfaces/Iupgradable.sol

pragma solidity 0.5.7;

contract Iupgradable {

                                                 
    function SETMASTERADDRESS259() public;	//inject NONSTANDARD NAMING
}

// File: contracts/Master.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

pragma solidity 0.5.7;








contract Master is Governed {
    bytes2[] public allContractNames;
    address public dAppToken;
    address public dAppLocker;
    bool public masterInitialised;

    mapping(address => bool) public contractsActive;
    mapping(address => bool) public whitelistedSponsor;
    mapping(bytes2 => address payable) public contractAddress;

                                                                                                      
    modifier ONLYAUTHORIZEDTOGOVERN564() {	//inject NONSTANDARD NAMING
        require(GETLATESTADDRESS608("GV") == msg.sender, "Not authorized");
        _;
    }

                                                                                                                                                                                                                                    
    function INITIATEMASTER652(	//inject NONSTANDARD NAMING
        address[] calldata _implementations,
        address _token,
        address _defaultAddress,
        address _marketUtiliy,
        address payable[] calldata _configParams,
        address _vesting
    ) external {
        OwnedUpgradeabilityProxy proxy = OwnedUpgradeabilityProxy(
            address(uint160(address(this)))
        );
        require(!masterInitialised);
        require(msg.sender == proxy.PROXYOWNER262(), "Sender is not proxy owner.");
        masterInitialised = true;

        //Initial contract names
        allContractNames.push("MR");
        allContractNames.push("PC");
        allContractNames.push("GV");
        allContractNames.push("PL");
        allContractNames.push("TC");
        allContractNames.push("BL");

        require(
            allContractNames.length == _implementations.length,
            "Implementation length not match"
        );
        contractsActive[address(this)] = true;
        dAppToken = _token;
        for (uint256 i = 0; i < allContractNames.length; i++) {
            _GENERATEPROXY480(allContractNames[i], _implementations[i]);
        }
        dAppLocker = contractAddress["TC"];

        _SETMASTERADDRESS913();

        IMarketRegistry(contractAddress["PL"]).INITIATE546(
            _defaultAddress,
            _marketUtiliy,
            _token,
            _configParams
        );
        IbLOTToken(contractAddress["BL"]).INITIATEBLOT606(_defaultAddress);
        ITokenController(contractAddress["TC"]).INITIATEVESTING823(_vesting);
        IMemberRoles(contractAddress["MR"]).SETINITITORADDRESS405(_defaultAddress);
    }

                                                              
    function ADDNEWCONTRACT208(bytes2 _contractName, address _contractAddress)	//inject NONSTANDARD NAMING
        external
        ONLYAUTHORIZEDTOGOVERN564
    {
        require(_contractName != "MS", "Name cannot be master");
        require(_contractAddress != address(0), "Zero address");
        require(
            contractAddress[_contractName] == address(0),
            "Contract code already available"
        );
        allContractNames.push(_contractName);
        _GENERATEPROXY480(_contractName, _contractAddress);
        Iupgradable up = Iupgradable(contractAddress[_contractName]);
        up.SETMASTERADDRESS259();
    }

                                                                        
    function UPGRADEMULTIPLEIMPLEMENTATIONS39(	//inject NONSTANDARD NAMING
        bytes2[] calldata _contractNames,
        address[] calldata _contractAddresses
    ) external ONLYAUTHORIZEDTOGOVERN564 {
        require(
            _contractNames.length == _contractAddresses.length,
            "Array length should be equal."
        );
        for (uint256 i = 0; i < _contractNames.length; i++) {
            require(
                _contractAddresses[i] != address(0),
                "null address is not allowed."
            );
            _REPLACEIMPLEMENTATION382(_contractNames[i], _contractAddresses[i]);
        }
    }

    function WHITELISTSPONSOR697(address _address) external ONLYAUTHORIZEDTOGOVERN564 {	//inject NONSTANDARD NAMING
        whitelistedSponsor[_address] = true;
    }

    
                                                                                                                                                    
    function ISINTERNAL553(address _address) public view returns (bool) {	//inject NONSTANDARD NAMING
        return contractsActive[_address];
    }

                                                                                                           
    function GETLATESTADDRESS608(bytes2 _contractName)	//inject NONSTANDARD NAMING
        public
        view
        returns (address)
    {
        return contractAddress[_contractName];
    }

                                                                        
    function ISAUTHORIZEDTOGOVERN241(address _toCheck) public view returns (bool) {	//inject NONSTANDARD NAMING
        return (GETLATESTADDRESS608("GV") == _toCheck);
    }

                                                           
    function _SETMASTERADDRESS913() internal {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < allContractNames.length; i++) {
            Iupgradable up = Iupgradable(contractAddress[allContractNames[i]]);
            up.SETMASTERADDRESS259();
        }
    }

                                                                                                                                                                                                                               
    function _REPLACEIMPLEMENTATION382(	//inject NONSTANDARD NAMING
        bytes2 _contractsName,
        address _contractAddress
    ) internal {
        OwnedUpgradeabilityProxy tempInstance = OwnedUpgradeabilityProxy(
            contractAddress[_contractsName]
        );
        tempInstance.UPGRADETO199(_contractAddress);
    }

                                                                                          
    function _GENERATEPROXY480(bytes2 _contractName, address _contractAddress)	//inject NONSTANDARD NAMING
        internal
    {
        OwnedUpgradeabilityProxy tempInstance = new OwnedUpgradeabilityProxy(
            _contractAddress
        );
        contractAddress[_contractName] = address(tempInstance);
        contractsActive[address(tempInstance)] = true;
    }
}