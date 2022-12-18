                                                                 

pragma solidity ^0.5.8;



// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
contract SafeMath {
    function SAFEADD483(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }
    function SAFESUB37(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
     require(b <= a);
        c = a - b;
    }
    function SAFEMUL472(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function SAFEDIV691(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b > 0);
        c = a / b;
    }
}

contract Administration is SafeMath {
    // ----------------------------------------------------------------------------
    // Variables
    // ----------------------------------------------------------------------------
    address payable CEOAddress;
    address public CTOAddress;
    address Signer;

    bool public paused = false;
    
    // ----------------------------------------------------------------------------
    // Events
    // ----------------------------------------------------------------------------
    event PAUSE315();	//inject NONSTANDARD NAMING
    event UNPAUSE684();	//inject NONSTANDARD NAMING
    event CTOTRANSFER354(address newCTO, address oldCTO);	//inject NONSTANDARD NAMING

    // ---------------------------------------------------------------------------- 
    // Modifiers
    // ----------------------------------------------------------------------------
    modifier ONLYCEO503() {	//inject NONSTANDARD NAMING
        require(msg.sender == CEOAddress);
        _;
    }

    modifier ONLYADMIN379() {	//inject NONSTANDARD NAMING
        require(msg.sender == CEOAddress || msg.sender == CTOAddress);
        _;
    }

    modifier WHENNOTPAUSED728() {	//inject NONSTANDARD NAMING
        require(!paused);
        _;
    }

    modifier WHENPAUSED861() {	//inject NONSTANDARD NAMING
        require(paused);
        _;
    }

    // ----------------------------------------------------------------------------
    // Public Functions
    // ----------------------------------------------------------------------------
    function SETCTO802(address _newAdmin) public ONLYCEO503 {	//inject NONSTANDARD NAMING
        require(_newAdmin != address(0));
        emit CTOTRANSFER354(_newAdmin, CTOAddress);
        CTOAddress = _newAdmin;
    }

    function WITHDRAWBALANCE565() external ONLYCEO503 {	//inject NONSTANDARD NAMING
        CEOAddress.transfer(address(this).balance);
    }

    function PAUSE35() public ONLYADMIN379 WHENNOTPAUSED728 returns(bool) {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE315();
        return true;
    }

    function UNPAUSE74() public ONLYADMIN379 WHENPAUSED861 returns(bool) {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE684();
        return true;
    }
}

