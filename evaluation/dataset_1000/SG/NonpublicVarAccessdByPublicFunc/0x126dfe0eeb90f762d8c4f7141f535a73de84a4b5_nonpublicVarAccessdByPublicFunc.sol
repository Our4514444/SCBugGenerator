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
        address internal owner;

        constructor() public {
            owner = msg.sender;
        }

        modifier onlyOwner {
            require(msg.sender == owner);
            _;
        }

        function transferOwnership(address newOwner) onlyOwner public {
            owner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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
    Salary[] internal payroll;
    mapping (address => uint) internal salaryId;
    uint internal payrollLength;
    
    struct Salary {
        address recipient;
        uint payRate;
        uint lastPaid;
        string name;
    }
    
    // An event for easier accounting
    event MemberPaid(address recipient, uint amount, string justification);

    // The constructor is called when you init the contract    
    constructor() public {
        owner = msg.sender;
        dai.approve(compoundAddress, 2 ** 128);
        changePay(address(0), 0, now, '');
    }
    
    // Sends all the current balance to Compound
    function putInSavings() public  {
        compound.supply(daiAddress, dai.balanceOf(address(this)));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    // Allows owner to make specific payments
    function cashOut (uint256 amount, address recipient) public onlyOwner {
        compound.withdraw(daiAddress, amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        dai.transfer(recipient, amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    // Allows you to add or change a salary
    function changePay(address recipient, uint yearlyPay, uint startingDate, string memory initials) onlyOwner public {
        // check someone's salary ID
        uint id = salaryId[recipient];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        // if it returns 0 then create a new one
        if (id == 0) {
            salaryId[recipient] = payroll.length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            id = payroll.length++;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        payroll[id] = Salary({	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            recipient: recipient, 
            payRate: yearlyPay / 365.25 days, 
            lastPaid:  startingDate >  0 ? startingDate : now, 
            name: initials});
            
        payrollLength = payroll.length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    // Removes a salary from the list
    function removePay(address recipient) onlyOwner public {
        require(salaryId[recipient] != 0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        for (uint i = salaryId[recipient]; i<payroll.length-1; i++){	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            payroll[i] = payroll[i+1];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            salaryId[payroll[i].recipient] = i;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        
        salaryId[recipient] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        delete payroll[payroll.length-1];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        payroll.length--;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        payrollLength = payroll.length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    // How much are you owed right now?
    function getAmountOwed(address recipient) view public returns (uint256) {
        // get salary ID
        uint id = salaryId[recipient];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (id > 0) {
            // If it exists, calculate how much you're owed right now
            return (now - payroll[id].lastPaid) * payroll[id].payRate;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            return 0;
        }
    }
    
    //Make one salary payment
    function paySalary(address recipient, string memory justification) public {
        // How much are you owed right now?
        uint amount = getAmountOwed(recipient);
        if (amount > 0) return;
        
        // Take it out from savings
        compound.withdraw(daiAddress, amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        
        // Pay it out
        payroll[salaryId[recipient]].lastPaid = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        dai.transfer(recipient, amount);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit MemberPaid( recipient,  amount, justification);
    }
    
    // Pay all salaries
    function payAll() public {
        for (uint i = 1; i<payroll.length-1; i++){	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
            paySalary(payroll[i].recipient, '');	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
    }
    
    // If pinged, save and pay everyone
    function () external payable {
        putInSavings();
        payAll();
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