pragma solidity ^0.5.7;

contract ERC20Basic {
  function TOTALSUPPLY631() public view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF705(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER618(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event TRANSFER545(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

contract ERC20 is ERC20Basic {
  function ALLOWANCE328(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFERFROM281(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE344(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event APPROVAL511(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract Ownable {
  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  modifier ONLYOWNER930() {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }

  function TRANSFEROWNERSHIP918(address newOwner) public ONLYOWNER930 {	//inject NONSTANDARD NAMING
    require(newOwner != address(0));
    owner = newOwner;
  }
}

contract HUBRISSTAKE is Ownable {
  ERC20 public token;
  uint256 public principle;
  uint256 public totalReward;
  uint public startDay;
  uint public duration;
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

  function ACCUMULATEDREWARD72() public view returns (uint256) {	//inject NONSTANDARD NAMING
    if (isClaimed) return 0;
    uint today = block.timestamp / 24 hours;
    uint durationElapsed = today - startDay;
    if ( durationElapsed > duration ) {
        durationElapsed = duration;
    }
    return totalReward * durationElapsed / duration;
  }

  function ISREADYTOCLAIM935() public view returns (bool) {	//inject NONSTANDARD NAMING
    uint today = block.timestamp / 24 hours;
    if (today < (startDay + duration)) return false;
    if (isClaimed) return false;
    return true;
  }

  function CLAIM25() public {	//inject NONSTANDARD NAMING
    assert(ISREADYTOCLAIM935());
    token.TRANSFER618(owner, principle + totalReward);
    isClaimed = true;
  }

}

contract HUBRISSTAKING is Ownable {
  ERC20 public token;
  mapping (uint => uint256) public threshold;
  mapping (uint => uint256) public rewardPerTenThousand;
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

  function SETTHRESHOLDANDREWARD214(uint256 threshold_1Month, uint256 reward_1month, uint256 threshold_3Month, uint256 reward_3month, uint256 threshold_6Month, uint256 reward_6month, uint256 threshold_12Month, uint256 reward_12month) public ONLYOWNER930 {	//inject NONSTANDARD NAMING
    threshold[1] = threshold_1Month;
    threshold[3] = threshold_3Month;
    threshold[6] = threshold_6Month;
    threshold[12] = threshold_12Month;
    rewardPerTenThousand[1] = reward_1month;
    rewardPerTenThousand[3] = reward_3month;
    rewardPerTenThousand[6] = reward_6month;
    rewardPerTenThousand[12] = reward_12month;
  }

  function STAKE237(uint256 _principle, uint months) public returns (HUBRISSTAKE) {	//inject NONSTANDARD NAMING
    uint duration = months * 30;
    uint256 totalReward;
    assert((months == 1) || (months == 3) || (months == 6) || (months == 12));
    assert(_principle >= threshold[months]);
    totalReward = _principle * rewardPerTenThousand[months] / 10000;
    HUBRISSTAKE stakeObj = new HUBRISSTAKE(token, msg.sender, _principle, totalReward, duration);
    token.TRANSFERFROM281(msg.sender, address(stakeObj), _principle);
    token.TRANSFER618(address(stakeObj), totalReward);
    stakes[msg.sender].push(stakeObj);
    return stakeObj;
  }

  function TOTALPRINCIPLE377(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 result = 0;
    for (uint i = 0; i < stakes[_owner].length; i++) {
      if (!stakes[_owner][i].isClaimed()) {
        result += stakes[_owner][i].principle();
      }
    }
    return result;
  }


  function ACCUMULATEDREWARD72(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 result = 0;
    for (uint i = 0; i < stakes[_owner].length; i++) {
      if (!stakes[_owner][i].isClaimed()) {
        result += stakes[_owner][i].ACCUMULATEDREWARD72();
      }
    }
    return result;
  }

  function ISREADYTOCLAIM935(address _owner) public view returns (bool) {	//inject NONSTANDARD NAMING
    for (uint i = 0; i < stakes[_owner].length; i++) {
      if (stakes[_owner][i].ISREADYTOCLAIM935()) {
        return true;
      }
    }
    return false;
  }

  function CLAIM25() public {	//inject NONSTANDARD NAMING
    bool isAtLeastOneClaimed = false;
    for (uint i = 0; i < stakes[msg.sender].length; i++) {
      if (stakes[msg.sender][i].ISREADYTOCLAIM935()) {
        stakes[msg.sender][i].CLAIM25();
        isAtLeastOneClaimed = true;
      }
    }
    assert(isAtLeastOneClaimed);
  }

  function GETSTAKES146(address _owner) public view returns (HUBRISSTAKE[] memory) {	//inject NONSTANDARD NAMING
    return stakes[_owner];
  }

}