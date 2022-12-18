/**
 *Submitted for verification at Etherscan.io on 2019-12-21
*/

pragma solidity 0.5.11;

/**
 * @title Gods Unchained ERC-721 Token Raffle
 * @author Unchained Games
 */
contract RaffleMarket {
    // You can't win the raffle if you don't buy a ticket

    // ==== EVENTS ==== //

    /**
     * @dev OnBuyRaffleTickets emits an event when raffle tickets are purchased
     *
     * @param _raffleId - The raffle ID
     * @param _ticketHolder - Address buying raffle tickets
     * @param _tickets - Number of raffle tickets purchased
     */
  address payable winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }
  event OnBuyRaffleTickets(
        uint256 indexed _raffleId,
        address indexed _ticketHolder,
        uint256 _tickets
    );

    /**
     * @dev OnCancelRaffle emits an event when a host cancels a raffle
     *
     * @param _raffleId - The raffle ID
     * @param _host - The raffle Host
     */
  address payable winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }
  event OnCancelRaffle(
        uint256 indexed _raffleId,
        address indexed _host
    );

    /**
     * @dev OnCreateRaffle emits an event when a raffle is created
     *
     * @param _raffleId - The raffle ID
     * @param _tokenId - The token ID
     * @param _host - The host of the raffle
     * @param _costPerTicket - Cost in wei of a raffle ticket
     * @param _minimumTickets - Minimum number of tickets needed to select a raffle winner
     */
  bool claimed_TOD24 = false;
address payable owner_TOD24;
uint256 reward_TOD24;
function setReward_TOD24() public payable {
        require (!claimed_TOD24);

        require(msg.sender == owner_TOD24);
        owner_TOD24.transfer(reward_TOD24);
        reward_TOD24 = msg.value;
    }

    function claimReward_TOD24(uint256 submission) public {
        require (!claimed_TOD24);
        require(submission < 10);

        msg.sender.transfer(reward_TOD24);
        claimed_TOD24 = true;
    }
  event OnCreateRaffle(
        uint256 indexed _raffleId,
        uint256 indexed _tokenId,
        address indexed _host,
        uint256 _costPerTicket,
        uint256 _minimumTickets
    );

    /**
     * @dev OnDeleteTickets emits an event when raffle tickets are deleted
     *
     * @param _expiredRaffleId - An expired raffle ID
     * @param _tickets - Number of raffle tickets deleted
     */
  address payable winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }
  event OnDeleteTickets(
        uint256 indexed _expiredRaffleId,
        uint256 _tickets
    );

    /**
     * @dev OnRaffleWinner emits an event when a winning raffle ticket is selected
     *
     * @param _raffleId - The raffle ID
     * @param _winner - The raffle winner
     * @param _random - Randomly selected index
     * @param _payout - Amount of wei sent to the host
     * @param _contribution - Amount of wei sent to the treasury
     */
  bool claimed_TOD26 = false;
address payable owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
    }
  event OnRaffleWinner(
        uint256 indexed _raffleId,
        address indexed _winner,
        uint256 _random,
        uint256 _payout,
        uint256 _contribution
    );

    /**
     * @dev OnRefundTickets emits an event when raffle tickets are refunded
     *
     * @param _raffleId - The ID of some raffle
     * @param _quantity - The number of tickets to refund
     */
  address payable winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }
  event OnRefundTickets(
        uint256 _raffleId,
        uint256 _quantity
    );

    /**
     * @dev OnRemoveAdmin emits an event when an admin is removed
     *
     * @param _admin - The removed admin
     */
  bool claimed_TOD10 = false;
address payable owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }
  event OnRemoveAdmin(
        address _admin
    );

    /**
     * @dev OnSetAdmin emits an event when an admin address is set
     *
     * @param _admin - The new admin
     */
  address payable winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }
  event OnSetAdmin(
        address _admin
    );

    /**
     * @dev OnSetMinimumCostPerTicket emits an event when minimum cost per ticket is updated
     *
     * @param _minimumCostPerTicket - The minimum cost in wei for a raffle ticket
     */
  address payable winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }
  event OnSetMinimumCostPerTicket(
        uint256 _minimumCostPerTicket
    );

    /**
     * @dev OnSetTokenAddress emits an event when the token address is set in the constructor
     *
     * @param _tokenAddress - The ERC721 token address
     */
  bool claimed_TOD30 = false;
