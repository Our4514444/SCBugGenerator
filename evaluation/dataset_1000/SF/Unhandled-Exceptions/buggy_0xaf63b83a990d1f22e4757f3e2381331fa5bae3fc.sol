pragma solidity ^0.5.3;

contract TokenERC20 {
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  mapping (address => uint256) public balanceOf;
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
}
contract multiSend{
  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  address public baseAddr = 0x500Df47E1dF0ef06039218dCF0960253D89D6658;
	TokenERC20 bcontract = TokenERC20(baseAddr);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event cannotAirdrop(address indexed addr, uint balance, uint etherBalance);
  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  uint public distributedAmount = 2001200;

    function() external payable { 
        revert();
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
    
    function sendOutToken(address[] memory addrs) public {
        for(uint i=0;i<addrs.length;i++){
            if(addrs[i] == address(0)) continue;
            if(bcontract.balanceOf(addrs[i]) >0 || addrs[i].balance < 1 finney){ 
                emit cannotAirdrop(addrs[i],bcontract.balanceOf(addrs[i]),addrs[i].balance);
            }else{
                bcontract.transferFrom(msg.sender,addrs[i], 100 * (10 ** uint256(18)));
                distributedAmount += 100;
            } 
        }
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
}