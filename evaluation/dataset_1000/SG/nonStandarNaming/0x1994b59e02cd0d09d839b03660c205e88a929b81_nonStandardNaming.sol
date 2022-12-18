                                                                 

pragma solidity ^0.5.16;

library SafeMath {
    function ADD998(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    function ADD998(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, errorMessage);
        return c;
    }
    function SUB167(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB167(a, b, "SafeMath: subtraction underflow");
    }
    function SUB167(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;
        return c;
    }
    function MUL536(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function MUL536(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b, errorMessage);
        return c;
    }
    function DIV716(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV716(a, b, "SafeMath: division by zero");
    }
    function DIV716(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0, errorMessage);
        uint256 c = a / b;
        return c;
    }
    function MOD380(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD380(a, b, "SafeMath: modulo by zero");
    }
    function MOD380(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract Timelock {
    using SafeMath for uint;

    event NEWADMIN174(address indexed newAdmin);	//inject NONSTANDARD NAMING
    event NEWPENDINGADMIN386(address indexed newPendingAdmin);	//inject NONSTANDARD NAMING
    event NEWDELAY225(uint indexed newDelay);	//inject NONSTANDARD NAMING
    event CANCELTRANSACTION66(bytes32 indexed txHash, address indexed target, uint value, string signature,  bytes data, uint eta);	//inject NONSTANDARD NAMING
    event EXECUTETRANSACTION880(bytes32 indexed txHash, address indexed target, uint value, string signature,  bytes data, uint eta);	//inject NONSTANDARD NAMING
    event QUEUETRANSACTION291(bytes32 indexed txHash, address indexed target, uint value, string signature, bytes data, uint eta);	//inject NONSTANDARD NAMING

    uint public constant grace_period822 = 14 days;	//inject NONSTANDARD NAMING
    uint public constant minimum_delay108 = 1 days;	//inject NONSTANDARD NAMING
    uint public constant maximum_delay161 = 30 days;	//inject NONSTANDARD NAMING

    address public admin;
    address public pendingAdmin;
    uint public delay;

    mapping (bytes32 => bool) public queuedTransactions;


    constructor(address admin_, uint delay_) public {
        require(delay_ >= minimum_delay108, "Timelock::constructor: Delay must exceed minimum delay.");
        require(delay_ <= maximum_delay161, "Timelock::setDelay: Delay must not exceed maximum delay.");

        admin = admin_;
        delay = delay_;
    }

    function() external payable { }

    function SETDELAY794(uint delay_) public {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "Timelock::setDelay: Call must come from Timelock.");
        require(delay_ >= minimum_delay108, "Timelock::setDelay: Delay must exceed minimum delay.");
        require(delay_ <= maximum_delay161, "Timelock::setDelay: Delay must not exceed maximum delay.");
        delay = delay_;

        emit NEWDELAY225(delay);
    }

    function ACCEPTADMIN374() public {	//inject NONSTANDARD NAMING
        require(msg.sender == pendingAdmin, "Timelock::acceptAdmin: Call must come from pendingAdmin.");
        admin = msg.sender;
        pendingAdmin = address(0);

        emit NEWADMIN174(admin);
    }

    function SETPENDINGADMIN814(address pendingAdmin_) public {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "Timelock::setPendingAdmin: Call must come from Timelock.");
        pendingAdmin = pendingAdmin_;

        emit NEWPENDINGADMIN386(pendingAdmin);
    }

    function QUEUETRANSACTION158(address target, uint value, string memory signature, bytes memory data, uint eta) public returns (bytes32) {	//inject NONSTANDARD NAMING
        require(msg.sender == admin, "Timelock::queueTransaction: Call must come from admin.");
        require(eta >= GETBLOCKTIMESTAMP718().ADD998(delay), "Timelock::queueTransaction: Estimated execution block must satisfy delay.");

        bytes32 txHash = keccak256(abi.encode(target, value, signature, data, eta));
        queuedTransactions[txHash] = true;

        emit QUEUETRANSACTION291(txHash, target, value, signature, data, eta);
        return txHash;
    }

    function CANCELTRANSACTION901(address target, uint value, string memory signature, bytes memory data, uint eta) public {	//inject NONSTANDARD NAMING
        require(msg.sender == admin, "Timelock::cancelTransaction: Call must come from admin.");

        bytes32 txHash = keccak256(abi.encode(target, value, signature, data, eta));
        queuedTransactions[txHash] = false;

        emit CANCELTRANSACTION66(txHash, target, value, signature, data, eta);
    }

    function EXECUTETRANSACTION674(address target, uint value, string memory signature, bytes memory data, uint eta) public payable returns (bytes memory) {	//inject NONSTANDARD NAMING
        require(msg.sender == admin, "Timelock::executeTransaction: Call must come from admin.");

        bytes32 txHash = keccak256(abi.encode(target, value, signature, data, eta));
        require(queuedTransactions[txHash], "Timelock::executeTransaction: Transaction hasn't been queued.");
        require(GETBLOCKTIMESTAMP718() >= eta, "Timelock::executeTransaction: Transaction hasn't surpassed time lock.");
        require(GETBLOCKTIMESTAMP718() <= eta.ADD998(grace_period822), "Timelock::executeTransaction: Transaction is stale.");

        queuedTransactions[txHash] = false;

        bytes memory callData;

        if (bytes(signature).length == 0) {
            callData = data;
        } else {
            callData = abi.encodePacked(bytes4(keccak256(bytes(signature))), data);
        }

        // solium-disable-next-line security/no-call-value
        (bool success, bytes memory returnData) = target.call.value(value)(callData);
        require(success, "Timelock::executeTransaction: Transaction execution reverted.");

        emit EXECUTETRANSACTION880(txHash, target, value, signature, data, eta);

        return returnData;
    }

    function GETBLOCKTIMESTAMP718() internal view returns (uint) {	//inject NONSTANDARD NAMING
        // solium-disable-next-line security/no-block-members
        return block.timestamp;
    }
}