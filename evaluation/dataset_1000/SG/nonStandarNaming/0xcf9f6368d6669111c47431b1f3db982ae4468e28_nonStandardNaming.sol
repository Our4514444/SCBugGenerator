                                                                 

// SPDX-License-Identifier: MIT
pragma solidity ^0.5.17;

interface IKeep3rV1 {
    function ISKEEPER408(address) external returns (bool);	//inject NONSTANDARD NAMING
    function WORKED879(address keeper) external;	//inject NONSTANDARD NAMING
}

interface ISushiswapV2Factory {
    function ALLPAIRSLENGTH637() external view returns (uint);	//inject NONSTANDARD NAMING
    function ALLPAIRS803(uint) external view returns (address pair);	//inject NONSTANDARD NAMING
}

interface ISushiswapV2Pair {
    function TOKEN0193() external view returns (address);	//inject NONSTANDARD NAMING
    function TOKEN154() external view returns (address);	//inject NONSTANDARD NAMING
    function BALANCEOF195(address account) external view returns (uint);	//inject NONSTANDARD NAMING
}

interface ISushiswapV2Maker {
    function CONVERT493(address token0, address token1) external;	//inject NONSTANDARD NAMING
}

contract SushiswapV2Keep3r {
    
    modifier UPKEEP388() {	//inject NONSTANDARD NAMING
        require(kp3r558.ISKEEPER408(msg.sender), "SushiswapV2Keep3r::isKeeper: keeper is not registered");
        _;
        kp3r558.WORKED879(msg.sender);
    }
    
    IKeep3rV1 public constant kp3r558 = IKeep3rV1(0x1cEB5cB57C4D4E2b2433641b95Dd330A33185A44);	//inject NONSTANDARD NAMING
    ISushiswapV2Factory public constant sv2f635 = ISushiswapV2Factory(0xC0AEe478e3658e2610c5F7A4A2E1777cE9e4f2Ac);	//inject NONSTANDARD NAMING
    ISushiswapV2Maker public constant sv2m373 = ISushiswapV2Maker(0x6684977bBED67e101BB80Fc07fCcfba655c0a64F);	//inject NONSTANDARD NAMING
    
    function COUNT393() public view returns (uint) {	//inject NONSTANDARD NAMING
        uint _count = 0;
        for (uint i = 0; i < sv2f635.ALLPAIRSLENGTH637(); i++) {
            if (HAVEBALANCE793(sv2f635.ALLPAIRS803(i))) {
                _count++;
            }
        }
        return _count;
    }
    
    function WORKABLEALL940(uint _count) external view returns (address[] memory) {	//inject NONSTANDARD NAMING
        return (WORKABLE960(_count, 0, sv2f635.ALLPAIRSLENGTH637()));
    }
    
    function WORKABLE960(uint _count, uint start, uint end) public view returns (address[] memory) {	//inject NONSTANDARD NAMING
        address[] memory _workable = new address[](_count);
        uint index = 0;
        for (uint i = start; i < end; i++) {
            if (HAVEBALANCE793(sv2f635.ALLPAIRS803(i))) {
                _workable[index] = sv2f635.ALLPAIRS803(i);
                index++;
            }
        }
        return _workable;
    }
    
    function HAVEBALANCE793(address pair) public view returns (bool) {	//inject NONSTANDARD NAMING
        return ISushiswapV2Pair(pair).BALANCEOF195(address(sv2m373)) > 0;
    }
    
    function BATCH223(ISushiswapV2Pair[] calldata pair) external {	//inject NONSTANDARD NAMING
        bool _worked = true;
        for (uint i = 0; i < pair.length; i++) {
            if (HAVEBALANCE793(address(pair[i]))) {
                (bool success, bytes memory message) = address(sv2m373).delegatecall(abi.encodeWithSignature("convert(address,address)", pair[i].TOKEN0193(), pair[i].TOKEN154()));
                require(success, string(abi.encodePacked("SushiswapV2Keep3r::convert: failed [", message, "]")));
            } else {
                _worked = false;
            }
        }
        require(_worked, "SushiswapV2Keep3r::batch: job(s) failed");
    }
    
    function WORK509(ISushiswapV2Pair pair) external {	//inject NONSTANDARD NAMING
        require(HAVEBALANCE793(address(pair)), "SushiswapV2Keep3r::work: invalid pair");
        (bool success, bytes memory message) = address(sv2m373).delegatecall(abi.encodeWithSignature("convert(address,address)", pair.TOKEN0193(), pair.TOKEN154()));
        require(success,  string(abi.encodePacked("SushiswapV2Keep3r::convert: failed [", message, "]")));
    }
}