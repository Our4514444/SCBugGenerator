pragma solidity ^0.5.0;

contract CryptoTycoonsVIPLib{
    
    address payable internal owner;
    
    // Accumulated jackpot fund.
    uint128 internal jackpotSize;
    uint128 internal rankingRewardSize;
    
    mapping (address => uint) userExpPool;
    mapping (address => bool) internal callerMap;

    event RankingRewardPayment(address indexed beneficiary, uint amount);

    modifier onlyOwner {
        require(msg.sender == owner, "OnlyOwner methods called by non-owner.");
        _;
    }

    modifier onlyCaller {
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

    function kill() external onlyOwner {
        selfdestruct(owner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function addCaller(address caller) public onlyOwner{
        bool isCaller = callerMap[caller];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (isCaller == false){
            callerMap[caller] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }

    function deleteCaller(address caller) external onlyOwner {
        bool isCaller = callerMap[caller];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (isCaller == true) {
            callerMap[caller] = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }

    function addUserExp(address addr, uint256 amount) public onlyCaller{
        uint exp = userExpPool[addr];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        exp = exp + amount;
        userExpPool[addr] = exp;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getUserExp(address addr) public view returns(uint256 exp){
        return userExpPool[addr];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getVIPLevel(address user) public view returns (uint256 level) {
        uint exp = userExpPool[user];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

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

    function getVIPBounusRate(address user) public view returns (uint256 rate){
        uint level = getVIPLevel(user);
        return level;
    }

    // This function is used to bump up the jackpot fund. Cannot be used to lower it.
    function increaseJackpot(uint increaseAmount) external onlyCaller {
        require (increaseAmount <= address(this).balance, "Increase amount larger than balance.");
        require (jackpotSize + increaseAmount <= address(this).balance, "Not enough funds.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        jackpotSize += uint128(increaseAmount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function payJackpotReward(address payable to) external onlyCaller{
        to.transfer(jackpotSize);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        jackpotSize = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getJackpotSize() external view returns (uint256){
        return jackpotSize;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function increaseRankingReward(uint amount) public onlyCaller{
        require (amount <= address(this).balance, "Increase amount larger than balance.");
        require (rankingRewardSize + amount <= address(this).balance, "Not enough funds.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        rankingRewardSize += uint128(amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function payRankingReward(address payable to) external onlyCaller {
        uint128 prize = rankingRewardSize / 2;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        rankingRewardSize = rankingRewardSize - prize;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if(to.send(prize)){
            emit RankingRewardPayment(to, prize);
        }
    }

    function getRankingRewardSize() external view returns (uint128){
        return rankingRewardSize;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}

contract HalfRouletteEvents {
    event Commit(uint commit); // 11
    event Payment(address indexed gambler, uint amount, uint8 betMask, uint8 l, uint8 r, uint betAmount); // 11 11
    event Refund(address indexed gambler, uint amount); // 11 11
    event JackpotPayment(address indexed gambler, uint amount); // 11
    event VIPBenefit(address indexed gambler, uint amount); // VIP 11
    event InviterBenefit(address indexed inviter, address gambler, uint amount, uint betAmount); // 111 11
}

contract CryptoTycoonsDApp {
    address payable internal owner; // 111
    address payable nextOwner;
    address secretSigner;

    mapping(address => bool) internal croupierMap; // 111 11

    address payable internal VIPLibraryAddress; // vip pool address

    modifier onlyOwner {
        require(msg.sender == owner, "OnlyOwner methods called by non-owner.");
        _;
    }

    modifier onlyCroupier {
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

    function approveNextOwner(address payable _nextOwner) external onlyOwner {
        require(_nextOwner != owner, "Cannot approve current owner.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        nextOwner = _nextOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function acceptNextOwner() external {
        require(msg.sender == nextOwner, "Can only accept preapproved new owner.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        owner = nextOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function setSecretSigner(address newSecretSigner) external onlyOwner {
        secretSigner = newSecretSigner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function addCroupier(address newCroupier) external onlyOwner {
        bool isCroupier = croupierMap[newCroupier];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (isCroupier == false) {
            croupierMap[newCroupier] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }

    function deleteCroupier(address newCroupier) external onlyOwner {
        bool isCroupier = croupierMap[newCroupier];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (isCroupier == true) {
            croupierMap[newCroupier] = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }

    function setVIPLibraryAddress(address payable addr) external onlyOwner {
        VIPLibraryAddress = addr;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getMyAccuAmount() external view returns (uint) {
        CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return vipLib.getUserExp(msg.sender);
    }

    function getJackpotSize() external view returns (uint) {
        CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return vipLib.getJackpotSize();
    }

    function getRankingRewardSize() external view returns (uint128) {
        CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return vipLib.getRankingRewardSize();
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
    uint constant BET_EXPIRATION_BLOCKS = 250;

    uint constant HOUSE_EDGE_PERCENT = 1; // amount * 0.01
    uint constant HOUSE_EDGE_MINIMUM_AMOUNT = 0.0004 ether; // 11 houseEdge

    uint constant RANK_FUNDS_PERCENT = 7; // houseEdge * 0.12
    uint constant INVITER_BENEFIT_PERCENT = 7; // houseEdge * 0.09

    uint constant MIN_BET = 0.01 ether; // 11 11 11
    uint constant MAX_BET = 300000 ether; // 11 11 11
    uint constant MIN_JACKPOT_BET = 0.1 ether;
    uint constant JACKPOT_FEE = 0.001 ether;

    uint constant BASE_WIN_RATE = 100000;
}

contract HalfRoulettePure is HalfRouletteConstant {

    function verifyBetMask(uint betMask) public pure {
        bool verify;
        assembly {
            switch betMask
            case 1 /* ODD */{verify := 1}
            case 2 /* EVEN */{verify := 1}
            case 4 /* LEFT */{verify := 1}
            case 8 /* RIGHT */{verify := 1}
            case 5 /* ODD | LEFT */{verify := 1}
            case 9 /* ODD | RIGHT */{verify := 1}
            case 6 /* EVEN | LEFT */{verify := 1}
            case 10 /* EVEN | RIGHT */{verify := 1}
            case 16 /* EQUAL */{verify := 1}
        }
        require(verify, "invalid betMask");
    }

    function getRecoverSigner(uint40 commitLastBlock, uint commit, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes memory message = abi.encodePacked(commitLastBlock, commit);
        bytes32 messageHash = keccak256(abi.encodePacked(prefix, keccak256(message)));
        return ecrecover(messageHash, v, r, s);
    }

    function getWinRate(uint betMask) public pure returns (uint rate) {
        // assembly 1111 constant 11 11
        uint ODD_EVEN_RATE = 50000;
        uint LEFT_RIGHT_RATE = 45833;
        uint MIX_ODD_RATE = 25000;
        uint MIX_EVEN_RATE = 20833;
        uint EQUAL_RATE = 8333;
        assembly {
            switch betMask
            case 1 /* ODD */{rate := ODD_EVEN_RATE}
            case 2 /* EVEN */{rate := ODD_EVEN_RATE}
            case 4 /* LEFT */{rate := LEFT_RIGHT_RATE}
            case 8 /* RIGHT */{rate := LEFT_RIGHT_RATE}
            case 5 /* ODD | LEFT */{rate := MIX_ODD_RATE}
            case 9 /* ODD | RIGHT */{rate := MIX_ODD_RATE}
            case 6 /* EVEN | LEFT */{rate := MIX_EVEN_RATE}
            case 10 /* EVEN | RIGHT */{rate := MIX_EVEN_RATE}
            case 16 /* EQUAL */{rate := EQUAL_RATE}
        }
    }

    function calcHouseEdge(uint amount) public pure returns (uint houseEdge) {
        // 0.02
        houseEdge = amount * HOUSE_EDGE_PERCENT / 100;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (houseEdge < HOUSE_EDGE_MINIMUM_AMOUNT) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            houseEdge = HOUSE_EDGE_MINIMUM_AMOUNT;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }

    function calcJackpotFee(uint amount) public pure returns (uint jackpotFee) {
        // 0.001
        if (amount >= MIN_JACKPOT_BET) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            jackpotFee = JACKPOT_FEE;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }

    function calcRankFundsFee(uint houseEdge) public pure returns (uint rankFundsFee) {
        // 0.07
        rankFundsFee = houseEdge * RANK_FUNDS_PERCENT / 100;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function calcInviterBenefit(uint houseEdge) public pure returns (uint invitationFee) {
        // 0.07
        invitationFee = houseEdge * INVITER_BENEFIT_PERCENT / 100;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getWinAmount(uint betMask, uint amount) public pure returns (uint) {
        uint houseEdge = calcHouseEdge(amount);
        uint jackpotFee = calcJackpotFee(amount);
        uint betAmount = amount - houseEdge - jackpotFee;
        uint rate = getWinRate(betMask);
        return betAmount * BASE_WIN_RATE / rate;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function calcBetResult(uint betMask, bytes32 entropy) public pure returns (bool isWin, uint l, uint r)  {
        uint v = uint(entropy);
        l = (v % 12) + 1;
        r = ((v >> 4) % 12) + 1;
        uint mask = getResultMask(l, r);
        isWin = (betMask & mask) == betMask;
    }

    function getResultMask(uint l, uint r) public pure returns (uint mask) {
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

    function isJackpot(bytes32 entropy, uint amount) public pure returns (bool jackpot) {
        return amount >= MIN_JACKPOT_BET && (uint(entropy) % 1000) == 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function verifyCommit(address signer, uint40 commitLastBlock, uint commit, uint8 v, bytes32 r, bytes32 s) internal pure {
        address recoverSigner = getRecoverSigner(commitLastBlock, commit, v, r, s);
        require(recoverSigner == signer, "failed different signer");
    }

    function startOfDay(uint timestamp) internal pure returns (uint64) {
        return uint64(timestamp - (timestamp % 1 days));
    }

}

contract HalfRoulette is CryptoTycoonsDApp, HalfRouletteEvents, HalfRouletteStruct, HalfRouletteConstant, HalfRoulettePure {
    uint128 internal lockedInBets;

    // Adjustable max bet profit. Used to cap bets against dynamic odds.
    uint internal maxProfit = 10 ether;

    // global variable
    mapping(uint => Bet) internal bets;
    mapping(address => address payable) internal inviterMap;

    function () external payable {}

    function kill() external onlyOwner {
        require(lockedInBets == 0, "All bets should be processed (settled or refunded) before self-destruct.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        selfdestruct(address(owner));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function setMaxProfit(uint _maxProfit) external onlyOwner {
        require(_maxProfit < MAX_BET, "maxProfit should be a sane number.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        maxProfit = _maxProfit;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function placeBet(uint8 betMask, uint commitLastBlock, uint commit, uint8 v, bytes32 r, bytes32 s) public payable {
        Bet storage bet = bets[commit];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(bet.gambler == address(0), "Bet should be in a 'clean' state.");

        // amount checked
        uint amount = msg.value;
        require(amount >= MIN_BET, 'failed amount >= MIN_BET');	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(amount <= MAX_BET, "failed amount <= MAX_BET");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        // allow bet check
        verifyBetMask(betMask);
        // rand seed check
        verifyCommit(secretSigner, uint40(commitLastBlock), commit, v, r, s);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        // house balance check
        uint winAmount = getWinAmount(betMask, amount);
        require(winAmount <= amount + maxProfit, "maxProfit limit violation.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        lockedInBets += uint128(winAmount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(lockedInBets <= address(this).balance, "Cannot afford to lose this bet.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        // save
        emit Commit(commit);
        bet.gambler = msg.sender;
        bet.amount = amount;
        bet.betMask = betMask;
        bet.placeBlockNumber = uint40(block.number);
    }

    function placeBetWithInviter(uint8 betMask, uint commitLastBlock, uint commit, uint8 v, bytes32 r, bytes32 s, address payable inviter) external payable {
        require(inviter != address(0), "inviter != address (0)");
        address preInviter = inviterMap[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (preInviter == address(0)) {
            inviterMap[msg.sender] = inviter;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        placeBet(betMask, commitLastBlock, commit, v, r, s);
    }

    function settleBet(uint reveal, bytes32 blockHash) external onlyCroupier {
        uint commit = uint(keccak256(abi.encodePacked(reveal)));

        Bet storage bet = bets[commit];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint placeBlockNumber = bet.placeBlockNumber;

        // Check that bet has not expired yet (see comment to BET_EXPIRATION_BLOCKS).
        require(block.number > placeBlockNumber, "settleBet in the same block as placeBet, or before.");
        require(block.number <= placeBlockNumber + BET_EXPIRATION_BLOCKS, "Blockhash can't be queried by EVM.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(blockhash(placeBlockNumber) == blockHash);

        // Settle bet using reveal and blockHash as entropy sources.
        settleBetCommon(bet, reveal, blockHash);
    }

    function processVIPBenefit(address gambler, uint amount) internal returns (uint benefitAmount) {
        CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);
        uint rate = vipLib.getVIPBounusRate(gambler);
        if (rate > 0) {
            benefitAmount = amount * rate / 10000;
            emit VIPBenefit(gambler, benefitAmount);
        }
        vipLib.addUserExp(gambler, amount);
    }

    function processJackpot(address payable gambler, bytes32 entropy, uint amount) internal returns (uint benefitAmount) {
        if (isJackpot(entropy, amount)) {
            CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);
            uint jackpotSize = vipLib.getJackpotSize();
            vipLib.payJackpotReward(gambler);
            benefitAmount = jackpotSize;
            emit JackpotPayment(gambler, benefitAmount);
        }
    }

    function processRoulette(address gambler, uint betMask, bytes32 entropy, uint amount) internal returns (uint benefitAmount) {
        uint winAmount = getWinAmount(betMask, amount);
        lockedInBets -= uint128(winAmount);

        (bool isWin, uint l, uint r) = calcBetResult(betMask, entropy);
        benefitAmount = isWin ? winAmount : 0;

        emit Payment(gambler, benefitAmount, uint8(betMask), uint8(l), uint8(r), amount);
    }

    function processInviterBenefit(address gambler, uint betAmount) internal {
        address payable inviter = inviterMap[gambler];
        if (inviter != address(0)) {
            uint houseEdge = calcHouseEdge(betAmount);
            uint inviterBenefit = calcInviterBenefit(houseEdge);
            if (inviter.send(inviterBenefit)) {
                emit InviterBenefit(inviter, gambler, inviterBenefit, betAmount);
            }
        }
    }

    function transferCryptoTycoonsFee(uint amount) internal {
        uint houseEdge = calcHouseEdge(amount);
        uint jackpotFee = calcJackpotFee(amount);
        uint rankFundFee = calcRankFundsFee(houseEdge);

        CryptoTycoonsVIPLib vipLib = CryptoTycoonsVIPLib(VIPLibraryAddress);
        VIPLibraryAddress.transfer(rankFundFee + jackpotFee);
        vipLib.increaseRankingReward(rankFundFee);
        if (jackpotFee > 0) {
            vipLib.increaseJackpot(jackpotFee);
        }
    }

    function settleBetCommon(Bet storage bet, uint reveal, bytes32 entropyBlockHash) internal {
        uint amount = bet.amount;

        // Check that bet is in 'active' state.
        require(amount != 0, "Bet should be in an 'active' state");
        bet.amount = 0;

        // The RNG - combine "reveal" and blockhash of placeBet using Keccak256. Miners
        // are not aware of "reveal" and cannot deduce it from "commit" (as Keccak256
        // preimage is intractable), and house is unable to alter the "reveal" after
        // placeBet have been mined (as Keccak256 collision finding is also intractable).
        bytes32 entropy = keccak256(abi.encodePacked(reveal, entropyBlockHash));

        transferCryptoTycoonsFee(amount);

        uint payout = 0;
        payout += processVIPBenefit(bet.gambler, amount);
        payout += processRoulette(bet.gambler, bet.betMask, entropy, amount);
        processJackpot(bet.gambler, entropy, amount);
        processInviterBenefit(bet.gambler, amount);

        bet.gambler.transfer(payout);
    }

    // Refund transaction - return the bet amount of a roll that was not processed in a due timeframe.
    // Processing such blocks is not possible due to EVM limitations (see BET_EXPIRATION_BLOCKS comment above for details).
    // In case you ever find yourself in a situation like this, just contact the {} support, however nothing precludes you from invoking this method yourself.
    function refundBet(uint commit) external {
        // Check that bet is in 'active' state.
        Bet storage bet = bets[commit];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint amount = bet.amount;

        require(amount != 0, "Bet should be in an 'active' state");

        // Check that bet has already expired.
        require(block.number > bet.placeBlockNumber + BET_EXPIRATION_BLOCKS, "Blockhash can't be queried by EVM.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        // Move bet into 'processed' state, release funds.
        bet.amount = 0;

        uint winAmount = getWinAmount(bet.betMask, amount);
        lockedInBets -= uint128(winAmount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        // Send the refund.
        bet.gambler.transfer(amount);

        emit Refund(bet.gambler, amount);
    }

    // Funds withdrawal to cover costs of HalfRoulette operation.
    function withdrawFunds(address payable beneficiary, uint withdrawAmount) external onlyOwner {
        require(withdrawAmount <= address(this).balance, "Increase amount larger than balance.");
        require(lockedInBets + withdrawAmount <= address(this).balance, "Not enough funds.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        beneficiary.transfer(withdrawAmount);
    }

}