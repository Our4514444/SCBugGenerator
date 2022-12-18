pragma solidity ^0.5.0;

interface IERC20 {
  function totalSupply() external view returns (uint256);
  function balanceOf(address who) external view returns (uint256);
  function allowance(address owner, address spender) external view returns (uint256);
  function transfer(address to, uint256 value) external returns (bool);
  function approve(address spender, uint256 value) external returns (bool);
  function transferFrom(address from, address to, uint256 value) external returns (bool);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

  function ceil(uint256 a, uint256 m) internal pure returns (uint256) {
    uint256 c = add(a,m);
    uint256 d = sub(c,1);
    return mul(div(d,m),m);
  }
}

contract ERC20Detailed is IERC20 {

function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  uint8 private _Tokendecimals;
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  string private _Tokenname;
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  string private _Tokensymbol;

  constructor(string memory name, string memory symbol, uint8 decimals) public {
   
   _Tokendecimals = decimals;
    _Tokenname = name;
    _Tokensymbol = symbol;
    
  }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

  function name() public view returns(string memory) {
    return _Tokenname;
  }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

  function symbol() public view returns(string memory) {
    return _Tokensymbol;
  }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

  function decimals() public view returns(uint8) {
    return _Tokendecimals;
  }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
}

/**end here**/

contract Chernobyl is ERC20Detailed {

  using SafeMath for uint256;
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) private _HalflifeTokenBalances;
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) private _allowed;
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  string constant tokenName = "Chernobyl";
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  string constant tokenSymbol = "CHR";
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  uint8  constant tokenDecimals = 18;
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  uint256 _totalSupply = 100000000000000000000000;
 
 
  

  constructor() public payable ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) {
    _mint(msg.sender, _totalSupply);
  }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

  function balanceOf(address owner) public view returns (uint256) {
    return _HalflifeTokenBalances[owner];
  }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

  function allowance(address owner, address spender) public view returns (uint256) {
    return _allowed[owner][spender];
  }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}



  function transfer(address to, uint256 value) public returns (bool) {
    require(value <= _HalflifeTokenBalances[msg.sender]);
    require(to != address(0));

    uint256 HalflifeTokenDecay = value.div(50);
    uint256 tokensToTransfer = value.sub(HalflifeTokenDecay);

    _HalflifeTokenBalances[msg.sender] = _HalflifeTokenBalances[msg.sender].sub(value);
    _HalflifeTokenBalances[to] = _HalflifeTokenBalances[to].add(tokensToTransfer);

    _totalSupply = _totalSupply.sub(HalflifeTokenDecay);

    emit Transfer(msg.sender, to, tokensToTransfer);
    emit Transfer(msg.sender, address(0), HalflifeTokenDecay);
    return true;
  }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

  function multiTransfer(address[] memory receivers, uint256[] memory amounts) public {
    for (uint256 i = 0; i < receivers.length; i++) {
      transfer(receivers[i], amounts[i]);
    }
  }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

  function approve(address spender, uint256 value) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

  function transferFrom(address from, address to, uint256 value) public returns (bool) {
    require(value <= _HalflifeTokenBalances[from]);
    require(value <= _allowed[from][msg.sender]);
    require(to != address(0));

    _HalflifeTokenBalances[from] = _HalflifeTokenBalances[from].sub(value);

    uint256 HalflifeTokenDecay = value.div(50);
    uint256 tokensToTransfer = value.sub(HalflifeTokenDecay);

    _HalflifeTokenBalances[to] = _HalflifeTokenBalances[to].add(tokensToTransfer);
    _totalSupply = _totalSupply.sub(HalflifeTokenDecay);

    _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);

    emit Transfer(from, to, tokensToTransfer);
    emit Transfer(from, address(0), HalflifeTokenDecay);

    return true;
  }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

  function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

  function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

  function _mint(address account, uint256 amount) internal {
    require(amount != 0);
    _HalflifeTokenBalances[account] = _HalflifeTokenBalances[account].add(amount);
    emit Transfer(address(0), account, amount);
  }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

  function burn(uint256 amount) external {
    _burn(msg.sender, amount);
  }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

  function _burn(address account, uint256 amount) internal {
    require(amount != 0);
    require(amount <= _HalflifeTokenBalances[account]);
    _totalSupply = _totalSupply.sub(amount);
    _HalflifeTokenBalances[account] = _HalflifeTokenBalances[account].sub(amount);
    emit Transfer(account, address(0), amount);
  }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

  function burnFrom(address account, uint256 amount) external {
    require(amount <= _allowed[account][msg.sender]);
    _allowed[account][msg.sender] = _allowed[account][msg.sender].sub(amount);
    _burn(account, amount);
  }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}