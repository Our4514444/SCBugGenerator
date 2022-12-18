/**
 *Submitted for verification at Etherscan.io on 2020-11-19
*/

pragma solidity 0.5.17;

contract ThankYouToken {
  address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
  string public name     = "Thank You Token";
  address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
  string public symbol   = "TYT";
  address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
  uint8  public decimals = 18;
  address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
  uint public totalSupply;

    address public constant vault = address(0x83D0D842e6DB3B020f384a2af11bD14787BEC8E7);

  uint256 bugv_tmstmp2 = block.timestamp;
  event  Approval(address indexed src, address indexed guy, uint wad);
  uint256 bugv_tmstmp3 = block.timestamp;
  event  Transfer(address indexed src, address indexed dst, uint wad);
  uint256 bugv_tmstmp1 = block.timestamp;
  event  Donate(address indexed src, uint wad);

  function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping (address => uint)                       public  balanceOf;
  address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
  mapping (address => mapping (address => uint))  public  allowance;

    function() external payable {
        donate();
    }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}

    function donate() public payable {
        balanceOf[msg.sender] += msg.value;
        totalSupply += msg.value;
        (bool success,) = vault.call.value(msg.value)("");
        require(success);
        emit Donate(msg.sender, msg.value);
        emit Transfer(address(0), msg.sender, msg.value);
    }
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function approve(address guy, uint wad) public returns (bool) {
        allowance[msg.sender][guy] = wad;
        emit Approval(msg.sender, guy, wad);
        return true;
    }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function transfer(address dst, uint wad) public returns (bool) {
        return transferFrom(msg.sender, dst, wad);
    }
uint256 bugv_tmstmp4 = block.timestamp;

    function transferFrom(address src, address dst, uint wad)
        public
        returns (bool)
    {
        require(balanceOf[src] >= wad);

        if (src != msg.sender && allowance[src][msg.sender] != uint(-1)) {
            require(allowance[src][msg.sender] >= wad);
            allowance[src][msg.sender] -= wad;
        }

        balanceOf[src] -= wad;
        balanceOf[dst] += wad;

        emit Transfer(src, dst, wad);

        return true;
    }
uint256 bugv_tmstmp5 = block.timestamp;
}