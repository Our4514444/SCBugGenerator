pragma solidity ^0.5.6;

contract owned {
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  address payable public owner;

    constructor () public {
        owner = msg.sender;
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address payable newOwner) onlyOwner public {
        owner = newOwner;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    
    function() external payable  {
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    
     function withdraw() onlyOwner public {
        owner.transfer(address(this).balance);
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
}




interface ERC20 {
  function transfer(address receiver, uint256 value) external returns (bool ok);
}


interface ERC223Receiver {
    function tokenFallback(address _from, uint _value, bytes32 _data) external ;
}



contract SaTT is owned,ERC20 {

  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public constant decimals = 18;
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public constant totalSupply = 20000000000000000000000000000; // 20 billions and 18 decimals
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  string public constant symbol = "SATT";
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  string public constant name = "Smart Advertising Transaction Token";
    

    
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public balanceOf;
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) public allowance;

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);
    
   
    constructor () public {
        balanceOf[msg.sender] = totalSupply;               
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    
     function isContract(address _addr) internal view returns (bool is_contract) {
      bytes32 hash;
     
      assembly {
            //retrieve the size of the code on target address, this needs assembly
            hash := extcodehash(_addr)
      }
      return (hash != 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 && hash != bytes32(0));
     
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    
     function transfer(address to, uint256 value) public returns (bool success) {
        _transfer(msg.sender, to, value);
        return true;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    
     function transfer(address to, uint256 value,bytes memory  data) public returns (bool success) {
         if((data[0])!= 0) { 
            _transfer(msg.sender, to, value);
         }
        return true;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    
     function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    
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
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
     function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
    function transferToken (address token,address to,uint256 val) public onlyOwner {
        ERC20 erc20 = ERC20(token);
        erc20.transfer(to,val);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
     function tokenFallback(address _from, uint _value, bytes memory  _data) pure public {
       
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

}