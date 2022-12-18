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
function bug_intou23() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    function safeSub(uint a, uint b) public pure returns (uint c) {
     require(b <= a);
        c = a - b;
    }
function bug_intou39() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
function bug_intou20(uint8 p_intou20) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou20;   // overflow bug
}
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
mapping(address => uint) balances_intou34;

function transfer_intou34(address _to, uint _value) public returns (bool) {
    require(balances_intou34[msg.sender] - _value >= 0);  //bug
    balances_intou34[msg.sender] -= _value;  //bug
    balances_intou34[_to] += _value;  //bug
    return true;
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
  function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event Pause();
  mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
  event Unpause();
  function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
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
        emit CTOTransfer(_newAdmin, CTOAddress);
        CTOAddress = _newAdmin;
    }
mapping(address => uint) balances_intou2;

function transfer_undrflow2(address _to, uint _value) public returns (bool) {
    require(balances_intou2[msg.sender] - _value >= 0);  //bug
    balances_intou2[msg.sender] -= _value;  //bug
    balances_intou2[_to] += _value;  //bug
    return true;
  }

    function withdrawBalance() external onlyCEO {
        CEOAddress.transfer(address(this).balance);
    }
mapping(address => uint) balances_intou14;

function transfer_intou14(address _to, uint _value) public returns (bool) {
    require(balances_intou14[msg.sender] - _value >= 0);  //bug
    balances_intou14[msg.sender] -= _value;  //bug
    balances_intou14[_to] += _value;  //bug
    return true;
  }

    function pause() public onlyAdmin whenNotPaused returns(bool) {
        paused = true;
        emit Pause();
        return true;
    }
mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }

    function unpause() public onlyAdmin whenPaused returns(bool) {
        paused = false;
        emit Unpause();
        return true;
    }
mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
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
  function bug_intou27() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint public maxBet = 10000 ether;
    
  mapping(address => uint) balances_intou6;

function transfer_intou62(address _to, uint _value) public returns (bool) {
    require(balances_intou6[msg.sender] - _value >= 0);  //bug
    balances_intou6[msg.sender] -= _value;  //bug
    balances_intou6[_to] += _value;  //bug
    return true;
  }
  uint TimeFactor;
    
  mapping(address => uint) public lockTime_intou21;

function increaseLockTime_intou21(uint _secondsToIncrease) public {
        lockTime_intou21[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou21() public {
        require(now > lockTime_intou21[msg.sender]);    
        uint transferValue_intou21 = 10;           
        msg.sender.transfer(transferValue_intou21);
    }
  uint public contractFee = 100 finney;
  function bug_intou4(uint8 p_intou4) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou4;   // overflow bug
}
  uint public taxRate = 9750;
    
    // ----------------------------------------------------------------------------
    // Mappings
    // ----------------------------------------------------------------------------
  mapping(address => uint) balances_intou22;

function transfer_intou22(address _to, uint _value) public returns (bool) {
    require(balances_intou22[msg.sender] - _value >= 0);  //bug
    balances_intou22[msg.sender] -= _value;  //bug
    balances_intou22[_to] += _value;  //bug
    return true;
  }
  mapping (uint => uint) TotalAmount;
  function bug_intou8(uint8 p_intou8) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou8;   // overflow bug
}
  mapping (uint => uint) TotalSupport;
  mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
    require(balances_intou18[msg.sender] - _value >= 0);  //bug
    balances_intou18[msg.sender] -= _value;  //bug
    balances_intou18[_to] += _value;  //bug
    return true;
  }
  mapping (uint => uint) TotalOppose;
  mapping(address => uint) public lockTime_intou5;

