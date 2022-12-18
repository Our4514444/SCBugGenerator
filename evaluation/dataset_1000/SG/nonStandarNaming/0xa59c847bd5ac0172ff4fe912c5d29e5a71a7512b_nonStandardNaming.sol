                                                                 

// File: contracts/common/governance/IGovernance.sol

pragma solidity ^0.5.2;

interface IGovernance {
    function UPDATE915(address target, bytes calldata data) external;	//inject NONSTANDARD NAMING
}

// File: contracts/common/governance/Governable.sol

pragma solidity ^0.5.2;


contract Governable {
    IGovernance public governance;

    constructor(address _governance) public {
        governance = IGovernance(_governance);
    }

    modifier ONLYGOVERNANCE295() {	//inject NONSTANDARD NAMING
        require(
            msg.sender == address(governance),
            "Only governance contract is authorized"
        );
        _;
    }
}

// File: contracts/root/withdrawManager/IWithdrawManager.sol

pragma solidity ^0.5.2;

contract IWithdrawManager {
    function CREATEEXITQUEUE580(address token) external;	//inject NONSTANDARD NAMING

    function VERIFYINCLUSION13(	//inject NONSTANDARD NAMING
        bytes calldata data,
        uint8 offset,
        bool verifyTxInclusion
    ) external view returns (uint256 age);

    function ADDEXITTOQUEUE535(	//inject NONSTANDARD NAMING
        address exitor,
        address childToken,
        address rootToken,
        uint256 exitAmountOrTokenId,
        bytes32 txHash,
        bool isRegularExit,
        uint256 priority
    ) external;

    function ADDINPUT584(	//inject NONSTANDARD NAMING
        uint256 exitId,
        uint256 age,
        address utxoOwner,
        address token
    ) external;

    function CHALLENGEEXIT596(	//inject NONSTANDARD NAMING
        uint256 exitId,
        uint256 inputId,
        bytes calldata challengeData,
        address adjudicatorPredicate
    ) external;
}

// File: contracts/common/Registry.sol

pragma solidity ^0.5.2;




