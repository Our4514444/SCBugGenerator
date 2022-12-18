                                                                 

// File: openzeppelin-solidity/contracts/ownership/Ownable.sol

pragma solidity ^0.5.2;


                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED475(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor() internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED475(address(0), _owner);
    }

                                                        
    function OWNER86() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER604() {	//inject NONSTANDARD NAMING
        require(ISOWNER135());
        _;
    }

                                                                                 
    function ISOWNER135() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP780() public ONLYOWNER604 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED475(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP504(address newOwner) public ONLYOWNER604 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP237(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP237(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED475(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/common/misc/ProxyStorage.sol

pragma solidity ^0.5.2;


contract ProxyStorage is Ownable {
    address internal proxyTo;
}

// File: contracts/common/misc/ERCProxy.sol

                                          

pragma solidity ^0.5.2;


// See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-897.md

interface ERCProxy {
    function PROXYTYPE562() external pure returns (uint256 proxyTypeId);	//inject NONSTANDARD NAMING

    function IMPLEMENTATION927() external view returns (address codeAddr);	//inject NONSTANDARD NAMING
}

// File: contracts/common/misc/DelegateProxy.sol

pragma solidity ^0.5.2;


contract DelegateProxy is ERCProxy {
    function PROXYTYPE562() external pure returns (uint256 proxyTypeId) {	//inject NONSTANDARD NAMING
        // Upgradeable proxy
        proxyTypeId = 2;
    }

    function IMPLEMENTATION927() external view returns (address);	//inject NONSTANDARD NAMING

    function DELEGATEDFWD672(address _dst, bytes memory _calldata) internal {	//inject NONSTANDARD NAMING
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            let result := delegatecall(sub(gas, 10000), _dst, add(_calldata, 0x20), mload(_calldata), 0, 0)
            let size := returndatasize

            let ptr := mload(0x40)
            returndatacopy(ptr, 0, size)

            // revert instead of invalid() bc if the underlying call failed with invalid() it already wasted gas.
            // if the call returned error data, forward it
            switch result
                case 0 {
                    revert(ptr, size)
                }
                default {
                    return(ptr, size)
                }
        }
    }
}

// File: contracts/common/misc/Proxy.sol

pragma solidity ^0.5.2;


contract Proxy is ProxyStorage, DelegateProxy {
    event PROXYUPDATED966(address indexed _new, address indexed _old);	//inject NONSTANDARD NAMING
    event OWNERUPDATE731(address _prevOwner, address _newOwner);	//inject NONSTANDARD NAMING

    constructor(address _proxyTo) public {
        UPDATEIMPLEMENTATION621(_proxyTo);
    }

    function() external payable {
        // require(currentContract != 0, "If app code has not been set yet, do not call");
        // Todo: filter out some calls or handle in the end fallback
        DELEGATEDFWD672(proxyTo, msg.data);
    }

    function IMPLEMENTATION927() external view returns (address) {	//inject NONSTANDARD NAMING
        return proxyTo;
    }

    function UPDATEIMPLEMENTATION621(address _newProxyTo) public ONLYOWNER604 {	//inject NONSTANDARD NAMING
        require(_newProxyTo != address(0x0), "INVALID_PROXY_ADDRESS");
        require(ISCONTRACT453(_newProxyTo), "DESTINATION_ADDRESS_IS_NOT_A_CONTRACT");
        emit PROXYUPDATED966(_newProxyTo, proxyTo);
        proxyTo = _newProxyTo;
    }

    function ISCONTRACT453(address _target) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if (_target == address(0)) {
            return false;
        }

        uint256 size;
        assembly {
            size := extcodesize(_target)
        }
        return size > 0;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.2;


                                                                                   
interface IERC20 {
    function TRANSFER12(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE585(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM924(	//inject NONSTANDARD NAMING
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function TOTALSUPPLY456() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF877(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE790(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER562(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL13(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.2;


                                                                                                   
library SafeMath {
                                                                                  
    function MUL297(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV540(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB545(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD92(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD20(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20.sol

pragma solidity ^0.5.2;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY456() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF877(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE790(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER12(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER529(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE585(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE727(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM924(	//inject NONSTANDARD NAMING
        address from,
        address to,
        uint256 value
    ) public returns (bool) {
        _TRANSFER529(from, to, value);
        _APPROVE727(from, msg.sender, _allowed[from][msg.sender].SUB545(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE861(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE727(msg.sender, spender, _allowed[msg.sender][spender].ADD92(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE955(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE727(msg.sender, spender, _allowed[msg.sender][spender].SUB545(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER529(	//inject NONSTANDARD NAMING
        address from,
        address to,
        uint256 value
    ) internal {
        require(to != address(0));

        _balances[from] = _balances[from].SUB545(value);
        _balances[to] = _balances[to].ADD92(value);
        emit TRANSFER562(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT721(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD92(value);
        _balances[account] = _balances[account].ADD92(value);
        emit TRANSFER562(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN591(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB545(value);
        _balances[account] = _balances[account].SUB545(value);
        emit TRANSFER562(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE727(	//inject NONSTANDARD NAMING
        address owner,
        address spender,
        uint256 value
    ) internal {
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL13(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM450(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN591(account, value);
        _APPROVE727(account, msg.sender, _allowed[account][msg.sender].SUB545(value));
    }
}

// File: contracts/common/governance/IGovernance.sol

pragma solidity ^0.5.2;


interface IGovernance {
    function UPDATE633(address target, bytes calldata data) external;	//inject NONSTANDARD NAMING
}

// File: contracts/common/governance/Governable.sol

pragma solidity ^0.5.2;


contract Governable {
    IGovernance public governance;

    constructor(address _governance) public {
        governance = IGovernance(_governance);
    }

    modifier ONLYGOVERNANCE974() {	//inject NONSTANDARD NAMING
        require(msg.sender == address(governance), "Only governance contract is authorized");
        _;
    }
}

// File: contracts/common/mixin/Lockable.sol

pragma solidity ^0.5.2;


contract Lockable is Governable {
    bool public locked;

    modifier ONLYWHENUNLOCKED326() {	//inject NONSTANDARD NAMING
        require(!locked, "Is Locked");
        _;
    }

    constructor(address _governance) public Governable(_governance) {}

    function LOCK776() external ONLYGOVERNANCE974 {	//inject NONSTANDARD NAMING
        locked = true;
    }

    function UNLOCK236() external ONLYGOVERNANCE974 {	//inject NONSTANDARD NAMING
        locked = false;
    }
}

// File: contracts/root/withdrawManager/IWithdrawManager.sol

pragma solidity ^0.5.2;


contract IWithdrawManager {
    function CREATEEXITQUEUE669(address token) external;	//inject NONSTANDARD NAMING

    function VERIFYINCLUSION120(	//inject NONSTANDARD NAMING
        bytes calldata data,
        uint8 offset,
        bool verifyTxInclusion
    ) external view returns (uint256 age);

    function ADDEXITTOQUEUE863(	//inject NONSTANDARD NAMING
        address exitor,
        address childToken,
        address rootToken,
        uint256 exitAmountOrTokenId,
        bytes32 txHash,
        bool isRegularExit,
        uint256 priority
    ) external;

    function ADDINPUT583(	//inject NONSTANDARD NAMING
        uint256 exitId,
        uint256 age,
        address utxoOwner,
        address token
    ) external;

    function CHALLENGEEXIT162(	//inject NONSTANDARD NAMING
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
    bytes32 private constant weth_token624 = keccak256("wethToken");	//inject NONSTANDARD NAMING
    bytes32 private constant deposit_manager215 = keccak256("depositManager");	//inject NONSTANDARD NAMING
    bytes32 private constant stake_manager798 = keccak256("stakeManager");	//inject NONSTANDARD NAMING
    bytes32 private constant validator_share891 = keccak256("validatorShare");	//inject NONSTANDARD NAMING
    bytes32 private constant withdraw_manager268 = keccak256("withdrawManager");	//inject NONSTANDARD NAMING
    bytes32 private constant child_chain503 = keccak256("childChain");	//inject NONSTANDARD NAMING
    bytes32 private constant state_sender264 = keccak256("stateSender");	//inject NONSTANDARD NAMING
    bytes32 private constant slashing_manager419 = keccak256("slashingManager");	//inject NONSTANDARD NAMING

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

    event TOKENMAPPED560(address indexed rootToken, address indexed childToken);	//inject NONSTANDARD NAMING
    event PROOFVALIDATORADDED43(address indexed validator, address indexed from);	//inject NONSTANDARD NAMING
    event PROOFVALIDATORREMOVED60(address indexed validator, address indexed from);	//inject NONSTANDARD NAMING
    event PREDICATEADDED735(address indexed predicate, address indexed from);	//inject NONSTANDARD NAMING
    event PREDICATEREMOVED68(address indexed predicate, address indexed from);	//inject NONSTANDARD NAMING
    event CONTRACTMAPUPDATED392(bytes32 indexed key, address indexed previousContract, address indexed newContract);	//inject NONSTANDARD NAMING

    constructor(address _governance) public Governable(_governance) {}

    function UPDATECONTRACTMAP536(bytes32 _key, address _address) external ONLYGOVERNANCE974 {	//inject NONSTANDARD NAMING
        emit CONTRACTMAPUPDATED392(_key, contractMap[_key], _address);
        contractMap[_key] = _address;
    }

                                                                                                                                                                                                                                      
    function MAPTOKEN989(	//inject NONSTANDARD NAMING
        address _rootToken,
        address _childToken,
        bool _isERC721
    ) external ONLYGOVERNANCE974 {
        require(_rootToken != address(0x0) && _childToken != address(0x0), "INVALID_TOKEN_ADDRESS");
        rootToChildToken[_rootToken] = _childToken;
        childToRootToken[_childToken] = _rootToken;
        isERC721[_rootToken] = _isERC721;
        IWithdrawManager(contractMap[withdraw_manager268]).CREATEEXITQUEUE669(_rootToken);
        emit TOKENMAPPED560(_rootToken, _childToken);
    }

    function ADDERC20PREDICATE563(address predicate) public ONLYGOVERNANCE974 {	//inject NONSTANDARD NAMING
        require(predicate != address(0x0), "Can not add null address as predicate");
        erc20Predicate = predicate;
        ADDPREDICATE303(predicate, Type.ERC20);
    }

    function ADDERC721PREDICATE414(address predicate) public ONLYGOVERNANCE974 {	//inject NONSTANDARD NAMING
        erc721Predicate = predicate;
        ADDPREDICATE303(predicate, Type.ERC721);
    }

    function ADDPREDICATE303(address predicate, Type _type) public ONLYGOVERNANCE974 {	//inject NONSTANDARD NAMING
        require(predicates[predicate]._type == Type.Invalid, "Predicate already added");
        predicates[predicate]._type = _type;
        emit PREDICATEADDED735(predicate, msg.sender);
    }

    function REMOVEPREDICATE11(address predicate) public ONLYGOVERNANCE974 {	//inject NONSTANDARD NAMING
        require(predicates[predicate]._type != Type.Invalid, "Predicate does not exist");
        delete predicates[predicate];
        emit PREDICATEREMOVED68(predicate, msg.sender);
    }

    function GETVALIDATORSHAREADDRESS659() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[validator_share891];
    }

    function GETWETHTOKENADDRESS285() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[weth_token624];
    }

    function GETDEPOSITMANAGERADDRESS810() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[deposit_manager215];
    }

    function GETSTAKEMANAGERADDRESS446() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[stake_manager798];
    }

    function GETSLASHINGMANAGERADDRESS772() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[slashing_manager419];
    }

    function GETWITHDRAWMANAGERADDRESS79() public view returns (address) {	//inject NONSTANDARD NAMING
        return contractMap[withdraw_manager268];
    }

    function GETCHILDCHAINANDSTATESENDER542() public view returns (address, address) {	//inject NONSTANDARD NAMING
        return (contractMap[child_chain503], contractMap[state_sender264]);
    }

    function ISTOKENMAPPED37(address _token) public view returns (bool) {	//inject NONSTANDARD NAMING
        return rootToChildToken[_token] != address(0x0);
    }

    function ISTOKENMAPPEDANDISERC721936(address _token) public view returns (bool) {	//inject NONSTANDARD NAMING
        require(ISTOKENMAPPED37(_token), "TOKEN_NOT_MAPPED");
        return isERC721[_token];
    }

    function ISTOKENMAPPEDANDGETPREDICATE282(address _token) public view returns (address) {	//inject NONSTANDARD NAMING
        if (ISTOKENMAPPEDANDISERC721936(_token)) {
            return erc721Predicate;
        }
        return erc20Predicate;
    }

    function ISCHILDTOKENERC72198(address childToken) public view returns (bool) {	//inject NONSTANDARD NAMING
        address rootToken = childToRootToken[childToken];
        require(rootToken != address(0x0), "Child token is not mapped");
        return isERC721[rootToken];
    }
}

// File: contracts/common/lib/BytesLib.sol

pragma solidity ^0.5.2;


library BytesLib {
    function CONCAT3(bytes memory _preBytes, bytes memory _postBytes) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
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

    function SLICE169(	//inject NONSTANDARD NAMING
        bytes memory _bytes,
        uint256 _start,
        uint256 _length
    ) internal pure returns (bytes memory) {
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
                    let mc := add(add(tempBytes, lengthmod), mul(0x20, iszero(lengthmod)))
                    let end := add(mc, _length)

                    for {
                        // The multiplication in the next line has the same exact purpose
                        // as the one above.
                        let cc := add(add(add(_bytes, lengthmod), mul(0x20, iszero(lengthmod))), _start)
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
    function LEFTPAD328(bytes memory _bytes) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        // may underflow if bytes.length < 32. Hence using SafeMath.sub
        bytes memory newBytes = new bytes(SafeMath.SUB545(32, _bytes.length));
        return CONCAT3(newBytes, _bytes);
    }

    function TOBYTES32596(bytes memory b) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        require(b.length >= 32, "Bytes array should atleast be 32 bytes");
        bytes32 out;
        for (uint256 i = 0; i < 32; i++) {
            out |= bytes32(b[i] & 0xFF) >> (i * 8);
        }
        return out;
    }

    function TOBYTES4780(bytes memory b) internal pure returns (bytes4 result) {	//inject NONSTANDARD NAMING
        assembly {
            result := mload(add(b, 32))
        }
    }

    function FROMBYTES32587(bytes32 x) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        bytes memory b = new bytes(32);
        for (uint256 i = 0; i < 32; i++) {
            b[i] = bytes1(uint8(uint256(x) / (2**(8 * (31 - i)))));
        }
        return b;
    }

    function FROMUINT685(uint256 _num) internal pure returns (bytes memory _ret) {	//inject NONSTANDARD NAMING
        _ret = new bytes(32);
        assembly {
            mstore(add(_ret, 32), _num)
        }
    }

    function TOUINT231(bytes memory _bytes, uint256 _start) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(_bytes.length >= (_start + 32));
        uint256 tempUint;
        assembly {
            tempUint := mload(add(add(_bytes, 0x20), _start))
        }
        return tempUint;
    }

    function TOADDRESS380(bytes memory _bytes, uint256 _start) internal pure returns (address) {	//inject NONSTANDARD NAMING
        require(_bytes.length >= (_start + 20));
        address tempAddress;
        assembly {
            tempAddress := div(mload(add(add(_bytes, 0x20), _start)), 0x1000000000000000000000000)
        }

        return tempAddress;
    }
}

// File: contracts/common/lib/ECVerify.sol

pragma solidity ^0.5.2;


library ECVerify {
    function ECRECOVERY796(bytes32 hash, bytes memory sig) public pure returns (address) {	//inject NONSTANDARD NAMING
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

    function ECRECOVERY796(	//inject NONSTANDARD NAMING
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public pure returns (address) {
        // get address out of hash and signature
        address result = ecrecover(hash, v, r, s);

        // ecrecover returns zero on error
        require(result != address(0x0), "signature verification failed");

        return result;
    }

    function ECVERIFY761(	//inject NONSTANDARD NAMING
        bytes32 hash,
        bytes memory sig,
        address signer
    ) public pure returns (bool) {
        return signer == ECRECOVERY796(hash, sig);
    }
}

// File: contracts/staking/StakingInfo.sol

pragma solidity ^0.5.2;


// dummy interface to avoid cyclic dependency
contract IStakeManager1 {
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

    function CURRENTVALIDATORSETTOTALSTAKE604() public view returns (uint256);	//inject NONSTANDARD NAMING

    // signer to Validator mapping
    function SIGNERTOVALIDATOR485(address validatorAddress) public view returns (uint256);	//inject NONSTANDARD NAMING

    function ISVALIDATOR485(uint256 validatorId) public view returns (bool);	//inject NONSTANDARD NAMING
}


contract StakingInfo {
    using SafeMath for uint256;
    mapping(uint256 => uint256) public validatorNonce;

                                                                            
                                        
                                                                  
                                                          
                                                                   
                                     
                                          
                                                       
    event STAKED157(	//inject NONSTANDARD NAMING
        address indexed signer,
        uint256 indexed validatorId,
        uint256 nonce,
        uint256 indexed activationEpoch,
        uint256 amount,
        uint256 total,
        bytes signerPubkey
    );

                                                                
                                             
                                                                  
                                     
                                          
    event UNSTAKED774(address indexed user, uint256 indexed validatorId, uint256 amount, uint256 total);	//inject NONSTANDARD NAMING

                                                             
                                             
                                                                  
                                                          
                                                          
                                     
    event UNSTAKEINIT405(	//inject NONSTANDARD NAMING
        address indexed user,
        uint256 indexed validatorId,
        uint256 nonce,
        uint256 deactivationEpoch,
        uint256 indexed amount
    );

                                                                                  
                                                                  
                                                          
                                                      
                                                      
                                                        
    event SIGNERCHANGE684(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 nonce,
        address indexed oldSigner,
        address indexed newSigner,
        bytes signerPubkey
    );
    event RESTAKED485(uint256 indexed validatorId, uint256 amount, uint256 total);	//inject NONSTANDARD NAMING
    event JAILED253(uint256 indexed validatorId, uint256 indexed exitEpoch, address indexed signer);	//inject NONSTANDARD NAMING
    event UNJAILED161(uint256 indexed validatorId, address indexed signer);	//inject NONSTANDARD NAMING
    event SLASHED197(uint256 indexed nonce, uint256 indexed amount);	//inject NONSTANDARD NAMING
    event THRESHOLDCHANGE515(uint256 newThreshold, uint256 oldThreshold);	//inject NONSTANDARD NAMING
    event DYNASTYVALUECHANGE156(uint256 newDynasty, uint256 oldDynasty);	//inject NONSTANDARD NAMING
    event PROPOSERBONUSCHANGE332(uint256 newProposerBonus, uint256 oldProposerBonus);	//inject NONSTANDARD NAMING

    event REWARDUPDATE273(uint256 newReward, uint256 oldReward);	//inject NONSTANDARD NAMING

                                                                                                                               
                                                                  
                                                          
                                                  
    event STAKEUPDATE114(uint256 indexed validatorId, uint256 indexed nonce, uint256 indexed newAmount);	//inject NONSTANDARD NAMING
    event CLAIMREWARDS233(uint256 indexed validatorId, uint256 indexed amount, uint256 indexed totalAmount);	//inject NONSTANDARD NAMING
    event STARTAUCTION355(uint256 indexed validatorId, uint256 indexed amount, uint256 indexed auctionAmount);	//inject NONSTANDARD NAMING
    event CONFIRMAUCTION718(uint256 indexed newValidatorId, uint256 indexed oldValidatorId, uint256 indexed amount);	//inject NONSTANDARD NAMING
    event TOPUPFEE99(address indexed user, uint256 indexed fee);	//inject NONSTANDARD NAMING
    event CLAIMFEE372(address indexed user, uint256 indexed fee);	//inject NONSTANDARD NAMING
    // Delegator events
    event SHAREMINTED474(uint256 indexed validatorId, address indexed user, uint256 indexed amount, uint256 tokens);	//inject NONSTANDARD NAMING
    event SHAREBURNED518(uint256 indexed validatorId, address indexed user, uint256 indexed amount, uint256 tokens);	//inject NONSTANDARD NAMING
    event DELEGATORCLAIMEDREWARDS556(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        address indexed user,
        uint256 indexed rewards,
        uint256 tokens
    );
    event DELEGATORRESTAKED306(uint256 indexed validatorId, address indexed user, uint256 indexed totalStaked);	//inject NONSTANDARD NAMING
    event DELEGATORUNSTAKED17(uint256 indexed validatorId, address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event UPDATECOMMISSIONRATE732(	//inject NONSTANDARD NAMING
        uint256 indexed validatorId,
        uint256 indexed newCommissionRate,
        uint256 indexed oldCommissionRate
    );

    Registry public registry;

    modifier ONLYVALIDATORCONTRACT465(uint256 validatorId) {	//inject NONSTANDARD NAMING
        address _contract;
        (, , , , , , _contract, ) = IStakeManager1(registry.GETSTAKEMANAGERADDRESS446()).validators(validatorId);
        require(_contract == msg.sender, "Invalid sender, not validator");
        _;
    }

    modifier STAKEMANAGERORVALIDATORCONTRACT110(uint256 validatorId) {	//inject NONSTANDARD NAMING
        address _contract;
        address _stakeManager = registry.GETSTAKEMANAGERADDRESS446();
        (, , , , , , _contract, ) = IStakeManager1(_stakeManager).validators(validatorId);
        require(
            _contract == msg.sender || _stakeManager == msg.sender,
            "Invalid sender, not stake manager or validator contract"
        );
        _;
    }

    modifier ONLYSTAKEMANAGER763() {	//inject NONSTANDARD NAMING
        require(registry.GETSTAKEMANAGERADDRESS446() == msg.sender, "Invalid sender, not stake manager");
        _;
    }
    modifier ONLYSLASHINGMANAGER455() {	//inject NONSTANDARD NAMING
        require(registry.GETSLASHINGMANAGERADDRESS772() == msg.sender, "Invalid sender, not slashing manager");
        _;
    }

    constructor(address _registry) public {
        registry = Registry(_registry);
    }

    function LOGSTAKED6(	//inject NONSTANDARD NAMING
        address signer,
        bytes memory signerPubkey,
        uint256 validatorId,
        uint256 activationEpoch,
        uint256 amount,
        uint256 total
    ) public ONLYSTAKEMANAGER763 {
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD92(1);
        emit STAKED157(signer, validatorId, validatorNonce[validatorId], activationEpoch, amount, total, signerPubkey);
    }

    function LOGUNSTAKED210(	//inject NONSTANDARD NAMING
        address user,
        uint256 validatorId,
        uint256 amount,
        uint256 total
    ) public ONLYSTAKEMANAGER763 {
        emit UNSTAKED774(user, validatorId, amount, total);
    }

    function LOGUNSTAKEINIT187(	//inject NONSTANDARD NAMING
        address user,
        uint256 validatorId,
        uint256 deactivationEpoch,
        uint256 amount
    ) public ONLYSTAKEMANAGER763 {
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD92(1);
        emit UNSTAKEINIT405(user, validatorId, validatorNonce[validatorId], deactivationEpoch, amount);
    }

    function LOGSIGNERCHANGE749(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address oldSigner,
        address newSigner,
        bytes memory signerPubkey
    ) public ONLYSTAKEMANAGER763 {
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD92(1);
        emit SIGNERCHANGE684(validatorId, validatorNonce[validatorId], oldSigner, newSigner, signerPubkey);
    }

    function LOGRESTAKED488(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        uint256 total
    ) public ONLYSTAKEMANAGER763 {
        emit RESTAKED485(validatorId, amount, total);
    }

    function LOGJAILED622(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 exitEpoch,
        address signer
    ) public ONLYSTAKEMANAGER763 {
        emit JAILED253(validatorId, exitEpoch, signer);
    }

    function LOGUNJAILED759(uint256 validatorId, address signer) public ONLYSTAKEMANAGER763 {	//inject NONSTANDARD NAMING
        emit UNJAILED161(validatorId, signer);
    }

    function LOGSLASHED651(uint256 nonce, uint256 amount) public ONLYSLASHINGMANAGER455 {	//inject NONSTANDARD NAMING
        emit SLASHED197(nonce, amount);
    }

    function LOGTHRESHOLDCHANGE896(uint256 newThreshold, uint256 oldThreshold) public ONLYSTAKEMANAGER763 {	//inject NONSTANDARD NAMING
        emit THRESHOLDCHANGE515(newThreshold, oldThreshold);
    }

    function LOGDYNASTYVALUECHANGE225(uint256 newDynasty, uint256 oldDynasty) public ONLYSTAKEMANAGER763 {	//inject NONSTANDARD NAMING
        emit DYNASTYVALUECHANGE156(newDynasty, oldDynasty);
    }

    function LOGPROPOSERBONUSCHANGE228(uint256 newProposerBonus, uint256 oldProposerBonus) public ONLYSTAKEMANAGER763 {	//inject NONSTANDARD NAMING
        emit PROPOSERBONUSCHANGE332(newProposerBonus, oldProposerBonus);
    }

    function LOGREWARDUPDATE194(uint256 newReward, uint256 oldReward) public ONLYSTAKEMANAGER763 {	//inject NONSTANDARD NAMING
        emit REWARDUPDATE273(newReward, oldReward);
    }

    function LOGSTAKEUPDATE518(uint256 validatorId) public STAKEMANAGERORVALIDATORCONTRACT110(validatorId) {	//inject NONSTANDARD NAMING
        validatorNonce[validatorId] = validatorNonce[validatorId].ADD92(1);
        emit STAKEUPDATE114(validatorId, validatorNonce[validatorId], TOTALVALIDATORSTAKE156(validatorId));
    }

    function LOGCLAIMREWARDS995(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        uint256 totalAmount
    ) public ONLYSTAKEMANAGER763 {
        emit CLAIMREWARDS233(validatorId, amount, totalAmount);
    }

    function LOGSTARTAUCTION304(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        uint256 auctionAmount
    ) public ONLYSTAKEMANAGER763 {
        emit STARTAUCTION355(validatorId, amount, auctionAmount);
    }

    function LOGCONFIRMAUCTION425(	//inject NONSTANDARD NAMING
        uint256 newValidatorId,
        uint256 oldValidatorId,
        uint256 amount
    ) public ONLYSTAKEMANAGER763 {
        emit CONFIRMAUCTION718(newValidatorId, oldValidatorId, amount);
    }

    function LOGTOPUPFEE175(address user, uint256 fee) public ONLYSTAKEMANAGER763 {	//inject NONSTANDARD NAMING
        emit TOPUPFEE99(user, fee);
    }

    function LOGCLAIMFEE666(address user, uint256 fee) public ONLYSTAKEMANAGER763 {	//inject NONSTANDARD NAMING
        emit CLAIMFEE372(user, fee);
    }

    function GETSTAKERDETAILS616(uint256 validatorId)	//inject NONSTANDARD NAMING
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
        IStakeManager1 stakeManager = IStakeManager1(registry.GETSTAKEMANAGERADDRESS446());
        address _contract;
        IStakeManager1.Status status;
        (amount, reward, activationEpoch, deactivationEpoch, , signer, _contract, status) = stakeManager.validators(
            validatorId
        );
        reward += IStakeManager1(_contract).validatorRewards();
        _status = uint256(status);
    }

    function TOTALVALIDATORSTAKE156(uint256 validatorId) public view returns (uint256 validatorStake) {	//inject NONSTANDARD NAMING
        address contractAddress;
        (validatorStake, , , , , , contractAddress, ) = IStakeManager1(registry.GETSTAKEMANAGERADDRESS446()).validators(
            validatorId
        );
        if (contractAddress != address(0x0)) {
            validatorStake += IStakeManager1(contractAddress).activeAmount();
        }
    }

    function GETACCOUNTSTATEROOT392() public view returns (bytes32 accountStateRoot) {	//inject NONSTANDARD NAMING
        accountStateRoot = IStakeManager1(registry.GETSTAKEMANAGERADDRESS446()).accountStateRoot();
    }

    function GETVALIDATORCONTRACTADDRESS94(uint256 validatorId) public view returns (address ValidatorContract) {	//inject NONSTANDARD NAMING
        (, , , , , , ValidatorContract, ) = IStakeManager1(registry.GETSTAKEMANAGERADDRESS446()).validators(validatorId);
    }

    // validator Share contract logging func
    function LOGSHAREMINTED377(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 amount,
        uint256 tokens
    ) public ONLYVALIDATORCONTRACT465(validatorId) {
        emit SHAREMINTED474(validatorId, user, amount, tokens);
    }

    function LOGSHAREBURNED640(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 amount,
        uint256 tokens
    ) public ONLYVALIDATORCONTRACT465(validatorId) {
        emit SHAREBURNED518(validatorId, user, amount, tokens);
    }

    function LOGDELEGATORCLAIMREWARDS688(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 rewards,
        uint256 tokens
    ) public ONLYVALIDATORCONTRACT465(validatorId) {
        emit DELEGATORCLAIMEDREWARDS556(validatorId, user, rewards, tokens);
    }

    function LOGDELEGATORRESTAKED147(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 totalStaked
    ) public ONLYVALIDATORCONTRACT465(validatorId) {
        emit DELEGATORRESTAKED306(validatorId, user, totalStaked);
    }

    function LOGDELEGATORUNSTAKED775(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address user,
        uint256 amount
    ) public ONLYVALIDATORCONTRACT465(validatorId) {
        emit DELEGATORUNSTAKED17(validatorId, user, amount);
    }

    function LOGUPDATECOMMISSIONRATE252(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 newCommissionRate,
        uint256 oldCommissionRate
    ) public ONLYVALIDATORCONTRACT465(validatorId) {
        emit UPDATECOMMISSIONRATE732(validatorId, newCommissionRate, oldCommissionRate);
    }
}

// File: contracts/staking/stakeManager/IStakeManager.sol

pragma solidity ^0.5.2;


contract IStakeManager {
    // validator replacement
    function STARTAUCTION879(uint256 validatorId, uint256 amount) external;	//inject NONSTANDARD NAMING

    function CONFIRMAUCTIONBID577(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 heimdallFee,
        bool acceptDelegation,
        bytes calldata signerPubkey
    ) external;

    function TRANSFERFUNDS120(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        address delegator
    ) external returns (bool);

    function DELEGATIONDEPOSIT42(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        uint256 amount,
        address delegator
    ) external returns (bool);

    function STAKE969(	//inject NONSTANDARD NAMING
        uint256 amount,
        uint256 heimdallFee,
        bool acceptDelegation,
        bytes calldata signerPubkey
    ) external;

    function UNSTAKE680(uint256 validatorId) external;	//inject NONSTANDARD NAMING

    function TOTALSTAKEDFOR857(address addr) external view returns (uint256);	//inject NONSTANDARD NAMING

    function SUPPORTSHISTORY901() external pure returns (bool);	//inject NONSTANDARD NAMING

    function STAKEFOR376(	//inject NONSTANDARD NAMING
        address user,
        uint256 amount,
        uint256 heimdallFee,
        bool acceptDelegation,
        bytes memory signerPubkey
    ) public;

    function CHECKSIGNATURES973(	//inject NONSTANDARD NAMING
        uint256 blockInterval,
        bytes32 voteHash,
        bytes32 stateRoot,
        address proposer,
        bytes memory sigs
    ) public returns (uint256);

    function UPDATEVALIDATORSTATE26(uint256 validatorId, int256 amount) public;	//inject NONSTANDARD NAMING

    function OWNEROF344(uint256 tokenId) public view returns (address);	//inject NONSTANDARD NAMING

    function SLASH67(bytes memory slashingInfoList) public returns (uint256);	//inject NONSTANDARD NAMING

    function VALIDATORSTAKE963(uint256 validatorId) public view returns (uint256);	//inject NONSTANDARD NAMING

    function EPOCH457() public view returns (uint256);	//inject NONSTANDARD NAMING

    function WITHDRAWALDELAY814() public view returns (uint256);	//inject NONSTANDARD NAMING
}

// File: contracts/staking/validatorShare/ValidatorShareStorage.sol

pragma solidity ^0.5.2;


contract ValidatorShareHeader {
    struct Delegator {
        uint256 share;
        uint256 withdrawEpoch;
    }
}


contract ERC20Disabled is ERC20 {
    function _TRANSFER529(	//inject NONSTANDARD NAMING
        address from,
        address to,
        uint256 value
    ) internal {
        revert("Disabled");
    }
}


contract ValidatorShareStorage is ProxyStorage, ERC20Disabled, Lockable, ValidatorShareHeader {
    StakingInfo public stakingLogger;
    IStakeManager public stakeManager;
    uint256 public validatorId;
    uint256 public validatorRewards;
    uint256 public commissionRate;
    //last checkpoint where validator updated commission rate
    uint256 public lastCommissionUpdate;
    uint256 public minAmount = 10**18;

    uint256 public totalStake;
    uint256 public rewards;
    uint256 public activeAmount;
    bool public delegation = true;

    uint256 public withdrawPool;
    uint256 public withdrawShares;

    mapping(address => uint256) public amountStaked;
    mapping(address => Delegator) public delegators;

    uint256 constant exchange_rate_precision564 = 100;	//inject NONSTANDARD NAMING
}

// File: contracts/staking/validatorShare/ValidatorShareProxy.sol

pragma solidity ^0.5.2;


contract ValidatorShareProxy is Proxy, ValidatorShareStorage {
    constructor(
        address _registry, // using proxyTo storage variable as the registry address instead
        uint256 _validatorId,
        address _stakingLogger,
        address _stakeManager
    ) public Proxy(_registry) Lockable(_stakeManager) {
        validatorId = _validatorId;
        stakingLogger = StakingInfo(_stakingLogger);
        stakeManager = IStakeManager(_stakeManager);
        _TRANSFEROWNERSHIP237(_stakeManager);
    }

    function DELEGATEDFWD672(address _registry, bytes memory _calldata) internal {	//inject NONSTANDARD NAMING
        super.DELEGATEDFWD672(Registry(_registry).GETVALIDATORSHAREADDRESS659(), _calldata);
    }

    function IMPLEMENTATION927() external view returns (address) {	//inject NONSTANDARD NAMING
        return Registry(proxyTo).GETVALIDATORSHAREADDRESS659();
    }

    function UPDATEREWARDS817(	//inject NONSTANDARD NAMING
        uint256 _reward,
        uint256 _stakePower,
        uint256 validatorStake
    ) external ONLYOWNER604 returns (uint256) {
                                                                                                                                                                                                                                                                                                                                                                                                                                         
        uint256 combinedStakePower = validatorStake.ADD92(activeAmount); // validator + delegation stake power
        uint256 _rewards = combinedStakePower.MUL297(_reward).DIV540(_stakePower);

        _UPDATEREWARDS669(_rewards, validatorStake, combinedStakePower);
        return combinedStakePower;
    }

    function ADDPROPOSERBONUS922(uint256 _rewards, uint256 valStake) public ONLYOWNER604 {	//inject NONSTANDARD NAMING
        uint256 stakePower = valStake.ADD92(activeAmount);
        _UPDATEREWARDS669(_rewards, valStake, stakePower);
    }

    function _UPDATEREWARDS669(	//inject NONSTANDARD NAMING
        uint256 _rewards,
        uint256 valStake,
        uint256 stakePower
    ) internal {
        uint256 _validatorRewards = valStake.MUL297(_rewards).DIV540(stakePower);

        // add validator commission from delegation rewards
        if (commissionRate > 0) {
            _validatorRewards = _validatorRewards.ADD92(_rewards.SUB545(_validatorRewards).MUL297(commissionRate).DIV540(100));
        }

        validatorRewards = validatorRewards.ADD92(_validatorRewards);

        uint256 delegatorsRewards = _rewards.SUB545(_validatorRewards);
        rewards = rewards.ADD92(delegatorsRewards);
    }
}

// File: contracts/staking/validatorShare/ValidatorShareFactory.sol

pragma solidity ^0.5.2;


contract ValidatorShareFactory {
                                                                  

    function CREATE603(	//inject NONSTANDARD NAMING
        uint256 validatorId,
        address loggerAddress,
        address registry
    ) public returns (address) {
        return address(new ValidatorShareProxy(registry, validatorId, loggerAddress, msg.sender));
    }
}