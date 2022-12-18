                                                                 

pragma solidity ^0.5.8;

                                                                                        
interface IERC20 {
    function TRANSFER572(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE989(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM100(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY528() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF190(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE318(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER448(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL789(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                                   
library SafeMath {
                                                                                
    function MUL89(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV554(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB155(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD952(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD538(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                             
    function TOTALSUPPLY528() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF190(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE318(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER572(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER551(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE989(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL789(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM100(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB155(value);
        _TRANSFER551(from, to, value);
        emit APPROVAL789(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE528(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD952(addedValue);
        emit APPROVAL789(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE742(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB155(subtractedValue);
        emit APPROVAL789(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER551(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB155(value);
        _balances[to] = _balances[to].ADD952(value);
        emit TRANSFER448(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT956(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD952(value);
        _balances[account] = _balances[account].ADD952(value);
        emit TRANSFER448(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN143(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB155(value);
        _balances[account] = _balances[account].SUB155(value);
        emit TRANSFER448(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM462(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _allowed[account][msg.sender] = _allowed[account][msg.sender].SUB155(value);
        _BURN143(account, value);
        emit APPROVAL789(account, msg.sender, _allowed[account][msg.sender]);
    }
}


                                                                                                                                                                                                                             
contract ReentrancyGuard {
                                                                       
    uint256 private _guardCounter;

    constructor() public {
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT967() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter);
    }
}


                                                                                                                     
                                                                                                     
                                                      
                                                                                                             
                                                                                                              
                                                                                                                  
                                                                                                         
                                                                                                                   
                                                                                                                   
                                                                                  
contract WrappedCF is ERC20, ReentrancyGuard {

    // OpenZeppelin's SafeMath library is used for all arithmetic operations to avoid overflows/underflows.
    using SafeMath for uint256;

                
                
                

                                                                                              
                                                 
                                                                                                   
    event DEPOSITCHAINFACEANDMINTTOKEN671(	//inject NONSTANDARD NAMING
        uint256 chainFaceId
    );

                                                                                                    
                                                  
                                                                                                   
    event BURNTOKENANDWITHDRAWCHAINFACE876(	//inject NONSTANDARD NAMING
        uint256 chainFaceId
    );

                 
                 
                 

                                                                                               
                             
                                                                                                    
                                                                                                  
                                                                                                   
                                                                                                
                                                                                            
    uint256[] private depositedChainFacesArray;

                                                                                                       
                                                                                                            
                                                                                                       
                                                                                                      
                                                                                                  
                                                                                                      
                                 
    mapping (uint256 => bool) private chainFaceIsDepositedInContract;

                   
                   
                   

                                                                                 
    uint8 constant public decimals743 = 18;	//inject NONSTANDARD NAMING
    string constant public name830 = "Wrapped ChainFaces";	//inject NONSTANDARD NAMING
    string constant public symbol30 = "WCF";	//inject NONSTANDARD NAMING

                                                                                                       
                                                                                                
                                             
    address public chainFaceCoreAddress = 0x91047Abf3cAb8da5A9515c8750Ab33B4f1560a7A;
    ChainFaceCore chainFaceCore;

                   
                   
                   

                                                                                                
                             
                                                                                              
                                                                                         
    function DEPOSITCHAINFACESANDMINTTOKENS118(uint256[] calldata _chainFaceIds) external NONREENTRANT967 {	//inject NONSTANDARD NAMING
        require(_chainFaceIds.length > 0, 'you must submit an array with at least one element');
        for(uint i = 0; i < _chainFaceIds.length; i++){
            uint256 chainFaceToDeposit = _chainFaceIds[i];
            require(msg.sender == chainFaceCore.OWNEROF878(chainFaceToDeposit), 'you do not own this ChainFace');
            require(chainFaceCore.ISAPPROVEDFORALL1000(msg.sender, address(this)), 'you must approveForAll() this contract to give it permission to withdraw this ChainFace before you can deposit a ChainFace');
            chainFaceCore.TRANSFERFROM100(msg.sender, address(this), chainFaceToDeposit);
            _PUSHCHAINFACE213(chainFaceToDeposit);
            emit DEPOSITCHAINFACEANDMINTTOKEN671(chainFaceToDeposit);
        }
        _MINT956(msg.sender, (_chainFaceIds.length).MUL89(10**18));
    }

                                                                                                 
                    
                                                                                                                
                                                                                                           
                                                                                                               
                                                                                                   
    function BURNTOKENSANDWITHDRAWCHAINFACES346(uint256[] calldata _chainFaceIds, address[] calldata _destinationAddresses) external NONREENTRANT967 {	//inject NONSTANDARD NAMING
        require(_chainFaceIds.length == _destinationAddresses.length, 'you did not provide a destination address for each of the ChainFaces you wish to withdraw');
        require(_chainFaceIds.length > 0, 'you must submit an array with at least one element');

        uint256 numTokensToBurn = _chainFaceIds.length;
        require(BALANCEOF190(msg.sender) >= numTokensToBurn.MUL89(10**18), 'you do not own enough tokens to withdraw this many ERC721 ChainFaces');
        _BURN143(msg.sender, numTokensToBurn.MUL89(10**18));
        
        for(uint i = 0; i < numTokensToBurn; i++){
            uint256 chainFaceToWithdraw = _chainFaceIds[i];
            if(chainFaceToWithdraw == 0){
                chainFaceToWithdraw = _POPCHAINFACE64();
            } else {
                require(chainFaceIsDepositedInContract[chainFaceToWithdraw] == true, 'this chainFace has already been withdrawn');
                require(address(this) == chainFaceCore.OWNEROF878(chainFaceToWithdraw), 'the contract does not own this ChainFace');
                chainFaceIsDepositedInContract[chainFaceToWithdraw] = false;
            }
            chainFaceCore.TRANSFERFROM100(address(this), _destinationAddresses[i], chainFaceToWithdraw);
            emit BURNTOKENANDWITHDRAWCHAINFACE876(chainFaceToWithdraw);
        }
    }

                                                               
                                                                                            
    function _PUSHCHAINFACE213(uint256 _chainFaceIds) internal {	//inject NONSTANDARD NAMING
        depositedChainFacesArray.push(_chainFaceIds);
        chainFaceIsDepositedInContract[_chainFaceIds] = true;
    }

                                                                       
                                                                                              
                                                                                               
                                     
                                                                                 
    function _POPCHAINFACE64() internal returns(uint256){	//inject NONSTANDARD NAMING
        require(depositedChainFacesArray.length > 0, 'there are no ChainFaces in the array');
        uint256 chainFaceId = depositedChainFacesArray[depositedChainFacesArray.length - 1];
        depositedChainFacesArray.length--;
        while(chainFaceIsDepositedInContract[chainFaceId] == false){
            chainFaceId = depositedChainFacesArray[depositedChainFacesArray.length - 1];
            depositedChainFacesArray.length--;
        }
        chainFaceIsDepositedInContract[chainFaceId] = false;
        return chainFaceId;
    }

                                                                                            
                                                                                            
                                                                     
                                                                                            
                                                                                                   
                                                                                 
                                                                           
    function BATCHREMOVEWITHDRAWNCHAINFACESFROMSTORAGE461(uint256 _numSlotsToCheck) external {	//inject NONSTANDARD NAMING
        require(_numSlotsToCheck <= depositedChainFacesArray.length, 'you are trying to batch remove more slots than exist in the array');
        uint256 arrayIndex = depositedChainFacesArray.length;
        for(uint i = 0; i < _numSlotsToCheck; i++){
            arrayIndex = arrayIndex.SUB155(1);
            uint256 chainFaceId = depositedChainFacesArray[arrayIndex];
            if(chainFaceIsDepositedInContract[chainFaceId] == false){
                depositedChainFacesArray.length--;
            } else {
                return;
            }
        }
    }

                                                                                       
                                                      
    constructor() public {
        chainFaceCore = ChainFaceCore(chainFaceCoreAddress);
    }

                                                                                                    
                                                                       
                                                                                                
                                                                                                     
                                     
    function() external payable {}
}

                                                                                               
contract ChainFaceCore {
    function OWNEROF878(uint256 _tokenId) public view returns (address owner);	//inject NONSTANDARD NAMING
    function TRANSFERFROM100(address _from, address _to, uint256 _tokenId) external;	//inject NONSTANDARD NAMING
    function ISAPPROVEDFORALL1000(address _owner, address _operator) public view returns (bool _bool);	//inject NONSTANDARD NAMING
    mapping (uint256 => address) public chainFaceIndexToApproved;
}