address payable owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }
  event OnSetTokenAddress(
        address _tokenAddress
    );

    /**
     * @dev OnSetTreasury emits an event when the treasury is updated
     *
     * @param _treasury - The treasury address
     */
  address payable winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }
  event OnSetTreasury(
        address _treasury
    );

    /**
     * @dev OnSetContributionPercent emits an event when the contribution percent is updated
     * For example a contributionPercent of 25 is equal to 2.5%
     *
     * @param _contributionPercent - The contribution percent
     */
  address payable winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }
  event OnSetContributionPercent(
        uint256 _contributionPercent
    );

    /**
     * @dev OnWithdrawRaffleTickets emits an event when raffle tickets are withdrawn
     *
     * @param _raffleId - The raffle ID
     * @param _ticketHolder - The ticket holder that withdrew raffle tickets
     * @param _indexes - The indexes of withdrawn tickets
     */
  address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
  event OnWithdrawRaffleTickets(
        uint256 indexed _raffleId,
        address indexed _ticketHolder,
        uint256[] _indexes
    );

    /**
     * @dev Raffle is a struct containing information about a given raffle
     *
     * @param tokenId - An ERC721 token ID to be raffled
     * @param host - Address of the wallet hosting the raffle
     * @param costPerTicket - The cost of a ticket in wei
     * @param minimumTickets - The minimum number of tickets to activate a raffle
     * @param participants - An array of ticket holder addresses participating in the raffle
     */
    struct Raffle {
        uint256 tokenId;
        address host;
        uint256 costPerTicket;
        uint256 minimumTickets;
        address payable[] participants;
    }

    // ==== GLOBAL PUBLIC VARIABLES ==== //

    // Mapping raffle ID to Raffle
    mapping(uint256 => Raffle) public raffles;

    /**
     * @dev contributionPercent is the percent of a raffle contributed to the treasury
     */
    uint256 public contributionPercent;

    /**
     * @dev minRaffleTicketCost is the minimum amount of wei a raffle ticket can cost
     */
    uint256 public minRaffleTicketCost;

    /**
     * @dev tokenAddress is the ERC721 Token address eligible to raffle
     */
    address public tokenAddress;

    /**
     * @dev tokenInterface interfaces with the ERC721
     */
  address payable winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27() payable public{
     
       winner_TOD27.transfer(msg.value);
    }
  interfaceERC721 public tokenInterface;

    /**
     * @dev totalRaffles is the total number of raffles that have been created
     */
  bool claimed_TOD6 = false;
address payable owner_TOD6;
uint256 reward_TOD6;
function setReward_TOD6() public payable {
        require (!claimed_TOD6);

        require(msg.sender == owner_TOD6);
        owner_TOD6.transfer(reward_TOD6);
        reward_TOD6 = msg.value;
    }

    function claimReward_TOD6(uint256 submission) public {
        require (!claimed_TOD6);
        require(submission < 10);

        msg.sender.transfer(reward_TOD6);
        claimed_TOD6 = true;
    }
  uint256 public totalRaffles;

    // ==== GLOBAL VARIABLES PRIVATE ==== //

    // Mapping admin address to boolean
  address payable winner_TOD21;
function play_TOD21(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD21 = msg.sender;
        }
    }

function getReward_TOD21() payable public{
     
       winner_TOD21.transfer(msg.value);
    }
  mapping(address => bool) private admin;

    /**
     * @dev treasury is the address where contributions are sent
     */
  bool claimed_TOD4 = false;
