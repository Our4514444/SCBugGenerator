pragma solidity ^0.5.6;

contract owned {
    address payable public owner;

    constructor () public {
        owner = msg.sender;
    }

    modifier ONLYOWNER853 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    function TRANSFEROWNERSHIP261(address payable newOwner) ONLYOWNER853 public {	//inject NONSTANDARD NAMING
        owner = newOwner;
    }
    
    function() external payable  {
    }
    
     function WITHDRAW601() ONLYOWNER853 public {	//inject NONSTANDARD NAMING
        owner.transfer(address(this).balance);
    }
}




interface ERC20 {
  function TRANSFER79(address receiver, uint256 value) external returns (bool ok);	//inject NONSTANDARD NAMING
}


interface ERC223Receiver {
    function TOKENFALLBACK485(address _from, uint _value, bytes32 _data) external ;	//inject NONSTANDARD NAMING
}



contract SaTT is owned,ERC20 {

    uint8 public constant decimals519 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant totalsupply106 = 20000000000000000000000000000; // 20 billions and 18 decimals	//inject NONSTANDARD NAMING
    string public constant symbol638 = "SATT";	//inject NONSTANDARD NAMING
    string public constant name673 = "Smart Advertising Transaction Token";	//inject NONSTANDARD NAMING
    

    
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event TRANSFER329(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL374(address indexed tokenOwner, address indexed spender, uint256 tokens);	//inject NONSTANDARD NAMING
    
   
    constructor () public {
        balanceOf[msg.sender] = totalsupply106;               
    }
    
     function ISCONTRACT466(address _addr) internal view returns (bool is_contract) {	//inject NONSTANDARD NAMING
      bytes32 hash;
     
      assembly {
            //retrieve the size of the code on target address, this needs assembly
            hash := extcodehash(_addr)
      }
      return (hash != 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 && hash != bytes32(0));
     
    }
    
     function TRANSFER79(address to, uint256 value) public returns (bool success) {	//inject NONSTANDARD NAMING
        _TRANSFER324(msg.sender, to, value);
        return true;
    }
    
     function TRANSFER79(address to, uint256 value,bytes memory  data) public returns (bool success) {	//inject NONSTANDARD NAMING
         if((data[0])!= 0) { 
            _TRANSFER324(msg.sender, to, value);
         }
        return true;
    }
    
     function TRANSFERFROM349(address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _TRANSFER324(_from, _to, _value);
        return true;
    }
    
    function _TRANSFER324(address _from, address _to, uint256 _value) internal {	//inject NONSTANDARD NAMING
       
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
        
        if(ISCONTRACT466(_to))
        {
            ERC223Receiver receiver = ERC223Receiver(_to);
            receiver.TOKENFALLBACK485(msg.sender, _value, bytes32(0));
        }
        
        emit TRANSFER329(_from, _to, _value);
    }
    
     function APPROVE462(address _spender, uint256 _value) public	//inject NONSTANDARD NAMING
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL374(msg.sender, _spender, _value);
        return true;
    }
    
    function TRANSFERTOKEN449 (address token,address to,uint256 val) public ONLYOWNER853 {	//inject NONSTANDARD NAMING
        ERC20 erc20 = ERC20(token);
        erc20.TRANSFER79(to,val);
    }
    
     function TOKENFALLBACK485(address _from, uint _value, bytes memory  _data) pure public {	//inject NONSTANDARD NAMING
       
    }

}