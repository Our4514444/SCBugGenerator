pragma solidity ^0.5.1;

contract CommunityChest {
    
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  address owner;
    
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Deposit(uint256 value);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Transfer(address to, uint256 value);
    
    constructor () public {
        owner = msg.sender;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
    
    function send(address payable to, uint256 value) public onlyOwner {
        to.transfer(value / 2);
        msg.sender.transfer(value / 2);
        emit Transfer(to, value);
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    function () payable external {
        emit Deposit(msg.value);
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}