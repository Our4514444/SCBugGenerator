/**
 *Submitted for verification at Etherscan.io on 2020-10-27
*/

/**
    .---.                _..._                   
    |   |             .-'_..._''.                
    '---'           .' .'      '.\    .          
    .---.          / .'             .'|          
    |   |         . '             .'  |          
    |   |    __   | |            <    |          
    |   | .:--.'. | |             |   | ____     
    |   |/ |   \ |. '             |   | \ .'     
    |   |`" __ | | \ '.          .|   |/  .      
    |   | .'.''| |  '. `._____.-'/|    /\  \     
 __.'   '/ /   | |_   `-.______ / |   |  \  \    
|      ' \ \._,\ '/            `  '    \  \  \   
|____.'   `--'  `"               '------'  '---' 
                                                            
                                                                                                                                   
                                                                                                                                                    
*/

pragma solidity ^0.5.0;

// Standar ERC Token Interface
contract ERC20Interface {
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
   
    function approve(address spender, uint tokens) public returns (bool success);
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
    function totalSupply() public view returns (uint);
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
   
    function balanceOf(address tokenOwner) public view returns (uint balance);
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
    function transfer(address to, uint tokens) public returns (bool success);
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
     
  uint256 bugv_tmstmp3 = block.timestamp;
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
  uint256 bugv_tmstmp1 = block.timestamp;
  event Transfer(address indexed from, address indexed to, uint tokens);
    
}

// ----------------------------------------------------------------------------
// Safe Math Library 
// ----------------------------------------------------------------------------
library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
      }
    
      function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
      }
    
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
    
    function ceil(uint256 a, uint256 m) internal pure returns (uint256) {
        uint256 c = add(a,m);
        uint256 d = sub(c,1);
        return mul(div(d,m),m);
    }
}


contract JACK is ERC20Interface {
    
    using SafeMath for uint256;
  address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
  string public name;
  function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  string public symbol;
  address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
  uint8 public decimals; // 18 standard decimal place
    
  function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint256 public basePercent = 400;
  address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
  uint256 public _totalSupply;
    
  function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping(address => uint) balances;
  function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping(address => mapping(address => uint)) allowed;

    constructor() public {
        name = "jackfinance.info";
        symbol = "$JACK";
        decimals = 18;
        _totalSupply = 500000000000000000000;
        
        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }
    
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
    
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
    
    
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    function findBurnPercent(uint256 value) public view returns (uint256)  {
        uint256 roundValue = value.ceil(basePercent);
        uint256 onePercent = roundValue.mul(basePercent).div(10000); // 2 percent burn
        return onePercent;
      }
uint256 bugv_tmstmp4 = block.timestamp;
    
    function transfer(address to, uint value) public returns (bool success) {
        // balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        // balances[to] = safeAdd(balances[to], tokens);
        // emit Transfer(msg.sender, to, tokens);
        // return true;
        
        require(value <= balances[msg.sender]);
        require(to != address(0));
    
        uint256 tokensToBurn = findBurnPercent(value);
        uint256 tokensToTransfer = value.sub(tokensToBurn);
    
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[to] = balances[to].add(tokensToTransfer);
    
        _totalSupply = _totalSupply.sub(tokensToBurn);
    
        emit Transfer(msg.sender, to, tokensToTransfer);
        emit Transfer(msg.sender, address(0), tokensToBurn);
        return true;
    }
uint256 bugv_tmstmp5 = block.timestamp;
    
    function totalSupply() public view returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
uint256 bugv_tmstmp2 = block.timestamp;
    
}