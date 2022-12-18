                                                                 

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD878(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB261(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB261(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB261(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL764(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV106(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV106(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV106(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD74(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD74(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD74(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: contracts/TreasuryTimelock.sol

// SPDX-License-Identifier: MIT
// COPIED FROM https://github.com/compound-finance/compound-protocol/blob/master/contracts/Governance/GovernorAlpha.sol
// Copyright 2020 Compound Labs, Inc.
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
// 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

pragma solidity ^0.5.0;


contract TreasuryTimelock {
    using SafeMath for uint;

    event NEWADMIN382(address indexed newAdmin);	//inject NONSTANDARD NAMING
    event NEWPENDINGADMIN936(address indexed newPendingAdmin);	//inject NONSTANDARD NAMING
    event NEWDELAY558(uint indexed newDelay);	//inject NONSTANDARD NAMING
    event CANCELTRANSACTION348(bytes32 indexed txHash, address indexed target, uint value, string signature,  bytes data, uint eta);	//inject NONSTANDARD NAMING
    event EXECUTETRANSACTION47(bytes32 indexed txHash, address indexed target, uint value, string signature,  bytes data, uint eta);	//inject NONSTANDARD NAMING
    event QUEUETRANSACTION619(bytes32 indexed txHash, address indexed target, uint value, string signature, bytes data, uint eta);	//inject NONSTANDARD NAMING

    uint public constant grace_period815 = 14 days;	//inject NONSTANDARD NAMING
    uint public constant minimum_delay789 = 1 days;	//inject NONSTANDARD NAMING
    uint public constant maximum_delay595 = 30 days;	//inject NONSTANDARD NAMING

    address public admin;
    address public pendingAdmin;
    uint public delay;
    bool public admin_initialized;

    mapping (bytes32 => bool) public queuedTransactions;


    constructor(address admin_, uint delay_) public {
        require(delay_ >= minimum_delay789, "Timelock::constructor: Delay must exceed minimum delay.");
        require(delay_ <= maximum_delay595, "Timelock::constructor: Delay must not exceed maximum delay.");

        admin = admin_;
        delay = delay_;
        admin_initialized = false;
    }

    function() external payable { }

    function SETDELAY749(uint delay_) public {	//inject NONSTANDARD NAMING
        require(msg.sender == address(this), "Timelock::setDelay: Call must come from Timelock.");
        require(delay_ >= minimum_delay789, "Timelock::setDelay: Delay must exceed minimum delay.");
        require(delay_ <= maximum_delay595, "Timelock::setDelay: Delay must not exceed maximum delay.");
        delay = delay_;

        emit NEWDELAY558(delay);
    }

    function ACCEPTADMIN680() public {	//inject NONSTANDARD NAMING
        require(msg.sender == pendingAdmin, "Timelock::acceptAdmin: Call must come from pendingAdmin.");
        admin = msg.sender;
        pendingAdmin = address(0);

        emit NEWADMIN382(admin);
    }

    function SETPENDINGADMIN308(address pendingAdmin_) public {	//inject NONSTANDARD NAMING
        // allows one time setting of admin for deployment purposes
        if (admin_initialized) {
            require(msg.sender == address(this), "Timelock::setPendingAdmin: Call must come from Timelock.");
        } else {
            require(msg.sender == admin, "Timelock::setPendingAdmin: First call must come from admin.");
            admin_initialized = true;
        }
        pendingAdmin = pendingAdmin_;

        emit NEWPENDINGADMIN936(pendingAdmin);
    }

    function QUEUETRANSACTION270(address target, uint value, string memory signature, bytes memory data, uint eta) public returns (bytes32) {	//inject NONSTANDARD NAMING
        require(msg.sender == admin, "Timelock::queueTransaction: Call must come from admin.");
        require(eta >= GETBLOCKTIMESTAMP155().ADD878(delay), "Timelock::queueTransaction: Estimated execution block must satisfy delay.");

        bytes32 txHash = keccak256(abi.encode(target, value, signature, data, eta));
        queuedTransactions[txHash] = true;

        emit QUEUETRANSACTION619(txHash, target, value, signature, data, eta);
        return txHash;
    }

    function CANCELTRANSACTION249(address target, uint value, string memory signature, bytes memory data, uint eta) public {	//inject NONSTANDARD NAMING
        require(msg.sender == admin, "Timelock::cancelTransaction: Call must come from admin.");

        bytes32 txHash = keccak256(abi.encode(target, value, signature, data, eta));
        queuedTransactions[txHash] = false;

        emit CANCELTRANSACTION348(txHash, target, value, signature, data, eta);
    }

    function EXECUTETRANSACTION969(address target, uint value, string memory signature, bytes memory data, uint eta) public payable returns (bytes memory) {	//inject NONSTANDARD NAMING
        require(msg.sender == admin, "Timelock::executeTransaction: Call must come from admin.");

        bytes32 txHash = keccak256(abi.encode(target, value, signature, data, eta));
        require(queuedTransactions[txHash], "Timelock::executeTransaction: Transaction hasn't been queued.");
        require(GETBLOCKTIMESTAMP155() >= eta, "Timelock::executeTransaction: Transaction hasn't surpassed time lock.");
        require(GETBLOCKTIMESTAMP155() <= eta.ADD878(grace_period815), "Timelock::executeTransaction: Transaction is stale.");

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

        emit EXECUTETRANSACTION47(txHash, target, value, signature, data, eta);

        return returnData;
    }

    function GETBLOCKTIMESTAMP155() internal view returns (uint) {	//inject NONSTANDARD NAMING
        // solium-disable-next-line security/no-block-members
        return block.timestamp;
    }
}