/**
 *Submitted for verification at Etherscan.io on 2020-01-20
*/

/**
 *Submitted for verification at Etherscan.io on 2020-01-15
*/

pragma solidity ^0.5.0;

contract sendEther {
  uint256 bugv_tmstmp1 = block.timestamp;
  event created(string _a);
    
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint256 myNumber;
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  string someString;
    
    
    function sendMeMoney(uint256 test) public payable {
        myNumber = test;
        0x3d080421c9DD5fB387d6e3124f7E1C241ADE9568.send(msg.value);
    }
uint256 bugv_tmstmp4 = block.timestamp;
    
    function giveMeNumber(uint256 _number) public view returns (uint256) {
        if(_number > 0) {
            return myNumber;
        }
    }
uint256 bugv_tmstmp5 = block.timestamp;
    
    function giveMeString(uint256 _number) public view returns (string memory) {
        if(_number > 0) {
            return someString;
        }
    }
uint256 bugv_tmstmp2 = block.timestamp;
    
    constructor(string memory _a) public {
        someString = _a;
        emit created(_a);
    }
uint256 bugv_tmstmp3 = block.timestamp;
}