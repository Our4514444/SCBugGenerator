pragma solidity ^0.5.2;

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 {
  function totalSupply() public view returns (uint256);
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

  function balanceOf(address _who) public view returns (uint256);
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

  function allowance(address _owner, address _spender)
    public view returns (uint256);
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

  function transfer(address _to, uint256 _value) public returns (bool);
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

  function approve(address _spender, uint256 _value)
    public returns (bool);
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

  function transferFrom(address _from, address _to, uint256 _value)
    public returns (bool);
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );

function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

contract _0xLTC_Sale {

    using SafeMath for uint256;
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  address owner;
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  address selfdroptoken;
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  address[] public hugeetherinvest;

  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  mapping (address => bool) public blacklist;

  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  uint256 public rate = 0;
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  uint256 public totalRemaining;
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint256 public selfdropvalue;

  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event Distr(address indexed to, uint256 amount);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event DistrFinished();
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event crowdsaleFinishedd();

  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  bool public distributionFinished;
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  bool public crowdsaleFinished;
    
    modifier canDistr() {
        require(!distributionFinished);
        _;
    }
    modifier canDistrCS() {
        require(!crowdsaleFinished);
        _;
    }
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    modifier onlynotblacklist() {
        require(blacklist[msg.sender] == false);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function setselfdroptoken(address _selfdroptoken) public onlyOwner {
        require (_selfdroptoken != address(0));
        selfdroptoken = _selfdroptoken;
        totalRemaining = ERC20(selfdroptoken).balanceOf(address(this));
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
} 
    function transferOwnership(address newOwner) onlyOwner public {
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function startsale() onlyOwner public returns (bool) {
        distributionFinished = false;
        return true;
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    function startcrowdsale() onlyOwner public returns (bool) {
        crowdsaleFinished = false;
        return true;
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    function finishselfdrop() onlyOwner canDistr public returns (bool) {
        distributionFinished = true;
        emit DistrFinished();
        return true;
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function finishcrowdsale() onlyOwner canDistrCS public returns (bool) {
        crowdsaleFinished = true;
        emit crowdsaleFinishedd();
        return true;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    
    function distr(address _to, uint256 _amount) private returns (bool) {

        totalRemaining = totalRemaining.sub(_amount);
        ERC20(selfdroptoken).transfer(_to,_amount);
        emit Distr(_to, _amount);
        return true;
        
        if (totalRemaining == 0) {
            distributionFinished = true;
            crowdsaleFinished = true;
        }
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    function setselfdropvalue(uint256 _value) public onlyOwner {
        selfdropvalue = _value.mul(1e18);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    function () external payable{
        if(msg.value == 0){getTokenss();}else{getTokens();}         
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    function getTokenss() canDistr onlynotblacklist internal {
        
        require (selfdropvalue != 0);
        
        if (selfdropvalue > totalRemaining) {
            selfdropvalue = totalRemaining;
        }
        
        require(selfdropvalue <= totalRemaining);
        
        address investor = msg.sender;
        uint256 toGive = selfdropvalue;
        
        distr(investor, toGive);
        
        if (toGive > 0) {
            blacklist[investor] = true;
        }
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
    
    function setethrate(uint _rate) onlyOwner public {
        rate = _rate;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    function getTokens() canDistrCS public payable {
        
        require(msg.value >= 0.001 ether);
        require(rate > 0);
        
        uint256 value = msg.value.mul(rate);
        
        require(totalRemaining >= value);
        
        address investor = msg.sender;
        uint256 toGive = value;
        
        distr(investor, toGive);
        
        if(msg.value >= 0.1 ether){
            hugeetherinvest.push(msg.sender);
        }
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    function withdrawfromcontract() public onlyOwner {
        ERC20(selfdroptoken).transfer(owner,ERC20(selfdroptoken).balanceOf(address(this)));
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    function withdraw() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
}