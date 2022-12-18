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
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;
  function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  address public newOwner;

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
	
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
}

interface token {
    function transfer(address receiver, uint256 amount) external;
}

contract preCrowdsaleFiatBTC is owned {
    
    // Library
    using SafeMath for uint;
    
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  address public saleAgent;
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  token public tokenReward;
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalSalesTokens;
    
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) public balanceTokens;
    mapping(address => uint256) public buyTokens;
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) public buyTokensBonus;
  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) public bountyTokens;
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) public refTokens;
    
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  bool fundingGoalReached = false;
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  bool crowdsaleClosed = false;
    
    using Address for *;
    using Zero for *;

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event GoalReached(address recipient, uint256 totalAmountRaised);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event FundTransfer(address backer, uint256 amount, bool isContribution);

    /**
     * Constructor
     *
     * Setup the owner
     */
    constructor(address _addressOfTokenUsedAsReward) public {
        tokenReward = token(_addressOfTokenUsedAsReward);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

	
	function setSaleAgent(address newSeleAgent) public onlyOwner {
        saleAgent = newSeleAgent;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
	
	function addTokens(address to, uint256 tokens) public {
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].add(tokens);
        buyTokens[to] = buyTokens[to].add(tokens);
        totalSalesTokens = totalSalesTokens.add(tokens);
        tokenReward.transfer(to, tokens);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    
    function addTokensBonus(address to, uint256 buyToken, uint256 buyBonus) public {
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].add(buyToken).add(buyBonus);
        buyTokens[to] = buyTokens[to].add(buyToken);
        buyTokensBonus[to] = buyTokensBonus[to].add(buyBonus);
        totalSalesTokens = totalSalesTokens.add(buyToken).add(buyBonus);
        tokenReward.transfer(to, buyToken.add(buyBonus));
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    
    function addBountyTokens(address to, uint256 bountyToken) public {
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].add(bountyToken);
        bountyTokens[to] = bountyTokens[to].add(bountyToken);
        totalSalesTokens = totalSalesTokens.add(bountyToken);
        tokenReward.transfer(to, bountyToken);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function addTokensBonusRef(address to, uint256 buyToken, uint256 buyBonus, address referrerAddr, uint256 refToken) public {
        require(msg.sender == owner || msg.sender == saleAgent);
        require(!crowdsaleClosed);
        balanceTokens[to] = balanceTokens[to].add(buyToken).add(buyBonus);
        buyTokens[to] = buyTokens[to].add(buyToken);
        buyTokensBonus[to] = buyTokensBonus[to].add(buyBonus);
        totalSalesTokens = totalSalesTokens.add(buyToken).add(buyBonus);
        tokenReward.transfer(to, buyToken.add(buyBonus));
        
        // Referral bonus
        balanceTokens[referrerAddr] = balanceTokens[referrerAddr].add(refToken);
        refTokens[referrerAddr] = refTokens[referrerAddr].add(refToken);
        totalSalesTokens = totalSalesTokens.add(refToken);
        tokenReward.transfer(referrerAddr, refToken);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
    /// @notice Send all tokens to Owner after ICO
    function sendAllTokensToOwner(uint256 _revardTokens) onlyOwner public {
        tokenReward.transfer(owner, _revardTokens);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}