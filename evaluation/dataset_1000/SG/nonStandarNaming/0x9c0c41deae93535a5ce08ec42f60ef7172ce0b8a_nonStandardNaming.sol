pragma solidity ^0.5.4;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

library SafeMath {
    function MUL90(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (_a == 0) {
            return 0;
        }
        uint256 c = _a * _b;
        require(c / _a == _b);
        return c;
    }

    function DIV178(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(_b > 0);
        uint256 c = _a / _b;
        return c;
    }

    function SUB586(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(_b <= _a);
        uint256 c = _a - _b;
        return c;
    }

    function ADD103(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = _a + _b;
        require(c >= _a);
        return c;
    }

    function MOD544(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

contract Ownable {
    address public owner;

    event OWNERSHIPRENOUNCED260(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED62(	//inject NONSTANDARD NAMING
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER168() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    function RENOUNCEOWNERSHIP820() public ONLYOWNER168 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED260(owner);
        owner = address(0);
    }

    function TRANSFEROWNERSHIP297(address _newOwner) public ONLYOWNER168 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP423(_newOwner);
    }

    function _TRANSFEROWNERSHIP423(address _newOwner) internal {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0));
        emit OWNERSHIPTRANSFERRED62(owner, _newOwner);
        owner = _newOwner;
    }
}

contract Wallet is Ownable {
    using SafeMath for uint256;

    LotteryData public lotteryData;

    uint256 public minPaymnent = 10**16;

    function SETMINPAYMENT429(uint256 value) public ONLYOWNER168 {	//inject NONSTANDARD NAMING
        minPaymnent = value;
    }

    constructor() public {
        lotteryData = LotteryData(msg.sender);
    }

    function() payable external {
        require(msg.value >= minPaymnent);
        lotteryData.PARTICIPATE148(msg.sender, msg.value);
    }

    function FINISHDAY821() external returns(uint256) {	//inject NONSTANDARD NAMING
        require(msg.sender == address(lotteryData));
        uint256 balance = address(this).balance;
        if (balance >= minPaymnent) {
            lotteryData.GETFUNDS690.value(balance)();
            return balance;
        } else {
            return 0;
        }
    }
}

