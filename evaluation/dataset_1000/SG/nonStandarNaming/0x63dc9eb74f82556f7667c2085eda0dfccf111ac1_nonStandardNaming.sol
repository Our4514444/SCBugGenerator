pragma solidity ^0.5.8;


                                                                                          
library SafeMath {

                                                                      
    function MUL175(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                               
    function DIV978(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                  
    function SUB605(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                
    function ADD152(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                       
    function MOD97(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


                                                                                                                                                                                             
contract Ownable {
    address payable public owner;

    event OWNERSHIPTRANSFERRED465(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        owner = msg.sender;
        emit OWNERSHIPTRANSFERRED465(address(0), owner);
    }


                                                                                 
    modifier ONLYOWNER24() {	//inject NONSTANDARD NAMING
        require(ISOWNER30());
        _;
    }

                                                                                 
    function ISOWNER30() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == owner;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP440(address payable newOwner) public ONLYOWNER24 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP566(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP566(address payable newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED465(owner, newOwner);
        owner = newOwner;
    }
}


contract PureRisk is Ownable {
    using SafeMath for uint256;

    uint public depositAmount = 0.1 ether; // 0.1 eth
    uint public currentPaymentIndex;
    uint public percent = 130;
    uint public percentDev = 10;

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

    event ONDEPOSITRECEIVED933(address investorAddress, uint depositTime, uint depositorsCount);	//inject NONSTANDARD NAMING
    event ONPAYMENTSENT641(address investorAddress, uint paymentTime, uint currentPaymentIndex);	//inject NONSTANDARD NAMING

    mapping (address => address) public referal;

    constructor () public {

    }


    function () external payable {
        MAKEDEPOSIT566();
    }

    function MAKEDEPOSIT566() internal {	//inject NONSTANDARD NAMING
        require(msg.sender != BYTESTOADDRESS82(msg.data));
        require(msg.value == depositAmount);

        Deposit memory newDeposit = Deposit(msg.sender, msg.value, msg.value.MUL175(percent).DIV978(100), now, 0);
        deposits.push(newDeposit);

        if (depositors[msg.sender].length == 0) depositorsCount += 1;

        depositors[msg.sender].push(deposits.length - 1);

        amountRaised = amountRaised.ADD152(msg.value);

        emit ONDEPOSITRECEIVED933(msg.sender, msg.value, depositorsCount);

        if(BYTESTOADDRESS82(msg.data) != address(0x00)){
            BYTESTOADDRESS82(msg.data).transfer(msg.value.MUL175(percentDev.DIV978(2)).DIV978(100));
            owner.transfer(msg.value.MUL175(percentDev.DIV978(2)).DIV978(100));
        } else {
            owner.transfer(msg.value.MUL175(percentDev).DIV978(100));
        }

        if (address(this).balance >= deposits[currentPaymentIndex].payout && deposits[currentPaymentIndex].paymentTime == 0) {
            deposits[currentPaymentIndex].paymentTime = now;
            deposits[currentPaymentIndex].depositor.transfer(deposits[currentPaymentIndex].payout);
            emit ONPAYMENTSENT641(deposits[currentPaymentIndex].depositor, now, currentPaymentIndex);
            currentPaymentIndex += 1;
        }
    }


    function GETDEPOSITSCOUNT42() public view returns (uint) {	//inject NONSTANDARD NAMING
        return deposits.length;
    }

    function LASTDEPOSITID536() public view returns (uint) {	//inject NONSTANDARD NAMING
        return deposits.length - 1;
    }

    function GETDEPOSIT452(uint _id) public view returns (address, uint, uint, uint, uint){	//inject NONSTANDARD NAMING
        return (deposits[_id].depositor, deposits[_id].amount, deposits[_id].payout,
        deposits[_id].depositTime, deposits[_id].paymentTime);
    }

    function GETUSERDEPOSITSCOUNT780(address depositor) public view returns (uint) {	//inject NONSTANDARD NAMING
        return depositors[depositor].length;
    }

    // lastIndex from the end of payments lest (0 - last payment), returns: address of depositor, payment time, payment amount
    function GETLASTPAYMENTS7(uint lastIndex) public view returns (address, uint, uint, uint, uint) {	//inject NONSTANDARD NAMING
        uint depositIndex = currentPaymentIndex.SUB605(lastIndex + 1);

        return (deposits[depositIndex].depositor,
        deposits[depositIndex].amount,
        deposits[depositIndex].payout,
        deposits[depositIndex].depositTime,
        deposits[depositIndex].paymentTime);
    }

    function GETUSERDEPOSIT332(address depositor, uint depositNumber) public view returns(uint, uint, uint, uint) {	//inject NONSTANDARD NAMING
        return (deposits[depositors[depositor][depositNumber]].amount,
        deposits[depositors[depositor][depositNumber]].payout,
        deposits[depositors[depositor][depositNumber]].depositTime,
        deposits[depositors[depositor][depositNumber]].paymentTime);
    }
    
    function BYTESTOADDRESS82(bytes memory _addr) internal pure returns (address payable addr) {	//inject NONSTANDARD NAMING
        assembly {
          addr := mload(add(_addr,20))
        } 
    }

}