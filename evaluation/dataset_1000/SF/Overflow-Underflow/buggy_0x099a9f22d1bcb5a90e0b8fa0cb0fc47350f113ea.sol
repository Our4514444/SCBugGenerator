pragma solidity 0.5.4;

interface IDGTXToken {
    function transfer(address to, uint value) external returns (bool);
    function balanceOf(address) external view returns (uint256);
}


interface ITreasury {
    function phaseNum() external view returns (uint256);
}

contract Treasury is ITreasury {
  mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
  address public sale;
  function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address public token;
  mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
  uint256 internal constant SINGLE_RELEASE_AMOUNT = 1e25;

  function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint256 public phaseNum;
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  uint256[] public phases = [
        1551448800, //1 March 2019 14:00 (GMT)
        1559397600, //1 June 2019 14:00 (GMT)
        1567346400, //1 September 2019 14:00 (GMT)
        1575208800, //1 December 2019 14:00 (GMT)
        1583071200, //1 March 2020 14:00 (GMT)
        1591020000, //1 June 2020 14:00 (GMT)
        1598968800, //1 September 2020 14:00 (GMT)
        1606831200, //1 December 2020 14:00 (GMT)
        1614607200, //1 March 2021 14:00 (GMT)
        1622556000  //1 June 2021 14:00 (GMT)
    ];

  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event PhaseStarted(uint256 newPhaseNum);

    constructor(address _token, address _sale) public {
        require(_token != address(0) && _sale != address(0));

        token = _token;
        sale = _sale;
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }

    function tokenFallback(address, uint, bytes calldata) external {
        require(msg.sender == token);
        require(phaseNum == 0);
        require(IDGTXToken(token).balanceOf(address(this)) == SINGLE_RELEASE_AMOUNT * 10);
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function startNewPhase() external {
        require(now >= phases[phaseNum]);

        phaseNum += 1;

        require(IDGTXToken(token).transfer(sale, SINGLE_RELEASE_AMOUNT));

        emit PhaseStarted(phaseNum);
    }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
}