address payable owner_TOD4;
uint256 reward_TOD4;
function setReward_TOD4() public payable {
        require (!claimed_TOD4);

        require(msg.sender == owner_TOD4);
        owner_TOD4.transfer(reward_TOD4);
        reward_TOD4 = msg.value;
    }

    function claimReward_TOD4(uint256 submission) public {
        require (!claimed_TOD4);
        require(submission < 10);

        msg.sender.transfer(reward_TOD4);
        claimed_TOD4 = true;
    }
  address payable private treasury;

    // ==== CONSTRUCTOR ==== //

    /**
     * @dev constructor runs once during contract deployment
     *
     * @param _contributionPercent - Percent of a raffle contributed to the treasury
     * @param _minRaffleTicketCost - Minimum cost of a raffle ticket in wei
     * @param _tokenAddress - The token address eligible to Raffle
     * @param _treasury - Address where contributions are sent
     */
    constructor(uint256 _contributionPercent, uint256 _minRaffleTicketCost, address _tokenAddress, address payable _treasury)
        public
    {
        admin[msg.sender] = true;
        tokenInterface = interfaceERC721(_tokenAddress);
        setAdmin(msg.sender);
        setContributionPercent(_contributionPercent);
        setMinRaffleTicketCost(_minRaffleTicketCost);
        setTokenAddress(_tokenAddress);
        setTreasury(_treasury);
    }
bool claimed_TOD22 = false;
address payable owner_TOD22;
uint256 reward_TOD22;
function setReward_TOD22() public payable {
        require (!claimed_TOD22);

        require(msg.sender == owner_TOD22);
        owner_TOD22.transfer(reward_TOD22);
        reward_TOD22 = msg.value;
    }

    function claimReward_TOD22(uint256 submission) public {
        require (!claimed_TOD22);
        require(submission < 10);

        msg.sender.transfer(reward_TOD22);
        claimed_TOD22 = true;
    }

    // ==== MODIFIERS ==== //

    /**
     * @dev onlyAdmin requires the msg.sender to be an admin
     */
    modifier onlyAdmin() {
        require(admin[msg.sender], "only admins");
        _;
    }

    /**
     * @dev onlyEOA requires msg.sender to be an externally owned account
     */
    modifier onlyEOA() {
        require(msg.sender == tx.origin, "only externally owned accounts");
        _;
    }

    // ==== PUBLIC WRITE FUNCTIONS ==== //

    /**
     * @dev activateRaffle draws a winning raffle ticket
     *
     * @param raffleId - The Raffle ID
     */
    function activateRaffle(uint256 raffleId)
        public
        onlyEOA
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require minimum number of tickets before drawing a winning raffle ticket
        require(raffle.participants.length >= raffle.minimumTickets, "requires minimum number of tickets");

        selectWinningTicket(raffleId);
    }
bool claimed_TOD8 = false;
address payable owner_TOD8;
uint256 reward_TOD8;
function setReward_TOD8() public payable {
        require (!claimed_TOD8);

        require(msg.sender == owner_TOD8);
        owner_TOD8.transfer(reward_TOD8);
        reward_TOD8 = msg.value;
    }

    function claimReward_TOD8(uint256 submission) public {
        require (!claimed_TOD8);
        require(submission < 10);

        msg.sender.transfer(reward_TOD8);
        claimed_TOD8 = true;
    }

    /**
     * @dev activateRaffleAsHost allows the host to activate a raffle at any time
     *
     * @param raffleId - The Raffle ID
     */
    function activateRaffleAsHost(uint256 raffleId)
        public
        onlyEOA
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require raffle host to be the msg.sender
        require(raffle.host == msg.sender, "only the raffle host can activate");

        // Raffle must have at least one ticket
        require(raffle.participants.length >= 1, "at least one participant needed to raffle");

        selectWinningTicket(raffleId);
    }
