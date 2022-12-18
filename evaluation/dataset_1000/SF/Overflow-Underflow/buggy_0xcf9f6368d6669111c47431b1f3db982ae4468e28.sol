/**
 *Submitted for verification at Etherscan.io on 2020-10-31
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.5.17;

interface IKeep3rV1 {
    function isKeeper(address) external returns (bool);
    function worked(address keeper) external;
}

interface ISushiswapV2Factory {
    function allPairsLength() external view returns (uint);
    function allPairs(uint) external view returns (address pair);
}

interface ISushiswapV2Pair {
    function token0() external view returns (address);
    function token1() external view returns (address);
    function balanceOf(address account) external view returns (uint);
}

interface ISushiswapV2Maker {
    function convert(address token0, address token1) external;
}

contract SushiswapV2Keep3r {
    
    modifier upkeep() {
        require(KP3R.isKeeper(msg.sender), "SushiswapV2Keep3r::isKeeper: keeper is not registered");
        _;
        KP3R.worked(msg.sender);
    }
    
    IKeep3rV1 public constant KP3R = IKeep3rV1(0x1cEB5cB57C4D4E2b2433641b95Dd330A33185A44);
    ISushiswapV2Factory public constant SV2F = ISushiswapV2Factory(0xC0AEe478e3658e2610c5F7A4A2E1777cE9e4f2Ac);
    ISushiswapV2Maker public constant SV2M = ISushiswapV2Maker(0x6684977bBED67e101BB80Fc07fCcfba655c0a64F);
    
    function count() public view returns (uint) {
        uint _count = 0;
        for (uint i = 0; i < SV2F.allPairsLength(); i++) {
            if (haveBalance(SV2F.allPairs(i))) {
                _count++;
            }
        }
        return _count;
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function workableAll(uint _count) external view returns (address[] memory) {
        return (workable(_count, 0, SV2F.allPairsLength()));
    }
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
    
    function workable(uint _count, uint start, uint end) public view returns (address[] memory) {
        address[] memory _workable = new address[](_count);
        uint index = 0;
        for (uint i = start; i < end; i++) {
            if (haveBalance(SV2F.allPairs(i))) {
                _workable[index] = SV2F.allPairs(i);
                index++;
            }
        }
        return _workable;
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
    
    function haveBalance(address pair) public view returns (bool) {
        return ISushiswapV2Pair(pair).balanceOf(address(SV2M)) > 0;
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function batch(ISushiswapV2Pair[] calldata pair) external {
        bool _worked = true;
        for (uint i = 0; i < pair.length; i++) {
            if (haveBalance(address(pair[i]))) {
                (bool success, bytes memory message) = address(SV2M).delegatecall(abi.encodeWithSignature("convert(address,address)", pair[i].token0(), pair[i].token1()));
                require(success, string(abi.encodePacked("SushiswapV2Keep3r::convert: failed [", message, "]")));
            } else {
                _worked = false;
            }
        }
        require(_worked, "SushiswapV2Keep3r::batch: job(s) failed");
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
    
    function work(ISushiswapV2Pair pair) external {
        require(haveBalance(address(pair)), "SushiswapV2Keep3r::work: invalid pair");
        (bool success, bytes memory message) = address(SV2M).delegatecall(abi.encodeWithSignature("convert(address,address)", pair.token0(), pair.token1()));
        require(success,  string(abi.encodePacked("SushiswapV2Keep3r::convert: failed [", message, "]")));
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