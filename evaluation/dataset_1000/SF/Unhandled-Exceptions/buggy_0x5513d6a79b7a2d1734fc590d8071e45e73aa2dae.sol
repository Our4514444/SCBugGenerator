/**
 *Submitted for verification at Etherscan.io on 2019-12-12
*/

pragma solidity >=0.5.0;

contract ERC20{
    function transfer(address to, uint value) public;
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    function transferFrom(address from, address to, uint value) public;
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function approve(address spender, uint value) public;
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  event Transfer(address indexed from, address indexed to, uint value);
  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  event Approval(address indexed owner, address indexed spender, uint value);
}

/// @title Main contract to staking processes
/// @author Larry J. Smith
/// @notice users can call public functions to interactive with staking smart contract including stake, withdraw, refund
/// @dev Larry is one of the core technical engineers
contract Staking{

  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address payable userAddress;
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  uint totalStakingEtherAmt;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint totalStakingTetherAmt;
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  uint totalWithdrawEtherAmt;
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint totalWithdrawTetherAmt;
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  bool isValid;
    
  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address tether_0x_address = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  string  identifier = "0x0ee8a2fc0f9ff6c13d1491c31a0dc0950b945c77";
  function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  address public owner;
  function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  ERC20 tetherContract;

    modifier onlyOwner {
        require(msg.sender == owner,"invalid sender");
        _;
    }

  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event EtherStaking(address indexed addr, uint amount);
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event TetherStaking(address indexed addr, uint amount);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Withdrawal(address indexed addr, uint indexed _type , uint amount);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Refund(address indexed addr);

    constructor() public {
        owner = msg.sender;
        tetherContract =  ERC20(tether_0x_address);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    function () external payable{
        revert();
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    function stakeEther() public payable returns(bool){
        address payable addr = msg.sender;
        uint amount = msg.value;
        require(amount > 0, "invalid amount");
        if(isValid){
            require(msg.sender == userAddress, "invalid sender");
            totalStakingEtherAmt += amount;
        }else{
            userAddress = addr;
            totalStakingEtherAmt = amount;
            totalStakingTetherAmt = 0;
            totalWithdrawEtherAmt = 0;
            totalWithdrawTetherAmt = 0;
            isValid = true;
        }
        emit EtherStaking(addr, amount);
        return true;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function stakeTether(uint amount) public returns(bool){
        require(amount > 0, "invalid amount");
        tetherContract.transferFrom(msg.sender,address(this),amount);
        if(isValid){
            require(msg.sender == userAddress, "invalid sender");
            totalStakingTetherAmt += amount;
            
        }else{
            userAddress = msg.sender;
            totalStakingEtherAmt = 0;
            totalStakingTetherAmt = amount;
            totalWithdrawEtherAmt = 0;
            totalWithdrawTetherAmt = 0;
            isValid = true;
        }
        emit TetherStaking(msg.sender, amount);
        return true;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    function withdraw(uint amount,uint _type) public returns(bool){
        address addr = msg.sender;
        require(amount > 0,"invalid amount");
        require(addr == userAddress, "invalid sender");

        if(_type == 1){
            require(totalStakingEtherAmt - totalWithdrawEtherAmt >= amount, "not enough balance");
            totalWithdrawEtherAmt += amount;
            userAddress.transfer(amount);
            emit Withdrawal(addr, _type, amount);
            return true;
        }
        if(_type == 2){
            require(totalStakingTetherAmt - totalWithdrawTetherAmt >= amount, "not enough balance");
            totalWithdrawTetherAmt += amount;
            tetherContract.transfer(msg.sender, amount);
            emit Withdrawal(addr, _type, amount);
            return true;
        }
        return false;

    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function refund() public onlyOwner returns(bool){
        if(isValid){
            uint etherAmt = totalStakingEtherAmt - totalWithdrawEtherAmt;
            uint tetherAmt = totalStakingTetherAmt - totalWithdrawTetherAmt;

            if(etherAmt>0){
                userAddress.transfer(etherAmt);
                totalWithdrawEtherAmt += etherAmt;
            }
            if(tetherAmt>0){
                tetherContract.transfer(userAddress, tetherAmt);
                totalWithdrawTetherAmt +=tetherAmt;
            }
            emit Refund(userAddress);
            return true;
        }
        return false;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    function getBalanceOf() public view returns(uint,uint,uint,uint,uint,uint){
        return (totalStakingEtherAmt - totalWithdrawEtherAmt, totalStakingTetherAmt - totalWithdrawTetherAmt, totalStakingEtherAmt, totalStakingTetherAmt, totalWithdrawEtherAmt, totalWithdrawTetherAmt);
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

}