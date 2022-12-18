                                                                 

// File: contracts/external/govblocks-protocol/interfaces/IProposalCategory.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

pragma solidity 0.5.7;


contract IProposalCategory {

    event CATEGORY745(	//inject NONSTANDARD NAMING
        uint indexed categoryId,
        string categoryName,
        string actionHash
    );

    mapping(uint256 => bytes) public categoryActionHashes;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function NEWCATEGORY263(	//inject NONSTANDARD NAMING
        string calldata _name, 
        uint _memberRoleToVote,
        uint _majorityVotePerc, 
        uint _quorumPerc,
        uint[] calldata _allowedToCreateProposal,
        uint _closingTime,
        string calldata _actionHash,
        address _contractAddress,
        bytes2 _contractName,
        uint[] calldata _incentives,
        string calldata _functionHash
    )
        external;

                                         
    function CATEGORY966(uint _categoryId)	//inject NONSTANDARD NAMING
        external
        view
        returns(
            uint categoryId,
            uint memberRoleToVote,
            uint majorityVotePerc,
            uint quorumPerc,
            uint[] memory allowedToCreateProposal,
            uint closingTime,
            uint minStake
        );
    
                                               
    function CATEGORYACTION929(uint _categoryId)	//inject NONSTANDARD NAMING
        external
        view
        returns(
            uint categoryId,
            address contractAddress,
            bytes2 contractName,
            uint defaultIncentive
        );
    
                                                                  
    function TOTALCATEGORIES192() external view returns(uint numberOfCategories);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                 
    function CATEGORYACTIONDETAILS351(uint256 _categoryId)	//inject NONSTANDARD NAMING
        external
        view
        returns (
            uint256,
            address,
            bytes2,
            uint256,
            bytes memory
        );

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function EDITCATEGORY394(	//inject NONSTANDARD NAMING
        uint _categoryId, 
        string calldata _name, 
        uint _memberRoleToVote, 
        uint _majorityVotePerc, 
        uint _quorumPerc,
        uint[] calldata _allowedToCreateProposal,
        uint _closingTime,
        string calldata _actionHash,
        address _contractAddress,
        bytes2 _contractName,
        uint[] calldata _incentives,
        string calldata _functionHash
    )
        external;

}

// File: contracts/external/govblocks-protocol/interfaces/IMemberRoles.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

pragma solidity 0.5.7;


contract IMemberRoles {

    event MEMBERROLE621(uint256 indexed roleId, bytes32 roleName, string roleDescription);	//inject NONSTANDARD NAMING
    
    enum Role {UnAssigned, AdvisoryBoard, TokenHolder, DisputeResolution}

    function SETINITITORADDRESS642(address _initiator) external;	//inject NONSTANDARD NAMING

                                 
                                      
                                                    
                                                                  
    function ADDROLE312(bytes32 _roleName, string memory _roleDescription, address _authorized) public;	//inject NONSTANDARD NAMING

                                                          
                                               
                                       
                                                                                                          
    function UPDATEROLE243(address _memberAddress, uint _roleId, bool _active) public;	//inject NONSTANDARD NAMING

                                                                                                       
                                                              
                                                                 
    function CHANGEAUTHORIZED617(uint _roleId, address _authorized) public;	//inject NONSTANDARD NAMING

                                          
    function TOTALROLES838() public view returns(uint256);	//inject NONSTANDARD NAMING

                                                                  
                                           
                              
                                                                      
    function MEMBERS889(uint _memberRoleId) public view returns(uint, address[] memory allMemberAddress);	//inject NONSTANDARD NAMING

                                     
                                           
                                                                                
    function NUMBEROFMEMBERS372(uint _memberRoleId) public view returns(uint);	//inject NONSTANDARD NAMING
    
                                                                                                   
    function AUTHORIZED427(uint _memberRoleId) public view returns(address);	//inject NONSTANDARD NAMING

                                                                              
    function ROLES319(address _memberAddress) public view returns(uint[] memory assignedRoles);	//inject NONSTANDARD NAMING

                                                                       
                                               
                                                                    
                                                              
    function CHECKROLE358(address _memberAddress, uint _roleId) public view returns(bool);   	//inject NONSTANDARD NAMING
}

