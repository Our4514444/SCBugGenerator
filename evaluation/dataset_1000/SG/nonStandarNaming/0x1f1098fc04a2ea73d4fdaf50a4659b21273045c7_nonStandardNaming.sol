pragma solidity 0.5.5;

library SafeMath {
                                                                                
    function MUL471(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                         
    function DIV356(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0);
        uint256 c = a / b;

        return c;
    }

                                                                                                                            
    function SUB774(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD751(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD462(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

contract IERC20 {
    function TRANSFER7(address to, uint256 value) public returns (bool) {}	//inject NONSTANDARD NAMING
}

contract CurrentKing {
  using SafeMath for uint256;

  // initialize
  uint256 public REWARD_PER_WIN = 10000000;
  uint256 public CREATOR_REWARD = 100000;
  address public CREATOR_ADDRESS;
  address public GTT_ADDRESS;

  // game state params
  uint256 public lastPaidBlock;
  address public currentKing;

  constructor() public {
    CREATOR_ADDRESS = msg.sender;
    lastPaidBlock = block.number;
    currentKing = address(this);
  }

  // can only be called once
  function SETTOKENADDRESS930(address _gttAddress) public {	//inject NONSTANDARD NAMING
    if (GTT_ADDRESS == address(0)) {
      GTT_ADDRESS = _gttAddress;
    }
  }

  function PLAY349() public {	//inject NONSTANDARD NAMING
    uint256 currentBlock = block.number;

    // pay old king
    if (currentBlock != lastPaidBlock) {
      PAYOUT347(currentBlock);

      // reinitialize
      lastPaidBlock = currentBlock;
    }

    // set new king
    currentKing = msg.sender;
  }

  function PAYOUT347(uint256 _currentBlock) internal {	//inject NONSTANDARD NAMING
    // calculate multiplier (# of unclaimed blocks)
    uint256 numBlocksToPayout = _currentBlock.SUB774(lastPaidBlock);

    IERC20(GTT_ADDRESS).TRANSFER7(currentKing, REWARD_PER_WIN.MUL471(numBlocksToPayout));
    IERC20(GTT_ADDRESS).TRANSFER7(CREATOR_ADDRESS, CREATOR_REWARD.MUL471(numBlocksToPayout));
  }
}