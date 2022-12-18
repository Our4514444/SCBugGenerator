pragma solidity ^0.5.0;

contract CryptoTycoonsVIPLib{
    
    address payable public owner;
    
    // Accumulated jackpot fund.
    uint128 public jackpotSize;
    uint128 public rankingRewardSize;
    
    mapping (address => uint) userExpPool;
    mapping (address => bool) public callerMap;

    event RANKINGREWARDPAYMENT98(address indexed beneficiary, uint amount);	//inject NONSTANDARD NAMING

    modifier ONLYOWNER213 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "OnlyOwner methods called by non-owner.");
        _;
    }

    modifier ONLYCALLER963 {	//inject NONSTANDARD NAMING
        bool isCaller = callerMap[msg.sender];
        require(isCaller, "onlyCaller methods called by non-caller.");
        _;
    }

    constructor() public{
        owner = msg.sender;
        callerMap[owner] = true;
    }

    // Fallback function deliberately left empty. It's primary use case
    // is to top up the bank roll.
    function () external payable {
    }

    function KILL459() external ONLYOWNER213 {	//inject NONSTANDARD NAMING
        selfdestruct(owner);
    }

    function ADDCALLER361(address caller) public ONLYOWNER213{	//inject NONSTANDARD NAMING
        bool isCaller = callerMap[caller];
        if (isCaller == false){
            callerMap[caller] = true;
        }
    }

    function DELETECALLER322(address caller) external ONLYOWNER213 {	//inject NONSTANDARD NAMING
        bool isCaller = callerMap[caller];
        if (isCaller == true) {
            callerMap[caller] = false;
        }
    }

    function ADDUSEREXP782(address addr, uint256 amount) public ONLYCALLER963{	//inject NONSTANDARD NAMING
        uint exp = userExpPool[addr];
        exp = exp + amount;
        userExpPool[addr] = exp;
    }

    function GETUSEREXP207(address addr) public view returns(uint256 exp){	//inject NONSTANDARD NAMING
        return userExpPool[addr];
    }

    function GETVIPLEVEL928(address user) public view returns (uint256 level) {	//inject NONSTANDARD NAMING
        uint exp = userExpPool[user];

        if(exp >= 25 ether && exp < 125 ether){
            level = 1;
        } else if(exp >= 125 ether && exp < 250 ether){
            level = 2;
        } else if(exp >= 250 ether && exp < 1250 ether){
            level = 3;
        } else if(exp >= 1250 ether && exp < 2500 ether){
            level = 4;
        } else if(exp >= 2500 ether && exp < 12500 ether){
            level = 5;
        } else if(exp >= 12500 ether && exp < 25000 ether){
            level = 6;
        } else if(exp >= 25000 ether && exp < 125000 ether){
            level = 7;
        } else if(exp >= 125000 ether && exp < 250000 ether){
            level = 8;
        } else if(exp >= 250000 ether && exp < 1250000 ether){
            level = 9;
        } else if(exp >= 1250000 ether){
            level = 10;
        } else{
            level = 0;
        }

        return level;
    }

    function GETVIPBOUNUSRATE475(address user) public view returns (uint256 rate){	//inject NONSTANDARD NAMING
        uint level = GETVIPLEVEL928(user);
        return level;
    }

    // This function is used to bump up the jackpot fund. Cannot be used to lower it.
    function INCREASEJACKPOT503(uint increaseAmount) external ONLYCALLER963 {	//inject NONSTANDARD NAMING
        require (increaseAmount <= address(this).balance, "Increase amount larger than balance.");
        require (jackpotSize + increaseAmount <= address(this).balance, "Not enough funds.");
        jackpotSize += uint128(increaseAmount);
    }

    function PAYJACKPOTREWARD77(address payable to) external ONLYCALLER963{	//inject NONSTANDARD NAMING
        to.transfer(jackpotSize);
        jackpotSize = 0;
    }

    function GETJACKPOTSIZE867() external view returns (uint256){	//inject NONSTANDARD NAMING
        return jackpotSize;
    }

    function INCREASERANKINGREWARD224(uint amount) public ONLYCALLER963{	//inject NONSTANDARD NAMING
        require (amount <= address(this).balance, "Increase amount larger than balance.");
        require (rankingRewardSize + amount <= address(this).balance, "Not enough funds.");
        rankingRewardSize += uint128(amount);
    }

    function PAYRANKINGREWARD9(address payable to) external ONLYCALLER963 {	//inject NONSTANDARD NAMING
        uint128 prize = rankingRewardSize / 2;
        rankingRewardSize = rankingRewardSize - prize;
        if(to.send(prize)){
            emit RANKINGREWARDPAYMENT98(to, prize);
        }
    }

    function GETRANKINGREWARDSIZE522() external view returns (uint128){	//inject NONSTANDARD NAMING
        return rankingRewardSize;
    }
}

