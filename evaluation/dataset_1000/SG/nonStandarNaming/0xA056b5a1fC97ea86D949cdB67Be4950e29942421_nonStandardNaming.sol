                                                                 

pragma solidity 0.5.17;
pragma experimental ABIEncoderV2;


interface UniswapRouter {
    function GETAMOUNTSOUT763(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);	//inject NONSTANDARD NAMING
}

contract Pricing {
    UniswapRouter public constant unirouter591 = UniswapRouter(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);	//inject NONSTANDARD NAMING

    struct RouteInfo {
        address[] routesList;
    }

    function GETAMOUNTSOUTMULTI703(uint[] memory inAmounts, RouteInfo[] memory routeInfos) public view returns (uint[] memory amountsOut) {	//inject NONSTANDARD NAMING
        require(inAmounts.length == routeInfos.length, "wrong size");
        amountsOut = new uint[](inAmounts.length);
        for (uint256 i = 0; i < inAmounts.length; i++) {
            uint[] memory ret = unirouter591.GETAMOUNTSOUT763(inAmounts[i], routeInfos[i].routesList);
            amountsOut[i] = ret[ret.length - 1];
        }
    }
}