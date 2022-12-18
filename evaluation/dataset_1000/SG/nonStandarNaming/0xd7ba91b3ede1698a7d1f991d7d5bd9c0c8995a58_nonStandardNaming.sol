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
    function ADD137(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }
    function SUB578(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a);
        c = a - b;
    }
    function MUL971(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function DIV754(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b > 0);
        c = a / b;
    }
}

// ----------------------------------------------------------------------------
// Address
// ----------------------------------------------------------------------------
library Address {
  function TOADDRESS393(bytes memory source) internal pure returns(address addr) {	//inject NONSTANDARD NAMING
    assembly { addr := mload(add(source,0x14)) }
    return addr;
  }

  function ISNOTCONTRACT561(address addr) internal view returns(bool) {	//inject NONSTANDARD NAMING
    uint length;
    assembly { length := extcodesize(addr) }
    return length == 0;
  }
}

// ----------------------------------------------------------------------------
// Zero
// ----------------------------------------------------------------------------
library Zero {
  function REQUIRENOTZERO405(address addr) internal pure {	//inject NONSTANDARD NAMING
    require(addr != address(0), "require not zero address");
  }

  function REQUIRENOTZERO405(uint val) internal pure {	//inject NONSTANDARD NAMING
    require(val != 0, "require not zero value");
  }

  function NOTZERO824(address addr) internal pure returns(bool) {	//inject NONSTANDARD NAMING
    return !(addr == address(0));
  }

  function ISZERO67(address addr) internal pure returns(bool) {	//inject NONSTANDARD NAMING
    return addr == address(0);
  }

  function ISZERO67(uint a) internal pure returns(bool) {	//inject NONSTANDARD NAMING
    return a == 0;
  }

  function NOTZERO824(uint a) internal pure returns(bool) {	//inject NONSTANDARD NAMING
    return a != 0;
  }
}

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------

contract owned {
    address public owner;
    address public newOwner;

    event OWNERSHIPTRANSFERRED494(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER772 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    function TRANSFEROWNERSHIP981(address _newOwner) public ONLYOWNER772 {	//inject NONSTANDARD NAMING
        newOwner = _newOwner;
    }
	
    function ACCEPTOWNERSHIP485() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwner);
        emit OWNERSHIPTRANSFERRED494(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}

interface token {
    function TRANSFER946(address receiver, uint256 amount) external;	//inject NONSTANDARD NAMING
}

contract preCrowdsaleFiatBTC is owned {
    
    // Library
    using SafeMath for uint;
    
    address public saleAgent;
    token public tokenReward;
    uint256 public totalSalesTokens;
    
    mapping(address => uint256) public balanceTokens;
    mapping(address => uint256) public buyTokens;
    mapping(address => uint256) public buyTokensBonus;
    mapping(address => uint256) public bountyTokens;
    mapping(address => uint256) public refTokens;
    
    bool fundingGoalReached = false;
    bool crowdsaleClosed = false;
    
    using Address for *;
    using Zero for *;

    event GOALREACHED155(address recipient, uint256 totalAmountRaised);	//inject NONSTANDARD NAMING
    event FUNDTRANSFER553(address backer, uint256 amount, bool isContribution);	//inject NONSTANDARD NAMING

                                                                
    constructor(address _addressOfTokenUsedAsReward) public {
        tokenReward = token(_addressOfTokenUsedAsReward);
    }

	
	function SETSALEAGENT725(address newSeleAgent) public ONLYOWNER772 {	//inject NONSTANDARD NAMING
        saleAgent = newSeleAgent;
    }
	
	function ADDTOKENS765(address to, uint256 tokens) public {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].ADD137(tokens);
        buyTokens[to] = buyTokens[to].ADD137(tokens);
        totalSalesTokens = totalSalesTokens.ADD137(tokens);
        tokenReward.TRANSFER946(to, tokens);
    }
    
    function ADDTOKENSBONUS405(address to, uint256 buyToken, uint256 buyBonus) public {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].ADD137(buyToken).ADD137(buyBonus);
        buyTokens[to] = buyTokens[to].ADD137(buyToken);
        buyTokensBonus[to] = buyTokensBonus[to].ADD137(buyBonus);
        totalSalesTokens = totalSalesTokens.ADD137(buyToken).ADD137(buyBonus);
        tokenReward.TRANSFER946(to, buyToken.ADD137(buyBonus));
    }
    
    function ADDBOUNTYTOKENS619(address to, uint256 bountyToken) public {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].ADD137(bountyToken);
        bountyTokens[to] = bountyTokens[to].ADD137(bountyToken);
        totalSalesTokens = totalSalesTokens.ADD137(bountyToken);
        tokenReward.TRANSFER946(to, bountyToken);
    }
    
    function ADDTOKENSBONUSREF894(address to, uint256 buyToken, uint256 buyBonus, address referrerAddr, uint256 refToken) public {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].ADD137(buyToken).ADD137(buyBonus);
        buyTokens[to] = buyTokens[to].ADD137(buyToken);
        buyTokensBonus[to] = buyTokensBonus[to].ADD137(buyBonus);
        totalSalesTokens = totalSalesTokens.ADD137(buyToken).ADD137(buyBonus);
        tokenReward.TRANSFER946(to, buyToken.ADD137(buyBonus));
        
        // Referral bonus
        balanceTokens[referrerAddr] = balanceTokens[referrerAddr].ADD137(refToken);
        refTokens[referrerAddr] = refTokens[referrerAddr].ADD137(refToken);
        totalSalesTokens = totalSalesTokens.ADD137(refToken);
        tokenReward.TRANSFER946(referrerAddr, refToken);
    }
    
                                                  
    function SENDALLTOKENSTOOWNER52(uint256 _revardTokens) ONLYOWNER772 public {	//inject NONSTANDARD NAMING
        tokenReward.TRANSFER946(owner, _revardTokens);
    }
}