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

  function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event GrewTroi(address indexed player, uint eth, uint size);
  address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
  event NewLeader(address indexed player, uint eth);
  address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  event HarvestedFroot(address indexed player, uint eth, uint size);
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event BecameKing(address indexed player, uint eth, uint king);
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event ResetClock(address indexed player, uint eth);
  uint256 bugv_tmstmp4 = block.timestamp;
  event Doomed(address leader, address king, uint eth);
  uint256 bugv_tmstmp5 = block.timestamp;
  event WonDaily (address indexed player, uint eth);
  uint256 bugv_tmstmp2 = block.timestamp;
  event WithdrewBalance (address indexed player, uint eth);
  uint256 bugv_tmstmp3 = block.timestamp;
  event PaidThrone (address indexed player, uint eth);
  uint256 bugv_tmstmp1 = block.timestamp;
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
	
	//Game status to ensure proper startaddress winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}

	bool public gameActive              = false;
	
	//Dev address for proper startaddress winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}

	address public dev                  = msg.sender;
	
	//Main reward potfunction bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	uint256 public troiChest            = 0;
	
	//Divs for SnailThrone holdersfunction bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

	uint256 public thronePot            = 0;
	
	//Current reward per troiSizeaddress winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}

	uint256 public troiReward           = 0.000001 ether; //divide by this to get troiSize per ETH
	
	//Doomclockfunction bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

	uint256 public doomclockTimer;address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}

	uint256 public doomclockCost        = MINIMUM_INVEST;function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

	address public doomclockLeader; //last buyer spending more ETH than doomclockCost
	
	//King struct
	struct King {
        uint256 cost;
        address owner;
    }

  address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
  King[4] lostKing;
	
	//Last global claimaddress winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}

	uint256 public lastBonus;
	
	//Daily timer, leader, current maxfunction bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

	uint256 public dailyTimer;address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}

	address public dailyLeader;address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}

	uint256 public dailyMax;
	
    /* Mappings */
    
  address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
  mapping (address => uint256) playerBalance;
  function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => uint256) troiSize;
  function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => uint256) lastFroot;
  function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (address => address) referral;

    /* Functions */
    
    // Constructor
    
    constructor() public {
        throneContract = SnailThrone(SNAILTHRONE);
    }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
    
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
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}

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
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
    
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
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
    // fallback function
    // Feeds the troiChest
    
    function() external payable {
        troiChest = troiChest.add(msg.value);
        
        emit BoostedChest(msg.sender, msg.value);
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
    
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
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
    
    //-- GETTERS --
    
    function GetTroi(address adr) public view returns(uint256) {
        return troiSize[adr];
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
	
	function GetMyBalance() public view returns(uint256) {
	    return playerBalance[msg.sender];
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
	
	function GetMyLastHarvest() public view returns(uint256) {
	    return lastFroot[msg.sender];
	}
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
	
	function GetMyReferrer() public view returns(address) {
	    return referral[msg.sender];
	}
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
	
	function GetSnail(address _adr) public view returns(uint256) {
        return throneContract.hatcherySnail(_adr);
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
	
	function GetKingCost(uint256 _id) public view returns(uint256) {
		return lostKing[_id].cost;
	}
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
	
	function GetKingOwner(uint256 _id) public view returns(address) {
		return lostKing[_id].owner;
	}
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
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