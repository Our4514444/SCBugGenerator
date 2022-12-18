/**
 *Submitted for verification at Etherscan.io on 2020-01-01
*/

pragma solidity 0.5.12;

contract BlockLoopsToken {
    // Mapeia quantos tokens cada endereco possui
  address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
  mapping (address => uint256) public balanceOf;
   
    // Altere essa secao para a sua necessidade
  function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  string public name = "Token BlockLoops";
  address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
  string public symbol = "BLKL";
  address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * (uint256(10) ** decimals);
   
  uint256 bugv_tmstmp3 = block.timestamp;
  event Transfer(address indexed from, address indexed to, uint256 value);
   
    constructor() public {
        // Inicialmente cede todos os tokens ao criador do contrato.
        balanceOf[msg.sender] = totalSupply;
       
}
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

function transfer(address to, uint256 value) public returns (bool sucess) {
    require(balanceOf[msg.sender] >=value);
   
    balanceOf[msg.sender] -= value; // deduct from sender's balance
    balanceOf[to] += value;        // add to recipient's balance
    emit Transfer(msg.sender, to, value);
    return true;
}
uint256 bugv_tmstmp4 = block.timestamp;
uint256 bugv_tmstmp1 = block.timestamp;

event Approval(address indexed owner, address indexed spender, uint256 value);
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

mapping(address => mapping(address => uint256)) public allowance;

function approve(address spender, uint256 value)
    public
    returns (bool sucess)
{
    allowance[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
}
uint256 bugv_tmstmp5 = block.timestamp;

function transferFrom(address from, address to, uint256 value)
    public
    returns (bool success)
{
    require(value <= balanceOf[from]);
    require(value <= allowance[from][msg.sender]);
       
    balanceOf[from] -= value;
    balanceOf[to] += value;
    allowance[from][msg.sender]-= value;
    emit Transfer(from, to, value);
    return true;
}
uint256 bugv_tmstmp2 = block.timestamp;
}