// File: contracts/external/proxy/Proxy.sol

pragma solidity 0.5.7;


                                                                                                       
contract Proxy {
                                                                                                                                                                                    
    function () external payable {
        address _impl = IMPLEMENTATION397();
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

                                                                                                                                                                               
    function IMPLEMENTATION397() public view returns (address);	//inject NONSTANDARD NAMING
}

// File: contracts/external/proxy/UpgradeabilityProxy.sol

pragma solidity 0.5.7;



                                                                                                                                                         
contract UpgradeabilityProxy is Proxy {
                                                                                                                                                                                    
    event UPGRADED78(address indexed implementation);	//inject NONSTANDARD NAMING

    // Storage position of the address of the current implementation
    bytes32 private constant implementation_position309 = keccak256("org.govblocks.proxy.implementation");	//inject NONSTANDARD NAMING

                                              
    constructor() public {}

                                                                                                                             
    function IMPLEMENTATION397() public view returns (address impl) {	//inject NONSTANDARD NAMING
        bytes32 position = implementation_position309;
        assembly {
            impl := sload(position)
        }
    }

                                                                                                                                                              
    function _SETIMPLEMENTATION785(address _newImplementation) internal {	//inject NONSTANDARD NAMING
        bytes32 position = implementation_position309;
        assembly {
        sstore(position, _newImplementation)
        }
    }

                                                                                                                                                          
    function _UPGRADETO534(address _newImplementation) internal {	//inject NONSTANDARD NAMING
        address currentImplementation = IMPLEMENTATION397();
        require(currentImplementation != _newImplementation);
        _SETIMPLEMENTATION785(_newImplementation);
        emit UPGRADED78(_newImplementation);
    }
}

// File: contracts/external/proxy/OwnedUpgradeabilityProxy.sol

pragma solidity 0.5.7;



                                                                                                                                                  
contract OwnedUpgradeabilityProxy is UpgradeabilityProxy {
                                                                                                                                                                                                                
    event PROXYOWNERSHIPTRANSFERRED382(address previousOwner, address newOwner);	//inject NONSTANDARD NAMING

    // Storage position of the owner of the contract
    bytes32 private constant proxy_owner_position609 = keccak256("org.govblocks.proxy.owner");	//inject NONSTANDARD NAMING

                                                                                                        
    constructor(address _implementation) public {
        _SETUPGRADEABILITYOWNER578(msg.sender);
        _UPGRADETO534(_implementation);
    }

                                                                               
    modifier ONLYPROXYOWNER725() {	//inject NONSTANDARD NAMING
        require(msg.sender == PROXYOWNER238());
        _;
    }

                                                                                               
    function PROXYOWNER238() public view returns (address owner) {	//inject NONSTANDARD NAMING
        bytes32 position = proxy_owner_position609;
        assembly {
            owner := sload(position)
        }
    }

                                                                                                                                                                  
    function TRANSFERPROXYOWNERSHIP173(address _newOwner) public ONLYPROXYOWNER725 {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0));
        _SETUPGRADEABILITYOWNER578(_newOwner);
        emit PROXYOWNERSHIPTRANSFERRED382(PROXYOWNER238(), _newOwner);
    }

                                                                                                                                                                                        
    function UPGRADETO100(address _implementation) public ONLYPROXYOWNER725 {	//inject NONSTANDARD NAMING
        _UPGRADETO534(_implementation);
    }

                                                        
    function _SETUPGRADEABILITYOWNER578(address _newProxyOwner) internal {	//inject NONSTANDARD NAMING
        bytes32 position = proxy_owner_position609;
        assembly {
            sstore(position, _newProxyOwner)
        }
    }
}

