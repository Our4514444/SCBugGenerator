pragma solidity 0.5.7;

// ----------------------------------------------------------------------------
// 'GENES' CrowdsaleFiatBTC contract
//
// Symbol           : GENES
// Name             : Genesis Smart Coin
// Total supply     : 70,000,000,000.000000000000000000
// Contract supply  : 20,000,000,000.000000000000000000
// Decimals         : 18
//
// (c) ViktorZidenyk / Ltd Genesis World 2019. The MIT Licence.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}

// ----------------------------------------------------------------------------
// Address
// ----------------------------------------------------------------------------
library Address {
  function toAddress(bytes memory source) internal pure returns(address addr) {
    assembly { addr := mload(add(source,0x14)) }
    return addr;
  }

  function isNotContract(address addr) internal view returns(bool) {
    uint length;
    assembly { length := extcodesize(addr) }
    return length == 0;
  }
}

// ----------------------------------------------------------------------------
// Zero
// ----------------------------------------------------------------------------
library Zero {
  function requireNotZero(address addr) internal pure {
    require(addr != address(0), "require not zero address");
  }

  function requireNotZero(uint val) internal pure {
    require(val != 0, "require not zero value");
  }

  function notZero(address addr) internal pure returns(bool) {
    return !(addr == address(0));
  }

  function isZero(address addr) internal pure returns(bool) {
    return addr == address(0);
  }

  function isZero(uint a) internal pure returns(bool) {
    return a == 0;
  }

  function notZero(uint a) internal pure returns(bool) {
    return a != 0;
  }
}

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------

contract owned {
    address internal owner;
    address internal newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
	
    function acceptOwnership() public {
        require(msg.sender == newOwner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit OwnershipTransferred(owner, newOwner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        owner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        newOwner = address(0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}

interface token {
    function transfer(address receiver, uint256 amount) external;
}

contract preCrowdsaleFiatBTC is owned {
    
    // Library
    using SafeMath for uint;
    
    address internal saleAgent;
    token internal tokenReward;
    uint256 internal totalSalesTokens;
    
    mapping(address => uint256) internal balanceTokens;
    mapping(address => uint256) internal buyTokens;
    mapping(address => uint256) internal buyTokensBonus;
    mapping(address => uint256) internal bountyTokens;
    mapping(address => uint256) internal refTokens;
    
    bool fundingGoalReached = false;
    bool crowdsaleClosed = false;
    
    using Address for *;
    using Zero for *;

    event GoalReached(address recipient, uint256 totalAmountRaised);
    event FundTransfer(address backer, uint256 amount, bool isContribution);

    /**
     * Constructor
     *
     * Setup the owner
     */
    constructor(address _addressOfTokenUsedAsReward) public {
        tokenReward = token(_addressOfTokenUsedAsReward);
    }

	
	function setSaleAgent(address newSeleAgent) public onlyOwner {
        saleAgent = newSeleAgent;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
	
	function addTokens(address to, uint256 tokens) public {
        require(msg.sender == owner || msg.sender == saleAgent);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(!crowdsaleClosed);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceTokens[to] = balanceTokens[to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        buyTokens[to] = buyTokens[to].add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSalesTokens = totalSalesTokens.add(tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenReward.transfer(to, tokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function addTokensBonus(address to, uint256 buyToken, uint256 buyBonus) public {
        require(msg.sender == owner || msg.sender == saleAgent);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(!crowdsaleClosed);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceTokens[to] = balanceTokens[to].add(buyToken).add(buyBonus);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        buyTokens[to] = buyTokens[to].add(buyToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        buyTokensBonus[to] = buyTokensBonus[to].add(buyBonus);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSalesTokens = totalSalesTokens.add(buyToken).add(buyBonus);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenReward.transfer(to, buyToken.add(buyBonus));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function addBountyTokens(address to, uint256 bountyToken) public {
        require(msg.sender == owner || msg.sender == saleAgent);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(!crowdsaleClosed);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceTokens[to] = balanceTokens[to].add(bountyToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        bountyTokens[to] = bountyTokens[to].add(bountyToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSalesTokens = totalSalesTokens.add(bountyToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenReward.transfer(to, bountyToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function addTokensBonusRef(address to, uint256 buyToken, uint256 buyBonus, address referrerAddr, uint256 refToken) public {
        require(msg.sender == owner || msg.sender == saleAgent);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(!crowdsaleClosed);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceTokens[to] = balanceTokens[to].add(buyToken).add(buyBonus);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        buyTokens[to] = buyTokens[to].add(buyToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        buyTokensBonus[to] = buyTokensBonus[to].add(buyBonus);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSalesTokens = totalSalesTokens.add(buyToken).add(buyBonus);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenReward.transfer(to, buyToken.add(buyBonus));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        // Referral bonus
        balanceTokens[referrerAddr] = balanceTokens[referrerAddr].add(refToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        refTokens[referrerAddr] = refTokens[referrerAddr].add(refToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSalesTokens = totalSalesTokens.add(refToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        tokenReward.transfer(referrerAddr, refToken);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    /// @notice Send all tokens to Owner after ICO
    function sendAllTokensToOwner(uint256 _revardTokens) onlyOwner public {
        tokenReward.transfer(owner, _revardTokens);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}