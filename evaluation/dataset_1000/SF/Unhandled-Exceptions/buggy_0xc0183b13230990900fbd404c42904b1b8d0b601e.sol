pragma solidity "0.5.1";

/* =========================================================================================================*/
// ----------------------------------------------------------------------------
// 'eden.best' token contract
//
// Symbol      : EDE
// Name        : eden.best
// Total supply: 450000000
// Decimals    : 0
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
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;
    address public newOwner;

  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event OwnershipTransferred(address indexed _from, address indexed _to);

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
}

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function totalSupply() public view returns (uint);
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function balanceOf(address tokenOwner) public view returns (uint balance);
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function transfer(address to, uint tokens) public returns (bool success);
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
    function approve(address spender, uint tokens) public returns (bool success);
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event Transfer(address indexed from, address indexed to, uint tokens);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals and assisted
// token transfers
// ----------------------------------------------------------------------------
contract EDE is ERC20Interface, Owned {
    using SafeMath for uint;

    string public symbol;
  function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
  string public  name;
  function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  uint8 public decimals;
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  uint public _totalSupply;
  function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint private _teamsTokens;
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  uint private _reserveTokens;
  bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  uint256 public fundsRaised;
  function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
  uint private maximumCap;
  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  address payable wallet;
  function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
  address [] holders;

  function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  uint256 private presaleopeningtime;
  function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256 private firstsaleopeningtime;
  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint256 private secondsaleopeningtime;
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  uint256 private secondsaleclosingtime;
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

	string public HardCap;function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

	string public SoftCap;


  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  mapping(address => uint) balances;
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  mapping(address => bool) whitelist;
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  mapping(address => mapping(address => uint)) allowed;

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

    modifier onlyWhileOpen {
        require((now >= presaleopeningtime && now <= secondsaleclosingtime) && fundsRaised != maximumCap); // should be open
        _;
    }

    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    constructor() public {
        symbol = "EDE";
        name = "eden.best";
        decimals = 0;
        _totalSupply = 45e7;
        balances[address(this)] = 3375e5 * 10**uint(decimals); // 75% to ICO
        emit Transfer(address(0),address(this), 3375e5 * 10**uint(decimals));
        balances[address(0x687abe81c44c982394EED1b0Fc6911e5338A6421)] = 66150000 * 10**uint(decimals); // 14,7% to reserve
        emit Transfer(address(0),address(0x687abe81c44c982394EED1b0Fc6911e5338A6421), 66150000 * 10**uint(decimals));
        balances[address(0xd903846cF43aC9046CAE50C36ac1Aa18e630A1bB)] = 45000000 * 10**uint(decimals); // 10% to Team
        emit Transfer(address(0),address(0xd903846cF43aC9046CAE50C36ac1Aa18e630A1bB), 45000000 * 10**uint(decimals));
        balances[address(0x7341459eCdABC42C7493D923F5bb0992616d30A7)] = 1350000 * 10**uint(decimals); // 0,3% to airdrop
        emit Transfer(address(0),address(0x7341459eCdABC42C7493D923F5bb0992616d30A7), 1350000 * 10**uint(decimals));
        owner = address(0xEfA2CcE041aEB143678F8f310F3977F3EB61251E);
        wallet = address(0xEfA2CcE041aEB143678F8f310F3977F3EB61251E);
		    HardCap = "16875 ETH";
        SoftCap = "300 ETH";
        maximumCap = 16875000000000000000000; // 16875 eth, written in wei here
        presaleopeningtime = 1554120000; // 1st april 2019, 12pm
        firstsaleopeningtime = 1555329601; // 15 april 2019, 12:00:01pm
        secondsaleopeningtime = 1559304001; // 31 may 2019, 12:00:01pm
        secondsaleclosingtime = 1561896001; // 30 june 2019, 12:00:01pm
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    // ------------------------------------------------------------------------
    // Accepts ETH
    // ------------------------------------------------------------------------
    function () external payable {
        buyTokens(msg.sender);
    }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

    function buyTokens(address _beneficiary) public payable onlyWhileOpen {
        _preValidatePurchase(_beneficiary, msg.value);
        _continueTokenPurchase(_beneficiary, msg.value);
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal view{
        require(_beneficiary != address(0));
        require(_weiAmount != 0);
        require(_weiAmount >= 50000000000000000 && _weiAmount <= 1000000000000000000000); // min 0.05 ETH, max 1000 ETH
        require(whitelist[_beneficiary]);
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

    function _insertWhitelist(address[] memory _beneficiary) public onlyOwner{
        for(uint256 i = 0; i< _beneficiary.length; i++)
        {
            if(whitelist[_beneficiary[i]] == false)
                whitelist[_beneficiary[i]] = true;
        }
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function _continueTokenPurchase(address _beneficiary, uint256 _weiAmount) internal{
        uint256 _tokens = _getTokenAmount(_weiAmount).div(1e18);
        uint256 bonus = _calculateBonus();
        _tokens = _tokens.add((_tokens.mul(bonus.mul(100))).div(10000));

        fundsRaised = fundsRaised.add(_weiAmount);

        _processPurchase(_beneficiary, _tokens);

        wallet.transfer(_weiAmount);
        emit TokenPurchase(address(this), _beneficiary, _weiAmount, _tokens);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function _getTokenAmount(uint256 _weiAmount) internal pure returns (uint256) {
        uint256 rate = 2e4; // 1 eth = 20,000T
        return _weiAmount.mul(rate);
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    function _calculateBonus() internal view returns (uint256){
        if(now >= presaleopeningtime && now < firstsaleopeningtime){
            return 30;
        } else if(now >=firstsaleopeningtime && now <secondsaleopeningtime){
            return 20;
        } else if(now >= secondsaleopeningtime && now <secondsaleclosingtime){
            return 0;
        }
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function _processPurchase(address _beneficiary, uint256 _tokenAmount) internal {
        _deliverTokens(_beneficiary, _tokenAmount);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

    function _deliverTokens(address _beneficiary, uint256 _tokenAmount) internal {
        _transfer(_beneficiary, _tokenAmount);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    /*===========================================================*/

    function totalSupply() public view returns (uint){
       return _totalSupply* 10**uint(decimals);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    // ------------------------------------------------------------------------
    // Get the token balance for account `tokenOwner`
    // ------------------------------------------------------------------------
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        // prevent transfer to 0x0, use burn instead
        require(to != address(0));
        require(whitelist[to]);
        require(balances[msg.sender] >= tokens );
        require(balances[to] + tokens >= balances[to]);
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        if(balances[to] == 0)
            holders.push(to);
        balances[to] = balances[to].add(tokens);
        emit Transfer(msg.sender,to,tokens);
        return true;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account
    // ------------------------------------------------------------------------
    function approve(address spender, uint tokens) public returns (bool success){
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender,spender,tokens);
        return true;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    //
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the `from` account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens) public returns (bool success){
        require(tokens <= allowed[from][msg.sender]); //check allowance
        require(balances[from] >= tokens);
        require(whitelist[to]);
        balances[from] = balances[from].sub(tokens);
        if(balances[to] == 0)
            holders.push(to);
        balances[to] = balances[to].add(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        emit Transfer(from,to,tokens);
        return true;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    // ------------------------------------------------------------------------
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    // ------------------------------------------------------------------------
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    function _transfer(address to, uint tokens) internal returns (bool success) {
        // prevent transfer to 0x0, use burn instead
        require(to != address(0));
        require(balances[address(this)] >= tokens );
        require(balances[to] + tokens >= balances[to]);
        balances[address(this)] = balances[address(this)].sub(tokens);
        if(balances[to] == 0)
            holders.push(to);
        balances[to] = balances[to].add(tokens);
        emit Transfer(address(this),to,tokens);
        return true;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    function _hardCapNotReached() external onlyOwner {
        uint eightyPercent = (balances[address(this)].mul(80)).div(100); // 80% of remaining tokens
        uint twentyPercent = balances[address(this)].sub(eightyPercent); // 20% of remaining tokens
        uint share = eightyPercent.div(holders.length);

        for(uint i = 0; i<holders.length; i++ ){
            address holder = holders[i];
            balances[holder] = balances[holder].add(share);
            emit Transfer(address(this),holder,share);
        }

        balances[address(0x687abe81c44c982394EED1b0Fc6911e5338A6421)] = twentyPercent;
        emit Transfer(address(this),address(0x687abe81c44c982394EED1b0Fc6911e5338A6421),twentyPercent);

        balances[address(this)] = 0;



    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
}