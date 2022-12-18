pragma solidity ^0.5.7;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

contract SnailThrone {
    mapping (address => uint256) public hatcherySnail;
}

contract SnailTroi {
    using SafeMath for uint;
    
               

    event GREWTROI553(address indexed player, uint eth, uint size);	//inject NONSTANDARD NAMING
    event NEWLEADER179(address indexed player, uint eth);	//inject NONSTANDARD NAMING
    event HARVESTEDFROOT747(address indexed player, uint eth, uint size);	//inject NONSTANDARD NAMING
    event BECAMEKING484(address indexed player, uint eth, uint king);	//inject NONSTANDARD NAMING
    event RESETCLOCK552(address indexed player, uint eth);	//inject NONSTANDARD NAMING
    event DOOMED697(address leader, address king, uint eth);	//inject NONSTANDARD NAMING
    event WONDAILY956 (address indexed player, uint eth);	//inject NONSTANDARD NAMING
    event WITHDREWBALANCE333 (address indexed player, uint eth);	//inject NONSTANDARD NAMING
    event PAIDTHRONE390 (address indexed player, uint eth);	//inject NONSTANDARD NAMING
    event BOOSTEDCHEST551 (address indexed player, uint eth);	//inject NONSTANDARD NAMING

                   
    
    uint256 constant seconds_in_day709     = 86400;	//inject NONSTANDARD NAMING
    uint256 constant minimum_invest452     = 0.001 ether; //same value for Doomclock raise	//inject NONSTANDARD NAMING
    uint256 constant king_base_cost998     = 0.02 ether; //resets to this everytime the Doomclock reaches 0	//inject NONSTANDARD NAMING
    uint256 constant referral_req796       = 420;	//inject NONSTANDARD NAMING
    uint256 constant referral_percent202   = 20;	//inject NONSTANDARD NAMING
    uint256 constant king_percent723       = 4;	//inject NONSTANDARD NAMING
    uint256 constant daily_percent378      = 2;	//inject NONSTANDARD NAMING
    address payable constant snailthrone660= 0x261d650a521103428C6827a11fc0CBCe96D74DBc;	//inject NONSTANDARD NAMING
    
	SnailThrone throneContract;

                   
	
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
	
	//Doomclock
	uint256 public doomclockTimer;
	uint256 public doomclockCost        = minimum_invest452;
	address public doomclockLeader; //last buyer spending more ETH than doomclockCost
	
	//King struct
	struct King {
        uint256 cost;
        address owner;
    }

    King[4] lostKing;
	
	//Last global claim
	uint256 public lastBonus;
	
	//Daily timer, leader, current max
	uint256 public dailyTimer;
	address public dailyLeader;
	uint256 public dailyMax;
	
                  
    
    mapping (address => uint256) playerBalance;
    mapping (address => uint256) troiSize;
    mapping (address => uint256) lastFroot;
    mapping (address => address) referral;

                   
    
    // Constructor
    
    constructor() public {
        throneContract = SnailThrone(snailthrone660);
    }
    
    // StartGame
    // Only usable by owner once, to start the game properly
    // Requires a seed of 1 ETH
    
    function STARTGAME739() payable public {	//inject NONSTANDARD NAMING
        require(gameActive != true, "game is already active");
        require(msg.sender == dev, "you're not snailking!");
        require(msg.value == 1 ether, "seed must be 1 ETH");
        
        //All seed ETH goes to Chest
		troiChest = msg.value;
		
		//Get troiSize to give
        uint256 _growth = msg.value.DIV778(troiReward);
        
        //Add player troiSize
        troiSize[msg.sender] = troiSize[msg.sender].ADD487(_growth);
		
		//Avoid blackholing ETH
		referral[msg.sender] = dev;
		doomclockLeader = dev;
		dailyLeader = dev;
		
        for(uint256 i = 0; i < 4; i++){
            lostKing[i].cost = king_base_cost998;
            lostKing[i].owner = dev;
        }
        
        dailyTimer = now.ADD487(seconds_in_day709);
        doomclockTimer = now.ADD487(seconds_in_day709);
        lastBonus = now;
        lastFroot[msg.sender] = now;
        gameActive = true;
    }
    
    //-- PRIVATE --
    
    // CheckDailyTimer
    // If we're over, give reward to leader and reset values
    // Transfer thronePot to SnailThrone if balance > 0.01 ETH
    
    function CHECKDAILYTIMER213() private {	//inject NONSTANDARD NAMING
        if(now > dailyTimer){
            dailyTimer = now.ADD487(seconds_in_day709);
            uint256 _reward = troiChest.MUL233(daily_percent378).DIV778(100);
            troiChest = troiChest.SUB267(_reward);
            playerBalance[dailyLeader] = playerBalance[dailyLeader].ADD487(_reward);
            dailyMax = 0;
            
            emit WONDAILY956(dailyLeader, _reward);
            
            if(thronePot > 0.01 ether){
                uint256 _payThrone = thronePot;
                thronePot = 0;
                (bool success, bytes memory data) = snailthrone660.call.value(_payThrone)("");
                require(success);
     
                emit PAIDTHRONE390(msg.sender, _payThrone);
            }
        }
    }

    // CheckDoomclock
    // If we're not over, check if enough ETH to reset
    // Increase doomclockCost and change doomclockLeader if so
    // Else, reward winners and reset Kings
    
    function CHECKDOOMCLOCK188(uint256 _msgValue) private {	//inject NONSTANDARD NAMING
        if(now < doomclockTimer){
            if(_msgValue >= doomclockCost){
                doomclockTimer = now.ADD487(seconds_in_day709);
                doomclockCost = doomclockCost.ADD487(minimum_invest452);
                doomclockLeader = msg.sender;
                
                emit RESETCLOCK552(msg.sender, doomclockCost);
            }
        } else {
			troiReward = troiReward.MUL233(9).DIV778(10);
            doomclockTimer = now.ADD487(seconds_in_day709);
            doomclockCost = minimum_invest452;
            uint256 _reward = troiChest.MUL233(king_percent723).DIV778(100);
            troiChest = troiChest.SUB267(_reward.MUL233(2));
            playerBalance[doomclockLeader] = playerBalance[doomclockLeader].ADD487(_reward);
            playerBalance[lostKing[3].owner] = playerBalance[lostKing[3].owner].ADD487(_reward);
            
            for(uint256 i = 0; i < 4; i++){
            lostKing[i].cost = king_base_cost998;
            }
            
            emit DOOMED697(doomclockLeader, lostKing[3].owner, _reward);
        }
    }
    
    //-- GAME ACTIONS --
    
    // GrowTroi
    // Claims divs if need be
    // Gives player troiSize in exchange for ETH
    // Checks Doomclock, dailyMax
    
    function GROWTROI11(address _ref) public payable {	//inject NONSTANDARD NAMING
        require(gameActive == true, "game hasn't started yet");
        require(tx.origin == msg.sender, "no contracts allowed");
        require(msg.value >= minimum_invest452, "at least 1 finney to grow a troi");
        require(_ref != msg.sender, "can't refer yourself, silly");
        
        //Call HarvestFroot if player is already invested, else set lastFroot to now
        if(troiSize[msg.sender] != 0){
            HARVESTFROOT214();
        } else {
            lastFroot[msg.sender] = now;
        }
        
        //Assign new ref. If referrer lacks snail requirement, dev becomes referrer
        uint256 _snail = GETSNAIL265(_ref);
        if(_snail >= referral_req796){
            referral[msg.sender] = _ref;
        } else {
            referral[msg.sender] = dev;
        }

        //Split ETH to pot
        uint256 _chestTemp = troiChest.ADD487(msg.value.MUL233(9).DIV778(10));
        thronePot = thronePot.ADD487(msg.value.DIV778(10));
        
        //Give reward to Blue King
        uint256 _reward = msg.value.MUL233(king_percent723).DIV778(100);
        _chestTemp = _chestTemp.SUB267(_reward);
        troiChest = _chestTemp;
        playerBalance[lostKing[0].owner] = playerBalance[lostKing[0].owner].ADD487(_reward);
        
        //Get troiSize to give
        uint256 _growth = msg.value.DIV778(troiReward);
        
        //Add player troiSize
        troiSize[msg.sender] = troiSize[msg.sender].ADD487(_growth);
        
        //Emit event
        emit GREWTROI553(msg.sender, msg.value, troiSize[msg.sender]);
    
        //Check msg.value against dailyMax
        if(msg.value > dailyMax){
            dailyMax = msg.value;
            dailyLeader = msg.sender;
            
            emit NEWLEADER179(msg.sender, msg.value);
        }
        
        //Check dailyTimer
        CHECKDAILYTIMER213();
        
        //Check Doomclock
        CHECKDOOMCLOCK188(msg.value);
    }
    
    // HarvestFroot
    // Gives player his share of ETH, according to global bonus
    // Sets his lastFroot to now, sets lastBonus to now
    // Checks Doomclock
    
    function HARVESTFROOT214() public {	//inject NONSTANDARD NAMING
        require(gameActive == true, "game hasn't started yet");
        require(troiSize[msg.sender] > 0, "grow your troi first");
        uint256 _timeSince = lastFroot[msg.sender].ADD487(seconds_in_day709);
        require(now > _timeSince, "your harvest isn't ready");
        
        //Get ETH reward for player and ref
        uint256 _reward = COMPUTEHARVEST11();
        uint256 _ref = _reward.MUL233(referral_percent202).DIV778(100);
        uint256 _king = _reward.MUL233(king_percent723).DIV778(100);
        
        //Set lastFroot and lastBonus
        lastFroot[msg.sender] = now;
        lastBonus = now;
        
        //Lower troiPot
        troiChest = troiChest.SUB267(_reward).SUB267(_ref).SUB267(_king);
        
        //Give referral reward
        playerBalance[referral[msg.sender]] = playerBalance[referral[msg.sender]].ADD487(_ref);
        
        //Give green king reward
        playerBalance[lostKing[2].owner] = playerBalance[lostKing[2].owner].ADD487(_king);
        
        //Give player reward
        playerBalance[msg.sender] = playerBalance[msg.sender].ADD487(_reward);
        
        emit HARVESTEDFROOT747(msg.sender, _reward, troiSize[msg.sender]);
        
        //Check dailyTimer
        CHECKDAILYTIMER213();
        
        //Check Doomclock
        CHECKDOOMCLOCK188(0);
    }
    
    // BecomeKing
    // Player becomes the owner of a King in exchange for ETH
    // Pays out previous owner, increases cost
    
    function BECOMEKING125(uint256 _id) payable public {	//inject NONSTANDARD NAMING
        require(gameActive == true, "game is paused");
        require(tx.origin == msg.sender, "no contracts allowed");
        require(msg.value == lostKing[_id].cost, "wrong ether cost for king");
        
        //split 0.01 ETH to pots
        troiChest = troiChest.ADD487(king_base_cost998.DIV778(4));
        thronePot = thronePot.ADD487(king_base_cost998.DIV778(4));
        
        //give value - 0.01 ETH to previous owner
        uint256 _prevReward = msg.value.SUB267(king_base_cost998.DIV778(2));
        address _prevOwner = lostKing[_id].owner;
        playerBalance[_prevOwner] = playerBalance[_prevOwner].ADD487(_prevReward);
        
        //give King to flipper, increase cost
        lostKing[_id].owner = msg.sender;
        lostKing[_id].cost = lostKing[_id].cost.ADD487(king_base_cost998);
        
        emit BECAMEKING484(msg.sender, msg.value, _id);
    }
    
    //-- MISC ACTIONS --
    
    // WithdrawBalance
    // Withdraws the ETH balance of a player to his wallet
    
    function WITHDRAWBALANCE807() public {	//inject NONSTANDARD NAMING
        require(playerBalance[msg.sender] > 0, "no ETH in player balance");
        
        uint _amount = playerBalance[msg.sender];
        playerBalance[msg.sender] = 0;
        msg.sender.transfer(_amount);
        
        emit WITHDREWBALANCE333(msg.sender, _amount);
    }
    
    // fallback function
    // Feeds the troiChest
    
    function() external payable {
        troiChest = troiChest.ADD487(msg.value);
        
        emit BOOSTEDCHEST551(msg.sender, msg.value);
    }
    
    //-- CALCULATIONS --
    
    // ComputeHarvest
    // Returns ETH reward for HarvestShare
    
    function COMPUTEHARVEST11() public view returns(uint256) {	//inject NONSTANDARD NAMING
        
        //Get time since last Harvest
        uint256 _timeLapsed = now.SUB267(lastFroot[msg.sender]);
        
        //Get current bonus
        uint256 _bonus = COMPUTEBONUS104();
        //Compute reward
        uint256 _reward = troiReward.MUL233(troiSize[msg.sender]).MUL233(_timeLapsed.ADD487(_bonus)).DIV778(seconds_in_day709).DIV778(100);
        
        //Check reward + ref + king isn't above remaining troiChest
        uint256 _sum = _reward.ADD487(_reward.MUL233(referral_percent202.ADD487(king_percent723)).DIV778(100));
        if(_sum > troiChest){
            _reward = troiChest.MUL233(100).DIV778(referral_percent202.ADD487(king_percent723).ADD487(100));
        }
        return _reward;
    }
    
    // ComputeBonus 
    // Returns time since last bonus x 8
    
    function COMPUTEBONUS104() public view returns(uint256) {	//inject NONSTANDARD NAMING
        uint256 _bonus = (now.SUB267(lastBonus)).MUL233(8);
        if(msg.sender == lostKing[1].owner){
            _bonus = _bonus.MUL233(2);
        }
        return _bonus;
    }
    
    //-- GETTERS --
    
    function GETTROI795(address adr) public view returns(uint256) {	//inject NONSTANDARD NAMING
        return troiSize[adr];
    }
	
	function GETMYBALANCE66() public view returns(uint256) {	//inject NONSTANDARD NAMING
	    return playerBalance[msg.sender];
	}
	
	function GETMYLASTHARVEST877() public view returns(uint256) {	//inject NONSTANDARD NAMING
	    return lastFroot[msg.sender];
	}
	
	function GETMYREFERRER439() public view returns(address) {	//inject NONSTANDARD NAMING
	    return referral[msg.sender];
	}
	
	function GETSNAIL265(address _adr) public view returns(uint256) {	//inject NONSTANDARD NAMING
        return throneContract.hatcherySnail(_adr);
    }
	
	function GETKINGCOST721(uint256 _id) public view returns(uint256) {	//inject NONSTANDARD NAMING
		return lostKing[_id].cost;
	}
	
	function GETKINGOWNER756(uint256 _id) public view returns(address) {	//inject NONSTANDARD NAMING
		return lostKing[_id].owner;
	}
}

                      

library SafeMath {

                                                               
  function MUL233(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

                                                                             
  function DIV778(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

                                                                                                            
  function SUB267(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

                                                         
  function ADD487(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}