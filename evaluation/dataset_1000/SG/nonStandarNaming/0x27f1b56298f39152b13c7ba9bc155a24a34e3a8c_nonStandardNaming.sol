                                                                 

pragma solidity ^0.5.15;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

// Original file came from Compound: https://github.com/compound-finance/compound-protocol/blob/master/contracts/Timelock.sol

// Original audit: https://blog.openzeppelin.com/compound-finance-patch-audit/
// Overview:
//    No Critical
//    No High
//
// Changes made by YAM after audit:
//    Formatting, naming, & uint256 instead of uint

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                                    
    function ADD22(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                        
    function SUB824(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB824(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                            
    function SUB824(	//inject NONSTANDARD NAMING
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                                
    function MUL408(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function DIV7(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV7(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function DIV7(	//inject NONSTANDARD NAMING
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function MOD887(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD887(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function MOD887(	//inject NONSTANDARD NAMING
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract Timelock {
    using SafeMath for uint256;

                                                                
    event NEWADMIN2(address indexed newAdmin);	//inject NONSTANDARD NAMING
                                                                           
    event NEWPENDINGADMIN175(address indexed newPendingAdmin);	//inject NONSTANDARD NAMING
    event NEWDELAY245(uint256 indexed newDelay);	//inject NONSTANDARD NAMING
                                                                       
    event CANCELTRANSACTION411(	//inject NONSTANDARD NAMING
        bytes32 indexed txHash,
        address indexed target,
        uint256 value,
        string signature,
        bytes data,
        uint256 eta
    );
                                                                      
    event EXECUTETRANSACTION212(	//inject NONSTANDARD NAMING
        bytes32 indexed txHash,
        address indexed target,
        uint256 value,
        string signature,
        bytes data,
        uint256 eta
    );
                                                                 
    event QUEUETRANSACTION500(	//inject NONSTANDARD NAMING
        bytes32 indexed txHash,
        address indexed target,
        uint256 value,
        string signature,
        bytes data,
        uint256 eta
    );

                                                                                                
    uint256 public constant grace_period906 = 14 days;	//inject NONSTANDARD NAMING
                                                        
    uint256 public constant minimum_delay833 = 12 hours;	//inject NONSTANDARD NAMING
                                                        
    uint256 public constant maximum_delay335 = 30 days;	//inject NONSTANDARD NAMING

    address public admin;
    address public pendingAdmin;
    uint256 public delay;
    bool public admin_initialized;

    mapping(bytes32 => bool) public queuedTransactions;

    constructor() public {
                                                                                                                                                                                                                

        admin = msg.sender;
        delay = minimum_delay833;
        admin_initialized = false;
    }

    function() external payable {}

                                                                          
    function SETDELAY20(uint256 delay_) public {	//inject NONSTANDARD NAMING
        require(
            msg.sender == address(this),
            "Timelock::setDelay: Call must come from Timelock."
        );
        require(
            delay_ >= minimum_delay833,
            "Timelock::setDelay: Delay must exceed minimum delay."
        );
        require(
            delay_ <= maximum_delay335,
            "Timelock::setDelay: Delay must not exceed maximum delay."
        );
        delay = delay_;

        emit NEWDELAY245(delay);
    }

                                          
    function ACCEPTADMIN438() public {	//inject NONSTANDARD NAMING
        require(
            msg.sender == pendingAdmin,
            "Timelock::acceptAdmin: Call must come from pendingAdmin."
        );
        admin = msg.sender;
        pendingAdmin = address(0);

        emit NEWADMIN2(admin);
    }

                                                                                                           
    function SETPENDINGADMIN327(address pendingAdmin_) public {	//inject NONSTANDARD NAMING
        // allows one time setting of admin for deployment purposes
        if (admin_initialized) {
            require(
                msg.sender == address(this),
                "Timelock::setPendingAdmin: Call must come from Timelock."
            );
        } else {
            require(
                msg.sender == admin,
                "Timelock::setPendingAdmin: !init & !admin"
            );
            admin_initialized = true;
        }
        pendingAdmin = pendingAdmin_;

        emit NEWPENDINGADMIN175(pendingAdmin);
    }

    function QUEUETRANSACTION417(	//inject NONSTANDARD NAMING
        address target,
        uint256 value,
        string memory signature,
        bytes memory data,
        uint256 eta
    ) public returns (bytes32) {
        require(
            msg.sender == admin,
            "Timelock::queueTransaction: Call must come from admin."
        );
        require(
            eta >= GETBLOCKTIMESTAMP274().ADD22(delay),
            "Timelock::queueTransaction: Estimated execution block must satisfy delay."
        );

        bytes32 txHash = keccak256(
            abi.encode(target, value, signature, data, eta)
        );
        queuedTransactions[txHash] = true;

        emit QUEUETRANSACTION500(txHash, target, value, signature, data, eta);
        return txHash;
    }

    function CANCELTRANSACTION699(	//inject NONSTANDARD NAMING
        address target,
        uint256 value,
        string memory signature,
        bytes memory data,
        uint256 eta
    ) public {
        require(
            msg.sender == admin,
            "Timelock::cancelTransaction: Call must come from admin."
        );

        bytes32 txHash = keccak256(
            abi.encode(target, value, signature, data, eta)
        );
        queuedTransactions[txHash] = false;

        emit CANCELTRANSACTION411(txHash, target, value, signature, data, eta);
    }

    function EXECUTETRANSACTION79(	//inject NONSTANDARD NAMING
        address target,
        uint256 value,
        string memory signature,
        bytes memory data,
        uint256 eta
    ) public payable returns (bytes memory) {
        require(
            msg.sender == admin,
            "Timelock::executeTransaction: Call must come from admin."
        );

        // timelock not enforced prior to updating the admin. This should occur on
        // deployment.
        bytes32 txHash = keccak256(
            abi.encode(target, value, signature, data, eta)
        );
        if (admin_initialized) {
            require(
                queuedTransactions[txHash],
                "Timelock::executeTransaction: Transaction hasn't been queued."
            );
            require(
                GETBLOCKTIMESTAMP274() >= eta,
                "Timelock::executeTransaction: Transaction hasn't surpassed time lock."
            );
            require(
                GETBLOCKTIMESTAMP274() <= eta.ADD22(grace_period906),
                "Timelock::executeTransaction: Transaction is stale."
            );

            queuedTransactions[txHash] = false;
        }

        bytes memory callData;

        if (bytes(signature).length == 0) {
            callData = data;
        } else {
            callData = abi.encodePacked(
                bytes4(keccak256(bytes(signature))),
                data
            );
        }

        // solium-disable-next-line security/no-call-value
        (bool success, bytes memory returnData) = target.call.value(value)(
            callData
        );
        require(
            success,
            "Timelock::executeTransaction: Transaction execution reverted."
        );

        emit EXECUTETRANSACTION212(txHash, target, value, signature, data, eta);

        return returnData;
    }

    function GETBLOCKTIMESTAMP274() internal view returns (uint256) {	//inject NONSTANDARD NAMING
        // solium-disable-next-line security/no-block-members
        return block.timestamp;
    }
}