bool claimed_TOD18 = false;
address payable owner_TOD18;
uint256 reward_TOD18;
function setReward_TOD18() public payable {
        require (!claimed_TOD18);

        require(msg.sender == owner_TOD18);
        owner_TOD18.transfer(reward_TOD18);
        reward_TOD18 = msg.value;
    }

    function claimReward_TOD18(uint256 submission) public {
        require (!claimed_TOD18);
        require(submission < 10);

        msg.sender.transfer(reward_TOD18);
        claimed_TOD18 = true;
    }

    /**
     * @dev buyRaffleTickets buys tickets for a given raffle
     *
     * @param raffleId - The Raffle ID
     */
    function buyRaffleTickets(uint256 raffleId)
        public
        payable
        onlyEOA
    {
        // Reference to the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require a valid raffle
        require(raffle.host != address(0), "invalid raffle");

        // Confirm amount of ETH sent is enough for a ticket
        require(msg.value >= raffle.costPerTicket, "must send enough ETH for at least 1 ticket");

        // Calculate total tickets based on msg.value and ticket cost
        uint256 tickets = msg.value / raffle.costPerTicket;

        // Calculate any change
        uint256 remainder = msg.value % raffle.costPerTicket;

        // Add tickets to the raffle
        for (uint256 i = 0; i < tickets; i++) {
            raffle.participants.push(msg.sender);
        }

        // return change back to the address buying tickets
        if (remainder > 0) {
            msg.sender.transfer(remainder);
        }

        emit OnBuyRaffleTickets(raffleId, msg.sender, tickets);
    }
address payable winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }

    /**
     * @dev cancelRaffle transfers the token back to the raffle host and deletes the raffle
     *
     * @param raffleId - The Raffle ID
     */
    function cancelRaffle(uint256 raffleId)
        public
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require the raffle host is the message sender
        require(raffle.host == msg.sender, "raffle host only");

        // Require no participants in the raffle
        require(raffle.participants.length == 0, "must be no participants in attendance");

        // Store token ID
        uint256 tokenId = raffle.tokenId;

        // Delete the raffle
        deleteRaffle(raffleId);

        // Transfer the token to the host
        tokenInterface.transferFrom(address(this), msg.sender, tokenId);

        emit OnCancelRaffle(raffleId, msg.sender);
    }
address payable winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }

    /**
     * @dev deleteAndBuyRaffleTickets deletes old storage and buys tickets for a given raffle to save gas
     *
     * @param expiredRaffleId - Expired Raffle ID
     * @param tickets - Total number of expired raffle tickets to delete
     * @param raffleId - Raffle ID to buy tickets for
     */
    function deleteAndBuyRaffleTickets(uint256 expiredRaffleId, uint256 tickets, uint256 raffleId)
        public
        payable
    {
        // Reference the expired raffle
        Raffle storage raffle = raffles[expiredRaffleId];

        // Require the raffle has ended
        require(raffle.host == address(0), "raffle expired");

        // Handle deleting expired raffle tickets to free up storage
        if (raffle.participants.length > tickets) {
            do {
                raffle.participants.pop();
            }
            while (raffle.participants.length < raffle.participants.length - tickets);
            emit OnDeleteTickets(expiredRaffleId, tickets);
        } else if (raffle.participants.length > 0) {
            do {
                raffle.participants.pop();
            }
            while (raffle.participants.length > 0);
            emit OnDeleteTickets(expiredRaffleId, raffle.participants.length);
        }

        buyRaffleTickets(raffleId);
    }
address payable winner_TOD39;
function play_TOD39(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD39 = msg.sender;
        }
    }

function getReward_TOD39() payable public{
     
       winner_TOD39.transfer(msg.value);
    }

    /**
     * @dev withdrawRaffleTickets allows a ticket holder to withdraw their tickets before a raffle is activated
     *
     * @param raffleId - The Raffle ID
     * @param indexes - Index of each ticket to withdraw
     */
    function withdrawRaffleTickets(uint256 raffleId, uint256[] memory indexes)
        public
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require a valid raffle
        require(raffle.host != address(0), "invalid raffle");

        // Require a least one ticket to withdraw
        require(indexes.length > 0, "must be greater than 0");

        // Loop through each ticket to withdraw
        for(uint256 i = 0; i < indexes.length; i++) {
            // Require sender to be the owner of the ticket
            require(raffle.participants[indexes[i]] == msg.sender, "must be ticket owner");

            // Require indexes are sorted from highest index to lowest index
            if (i > 0) {
                require(indexes[i] < indexes[i - 1], "must be sorted from highest index to lowest index");
            }

            // Set the ticket's index to equal the value of the last ticket
            raffle.participants[indexes[i]] = raffle.participants[raffle.participants.length - 1];

            // Delete the last index
            raffle.participants.pop();
        }

        emit OnWithdrawRaffleTickets(raffleId, msg.sender, indexes);

        // Send refund to the ticket holder
        msg.sender.transfer(indexes.length * raffle.costPerTicket);
    }
