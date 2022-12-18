pragma solidity 0.5.1;

// File: contracts/lib/Ownable.sol

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED147(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED147(address(0), _owner);
    }

                                                        
    function OWNER565() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER300() {	//inject NONSTANDARD NAMING
        require(ISOWNER171(), "Only the owner can call this function.");
        _;
    }

                                                                                 
    function ISOWNER171() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP185() public ONLYOWNER300 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED147(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP366(address newOwner) public ONLYOWNER300 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP814(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP814(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED147(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/lib/IERC20.sol

                                                                                        

interface IERC20 {

  function TOTALSUPPLY395() external view returns (uint256);	//inject NONSTANDARD NAMING

  function BALANCEOF308(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

  function ALLOWANCE719(address owner, address spender)	//inject NONSTANDARD NAMING
    external view returns (uint256);

  // solhint-disable-next-line func-order
  function TRANSFER125(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

  // solhint-disable-next-line func-order
  function APPROVE715(address spender, uint256 value)	//inject NONSTANDARD NAMING
    external returns (bool);

  // solhint-disable-next-line func-order
  function TRANSFERFROM678(address from, address to, uint256 value)	//inject NONSTANDARD NAMING
    external returns (bool);

  // solhint-disable-next-line no-simple-event-func-name
  event TRANSFER580(	//inject NONSTANDARD NAMING
    address indexed from,
    address indexed to,
    uint256 value
  );

  event APPROVAL836(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

// File: contracts/lib/SafeMath.sol

                                                                                          

library SafeMath {

                                                                
  function MUL238(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }

    uint256 c = a * b;
    require(c / a == b);

    return c;
  }

                                                                                                         
  function DIV0(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b > 0); // Solidity only automatically asserts when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }

                                                                                                            
  function SUB868(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b <= a);
    uint256 c = a - b;

    return c;
  }

                                                          
  function ADD395(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    require(c >= a);

    return c;
  }

                                                                                                                               
  function MOD978(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b != 0);
    return a % b;
  }
}

// File: contracts/lib/Roles.sol

                                                                                  
library Roles {
  struct Role {
    mapping (address => bool) bearer;
  }

                                                         
  function ADD395(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
    require(account != address(0));
    role.bearer[account] = true;
  }

                                                             
  function REMOVE101(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
    require(account != address(0));
    role.bearer[account] = false;
  }

                                                                         
  function HAS806(Role storage role, address account)	//inject NONSTANDARD NAMING
    internal
    view
    returns (bool)
  {
    require(account != address(0));
    return role.bearer[account];
  }
}

// File: contracts/lib/PauserRole.sol

contract PauserRole {
  using Roles for Roles.Role;

  event PAUSERADDED165(address indexed account);	//inject NONSTANDARD NAMING
  event PAUSERREMOVED962(address indexed account);	//inject NONSTANDARD NAMING

  Roles.Role private pausers;

  constructor() public {
    _ADDPAUSER220(msg.sender);
  }

  modifier ONLYPAUSER682() {	//inject NONSTANDARD NAMING
    require(ISPAUSER865(msg.sender), "Can only be called by pauser.");
    _;
  }

  function ISPAUSER865(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
    return pausers.HAS806(account);
  }

  function ADDPAUSER953(address account) public ONLYPAUSER682 {	//inject NONSTANDARD NAMING
    _ADDPAUSER220(account);
  }

  function RENOUNCEPAUSER922() public {	//inject NONSTANDARD NAMING
    _REMOVEPAUSER381(msg.sender);
  }

  function _ADDPAUSER220(address account) internal {	//inject NONSTANDARD NAMING
    pausers.ADD395(account);
    emit PAUSERADDED165(account);
  }

  function _REMOVEPAUSER381(address account) internal {	//inject NONSTANDARD NAMING
    pausers.REMOVE101(account);
    emit PAUSERREMOVED962(account);
  }
}

// File: contracts/lib/Pausable.sol

                                                                                                                
contract Pausable is PauserRole {
  event PAUSED726();	//inject NONSTANDARD NAMING
  event UNPAUSED172();	//inject NONSTANDARD NAMING

  bool private _paused = false;

                                                                         
  function PAUSED705() public view returns(bool) {	//inject NONSTANDARD NAMING
    return _paused;
  }

                                                                                                
  modifier WHENNOTPAUSED834() {	//inject NONSTANDARD NAMING
    require(!_paused, "Cannot call when paused.");
    _;
  }

                                                                                            
  modifier WHENPAUSED210() {	//inject NONSTANDARD NAMING
    require(_paused, "Can only call this when paused.");
    _;
  }

                                                                          
  function PAUSE969() public ONLYPAUSER682 WHENNOTPAUSED834 {	//inject NONSTANDARD NAMING
    _paused = true;
    emit PAUSED726();
  }

                                                                             
  function UNPAUSE149() public ONLYPAUSER682 WHENPAUSED210 {	//inject NONSTANDARD NAMING
    _paused = false;
    emit UNPAUSED172();
  }
}

// File: contracts/lib/ValidatorRole.sol

contract ValidatorRole {
  using Roles for Roles.Role;

  event VALIDATORADDED72(address indexed account);	//inject NONSTANDARD NAMING
  event VALIDATORREMOVED843(address indexed account);	//inject NONSTANDARD NAMING

  Roles.Role private validators;

  constructor(address validator) public {
    _ADDVALIDATOR65(validator);
  }

  modifier ONLYVALIDATOR47() {	//inject NONSTANDARD NAMING
    require(
      ISVALIDATOR793(msg.sender),
      "This function can only be called by a validator."
    );
    _;
  }

  function ISVALIDATOR793(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
    return validators.HAS806(account);
  }

  function ADDVALIDATOR441(address account) public ONLYVALIDATOR47 {	//inject NONSTANDARD NAMING
    _ADDVALIDATOR65(account);
  }

  function RENOUNCEVALIDATOR129() public {	//inject NONSTANDARD NAMING
    _REMOVEVALIDATOR544(msg.sender);
  }

  function _ADDVALIDATOR65(address account) internal {	//inject NONSTANDARD NAMING
    validators.ADD395(account);
    emit VALIDATORADDED72(account);
  }

  function _REMOVEVALIDATOR544(address account) internal {	//inject NONSTANDARD NAMING
    validators.REMOVE101(account);
    emit VALIDATORREMOVED843(account);
  }
}

// File: contracts/IxtProtect.sol

                    
                                                            
contract IxtEvents {

  event MEMBERADDED920(	//inject NONSTANDARD NAMING
    address indexed memberAddress,
    bytes32 indexed membershipNumber,
    bytes32 indexed invitationCode
  );

  event STAKEDEPOSITED14(	//inject NONSTANDARD NAMING
    address indexed memberAddress,
    bytes32 indexed membershipNumber,
    uint256 stakeAmount
  );

  event STAKEWITHDRAWN392(	//inject NONSTANDARD NAMING
    address indexed memberAddress,
    uint256 stakeAmount
  );

  event REWARDCLAIMED98(	//inject NONSTANDARD NAMING
    address indexed memberAddress,
    uint256 rewardAmount
  );

  event INVITATIONREWARDGIVEN599(	//inject NONSTANDARD NAMING
    address indexed memberReceivingReward,
    address indexed memberGivingReward,
    uint256 rewardAmount
  );

  event POOLDEPOSIT607(	//inject NONSTANDARD NAMING
    address indexed depositer,
    uint256 amount
  );

  event POOLWITHDRAW786(	//inject NONSTANDARD NAMING
    address indexed withdrawer,
    uint256 amount
  );

  event ADMINREMOVEDMEMBER540(	//inject NONSTANDARD NAMING
    address indexed admin,
    address indexed userAddress,
    uint256 refundIssued
  );

  event MEMBERDRAINED19(	//inject NONSTANDARD NAMING
    address indexed memberAddress,
    uint256 amountRefunded
  );

  event POOLDRAINED438(	//inject NONSTANDARD NAMING
    address indexed refundRecipient,
    uint256 amountRefunded
  );

  event CONTRACTDRAINED306(	//inject NONSTANDARD NAMING
    address indexed drainInitiator
  );

  event INVITATIONREWARDCHANGED415(	//inject NONSTANDARD NAMING
    uint256 newInvitationReward
  );

  event LOYALTYREWARDCHANGED519(	//inject NONSTANDARD NAMING
    uint256 newLoyaltyRewardAmount
  );
}

                                                                       
                              
contract RoleManager is Ownable, Pausable, ValidatorRole {

  constructor(address validator)
    public
    ValidatorRole(validator)
  {}
}

                                                                    
                                   
contract StakeManager {

                                    

  modifier ISVALIDSTAKELEVEL782(StakeLevel level) {	//inject NONSTANDARD NAMING
    require(
      uint8(level) >= 0 && uint8(level) <= 2,
      "Is not valid a staking level."
    );
    _;
  }

                            

                                                                        
                                     
  enum StakeLevel { LOW, MEDIUM, HIGH }

                                       

                                                    
  uint256[3] public ixtStakingLevels;

                             

                                                                                      
                                         
  constructor(
    uint256[3] memory _ixtStakingLevels
  ) public {
    ixtStakingLevels = _ixtStakingLevels;
  }

}

                                                                      
                                   
contract RewardManager {

                                       

                                                    
  uint256 public invitationReward;
                                                                
  uint256 public loyaltyPeriodDays;
                                                              
  uint256 public loyaltyRewardAmount;

                             

                                                                                              
                                                                                           
                                                                                              
  constructor(
    uint256 _invitationReward,
    uint256 _loyaltyPeriodDays,
    uint256 _loyaltyRewardAmount
  ) public {
    require(
      _loyaltyRewardAmount >= 0 &&
      _loyaltyRewardAmount <= 100,
      "Loyalty reward amount must be between 0 and 100."
    );
    invitationReward = _invitationReward;
    loyaltyPeriodDays = _loyaltyPeriodDays;
    loyaltyRewardAmount = _loyaltyRewardAmount;
  }

}

                     
                                                                                     
contract IxtProtect is IxtEvents, RoleManager, StakeManager, RewardManager {

                                    

  modifier ISNOTMEMBER444(address memberAddress) {	//inject NONSTANDARD NAMING
    require(
      members[memberAddress].addedTimestamp == 0,
      "Already a member."
    );
    _;
  }

  modifier ISMEMBER701(address memberAddress) {	//inject NONSTANDARD NAMING
    require(
      members[memberAddress].addedTimestamp != 0,
      "User is not a member."
    );
    _;
  }

  modifier NOTSTAKING919(address memberAddress) {	//inject NONSTANDARD NAMING
    require(
      members[memberAddress].stakeTimestamp == 0,
      "Member is staking already."
    );
    _;
  }

  modifier STAKING860(address memberAddress) {	//inject NONSTANDARD NAMING
    require(
      members[memberAddress].stakeTimestamp != 0,
      "Member is not staking."
    );
    _;
  }

                            

                                                                               
  struct Member {
    uint256 addedTimestamp;
    uint256 stakeTimestamp;
    uint256 startOfLoyaltyRewardEligibility;
    bytes32 membershipNumber;
    bytes32 invitationCode;
    uint256 stakeBalance;
    uint256 invitationRewards;
    uint256 previouslyAppliedLoyaltyBalance;
  }

                                       

                                       
  IERC20 public ixtToken;
                                                                  
  mapping(address => Member) public members;
                                                   
  address[] public membersArray;
                                           
  uint256 public totalMemberBalance;
                                 
  uint256 public totalPoolBalance;
                                                                                                   
  mapping(bytes32 => address) public registeredInvitationCodes;
 

                           

                                                             
  uint256 public constant ixt_decimals482 = 8;	//inject NONSTANDARD NAMING

                             

                                                           
                                                                                           
                                                                                             
                                                                                              
                                                                                              
                                                                                                
  constructor(
    address _validator,
    uint256 _loyaltyPeriodDays,
    address _ixtToken,
    uint256 _invitationReward,
    uint256 _loyaltyRewardAmount,
    uint256[3] memory _ixtStakingLevels
  )
    public
    RoleManager(_validator)
    StakeManager(_ixtStakingLevels)
    RewardManager(_invitationReward, _loyaltyPeriodDays, _loyaltyRewardAmount)
  {
    require(_ixtToken != address(0x0), "ixtToken address was set to 0.");
    ixtToken = IERC20(_ixtToken);
  }

                                  
                                  
                                  

                                  

                                                                    
                                                             
                                                            
                                                                                       
                 
                                                                               
                                                                      
                                                                                                         
                                                                                                    

  function ADDMEMBER28(	//inject NONSTANDARD NAMING
    bytes32 _membershipNumber,
    address _memberAddress,
    bytes32 _invitationCode,
    bytes32 _referralInvitationCode
  ) 
    public
    ONLYVALIDATOR47
    ISNOTMEMBER444(_memberAddress)
    NOTSTAKING919(_memberAddress)
  {
    require(
      _memberAddress != address(0x0),
      "Member address was set to 0."
    );
    Member memory member = Member({
      addedTimestamp: block.timestamp,
      stakeTimestamp: 0,
      startOfLoyaltyRewardEligibility: 0,
      membershipNumber: _membershipNumber,
      invitationCode: _invitationCode,
      stakeBalance: 0,
      invitationRewards: 0,
      previouslyAppliedLoyaltyBalance: 0
    });
    members[_memberAddress] = member;
    membersArray.push(_memberAddress);

                                                            
    registeredInvitationCodes[member.invitationCode] = _memberAddress;
                                                                                
    address rewardMemberAddress = registeredInvitationCodes[_referralInvitationCode];
    if (
      rewardMemberAddress != address(0x0)
    ) {
      Member storage rewardee = members[rewardMemberAddress];
      rewardee.invitationRewards = SafeMath.ADD395(rewardee.invitationRewards, invitationReward);
      emit INVITATIONREWARDGIVEN599(rewardMemberAddress, _memberAddress, invitationReward);
    }

    emit MEMBERADDED920(_memberAddress, _membershipNumber, _invitationCode);
  }

                                                                                
                                                                                                  
                                                  
                                                                                                      
                                                     
  function DEPOSITSTAKE655(	//inject NONSTANDARD NAMING
    StakeLevel _stakeLevel
  )
    public
    WHENNOTPAUSED834()
    ISMEMBER701(msg.sender)
    NOTSTAKING919(msg.sender)
    ISVALIDSTAKELEVEL782(_stakeLevel)
  {
    uint256 amountDeposited = DEPOSITINTERNAL970(msg.sender, ixtStakingLevels[uint256(_stakeLevel)], false);
    Member storage member = members[msg.sender];
    member.stakeTimestamp = block.timestamp;
    member.startOfLoyaltyRewardEligibility = block.timestamp;
                                                            
    registeredInvitationCodes[member.invitationCode] = msg.sender;
    emit STAKEDEPOSITED14(msg.sender, member.membershipNumber, amountDeposited);
  }

                                                                     
                                                                                              
  function WITHDRAWSTAKE178()	//inject NONSTANDARD NAMING
    public
    WHENNOTPAUSED834()
    STAKING860(msg.sender)
  {

    uint256 stakeAmount = REFUNDUSERBALANCE447(msg.sender);
    delete registeredInvitationCodes[members[msg.sender].invitationCode];
    Member storage member = members[msg.sender];
    member.stakeTimestamp = 0;
    member.startOfLoyaltyRewardEligibility = 0;
    emit STAKEWITHDRAWN392(msg.sender, stakeAmount);
  }

                                                                                      
                                                                                    
  function CLAIMREWARDS344()	//inject NONSTANDARD NAMING
    public
    WHENNOTPAUSED834()
    STAKING860(msg.sender)
  {
    uint256 rewardClaimed = CLAIMREWARDSINTERNAL348(msg.sender);
    emit REWARDCLAIMED98(msg.sender, rewardClaimed);
  }

                                    

                                                                          
                                         
  function GETMEMBERSARRAYLENGTH490() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return membersArray.length;
  }

                                                                      
                                                                                   
                                                           
  function GETACCOUNTBALANCE352(address memberAddress)	//inject NONSTANDARD NAMING
    public
    view
    STAKING860(memberAddress)
    returns (uint256)
  {
    return GETSTAKEBALANCE646(memberAddress) +
      GETREWARDBALANCE335(memberAddress);
  }

                                                                    
                                                                                 
                                                         
  function GETSTAKEBALANCE646(address memberAddress)	//inject NONSTANDARD NAMING
    public
    view
    STAKING860(memberAddress)
    returns (uint256)
  {
    return members[memberAddress].stakeBalance;
  }

                                                                     
                                                                                        
                                                                
  function GETREWARDBALANCE335(address memberAddress)	//inject NONSTANDARD NAMING
    public
    view
    STAKING860(memberAddress)
    returns (uint256)
  {
    return GETINVITATIONREWARDBALANCE618(memberAddress) +
      GETLOYALTYREWARDBALANCE504(memberAddress);
  }

                                                                                
                                                                                             
                                                                     
  function GETINVITATIONREWARDBALANCE618(address memberAddress)	//inject NONSTANDARD NAMING
    public
    view
    STAKING860(memberAddress)
    returns (uint256)
  {
    return members[memberAddress].invitationRewards;
  }

                                                                             
                                                                                          
                                                                  
  function GETLOYALTYREWARDBALANCE504(address memberAddress)	//inject NONSTANDARD NAMING
    public
    view
    STAKING860(memberAddress)
    returns (uint256 loyaltyReward)
  {
    uint256 loyaltyPeriodSeconds = loyaltyPeriodDays * 1 days;
    Member storage thisMember = members[memberAddress];
    uint256 elapsedTimeSinceEligible = block.timestamp - thisMember.startOfLoyaltyRewardEligibility;
    loyaltyReward = thisMember.previouslyAppliedLoyaltyBalance;
    if (elapsedTimeSinceEligible >= loyaltyPeriodSeconds) {
      uint256 numWholePeriods = SafeMath.DIV0(elapsedTimeSinceEligible, loyaltyPeriodSeconds);
      uint256 rewardForEachPeriod = thisMember.stakeBalance * loyaltyRewardAmount / 100;
      loyaltyReward += rewardForEachPeriod * numWholePeriods;
    }
  }

                                   

                                                                                              
                                                                    
                                                                                   
  function DEPOSITPOOL355(uint256 amountToDeposit)	//inject NONSTANDARD NAMING
    public
    ONLYOWNER300
  {
    uint256 amountDeposited = DEPOSITINTERNAL970(msg.sender, amountToDeposit, true);
    emit POOLDEPOSIT607(msg.sender, amountDeposited);
  }

                                                                       
                                                                    
                                                                                     
  function WITHDRAWPOOL476(uint256 amountToWithdraw)	//inject NONSTANDARD NAMING
    public
    ONLYOWNER300
  {
    if (amountToWithdraw > 0) {
      require(
        totalPoolBalance >= amountToWithdraw &&
        ixtToken.TRANSFER125(msg.sender, amountToWithdraw),
        "Unable to withdraw this value of IXT."  
      );
      totalPoolBalance = SafeMath.SUB868(totalPoolBalance, amountToWithdraw);
    }
    emit POOLWITHDRAW786(msg.sender, amountToWithdraw);
  }

                                                                     
                                                                    
                                                                                   
                                                                 
                                                             
                                                                                  
  function REMOVEMEMBER296(address userAddress)	//inject NONSTANDARD NAMING
    public
    ISMEMBER701(userAddress)
    ONLYOWNER300
  {
    uint256 refund = CANCELMEMBERSHIPINTERNAL917(userAddress);
    emit ADMINREMOVEDMEMBER540(msg.sender, userAddress, refund);
  }

                                                                                               
                                                                                               
                     
                                                                    
  function DRAIN66() public ONLYOWNER300 {	//inject NONSTANDARD NAMING
                                          
    for (uint256 index = 0; index < membersArray.length; index++) {
      address memberAddress = membersArray[index];
      bool memberJoined = members[memberAddress].stakeTimestamp != 0;
      uint256 amountRefunded = memberJoined ? REFUNDUSERBALANCE447(memberAddress) : 0;

      delete registeredInvitationCodes[members[memberAddress].invitationCode];
      delete members[memberAddress];

      emit MEMBERDRAINED19(memberAddress, amountRefunded);
    }
    delete membersArray;

                                    
    require(
      ixtToken.TRANSFER125(msg.sender, totalPoolBalance),
      "Unable to withdraw this value of IXT."
    );
    totalPoolBalance = 0;
    emit POOLDRAINED438(msg.sender, totalPoolBalance);
    
    emit CONTRACTDRAINED306(msg.sender);
  }

                                                                                                     
                                                                                 
                                                                                     
  function SETINVITATIONREWARD626(uint256 _invitationReward)	//inject NONSTANDARD NAMING
    public
    ONLYOWNER300
  {
    invitationReward = _invitationReward;
    emit INVITATIONREWARDCHANGED415(_invitationReward);
  }

                                                                                                       
                                                                              
                                                                                        
                                                                        
                                                                                       
  function SETLOYALTYREWARDAMOUNT589(uint256 newLoyaltyRewardAmount)	//inject NONSTANDARD NAMING
    public
    ONLYOWNER300
  {
    require(
      newLoyaltyRewardAmount >= 0 &&
      newLoyaltyRewardAmount <= 100,
      "Loyalty reward amount must be between 0 and 100."
    );
    uint256 loyaltyPeriodSeconds = loyaltyPeriodDays * 1 days;
                                                                                   
    for (uint256 i = 0; i < membersArray.length; i++) {
      Member storage thisMember = members[membersArray[i]];
      uint256 elapsedTimeSinceEligible = block.timestamp - thisMember.startOfLoyaltyRewardEligibility;
      if (elapsedTimeSinceEligible >= loyaltyPeriodSeconds) {
        uint256 numWholePeriods = SafeMath.DIV0(elapsedTimeSinceEligible, loyaltyPeriodSeconds);
        uint256 rewardForEachPeriod = thisMember.stakeBalance * loyaltyRewardAmount / 100;
        thisMember.previouslyAppliedLoyaltyBalance += rewardForEachPeriod * numWholePeriods;
        thisMember.startOfLoyaltyRewardEligibility += numWholePeriods * loyaltyPeriodSeconds;
      }
    }
    loyaltyRewardAmount = newLoyaltyRewardAmount;
    emit LOYALTYREWARDCHANGED519(newLoyaltyRewardAmount);
  }

                                    
                                    
                                    

  function CANCELMEMBERSHIPINTERNAL917(address memberAddress)	//inject NONSTANDARD NAMING
    internal
    returns
    (uint256 amountRefunded)
  {
    if(members[memberAddress].stakeTimestamp != 0) {
      amountRefunded = REFUNDUSERBALANCE447(memberAddress);
    }

    delete registeredInvitationCodes[members[memberAddress].invitationCode];

    delete members[memberAddress];

    REMOVEMEMBERFROMARRAY416(memberAddress);
  }

  function REFUNDUSERBALANCE447(	//inject NONSTANDARD NAMING
    address memberAddress
  ) 
    internal
    returns (uint256)
  {
    Member storage member = members[memberAddress];

                                                              
    uint256 claimsRefunded = CLAIMREWARDSINTERNAL348(memberAddress);
    uint256 stakeToRefund = member.stakeBalance;

    bool userStaking = member.stakeTimestamp != 0;
    if (stakeToRefund > 0 && userStaking) {
      require(
        ixtToken.TRANSFER125(memberAddress, stakeToRefund),
        "Unable to withdraw this value of IXT."  
      );
      totalMemberBalance = SafeMath.SUB868(totalMemberBalance, stakeToRefund);
    }
    member.stakeBalance = 0;
    return claimsRefunded + stakeToRefund;
  }

  function REMOVEMEMBERFROMARRAY416(address memberAddress) internal {	//inject NONSTANDARD NAMING
                                                              
    for (uint256 index; index < membersArray.length; index++) {
      if (membersArray[index] == memberAddress) {
        membersArray[index] = membersArray[membersArray.length - 1];
        membersArray[membersArray.length - 1] = address(0);
        membersArray.length -= 1;
        break;
      }
    }
  }

  function CLAIMREWARDSINTERNAL348(address memberAddress)	//inject NONSTANDARD NAMING
    internal
    returns (uint256 rewardAmount)
  {
    rewardAmount = GETREWARDBALANCE335(memberAddress);

    if (rewardAmount == 0) {
      return rewardAmount;
    }

    require(
      totalPoolBalance >= rewardAmount,
      "Pool balance not sufficient to withdraw rewards."
    );
    require(
      ixtToken.TRANSFER125(memberAddress, rewardAmount),
      "Unable to withdraw this value of IXT."  
    );
                                                                     
    totalPoolBalance -= rewardAmount;

    Member storage thisMember = members[memberAddress];
    thisMember.previouslyAppliedLoyaltyBalance = 0;
    thisMember.invitationRewards = 0;

    uint256 loyaltyPeriodSeconds = loyaltyPeriodDays * 1 days;
    uint256 elapsedTimeSinceEligible = block.timestamp - thisMember.startOfLoyaltyRewardEligibility;
    if (elapsedTimeSinceEligible >= loyaltyPeriodSeconds) {
      uint256 numWholePeriods = SafeMath.DIV0(elapsedTimeSinceEligible, loyaltyPeriodSeconds);
      thisMember.startOfLoyaltyRewardEligibility += numWholePeriods * loyaltyPeriodSeconds;
    }
  }

  function DEPOSITINTERNAL970(	//inject NONSTANDARD NAMING
    address depositer,
    uint256 amount,
    bool isPoolDeposit
  ) 
    internal
    returns (uint256)
  {
                                                                        
                                     
    require(amount > 0, "Cannot deposit 0 IXT.");
    require(
      ixtToken.ALLOWANCE719(depositer, address(this)) >= amount &&
      ixtToken.BALANCEOF308(depositer) >= amount &&
      ixtToken.TRANSFERFROM678(depositer, address(this), amount),
      "Unable to deposit IXT - check allowance and balance."  
    );
    if (isPoolDeposit) {
      totalPoolBalance = SafeMath.ADD395(totalPoolBalance, amount);
    } else {
      Member storage member = members[depositer];
      member.stakeBalance = SafeMath.ADD395(member.stakeBalance, amount);
      totalMemberBalance = SafeMath.ADD395(totalMemberBalance, amount);
    }
    return amount;
  }
}