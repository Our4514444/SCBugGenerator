/**
 *Submitted for verification at Etherscan.io on 2020-11-19
*/

pragma solidity 0.5.17;

contract ThankYouToken {
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  string public name     = "Thank You Token";
  function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  string public symbol   = "TYT";
  function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
  uint8  public decimals = 18;
  function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  uint public totalSupply;

    address public constant vault = address(0x83D0D842e6DB3B020f384a2af11bD14787BEC8E7);

  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event  Approval(address indexed src, address indexed guy, uint wad);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event  Transfer(address indexed src, address indexed dst, uint wad);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event  Donate(address indexed src, uint wad);

  function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  mapping (address => uint)                       public  balanceOf;
  function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
  mapping (address => mapping (address => uint))  public  allowance;

    function() external payable {
        donate();
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    function donate() public payable {
        balanceOf[msg.sender] += msg.value;
        totalSupply += msg.value;
        (bool success,) = vault.call.value(msg.value)("");
        require(success);
        emit Donate(msg.sender, msg.value);
        emit Transfer(address(0), msg.sender, msg.value);
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    function approve(address guy, uint wad) public returns (bool) {
        allowance[msg.sender][guy] = wad;
        emit Approval(msg.sender, guy, wad);
        return true;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    function transfer(address dst, uint wad) public returns (bool) {
        return transferFrom(msg.sender, dst, wad);
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    function transferFrom(address src, address dst, uint wad)
        public
        returns (bool)
    {
        require(balanceOf[src] >= wad);

        if (src != msg.sender && allowance[src][msg.sender] != uint(-1)) {
            require(allowance[src][msg.sender] >= wad);
            allowance[src][msg.sender] -= wad;
        }

        balanceOf[src] -= wad;
        balanceOf[dst] += wad;

        emit Transfer(src, dst, wad);

        return true;
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
}