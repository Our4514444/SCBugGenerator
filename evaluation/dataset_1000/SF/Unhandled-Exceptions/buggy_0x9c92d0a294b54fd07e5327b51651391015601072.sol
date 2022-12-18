pragma solidity ^0.5.0;

interface TargetInterface {
    function placesLeft() external view returns (uint256);
}

contract AntiCryptoman {
    
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  address payable targetAddress = 0x1Ef48854c57126085c2C9615329ED71fe159E390;
  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  address payable private owner;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    constructor() public payable {
        owner = msg.sender;
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    
    function ping(bool _toOwner) public payable onlyOwner {
        TargetInterface target = TargetInterface(targetAddress);
        uint256 placesLeft = target.placesLeft();
        
        require(placesLeft <= 7);
        
        uint256 betSize = 0.05 ether;
        uint256 ourBalanceInitial = address(this).balance;
        
        for (uint256 ourBetIndex = 0; ourBetIndex < placesLeft; ourBetIndex++) {
            (bool success, bytes memory data) = targetAddress.call.value(betSize)("");
            require(success);
            data;
        }
        
        require(address(this).balance > ourBalanceInitial);
        
        if (_toOwner) {
            owner.transfer(address(this).balance);
        }
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    function withdraw() public onlyOwner {
        owner.transfer(address(this).balance);
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }    
    
    function kill() public onlyOwner {
        selfdestruct(owner);
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}    
    
    function () external payable {
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
    
}