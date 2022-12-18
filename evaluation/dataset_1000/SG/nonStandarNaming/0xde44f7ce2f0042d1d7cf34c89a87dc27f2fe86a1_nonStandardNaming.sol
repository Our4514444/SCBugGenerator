pragma solidity 0.5.6;


contract Ownable {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER699() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "");
        _;
    }

    function TRANSFEROWNERSHIP451(address newOwner) public ONLYOWNER699 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "");
        owner = newOwner;
    }

}


// Developer @gogol
// Design @chechenets
// Architect @tugush

contract Manageable is Ownable {
    mapping(address => bool) public listOfManagers;

    modifier ONLYMANAGER215() {	//inject NONSTANDARD NAMING
        require(listOfManagers[msg.sender], "");
        _;
    }

    function ADDMANAGER787(address _manager) public ONLYOWNER699 returns (bool success) {	//inject NONSTANDARD NAMING
        if (!listOfManagers[_manager]) {
            require(_manager != address(0), "");
            listOfManagers[_manager] = true;
            success = true;
        }
    }

    function REMOVEMANAGER577(address _manager) public ONLYOWNER699 returns (bool success) {	//inject NONSTANDARD NAMING
        if (listOfManagers[_manager]) {
            listOfManagers[_manager] = false;
            success = true;
        }
    }

    function GETINFO927(address _manager) public view returns (bool) {	//inject NONSTANDARD NAMING
        return listOfManagers[_manager];
    }
}

// Developer @gogol
// Design @chechenets
// Architect @tugush

library SafeMath {

    function MUL753(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "");

        return c;
    }

    function DIV170(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, ""); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;

        return c;
    }

    function SUB565(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "");
        uint256 c = a - b;

        return c;
    }

    function ADD6(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "");

        return c;
    }

    function MOD822(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "");
        return a % b;
    }
}


// Developer @gogol
// Design @chechenets
// Architect @tugush

contract iRNG {
    function UPDATE986(uint roundNumber, uint additionalNonce, uint period) public payable;	//inject NONSTANDARD NAMING
}


