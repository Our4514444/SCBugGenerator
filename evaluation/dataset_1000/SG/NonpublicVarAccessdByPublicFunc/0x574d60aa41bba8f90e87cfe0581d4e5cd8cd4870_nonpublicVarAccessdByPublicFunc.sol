pragma solidity ^0.5.0;

/**
 * (E)t)h)e)x) Jackpot Contract 
 *  This smart-contract is the part of Ethex Lottery fair game.
 *  See latest version at https://github.com/ethex-bet/ethex-contracts 
 *  http://ethex.bet
 */

contract EthexJackpot {
    mapping(uint256 => address payable) internal tickets;
    uint256 public numberEnd;
    uint256 internal firstNumber;
    uint256 public dailyAmount;
    uint256 public weeklyAmount;
    uint256 public monthlyAmount;
    uint256 public seasonalAmount;
    bool internal dailyProcessed;
    bool internal weeklyProcessed;
    bool internal monthlyProcessed;
    bool internal seasonalProcessed;
    address payable private owner;
    address internal lotoAddress;
    address payable internal newVersionAddress;
    EthexJackpot previousContract;
    uint256 internal dailyNumberStartPrev;
    uint256 internal weeklyNumberStartPrev;
    uint256 internal monthlyNumberStartPrev;
    uint256 internal seasonalNumberStartPrev;
    uint256 internal dailyStart;
    uint256 internal weeklyStart;
    uint256 internal monthlyStart;
    uint256 internal seasonalStart;
    uint256 internal dailyEnd;
    uint256 internal weeklyEnd;
    uint256 internal monthlyEnd;
    uint256 internal seasonalEnd;
    uint256 internal dailyNumberStart;
    uint256 internal weeklyNumberStart;
    uint256 internal monthlyNumberStart;
    uint256 internal seasonalNumberStart;
    uint256 internal dailyNumberEndPrev;
    uint256 internal weeklyNumberEndPrev;
    uint256 internal monthlyNumberEndPrev;
    uint256 internal seasonalNumberEndPrev;
    
    event Jackpot (
        uint256 number,
        uint256 count,
        uint256 amount,
        byte jackpotType
    );
    
    event Ticket (
        bytes16 indexed id,
        uint256 number
    );
    
    event SuperPrize (
        uint256 amount,
        address winner
    );
    
    uint256 constant DAILY = 5000;
    uint256 constant WEEKLY = 35000;
    uint256 constant MONTHLY = 150000;
    uint256 constant SEASONAL = 450000;
    uint256 constant PRECISION = 1 ether;
    uint256 constant DAILY_PART = 84;
    uint256 constant WEEKLY_PART = 12;
    uint256 constant MONTHLY_PART = 3;
    
    constructor() public payable {
        owner = msg.sender;
    }
    
    function() external payable { }

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
        newVersionAddress.transfer(address(this).balance);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function registerTicket(bytes16 id, address payable gamer) external onlyLoto {
        uint256 number = numberEnd + 1;
        if (block.number >= dailyEnd) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            setDaily();
            dailyNumberStart = number;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        else
            if (dailyNumberStart == dailyNumberStartPrev)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                dailyNumberStart = number;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (block.number >= weeklyEnd) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            setWeekly();
            weeklyNumberStart = number;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        else
            if (weeklyNumberStart == weeklyNumberStartPrev)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                weeklyNumberStart = number;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (block.number >= monthlyEnd) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            setMonthly();
            monthlyNumberStart = number;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        else
            if (monthlyNumberStart == monthlyNumberStartPrev)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                monthlyNumberStart = number;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (block.number >= seasonalEnd) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            setSeasonal();
            seasonalNumberStart = number;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        else
            if (seasonalNumberStart == seasonalNumberStartPrev)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                seasonalNumberStart = number;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        numberEnd = number;
        tickets[number] = gamer;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Ticket(id, number);
    }
    
    function setLoto(address loto) external onlyOwner {
        lotoAddress = loto;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function setNewVersion(address payable newVersion) external onlyOwner {
        newVersionAddress = newVersion;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
    
    function settleJackpot() external {
        if (block.number >= dailyEnd)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            setDaily();
        if (block.number >= weeklyEnd)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            setWeekly();
        if (block.number >= monthlyEnd)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            setMonthly();
        if (block.number >= seasonalEnd)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            setSeasonal();
        
        if (block.number == dailyStart || (dailyStart < block.number - 256))	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return;
        
        uint48 modulo = uint48(bytes6(blockhash(dailyStart) << 29));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        uint256 dailyPayAmount;
        uint256 weeklyPayAmount;
        uint256 monthlyPayAmount;
        uint256 seasonalPayAmount;
        uint256 dailyWin;
        uint256 weeklyWin;
        uint256 monthlyWin;
        uint256 seasonalWin;
        if (dailyProcessed == false) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            dailyPayAmount = dailyAmount * PRECISION / DAILY_PART / PRECISION;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            dailyAmount -= dailyPayAmount;
            dailyProcessed = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            dailyWin = getNumber(dailyNumberStartPrev, dailyNumberEndPrev, modulo);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit Jackpot(dailyWin, dailyNumberEndPrev - dailyNumberStartPrev + 1, dailyPayAmount, 0x01);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        if (weeklyProcessed == false) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            weeklyPayAmount = weeklyAmount * PRECISION / WEEKLY_PART / PRECISION;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            weeklyAmount -= weeklyPayAmount;
            weeklyProcessed = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            weeklyWin = getNumber(weeklyNumberStartPrev, weeklyNumberEndPrev, modulo);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit Jackpot(weeklyWin, weeklyNumberEndPrev - weeklyNumberStartPrev + 1, weeklyPayAmount, 0x02);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        if (monthlyProcessed == false) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            monthlyPayAmount = monthlyAmount * PRECISION / MONTHLY_PART / PRECISION;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            monthlyAmount -= monthlyPayAmount;
            monthlyProcessed = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            monthlyWin = getNumber(monthlyNumberStartPrev, monthlyNumberEndPrev, modulo);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit Jackpot(monthlyWin, monthlyNumberEndPrev - monthlyNumberStartPrev + 1, monthlyPayAmount, 0x04);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        if (seasonalProcessed == false) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            seasonalPayAmount = seasonalAmount;
            seasonalAmount -= seasonalPayAmount;
            seasonalProcessed = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            seasonalWin = getNumber(seasonalNumberStartPrev, seasonalNumberEndPrev, modulo);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit Jackpot(seasonalWin, seasonalNumberEndPrev - seasonalNumberStartPrev + 1, seasonalPayAmount, 0x08);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        if (dailyPayAmount > 0)
            tickets[dailyWin].transfer(dailyPayAmount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (weeklyPayAmount > 0)
            tickets[weeklyWin].transfer(weeklyPayAmount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (monthlyPayAmount > 0)
            tickets[monthlyWin].transfer(monthlyPayAmount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (seasonalPayAmount > 0)
            tickets[seasonalWin].transfer(seasonalPayAmount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function settleSuperPrize(address payable winner) external onlyLoto {
        uint256 superPrizeAmount = dailyAmount + weeklyAmount + monthlyAmount + seasonalAmount;
        emit SuperPrize(superPrizeAmount, winner);
        winner.transfer(superPrizeAmount);
    }
    
    function loadTickets(address payable[] calldata addresses, uint256[] calldata numbers) external {
        for (uint i = 0; i < addresses.length; i++)
            tickets[numbers[i]] = addresses[i];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
        previousContract = EthexJackpot(oldAddress);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        firstNumber = 1;//previousContract.numberEnd;        	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        dailyStart = block.number / DAILY * DAILY;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        dailyEnd = dailyStart + DAILY;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        dailyProcessed = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        weeklyStart = block.number / WEEKLY * WEEKLY;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        weeklyEnd = weeklyStart + WEEKLY;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        weeklyProcessed = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        monthlyStart = block.number / MONTHLY * MONTHLY;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        monthlyEnd = monthlyStart + MONTHLY;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        monthlyProcessed = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        seasonalStart = block.number / SEASONAL * SEASONAL;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        seasonalEnd = seasonalStart + SEASONAL;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        seasonalProcessed = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        dailyNumberStartPrev = dailyNumberStartPrevIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        weeklyNumberStartPrev = weeklyNumberStartPrevIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        monthlyNumberStartPrev = monthlyNumberStartPrevIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        seasonalNumberStartPrev = seasonalNumberStartPrevIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        dailyNumberStart = dailyNumberStartIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        weeklyNumberStart = weeklyNumberStartIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        monthlyNumberStart = monthlyNumberStartIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        seasonalNumberStart = seasonalNumberStartIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        dailyNumberEndPrev = dailyNumberEndPrevIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        weeklyNumberEndPrev = weeklyNumberEndPrevIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        monthlyNumberEndPrev = monthlyNumberEndPrevIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        seasonalNumberEndPrev = seasonalNumberEndPrevIn;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        numberEnd = previousContract.numberEnd();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        dailyAmount = previousContract.dailyAmount();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        weeklyAmount = previousContract.weeklyAmount();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        monthlyAmount = previousContract.monthlyAmount();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        seasonalAmount = previousContract.seasonalAmount() + 19599522250000000000;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getAddress(uint256 number) public returns (address payable) {
        if (number <= firstNumber)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return previousContract.getAddress(number);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return tickets[number];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function setDaily() private {
        dailyProcessed = dailyNumberEndPrev == numberEnd;
        dailyStart = dailyEnd;
        dailyEnd = dailyStart + DAILY;
        dailyNumberStartPrev = dailyNumberStart;
        dailyNumberEndPrev = numberEnd;
    }
    
    function setWeekly() private {
        weeklyProcessed = weeklyNumberEndPrev == numberEnd;
        weeklyStart = weeklyEnd;
        weeklyEnd = weeklyStart + WEEKLY;
        weeklyNumberStartPrev = weeklyNumberStart;
        weeklyNumberEndPrev = numberEnd;
    }
    
    function setMonthly() private {
        monthlyProcessed = monthlyNumberEndPrev == numberEnd;
        monthlyStart = monthlyEnd;
        monthlyEnd = monthlyStart + MONTHLY;
        monthlyNumberStartPrev = monthlyNumberStart;
        monthlyNumberEndPrev = numberEnd;
    }
    
    function setSeasonal() private {
        seasonalProcessed = seasonalNumberEndPrev == numberEnd;
        seasonalStart = seasonalEnd;
        seasonalEnd = seasonalStart + SEASONAL;
        seasonalNumberStartPrev = seasonalNumberStart;
        seasonalNumberEndPrev = numberEnd;
    }
    
    function getNumber(uint256 startNumber, uint256 endNumber, uint48 modulo) pure private returns (uint256) {
        return startNumber + modulo % (endNumber - startNumber + 1);
    }
}