contract Standard is Administration {
    // ----------------------------------------------------------------------------
    // Variables
    // ----------------------------------------------------------------------------
    struct Bet {
        uint posAmount;
        uint negAmount;
        uint timestamp;
    }
    
    struct Contract {
        uint result; //0-while running, 1-support win, 2-oppose win
        uint StartTime;
        uint BetEndTime;
        uint ContractTime;
        mapping(address => Bet) PlayerToBet;
        mapping(address => bool) IfPlayed;
        mapping(address => bool) IfClaimed;
    }
    
    Contract[] contracts;
    
    uint public minBet = 10 finney;
    uint public maxBet = 10000 ether;
    
    uint TimeFactor;
    
    uint public contractFee = 100 finney;
    uint public taxRate = 9750;
    
    // ----------------------------------------------------------------------------
    // Mappings
    // ----------------------------------------------------------------------------
    mapping (uint => uint) TotalAmount;
    mapping (uint => uint) TotalSupport;
    mapping (uint => uint) TotalOppose;
    mapping (uint => uint) TotalPlayers;
    
    // ----------------------------------------------------------------------------
    // Events
    // ----------------------------------------------------------------------------
    event CONTRACTCREATED795(uint indexed contractId, uint totalSupport, uint totalOppose, address creator, uint contractTime, uint betEndTime);	//inject NONSTANDARD NAMING
    event NEWBETSUCCESS821(address indexed player, bool indexed opinion, uint indexed amount, uint timeFactor);	//inject NONSTANDARD NAMING
    event BETADJUSTSUCCESS12(address indexed player, uint indexed posAmount, uint indexed negAmount, uint timeFactor);	//inject NONSTANDARD NAMING
    event CONTRACTREVEALED52(uint indexed contractId, uint indexed result);	//inject NONSTANDARD NAMING
    event CONTRACTCLAIMED762(address indexed winner, uint indexed reward);	//inject NONSTANDARD NAMING
    
    // ----------------------------------------------------------------------------
    // Internal Functions
    // ----------------------------------------------------------------------------
    function _CALCULATETIMEFACTOR86(uint _betEndTime, uint _startTime) internal view returns (uint) {	//inject NONSTANDARD NAMING
        return (_betEndTime - now)*100/(_betEndTime - _startTime);
    }
    
    // ----------------------------------------------------------------------------
    // Public Functions
    // ----------------------------------------------------------------------------
    constructor(address _CTOAddress) public {
        CEOAddress = msg.sender;
        CTOAddress = _CTOAddress;
    }
    
    function CREATECONTRACT537(uint posAmount, uint negAmount, uint contractTime, uint betEndTime) public payable WHENNOTPAUSED728 returns (uint) {	//inject NONSTANDARD NAMING
        require(posAmount > 0 || negAmount > 0, "SEER OFFICAL WARNING: At least bet on one side");
        require(msg.value >= (posAmount + negAmount + contractFee), "SEER OFFICAL WARNING: Does not send enough ETH");
        require((now + 1 hours) <= betEndTime, "SEER OFFICAL WARNING: At least have one hour bet time");
        require((contractTime - now)/3 >= (betEndTime - now), "SEER OFFICAL WARNING: Bet time need to be less or equal than 1/3 of total contract time");
        Bet memory _bet = Bet({
            posAmount: posAmount,
            negAmount: negAmount,
            timestamp: _CALCULATETIMEFACTOR86(betEndTime, now)
        });
        Contract memory _contract = Contract({
           result: 0,
           StartTime: now,
           BetEndTime: betEndTime,
           ContractTime: contractTime
        });
        uint newContractId = contracts.push(_contract) - 1;
        Contract storage newContract = contracts[newContractId];
        newContract.PlayerToBet[msg.sender] = _bet;
        newContract.IfPlayed[msg.sender] = true;
        TotalAmount[newContractId] = posAmount + negAmount;
        TotalSupport[newContractId] = posAmount;
        TotalOppose[newContractId] = negAmount;
        TotalPlayers[newContractId] = 1;
        emit CONTRACTCREATED795(newContractId, posAmount, negAmount, msg.sender, contractTime, betEndTime);
        return newContractId;
    }
    
    function BETCONTRACT211(uint contractId, bool opinion, uint amount) public payable WHENNOTPAUSED728 returns (bool) {	//inject NONSTANDARD NAMING
        require(TotalAmount[contractId] > 0, "SEER OFFICAL WARNING: Contract has not been created");
        require(amount >= minBet && amount <= maxBet, "SEER OFFICAL WARNING: Does not meet min or max bet requirement");
        require(msg.value >= amount, "SEER OFFICAL WARNING: Does not send enough ETH");
        Contract storage _contract = contracts[contractId];
        require(now < _contract.BetEndTime, "SEER OFFICAL WARNING: Contract cannot be bet anymore");
        require(_contract.result == 0, "SEER OFFICAL WARNING: Contact terminated");
        uint timeFactor = _CALCULATETIMEFACTOR86(_contract.BetEndTime, _contract.StartTime);
        if(_contract.IfPlayed[msg.sender] == true) {
            if(opinion == true) {
                 Bet storage _bet = _contract.PlayerToBet[msg.sender];
                 _bet.posAmount += amount;
                 _bet.timestamp = timeFactor;
                 TotalSupport[contractId] += amount;
                 TotalAmount[contractId] += amount;
                 emit BETADJUSTSUCCESS12(msg.sender, _bet.posAmount, _bet.negAmount, timeFactor);
            } else if (opinion == false) {
                Bet storage _bet = _contract.PlayerToBet[msg.sender];
                 _bet.negAmount += amount;
                 _bet.timestamp = timeFactor;
                 TotalOppose[contractId] += amount;
                 TotalAmount[contractId] += amount;
                 emit BETADJUSTSUCCESS12(msg.sender, _bet.posAmount, _bet.negAmount, timeFactor);
            }
        } else {
            if(opinion == true) {
                Bet memory _bet = Bet({
                    posAmount: amount,
                    negAmount: 0,
                    timestamp: timeFactor
                });
                _contract.IfPlayed[msg.sender] = true;
                _contract.PlayerToBet[msg.sender] = _bet;
                TotalSupport[contractId] += amount;
                TotalAmount[contractId] += amount;
                TotalPlayers[contractId] += 1;
                emit NEWBETSUCCESS821(msg.sender, opinion, amount, timeFactor);
            } else if (opinion == false) {
                Bet memory _bet = Bet({
                    posAmount: 0,
                    negAmount: amount,
                    timestamp: timeFactor
                });
                _contract.IfPlayed[msg.sender] = true;
                _contract.PlayerToBet[msg.sender] = _bet;
                TotalOppose[contractId] += amount;
                TotalAmount[contractId] += amount;
                TotalPlayers[contractId] += 1;
                emit NEWBETSUCCESS821(msg.sender, opinion, amount, timeFactor);
            }
        }
        return true;
    }
    
    function REVEALCONTRACT295(uint contractId, uint result) public WHENNOTPAUSED728 ONLYADMIN379 {	//inject NONSTANDARD NAMING
        require(result == 1 || result == 2, "SEER OFFICAL WARNING: Cannot recogonize result");
        Contract storage _contract = contracts[contractId];
        require(now > _contract.ContractTime, "SEER OFFICAL WARNING: Contract cannot be revealed yet");
        _contract.result = result;
        emit CONTRACTREVEALED52(contractId, result);
    }
    
    function CLAIMCONTRACT239(uint contractId) public WHENNOTPAUSED728 returns (uint) {	//inject NONSTANDARD NAMING
        require(TotalAmount[contractId] > 0, "SEER OFFICAL WARNING: Contract has not been created");
        Contract storage _contract = contracts[contractId];
        require(_contract.result > 0, "SEER OFFICAL WARNING: Contract has not been revealed");
        require(_contract.IfPlayed[msg.sender] == true, "SEER OFFICAL WARNING: You did not play this contract");
        require(_contract.IfClaimed[msg.sender] == false, "SEER OFFICAL WARNING: You already claimed reward");
        uint amount;
        uint reward;
        if(_contract.result == 1) {
            amount = _contract.PlayerToBet[msg.sender].posAmount;
            require(amount > 0, "SEER OFFICAL WARNING: You are not qualified");
            reward = amount*taxRate*TotalOppose[contractId]/TotalSupport[contractId]/10000;
            msg.sender.transfer(reward);
            _contract.IfClaimed[msg.sender] == true;
            emit CONTRACTCLAIMED762(msg.sender, reward);
        } else if (_contract.result == 2) {
            amount = _contract.PlayerToBet[msg.sender].negAmount;
            require(amount > 0, "SEER OFFICAL WARNING: You are not qualified");
            reward = amount*taxRate*TotalSupport[contractId]/TotalOppose[contractId]/10000;
            msg.sender.transfer(reward);
            _contract.IfClaimed[msg.sender] == true;
            emit CONTRACTCLAIMED762(msg.sender, reward);
        }
        return reward;
    }
    
    function ADJUSTBETLIMIT332(uint _minBet, uint _maxBet) public ONLYADMIN379 {	//inject NONSTANDARD NAMING
        minBet = _minBet;
        maxBet = _maxBet;
    }
    
    function ADJUSTFEE71(uint _fee) public ONLYADMIN379 {	//inject NONSTANDARD NAMING
        contractFee = _fee;
    }
    
    function ADJUSTTAX408(uint _tax) public ONLYADMIN379 {	//inject NONSTANDARD NAMING
        taxRate = _tax;
    }
    
    function GETCONTRACTAMOUNT337(uint contractId) public view returns (	//inject NONSTANDARD NAMING
        uint totalAmount,
        uint totalSupport,
        uint totalOppose
    ) {
        totalAmount = TotalAmount[contractId];
        totalSupport = TotalSupport[contractId];
        totalOppose = TotalOppose[contractId];
    }
    
    function GETCONTRACTPLAYERNUM742(uint contractId) public view returns (uint totalPlayer) {	//inject NONSTANDARD NAMING
        totalPlayer = TotalPlayers[contractId];
    }
    
    function GETIFPLAYED388(uint contractId, address player) public view returns (bool ifPlayed) {	//inject NONSTANDARD NAMING
        ifPlayed = contracts[contractId].IfPlayed[player];
    }
    
    function GETCONTRACTTIME167(uint contractId) public view returns (	//inject NONSTANDARD NAMING
        uint contractTime,
        uint betEndTime
    ) {
        contractTime = contracts[contractId].ContractTime;
        betEndTime = contracts[contractId].BetEndTime;
    }
    
    function GETCONTRACTBET119(uint contractId, address player) public view returns (	//inject NONSTANDARD NAMING
        uint posAmount,
        uint negAmount,
        uint timeFactor
    ) {
        posAmount = contracts[contractId].PlayerToBet[player].posAmount;
        negAmount = contracts[contractId].PlayerToBet[player].negAmount;
        timeFactor = contracts[contractId].PlayerToBet[player].timestamp;
    }
    
    function GETCONTRACTRESULT122(uint contractId) public view returns (uint result) {	//inject NONSTANDARD NAMING
        result =  contracts[contractId].result;
    }
    
    function GETIFCLAIMED737(uint contractId, address player) public view returns (bool ifClaimed) {	//inject NONSTANDARD NAMING
        ifClaimed = contracts[contractId].IfClaimed[player];
    }
}