contract HalfRouletteEvents {
    event COMMIT871(uint commit); // 11	//inject NONSTANDARD NAMING
    event PAYMENT980(address indexed gambler, uint amount, uint8 betMask, uint8 l, uint8 r, uint betAmount); // 11 11	//inject NONSTANDARD NAMING
    event REFUND841(address indexed gambler, uint amount); // 11 11	//inject NONSTANDARD NAMING
    event JACKPOTPAYMENT60(address indexed gambler, uint amount); // 11	//inject NONSTANDARD NAMING
    event VIPBENEFIT787(address indexed gambler, uint amount); // VIP 11	//inject NONSTANDARD NAMING
    event INVITERBENEFIT357(address indexed inviter, address gambler, uint amount, uint betAmount); // 111 11	//inject NONSTANDARD NAMING
}

contract CryptoTycoonsDApp {
    address payable public owner; // 111
    address payable nextOwner;
    address secretSigner;

    mapping(address => bool) public croupierMap; // 111 11

    address payable public VIPLibraryAddress; // vip pool address

    modifier ONLYOWNER213 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "OnlyOwner methods called by non-owner.");
        _;
    }

    modifier ONLYCROUPIER196 {	//inject NONSTANDARD NAMING
        bool isCroupier = croupierMap[msg.sender];
        require(isCroupier, "OnlyCroupier methods called by non-croupier.");
        _;
    }

    constructor() public {
        owner = msg.sender;
        croupierMap[msg.sender] = true;
        secretSigner = msg.sender;
    }

    function () external payable {}

    function APPROVENEXTOWNER532(address payable _nextOwner) external ONLYOWNER213 {	//inject NONSTANDARD NAMING
        require(_nextOwner != owner, "Cannot approve current owner.");
        nextOwner = _nextOwner;
    }

    function ACCEPTNEXTOWNER982() external {	//inject NONSTANDARD NAMING
        require(msg.sender == nextOwner, "Can only accept preapproved new owner.");
        owner = nextOwner;
    }

    function SETSECRETSIGNER919(address newSecretSigner) external ONLYOWNER213 {	//inject NONSTANDARD NAMING
        secretSigner = newSecretSigner;
    }

    function ADDCROUPIER985(address newCroupier) external ONLYOWNER213 {	//inject NONSTANDARD NAMING
        bool isCroupier = croupierMap[newCroupier];
        if (isCroupier == false) {
            croupierMap[newCroupier] = true;
        }
    }

    function DELETECROUPIER739(address newCroupier) external ONLYOWNER213 {	//inject NONSTANDARD NAMING
        bool isCroupier = croupierMap[newCroupier];
        if (isCroupier == true) {
            croupierMap[newCroupier] = false;
        }
    }

    function SETVIPLIBRARYADDRESS653(address payable addr) external ONLYOWNER213 {	//inject NONSTANDARD NAMING
        VIPLibraryAddress = addr;
    }

    function GETMYACCUAMOUNT859() external view returns (uint) {	//inject NONSTANDARD NAMING
        CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);
        return vipLib.GETUSEREXP207(msg.sender);
    }

    function GETJACKPOTSIZE867() external view returns (uint) {	//inject NONSTANDARD NAMING
        CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);
        return vipLib.GETJACKPOTSIZE867();
    }

    function GETRANKINGREWARDSIZE522() external view returns (uint128) {	//inject NONSTANDARD NAMING
        CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);
        return vipLib.GETRANKINGREWARDSIZE522();
    }

}

