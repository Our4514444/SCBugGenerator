pragma solidity 0.5.5;

contract IERC20 {
    function transfer(address to, uint256 value) public returns (bool) {}
}

contract Auction {

  uint256 public REWARD_PER_WIN = 625000000;
  uint256 public CREATOR_REWARD = 6250000;
  address public CREATOR_ADDRESS;
  address internal GTT_ADDRESS;

  address internal currWinner;   // winner
  uint256 internal currHighest;  // highest bet
  uint256 internal lastHighest;  // last highest bet
  uint256 internal lastAuctionStart;

  constructor() public {
    CREATOR_ADDRESS = msg.sender;
    lastAuctionStart = block.number;
    currWinner = address(this);
  }

  // can only be called once
  function setTokenAddress(address _gttAddress) public {
    if (GTT_ADDRESS == address(0)) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      GTT_ADDRESS = _gttAddress;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
  }

  function play() public payable {
    uint256 currentBlock = block.number;

    // pay out last block's winnings
    if (lastAuctionStart < currentBlock - 50) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      payOut();

      // reset state for new auction
      lastAuctionStart = currentBlock;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      currWinner = address(this);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      lastHighest = currHighest;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      currHighest = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    // log winning tx
    if (msg.sender.balance > currHighest) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      currHighest = msg.sender.balance;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      currWinner = msg.sender;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
  }

  function payOut() internal {
    IERC20(GTT_ADDRESS).transfer(currWinner, REWARD_PER_WIN);
    IERC20(GTT_ADDRESS).transfer(CREATOR_ADDRESS, CREATOR_REWARD);
  }
}