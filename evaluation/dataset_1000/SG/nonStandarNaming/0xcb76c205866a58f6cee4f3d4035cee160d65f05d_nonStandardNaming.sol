                                                                 

pragma solidity ^0.5.5;

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function ISCONTRACT504(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

                                                                                                                                                                                                          
    function TOPAYABLE64(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE271(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD166(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB455(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB455(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB455(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL956(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV46(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV46(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV46(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD659(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD659(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD659(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}
                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY1() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF787(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER944(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE34(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE624(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM816(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER659(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL672(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER93(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN982(token, abi.encodeWithSelector(token.TRANSFER944.selector, to, value));
    }

    function SAFETRANSFERFROM823(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN982(token, abi.encodeWithSelector(token.TRANSFERFROM816.selector, from, to, value));
    }

    function SAFEAPPROVE85(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE34(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN982(token, abi.encodeWithSelector(token.APPROVE624.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE268(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE34(address(this), spender).ADD166(value);
        CALLOPTIONALRETURN982(token, abi.encodeWithSelector(token.APPROVE624.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE835(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE34(address(this), spender).SUB455(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN982(token, abi.encodeWithSelector(token.APPROVE624.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN982(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT504(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract MultiSigWallet {
    using Address for address;
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    modifier ISOWNER160{	//inject NONSTANDARD NAMING
        require(owner == msg.sender, "Only owner can execute it");
        _;
    }
    modifier ISMANAGER587{	//inject NONSTANDARD NAMING
        require(managers[msg.sender] == 1, "Only manager can execute it");
        _;
    }
    // 1111
    struct TxWithdraw {
        uint8 e;
        address payable to;
        uint256 amount;
        bool isERC20;
        address ERC20;
        Signature signature;
    }
    // 1111111
    struct TxManagerChange {
        uint8 e;
        address[] adds;
        address[] removes;
        Signature signature;
    }
    // 111111
    struct TxUpgrade {
        uint8 e;
        Signature signature;
    }
    struct Signature {
        uint8 signatureCount;
        address[] signed;
        mapping(address => uint8) signatures;
    }
    struct Validator {
        uint8 e;
        mapping(address => uint8) addsMap;
        mapping(address => uint8) removesMap;
    }
    bool public upgrade = false;
    // 1111111
    uint public max_managers = 15;
    // 111111 66%
    uint public rate = 66;
    // 1111
    uint constant denominator191 = 100;	//inject NONSTANDARD NAMING
    string constant update_seed_managers438 = "updateSeedManagers";	//inject NONSTANDARD NAMING
    // 1111111111111
    uint8 public current_withdraw_min_signatures;
    address public owner;
    mapping(address => uint8) private seedManagers;
    address[] public seedManagerArray;
    mapping(address => uint8) private managers;
    address[] private managerArray;
    mapping(string => TxWithdraw) private pendingTxWithdraws;
    mapping(string => TxManagerChange) private pendingTxManagerChanges;
    mapping(string => TxUpgrade) private pendingTxUpgrade;
    uint public pendingChangeCount = 0;
    mapping(string => uint8) private completedTxs;
    mapping(string => Validator) private validatorManager;

    constructor(address[] memory _managers) public{
        require(_managers.length <= max_managers, "Exceeded the maximum number of managers");
        owner = msg.sender;
        managerArray = _managers;
        for (uint8 i = 0; i < managerArray.length; i++) {
            managers[managerArray[i]] = 1;
            seedManagers[managerArray[i]] = 1;
            seedManagerArray.push(managerArray[i]);
        }
        require(managers[owner] == 0, "Contract creator cannot act as manager");
        // 111111111111111
        current_withdraw_min_signatures = CALMINSIGNATURES805(managerArray.length);
    }
    function() external payable {
        emit DEPOSITFUNDS379(msg.sender, msg.value);
    }
    function CREATEORSIGNWITHDRAW698(string memory txKey, address payable to, uint256 amount, bool isERC20, address ERC20) public ISMANAGER587 {	//inject NONSTANDARD NAMING
        require(to != address(0), "Withdraw: transfer to the zero address");
        require(amount > 0, "Withdrawal amount must be greater than 0");
        // 111111111
        require(completedTxs[txKey] == 0, "Transaction has been completed");
        // 111111111111
        if (pendingTxWithdraws[txKey].e != 0) {
            SIGNTX970(txKey);
            return;
        }
        if (isERC20) {
            VALIDATETRANSFERERC20379(ERC20, to, amount);
        } else {
            require(address(this).balance >= amount, "This contract address does not have sufficient balance of ether");
        }
        TxWithdraw memory tx1;
        pendingTxWithdraws[txKey] = tx1;
        TxWithdraw storage _tx = pendingTxWithdraws[txKey];
        _tx.e = 1;
        _tx.to = to;
        _tx.amount = amount;
        _tx.isERC20 = isERC20;
        _tx.ERC20 = ERC20;
        _tx.signature.signatureCount = 1;
        _tx.signature.signed.push(msg.sender);
        _tx.signature.signatures[msg.sender] = 1;
    }
    function SIGNTX970(string memory txKey) internal {	//inject NONSTANDARD NAMING
        TxWithdraw storage tx1 = pendingTxWithdraws[txKey];
        bool canWithdraw = ISCOMPLETESIGN24(tx1.signature, current_withdraw_min_signatures, 0);
        if (canWithdraw) {
            address[] memory signers = GETSIGNERS958(tx1.signature);
            if (tx1.isERC20) {
                TRANSFERERC20836(tx1.ERC20, tx1.to, tx1.amount);
            } else {
                // 1111
                uint transferAmount = tx1.amount;
                require(address(this).balance >= transferAmount, "This contract address does not have sufficient balance of ether");
                tx1.to.transfer(transferAmount);
                emit TRANSFERFUNDS603(tx1.to, transferAmount);
            }
            emit TXWITHDRAWCOMPLETED281(signers, txKey);
            // 111111
            DELETEPENDINGTX785(txKey, tx1.e, 1);
        }
    }
    function CREATEORSIGNMANAGERCHANGE249(string memory txKey, address[] memory adds, address[] memory removes, uint8 count) public ISMANAGER587 {	//inject NONSTANDARD NAMING
        require(adds.length > 0 || removes.length > 0, "There are no managers joining or exiting");
        // 111111111
        require(completedTxs[txKey] == 0, "Transaction has been completed");
        // 111111111111
        if (pendingTxManagerChanges[txKey].e != 0) {
            SIGNTXMANAGERCHANGE304(txKey);
            return;
        }
        PREVALIDATEADDSANDREMOVES67(txKey, adds, removes, false);
        TxManagerChange memory tx1;
        pendingTxManagerChanges[txKey] = tx1;
        TxManagerChange storage _tx = pendingTxManagerChanges[txKey];
        if (count == 0) {
            count = 1;
        }
        _tx.e = count;
        _tx.adds = adds;
        _tx.removes = removes;
        _tx.signature.signed.push(msg.sender);
        _tx.signature.signatures[msg.sender] = 1;
        _tx.signature.signatureCount = 1;
        pendingChangeCount++;
    }
    function SIGNTXMANAGERCHANGE304(string memory txKey) internal {	//inject NONSTANDARD NAMING
        TxManagerChange storage tx1 = pendingTxManagerChanges[txKey];
        address[] memory removes = tx1.removes;
        uint removeLengh = removes.length;
        if(removeLengh > 0) {
            for (uint i = 0; i < removeLengh; i++) {
                if (removes[i] == msg.sender) {
                    revert("Exiting manager cannot participate in manager change transactions");
                }
            }
        }
        bool canChange = ISCOMPLETESIGN24(tx1.signature, 0, removeLengh);
        if (canChange) {
            // 11111
            REMOVEMANAGER584(tx1.removes, false);
            ADDMANAGER67(tx1.adds, false);
            // 11111111111111
            current_withdraw_min_signatures = CALMINSIGNATURES805(managerArray.length);
            pendingChangeCount--;
            address[] memory signers = GETSIGNERS958(tx1.signature);
            // add managerChange event
            emit TXMANAGERCHANGECOMPLETED808(signers, txKey);
            // 111111
            DELETEPENDINGTX785(txKey, tx1.e, 2);
        }
    }
    function CREATEORSIGNUPGRADE63(string memory txKey) public ISMANAGER587 {	//inject NONSTANDARD NAMING
        // 111111111
        require(completedTxs[txKey] == 0, "Transaction has been completed");
        // 111111111111
        if (pendingTxUpgrade[txKey].e != 0) {
            SIGNTXUPGRADE487(txKey);
            return;
        }
        TxUpgrade memory tx1;
        pendingTxUpgrade[txKey] = tx1;
        TxUpgrade storage _tx = pendingTxUpgrade[txKey];
        _tx.e = 1;
        _tx.signature.signed.push(msg.sender);
        _tx.signature.signatures[msg.sender] = 1;
        _tx.signature.signatureCount = 1;
    }
    function SIGNTXUPGRADE487(string memory txKey) internal {	//inject NONSTANDARD NAMING
        TxUpgrade storage tx1 = pendingTxUpgrade[txKey];
        bool canUpgrade= ISCOMPLETESIGN24(tx1.signature, current_withdraw_min_signatures, 0);
        if (canUpgrade) {
            // 11111
            upgrade = true;
            address[] memory signers = GETSIGNERS958(tx1.signature);
            // add managerChange event
            emit TXUPGRADECOMPLETED934(signers, txKey);
            // 111111
            DELETEPENDINGTX785(txKey, tx1.e, 3);
        }
    }
    function ISCOMPLETESIGN24(Signature storage signature, uint8 min_signatures, uint removeLengh) internal returns (bool){	//inject NONSTANDARD NAMING
        bool complete = false;
        // 11111111
        signature.signatureCount = CALVALIDSIGNATURECOUNT714(signature);
        if (min_signatures == 0) {
            min_signatures = CALMINSIGNATURES805(managerArray.length - removeLengh);
        }
        if (signature.signatureCount >= min_signatures) {
            complete = true;
        }
        if (!complete) {
            require(signature.signatures[msg.sender] == 0, "Duplicate signature");
            signature.signed.push(msg.sender);
            signature.signatures[msg.sender] = 1;
            signature.signatureCount++;
            if (signature.signatureCount >= min_signatures) {
                complete = true;
            }
        }
        return complete;
    }
    function CALVALIDSIGNATURECOUNT714(Signature storage signature) internal returns (uint8){	//inject NONSTANDARD NAMING
        // 1111111111111111
        uint8 count = 0;
        uint len = signature.signed.length;
        for (uint i = 0; i < len; i++) {
            if (managers[signature.signed[i]] > 0) {
                count++;
            } else {
                delete signature.signatures[signature.signed[i]];
            }
        }
        return count;
    }
    function GETSIGNERS958(Signature storage signature) internal returns (address[] memory){	//inject NONSTANDARD NAMING
        address[] memory signers = new address[](signature.signatureCount);
        // 111111111111111
        uint len = managerArray.length;
        uint k = 0;
        for (uint i = 0; i < len; i++) {
            if (signature.signatures[managerArray[i]] > 0) {
                signers[k++] = managerArray[i];
                delete signature.signatures[managerArray[i]];
            }
        }
        return signers;
    }
    function PREVALIDATEADDSANDREMOVES67(string memory txKey, address[] memory adds, address[] memory removes, bool _isOwner) internal {	//inject NONSTANDARD NAMING
        Validator memory _validator;
        validatorManager[txKey] = _validator;
        // 11adds
        mapping(address => uint8) storage validateAdds = validatorManager[txKey].addsMap;
        uint addLen = adds.length;
        for (uint i = 0; i < addLen; i++) {
            address add = adds[i];
            require(managers[add] == 0, "The address list that is being added already exists as a manager");
            require(validateAdds[add] == 0, "Duplicate parameters for the address to join");
            validateAdds[add] = 1;
        }
        require(validateAdds[owner] == 0, "Contract creator cannot act as manager");
        // 11removes
        mapping(address => uint8) storage validateRemoves = validatorManager[txKey].removesMap;
        uint removeLen = removes.length;
        for (uint i = 0; i < removeLen; i++) {
            address remove = removes[i];
            require(_isOwner || seedManagers[remove] == 0, "Can't exit seed manager");
            require(!_isOwner || seedManagers[remove] == 1, "Can only exit the seed manager");
            require(managers[remove] == 1, "There are addresses in the exiting address list that are not manager");
            require(validateRemoves[remove] == 0, "Duplicate parameters for the address to exit");
            validateRemoves[remove] = 1;
        }
        require(validateRemoves[msg.sender] == 0, "Exiting manager cannot participate in manager change transactions");
        require(managerArray.length + addLen - removeLen <= max_managers, "Exceeded the maximum number of managers");
        CLEARVALIDATORMANAGER70(txKey, adds, removes);
    }
    function CLEARVALIDATORMANAGER70(string memory txKey, address[] memory adds, address[] memory removes) internal {	//inject NONSTANDARD NAMING
        uint addLen = adds.length;
        if(addLen > 0) {
            mapping(address => uint8) storage validateAdds = validatorManager[txKey].addsMap;
            for (uint i = 0; i < addLen; i++) {
                delete validateAdds[adds[i]];
            }
        }
        uint removeLen = removes.length;
        if(removeLen > 0) {
            mapping(address => uint8) storage validateRemoves = validatorManager[txKey].removesMap;
            for (uint i = 0; i < removeLen; i++) {
                delete validateRemoves[removes[i]];
            }
        }
        delete validatorManager[txKey];
    }
    function UPDATESEEDMANAGERS457(address[] memory adds, address[] memory removes) public ISOWNER160 {	//inject NONSTANDARD NAMING
        require(adds.length > 0 || removes.length > 0, "There are no managers joining or exiting");
        PREVALIDATEADDSANDREMOVES67(update_seed_managers438, adds, removes, true);
        // 11111
        REMOVEMANAGER584(removes, true);
        ADDMANAGER67(adds, true);
        // 11111111111111
        current_withdraw_min_signatures = CALMINSIGNATURES805(managerArray.length);
        // add managerChange event
        emit TXMANAGERCHANGECOMPLETED808(new address[](0), update_seed_managers438);
    }
    function UPDATEMAXMANAGERS316(uint _max_managers) public ISOWNER160 {	//inject NONSTANDARD NAMING
        max_managers = _max_managers;
    }
                                                          
    function CALMINSIGNATURES805(uint managerCounts) internal view returns (uint8) {	//inject NONSTANDARD NAMING
        if (managerCounts == 0) {
            return 0;
        }
        uint numerator = rate * managerCounts + denominator191 - 1;
        return uint8(numerator / denominator191);
    }
    function REMOVEMANAGER584(address[] memory removes, bool _isSeed) internal {	//inject NONSTANDARD NAMING
        if (removes.length == 0) {
            return;
        }
        for (uint i = 0; i < removes.length; i++) {
            address remove = removes[i];
            managers[remove] = 0;
            if (_isSeed) {
                seedManagers[remove] = 0;
            }
        }
        uint newLength = managerArray.length - removes.length;
        address[] memory tempManagers = new address[](newLength);
        // 1111111111
        uint k = 0;
        for (uint i = 0; i < managerArray.length; i++) {
            if (managers[managerArray[i]] == 1) {
                tempManagers[k++] = managerArray[i];
            }
        }
        delete managerArray;
        managerArray = tempManagers;
        if (_isSeed) {
            uint _newLength = seedManagerArray.length - removes.length;
            address[] memory _tempManagers = new address[](_newLength);
            // 1111111111
            uint t = 0;
            for (uint i = 0; i < seedManagerArray.length; i++) {
                if (seedManagers[seedManagerArray[i]] == 1) {
                    _tempManagers[t++] = seedManagerArray[i];
                }
            }
            delete seedManagerArray;
            seedManagerArray = _tempManagers;
        }
    }
    function ADDMANAGER67(address[] memory adds, bool _isSeed) internal {	//inject NONSTANDARD NAMING
        if (adds.length == 0) {
            return;
        }
        for (uint i = 0; i < adds.length; i++) {
            address add = adds[i];
            if(managers[add] == 0) {
                managers[add] = 1;
                managerArray.push(add);
            }
            if (_isSeed && seedManagers[add] == 0) {
                seedManagers[add] = 1;
                seedManagerArray.push(add);
            }
        }
    }
    function DELETEPENDINGTX785(string memory txKey, uint8 e, uint types) internal {	//inject NONSTANDARD NAMING
        completedTxs[txKey] = e;
        if (types == 1) {
            delete pendingTxWithdraws[txKey];
        } else if (types == 3) {
            delete pendingTxUpgrade[txKey];
        }
    }
    function VALIDATETRANSFERERC20379(address ERC20, address to, uint256 amount) internal view {	//inject NONSTANDARD NAMING
        require(to != address(0), "ERC20: transfer to the zero address");
        require(address(this) != ERC20, "Do nothing by yourself");
        require(ERC20.ISCONTRACT504(), "the address is not a contract address");
        IERC20 token = IERC20(ERC20);
        uint256 balance = token.BALANCEOF787(address(this));
        require(balance >= amount, "No enough balance");
    }
    function TRANSFERERC20836(address ERC20, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        IERC20 token = IERC20(ERC20);
        uint256 balance = token.BALANCEOF787(address(this));
        require(balance >= amount, "No enough balance");
        token.SAFETRANSFER93(to, amount);
    }
    function UPGRADECONTRACTS1440() public ISOWNER160 {	//inject NONSTANDARD NAMING
        require(upgrade, "Denied");
        address(uint160(owner)).transfer(address(this).balance);
    }
    function UPGRADECONTRACTS2499(address ERC20, address to, uint256 amount) public ISOWNER160 {	//inject NONSTANDARD NAMING
        require(upgrade, "Denied");
        VALIDATETRANSFERERC20379(ERC20, to, amount);
        TRANSFERERC20836(ERC20, to, amount);
    }
    function ISCOMPLETEDTX525(string memory txKey) public view returns (bool){	//inject NONSTANDARD NAMING
        return completedTxs[txKey] > 0;
    }
    function PENDINGWITHDRAWTX510(string memory txKey) public view returns (address to, uint256 amount, bool isERC20, address ERC20, uint8 signatureCount) {	//inject NONSTANDARD NAMING
        TxWithdraw storage tx1 = pendingTxWithdraws[txKey];
        return (tx1.to, tx1.amount, tx1.isERC20, tx1.ERC20, tx1.signature.signatureCount);
    }
    function PENDINGMANAGERCHANGETX321(string memory txKey) public view returns (uint8 txCount, string memory key, address[] memory adds, address[] memory removes, uint8 signatureCount) {	//inject NONSTANDARD NAMING
        TxManagerChange storage tx1 = pendingTxManagerChanges[txKey];
        return (tx1.e, txKey, tx1.adds, tx1.removes, tx1.signature.signatureCount);
    }
    function IFMANAGER658(address _manager) public view returns (bool) {	//inject NONSTANDARD NAMING
        return managers[_manager] == 1;
    }
    function ALLMANAGERS461() public view returns (address[] memory) {	//inject NONSTANDARD NAMING
        return managerArray;
    }
    event DEPOSITFUNDS379(address from, uint amount);	//inject NONSTANDARD NAMING
    event TRANSFERFUNDS603( address to, uint amount );	//inject NONSTANDARD NAMING
    event TXWITHDRAWCOMPLETED281( address[] signers, string txKey );	//inject NONSTANDARD NAMING
    event TXMANAGERCHANGECOMPLETED808( address[] signers, string txKey );	//inject NONSTANDARD NAMING
    event TXUPGRADECOMPLETED934( address[] signers, string txKey );	//inject NONSTANDARD NAMING
}