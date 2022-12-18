                                                                 

pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

// Copyright 2020 Compound Labs, Inc.
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
// 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

contract SyncToken {
                                                
    string public constant name705 = "Sync DAO";	//inject NONSTANDARD NAMING

                                                  
    string public constant symbol635 = "SYNC";	//inject NONSTANDARD NAMING

                                                    
    uint8 public constant decimals951 = 18;	//inject NONSTANDARD NAMING

                                                     
    uint public totalSupply;

                              
    address public minter;

                                                     
    mapping (address => mapping (address => uint96)) internal allowances;

                                                                  
    mapping (address => uint96) internal balances;

                                                  
    mapping (address => address) public delegates;

                                                                           
    struct Checkpoint {
        uint32 fromBlock;
        uint96 votes;
    }

                                                                        
    mapping (address => mapping (uint32 => Checkpoint)) public checkpoints;

                                                          
    mapping (address => uint32) public numCheckpoints;

                                                              
    bytes32 public constant domain_typehash617 = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");	//inject NONSTANDARD NAMING

                                                                                   
    bytes32 public constant delegation_typehash942 = keccak256("Delegation(address delegatee,uint256 nonce,uint256 expiry)");	//inject NONSTANDARD NAMING

                                                                      
    mapping (address => uint) public nonces;

                                                                           
    event DELEGATECHANGED157(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);	//inject NONSTANDARD NAMING

                                                                                     
    event DELEGATEVOTESCHANGED924(address indexed delegate, uint previousBalance, uint newBalance);	//inject NONSTANDARD NAMING

                                                  
    event TRANSFER479(address indexed from, address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

                                                  
    event APPROVAL399(address indexed owner, address indexed spender, uint256 amount);	//inject NONSTANDARD NAMING

                                                                 
    event NEWMINTER672(address minter);	//inject NONSTANDARD NAMING

    modifier ONLYMINTER777 {	//inject NONSTANDARD NAMING
        require(msg.sender == minter, "SyncToken:onlyMinter: should only be called by minter");
        _;
    }

                                                                                                                                                                                               
    constructor(uint initialSupply, address account, address _minter) public {
        totalSupply = SAFE96587(initialSupply, "SyncToken::constructor:amount exceeds 96 bits");
        balances[account] = uint96(initialSupply);
        minter = _minter;
        emit TRANSFER479(address(0), account, initialSupply);
    }

                                                                                                                                                                                                                                                                                                 
    function ALLOWANCE314(address account, address spender) external view returns (uint) {	//inject NONSTANDARD NAMING
        return allowances[account][spender];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE823(address spender, uint rawAmount) external returns (bool) {	//inject NONSTANDARD NAMING
        uint96 amount;
        if (rawAmount == uint(-1)) {
            amount = uint96(-1);
        } else {
            amount = SAFE96587(rawAmount, "SyncToken::approve: amount exceeds 96 bits");
        }

        allowances[msg.sender][spender] = amount;

        emit APPROVAL399(msg.sender, spender, amount);
        return true;
    }

                                                                                                                                                                                             
    function BALANCEOF206(address account) external view returns (uint) {	//inject NONSTANDARD NAMING
        return balances[account];
    }

                                                                                                                                                                                                                     
    function MINT841(address dst, uint rawAmount) external ONLYMINTER777 {	//inject NONSTANDARD NAMING
        uint96 amount = SAFE96587(rawAmount, "SyncToken::mint: amount exceeds 96 bits");
        _MINTTOKENS353(dst, amount);
    }

                                                                                                                                                       
    function CHANGEMINTER193(address account) external ONLYMINTER777 {	//inject NONSTANDARD NAMING
        minter = account;
        emit NEWMINTER672(account);
    }

                                                                                                                                                                                                                                                         
    function TRANSFER734(address dst, uint rawAmount) external returns (bool) {	//inject NONSTANDARD NAMING
        uint96 amount = SAFE96587(rawAmount, "SyncToken::transfer: amount exceeds 96 bits");
        _TRANSFERTOKENS548(msg.sender, dst, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                      
    function TRANSFERFROM130(address src, address dst, uint rawAmount) external returns (bool) {	//inject NONSTANDARD NAMING
        address spender = msg.sender;
        uint96 spenderAllowance = allowances[src][spender];
        uint96 amount = SAFE96587(rawAmount, "SyncToken::approve: amount exceeds 96 bits");

        if (spender != src && spenderAllowance != uint96(-1)) {
            uint96 newAllowance = SUB96791(spenderAllowance, amount, "SyncToken::transferFrom: transfer amount exceeds spender allowance");
            allowances[src][spender] = newAllowance;

            emit APPROVAL399(src, spender, newAllowance);
        }

        _TRANSFERTOKENS548(src, dst, amount);
        return true;
    }

                                                                                                                                       
    function DELEGATE520(address delegatee) public {	//inject NONSTANDARD NAMING
        return _DELEGATE600(msg.sender, delegatee);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DELEGATEBYSIG418(address delegatee, uint nonce, uint expiry, uint8 v, bytes32 r, bytes32 s) public {	//inject NONSTANDARD NAMING
        bytes32 domainSeparator = keccak256(abi.encode(domain_typehash617, keccak256(bytes(name705)), GETCHAINID515(), address(this)));
        bytes32 structHash = keccak256(abi.encode(delegation_typehash942, delegatee, nonce, expiry));
        bytes32 digest = keccak256(abi.encodePacked("\x19\x01", domainSeparator, structHash));
        address signatory = ecrecover(digest, v, r, s);
        require(signatory != address(0), "SyncToken::delegateBySig: invalid signature");
        require(nonce == nonces[signatory]++, "SyncToken::delegateBySig: invalid nonce");
        require(now <= expiry, "SyncToken::delegateBySig: signature expired");
        return _DELEGATE600(signatory, delegatee);
    }

                                                                                                                                                                                           
    function GETCURRENTVOTES282(address account) external view returns (uint96) {	//inject NONSTANDARD NAMING
        uint32 nCheckpoints = numCheckpoints[account];
        return nCheckpoints > 0 ? checkpoints[account][nCheckpoints - 1].votes : 0;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                               
    function GETPRIORVOTES642(address account, uint blockNumber) public view returns (uint96) {	//inject NONSTANDARD NAMING
        require(blockNumber < block.number, "SyncToken::getPriorVotes: not yet determined");

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

    function _DELEGATE600(address delegator, address delegatee) internal {	//inject NONSTANDARD NAMING
        address currentDelegate = delegates[delegator];
        uint96 delegatorBalance = balances[delegator];
        delegates[delegator] = delegatee;

        emit DELEGATECHANGED157(delegator, currentDelegate, delegatee);

        _MOVEDELEGATES32(currentDelegate, delegatee, delegatorBalance);
    }

    function _TRANSFERTOKENS548(address src, address dst, uint96 amount) internal {	//inject NONSTANDARD NAMING
        require(src != address(0), "SyncToken::_transferTokens: cannot transfer from the zero address");
        require(dst != address(0), "SyncToken::_transferTokens: cannot transfer to the zero address");

        balances[src] = SUB96791(balances[src], amount, "SyncToken::_transferTokens: transfer amount exceeds balance");
        balances[dst] = ADD96130(balances[dst], amount, "SyncToken::_transferTokens: transfer amount overflows");
        emit TRANSFER479(src, dst, amount);

        _MOVEDELEGATES32(delegates[src], delegates[dst], amount);
    }

    function _MINTTOKENS353(address dst, uint96 amount) internal {	//inject NONSTANDARD NAMING
        require(dst != address(0), "SyncToken::_mintTokens: cannot transfer to the zero address");

        balances[dst] = ADD96130(balances[dst], amount, "SyncToken::_mintTokens: transfer amount overflows");
        emit TRANSFER479(address(0), dst, amount);

        _MOVEDELEGATES32(address(0), delegates[dst], amount);
    }

    function _MOVEDELEGATES32(address srcRep, address dstRep, uint96 amount) internal {	//inject NONSTANDARD NAMING
        if (srcRep != dstRep && amount > 0) {
            if (srcRep != address(0)) {
                uint32 srcRepNum = numCheckpoints[srcRep];
                uint96 srcRepOld = srcRepNum > 0 ? checkpoints[srcRep][srcRepNum - 1].votes : 0;
                uint96 srcRepNew = SUB96791(srcRepOld, amount, "SyncToken::_moveVotes: vote amount underflows");
                _WRITECHECKPOINT887(srcRep, srcRepNum, srcRepOld, srcRepNew);
            }

            if (dstRep != address(0)) {
                uint32 dstRepNum = numCheckpoints[dstRep];
                uint96 dstRepOld = dstRepNum > 0 ? checkpoints[dstRep][dstRepNum - 1].votes : 0;
                uint96 dstRepNew = ADD96130(dstRepOld, amount, "SyncToken::_moveVotes: vote amount overflows");
                _WRITECHECKPOINT887(dstRep, dstRepNum, dstRepOld, dstRepNew);
            }
        }
    }

    function _WRITECHECKPOINT887(address delegatee, uint32 nCheckpoints, uint96 oldVotes, uint96 newVotes) internal {	//inject NONSTANDARD NAMING
      uint32 blockNumber = SAFE32820(block.number, "SyncToken::_writeCheckpoint: block number exceeds 32 bits");

      if (nCheckpoints > 0 && checkpoints[delegatee][nCheckpoints - 1].fromBlock == blockNumber) {
          checkpoints[delegatee][nCheckpoints - 1].votes = newVotes;
      } else {
          checkpoints[delegatee][nCheckpoints] = Checkpoint(blockNumber, newVotes);
          numCheckpoints[delegatee] = nCheckpoints + 1;
      }

      emit DELEGATEVOTESCHANGED924(delegatee, oldVotes, newVotes);
    }

    function SAFE32820(uint n, string memory errorMessage) internal pure returns (uint32) {	//inject NONSTANDARD NAMING
        require(n < 2**32, errorMessage);
        return uint32(n);
    }

    function SAFE96587(uint n, string memory errorMessage) internal pure returns (uint96) {	//inject NONSTANDARD NAMING
        require(n < 2**96, errorMessage);
        return uint96(n);
    }

    function ADD96130(uint96 a, uint96 b, string memory errorMessage) internal pure returns (uint96) {	//inject NONSTANDARD NAMING
        uint96 c = a + b;
        require(c >= a, errorMessage);
        return c;
    }

    function SUB96791(uint96 a, uint96 b, string memory errorMessage) internal pure returns (uint96) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        return a - b;
    }

    function GETCHAINID515() internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint256 chainId;
        assembly { chainId := chainid() }
        return chainId;
    }
}