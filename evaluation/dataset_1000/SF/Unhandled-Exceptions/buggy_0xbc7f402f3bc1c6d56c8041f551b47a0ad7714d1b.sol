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
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  address private _owner;

  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function owner() public view returns (address) {
        return _owner;
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
}

contract ERC20Detailed {
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  string private _name;
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  string private _symbol;
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function name() public view returns (string memory) {
        return _name;
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    function decimals() public view returns (uint8) {
        return _decimals;
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
}

contract GPYX is IERC20, ERC20Detailed, Ownable {
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Burn(address indexed from, uint256 value);
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event FrozenFunds(address target, bool frozen);

  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256 public totalSupply;

  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  mapping (address => uint256) private _balances;
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping(address => mapping(address=> uint256)) private _allowances;
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
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
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

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
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= _allowances[_from][msg.sender]);
        _allowances[_from][msg.sender] -=_value;
        _transfer(_from,_to, _value);
        return true;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    function approve(address _spender, uint256 _value) public onlyOwner returns (bool success) {
        _allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function balanceOf(address _who) public view returns (uint256 balance) {
        return _balances[_who];
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    function burn(uint256 _value) public onlyOwner returns (bool success) {
        require(_balances[msg.sender] >= _value);
        _balances[msg.sender] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    function burnFrom(address _from, uint256 _value) public onlyOwner returns (bool success) {
        require(_balances[_from] >= _value);
        require(_value <= _allowances[_from][msg.sender]);
        _balances[_from] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    function freezeAccount(address target) public onlyOwner returns (bool frozen) {
        frozenAccount[target] = true;
        emit FrozenFunds (target, true);
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

    function unfreezeAccount(address target) public onlyOwner returns (bool frozen) {
        frozenAccount[target] = false;
        emit FrozenFunds (target, false);
        return true;
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
}