// File: contracts/external/govblocks-protocol/Governed.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

pragma solidity 0.5.7;


contract IMaster {
    mapping(address => bool) public whitelistedSponsor;
    function DAPPTOKEN233() public view returns(address);	//inject NONSTANDARD NAMING
    function ISINTERNAL873(address _address) public view returns(bool);	//inject NONSTANDARD NAMING
    function GETLATESTADDRESS311(bytes2 _module) public view returns(address);	//inject NONSTANDARD NAMING
    function ISAUTHORIZEDTOGOVERN797(address _toCheck) public view returns(bool);	//inject NONSTANDARD NAMING
}


contract Governed {

    address public masterAddress; // Name of the dApp, needs to be set by contracts inheriting this contract

                                                                                       
    modifier ONLYAUTHORIZEDTOGOVERN409() {	//inject NONSTANDARD NAMING
        IMaster ms = IMaster(masterAddress);
        require(ms.GETLATESTADDRESS311("GV") == msg.sender, "Not authorized");
        _;
    }

                                                         
    function ISAUTHORIZEDTOGOVERN797(address _toCheck) public view returns(bool) {	//inject NONSTANDARD NAMING
        IMaster ms = IMaster(masterAddress);
        return (ms.GETLATESTADDRESS311("GV") == _toCheck);
    } 

}

// File: contracts/interfaces/Iupgradable.sol

pragma solidity 0.5.7;

contract Iupgradable {

                                                 
    function SETMASTERADDRESS11() public;	//inject NONSTANDARD NAMING
}

// File: contracts/ProposalCategory.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

pragma solidity 0.5.7;






