pragma solidity ^0.5.0;

/**
 * (E)t)h)e)x) Jackpot Contract 
 *  This smart-contract is the part of Ethex Lottery fair game.
 *  See latest version at https://github.com/ethex-bet/ethex-contracts 
 *  http://ethex.bet
 */

contract EthexJackpot {
    mapping(uint256 => address payable) public tickets;
    uint256 public numberEnd;
    uint256 public firstNumber;
    uint256 public dailyAmount;
    uint256 public weeklyAmount;
    uint256 public monthlyAmount;
    uint256 public seasonalAmount;
    bool public dailyProcessed;
    bool public weeklyProcessed;
    bool public monthlyProcessed;
    bool public seasonalProcessed;
  function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
  address payable private owner;
  function bug_unchk6() public{
uint receivers_unchk6;
address payable addr_unchk6;
if (!addr_unchk6.send(42 ether))
	{receivers_unchk6 +=1;}
else
	{revert();}
}
  address public lotoAddress;
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  address payable public newVersionAddress;
  function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  EthexJackpot previousContract;
  function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  uint256 public dailyNumberStartPrev;
  bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  uint256 public weeklyNumberStartPrev;
  function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
  uint256 public monthlyNumberStartPrev;
  function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  uint256 public seasonalNumberStartPrev;
  function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint256 public dailyStart;
  function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  uint256 public weeklyStart;
  function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256 public monthlyStart;
  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint256 public seasonalStart;
  function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  uint256 public dailyEnd;
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  uint256 public weeklyEnd;
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  uint256 public monthlyEnd;
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint256 public seasonalEnd;
    uint256 public dailyNumberStart;
    uint256 public weeklyNumberStart;
    uint256 public monthlyNumberStart;
    uint256 public seasonalNumberStart;
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  uint256 public dailyNumberEndPrev;
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  uint256 public weeklyNumberEndPrev;
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  uint256 public monthlyNumberEndPrev;
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint256 public seasonalNumberEndPrev;
    
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event Jackpot (
        uint256 number,
        uint256 count,
        uint256 amount,
        byte jackpotType
    );
    
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Ticket (
        bytes16 indexed id,
        uint256 number
    );
    
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event SuperPrize (
        uint256 amount,
        address winner
    );
    
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint256 constant DAILY = 5000;
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  uint256 constant WEEKLY = 35000;
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 constant MONTHLY = 150000;
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  uint256 constant SEASONAL = 450000;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 constant PRECISION = 1 ether;
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  uint256 constant DAILY_PART = 84;
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint256 constant WEEKLY_PART = 12;
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  uint256 constant MONTHLY_PART = 3;
    
    constructor() public payable {
        owner = msg.sender;
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
    
    function() external payable { }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    modifier onlyOwnerOrNewVersion {
        require(msg.sender == owner || msg.sender == newVersionAddress);
        _;
    }
    
    modifier onlyLoto {
        require(msg.sender == lotoAddress, "Loto only");
        _;
    }
    
    function migrate() external onlyOwnerOrNewVersion {
        newVersionAddress.transfer(address(this).balance);
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function registerTicket(bytes16 id, address payable gamer) external onlyLoto {
        uint256 number = numberEnd + 1;
        if (block.number >= dailyEnd) {
            setDaily();
            dailyNumberStart = number;
        }
        else
            if (dailyNumberStart == dailyNumberStartPrev)
                dailyNumberStart = number;
        if (block.number >= weeklyEnd) {
            setWeekly();
            weeklyNumberStart = number;
        }
        else
            if (weeklyNumberStart == weeklyNumberStartPrev)
                weeklyNumberStart = number;
        if (block.number >= monthlyEnd) {
            setMonthly();
            monthlyNumberStart = number;
        }
        else
            if (monthlyNumberStart == monthlyNumberStartPrev)
                monthlyNumberStart = number;
        if (block.number >= seasonalEnd) {
            setSeasonal();
            seasonalNumberStart = number;
        }
        else
            if (seasonalNumberStart == seasonalNumberStartPrev)
                seasonalNumberStart = number;
        numberEnd = number;
        tickets[number] = gamer;
        emit Ticket(id, number);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    function setLoto(address loto) external onlyOwner {
        lotoAddress = loto;
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    
    function setNewVersion(address payable newVersion) external onlyOwner {
        newVersionAddress = newVersion;
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    
    function payIn() external payable {
        uint256 distributedAmount = dailyAmount + weeklyAmount + monthlyAmount + seasonalAmount;
        if (distributedAmount < address(this).balance) {
            uint256 amount = (address(this).balance - distributedAmount) / 4;
            dailyAmount += amount;
            weeklyAmount += amount;
            monthlyAmount += amount;
            seasonalAmount += amount;
        }
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    
    function settleJackpot() external {
        if (block.number >= dailyEnd)
            setDaily();
        if (block.number >= weeklyEnd)
            setWeekly();
        if (block.number >= monthlyEnd)
            setMonthly();
        if (block.number >= seasonalEnd)
            setSeasonal();
        
        if (block.number == dailyStart || (dailyStart < block.number - 256))
            return;
        
        uint48 modulo = uint48(bytes6(blockhash(dailyStart) << 29));
        
        uint256 dailyPayAmount;
        uint256 weeklyPayAmount;
        uint256 monthlyPayAmount;
        uint256 seasonalPayAmount;
        uint256 dailyWin;
        uint256 weeklyWin;
        uint256 monthlyWin;
        uint256 seasonalWin;
        if (dailyProcessed == false) {
            dailyPayAmount = dailyAmount * PRECISION / DAILY_PART / PRECISION;
            dailyAmount -= dailyPayAmount;
            dailyProcessed = true;
            dailyWin = getNumber(dailyNumberStartPrev, dailyNumberEndPrev, modulo);
            emit Jackpot(dailyWin, dailyNumberEndPrev - dailyNumberStartPrev + 1, dailyPayAmount, 0x01);
        }
        if (weeklyProcessed == false) {
            weeklyPayAmount = weeklyAmount * PRECISION / WEEKLY_PART / PRECISION;
            weeklyAmount -= weeklyPayAmount;
            weeklyProcessed = true;
            weeklyWin = getNumber(weeklyNumberStartPrev, weeklyNumberEndPrev, modulo);
            emit Jackpot(weeklyWin, weeklyNumberEndPrev - weeklyNumberStartPrev + 1, weeklyPayAmount, 0x02);
        }
        if (monthlyProcessed == false) {
            monthlyPayAmount = monthlyAmount * PRECISION / MONTHLY_PART / PRECISION;
            monthlyAmount -= monthlyPayAmount;
            monthlyProcessed = true;
            monthlyWin = getNumber(monthlyNumberStartPrev, monthlyNumberEndPrev, modulo);
            emit Jackpot(monthlyWin, monthlyNumberEndPrev - monthlyNumberStartPrev + 1, monthlyPayAmount, 0x04);
        }
        if (seasonalProcessed == false) {
            seasonalPayAmount = seasonalAmount;
            seasonalAmount -= seasonalPayAmount;
            seasonalProcessed = true;
            seasonalWin = getNumber(seasonalNumberStartPrev, seasonalNumberEndPrev, modulo);
            emit Jackpot(seasonalWin, seasonalNumberEndPrev - seasonalNumberStartPrev + 1, seasonalPayAmount, 0x08);
        }
        if (dailyPayAmount > 0)
            tickets[dailyWin].transfer(dailyPayAmount);
        if (weeklyPayAmount > 0)
            tickets[weeklyWin].transfer(weeklyPayAmount);
        if (monthlyPayAmount > 0)
            tickets[monthlyWin].transfer(monthlyPayAmount);
        if (seasonalPayAmount > 0)
            tickets[seasonalWin].transfer(seasonalPayAmount);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    
    function settleSuperPrize(address payable winner) external onlyLoto {
        uint256 superPrizeAmount = dailyAmount + weeklyAmount + monthlyAmount + seasonalAmount;
        emit SuperPrize(superPrizeAmount, winner);
        winner.transfer(superPrizeAmount);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    
    function loadTickets(address payable[] calldata addresses, uint256[] calldata numbers) external {
        for (uint i = 0; i < addresses.length; i++)
            tickets[numbers[i]] = addresses[i];
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    
    function setOldVersion(
        address payable oldAddress,
        uint256 dailyNumberStartPrevIn,
        uint256 weeklyNumberStartPrevIn,
        uint256 monthlyNumberStartPrevIn,
        uint256 seasonalNumberStartPrevIn,
        uint256 dailyNumberStartIn,
        uint256 weeklyNumberStartIn,
        uint256 monthlyNumberStartIn,
        uint256 seasonalNumberStartIn,
        uint256 dailyNumberEndPrevIn,
        uint256 weeklyNumberEndPrevIn, 
        uint256 monthlyNumberEndPrevIn,
        uint256 seasonalNumberEndPrevIn
    ) external onlyOwner {
        previousContract = EthexJackpot(oldAddress);
        firstNumber = 1;//previousContract.numberEnd;        
        dailyStart = block.number / DAILY * DAILY;
        dailyEnd = dailyStart + DAILY;
        dailyProcessed = true;
        weeklyStart = block.number / WEEKLY * WEEKLY;
        weeklyEnd = weeklyStart + WEEKLY;
        weeklyProcessed = true;
        monthlyStart = block.number / MONTHLY * MONTHLY;
        monthlyEnd = monthlyStart + MONTHLY;
        monthlyProcessed = true;
        seasonalStart = block.number / SEASONAL * SEASONAL;
        seasonalEnd = seasonalStart + SEASONAL;
        seasonalProcessed = true;
        dailyNumberStartPrev = dailyNumberStartPrevIn;
        weeklyNumberStartPrev = weeklyNumberStartPrevIn;
        monthlyNumberStartPrev = monthlyNumberStartPrevIn;
        seasonalNumberStartPrev = seasonalNumberStartPrevIn;
        dailyNumberStart = dailyNumberStartIn;
        weeklyNumberStart = weeklyNumberStartIn;
        monthlyNumberStart = monthlyNumberStartIn;
        seasonalNumberStart = seasonalNumberStartIn;
        dailyNumberEndPrev = dailyNumberEndPrevIn;
        weeklyNumberEndPrev = weeklyNumberEndPrevIn;
        monthlyNumberEndPrev = monthlyNumberEndPrevIn;
        seasonalNumberEndPrev = seasonalNumberEndPrevIn;
        numberEnd = previousContract.numberEnd();
        dailyAmount = previousContract.dailyAmount();
        weeklyAmount = previousContract.weeklyAmount();
        monthlyAmount = previousContract.monthlyAmount();
        seasonalAmount = previousContract.seasonalAmount() + 19599522250000000000;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
    
    function getAddress(uint256 number) public returns (address payable) {
        if (number <= firstNumber)
            return previousContract.getAddress(number);
        return tickets[number];
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    
    function setDaily() private {
        dailyProcessed = dailyNumberEndPrev == numberEnd;
        dailyStart = dailyEnd;
        dailyEnd = dailyStart + DAILY;
        dailyNumberStartPrev = dailyNumberStart;
        dailyNumberEndPrev = numberEnd;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    
    function setWeekly() private {
        weeklyProcessed = weeklyNumberEndPrev == numberEnd;
        weeklyStart = weeklyEnd;
        weeklyEnd = weeklyStart + WEEKLY;
        weeklyNumberStartPrev = weeklyNumberStart;
        weeklyNumberEndPrev = numberEnd;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
    
    function setMonthly() private {
        monthlyProcessed = monthlyNumberEndPrev == numberEnd;
        monthlyStart = monthlyEnd;
        monthlyEnd = monthlyStart + MONTHLY;
        monthlyNumberStartPrev = monthlyNumberStart;
        monthlyNumberEndPrev = numberEnd;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
    
    function setSeasonal() private {
        seasonalProcessed = seasonalNumberEndPrev == numberEnd;
        seasonalStart = seasonalEnd;
        seasonalEnd = seasonalStart + SEASONAL;
        seasonalNumberStartPrev = seasonalNumberStart;
        seasonalNumberEndPrev = numberEnd;
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    
    function getNumber(uint256 startNumber, uint256 endNumber, uint48 modulo) pure private returns (uint256) {
        return startNumber + modulo % (endNumber - startNumber + 1);
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
}