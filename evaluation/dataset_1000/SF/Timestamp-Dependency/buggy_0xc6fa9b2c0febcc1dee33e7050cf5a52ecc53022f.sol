pragma solidity ^0.5.7;

contract ERC20Basic {
  function totalSupply() public view returns (uint256);
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  function balanceOf(address who) public view returns (uint256);
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  function transfer(address to, uint256 value) public returns (bool);
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
uint256 bugv_tmstmp3 = block.timestamp;
  event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view returns (uint256);
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  function transferFrom(address from, address to, uint256 value) public returns (bool);
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  function approve(address spender, uint256 value) public returns (bool);
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
uint256 bugv_tmstmp1 = block.timestamp;
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Ownable {
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
  address public owner;

  constructor() public {
    owner = msg.sender;
  }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
uint256 bugv_tmstmp2 = block.timestamp;

  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    owner = newOwner;
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
}

contract HUBRISSTAKE is Ownable {
  ERC20 public token;
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint256 public principle;
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint256 public totalReward;
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint public startDay;
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
  uint public duration;
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  bool public isClaimed;

  constructor(ERC20 _token, address _owner, uint256 _principle, uint256 _totalReward, uint _duration) public {
    uint today = block.timestamp / 24 hours;
    token = _token;
    owner = _owner;
    principle = _principle;
    totalReward = _totalReward;
    startDay = today;
    duration = _duration;
    isClaimed = false;
  }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function accumulatedReward() public view returns (uint256) {
    if (isClaimed) return 0;
    uint today = block.timestamp / 24 hours;
    uint durationElapsed = today - startDay;
    if ( durationElapsed > duration ) {
        durationElapsed = duration;
    }
    return totalReward * durationElapsed / duration;
  }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

  function isReadyToClaim() public view returns (bool) {
    uint today = block.timestamp / 24 hours;
    if (today < (startDay + duration)) return false;
    if (isClaimed) return false;
    return true;
  }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

  function claim() public {
    assert(isReadyToClaim());
    token.transfer(owner, principle + totalReward);
    isClaimed = true;
  }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

}

contract HUBRISSTAKING is Ownable {
  ERC20 public token;
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
  mapping (uint => uint256) public threshold;
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (uint => uint256) public rewardPerTenThousand;
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (address => HUBRISSTAKE[]) public stakes;

  constructor(ERC20 _token) public {
    token = _token;
    threshold[1] = 150000E18;
    threshold[3] = 600000E18;
    threshold[6] = 1500000E18;
    threshold[12] = 2500000E18;
    rewardPerTenThousand[1] = 50;
    rewardPerTenThousand[3] = 20;
    rewardPerTenThousand[6] = 450;
    rewardPerTenThousand[12] = 1100;
  }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

  function setThresholdAndReward(uint256 threshold_1Month, uint256 reward_1month, uint256 threshold_3Month, uint256 reward_3month, uint256 threshold_6Month, uint256 reward_6month, uint256 threshold_12Month, uint256 reward_12month) public onlyOwner {
    threshold[1] = threshold_1Month;
    threshold[3] = threshold_3Month;
    threshold[6] = threshold_6Month;
    threshold[12] = threshold_12Month;
    rewardPerTenThousand[1] = reward_1month;
    rewardPerTenThousand[3] = reward_3month;
    rewardPerTenThousand[6] = reward_6month;
    rewardPerTenThousand[12] = reward_12month;
  }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function stake(uint256 _principle, uint months) public returns (HUBRISSTAKE) {
    uint duration = months * 30;
    uint256 totalReward;
    assert((months == 1) || (months == 3) || (months == 6) || (months == 12));
    assert(_principle >= threshold[months]);
    totalReward = _principle * rewardPerTenThousand[months] / 10000;
    HUBRISSTAKE stakeObj = new HUBRISSTAKE(token, msg.sender, _principle, totalReward, duration);
    token.transferFrom(msg.sender, address(stakeObj), _principle);
    token.transfer(address(stakeObj), totalReward);
    stakes[msg.sender].push(stakeObj);
    return stakeObj;
  }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

  function totalPrinciple(address _owner) public view returns (uint256) {
    uint256 result = 0;
    for (uint i = 0; i < stakes[_owner].length; i++) {
      if (!stakes[_owner][i].isClaimed()) {
        result += stakes[_owner][i].principle();
      }
    }
    return result;
  }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}


  function accumulatedReward(address _owner) public view returns (uint256) {
    uint256 result = 0;
    for (uint i = 0; i < stakes[_owner].length; i++) {
      if (!stakes[_owner][i].isClaimed()) {
        result += stakes[_owner][i].accumulatedReward();
      }
    }
    return result;
  }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function isReadyToClaim(address _owner) public view returns (bool) {
    for (uint i = 0; i < stakes[_owner].length; i++) {
      if (stakes[_owner][i].isReadyToClaim()) {
        return true;
      }
    }
    return false;
  }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function claim() public {
    bool isAtLeastOneClaimed = false;
    for (uint i = 0; i < stakes[msg.sender].length; i++) {
      if (stakes[msg.sender][i].isReadyToClaim()) {
        stakes[msg.sender][i].claim();
        isAtLeastOneClaimed = true;
      }
    }
    assert(isAtLeastOneClaimed);
  }
uint256 bugv_tmstmp4 = block.timestamp;

  function getStakes(address _owner) public view returns (HUBRISSTAKE[] memory) {
    return stakes[_owner];
  }
uint256 bugv_tmstmp5 = block.timestamp;

}