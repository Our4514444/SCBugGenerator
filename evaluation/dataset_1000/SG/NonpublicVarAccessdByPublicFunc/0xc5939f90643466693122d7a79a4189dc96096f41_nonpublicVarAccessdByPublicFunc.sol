/**
 *Submitted for verification at Etherscan.io on 2020-10-16
*/

pragma solidity ^0.5.8;



// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
contract SafeMath {
    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function safeSub(uint a, uint b) public pure returns (uint c) {
     require(b <= a);
        c = a - b;
    }
    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}

contract Administration is SafeMath {
    // ----------------------------------------------------------------------------
    // Variables
    // ----------------------------------------------------------------------------
    address payable CEOAddress;
    address internal CTOAddress;
    address Signer;

    bool internal paused = false;
    
    // ----------------------------------------------------------------------------
    // Events
    // ----------------------------------------------------------------------------
    event Pause();
    event Unpause();
    event CTOTransfer(address newCTO, address oldCTO);

    // ---------------------------------------------------------------------------- 
    // Modifiers
    // ----------------------------------------------------------------------------
    modifier onlyCEO() {
        require(msg.sender == CEOAddress);
        _;
    }

    modifier onlyAdmin() {
        require(msg.sender == CEOAddress || msg.sender == CTOAddress);
        _;
    }

    modifier whenNotPaused() {
        require(!paused);
        _;
    }

    modifier whenPaused() {
        require(paused);
        _;
    }

    // ----------------------------------------------------------------------------
    // Public Functions
    // ----------------------------------------------------------------------------
    function setCTO(address _newAdmin) public onlyCEO {
        require(_newAdmin != address(0));
        emit CTOTransfer(_newAdmin, CTOAddress);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        CTOAddress = _newAdmin;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function withdrawBalance() external onlyCEO {
        CEOAddress.transfer(address(this).balance);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function pause() public onlyAdmin whenNotPaused returns(bool) {
        paused = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Pause();
        return true;
    }

    function unpause() public onlyAdmin whenPaused returns(bool) {
        paused = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Unpause();
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
    
    uint internal minBet = 10 finney;
    uint internal maxBet = 10000 ether;
    
    uint TimeFactor;
    
    uint internal contractFee = 100 finney;
    uint internal taxRate = 9750;
    
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
    event ContractCreated(uint indexed contractId, uint totalSupport, uint totalOppose, address creator, uint contractTime, uint betEndTime);
    event NewBetSuccess(address indexed player, bool indexed opinion, uint indexed amount, uint timeFactor);
    event BetAdjustSuccess(address indexed player, uint indexed posAmount, uint indexed negAmount, uint timeFactor);
    event ContractRevealed(uint indexed contractId, uint indexed result);
    event ContractClaimed(address indexed winner, uint indexed reward);
    
    // ----------------------------------------------------------------------------
    // Internal Functions
    // ----------------------------------------------------------------------------
    function _calculateTimeFactor(uint _betEndTime, uint _startTime) internal view returns (uint) {
        return (_betEndTime - now)*100/(_betEndTime - _startTime);
    }
    
    // ----------------------------------------------------------------------------
    // Public Functions
    // ----------------------------------------------------------------------------
    constructor(address _CTOAddress) public {
        CEOAddress = msg.sender;
        CTOAddress = _CTOAddress;
    }
    
    function createContract(uint posAmount, uint negAmount, uint contractTime, uint betEndTime) public payable whenNotPaused returns (uint) {
        require(posAmount > 0 || negAmount > 0, "SEER OFFICAL WARNING: At least bet on one side");
        require(msg.value >= (posAmount + negAmount + contractFee), "SEER OFFICAL WARNING: Does not send enough ETH");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require((now + 1 hours) <= betEndTime, "SEER OFFICAL WARNING: At least have one hour bet time");
        require((contractTime - now)/3 >= (betEndTime - now), "SEER OFFICAL WARNING: Bet time need to be less or equal than 1/3 of total contract time");
        Bet memory _bet = Bet({
            posAmount: posAmount,
            negAmount: negAmount,
            timestamp: _calculateTimeFactor(betEndTime, now)
        });
        Contract memory _contract = Contract({
           result: 0,
           StartTime: now,
           BetEndTime: betEndTime,
           ContractTime: contractTime
        });
        uint newContractId = contracts.push(_contract) - 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        Contract storage newContract = contracts[newContractId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        newContract.PlayerToBet[msg.sender] = _bet;
        newContract.IfPlayed[msg.sender] = true;
        TotalAmount[newContractId] = posAmount + negAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        TotalSupport[newContractId] = posAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        TotalOppose[newContractId] = negAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        TotalPlayers[newContractId] = 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit ContractCreated(newContractId, posAmount, negAmount, msg.sender, contractTime, betEndTime);
        return newContractId;
    }
    
    function betContract(uint contractId, bool opinion, uint amount) public payable whenNotPaused returns (bool) {
        require(TotalAmount[contractId] > 0, "SEER OFFICAL WARNING: Contract has not been created");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(amount >= minBet && amount <= maxBet, "SEER OFFICAL WARNING: Does not meet min or max bet requirement");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(msg.value >= amount, "SEER OFFICAL WARNING: Does not send enough ETH");
        Contract storage _contract = contracts[contractId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(now < _contract.BetEndTime, "SEER OFFICAL WARNING: Contract cannot be bet anymore");
        require(_contract.result == 0, "SEER OFFICAL WARNING: Contact terminated");
        uint timeFactor = _calculateTimeFactor(_contract.BetEndTime, _contract.StartTime);
        if(_contract.IfPlayed[msg.sender] == true) {
            if(opinion == true) {
                 Bet storage _bet = _contract.PlayerToBet[msg.sender];
                 _bet.posAmount += amount;
                 _bet.timestamp = timeFactor;
                 TotalSupport[contractId] += amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                 TotalAmount[contractId] += amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                 emit BetAdjustSuccess(msg.sender, _bet.posAmount, _bet.negAmount, timeFactor);
            } else if (opinion == false) {
                Bet storage _bet = _contract.PlayerToBet[msg.sender];
                 _bet.negAmount += amount;
                 _bet.timestamp = timeFactor;
                 TotalOppose[contractId] += amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                 TotalAmount[contractId] += amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                 emit BetAdjustSuccess(msg.sender, _bet.posAmount, _bet.negAmount, timeFactor);
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
                TotalSupport[contractId] += amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                TotalAmount[contractId] += amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                TotalPlayers[contractId] += 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                emit NewBetSuccess(msg.sender, opinion, amount, timeFactor);
            } else if (opinion == false) {
                Bet memory _bet = Bet({
                    posAmount: 0,
                    negAmount: amount,
                    timestamp: timeFactor
                });
                _contract.IfPlayed[msg.sender] = true;
                _contract.PlayerToBet[msg.sender] = _bet;
                TotalOppose[contractId] += amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                TotalAmount[contractId] += amount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                TotalPlayers[contractId] += 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
                emit NewBetSuccess(msg.sender, opinion, amount, timeFactor);
            }
        }
        return true;
    }
    
    function revealContract(uint contractId, uint result) public whenNotPaused onlyAdmin {
        require(result == 1 || result == 2, "SEER OFFICAL WARNING: Cannot recogonize result");
        Contract storage _contract = contracts[contractId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(now > _contract.ContractTime, "SEER OFFICAL WARNING: Contract cannot be revealed yet");
        _contract.result = result;
        emit ContractRevealed(contractId, result);
    }
    
    function claimContract(uint contractId) public whenNotPaused returns (uint) {
        require(TotalAmount[contractId] > 0, "SEER OFFICAL WARNING: Contract has not been created");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        Contract storage _contract = contracts[contractId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(_contract.result > 0, "SEER OFFICAL WARNING: Contract has not been revealed");
        require(_contract.IfPlayed[msg.sender] == true, "SEER OFFICAL WARNING: You did not play this contract");
        require(_contract.IfClaimed[msg.sender] == false, "SEER OFFICAL WARNING: You already claimed reward");
        uint amount;
        uint reward;
        if(_contract.result == 1) {
            amount = _contract.PlayerToBet[msg.sender].posAmount;
            require(amount > 0, "SEER OFFICAL WARNING: You are not qualified");
            reward = amount*taxRate*TotalOppose[contractId]/TotalSupport[contractId]/10000;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            msg.sender.transfer(reward);
            _contract.IfClaimed[msg.sender] == true;
            emit ContractClaimed(msg.sender, reward);
        } else if (_contract.result == 2) {
            amount = _contract.PlayerToBet[msg.sender].negAmount;
            require(amount > 0, "SEER OFFICAL WARNING: You are not qualified");
            reward = amount*taxRate*TotalSupport[contractId]/TotalOppose[contractId]/10000;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            msg.sender.transfer(reward);
            _contract.IfClaimed[msg.sender] == true;
            emit ContractClaimed(msg.sender, reward);
        }
        return reward;
    }
    
    function adjustBetLimit(uint _minBet, uint _maxBet) public onlyAdmin {
        minBet = _minBet;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        maxBet = _maxBet;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function adjustFee(uint _fee) public onlyAdmin {
        contractFee = _fee;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function adjustTax(uint _tax) public onlyAdmin {
        taxRate = _tax;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getContractAmount(uint contractId) public view returns (
        uint totalAmount,
        uint totalSupport,
        uint totalOppose
    ) {
        totalAmount = TotalAmount[contractId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSupport = TotalSupport[contractId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalOppose = TotalOppose[contractId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getContractPlayerNum(uint contractId) public view returns (uint totalPlayer) {
        totalPlayer = TotalPlayers[contractId];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getIfPlayed(uint contractId, address player) public view returns (bool ifPlayed) {
        ifPlayed = contracts[contractId].IfPlayed[player];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getContractTime(uint contractId) public view returns (
        uint contractTime,
        uint betEndTime
    ) {
        contractTime = contracts[contractId].ContractTime;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        betEndTime = contracts[contractId].BetEndTime;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getContractBet(uint contractId, address player) public view returns (
        uint posAmount,
        uint negAmount,
        uint timeFactor
    ) {
        posAmount = contracts[contractId].PlayerToBet[player].posAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        negAmount = contracts[contractId].PlayerToBet[player].negAmount;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        timeFactor = contracts[contractId].PlayerToBet[player].timestamp;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getContractResult(uint contractId) public view returns (uint result) {
        result =  contracts[contractId].result;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function getIfClaimed(uint contractId, address player) public view returns (bool ifClaimed) {
        ifClaimed = contracts[contractId].IfClaimed[player];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}