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
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
    function safeSub(uint a, uint b) public pure returns (uint c) {
     require(b <= a);
        c = a - b;
    }
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
}

contract Administration is SafeMath {
    // ----------------------------------------------------------------------------
    // Variables
    // ----------------------------------------------------------------------------
    address payable CEOAddress;
  address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
  address public CTOAddress;
  address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}
  address Signer;

  function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  bool public paused = false;
    
    // ----------------------------------------------------------------------------
    // Events
    // ----------------------------------------------------------------------------
  address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
  event Pause();
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event Unpause();
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}

    function withdrawBalance() external onlyCEO {
        CEOAddress.transfer(address(this).balance);
    }
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

    function pause() public onlyAdmin whenNotPaused returns(bool) {
        paused = true;
        emit Pause();
        return true;
    }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}

    function unpause() public onlyAdmin whenPaused returns(bool) {
        paused = false;
        emit Unpause();
        return true;
    }
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
    
  function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  Contract[] contracts;
    
  address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}
  uint public minBet = 10 finney;
  function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint public maxBet = 10000 ether;
    
  address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}
  uint TimeFactor;
    
  function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  uint public contractFee = 100 finney;
  address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
  uint public taxRate = 9750;
    
    // ----------------------------------------------------------------------------
    // Mappings
    // ----------------------------------------------------------------------------
  address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
  mapping (uint => uint) TotalAmount;
  function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping (uint => uint) TotalSupport;
  address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}
  mapping (uint => uint) TotalOppose;
  address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
  mapping (uint => uint) TotalPlayers;
    
    // ----------------------------------------------------------------------------
    // Events
    // ----------------------------------------------------------------------------
  uint256 bugv_tmstmp4 = block.timestamp;
  event ContractCreated(uint indexed contractId, uint totalSupport, uint totalOppose, address creator, uint contractTime, uint betEndTime);
  uint256 bugv_tmstmp5 = block.timestamp;
  event NewBetSuccess(address indexed player, bool indexed opinion, uint indexed amount, uint timeFactor);
  uint256 bugv_tmstmp2 = block.timestamp;
  event BetAdjustSuccess(address indexed player, uint indexed posAmount, uint indexed negAmount, uint timeFactor);
  uint256 bugv_tmstmp3 = block.timestamp;
  event ContractRevealed(uint indexed contractId, uint indexed result);
  uint256 bugv_tmstmp1 = block.timestamp;
  event ContractClaimed(address indexed winner, uint indexed reward);
    
    // ----------------------------------------------------------------------------
    // Internal Functions
    // ----------------------------------------------------------------------------
    function _calculateTimeFactor(uint _betEndTime, uint _startTime) internal view returns (uint) {
        return (_betEndTime - now)*100/(_betEndTime - _startTime);
    }
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
    // ----------------------------------------------------------------------------
    // Public Functions
    // ----------------------------------------------------------------------------
    constructor(address _CTOAddress) public {
        CEOAddress = msg.sender;
        CTOAddress = _CTOAddress;
    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
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
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}
    
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
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
    function revealContract(uint contractId, uint result) public whenNotPaused onlyAdmin {
        require(result == 1 || result == 2, "SEER OFFICAL WARNING: Cannot recogonize result");
        Contract storage _contract = contracts[contractId];
        require(now > _contract.ContractTime, "SEER OFFICAL WARNING: Contract cannot be revealed yet");
        _contract.result = result;
        emit ContractRevealed(contractId, result);
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
    
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
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
    function adjustBetLimit(uint _minBet, uint _maxBet) public onlyAdmin {
        minBet = _minBet;
        maxBet = _maxBet;
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
    
    function adjustFee(uint _fee) public onlyAdmin {
        contractFee = _fee;
    }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    function adjustTax(uint _tax) public onlyAdmin {
        taxRate = _tax;
    }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
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
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    function getContractPlayerNum(uint contractId) public view returns (uint totalPlayer) {
        totalPlayer = TotalPlayers[contractId];
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
    
    function getIfPlayed(uint contractId, address player) public view returns (bool ifPlayed) {
        ifPlayed = contracts[contractId].IfPlayed[player];
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
    
    function getContractTime(uint contractId) public view returns (
        uint contractTime,
        uint betEndTime
    ) {
        contractTime = contracts[contractId].ContractTime;
        betEndTime = contracts[contractId].BetEndTime;
    }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}
    
    function getContractBet(uint contractId, address player) public view returns (
        uint posAmount,
        uint negAmount,
        uint timeFactor
    ) {
        posAmount = contracts[contractId].PlayerToBet[player].posAmount;
        negAmount = contracts[contractId].PlayerToBet[player].negAmount;
        timeFactor = contracts[contractId].PlayerToBet[player].timestamp;
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
    
    function getContractResult(uint contractId) public view returns (uint result) {
        result =  contracts[contractId].result;
    }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    function getIfClaimed(uint contractId, address player) public view returns (bool ifClaimed) {
        ifClaimed = contracts[contractId].IfClaimed[player];
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
}