contract LotteryData is Ownable {
    using SafeMath for uint;

    event WITHDRAWN156(address indexed payee, uint256 weiAmount);	//inject NONSTANDARD NAMING
    event DEPOSITED701(address indexed payee, uint256 weiAmount);	//inject NONSTANDARD NAMING
    event WINNERWALLET446(address indexed wallet, uint256 bank);	//inject NONSTANDARD NAMING

    Wallet public wallet_0 = new Wallet();
    Wallet public wallet_1 = new Wallet();
    Wallet public wallet_2 = new Wallet();

    uint256 public finishTime;
    uint256 constant roundtime264 = 86400;	//inject NONSTANDARD NAMING

    uint internal dilemma;
    uint internal max_participators = 100;
    uint internal participators;
    uint internal randNonce = 19;
    uint internal winner;
    uint internal winner_1;
    uint internal winner_2;
    uint256 internal fund;
    uint256 internal commission;
    uint256 internal totalBetsWithoutCommission;

    mapping(uint => address) public wallets;
    mapping(address => mapping (address => uint256)) public playersBets;
    mapping(address => mapping (uint => address)) public players;
    mapping(address => uint256) public totalBets;
    mapping(address => uint) public totalPlayers;
    mapping(address => uint256) private _deposits;

    uint public games;

    struct wins{
        address winner;
        uint256 time;
    }

    mapping(uint => wins) public gamesLog;

    constructor() public {
        wallets[0] = address(wallet_0);
        wallets[1] = address(wallet_1);
        wallets[2] = address(wallet_2);
        finishTime = now.ADD103(roundtime264);
    }

    modifier VALIDWALLETS655() {	//inject NONSTANDARD NAMING
        require(
            msg.sender == address(wallet_0) ||
            msg.sender == address(wallet_1) ||
            msg.sender == address(wallet_2)
        );
        _;
    }

    function DEPOSITSOF214(address payee) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _deposits[payee];
    }

    function DEPOSIT472(address payee, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _deposits[payee] = _deposits[payee].ADD103(amount);
        emit DEPOSITED701(payee, amount);
    }

    function GETFUNDS690() public payable VALIDWALLETS655 {}	//inject NONSTANDARD NAMING

    function LASTWINNER471() public view returns(address) {	//inject NONSTANDARD NAMING
        return gamesLog[games].winner;
    }

    function GETRANDOMWALLET672() internal returns(uint) {	//inject NONSTANDARD NAMING
        uint result = uint(keccak256(abi.encodePacked(now, randNonce, blockhash(block.number - 1)))) % 3;
        randNonce = randNonce.ADD103(result.ADD103(2));
        return result;
    }

    function _FUNDRISER677() internal returns(uint256) {	//inject NONSTANDARD NAMING
        fund = fund.ADD103(wallet_0.FINISHDAY821());
        fund = fund.ADD103(wallet_1.FINISHDAY821());
        return fund.ADD103(wallet_2.FINISHDAY821());
    }

    function _RANDOMIZER627() internal returns(uint) {	//inject NONSTANDARD NAMING
        // random choose one of three wallets
        winner = GETRANDOMWALLET672();
        // check if this address had payments, if no solving it
        if(totalPlayers[wallets[winner]] == 0) {
            dilemma = uint(keccak256(abi.encodePacked(now, winner, blockhash(block.number - 1)))) % 2;
            if(winner == 0) {
                if(dilemma == 1) {
                    winner_1 = 2; winner_2 = 1;
                } else {
                    winner_1 = 1; winner_2 = 2;
                }
            }
            if(winner == 1) {
                if(dilemma == 1) {
                    winner_1 = 2; winner_2 = 0;
                } else {
                    winner_1 = 0; winner_2 = 2;
                }
            }
            if(winner == 2) {
                if(dilemma == 1) {
                    winner_1 = 1; winner_2 = 0;
                } else {
                    winner_1 = 0; winner_2 = 1;
                }
            }
            winner = (totalPlayers[wallets[winner_1]] == 0) ? winner_2 : winner_1;
        }

        return winner;
    }

    function _DISTRIBUTE256() internal {	//inject NONSTANDARD NAMING
        // calculate commission
        commission = fund.MUL90(15).DIV178(100);
        totalBetsWithoutCommission = fund.SUB586(commission);
        DEPOSIT472(owner, commission);
        // calculate and make deposits
        for (uint i = 0; i < totalPlayers[wallets[winner]]; i++) {
            uint percents = playersBets[wallets[winner]][players[wallets[winner]][i]].MUL90(10000).DIV178(totalBets[wallets[winner]]);
            DEPOSIT472(players[wallets[winner]][i], totalBetsWithoutCommission.MUL90(percents).DIV178(10000));
        }
    }

    function _COLLECTOR573() internal {	//inject NONSTANDARD NAMING
        fund = 0;
        participators = 0;
        totalBets[wallets[0]] = 0;
        for (uint j = 0; j < 3; j++) {
            for (uint k = 0; k < totalPlayers[wallets[j]]; k++) {
                playersBets[wallets[j]][players[wallets[j]][k]] = 0;
                players[wallets[j]][k] = address(0x0);
            }
            totalBets[wallets[j]] = 0;
            totalPlayers[wallets[j]] = 0;
        }
    }

    function _LOGGER453(address _winner, uint256 _fund) internal {	//inject NONSTANDARD NAMING
        games = games + 1;
        gamesLog[games].winner =_winner;
        gamesLog[games].time = now;
        emit WINNERWALLET446(_winner, _fund);
    }

    function PARTICIPATE148(address player, uint256 amount) external VALIDWALLETS655 {	//inject NONSTANDARD NAMING
        if (now >= finishTime || participators >= max_participators) {
            // send all funds to this wallet
            fund = _FUNDRISER677();
            // if it has participators
            if(fund > 0) {
                // get winner
                winner = _RANDOMIZER627();
                // _distribute
                _DISTRIBUTE256();
                // clear state
                _COLLECTOR573();
                // log data
                _LOGGER453(wallets[winner], fund);
            }
            // update round
            finishTime = now.ADD103(roundtime264);
        }

        if (playersBets[msg.sender][player] == 0) {
            players[msg.sender][totalPlayers[msg.sender]] = player;
            totalPlayers[msg.sender] = totalPlayers[msg.sender].ADD103(1);
            participators = participators.ADD103(1);
        }
        playersBets[msg.sender][player] = playersBets[msg.sender][player].ADD103(amount);
        totalBets[msg.sender] = totalBets[msg.sender].ADD103(amount);
    }

                                                                   
    function WITHDRAW201() public {	//inject NONSTANDARD NAMING
        uint256 payment = _deposits[msg.sender];
        _deposits[msg.sender] = 0;
        msg.sender.transfer(payment);
        emit WITHDRAWN156(msg.sender, payment);
    }

    function PAYMENTVALIDATOR98(address _payee, uint256 _amount) internal {	//inject NONSTANDARD NAMING
        if(_payee != address(wallet_0) &&
           _payee != address(wallet_1) &&
           _payee != address(wallet_2))
        {
            if(_amount == uint(0)) {
                if(DEPOSITSOF214(_payee) != uint(0)) {
                    WITHDRAW201();
                } else {
                    revert("You have zero balance");
                }
            } else {
                revert("You can't do nonzero transaction");
            }
        }
    }

    function() external payable {
        PAYMENTVALIDATOR98(msg.sender, msg.value);
    }
}