pragma solidity ^0.5.4;

contract GVC{
  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event mintTransfer(address indexe,uint);
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed _from,address indexed _to,uint _amount);
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Burn(address,uint);
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  string public constant name="GlobalVc";
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  string public constant symbol="GVC";
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  uint public constant decimals=18;
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  uint  public constant initialSuply=1000000;
    uint public  totalSupply= initialSuply*10**decimals;
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  address ownerOfTotalSupply;
    constructor(address _ownerOfTotalSupply)public{
        ownerOfTotalSupply = _ownerOfTotalSupply;
        balanceOf[_ownerOfTotalSupply] = totalSupply;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address=>uint)balanceOf;
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address=>mapping(address=>uint))allowed;
    function balance(address _owner)public view returns(uint){
        return(balanceOf[_owner]);
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    function _transfer(address _from,address _to,uint _value)public {
        require(_to != address(0x0));
        require(_to != _from);
        require(balanceOf[_from]>= _value);
        require(balanceOf[_to]+_value >= balanceOf[_to]);
        require(_value>0 );
        uint previosBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from]-=_value;
        balanceOf[_to]+=_value;
        emit Transfer(_from,_to,_value);
        assert(balanceOf[_from] + balanceOf[_to] == previosBalances);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address _to,uint _value)public returns(bool success){
        _transfer(msg.sender,_to,_value);
        return true;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address _from,address _to,uint _value)public returns(bool success){
        require(_value<=allowed[_from][msg.sender]);
        _transfer(_from,_to,_value);
        return true;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address _spender,uint _value)public returns(bool success){
        allowed[msg.sender][_spender]=_value;
        emit Approval(msg.sender,_spender,_value);
        return true;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    function mintToken(address _target,uint _amountMintToken)public{
        require(msg.sender == ownerOfTotalSupply);
        balanceOf[_target]+=_amountMintToken;
        totalSupply+=_amountMintToken;
        emit mintTransfer(ownerOfTotalSupply,_amountMintToken);
        emit Transfer(ownerOfTotalSupply,_target,_amountMintToken);
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    function burn(uint _amount)public returns(bool success){
        require(msg.sender == ownerOfTotalSupply);
        require(balanceOf[msg.sender] >=_amount);
        balanceOf[msg.sender]-=_amount;
        totalSupply-=_amount;
        emit Burn(msg.sender,_amount);
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    function burnFrom(address _from,uint _amount)public  returns(bool success){
        require(balanceOf[_from]>= _amount);
        require(_amount<=allowed[_from][msg.sender]);
        balanceOf[_from]-=_amount;
        allowed[_from][msg.sender]-=_amount;
        totalSupply-=_amount;
        emit Burn(_from,_amount);
        return true;
        
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
}