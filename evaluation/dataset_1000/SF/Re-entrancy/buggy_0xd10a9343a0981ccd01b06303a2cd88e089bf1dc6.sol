pragma solidity ^0.5.7;

/* SNAILTROI

SnailTroi is a daily ROI game, with extra twists to sustain it.

1) TROI
To start, players spend ETH to Grow their Troi.
They get a "troi size" proportional to their investment.
Each player gets to harvest ETH equivalent to their troiSize.
This harvest starts equivalent to 1% of their initial, daily.
A global bonus rises by 8% per day (1% in 3 hours, roughly 0.0001% per second).
As soon as any player claims this global bonus, it resets to 0.
A player can only harvest once a day.

2) FOUR KINGS
Players can spend ETH to collect up to 4 kings.
Each of these kings is a hot potato, with an unique effect.
The price of a king starts at 0.02 eth, and rises by 0.02 eth on each buy

BLUE KING (0) - receives 4% divs on each buy
RED KING (1) - doubles global bonus for the owner
GREEN KING (2) - receives 4% divs on each claim
PURPLE KING (3) - receives 4% of the pot when the Doomclock stops

3) DOOMCLOCK 
A timer starts at 24 hours, FOMO style.
If this timer reaches 0, whoever bought last gets 4% of the pot.
The Four Kings come back to their base price, and ETH gains relative to troiSize are lowered by 10%.
The Doomclock resets to 24 hours on a large enough buy.
The required buy starts at 0.001 ETH, and increases by 0.001 ETH on each reset.

4) REFERRALS
Whenever a referred player claims, his referrer gets an extra 20% of his claim.
In the absence of referral, this extra 20% goes to the dev.
To be able to refer someone, a player must own a certain number of snails in SnailThrone.
Referrals can be changed at any time through a new GrowTroi action.

5) DAILY BONUS
A daily timer of 24 hours runs nonstop.
Whoever spends the most ETH in one buy during this 24 hour period wins 2% of the pot.

6) SPLIT
On GrowTroi:
- 90% to the troiPot (main pot)
- 10% to the thronePot (SnailThrone divs)

On Kings:
- initial + 0.01 eth to the previous owner
- 0.005 eth to the troiPot
- 0.005 eth to the thronePot

*/

contract SnailThrone {
    mapping (address => uint256) public hatcherySnail;
}

contract SnailTroi {
    using SafeMath for uint;
    
    /* Event */

  mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
  event GrewTroi(address indexed player, uint eth, uint size);
  mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
  event NewLeader(address indexed player, uint eth);
  mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }
  event HarvestedFroot(address indexed player, uint eth, uint size);
  uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
  event BecameKing(address indexed player, uint eth, uint king);
  mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
  event ResetClock(address indexed player, uint eth);
  address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
  event Doomed(address leader, address king, uint eth);
  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  event WonDaily (address indexed player, uint eth);
  address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
  event WithdrewBalance (address indexed player, uint eth);
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  event PaidThrone (address indexed player, uint eth);
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event BoostedChest (address indexed player, uint eth);

    /* Constants */
    
    uint256 constant SECONDS_IN_DAY     = 86400;
    uint256 constant MINIMUM_INVEST     = 0.001 ether; //same value for Doomclock raise
    uint256 constant KING_BASE_COST     = 0.02 ether; //resets to this everytime the Doomclock reaches 0
    uint256 constant REFERRAL_REQ       = 420;
    uint256 constant REFERRAL_PERCENT   = 20;
    uint256 constant KING_PERCENT       = 4;
    uint256 constant DAILY_PERCENT      = 2;
    address payable constant SNAILTHRONE= 0x261d650a521103428C6827a11fc0CBCe96D74DBc;
    
	SnailThrone throneContract;

    /* Variables */
	
	//Game status to ensure proper start
	bool public gameActive              = false;
	
	//Dev address for proper start
	address public dev                  = msg.sender;
	
	//Main reward pot
	uint256 public troiChest            = 0;
	
	//Divs for SnailThrone holdersbool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }

	uint256 public thronePot            = 0;
	
	//Current reward per troiSizebool not_called_re_ent6 = true;
