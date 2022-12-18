                                                                 

                                                                 

pragma solidity ^0.5.4;

                                    
contract ERC20 {
    function TOTALSUPPLY358() public view returns (uint);	//inject NONSTANDARD NAMING
    function DECIMALS469() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF480(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE762(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER559(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE33(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM441(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                   
interface Module {
    function INIT41(BaseWallet _wallet) external;	//inject NONSTANDARD NAMING
    function ADDMODULE917(BaseWallet _wallet, Module _module) external;	//inject NONSTANDARD NAMING
    function RECOVERTOKEN762(address _token) external;	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                               
contract BaseWallet {
    address public implementation;
    address public owner;
    mapping (address => bool) public authorised;
    mapping (bytes4 => address) public enabled;
    uint public modules;
    function INIT41(address _owner, address[] calldata _modules) external;	//inject NONSTANDARD NAMING
    function AUTHORISEMODULE40(address _module, bool _value) external;	//inject NONSTANDARD NAMING
    function ENABLESTATICCALL647(address _module, bytes4 _method) external;	//inject NONSTANDARD NAMING
    function SETOWNER901(address _newOwner) external;	//inject NONSTANDARD NAMING
    function INVOKE255(address _target, uint _value, bytes calldata _data) external;	//inject NONSTANDARD NAMING
    function() external payable;
}

                                                                                                                                                                                                
contract ModuleRegistry {
    function REGISTERMODULE814(address _module, bytes32 _name) external;	//inject NONSTANDARD NAMING
    function DEREGISTERMODULE724(address _module) external;	//inject NONSTANDARD NAMING
    function REGISTERUPGRADER380(address _upgrader, bytes32 _name) external;	//inject NONSTANDARD NAMING
    function DEREGISTERUPGRADER797(address _upgrader) external;	//inject NONSTANDARD NAMING
    function RECOVERTOKEN762(address _token) external;	//inject NONSTANDARD NAMING
    function MODULEINFO614(address _module) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function UPGRADERINFO544(address _upgrader) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function ISREGISTEREDMODULE414(address _module) external view returns (bool);	//inject NONSTANDARD NAMING
    function ISREGISTEREDMODULE414(address[] calldata _modules) external view returns (bool);	//inject NONSTANDARD NAMING
    function ISREGISTEREDUPGRADER516(address _upgrader) external view returns (bool);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                            
contract GuardianStorage {
    function ADDGUARDIAN869(BaseWallet _wallet, address _guardian) external;	//inject NONSTANDARD NAMING
    function REVOKEGUARDIAN209(BaseWallet _wallet, address _guardian) external;	//inject NONSTANDARD NAMING
    function GUARDIANCOUNT663(BaseWallet _wallet) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETGUARDIANS353(BaseWallet _wallet) external view returns (address[] memory);	//inject NONSTANDARD NAMING
    function ISGUARDIAN86(BaseWallet _wallet, address _guardian) external view returns (bool);	//inject NONSTANDARD NAMING
    function SETLOCK694(BaseWallet _wallet, uint256 _releaseAfter) external;	//inject NONSTANDARD NAMING
    function ISLOCKED203(BaseWallet _wallet) external view returns (bool);	//inject NONSTANDARD NAMING
    function GETLOCK757(BaseWallet _wallet) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETLOCKER13(BaseWallet _wallet) external view returns (address);	//inject NONSTANDARD NAMING
}

interface Comptroller {
    function ENTERMARKETS802(address[] calldata _cTokens) external returns (uint[] memory);	//inject NONSTANDARD NAMING
    function EXITMARKET769(address _cToken) external returns (uint);	//inject NONSTANDARD NAMING
    function GETASSETSIN172(address _account) external view returns (address[] memory);	//inject NONSTANDARD NAMING
    function GETACCOUNTLIQUIDITY476(address _account) external view returns (uint, uint, uint);	//inject NONSTANDARD NAMING
    function CHECKMEMBERSHIP503(address account, CToken cToken) external view returns (bool);	//inject NONSTANDARD NAMING
}

interface CToken {
    function COMPTROLLER429() external view returns (address);	//inject NONSTANDARD NAMING
    function UNDERLYING557() external view returns (address);	//inject NONSTANDARD NAMING
    function SYMBOL115() external view returns (string memory);	//inject NONSTANDARD NAMING
    function EXCHANGERATECURRENT752() external returns (uint256);	//inject NONSTANDARD NAMING
    function EXCHANGERATESTORED263() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF480(address _account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function BORROWBALANCECURRENT598(address _account) external returns (uint256);	//inject NONSTANDARD NAMING
    function BORROWBALANCESTORED251(address _account) external view returns (uint256);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                       
contract CompoundRegistry {
    function ADDCTOKEN508(address _underlying, address _cToken) external;	//inject NONSTANDARD NAMING
    function REMOVECTOKEN457(address _underlying) external;	//inject NONSTANDARD NAMING
    function GETCTOKEN937(address _underlying) external view returns (address);	//inject NONSTANDARD NAMING
    function LISTUNDERLYINGS51() external view returns (address[] memory);	//inject NONSTANDARD NAMING
}

                                                                                                                                             
interface Invest {

    event INVESTMENTADDED276(address indexed _wallet, address _token, uint256 _invested, uint256 _period);	//inject NONSTANDARD NAMING
    event INVESTMENTREMOVED757(address indexed _wallet, address _token, uint256 _fraction);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                           
    function ADDINVESTMENT285(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        address _token, 
        uint256 _amount, 
        uint256 _period
    ) 
        external
        returns (uint256 _invested);

                                                                                                                                                                                                                   
    function REMOVEINVESTMENT855(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        address _token, 
        uint256 _fraction
    ) 
        external;

                                                                                                                                                                                                                                                                                           
    function GETINVESTMENT431(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        address _token
    )
        external
        view
        returns (uint256 _tokenValue, uint256 _periodEnd);
}

                                                                                                                          
interface Loan {

    event LOANOPENED498(address indexed _wallet, bytes32 indexed _loanId, address _collateral, uint256 _collateralAmount, address _debtToken, uint256 _debtAmount);	//inject NONSTANDARD NAMING
    event LOANCLOSED712(address indexed _wallet, bytes32 indexed _loanId);	//inject NONSTANDARD NAMING
    event COLLATERALADDED449(address indexed _wallet, bytes32 indexed _loanId, address _collateral, uint256 _collateralAmount);	//inject NONSTANDARD NAMING
    event COLLATERALREMOVED979(address indexed _wallet, bytes32 indexed _loanId, address _collateral, uint256 _collateralAmount);	//inject NONSTANDARD NAMING
    event DEBTADDED925(address indexed _wallet, bytes32 indexed _loanId, address _debtToken, uint256 _debtAmount);	//inject NONSTANDARD NAMING
    event DEBTREMOVED320(address indexed _wallet, bytes32 indexed _loanId, address _debtToken, uint256 _debtAmount);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function OPENLOAN413(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        address _collateral, 
        uint256 _collateralAmount, 
        address _debtToken, 
        uint256 _debtAmount
    ) 
        external 
        returns (bytes32 _loanId);

                                                                                                                                                                                                                                                   
    function CLOSELOAN432(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        bytes32 _loanId
    ) 
        external;

                                                                                                                                                                                                                                                                                                             
    function ADDCOLLATERAL287(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        bytes32 _loanId, 
        address _collateral, 
        uint256 _collateralAmount
    ) 
        external;

                                                                                                                                                                                                                                                                                                                     
    function REMOVECOLLATERAL523(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        bytes32 _loanId, 
        address _collateral, 
        uint256 _collateralAmount
    ) 
        external;

                                                                                                                                                                                                                                                                                                                     
    function ADDDEBT482(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        bytes32 _loanId, 
        address _debtToken, 
        uint256 _debtAmount
    ) 
        external;

                                                                                                                                                                                                                                                                                                                   
    function REMOVEDEBT791(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        bytes32 _loanId, 
        address _debtToken, 
        uint256 _debtAmount
    ) 
        external;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function GETLOAN105(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        bytes32 _loanId
    ) 
        external 
        view 
        returns (uint8 _status, uint256 _ethValue);
}

                                                                                         
library SafeMath {

                                                                      
    function MUL591(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                               
    function DIV920(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                  
    function SUB75(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                
    function ADD382(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                       
    function MOD533(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }

                                              
    function CEIL67(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

    // The adddress of the module registry.
    ModuleRegistry internal registry;

    event MODULECREATED418(bytes32 name);	//inject NONSTANDARD NAMING
    event MODULEINITIALISED137(address wallet);	//inject NONSTANDARD NAMING

    constructor(ModuleRegistry _registry, bytes32 _name) public {
        registry = _registry;
        emit MODULECREATED418(_name);
    }

                                                                                      
    modifier ONLYWALLET380(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(_wallet), "BM: caller must be wallet");
        _;
    }

                                                                                                            
    modifier ONLYWALLETOWNER556(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this) || ISOWNER854(_wallet, msg.sender), "BM: must be an owner for the wallet");
        _;
    }

                                                                                       
    modifier STRICTONLYWALLETOWNER524(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        require(ISOWNER854(_wallet, msg.sender), "BM: msg.sender must be an owner for the wallet");
        _;
    }

                                                                                                                                                                           
    function INIT41(BaseWallet _wallet) external ONLYWALLET380(_wallet) {	//inject NONSTANDARD NAMING
        emit MODULEINITIALISED137(address(_wallet));
    }

                                                                                                                                                                                           
    function ADDMODULE917(BaseWallet _wallet, Module _module) external STRICTONLYWALLETOWNER524(_wallet) {	//inject NONSTANDARD NAMING
        require(registry.ISREGISTEREDMODULE414(address(_module)), "BM: module is not registered");
        _wallet.AUTHORISEMODULE40(address(_module), true);
    }

                                                                                                                                                                                                        
    function RECOVERTOKEN762(address _token) external {	//inject NONSTANDARD NAMING
        uint total = ERC20(_token).BALANCEOF480(address(this));
        ERC20(_token).TRANSFER559(address(registry), total);
    }

                                                                                                                                                                           
    function ISOWNER854(BaseWallet _wallet, address _addr) internal view returns (bool) {	//inject NONSTANDARD NAMING
        return _wallet.owner() == _addr;
    }
}

                                                                                                                                                                                             
contract RelayerModule is Module {

    uint256 constant internal blockbound274 = 10000;	//inject NONSTANDARD NAMING

    mapping (address => RelayerConfig) public relayer; 

    struct RelayerConfig {
        uint256 nonce;
        mapping (bytes32 => bool) executedTx;
    }

    event TRANSACTIONEXECUTED579(address indexed wallet, bool indexed success, bytes32 signedHash);	//inject NONSTANDARD NAMING

                                                                                       
    modifier ONLYEXECUTE661 {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "RM: must be called via execute()");
        _;
    }

                                                                     

                                                                                                                                                                                                                                                                                     
    function GETREQUIREDSIGNATURES629(BaseWallet _wallet, bytes memory _data) internal view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                               
    function VALIDATESIGNATURES649(BaseWallet _wallet, bytes memory _data, bytes32 _signHash, bytes memory _signatures) internal view returns (bool);	//inject NONSTANDARD NAMING

                                                                      

                                                                                                                                                                                                                                                                                                                                                                                                                             
    function EXECUTE585(	//inject NONSTANDARD NAMING
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
        bytes32 signHash = GETSIGNHASH15(address(this), address(_wallet), 0, _data, _nonce, _gasPrice, _gasLimit);
        require(CHECKANDUPDATEUNIQUENESS183(_wallet, _nonce, signHash), "RM: Duplicate request");
        require(VERIFYDATA690(address(_wallet), _data), "RM: the wallet authorized is different then the target of the relayed data");
        uint256 requiredSignatures = GETREQUIREDSIGNATURES629(_wallet, _data);
        if((requiredSignatures * 65) == _signatures.length) {
            if(VERIFYREFUND18(_wallet, _gasLimit, _gasPrice, requiredSignatures)) {
                if(requiredSignatures == 0 || VALIDATESIGNATURES649(_wallet, _data, signHash, _signatures)) {
                    // solium-disable-next-line security/no-call-value
                    (success,) = address(this).call(_data);
                    REFUND382(_wallet, startGas - gasleft(), _gasPrice, _gasLimit, requiredSignatures, msg.sender);
                }
            }
        }
        emit TRANSACTIONEXECUTED579(address(_wallet), success, signHash); 
    }

                                                                                                      
    function GETNONCE465(BaseWallet _wallet) external view returns (uint256 nonce) {	//inject NONSTANDARD NAMING
        return relayer[address(_wallet)].nonce;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function GETSIGNHASH15(	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                      
    function CHECKANDUPDATEUNIQUENESS183(BaseWallet _wallet, uint256 _nonce, bytes32 _signHash) internal returns (bool) {	//inject NONSTANDARD NAMING
        if(relayer[address(_wallet)].executedTx[_signHash] == true) {
            return false;
        }
        relayer[address(_wallet)].executedTx[_signHash] = true;
        return true;
    }

                                                                                                                                                                                                                                                             
    function CHECKANDUPDATENONCE978(BaseWallet _wallet, uint256 _nonce) internal returns (bool) {	//inject NONSTANDARD NAMING
        if(_nonce <= relayer[address(_wallet)].nonce) {
            return false;
        }   
        uint256 nonceBlock = (_nonce & 0xffffffffffffffffffffffffffffffff00000000000000000000000000000000) >> 128;
        if(nonceBlock > block.number + blockbound274) {
            return false;
        }
        relayer[address(_wallet)].nonce = _nonce;
        return true;    
    }

                                                                                                                                                                                                                                                                   
    function RECOVERSIGNER624(bytes32 _signedHash, bytes memory _signatures, uint _index) internal pure returns (address) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function REFUND382(BaseWallet _wallet, uint _gasUsed, uint _gasPrice, uint _gasLimit, uint _signatures, address _relayer) internal {	//inject NONSTANDARD NAMING
        uint256 amount = 29292 + _gasUsed; // 21000 (transaction) + 7620 (execution of refund) + 672 to log the event + _gasUsed
        // only refund if gas price not null, more than 1 signatures, gas less than gasLimit
        if(_gasPrice > 0 && _signatures > 1 && amount <= _gasLimit) {
            if(_gasPrice > tx.gasprice) {
                amount = amount * tx.gasprice;
            }
            else {
                amount = amount * _gasPrice;
            }
            _wallet.INVOKE255(_relayer, amount, "");
        }
    }

                                                                                                                                                                                                                             
    function VERIFYREFUND18(BaseWallet _wallet, uint _gasUsed, uint _gasPrice, uint _signatures) internal view returns (bool) {	//inject NONSTANDARD NAMING
        if(_gasPrice > 0 
            && _signatures > 1 
            && (address(_wallet).balance < _gasUsed * _gasPrice || _wallet.authorised(address(this)) == false)) {
            return false;
        }
        return true;
    }

                                                                                                                                                                                                                                            
    function VERIFYDATA690(address _wallet, bytes memory _data) private pure returns (bool) {	//inject NONSTANDARD NAMING
        require(_data.length >= 36, "RM: Invalid dataWallet");
        address dataWallet;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            //_data = {length:32}{sig:4}{_wallet:32}{...}
            dataWallet := mload(add(_data, 0x24))
        }
        return dataWallet == _wallet;
    }

                                                                           
    function FUNCTIONPREFIX730(bytes memory _data) internal pure returns (bytes4 prefix) {	//inject NONSTANDARD NAMING
        require(_data.length >= 4, "RM: Invalid functionPrefix");
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            prefix := mload(add(_data, 0x20))
        }
    }
}

                                                                                                                                                                                                                                  
contract OnlyOwnerModule is BaseModule, RelayerModule {

    // *************** Implementation of RelayerModule methods ********************* //

    // Overrides to use the incremental nonce and save some gas
    function CHECKANDUPDATEUNIQUENESS183(BaseWallet _wallet, uint256 _nonce, bytes32 _signHash) internal returns (bool) {	//inject NONSTANDARD NAMING
        return CHECKANDUPDATENONCE978(_wallet, _nonce);
    }

    function VALIDATESIGNATURES649(BaseWallet _wallet, bytes memory _data, bytes32 _signHash, bytes memory _signatures) internal view returns (bool) {	//inject NONSTANDARD NAMING
        address signer = RECOVERSIGNER624(_signHash, _signatures, 0);
        return ISOWNER854(_wallet, signer); // "OOM: signer must be owner"
    }

    function GETREQUIREDSIGNATURES629(BaseWallet _wallet, bytes memory _data) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return 1;
    }
}

                                                                                                                                          
contract CompoundManager is Loan, Invest, BaseModule, RelayerModule, OnlyOwnerModule {

    bytes32 constant name580 = "CompoundManager";	//inject NONSTANDARD NAMING

    // The Guardian storage contract
    GuardianStorage public guardianStorage;
    // The Compound Comptroller contract
    Comptroller public comptroller;
    // The registry mapping underlying with cTokens
    CompoundRegistry public compoundRegistry;

    // Mock token address for ETH
    address constant internal eth_token_address796 = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;	//inject NONSTANDARD NAMING

    using SafeMath for uint256;

                                                           
    modifier ONLYWHENUNLOCKED99(BaseWallet _wallet) {	//inject NONSTANDARD NAMING
        // solium-disable-next-line security/no-block-members
        require(!guardianStorage.ISLOCKED203(_wallet), "CompoundManager: wallet must be unlocked");
        _;
    }

    constructor(
        ModuleRegistry _registry,
        GuardianStorage _guardianStorage,
        Comptroller _comptroller,
        CompoundRegistry _compoundRegistry
    )
        BaseModule(_registry, name580)
        public
    {
        guardianStorage = _guardianStorage;
        comptroller = _comptroller;
        compoundRegistry = _compoundRegistry;
    }

                                                                                                         

                                                                                                                                                                                                                                                                                                                                                                                                                               
    function OPENLOAN413(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        address _collateral,
        uint256 _collateralAmount,
        address _debtToken,
        uint256 _debtAmount
    ) 
        external 
        ONLYWALLETOWNER556(_wallet)
        ONLYWHENUNLOCKED99(_wallet)
        returns (bytes32 _loanId) 
    {
        address[] memory markets = new address[](2);
        markets[0] = compoundRegistry.GETCTOKEN937(_collateral);
        markets[1] = compoundRegistry.GETCTOKEN937(_debtToken);
        _wallet.INVOKE255(address(comptroller), 0, abi.encodeWithSignature("enterMarkets(address[])", markets));
        MINT232(_wallet, markets[0], _collateral, _collateralAmount);
        BORROW341(_wallet, markets[1], _debtAmount);
        emit LOANOPENED498(address(_wallet), _loanId, _collateral, _collateralAmount, _debtToken, _debtAmount);
    }

                                                                                                                                                                                                                                                                                                  
    function CLOSELOAN432(	//inject NONSTANDARD NAMING
        BaseWallet _wallet,
        bytes32 _loanId
    )
        external
        ONLYWALLETOWNER556(_wallet)
        ONLYWHENUNLOCKED99(_wallet)
    {
        address[] memory markets = comptroller.GETASSETSIN172(address(_wallet));
        for(uint i = 0; i < markets.length; i++) {
            address cToken = markets[i];
            uint debt = CToken(cToken).BORROWBALANCECURRENT598(address(_wallet));
            if(debt > 0) {
                REPAYBORROW306(_wallet, cToken, debt);
                uint collateral = CToken(cToken).BALANCEOF480(address(_wallet));
                if(collateral == 0) {
                    _wallet.INVOKE255(address(comptroller), 0, abi.encodeWithSignature("exitMarket(address)", address(cToken)));
                }
            }
        }
        emit LOANCLOSED712(address(_wallet), _loanId);
    }

                                                                                                                                                                                                                                                                                                                                           
    function ADDCOLLATERAL287(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        bytes32 _loanId, 
        address _collateral, 
        uint256 _collateralAmount
    ) 
        external 
        ONLYWALLETOWNER556(_wallet)
        ONLYWHENUNLOCKED99(_wallet)
    {
        address cToken = compoundRegistry.GETCTOKEN937(_collateral);
        ENTERMARKETIFNEEDED805(_wallet, cToken, address(comptroller));
        MINT232(_wallet, cToken, _collateral, _collateralAmount);
        emit COLLATERALADDED449(address(_wallet), _loanId, _collateral, _collateralAmount);
    }

                                                                                                                                                                                                                                                                                                                                                   
    function REMOVECOLLATERAL523(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        bytes32 _loanId, 
        address _collateral, 
        uint256 _collateralAmount
    ) 
        external 
        ONLYWALLETOWNER556(_wallet)
        ONLYWHENUNLOCKED99(_wallet)
    {
        address cToken = compoundRegistry.GETCTOKEN937(_collateral);
        REDEEMUNDERLYING355(_wallet, cToken, _collateralAmount);
        EXITMARKETIFNEEDED587(_wallet, cToken, address(comptroller));
        emit COLLATERALREMOVED979(address(_wallet), _loanId, _collateral, _collateralAmount);
    }

                                                                                                                                                                                                                                                                                                                                                   
    function ADDDEBT482(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        bytes32 _loanId, 
        address _debtToken, 
        uint256 _debtAmount
    ) 
        external 
        ONLYWALLETOWNER556(_wallet)
        ONLYWHENUNLOCKED99(_wallet)
    {
        address dToken = compoundRegistry.GETCTOKEN937(_debtToken);
        ENTERMARKETIFNEEDED805(_wallet, dToken, address(comptroller));
        BORROW341(_wallet, dToken, _debtAmount);
        emit DEBTADDED925(address(_wallet), _loanId, _debtToken, _debtAmount);
    }

                                                                                                                                                                                                                                                                                                                                                 
    function REMOVEDEBT791(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        bytes32 _loanId, 
        address _debtToken, 
        uint256 _debtAmount
    ) 
        external
        ONLYWALLETOWNER556(_wallet)
        ONLYWHENUNLOCKED99(_wallet)
    {
        address dToken = compoundRegistry.GETCTOKEN937(_debtToken);
        REPAYBORROW306(_wallet, dToken, _debtAmount);
        EXITMARKETIFNEEDED587(_wallet, dToken, address(comptroller));
        emit DEBTREMOVED320(address(_wallet), _loanId, _debtToken, _debtAmount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function GETLOAN105(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        bytes32 _loanId
    ) 
        external 
        view 
        returns (uint8 _status, uint256 _ethValue)
    {
        (uint error, uint liquidity, uint shortfall) = comptroller.GETACCOUNTLIQUIDITY476(address(_wallet));
        require(error == 0, "Compound: failed to get account liquidity");
        if(liquidity > 0) {
            return (1, liquidity);
        }
        if(shortfall > 0) {
            return (2, shortfall);
        }
        return (0,0);
    }

                                                                                                           

                                                                                                                                                                                                                                                                                                                                                                           
    function ADDINVESTMENT285(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        address _token, 
        uint256 _amount, 
        uint256 _period
    ) 
        external 
        ONLYWALLETOWNER556(_wallet)
        ONLYWHENUNLOCKED99(_wallet)
        returns (uint256 _invested)
    {
        address cToken = compoundRegistry.GETCTOKEN937(_token);
        MINT232(_wallet, cToken, _token, _amount);
        _invested = _amount;
        emit INVESTMENTADDED276(address(_wallet), _token, _amount, _period);
    }

                                                                                                                                                                                                                   
    function REMOVEINVESTMENT855(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        address _token, 
        uint256 _fraction
    )
        external
        ONLYWALLETOWNER556(_wallet)
        ONLYWHENUNLOCKED99(_wallet)
    {
        require(_fraction <= 10000, "CompoundV2: invalid fraction value");
        address cToken = compoundRegistry.GETCTOKEN937(_token);
        uint shares = CToken(cToken).BALANCEOF480(address(_wallet));
        REDEEM134(_wallet, cToken, shares.MUL591(_fraction).DIV920(10000));
        emit INVESTMENTREMOVED757(address(_wallet), _token, _fraction);
    }

                                                                                                                                                                                                                                                                                           
    function GETINVESTMENT431(	//inject NONSTANDARD NAMING
        BaseWallet _wallet, 
        address _token
    ) 
        external 
        view
        returns (uint256 _tokenValue, uint256 _periodEnd) 
    {
        address cToken = compoundRegistry.GETCTOKEN937(_token);
        uint amount = CToken(cToken).BALANCEOF480(address(_wallet));
        uint exchangeRateMantissa = CToken(cToken).EXCHANGERATESTORED263();
        _tokenValue = amount.MUL591(exchangeRateMantissa).DIV920(10 ** 18);
        _periodEnd = 0;
    }

                                                                                                                  

                                                                                                                                                                                                                                                                    
    function MINT232(BaseWallet _wallet, address _cToken, address _token, uint256 _amount) internal {	//inject NONSTANDARD NAMING
        require(_cToken != address(0), "Compound: No market for target token");
        require(_amount > 0, "Compound: amount cannot be 0");
        if(_token == eth_token_address796) {
            _wallet.INVOKE255(_cToken, _amount, abi.encodeWithSignature("mint()"));
        }
        else {
            _wallet.INVOKE255(_token, 0, abi.encodeWithSignature("approve(address,uint256)", _cToken, _amount));
            _wallet.INVOKE255(_cToken, 0, abi.encodeWithSignature("mint(uint256)", _amount));
        }
    }

                                                                                                                                                                                                                       
    function REDEEM134(BaseWallet _wallet, address _cToken, uint256 _amount) internal {     	//inject NONSTANDARD NAMING
        require(_cToken != address(0), "Compound: No market for target token");   
        require(_amount > 0, "Compound: amount cannot be 0");
        _wallet.INVOKE255(_cToken, 0, abi.encodeWithSignature("redeem(uint256)", _amount));
    }

                                                                                                                                                                                                                                 
    function REDEEMUNDERLYING355(BaseWallet _wallet, address _cToken, uint256 _amount) internal {     	//inject NONSTANDARD NAMING
        require(_cToken != address(0), "Compound: No market for target token");   
        require(_amount > 0, "Compound: amount cannot be 0");
        _wallet.INVOKE255(_cToken, 0, abi.encodeWithSignature("redeemUnderlying(uint256)", _amount));
    }

                                                                                                                                                                                                                                  
    function BORROW341(BaseWallet _wallet, address _cToken, uint256 _amount) internal {	//inject NONSTANDARD NAMING
        require(_cToken != address(0), "Compound: No market for target token");
        require(_amount > 0, "Compound: amount cannot be 0");
        _wallet.INVOKE255(_cToken, 0, abi.encodeWithSignature("borrow(uint256)", _amount));
    }

                                                                                                                                                                                                                                     
    function REPAYBORROW306(BaseWallet _wallet, address _cToken, uint256 _amount) internal {	//inject NONSTANDARD NAMING
        require(_cToken != address(0), "Compound: No market for target token");
        require(_amount > 0, "Compound: amount cannot be 0");
        string memory symbol = CToken(_cToken).SYMBOL115();
        if(keccak256(abi.encodePacked(symbol)) == keccak256(abi.encodePacked("cETH"))) {
            _wallet.INVOKE255(_cToken, _amount, abi.encodeWithSignature("repayBorrow()"));
        }
        else { 
            address token = CToken(_cToken).UNDERLYING557();
            _wallet.INVOKE255(token, 0, abi.encodeWithSignature("approve(address,uint256)", _cToken, _amount));
            _wallet.INVOKE255(_cToken, 0, abi.encodeWithSignature("repayBorrow(uint256)", _amount));
        }
    }

                                                                                                                                                                                                                         
    function ENTERMARKETIFNEEDED805(BaseWallet _wallet, address _cToken, address _comptroller) internal {	//inject NONSTANDARD NAMING
        bool isEntered = Comptroller(_comptroller).CHECKMEMBERSHIP503(address(_wallet), CToken(_cToken));
        if(!isEntered) {
            address[] memory market = new address[](1);
            market[0] = _cToken;
            _wallet.INVOKE255(_comptroller, 0, abi.encodeWithSignature("enterMarkets(address[])", market));
        }
    }

                                                                                                                                                                                                                                   
    function EXITMARKETIFNEEDED587(BaseWallet _wallet, address _cToken, address _comptroller) internal {	//inject NONSTANDARD NAMING
        uint collateral = CToken(_cToken).BALANCEOF480(address(_wallet));
        uint debt = CToken(_cToken).BORROWBALANCESTORED251(address(_wallet));
        if(collateral == 0 && debt == 0) {
            _wallet.INVOKE255(_comptroller, 0, abi.encodeWithSignature("exitMarket(address)", _cToken));
        }
    }
}