pragma solidity ^0.5.5;

//DCC VERSION 5

/// @title Interface for contracts conforming to ERC-721: Non-Fungible Tokens
/// @author Dieter Shirley <dete@axiomzen.co> (https://github.com/dete)
interface ERC721 {
    // Required methods
    function totalSupply() external view returns (uint256 total);
    
    function balanceOf(address _owner) external view returns (uint256 balance);
    function ownerOf(uint256 _tokenId) external view returns (address owner);
    function exists(uint256 _tokenId) external view returns (bool _exists);
    
    function approve(address _to, uint256 _tokenId) external;
    function transfer(address _to, uint256 _tokenId) external;
    function transferFrom(address _from, address _to, uint256 _tokenId) external;

    // Events
    event Transfer(address from, address to, uint256 tokenId);
    event Approval(address owner, address approved, uint256 tokenId);

    function supportsInterface(bytes4 _interfaceID) external view returns (bool);
}

/**
 * @title ERC-721 Non-Fungible Token Standard, optional metadata extension
 * @dev See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
 */
contract ERC721Metadata is ERC721 {
  function name() external view returns (string memory _name);
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
  function symbol() external view returns (string memory _symbol);
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
  function tokenURI(uint256 _tokenId) public view returns (string memory);
function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
}

/**
 * These are required for the DCC contract to interact with the WLC contract
 */
interface WLCCompatible {
    function getWLCReward(uint256 _boughtWLCAmount, address _owner) external returns (uint256 _remaining);
    function setWLCParams(address _address, uint256 _reward) external;
    function resetWLCParams() external;
    
    function getForWLC(address _owner) external;
    
    function getWLCRewardAmount() external view returns (uint256 _amount);
    function getWLCAddress() external view returns (address _address);
}

contract DreamCarToken3 is ERC721, ERC721Metadata, WLCCompatible {
    string internal constant tokenName   = 'DreamCarCoin3';
    string internal constant tokenSymbol = 'DCC3';
    
    uint8 public constant decimals = 0;
    
    //ERC721 VARIABLES
    
    //the total count of wishes
    uint256 internal totalTokenSupply;
    
    //this address is the CEO
    address payable public CEO;
    
    bytes4 constant InterfaceSignature_ERC165 =
        bytes4(keccak256('supportsInterface(bytes4)'));

    bytes4 constant InterfaceSignature_ERC721 =
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
  function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  uint256 public winningTokenId = 0;
    
    //The winner's address, it will be empty, until the reward is claimed
  function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }
  address public winnerAddress; 
    
    //WLC CONTRACT INTERACTION VARIABLES
    
    //WLC tokens in a single purchase to earn a DCC token
  function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
  uint256 internal WLCRewardAmount;
    
    //WLC deployed contract address
  function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
  address internal WLCAdress;
    
    //ERC721 FUNCTIONS IMPLEMENTATIONS
    
    function supportsInterface(bytes4 _interfaceID) external view returns (bool) {
        return ((_interfaceID == InterfaceSignature_ERC165) || (_interfaceID == InterfaceSignature_ERC721));
    }