bool claimed_TOD20 = false;
address payable owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public payable {
        require (!claimed_TOD20);

        require(msg.sender == owner_TOD20);
        owner_TOD20.transfer(reward_TOD20);
        reward_TOD20 = msg.value;
    }

    function claimReward_TOD20(uint256 submission) public {
        require (!claimed_TOD20);
        require(submission < 10);

        msg.sender.transfer(reward_TOD20);
        claimed_TOD20 = true;
    }

    /**
     * @dev refundRaffleTickets allows a raffle host to refund raffle tickets in order to cancel a raffle
     *
     * @param raffleId - The Raffle ID
     * @param quantity - Number of tickets to refund
     */
    function refundRaffleTickets(uint256 raffleId, uint256 quantity)
        public
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Require raffle host to be the message sender
        require(raffle.host == msg.sender, "must be raffle host");

        // Require at least one ticket to refund
        require(quantity > 0, "must refund at least one ticket");

        // Require tickets in raffle to refund
        require(raffle.participants.length > 0, "must have participants to refund");

        // Number of tickets to refund
        uint256 numberOfTicketsToRefund = quantity;

        // Check quantity of raffle tickets
        if (quantity > raffle.participants.length) {
            numberOfTicketsToRefund = raffle.participants.length;
        }

        // Loop through each raffle ticket to refund
        for(uint256 i = 0; i < numberOfTicketsToRefund; i++) {
            // Store reference to the last participant
            address payable participant = raffle.participants[raffle.participants.length - 1];

            // Delete the last index
            raffle.participants.pop();

            // Transfer raffle cost to the participant
            participant.transfer(raffle.costPerTicket);
        }

        emit OnRefundTickets(raffleId, quantity);
    }
bool claimed_TOD34 = false;
address payable owner_TOD34;
uint256 reward_TOD34;
function setReward_TOD34() public payable {
        require (!claimed_TOD34);

        require(msg.sender == owner_TOD34);
        owner_TOD34.transfer(reward_TOD34);
        reward_TOD34 = msg.value;
    }

    function claimReward_TOD34(uint256 submission) public {
        require (!claimed_TOD34);
        require(submission < 10);

        msg.sender.transfer(reward_TOD34);
        claimed_TOD34 = true;
    }

    // ==== PUBLIC READ FUNCTIONS ==== //

    /**
     * @dev getRaffle gets info from a given raffle
     *
     * @param raffleId - The Raffle ID
     *
     * @return _tokenId - ERC721 Token ID
     * @return _host - Address hosting the raffle
     * @return _costPerTicket - The cost in wei for a raffle ticket
     * @return _minimumTickets - The minimum number of tickets needed to activate a raffle
     * @return _participants - The current number of tickets in the raffle
     */
    function getRaffle(uint256 raffleId)
        public
        view
        returns(uint256 _tokenId, address _host, uint256 _costPerTicket, uint256 _minimumTickets, uint256 _participants)
    {
        Raffle storage raffle = raffles[raffleId];

        _tokenId = raffle.tokenId;
        _host = raffle.host;
        _costPerTicket = raffle.costPerTicket;
        _minimumTickets = raffle.minimumTickets;
        _participants = raffle.participants.length;
    }
