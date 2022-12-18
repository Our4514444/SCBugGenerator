                                                                 

pragma solidity ^0.5.17;

// From https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/Math.sol
// Subject to the MIT license.

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                      
    function ADD730(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                          
    function ADD730(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, errorMessage);

        return c;
    }

                                                                                                                                                                                                                                                            
    function SUB244(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB244(a, b, "SafeMath: subtraction underflow");
    }

                                                                                                                                                                                                                                                                                
    function SUB244(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                  
    function MUL932(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                  
    function MUL932(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, errorMessage);

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV722(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV722(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DIV722(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD652(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD652(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function MOD652(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract STRONG {
                                                
    string public constant name16 = "STRONG";	//inject NONSTANDARD NAMING

                                                  
    string public constant symbol413 = "STRONG";	//inject NONSTANDARD NAMING

                                                    
    uint8 public constant decimals593 = 18;	//inject NONSTANDARD NAMING

                                                     
    uint public totalSupply = 15_000_000e18; // 15 million STRONG

                                                     
    mapping (address => mapping (address => uint96)) internal allowances;

                                                                  
    mapping (address => uint96) internal balances;

                                                  
    mapping (address => address) public delegates;

                                                                           
    struct Checkpoint {
        uint32 fromBlock;
        uint96 votes;
    }

                                                                        
    mapping (address => mapping (uint32 => Checkpoint)) public checkpoints;

                                                          
    mapping (address => uint32) public numCheckpoints;

                                                              
    bytes32 public constant domain_typehash335 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	//inject NONSTANDARD NAMING

                                                                                   
    bytes32 public constant delegation_typehash593 = keccak256("Delegation(address delegatee,uint256 nonce,uint256 expiry)");	//inject NONSTANDARD NAMING

                                                                               
    bytes32 public constant permit_typehash738 = keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");	//inject NONSTANDARD NAMING

                                                                      
    mapping (address => uint) public nonces;

                                                                           
    event DELEGATECHANGED515(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);	//inject NONSTANDARD NAMING

                                                                                     
    event DELEGATEVOTESCHANGED332(address indexed delegate, uint previousBalance, uint newBalance);	//inject NONSTANDARD NAMING

                                                  
    event TRANSFER418(address indexed from, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

                                                  
    event APPROVAL244(address indexed owner, address indexed spender, uint256 amount);	//inject NONSTANDARD NAMING

                                                                                                                          
    constructor(address account) public {

        balances[account] = uint96(totalSupply);
        emit TRANSFER418(address(0), account, totalSupply);
    }

                                                                                                                                                                                                                                                                                                 
    function ALLOWANCE385(address account, address spender) external view returns (uint) {	//inject NONSTANDARD NAMING
        return allowances[account][spender];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE631(address spender, uint rawAmount) external returns (bool) {	//inject NONSTANDARD NAMING
        uint96 amount;
        if (rawAmount == uint(-1)) {
            amount = uint96(-1);
        } else {
            amount = SAFE96242(rawAmount, "Uni::approve: amount exceeds 96 bits");
        }

        allowances[msg.sender][spender] = amount;

        emit APPROVAL244(msg.sender, spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function PERMIT791(address owner, address spender, uint rawAmount, uint deadline, uint8 v, bytes32 r, bytes32 s) external {	//inject NONSTANDARD NAMING
        uint96 amount;
        if (rawAmount == uint(-1)) {
            amount = uint96(-1);
        } else {
            amount = SAFE96242(rawAmount, "Uni::permit: amount exceeds 96 bits");
        }

        bytes32 domainSeparator = keccak256(abi.encode(domain_typehash335, keccak256(bytes(name16)), GETCHAINID24(), address(this)));
        bytes32 structHash = keccak256(abi.encode(permit_typehash738, owner, spender, rawAmount, nonces[owner]++, deadline));
        bytes32 digest = keccak256(abi.encodePacked("\x19\x01", domainSeparator, structHash));
        address signatory = ecrecover(digest, v, r, s);
        require(signatory != address(0), "Uni::permit: invalid signature");
        require(signatory == owner, "Uni::permit: unauthorized");
        require(now <= deadline, "Uni::permit: signature expired");

        allowances[owner][spender] = amount;

        emit APPROVAL244(owner, spender, amount);
    }

                                                                                                                                                                                             
    function BALANCEOF377(address account) external view returns (uint) {	//inject NONSTANDARD NAMING
        return balances[account];
    }

                                                                                                                                                                                                                                                         
    function TRANSFER421(address dst, uint rawAmount) external returns (bool) {	//inject NONSTANDARD NAMING
        uint96 amount = SAFE96242(rawAmount, "Uni::transfer: amount exceeds 96 bits");
        _TRANSFERTOKENS318(msg.sender, dst, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                      
    function TRANSFERFROM668(address src, address dst, uint rawAmount) external returns (bool) {	//inject NONSTANDARD NAMING
        address spender = msg.sender;
        uint96 spenderAllowance = allowances[src][spender];
        uint96 amount = SAFE96242(rawAmount, "Uni::approve: amount exceeds 96 bits");

        if (spender != src && spenderAllowance != uint96(-1)) {
            uint96 newAllowance = SUB96796(spenderAllowance, amount, "Uni::transferFrom: transfer amount exceeds spender allowance");
            allowances[src][spender] = newAllowance;

            emit APPROVAL244(src, spender, newAllowance);
        }

        _TRANSFERTOKENS318(src, dst, amount);
        return true;
    }

                                                                                                                                       
    function DELEGATE619(address delegatee) public {	//inject NONSTANDARD NAMING
        return _DELEGATE558(msg.sender, delegatee);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DELEGATEBYSIG270(address delegatee, uint nonce, uint expiry, uint8 v, bytes32 r, bytes32 s) public {	//inject NONSTANDARD NAMING
        bytes32 domainSeparator = keccak256(abi.encode(domain_typehash335, keccak256(bytes(name16)), GETCHAINID24(), address(this)));
        bytes32 structHash = keccak256(abi.encode(delegation_typehash593, delegatee, nonce, expiry));
        bytes32 digest = keccak256(abi.encodePacked("\x19\x01", domainSeparator, structHash));
        address signatory = ecrecover(digest, v, r, s);
        require(signatory != address(0), "Uni::delegateBySig: invalid signature");
        require(nonce == nonces[signatory]++, "Uni::delegateBySig: invalid nonce");
        require(now <= expiry, "Uni::delegateBySig: signature expired");
        return _DELEGATE558(signatory, delegatee);
    }

                                                                                                                                                                                           
    function GETCURRENTVOTES51(address account) external view returns (uint96) {	//inject NONSTANDARD NAMING
        uint32 nCheckpoints = numCheckpoints[account];
        return nCheckpoints > 0 ? checkpoints[account][nCheckpoints - 1].votes : 0;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                               
    function GETPRIORVOTES288(address account, uint blockNumber) public view returns (uint96) {	//inject NONSTANDARD NAMING
        require(blockNumber < block.number, "Uni::getPriorVotes: not yet determined");

        uint32 nCheckpoints = numCheckpoints[account];
        if (nCheckpoints == 0) {
            return 0;
        }

        // First check most recent balance
        if (checkpoints[account][nCheckpoints - 1].fromBlock <= blockNumber) {
            return checkpoints[account][nCheckpoints - 1].votes;
        }

        // Next check implicit zero balance
        if (checkpoints[account][0].fromBlock > blockNumber) {
            return 0;
        }

        uint32 lower = 0;
        uint32 upper = nCheckpoints - 1;
        while (upper > lower) {
            uint32 center = upper - (upper - lower) / 2; // ceil, avoiding overflow
            Checkpoint memory cp = checkpoints[account][center];
            if (cp.fromBlock == blockNumber) {
                return cp.votes;
            } else if (cp.fromBlock < blockNumber) {
                lower = center;
            } else {
                upper = center - 1;
            }
        }
        return checkpoints[account][lower].votes;
    }

    function _DELEGATE558(address delegator, address delegatee) internal {	//inject NONSTANDARD NAMING
        address currentDelegate = delegates[delegator];
        uint96 delegatorBalance = balances[delegator];
        delegates[delegator] = delegatee;

        emit DELEGATECHANGED515(delegator, currentDelegate, delegatee);

        _MOVEDELEGATES886(currentDelegate, delegatee, delegatorBalance);
    }

    function _TRANSFERTOKENS318(address src, address dst, uint96 amount) internal {	//inject NONSTANDARD NAMING
        require(src != address(0), "Uni::_transferTokens: cannot transfer from the zero address");
        require(dst != address(0), "Uni::_transferTokens: cannot transfer to the zero address");

        balances[src] = SUB96796(balances[src], amount, "Uni::_transferTokens: transfer amount exceeds balance");
        balances[dst] = ADD96844(balances[dst], amount, "Uni::_transferTokens: transfer amount overflows");
        emit TRANSFER418(src, dst, amount);

        _MOVEDELEGATES886(delegates[src], delegates[dst], amount);
    }

    function _MOVEDELEGATES886(address srcRep, address dstRep, uint96 amount) internal {	//inject NONSTANDARD NAMING
        if (srcRep != dstRep && amount > 0) {
            if (srcRep != address(0)) {
                uint32 srcRepNum = numCheckpoints[srcRep];
                uint96 srcRepOld = srcRepNum > 0 ? checkpoints[srcRep][srcRepNum - 1].votes : 0;
                uint96 srcRepNew = SUB96796(srcRepOld, amount, "Uni::_moveVotes: vote amount underflows");
                _WRITECHECKPOINT951(srcRep, srcRepNum, srcRepOld, srcRepNew);
            }

            if (dstRep != address(0)) {
                uint32 dstRepNum = numCheckpoints[dstRep];
                uint96 dstRepOld = dstRepNum > 0 ? checkpoints[dstRep][dstRepNum - 1].votes : 0;
                uint96 dstRepNew = ADD96844(dstRepOld, amount, "Uni::_moveVotes: vote amount overflows");
                _WRITECHECKPOINT951(dstRep, dstRepNum, dstRepOld, dstRepNew);
            }
        }
    }

    function _WRITECHECKPOINT951(address delegatee, uint32 nCheckpoints, uint96 oldVotes, uint96 newVotes) internal {	//inject NONSTANDARD NAMING
        uint32 blockNumber = SAFE32220(block.number, "Uni::_writeCheckpoint: block number exceeds 32 bits");

        if (nCheckpoints > 0 && checkpoints[delegatee][nCheckpoints - 1].fromBlock == blockNumber) {
            checkpoints[delegatee][nCheckpoints - 1].votes = newVotes;
        } else {
            checkpoints[delegatee][nCheckpoints] = Checkpoint(blockNumber, newVotes);
            numCheckpoints[delegatee] = nCheckpoints + 1;
        }

        emit DELEGATEVOTESCHANGED332(delegatee, oldVotes, newVotes);
    }

    function SAFE32220(uint n, string memory errorMessage) internal pure returns (uint32) {	//inject NONSTANDARD NAMING
        require(n < 2**32, errorMessage);
        return uint32(n);
    }

    function SAFE96242(uint n, string memory errorMessage) internal pure returns (uint96) {	//inject NONSTANDARD NAMING
        require(n < 2**96, errorMessage);
        return uint96(n);
    }

    function ADD96844(uint96 a, uint96 b, string memory errorMessage) internal pure returns (uint96) {	//inject NONSTANDARD NAMING
        uint96 c = a + b;
        require(c >= a, errorMessage);
        return c;
    }

    function SUB96796(uint96 a, uint96 b, string memory errorMessage) internal pure returns (uint96) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        return a - b;
    }

    function GETCHAINID24() internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint256 chainId;
        assembly { chainId := chainid() }
        return chainId;
    }
}