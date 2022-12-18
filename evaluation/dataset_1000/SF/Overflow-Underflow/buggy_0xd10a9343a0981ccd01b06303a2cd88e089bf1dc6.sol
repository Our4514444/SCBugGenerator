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

  mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
  event GrewTroi(address indexed player, uint eth, uint size);
  mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
  event NewLeader(address indexed player, uint eth);
  function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event HarvestedFroot(address indexed player, uint eth, uint size);
  mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
  event BecameKing(address indexed player, uint eth, uint king);
  function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event ResetClock(address indexed player, uint eth);
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  event Doomed(address leader, address king, uint eth);
  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  event WonDaily (address indexed player, uint eth);
  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event WithdrewBalance (address indexed player, uint eth);
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  event PaidThrone (address indexed player, uint eth);
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
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
	
	//Divs for SnailThrone holders
	uint256 public thronePot            = 0;
	
	//Current reward per troiSize
	uint256 public troiReward           = 0.000001 ether; //divide by this to get troiSize per ETH
	
	//Doomclockfunction bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

	uint256 public doomclockTimer;mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }

	uint256 public doomclockCost        = MINIMUM_INVEST;mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }

	address public doomclockLeader; //last buyer spending more ETH than doomclockCost
	
	//King struct
	struct King {
        uint256 cost;
        address owner;
    }

  function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}
  King[4] lostKing;
	
	//Last global claimmapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }

	uint256 public lastBonus;
	
	//Daily timer, leader, current maxfunction bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}

	uint256 public dailyTimer;mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }

	address public dailyLeader;mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }

	uint256 public dailyMax;
	
    /* Mappings */
    
  function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping (address => uint256) playerBalance;
  function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping (address => uint256) troiSize;
  function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}
  mapping (address => uint256) lastFroot;
  mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
  }
  mapping (address => address) referral;

    /* Functions */
    
    // Constructor
    
    constructor() public {
        throneContract = SnailThrone(SNAILTHRONE);
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
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
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
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
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
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
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
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
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
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
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
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
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
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
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
    
    // fallback function
    // Feeds the troiChest
    
    function() external payable {
        troiChest = troiChest.add(msg.value);
        
        emit BoostedChest(msg.sender, msg.value);
    }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
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
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
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
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
    
    //-- GETTERS --
    
    function GetTroi(address adr) public view returns(uint256) {
        return troiSize[adr];
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
	
	function GetMyBalance() public view returns(uint256) {
	    return playerBalance[msg.sender];
	}
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
	
	function GetMyLastHarvest() public view returns(uint256) {
	    return lastFroot[msg.sender];
	}
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
	
	function GetMyReferrer() public view returns(address) {
	    return referral[msg.sender];
	}
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
	
	function GetSnail(address _adr) public view returns(uint256) {
        return throneContract.hatcherySnail(_adr);
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
	
	function GetKingCost(uint256 _id) public view returns(uint256) {
		return lostKing[_id].cost;
	}
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
	
	function GetKingOwner(uint256 _id) public view returns(address) {
		return lostKing[_id].owner;
	}
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
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