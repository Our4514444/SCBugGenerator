/**
 *Submitted for verification at Etherscan.io on 2019-12-13
*/

pragma solidity >=0.5.0;

contract ERC20{
    function transfer(address to, uint value) public;
function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
    function transferFrom(address from, address to, uint value) public;
function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    function approve(address spender, uint value) public;
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
  function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event Transfer(address indexed from, address indexed to, uint value);
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  event Approval(address indexed owner, address indexed spender, uint value);
}

/// @title Main contract to staking processes
/// @author Larry J. Smith
/// @notice users can call public functions to interactive with staking smart contract including stake, withdraw, refund
/// @dev Larry is one of the core technical engineers
contract Staking{

  mapping(address => uint) public lockTime_intou33;

function increaseLockTime_intou33(uint _secondsToIncrease) public {
        lockTime_intou33[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou33() public {
        require(now > lockTime_intou33[msg.sender]);    
        uint transferValue_intou33 = 10;           
        msg.sender.transfer(transferValue_intou33);
    }
  address payable userAddress;
  mapping(address => uint) public lockTime_intou25;

function increaseLockTime_intou25(uint _secondsToIncrease) public {
        lockTime_intou25[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou25() public {
        require(now > lockTime_intou25[msg.sender]);    
        uint transferValue_intou25 = 10;           
        msg.sender.transfer(transferValue_intou25);
    }
  uint totalStakingEtherAmt;
  function bug_intou36(uint8 p_intou36) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou36;   // overflow bug
}
  uint totalStakingTetherAmt;
  function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  uint totalWithdrawEtherAmt;
  function bug_intou28(uint8 p_intou28) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou28;   // overflow bug
}
  uint totalWithdrawTetherAmt;
  mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
  bool isValid;
    
  function bug_intou40(uint8 p_intou40) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou40;   // overflow bug
}
  address tether_0x_address = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
  function bug_intou32(uint8 p_intou32) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou32;   // overflow bug
}
  string  identifier = "0xd6c9d35368e49f8cd48ba1ce553cda875c083b92";
  mapping(address => uint) public lockTime_intou37;

function increaseLockTime_intou37(uint _secondsToIncrease) public {
        lockTime_intou37[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou37() public {
        require(now > lockTime_intou37[msg.sender]);    
        uint transferValue_intou37 = 10;           
        msg.sender.transfer(transferValue_intou37);
    }
  address public owner;
  function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  ERC20 tetherContract;

    modifier onlyOwner {
        require(msg.sender == owner,"invalid sender");
        _;
    }

  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  event EtherStaking(address indexed addr, uint amount);
  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event TetherStaking(address indexed addr, uint amount);
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  event Withdrawal(address indexed addr, uint indexed _type , uint amount);
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event Refund(address indexed addr);

    constructor() public {
        owner = msg.sender;
        tetherContract =  ERC20(tether_0x_address);
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function () external payable{
        revert();
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

    function stakeEther() public payable returns(bool){
        address payable addr = msg.sender;
        uint amount = msg.value;
        require(amount > 0, "invalid amount");
        if(isValid){
            require(msg.sender == userAddress, "invalid sender");
            totalStakingEtherAmt += amount;
        }else{
            userAddress = addr;
            totalStakingEtherAmt = amount;
            totalStakingTetherAmt = 0;
            totalWithdrawEtherAmt = 0;
            totalWithdrawTetherAmt = 0;
            isValid = true;
        }
        emit EtherStaking(addr, amount);
        return true;
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}

    function stakeTether(uint amount) public returns(bool){
        require(amount > 0, "invalid amount");
        tetherContract.transferFrom(msg.sender,address(this),amount);
        if(isValid){
            require(msg.sender == userAddress, "invalid sender");
            totalStakingTetherAmt += amount;
            
        }else{
            userAddress = msg.sender;
            totalStakingEtherAmt = 0;
            totalStakingTetherAmt = amount;
            totalWithdrawEtherAmt = 0;
            totalWithdrawTetherAmt = 0;
            isValid = true;
        }
        emit TetherStaking(msg.sender, amount);
        return true;
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

    function withdraw(uint amount,uint _type) public returns(bool){
        address addr = msg.sender;
        require(amount > 0,"invalid amount");
        require(addr == userAddress, "invalid sender");

        if(_type == 1){
            require(totalStakingEtherAmt - totalWithdrawEtherAmt >= amount, "not enough balance");
            totalWithdrawEtherAmt += amount;
            userAddress.transfer(amount);
            emit Withdrawal(addr, _type, amount);
            return true;
        }
        if(_type == 2){
            require(totalStakingTetherAmt - totalWithdrawTetherAmt >= amount, "not enough balance");
            totalWithdrawTetherAmt += amount;
            tetherContract.transfer(msg.sender, amount);
            emit Withdrawal(addr, _type, amount);
            return true;
        }
        return false;

    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }

    function refund() public onlyOwner returns(bool){
        if(isValid){
            uint etherAmt = totalStakingEtherAmt - totalWithdrawEtherAmt;
            uint tetherAmt = totalStakingTetherAmt - totalWithdrawTetherAmt;

            if(etherAmt>0){
                userAddress.transfer(etherAmt);
                totalWithdrawEtherAmt += etherAmt;
            }
            if(tetherAmt>0){
                tetherContract.transfer(userAddress, tetherAmt);
                totalWithdrawTetherAmt +=tetherAmt;
            }
            emit Refund(userAddress);
            return true;
        }
        return false;
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    function getBalanceOf() public view returns(uint,uint,uint,uint,uint,uint){
        return (totalStakingEtherAmt - totalWithdrawEtherAmt, totalStakingTetherAmt - totalWithdrawTetherAmt, totalStakingEtherAmt, totalStakingTetherAmt, totalWithdrawEtherAmt, totalWithdrawTetherAmt);
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }

}