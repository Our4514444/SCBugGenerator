pragma solidity ^0.5.1;

// Interface for interacting with Compound
interface CompoundContract {
    function  SUPPLY421 (address asset, uint256 amount) external returns (uint256);	//inject NONSTANDARD NAMING
    function WITHDRAW410 (address asset, uint256 requestedAmount) external returns (uint256);	//inject NONSTANDARD NAMING
}

// Interface for interacting with tokens
interface token {
    function TRANSFER550(address _to, uint256 _value) external returns (bool success) ;	//inject NONSTANDARD NAMING
    function APPROVE86(address _spender, uint256 _value) external returns (bool);	//inject NONSTANDARD NAMING
    function BALANCEOF475(address owner) external returns (uint256);	//inject NONSTANDARD NAMING
}

// Basic ownership library
 contract owned {
        address public owner;

        constructor() public {
            owner = msg.sender;
        }

        modifier ONLYOWNER790 {	//inject NONSTANDARD NAMING
            require(msg.sender == owner);
            _;
        }

        function TRANSFEROWNERSHIP569(address newOwner) ONLYOWNER790 public {	//inject NONSTANDARD NAMING
            owner = newOwner;
        }
    }

// Here we start
contract CompoundPayroll is owned {
    // first, let's define the contracts we'll be interacting with
    address compoundAddress = 0x3FDA67f7583380E67ef93072294a7fAc882FD7E7;
    address daiAddress = 0x89d24A6b4CcB1B6fAA2625fE562bDD9a23260359;
    CompoundContract compound = CompoundContract(compoundAddress);
    token dai = token(daiAddress);
    
    // Now let's create a payroll object
    Salary[] public payroll;
    mapping (address => uint) public salaryId;
    uint public payrollLength;
    
    struct Salary {
        address recipient;
        uint payRate;
        uint lastPaid;
        string name;
    }
    
    // An event for easier accounting
    event MEMBERPAID419(address recipient, uint amount, string justification);	//inject NONSTANDARD NAMING

    // The constructor is called when you init the contract    
    constructor() public {
        owner = msg.sender;
        dai.APPROVE86(compoundAddress, 2 ** 128);
        CHANGEPAY500(address(0), 0, now, '');
    }
    
    // Sends all the current balance to Compound
    function PUTINSAVINGS427() public  {	//inject NONSTANDARD NAMING
        compound.SUPPLY421(daiAddress, dai.BALANCEOF475(address(this)));
    }
    
    // Allows owner to make specific payments
    function CASHOUT165 (uint256 amount, address recipient) public ONLYOWNER790 {	//inject NONSTANDARD NAMING
        compound.WITHDRAW410(daiAddress, amount);
        dai.TRANSFER550(recipient, amount);
    }

    // Allows you to add or change a salary
    function CHANGEPAY500(address recipient, uint yearlyPay, uint startingDate, string memory initials) ONLYOWNER790 public {	//inject NONSTANDARD NAMING
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
    function REMOVEPAY713(address recipient) ONLYOWNER790 public {	//inject NONSTANDARD NAMING
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
    
    // How much are you owed right now?
    function GETAMOUNTOWED986(address recipient) view public returns (uint256) {	//inject NONSTANDARD NAMING
        // get salary ID
        uint id = salaryId[recipient];
        if (id > 0) {
            // If it exists, calculate how much you're owed right now
            return (now - payroll[id].lastPaid) * payroll[id].payRate;
        } else {
            return 0;
        }
    }
    
    //Make one salary payment
    function PAYSALARY876(address recipient, string memory justification) public {	//inject NONSTANDARD NAMING
        // How much are you owed right now?
        uint amount = GETAMOUNTOWED986(recipient);
        if (amount > 0) return;
        
        // Take it out from savings
        compound.WITHDRAW410(daiAddress, amount);
        
        // Pay it out
        payroll[salaryId[recipient]].lastPaid = now;
        dai.TRANSFER550(recipient, amount);
        emit MEMBERPAID419( recipient,  amount, justification);
    }
    
    // Pay all salaries
    function PAYALL409() public {	//inject NONSTANDARD NAMING
        for (uint i = 1; i<payroll.length-1; i++){
            PAYSALARY876(payroll[i].recipient, '');
        }
    }
    
    // If pinged, save and pay everyone
    function () external payable {
        PUTINSAVINGS427();
        PAYALL409();
        msg.sender.transfer(msg.value);
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