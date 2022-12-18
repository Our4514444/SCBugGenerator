pragma solidity ^0.5.5;

//DCC VERSION 5

                                                                             
                                                                       
interface ERC721 {
    // Required methods
    function TOTALSUPPLY628() external view returns (uint256 total);	//inject NONSTANDARD NAMING
    
    function BALANCEOF432(address _owner) external view returns (uint256 balance);	//inject NONSTANDARD NAMING
    function OWNEROF289(uint256 _tokenId) external view returns (address owner);	//inject NONSTANDARD NAMING
    function EXISTS997(uint256 _tokenId) external view returns (bool _exists);	//inject NONSTANDARD NAMING
    
    function APPROVE641(address _to, uint256 _tokenId) external;	//inject NONSTANDARD NAMING
    function TRANSFER807(address _to, uint256 _tokenId) external;	//inject NONSTANDARD NAMING
    function TRANSFERFROM751(address _from, address _to, uint256 _tokenId) external;	//inject NONSTANDARD NAMING

    // Events
    event TRANSFER391(address from, address to, uint256 tokenId);	//inject NONSTANDARD NAMING
    event APPROVAL826(address owner, address approved, uint256 tokenId);	//inject NONSTANDARD NAMING

    function SUPPORTSINTERFACE379(bytes4 _interfaceID) external view returns (bool);	//inject NONSTANDARD NAMING
}

                                                                                                                                                           
contract ERC721Metadata is ERC721 {
  function NAME433() external view returns (string memory _name);	//inject NONSTANDARD NAMING
  function SYMBOL632() external view returns (string memory _symbol);	//inject NONSTANDARD NAMING
  function TOKENURI793(uint256 _tokenId) public view returns (string memory);	//inject NONSTANDARD NAMING
}

                                                                                    
interface WLCCompatible {
    function GETWLCREWARD73(uint256 _boughtWLCAmount, address _owner) external returns (uint256 _remaining);	//inject NONSTANDARD NAMING
    function SETWLCPARAMS347(address _address, uint256 _reward) external;	//inject NONSTANDARD NAMING
    function RESETWLCPARAMS874() external;	//inject NONSTANDARD NAMING
    
    function GETFORWLC598(address _owner) external;	//inject NONSTANDARD NAMING
    
    function GETWLCREWARDAMOUNT999() external view returns (uint256 _amount);	//inject NONSTANDARD NAMING
    function GETWLCADDRESS525() external view returns (address _address);	//inject NONSTANDARD NAMING
}

