/**
 *Submitted for verification at Etherscan.io on 2020-09-24
*/

pragma solidity 0.5.17;

contract ERC20 {
    function totalSupply() public view returns (uint supply);
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    function balanceOf(address who) public view returns (uint value);
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function allowance(address owner, address spender) public view returns (uint remaining);
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    function transferFrom(address from, address to, uint value) public returns (bool ok);
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    function approve(address spender, uint value) public returns (bool ok);
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    function transfer(address to, uint value) public returns (bool ok);
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Transfer(address indexed from, address indexed to, uint value);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Approval(address indexed owner, address indexed spender, uint value);
}

contract Twitter is ERC20{
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint8 public constant decimals = 18;
    uint256 initialSupply = 20000000*10**uint256(decimals);
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  string public constant name = "Twitter";
  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  string public constant symbol = "TWT";

  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  address payable teamAddress;


    function totalSupply() public view returns (uint256) {
        return initialSupply;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  mapping (address => uint256) balances;
  function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping (address => mapping (address => uint256)) allowed;
    
    function balanceOf(address owner) public view returns (uint256 balance) {
        return balances[owner];
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function allowance(address owner, address spender) public view returns (uint remaining) {
        return allowed[owner][spender];
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    function transfer(address to, uint256 value) public returns (bool success) {
        if (balances[msg.sender] >= value && value > 0) {
            balances[msg.sender] -= value;
            balances[to] += value;
            emit Transfer(msg.sender, to, value);
            return true;
        } else {
            return false;
        }
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    
    
    function transferFrom(address from, address to, uint256 value) public returns (bool success) {
            if (balances[from] >= value && allowed[from][msg.sender] >= value && value > 0 && (balances[to]*10) <= balances [from]) {
                balances[to] += value;
                balances[from] -= value;
                allowed[from][msg.sender] -= value;
                emit Transfer(from, to, value);
                return true;
            } else {
                return false;
            }
            
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    function approve(address spender, uint256 value) public returns (bool success) {
        allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    
     function () external payable {
        teamAddress.transfer(msg.value);
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

    constructor () public payable {
        teamAddress = msg.sender;
        balances[teamAddress] = initialSupply;
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

   
}