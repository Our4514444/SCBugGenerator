pragma solidity 0.5.5;

contract IERC20 {
    function transfer(address to, uint256 value) public returns (bool) {}
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
}

contract Auction {

function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public REWARD_PER_WIN = 625000000;
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public CREATOR_REWARD = 6250000;
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  address public CREATOR_ADDRESS;
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  address public GTT_ADDRESS;

function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  address public currWinner;   // winner
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public currHighest;  // highest bet
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public lastHighest;  // last highest bet
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public lastAuctionStart;

  constructor() public {
    CREATOR_ADDRESS = msg.sender;
    lastAuctionStart = block.number;
    currWinner = address(this);
  }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

  // can only be called once
  function setTokenAddress(address _gttAddress) public {
    if (GTT_ADDRESS == address(0)) {
      GTT_ADDRESS = _gttAddress;
    }
  }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

  function play() public payable {
    uint256 currentBlock = block.number;

    // pay out last block's winnings
    if (lastAuctionStart < currentBlock - 50) {
      payOut();

      // reset state for new auction
      lastAuctionStart = currentBlock;
      currWinner = address(this);
      lastHighest = currHighest;
      currHighest = 0;
    }

    // log winning tx
    if (msg.sender.balance > currHighest) {
      currHighest = msg.sender.balance;
      currWinner = msg.sender;
    }
  }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

  function payOut() internal {
    IERC20(GTT_ADDRESS).transfer(currWinner, REWARD_PER_WIN);
    IERC20(GTT_ADDRESS).transfer(CREATOR_ADDRESS, CREATOR_REWARD);
  }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}