function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
    
    /**
     * Gets the total amount of tokens stored by the contract
     * @return uint256 representing the total amount of tokens
     */
    function totalSupply() public view returns (uint256 total) {
        return totalTokenSupply;
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
    
    /**
     * Gets the balance of the specified address
     * @param _owner address to query the balance of
     * @return uint256 representing the amount owned by the passed address
     */
    function balanceOf(address _owner) public view returns (uint256 _balance) {
        return tokenBallanceOf[_owner];
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
    
    /**
     * Gets the owner of the specified token ID
     * @param _tokenId uint256 ID of the token to query the owner of
     * @return owner address currently marked as the owner of the given token ID
     */
    function ownerOf(uint256 _tokenId) public view returns (address _owner) {
        return tokenOwner[_tokenId];
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
    
    /**
     * Returns whether the specified token exists
     * @param _tokenId uint256 ID of the token to query the existence of
     * @return whether the token exists
     */
    function exists(uint256 _tokenId) public view returns (bool) {
        address owner = tokenOwner[_tokenId];
        return owner != address(0);
    }
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
    
    /**
     * Not necessary in the contract
     */
    function transfer(address _to, uint256 _tokenId) external { }
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
    
    /**
     * Not necessary in the contract
     */
    function approve(address _to, uint256 _tokenId) external { }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
    
    /**
     * Not necessary in the contract - reverts
     */
    function transferFrom(address _from, address _to, uint256 _tokenId) external { }
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
    
    /**
     * Internal function to set the token URI for a given token
     * Reverts if the token ID does not exist
     * @param _tokenId uint256 ID of the token to set its URI
     * @param _uri string URI to assign
     */
    function _setTokenURI(uint256 _tokenId, string storage _uri) internal {
        require(exists(_tokenId));
        tokenURIs[_tokenId] = _uri;
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
    
    //ERC721Metadata FUNCTIONS IMPLEMENTATIONS
    /**
     * Gets the token name
     * @return string representing the token name
     */
    function name() external view returns (string memory _name) {
        return tokenName;
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
    
    /**
     * Gets the token symbol
     * @return string representing the token symbol
     */
    function symbol() external view returns (string memory _symbol) {
        return tokenSymbol;
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
    
    /**
     * Returns an URI for a given token ID
     * Throws if the token ID does not exist. May return an empty string.
     * @param _tokenId uint256 ID of the token to query
     */
    function tokenURI(uint256 _tokenId) public view returns (string memory) {
        require(exists(_tokenId));
        return tokenURIs[_tokenId];
    }
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
    
    //TOKEN SPECIFIC FUNCTIONS
    
  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  event Buy(address indexed from, uint256 amount, uint256 fromTokenId, uint256 toTokenId);
    
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event RewardIsClaimed(address indexed from, uint256 tokenId);
    
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event WinnerIsChosen(address indexed from, uint256 tokenId);
    
    /**
     * Ensures that the caller of the function is the CEO of contract
     */
    modifier onlyCEO {
        require(msg.sender == CEO, 'You need to be the CEO to do that!');
        _;
    }
    
    /**
     * Constructor of the contract
     * @param _ceo address the CEO (owner) of the contract
     */
    constructor (address payable _ceo) public {
        CEO = _ceo;
        
        totalTokenSupply = 20000;
        
        tokenPrice = 41501723917762739; // (if eth = 156.62USD, 6.5 USD for token)
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
    
    /**
     * Gets the last existing token ids
     * @return uint256 the id of the token
     */
    function lastTokenId() public view returns (uint256 tokenId) {
        return nextTokenId - 1;
    }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
    
    /**
     * Sets a new price for the tokensExchangedBy
     * @param _newPrice uint256 the new price in WEI
     */
    function setTokenPriceInWEI(uint256 _newPrice) public {
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
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
    
    /**
     * Add a new price admin address to the list
     * @param _newPriceAdmin address the address of the new price admin
     */
    function addPriceAdmin(address _newPriceAdmin) onlyCEO public {
        priceAdmins.push(_newPriceAdmin);
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
    
    /**
     * Remove existing price admin address from the list
     * @param _existingPriceAdmin address the address of the existing price admin
     */
    function removePriceAdmin(address _existingPriceAdmin) onlyCEO public {
        for (uint256 i = 0; i < priceAdmins.length; i++) {
            if (_existingPriceAdmin == priceAdmins[i]) {
                delete priceAdmins[i];
                break;
            }
        }
    }
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
    
    /**
     * Adds the specified number of tokens to the specified address
     * Internal method, used when creating new tokens
     * @param _to address The address, which is going to own the tokens
     * @param _amount uint256 The number of tokens
     */
    function _addTokensToAddress(address _to, uint256 _amount) internal {
        for (uint256 i = 0; i < _amount; i++) {
            tokenOwner[nextTokenId + i] = _to;
        }
        
        tokenBallanceOf[_to] += _amount;
        
        nextTokenId += _amount;
    }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
    
    /**
     * Checks if the specified token is owned by the transaction sender
     */
    function ensureAddressIsTokenOwner(address _owner, uint256 _tokenId) internal view {
        require(balanceOf(_owner) >= 1, 'You do not own any tokens!');
        
        require(tokenOwner[_tokenId] == _owner, 'You do not own this token!');
    }
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
    
    /**
     * Generates a random number between 1 and totalTokenSupply variable
     * This is used to choose the winning token id
     */
    function getRandomNumber() internal view returns (uint16) {
        return uint16(
                uint256(
                    keccak256(
                        abi.encodePacked(block.timestamp, block.difficulty, block.number)
                    )
                )%totalTokenSupply
            ) + 1;
    }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
    
    /**
     * Chooses a winning token id, if all tokens are purchased
     */
    function chooseWinner() internal {
         if ((nextTokenId - 1) == totalTokenSupply) {
            winningTokenId = getRandomNumber();
            emit WinnerIsChosen(tokenOwner[winningTokenId], winningTokenId);
        } 
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
    
    /**
     * Scales the amount of tokens in a purchase, to ensure it will be less or equal to the amount of unsold tokens
     * If there are no tokens left, it will return 0
     * @param _amount uint256 the amout of tokens in the purchase attempt
     * @return _exactAmount uint256
     */
    function scalePurchaseTokenAmountToMatchRemainingTokens(uint256 _amount) internal view returns (uint256 _exactAmount) {
        if (nextTokenId + _amount - 1 > totalTokenSupply) {
            _amount = totalTokenSupply - nextTokenId + 1;
        }
        
        return _amount;
    }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}

    /**
    * Buy new tokens with ETH
    * Calculates the nubmer of tokens for the given ETH amount
    * Creates the new tokens when they are purchased
    * Returns the excessive ETH (if any) to the transaction sender
    */
    function buy() payable public {
        require(msg.value >= tokenPrice, "You did't send enough ETH");
        
        uint256 amount = scalePurchaseTokenAmountToMatchRemainingTokens(msg.value / tokenPrice);
        
        require(amount > 0, "Not enough tokens are available for purchase!");
        
        _addTokensToAddress(msg.sender, amount);
        
        emit Buy(msg.sender, amount, nextTokenId - amount, nextTokenId - 1);
        
        //transfer ETH to CEO
        CEO.transfer((amount * tokenPrice));
        
        //returns excessive ETH
        msg.sender.transfer(msg.value - (amount * tokenPrice));
        
        chooseWinner();
    }
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
    
    /**
    * Allows user to destroy a specified token
    * This would allow a user to claim his prize for the destroyed token
    * @param _tokenId uint256 ID of the token
    */
    function claimReward(uint256 _tokenId) public {
        require(winningTokenId > 0, "The is not winner yet!");
        require(_tokenId == winningTokenId, "This token is not the winner!");
        
        ensureAddressIsTokenOwner(msg.sender, _tokenId);
        
        winnerAddress = msg.sender;
        
        emit RewardIsClaimed(msg.sender, _tokenId);
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
    
    //WLC INTERACTION FUNCTIONS
    
    /**
     * Allows the CEO to set the address and the reward values for a connected WishListToken
     * @param _address address the address of the deployed contract
     * @param _reward uint256 how many tokens need to be bought in a single transaction to the one DCC token
     */
    function setWLCParams(address _address, uint256 _reward) public onlyCEO {
        WLCAdress = _address;
        WLCRewardAmount = _reward;
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    
    /**
     * Allows the CEO to revmove a connected WishListToken
     * This revokes the reward and exchange functions
     */
    function resetWLCParams() public onlyCEO {
        WLCAdress = address(0);
        WLCRewardAmount = 0;
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
    
    /**
     * How many WLC tokens need to be bought in a single transaction to the one DCC token
     * @return _amount uint256
     */
    function getWLCRewardAmount() public view returns (uint256 _amount) {
        return WLCRewardAmount;
    }
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
    
    /**
     * The address of the deployed WLC contract
     * @return _address address
     */
    function getWLCAddress() public view returns (address _address) {
        return WLCAdress;
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    
    /**
     * Allows the buyer of at least the number of WLC tokens, specified in WLCRewardAmount
     * to receive a DCC as a bonus.
     * This can only be called by the deployed WLC contract, by the address specified in WLCAdress
     * @param _boughtWLCAmount uint256 the number of bought WLC tokens
     * @param _owner address the address of the buyer
     */
    function getWLCReward(uint256 _boughtWLCAmount, address _owner) public returns (uint256 _remaining) {
        if (WLCAdress != address(0) && WLCRewardAmount > 0 && _boughtWLCAmount >= WLCRewardAmount) {
            require(WLCAdress == msg.sender, "You cannot invoke this function directly!");
            
            uint256 DCCAmount = scalePurchaseTokenAmountToMatchRemainingTokens(_boughtWLCAmount / WLCRewardAmount);
            
            if (DCCAmount > 0) {
                _addTokensToAddress(_owner, DCCAmount);
                
                emit Buy(_owner, DCCAmount, nextTokenId - DCCAmount, nextTokenId - 1);
                
                chooseWinner();
                
                return _boughtWLCAmount - (DCCAmount * WLCRewardAmount);
            }
        }
        
        return _boughtWLCAmount;
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
    
    /**
     * Allows an onwer of WLC token to excange it for DCC token
     * This can only be called by the deployed WLC contract, by the address specified in WLCAdress
     * @param _owner address the address of the exchanger
     */
    function getForWLC(address _owner) public {
        require(WLCAdress == msg.sender, "You cannot invoke this function directly!");
        
        require(nextTokenId <= totalTokenSupply, "Not enough tokens are available for purchase!");
        
        _addTokensToAddress(_owner, 1);
        
        emit Buy(_owner, 1, nextTokenId - 1, nextTokenId - 1);
        
        chooseWinner();
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
}