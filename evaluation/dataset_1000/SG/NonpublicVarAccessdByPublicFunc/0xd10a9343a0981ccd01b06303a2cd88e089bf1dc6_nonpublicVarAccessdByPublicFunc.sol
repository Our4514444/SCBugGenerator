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

    event GrewTroi(address indexed player, uint eth, uint size);
    event NewLeader(address indexed player, uint eth);
    event HarvestedFroot(address indexed player, uint eth, uint size);
    event BecameKing(address indexed player, uint eth, uint king);
    event ResetClock(address indexed player, uint eth);
    event Doomed(address leader, address king, uint eth);
    event WonDaily (address indexed player, uint eth);
    event WithdrewBalance (address indexed player, uint eth);
    event PaidThrone (address indexed player, uint eth);
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
	bool internal gameActive              = false;
	
	//Dev address for proper start
	address internal dev                  = msg.sender;
	
	//Main reward pot
	uint256 internal troiChest            = 0;
	
	//Divs for SnailThrone holders
	uint256 internal thronePot            = 0;
	
	//Current reward per troiSize
	uint256 internal troiReward           = 0.000001 ether; //divide by this to get troiSize per ETH
	
	//Doomclock
	uint256 internal doomclockTimer;
	uint256 public doomclockCost        = MINIMUM_INVEST;
	address internal doomclockLeader; //last buyer spending more ETH than doomclockCost
	
	//King struct
	struct King {
        uint256 cost;
        address owner;
    }

    King[4] lostKing;
	
	//Last global claim
	uint256 internal lastBonus;
	
	//Daily timer, leader, current max
	uint256 internal dailyTimer;
	address internal dailyLeader;
	uint256 internal dailyMax;
	
    /* Mappings */
    
    mapping (address => uint256) playerBalance;
    mapping (address => uint256) troiSize;
    mapping (address => uint256) lastFroot;
    mapping (address => address) referral;

    /* Functions */
    
    // Constructor
    
    constructor() public {
        throneContract = SnailThrone(SNAILTHRONE);
    }
    
    // StartGame
    // Only usable by owner once, to start the game properly
    // Requires a seed of 1 ETH
    
    function StartGame() payable public {
        require(gameActive != true, "game is already active");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(msg.sender == dev, "you're not snailking!");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(msg.value == 1 ether, "seed must be 1 ETH");
        
        //All seed ETH goes to Chest
		troiChest = msg.value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		
		//Get troiSize to give
        uint256 _growth = msg.value.div(troiReward);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Add player troiSize
        troiSize[msg.sender] = troiSize[msg.sender].add(_growth);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		
		//Avoid blackholing ETH
		referral[msg.sender] = dev;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		doomclockLeader = dev;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		dailyLeader = dev;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		
        for(uint256 i = 0; i < 4; i++){
            lostKing[i].cost = KING_BASE_COST;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            lostKing[i].owner = dev;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        dailyTimer = now.add(SECONDS_IN_DAY);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        doomclockTimer = now.add(SECONDS_IN_DAY);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        lastBonus = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        lastFroot[msg.sender] = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        gameActive = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
    
    //-- GAME ACTIONS --
    
    // GrowTroi
    // Claims divs if need be
    // Gives player troiSize in exchange for ETH
    // Checks Doomclock, dailyMax
    
    function GrowTroi(address _ref) public payable {
        require(gameActive == true, "game hasn't started yet");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(tx.origin == msg.sender, "no contracts allowed");
        require(msg.value >= MINIMUM_INVEST, "at least 1 finney to grow a troi");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(_ref != msg.sender, "can't refer yourself, silly");
        
        //Call HarvestFroot if player is already invested, else set lastFroot to now
        if(troiSize[msg.sender] != 0){	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            HarvestFroot();
        } else {
            lastFroot[msg.sender] = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        //Assign new ref. If referrer lacks snail requirement, dev becomes referrer
        uint256 _snail = GetSnail(_ref);
        if(_snail >= REFERRAL_REQ){	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            referral[msg.sender] = _ref;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            referral[msg.sender] = dev;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        //Split ETH to pot
        uint256 _chestTemp = troiChest.add(msg.value.mul(9).div(10));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        thronePot = thronePot.add(msg.value.div(10));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Give reward to Blue King
        uint256 _reward = msg.value.mul(KING_PERCENT).div(100);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _chestTemp = _chestTemp.sub(_reward);
        troiChest = _chestTemp;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        playerBalance[lostKing[0].owner] = playerBalance[lostKing[0].owner].add(_reward);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Get troiSize to give
        uint256 _growth = msg.value.div(troiReward);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Add player troiSize
        troiSize[msg.sender] = troiSize[msg.sender].add(_growth);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Emit event
        emit GrewTroi(msg.sender, msg.value, troiSize[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    
        //Check msg.value against dailyMax
        if(msg.value > dailyMax){	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            dailyMax = msg.value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            dailyLeader = msg.sender;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            
            emit NewLeader(msg.sender, msg.value);
        }
        
        //Check dailyTimer
        CheckDailyTimer();
        
        //Check Doomclock
        CheckDoomclock(msg.value);
    }
    
    // HarvestFroot
    // Gives player his share of ETH, according to global bonus
    // Sets his lastFroot to now, sets lastBonus to now
    // Checks Doomclock
    
    function HarvestFroot() public {
        require(gameActive == true, "game hasn't started yet");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(troiSize[msg.sender] > 0, "grow your troi first");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint256 _timeSince = lastFroot[msg.sender].add(SECONDS_IN_DAY);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(now > _timeSince, "your harvest isn't ready");
        
        //Get ETH reward for player and ref
        uint256 _reward = ComputeHarvest();
        uint256 _ref = _reward.mul(REFERRAL_PERCENT).div(100);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint256 _king = _reward.mul(KING_PERCENT).div(100);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Set lastFroot and lastBonus
        lastFroot[msg.sender] = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        lastBonus = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Lower troiPot
        troiChest = troiChest.sub(_reward).sub(_ref).sub(_king);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Give referral reward
        playerBalance[referral[msg.sender]] = playerBalance[referral[msg.sender]].add(_ref);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Give green king reward
        playerBalance[lostKing[2].owner] = playerBalance[lostKing[2].owner].add(_king);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Give player reward
        playerBalance[msg.sender] = playerBalance[msg.sender].add(_reward);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit HarvestedFroot(msg.sender, _reward, troiSize[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Check dailyTimer
        CheckDailyTimer();
        
        //Check Doomclock
        CheckDoomclock(0);
    }
    
    // BecomeKing
    // Player becomes the owner of a King in exchange for ETH
    // Pays out previous owner, increases cost
    
    function BecomeKing(uint256 _id) payable public {
        require(gameActive == true, "game is paused");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(tx.origin == msg.sender, "no contracts allowed");
        require(msg.value == lostKing[_id].cost, "wrong ether cost for king");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //split 0.01 ETH to pots
        troiChest = troiChest.add(KING_BASE_COST.div(4));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        thronePot = thronePot.add(KING_BASE_COST.div(4));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //give value - 0.01 ETH to previous owner
        uint256 _prevReward = msg.value.sub(KING_BASE_COST.div(2));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        address _prevOwner = lostKing[_id].owner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        playerBalance[_prevOwner] = playerBalance[_prevOwner].add(_prevReward);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //give King to flipper, increase cost
        lostKing[_id].owner = msg.sender;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        lostKing[_id].cost = lostKing[_id].cost.add(KING_BASE_COST);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit BecameKing(msg.sender, msg.value, _id);
    }
    
    //-- MISC ACTIONS --
    
    // WithdrawBalance
    // Withdraws the ETH balance of a player to his wallet
    
    function WithdrawBalance() public {
        require(playerBalance[msg.sender] > 0, "no ETH in player balance");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint _amount = playerBalance[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        playerBalance[msg.sender] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        msg.sender.transfer(_amount);
        
        emit WithdrewBalance(msg.sender, _amount);
    }
    
    // fallback function
    // Feeds the troiChest
    
    function() external payable {
        troiChest = troiChest.add(msg.value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        emit BoostedChest(msg.sender, msg.value);
    }
    
    //-- CALCULATIONS --
    
    // ComputeHarvest
    // Returns ETH reward for HarvestShare
    
    function ComputeHarvest() public view returns(uint256) {
        
        //Get time since last Harvest
        uint256 _timeLapsed = now.sub(lastFroot[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Get current bonus
        uint256 _bonus = ComputeBonus();
        //Compute reward
        uint256 _reward = troiReward.mul(troiSize[msg.sender]).mul(_timeLapsed.add(_bonus)).div(SECONDS_IN_DAY).div(100);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        //Check reward + ref + king isn't above remaining troiChest
        uint256 _sum = _reward.add(_reward.mul(REFERRAL_PERCENT.add(KING_PERCENT)).div(100));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if(_sum > troiChest){	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            _reward = troiChest.mul(100).div(REFERRAL_PERCENT.add(KING_PERCENT).add(100));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        return _reward;
    }
    
    // ComputeBonus 
    // Returns time since last bonus x 8
    
    function ComputeBonus() public view returns(uint256) {
        uint256 _bonus = (now.sub(lastBonus)).mul(8);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if(msg.sender == lostKing[1].owner){	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            _bonus = _bonus.mul(2);
        }
        return _bonus;
    }
    
    //-- GETTERS --
    
    function GetTroi(address adr) public view returns(uint256) {
        return troiSize[adr];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
	
	function GetMyBalance() public view returns(uint256) {
	    return playerBalance[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}
	
	function GetMyLastHarvest() public view returns(uint256) {
	    return lastFroot[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}
	
	function GetMyReferrer() public view returns(address) {
	    return referral[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}
	
	function GetSnail(address _adr) public view returns(uint256) {
        return throneContract.hatcherySnail(_adr);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
	
	function GetKingCost(uint256 _id) public view returns(uint256) {
		return lostKing[_id].cost;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
	}
	
	function GetKingOwner(uint256 _id) public view returns(address) {
		return lostKing[_id].owner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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