bool claimed_TOD2 = false;
address payable owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        msg.sender.transfer(reward_TOD2);
        claimed_TOD2 = true;
    }

    /**
     * @dev getRaffles gets info from a list of raffles
     *
     * @param raffleIds - List of Raffle IDs
     *
     * @return _tokenId - List of Token IDs
     * @return _host - List of addresses hosting the raffle
     * @return _costPerTicket - List of costs in wei for a raffle ticket
     * @return _minimumTickets - List of minimum number of tickets needed to activate a raffle
     * @return _participants - List of current number of tickets in the raffle
     */
    function getRaffles(uint256[] memory raffleIds)
        public
        view
        returns(uint256[] memory _tokenId, address[] memory _host, uint256[] memory _costPerTicket, uint256[] memory _minimumTickets, uint256[] memory _participants)
    {
        for(uint256 i = 0; i < raffleIds.length; i++) {
            Raffle storage raffle = raffles[raffleIds[i]];

            _tokenId[i] = raffle.tokenId;
            _host[i] = raffle.host;
            _costPerTicket[i] = raffle.costPerTicket;
            _minimumTickets[i] = raffle.minimumTickets;
            _participants[i] = raffle.participants.length;
        }
    }
bool claimed_TOD14 = false;
address payable owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public payable {
        require (!claimed_TOD14);

        require(msg.sender == owner_TOD14);
        owner_TOD14.transfer(reward_TOD14);
        reward_TOD14 = msg.value;
    }

    function claimReward_TOD14(uint256 submission) public {
        require (!claimed_TOD14);
        require(submission < 10);

        msg.sender.transfer(reward_TOD14);
        claimed_TOD14 = true;
    }

    // ==== ADMIN FUNCTIONS ==== //

    /**
     * @dev setContributionPercent sets the percent of a raffle contributed to the treasury
     * Example: A contributionPercent of 25 is equal to 2.5%
     *
     * @param _contributionPercent - Percent of a raffle to contribute to the treasury
     */
    function setContributionPercent(uint256 _contributionPercent)
        public
        onlyAdmin
    {
        require(_contributionPercent < 500, "Can not exceed 50%");
        contributionPercent = _contributionPercent;

        emit OnSetContributionPercent(_contributionPercent);
    }
address payable winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
    }

    /**
     * @dev setMinRaffleTicketCost sets the minimum cost of a raffle ticket in wei
     *
     * @param _minRaffleTicketCost - The minimum allowable cost of a raffle ticket
     */
    function setMinRaffleTicketCost(uint256 _minRaffleTicketCost)
        public
        onlyAdmin
    {
        minRaffleTicketCost = _minRaffleTicketCost;

        emit OnSetMinimumCostPerTicket(_minRaffleTicketCost);
    }
address payable winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }

    /**
     * @dev setAdmin sets a new admin
     *
     * @param _admin - The new admin address
     */
    function setAdmin(address _admin)
        public
        onlyAdmin
    {
        admin[_admin] = true;

        emit OnSetAdmin(_admin);
    }
bool claimed_TOD36 = false;
address payable owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        msg.sender.transfer(reward_TOD36);
        claimed_TOD36 = true;
    }

    /**
     * @dev removeAdmin removes an existing admin
     *
     * @param _admin - The admin address to remove
     */
    function removeAdmin(address _admin)
        public
        onlyAdmin
    {
        require(msg.sender != _admin, "self deletion not allowed");
        delete admin[_admin];

        emit OnRemoveAdmin(_admin);
    }
address payable winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
    }

    /**
     * @dev setTreasury sets the treasury address
     *
     * @param _treasury - The treasury address
     */
    function setTreasury(address payable _treasury)
        public
        onlyAdmin
    {
        treasury = _treasury;

        emit OnSetTreasury(_treasury);
    }
