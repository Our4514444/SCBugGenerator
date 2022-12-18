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
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  address public owner;

    constructor () public {
        owner = msg.sender;
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

    modifier onlyOwner() {
        if (msg.sender == owner)
            _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        if (newOwner != address(0)) owner = newOwner;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
}

contract ERC20Interface {
    function totalSupply() public view returns (uint);
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
    function balanceOf(address tokenOwner) public view returns (uint balance);
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    function transfer(address to, uint tokens) public returns (bool success);
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function approve(address spender, uint tokens) public returns (bool success);
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event Transfer(address indexed from, address indexed to, uint tokens);
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
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
    
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  ERC20Interface stakingToken;
    uint rewardPercent; //  percent value for per second  -> set 192 if you want 5% per month reward (because it will be divided by 10^8 for getting the small float number)
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  string name = "sZAC";
    
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint ownerTokensAmount;
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  address[] internal stakeholders;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping(address => StakingInfo[]) internal stakes;

    //  percent value for per second  
    //  set 192 if you want 5% per month reward (because it will be divided by 10^8 for getting the small float number)
    //  5% per month = 5 / (30 * 24 * 60 * 60) ~ 0.00000192 (192 / 10^8)
    constructor(ERC20Interface _stakingToken, uint _rewardPercent) public {
        stakingToken = _stakingToken;
        rewardPercent = _rewardPercent;
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Staked(address staker, uint amount);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Unstaked(address staker, uint amount);
    
    function changeRewardPercent(uint _rewardPercent) public onlyOwner {
        rewardPercent = _rewardPercent;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    
    function changeMinStakeAmount(uint _minStakeAmount) public onlyOwner {
        minStakeAmount = _minStakeAmount;
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    
    function totalStakes() public view returns(uint256) {
        uint _totalStakes = 0;
        for (uint i = 0; i < stakeholders.length; i += 1) {
            for (uint j = 0; j < stakes[stakeholders[i]].length; j += 1)
             _totalStakes = _totalStakes.add(stakes[stakeholders[i]][j].amount);
        }
        return _totalStakes;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    
    function isStakeholder(address _address) public view returns(bool, uint256) {
        for (uint256 s = 0; s < stakeholders.length; s += 1) {
            if (_address == stakeholders[s]) 
                return (true, s);
        }
        return (false, 0);
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function addStakeholder(address _stakeholder) internal {
        (bool _isStakeholder, ) = isStakeholder(_stakeholder);
        if (!_isStakeholder)
            stakeholders.push(_stakeholder);
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    function removeStakeholder(address _stakeholder) internal {
        (bool _isStakeholder, uint256 s) = isStakeholder(_stakeholder);
        if (_isStakeholder) {
            stakeholders[s] = stakeholders[stakeholders.length - 1];
            stakeholders.pop();
        }
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    
    function stake(uint256 _amount) public {
        require(_amount >= minStakeAmount);
        require(stakingToken.transferFrom(msg.sender, address(this), _amount), "Stake required!");
        if (stakes[msg.sender].length == 0) {
            addStakeholder(msg.sender);
        }
        stakes[msg.sender].push(StakingInfo(_amount, now, rewardPercent));
        emit Staked(msg.sender, _amount);
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

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
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    
    function sendTokens(uint _amount) public onlyOwner {
        require(stakingToken.transferFrom(msg.sender, address(this), _amount), "Transfering not approved!");
        ownerTokensAmount = ownerTokensAmount.add(_amount);
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
    
    function withdrawTokens(address receiver, uint _amount) public onlyOwner {
        ownerTokensAmount = ownerTokensAmount.sub(_amount);
        require(stakingToken.transfer(receiver, _amount), "Not enough tokens on contract!");
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
}