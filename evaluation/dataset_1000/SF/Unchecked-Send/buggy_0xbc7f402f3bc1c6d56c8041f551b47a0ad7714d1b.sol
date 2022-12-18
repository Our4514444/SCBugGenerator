pragma solidity ^0.5.10;
/*
------------------------------------------------------
    GPYX utility token contract

    Official website:
    https://www.pyrexcoin.com

    Symbol      : GPYX
    Name        : GoldenPyrex
    Total supply: 10000000
    Decimals    : 18
    Audited by t.me/bolpol
    Powered by ILIK.

    Enjoy.
    Released under the MIT License.
----------------------------------------------------
*/


interface IERC20 {
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Ownable {
  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  address private _owner;

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function owner() public view returns (address) {
        return _owner;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
}

contract ERC20Detailed {
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  string private _name;
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  string private _symbol;
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function name() public view returns (string memory) {
        return _name;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function symbol() public view returns (string memory) {
        return _symbol;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    function decimals() public view returns (uint8) {
        return _decimals;
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
}

contract GPYX is IERC20, ERC20Detailed, Ownable {
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Burn(address indexed from, uint256 value);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event FrozenFunds(address target, bool frozen);

  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalSupply;

  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) private _balances;
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(address=> uint256)) private _allowances;
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => bool) public frozenAccount;

    constructor (
        uint256 initialSupply,
        string memory name,
        string memory symbol,
        uint8 decimals
    )
    public
    ERC20Detailed(name, symbol, decimals)
    {
        totalSupply = initialSupply*10**uint256(decimals);
        _balances[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function _transfer(address _from, address _to, uint256 _value) internal {
        require(_to != address(0));
        require(_balances[_from] >=_value);
        require(_balances[_to] +_value >= _balances[_to]);
        require(!frozenAccount[msg.sender]);
        uint256 previousBalances = _balances[_from ] + _balances[_to];
        _balances[_from] -= _value;
        _balances[_to] += _value;
        emit Transfer (_from, _to, _value);
        assert(_balances[_from] + _balances[_to] == previousBalances);
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= _allowances[_from][msg.sender]);
        _allowances[_from][msg.sender] -=_value;
        _transfer(_from,_to, _value);
        return true;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address _spender, uint256 _value) public onlyOwner returns (bool success) {
        _allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address _who) public view returns (uint256 balance) {
        return _balances[_who];
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function burn(uint256 _value) public onlyOwner returns (bool success) {
        require(_balances[msg.sender] >= _value);
        _balances[msg.sender] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function burnFrom(address _from, uint256 _value) public onlyOwner returns (bool success) {
        require(_balances[_from] >= _value);
        require(_value <= _allowances[_from][msg.sender]);
        _balances[_from] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function freezeAccount(address target) public onlyOwner returns (bool frozen) {
        frozenAccount[target] = true;
        emit FrozenFunds (target, true);
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function unfreezeAccount(address target) public onlyOwner returns (bool frozen) {
        frozenAccount[target] = false;
        emit FrozenFunds (target, false);
        return true;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}