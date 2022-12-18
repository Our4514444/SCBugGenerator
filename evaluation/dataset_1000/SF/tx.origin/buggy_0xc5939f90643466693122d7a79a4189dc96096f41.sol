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
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
    function safeSub(uint a, uint b) public pure returns (uint c) {
     require(b <= a);
        c = a - b;
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
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
  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  event Pause();
  function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
  event Unpause();
  function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
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
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }

    function withdrawBalance() external onlyCEO {
        CEOAddress.transfer(address(this).balance);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    function pause() public onlyAdmin whenNotPaused returns(bool) {
        paused = true;
        emit Pause();
        return true;
    }
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}

    function unpause() public onlyAdmin whenPaused returns(bool) {
        paused = false;
        emit Unpause();
        return true;
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
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
  function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  uint public maxBet = 10000 ether;
    
  function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }
  uint TimeFactor;
    
  function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
  uint public contractFee = 100 finney;
  function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
  uint public taxRate = 9750;
    
    // ----------------------------------------------------------------------------
    // Mappings
    // ----------------------------------------------------------------------------
  function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
  mapping (uint => uint) TotalAmount;
  function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
  mapping (uint => uint) TotalSupport;
  function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
  mapping (uint => uint) TotalOppose;
  function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
  mapping (uint => uint) TotalPlayers;
    
    // ----------------------------------------------------------------------------
    // Events
    // ----------------------------------------------------------------------------
  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  event ContractCreated(uint indexed contractId, uint totalSupport, uint totalOppose, address creator, uint contractTime, uint betEndTime);
  function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
  event NewBetSuccess(address indexed player, bool indexed opinion, uint indexed amount, uint timeFactor);
  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  event BetAdjustSuccess(address indexed player, uint indexed posAmount, uint indexed negAmount, uint timeFactor);
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event ContractRevealed(uint indexed contractId, uint indexed result);
  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event ContractClaimed(address indexed winner, uint indexed reward);
    
    // ----------------------------------------------------------------------------
    // Internal Functions
    // ----------------------------------------------------------------------------
    function _calculateTimeFactor(uint _betEndTime, uint _startTime) internal view returns (uint) {
        return (_betEndTime - now)*100/(_betEndTime - _startTime);
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
    
    // ----------------------------------------------------------------------------
    // Public Functions
    // ----------------------------------------------------------------------------
    constructor(address _CTOAddress) public {
        CEOAddress = msg.sender;
        CTOAddress = _CTOAddress;
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
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
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
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
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
    
    function revealContract(uint contractId, uint result) public whenNotPaused onlyAdmin {
        require(result == 1 || result == 2, "SEER OFFICAL WARNING: Cannot recogonize result");
        Contract storage _contract = contracts[contractId];
        require(now > _contract.ContractTime, "SEER OFFICAL WARNING: Contract cannot be revealed yet");
        _contract.result = result;
        emit ContractRevealed(contractId, result);
    }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
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
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
    
    function adjustBetLimit(uint _minBet, uint _maxBet) public onlyAdmin {
        minBet = _minBet;
        maxBet = _maxBet;
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
    
    function adjustFee(uint _fee) public onlyAdmin {
        contractFee = _fee;
    }
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
    
    function adjustTax(uint _tax) public onlyAdmin {
        taxRate = _tax;
    }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
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
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
    
    function getContractPlayerNum(uint contractId) public view returns (uint totalPlayer) {
        totalPlayer = TotalPlayers[contractId];
    }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
    
    function getIfPlayed(uint contractId, address player) public view returns (bool ifPlayed) {
        ifPlayed = contracts[contractId].IfPlayed[player];
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
    
    function getContractTime(uint contractId) public view returns (
        uint contractTime,
        uint betEndTime
    ) {
        contractTime = contracts[contractId].ContractTime;
        betEndTime = contracts[contractId].BetEndTime;
    }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
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
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
    
    function getContractResult(uint contractId) public view returns (uint result) {
        result =  contracts[contractId].result;
    }
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
    
    function getIfClaimed(uint contractId, address player) public view returns (bool ifClaimed) {
        ifClaimed = contracts[contractId].IfClaimed[player];
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
}