contract HalfRouletteStruct {
    struct Bet {
        uint amount; // 11 11
        uint8 betMask; // 11 11
        uint40 placeBlockNumber; // Block number of placeBet tx.
        address payable gambler; // Address of a gambler, used to pay out winning bets.
    }
}

contract HalfRouletteConstant {
    //    constant
    // EVM BLOCKHASH opcode can query no further than 256 blocks into the
    // past. Given that settleBet uses block hash of placeBet as one of
    // complementary entropy sources, we cannot process bets older than this
    // threshold. On rare occasions AceDice croupier may fail to invoke
    // settleBet in this timespan due to technical issues or extreme Ethereum
    // congestion; such bets can be refunded via invoking refundBet.
    uint constant bet_expiration_blocks206 = 250;	//inject NONSTANDARD NAMING

    uint constant house_edge_percent643 = 1; // amount * 0.01	//inject NONSTANDARD NAMING
    uint constant house_edge_minimum_amount111 = 0.0004 ether; // 11 houseEdge	//inject NONSTANDARD NAMING

    uint constant rank_funds_percent134 = 7; // houseEdge * 0.12	//inject NONSTANDARD NAMING
    uint constant inviter_benefit_percent669 = 7; // houseEdge * 0.09	//inject NONSTANDARD NAMING

    uint constant min_bet218 = 0.01 ether; // 11 11 11	//inject NONSTANDARD NAMING
    uint constant max_bet365 = 300000 ether; // 11 11 11	//inject NONSTANDARD NAMING
    uint constant min_jackpot_bet282 = 0.1 ether;	//inject NONSTANDARD NAMING
    uint constant jackpot_fee126 = 0.001 ether;	//inject NONSTANDARD NAMING

    uint constant base_win_rate566 = 100000;	//inject NONSTANDARD NAMING
}

