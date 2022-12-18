/**
 *Submitted for verification at Etherscan.io on 2020-10-07
*/

pragma solidity ^0.5.17;

library SafeMath {
    function add(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    
    function sub(uint a, uint b) public pure returns (uint c) {
        require(b <= a); 
        c = a - b; 
    } 
    
    function mul(uint a, uint b) public pure returns (uint c) {
        c = a * b; 
        require(a == 0 || c / a == b); 
    } 
    
    function div(uint a, uint b) public pure returns (uint c) { 
        require(b > 0);
        c = a / b;
    }
}

contract Ownable {
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;

    constructor () public {
        owner = msg.sender;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner() {
        if (msg.sender == owner)
            _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        if (newOwner != address(0)) owner = newOwner;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
}

contract ERC20Interface {
    function totalSupply() public view returns (uint);
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address tokenOwner) public view returns (uint balance);
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address to, uint tokens) public returns (bool success);
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint tokens) public returns (bool success);
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint tokens);
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract sZAC is Ownable {
    using SafeMath for uint;
    
    struct StakingInfo {
        uint amount;
        uint depositDate;
        uint rewardPercent;
    }
    
    uint minStakeAmount = 30 * 10**18; // ZAC token has 18 decimals
    uint REWARD_DIVIDER = 10**8;
    
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  ERC20Interface stakingToken;
    uint rewardPercent; //  percent value for per second  -> set 192 if you want 5% per month reward (because it will be divided by 10^8 for getting the small float number)
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  string name = "sZAC";
    
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  uint ownerTokensAmount;
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  address[] internal stakeholders;
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => StakingInfo[]) internal stakes;

    //  percent value for per second  
    //  set 192 if you want 5% per month reward (because it will be divided by 10^8 for getting the small float number)
    //  5% per month = 5 / (30 * 24 * 60 * 60) ~ 0.00000192 (192 / 10^8)
    constructor(ERC20Interface _stakingToken, uint _rewardPercent) public {
        stakingToken = _stakingToken;
        rewardPercent = _rewardPercent;
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Staked(address staker, uint amount);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Unstaked(address staker, uint amount);
    
    function changeRewardPercent(uint _rewardPercent) public onlyOwner {
        rewardPercent = _rewardPercent;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    
    function changeMinStakeAmount(uint _minStakeAmount) public onlyOwner {
        minStakeAmount = _minStakeAmount;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    
    function totalStakes() public view returns(uint256) {
        uint _totalStakes = 0;
        for (uint i = 0; i < stakeholders.length; i += 1) {
            for (uint j = 0; j < stakes[stakeholders[i]].length; j += 1)
             _totalStakes = _totalStakes.add(stakes[stakeholders[i]][j].amount);
        }
        return _totalStakes;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    
    function isStakeholder(address _address) public view returns(bool, uint256) {
        for (uint256 s = 0; s < stakeholders.length; s += 1) {
            if (_address == stakeholders[s]) 
                return (true, s);
        }
        return (false, 0);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function addStakeholder(address _stakeholder) internal {
        (bool _isStakeholder, ) = isStakeholder(_stakeholder);
        if (!_isStakeholder)
            stakeholders.push(_stakeholder);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function removeStakeholder(address _stakeholder) internal {
        (bool _isStakeholder, uint256 s) = isStakeholder(_stakeholder);
        if (_isStakeholder) {
            stakeholders[s] = stakeholders[stakeholders.length - 1];
            stakeholders.pop();
        }
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    
    function stake(uint256 _amount) public {
        require(_amount >= minStakeAmount);
        require(stakingToken.transferFrom(msg.sender, address(this), _amount), "Stake required!");
        if (stakes[msg.sender].length == 0) {
            addStakeholder(msg.sender);
        }
        stakes[msg.sender].push(StakingInfo(_amount, now, rewardPercent));
        emit Staked(msg.sender, _amount);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function unstake() public {
        uint withdrawAmount = 0;
        for (uint j = 0; j < stakes[msg.sender].length; j += 1) {
            uint amount = stakes[msg.sender][j].amount;
            withdrawAmount = withdrawAmount.add(amount);
            
            uint rewardAmount = amount.mul((now - stakes[msg.sender][j].depositDate).mul(stakes[msg.sender][j].rewardPercent));
            rewardAmount = rewardAmount.div(REWARD_DIVIDER);
            withdrawAmount = withdrawAmount.add(rewardAmount.div(100));
        }
        
        require(stakingToken.transfer(msg.sender, withdrawAmount), "Not enough tokens in contract!");
        delete stakes[msg.sender];
        removeStakeholder(msg.sender);
        emit Unstaked(msg.sender, withdrawAmount);
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    
    function sendTokens(uint _amount) public onlyOwner {
        require(stakingToken.transferFrom(msg.sender, address(this), _amount), "Transfering not approved!");
        ownerTokensAmount = ownerTokensAmount.add(_amount);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function withdrawTokens(address receiver, uint _amount) public onlyOwner {
        ownerTokensAmount = ownerTokensAmount.sub(_amount);
        require(stakingToken.transfer(receiver, _amount), "Not enough tokens on contract!");
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
}