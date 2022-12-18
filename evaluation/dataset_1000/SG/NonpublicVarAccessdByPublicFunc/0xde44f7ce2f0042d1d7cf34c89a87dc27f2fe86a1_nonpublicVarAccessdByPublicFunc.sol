pragma solidity 0.5.6;


contract Ownable {
    address internal owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "");
        owner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

}


// Developer @gogol
// Design @chechenets
// Architect @tugush

contract Manageable is Ownable {
    mapping(address => bool) internal listOfManagers;

    modifier onlyManager() {
        require(listOfManagers[msg.sender], "");
        _;
    }

    function addManager(address _manager) public onlyOwner returns (bool success) {
        if (!listOfManagers[_manager]) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            require(_manager != address(0), "");
            listOfManagers[_manager] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            success = true;
        }
    }

    function removeManager(address _manager) public onlyOwner returns (bool success) {
        if (listOfManagers[_manager]) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            listOfManagers[_manager] = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            success = true;
        }
    }

    function getInfo(address _manager) public view returns (bool) {
        return listOfManagers[_manager];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}

// Developer @gogol
// Design @chechenets
// Architect @tugush

library SafeMath {

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, ""); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "");
        uint256 c = a - b;

        return c;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "");

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "");
        return a % b;
    }
}


// Developer @gogol
// Design @chechenets
// Architect @tugush

