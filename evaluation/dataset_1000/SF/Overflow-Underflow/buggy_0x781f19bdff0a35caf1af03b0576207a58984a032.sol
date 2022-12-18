/**
 *Submitted for verification at Etherscan.io on 2020-05-16
*/

pragma solidity ^0.5.0;


interface IGasToken {
    function freeFromUpTo(address from, uint256 value) external returns (uint256 freed);
}


contract GasDiscountDeployer {
    IGasToken public constant gasToken = IGasToken(0x0000000000b3F879cb30FE243b4Dfee438691c04);

    modifier makeGasDiscount {
        uint256 gasStart = gasleft();
        _;
        uint256 gasSpent = gasStart - gasleft() + 66 * msg.data.length;
        gasToken.freeFromUpTo(msg.sender, (gasSpent + 14154) / 41130);
    }

    function deploy(bytes memory data) public returns(address contractAddress) {
        assembly {
            contractAddress := create(0, add(data, 32), mload(data))
        }
    }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
    
    function deploy2(uint256 salt, bytes memory data) public returns(address contractAddress) {
        assembly {
            contractAddress := create2(0, add(data, 32), mload(data), salt)
        }
    }
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
}