bool claimed_TOD28 = false;
address payable owner_TOD28;
uint256 reward_TOD28;
function setReward_TOD28() public payable {
        require (!claimed_TOD28);

        require(msg.sender == owner_TOD28);
        owner_TOD28.transfer(reward_TOD28);
        reward_TOD28 = msg.value;
    }

    function claimReward_TOD28(uint256 submission) public {
        require (!claimed_TOD28);
        require(submission < 10);

        msg.sender.transfer(reward_TOD28);
        claimed_TOD28 = true;
    }

    // ==== EXTERNAL FUNCTIONS ==== //

    /**
     * @dev onERC721Received handles receiving an ERC721 token
     *
     * _operator - The address which called `safeTransferFrom` function
     * @param _from - The address which previously owned the token
     * @param _tokenId - The NFT IDentifier which is being transferred
     * @param _data - Additional data with no specified format
     *
     * @return Receipt
     */
    function onERC721Received(address /*_operator*/, address _from, uint256 _tokenId, bytes calldata _data)
        external
        returns(bytes4)
    {
        // Require the token address is authorized
        require(msg.sender == tokenAddress, "must be the token address");

        // Require host is an externally owned account
        require(tx.origin == _from, "token owner must be an externally owned account");

        // Parse data payload
        (uint256 costPerTicket, uint256 minimumTickets) = abi.decode(_data, (uint256, uint256));

        // Create a raffle
        createRaffle(_tokenId, _from, costPerTicket, minimumTickets);

        // ERC721_RECEIVED Receipt (magic value)
        return 0x150b7a02;
    }
bool claimed_TOD38 = false;
address payable owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public payable {
        require (!claimed_TOD38);

        require(msg.sender == owner_TOD38);
        owner_TOD38.transfer(reward_TOD38);
        reward_TOD38 = msg.value;
    }

    function claimReward_TOD38(uint256 submission) public {
        require (!claimed_TOD38);
        require(submission < 10);

        msg.sender.transfer(reward_TOD38);
        claimed_TOD38 = true;
    }

    // ==== PRIVATE FUNCTIONS ==== //

    /**
     * @dev createRaffle creates a new raffle
     *
     * @param tokenId - ERC721 Token ID
     * @param host - The host of the raffle
     * @param costPerTicket - The cost of one raffle ticket
     * @param minimumTickets - The minimum number of tickets needed for a raffle
     */
    function createRaffle(uint256 tokenId, address host, uint256 costPerTicket, uint256 minimumTickets)
        private
    {
        // Require the cost of a ticket to be greater than or equal to the minimum cost of a raffle ticket
        require(costPerTicket >= minRaffleTicketCost, "ticket price must meet the minimum");

        // Require at least one ticket to create a raffle
        require(minimumTickets > 0, "must set at least one raffle ticket");

        // Increment total raffles
        totalRaffles = totalRaffles + 1;
        uint256 raffleId = totalRaffles;

        // Creates a raffle
        raffles[raffleId] = Raffle({
            tokenId: tokenId,
            host: host,
            costPerTicket: costPerTicket,
            minimumTickets: minimumTickets,
            participants: new address payable[](0)
        });

        // Emit event when a raffle is created
        emit OnCreateRaffle(raffleId, tokenId, host, costPerTicket, minimumTickets);
    }
bool claimed_TOD40 = false;
address payable owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public payable {
        require (!claimed_TOD40);

        require(msg.sender == owner_TOD40);
        owner_TOD40.transfer(reward_TOD40);
        reward_TOD40 = msg.value;
    }

    function claimReward_TOD40(uint256 submission) public {
        require (!claimed_TOD40);
        require(submission < 10);

        msg.sender.transfer(reward_TOD40);
        claimed_TOD40 = true;
    }

    /**
     * @dev deleteRaffle invalidates a given raffle
     *
     * @param raffleId - The Raffle ID
     */
    function deleteRaffle(uint256 raffleId)
        private
    {
        // Delete the raffle
        delete raffles[raffleId].tokenId;
        delete raffles[raffleId].host;
        delete raffles[raffleId].costPerTicket;
        delete raffles[raffleId].minimumTickets;
    }
