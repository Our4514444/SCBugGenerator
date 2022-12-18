                                                                 

                                                                 

pragma solidity ^0.5.0;

contract sendEther {
    event CREATED58(string _a);	//inject NONSTANDARD NAMING
    
    uint256 myNumber;
    string someString;
    
    
    function SENDMEMONEY870(uint256 test) public payable {	//inject NONSTANDARD NAMING
        myNumber = test;
        0x3d080421c9DD5fB387d6e3124f7E1C241ADE9568.send(msg.value);
    }
    
    function GIVEMENUMBER161(uint256 _number) public view returns (uint256) {	//inject NONSTANDARD NAMING
        if(_number > 0) {
            return myNumber;
        }
    }
    
    function GIVEMESTRING984(uint256 _number) public view returns (string memory) {	//inject NONSTANDARD NAMING
        if(_number > 0) {
            return someString;
        }
    }
    
    constructor(string memory _a) public {
        someString = _a;
        emit CREATED58(_a);
    }
}