contract Registry is Governable {
    // @todo hardcode constants
    bytes32 private constant weth_token690 = keccak256("wethToken");	//inject NONSTANDARD NAMING
    bytes32 private constant deposit_manager867 = keccak256("depositManager");	//inject NONSTANDARD NAMING
    bytes32 private constant stake_manager706 = keccak256("stakeManager");	//inject NONSTANDARD NAMING
    bytes32 private constant validator_share18 = keccak256("validatorShare");	//inject NONSTANDARD NAMING
    bytes32 private constant withdraw_manager609 = keccak256("withdrawManager");	//inject NONSTANDARD NAMING
    bytes32 private constant child_chain654 = keccak256("childChain");	//inject NONSTANDARD NAMING
    bytes32 private constant state_sender332 = keccak256("stateSender");	//inject NONSTANDARD NAMING
    bytes32 private constant slashing_manager246 = keccak256("slashingManager");	//inject NONSTANDARD NAMING

    address public erc20Predicate;
    address public erc721Predicate;

    mapping(bytes32 => address) public contractMap;
    mapping(address => address) public rootToChildToken;
    mapping(address => address) public childToRootToken;
    mapping(address => bool) public proofValidatorContracts;
    mapping(address => bool) public isERC721;

    enum Type {Invalid, ERC20, ERC721, Custom}
    struct Predicate {
        Type _type;
    }
    mapping(address => Predicate) public predicates;

    event TOKENMAPPED769(address indexed rootToken, address indexed childToken);	//inject NONSTANDARD NAMING
    event PROOFVALIDATORADDED853(address indexed validator, address indexed from);	//inject NONSTANDARD NAMING
    event PROOFVALIDATORREMOVED594(address indexed validator, address indexed from);	//inject NONSTANDARD NAMING
    event PREDICATEADDED118(address indexed predicate, address indexed from);	//inject NONSTANDARD NAMING
    event PREDICATEREMOVED314(address indexed predicate, address indexed from);	//inject NONSTANDARD NAMING
    event CONTRACTMAPUPDATED808(bytes32 indexed key, address indexed previousContract, address indexed newContract);	//inject NONSTANDARD NAMING

    constructor(address _governance) public Governable(_governance) {}

    function UPDATECONTRACTMAP992(bytes32 _key, address _address) external ONLYGOVERNANCE295 {	//inject NONSTANDARD NAMING
        emit CONTRACTMAPUPDATED808(_key, contractMap[_key], _address);
        contractMap[_key] = _address;
    }

                                                                                                                                                                                                                                      
    function MAPTOKEN624(	//inject NONSTANDARD NAMING
        address _rootToken,
        address _childToken,
        bool _isERC721
    ) external ONLYGOVERNANCE295 {
        require(_rootToken != address(0x0) && _childToken != address(0x0), "INVALID_TOKEN_ADDRESS");
        rootToChildToken[_rootToken] = _childToken;
        childToRootToken[_childToken] = _rootToken;
        isERC721[_rootToken] = _isERC721;
        IWithdrawManager(contractMap[withdraw_manager609]).CREATEEXITQUEUE580(_rootToken);
        emit TOKENMAPPED769(_rootToken, _childToken);
    }

    function ADDERC20PREDICATE359(address predicate) public ONLYGOVERNANCE295 {	//inject NONSTANDARD NAMING
        require(predicate != address(0x0), "Can not add null address as predicate");
        erc20Predicate = predicate;
        ADDPREDICATE712(predicate, Type.ERC20);
    }

    function ADDERC721PREDICATE786(address predicate) public ONLYGOVERNANCE295 {	//inject NONSTANDARD NAMING
        erc721Predicate = predicate;
        ADDPREDICATE712(predicate, Type.ERC721);
    }

    function ADDPREDICATE712(address predicate, Type _type) public ONLYGOVERNANCE295 {	//inject NONSTANDARD NAMING
        require(predicates[predicate]._type == Type.Invalid, "Predicate already added");
        predicates[predicate]._type = _type;
        emit PREDICATEADDED118(predicate, msg.sender);
    }

    function REMOVEPREDICATE608(address predicate) public ONLYGOVERNANCE295 {	//inject NONSTANDARD NAMING
        require(predicates[predicate]._type != Type.Invalid, "Predicate does not exist");
        delete predicates[predicate];
        emit PREDICATEREMOVED314(predicate, msg.sender);
    }

    function GETVALIDATORSHAREADDRESS165() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[validator_share18];
    }

    function GETWETHTOKENADDRESS359() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[weth_token690];
    }

    function GETDEPOSITMANAGERADDRESS341() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[deposit_manager867];
    }

    function GETSTAKEMANAGERADDRESS656() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[stake_manager706];
    }

    function GETSLASHINGMANAGERADDRESS263() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[slashing_manager246];
    }

    function GETWITHDRAWMANAGERADDRESS440() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[withdraw_manager609];
    }

    function GETCHILDCHAINANDSTATESENDER356() public view returns (address, address) {	//inject NONSTANDARD NAMING
        return (contractMap[child_chain654], contractMap[state_sender332]);
    }

    function ISTOKENMAPPED394(address _token) public view returns (bool) {	//inject NONSTANDARD NAMING
        return rootToChildToken[_token] != address(0x0);
    }

    function ISTOKENMAPPEDANDISERC72161(address _token) public view returns (bool) {	//inject NONSTANDARD NAMING
        require(ISTOKENMAPPED394(_token), "TOKEN_NOT_MAPPED");
        return isERC721[_token];
    }

    function ISTOKENMAPPEDANDGETPREDICATE171(address _token) public view returns (address) {	//inject NONSTANDARD NAMING
        if (ISTOKENMAPPEDANDISERC72161(_token)) {
            return erc721Predicate;
        }
        return erc20Predicate;
    }

    function ISCHILDTOKENERC721150(address childToken) public view returns (bool) {	//inject NONSTANDARD NAMING
        address rootToken = childToRootToken[childToken];
        require(rootToken != address(0x0), "Child token is not mapped");
        return isERC721[rootToken];
    }
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL236(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV758(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB685(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD430(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD824(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

pragma solidity ^0.5.2;

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED7(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED7(address(0), _owner);
    }

                                                        
    function OWNER690() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER429() {	//inject NONSTANDARD NAMING
        require(ISOWNER534());
        _;
    }

                                                                                 
    function ISOWNER534() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP734() public ONLYOWNER429 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED7(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP74(address newOwner) public ONLYOWNER429 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP165(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP165(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED7(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/common/lib/BytesLib.sol

pragma solidity ^0.5.2;


library BytesLib {
    function CONCAT704(bytes memory _preBytes, bytes memory _postBytes)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (bytes memory)
    {
        bytes memory tempBytes;
        assembly {
            // Get a location of some free memory and store it in tempBytes as
            // Solidity does for memory variables.
            tempBytes := mload(0x40)

            // Store the length of the first bytes array at the beginning of
            // the memory for tempBytes.
            let length := mload(_preBytes)
            mstore(tempBytes, length)

            // Maintain a memory counter for the current write location in the
            // temp bytes array by adding the 32 bytes for the array length to
            // the starting location.
            let mc := add(tempBytes, 0x20)
            // Stop copying when the memory counter reaches the length of the
            // first bytes array.
            let end := add(mc, length)

            for {
                // Initialize a copy counter to the start of the _preBytes data,
                // 32 bytes into its memory.
                let cc := add(_preBytes, 0x20)
            } lt(mc, end) {
                // Increase both counters by 32 bytes each iteration.
                mc := add(mc, 0x20)
                cc := add(cc, 0x20)
            } {
                // Write the _preBytes data into the tempBytes memory 32 bytes
                // at a time.
                mstore(mc, mload(cc))
            }

            // Add the length of _postBytes to the current length of tempBytes
            // and store it as the new length in the first 32 bytes of the
            // tempBytes memory.
            length := mload(_postBytes)
            mstore(tempBytes, add(length, mload(tempBytes)))

            // Move the memory counter back from a multiple of 0x20 to the
            // actual end of the _preBytes data.
            mc := end
            // Stop copying when the memory counter reaches the new combined
            // length of the arrays.
            end := add(mc, length)

            for {
                let cc := add(_postBytes, 0x20)
            } lt(mc, end) {
                mc := add(mc, 0x20)
                cc := add(cc, 0x20)
            } {
                mstore(mc, mload(cc))
            }

            // Update the free-memory pointer by padding our last write location
            // to 32 bytes: add 31 bytes to the end of tempBytes to move to the
            // next 32 byte block, then round down to the nearest multiple of
            // 32. If the sum of the length of the two arrays is zero then add
            // one before rounding down to leave a blank 32 bytes (the length block with 0).
            mstore(
                0x40,
                and(
                    add(add(end, iszero(add(length, mload(_preBytes)))), 31),
                    not(31) // Round down to the nearest 32 bytes.
                )
            )
        }
        return tempBytes;
    }

    function SLICE641(bytes memory _bytes, uint256 _start, uint256 _length)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (bytes memory)
    {
        require(_bytes.length >= (_start + _length));
        bytes memory tempBytes;
        assembly {
            switch iszero(_length)
                case 0 {
                    // Get a location of some free memory and store it in tempBytes as
                    // Solidity does for memory variables.
                    tempBytes := mload(0x40)

                    // The first word of the slice result is potentially a partial
                    // word read from the original array. To read it, we calculate
                    // the length of that partial word and start copying that many
                    // bytes into the array. The first word we copy will start with
                    // data we don't care about, but the last `lengthmod` bytes will
                    // land at the beginning of the contents of the new array. When
                    // we're done copying, we overwrite the full first word with
                    // the actual length of the slice.
                    let lengthmod := and(_length, 31)

                    // The multiplication in the next line is necessary
                    // because when slicing multiples of 32 bytes (lengthmod == 0)
                    // the following copy loop was copying the origin's length
                    // and then ending prematurely not copying everything it should.
                    let mc := add(
                        add(tempBytes, lengthmod),
                        mul(0x20, iszero(lengthmod))
                    )
                    let end := add(mc, _length)

                    for {
                        // The multiplication in the next line has the same exact purpose
                        // as the one above.
                        let cc := add(
                            add(
                                add(_bytes, lengthmod),
                                mul(0x20, iszero(lengthmod))
                            ),
                            _start
                        )
                    } lt(mc, end) {
                        mc := add(mc, 0x20)
                        cc := add(cc, 0x20)
                    } {
                        mstore(mc, mload(cc))
                    }

                    mstore(tempBytes, _length)

                    //update free-memory pointer
                    //allocating the array padded to 32 bytes like the compiler does now
                    mstore(0x40, and(add(mc, 31), not(31)))
                }
                //if we want a zero-length slice let's just return a zero-length array
                default {
                    tempBytes := mload(0x40)
                    mstore(0x40, add(tempBytes, 0x20))
                }
        }

        return tempBytes;
    }

    // Pad a bytes array to 32 bytes
    function LEFTPAD714(bytes memory _bytes) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        // may underflow if bytes.length < 32. Hence using SafeMath.sub
        bytes memory newBytes = new bytes(SafeMath.SUB685(32, _bytes.length));
        return CONCAT704(newBytes, _bytes);
    }

    function TOBYTES32159(bytes memory b) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        require(b.length >= 32, "Bytes array should atleast be 32 bytes");
        bytes32 out;
        for (uint256 i = 0; i < 32; i++) {
            out |= bytes32(b[i] & 0xFF) >> (i * 8);
        }
        return out;
    }

    function TOBYTES487(bytes memory b) internal pure returns (bytes4 result) {	//inject NONSTANDARD NAMING
        assembly {
            result := mload(add(b, 32))
        }
    }

    function FROMBYTES32599(bytes32 x) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        bytes memory b = new bytes(32);
        for (uint256 i = 0; i < 32; i++) {
            b[i] = bytes1(uint8(uint256(x) / (2**(8 * (31 - i)))));
        }
        return b;
    }

    function FROMUINT319(uint256 _num) internal pure returns (bytes memory _ret) {	//inject NONSTANDARD NAMING
        _ret = new bytes(32);
        assembly {
            mstore(add(_ret, 32), _num)
        }
    }

    function TOUINT423(bytes memory _bytes, uint256 _start)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (uint256)
    {
        require(_bytes.length >= (_start + 32));
        uint256 tempUint;
        assembly {
            tempUint := mload(add(add(_bytes, 0x20), _start))
        }
        return tempUint;
    }

    function TOADDRESS819(bytes memory _bytes, uint256 _start)	//inject NONSTANDARD NAMING
        internal
        pure
        returns (address)
    {
        require(_bytes.length >= (_start + 20));
        address tempAddress;
        assembly {
            tempAddress := div(
                mload(add(add(_bytes, 0x20), _start)),
                0x1000000000000000000000000
            )
        }

        return tempAddress;
    }
}

// File: contracts/common/lib/ECVerify.sol

pragma solidity ^0.5.2;


library ECVerify {
    function ECRECOVERY938(bytes32 hash, bytes memory sig)	//inject NONSTANDARD NAMING
        public
        pure
        returns (address)
    {
        bytes32 r;
        bytes32 s;
        uint8 v;

        if (sig.length != 65) {
            return address(0x0);
        }

        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := and(mload(add(sig, 65)), 255)
        }

        // https://github.com/ethereum/go-ethereum/issues/2053
        if (v < 27) {
            v += 27;
        }

        if (v != 27 && v != 28) {
            return address(0x0);
        }

        // get address out of hash and signature
        address result = ecrecover(hash, v, r, s);

        // ecrecover returns zero on error
        require(result != address(0x0));

        return result;
    }

    function ECRECOVERY938(bytes32 hash, uint8 v, bytes32 r, bytes32 s)	//inject NONSTANDARD NAMING
        public
        pure
        returns (address)
    {
        // get address out of hash and signature
        address result = ecrecover(hash, v, r, s);

        // ecrecover returns zero on error
        require(result != address(0x0), "signature verification failed");

        return result;
    }

    function ECVERIFY286(bytes32 hash, bytes memory sig, address signer)	//inject NONSTANDARD NAMING
        public
        pure
        returns (bool)
    {
        return signer == ECRECOVERY938(hash, sig);
    }
}

// File: contracts/staking/StakingInfo.sol

pragma solidity ^0.5.2;







// dummy interface to avoid cyclic dependency
contract IStakeManagerLocal {
    enum Status {Inactive, Active, Locked, Unstaked}

    struct Validator {
        uint256 amount;
        uint256 reward;
        uint256 activationEpoch;
        uint256 deactivationEpoch;
        uint256 jailTime;
        address signer;
        address contractAddress;
        Status status;
    }

    mapping(uint256 => Validator) public validators;
    bytes32 public accountStateRoot;
    uint256 public activeAmount; // delegation amount from validator contract
    uint256 public validatorRewards;

    function CURRENTVALIDATORSETTOTALSTAKE1000() public view returns (uint256);	//inject NONSTANDARD NAMING

    // signer to Validator mapping
    function SIGNERTOVALIDATOR168(address validatorAddress)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256);

    function ISVALIDATOR972(uint256 validatorId) public view returns (bool);	//inject NONSTANDARD NAMING
}


contract StakingInfo is Ownable {
    using SafeMath for uint256;
    mapping(uint256 => uint256) public validatorNonce;

                                                                            
                                        
                                                                  
                                                          
                                                                   
                                     
                                          
                                                       
    event STAKED852(	//inject NONSTANDARD NAMING
        address indexed signer,
        uint256 indexed validatorId,
        uint256 nonce,
        uint256 indexed activationEpoch,
        uint256 amount,
        uint256 total,
        bytes signerPubkey
    );

                                                                
                                             
                                                                  
                                     
                                          
    event UNSTAKED467(	//inject NONSTANDARD NAMING
        address indexed user,
        uint256 indexed validatorId,
        uint256 amount,
        uint256 total
    );

                                                             
                                             
                                                                  
                                                          
                                                          
                                     
    event UNSTAKEINIT805(	//inject NONSTANDARD NAMING
        address indexed user,
        uint256 indexed validatorId,
        uint256 nonce,
        uint256 deactivationEpoch,
        uint256 indexed amount
    );

                                                                                  
                                                                  
                                                          
                                                      
                                                      
                                                        
    event SIGNERCHANGE914(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 nonce,
        address indexed oldSigner,
        address indexed newSigner,
        bytes signerPubkey
    );
    event RESTAKED981(uint256 indexed validatorId, uint256 amount, uint256 total);	//inject NONSTANDARD NAMING
    event JAILED427(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 indexed exitEpoch,
        address indexed signer
    );
    event UNJAILED626(uint256 indexed validatorId, address indexed signer);	//inject NONSTANDARD NAMING
    event SLASHED834(uint256 indexed nonce, uint256 indexed amount);	//inject NONSTANDARD NAMING
    event THRESHOLDCHANGE292(uint256 newThreshold, uint256 oldThreshold);	//inject NONSTANDARD NAMING
    event DYNASTYVALUECHANGE650(uint256 newDynasty, uint256 oldDynasty);	//inject NONSTANDARD NAMING
    event PROPOSERBONUSCHANGE600(	//inject NONSTANDARD NAMING
        uint256 newProposerBonus,
        uint256 oldProposerBonus
    );

    event REWARDUPDATE598(uint256 newReward, uint256 oldReward);	//inject NONSTANDARD NAMING

                                                                                                                               
                                                                  
                                                          
                                                  
    event STAKEUPDATE117(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 indexed nonce,
        uint256 indexed newAmount
    );
    event CLAIMREWARDS93(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 indexed amount,
        uint256 indexed totalAmount
    );
    event STARTAUCTION948(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 indexed amount,
        uint256 indexed auctionAmount
    );
    event CONFIRMAUCTION427(	//inject NONSTANDARD NAMING
        uint256 indexed newValidatorId,
        uint256 indexed oldValidatorId,
        uint256 indexed amount
    );
    event TOPUPFEE823(address indexed user, uint256 indexed fee);	//inject NONSTANDARD NAMING
    event CLAIMFEE85(address indexed user, uint256 indexed fee);	//inject NONSTANDARD NAMING
    // Delegator events
    event SHAREMINTED543(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        address indexed user,
        uint256 indexed amount,
        uint256 tokens
    );
    event SHAREBURNED529(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        address indexed user,
        uint256 indexed amount,
        uint256 tokens
    );
    event DELEGATORCLAIMEDREWARDS506(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        address indexed user,
        uint256 indexed rewards
    );
    event DELEGATORRESTAKED550(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        address indexed user,
        uint256 indexed totalStaked
    );
    event DELEGATORUNSTAKED786(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        address indexed user,
        uint256 amount
    );
    event UPDATECOMMISSIONRATE267(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 indexed newCommissionRate,
        uint256 indexed oldCommissionRate
    );

    Registry public registry;

    modifier ONLYVALIDATORCONTRACT841(uint256 validatorId) {	//inject NONSTANDARD NAMING
        address _contract;
        (, , , , , , _contract, ) = IStakeManagerLocal(
            registry.GETSTAKEMANAGERADDRESS656()
        )
            .validators(validatorId);
        require(_contract == msg.sender,
        "Invalid sender, not validator");
        _;
    }

    modifier STAKEMANAGERORVALIDATORCONTRACT435(uint256 validatorId) {	//inject NONSTANDARD NAMING
        address _contract;
        address _stakeManager = registry.GETSTAKEMANAGERADDRESS656();
        (, , , , , , _contract, ) = IStakeManagerLocal(_stakeManager).validators(
            validatorId
        );
        require(_contract == msg.sender || _stakeManager == msg.sender,
        "Invalid sender, not stake manager or validator contract");
        _;
    }

    modifier ONLYSTAKEMANAGER92() {	//inject NONSTANDARD NAMING
        require(registry.GETSTAKEMANAGERADDRESS656() == msg.sender,
        "Invalid sender, not stake manager");
        _;
    }
    modifier ONLYSLASHINGMANAGER669() {	//inject NONSTANDARD NAMING
        require(registry.GETSLASHINGMANAGERADDRESS263() == msg.sender,
        "Invalid sender, not slashing manager");
        _;
    }

    constructor(address _registry) public {
        registry = Registry(_registry);
    }

    function UPDATENONCE185(	//inject NONSTANDARD NAMING
        uint256[] calldata validatorIds,
        uint256[] calldata nonces
    ) external ONLYOWNER429 {
        require(validatorIds.length == nonces.length, "args length mismatch");

        for (uint256 i = 0; i < validatorIds.length; ++i) {
            validatorNonce[validatorIds[i]] = nonces[i];
        }
    } 

    function LOGSTAKED696(	//inject NONSTANDARD NAMING
        address signer,
        bytes memory signerPubkey,
        uint256 validatorId,
        uint256 activationEpoch,
        uint256 amount,
        uint256 total
    ) public ONLYSTAKEMANAGER92 {
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD430(1);
        emit STAKED852(
            signer,
            validatorId,
            validatorNonce[validatorId],
            activationEpoch,
            amount,
            total,
            signerPubkey
        );
    }

    function LOGUNSTAKED190(	//inject NONSTANDARD NAMING
        address user,
        uint256 validatorId,
        uint256 amount,
        uint256 total
    ) public ONLYSTAKEMANAGER92 {
        emit UNSTAKED467(user, validatorId, amount, total);
    }

    function LOGUNSTAKEINIT825(	//inject NONSTANDARD NAMING
        address user,
        uint256 validatorId,
        uint256 deactivationEpoch,
        uint256 amount
    ) public ONLYSTAKEMANAGER92 {
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD430(1);
        emit UNSTAKEINIT805(
            user,
            validatorId,
            validatorNonce[validatorId],
            deactivationEpoch,
            amount
        );
    }

    function LOGSIGNERCHANGE698(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address oldSigner,
        address newSigner,
        bytes memory signerPubkey
    ) public ONLYSTAKEMANAGER92 {
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD430(1);
        emit SIGNERCHANGE914(
            validatorId,
            validatorNonce[validatorId],
            oldSigner,
            newSigner,
            signerPubkey
        );
    }

    function LOGRESTAKED77(uint256 validatorId, uint256 amount, uint256 total)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER92
    {
        emit RESTAKED981(validatorId, amount, total);
    }

    function LOGJAILED777(uint256 validatorId, uint256 exitEpoch, address signer)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER92
    {
        emit JAILED427(validatorId, exitEpoch, signer);
    }

    function LOGUNJAILED682(uint256 validatorId, address signer)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER92
    {
        emit UNJAILED626(validatorId, signer);
    }

    function LOGSLASHED561(uint256 nonce, uint256 amount)	//inject NONSTANDARD NAMING
        public
        ONLYSLASHINGMANAGER669
    {
        emit SLASHED834(nonce, amount);
    }

    function LOGTHRESHOLDCHANGE297(uint256 newThreshold, uint256 oldThreshold)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER92
    {
        emit THRESHOLDCHANGE292(newThreshold, oldThreshold);
    }

    function LOGDYNASTYVALUECHANGE510(uint256 newDynasty, uint256 oldDynasty)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER92
    {
        emit DYNASTYVALUECHANGE650(newDynasty, oldDynasty);
    }

    function LOGPROPOSERBONUSCHANGE144(	//inject NONSTANDARD NAMING
        uint256 newProposerBonus,
        uint256 oldProposerBonus
    ) public ONLYSTAKEMANAGER92 {
        emit PROPOSERBONUSCHANGE600(newProposerBonus, oldProposerBonus);
    }

    function LOGREWARDUPDATE280(uint256 newReward, uint256 oldReward)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER92
    {
        emit REWARDUPDATE598(newReward, oldReward);
    }

    function LOGSTAKEUPDATE738(uint256 validatorId)	//inject NONSTANDARD NAMING
        public
        STAKEMANAGERORVALIDATORCONTRACT435(validatorId)
    {
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD430(1);
        emit STAKEUPDATE117(
            validatorId,
            validatorNonce[validatorId],
            TOTALVALIDATORSTAKE237(validatorId)
        );
    }

    function LOGCLAIMREWARDS685(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        uint256 totalAmount
    ) public ONLYSTAKEMANAGER92 {
        emit CLAIMREWARDS93(validatorId, amount, totalAmount);
    }

    function LOGSTARTAUCTION823(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        uint256 auctionAmount
    ) public ONLYSTAKEMANAGER92 {
        emit STARTAUCTION948(validatorId, amount, auctionAmount);
    }

    function LOGCONFIRMAUCTION966(	//inject NONSTANDARD NAMING
        uint256 newValidatorId,
        uint256 oldValidatorId,
        uint256 amount
    ) public ONLYSTAKEMANAGER92 {
        emit CONFIRMAUCTION427(newValidatorId, oldValidatorId, amount);
    }

    function LOGTOPUPFEE479(address user, uint256 fee) public ONLYSTAKEMANAGER92 {	//inject NONSTANDARD NAMING
        emit TOPUPFEE823(user, fee);
    }

    function LOGCLAIMFEE69(address user, uint256 fee) public ONLYSTAKEMANAGER92 {	//inject NONSTANDARD NAMING
        emit CLAIMFEE85(user, fee);
    }

    function GETSTAKERDETAILS360(uint256 validatorId)	//inject NONSTANDARD NAMING
        public
        view
        returns (
            uint256 amount,
            uint256 reward,
            uint256 activationEpoch,
            uint256 deactivationEpoch,
            address signer,
            uint256 _status
        )
    {
        IStakeManagerLocal stakeManager = IStakeManagerLocal(
            registry.GETSTAKEMANAGERADDRESS656()
        );
        address _contract;
        IStakeManagerLocal.Status status;
        (
            amount,
            reward,
            activationEpoch,
            deactivationEpoch,
            ,
            signer,
            _contract,
            status
        ) = stakeManager.validators(validatorId);
        _status = uint256(status);
        if (_contract != address(0x0)) {
            reward += IStakeManagerLocal(_contract).validatorRewards();
        }
    }

    function TOTALVALIDATORSTAKE237(uint256 validatorId)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256 validatorStake)
    {
        address contractAddress;
        (validatorStake, , , , , , contractAddress, ) = IStakeManagerLocal(
            registry.GETSTAKEMANAGERADDRESS656()
        )
            .validators(validatorId);
        if (contractAddress != address(0x0)) {
            validatorStake += IStakeManagerLocal(contractAddress).activeAmount();
        }
    }

    function GETACCOUNTSTATEROOT449()	//inject NONSTANDARD NAMING
        public
        view
        returns (bytes32 accountStateRoot)
    {
        accountStateRoot = IStakeManagerLocal(registry.GETSTAKEMANAGERADDRESS656())
            .accountStateRoot();
    }

    function GETVALIDATORCONTRACTADDRESS690(uint256 validatorId)	//inject NONSTANDARD NAMING
        public
        view
        returns (address ValidatorContract)
    {
        (, , , , , , ValidatorContract, ) = IStakeManagerLocal(
            registry.GETSTAKEMANAGERADDRESS656()
        )
            .validators(validatorId);
    }

    // validator Share contract logging func
    function LOGSHAREMINTED275(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 amount,
        uint256 tokens
    ) public ONLYVALIDATORCONTRACT841(validatorId) {
        emit SHAREMINTED543(validatorId, user, amount, tokens);
    }

    function LOGSHAREBURNED961(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 amount,
        uint256 tokens
    ) public ONLYVALIDATORCONTRACT841(validatorId) {
        emit SHAREBURNED529(validatorId, user, amount, tokens);
    }

    function LOGDELEGATORCLAIMREWARDS599(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 rewards
    ) public ONLYVALIDATORCONTRACT841(validatorId) {
        emit DELEGATORCLAIMEDREWARDS506(validatorId, user, rewards);
    }

    function LOGDELEGATORRESTAKED356(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 totalStaked
    ) public ONLYVALIDATORCONTRACT841(validatorId) {
        emit DELEGATORRESTAKED550(validatorId, user, totalStaked);
    }

    function LOGDELEGATORUNSTAKED582(uint256 validatorId, address user, uint256 amount)	//inject NONSTANDARD NAMING
        public
        ONLYVALIDATORCONTRACT841(validatorId)
    {
        emit DELEGATORUNSTAKED786(validatorId, user, amount);
    }

    function LOGUPDATECOMMISSIONRATE131(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 newCommissionRate,
        uint256 oldCommissionRate
    ) public ONLYVALIDATORCONTRACT841(validatorId) {
        emit UPDATECOMMISSIONRATE267(
            validatorId,
            newCommissionRate,
            oldCommissionRate
        );
    }
}