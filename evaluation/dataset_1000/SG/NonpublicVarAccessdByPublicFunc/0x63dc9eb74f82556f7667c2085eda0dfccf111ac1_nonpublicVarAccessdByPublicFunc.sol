pragma solidity ^0.5.8;


/**
 * @title SafeMath
 * @dev Math operations with safety checks that revert on error
 */
library SafeMath {

    /**
    * @dev Multiplies two numbers, reverts on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
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

    /**
    * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0); // Solidity only automatically asserts when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
    * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Adds two numbers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
    * @dev Divides two numbers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}


/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
    address payable internal owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor () internal {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), owner);
    }


    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    /**
     * @return true if `msg.sender` is the owner of the contract.
     */
    function isOwner() public view returns (bool) {
        return msg.sender == owner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address payable newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function _transferOwnership(address payable newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}


contract PureRisk is Ownable {
    using SafeMath for uint256;

    uint public depositAmount = 0.1 ether; // 0.1 eth
    uint internal currentPaymentIndex;
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
    Deposit[] internal deposits;
    // list of user deposits
    mapping (address => uint[]) internal depositors;

    event OnDepositReceived(address investorAddress, uint depositTime, uint depositorsCount);
    event OnPaymentSent(address investorAddress, uint paymentTime, uint currentPaymentIndex);

    mapping (address => address) public referal;

    constructor () public {

    }


    function () external payable {
        makeDeposit();
    }

    function makeDeposit() internal {
        require(msg.sender != bytesToAddress(msg.data));
        require(msg.value == depositAmount);

        Deposit memory newDeposit = Deposit(msg.sender, msg.value, msg.value.mul(percent).div(100), now, 0);
        deposits.push(newDeposit);

        if (depositors[msg.sender].length == 0) depositorsCount += 1;

        depositors[msg.sender].push(deposits.length - 1);

        amountRaised = amountRaised.add(msg.value);

        emit OnDepositReceived(msg.sender, msg.value, depositorsCount);

        if(bytesToAddress(msg.data) != address(0x00)){
            bytesToAddress(msg.data).transfer(msg.value.mul(percentDev.div(2)).div(100));
            owner.transfer(msg.value.mul(percentDev.div(2)).div(100));
        } else {
            owner.transfer(msg.value.mul(percentDev).div(100));
        }

        if (address(this).balance >= deposits[currentPaymentIndex].payout && deposits[currentPaymentIndex].paymentTime == 0) {
            deposits[currentPaymentIndex].paymentTime = now;
            deposits[currentPaymentIndex].depositor.transfer(deposits[currentPaymentIndex].payout);
            emit OnPaymentSent(deposits[currentPaymentIndex].depositor, now, currentPaymentIndex);
            currentPaymentIndex += 1;
        }
    }


    function getDepositsCount() public view returns (uint) {
        return deposits.length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function lastDepositId() public view returns (uint) {
        return deposits.length - 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getDeposit(uint _id) public view returns (address, uint, uint, uint, uint){
        return (deposits[_id].depositor, deposits[_id].amount, deposits[_id].payout,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        deposits[_id].depositTime, deposits[_id].paymentTime);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getUserDepositsCount(address depositor) public view returns (uint) {
        return depositors[depositor].length;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    // lastIndex from the end of payments lest (0 - last payment), returns: address of depositor, payment time, payment amount
    function getLastPayments(uint lastIndex) public view returns (address, uint, uint, uint, uint) {
        uint depositIndex = currentPaymentIndex.sub(lastIndex + 1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        return (deposits[depositIndex].depositor,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        deposits[depositIndex].amount,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        deposits[depositIndex].payout,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        deposits[depositIndex].depositTime,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        deposits[depositIndex].paymentTime);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function getUserDeposit(address depositor, uint depositNumber) public view returns(uint, uint, uint, uint) {
        return (deposits[depositors[depositor][depositNumber]].amount,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        deposits[depositors[depositor][depositNumber]].payout,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        deposits[depositors[depositor][depositNumber]].depositTime,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        deposits[depositors[depositor][depositNumber]].paymentTime);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function bytesToAddress(bytes memory _addr) internal pure returns (address payable addr) {
        assembly {
          addr := mload(add(_addr,20))
        } 
    }

}