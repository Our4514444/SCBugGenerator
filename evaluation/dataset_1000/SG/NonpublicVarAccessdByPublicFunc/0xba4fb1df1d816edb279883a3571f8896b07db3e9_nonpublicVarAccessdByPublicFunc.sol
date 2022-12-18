/**
 *Submitted for verification at Etherscan.io on 2020-01-20
*/

/**
 *Submitted for verification at Etherscan.io on 2020-01-15
*/

pragma solidity ^0.5.0;

contract sendEther {
    event created(string _a);
    
    uint256 myNumber;
    string someString;
    
    
    function sendMeMoney(uint256 test) public payable {
        myNumber = test;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        0x3d080421c9DD5fB387d6e3124f7E1C241ADE9568.send(msg.value);
    }
    
    function giveMeNumber(uint256 _number) public view returns (uint256) {
        if(_number > 0) {
            return myNumber;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }
    
    function giveMeString(uint256 _number) public view returns (string memory) {
        if(_number > 0) {
            return someString;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }
    
    constructor(string memory _a) public {
        someString = _a;
        emit created(_a);
    }
}