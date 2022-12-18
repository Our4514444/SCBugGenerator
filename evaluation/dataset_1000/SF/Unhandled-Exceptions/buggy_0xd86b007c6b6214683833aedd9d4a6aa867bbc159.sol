/**
 *Submitted for verification at Etherscan.io on 2020-06-03
*/

pragma solidity 0.5.17; // optimization runs: 200, evm version: istanbul


interface IERC20 {
    function transfer(address, uint256) external returns (bool);
    function approve(address, uint256) external returns (bool);
    function balanceOf(address) external view returns (uint256);
    function allowance(address, address) external view returns (uint256);
}


/// @notice This contract serves as an isolated execution environment for
/// performing Eth-to-ERC20, ERC20-to-Eth, and ERC20-to-ERC20 trades in a
/// manner that does not require the initiating account to issue any ERC20
/// approvals. DO NOT approve *this* contract, as anyone will be able to
/// steal the approved tokens. Instead, transfer in the tokens and call
/// `tradeERC20ForEth` or `tradeERC20ForERC20` to swap for the respective
/// asset (obviously, these steps must be performed atomically). For
/// Eth-to-ERC20, simply supply ether with the call to `tradeEthForERC20`.
/// Be sure to include a parameter with the expected amount - this serves
/// as a minimum that the contract must be able to return at the end of
/// the swap, reverting if the received amount is insufficient.
/// @author 0age
contract ApprovalBufferV1 {
    /**
    * @notice Accept Ether in the fallback.
    */
    function () external payable {}
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    
    /// @notice target is the dex to call and data is the payload
    function tradeEthForERC20(
        IERC20 tokenToReceive,
        uint256 tokenAmountExpected,
        address payable target,
        bytes calldata data
    ) external payable returns (uint256 tokenAmountReceived) {
        // Call into the provided target, supplying ETH and data.
        (bool ok,) = target.call.value(address(this).balance)(data);
        
        // Revert with reason if the call was not successful.
        _revertOnFailure(ok);
        
        // Determine the total token balance of this contract.
        tokenAmountReceived = tokenToReceive.balanceOf(address(this));
        
        // Ensure that enough tokens were received.
        require(
            tokenAmountReceived >= tokenAmountExpected,
            "Trade did not result in the expected amount of tokens."
        );
        
        // Transfer the tokens to the caller and revert on failure.
        ok = (tokenToReceive.transfer(msg.sender, tokenAmountReceived));
        require(ok, "ERC20 transfer out failed.");
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

    /// @notice target is the dex to call and data is the payload
    function tradeERC20ForEth(
        IERC20 tokenToGive,
        uint256 ethExpected,
        address target,
        bytes calldata data
    ) external returns (uint256 ethReceived) {
        // Ensure that target has allowance to transfer tokens.
        if (tokenToGive.allowance(address(this), target) != uint256(-1)) {
            tokenToGive.approve(target, uint256(-1));
        }
        
        // Call into the provided target, providing data.
        (bool ok,) = target.call(data);
        
        // Revert with reason if the call was not successful.
        _revertOnFailure(ok);
        
        // Determine the total Ether balance of this contract.
        ethReceived = address(this).balance;

        // Ensure that enough Ether was received.
        require(
            ethReceived >= ethExpected,
            "Trade did not result in the expected amount of Ether."
        );
   
        // Transfer the Ether to the caller and revert on failure.
        (ok, ) = msg.sender.call.gas(4999).value(ethReceived)("");

        // Revert with reason if the call was not successful.
        _revertOnFailure(ok);
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

    /// @notice target is the dex to call and data is the payload
    function tradeERC20ForERC20(
        IERC20 tokenToGive,
        IERC20 tokenToReceive,
        uint256 tokenAmountExpected,
        address payable target,
        bytes calldata data
    ) external payable returns (uint256 tokenAmountReceived) {
        // Ensure that target has allowance to transfer tokens.
        if (tokenToGive.allowance(address(this), target) != uint256(-1)) {
            tokenToGive.approve(target, uint256(-1));
        }
        
        // Call into the provided target, providing data.
        (bool ok,) = target.call(data);
        
        // Revert with reason if the call was not successful.
        _revertOnFailure(ok);
        
        // Determine the total token balance of this contract.
        tokenAmountReceived = tokenToReceive.balanceOf(address(this));
        
        // Ensure that enough tokens were received.
        require(
            tokenAmountReceived >= tokenAmountExpected,
            "Trade did not result in the expected amount of tokens."
        );
        
        // Transfer the tokens to the caller and revert on failure.
        ok = (tokenToReceive.transfer(msg.sender, tokenAmountReceived));
        require(ok, "ERC20 transfer out failed.");
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

    /// @notice pass along revert reasons on external calls.
    function _revertOnFailure(bool ok) internal pure {
        if (!ok) {
            assembly {
                returndatacopy(0, 0, returndatasize)
                revert(0, returndatasize)
            }
        }
    }
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
}