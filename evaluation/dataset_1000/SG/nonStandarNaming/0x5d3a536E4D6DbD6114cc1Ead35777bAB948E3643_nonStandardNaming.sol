                                                                 

// File: contracts/ComptrollerInterface.sol

pragma solidity ^0.5.12;

interface ComptrollerInterface {
                                                                                                                                                                                             
    function ISCOMPTROLLER855() external view returns (bool);	//inject NONSTANDARD NAMING

                               

    function ENTERMARKETS562(address[] calldata cTokens) external returns (uint[] memory);	//inject NONSTANDARD NAMING
    function EXITMARKET901(address cToken) external returns (uint);	//inject NONSTANDARD NAMING

                          

    function MINTALLOWED865(address cToken, address minter, uint mintAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function MINTVERIFY297(address cToken, address minter, uint mintAmount, uint mintTokens) external;	//inject NONSTANDARD NAMING

    function REDEEMALLOWED25(address cToken, address redeemer, uint redeemTokens) external returns (uint);	//inject NONSTANDARD NAMING
    function REDEEMVERIFY839(address cToken, address redeemer, uint redeemAmount, uint redeemTokens) external;	//inject NONSTANDARD NAMING

    function BORROWALLOWED724(address cToken, address borrower, uint borrowAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function BORROWVERIFY447(address cToken, address borrower, uint borrowAmount) external;	//inject NONSTANDARD NAMING

    function REPAYBORROWALLOWED149(	//inject NONSTANDARD NAMING
        address cToken,
        address payer,
        address borrower,
        uint repayAmount) external returns (uint);
    function REPAYBORROWVERIFY789(	//inject NONSTANDARD NAMING
        address cToken,
        address payer,
        address borrower,
        uint repayAmount,
        uint borrowerIndex) external;

    function LIQUIDATEBORROWALLOWED857(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount) external returns (uint);
    function LIQUIDATEBORROWVERIFY837(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        address liquidator,
        address borrower,
        uint repayAmount,
        uint seizeTokens) external;

    function SEIZEALLOWED821(	//inject NONSTANDARD NAMING
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external returns (uint);
    function SEIZEVERIFY933(	//inject NONSTANDARD NAMING
        address cTokenCollateral,
        address cTokenBorrowed,
        address liquidator,
        address borrower,
        uint seizeTokens) external;

    function TRANSFERALLOWED816(address cToken, address src, address dst, uint transferTokens) external returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFERVERIFY829(address cToken, address src, address dst, uint transferTokens) external;	//inject NONSTANDARD NAMING

                                                

    function LIQUIDATECALCULATESEIZETOKENS585(	//inject NONSTANDARD NAMING
        address cTokenBorrowed,
        address cTokenCollateral,
        uint repayAmount) external view returns (uint, uint);
}

// File: contracts/InterestRateModel.sol

pragma solidity ^0.5.12;

                                                                               
interface InterestRateModel {
                                                                                                    
    function ISINTERESTRATEMODEL833() external pure returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                     
    function GETBORROWRATE304(uint cash, uint borrows, uint reserves) external view returns (uint);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function GETSUPPLYRATE718(uint cash, uint borrows, uint reserves, uint reserveFactorMantissa) external view returns (uint);	//inject NONSTANDARD NAMING

}

// File: contracts/CTokenInterfaces.sol

pragma solidity ^0.5.12;



contract CTokenStorage {
                                                                 
    bool internal _notEntered;

                                                               
    string public name;

                                                                 
    string public symbol;

                                                                   
    uint8 public decimals;

                                                                                            

    uint internal constant borrowratemaxmantissa348 = 0.0005e16;	//inject NONSTANDARD NAMING

                                                                                              
    uint internal constant reservefactormaxmantissa236 = 1e18;	//inject NONSTANDARD NAMING

                                                              
    address payable public admin;

                                                                      
    address payable public pendingAdmin;

                                                                              
    ComptrollerInterface public comptroller;

                                                                                         
    InterestRateModel public interestRateModel;

                                                                                                                    
    uint internal initialExchangeRateMantissa;

                                                                                    
    uint public reserveFactorMantissa;

                                                                             
    uint public accrualBlockNumber;

                                                                                                            
    uint public borrowIndex;

                                                                                                   
    uint public totalBorrows;

                                                                                             
    uint public totalReserves;

                                                                    
    uint public totalSupply;

                                                                                 
    mapping (address => uint) internal accountTokens;

                                                                                  
    mapping (address => mapping (address => uint)) internal transferAllowances;

                                                                                                                                                                                                                                                                                            
    struct BorrowSnapshot {
        uint principal;
        uint interestIndex;
    }

                                                                                          
    mapping(address => BorrowSnapshot) internal accountBorrows;
}

contract CTokenInterface is CTokenStorage {
                                                                                        
    bool public constant isctoken476 = true;	//inject NONSTANDARD NAMING


                           

                                                                     
    event ACCRUEINTEREST459(uint cashPrior, uint interestAccumulated, uint borrowIndex, uint totalBorrows);	//inject NONSTANDARD NAMING

                                                                   
    event MINT555(address minter, uint mintAmount, uint mintTokens);	//inject NONSTANDARD NAMING

                                                                     
    event REDEEM715(address redeemer, uint redeemAmount, uint redeemTokens);	//inject NONSTANDARD NAMING

                                                                        
    event BORROW82(address borrower, uint borrowAmount, uint accountBorrows, uint totalBorrows);	//inject NONSTANDARD NAMING

                                                                    
    event REPAYBORROW962(address payer, address borrower, uint repayAmount, uint accountBorrows, uint totalBorrows);	//inject NONSTANDARD NAMING

                                                                        
    event LIQUIDATEBORROW676(address liquidator, address borrower, uint repayAmount, address cTokenCollateral, uint seizeTokens);	//inject NONSTANDARD NAMING


                          

                                                                         
    event NEWPENDINGADMIN714(address oldPendingAdmin, address newPendingAdmin);	//inject NONSTANDARD NAMING

                                                                                                        
    event NEWADMIN336(address oldAdmin, address newAdmin);	//inject NONSTANDARD NAMING

                                                                        
    event NEWCOMPTROLLER536(ComptrollerInterface oldComptroller, ComptrollerInterface newComptroller);	//inject NONSTANDARD NAMING

                                                                              
    event NEWMARKETINTERESTRATEMODEL163(InterestRateModel oldInterestRateModel, InterestRateModel newInterestRateModel);	//inject NONSTANDARD NAMING

                                                                               
    event NEWRESERVEFACTOR969(uint oldReserveFactorMantissa, uint newReserveFactorMantissa);	//inject NONSTANDARD NAMING

                                                                        
    event RESERVESADDED552(address benefactor, uint addAmount, uint newTotalReserves);	//inject NONSTANDARD NAMING

                                                                          
    event RESERVESREDUCED207(address admin, uint reduceAmount, uint newTotalReserves);	//inject NONSTANDARD NAMING

                                                   
    event TRANSFER648(address indexed from, address indexed to, uint amount);	//inject NONSTANDARD NAMING

                                                   
    event APPROVAL442(address indexed owner, address indexed spender, uint amount);	//inject NONSTANDARD NAMING

                                            
    event FAILURE27(uint error, uint info, uint detail);	//inject NONSTANDARD NAMING


                            

    function TRANSFER728(address dst, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM877(address src, address dst, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE904(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE154(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF879(address owner) external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOFUNDERLYING25(address owner) external returns (uint);	//inject NONSTANDARD NAMING
    function GETACCOUNTSNAPSHOT584(address account) external view returns (uint, uint, uint, uint);	//inject NONSTANDARD NAMING
    function BORROWRATEPERBLOCK407() external view returns (uint);	//inject NONSTANDARD NAMING
    function SUPPLYRATEPERBLOCK416() external view returns (uint);	//inject NONSTANDARD NAMING
    function TOTALBORROWSCURRENT155() external returns (uint);	//inject NONSTANDARD NAMING
    function BORROWBALANCECURRENT569(address account) external returns (uint);	//inject NONSTANDARD NAMING
    function BORROWBALANCESTORED85(address account) public view returns (uint);	//inject NONSTANDARD NAMING
    function EXCHANGERATECURRENT261() public returns (uint);	//inject NONSTANDARD NAMING
    function EXCHANGERATESTORED128() public view returns (uint);	//inject NONSTANDARD NAMING
    function GETCASH426() external view returns (uint);	//inject NONSTANDARD NAMING
    function ACCRUEINTEREST115() public returns (uint);	//inject NONSTANDARD NAMING
    function SEIZE365(address liquidator, address borrower, uint seizeTokens) external returns (uint);	//inject NONSTANDARD NAMING


                             

    function _SETPENDINGADMIN389(address payable newPendingAdmin) external returns (uint);	//inject NONSTANDARD NAMING
    function _ACCEPTADMIN286() external returns (uint);	//inject NONSTANDARD NAMING
    function _SETCOMPTROLLER671(ComptrollerInterface newComptroller) public returns (uint);	//inject NONSTANDARD NAMING
    function _SETRESERVEFACTOR786(uint newReserveFactorMantissa) external returns (uint);	//inject NONSTANDARD NAMING
    function _REDUCERESERVES102(uint reduceAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function _SETINTERESTRATEMODEL9(InterestRateModel newInterestRateModel) public returns (uint);	//inject NONSTANDARD NAMING
}

contract CErc20Storage {
                                                               
    address public underlying;
}

contract CErc20Interface is CErc20Storage {

                            

    function MINT319(uint mintAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function REDEEM223(uint redeemTokens) external returns (uint);	//inject NONSTANDARD NAMING
    function REDEEMUNDERLYING449(uint redeemAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function BORROW922(uint borrowAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function REPAYBORROW989(uint repayAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function REPAYBORROWBEHALF735(address borrower, uint repayAmount) external returns (uint);	//inject NONSTANDARD NAMING
    function LIQUIDATEBORROW208(address borrower, uint repayAmount, CTokenInterface cTokenCollateral) external returns (uint);	//inject NONSTANDARD NAMING


                             

    function _ADDRESERVES702(uint addAmount) external returns (uint);	//inject NONSTANDARD NAMING
}

contract CDelegationStorage {
                                                                       
    address public implementation;
}

contract CDelegatorInterface is CDelegationStorage {
                                                                     
    event NEWIMPLEMENTATION894(address oldImplementation, address newImplementation);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                  
    function _SETIMPLEMENTATION503(address implementation_, bool allowResign, bytes memory becomeImplementationData) public;	//inject NONSTANDARD NAMING
}

contract CDelegateInterface is CDelegationStorage {
                                                                                                                                                                                                                                                
    function _BECOMEIMPLEMENTATION229(bytes memory data) public;	//inject NONSTANDARD NAMING

                                                                                                  
    function _RESIGNIMPLEMENTATION633() public;	//inject NONSTANDARD NAMING
}

// File: contracts/CErc20Delegator.sol

pragma solidity ^0.5.12;


                                                                                                                                                              
contract CErc20Delegator is CTokenInterface, CErc20Interface, CDelegatorInterface {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    constructor(address underlying_,
                ComptrollerInterface comptroller_,
                InterestRateModel interestRateModel_,
                uint initialExchangeRateMantissa_,
                string memory name_,
                string memory symbol_,
                uint8 decimals_,
                address payable admin_,
                address implementation_,
                bytes memory becomeImplementationData) public {
        // Creator of the contract is admin during initialization
        admin = msg.sender;

        // First delegate gets to initialize the delegator (i.e. storage contract)
        DELEGATETO210(implementation_, abi.encodeWithSignature("initialize(address,address,address,uint256,string,string,uint8)",
                                                            underlying_,
                                                            comptroller_,
                                                            interestRateModel_,
                                                            initialExchangeRateMantissa_,
                                                            name_,
                                                            symbol_,
                                                            decimals_));

        // New implementations always get set via the settor (post-initialize)
        _SETIMPLEMENTATION503(implementation_, false, becomeImplementationData);

        // Set the proper admin now that initialization is done
        admin = admin_;
    }

                                                                                                                                                                                                                                                                                                                                                                                                  
    function _SETIMPLEMENTATION503(address implementation_, bool allowResign, bytes memory becomeImplementationData) public {	//inject NONSTANDARD NAMING
        require(msg.sender == admin, "CErc20Delegator::_setImplementation: Caller must be admin");

        if (allowResign) {
            DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("_resignImplementation()"));
        }

        address oldImplementation = implementation;
        implementation = implementation_;

        DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("_becomeImplementation(bytes)", becomeImplementationData));

        emit NEWIMPLEMENTATION894(oldImplementation, implementation);
    }

                                                                                                                                                                                                                                                                                                                                                       
    function MINT319(uint mintAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("mint(uint256)", mintAmount));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                                                                                                                
    function REDEEM223(uint redeemTokens) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("redeem(uint256)", redeemTokens));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                                                                                                                     
    function REDEEMUNDERLYING449(uint redeemAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("redeemUnderlying(uint256)", redeemAmount));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                              
    function BORROW922(uint borrowAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("borrow(uint256)", borrowAmount));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                  
    function REPAYBORROW989(uint repayAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("repayBorrow(uint256)", repayAmount));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                                                 
    function REPAYBORROWBEHALF735(address borrower, uint repayAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("repayBorrowBehalf(address,uint256)", borrower, repayAmount));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function LIQUIDATEBORROW208(address borrower, uint repayAmount, CTokenInterface cTokenCollateral) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("liquidateBorrow(address,uint256,address)", borrower, repayAmount, cTokenCollateral));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                      
    function TRANSFER728(address dst, uint amount) external returns (bool) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("transfer(address,uint256)", dst, amount));
        return abi.decode(data, (bool));
    }

                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM877(address src, address dst, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("transferFrom(address,address,uint256)", src, dst, amount));
        return abi.decode(data, (bool));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE904(address spender, uint256 amount) external returns (bool) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("approve(address,uint256)", spender, amount));
        return abi.decode(data, (bool));
    }

                                                                                                                                                                                                                                                                                                                           
    function ALLOWANCE154(address owner, address spender) external view returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOVIEWIMPLEMENTATION521(abi.encodeWithSignature("allowance(address,address)", owner, spender));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                
    function BALANCEOF879(address owner) external view returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOVIEWIMPLEMENTATION521(abi.encodeWithSignature("balanceOf(address)", owner));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                 
    function BALANCEOFUNDERLYING25(address owner) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("balanceOfUnderlying(address)", owner));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                                                                                                           
    function GETACCOUNTSNAPSHOT584(address account) external view returns (uint, uint, uint, uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOVIEWIMPLEMENTATION521(abi.encodeWithSignature("getAccountSnapshot(address)", account));
        return abi.decode(data, (uint, uint, uint, uint));
    }

                                                                                                                                                                   
    function BORROWRATEPERBLOCK407() external view returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOVIEWIMPLEMENTATION521(abi.encodeWithSignature("borrowRatePerBlock()"));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                   
    function SUPPLYRATEPERBLOCK416() external view returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOVIEWIMPLEMENTATION521(abi.encodeWithSignature("supplyRatePerBlock()"));
        return abi.decode(data, (uint));
    }

                                                                                                                                     
    function TOTALBORROWSCURRENT155() external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("totalBorrowsCurrent()"));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                                                     
    function BORROWBALANCECURRENT569(address account) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("borrowBalanceCurrent(address)", account));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                   
    function BORROWBALANCESTORED85(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOVIEWIMPLEMENTATION521(abi.encodeWithSignature("borrowBalanceStored(address)", account));
        return abi.decode(data, (uint));
    }

                                                                                                                                             
    function EXCHANGERATECURRENT261() public returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("exchangeRateCurrent()"));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                            
    function EXCHANGERATESTORED128() public view returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOVIEWIMPLEMENTATION521(abi.encodeWithSignature("exchangeRateStored()"));
        return abi.decode(data, (uint));
    }

                                                                                                                                                             
    function GETCASH426() external view returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOVIEWIMPLEMENTATION521(abi.encodeWithSignature("getCash()"));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                  
    function ACCRUEINTEREST115() public returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("accrueInterest()"));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function SEIZE365(address liquidator, address borrower, uint seizeTokens) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("seize(address,address,uint256)", liquidator, borrower, seizeTokens));
        return abi.decode(data, (uint));
    }

                             

                                                                                                                                                                                                                                                                                                                                                                                                               
    function _SETPENDINGADMIN389(address payable newPendingAdmin) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("_setPendingAdmin(address)", newPendingAdmin));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                   
    function _SETCOMPTROLLER671(ComptrollerInterface newComptroller) public returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("_setComptroller(address)", newComptroller));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                                                                 
    function _SETRESERVEFACTOR786(uint newReserveFactorMantissa) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("_setReserveFactor(uint256)", newReserveFactorMantissa));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                                        
    function _ACCEPTADMIN286() external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("_acceptAdmin()"));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                     
    function _ADDRESERVES702(uint addAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("_addReserves(uint256)", addAmount));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                               
    function _REDUCERESERVES102(uint reduceAmount) external returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("_reduceReserves(uint256)", reduceAmount));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                                                                                                                                  
    function _SETINTERESTRATEMODEL9(InterestRateModel newInterestRateModel) public returns (uint) {	//inject NONSTANDARD NAMING
        bytes memory data = DELEGATETOIMPLEMENTATION73(abi.encodeWithSignature("_setInterestRateModel(address)", newInterestRateModel));
        return abi.decode(data, (uint));
    }

                                                                                                                                                                                                                                                                                                                                                        
    function DELEGATETO210(address callee, bytes memory data) internal returns (bytes memory) {	//inject NONSTANDARD NAMING
        (bool success, bytes memory returnData) = callee.delegatecall(data);
        assembly {
            if eq(success, 0) {
                revert(add(returnData, 0x20), returndatasize)
            }
        }
        return returnData;
    }

                                                                                                                                                                                                                                                                                               
    function DELEGATETOIMPLEMENTATION73(bytes memory data) public returns (bytes memory) {	//inject NONSTANDARD NAMING
        return DELEGATETO210(implementation, data);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                      
    function DELEGATETOVIEWIMPLEMENTATION521(bytes memory data) public view returns (bytes memory) {	//inject NONSTANDARD NAMING
        (bool success, bytes memory returnData) = address(this).staticcall(abi.encodeWithSignature("delegateToImplementation(bytes)", data));
        assembly {
            if eq(success, 0) {
                revert(add(returnData, 0x20), returndatasize)
            }
        }
        return abi.decode(returnData, (bytes));
    }

                                                                                                                                                                                      
    function () external payable {
        require(msg.value == 0,"CErc20Delegator:fallback: cannot send value to fallback");

        // delegate all other functions to current implementation
        (bool success, ) = implementation.delegatecall(msg.data);

        assembly {
            let free_mem_ptr := mload(0x40)
            returndatacopy(free_mem_ptr, 0, returndatasize)

            switch success
            case 0 { revert(free_mem_ptr, returndatasize) }
            default { return(free_mem_ptr, returndatasize) }
        }
    }
}