contract BaseGame is Manageable {
    using SafeMath for uint;

    enum RoundState {NOT_STARTED, ACCEPT_FUNDS, WAIT_RESULT, SUCCESS, REFUND}

    struct Round {
        RoundState state;
        uint ticketsCount;
        uint participantCount;
        TicketsInterval[] tickets;
        address[] participants;
        uint random;
        uint nonce; //xored participants addresses
        uint startRoundTime;
        uint[] winningTickets;
        address[] winners;
        uint roundFunds;
        mapping(address => uint) winnersFunds;
        mapping(address => uint) participantFunds;
        mapping(address => bool) sendGain;
    }

    struct TicketsInterval {
        address participant;
        uint firstTicket;
        uint lastTicket;
    }

    uint constant public number_of_winners933 = 10;	//inject NONSTANDARD NAMING
    uint constant public share_denominator707 = 10000;	//inject NONSTANDARD NAMING
    uint constant public oraclize_timeout991 = 86400;  // one day	//inject NONSTANDARD NAMING
    uint[] public shareOfWinners = [5000, 2500, 1250, 620, 320, 160, 80, 40, 20, 10];
    address payable public organiser;
    uint constant public organiser_percent297 = 20;	//inject NONSTANDARD NAMING
    uint constant public round_fund_percent798 = 80;	//inject NONSTANDARD NAMING

    uint public period;
    address public hourlyGame;
    address public management;
    address payable public rng;

    mapping (uint => Round) public rounds;

    uint public ticketPrice;
    uint public currentRound;

    event GAMESTARTED29(uint start);	//inject NONSTANDARD NAMING
    event ROUNDSTATECHANGED722(uint currentRound, RoundState state);	//inject NONSTANDARD NAMING
    event PARTICIPANTADDED873(uint round, address participant, uint ticketsCount, uint funds);	//inject NONSTANDARD NAMING
    event ROUNDPROCECCED662(uint round, address[] winners, uint[] winningTickets, uint roundFunds);	//inject NONSTANDARD NAMING
    event REFUNDISSUCCESS240(uint round, address participant, uint funds);	//inject NONSTANDARD NAMING
    event REFUNDISFAILED309(uint round, address participant);	//inject NONSTANDARD NAMING
    event WITHDRAW168(address participant, uint funds, uint fromRound, uint toRound);	//inject NONSTANDARD NAMING
    event TICKETPRICECHANGED552(uint price);	//inject NONSTANDARD NAMING

    modifier ONLYRNG935 {	//inject NONSTANDARD NAMING
        require(msg.sender == address(rng), "");
        _;
    }

    modifier ONLYGAMECONTRACT640 {	//inject NONSTANDARD NAMING
        require(msg.sender == address(hourlyGame) || msg.sender == management, "");
        _;
    }

    constructor (address payable _rng, uint _period) public {
        require(_rng != address(0), "");
        require(_period >= 60, "");

        rng = _rng;
        period = _period;
    }

    function SETCONTRACTS366(address payable _rng, address _hourlyGame, address _management) public ONLYOWNER699 {	//inject NONSTANDARD NAMING
        require(_rng != address(0), "");
        require(_hourlyGame != address(0), "");
        require(_management != address(0), "");

        rng = _rng;
        hourlyGame = _hourlyGame;
        management = _management;
    }

    function STARTGAME115(uint _startPeriod) public payable ONLYGAMECONTRACT640 {	//inject NONSTANDARD NAMING
        currentRound = 1;
        uint time = GETCURRENTTIME453().ADD6(_startPeriod).SUB565(period);
        rounds[currentRound].startRoundTime = time;
        rounds[currentRound].state = RoundState.ACCEPT_FUNDS;

        iRNG(rng).UPDATE986.value(msg.value)(currentRound, 0, _startPeriod);

        emit GAMESTARTED29(time);
    }

    function BUYTICKETS223(address _participant) public payable ONLYGAMECONTRACT640 {	//inject NONSTANDARD NAMING
        uint funds = msg.value;

        UPDATEROUNDTIMEANDSTATE379();
        ADDPARTICIPANT907(_participant, funds.DIV170(ticketPrice));
        UPDATEROUNDFUNDSANDPARTICIPANTS919(_participant, funds);

        if (GETCURRENTTIME453() > rounds[currentRound].startRoundTime.ADD6(period) &&
            rounds[currentRound].participantCount >= 10
        ) {
            _RESTARTGAME708();
        }
    }

    function BUYBONUSTICKETS816(address _participant, uint _ticketsCount) public payable ONLYGAMECONTRACT640 {	//inject NONSTANDARD NAMING
        UPDATEROUNDTIMEANDSTATE379();
        ADDPARTICIPANT907(_participant, _ticketsCount);
        UPDATEROUNDFUNDSANDPARTICIPANTS919(_participant, uint(0));

        if (GETCURRENTTIME453() > rounds[currentRound].startRoundTime.ADD6(period) &&
            rounds[currentRound].participantCount >= 10
        ) {
            _RESTARTGAME708();
        }
    }

    function PROCESSROUND850(uint _round, uint _randomNumber) public payable ONLYRNG935 returns (bool) {	//inject NONSTANDARD NAMING
        if (rounds[_round].winners.length != 0) {
            return true;
        }

        if (CHECKROUNDSTATE130(_round) == RoundState.REFUND) {
            return true;
        }

        if (rounds[_round].participantCount < 10) {
            rounds[_round].state = RoundState.ACCEPT_FUNDS;
            emit ROUNDSTATECHANGED722(_round, rounds[_round].state);
            return true;
        }

        rounds[_round].random = _randomNumber;
        FINDWINTICKETS714(_round);
        FINDWINNERS839(_round);
        rounds[_round].state = RoundState.SUCCESS;
        emit ROUNDSTATECHANGED722(_round, rounds[_round].state);

        if (rounds[_round.ADD6(1)].state == RoundState.NOT_STARTED) {
            currentRound = _round.ADD6(1);
            rounds[currentRound].state = RoundState.ACCEPT_FUNDS;
            emit ROUNDSTATECHANGED722(currentRound, rounds[currentRound].state);
        }

        emit ROUNDPROCECCED662(_round, rounds[_round].winners, rounds[_round].winningTickets, rounds[_round].roundFunds);
        GETRANDOMNUMBER148(_round + 1, rounds[_round].nonce);
        return true;
    }

    function RESTARTGAME347() public payable ONLYOWNER699 {	//inject NONSTANDARD NAMING
        _RESTARTGAME708();
    }

    function GETRANDOMNUMBER148(uint _round, uint _nonce) public payable ONLYRNG935 {	//inject NONSTANDARD NAMING
        iRNG(rng).UPDATE986(_round, _nonce, period);
    }

    function SETTICKETPRICE382(uint _ticketPrice) public ONLYGAMECONTRACT640 {	//inject NONSTANDARD NAMING
        require(_ticketPrice > 0, "");

        emit TICKETPRICECHANGED552(_ticketPrice);
        ticketPrice = _ticketPrice;
    }

    function FINDWINTICKETS714(uint _round) public {	//inject NONSTANDARD NAMING
        uint[10] memory winners = _FINDWINTICKETS229(rounds[_round].random, rounds[_round].ticketsCount);

        for (uint i = 0; i < 10; i++) {
            rounds[_round].winningTickets.push(winners[i]);
        }
    }

    function _FINDWINTICKETS229(uint _random, uint _ticketsNum) public pure returns (uint[10] memory) {	//inject NONSTANDARD NAMING
        uint random = _random;//uint(keccak256(abi.encodePacked(_random)));
        uint winnersNum = 10;

        uint[10] memory winTickets;
        uint shift = uint(256).DIV170(winnersNum);

        for (uint i = 0; i < 10; i++) {
            winTickets[i] =
            uint(keccak256(abi.encodePacked(((random << (i.MUL753(shift))) >> (shift.MUL753(winnersNum.SUB565(1)).ADD6(6)))))).MOD822(_ticketsNum);
        }

        return winTickets;
    }

    function REFUND315(uint _round) public {	//inject NONSTANDARD NAMING
        if (CHECKROUNDSTATE130(_round) == RoundState.REFUND
        && rounds[_round].participantFunds[msg.sender] > 0
        ) {
            uint amount = rounds[_round].participantFunds[msg.sender];
            rounds[_round].participantFunds[msg.sender] = 0;
            address(msg.sender).transfer(amount);
            emit REFUNDISSUCCESS240(_round, msg.sender, amount);
        } else {
            emit REFUNDISFAILED309(_round, msg.sender);
        }
    }

    function CHECKROUNDSTATE130(uint _round) public returns (RoundState) {	//inject NONSTANDARD NAMING
        if (rounds[_round].state == RoundState.WAIT_RESULT
        && GETCURRENTTIME453() > rounds[_round].startRoundTime.ADD6(oraclize_timeout991)
        ) {
            rounds[_round].state = RoundState.REFUND;
            emit ROUNDSTATECHANGED722(_round, rounds[_round].state);
        }
        return rounds[_round].state;
    }

    function SETORGANISER940(address payable _organiser) public ONLYOWNER699 {	//inject NONSTANDARD NAMING
        require(_organiser != address(0), "");

        organiser = _organiser;
    }

   function GETGAIN285(uint _fromRound, uint _toRound) public {	//inject NONSTANDARD NAMING
        _TRANSFERGAIN810(msg.sender, _fromRound, _toRound);
    }

    function SENDGAIN892(address payable _participant, uint _fromRound, uint _toRound) public ONLYMANAGER215 {	//inject NONSTANDARD NAMING
        _TRANSFERGAIN810(_participant, _fromRound, _toRound);
    }

    function GETTICKETSCOUNT866(uint _round) public view returns (uint) {	//inject NONSTANDARD NAMING
        return rounds[_round].ticketsCount;
    }

    function GETTICKETPRICE59() public view returns (uint) {	//inject NONSTANDARD NAMING
        return ticketPrice;
    }

    function GETCURRENTTIME453() public view returns (uint) {	//inject NONSTANDARD NAMING
        return now;
    }

    function GETPERIOD87() public view returns (uint) {	//inject NONSTANDARD NAMING
        return period;
    }

    function GETROUNDWINNERS484(uint _round) public view returns (address[] memory) {	//inject NONSTANDARD NAMING
        return rounds[_round].winners;
    }

    function GETROUNDWINNINGTICKETS451(uint _round) public view returns (uint[] memory) {	//inject NONSTANDARD NAMING
        return rounds[_round].winningTickets;
    }

    function GETROUNDPARTICIPANTS926(uint _round) public view returns (address[] memory) {	//inject NONSTANDARD NAMING
        return rounds[_round].participants;
    }

    function GETWINNINGFUNDS924(uint _round, address _winner) public view returns  (uint) {	//inject NONSTANDARD NAMING
        return rounds[_round].winnersFunds[_winner];
    }

    function GETROUNDFUNDS854(uint _round) public view returns (uint) {	//inject NONSTANDARD NAMING
        return rounds[_round].roundFunds;
    }

    function GETPARTICIPANTFUNDS618(uint _round, address _participant) public view returns (uint) {	//inject NONSTANDARD NAMING
        return rounds[_round].participantFunds[_participant];
    }

    function GETCURRENTROUND479() public view returns (uint) {	//inject NONSTANDARD NAMING
        return currentRound;
    }

    function GETROUNDSTARTTIME752(uint _round) public view returns (uint) {	//inject NONSTANDARD NAMING
        return rounds[_round].startRoundTime;
    }

    function _RESTARTGAME708() internal {	//inject NONSTANDARD NAMING
        uint _now = GETCURRENTTIME453().SUB565(rounds[1].startRoundTime);
        rounds[currentRound].startRoundTime = GETCURRENTTIME453().SUB565(_now.MOD822(period));
        rounds[currentRound].state = RoundState.ACCEPT_FUNDS;
        emit ROUNDSTATECHANGED722(currentRound, rounds[currentRound].state);
        iRNG(rng).UPDATE986(currentRound, 0, period.SUB565(_now.MOD822(period)));
    }

    function _TRANSFERGAIN810(address payable _participant, uint _fromRound, uint _toRound) internal {	//inject NONSTANDARD NAMING
        require(_fromRound <= _toRound, "");
        require(_participant != address(0), "");

        uint funds;

        for (uint i = _fromRound; i <= _toRound; i++) {

            if (rounds[i].state == RoundState.SUCCESS
            && rounds[i].sendGain[_participant] == false) {

                rounds[i].sendGain[_participant] = true;
                funds = funds.ADD6(GETWINNINGFUNDS924(i, _participant));
            }
        }

        require(funds > 0, "");
        _participant.transfer(funds);
        emit WITHDRAW168(_participant, funds, _fromRound, _toRound);

    }

    // find participant who has winning ticket
    // to start: _begin is 0, _end is last index in ticketsInterval array
    function GETWINNER363(	//inject NONSTANDARD NAMING
        uint _round,
        uint _beginInterval,
        uint _endInterval,
        uint _winningTicket
    )
        internal
        returns (address)
    {
        if (_beginInterval == _endInterval) {
            return rounds[_round].tickets[_beginInterval].participant;
        }

        uint len = _endInterval.ADD6(1).SUB565(_beginInterval);
        uint mid = _beginInterval.ADD6((len.DIV170(2))).SUB565(1);
        TicketsInterval memory interval = rounds[_round].tickets[mid];

        if (_winningTicket < interval.firstTicket) {
            return GETWINNER363(_round, _beginInterval, mid, _winningTicket);
        } else if (_winningTicket > interval.lastTicket) {
            return GETWINNER363(_round, mid.ADD6(1), _endInterval, _winningTicket);
        } else {
            return interval.participant;
        }
    }

    function ADDPARTICIPANT907(address _participant, uint _ticketsCount) internal {	//inject NONSTANDARD NAMING
        rounds[currentRound].participants.push(_participant);
        uint currTicketsCount = rounds[currentRound].ticketsCount;
        rounds[currentRound].ticketsCount = currTicketsCount.ADD6(_ticketsCount);
        rounds[currentRound].tickets.push(TicketsInterval(
                _participant,
                currTicketsCount,
                rounds[currentRound].ticketsCount.SUB565(1))
        );
        rounds[currentRound].nonce = rounds[currentRound].nonce + uint(keccak256(abi.encodePacked(_participant)));
        emit PARTICIPANTADDED873(currentRound, _participant, _ticketsCount, _ticketsCount.MUL753(ticketPrice));
    }

    function UPDATEROUNDTIMEANDSTATE379() internal {	//inject NONSTANDARD NAMING
        if (GETCURRENTTIME453() > rounds[currentRound].startRoundTime.ADD6(period)
            && rounds[currentRound].participantCount >= 10
        ) {
            rounds[currentRound].state = RoundState.WAIT_RESULT;
            emit ROUNDSTATECHANGED722(currentRound, rounds[currentRound].state);
            currentRound = currentRound.ADD6(1);
            rounds[currentRound].startRoundTime = rounds[currentRound-1].startRoundTime.ADD6(period);
            rounds[currentRound].state = RoundState.ACCEPT_FUNDS;
            emit ROUNDSTATECHANGED722(currentRound, rounds[currentRound].state);
        }
    }

    function UPDATEROUNDFUNDSANDPARTICIPANTS919(address _participant, uint _funds) internal {	//inject NONSTANDARD NAMING

        if (rounds[currentRound].participantFunds[_participant] == 0) {
            rounds[currentRound].participantCount = rounds[currentRound].participantCount.ADD6(1);
        }

        rounds[currentRound].participantFunds[_participant] =
        rounds[currentRound].participantFunds[_participant].ADD6(_funds);

        rounds[currentRound].roundFunds =
        rounds[currentRound].roundFunds.ADD6(_funds);
    }

    function FINDWINNERS839(uint _round) internal {	//inject NONSTANDARD NAMING
        address winner;
        uint fundsToWinner;
        for (uint i = 0; i < number_of_winners933; i++) {
            winner = GETWINNER363(
                _round,
                0,
                (rounds[_round].tickets.length).SUB565(1),
                rounds[_round].winningTickets[i]
            );

            rounds[_round].winners.push(winner);
            fundsToWinner = rounds[_round].roundFunds.MUL753(shareOfWinners[i]).DIV170(share_denominator707);
            rounds[_round].winnersFunds[winner] = rounds[_round].winnersFunds[winner].ADD6(fundsToWinner);
        }
    }


}


// Developer @gogol
// Design @chechenets
// Architect @tugush

contract YearlyGame is BaseGame {

    constructor(
        address payable _rng,
        uint _period
    )
        public
        BaseGame(_rng, _period) {

    }
}


// Developer @gogol
// Design @chechenets
// Architect @tugush