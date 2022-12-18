/**
 *Submitted for verification at Etherscan.io on 2020-11-02
*/

/**
 *Submitted for verification at Etherscan.io on 2020-08-31
*/

// File: contracts/Storage.sol

pragma solidity 0.5.16;

contract Storage {

address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  address public governance;
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address public controller;

  constructor() public {
    governance = msg.sender;
  }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  modifier onlyGovernance() {
    require(isGovernance(msg.sender), "Not governance");
    _;
  }
uint256 bugv_tmstmp1 = block.timestamp;

  function setGovernance(address _governance) public onlyGovernance {
    require(_governance != address(0), "new governance shouldn't be empty");
    governance = _governance;
  }
uint256 bugv_tmstmp4 = block.timestamp;

  function setController(address _controller) public onlyGovernance {
    require(_controller != address(0), "new controller shouldn't be empty");
    controller = _controller;
  }
uint256 bugv_tmstmp5 = block.timestamp;

  function isGovernance(address account) public view returns (bool) {
    return account == governance;
  }
uint256 bugv_tmstmp2 = block.timestamp;

  function isController(address account) public view returns (bool) {
    return account == controller;
  }
uint256 bugv_tmstmp3 = block.timestamp;
}