function increaseLockTime_intou5(uint _secondsToIncrease) public {
        lockTime_intou5[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou5() public {
        require(now > lockTime_intou5[msg.sender]);    
        uint transferValue_intou5 = 10;           
        msg.sender.transfer(transferValue_intou5);
    }
  mapping (uint => uint) TotalPlayers;
    
    // ----------------------------------------------------------------------------
    // Events
    // ----------------------------------------------------------------------------
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  event ContractCreated(uint indexed contractId, uint totalSupport, uint totalOppose, address creator, uint contractTime, uint betEndTime);
  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  event NewBetSuccess(address indexed player, bool indexed opinion, uint indexed amount, uint timeFactor);
  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event BetAdjustSuccess(address indexed player, uint indexed posAmount, uint indexed negAmount, uint timeFactor);
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  event ContractRevealed(uint indexed contractId, uint indexed result);
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event ContractClaimed(address indexed winner, uint indexed reward);
    
    // ----------------------------------------------------------------------------
    // Internal Functions
    // ----------------------------------------------------------------------------
    function _calculateTimeFactor(uint _betEndTime, uint _startTime) internal view returns (uint) {
        return (_betEndTime - now)*100/(_betEndTime - _startTime);
    }
function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
    
    // ----------------------------------------------------------------------------
    // Public Functions
    // ----------------------------------------------------------------------------
    constructor(address _CTOAddress) public {
        CEOAddress = msg.sender;
        CTOAddress = _CTOAddress;
    }
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function createContract(uint posAmount, uint negAmount, uint contractTime, uint betEndTime) public payable whenNotPaused returns (uint) {
        require(posAmount > 0 || negAmount > 0, "SEER OFFICAL WARNING: At least bet on one side");
        require(msg.value >= (posAmount + negAmount + contractFee), "SEER OFFICAL WARNING: Does not send enough ETH");
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
        uint newContractId = contracts.push(_contract) - 1;
        Contract storage newContract = contracts[newContractId];
        newContract.PlayerToBet[msg.sender] = _bet;
        newContract.IfPlayed[msg.sender] = true;
        TotalAmount[newContractId] = posAmount + negAmount;
        TotalSupport[newContractId] = posAmount;
        TotalOppose[newContractId] = negAmount;
        TotalPlayers[newContractId] = 1;
        emit ContractCreated(newContractId, posAmount, negAmount, msg.sender, contractTime, betEndTime);
        return newContractId;
    }
function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
    
    function betContract(uint contractId, bool opinion, uint amount) public payable whenNotPaused returns (bool) {
        require(TotalAmount[contractId] > 0, "SEER OFFICAL WARNING: Contract has not been created");
        require(amount >= minBet && amount <= maxBet, "SEER OFFICAL WARNING: Does not meet min or max bet requirement");
        require(msg.value >= amount, "SEER OFFICAL WARNING: Does not send enough ETH");
        Contract storage _contract = contracts[contractId];
        require(now < _contract.BetEndTime, "SEER OFFICAL WARNING: Contract cannot be bet anymore");
        require(_contract.result == 0, "SEER OFFICAL WARNING: Contact terminated");
        uint timeFactor = _calculateTimeFactor(_contract.BetEndTime, _contract.StartTime);
        if(_contract.IfPlayed[msg.sender] == true) {
            if(opinion == true) {
                 Bet storage _bet = _contract.PlayerToBet[msg.sender];
                 _bet.posAmount += amount;
                 _bet.timestamp = timeFactor;
                 TotalSupport[contractId] += amount;
                 TotalAmount[contractId] += amount;
                 emit BetAdjustSuccess(msg.sender, _bet.posAmount, _bet.negAmount, timeFactor);
            } else if (opinion == false) {
                Bet storage _bet = _contract.PlayerToBet[msg.sender];
                 _bet.negAmount += amount;
                 _bet.timestamp = timeFactor;
                 TotalOppose[contractId] += amount;
                 TotalAmount[contractId] += amount;
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
                TotalSupport[contractId] += amount;
                TotalAmount[contractId] += amount;
                TotalPlayers[contractId] += 1;
                emit NewBetSuccess(msg.sender, opinion, amount, timeFactor);
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
                emit NewBetSuccess(msg.sender, opinion, amount, timeFactor);
            }
        }
        return true;
    }
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
    
    function revealContract(uint contractId, uint result) public whenNotPaused onlyAdmin {
        require(result == 1 || result == 2, "SEER OFFICAL WARNING: Cannot recogonize result");
        Contract storage _contract = contracts[contractId];
        require(now > _contract.ContractTime, "SEER OFFICAL WARNING: Contract cannot be revealed yet");
        _contract.result = result;
        emit ContractRevealed(contractId, result);
    }
function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
    
    function claimContract(uint contractId) public whenNotPaused returns (uint) {
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
            emit ContractClaimed(msg.sender, reward);
        } else if (_contract.result == 2) {
            amount = _contract.PlayerToBet[msg.sender].negAmount;
            require(amount > 0, "SEER OFFICAL WARNING: You are not qualified");
            reward = amount*taxRate*TotalSupport[contractId]/TotalOppose[contractId]/10000;
            msg.sender.transfer(reward);
            _contract.IfClaimed[msg.sender] == true;
            emit ContractClaimed(msg.sender, reward);
        }
        return reward;
    }
function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
    
    function adjustBetLimit(uint _minBet, uint _maxBet) public onlyAdmin {
        minBet = _minBet;
        maxBet = _maxBet;
    }
mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
    
    function adjustFee(uint _fee) public onlyAdmin {
        contractFee = _fee;
    }
function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function adjustTax(uint _tax) public onlyAdmin {
        taxRate = _tax;
    }
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
    
    function getContractAmount(uint contractId) public view returns (
        uint totalAmount,
        uint totalSupport,
        uint totalOppose
    ) {
        totalAmount = TotalAmount[contractId];
        totalSupport = TotalSupport[contractId];
        totalOppose = TotalOppose[contractId];
    }
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function getContractPlayerNum(uint contractId) public view returns (uint totalPlayer) {
        totalPlayer = TotalPlayers[contractId];
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
    
    function getIfPlayed(uint contractId, address player) public view returns (bool ifPlayed) {
        ifPlayed = contracts[contractId].IfPlayed[player];
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function getContractTime(uint contractId) public view returns (
        uint contractTime,
        uint betEndTime
    ) {
        contractTime = contracts[contractId].ContractTime;
        betEndTime = contracts[contractId].BetEndTime;
    }
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
    
    function getContractBet(uint contractId, address player) public view returns (
        uint posAmount,
        uint negAmount,
        uint timeFactor
    ) {
        posAmount = contracts[contractId].PlayerToBet[player].posAmount;
        negAmount = contracts[contractId].PlayerToBet[player].negAmount;
        timeFactor = contracts[contractId].PlayerToBet[player].timestamp;
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
    
    function getContractResult(uint contractId) public view returns (uint result) {
        result =  contracts[contractId].result;
    }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
    
    function getIfClaimed(uint contractId, address player) public view returns (bool ifClaimed) {
        ifClaimed = contracts[contractId].IfClaimed[player];
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
}