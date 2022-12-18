                                                                 

// SPDX-License-Identifier: MIT

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY686() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF617(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER956(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE354(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE891(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM301(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER805(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL397(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

interface MasterChef {
    function USERINFO268(uint, address) external view returns (uint, uint);	//inject NONSTANDARD NAMING
}

contract SushiVoterProxy {
    
    IERC20 public constant votes827 = IERC20(0xCE84867c3c02B05dc570d0135103d3fB9CC19433);	//inject NONSTANDARD NAMING
    MasterChef public constant chef502 = MasterChef(0xc2EdaD668740f1aA35E4D8f227fB8E17dcA888Cd);	//inject NONSTANDARD NAMING
    uint public constant pool896 = uint(12);	//inject NONSTANDARD NAMING
    
    function TOTALSUPPLY686() external view returns (uint) {	//inject NONSTANDARD NAMING
        return votes827.TOTALSUPPLY686();
    }
    
    function BALANCEOF617(address _voter) external view returns (uint) {	//inject NONSTANDARD NAMING
        (uint _votes,) = chef502.USERINFO268(pool896, _voter);
        return _votes;
    }
    
    constructor() public {}
}