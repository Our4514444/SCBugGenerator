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
    address payable private owner;
    address public lotoAddress;
    address payable public newVersionAddress;
    EthexJackpot previousContract;
    uint256 public dailyNumberStartPrev;
    uint256 public weeklyNumberStartPrev;
  bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }
  uint256 public monthlyNumberStartPrev;
  bool not_called_re_ent6 = true;
function bug_re_ent6() public{
        require(not_called_re_ent6);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent6 = false;
    }
  uint256 public seasonalNumberStartPrev;
  uint256 counter_re_ent21 =0;
function callme_re_ent21() public{
        require(counter_re_ent21<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }
  uint256 public dailyStart;
  mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   //bug
        redeemableEther_re_ent4[msg.sender] = 0;
    }
  uint256 public weeklyStart;
  mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {
       (bool success,)= msg.sender.call.value(balances_re_ent21[msg.sender ])("");
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }
  uint256 public monthlyStart;
  mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }
  uint256 public seasonalStart;
  mapping(address => uint) redeemableEther_re_ent18;
function claimReward_re_ent18() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent18[msg.sender] > 0);
        uint transferValue_re_ent18 = redeemableEther_re_ent18[msg.sender];
        msg.sender.transfer(transferValue_re_ent18);   //bug
        redeemableEther_re_ent18[msg.sender] = 0;
    }
  uint256 public dailyEnd;
  mapping(address => uint) userBalance_re_ent5;
function withdrawBalance_re_ent5() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent5[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent5[msg.sender] = 0;
    }
  uint256 public weeklyEnd;
  address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }
  uint256 public monthlyEnd;
  mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }
  uint256 public seasonalEnd;
    uint256 public dailyNumberStart;
    uint256 public weeklyNumberStart;
    uint256 public monthlyNumberStart;
    uint256 public seasonalNumberStart;
  bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }
  uint256 public dailyNumberEndPrev;
  bool not_called_re_ent34 = true;
function bug_re_ent34() public{
        require(not_called_re_ent34);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }
  uint256 public weeklyNumberEndPrev;
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = msg.sender;
      jackpot_re_ent2    = address(this).balance;
    }
  uint256 public monthlyNumberEndPrev;
  uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }
  uint256 public seasonalNumberEndPrev;
    
  address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    (bool success,) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
  event Jackpot (
        uint256 number,
        uint256 count,
        uint256 amount,
        byte jackpotType
    );
    
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  event Ticket (
        bytes16 indexed id,
        uint256 number
    );
    
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  event SuperPrize (
        uint256 amount,
        address winner
    );
    
  mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }
  uint256 constant DAILY = 5000;
  mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
  uint256 constant WEEKLY = 35000;
  mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
  uint256 constant MONTHLY = 150000;
  mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= msg.sender.call.value(_weiToWithdraw)("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }
  uint256 constant SEASONAL = 450000;
  uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }
  uint256 constant PRECISION = 1 ether;
  mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
  uint256 constant DAILY_PART = 84;
  mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)=msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
  uint256 constant WEEKLY_PART = 12;
  mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }
  uint256 constant MONTHLY_PART = 3;
    
    constructor() public payable {
        owner = msg.sender;
    }
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37)))
        revert();
      lastPlayer_re_ent37 = msg.sender;
      jackpot_re_ent37    = address(this).balance;
    }
    
    function() external payable { }
mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
       if (msg.sender.send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
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
address payable lastPlayer_re_ent16;
      uint jackpot_re_ent16;
	  function buyTicket_re_ent16() public{
	    if (!(lastPlayer_re_ent16.send(jackpot_re_ent16)))
        revert();
      lastPlayer_re_ent16 = msg.sender;
      jackpot_re_ent16    = address(this).balance;
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
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
    
    function setLoto(address loto) external onlyOwner {
        lotoAddress = loto;
    }
mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }
    
    function setNewVersion(address payable newVersion) external onlyOwner {
        newVersionAddress = newVersion;
    }
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
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
mapping(address => uint) balances_re_ent29;
    function withdraw_balances_re_ent29 () public {
       if (msg.sender.send(balances_re_ent29[msg.sender ]))
          balances_re_ent29[msg.sender] = 0;
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
mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }
    
    function settleSuperPrize(address payable winner) external onlyLoto {
        uint256 superPrizeAmount = dailyAmount + weeklyAmount + monthlyAmount + seasonalAmount;
        emit SuperPrize(superPrizeAmount, winner);
        winner.transfer(superPrizeAmount);
    }
bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
    
    function loadTickets(address payable[] calldata addresses, uint256[] calldata numbers) external {
        for (uint i = 0; i < addresses.length; i++)
            tickets[numbers[i]] = addresses[i];
    }
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
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
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
    
    function getAddress(uint256 number) public returns (address payable) {
        if (number <= firstNumber)
            return previousContract.getAddress(number);
        return tickets[number];
    }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
    
    function setDaily() private {
        dailyProcessed = dailyNumberEndPrev == numberEnd;
        dailyStart = dailyEnd;
        dailyEnd = dailyStart + DAILY;
        dailyNumberStartPrev = dailyNumberStart;
        dailyNumberEndPrev = numberEnd;
    }
mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }
    
    function setWeekly() private {
        weeklyProcessed = weeklyNumberEndPrev == numberEnd;
        weeklyStart = weeklyEnd;
        weeklyEnd = weeklyStart + WEEKLY;
        weeklyNumberStartPrev = weeklyNumberStart;
        weeklyNumberEndPrev = numberEnd;
    }
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
    
    function setMonthly() private {
        monthlyProcessed = monthlyNumberEndPrev == numberEnd;
        monthlyStart = monthlyEnd;
        monthlyEnd = monthlyStart + MONTHLY;
        monthlyNumberStartPrev = monthlyNumberStart;
        monthlyNumberEndPrev = numberEnd;
    }
mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
       (bool success,) =msg.sender.call.value(balances_re_ent1[msg.sender ])("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
    
    function setSeasonal() private {
        seasonalProcessed = seasonalNumberEndPrev == numberEnd;
        seasonalStart = seasonalEnd;
        seasonalEnd = seasonalStart + SEASONAL;
        seasonalNumberStartPrev = seasonalNumberStart;
        seasonalNumberEndPrev = numberEnd;
    }
address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }
    
    function getNumber(uint256 startNumber, uint256 endNumber, uint48 modulo) pure private returns (uint256) {
        return startNumber + modulo % (endNumber - startNumber + 1);
    }
mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];
        msg.sender.transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
}