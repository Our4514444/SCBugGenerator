pragma solidity >=0.5.3 <0.6.0;


contract TronRegister {
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event RegisterAdd(address indexed ethAddress, address indexed tronAddress);

  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  mapping(address => address) private ethToTronMapping;

    function put(address _tronAddress) external {
        address ethAddress = msg.sender;
        require(ethToTronMapping[ethAddress] == address(0), "address already bound");
        ethToTronMapping[ethAddress] = _tronAddress;
        emit RegisterAdd(ethAddress, _tronAddress);
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function get(address _ethAddress) public view returns (address _tronAddress) {
        return ethToTronMapping[_ethAddress];
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