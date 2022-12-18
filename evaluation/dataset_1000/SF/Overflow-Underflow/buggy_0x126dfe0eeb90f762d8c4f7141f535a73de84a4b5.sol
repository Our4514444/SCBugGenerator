pragma solidity ^0.5.1;

// Interface for interacting with Compound
interface CompoundContract {
    function  supply (address asset, uint256 amount) external returns (uint256);
    function withdraw (address asset, uint256 requestedAmount) external returns (uint256);
}

// Interface for interacting with tokens
interface token {
    function transfer(address _to, uint256 _value) external returns (bool success) ;
    function approve(address _spender, uint256 _value) external returns (bool);
    function balanceOf(address owner) external returns (uint256);
}

// Basic ownership library
 contract owned {
      function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
  address public owner;

        constructor() public {
            owner = msg.sender;
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

        modifier onlyOwner {
            require(msg.sender == owner);
            _;
        }

        function transferOwnership(address newOwner) onlyOwner public {
            owner = newOwner;
        }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
    }

// Here we start
contract CompoundPayroll is owned {
    // first, let's define the contracts we'll be interacting with
  function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address compoundAddress = 0x3FDA67f7583380E67ef93072294a7fAc882FD7E7;
  function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}
  address daiAddress = 0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359;
    CompoundContract compound = CompoundContract(compoundAddress);
    token dai = token(daiAddress);
    
    // Now let's create a payroll object
  function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  Salary[] public payroll;
  mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
  mapping (address => uint) public salaryId;
  function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
  uint public payrollLength;
    
    struct Salary {
        address recipient;
        uint payRate;
        uint lastPaid;
        string name;
    }
    
    // An event for easier accounting
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event MemberPaid(address recipient, uint amount, string justification);

    // The constructor is called when you init the contract    
    constructor() public {
        owner = msg.sender;
        dai.approve(compoundAddress, 2 ** 128);
        changePay(address(0), 0, now, '');
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    // Sends all the current balance to Compound
    function putInSavings() public  {
        compound.supply(daiAddress, dai.balanceOf(address(this)));
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
    
    // Allows owner to make specific payments
    function cashOut (uint256 amount, address recipient) public onlyOwner {
        compound.withdraw(daiAddress, amount);
        dai.transfer(recipient, amount);
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}

    // Allows you to add or change a salary
    function changePay(address recipient, uint yearlyPay, uint startingDate, string memory initials) onlyOwner public {
        // check someone's salary ID
        uint id = salaryId[recipient];
        // if it returns 0 then create a new one
        if (id == 0) {
            salaryId[recipient] = payroll.length;
            id = payroll.length++;
        }
        payroll[id] = Salary({
            recipient: recipient, 
            payRate: yearlyPay / 365.25 days, 
            lastPaid:  startingDate >  0 ? startingDate : now, 
            name: initials});
            
        payrollLength = payroll.length;
    }

    // Removes a salary from the list
    function removePay(address recipient) onlyOwner public {
        require(salaryId[recipient] != 0);

        for (uint i = salaryId[recipient]; i<payroll.length-1; i++){
            payroll[i] = payroll[i+1];
            salaryId[payroll[i].recipient] = i;
        }
        
        salaryId[recipient] = 0;
        delete payroll[payroll.length-1];
        payroll.length--;
        payrollLength = payroll.length;
    }
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
    
    // How much are you owed right now?
    function getAmountOwed(address recipient) view public returns (uint256) {
        // get salary ID
        uint id = salaryId[recipient];
        if (id > 0) {
            // If it exists, calculate how much you're owed right now
            return (now - payroll[id].lastPaid) * payroll[id].payRate;
        } else {
            return 0;
        }
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
    
    //Make one salary payment
    function paySalary(address recipient, string memory justification) public {
        // How much are you owed right now?
        uint amount = getAmountOwed(recipient);
        if (amount > 0) return;
        
        // Take it out from savings
        compound.withdraw(daiAddress, amount);
        
        // Pay it out
        payroll[salaryId[recipient]].lastPaid = now;
        dai.transfer(recipient, amount);
        emit MemberPaid( recipient,  amount, justification);
    }
    
    // Pay all salaries
    function payAll() public {
        for (uint i = 1; i<payroll.length-1; i++){
            paySalary(payroll[i].recipient, '');
        }
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    // If pinged, save and pay everyone
    function () external payable {
        putInSavings();
        payAll();
        msg.sender.transfer(msg.value);
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
    
    // pay everyone!
    // function() external payable {
    //     uint totalToPay = 0;
    //     uint payrollLength = payroll.length; 
    //     uint[] memory payments = new uint[](payrollLength);
    //     uint amount; 
       
    //   for (uint i = 1; i<payrollLength-1; i++){
    //         amount = (now - payroll[i].lastPaid) * payroll[i].payRate;
    //         totalToPay += amount;
    //         payments[i] = amount;
    //     } 
        
    //     compound.withdraw(daiAddress, totalToPay);
        
    //     require(dai.balanceOf(address(this)) <= totalToPay);
        
    //     for (uint i = 1; i<payrollLength-1; i++){
    //         payroll[i].lastPaid = now;
    //         dai.transfer(payroll[i].recipient, payments[i]);
    //         emit MemberPaid(payroll[i].recipient, payments[i]);
    //     }  
                
    //     save();
    //     msg.sender.transfer(msg.value);
    // }
}