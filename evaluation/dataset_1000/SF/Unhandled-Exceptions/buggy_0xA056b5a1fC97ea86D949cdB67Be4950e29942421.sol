/**
 *Submitted for verification at Etherscan.io on 2020-09-24
*/

pragma solidity 0.5.17;
pragma experimental ABIEncoderV2;


interface UniswapRouter {
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
}

contract Pricing {
    UniswapRouter public constant unirouter = UniswapRouter(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);

    struct RouteInfo {
        address[] routesList;
    }

    function getAmountsOutMulti(uint[] memory inAmounts, RouteInfo[] memory routeInfos) public view returns (uint[] memory amountsOut) {
        require(inAmounts.length == routeInfos.length, "wrong size");
        amountsOut = new uint[](inAmounts.length);
        for (uint256 i = 0; i < inAmounts.length; i++) {
            uint[] memory ret = unirouter.getAmountsOut(inAmounts[i], routeInfos[i].routesList);
            amountsOut[i] = ret[ret.length - 1];
        }
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}