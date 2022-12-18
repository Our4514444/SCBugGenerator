pragma solidity ^0.5.0;

                                                                                                                                                                                                     

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
    uint256 public monthlyNumberStartPrev;
    uint256 public seasonalNumberStartPrev;
    uint256 public dailyStart;
    uint256 public weeklyStart;
    uint256 public monthlyStart;
    uint256 public seasonalStart;
    uint256 public dailyEnd;
    uint256 public weeklyEnd;
    uint256 public monthlyEnd;
    uint256 public seasonalEnd;
    uint256 public dailyNumberStart;
    uint256 public weeklyNumberStart;
    uint256 public monthlyNumberStart;
    uint256 public seasonalNumberStart;
    uint256 public dailyNumberEndPrev;
    uint256 public weeklyNumberEndPrev;
    uint256 public monthlyNumberEndPrev;
    uint256 public seasonalNumberEndPrev;
    
    event JACKPOT989 (	//inject NONSTANDARD NAMING
        uint256 number,
        uint256 count,
        uint256 amount,
        byte jackpotType
    );
    
    event TICKET926 (	//inject NONSTANDARD NAMING
        bytes16 indexed id,
        uint256 number
    );
    
    event SUPERPRIZE321 (	//inject NONSTANDARD NAMING
        uint256 amount,
        address winner
    );
    
    uint256 constant daily748 = 5000;	//inject NONSTANDARD NAMING
    uint256 constant weekly659 = 35000;	//inject NONSTANDARD NAMING
    uint256 constant monthly960 = 150000;	//inject NONSTANDARD NAMING
    uint256 constant seasonal222 = 450000;	//inject NONSTANDARD NAMING
    uint256 constant precision594 = 1 ether;	//inject NONSTANDARD NAMING
    uint256 constant daily_part473 = 84;	//inject NONSTANDARD NAMING
    uint256 constant weekly_part495 = 12;	//inject NONSTANDARD NAMING
    uint256 constant monthly_part462 = 3;	//inject NONSTANDARD NAMING
    
    constructor() public payable {
        owner = msg.sender;
    }
    
    function() external payable { }

    modifier ONLYOWNER663 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }
    
    modifier ONLYOWNERORNEWVERSION710 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == newVersionAddress);
        _;
    }
    
    modifier ONLYLOTO630 {	//inject NONSTANDARD NAMING
        require(msg.sender == lotoAddress, "Loto only");
        _;
    }
    
    function MIGRATE294() external ONLYOWNERORNEWVERSION710 {	//inject NONSTANDARD NAMING
        newVersionAddress.transfer(address(this).balance);
    }

    function REGISTERTICKET814(bytes16 id, address payable gamer) external ONLYLOTO630 {	//inject NONSTANDARD NAMING
        uint256 number = numberEnd + 1;
        if (block.number >= dailyEnd) {
            SETDAILY80();
            dailyNumberStart = number;
        }
        else
            if (dailyNumberStart == dailyNumberStartPrev)
                dailyNumberStart = number;
        if (block.number >= weeklyEnd) {
            SETWEEKLY7();
            weeklyNumberStart = number;
        }
        else
            if (weeklyNumberStart == weeklyNumberStartPrev)
                weeklyNumberStart = number;
        if (block.number >= monthlyEnd) {
            SETMONTHLY920();
            monthlyNumberStart = number;
        }
        else
            if (monthlyNumberStart == monthlyNumberStartPrev)
                monthlyNumberStart = number;
        if (block.number >= seasonalEnd) {
            SETSEASONAL174();
            seasonalNumberStart = number;
        }
        else
            if (seasonalNumberStart == seasonalNumberStartPrev)
                seasonalNumberStart = number;
        numberEnd = number;
        tickets[number] = gamer;
        emit TICKET926(id, number);
    }
    
    function SETLOTO755(address loto) external ONLYOWNER663 {	//inject NONSTANDARD NAMING
        lotoAddress = loto;
    }
    
    function SETNEWVERSION809(address payable newVersion) external ONLYOWNER663 {	//inject NONSTANDARD NAMING
        newVersionAddress = newVersion;
    }
    
    function PAYIN82() external payable {	//inject NONSTANDARD NAMING
        uint256 distributedAmount = dailyAmount + weeklyAmount + monthlyAmount + seasonalAmount;
        if (distributedAmount < address(this).balance) {
            uint256 amount = (address(this).balance - distributedAmount) / 4;
            dailyAmount += amount;
            weeklyAmount += amount;
            monthlyAmount += amount;
            seasonalAmount += amount;
        }
    }
    
    function SETTLEJACKPOT702() external {	//inject NONSTANDARD NAMING
        if (block.number >= dailyEnd)
            SETDAILY80();
        if (block.number >= weeklyEnd)
            SETWEEKLY7();
        if (block.number >= monthlyEnd)
            SETMONTHLY920();
        if (block.number >= seasonalEnd)
            SETSEASONAL174();
        
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
            dailyPayAmount = dailyAmount * precision594 / daily_part473 / precision594;
            dailyAmount -= dailyPayAmount;
            dailyProcessed = true;
            dailyWin = GETNUMBER567(dailyNumberStartPrev, dailyNumberEndPrev, modulo);
            emit JACKPOT989(dailyWin, dailyNumberEndPrev - dailyNumberStartPrev + 1, dailyPayAmount, 0x01);
        }
        if (weeklyProcessed == false) {
            weeklyPayAmount = weeklyAmount * precision594 / weekly_part495 / precision594;
            weeklyAmount -= weeklyPayAmount;
            weeklyProcessed = true;
            weeklyWin = GETNUMBER567(weeklyNumberStartPrev, weeklyNumberEndPrev, modulo);
            emit JACKPOT989(weeklyWin, weeklyNumberEndPrev - weeklyNumberStartPrev + 1, weeklyPayAmount, 0x02);
        }
        if (monthlyProcessed == false) {
            monthlyPayAmount = monthlyAmount * precision594 / monthly_part462 / precision594;
            monthlyAmount -= monthlyPayAmount;
            monthlyProcessed = true;
            monthlyWin = GETNUMBER567(monthlyNumberStartPrev, monthlyNumberEndPrev, modulo);
            emit JACKPOT989(monthlyWin, monthlyNumberEndPrev - monthlyNumberStartPrev + 1, monthlyPayAmount, 0x04);
        }
        if (seasonalProcessed == false) {
            seasonalPayAmount = seasonalAmount;
            seasonalAmount -= seasonalPayAmount;
            seasonalProcessed = true;
            seasonalWin = GETNUMBER567(seasonalNumberStartPrev, seasonalNumberEndPrev, modulo);
            emit JACKPOT989(seasonalWin, seasonalNumberEndPrev - seasonalNumberStartPrev + 1, seasonalPayAmount, 0x08);
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
    
    function SETTLESUPERPRIZE550(address payable winner) external ONLYLOTO630 {	//inject NONSTANDARD NAMING
        uint256 superPrizeAmount = dailyAmount + weeklyAmount + monthlyAmount + seasonalAmount;
        emit SUPERPRIZE321(superPrizeAmount, winner);
        winner.transfer(superPrizeAmount);
    }
    
    function LOADTICKETS629(address payable[] calldata addresses, uint256[] calldata numbers) external {	//inject NONSTANDARD NAMING
        for (uint i = 0; i < addresses.length; i++)
            tickets[numbers[i]] = addresses[i];
    }
    
    function SETOLDVERSION986(	//inject NONSTANDARD NAMING
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
    ) external ONLYOWNER663 {
        previousContract = EthexJackpot(oldAddress);
        firstNumber = 1;//previousContract.numberEnd;        
        dailyStart = block.number / daily748 * daily748;
        dailyEnd = dailyStart + daily748;
        dailyProcessed = true;
        weeklyStart = block.number / weekly659 * weekly659;
        weeklyEnd = weeklyStart + weekly659;
        weeklyProcessed = true;
        monthlyStart = block.number / monthly960 * monthly960;
        monthlyEnd = monthlyStart + monthly960;
        monthlyProcessed = true;
        seasonalStart = block.number / seasonal222 * seasonal222;
        seasonalEnd = seasonalStart + seasonal222;
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
    
    function GETADDRESS733(uint256 number) public returns (address payable) {	//inject NONSTANDARD NAMING
        if (number <= firstNumber)
            return previousContract.GETADDRESS733(number);
        return tickets[number];
    }
    
    function SETDAILY80() private {	//inject NONSTANDARD NAMING
        dailyProcessed = dailyNumberEndPrev == numberEnd;
        dailyStart = dailyEnd;
        dailyEnd = dailyStart + daily748;
        dailyNumberStartPrev = dailyNumberStart;
        dailyNumberEndPrev = numberEnd;
    }
    
    function SETWEEKLY7() private {	//inject NONSTANDARD NAMING
        weeklyProcessed = weeklyNumberEndPrev == numberEnd;
        weeklyStart = weeklyEnd;
        weeklyEnd = weeklyStart + weekly659;
        weeklyNumberStartPrev = weeklyNumberStart;
        weeklyNumberEndPrev = numberEnd;
    }
    
    function SETMONTHLY920() private {	//inject NONSTANDARD NAMING
        monthlyProcessed = monthlyNumberEndPrev == numberEnd;
        monthlyStart = monthlyEnd;
        monthlyEnd = monthlyStart + monthly960;
        monthlyNumberStartPrev = monthlyNumberStart;
        monthlyNumberEndPrev = numberEnd;
    }
    
    function SETSEASONAL174() private {	//inject NONSTANDARD NAMING
        seasonalProcessed = seasonalNumberEndPrev == numberEnd;
        seasonalStart = seasonalEnd;
        seasonalEnd = seasonalStart + seasonal222;
        seasonalNumberStartPrev = seasonalNumberStart;
        seasonalNumberEndPrev = numberEnd;
    }
    
    function GETNUMBER567(uint256 startNumber, uint256 endNumber, uint48 modulo) pure private returns (uint256) {	//inject NONSTANDARD NAMING
        return startNumber + modulo % (endNumber - startNumber + 1);
    }
}