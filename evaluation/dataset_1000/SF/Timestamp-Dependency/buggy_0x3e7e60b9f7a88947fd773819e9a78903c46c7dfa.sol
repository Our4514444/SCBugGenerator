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
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
  function symbol() external view returns (string memory _symbol);
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
  function tokenURI(uint256 _tokenId) public view returns (string memory);
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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

  address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
  mapping (address => uint256) internal tokenBallanceOf;
    
    //Token price in WEI
  address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}
  uint256 public tokenPrice;
    
    //A list of price admins; they can change price, in addition to the CEO
  function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address[] public priceAdmins;
    
    //Next id that will be assigned to token
  function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 internal nextTokenId = 1;
    
    //The winning token id
  address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}
  uint256 public winningTokenId = 0;
    
    //The winner's address, it will be empty, until the reward is claimed
  function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  address public winnerAddress; 
    
    //WLC CONTRACT INTERACTION VARIABLES
    
    //WLC tokens in a single purchase to earn a DCC token
  address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}
  uint256 internal WLCRewardAmount;
    
    //WLC deployed contract address
  function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address internal WLCAdress;
    
    //ERC721 FUNCTIONS IMPLEMENTATIONS
    
    function supportsInterface(bytes4 _interfaceID) external view returns (bool) {
        return ((_interfaceID == InterfaceSignature_ERC165) || (_interfaceID == InterfaceSignature_ERC721));
    }
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
    
    /**
     * Gets the total amount of tokens stored by the contract
     * @return uint256 representing the total amount of tokens
     */
    function totalSupply() public view returns (uint256 total) {
        return totalTokenSupply;
    }
address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
    
    /**
     * Gets the balance of the specified address
     * @param _owner address to query the balance of
     * @return uint256 representing the amount owned by the passed address
     */
    function balanceOf(address _owner) public view returns (uint256 _balance) {
        return tokenBallanceOf[_owner];
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
    
    /**
     * Gets the owner of the specified token ID
     * @param _tokenId uint256 ID of the token to query the owner of
     * @return owner address currently marked as the owner of the given token ID
     */
    function ownerOf(uint256 _tokenId) public view returns (address _owner) {
        return tokenOwner[_tokenId];
    }
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    /**
     * Not necessary in the contract
     */
    function transfer(address _to, uint256 _tokenId) external { }
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
    /**
     * Not necessary in the contract
     */
    function approve(address _to, uint256 _tokenId) external { }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
    
    /**
     * Not necessary in the contract - reverts
     */
    function transferFrom(address _from, address _to, uint256 _tokenId) external { }
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
    
    //ERC721Metadata FUNCTIONS IMPLEMENTATIONS
    /**
     * Gets the token name
     * @return string representing the token name
     */
    function name() external view returns (string memory _name) {
        return tokenName;
    }
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
    /**
     * Gets the token symbol
     * @return string representing the token symbol
     */
    function symbol() external view returns (string memory _symbol) {
        return tokenSymbol;
    }
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    //TOKEN SPECIFIC FUNCTIONS
    
  uint256 bugv_tmstmp2 = block.timestamp;
  event Buy(address indexed from, uint256 amount, uint256 fromTokenId, uint256 toTokenId);
    
  uint256 bugv_tmstmp3 = block.timestamp;
  event RewardIsClaimed(address indexed from, uint256 tokenId);
    
  uint256 bugv_tmstmp1 = block.timestamp;
  event WinnerIsChosen(address indexed from, uint256 tokenId);
    
    /**
     * Ensures that the caller of the function is the CEO of contract
     */
    modifier onlyCEO {
        require(msg.sender == CEO, 'You need to be the CEO to do that!');
        _;
    }
uint256 bugv_tmstmp5 = block.timestamp;
    
    /**
     * Constructor of the contract
     * @param _ceo address the CEO (owner) of the contract
     */
    constructor (address payable _ceo) public {
        CEO = _ceo;
        
        totalTokenSupply = 20000;
        
        tokenPrice = 41501723917762739; // (if eth = 156.62USD, 6.5 USD for token)
    }
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
    
    /**
     * Gets the last existing token ids
     * @return uint256 the id of the token
     */
    function lastTokenId() public view returns (uint256 tokenId) {
        return nextTokenId - 1;
    }
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
    
    /**
     * Add a new price admin address to the list
     * @param _newPriceAdmin address the address of the new price admin
     */
    function addPriceAdmin(address _newPriceAdmin) onlyCEO public {
        priceAdmins.push(_newPriceAdmin);
    }
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
    
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
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    /**
     * Checks if the specified token is owned by the transaction sender
     */
    function ensureAddressIsTokenOwner(address _owner, uint256 _tokenId) internal view {
        require(balanceOf(_owner) >= 1, 'You do not own any tokens!');
        
        require(tokenOwner[_tokenId] == _owner, 'You do not own this token!');
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
    
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
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

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
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
    
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
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
    
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
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    /**
     * Allows the CEO to revmove a connected WishListToken
     * This revokes the reward and exchange functions
     */
    function resetWLCParams() public onlyCEO {
        WLCAdress = address(0);
        WLCRewardAmount = 0;
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
    
    /**
     * How many WLC tokens need to be bought in a single transaction to the one DCC token
     * @return _amount uint256
     */
    function getWLCRewardAmount() public view returns (uint256 _amount) {
        return WLCRewardAmount;
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
    
    /**
     * The address of the deployed WLC contract
     * @return _address address
     */
    function getWLCAddress() public view returns (address _address) {
        return WLCAdress;
    }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
uint256 bugv_tmstmp4 = block.timestamp;
}