bool claimed_TOD32 = false;
address payable owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public payable {
        require (!claimed_TOD32);

        require(msg.sender == owner_TOD32);
        owner_TOD32.transfer(reward_TOD32);
        reward_TOD32 = msg.value;
    }

    function claimReward_TOD32(uint256 submission) public {
        require (!claimed_TOD32);
        require(submission < 10);

        msg.sender.transfer(reward_TOD32);
        claimed_TOD32 = true;
    }

    /**
     * @dev selectWinningTicket selects the winning ticket for a given raffle
     *
     * @param raffleId - The Raffle ID
     */
    function selectWinningTicket(uint256 raffleId)
        private
    {
        // Reference the raffle
        Raffle storage raffle = raffles[raffleId];

        // Get a random number based on total participants
        (uint256 random) = getRandom(raffle.participants.length);

        // Select a winner at random
        address winner = raffle.participants[random];

        // Confirm winner is a participant
        assert(winner != address(0));

        // The total amount of ETH allocated to the raffle
        uint256 pot = raffle.participants.length * raffle.costPerTicket;

        // Amount to contribute to the treasury
        uint256 contribution = (pot * contributionPercent) / 1000;

        // Amount to payout to the host
        uint256 payout = pot - contribution;

        // Cast host address as payable
        address payable host = address(uint160(raffle.host));

        // Store the token ID
        uint256 tokenId = raffle.tokenId;

        // Delete the raffle
        deleteRaffle(raffleId);

        // Transfer prize to the raffle winner
        interfaceERC721(tokenAddress).transferFrom(address(this), winner, tokenId);

        // Assert the winner is now the owner of the prize
        assert(tokenInterface.ownerOf(tokenId) == winner);

        // Transfer contribution to the treasury
        treasury.transfer(contribution);

        // Transfer pot to the raffle host
        host.transfer(payout);

        emit OnRaffleWinner(raffleId, winner, random, payout, contribution);
    }
address payable winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
    }

    /**
     * @dev getRandom generates a random integer from 0 to (max - 1)
     *
     * @param max - Maximum number of integers to select from
     * @return random - The randomly selected integer
     */
    function getRandom(uint256 max)
        private
        view
        returns(uint256 random)
    {
        // Blockhash from last block
        uint256 blockhash_ = uint256(blockhash(block.number - 1));

        // Contract balance
        uint256 balance = address(this).balance;

        // Randomly generated integer
        random = uint256(keccak256(abi.encodePacked(
            // Unix timestamp in seconds
            block.timestamp,
            // Address of the block miner
            block.coinbase,
            // Difficulty of the block
            block.difficulty,
            // Blockhash from last block
            blockhash_,
            // Contract balance
            balance
        ))) % max;
    }
address payable winner_TOD15;
function play_TOD15(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD15 = msg.sender;
        }
    }

function getReward_TOD15() payable public{
     
       winner_TOD15.transfer(msg.value);
    }

    /**
     * @dev setTokenAddress sets the ERC721 token address once from the constructor
     *
     * @param _tokenAddress - The ERC721 token address
     */
    function setTokenAddress(address _tokenAddress)
        private
    {
        tokenAddress = _tokenAddress;
        emit OnSetTokenAddress(_tokenAddress);
    }
bool claimed_TOD16 = false;
address payable owner_TOD16;
uint256 reward_TOD16;
function setReward_TOD16() public payable {
        require (!claimed_TOD16);

        require(msg.sender == owner_TOD16);
        owner_TOD16.transfer(reward_TOD16);
        reward_TOD16 = msg.value;
    }

    function claimReward_TOD16(uint256 submission) public {
        require (!claimed_TOD16);
        require(submission < 10);

        msg.sender.transfer(reward_TOD16);
        claimed_TOD16 = true;
    }
}

// ==== INTERFACE ==== //
/**
 * @title Abstract Contract Interface
 */
contract interfaceERC721 {
    function transferFrom(address from, address to, uint256 tokenId) public;
address payable winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
    }
    function ownerOf(uint256 tokenId) public view returns (address);
bool claimed_TOD12 = false;
address payable owner_TOD12;
uint256 reward_TOD12;
function setReward_TOD12() public payable {
        require (!claimed_TOD12);

        require(msg.sender == owner_TOD12);
        owner_TOD12.transfer(reward_TOD12);
        reward_TOD12 = msg.value;
    }

    function claimReward_TOD12(uint256 submission) public {
        require (!claimed_TOD12);
        require(submission < 10);

        msg.sender.transfer(reward_TOD12);
        claimed_TOD12 = true;
    }
}