contract DreamCarToken3 is ERC721, ERC721Metadata, WLCCompatible {
    string internal constant tokenname732   = 'DreamCarCoin3';	//inject NONSTANDARD NAMING
    string internal constant tokensymbol880 = 'DCC3';	//inject NONSTANDARD NAMING
    
    uint8 public constant decimals2 = 0;	//inject NONSTANDARD NAMING
    
    //ERC721 VARIABLES
    
    //the total count of wishes
    uint256 internal totalTokenSupply;
    
    //this address is the CEO
    address payable public CEO;
    
    bytes4 constant interfacesignature_erc165113 =	//inject NONSTANDARD NAMING
        bytes4(keccak256('supportsInterface(bytes4)'));

    bytes4 constant interfacesignature_erc721898 =	//inject NONSTANDARD NAMING
        bytes4(keccak256('name()')) ^
        bytes4(keccak256('symbol()')) ^
        bytes4(keccak256('totalTokenSupply()')) ^
        bytes4(keccak256('balanceOf(address)')) ^
        bytes4(keccak256('ownerOf(uint256)')) ^
        bytes4(keccak256('approve(address,uint256)')) ^
        bytes4(keccak256('transfer(address,uint256)')) ^
        bytes4(keccak256('transferFrom(address,address,uint256)')) ^
        bytes4(keccak256('tokensOfOwner(address)')) ^
        bytes4(keccak256('tokenMetadata(uint256,string)'));
    
    // Mapping from owner to number of owned tokens
    //mapping (address => uint256) internal tokensBalanceOf;
    
    // Mapping from token ID to owner
    mapping (uint256 => address) internal tokenOwner;
    
    // Optional mapping for token URIs
    mapping(uint256 => string) internal tokenURIs;
    
    //TOKEN SPECIFIC VARIABLES

    mapping (address => uint256) internal tokenBallanceOf;
    
    //Token price in WEI
    uint256 public tokenPrice;
    
    //A list of price admins; they can change price, in addition to the CEO
    address[] public priceAdmins;
    
    //Next id that will be assigned to token
    uint256 internal nextTokenId = 1;
    
    //The winning token id
    uint256 public winningTokenId = 0;
    
    //The winner's address, it will be empty, until the reward is claimed
    address public winnerAddress; 
    
    //WLC CONTRACT INTERACTION VARIABLES
    
    //WLC tokens in a single purchase to earn a DCC token
    uint256 internal WLCRewardAmount;
    
    //WLC deployed contract address
    address internal WLCAdress;
    
    //ERC721 FUNCTIONS IMPLEMENTATIONS
    
    function SUPPORTSINTERFACE379(bytes4 _interfaceID) external view returns (bool) {	//inject NONSTANDARD NAMING
        return ((_interfaceID == interfacesignature_erc165113) || (_interfaceID == interfacesignature_erc721898));
    }
    
                                                                                                                                            
    function TOTALSUPPLY628() public view returns (uint256 total) {	//inject NONSTANDARD NAMING
        return totalTokenSupply;
    }
    
                                                                                                                                                                                                
    function BALANCEOF432(address _owner) public view returns (uint256 _balance) {	//inject NONSTANDARD NAMING
        return tokenBallanceOf[_owner];
    }
    
                                                                                                                                                                                                                     
    function OWNEROF289(uint256 _tokenId) public view returns (address _owner) {	//inject NONSTANDARD NAMING
        return tokenOwner[_tokenId];
    }
    
                                                                                                                                                                                  
    function EXISTS997(uint256 _tokenId) public view returns (bool) {	//inject NONSTANDARD NAMING
        address owner = tokenOwner[_tokenId];
        return owner != address(0);
    }
    
                                                    
    function TRANSFER807(address _to, uint256 _tokenId) external { }	//inject NONSTANDARD NAMING
    
                                                    
    function APPROVE641(address _to, uint256 _tokenId) external { }	//inject NONSTANDARD NAMING
    
                                                              
    function TRANSFERFROM751(address _from, address _to, uint256 _tokenId) external { }	//inject NONSTANDARD NAMING
    
                                                                                                                                                                                                                                   
    function _SETTOKENURI62(uint256 _tokenId, string storage _uri) internal {	//inject NONSTANDARD NAMING
        require(EXISTS997(_tokenId));
        tokenURIs[_tokenId] = _uri;
    }
    
    //ERC721Metadata FUNCTIONS IMPLEMENTATIONS
                                                                                            
    function NAME433() external view returns (string memory _name) {	//inject NONSTANDARD NAMING
        return tokenname732;
    }
    
                                                                                                
    function SYMBOL632() external view returns (string memory _symbol) {	//inject NONSTANDARD NAMING
        return tokensymbol880;
    }
    
                                                                                                                                                                                            
    function TOKENURI793(uint256 _tokenId) public view returns (string memory) {	//inject NONSTANDARD NAMING
        require(EXISTS997(_tokenId));
        return tokenURIs[_tokenId];
    }
    
    //TOKEN SPECIFIC FUNCTIONS
    
    event BUY277(address indexed from, uint256 amount, uint256 fromTokenId, uint256 toTokenId);	//inject NONSTANDARD NAMING
    
    event REWARDISCLAIMED948(address indexed from, uint256 tokenId);	//inject NONSTANDARD NAMING
    
    event WINNERISCHOSEN562(address indexed from, uint256 tokenId);	//inject NONSTANDARD NAMING
    
                                                                                     
    modifier ONLYCEO505 {	//inject NONSTANDARD NAMING
        require(msg.sender == CEO, 'You need to be the CEO to do that!');
        _;
    }
    
                                                                                                             
    constructor (address payable _ceo) public {
        CEO = _ceo;
        
        totalTokenSupply = 20000;
        
        tokenPrice = 41501723917762739; // (if eth = 156.62USD, 6.5 USD for token)
    }
    
                                                                                                  
    function LASTTOKENID866() public view returns (uint256 tokenId) {	//inject NONSTANDARD NAMING
        return nextTokenId - 1;
    }
    
                                                                                                                      
    function SETTOKENPRICEINWEI792(uint256 _newPrice) public {	//inject NONSTANDARD NAMING
        bool transactionAllowed = false;
        
        if (msg.sender == CEO) {
            transactionAllowed = true;
        } else {
            for (uint256 i = 0; i < priceAdmins.length; i++) {
                if (msg.sender == priceAdmins[i]) {
                    transactionAllowed = true;
                    break;
                }
            }
        }
        
        require((transactionAllowed == true), 'You cannot do that!');
        tokenPrice = _newPrice;
    }
    
                                                                                                                                        
    function ADDPRICEADMIN891(address _newPriceAdmin) ONLYCEO505 public {	//inject NONSTANDARD NAMING
        priceAdmins.push(_newPriceAdmin);
    }
    
                                                                                                                                                          
    function REMOVEPRICEADMIN579(address _existingPriceAdmin) ONLYCEO505 public {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < priceAdmins.length; i++) {
            if (_existingPriceAdmin == priceAdmins[i]) {
                delete priceAdmins[i];
                break;
            }
        }
    }
    
                                                                                                                                                                                                                                                                    
    function _ADDTOKENSTOADDRESS514(address _to, uint256 _amount) internal {	//inject NONSTANDARD NAMING
        for (uint256 i = 0; i < _amount; i++) {
            tokenOwner[nextTokenId + i] = _to;
        }
        
        tokenBallanceOf[_to] += _amount;
        
        nextTokenId += _amount;
    }
    
                                                                                       
    function ENSUREADDRESSISTOKENOWNER681(address _owner, uint256 _tokenId) internal view {	//inject NONSTANDARD NAMING
        require(BALANCEOF432(_owner) >= 1, 'You do not own any tokens!');
        
        require(tokenOwner[_tokenId] == _owner, 'You do not own this token!');
    }
    
                                                                                                                                           
    function GETRANDOMNUMBER194() internal view returns (uint16) {	//inject NONSTANDARD NAMING
        return uint16(
                uint256(
                    keccak256(
                        abi.encodePacked(block.timestamp, block.difficulty, block.number)
                    )
                )%totalTokenSupply
            ) + 1;
    }
    
                                                                              
    function CHOOSEWINNER770() internal {	//inject NONSTANDARD NAMING
         if ((nextTokenId - 1) == totalTokenSupply) {
            winningTokenId = GETRANDOMNUMBER194();
            emit WINNERISCHOSEN562(tokenOwner[winningTokenId], winningTokenId);
        } 
    }
    
                                                                                                                                                                                                                                                                                                      
    function SCALEPURCHASETOKENAMOUNTTOMATCHREMAININGTOKENS959(uint256 _amount) internal view returns (uint256 _exactAmount) {	//inject NONSTANDARD NAMING
        if (nextTokenId + _amount - 1 > totalTokenSupply) {
            _amount = totalTokenSupply - nextTokenId + 1;
        }
        
        return _amount;
    }

                                                                                                                                                                                                                                   
    function BUY640() payable public {	//inject NONSTANDARD NAMING
        require(msg.value >= tokenPrice, "You did't send enough ETH");
        
        uint256 amount = SCALEPURCHASETOKENAMOUNTTOMATCHREMAININGTOKENS959(msg.value / tokenPrice);
        
        require(amount > 0, "Not enough tokens are available for purchase!");
        
        _ADDTOKENSTOADDRESS514(msg.sender, amount);
        
        emit BUY277(msg.sender, amount, nextTokenId - amount, nextTokenId - 1);
        
        //transfer ETH to CEO
        CEO.transfer((amount * tokenPrice));
        
        //returns excessive ETH
        msg.sender.transfer(msg.value - (amount * tokenPrice));
        
        CHOOSEWINNER770();
    }
    
                                                                                                                                                                                    
    function CLAIMREWARD412(uint256 _tokenId) public {	//inject NONSTANDARD NAMING
        require(winningTokenId > 0, "The is not winner yet!");
        require(_tokenId == winningTokenId, "This token is not the winner!");
        
        ENSUREADDRESSISTOKENOWNER681(msg.sender, _tokenId);
        
        winnerAddress = msg.sender;
        
        emit REWARDISCLAIMED948(msg.sender, _tokenId);
    }
    
    //WLC INTERACTION FUNCTIONS
    
                                                                                                                                                                                                                                                                                             
    function SETWLCPARAMS347(address _address, uint256 _reward) public ONLYCEO505 {	//inject NONSTANDARD NAMING
        WLCAdress = _address;
        WLCRewardAmount = _reward;
    }
    
                                                                                                                                
    function RESETWLCPARAMS874() public ONLYCEO505 {	//inject NONSTANDARD NAMING
        WLCAdress = address(0);
        WLCRewardAmount = 0;
    }
    
                                                                                                                                        
    function GETWLCREWARDAMOUNT999() public view returns (uint256 _amount) {	//inject NONSTANDARD NAMING
        return WLCRewardAmount;
    }
    
                                                                                               
    function GETWLCADDRESS525() public view returns (address _address) {	//inject NONSTANDARD NAMING
        return WLCAdress;
    }
    
                                                                                                                                                                                                                                                                                                                                                                              
    function GETWLCREWARD73(uint256 _boughtWLCAmount, address _owner) public returns (uint256 _remaining) {	//inject NONSTANDARD NAMING
        if (WLCAdress != address(0) && WLCRewardAmount > 0 && _boughtWLCAmount >= WLCRewardAmount) {
            require(WLCAdress == msg.sender, "You cannot invoke this function directly!");
            
            uint256 DCCAmount = SCALEPURCHASETOKENAMOUNTTOMATCHREMAININGTOKENS959(_boughtWLCAmount / WLCRewardAmount);
            
            if (DCCAmount > 0) {
                _ADDTOKENSTOADDRESS514(_owner, DCCAmount);
                
                emit BUY277(_owner, DCCAmount, nextTokenId - DCCAmount, nextTokenId - 1);
                
                CHOOSEWINNER770();
                
                return _boughtWLCAmount - (DCCAmount * WLCRewardAmount);
            }
        }
        
        return _boughtWLCAmount;
    }
    
                                                                                                                                                                                                                                            
    function GETFORWLC598(address _owner) public {	//inject NONSTANDARD NAMING
        require(WLCAdress == msg.sender, "You cannot invoke this function directly!");
        
        require(nextTokenId <= totalTokenSupply, "Not enough tokens are available for purchase!");
        
        _ADDTOKENSTOADDRESS514(_owner, 1);
        
        emit BUY277(_owner, 1, nextTokenId - 1, nextTokenId - 1);
        
        CHOOSEWINNER770();
    }
}