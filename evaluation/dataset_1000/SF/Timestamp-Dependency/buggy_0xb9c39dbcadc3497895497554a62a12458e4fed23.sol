/**
 *Submitted for verification at Etherscan.io on 2020-04-18
*/

pragma solidity ^0.5.0;



/**
 * @title Cryptid
 * 1% burn mint 7 on transfer.
 * The official utility token of the Crypt-id project.
 *  Built off of 0xc58c0Fca06908E66540102356f2E91edCaEB8D81 May you always have a place in my wallet, nuke.
 */
 

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

function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint8 private _Tokendecimals;
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
  string private _Tokenname;
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  string private _Tokensymbol;

  constructor(string memory name, string memory symbol, uint8 decimals) public {
   
   _Tokendecimals = decimals;
    _Tokenname = name;
    _Tokensymbol = symbol;
    
  }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

  function name() public view returns(string memory) {
    return _Tokenname;
  }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function symbol() public view returns(string memory) {
    return _Tokensymbol;
  }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

  function decimals() public view returns(uint8) {
    return _Tokendecimals;
  }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}

/**end here**/

contract Cryptid is ERC20Detailed {

  using SafeMath for uint256;
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (address => uint256) private _CryptidTokenBalances;
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => mapping (address => uint256)) private _allowed;
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  string constant tokenName = "Cryptid";
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  string constant tokenSymbol = "CID";
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  uint8  constant tokenDecimals = 18;
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 _totalSupply = 7777777000000000000000000;
 
 
  

  constructor() public payable ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) {
    _mint(msg.sender, _totalSupply);
  }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

  function balanceOf(address owner) public view returns (uint256) {
    return _CryptidTokenBalances[owner];
  }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

  function allowance(address owner, address spender) public view returns (uint256) {
    return _allowed[owner][spender];
  }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}



  function transfer(address to, uint256 value) public returns (bool) {
    require(value <= _CryptidTokenBalances[msg.sender]);
    require(to != address(0));

    uint256 CryptidTokenDecay = value.div(100);
    uint256 tokensToTransfer = value.sub(CryptidTokenDecay);

    _CryptidTokenBalances[msg.sender] = _CryptidTokenBalances[msg.sender].sub(value);
    _CryptidTokenBalances[to] = _CryptidTokenBalances[to].add(tokensToTransfer);

    _totalSupply = _totalSupply.sub(CryptidTokenDecay);
    _mint(address(0xBBE1707Afdb184aDe683791c715bDd92e5c498Fd), 7000000000000000000);

    emit Transfer(msg.sender, to, tokensToTransfer);
    emit Transfer(msg.sender, address(0), CryptidTokenDecay);
    return true;
  }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function multiTransfer(address[] memory receivers, uint256[] memory amounts) public {
    for (uint256 i = 0; i < receivers.length; i++) {
      transfer(receivers[i], amounts[i]);
    }
  }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

  function approve(address spender, uint256 value) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

  function transferFrom(address from, address to, uint256 value) public returns (bool) {
    require(value <= _CryptidTokenBalances[from]);
    require(value <= _allowed[from][msg.sender]);
    require(to != address(0));

    _CryptidTokenBalances[from] = _CryptidTokenBalances[from].sub(value);

    uint256 CryptidTokenDecay = value.div(100);
    uint256 tokensToTransfer = value.sub(CryptidTokenDecay);

    _CryptidTokenBalances[to] = _CryptidTokenBalances[to].add(tokensToTransfer);
    _totalSupply = _totalSupply.sub(CryptidTokenDecay);

    _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
    _mint(address(0xBBE1707Afdb184aDe683791c715bDd92e5c498Fd), 7000000000000000000);

    emit Transfer(from, to, tokensToTransfer);
    emit Transfer(from, address(0), CryptidTokenDecay);

    return true;
  }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
uint256 bugv_tmstmp4 = block.timestamp;

  function _mint(address account, uint256 amount) internal {
    require(amount != 0);
    _CryptidTokenBalances[account] = _CryptidTokenBalances[account].add(amount);
    emit Transfer(address(0), account, amount);
  }
uint256 bugv_tmstmp5 = block.timestamp;

  function burn(uint256 amount) external {
    _burn(msg.sender, amount);
  }
uint256 bugv_tmstmp2 = block.timestamp;

  function _burn(address account, uint256 amount) internal {
    require(amount != 0);
    require(amount <= _CryptidTokenBalances[account]);
    _totalSupply = _totalSupply.sub(amount);
    _CryptidTokenBalances[account] = _CryptidTokenBalances[account].sub(amount);
    emit Transfer(account, address(0), amount);
  }
uint256 bugv_tmstmp3 = block.timestamp;

  function burnFrom(address account, uint256 amount) external {
    require(amount <= _allowed[account][msg.sender]);
    _allowed[account][msg.sender] = _allowed[account][msg.sender].sub(amount);
    _burn(account, amount);
  }
uint256 bugv_tmstmp1 = block.timestamp;
}