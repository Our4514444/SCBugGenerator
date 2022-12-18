pragma solidity 0.5.5;

contract IERC20 {
    function TRANSFER57(address to, uint256 value) public returns (bool) {}	//inject NONSTANDARD NAMING
}

contract Auction {

  uint256 public REWARD_PER_WIN = 625000000;
  uint256 public CREATOR_REWARD = 6250000;
  address public CREATOR_ADDRESS;
  address public GTT_ADDRESS;

  address public currWinner;   // winner
  uint256 public currHighest;  // highest bet
  uint256 public lastHighest;  // last highest bet
  uint256 public lastAuctionStart;

  constructor() public {
    CREATOR_ADDRESS = msg.sender;
    lastAuctionStart = block.number;
    currWinner = address(this);
  }

  // can only be called once
  function SETTOKENADDRESS580(address _gttAddress) public {	//inject NONSTANDARD NAMING
    if (GTT_ADDRESS == address(0)) {
      GTT_ADDRESS = _gttAddress;
    }
  }

  function PLAY298() public payable {	//inject NONSTANDARD NAMING
    uint256 currentBlock = block.number;

    // pay out last block's winnings
    if (lastAuctionStart < currentBlock - 50) {
      PAYOUT55();

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

  function PAYOUT55() internal {	//inject NONSTANDARD NAMING
    IERC20(GTT_ADDRESS).TRANSFER57(currWinner, REWARD_PER_WIN);
    IERC20(GTT_ADDRESS).TRANSFER57(CREATOR_ADDRESS, CREATOR_REWARD);
  }
}