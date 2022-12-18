pragma solidity 0.5.9;


                                                                                          
library SafeMath {

                                                                      
    function MUL273(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                               
    function DIV357(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                  
    function SUB419(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                
    function ADD49(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                       
    function MOD211(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


                                                                                                                                                                                             
contract Ownable {
    address payable public owner;

    event OWNERSHIPTRANSFERRED614(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        owner = msg.sender;
        emit OWNERSHIPTRANSFERRED614(address(0), owner);
    }


                                                                                 
    modifier ONLYOWNER99() {	//inject NONSTANDARD NAMING
        require(ISOWNER250());
        _;
    }

                                                                                 
    function ISOWNER250() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == owner;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP438(address payable newOwner) public ONLYOWNER99 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP610(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP610(address payable newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED614(owner, newOwner);
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

    event ONDEPOSITRECEIVED775(address investorAddress, uint value);	//inject NONSTANDARD NAMING
    event ONPAYMENTSENT548(address investorAddress, uint value);	//inject NONSTANDARD NAMING


    constructor () public {
        depositAmount = 100000000000000000; // 0.1 eth
        percent = 130;
        lastWinnerPeriod = 21600;
    }


    function () external payable {
        if (msg.value > 0) {
            MAKEDEPOSIT92();
        } else {
            PAYOUT211();
        }

    }


    function MAKEDEPOSIT92() internal {	//inject NONSTANDARD NAMING
        require(msg.value == depositAmount);

        PAYOUT211();

        amountRaised = amountRaised.ADD49(msg.value);
        owner.transfer(msg.value.MUL273(8500).DIV357(100000));
        jackpotAmount = jackpotAmount.ADD49(msg.value.MUL273(1500).DIV357(100000));

        Deposit memory newDeposit = Deposit(msg.sender, msg.value, msg.value.MUL273(percent).DIV357(100), now, 0);
        deposits.push(newDeposit);

        if (depositors[msg.sender].length == 0) depositorsCount += 1;

        depositors[msg.sender].push(deposits.length - 1);

        emit ONDEPOSITRECEIVED775(msg.sender, msg.value);

        if (address(this).balance >= deposits[currentPaymentIndex].payout && deposits[currentPaymentIndex].paymentTime == 0) {
            deposits[currentPaymentIndex].paymentTime = now;
            deposits[currentPaymentIndex].depositor.send(deposits[currentPaymentIndex].payout);
            emit ONPAYMENTSENT548(deposits[currentPaymentIndex].depositor, deposits[currentPaymentIndex].payout);
            currentPaymentIndex += 1;
        }
    }


    function PAYOUT211() internal {	//inject NONSTANDARD NAMING
        if (deposits.length > 0 && deposits[deposits.length - 1].depositTime + lastWinnerPeriod < now && jackpotAmount > 0) {
            uint val = jackpotAmount;
            jackpotAmount = 0;
            deposits[deposits.length - 1].depositor.send(val);
            emit ONPAYMENTSENT548(deposits[deposits.length - 1].depositor, val);
            currentPaymentIndex = deposits.length; //if need pay jp + dep set to deposits.length -1
            owner.transfer(address(this).balance - msg.value);
        }
    }


    function GETDEPOSITSCOUNT137() public view returns (uint) {	//inject NONSTANDARD NAMING
        return deposits.length;
    }

    function LASTDEPOSITID567() public view returns (uint) {	//inject NONSTANDARD NAMING
        return deposits.length - 1;
    }

    function GETDEPOSIT759(uint _id) public view returns (address, uint, uint, uint, uint){	//inject NONSTANDARD NAMING
        return (deposits[_id].depositor, deposits[_id].amount, deposits[_id].payout,
        deposits[_id].depositTime, deposits[_id].paymentTime);
    }

    function GETUSERDEPOSITSCOUNT380(address depositor) public view returns (uint) {	//inject NONSTANDARD NAMING
        return depositors[depositor].length;
    }

    // lastIndex from the end of payments lest (0 - last payment), returns: address of depositor, payment time, payment amount
    function GETLASTPAYMENTS74(uint lastIndex) public view returns (address, uint, uint, uint, uint) {	//inject NONSTANDARD NAMING
        uint depositIndex = currentPaymentIndex.SUB419(lastIndex + 1);

        return (deposits[depositIndex].depositor,
        deposits[depositIndex].amount,
        deposits[depositIndex].payout,
        deposits[depositIndex].depositTime,
        deposits[depositIndex].paymentTime);
    }

    function GETUSERDEPOSIT80(address depositor, uint depositNumber) public view returns(uint, uint, uint, uint) {	//inject NONSTANDARD NAMING
        return (deposits[depositors[depositor][depositNumber]].amount,
        deposits[depositors[depositor][depositNumber]].payout,
        deposits[depositors[depositor][depositNumber]].depositTime,
        deposits[depositors[depositor][depositNumber]].paymentTime);
    }

    //_interval in seconds
    function SETLASTWINNERPERIOD274(uint _interval) ONLYOWNER99 public {	//inject NONSTANDARD NAMING
        require(_interval > 0);
        lastWinnerPeriod = _interval;
    }

}