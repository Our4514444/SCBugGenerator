pragma solidity ^0.5.6;

contract owned {
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  address payable public owner;

    constructor () public {
        owner = msg.sender;
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address payable newOwner) onlyOwner public {
        owner = newOwner;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    
    function() external payable  {
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    
     function withdraw() onlyOwner public {
        owner.transfer(address(this).balance);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
}




interface ERC20 {
  function transfer(address receiver, uint256 value) external returns (bool ok);
}


interface ERC223Receiver {
    function tokenFallback(address _from, uint _value, bytes32 _data) external ;
}



contract SaTT is owned,ERC20 {

  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  uint8 public constant decimals = 18;
  function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 public constant totalSupply = 20000000000000000000000000000; // 20 billions and 18 decimals
  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  string public constant symbol = "SATT";
  function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  string public constant name = "Smart Advertising Transaction Token";
    

    
  function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping (address => uint256) public balanceOf;
  function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
  mapping (address => mapping (address => uint256)) public allowance;

  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Transfer(address indexed from, address indexed to, uint256 value);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);
    
   
    constructor () public {
        balanceOf[msg.sender] = totalSupply;               
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    
     function isContract(address _addr) internal view returns (bool is_contract) {
      bytes32 hash;
     
      assembly {
            //retrieve the size of the code on target address, this needs assembly
            hash := extcodehash(_addr)
      }
      return (hash != 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 && hash != bytes32(0));
     
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
    
     function transfer(address to, uint256 value) public returns (bool success) {
        _transfer(msg.sender, to, value);
        return true;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    
     function transfer(address to, uint256 value,bytes memory  data) public returns (bool success) {
         if((data[0])!= 0) { 
            _transfer(msg.sender, to, value);
         }
        return true;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    
     function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    
    function _transfer(address _from, address _to, uint256 _value) internal {
       
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != address(0x0));
        // Check if the sender has enough
        require(balanceOf[_from] >= _value);
        // Check for overflows
        require(balanceOf[_to] + _value > balanceOf[_to]);
        // Subtract from the sender
        balanceOf[_from] -= _value;
        // Add the same to the recipient
        balanceOf[_to] += _value;
        
        if(isContract(_to))
        {
            ERC223Receiver receiver = ERC223Receiver(_to);
            receiver.tokenFallback(msg.sender, _value, bytes32(0));
        }
        
        emit Transfer(_from, _to, _value);
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
    
     function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
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
    
    function transferToken (address token,address to,uint256 val) public onlyOwner {
        ERC20 erc20 = ERC20(token);
        erc20.transfer(to,val);
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
    
     function tokenFallback(address _from, uint _value, bytes memory  _data) pure public {
       
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

}