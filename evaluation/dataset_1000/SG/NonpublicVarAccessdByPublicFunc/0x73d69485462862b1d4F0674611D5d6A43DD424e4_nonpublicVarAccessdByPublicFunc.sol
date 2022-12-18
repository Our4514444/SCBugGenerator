/**
 *Submitted for verification at Etherscan.io on 2020-01-08
*/

pragma solidity ^0.5.0;

/* This is the Revolution smart contract from the culottes project.
Its copyrights (2019) belong to its authors including Jean Millerat (siggg at akasig dot org).
It is distributed under the GNU Affero General Public License version 3 or later (AGPL v.3 or later). You can find a copy of this license with the full source code of this project at
https://github.com/siggg/culottes
*/

contract RevolutionFactory {

  address internal owner = msg.sender;

  string [] internal hashtags;

  mapping(string => Revolution) revolutions;


  function createRevolution(string memory _criteria, string memory _hashtag, uint _distributionBlockPeriod, uint _distributionAmount, bool _testingMode) public {
    // check that we don't already have a revolution with this hashtag
    if (revolutions[_hashtag].factory() != address(0)) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      revolutions[_hashtag] = new Revolution(msg.sender, _criteria, _hashtag, _distributionBlockPeriod, _distributionAmount, _testingMode);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      hashtags.push(_hashtag);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
  }


  function getRevolution(string memory _hashtag) public view returns (Revolution) {
    return revolutions[_hashtag];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }


  function lockRevolution(string memory _hashtag) public {
    // will irreversibly lock a Revolution given by its hashtag

    // only factory contract owner can make it lock a revolution
    require(msg.sender == owner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    revolutions[_hashtag].lock();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }
}


contract Revolution {

  address internal owner;
  address public factory;
  
  // Criteria the citizen should match to win votes
  // e.g. : "a sans-culotte"
  string public criteria;
  
  // Hashtag to be used for discussing this contract
  // e.g. : "#SansCulottesRevolution"
  string public hashtag;

  // Minimum number of blocks before next cake distribution from the Revolution
  uint internal distributionBlockPeriod;

  // Amount of WEI to be distributed to each citizen matching criteria
  uint internal distributionAmount;

  // Number of the block at last distribution
  uint internal lastDistributionBlockNumber;

  // Are we running in testing mode ?
  bool internal testingMode;
  
  // Is this Revolution irreversibly locked (end of life) ?
  
  bool internal locked;

  // For a given citizen, let's put all positive (or negative) votes
  // received into a positive (or negative) justice scale.
  struct JusticeScale {
    address payable [] voters;
    mapping (address => uint) votes;
    uint amount;
  }

  // This is the revolutionary trial for a given citizen
  struct Trial {
    address payable citizen;
    JusticeScale sansculotteScale;
    JusticeScale privilegedScale;
    uint lastClosingAttemptBlock;
    bool opened;
    bool matchesCriteria;
  }

  // Citizens known at this Revolution
  address payable [] internal citizens;
  // Trials known at this Revolution
  mapping (address => Trial) private trials;

  // This is the amount of cakes in the Bastille
  uint internal bastilleBalance;

  // Creation of the revolution
  event RevolutionCreated(string indexed _hashtag);
  // Start of new trial for a given citizen
  event TrialOpened(string indexed _eventName, address indexed _citizen);
  // End of trial for a given citizen
  event TrialClosed(string indexed _eventName, address indexed _citizen);
  // New cake-vote received for a given citizen
  event VoteReceived(string indexed _eventName, address _from, address indexed _citizen, bool _vote, uint indexed _amount);
  // 
  event Distribution(string indexed _eventName, address indexed _citizen, uint _distributionAmount);


  constructor(address _owner, string memory _criteria, string memory _hashtag, uint _distributionBlockPeriod, uint _distributionAmount, bool _testingMode) public {
    factory = msg.sender;
    owner = _owner;
    criteria = _criteria;
    hashtag = _hashtag;
    distributionBlockPeriod = _distributionBlockPeriod;
    distributionAmount = _distributionAmount;
    lastDistributionBlockNumber = block.number;
    testingMode = _testingMode;
    locked = false;
    emit RevolutionCreated(hashtag);
  }


  function lock() public {
    // will irreversibly lock this Revolution

    // only contract owner or factory can lock
    require(msg.sender == owner || msg.sender == factory);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    locked = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

  }


  function vote(bool _vote, address payable _citizen) public payable {

    require(locked == false || bastilleBalance > 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    Trial storage trial = trials[_citizen];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    // open the trial if the vote is not the same as the verdict
    if (_vote != trial.matchesCriteria) {
      trial.opened = true;
    }
    if (trial.citizen == address(0x0) ) {
      // this is a new trial, emit an event
      emit TrialOpened('TrialOpened', _citizen);
      citizens.push(_citizen);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      trial.citizen = _citizen;
      trial.lastClosingAttemptBlock = block.number;
    }

    // select the target scale
    JusticeScale storage scale = trial.sansculotteScale;
    if (_vote == false) {
      scale = trial.privilegedScale;
    }
    // record the vote
    scale.voters.push(msg.sender);
    scale.votes[msg.sender] += msg.value;
    scale.amount+= msg.value;

    emit VoteReceived('VoteReceived', msg.sender, _citizen, _vote, msg.value);

    if(testingMode == false) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      closeTrial(_citizen);
      distribute();
    }

  }


  function closeTrial(address payable _citizen) public {
    
    // check the closing  lottery
    bool shouldClose = closingLottery(_citizen);
    // update attempt block number
    Trial storage trial = trials[_citizen];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    trial.lastClosingAttemptBlock = block.number;
    if(shouldClose == false) {
      // no luck this time, won't close yet, retry later
      return;
    }
  
    // let's close the trial now
    emit TrialClosed('TrialClosed', _citizen);

    // Mark the trial as closed
    trial.opened = false;
    // Issue a verdict : is this citizen a sans-culotte or a privileged ?
    // By default, citizens are seen as privileged...
    JusticeScale storage winnerScale = trial.privilegedScale;
    JusticeScale storage loserScale = trial.sansculotteScale;
    trial.matchesCriteria = false;
    // .. unless they get more votes on their sans-culotte scale than on their privileged scale.
    if (trial.sansculotteScale.amount > trial.privilegedScale.amount) {
      winnerScale = trial.sansculotteScale;
      loserScale = trial.privilegedScale;
      trial.matchesCriteria = true;
    }

    // Compute Bastille virtual vote
    uint bastilleVote = winnerScale.amount - loserScale.amount;

    // Distribute cakes to winners as rewards
    // Side note : the reward scheme slightly differs from the culottes board game rules
    // regarding the way decimal fractions of cakes to be given as rewards to winners are managed.
    // The board game stipulates that fractions are rounded to the nearest integer and reward cakes
    // are given in the descending order of winners (bigger winners first). But the code below
    // states that only the integer part of reward cakes is taken into account. And the remaining
    // reward cakes are put back into the Bastille. This slightly lessens the number of cakes
    // rewarded to winners and slightly increases the number of cakes given to the Bastille.
    // The main advantage is that it simplifies the algorithm a bit.
    // But this rounding difference should not matter when dealing with Weis instead of real cakes.
    uint remainingRewardCakes = loserScale.amount;
    for (uint i = 0; i < winnerScale.voters.length; i++) {
      address payable voter = winnerScale.voters[i];
      // First distribute cakes from the winner scale, also known as winning cakes
      // How many cakes did this voter put on the winnerScale ?
      uint winningCakes = winnerScale.votes[voter];
      // Send them back
      winnerScale.votes[voter]=0;
      // FIXME : handle the case of failure to send winningCakes
      voter.send(winningCakes);
      // How many cakes from the loser scale are to be rewarded to this winner citizen ?
      // Rewards should be a share of the lost cakes that is proportionate to the fraction of
      // winning cakes that were voted by this voting citizen, pretending that the Bastille
      // itself took part in the vote.
      uint rewardCakes = loserScale.amount * winningCakes / ( winnerScale.amount + bastilleVote );
      // Send their fair share of lost cakes as reward.
      // FIXME : handle the failure of sending rewardCakes
      voter.send(rewardCakes);
      remainingRewardCakes -= rewardCakes;
    }
   
    // distribute cakes to the Bastille
    bastilleBalance += remainingRewardCakes;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    // Empty the winner scale
    winnerScale.amount = 0;

    // Empty the loser scale
    for (uint i = 0; i < loserScale.voters.length; i++) {
      address payable voter = loserScale.voters[i];
      loserScale.votes[voter]=0;
    }
    loserScale.amount = 0;

  }


  function closingLottery(address payable _citizen) private view returns (bool) {

    if (testingMode == true) {
      // always close when testing
      return true;
    }
    // returns true with a 30% probability per distribution period.
    // We will weight by the time spent during that this distribution period since the last closing attempt
    // so that there is a 30% probability the trial will close over a full distribution period no
    // matter how often the closing lottery is triggered.
    // returns false otherwise
    uint probabilityPercent = 30;
    uint million = 1000000;
    uint threshold = million * probabilityPercent / 100;
    Trial storage trial = trials[_citizen];
    uint blocksSince = block.number - trial.lastClosingAttemptBlock;
    if (blocksSince < distributionBlockPeriod) {
      threshold *= blocksSince / distributionBlockPeriod;
      // threshold is now between 0 and 30% of 1 million
    }
    // random integer between 0 and 1 million
    uint randomHash = uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp)));
    uint randomInt = randomHash % million;
    if(randomInt < threshold) {
      return true;
    }
    return false;

  }


  function distribute() public {

    // Did the last distribution happen long enough ago ?
    if  (block.number - lastDistributionBlockNumber < distributionBlockPeriod) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      return;
    }
    // For each citizen trial
    for (uint i = 0; i < citizens.length; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      address payable citizen = citizens[i];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      Trial memory trial = trials[citizen];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      // Is the trial closed ?
      // and Was the verdict "sans-culotte" (citizen does match criteria according to winners) ?
      // and Does the Bastille have more cakes left than the amount to be distributed ?
      if (trial.opened == false &&
          trial.matchesCriteria == true ) {
        uint distributed = 0;
        if (bastilleBalance >= distributionAmount) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
          distributed = distributionAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
          if (locked == true) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            distributed = bastilleBalance;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
          }
        }
        // Then send this sans-culotte its fair share of Bastille cakes.
        if (distributed > 0) {
          if (citizen.send(distributed)) {
            bastilleBalance -= distributed;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit Distribution('Distribution', citizen, distributed);
          } else {
            // sending failed, maybe citizen is a smart contract with an expensive fallback function ?
            emit Distribution('Distribution', citizen, 0);
          }
        }
      }
    }
    // Remember when this distribution happened.
    lastDistributionBlockNumber = block.number;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

  }


  function getScaleAmount(bool _vote, address _citizen) public view returns (uint){

    Trial storage trial = trials[_citizen]; 	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    if (_vote == true)
      return trial.sansculotteScale.amount;
    else
      return trial.privilegedScale.amount;

  }


  function trialStatus(address _citizen) public view returns(bool opened, bool matchesCriteria, uint sansculotteScale, uint privilegedScale) {
  
    Trial memory trial = trials[_citizen];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    return (trial.opened, trial.matchesCriteria, trial.sansculotteScale.amount, trial.privilegedScale.amount);

  }


  function() payable external {

    require(locked == false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    bastilleBalance += msg.value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

  }

}