contract ProposalCategory is Governed, IProposalCategory, Iupgradable {
    bool public constructorCheck;
    IMemberRoles internal mr;

    struct CategoryStruct {
        uint256 memberRoleToVote;
        uint256 majorityVotePerc;
        uint256 quorumPerc;
        uint256[] allowedToCreateProposal;
        uint256 closingTime;
        uint256 minStake;
    }

    struct CategoryAction {
        uint256 defaultIncentive;
        address contractAddress;
        bytes2 contractName;
    }

    CategoryStruct[] internal allCategory;
    mapping(uint256 => CategoryAction) internal categoryActionData;
    mapping(uint256 => bytes) public categoryActionHashes;

    bool public initiated;

                                                                                                                 
    function PROPOSALCATEGORYINITIATE694() external {	//inject NONSTANDARD NAMING
        //solhint-disable-line
        require(!initiated, "Category action hashes already updated");
        initiated = true;

        uint256 advisoryBoardRole = uint256(IMemberRoles.Role.AdvisoryBoard);
        uint256 tokenHolder = uint256(IMemberRoles.Role.TokenHolder);
        uint256 disputeResolutionBoard = uint256(IMemberRoles.Role.DisputeResolution);

        _ADDINITIALCATEGORIES939("Uncategorized", "", "EX", "", 0, 0);
        _ADDINITIALCATEGORIES939(
            "Add new member role",
            "QmQFnBep7AyMYU3LJDuHSpTYatnw65XjHzzirrghtZoR8U",
            "MR",
            "addRole(bytes32,string,address)",
            50,
            advisoryBoardRole
        ); //1
        _ADDINITIALCATEGORIES939(
            "Update member role",
            "QmXMzSViLBJ22P9oj51Zz7isKTRnXWPHZcQ5hzGvvWD3UV",
            "MR",
            "updateRole(address,uint256,bool)",
            50,
            advisoryBoardRole
        ); // 2
        _ADDINITIALCATEGORIES939(
            "Add new category",
            "QmaVtv7NDR36X2ZEBjCmh1ny4UXKYSHPMfg8peuPLnNc3f",
            "PC",
            "newCategory(string,uint256,uint256,uint256,uint256[],uint256,string,address,bytes2,uint256[],string)",
            50,
            advisoryBoardRole
        ); // 3
        _ADDINITIALCATEGORIES939(
            "Edit category",
            "QmdmQhGo6hU5HzrNLuoyq2TUh1N3DQ7pT2SkPUhZvnsBYZ",
            "PC",
            "editCategory(uint256,string,uint256,uint256,uint256,uint256[],uint256,string,address,bytes2,uint256[],string)",
            50,
            advisoryBoardRole
        ); //4
        _ADDINITIALCATEGORIES939(
            "Update Market Implementations",
            "QmbyrHnGgTU9WWFq7DgtRTdpExLg9MqcFRYpWNpo7Ezjd5",
            "PL",
            "updateMarketImplementations(uint256[],address[])",
            60,
            tokenHolder
        ); // 5
        _ADDINITIALCATEGORIES939(
            "Update contract's Implementation",
            "QmesiuX929bJHmgH8E58L6FWPazcLdgcdjmFzinEdsMfre",
            "PL",
            "upgradeContractImplementation(address,address)",
            60,
            tokenHolder
        ); // 6
        _ADDINITIALCATEGORIES939(
            "Upgrade multiple contract Implementations",
            "QmcL1jUk7oda2cumSUTCrF6vTSeQN7qd1bYDFdz3v7BbUH",
            "MS",
            "upgradeMultipleImplementations(bytes2[],address[])",
            50,
            tokenHolder
        ); // 7
        _ADDINITIALCATEGORIES939(
            "Update master Implementation",
            "QmPrGbWA4cuWzZbc9ZmqFmSRSFJnp5sa747wKsJnQkkj4t",
            "MS",
            "upgradeTo(address)",
            50,
            tokenHolder
        ); // 8
        _ADDINITIALCATEGORIES939(
            "Add new contract",
            "QmXq5Jb4oeNzD2NHBLuWqy2m9J4N1KtkwyirBjkPBRNHii",
            "MS",
            "addNewContract(bytes2,address)",
            50,
            tokenHolder
        );
        _ADDINITIALCATEGORIES939(
            "Raise Dispute",
            "QmQLKazba2dL8nTtGaoon6DsPv5FcpKqWZPRdxLv2tfUQW",
            "PL",
            "resolveDispute(address,uint256)",
            60,
            disputeResolutionBoard
        );
        _ADDINITIALCATEGORIES939(
            "Burn Dispute Resolution Member Tokens",
            "QmTV2xSz5R5LVi9VozCyvNgnguq6xEsfVx7JaFbSatVVvQ",
            "TC",
            "burnLockedTokens(address,bytes32,uint256)",
            60,
            tokenHolder
        ); //11
        _ADDINITIALCATEGORIES939(
            "Swap AB member",
            "QmV5HJMmhkEiHWt5qdNp6AbCqcn9Lw9ASA9efHDKGm8mdh",
            "MR",
            "swapABMember(address,address)",
            60,
            tokenHolder
        );
        _ADDINITIALCATEGORIES939(
            "Update governance parameters",
            "QmTzKKxzpp1E4b8N3ch1kumetYRieEpN7ecTd3MNg4V1T9",
            "GV",
            "updateUintParameters(bytes8,uint256)",
            60,
            tokenHolder
        );
        _ADDINITIALCATEGORIES939(
            "Update Token Controller parameters",
            "QmdVH5FdXbiGbqsj17643KVEEBQ3ciBZnjn9Mj24ehsrGm",
            "TC",
            "updateUintParameters(bytes8,uint256)",
            60,
            tokenHolder
        );
        _ADDINITIALCATEGORIES939(
            "Add new market type",
            "QmPwAdEj6quzB65JWr6hDz6HrLtjTfbezwUiAe6mBq2sxY",
            "PL",
            "addNewMarketType(uint64,uint64,uint64)",
            60,
            tokenHolder
        ); //15
        _ADDINITIALCATEGORIES939(
            "Add new market currency",
            "QmTu2FnkqUWhhNbeQraSrtbdA4DfGLavTsLRKRCeLV51x1",
            "PL",
            "addNewMarketCurrency(address,uint64)",
            60,
            tokenHolder
        );
        _ADDINITIALCATEGORIES939(
            "Pause Market Creation",
            "QmamFs4k5ZbzajipsbWb4LCaKtyxDUwb9U5dYiNFqExb2W",
            "PL",
            "pauseMarketCreation()",
            60,
            tokenHolder
        );
        _ADDINITIALCATEGORIES939(
            "Resume Market Creation",
            "QmZ9W1gHTJjSnt3ieiNv1Ux6ooX7ngU4Jrpvk3QiiBeP5r",
            "PL",
            "resumeMarketCreation()",
            60,
            tokenHolder
        );
        _ADDINITIALCATEGORIES939(
            "Transfer Market Registry Assets",
            "QmeRCfGJuA6oTqY8a7nuVxdHih2SmZUTaZLVrttGv6yKy5",
            "PL",
            "transferAssets(address,address,uint256)",
            60,
            tokenHolder
        );
        _ADDINITIALCATEGORIES939(
            "Update Market Uint parameters",
            "QmXPXBkSKfidTgbDcRBLqokqAa9SU2wwErTyedPAZPfr5z",
            "PL",
            "updateUintParameters(bytes8,uint256)",
            60,
            tokenHolder
        ); //20
        _ADDINITIALCATEGORIES939(
            "Update Market Address parameters",
            "QmbbNRchZHMULBbKFT8qjCWgCRPa4qdkst8mE8A2Kffy7N",
            "PL",
            "updateConfigAddressParameters(bytes8,address)",
            60,
            tokenHolder
        );
        _ADDINITIALCATEGORIES939(
            "Update Member roles parameters",
            "QmcG8KXLMTDL5CtiKed12bJxE4ioL7Wn7oXLdW1zYWpf62",
            "MR",
            "updateUintParameters(bytes8,uint256)",
            60,
            tokenHolder
        ); //22
        _ADDINITIALCATEGORIES939(
            "Whitelist Sponsor",
            "QmRB2twfkzjox4ZAStnZTvtqr7Tr7ByGVdjTziWnpxXmWw",
            "MS",
            "whitelistSponsor(address)",
            60,
            tokenHolder
        );
        _ADDINITIALCATEGORIES939(
            "Any other item",
            "",
            "EX",
            "",
            60,
            tokenHolder
        );
    }

                                                                          
    function TOTALCATEGORIES192() external view returns (uint256) {	//inject NONSTANDARD NAMING
        return allCategory.length;
    }

                                                 
    function CATEGORY966(uint256 _categoryId)	//inject NONSTANDARD NAMING
        external
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256[] memory,
            uint256,
            uint256
        )
    {
        return (
            _categoryId,
            allCategory[_categoryId].memberRoleToVote,
            allCategory[_categoryId].majorityVotePerc,
            allCategory[_categoryId].quorumPerc,
            allCategory[_categoryId].allowedToCreateProposal,
            allCategory[_categoryId].closingTime,
            allCategory[_categoryId].minStake
        );
    }

                                                                                                                                                                                                                                                             
    function CATEGORYACTION929(uint256 _categoryId)	//inject NONSTANDARD NAMING
        external
        view
        returns (
            uint256,
            address,
            bytes2,
            uint256
        )
    {
        return (
            _categoryId,
            categoryActionData[_categoryId].contractAddress,
            categoryActionData[_categoryId].contractName,
            categoryActionData[_categoryId].defaultIncentive
        );
    }

                                                                                                                                                                                                                                                                                                                  
    function CATEGORYACTIONDETAILS351(uint256 _categoryId)	//inject NONSTANDARD NAMING
        external
        view
        returns (
            uint256,
            address,
            bytes2,
            uint256,
            bytes memory
        )
    {
        return (
            _categoryId,
            categoryActionData[_categoryId].contractAddress,
            categoryActionData[_categoryId].contractName,
            categoryActionData[_categoryId].defaultIncentive,
            categoryActionHashes[_categoryId]
        );
    }

                                                                               
    function SETMASTERADDRESS11() public {	//inject NONSTANDARD NAMING
        OwnedUpgradeabilityProxy proxy = OwnedUpgradeabilityProxy(
            address(uint160(address(this)))
        );
        require(msg.sender == proxy.PROXYOWNER238(), "Sender is not proxy owner.");

        require(masterAddress == address(0), "Master address already set");
        masterAddress = msg.sender;
        mr = IMemberRoles(IMaster(masterAddress).GETLATESTADDRESS311("MR"));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function NEWCATEGORY263(	//inject NONSTANDARD NAMING
        string memory _name,
        uint256 _memberRoleToVote,
        uint256 _majorityVotePerc,
        uint256 _quorumPerc,
        uint256[] memory _allowedToCreateProposal,
        uint256 _closingTime,
        string memory _actionHash,
        address _contractAddress,
        bytes2 _contractName,
        uint256[] memory _incentives,
        string memory _functionHash
    ) public ONLYAUTHORIZEDTOGOVERN409 {
        require(
            _quorumPerc <= 100 && _majorityVotePerc <= 100,
            "Invalid percentage"
        );

        require(
            (_contractName == "EX" && _contractAddress == address(0)) ||
                bytes(_functionHash).length > 0,
            "Wrong parameters passed"
        );

        _ADDCATEGORY558(
            _name,
            _memberRoleToVote,
            _majorityVotePerc,
            _quorumPerc,
            _allowedToCreateProposal,
            _closingTime,
            _actionHash,
            _contractAddress,
            _contractName,
            _incentives
        );

        bytes memory _encodedHash = abi.encodeWithSignature(_functionHash);
        if (
            bytes(_functionHash).length > 0 &&
            _encodedHash.length == 4
        ) {
            if(keccak256(_encodedHash) == keccak256(abi.encodeWithSignature("resolveDispute(address,uint256)"))) {
                require(_memberRoleToVote == uint256(IMemberRoles.Role.DisputeResolution));
            }
            categoryActionHashes[allCategory.length - 1] = _encodedHash;
        }
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function EDITCATEGORY394(	//inject NONSTANDARD NAMING
        uint256 _categoryId,
        string memory _name,
        uint256 _memberRoleToVote,
        uint256 _majorityVotePerc,
        uint256 _quorumPerc,
        uint256[] memory _allowedToCreateProposal,
        uint256 _closingTime,
        string memory _actionHash,
        address _contractAddress,
        bytes2 _contractName,
        uint256[] memory _incentives,
        string memory _functionHash
    ) public ONLYAUTHORIZEDTOGOVERN409 {
        require(
            _VERIFYMEMBERROLES402(_memberRoleToVote, _allowedToCreateProposal),
            "Invalid Role"
        );

        require(
            _quorumPerc <= 100 && _majorityVotePerc <= 100,
            "Invalid percentage"
        );

        require(
            (_contractName == "EX" && _contractAddress == address(0)) ||
                bytes(_functionHash).length > 0,
            "Wrong parameters passed"
        );

        delete categoryActionHashes[_categoryId];
        if (
            bytes(_functionHash).length > 0 &&
            abi.encodeWithSignature(_functionHash).length == 4
        ) {
            if(keccak256(abi.encodeWithSignature(_functionHash)) == keccak256(abi.encodeWithSignature("resolveDispute(address,uint256)"))) {
                require(_memberRoleToVote == uint256(IMemberRoles.Role.DisputeResolution));
            }
            categoryActionHashes[_categoryId] = abi.encodeWithSignature(
                _functionHash
            );
        }
        allCategory[_categoryId].memberRoleToVote = _memberRoleToVote;
        allCategory[_categoryId].majorityVotePerc = _majorityVotePerc;
        allCategory[_categoryId].closingTime = _closingTime;
        allCategory[_categoryId]
            .allowedToCreateProposal = _allowedToCreateProposal;
        allCategory[_categoryId].minStake = _incentives[0];
        allCategory[_categoryId].quorumPerc = _quorumPerc;
        categoryActionData[_categoryId].defaultIncentive = _incentives[1];
        categoryActionData[_categoryId].contractName = _contractName;
        categoryActionData[_categoryId].contractAddress = _contractAddress;
        emit CATEGORY745(_categoryId, _name, _actionHash);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function _ADDCATEGORY558(	//inject NONSTANDARD NAMING
        string memory _name,
        uint256 _memberRoleToVote,
        uint256 _majorityVotePerc,
        uint256 _quorumPerc,
        uint256[] memory _allowedToCreateProposal,
        uint256 _closingTime,
        string memory _actionHash,
        address _contractAddress,
        bytes2 _contractName,
        uint256[] memory _incentives
    ) internal {
        require(
            _VERIFYMEMBERROLES402(_memberRoleToVote, _allowedToCreateProposal),
            "Invalid Role"
        );
        allCategory.push(
            CategoryStruct(
                _memberRoleToVote,
                _majorityVotePerc,
                _quorumPerc,
                _allowedToCreateProposal,
                _closingTime,
                _incentives[0]
            )
        );
        uint256 categoryId = allCategory.length - 1;
        categoryActionData[categoryId] = CategoryAction(
            _incentives[1],
            _contractAddress,
            _contractName
        );
        emit CATEGORY745(categoryId, _name, _actionHash);
    }

                                                                                  
    function _VERIFYMEMBERROLES402(	//inject NONSTANDARD NAMING
        uint256 _memberRoleToVote,
        uint256[] memory _allowedToCreateProposal
    ) internal view returns (bool) {
        uint256 totalRoles = mr.TOTALROLES838();
        if (_memberRoleToVote >= totalRoles) {
            return false;
        }
        for (uint256 i = 0; i < _allowedToCreateProposal.length; i++) {
            if (_allowedToCreateProposal[i] >= totalRoles) {
                return false;
            }
        }
        return true;
    }

                                                                                                                                                                                                                                                                                                                                            
    function _ADDINITIALCATEGORIES939(	//inject NONSTANDARD NAMING
        string memory _name,
        string memory _solutionHash,
        bytes2 _contractName,
        string memory _actionHash,
        uint256 _majorityVotePerc,
        uint256 _memberRoleToVote
    ) internal {
        uint256[] memory allowedToCreateProposal = new uint256[](1);
        uint256[] memory stakeIncentive = new uint256[](2);
        uint256 closingTime = 3 days;
        allowedToCreateProposal[0] = _memberRoleToVote;
        stakeIncentive[0] = 0;
        stakeIncentive[1] = 0;
        if (_memberRoleToVote == uint256(IMemberRoles.Role.DisputeResolution)) {
            stakeIncentive[1] = 100 ether;
            allowedToCreateProposal[0] = uint256(IMemberRoles.Role.TokenHolder);
            closingTime = 2 days;
        }
        if (bytes(_actionHash).length > 0) {
            categoryActionHashes[allCategory.length] = abi.encodeWithSignature(
                _actionHash
            );
        }
        _ADDCATEGORY558(
            _name,
            _memberRoleToVote,
            _majorityVotePerc,
            10,
            allowedToCreateProposal,
            closingTime,
            _solutionHash,
            address(0),
            _contractName,
            stakeIncentive
        );
    }
}