function bug_re_ent6() public{
        require(not_called_re_ent6);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent6 = false;
    }

	uint256 public troiReward           = 0.000001 ether; //divide by this to get troiSize per ETH
	
	//Doomclockuint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }

	uint256 public doomclockTimer;mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   //bug
        redeemableEther_re_ent4[msg.sender] = 0;
    }

	uint256 public doomclockCost        = MINIMUM_INVEST;mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }

	address public doomclockLeader; //last buyer spending more ETH than doomclockCost
	
	//King struct
	struct King {
        uint256 cost;
        address owner;
    }

  mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }
  King[4] lostKing;
	
	//Last global claimmapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   //bug
        redeemableEther_re_ent18[msg.sender] = 0;
    }

	uint256 public lastBonus;
	
	//Daily timer, leader, current maxmapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }

	uint256 public dailyTimer;address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }

	address public dailyLeader;mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }

	uint256 public dailyMax;
	
    /* Mappings */
    
  bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }
  mapping (address => uint256) playerBalance;
  bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }
  mapping (address => uint256) troiSize;
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
    }
  mapping (address => uint256) lastFroot;
  uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }
  mapping (address => address) referral;

    /* Functions */
    
    // Constructor
    
    constructor() public {
        throneContract = SnailThrone(SNAILTHRONE);
    }
mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }
    
    // StartGame
    // Only usable by owner once, to start the game properly
    // Requires a seed of 1 ETH
    
    function StartGame() payable public {
        require(gameActive != true, "game is already active");
        require(msg.sender == dev, "you're not snailking!");
        require(msg.value == 1 ether, "seed must be 1 ETH");
        
        //All seed ETH goes to Chest
		troiChest = msg.value;
		
		//Get troiSize to give
        uint256 _growth = msg.value.div(troiReward);
        
        //Add player troiSize
        troiSize[msg.sender] = troiSize[msg.sender].add(_growth);
		
		//Avoid blackholing ETH
		referral[msg.sender] = dev;
		doomclockLeader = dev;
		dailyLeader = dev;
		
        for(uint256 i = 0; i < 4; i++){
            lostKing[i].cost = KING_BASE_COST;
            lostKing[i].owner = dev;
        }
        
        dailyTimer = now.add(SECONDS_IN_DAY);
        doomclockTimer = now.add(SECONDS_IN_DAY);
        lastBonus = now;
        lastFroot[msg.sender] = now;
        gameActive = true;
    }
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
    
    //-- PRIVATE --
    
    // CheckDailyTimer
    // If we're over, give reward to leader and reset values
    // Transfer thronePot to SnailThrone if balance > 0.01 ETH
    
    function CheckDailyTimer() private {
        if(now > dailyTimer){
            dailyTimer = now.add(SECONDS_IN_DAY);
            uint256 _reward = troiChest.mul(DAILY_PERCENT).div(100);
            troiChest = troiChest.sub(_reward);
            playerBalance[dailyLeader] = playerBalance[dailyLeader].add(_reward);
            dailyMax = 0;
            
            emit WonDaily(dailyLeader, _reward);
            
            if(thronePot > 0.01 ether){
                uint256 _payThrone = thronePot;
                thronePot = 0;
                (bool success, bytes memory data) = SNAILTHRONE.call.value(_payThrone)("");
                require(success);
     
                emit PaidThrone(msg.sender, _payThrone);
            }
        }
    }
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }

    // CheckDoomclock
    // If we're not over, check if enough ETH to reset
    // Increase doomclockCost and change doomclockLeader if so
    // Else, reward winners and reset Kings
    
    function CheckDoomclock(uint256 _msgValue) private {
        if(now < doomclockTimer){
            if(_msgValue >= doomclockCost){
                doomclockTimer = now.add(SECONDS_IN_DAY);
                doomclockCost = doomclockCost.add(MINIMUM_INVEST);
                doomclockLeader = msg.sender;
                
                emit ResetClock(msg.sender, doomclockCost);
            }
        } else {
			troiReward = troiReward.mul(9).div(10);
            doomclockTimer = now.add(SECONDS_IN_DAY);
            doomclockCost = MINIMUM_INVEST;
            uint256 _reward = troiChest.mul(KING_PERCENT).div(100);
            troiChest = troiChest.sub(_reward.mul(2));
            playerBalance[doomclockLeader] = playerBalance[doomclockLeader].add(_reward);
            playerBalance[lostKing[3].owner] = playerBalance[lostKing[3].owner].add(_reward);
            
            for(uint256 i = 0; i < 4; i++){
            lostKing[i].cost = KING_BASE_COST;
            }
            
            emit Doomed(doomclockLeader, lostKing[3].owner, _reward);
        }
    }
mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }
    
    //-- GAME ACTIONS --
    
    // GrowTroi
    // Claims divs if need be
    // Gives player troiSize in exchange for ETH
    // Checks Doomclock, dailyMax
    
    function GrowTroi(address _ref) public payable {
        require(gameActive == true, "game hasn't started yet");
        require(tx.origin == msg.sender, "no contracts allowed");
        require(msg.value >= MINIMUM_INVEST, "at least 1 finney to grow a troi");
        require(_ref != msg.sender, "can't refer yourself, silly");
        
        //Call HarvestFroot if player is already invested, else set lastFroot to now
        if(troiSize[msg.sender] != 0){
            HarvestFroot();
        } else {
            lastFroot[msg.sender] = now;
        }
        
        //Assign new ref. If referrer lacks snail requirement, dev becomes referrer
        uint256 _snail = GetSnail(_ref);
        if(_snail >= REFERRAL_REQ){
            referral[msg.sender] = _ref;
        } else {
            referral[msg.sender] = dev;
        }

        //Split ETH to pot
        uint256 _chestTemp = troiChest.add(msg.value.mul(9).div(10));
        thronePot = thronePot.add(msg.value.div(10));
        
        //Give reward to Blue King
        uint256 _reward = msg.value.mul(KING_PERCENT).div(100);
        _chestTemp = _chestTemp.sub(_reward);
        troiChest = _chestTemp;
        playerBalance[lostKing[0].owner] = playerBalance[lostKing[0].owner].add(_reward);
        
        //Get troiSize to give
        uint256 _growth = msg.value.div(troiReward);
        
        //Add player troiSize
        troiSize[msg.sender] = troiSize[msg.sender].add(_growth);
        
        //Emit event
        emit GrewTroi(msg.sender, msg.value, troiSize[msg.sender]);
    
        //Check msg.value against dailyMax
        if(msg.value > dailyMax){
            dailyMax = msg.value;
            dailyLeader = msg.sender;
            
            emit NewLeader(msg.sender, msg.value);
        }
        
        //Check dailyTimer
        CheckDailyTimer();
        
        //Check Doomclock
        CheckDoomclock(msg.value);
    }
uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }
    
    // HarvestFroot
    // Gives player his share of ETH, according to global bonus
    // Sets his lastFroot to now, sets lastBonus to now
    // Checks Doomclock
    
    function HarvestFroot() public {
        require(gameActive == true, "game hasn't started yet");
        require(troiSize[msg.sender] > 0, "grow your troi first");
        uint256 _timeSince = lastFroot[msg.sender].add(SECONDS_IN_DAY);
        require(now > _timeSince, "your harvest isn't ready");
        
        //Get ETH reward for player and ref
        uint256 _reward = ComputeHarvest();
        uint256 _ref = _reward.mul(REFERRAL_PERCENT).div(100);
        uint256 _king = _reward.mul(KING_PERCENT).div(100);
        
        //Set lastFroot and lastBonus
        lastFroot[msg.sender] = now;
        lastBonus = now;
        
        //Lower troiPot
        troiChest = troiChest.sub(_reward).sub(_ref).sub(_king);
        
        //Give referral reward
        playerBalance[referral[msg.sender]] = playerBalance[referral[msg.sender]].add(_ref);
        
        //Give green king reward
        playerBalance[lostKing[2].owner] = playerBalance[lostKing[2].owner].add(_king);
        
        //Give player reward
        playerBalance[msg.sender] = playerBalance[msg.sender].add(_reward);
        
        emit HarvestedFroot(msg.sender, _reward, troiSize[msg.sender]);
        
        //Check dailyTimer
        CheckDailyTimer();
        
        //Check Doomclock
        CheckDoomclock(0);
    }
mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
    
    // BecomeKing
    // Player becomes the owner of a King in exchange for ETH
    // Pays out previous owner, increases cost
    
    function BecomeKing(uint256 _id) payable public {
        require(gameActive == true, "game is paused");
        require(tx.origin == msg.sender, "no contracts allowed");
        require(msg.value == lostKing[_id].cost, "wrong ether cost for king");
        
        //split 0.01 ETH to pots
        troiChest = troiChest.add(KING_BASE_COST.div(4));
        thronePot = thronePot.add(KING_BASE_COST.div(4));
        
        //give value - 0.01 ETH to previous owner
        uint256 _prevReward = msg.value.sub(KING_BASE_COST.div(2));
        address _prevOwner = lostKing[_id].owner;
        playerBalance[_prevOwner] = playerBalance[_prevOwner].add(_prevReward);
        
        //give King to flipper, increase cost
        lostKing[_id].owner = msg.sender;
        lostKing[_id].cost = lostKing[_id].cost.add(KING_BASE_COST);
        
        emit BecameKing(msg.sender, msg.value, _id);
    }
mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)=msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
    
    //-- MISC ACTIONS --
    
    // WithdrawBalance
    // Withdraws the ETH balance of a player to his wallet
    
    function WithdrawBalance() public {
        require(playerBalance[msg.sender] > 0, "no ETH in player balance");
        
        uint _amount = playerBalance[msg.sender];
        playerBalance[msg.sender] = 0;
        msg.sender.transfer(_amount);
        
        emit WithdrewBalance(msg.sender, _amount);
    }
mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }
    
    // fallback function
    // Feeds the troiChest
    
    function() external payable {
        troiChest = troiChest.add(msg.value);
        
        emit BoostedChest(msg.sender, msg.value);
    }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }
    
    //-- CALCULATIONS --
    
    // ComputeHarvest
    // Returns ETH reward for HarvestShare
    
    function ComputeHarvest() public view returns(uint256) {
        
        //Get time since last Harvest
        uint256 _timeLapsed = now.sub(lastFroot[msg.sender]);
        
        //Get current bonus
        uint256 _bonus = ComputeBonus();
        //Compute reward
        uint256 _reward = troiReward.mul(troiSize[msg.sender]).mul(_timeLapsed.add(_bonus)).div(SECONDS_IN_DAY).div(100);
        
        //Check reward + ref + king isn't above remaining troiChest
        uint256 _sum = _reward.add(_reward.mul(REFERRAL_PERCENT.add(KING_PERCENT)).div(100));
        if(_sum > troiChest){
            _reward = troiChest.mul(100).div(REFERRAL_PERCENT.add(KING_PERCENT).add(100));
        }
        return _reward;
    }
mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      }
    
    // ComputeBonus 
    // Returns time since last bonus x 8
    
    function ComputeBonus() public view returns(uint256) {
        uint256 _bonus = (now.sub(lastBonus)).mul(8);
        if(msg.sender == lostKing[1].owner){
            _bonus = _bonus.mul(2);
        }
        return _bonus;
    }
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
    }
    
    //-- GETTERS --
    
    function GetTroi(address adr) public view returns(uint256) {
        return troiSize[adr];
    }
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
	
	function GetMyBalance() public view returns(uint256) {
	    return playerBalance[msg.sender];
	}
mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }
	
	function GetMyLastHarvest() public view returns(uint256) {
	    return lastFroot[msg.sender];
	}
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }
	
	function GetMyReferrer() public view returns(address) {
	    return referral[msg.sender];
	}
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
      }
	
	function GetSnail(address _adr) public view returns(uint256) {
        return throneContract.hatcherySnail(_adr);
    }
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }
	
	function GetKingCost(uint256 _id) public view returns(uint256) {
		return lostKing[_id].cost;
	}
bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
	
	function GetKingOwner(uint256 _id) public view returns(address) {
		return lostKing[_id].owner;
	}
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }
}

/* SafeMath library */

library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}