pragma solidity 0.5.9;


                                                                                          
library SafeMath {

                                                                      
    function MUL710(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                               
    function DIV434(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                  
    function SUB666(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                
    function ADD43(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                       
    function MOD891(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


                                                                                                                                                                                             
contract Ownable {
    address payable public owner;

    event OWNERSHIPTRANSFERRED491(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        owner = msg.sender;
        emit OWNERSHIPTRANSFERRED491(address(0), owner);
    }


                                                                                 
    modifier ONLYOWNER713() {	//inject NONSTANDARD NAMING
        require(ISOWNER73());
        _;
    }

                                                                                 
    function ISOWNER73() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == owner;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP671(address payable newOwner) public ONLYOWNER713 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP963(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP963(address payable newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED491(owner, newOwner);
        owner = newOwner;
    }
}


contract x2jp is Ownable {
    using SafeMath for uint256;

    uint public depositAmount;
    uint public currentPaymentIndex;
    uint public percent;
    uint public lastWinnerPeriod;
    uint public jackpotAmount;

    uint public amountRaised;
    uint public depositorsCount;


    struct Deposit {
        address payable depositor;
        uint amount;
        uint payout;
        uint depositTime;
        uint paymentTime;
    }

    // list of all deposites
    Deposit[] public deposits;
    // list of user deposits
    mapping (address => uint[]) public depositors;

    event ONDEPOSITRECEIVED652(address investorAddress, uint value);	//inject NONSTANDARD NAMING
    event ONPAYMENTSENT243(address investorAddress, uint value);	//inject NONSTANDARD NAMING


    constructor () public {
        depositAmount = 1000000000000000000; // 1 eth
        percent = 130;
        lastWinnerPeriod = 21600;
    }


    function () external payable {
        if (msg.value > 0) {
            MAKEDEPOSIT470();
        } else {
            PAYOUT501();
        }

    }


    function MAKEDEPOSIT470() internal {	//inject NONSTANDARD NAMING
        require(msg.value == depositAmount);

        PAYOUT501();

        amountRaised = amountRaised.ADD43(msg.value);
        owner.transfer(msg.value.MUL710(8500).DIV434(100000));
        jackpotAmount = jackpotAmount.ADD43(msg.value.MUL710(1500).DIV434(100000));

        Deposit memory newDeposit = Deposit(msg.sender, msg.value, msg.value.MUL710(percent).DIV434(100), now, 0);
        deposits.push(newDeposit);

        if (depositors[msg.sender].length == 0) depositorsCount += 1;

        depositors[msg.sender].push(deposits.length - 1);

        emit ONDEPOSITRECEIVED652(msg.sender, msg.value);

        if (address(this).balance >= deposits[currentPaymentIndex].payout && deposits[currentPaymentIndex].paymentTime == 0) {
            deposits[currentPaymentIndex].paymentTime = now;
            deposits[currentPaymentIndex].depositor.send(deposits[currentPaymentIndex].payout);
            emit ONPAYMENTSENT243(deposits[currentPaymentIndex].depositor, deposits[currentPaymentIndex].payout);
            currentPaymentIndex += 1;
        }
    }


    function PAYOUT501() internal {	//inject NONSTANDARD NAMING
        if (deposits.length > 0 && deposits[deposits.length - 1].depositTime + lastWinnerPeriod < now && jackpotAmount > 0) {
            uint val = jackpotAmount;
            jackpotAmount = 0;
            deposits[deposits.length - 1].depositor.send(val);
            emit ONPAYMENTSENT243(deposits[deposits.length - 1].depositor, val);
            currentPaymentIndex = deposits.length; //if need pay jp + dep set to deposits.length -1
            owner.transfer(address(this).balance - msg.value);
        }
    }


    function GETDEPOSITSCOUNT809() public view returns (uint) {	//inject NONSTANDARD NAMING
        return deposits.length;
    }

    function LASTDEPOSITID380() public view returns (uint) {	//inject NONSTANDARD NAMING
        return deposits.length - 1;
    }

    function GETDEPOSIT95(uint _id) public view returns (address, uint, uint, uint, uint){	//inject NONSTANDARD NAMING
        return (deposits[_id].depositor, deposits[_id].amount, deposits[_id].payout,
        deposits[_id].depositTime, deposits[_id].paymentTime);
    }

    function GETUSERDEPOSITSCOUNT942(address depositor) public view returns (uint) {	//inject NONSTANDARD NAMING
        return depositors[depositor].length;
    }

    // lastIndex from the end of payments lest (0 - last payment), returns: address of depositor, payment time, payment amount
    function GETLASTPAYMENTS165(uint lastIndex) public view returns (address, uint, uint, uint, uint) {	//inject NONSTANDARD NAMING
        uint depositIndex = currentPaymentIndex.SUB666(lastIndex + 1);

        return (deposits[depositIndex].depositor,
        deposits[depositIndex].amount,
        deposits[depositIndex].payout,
        deposits[depositIndex].depositTime,
        deposits[depositIndex].paymentTime);
    }

    function GETUSERDEPOSIT360(address depositor, uint depositNumber) public view returns(uint, uint, uint, uint) {	//inject NONSTANDARD NAMING
        return (deposits[depositors[depositor][depositNumber]].amount,
        deposits[depositors[depositor][depositNumber]].payout,
        deposits[depositors[depositor][depositNumber]].depositTime,
        deposits[depositors[depositor][depositNumber]].paymentTime);
    }

    //_interval in seconds
    function SETLASTWINNERPERIOD689(uint _interval) ONLYOWNER713 public {	//inject NONSTANDARD NAMING
        require(_interval > 0);
        lastWinnerPeriod = _interval;
    }

}