                                                                 

// File: contracts\modules\Ownable.sol

pragma solidity =0.5.16;

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable {
    address internal _owner;

    event OWNERSHIPTRANSFERRED133(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor() internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED133(address(0), _owner);
    }

                                                                     
    function OWNER760() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER340() {	//inject NONSTANDARD NAMING
        require(ISOWNER59(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER59() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP896() public ONLYOWNER340 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED133(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP58(address newOwner) public ONLYOWNER340 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP277(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP277(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED133(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts\modules\Managerable.sol

pragma solidity =0.5.16;

contract Managerable is Ownable {

    address private _managerAddress;
                                                                                                                 
    modifier ONLYMANAGER944() {	//inject NONSTANDARD NAMING
        require(_managerAddress == msg.sender,"Managerable: caller is not the Manager");
        _;
    }
                                                         
    function SETMANAGER194(address managerAddress)	//inject NONSTANDARD NAMING
    public
    ONLYOWNER340
    {
        _managerAddress = managerAddress;
    }
                                                        
    function GETMANAGER193()public view returns (address) {	//inject NONSTANDARD NAMING
        return _managerAddress;
    }
}

// File: contracts\interfaces\IFNXOracle.sol

pragma solidity =0.5.16;

interface IFNXOracle {
                                                                                                                                                                                                                                               
    function GETPRICE334(address asset) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETUNDERLYINGPRICE817(uint256 cToken) external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETPRICES76(uint256[] calldata assets) external view returns (uint256[]memory);	//inject NONSTANDARD NAMING
    function GETASSETANDUNDERLYINGPRICE677(address asset,uint256 underlying) external view returns (uint256,uint256);	//inject NONSTANDARD NAMING
//    function getSellOptionsPrice(address oToken) external view returns (uint256);
//    function getBuyOptionsPrice(address oToken) external view returns (uint256);
}
contract ImportOracle is Ownable{
    IFNXOracle internal _oracle;
    function ORACLEGETPRICES19(uint256[] memory assets) internal view returns (uint256[]memory){	//inject NONSTANDARD NAMING
        uint256[] memory prices = _oracle.GETPRICES76(assets);
        uint256 len = assets.length;
        for (uint i=0;i<len;i++){
        require(prices[i] >= 100 && prices[i] <= 1e30);
        }
        return prices;
    }
    function ORACLEPRICE250(address asset) internal view returns (uint256){	//inject NONSTANDARD NAMING
        uint256 price = _oracle.GETPRICE334(asset);
        require(price >= 100 && price <= 1e30);
        return price;
    }
    function ORACLEUNDERLYINGPRICE9(uint256 cToken) internal view returns (uint256){	//inject NONSTANDARD NAMING
        uint256 price = _oracle.GETUNDERLYINGPRICE817(cToken);
        require(price >= 100 && price <= 1e30);
        return price;
    }
    function ORACLEASSETANDUNDERLYINGPRICE759(address asset,uint256 cToken) internal view returns (uint256,uint256){	//inject NONSTANDARD NAMING
        (uint256 price1,uint256 price2) = _oracle.GETASSETANDUNDERLYINGPRICE677(asset,cToken);
        require(price1 >= 100 && price1 <= 1e30);
        require(price2 >= 100 && price2 <= 1e30);
        return (price1,price2);
    }
    function GETORACLEADDRESS669() public view returns(address){	//inject NONSTANDARD NAMING
        return address(_oracle);
    }
    function SETORACLEADDRESS836(address oracle)public ONLYOWNER340{	//inject NONSTANDARD NAMING
        _oracle = IFNXOracle(oracle);
    }
}

// File: contracts\modules\whiteList.sol

pragma solidity =0.5.16;
                                                                                          
library whiteListUint32 {
                                                                                                                                     

    function ADDWHITELISTUINT32219(uint32[] storage whiteList,uint32 temp) internal{	//inject NONSTANDARD NAMING
        if (!ISELIGIBLEUINT32691(whiteList,temp)){
            whiteList.push(temp);
        }
    }
                                                         
    function REMOVEWHITELISTUINT32948(uint32[] storage whiteList,uint32 temp)internal returns (bool) {	//inject NONSTANDARD NAMING
        uint256 len = whiteList.length;
        uint256 i=0;
        for (;i<len;i++){
            if (whiteList[i] == temp)
                break;
        }
        if (i<len){
            if (i!=len-1) {
                whiteList[i] = whiteList[len-1];
            }
            whiteList.length--;
            return true;
        }
        return false;
    }
    function ISELIGIBLEUINT32691(uint32[] memory whiteList,uint32 temp) internal pure returns (bool){	//inject NONSTANDARD NAMING
        uint256 len = whiteList.length;
        for (uint256 i=0;i<len;i++){
            if (whiteList[i] == temp)
                return true;
        }
        return false;
    }
    function _GETELIGIBLEINDEXUINT32207(uint32[] memory whiteList,uint32 temp) internal pure returns (uint256){	//inject NONSTANDARD NAMING
        uint256 len = whiteList.length;
        uint256 i=0;
        for (;i<len;i++){
            if (whiteList[i] == temp)
                break;
        }
        return i;
    }
}
                                                                                           
library whiteListUint256 {
    // add whiteList
    function ADDWHITELISTUINT256794(uint256[] storage whiteList,uint256 temp) internal{	//inject NONSTANDARD NAMING
        if (!ISELIGIBLEUINT25614(whiteList,temp)){
            whiteList.push(temp);
        }
    }
    function REMOVEWHITELISTUINT256388(uint256[] storage whiteList,uint256 temp)internal returns (bool) {	//inject NONSTANDARD NAMING
        uint256 len = whiteList.length;
        uint256 i=0;
        for (;i<len;i++){
            if (whiteList[i] == temp)
                break;
        }
        if (i<len){
            if (i!=len-1) {
                whiteList[i] = whiteList[len-1];
            }
            whiteList.length--;
            return true;
        }
        return false;
    }
    function ISELIGIBLEUINT25614(uint256[] memory whiteList,uint256 temp) internal pure returns (bool){	//inject NONSTANDARD NAMING
        uint256 len = whiteList.length;
        for (uint256 i=0;i<len;i++){
            if (whiteList[i] == temp)
                return true;
        }
        return false;
    }
    function _GETELIGIBLEINDEXUINT25665(uint256[] memory whiteList,uint256 temp) internal pure returns (uint256){	//inject NONSTANDARD NAMING
        uint256 len = whiteList.length;
        uint256 i=0;
        for (;i<len;i++){
            if (whiteList[i] == temp)
                break;
        }
        return i;
    }
}
                                                                                           
library whiteListAddress {
    // add whiteList
    function ADDWHITELISTADDRESS524(address[] storage whiteList,address temp) internal{	//inject NONSTANDARD NAMING
        if (!ISELIGIBLEADDRESS382(whiteList,temp)){
            whiteList.push(temp);
        }
    }
    function REMOVEWHITELISTADDRESS842(address[] storage whiteList,address temp)internal returns (bool) {	//inject NONSTANDARD NAMING
        uint256 len = whiteList.length;
        uint256 i=0;
        for (;i<len;i++){
            if (whiteList[i] == temp)
                break;
        }
        if (i<len){
            if (i!=len-1) {
                whiteList[i] = whiteList[len-1];
            }
            whiteList.length--;
            return true;
        }
        return false;
    }
    function ISELIGIBLEADDRESS382(address[] memory whiteList,address temp) internal pure returns (bool){	//inject NONSTANDARD NAMING
        uint256 len = whiteList.length;
        for (uint256 i=0;i<len;i++){
            if (whiteList[i] == temp)
                return true;
        }
        return false;
    }
    function _GETELIGIBLEINDEXADDRESS947(address[] memory whiteList,address temp) internal pure returns (uint256){	//inject NONSTANDARD NAMING
        uint256 len = whiteList.length;
        uint256 i=0;
        for (;i<len;i++){
            if (whiteList[i] == temp)
                break;
        }
        return i;
    }
}

// File: contracts\modules\underlyingAssets.sol

pragma solidity =0.5.16;


                                                                                               
contract UnderlyingAssets is Ownable {
    using whiteListUint32 for uint32[];
    // The eligible underlying list
    uint32[] internal underlyingAssets;
                                                                                                                                                     
    function ADDUNDERLYINGASSET520(uint32 underlying)public ONLYOWNER340{	//inject NONSTANDARD NAMING
        underlyingAssets.ADDWHITELISTUINT32219(underlying);
    }
    function SETUNDERLYINGASSET23(uint32[] memory underlyings)public ONLYOWNER340{	//inject NONSTANDARD NAMING
        underlyingAssets = underlyings;
    }
                                                                                                                                                        
    function REMOVEUNDERLYINGASSETS883(uint32 removeUnderlying)public ONLYOWNER340 returns(bool) {	//inject NONSTANDARD NAMING
        return underlyingAssets.REMOVEWHITELISTUINT32948(removeUnderlying);
    }
                                                                                    
    function GETUNDERLYINGASSETS432()public view returns (uint32[] memory){	//inject NONSTANDARD NAMING
        return underlyingAssets;
    }
                                                                                                                                                          
    function ISELIGIBLEUNDERLYINGASSET176(uint32 underlying) public view returns (bool){	//inject NONSTANDARD NAMING
        return underlyingAssets.ISELIGIBLEUINT32691(underlying);
    }
    function _GETELIGIBLEUNDERLYINGINDEX99(uint32 underlying) internal view returns (uint256){	//inject NONSTANDARD NAMING
        return underlyingAssets._GETELIGIBLEINDEXUINT32207(underlying);
    }
}

// File: contracts\interfaces\IVolatility.sol

pragma solidity =0.5.16;

interface IVolatility {
    function CALCULATEIV382(uint32 underlying,uint8 optType,uint256 expiration,uint256 currentPrice,uint256 strikePrice)external view returns (uint256);	//inject NONSTANDARD NAMING
}
contract ImportVolatility is Ownable{
    IVolatility internal _volatility;
    function GETVOLATILITYADDRESS785() public view returns(address){	//inject NONSTANDARD NAMING
        return address(_volatility);
    }
    function SETVOLATILITYADDRESS999(address volatility)public ONLYOWNER340{	//inject NONSTANDARD NAMING
        _volatility = IVolatility(volatility);
    }
}

// File: contracts\interfaces\IOptionsPrice.sol

pragma solidity =0.5.16;

interface IOptionsPrice {
    function GETOPTIONSPRICE217(uint256 currentPrice, uint256 strikePrice, uint256 expiration,uint32 underlying,uint8 optType)external view returns (uint256);	//inject NONSTANDARD NAMING
    function GETOPTIONSPRICE_IV680(uint256 currentPrice, uint256 strikePrice, uint256 expiration,	//inject NONSTANDARD NAMING
                uint256 ivNumerator,uint8 optType)external view returns (uint256);
    function CALOPTIONSPRICERATIO463(uint256 selfOccupied,uint256 totalOccupied,uint256 totalCollateral) external view returns (uint256);	//inject NONSTANDARD NAMING
}
contract ImportOptionsPrice is Ownable{
    IOptionsPrice internal _optionsPrice;
    function GETOPTIONSPRICEADDRESS6() public view returns(address){	//inject NONSTANDARD NAMING
        return address(_optionsPrice);
    }
    function SETOPTIONSPRICEADDRESS930(address optionsPrice)public ONLYOWNER340{	//inject NONSTANDARD NAMING
        _optionsPrice = IOptionsPrice(optionsPrice);
    }
}

// File: contracts\modules\Operator.sol

pragma solidity =0.5.16;


                                                                                                                                                                 
contract Operator is Ownable {
    using whiteListAddress for address[];
    address[] private _operatorList;
                                                                                                                   
    modifier ONLYOPERATOR89() {	//inject NONSTANDARD NAMING
        require(_operatorList.ISELIGIBLEADDRESS382(msg.sender),"Managerable: caller is not the Operator");
        _;
    }
                                                                                                                          
    modifier ONLYOPERATORINDEX726(uint256 index) {	//inject NONSTANDARD NAMING
        require(_operatorList.length>index && _operatorList[index] == msg.sender,"Operator: caller is not the eligible Operator");
        _;
    }
                                                                
    function ADDOPERATOR860(address addAddress)public ONLYOWNER340{	//inject NONSTANDARD NAMING
        _operatorList.ADDWHITELISTADDRESS524(addAddress);
    }
                                                                     
    function SETOPERATOR811(uint256 index,address addAddress)public ONLYOWNER340{	//inject NONSTANDARD NAMING
        _operatorList[index] = addAddress;
    }
                                                             
    function REMOVEOPERATOR983(address removeAddress)public ONLYOWNER340 returns (bool){	//inject NONSTANDARD NAMING
        return _operatorList.REMOVEWHITELISTADDRESS842(removeAddress);
    }
                                                      
    function GETOPERATOR19()public view returns (address[] memory) {	//inject NONSTANDARD NAMING
        return _operatorList;
    }
                                                               
    function SETOPERATORS89(address[] memory operators)public ONLYOWNER340 {	//inject NONSTANDARD NAMING
        _operatorList = operators;
    }
}

// File: contracts\modules\ImputRange.sol

pragma solidity =0.5.16;


contract ImputRange is Ownable {
    
    //The maximum input amount limit.
    uint256 private maxAmount = 1e30;
    //The minimum input amount limit.
    uint256 private minAmount = 1e2;
    
    modifier INRANGE596(uint256 amount) {	//inject NONSTANDARD NAMING
        require(maxAmount>=amount && minAmount<=amount,"input amount is out of input amount range");
        _;
    }
                                                                                                                                            
    function ISINPUTAMOUNTINRANGE192(uint256 Amount)public view returns (bool){	//inject NONSTANDARD NAMING
        return(maxAmount>=Amount && minAmount<=Amount);
    }
                                                                                                                                                                                                                                                      
    modifier SMALLER429(uint256 amount) {	//inject NONSTANDARD NAMING
        require(maxAmount>=amount,"input amount is larger than maximium");
        _;
    }
    modifier LARGER73(uint256 amount) {	//inject NONSTANDARD NAMING
        require(minAmount<=amount,"input amount is smaller than maximium");
        _;
    }
                                                               
    function GETINPUTAMOUNTRANGE274() public view returns(uint256,uint256) {	//inject NONSTANDARD NAMING
        return (minAmount,maxAmount);
    }
                                                                                                                                                                               
    function SETINPUTAMOUNTRANGE681(uint256 _minAmount,uint256 _maxAmount) public ONLYOWNER340{	//inject NONSTANDARD NAMING
        minAmount = _minAmount;
        maxAmount = _maxAmount;
    }        
}

// File: contracts\OptionsPool\OptionsData.sol

pragma solidity =0.5.16;







contract OptionsData is UnderlyingAssets,ImputRange,Managerable,ImportOracle,ImportVolatility,ImportOptionsPrice,Operator{

        // store option info
        struct OptionsInfo {
        address     owner;      // option's owner
        uint8   	optType;    //0 for call, 1 for put
        uint24		underlying; // underlying ID, 1 for BTC,2 for ETH
        uint64      optionsPrice;

        address     settlement;    //user's settlement paying for option. 
        uint64      createTime;
        uint32		expiration; //


        uint128     amount; 
        uint128     settlePrice;

        uint128     strikePrice;    //  strike price		
        uint32      priceRate;    //underlying Price	
        uint64      iv;
        uint32      extra;
    }

    uint256 internal limitation = 1 hours;
    //all options information list
    OptionsInfo[] internal allOptions;
    //user options balances
    mapping(address=>uint64[]) internal optionsBalances;
    //expiration whitelist
    uint32[] internal expirationList;
    
    // first option position which is needed calculate.
    uint256 internal netWorthirstOption;
    // options latest networth balance. store all options's net worth share started from first option.
    mapping(address=>int256) internal optionsLatestNetWorth;

    // first option position which is needed calculate.
    uint256 internal occupiedFirstOption; 
    //latest calcutated Options Occupied value.
    uint256 internal callOccupied;
    uint256 internal putOccupied;
    //latest Options volatile occupied value when bought or selled options.
    int256 internal callLatestOccupied;
    int256 internal putLatestOccupied;

                                                                                                                                                                                                                                                                                                                                                                                                         
    event CREATEOPTION462(address indexed owner,uint256 indexed optionID,uint8 optType,uint32 underlying,uint256 expiration,uint256 strikePrice,uint256 amount);	//inject NONSTANDARD NAMING
                                                                                                      
    event BURNOPTION104(address indexed owner,uint256 indexed optionID,uint amount);	//inject NONSTANDARD NAMING
    event DEBUGEVENT10(uint256 id,uint256 value1,uint256 value2);	//inject NONSTANDARD NAMING
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

// File: contracts\Proxy\baseProxy.sol

pragma solidity =0.5.16;

                                      
contract baseProxy is Ownable {
    address public implementation;
    constructor(address implementation_) public {
        // Creator of the contract is admin during initialization
        implementation = implementation_; 
        (bool success,) = implementation_.delegatecall(abi.encodeWithSignature("initialize()"));
        require(success);
    }
    function GETIMPLEMENTATION658()public view returns(address){	//inject NONSTANDARD NAMING
        return implementation;
    }
    function SETIMPLEMENTATION971(address implementation_)public ONLYOWNER340{	//inject NONSTANDARD NAMING
        implementation = implementation_; 
        (bool success,) = implementation_.delegatecall(abi.encodeWithSignature("update()"));
        require(success);
    }

                                                                                                                                                                                                                                                                                               
    function DELEGATETOIMPLEMENTATION111(bytes memory data) public returns (bytes memory) {	//inject NONSTANDARD NAMING
        (bool success, bytes memory returnData) = implementation.delegatecall(data);
        assembly {
            if eq(success, 0) {
                revert(add(returnData, 0x20), returndatasize)
            }
        }
        return returnData;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                      
    function DELEGATETOVIEWIMPLEMENTATION370(bytes memory data) public view returns (bytes memory) {	//inject NONSTANDARD NAMING
        (bool success, bytes memory returnData) = address(this).staticcall(abi.encodeWithSignature("delegateToImplementation(bytes)", data));
        assembly {
            if eq(success, 0) {
                revert(add(returnData, 0x20), returndatasize)
            }
        }
        return abi.decode(returnData, (bytes));
    }

    function DELEGATETOVIEWANDRETURN839() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        (bool success, ) = address(this).staticcall(abi.encodeWithSignature("delegateToImplementation(bytes)", msg.data));

        assembly {
            let free_mem_ptr := mload(0x40)
            returndatacopy(free_mem_ptr, 0, returndatasize)

            switch success
            case 0 { revert(free_mem_ptr, returndatasize) }
            default { return(add(free_mem_ptr, 0x40), returndatasize) }
        }
    }

    function DELEGATEANDRETURN630() internal returns (bytes memory) {	//inject NONSTANDARD NAMING
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

// File: contracts\OptionsPool\OptionsProxy.sol

pragma solidity =0.5.16;


                                           
contract OptionsProxy is OptionsData,baseProxy{
                                                                                                                                                                                                                                               

    constructor(address implementation_,address oracleAddr,address optionsPriceAddr,address ivAddress)
         baseProxy(implementation_) public  {
        _oracle = IFNXOracle(oracleAddr);
        _optionsPrice = IOptionsPrice(optionsPriceAddr);
        _volatility = IVolatility(ivAddress);
    }
    function SETTIMELIMITATION272(uint256           )public{	//inject NONSTANDARD NAMING
        DELEGATEANDRETURN630();
    }
    function GETTIMELIMITATION662()public view returns(uint256){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
    
                                                                                           
    function GETUSEROPTIONSID898(address         )public view returns(uint64[] memory){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                                                                   
    function GETUSEROPTIONSID898(address         ,uint256         ,uint256         )public view returns(uint64[] memory){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                              
    function GETOPTIONINFOLENGTH542()public view returns (uint256){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                                         
    function GETOPTIONINFOLIST157(uint256         ,uint256         )public view 	//inject NONSTANDARD NAMING
                returns(address[] memory,uint256[] memory,uint256[] memory,uint256[] memory,uint256[] memory){
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                             
    function GETOPTIONINFOLISTFROMID598(uint256[] memory        )public view 	//inject NONSTANDARD NAMING
                returns(address[] memory,uint256[] memory,uint256[] memory,uint256[] memory,uint256[] memory){
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                  
    function GETOPTIONSLIMITTIMEBYID361(uint256              )public view returns(uint256){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                       
    function GETOPTIONSBYID30(uint256              )public view returns(uint256,address,uint8,uint32,uint256,uint256,uint256){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                            
    function GETOPTIONSEXTRABYID247(uint256              )public view returns(address,uint256,uint256,uint256,uint256){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                           
    function GETEXERCISEWORTH316(uint256              ,uint256           )public view returns(uint256){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                                   
    // function buyOptionCheck(uint32               ,uint32               )public view{
    //     delegateToViewAndReturn();
    // }
                                                                                                                                             
    function ADDEXPIRATION513(uint32               )public{	//inject NONSTANDARD NAMING
        DELEGATEANDRETURN630();
    }
                                                                                                                                                
    function REMOVEEXPIRATIONLIST503(uint32                     )public returns(bool) {	//inject NONSTANDARD NAMING
        DELEGATEANDRETURN630();
    }
                                                                                  
    function GETEXPIRATIONLIST665()public view returns (uint32[] memory){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                                    
    function ISELIGIBLEEXPIRATION476(uint256               ) public view returns (bool){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                             
    function CHECKEXPIRATION142(uint256               ) public view{	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                                                       
    function GETBURNEDFULLPAY881(uint256             ,uint256           ) public view returns(address,uint256){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                         
    function GETOCCUPIEDCALINFO801()public view returns(uint256,int256,int256){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                     
    function SETOCCUPIEDCOLLATERAL387() public {	//inject NONSTANDARD NAMING
        DELEGATEANDRETURN630();
    }
                                                                                                                                                                                                   
    function CALCULATEPHASEOCCUPIEDCOLLATERAL740(uint256               ,uint256                ,uint256              ) public view returns(uint256,uint256,uint256,bool){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function SETCOLLATERALPHASE273(uint256                      ,uint256                     ,	//inject NONSTANDARD NAMING
        uint256                ,int256                      ,int256                     ) public{
        DELEGATEANDRETURN630();
    }
    function GETALLTOTALOCCUPIEDCOLLATERAL246() public view returns (uint256,uint256){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                              
    function GETCALLTOTALOCCUPIEDCOLLATERAL526() public view returns (uint256) {	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                             
    function GETPUTTOTALOCCUPIEDCOLLATERAL712() public view returns (uint256) {	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                      
    function GETTOTALOCCUPIEDCOLLATERAL627() public view returns (uint256) {	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                 
    function GETNETWROTHCALINFO914(address[] memory              )public view returns(uint256,int256[] memory){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                          
    function GETNETWROTHLATESTWORTH851(address               )public view returns(int256){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                                                                                                                                                                
    function SETSHAREDSTATE373(uint256                   ,int256[] memory                   ,address[] memory              ) public{	//inject NONSTANDARD NAMING
        DELEGATEANDRETURN630();
    }
                                                                                                                                                                                                                                                                                               
    function CALRANGESHAREDPAYMENT53(uint256               ,uint256          ,uint256        ,address[] memory              )	//inject NONSTANDARD NAMING
            public view returns(int256[] memory,uint256[] memory,uint256){
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                                                                                                                                                                                
    function CALCULATEPHASEOPTIONSFALL247(uint256               ,uint256          ,uint256        ,address[] memory              ) public view returns(int256[] memory){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }

                                                                                                                                                        
    function GETOPTIONCALRANGEALL156(address[] memory              )public view returns(uint256,int256,int256,uint256,int256[] memory,uint256,uint256){	//inject NONSTANDARD NAMING
        DELEGATETOVIEWANDRETURN839();
    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function CREATEOPTIONS505(address         ,address               ,uint256                ,	//inject NONSTANDARD NAMING
    uint128                ,uint128                    ,uint128           ,uint128                ) public returns(uint256) {
        DELEGATEANDRETURN630();
    }
                                                                                                                                                                                                                                                                                                                                           
    function BURNOPTIONS173(address         ,uint256       ,uint256           ,uint256                )public{	//inject NONSTANDARD NAMING
        DELEGATEANDRETURN630();
    }
    function GETUSERALLOPTIONINFO219(address         )public view 	//inject NONSTANDARD NAMING
        returns(address[] memory,uint256[] memory,uint256[] memory,uint256[] memory,uint256[] memory){
        DELEGATETOVIEWANDRETURN839();
    }
}