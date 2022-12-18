                                                                 

pragma solidity ^0.5.4;

                                    
contract ERC20 {
    function TOTALSUPPLY56() public view returns (uint);	//inject NONSTANDARD NAMING
    function DECIMALS408() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF294(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE462(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER510(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE871(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM568(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                   
interface Module {
    function INIT333(BaseWallet _wallet) external;	//inject NONSTANDARD NAMING
    function ADDMODULE149(BaseWallet _wallet, Module _module) external;	//inject NONSTANDARD NAMING
    function RECOVERTOKEN445(address _token) external;	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                               
contract BaseWallet {
    address public implementation;
    address public owner;
    mapping (address => bool) public authorised;
    mapping (bytes4 => address) public enabled;
    uint public modules;
    function INIT333(address _owner, address[] calldata _modules) external;	//inject NONSTANDARD NAMING
    function AUTHORISEMODULE800(address _module, bool _value) external;	//inject NONSTANDARD NAMING
    function ENABLESTATICCALL812(address _module, bytes4 _method) external;	//inject NONSTANDARD NAMING
    function SETOWNER975(address _newOwner) external;	//inject NONSTANDARD NAMING
    function INVOKE951(address _target, uint _value, bytes calldata _data) external returns (bytes memory _result);	//inject NONSTANDARD NAMING
    function() external payable;
}

                                                                                                                                                                                                
contract ModuleRegistry {
    function REGISTERMODULE472(address _module, bytes32 _name) external;	//inject NONSTANDARD NAMING
    function DEREGISTERMODULE645(address _module) external;	//inject NONSTANDARD NAMING
    function REGISTERUPGRADER308(address _upgrader, bytes32 _name) external;	//inject NONSTANDARD NAMING
    function DEREGISTERUPGRADER157(address _upgrader) external;	//inject NONSTANDARD NAMING
    function RECOVERTOKEN445(address _token) external;	//inject NONSTANDARD NAMING
    function MODULEINFO26(address _module) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function UPGRADERINFO812(address _upgrader) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function ISREGISTEREDMODULE765(address _module) external view returns (bool);	//inject NONSTANDARD NAMING
    function ISREGISTEREDMODULE765(address[] calldata _modules) external view returns (bool);	//inject NONSTANDARD NAMING
    function ISREGISTEREDUPGRADER709(address _upgrader) external view returns (bool);	//inject NONSTANDARD NAMING
}

contract TokenPriceProvider {
    mapping(address => uint256) public cachedPrices;
    function GETETHERVALUE82(uint256 _amount, address _token) external view returns (uint256);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                            
contract GuardianStorage {
    function ADDGUARDIAN965(BaseWallet _wallet, address _guardian) external;	//inject NONSTANDARD NAMING
    function REVOKEGUARDIAN119(BaseWallet _wallet, address _guardian) external;	//inject NONSTANDARD NAMING
    function GUARDIANCOUNT513(BaseWallet _wallet) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETGUARDIANS486(BaseWallet _wallet) external view returns (address[] memory);	//inject NONSTANDARD NAMING
    function ISGUARDIAN351(BaseWallet _wallet, address _guardian) external view returns (bool);	//inject NONSTANDARD NAMING
    function SETLOCK310(BaseWallet _wallet, uint256 _releaseAfter) external;	//inject NONSTANDARD NAMING
    function ISLOCKED817(BaseWallet _wallet) external view returns (bool);	//inject NONSTANDARD NAMING
    function GETLOCK226(BaseWallet _wallet) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETLOCKER499(BaseWallet _wallet) external view returns (address);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                             
contract TransferStorage {
    function SETWHITELIST781(BaseWallet _wallet, address _target, uint256 _value) external;	//inject NONSTANDARD NAMING
    function GETWHITELIST121(BaseWallet _wallet, address _target) external view returns (uint256);	//inject NONSTANDARD NAMING
}

                                                                                         
library SafeMath {

                                                                      
    function MUL118(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                               
    function DIV112(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                  
    function SUB269(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                
    function ADD646(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                       
    function MOD64(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }

                                              
    function CEIL200(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        if(a % b == 0) {
            return c;
        }
        else {
            return c + 1;
        }
    }
}

                                                                                                                                                
contract BaseModule is Module {

    // Empty calldata
    bytes constant internal empty_bytes144 = "";	//inject NONSTANDARD NAMING

    // The adddress of the module registry.
    ModuleRegistry internal registry;
    // The address of the Guardian storage
    GuardianStorage internal guardianStorage;

                                                           
    modifier ONLYWHENUNLOCKED312(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        // solium-disable-next-line security/no-block-members
        require(!guardianStorage.ISLOCKED817(_wallet), "BM: wallet must be unlocked");
        _;
    }

    event MODULECREATED671(bytes32 name);	//inject NONSTANDARD NAMING
    event MODULEINITIALISED620(address wallet);	//inject NONSTANDARD NAMING

    constructor(ModuleRegistry _registry, GuardianStorage _guardianStorage, bytes32 _name) public {
        registry = _registry;
        guardianStorage = _guardianStorage;
        emit MODULECREATED671(_name);
    }

                                                                                      
    modifier ONLYWALLET223(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(_wallet), "BM: caller must be wallet");
        _;
    }

                                                                                                            
    modifier ONLYWALLETOWNER601(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this) || ISOWNER120(_wallet, msg.sender), "BM: must be an owner for the wallet");
        _;
    }

                                                                                       
    modifier STRICTONLYWALLETOWNER484(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(ISOWNER120(_wallet, msg.sender), "BM: msg.sender must be an owner for the wallet");
        _;
    }

                                                                                                                                                                           
    function INIT333(BaseWallet _wallet) public ONLYWALLET223(_wallet) {	//inject NONSTANDARD NAMING
        emit MODULEINITIALISED620(address(_wallet));
    }

                                                                                                                                                                                           
    function ADDMODULE149(BaseWallet _wallet, Module _module) external STRICTONLYWALLETOWNER484(_wallet) {	//inject NONSTANDARD NAMING
        require(registry.ISREGISTEREDMODULE765(address(_module)), "BM: module is not registered");
        _wallet.AUTHORISEMODULE800(address(_module), true);
    }

                                                                                                                                                                                                        
    function RECOVERTOKEN445(address _token) external {	//inject NONSTANDARD NAMING
        uint total = ERC20(_token).BALANCEOF294(address(this));
        ERC20(_token).TRANSFER510(address(registry), total);
    }

                                                                                                                                                                           
    function ISOWNER120(BaseWallet _wallet, address _addr) internal view returns (bool) {	//inject NONSTANDARD NAMING
        return _wallet.owner() == _addr;
    }

                                                                                                                                                                                                                                                                    
    function INVOKEWALLET503(address _wallet, address _to, uint256 _value, bytes memory _data) internal returns (bytes memory _res) {	//inject NONSTANDARD NAMING
        bool success;
        // solium-disable-next-line security/no-call-value
        (success, _res) = _wallet.call(abi.encodeWithSignature("invoke(address,uint256,bytes)", _to, _value, _data));
        if(success && _res.length > 0) { //_res is empty if _wallet is an "old" BaseWallet that can't return output values
            (_res) = abi.decode(_res, (bytes));
        } else if (_res.length > 0) {
            // solium-disable-next-line security/no-inline-assembly
            assembly {
                returndatacopy(0, 0, returndatasize)
                revert(0, returndatasize)
            }
        } else if(!success) {
            revert("BM: wallet invoke reverted");
        }
    }
}

                                                                                                                                                                                            
contract RelayerModule is BaseModule {

    uint256 constant internal blockbound682 = 10000;	//inject NONSTANDARD NAMING

    mapping (address => RelayerConfig) public relayer;

    struct RelayerConfig {
        uint256 nonce;
        mapping (bytes32 => bool) executedTx;
    }

    event TRANSACTIONEXECUTED998(address indexed wallet, bool indexed success, bytes32 signedHash);	//inject NONSTANDARD NAMING

                                                                                       
    modifier ONLYEXECUTE501 {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "RM: must be called via execute()");
        _;
    }

                                                                     

                                                                                                                                                                                                                                                                                     
    function GETREQUIREDSIGNATURES288(BaseWallet _wallet, bytes memory _data) internal view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                               
    function VALIDATESIGNATURES701(BaseWallet _wallet, bytes memory _data, bytes32 _signHash, bytes memory _signatures) internal view returns (bool);	//inject NONSTANDARD NAMING

                                                                      

                                                                                                                                                                                                                                                                                                                                                                                                                             
    function EXECUTE627(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        bytes calldata _data,
        uint256 _nonce,
        bytes calldata _signatures,
        uint256 _gasPrice,
        uint256 _gasLimit
    )
        external
        returns (bool success)
    {
        uint startGas = gasleft();
        bytes32 signHash = GETSIGNHASH876(address(this), address(_wallet), 0, _data, _nonce, _gasPrice, _gasLimit);
        require(CHECKANDUPDATEUNIQUENESS860(_wallet, _nonce, signHash), "RM: Duplicate request");
        require(VERIFYDATA137(address(_wallet), _data), "RM: the wallet authorized is different then the target of the relayed data");
        uint256 requiredSignatures = GETREQUIREDSIGNATURES288(_wallet, _data);
        if((requiredSignatures * 65) == _signatures.length) {
            if(VERIFYREFUND942(_wallet, _gasLimit, _gasPrice, requiredSignatures)) {
                if(requiredSignatures == 0 || VALIDATESIGNATURES701(_wallet, _data, signHash, _signatures)) {
                    // solium-disable-next-line security/no-call-value
                    (success,) = address(this).call(_data);
                    REFUND63(_wallet, startGas - gasleft(), _gasPrice, _gasLimit, requiredSignatures, msg.sender);
                }
            }
        }
        emit TRANSACTIONEXECUTED998(address(_wallet), success, signHash);
    }

                                                                                                      
    function GETNONCE774(BaseWallet _wallet) external view returns (uint256 nonce) {	//inject NONSTANDARD NAMING
        return relayer[address(_wallet)].nonce;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function GETSIGNHASH876(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value,
        bytes memory _data,
        uint256 _nonce,
        uint256 _gasPrice,
        uint256 _gasLimit
    )
        internal
        pure
        returns (bytes32)
    {
        return keccak256(
            abi.encodePacked(
                "\x19Ethereum Signed Message:\n32",
                keccak256(abi.encodePacked(byte(0x19), byte(0), _from, _to, _value, _data, _nonce, _gasPrice, _gasLimit))
        ));
    }

                                                                                                                                                                                                      
    function CHECKANDUPDATEUNIQUENESS860(BaseWallet _wallet, uint256 _nonce, bytes32 _signHash) internal returns (bool) {	//inject NONSTANDARD NAMING
        if(relayer[address(_wallet)].executedTx[_signHash] == true) {
            return false;
        }
        relayer[address(_wallet)].executedTx[_signHash] = true;
        return true;
    }

                                                                                                                                                                                                                                                            
    function CHECKANDUPDATENONCE624(BaseWallet _wallet, uint256 _nonce) internal returns (bool) {	//inject NONSTANDARD NAMING
        if(_nonce <= relayer[address(_wallet)].nonce) {
            return false;
        }
        uint256 nonceBlock = (_nonce & 0xffffffffffffffffffffffffffffffff00000000000000000000000000000000) >> 128;
        if(nonceBlock > block.number + blockbound682) {
            return false;
        }
        relayer[address(_wallet)].nonce = _nonce;
        return true;
    }

                                                                                                                                                                                                                                                                   
    function RECOVERSIGNER473(bytes32 _signedHash, bytes memory _signatures, uint _index) internal pure returns (address) {	//inject NONSTANDARD NAMING
        uint8 v;
        bytes32 r;
        bytes32 s;
        // we jump 32 (0x20) as the first slot of bytes contains the length
        // we jump 65 (0x41) per signature
        // for v we load 32 bytes ending with v (the first 31 come from s) then apply a mask
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            r := mload(add(_signatures, add(0x20,mul(0x41,_index))))
            s := mload(add(_signatures, add(0x40,mul(0x41,_index))))
            v := and(mload(add(_signatures, add(0x41,mul(0x41,_index)))), 0xff)
        }
        require(v == 27 || v == 28);
        return ecrecover(_signedHash, v, r, s);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function REFUND63(BaseWallet _wallet, uint _gasUsed, uint _gasPrice, uint _gasLimit, uint _signatures, address _relayer) internal {	//inject NONSTANDARD NAMING
        uint256 amount = 29292 + _gasUsed; // 21000 (transaction) + 7620 (execution of refund) + 672 to log the event + _gasUsed
        // only refund if gas price not null, more than 1 signatures, gas less than gasLimit
        if(_gasPrice > 0 && _signatures > 1 && amount <= _gasLimit) {
            if(_gasPrice > tx.gasprice) {
                amount = amount * tx.gasprice;
            }
            else {
                amount = amount * _gasPrice;
            }
            INVOKEWALLET503(address(_wallet), _relayer, amount, empty_bytes144);
        }
    }

                                                                                                                                                                                                                             
    function VERIFYREFUND942(BaseWallet _wallet, uint _gasUsed, uint _gasPrice, uint _signatures) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if(_gasPrice > 0
            && _signatures > 1
            && (address(_wallet).balance < _gasUsed * _gasPrice || _wallet.authorised(address(this)) == false)) {
            return false;
        }
        return true;
    }

                                                                                                                                                                                                                                            
    function VERIFYDATA137(address _wallet, bytes memory _data) private pure returns (bool) {	//inject NONSTANDARD NAMING
        require(_data.length >= 36, "RM: Invalid dataWallet");
        address dataWallet;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            //_data = {length:32}{sig:4}{_wallet:32}{...}
            dataWallet := mload(add(_data, 0x24))
        }
        return dataWallet == _wallet;
    }

                                                                          
    function FUNCTIONPREFIX32(bytes memory _data) internal pure returns (bytes4 prefix) {	//inject NONSTANDARD NAMING
        require(_data.length >= 4, "RM: Invalid functionPrefix");
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            prefix := mload(add(_data, 0x20))
        }
    }
}

                                                                                                                                                                                                                                  
contract OnlyOwnerModule is BaseModule, RelayerModule {

    // bytes4 private constant IS_ONLY_OWNER_MODULE = bytes4(keccak256("isOnlyOwnerModule()"));

                                                                                                                                                                     
    function ISONLYOWNERMODULE121() external pure returns (bytes4) {	//inject NONSTANDARD NAMING
        // return IS_ONLY_OWNER_MODULE;
        return this.ISONLYOWNERMODULE121.selector;
    }

                                                                                                                                                                                                                                                                                           
    function ADDMODULE149(BaseWallet _wallet, Module _module) external ONLYWALLETOWNER601(_wallet) {	//inject NONSTANDARD NAMING
        require(registry.ISREGISTEREDMODULE765(address(_module)), "BM: module is not registered");
        _wallet.AUTHORISEMODULE800(address(_module), true);
    }

    // *************** Implementation of RelayerModule methods ********************* //

    // Overrides to use the incremental nonce and save some gas
    function CHECKANDUPDATEUNIQUENESS860(BaseWallet _wallet, uint256 _nonce, bytes32                ) internal returns (bool) {	//inject NONSTANDARD NAMING
        return CHECKANDUPDATENONCE624(_wallet, _nonce);
    }

    function VALIDATESIGNATURES701(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        bytes memory            ,
        bytes32 _signHash,
        bytes memory _signatures
    )
        internal
        view
        returns (bool)
    {
        address signer = RECOVERSIGNER473(_signHash, _signatures, 0);
        return ISOWNER120(_wallet, signer); // "OOM: signer must be owner"
    }

    function GETREQUIREDSIGNATURES288(BaseWallet              , bytes memory            ) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return 1;
    }
}

                                                                                                                           
contract LimitManager is BaseModule {

    // large limit when the limit can be considered disabled
    uint128 constant private limit_disabled491 = uint128(-1); // 3.40282366920938463463374607431768211455e+38	//inject NONSTANDARD NAMING

    using SafeMath for uint256;

    struct LimitManagerConfig {
        // The daily limit
        Limit limit;
        // The current usage
        DailySpent dailySpent;
    }

    struct Limit {
        // the current limit
        uint128 current;
        // the pending limit if any
        uint128 pending;
        // when the pending limit becomes the current limit
        uint64 changeAfter;
    }

    struct DailySpent {
        // The amount already spent during the current period
        uint128 alreadySpent;
        // The end of the current period
        uint64 periodEnd;
    }

    // wallet specific storage
    mapping (address => LimitManagerConfig) internal limits;
    // The default limit
    uint256 public defaultLimit;

    // *************** Events *************************** //

    event LIMITCHANGED445(address indexed wallet, uint indexed newLimit, uint64 indexed startAfter);	//inject NONSTANDARD NAMING

    // *************** Constructor ********************** //

    constructor(uint256 _defaultLimit) public {
        defaultLimit = _defaultLimit;
    }

    // *************** External/Public Functions ********************* //

                                                                                                                                             
    function INIT333(BaseWallet _wallet) public ONLYWALLET223(_wallet) {	//inject NONSTANDARD NAMING
        Limit storage limit = limits[address(_wallet)].limit;
        if(limit.current == 0 && limit.changeAfter == 0) {
            limit.current = uint128(defaultLimit);
        }
    }

    // *************** Internal Functions ********************* //

                                                                                                                                                                                                                                                                               
    function CHANGELIMIT899(BaseWallet _wallet, uint256 _newLimit, uint256 _securityPeriod) internal {	//inject NONSTANDARD NAMING
        Limit storage limit = limits[address(_wallet)].limit;
        // solium-disable-next-line security/no-block-members
        uint128 current = (limit.changeAfter > 0 && limit.changeAfter < now) ? limit.pending : limit.current;
        limit.current = current;
        limit.pending = uint128(_newLimit);
        // solium-disable-next-line security/no-block-members
        limit.changeAfter = uint64(now.ADD646(_securityPeriod));
        // solium-disable-next-line security/no-block-members
        emit LIMITCHANGED445(address(_wallet), _newLimit, uint64(now.ADD646(_securityPeriod)));
    }

                                                                                                                                                                                                       
    function DISABLELIMIT172(BaseWallet _wallet, uint256 _securityPeriod) internal {	//inject NONSTANDARD NAMING
        CHANGELIMIT899(_wallet, limit_disabled491, _securityPeriod);
    }

                                                                                                                                                              
    function GETCURRENTLIMIT483(BaseWallet _wallet) public view returns (uint256 _currentLimit) {	//inject NONSTANDARD NAMING
        Limit storage limit = limits[address(_wallet)].limit;
        _currentLimit = uint256(CURRENTLIMIT973(limit.current, limit.pending, limit.changeAfter));
    }

                                                                                                                                                                                               
    function ISLIMITDISABLED711(BaseWallet _wallet) public view returns (bool _limitDisabled) {	//inject NONSTANDARD NAMING
        uint256 currentLimit = GETCURRENTLIMIT483(_wallet);
        _limitDisabled = currentLimit == limit_disabled491;
    }

                                                                                                                                                                                                    
    function GETPENDINGLIMIT858(BaseWallet _wallet) external view returns (uint256 _pendingLimit, uint64 _changeAfter) {	//inject NONSTANDARD NAMING
        Limit storage limit = limits[address(_wallet)].limit;
        // solium-disable-next-line security/no-block-members
        return ((now < limit.changeAfter)? (uint256(limit.pending), limit.changeAfter) : (0,0));
    }

                                                                                                                                                                                                                                                     
    function GETDAILYUNSPENT417(BaseWallet _wallet) external view returns (uint256 _unspent, uint64 _periodEnd) {	//inject NONSTANDARD NAMING
        uint256 limit = GETCURRENTLIMIT483(_wallet);
        DailySpent storage expense = limits[address(_wallet)].dailySpent;
        // solium-disable-next-line security/no-block-members
        if(now > expense.periodEnd) {
            _unspent = limit;
            // solium-disable-next-line security/no-block-members
            _periodEnd = uint64(now + 24 hours);
        }
        else {
            _periodEnd = expense.periodEnd;
            if(expense.alreadySpent < limit) {
                _unspent = limit - expense.alreadySpent;
            }
        }
    }

                                                                                                                                                                                                                                              
    function CHECKANDUPDATEDAILYSPENT507(BaseWallet _wallet, uint _amount) internal returns (bool) {	//inject NONSTANDARD NAMING
        if(_amount == 0) return true;
        Limit storage limit = limits[address(_wallet)].limit;
        uint128 current = CURRENTLIMIT973(limit.current, limit.pending, limit.changeAfter);
        if(ISWITHINDAILYLIMIT714(_wallet, current, _amount)) {
            UPDATEDAILYSPENT984(_wallet, current, _amount);
            return true;
        }
        return false;
    }

                                                                                                                                                                                                                                                  
    function UPDATEDAILYSPENT984(BaseWallet _wallet, uint128 _limit, uint _amount) internal {	//inject NONSTANDARD NAMING
        if(_limit != limit_disabled491) {
            DailySpent storage expense = limits[address(_wallet)].dailySpent;
            // solium-disable-next-line security/no-block-members
            if (expense.periodEnd < now) {
                // solium-disable-next-line security/no-block-members
                expense.periodEnd = uint64(now + 24 hours);
                expense.alreadySpent = uint128(_amount);
            }
            else {
                expense.alreadySpent += uint128(_amount);
            }
        }
    }

                                                                                                                                                                                                                                                                                                            
    function ISWITHINDAILYLIMIT714(BaseWallet _wallet, uint _limit, uint _amount) internal view returns (bool)  {	//inject NONSTANDARD NAMING
        if(_limit == limit_disabled491) {
            return true;
        }
        DailySpent storage expense = limits[address(_wallet)].dailySpent;
        // solium-disable-next-line security/no-block-members
        if (expense.periodEnd < now) {
            return (_amount <= _limit);
        } else {
            return (expense.alreadySpent + _amount <= _limit && expense.alreadySpent + _amount >= expense.alreadySpent);
        }
    }

                                                                                                                                                                                                                                                                        
    function CURRENTLIMIT973(uint128 _current, uint128 _pending, uint64 _changeAfter) internal view returns (uint128) {	//inject NONSTANDARD NAMING
        // solium-disable-next-line security/no-block-members
        if(_changeAfter > 0 && _changeAfter < now) {
            return _pending;
        }
        return _current;
    }

}

                                                                                                                                                       
contract BaseTransfer is BaseModule {

    // Mock token address for ETH
    address constant internal eth_token650 = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;	//inject NONSTANDARD NAMING

    // *************** Events *************************** //

    event TRANSFER383(address indexed wallet, address indexed token, uint256 indexed amount, address to, bytes data);	//inject NONSTANDARD NAMING
    event APPROVED490(address indexed wallet, address indexed token, uint256 amount, address spender);	//inject NONSTANDARD NAMING
    event CALLEDCONTRACT207(address indexed wallet, address indexed to, uint256 amount, bytes data);	//inject NONSTANDARD NAMING

    // *************** Internal Functions ********************* //

                                                                                                                                                                                                                                                                                                       
    function DOTRANSFER757(BaseWallet _wallet, address _token, address _to, uint256 _value, bytes memory _data) internal {	//inject NONSTANDARD NAMING
        if(_token == eth_token650) {
            INVOKEWALLET503(address(_wallet), _to, _value, empty_bytes144);
        }
        else {
            bytes memory methodData = abi.encodeWithSignature("transfer(address,uint256)", _to, _value);
            INVOKEWALLET503(address(_wallet), _token, 0, methodData);
        }
        emit TRANSFER383(address(_wallet), _token, _value, _to, _data);
    }

                                                                                                                                                                                                                                                                 
    function DOAPPROVETOKEN857(BaseWallet _wallet, address _token, address _spender, uint256 _value) internal {	//inject NONSTANDARD NAMING
        bytes memory methodData = abi.encodeWithSignature("approve(address,uint256)", _spender, _value);
        INVOKEWALLET503(address(_wallet), _token, 0, methodData);
        emit APPROVED490(address(_wallet), _token, _value, _spender);
    }

                                                                                                                                                                                                                                             
    function DOCALLCONTRACT398(BaseWallet _wallet, address _contract, uint256 _value, bytes memory _data) internal {	//inject NONSTANDARD NAMING
        INVOKEWALLET503(address(_wallet), _contract, _value, _data);
        emit CALLEDCONTRACT207(address(_wallet), _contract, _value, _data);
    }
}

                                                                                                                                                                                                                                                                          
contract TransferManager is BaseModule, RelayerModule, OnlyOwnerModule, BaseTransfer, LimitManager {

    bytes32 constant name198 = "TransferManager";	//inject NONSTANDARD NAMING

    bytes4 private constant erc721_isvalidsignature_bytes378 = bytes4(keccak256("isValidSignature(bytes,bytes)"));	//inject NONSTANDARD NAMING
    bytes4 private constant erc721_isvalidsignature_bytes32767 = bytes4(keccak256("isValidSignature(bytes32,bytes)"));	//inject NONSTANDARD NAMING

    enum ActionType { Transfer }

    using SafeMath for uint256;

    struct TokenManagerConfig {
        // Mapping between pending action hash and their timestamp
        mapping (bytes32 => uint256) pendingActions;
    }

    // wallet specific storage
    mapping (address => TokenManagerConfig) internal configs;

    // The security period
    uint256 public securityPeriod;
    // The execution window
    uint256 public securityWindow;
    // The Token storage
    TransferStorage public transferStorage;
    // The Token price provider
    TokenPriceProvider public priceProvider;
    // The previous limit manager needed to migrate the limits
    LimitManager public oldLimitManager;

    // *************** Events *************************** //

    event ADDEDTOWHITELIST962(address indexed wallet, address indexed target, uint64 whitelistAfter);	//inject NONSTANDARD NAMING
    event REMOVEDFROMWHITELIST851(address indexed wallet, address indexed target);	//inject NONSTANDARD NAMING
    event PENDINGTRANSFERCREATED422(address indexed wallet, bytes32 indexed id, uint256 indexed executeAfter,	//inject NONSTANDARD NAMING
        address token, address to, uint256 amount, bytes data);
    event PENDINGTRANSFEREXECUTED22(address indexed wallet, bytes32 indexed id);	//inject NONSTANDARD NAMING
    event PENDINGTRANSFERCANCELED89(address indexed wallet, bytes32 indexed id);	//inject NONSTANDARD NAMING

    // *************** Constructor ********************** //

    constructor(
        ModuleRegistry _registry,
        TransferStorage _transferStorage,
        GuardianStorage _guardianStorage,
        address _priceProvider,
        uint256 _securityPeriod,
        uint256 _securityWindow,
        uint256 _defaultLimit,
        LimitManager _oldLimitManager
    )
        BaseModule(_registry, _guardianStorage, name198)
        LimitManager(_defaultLimit)
        public
    {
        transferStorage = _transferStorage;
        priceProvider = TokenPriceProvider(_priceProvider);
        securityPeriod = _securityPeriod;
        securityWindow = _securityWindow;
        oldLimitManager = _oldLimitManager;
    }

                                                                                                                                                                                                                                                                                                                                   
    function INIT333(BaseWallet _wallet) public ONLYWALLET223(_wallet) {	//inject NONSTANDARD NAMING

        // setup static calls
        _wallet.ENABLESTATICCALL812(address(this), erc721_isvalidsignature_bytes378);
        _wallet.ENABLESTATICCALL812(address(this), erc721_isvalidsignature_bytes32767);

        // setup default limit for new deployment
        if(address(oldLimitManager) == address(0)) {
            super.INIT333(_wallet);
            return;
        }
        // get limit from previous LimitManager
        uint256 current = oldLimitManager.GETCURRENTLIMIT483(_wallet);
        (uint256 pending, uint64 changeAfter) = oldLimitManager.GETPENDINGLIMIT858(_wallet);
        // setup default limit for new wallets
        if(current == 0 && changeAfter == 0) {
            super.INIT333(_wallet);
            return;
        }
        // migrate existing limit for existing wallets
        if(current == pending) {
            limits[address(_wallet)].limit.current = uint128(current);
        }
        else {
            limits[address(_wallet)].limit = Limit(uint128(current), uint128(pending), changeAfter);
        }
        // migrate daily pending if we are within a rolling period
        (uint256 unspent, uint64 periodEnd) = oldLimitManager.GETDAILYUNSPENT417(_wallet);
        // solium-disable-next-line security/no-block-members
        if(periodEnd > now) {
            limits[address(_wallet)].dailySpent = DailySpent(uint128(current.SUB269(unspent)), periodEnd);
        }
    }

    // *************** External/Public Functions ********************* //

                                                                                                                                                                                                                                                                                                                                      
    function TRANSFERTOKEN441(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        address _token,
        address _to,
        uint256 _amount,
        bytes calldata _data
    )
        external
        ONLYWALLETOWNER601(_wallet)
        ONLYWHENUNLOCKED312(_wallet)
    {
        if(ISWHITELISTED652(_wallet, _to)) {
            // transfer to whitelist
            DOTRANSFER757(_wallet, _token, _to, _amount, _data);
        }
        else {
            uint256 etherAmount = (_token == eth_token650) ? _amount : priceProvider.GETETHERVALUE82(_amount, _token);
            if (CHECKANDUPDATEDAILYSPENT507(_wallet, etherAmount)) {
                // transfer under the limit
                DOTRANSFER757(_wallet, _token, _to, _amount, _data);
            }
            else {
                // transfer above the limit
                (bytes32 id, uint256 executeAfter) = ADDPENDINGACTION111(ActionType.Transfer, _wallet, _token, _to, _amount, _data);
                emit PENDINGTRANSFERCREATED422(address(_wallet), id, executeAfter, _token, _to, _amount, _data);
            }
        }
    }

                                                                                                                                                                                                                                                                                                           
    function APPROVETOKEN479(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        address _token,
        address _spender,
        uint256 _amount
    )
        external
        ONLYWALLETOWNER601(_wallet)
        ONLYWHENUNLOCKED312(_wallet)
    {
        if(ISWHITELISTED652(_wallet, _spender)) {
            // approve to whitelist
            DOAPPROVETOKEN857(_wallet, _token, _spender, _amount);
        }
        else {
            // get current alowance
            uint256 currentAllowance = ERC20(_token).ALLOWANCE462(address(_wallet), _spender);
            if(_amount <= currentAllowance) {
                // approve if we reduce the allowance
                DOAPPROVETOKEN857(_wallet, _token, _spender, _amount);
            }
            else {
                // check if delta is under the limit
                uint delta = _amount - currentAllowance;
                uint256 deltaInEth = priceProvider.GETETHERVALUE82(delta, _token);
                require(CHECKANDUPDATEDAILYSPENT507(_wallet, deltaInEth), "TM: Approve above daily limit");
                // approve if under the limit
                DOAPPROVETOKEN857(_wallet, _token, _spender, _amount);
            }
        }
    }

                                                                                                                                                                                                                                                                  
    function CALLCONTRACT176(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        address _contract,
        uint256 _value,
        bytes calldata _data
    )
        external
        ONLYWALLETOWNER601(_wallet)
        ONLYWHENUNLOCKED312(_wallet)
    {
        // Make sure we don't call a module, the wallet itself, or a supported ERC20
        AUTHORISECONTRACTCALL267(_wallet, _contract);

        if(ISWHITELISTED652(_wallet, _contract)) {
            // call to whitelist
            DOCALLCONTRACT398(_wallet, _contract, _value, _data);
        }
        else {
            require(CHECKANDUPDATEDAILYSPENT507(_wallet, _value), "TM: Call contract above daily limit");
            // call under the limit
            DOCALLCONTRACT398(_wallet, _contract, _value, _data);
        }
    }

                                                                                                                                                                                                                                                                                                                                                                                                                            
    function APPROVETOKENANDCALLCONTRACT435(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        address _token,
        address _contract,
        uint256 _amount,
        bytes calldata _data
    )
        external
        ONLYWALLETOWNER601(_wallet)
        ONLYWHENUNLOCKED312(_wallet)
    {
        // Make sure we don't call a module, the wallet itself, or a supported ERC20
        AUTHORISECONTRACTCALL267(_wallet, _contract);

        if(ISWHITELISTED652(_wallet, _contract)) {
            DOAPPROVETOKEN857(_wallet, _token, _contract, _amount);
            DOCALLCONTRACT398(_wallet, _contract, 0, _data);
        }
        else {
            // get current alowance
            uint256 currentAllowance = ERC20(_token).ALLOWANCE462(address(_wallet), _contract);
            if(_amount <= currentAllowance) {
                // no need to approve more
                DOCALLCONTRACT398(_wallet, _contract, 0, _data);
            }
            else {
                // check if delta is under the limit
                uint delta = _amount - currentAllowance;
                uint256 deltaInEth = priceProvider.GETETHERVALUE82(delta, _token);
                require(CHECKANDUPDATEDAILYSPENT507(_wallet, deltaInEth), "TM: Approve above daily limit");
                // approve if under the limit
                DOAPPROVETOKEN857(_wallet, _token, _contract, _amount);
                DOCALLCONTRACT398(_wallet, _contract, 0, _data);
            }
        }
    }

                                                                                                                                                            
    function ADDTOWHITELIST738(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        address _target
    )
        external
        ONLYWALLETOWNER601(_wallet)
        ONLYWHENUNLOCKED312(_wallet)
    {
        require(!ISWHITELISTED652(_wallet, _target), "TT: target already whitelisted");
        // solium-disable-next-line security/no-block-members
        uint256 whitelistAfter = now.ADD646(securityPeriod);
        transferStorage.SETWHITELIST781(_wallet, _target, whitelistAfter);
        emit ADDEDTOWHITELIST962(address(_wallet), _target, uint64(whitelistAfter));
    }

                                                                                                                                                                    
    function REMOVEFROMWHITELIST981(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        address _target
    )
        external
        ONLYWALLETOWNER601(_wallet)
        ONLYWHENUNLOCKED312(_wallet)
    {
        require(ISWHITELISTED652(_wallet, _target), "TT: target not whitelisted");
        transferStorage.SETWHITELIST781(_wallet, _target, 0);
        emit REMOVEDFROMWHITELIST851(address(_wallet), _target);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function EXECUTEPENDINGTRANSFER974(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        address _token,
        address _to,
        uint _amount,
        bytes calldata _data,
        uint _block
    )
        external
        ONLYWHENUNLOCKED312(_wallet)
    {
        bytes32 id = keccak256(abi.encodePacked(ActionType.Transfer, _token, _to, _amount, _data, _block));
        uint executeAfter = configs[address(_wallet)].pendingActions[id];
        require(executeAfter > 0, "TT: unknown pending transfer");
        uint executeBefore = executeAfter.ADD646(securityWindow);
        // solium-disable-next-line security/no-block-members
        require(executeAfter <= now && now <= executeBefore, "TT: transfer outside of the execution window");
        delete configs[address(_wallet)].pendingActions[id];
        DOTRANSFER757(_wallet, _token, _to, _amount, _data);
        emit PENDINGTRANSFEREXECUTED22(address(_wallet), id);
    }

    function CANCELPENDINGTRANSFER538(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        bytes32 _id
    )
        external
        ONLYWALLETOWNER601(_wallet)
        ONLYWHENUNLOCKED312(_wallet)
    {
        require(configs[address(_wallet)].pendingActions[_id] > 0, "TT: unknown pending action");
        delete configs[address(_wallet)].pendingActions[_id];
        emit PENDINGTRANSFERCANCELED89(address(_wallet), _id);
    }

                                                                                                                                                                                                                                        
    function CHANGELIMIT899(BaseWallet _wallet, uint256 _newLimit) external ONLYWALLETOWNER601(_wallet) ONLYWHENUNLOCKED312(_wallet) {	//inject NONSTANDARD NAMING
        CHANGELIMIT899(_wallet, _newLimit, securityPeriod);
    }

                                                                                                                                                                                    
    function DISABLELIMIT172(BaseWallet _wallet) external ONLYWALLETOWNER601(_wallet) ONLYWHENUNLOCKED312(_wallet) {	//inject NONSTANDARD NAMING
        DISABLELIMIT172(_wallet, securityPeriod);
    }

                                                                                                                                                                                                       
    function ISWHITELISTED652(BaseWallet _wallet, address _target) public view returns (bool _isWhitelisted) {	//inject NONSTANDARD NAMING
        uint whitelistAfter = transferStorage.GETWHITELIST121(_wallet, _target);
        // solium-disable-next-line security/no-block-members
        return whitelistAfter > 0 && whitelistAfter < now;
    }

                                                                                                                                                                                                                                         
    function GETPENDINGTRANSFER148(BaseWallet _wallet, bytes32 _id) external view returns (uint64 _executeAfter) {	//inject NONSTANDARD NAMING
        _executeAfter = uint64(configs[address(_wallet)].pendingActions[_id]);
    }

                                                                                                                                                                                                                                                                                          
    function ISVALIDSIGNATURE873(bytes calldata _data, bytes calldata _signature) external view returns (bytes4) {	//inject NONSTANDARD NAMING
        bytes32 msgHash = keccak256(abi.encodePacked(_data));
        ISVALIDSIGNATURE873(msgHash, _signature);
        return erc721_isvalidsignature_bytes378;
    }

                                                                                                                                                                                                                                                                                            
    function ISVALIDSIGNATURE873(bytes32 _msgHash, bytes memory _signature) public view returns (bytes4) {	//inject NONSTANDARD NAMING
        require(_signature.length == 65, "TM: invalid signature length");
        address signer = RECOVERSIGNER473(_msgHash, _signature, 0);
        require(ISOWNER120(BaseWallet(msg.sender), signer), "TM: Invalid signer");
        return erc721_isvalidsignature_bytes32767;
    }

    // *************** Internal Functions ********************* //

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function ADDPENDINGACTION111(	//inject NONSTANDARD NAMING
        ActionType _action,
        BaseWallet _wallet,
        address _token,
        address _to,
        uint _amount,
        bytes memory _data
    )
        internal
        returns (bytes32 id, uint256 executeAfter)
    {
        id = keccak256(abi.encodePacked(_action, _token, _to, _amount, _data, block.number));
        require(configs[address(_wallet)].pendingActions[id] == 0, "TM: duplicate pending action");
        // solium-disable-next-line security/no-block-members
        executeAfter = now.ADD646(securityPeriod);
        configs[address(_wallet)].pendingActions[id] = executeAfter;
    }

                                                                                                                                                                                                                         
    function AUTHORISECONTRACTCALL267(BaseWallet _wallet, address _contract) internal view {	//inject NONSTANDARD NAMING
        require(
            _contract != address(_wallet) && // not the wallet itself
            !_wallet.authorised(_contract) && // not an authorised module
            (priceProvider.cachedPrices(_contract) == 0 || ISLIMITDISABLED711(_wallet)), // not an ERC20 listed in the provider (or limit disabled)
            "TM: Forbidden contract");
    }

    // *************** Implementation of RelayerModule methods ********************* //

    // Overrides refund to add the refund in the daily limit.
    function REFUND63(BaseWallet _wallet, uint _gasUsed, uint _gasPrice, uint _gasLimit, uint _signatures, address _relayer) internal {	//inject NONSTANDARD NAMING
        // 21000 (transaction) + 7620 (execution of refund) + 7324 (execution of updateDailySpent) + 672 to log the event + _gasUsed
        uint256 amount = 36616 + _gasUsed;
        if(_gasPrice > 0 && _signatures > 0 && amount <= _gasLimit) {
            if(_gasPrice > tx.gasprice) {
                amount = amount * tx.gasprice;
            }
            else {
                amount = amount * _gasPrice;
            }
            CHECKANDUPDATEDAILYSPENT507(_wallet, amount);
            INVOKEWALLET503(address(_wallet), _relayer, amount, empty_bytes144);
        }
    }

    // Overrides verifyRefund to add the refund in the daily limit.
    function VERIFYREFUND942(BaseWallet _wallet, uint _gasUsed, uint _gasPrice, uint _signatures) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if(_gasPrice > 0 && _signatures > 0 && (
            address(_wallet).balance < _gasUsed * _gasPrice ||
            ISWITHINDAILYLIMIT714(_wallet, GETCURRENTLIMIT483(_wallet), _gasUsed * _gasPrice) == false ||
            _wallet.authorised(address(this)) == false
        ))
        {
            return false;
        }
        return true;
    }
}