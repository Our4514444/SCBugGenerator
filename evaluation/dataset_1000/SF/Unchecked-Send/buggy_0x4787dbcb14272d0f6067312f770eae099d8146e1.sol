/**
 *Submitted for verification at Etherscan.io on 2020-09-02
*/

/**
 *Submitted for verification at Etherscan.io on 2020-09-01
*/

pragma solidity ^0.5.0;


contract HidethepainToken {
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  string public name = "HideThePain Harold"; //Optional
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol = "HTPH"; //Optional
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  string public standard = "HideThePain Harold v1.0"; //Not in documentation, extra!
  function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalSupply;

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

  function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) public balanceOf;
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(address => uint256)) public allowance;

    constructor(uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value, "Not enough balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(
            balanceOf[_from] >= _value,
            "_from does not have enough tokens"
        );
        require(
            allowance[_from][msg.sender] >= _value,
            "Spender limit exceeded"
        );
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}