contract HalfRoulettePure is HalfRouletteConstant {

    function VERIFYBETMASK139(uint betMask) public pure {	//inject NONSTANDARD NAMING
        bool verify;
        assembly {
            switch betMask
            case 1          {verify := 1}
            case 2           {verify := 1}
            case 4           {verify := 1}
            case 8            {verify := 1}
            case 5                 {verify := 1}
            case 9                  {verify := 1}
            case 6                  {verify := 1}
            case 10                   {verify := 1}
            case 16            {verify := 1}
        }
        require(verify, "invalid betMask");
    }

    function GETRECOVERSIGNER629(uint40 commitLastBlock, uint commit, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {	//inject NONSTANDARD NAMING
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes memory message = abi.encodePacked(commitLastBlock, commit);
        bytes32 messageHash = keccak256(abi.encodePacked(prefix, keccak256(message)));
        return ecrecover(messageHash, v, r, s);
    }

    function GETWINRATE348(uint betMask) public pure returns (uint rate) {	//inject NONSTANDARD NAMING
        // assembly 1111 constant 11 11
        uint ODD_EVEN_RATE = 50000;
        uint LEFT_RIGHT_RATE = 45833;
        uint MIX_ODD_RATE = 25000;
        uint MIX_EVEN_RATE = 20833;
        uint EQUAL_RATE = 8333;
        assembly {
            switch betMask
            case 1          {rate := ODD_EVEN_RATE}
            case 2           {rate := ODD_EVEN_RATE}
            case 4           {rate := LEFT_RIGHT_RATE}
            case 8            {rate := LEFT_RIGHT_RATE}
            case 5                 {rate := MIX_ODD_RATE}
            case 9                  {rate := MIX_ODD_RATE}
            case 6                  {rate := MIX_EVEN_RATE}
            case 10                   {rate := MIX_EVEN_RATE}
            case 16            {rate := EQUAL_RATE}
        }
    }

    function CALCHOUSEEDGE885(uint amount) public pure returns (uint houseEdge) {	//inject NONSTANDARD NAMING
        // 0.02
        houseEdge = amount * house_edge_percent643 / 100;
        if (houseEdge < house_edge_minimum_amount111) {
            houseEdge = house_edge_minimum_amount111;
        }
    }

    function CALCJACKPOTFEE402(uint amount) public pure returns (uint jackpotFee) {	//inject NONSTANDARD NAMING
        // 0.001
        if (amount >= min_jackpot_bet282) {
            jackpotFee = jackpot_fee126;
        }
    }

    function CALCRANKFUNDSFEE269(uint houseEdge) public pure returns (uint rankFundsFee) {	//inject NONSTANDARD NAMING
        // 0.07
        rankFundsFee = houseEdge * rank_funds_percent134 / 100;
    }

    function CALCINVITERBENEFIT845(uint houseEdge) public pure returns (uint invitationFee) {	//inject NONSTANDARD NAMING
        // 0.07
        invitationFee = houseEdge * inviter_benefit_percent669 / 100;
    }

    function GETWINAMOUNT412(uint betMask, uint amount) public pure returns (uint) {	//inject NONSTANDARD NAMING
        uint houseEdge = CALCHOUSEEDGE885(amount);
        uint jackpotFee = CALCJACKPOTFEE402(amount);
        uint betAmount = amount - houseEdge - jackpotFee;
        uint rate = GETWINRATE348(betMask);
        return betAmount * base_win_rate566 / rate;
    }

    function CALCBETRESULT88(uint betMask, bytes32 entropy) public pure returns (bool isWin, uint l, uint r)  {	//inject NONSTANDARD NAMING
        uint v = uint(entropy);
        l = (v % 12) + 1;
        r = ((v >> 4) % 12) + 1;
        uint mask = GETRESULTMASK107(l, r);
        isWin = (betMask & mask) == betMask;
    }

    function GETRESULTMASK107(uint l, uint r) public pure returns (uint mask) {	//inject NONSTANDARD NAMING
        uint v1 = (l + r) % 2;
        if (v1 == 0) {
            mask = mask | 2;
        } else {
            mask = mask | 1;
        }
        if (l == r) {
            mask = mask | 16;
        } else if (l > r) {
            mask = mask | 4;
        } else {
            mask = mask | 8;
        }
        return mask;
    }

    function ISJACKPOT721(bytes32 entropy, uint amount) public pure returns (bool jackpot) {	//inject NONSTANDARD NAMING
        return amount >= min_jackpot_bet282 && (uint(entropy) % 1000) == 0;
    }

    function VERIFYCOMMIT91(address signer, uint40 commitLastBlock, uint commit, uint8 v, bytes32 r, bytes32 s) internal pure {	//inject NONSTANDARD NAMING
        address recoverSigner = GETRECOVERSIGNER629(commitLastBlock, commit, v, r, s);
        require(recoverSigner == signer, "failed different signer");
    }

    function STARTOFDAY946(uint timestamp) internal pure returns (uint64) {	//inject NONSTANDARD NAMING
        return uint64(timestamp - (timestamp % 1 days));
    }

}

contract HalfRoulette is CryptoTycoonsDApp, HalfRouletteEvents, HalfRouletteStruct, HalfRouletteConstant, HalfRoulettePure {
    uint128 public lockedInBets;

    // Adjustable max bet profit. Used to cap bets against dynamic odds.
    uint public maxProfit = 10 ether;

    // global variable
    mapping(uint => Bet) public bets;
    mapping(address => address payable) public inviterMap;

    function () external payable {}

    function KILL459() external ONLYOWNER213 {	//inject NONSTANDARD NAMING
        require(lockedInBets == 0, "All bets should be processed (settled or refunded) before self-destruct.");
        selfdestruct(address(owner));
    }

    function SETMAXPROFIT654(uint _maxProfit) external ONLYOWNER213 {	//inject NONSTANDARD NAMING
        require(_maxProfit < max_bet365, "maxProfit should be a sane number.");
        maxProfit = _maxProfit;
    }

    function PLACEBET6(uint8 betMask, uint commitLastBlock, uint commit, uint8 v, bytes32 r, bytes32 s) public payable {	//inject NONSTANDARD NAMING
        Bet storage bet = bets[commit];
        require(bet.gambler == address(0), "Bet should be in a 'clean' state.");

        // amount checked
        uint amount = msg.value;
        require(amount >= min_bet218, 'failed amount >= MIN_BET');
        require(amount <= max_bet365, "failed amount <= MAX_BET");
        // allow bet check
        VERIFYBETMASK139(betMask);
        // rand seed check
        VERIFYCOMMIT91(secretSigner, uint40(commitLastBlock), commit, v, r, s);

        // house balance check
        uint winAmount = GETWINAMOUNT412(betMask, amount);
        require(winAmount <= amount + maxProfit, "maxProfit limit violation.");
        lockedInBets += uint128(winAmount);
        require(lockedInBets <= address(this).balance, "Cannot afford to lose this bet.");

        // save
        emit COMMIT871(commit);
        bet.gambler = msg.sender;
        bet.amount = amount;
        bet.betMask = betMask;
        bet.placeBlockNumber = uint40(block.number);
    }

    function PLACEBETWITHINVITER748(uint8 betMask, uint commitLastBlock, uint commit, uint8 v, bytes32 r, bytes32 s, address payable inviter) external payable {	//inject NONSTANDARD NAMING
        require(inviter != address(0), "inviter != address (0)");
        address preInviter = inviterMap[msg.sender];
        if (preInviter == address(0)) {
            inviterMap[msg.sender] = inviter;
        }
        PLACEBET6(betMask, commitLastBlock, commit, v, r, s);
    }

    function SETTLEBET817(uint reveal, bytes32 blockHash) external ONLYCROUPIER196 {	//inject NONSTANDARD NAMING
        uint commit = uint(keccak256(abi.encodePacked(reveal)));

        Bet storage bet = bets[commit];
        uint placeBlockNumber = bet.placeBlockNumber;

        // Check that bet has not expired yet (see comment to BET_EXPIRATION_BLOCKS).
        require(block.number > placeBlockNumber, "settleBet in the same block as placeBet, or before.");
        require(block.number <= placeBlockNumber + bet_expiration_blocks206, "Blockhash can't be queried by EVM.");
        require(blockhash(placeBlockNumber) == blockHash);

        // Settle bet using reveal and blockHash as entropy sources.
        SETTLEBETCOMMON569(bet, reveal, blockHash);
    }

    function PROCESSVIPBENEFIT261(address gambler, uint amount) internal returns (uint benefitAmount) {	//inject NONSTANDARD NAMING
        CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);
        uint rate = vipLib.GETVIPBOUNUSRATE475(gambler);
        if (rate > 0) {
            benefitAmount = amount * rate / 10000;
            emit VIPBENEFIT787(gambler, benefitAmount);
        }
        vipLib.ADDUSEREXP782(gambler, amount);
    }

    function PROCESSJACKPOT90(address payable gambler, bytes32 entropy, uint amount) internal returns (uint benefitAmount) {	//inject NONSTANDARD NAMING
        if (ISJACKPOT721(entropy, amount)) {
            CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);
            uint jackpotSize = vipLib.GETJACKPOTSIZE867();
            vipLib.PAYJACKPOTREWARD77(gambler);
            benefitAmount = jackpotSize;
            emit JACKPOTPAYMENT60(gambler, benefitAmount);
        }
    }

    function PROCESSROULETTE889(address gambler, uint betMask, bytes32 entropy, uint amount) internal returns (uint benefitAmount) {	//inject NONSTANDARD NAMING
        uint winAmount = GETWINAMOUNT412(betMask, amount);
        lockedInBets -= uint128(winAmount);

        (bool isWin, uint l, uint r) = CALCBETRESULT88(betMask, entropy);
        benefitAmount = isWin ? winAmount : 0;

        emit PAYMENT980(gambler, benefitAmount, uint8(betMask), uint8(l), uint8(r), amount);
    }

    function PROCESSINVITERBENEFIT538(address gambler, uint betAmount) internal {	//inject NONSTANDARD NAMING
        address payable inviter = inviterMap[gambler];
        if (inviter != address(0)) {
            uint houseEdge = CALCHOUSEEDGE885(betAmount);
            uint inviterBenefit = CALCINVITERBENEFIT845(houseEdge);
            if (inviter.send(inviterBenefit)) {
                emit INVITERBENEFIT357(inviter, gambler, inviterBenefit, betAmount);
            }
        }
    }

    function TRANSFERCRYPTOTYCOONSFEE874(uint amount) internal {	//inject NONSTANDARD NAMING
        uint houseEdge = CALCHOUSEEDGE885(amount);
        uint jackpotFee = CALCJACKPOTFEE402(amount);
        uint rankFundFee = CALCRANKFUNDSFEE269(houseEdge);

        CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);
        VIPLibraryAddress.transfer(rankFundFee + jackpotFee);
        vipLib.INCREASERANKINGREWARD224(rankFundFee);
        if (jackpotFee > 0) {
            vipLib.INCREASEJACKPOT503(jackpotFee);
        }
    }

    function SETTLEBETCOMMON569(Bet storage bet, uint reveal, bytes32 entropyBlockHash) internal {	//inject NONSTANDARD NAMING
        uint amount = bet.amount;

        // Check that bet is in 'active' state.
        require(amount != 0, "Bet should be in an 'active' state");
        bet.amount = 0;

        // The RNG - combine "reveal" and blockhash of placeBet using Keccak256. Miners
        // are not aware of "reveal" and cannot deduce it from "commit" (as Keccak256
        // preimage is intractable), and house is unable to alter the "reveal" after
        // placeBet have been mined (as Keccak256 collision finding is also intractable).
        bytes32 entropy = keccak256(abi.encodePacked(reveal, entropyBlockHash));

        TRANSFERCRYPTOTYCOONSFEE874(amount);

        uint payout = 0;
        payout += PROCESSVIPBENEFIT261(bet.gambler, amount);
        payout += PROCESSROULETTE889(bet.gambler, bet.betMask, entropy, amount);
        PROCESSJACKPOT90(bet.gambler, entropy, amount);
        PROCESSINVITERBENEFIT538(bet.gambler, amount);

        bet.gambler.transfer(payout);
    }

    // Refund transaction - return the bet amount of a roll that was not processed in a due timeframe.
    // Processing such blocks is not possible due to EVM limitations (see BET_EXPIRATION_BLOCKS comment above for details).
    // In case you ever find yourself in a situation like this, just contact the {} support, however nothing precludes you from invoking this method yourself.
    function REFUNDBET604(uint commit) external {	//inject NONSTANDARD NAMING
        // Check that bet is in 'active' state.
        Bet storage bet = bets[commit];
        uint amount = bet.amount;

        require(amount != 0, "Bet should be in an 'active' state");

        // Check that bet has already expired.
        require(block.number > bet.placeBlockNumber + bet_expiration_blocks206, "Blockhash can't be queried by EVM.");

        // Move bet into 'processed' state, release funds.
        bet.amount = 0;

        uint winAmount = GETWINAMOUNT412(bet.betMask, amount);
        lockedInBets -= uint128(winAmount);

        // Send the refund.
        bet.gambler.transfer(amount);

        emit REFUND841(bet.gambler, amount);
    }

    // Funds withdrawal to cover costs of HalfRoulette operation.
    function WITHDRAWFUNDS174(address payable beneficiary, uint withdrawAmount) external ONLYOWNER213 {	//inject NONSTANDARD NAMING
        require(withdrawAmount <= address(this).balance, "Increase amount larger than balance.");
        require(lockedInBets + withdrawAmount <= address(this).balance, "Not enough funds.");
        beneficiary.transfer(withdrawAmount);
    }

}