contract iRNG {
    function update(uint roundNumber, uint additionalNonce, uint period) public payable;
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

    uint constant public NUMBER_OF_WINNERS = 10;
    uint constant public SHARE_DENOMINATOR = 10000;
    uint constant internal ORACLIZE_TIMEOUT = 86400;  // one day
    uint[] public shareOfWinners = [5000, 2500, 1250, 620, 320, 160, 80, 40, 20, 10];
    address payable internal organiser;
    uint constant public ORGANISER_PERCENT = 20;
    uint constant public ROUND_FUND_PERCENT = 80;

    uint internal period;
    address internal hourlyGame;
    address internal management;
    address payable internal rng;

    mapping (uint => Round) internal rounds;

    uint internal ticketPrice;
    uint internal currentRound;

    event GameStarted(uint start);
    event RoundStateChanged(uint currentRound, RoundState state);
    event ParticipantAdded(uint round, address participant, uint ticketsCount, uint funds);
    event RoundProcecced(uint round, address[] winners, uint[] winningTickets, uint roundFunds);
    event RefundIsSuccess(uint round, address participant, uint funds);
    event RefundIsFailed(uint round, address participant);
    event Withdraw(address participant, uint funds, uint fromRound, uint toRound);
    event TicketPriceChanged(uint price);

    modifier onlyRng {
        require(msg.sender == address(rng), "");
        _;
    }

    modifier onlyGameContract {
        require(msg.sender == address(hourlyGame) || msg.sender == management, "");
        _;
    }

    constructor (address payable _rng, uint _period) public {
        require(_rng != address(0), "");
        require(_period >= 60, "");

        rng = _rng;
        period = _period;
    }

    function setContracts(address payable _rng, address _hourlyGame, address _management) public onlyOwner {
        require(_rng != address(0), "");
        require(_hourlyGame != address(0), "");
        require(_management != address(0), "");

        rng = _rng;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        hourlyGame = _hourlyGame;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        management = _management;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function startGame(uint _startPeriod) public payable onlyGameContract {
        currentRound = 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        uint time = getCurrentTime().add(_startPeriod).sub(period);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        rounds[currentRound].startRoundTime = time;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        rounds[currentRound].state = RoundState.ACCEPT_FUNDS;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        iRNG(rng).update.value(msg.value)(currentRound, 0, _startPeriod);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        emit GameStarted(time);
    }

    function buyTickets(address _participant) public payable onlyGameContract {
        uint funds = msg.value;

        updateRoundTimeAndState();
        addParticipant(_participant, funds.div(ticketPrice));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        updateRoundFundsAndParticipants(_participant, funds);

        if (getCurrentTime() > rounds[currentRound].startRoundTime.add(period) &&	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            rounds[currentRound].participantCount >= 10	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ) {
            _restartGame();
        }
    }

    function buyBonusTickets(address _participant, uint _ticketsCount) public payable onlyGameContract {
        updateRoundTimeAndState();
        addParticipant(_participant, _ticketsCount);
        updateRoundFundsAndParticipants(_participant, uint(0));

        if (getCurrentTime() > rounds[currentRound].startRoundTime.add(period) &&	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            rounds[currentRound].participantCount >= 10	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ) {
            _restartGame();
        }
    }

    function processRound(uint _round, uint _randomNumber) public payable onlyRng returns (bool) {
        if (rounds[_round].winners.length != 0) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return true;
        }

        if (checkRoundState(_round) == RoundState.REFUND) {
            return true;
        }

        if (rounds[_round].participantCount < 10) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            rounds[_round].state = RoundState.ACCEPT_FUNDS;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit RoundStateChanged(_round, rounds[_round].state);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            return true;
        }

        rounds[_round].random = _randomNumber;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        findWinTickets(_round);
        findWinners(_round);
        rounds[_round].state = RoundState.SUCCESS;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit RoundStateChanged(_round, rounds[_round].state);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        if (rounds[_round.add(1)].state == RoundState.NOT_STARTED) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            currentRound = _round.add(1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            rounds[currentRound].state = RoundState.ACCEPT_FUNDS;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit RoundStateChanged(currentRound, rounds[currentRound].state);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }

        emit RoundProcecced(_round, rounds[_round].winners, rounds[_round].winningTickets, rounds[_round].roundFunds);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        getRandomNumber(_round + 1, rounds[_round].nonce);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return true;
    }

    function restartGame() public payable onlyOwner {
        _restartGame();
    }

    function getRandomNumber(uint _round, uint _nonce) public payable onlyRng {
        iRNG(rng).update(_round, _nonce, period);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function setTicketPrice(uint _ticketPrice) public onlyGameContract {
        require(_ticketPrice > 0, "");

        emit TicketPriceChanged(_ticketPrice);
        ticketPrice = _ticketPrice;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function findWinTickets(uint _round) public {
        uint[10] memory winners = _findWinTickets(rounds[_round].random, rounds[_round].ticketsCount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        for (uint i = 0; i < 10; i++) {
            rounds[_round].winningTickets.push(winners[i]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }

    function _findWinTickets(uint _random, uint _ticketsNum) public pure returns (uint[10] memory) {
        uint random = _random;//uint(keccak256(abi.encodePacked(_random)));
        uint winnersNum = 10;

        uint[10] memory winTickets;
        uint shift = uint(256).div(winnersNum);

        for (uint i = 0; i < 10; i++) {
            winTickets[i] =
            uint(keccak256(abi.encodePacked(((random << (i.mul(shift))) >> (shift.mul(winnersNum.sub(1)).add(6)))))).mod(_ticketsNum);
        }

        return winTickets;
    }

    function refund(uint _round) public {
        if (checkRoundState(_round) == RoundState.REFUND
        && rounds[_round].participantFunds[msg.sender] > 0	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ) {
            uint amount = rounds[_round].participantFunds[msg.sender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            rounds[_round].participantFunds[msg.sender] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            address(msg.sender).transfer(amount);
            emit RefundIsSuccess(_round, msg.sender, amount);
        } else {
            emit RefundIsFailed(_round, msg.sender);
        }
    }

    function checkRoundState(uint _round) public returns (RoundState) {
        if (rounds[_round].state == RoundState.WAIT_RESULT	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        && getCurrentTime() > rounds[_round].startRoundTime.add(ORACLIZE_TIMEOUT)	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        ) {
            rounds[_round].state = RoundState.REFUND;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            emit RoundStateChanged(_round, rounds[_round].state);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        return rounds[_round].state;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function setOrganiser(address payable _organiser) public onlyOwner {
        require(_organiser != address(0), "");

        organiser = _organiser;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

   function getGain(uint _fromRound, uint _toRound) public {
        _transferGain(msg.sender, _fromRound, _toRound);
    }

    function sendGain(address payable _participant, uint _fromRound, uint _toRound) public onlyManager {
        _transferGain(_participant, _fromRound, _toRound);
    }

    function getTicketsCount(uint _round) public view returns (uint) {
        return rounds[_round].ticketsCount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getTicketPrice() public view returns (uint) {
        return ticketPrice;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getCurrentTime() public view returns (uint) {
        return now;
    }

    function getPeriod() public view returns (uint) {
        return period;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getRoundWinners(uint _round) public view returns (address[] memory) {
        return rounds[_round].winners;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getRoundWinningTickets(uint _round) public view returns (uint[] memory) {
        return rounds[_round].winningTickets;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getRoundParticipants(uint _round) public view returns (address[] memory) {
        return rounds[_round].participants;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getWinningFunds(uint _round, address _winner) public view returns  (uint) {
        return rounds[_round].winnersFunds[_winner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getRoundFunds(uint _round) public view returns (uint) {
        return rounds[_round].roundFunds;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getParticipantFunds(uint _round, address _participant) public view returns (uint) {
        return rounds[_round].participantFunds[_participant];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getCurrentRound() public view returns (uint) {
        return currentRound;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getRoundStartTime(uint _round) public view returns (uint) {
        return rounds[_round].startRoundTime;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function _restartGame() internal {
        uint _now = getCurrentTime().sub(rounds[1].startRoundTime);
        rounds[currentRound].startRoundTime = getCurrentTime().sub(_now.mod(period));
        rounds[currentRound].state = RoundState.ACCEPT_FUNDS;
        emit RoundStateChanged(currentRound, rounds[currentRound].state);
        iRNG(rng).update(currentRound, 0, period.sub(_now.mod(period)));
    }

    function _transferGain(address payable _participant, uint _fromRound, uint _toRound) internal {
        require(_fromRound <= _toRound, "");
        require(_participant != address(0), "");

        uint funds;

        for (uint i = _fromRound; i <= _toRound; i++) {

            if (rounds[i].state == RoundState.SUCCESS
            && rounds[i].sendGain[_participant] == false) {

                rounds[i].sendGain[_participant] = true;
                funds = funds.add(getWinningFunds(i, _participant));
            }
        }

        require(funds > 0, "");
        _participant.transfer(funds);
        emit Withdraw(_participant, funds, _fromRound, _toRound);

    }

    // find participant who has winning ticket
    // to start: _begin is 0, _end is last index in ticketsInterval array
    function getWinner(
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

        uint len = _endInterval.add(1).sub(_beginInterval);
        uint mid = _beginInterval.add((len.div(2))).sub(1);
        TicketsInterval memory interval = rounds[_round].tickets[mid];

        if (_winningTicket < interval.firstTicket) {
            return getWinner(_round, _beginInterval, mid, _winningTicket);
        } else if (_winningTicket > interval.lastTicket) {
            return getWinner(_round, mid.add(1), _endInterval, _winningTicket);
        } else {
            return interval.participant;
        }
    }

    function addParticipant(address _participant, uint _ticketsCount) internal {
        rounds[currentRound].participants.push(_participant);
        uint currTicketsCount = rounds[currentRound].ticketsCount;
        rounds[currentRound].ticketsCount = currTicketsCount.add(_ticketsCount);
        rounds[currentRound].tickets.push(TicketsInterval(
                _participant,
                currTicketsCount,
                rounds[currentRound].ticketsCount.sub(1))
        );
        rounds[currentRound].nonce = rounds[currentRound].nonce + uint(keccak256(abi.encodePacked(_participant)));
        emit ParticipantAdded(currentRound, _participant, _ticketsCount, _ticketsCount.mul(ticketPrice));
    }

    function updateRoundTimeAndState() internal {
        if (getCurrentTime() > rounds[currentRound].startRoundTime.add(period)
            && rounds[currentRound].participantCount >= 10
        ) {
            rounds[currentRound].state = RoundState.WAIT_RESULT;
            emit RoundStateChanged(currentRound, rounds[currentRound].state);
            currentRound = currentRound.add(1);
            rounds[currentRound].startRoundTime = rounds[currentRound-1].startRoundTime.add(period);
            rounds[currentRound].state = RoundState.ACCEPT_FUNDS;
            emit RoundStateChanged(currentRound, rounds[currentRound].state);
        }
    }

    function updateRoundFundsAndParticipants(address _participant, uint _funds) internal {

        if (rounds[currentRound].participantFunds[_participant] == 0) {
            rounds[currentRound].participantCount = rounds[currentRound].participantCount.add(1);
        }

        rounds[currentRound].participantFunds[_participant] =
        rounds[currentRound].participantFunds[_participant].add(_funds);

        rounds[currentRound].roundFunds =
        rounds[currentRound].roundFunds.add(_funds);
    }

    function findWinners(uint _round) internal {
        address winner;
        uint fundsToWinner;
        for (uint i = 0; i < NUMBER_OF_WINNERS; i++) {
            winner = getWinner(
                _round,
                0,
                (rounds[_round].tickets.length).sub(1),
                rounds[_round].winningTickets[i]
            );

            rounds[_round].winners.push(winner);
            fundsToWinner = rounds[_round].roundFunds.mul(shareOfWinners[i]).div(SHARE_DENOMINATOR);
            rounds[_round].winnersFunds[winner] = rounds[_round].winnersFunds[winner].add(fundsToWinner);
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