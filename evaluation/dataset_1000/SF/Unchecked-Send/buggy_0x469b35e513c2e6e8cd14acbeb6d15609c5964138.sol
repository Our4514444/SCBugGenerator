pragma solidity ^0.5.0;

contract owned {
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        owner = newOwner;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
}

contract TokenERC20 {
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  string public name;
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals = 18;
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalSupply;

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public balanceOf;
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) public allowance;

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint256 value);
	
    constructor (
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        name = tokenName;
        symbol = tokenSymbol;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != address(0x0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
	
    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
		emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
}

contract A0101Token is owned, TokenERC20 {

  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => bool) public frozenAccount;

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event FrozenFunds(address target, bool frozen);

    constructor (
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) TokenERC20(initialSupply, tokenName, tokenSymbol) public {}
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != address(0x0));
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        require(!frozenAccount[_from]);
        require(!frozenAccount[_to]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function mintToken(address target, uint256 mintedAmount) onlyOwner public {
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        emit Transfer(address(0), owner, mintedAmount);
        emit Transfer(owner, target, mintedAmount);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function freezeAccount(address target, bool freeze) onlyOwner public {
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}