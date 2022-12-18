                                                                 

pragma solidity ^0.5.17;

library SafeMath {
  function ADD728(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    c = a + b;
    require(c >= a);
  }
  function SUB99(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    require(b <= a);
    c = a - b;
  }
  function MUL239(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    c = a * b;
    require(a == 0 || c / a == b);
  }
  function DIV83(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    require(b > 0);
    c = a / b;
  }
}

contract ERC20Interface {
    
  function TOTALSUPPLY180() public view returns (uint);	//inject NONSTANDARD NAMING
  function BALANCEOF223(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
  function ALLOWANCE818(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
  function TRANSFER817(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
  function APPROVE534(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
  function TRANSFERFROM537(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

  
}


contract ApproveAndCallFallBack {
  function RECEIVEAPPROVAL938(address from, uint256 tokens, address token, bytes memory data) public;	//inject NONSTANDARD NAMING
}

contract Owned {
  address public Admininstrator;


  constructor() public {
    Admininstrator = msg.sender;
    
  }

  modifier ONLYADMIN739 {	//inject NONSTANDARD NAMING
    require(msg.sender == Admininstrator, "Only authorized personnels");
    _;
  }

}

contract salescontract is Owned{
    
    
  using SafeMath for uint;
 
  address public token;
  
  uint public minBuy = 2 ether;
  uint public maxBuy = 5 ether;
  address payable saleswallet;
  
  bool public startSales = false;
  uint public buyvalue;
 
  
  uint public _qtty;
  uint decimal = 10**18;

 
  mapping(address => uint) public buyamount;
  uint256 public price = 0.04 ether;
  
  
 
  constructor() public { Admininstrator = msg.sender; }
   
 //========================================CONFIGURATIONS======================================
 
 
 function WALLETSETUP370(address payable _salewallet) public ONLYADMIN739{saleswallet = _salewallet;}	//inject NONSTANDARD NAMING
 function SETTOKEN547(address _tokenaddress) public ONLYADMIN739{token = _tokenaddress;}	//inject NONSTANDARD NAMING
 
 function ALLOWSALES893(bool _status) public ONLYADMIN739{startSales = _status;}	//inject NONSTANDARD NAMING
	
	
 function () external payable {
    
    require(startSales == true, "Sales has not been initialized yet");
    require(msg.value >= minBuy && msg.value <= maxBuy, "Invalid buy amount, confirm the maximum and minimum buy amounts");
    require(token != 0x0000000000000000000000000000000000000000, "Selling token not yet configured");
    require((buyamount[msg.sender] + msg.value) <= maxBuy, "Ensure your total buy is not above maximum allowed per wallet");
    
    buyvalue = msg.value;
    _qtty = buyvalue.DIV83(price);
    require(ERC20Interface(token).BALANCEOF223(address(this)) >= _qtty*decimal, "Insufficient tokens in the contract");
    
    saleswallet.transfer(msg.value);
    buyamount[msg.sender] += msg.value;
    require(ERC20Interface(token).TRANSFER817(msg.sender, _qtty*decimal), "Transaction failed");
      
       
   
    
   
  }
  
  	
 function BUY939() external payable {	//inject NONSTANDARD NAMING
    
    
    require(startSales == true, "Sales has not been initialized yet");
    require(msg.value >= minBuy && msg.value <= maxBuy, "Invalid buy amount, confirm the maximum and minimum buy amounts");
    require(token != 0x0000000000000000000000000000000000000000, "Selling token not yet configured");
    require((buyamount[msg.sender] + msg.value) <= maxBuy, "Ensure you total buy is not above maximum allowed per wallet");
    
    buyvalue = msg.value;
    _qtty = buyvalue.DIV83(price);
    require(ERC20Interface(token).BALANCEOF223(address(this)) >= _qtty*decimal, "Insufficient tokens in the contract");
    
    saleswallet.transfer(msg.value);
    buyamount[msg.sender] += msg.value;
    require(ERC20Interface(token).TRANSFER817(msg.sender, _qtty*decimal), "Transaction failed");
      
        
    
   
  }
  


  function WITHDRAWBAL492() public ONLYADMIN739 returns(bool){	//inject NONSTANDARD NAMING
      
      require(saleswallet != address(0));
      uint bal = ERC20Interface(token).BALANCEOF223(address(this));
      require(ERC20Interface(token).TRANSFER817(saleswallet, bal), "Transaction failed");
      
  }
 
 
}