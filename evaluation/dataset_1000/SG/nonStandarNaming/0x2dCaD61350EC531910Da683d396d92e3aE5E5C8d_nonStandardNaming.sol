                                                                 

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER36(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE525(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM986(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY710() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF852(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE48(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER127(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL571(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL921(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV595(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB588(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD428(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD231(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20.sol

pragma solidity ^0.5.2;



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY710() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF852(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE48(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER36(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER563(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE525(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE258(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM986(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER563(from, to, value);
        _APPROVE258(from, msg.sender, _allowed[from][msg.sender].SUB588(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE435(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE258(msg.sender, spender, _allowed[msg.sender][spender].ADD428(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE887(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE258(msg.sender, spender, _allowed[msg.sender][spender].SUB588(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER563(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB588(value);
        _balances[to] = _balances[to].ADD428(value);
        emit TRANSFER127(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT13(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD428(value);
        _balances[account] = _balances[account].ADD428(value);
        emit TRANSFER127(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN567(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB588(value);
        _balances[account] = _balances[account].SUB588(value);
        emit TRANSFER127(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE258(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL571(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM449(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN567(account, value);
        _APPROVE258(account, msg.sender, _allowed[account][msg.sender].SUB588(value));
    }
}

// File: contracts/common/tokens/ERC20NonTransferable.sol

pragma solidity ^0.5.2;


contract ERC20NonTransferable is ERC20 {
    function _TRANSFER563(	//inject NONSTANDARD NAMING
        address from,
        address to,
        uint256 value
    ) internal {
        revert("Disabled");
    }
}

// File: contracts/common/governance/IGovernance.sol

pragma solidity ^0.5.2;

interface IGovernance {
    function UPDATE202(address target, bytes calldata data) external;	//inject NONSTANDARD NAMING
}

// File: contracts/common/governance/Governable.sol

pragma solidity ^0.5.2;


contract Governable {
    IGovernance public governance;

    constructor(address _governance) public {
        governance = IGovernance(_governance);
    }

    modifier ONLYGOVERNANCE946() {	//inject NONSTANDARD NAMING
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
    function CREATEEXITQUEUE125(address token) external;	//inject NONSTANDARD NAMING

    function VERIFYINCLUSION127(	//inject NONSTANDARD NAMING
        bytes calldata data,
        uint8 offset,
        bool verifyTxInclusion
    ) external view returns (uint256 age);

    function ADDEXITTOQUEUE885(	//inject NONSTANDARD NAMING
        address exitor,
        address childToken,
        address rootToken,
        uint256 exitAmountOrTokenId,
        bytes32 txHash,
        bool isRegularExit,
        uint256 priority
    ) external;

    function ADDINPUT96(	//inject NONSTANDARD NAMING
        uint256 exitId,
        uint256 age,
        address utxoOwner,
        address token
    ) external;

    function CHALLENGEEXIT403(	//inject NONSTANDARD NAMING
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
    bytes32 private constant weth_token968 = keccak256("wethToken");	//inject NONSTANDARD NAMING
    bytes32 private constant deposit_manager292 = keccak256("depositManager");	//inject NONSTANDARD NAMING
    bytes32 private constant stake_manager976 = keccak256("stakeManager");	//inject NONSTANDARD NAMING
    bytes32 private constant validator_share14 = keccak256("validatorShare");	//inject NONSTANDARD NAMING
    bytes32 private constant withdraw_manager764 = keccak256("withdrawManager");	//inject NONSTANDARD NAMING
    bytes32 private constant child_chain327 = keccak256("childChain");	//inject NONSTANDARD NAMING
    bytes32 private constant state_sender903 = keccak256("stateSender");	//inject NONSTANDARD NAMING
    bytes32 private constant slashing_manager488 = keccak256("slashingManager");	//inject NONSTANDARD NAMING

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

    event TOKENMAPPED528(address indexed rootToken, address indexed childToken);	//inject NONSTANDARD NAMING
    event PROOFVALIDATORADDED185(address indexed validator, address indexed from);	//inject NONSTANDARD NAMING
    event PROOFVALIDATORREMOVED307(address indexed validator, address indexed from);	//inject NONSTANDARD NAMING
    event PREDICATEADDED541(address indexed predicate, address indexed from);	//inject NONSTANDARD NAMING
    event PREDICATEREMOVED159(address indexed predicate, address indexed from);	//inject NONSTANDARD NAMING
    event CONTRACTMAPUPDATED81(bytes32 indexed key, address indexed previousContract, address indexed newContract);	//inject NONSTANDARD NAMING

    constructor(address _governance) public Governable(_governance) {}

    function UPDATECONTRACTMAP702(bytes32 _key, address _address) external ONLYGOVERNANCE946 {	//inject NONSTANDARD NAMING
        emit CONTRACTMAPUPDATED81(_key, contractMap[_key], _address);
        contractMap[_key] = _address;
    }

                                                                                                                                                                                                                                      
    function MAPTOKEN744(	//inject NONSTANDARD NAMING
        address _rootToken,
        address _childToken,
        bool _isERC721
    ) external ONLYGOVERNANCE946 {
        require(_rootToken != address(0x0) && _childToken != address(0x0), "INVALID_TOKEN_ADDRESS");
        rootToChildToken[_rootToken] = _childToken;
        childToRootToken[_childToken] = _rootToken;
        isERC721[_rootToken] = _isERC721;
        IWithdrawManager(contractMap[withdraw_manager764]).CREATEEXITQUEUE125(_rootToken);
        emit TOKENMAPPED528(_rootToken, _childToken);
    }

    function ADDERC20PREDICATE303(address predicate) public ONLYGOVERNANCE946 {	//inject NONSTANDARD NAMING
        require(predicate != address(0x0), "Can not add null address as predicate");
        erc20Predicate = predicate;
        ADDPREDICATE868(predicate, Type.ERC20);
    }

    function ADDERC721PREDICATE772(address predicate) public ONLYGOVERNANCE946 {	//inject NONSTANDARD NAMING
        erc721Predicate = predicate;
        ADDPREDICATE868(predicate, Type.ERC721);
    }

    function ADDPREDICATE868(address predicate, Type _type) public ONLYGOVERNANCE946 {	//inject NONSTANDARD NAMING
        require(predicates[predicate]._type == Type.Invalid, "Predicate already added");
        predicates[predicate]._type = _type;
        emit PREDICATEADDED541(predicate, msg.sender);
    }

    function REMOVEPREDICATE283(address predicate) public ONLYGOVERNANCE946 {	//inject NONSTANDARD NAMING
        require(predicates[predicate]._type != Type.Invalid, "Predicate does not exist");
        delete predicates[predicate];
        emit PREDICATEREMOVED159(predicate, msg.sender);
    }

    function GETVALIDATORSHAREADDRESS526() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[validator_share14];
    }

    function GETWETHTOKENADDRESS578() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[weth_token968];
    }

    function GETDEPOSITMANAGERADDRESS866() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[deposit_manager292];
    }

    function GETSTAKEMANAGERADDRESS85() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[stake_manager976];
    }

    function GETSLASHINGMANAGERADDRESS505() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[slashing_manager488];
    }

    function GETWITHDRAWMANAGERADDRESS331() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[withdraw_manager764];
    }

    function GETCHILDCHAINANDSTATESENDER167() public view returns (address, address) {	//inject NONSTANDARD NAMING
        return (contractMap[child_chain327], contractMap[state_sender903]);
    }

    function ISTOKENMAPPED730(address _token) public view returns (bool) {	//inject NONSTANDARD NAMING
        return rootToChildToken[_token] != address(0x0);
    }

    function ISTOKENMAPPEDANDISERC721505(address _token) public view returns (bool) {	//inject NONSTANDARD NAMING
        require(ISTOKENMAPPED730(_token), "TOKEN_NOT_MAPPED");
        return isERC721[_token];
    }

    function ISTOKENMAPPEDANDGETPREDICATE10(address _token) public view returns (address) {	//inject NONSTANDARD NAMING
        if (ISTOKENMAPPEDANDISERC721505(_token)) {
            return erc721Predicate;
        }
        return erc20Predicate;
    }

    function ISCHILDTOKENERC721947(address childToken) public view returns (bool) {	//inject NONSTANDARD NAMING
        address rootToken = childToRootToken[childToken];
        require(rootToken != address(0x0), "Child token is not mapped");
        return isERC721[rootToken];
    }
}

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

pragma solidity ^0.5.2;

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED458(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED458(address(0), _owner);
    }

                                                        
    function OWNER154() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER381() {	//inject NONSTANDARD NAMING
        require(ISOWNER670());
        _;
    }

                                                                                 
    function ISOWNER670() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP730() public ONLYOWNER381 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED458(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP501(address newOwner) public ONLYOWNER381 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP419(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP419(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED458(_owner, newOwner);
        _owner = newOwner;
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

    function CURRENTVALIDATORSETTOTALSTAKE424() public view returns (uint256);	//inject NONSTANDARD NAMING

    // signer to Validator mapping
    function SIGNERTOVALIDATOR116(address validatorAddress)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256);

    function ISVALIDATOR357(uint256 validatorId) public view returns (bool);	//inject NONSTANDARD NAMING
}


contract StakingInfo is Ownable {
    using SafeMath for uint256;
    mapping(uint256 => uint256) public validatorNonce;

                                                                            
                                        
                                                                  
                                                          
                                                                   
                                     
                                          
                                                       
    event STAKED185(	//inject NONSTANDARD NAMING
        address indexed signer,
        uint256 indexed validatorId,
        uint256 nonce,
        uint256 indexed activationEpoch,
        uint256 amount,
        uint256 total,
        bytes signerPubkey
    );

                                                                
                                             
                                                                  
                                     
                                          
    event UNSTAKED922(	//inject NONSTANDARD NAMING
        address indexed user,
        uint256 indexed validatorId,
        uint256 amount,
        uint256 total
    );

                                                             
                                             
                                                                  
                                                          
                                                          
                                     
    event UNSTAKEINIT987(	//inject NONSTANDARD NAMING
        address indexed user,
        uint256 indexed validatorId,
        uint256 nonce,
        uint256 deactivationEpoch,
        uint256 indexed amount
    );

                                                                                  
                                                                  
                                                          
                                                      
                                                      
                                                        
    event SIGNERCHANGE548(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 nonce,
        address indexed oldSigner,
        address indexed newSigner,
        bytes signerPubkey
    );
    event RESTAKED769(uint256 indexed validatorId, uint256 amount, uint256 total);	//inject NONSTANDARD NAMING
    event JAILED517(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 indexed exitEpoch,
        address indexed signer
    );
    event UNJAILED683(uint256 indexed validatorId, address indexed signer);	//inject NONSTANDARD NAMING
    event SLASHED581(uint256 indexed nonce, uint256 indexed amount);	//inject NONSTANDARD NAMING
    event THRESHOLDCHANGE318(uint256 newThreshold, uint256 oldThreshold);	//inject NONSTANDARD NAMING
    event DYNASTYVALUECHANGE497(uint256 newDynasty, uint256 oldDynasty);	//inject NONSTANDARD NAMING
    event PROPOSERBONUSCHANGE479(	//inject NONSTANDARD NAMING
        uint256 newProposerBonus,
        uint256 oldProposerBonus
    );

    event REWARDUPDATE192(uint256 newReward, uint256 oldReward);	//inject NONSTANDARD NAMING

                                                                                                                               
                                                                  
                                                          
                                                  
    event STAKEUPDATE665(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 indexed nonce,
        uint256 indexed newAmount
    );
    event CLAIMREWARDS500(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 indexed amount,
        uint256 indexed totalAmount
    );
    event STARTAUCTION906(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 indexed amount,
        uint256 indexed auctionAmount
    );
    event CONFIRMAUCTION329(	//inject NONSTANDARD NAMING
        uint256 indexed newValidatorId,
        uint256 indexed oldValidatorId,
        uint256 indexed amount
    );
    event TOPUPFEE867(address indexed user, uint256 indexed fee);	//inject NONSTANDARD NAMING
    event CLAIMFEE345(address indexed user, uint256 indexed fee);	//inject NONSTANDARD NAMING
    // Delegator events
    event SHAREMINTED654(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        address indexed user,
        uint256 indexed amount,
        uint256 tokens
    );
    event SHAREBURNED105(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        address indexed user,
        uint256 indexed amount,
        uint256 tokens
    );
    event DELEGATORCLAIMEDREWARDS895(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        address indexed user,
        uint256 indexed rewards
    );
    event DELEGATORRESTAKED593(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        address indexed user,
        uint256 indexed totalStaked
    );
    event DELEGATORUNSTAKED783(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        address indexed user,
        uint256 amount
    );
    event UPDATECOMMISSIONRATE768(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 indexed newCommissionRate,
        uint256 indexed oldCommissionRate
    );

    Registry public registry;

    modifier ONLYVALIDATORCONTRACT475(uint256 validatorId) {	//inject NONSTANDARD NAMING
        address _contract;
        (, , , , , , _contract, ) = IStakeManagerLocal(
            registry.GETSTAKEMANAGERADDRESS85()
        )
            .validators(validatorId);
        require(_contract == msg.sender,
        "Invalid sender, not validator");
        _;
    }

    modifier STAKEMANAGERORVALIDATORCONTRACT869(uint256 validatorId) {	//inject NONSTANDARD NAMING
        address _contract;
        address _stakeManager = registry.GETSTAKEMANAGERADDRESS85();
        (, , , , , , _contract, ) = IStakeManagerLocal(_stakeManager).validators(
            validatorId
        );
        require(_contract == msg.sender || _stakeManager == msg.sender,
        "Invalid sender, not stake manager or validator contract");
        _;
    }

    modifier ONLYSTAKEMANAGER126() {	//inject NONSTANDARD NAMING
        require(registry.GETSTAKEMANAGERADDRESS85() == msg.sender,
        "Invalid sender, not stake manager");
        _;
    }
    modifier ONLYSLASHINGMANAGER551() {	//inject NONSTANDARD NAMING
        require(registry.GETSLASHINGMANAGERADDRESS505() == msg.sender,
        "Invalid sender, not slashing manager");
        _;
    }

    constructor(address _registry) public {
        registry = Registry(_registry);
    }

    function UPDATENONCE219(	//inject NONSTANDARD NAMING
        uint256[] calldata validatorIds,
        uint256[] calldata nonces
    ) external ONLYOWNER381 {
        require(validatorIds.length == nonces.length, "args length mismatch");

        for (uint256 i = 0; i < validatorIds.length; ++i) {
            validatorNonce[validatorIds[i]] = nonces[i];
        }
    } 

    function LOGSTAKED259(	//inject NONSTANDARD NAMING
        address signer,
        bytes memory signerPubkey,
        uint256 validatorId,
        uint256 activationEpoch,
        uint256 amount,
        uint256 total
    ) public ONLYSTAKEMANAGER126 {
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD428(1);
        emit STAKED185(
            signer,
            validatorId,
            validatorNonce[validatorId],
            activationEpoch,
            amount,
            total,
            signerPubkey
        );
    }

    function LOGUNSTAKED47(	//inject NONSTANDARD NAMING
        address user,
        uint256 validatorId,
        uint256 amount,
        uint256 total
    ) public ONLYSTAKEMANAGER126 {
        emit UNSTAKED922(user, validatorId, amount, total);
    }

    function LOGUNSTAKEINIT286(	//inject NONSTANDARD NAMING
        address user,
        uint256 validatorId,
        uint256 deactivationEpoch,
        uint256 amount
    ) public ONLYSTAKEMANAGER126 {
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD428(1);
        emit UNSTAKEINIT987(
            user,
            validatorId,
            validatorNonce[validatorId],
            deactivationEpoch,
            amount
        );
    }

    function LOGSIGNERCHANGE72(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address oldSigner,
        address newSigner,
        bytes memory signerPubkey
    ) public ONLYSTAKEMANAGER126 {
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD428(1);
        emit SIGNERCHANGE548(
            validatorId,
            validatorNonce[validatorId],
            oldSigner,
            newSigner,
            signerPubkey
        );
    }

    function LOGRESTAKED944(uint256 validatorId, uint256 amount, uint256 total)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER126
    {
        emit RESTAKED769(validatorId, amount, total);
    }

    function LOGJAILED178(uint256 validatorId, uint256 exitEpoch, address signer)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER126
    {
        emit JAILED517(validatorId, exitEpoch, signer);
    }

    function LOGUNJAILED801(uint256 validatorId, address signer)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER126
    {
        emit UNJAILED683(validatorId, signer);
    }

    function LOGSLASHED397(uint256 nonce, uint256 amount)	//inject NONSTANDARD NAMING
        public
        ONLYSLASHINGMANAGER551
    {
        emit SLASHED581(nonce, amount);
    }

    function LOGTHRESHOLDCHANGE640(uint256 newThreshold, uint256 oldThreshold)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER126
    {
        emit THRESHOLDCHANGE318(newThreshold, oldThreshold);
    }

    function LOGDYNASTYVALUECHANGE906(uint256 newDynasty, uint256 oldDynasty)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER126
    {
        emit DYNASTYVALUECHANGE497(newDynasty, oldDynasty);
    }

    function LOGPROPOSERBONUSCHANGE801(	//inject NONSTANDARD NAMING
        uint256 newProposerBonus,
        uint256 oldProposerBonus
    ) public ONLYSTAKEMANAGER126 {
        emit PROPOSERBONUSCHANGE479(newProposerBonus, oldProposerBonus);
    }

    function LOGREWARDUPDATE371(uint256 newReward, uint256 oldReward)	//inject NONSTANDARD NAMING
        public
        ONLYSTAKEMANAGER126
    {
        emit REWARDUPDATE192(newReward, oldReward);
    }

    function LOGSTAKEUPDATE216(uint256 validatorId)	//inject NONSTANDARD NAMING
        public
        STAKEMANAGERORVALIDATORCONTRACT869(validatorId)
    {
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD428(1);
        emit STAKEUPDATE665(
            validatorId,
            validatorNonce[validatorId],
            TOTALVALIDATORSTAKE207(validatorId)
        );
    }

    function LOGCLAIMREWARDS307(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        uint256 totalAmount
    ) public ONLYSTAKEMANAGER126 {
        emit CLAIMREWARDS500(validatorId, amount, totalAmount);
    }

    function LOGSTARTAUCTION811(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        uint256 auctionAmount
    ) public ONLYSTAKEMANAGER126 {
        emit STARTAUCTION906(validatorId, amount, auctionAmount);
    }

    function LOGCONFIRMAUCTION158(	//inject NONSTANDARD NAMING
        uint256 newValidatorId,
        uint256 oldValidatorId,
        uint256 amount
    ) public ONLYSTAKEMANAGER126 {
        emit CONFIRMAUCTION329(newValidatorId, oldValidatorId, amount);
    }

    function LOGTOPUPFEE282(address user, uint256 fee) public ONLYSTAKEMANAGER126 {	//inject NONSTANDARD NAMING
        emit TOPUPFEE867(user, fee);
    }

    function LOGCLAIMFEE444(address user, uint256 fee) public ONLYSTAKEMANAGER126 {	//inject NONSTANDARD NAMING
        emit CLAIMFEE345(user, fee);
    }

    function GETSTAKERDETAILS290(uint256 validatorId)	//inject NONSTANDARD NAMING
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
            registry.GETSTAKEMANAGERADDRESS85()
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

    function TOTALVALIDATORSTAKE207(uint256 validatorId)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256 validatorStake)
    {
        address contractAddress;
        (validatorStake, , , , , , contractAddress, ) = IStakeManagerLocal(
            registry.GETSTAKEMANAGERADDRESS85()
        )
            .validators(validatorId);
        if (contractAddress != address(0x0)) {
            validatorStake += IStakeManagerLocal(contractAddress).activeAmount();
        }
    }

    function GETACCOUNTSTATEROOT415()	//inject NONSTANDARD NAMING
        public
        view
        returns (bytes32 accountStateRoot)
    {
        accountStateRoot = IStakeManagerLocal(registry.GETSTAKEMANAGERADDRESS85())
            .accountStateRoot();
    }

    function GETVALIDATORCONTRACTADDRESS234(uint256 validatorId)	//inject NONSTANDARD NAMING
        public
        view
        returns (address ValidatorContract)
    {
        (, , , , , , ValidatorContract, ) = IStakeManagerLocal(
            registry.GETSTAKEMANAGERADDRESS85()
        )
            .validators(validatorId);
    }

    // validator Share contract logging func
    function LOGSHAREMINTED299(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 amount,
        uint256 tokens
    ) public ONLYVALIDATORCONTRACT475(validatorId) {
        emit SHAREMINTED654(validatorId, user, amount, tokens);
    }

    function LOGSHAREBURNED156(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 amount,
        uint256 tokens
    ) public ONLYVALIDATORCONTRACT475(validatorId) {
        emit SHAREBURNED105(validatorId, user, amount, tokens);
    }

    function LOGDELEGATORCLAIMREWARDS877(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 rewards
    ) public ONLYVALIDATORCONTRACT475(validatorId) {
        emit DELEGATORCLAIMEDREWARDS895(validatorId, user, rewards);
    }

    function LOGDELEGATORRESTAKED550(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 totalStaked
    ) public ONLYVALIDATORCONTRACT475(validatorId) {
        emit DELEGATORRESTAKED593(validatorId, user, totalStaked);
    }

    function LOGDELEGATORUNSTAKED380(uint256 validatorId, address user, uint256 amount)	//inject NONSTANDARD NAMING
        public
        ONLYVALIDATORCONTRACT475(validatorId)
    {
        emit DELEGATORUNSTAKED783(validatorId, user, amount);
    }

    function LOGUPDATECOMMISSIONRATE813(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 newCommissionRate,
        uint256 oldCommissionRate
    ) public ONLYVALIDATORCONTRACT475(validatorId) {
        emit UPDATECOMMISSIONRATE768(
            validatorId,
            newCommissionRate,
            oldCommissionRate
        );
    }
}

// File: contracts/common/mixin/Lockable.sol

pragma solidity ^0.5.2;

contract Lockable {
    bool public locked;

    modifier ONLYWHENUNLOCKED142() {	//inject NONSTANDARD NAMING
        _ASSERTUNLOCKED792();
        _;
    }

    function _ASSERTUNLOCKED792() private view {	//inject NONSTANDARD NAMING
        require(!locked, "locked");
    }

    function LOCK876() public {	//inject NONSTANDARD NAMING
        locked = true;
    }

    function UNLOCK86() public {	//inject NONSTANDARD NAMING
        locked = false;
    }
}

// File: contracts/common/mixin/OwnableLockable.sol

pragma solidity ^0.5.2;



contract OwnableLockable is Lockable, Ownable {
    function LOCK876() public ONLYOWNER381 {	//inject NONSTANDARD NAMING
        super.LOCK876();
    }

    function UNLOCK86() public ONLYOWNER381 {	//inject NONSTANDARD NAMING
        super.UNLOCK86();
    }
}

// File: contracts/staking/stakeManager/IStakeManager.sol

pragma solidity ^0.5.2;


contract IStakeManager {
    // validator replacement
    function STARTAUCTION700(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        bool acceptDelegation,
        bytes calldata signerPubkey
    ) external;

    function CONFIRMAUCTIONBID121(uint256 validatorId, uint256 heimdallFee) external;	//inject NONSTANDARD NAMING

    function TRANSFERFUNDS21(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        address delegator
    ) external returns (bool);

    function DELEGATIONDEPOSIT738(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        address delegator
    ) external returns (bool);

    function STAKE198(	//inject NONSTANDARD NAMING
        uint256 amount,
        uint256 heimdallFee,
        bool acceptDelegation,
        bytes calldata signerPubkey
    ) external;

    function UNSTAKE807(uint256 validatorId) external;	//inject NONSTANDARD NAMING

    function TOTALSTAKEDFOR467(address addr) external view returns (uint256);	//inject NONSTANDARD NAMING

    function STAKEFOR357(	//inject NONSTANDARD NAMING
        address user,
        uint256 amount,
        uint256 heimdallFee,
        bool acceptDelegation,
        bytes memory signerPubkey
    ) public;

    function CHECKSIGNATURES879(	//inject NONSTANDARD NAMING
        uint256 blockInterval,
        bytes32 voteHash,
        bytes32 stateRoot,
        address proposer,
        bytes memory sigs
    ) public returns (uint256);

    function UPDATEVALIDATORSTATE309(uint256 validatorId, int256 amount) public;	//inject NONSTANDARD NAMING

    function OWNEROF525(uint256 tokenId) public view returns (address);	//inject NONSTANDARD NAMING

    function SLASH625(bytes memory slashingInfoList) public returns (uint256);	//inject NONSTANDARD NAMING

    function VALIDATORSTAKE293(uint256 validatorId) public view returns (uint256);	//inject NONSTANDARD NAMING

    function EPOCH389() public view returns (uint256);	//inject NONSTANDARD NAMING

    function WITHDRAWALDELAY978() public view returns (uint256);	//inject NONSTANDARD NAMING
}

// File: contracts/staking/validatorShare/IValidatorShare.sol

pragma solidity ^0.5.2;

// note this contract interface is only for stakeManager use
contract IValidatorShare {
    function WITHDRAWREWARDSVALIDATOR585() external returns (uint256);	//inject NONSTANDARD NAMING

    function ADDPROPOSERBONUS599(uint256 _rewards, uint256 valStake) public;	//inject NONSTANDARD NAMING

    function WITHDRAWREWARDS163() public;	//inject NONSTANDARD NAMING

    function UNSTAKECLAIMTOKENS413() public;	//inject NONSTANDARD NAMING

    function GETLIQUIDREWARDS964(address user) public view returns (uint256);	//inject NONSTANDARD NAMING
    
    function GETACTIVEAMOUNT11() external view returns (uint256);	//inject NONSTANDARD NAMING

    function OWNER154() public view returns (address);	//inject NONSTANDARD NAMING

    function RESTAKE313() public;	//inject NONSTANDARD NAMING

    function UPDATEREWARDS95(	//inject NONSTANDARD NAMING
        uint256 _reward,
        uint256 _totalStake,
        uint256 validatorStake
    ) external returns (uint256);

    function UNLOCKCONTRACT602() external returns (uint256);	//inject NONSTANDARD NAMING

    function LOCKCONTRACT813() external returns (uint256);	//inject NONSTANDARD NAMING

    function DRAIN868(	//inject NONSTANDARD NAMING
        address token,
        address payable destination,
        uint256 amount
    ) external;

    function SLASH625(uint256 valPow, uint256 totalAmountToSlash) external returns (uint256);	//inject NONSTANDARD NAMING

    function UPDATEDELEGATION805(bool delegation) external;	//inject NONSTANDARD NAMING
}

// File: contracts/common/mixin/Initializable.sol

pragma solidity ^0.5.2;

contract Initializable {
    bool inited = false;

    modifier INITIALIZER897() {	//inject NONSTANDARD NAMING
        require(!inited, "already inited");
        inited = true;
        
        _;
    }
}

// File: contracts/staking/validatorShare/ValidatorShare.sol

pragma solidity ^0.5.2;








contract ValidatorShare is IValidatorShare, ERC20NonTransferable, OwnableLockable, Initializable {
    struct Delegator {
        uint256 shares;
        uint256 withdrawEpoch;
    }

    uint256 constant exchange_rate_precision200 = 100;	//inject NONSTANDARD NAMING
    uint256 constant max_commision_rate777 = 100;	//inject NONSTANDARD NAMING
    uint256 constant reward_precision113 = 10**25;	//inject NONSTANDARD NAMING

    StakingInfo public stakingLogger;
    IStakeManager public stakeManager;
    uint256 public validatorId;
    uint256 public validatorRewards;
    uint256 public commissionRate;
    //last checkpoint where validator updated commission rate
    uint256 public lastCommissionUpdate;
    uint256 public minAmount = 10**18;

    uint256 public totalStake;
    uint256 public rewardPerShare;
    uint256 public activeAmount;
    bool public delegation = true;

    uint256 public withdrawPool;
    uint256 public withdrawShares;

    mapping(address => uint256) public amountStaked;
    mapping(address => Delegator) public delegators;
    mapping(address => uint256) public initalRewardPerShare;

    modifier ONLYVALIDATOR912() {	//inject NONSTANDARD NAMING
        require(stakeManager.OWNEROF525(validatorId) == msg.sender, "not validator");
        _;
    }

    // onlyOwner will prevent this contract from initializing, since it's owner is going to be 0x0 address
    function INITIALIZE607(uint256 _validatorId, address _stakingLogger, address _stakeManager) external INITIALIZER897  {	//inject NONSTANDARD NAMING
        validatorId = _validatorId;
        stakingLogger = StakingInfo(_stakingLogger);
        stakeManager = IStakeManager(_stakeManager);
        _TRANSFEROWNERSHIP419(_stakeManager);

        minAmount = 10**18;
        delegation = true;
    }

    function UPDATECOMMISSIONRATE983(uint256 newCommissionRate) external ONLYVALIDATOR912 {	//inject NONSTANDARD NAMING
        uint256 epoch = stakeManager.EPOCH389();
        uint256 _lastCommissionUpdate = lastCommissionUpdate;

        require( // withdrawalDelay == dynasty
            (_lastCommissionUpdate.ADD428(stakeManager.WITHDRAWALDELAY978()) <= epoch) || _lastCommissionUpdate == 0, // For initial setting of commission rate
            "Commission rate update cooldown period"
        );

        require(newCommissionRate <= max_commision_rate777, "Commission rate should be in range of 0-100");
        stakingLogger.LOGUPDATECOMMISSIONRATE813(validatorId, newCommissionRate, commissionRate);
        commissionRate = newCommissionRate;
        lastCommissionUpdate = epoch;
    }

    function UPDATEREWARDS95(uint256 reward, uint256 checkpointStakePower, uint256 validatorStake)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER381
        returns (uint256)
    {
                                                                                                                                                                                                                                                                                                                                                                                                                                         
        uint256 combinedStakePower = validatorStake.ADD428(activeAmount); // validator + delegation stake power
        uint256 rewards = combinedStakePower.MUL921(reward).DIV595(checkpointStakePower);

        _UPDATEREWARDS520(rewards, validatorStake, combinedStakePower);
        return combinedStakePower;
    }

    function ADDPROPOSERBONUS599(uint256 rewards, uint256 validatorStake) public ONLYOWNER381 {	//inject NONSTANDARD NAMING
        uint256 combinedStakePower = validatorStake.ADD428(activeAmount);
        _UPDATEREWARDS520(rewards, validatorStake, combinedStakePower);
    }

    function _UPDATEREWARDS520(uint256 rewards, uint256 validatorStake, uint256 combinedStakePower) internal {	//inject NONSTANDARD NAMING
        uint256 _validatorRewards = validatorStake.MUL921(rewards).DIV595(combinedStakePower);

        // add validator commission from delegation rewards
        if (commissionRate > 0) {
            _validatorRewards = _validatorRewards.ADD428(
                rewards.SUB588(_validatorRewards).MUL921(commissionRate).DIV595(max_commision_rate777)
            );
        }

        validatorRewards = validatorRewards.ADD428(_validatorRewards);

        uint256 delegatorsRewards = rewards.SUB588(_validatorRewards);
        uint256 totalShares = TOTALSUPPLY710();
        if (totalShares > 0) {
            rewardPerShare = rewardPerShare.ADD428(
                delegatorsRewards.MUL921(reward_precision113).DIV595(totalShares)
            );
        }
    }

    function WITHDRAWREWARDSVALIDATOR585() external ONLYOWNER381 returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 _validatorRewards = validatorRewards;
        validatorRewards = 0;
        return _validatorRewards;
    }

    function EXCHANGERATE825() public view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 totalShares = TOTALSUPPLY710();
        return
            totalShares == 0
                ? exchange_rate_precision200
                : activeAmount.MUL921(exchange_rate_precision200).DIV595(totalShares);
    }

    function WITHDRAWEXCHANGERATE294() public view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 _withdrawShares = withdrawShares;
        return
            _withdrawShares == 0
                ? exchange_rate_precision200
                : withdrawPool.MUL921(exchange_rate_precision200).DIV595(_withdrawShares);
    }

    function BUYVOUCHER414(uint256 _amount, uint256 _minSharesToMint) public {	//inject NONSTANDARD NAMING
        _WITHDRAWANDTRANSFERREWARD283();
        uint256 amountToDeposit = _BUYSHARES679(_amount, _minSharesToMint);
        require(stakeManager.DELEGATIONDEPOSIT738(validatorId, amountToDeposit, msg.sender), "deposit failed");
    }

    function RESTAKE313() public {	//inject NONSTANDARD NAMING
        uint256 liquidReward = _WITHDRAWREWARD424(msg.sender);
        require(liquidReward >= minAmount, "Too small rewards to restake");

        _BUYSHARES679(liquidReward, 0);

        stakingLogger.LOGDELEGATORRESTAKED550(validatorId, msg.sender, amountStaked[msg.sender]);
    }

    function _BUYSHARES679(uint256 _amount, uint256 _minSharesToMint) private ONLYWHENUNLOCKED142 returns(uint256) {	//inject NONSTANDARD NAMING
        require(delegation, "Delegation is disabled");

        uint256 rate = EXCHANGERATE825();
        uint256 shares = _amount.MUL921(exchange_rate_precision200).DIV595(rate);
        require(shares >= _minSharesToMint, "Too much slippage");
        require(delegators[msg.sender].shares == 0, "Ongoing exit");

        _MINT13(msg.sender, shares);
        
        _amount = _amount.SUB588(_amount % rate.MUL921(shares).DIV595(exchange_rate_precision200));

        totalStake = totalStake.ADD428(_amount);
        amountStaked[msg.sender] = amountStaked[msg.sender].ADD428(_amount);

        activeAmount = activeAmount.ADD428(_amount);
        stakeManager.UPDATEVALIDATORSTATE309(validatorId, int256(_amount));

        StakingInfo logger = stakingLogger;
        logger.LOGSHAREMINTED299(validatorId, msg.sender, _amount, shares);
        logger.LOGSTAKEUPDATE216(validatorId);

        return _amount;
    }

    function SELLVOUCHER152(uint256 _minClaimAmount) public {	//inject NONSTANDARD NAMING
        uint256 shares = BALANCEOF852(msg.sender);
        require(shares > 0, "Zero balance");

        uint256 rate = EXCHANGERATE825();
        uint256 _amount = rate.MUL921(shares).DIV595(exchange_rate_precision200);
        require(_amount >= _minClaimAmount, "Too much slippage");

        _WITHDRAWANDTRANSFERREWARD283();
        
        _BURN567(msg.sender, shares);
        stakeManager.UPDATEVALIDATORSTATE309(validatorId, -int256(_amount));

        activeAmount = activeAmount.SUB588(_amount);
        uint256 _withdrawPoolShare = _amount.MUL921(exchange_rate_precision200).DIV595(WITHDRAWEXCHANGERATE294());

        withdrawPool = withdrawPool.ADD428(_amount);
        withdrawShares = withdrawShares.ADD428(_withdrawPoolShare);
        delegators[msg.sender] = Delegator({shares: _withdrawPoolShare, withdrawEpoch: stakeManager.EPOCH389()});
        amountStaked[msg.sender] = 0;

        StakingInfo logger = stakingLogger;
        logger.LOGSHAREBURNED156(validatorId, msg.sender, _amount, shares);
        logger.LOGSTAKEUPDATE216(validatorId);
    }

    function _WITHDRAWREWARD424(address user) private returns(uint256) {	//inject NONSTANDARD NAMING
        uint256 liquidRewards = GETLIQUIDREWARDS964(user);
        initalRewardPerShare[user] = rewardPerShare;
        return liquidRewards;
    }

    function _WITHDRAWANDTRANSFERREWARD283() private returns(uint256) {	//inject NONSTANDARD NAMING
        uint256 liquidRewards = _WITHDRAWREWARD424(msg.sender);
        
        if (liquidRewards > 0) {
            require(stakeManager.TRANSFERFUNDS21(validatorId, liquidRewards, msg.sender), "Insufficent rewards");
            stakingLogger.LOGDELEGATORCLAIMREWARDS877(validatorId, msg.sender, liquidRewards);
        }
        
        return liquidRewards;
    }

    function WITHDRAWREWARDS163() public {	//inject NONSTANDARD NAMING
        uint256 rewards = _WITHDRAWANDTRANSFERREWARD283();
        require(rewards >= minAmount, "Too small rewards amount");
    }

    function GETLIQUIDREWARDS964(address user) public view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 shares = BALANCEOF852(user);
        if (shares == 0) {
            return 0;
        }

        return rewardPerShare.SUB588(initalRewardPerShare[user]).MUL921(shares).DIV595(reward_precision113);
    }

    function UNSTAKECLAIMTOKENS413() public {	//inject NONSTANDARD NAMING
        Delegator storage delegator = delegators[msg.sender];

        uint256 shares = delegator.shares;
        require(
            delegator.withdrawEpoch.ADD428(stakeManager.WITHDRAWALDELAY978()) <= stakeManager.EPOCH389() && shares > 0,
            "Incomplete withdrawal period"
        );

        uint256 _amount = WITHDRAWEXCHANGERATE294().MUL921(shares).DIV595(exchange_rate_precision200);
        withdrawShares = withdrawShares.SUB588(shares);
        withdrawPool = withdrawPool.SUB588(_amount);

        totalStake = totalStake.SUB588(_amount);

        require(stakeManager.TRANSFERFUNDS21(validatorId, _amount, msg.sender), "Insufficent rewards");
        stakingLogger.LOGDELEGATORUNSTAKED380(validatorId, msg.sender, _amount);
        delete delegators[msg.sender];
    }

    function SLASH625(uint256 valPow, uint256 totalAmountToSlash) external ONLYOWNER381 returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 _withdrawPool = withdrawPool;
        uint256 delegationAmount = activeAmount.ADD428(_withdrawPool);
        if (delegationAmount == 0) {
            return 0;
        }
        // total amount to be slashed from delegation pool (active + inactive)
        uint256 _amountToSlash = delegationAmount.MUL921(totalAmountToSlash).DIV595(valPow.ADD428(delegationAmount));
        uint256 _amountToSlashWithdrawalPool = _withdrawPool.MUL921(_amountToSlash).DIV595(delegationAmount);

        // slash inactive pool
        withdrawPool = _withdrawPool.SUB588(_amountToSlashWithdrawalPool);
        activeAmount = activeAmount.SUB588(_amountToSlash.SUB588(_amountToSlashWithdrawalPool));
        return _amountToSlash;
    }

    function UPDATEDELEGATION805(bool _delegation) external ONLYOWNER381 {	//inject NONSTANDARD NAMING
        delegation = _delegation;
    }

    function DRAIN868(	//inject NONSTANDARD NAMING
        address token,
        address payable destination,
        uint256 amount
    ) external ONLYOWNER381 {
        if (token == address(0x0)) {
            destination.transfer(amount);
        } else {
            require(ERC20(token).TRANSFER36(destination, amount), "Drain failed");
        }
    }

    function GETACTIVEAMOUNT11() external view returns(uint256) {	//inject NONSTANDARD NAMING
        return activeAmount;
    }

    function UNLOCKCONTRACT602() external ONLYOWNER381 returns (uint256) {	//inject NONSTANDARD NAMING
        UNLOCK86();
        return activeAmount;
    }

    function LOCKCONTRACT813() external ONLYOWNER381 returns (uint256) {	//inject NONSTANDARD NAMING
        LOCK876();
        return activeAmount;
    }
}