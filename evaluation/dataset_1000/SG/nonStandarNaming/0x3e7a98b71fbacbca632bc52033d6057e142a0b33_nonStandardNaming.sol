                                                                 

// File: contracts/lib/interface/ICelerWallet.sol

pragma solidity ^0.5.1;

                                       
interface ICelerWallet {
    function CREATE867(address[] calldata _owners, address _operator, bytes32 _nonce) external returns(bytes32);	//inject NONSTANDARD NAMING

    function DEPOSITETH407(bytes32 _walletId) external payable;	//inject NONSTANDARD NAMING

    function DEPOSITERC20932(bytes32 _walletId, address _tokenAddress, uint _amount) external;	//inject NONSTANDARD NAMING
    
    function WITHDRAW16(bytes32 _walletId, address _tokenAddress, address _receiver, uint _amount) external;	//inject NONSTANDARD NAMING

    function TRANSFERTOWALLET672(bytes32 _fromWalletId, bytes32 _toWalletId, address _tokenAddress, address _receiver, uint _amount) external;	//inject NONSTANDARD NAMING

    function TRANSFEROPERATORSHIP379(bytes32 _walletId, address _newOperator) external;	//inject NONSTANDARD NAMING

    function PROPOSENEWOPERATOR103(bytes32 _walletId, address _newOperator) external;	//inject NONSTANDARD NAMING

    function DRAINTOKEN656(address _tokenAddress, address _receiver, uint _amount) external;	//inject NONSTANDARD NAMING

    function GETWALLETOWNERS181(bytes32 _walletId) external view returns(address[] memory);	//inject NONSTANDARD NAMING

    function GETOPERATOR736(bytes32 _walletId) external view returns(address);	//inject NONSTANDARD NAMING

    function GETBALANCE225(bytes32 _walletId, address _tokenAddress) external view returns(uint);	//inject NONSTANDARD NAMING

    function GETPROPOSEDNEWOPERATOR614(bytes32 _walletId) external view returns(address);	//inject NONSTANDARD NAMING

    function GETPROPOSALVOTE457(bytes32 _walletId, address _owner) external view returns(bool);	//inject NONSTANDARD NAMING

    event CREATEWALLET60(bytes32 indexed walletId, address[] indexed owners, address indexed operator);	//inject NONSTANDARD NAMING

    event DEPOSITTOWALLET844(bytes32 indexed walletId, address indexed tokenAddress, uint amount);	//inject NONSTANDARD NAMING

    event WITHDRAWFROMWALLET87(bytes32 indexed walletId, address indexed tokenAddress, address indexed receiver, uint amount);	//inject NONSTANDARD NAMING

    event TRANSFERTOWALLET404(bytes32 indexed fromWalletId, bytes32 indexed toWalletId, address indexed tokenAddress, address receiver, uint amount);	//inject NONSTANDARD NAMING

    event CHANGEOPERATOR315(bytes32 indexed walletId, address indexed oldOperator, address indexed newOperator);	//inject NONSTANDARD NAMING

    event PROPOSENEWOPERATOR212(bytes32 indexed walletId, address indexed newOperator, address indexed proposer);	//inject NONSTANDARD NAMING

    event DRAINTOKEN405(address indexed tokenAddress, address indexed receiver, uint amount);	//inject NONSTANDARD NAMING
}

// File: contracts/lib/interface/IEthPool.sol

pragma solidity ^0.5.1;

                                   
interface IEthPool {
    function DEPOSIT527(address _receiver) external payable;	//inject NONSTANDARD NAMING

    function WITHDRAW16(uint _value) external;	//inject NONSTANDARD NAMING

    function APPROVE201(address _spender, uint _value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM544(address _from, address payable _to, uint _value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERTOCELERWALLET364(address _from, address _walletAddr, bytes32 _walletId, uint _value) external returns (bool);	//inject NONSTANDARD NAMING

    function INCREASEALLOWANCE323(address _spender, uint _addedValue) external returns (bool);	//inject NONSTANDARD NAMING

    function DECREASEALLOWANCE650(address _spender, uint _subtractedValue) external returns (bool);	//inject NONSTANDARD NAMING

    function BALANCEOF264(address _owner) external view returns (uint);	//inject NONSTANDARD NAMING

    function ALLOWANCE512(address _owner, address _spender) external view returns (uint);	//inject NONSTANDARD NAMING

    event DEPOSIT999(address indexed receiver, uint value);	//inject NONSTANDARD NAMING
    
    // transfer from "from" account inside EthPool to real "to" address outside EthPool
    event TRANSFER967(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    
    event APPROVAL774(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

// File: contracts/lib/interface/IPayRegistry.sol

pragma solidity ^0.5.1;

                                       
interface IPayRegistry {
    function CALCULATEPAYID405(bytes32 _payHash, address _setter) external pure returns(bytes32);	//inject NONSTANDARD NAMING

    function SETPAYAMOUNT954(bytes32 _payHash, uint _amt) external;	//inject NONSTANDARD NAMING

    function SETPAYDEADLINE594(bytes32 _payHash, uint _deadline) external;	//inject NONSTANDARD NAMING

    function SETPAYINFO708(bytes32 _payHash, uint _amt, uint _deadline) external;	//inject NONSTANDARD NAMING

    function SETPAYAMOUNTS132(bytes32[] calldata _payHashes, uint[] calldata _amts) external;	//inject NONSTANDARD NAMING

    function SETPAYDEADLINES791(bytes32[] calldata _payHashes, uint[] calldata _deadlines) external;	//inject NONSTANDARD NAMING

    function SETPAYINFOS715(bytes32[] calldata _payHashes, uint[] calldata _amts, uint[] calldata _deadlines) external;	//inject NONSTANDARD NAMING

    function GETPAYAMOUNTS92(	//inject NONSTANDARD NAMING
        bytes32[] calldata _payIds,
        uint _lastPayResolveDeadline
    ) external view returns(uint[] memory);

    function GETPAYINFO630(bytes32 _payId) external view returns(uint, uint);	//inject NONSTANDARD NAMING

    event PAYINFOUPDATE787(bytes32 indexed payId, uint amount, uint resolveDeadline);	//inject NONSTANDARD NAMING
}

// File: contracts/lib/data/Pb.sol

pragma solidity ^0.5.0;

// runtime proto sol library
library Pb {
    enum WireType { Varint, Fixed64, LengthDelim, StartGroup, EndGroup, Fixed32 }

    struct Buffer {
        uint idx;  // the start index of next read. when idx=b.length, we're done
        bytes b;   // hold serialized proto msg, readonly
    }

    // create a new in-memory Buffer object from raw msg bytes
    function FROMBYTES785(bytes memory raw) internal pure returns (Buffer memory buf) {	//inject NONSTANDARD NAMING
        buf.b = raw;
        buf.idx = 0;
    }

    // whether there are unread bytes
    function HASMORE830(Buffer memory buf) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return buf.idx < buf.b.length;
    }

    // decode current field number and wiretype
    function DECKEY407(Buffer memory buf) internal pure returns (uint tag, WireType wiretype) {	//inject NONSTANDARD NAMING
        uint v = DECVARINT539(buf);
        tag = v / 8;
        wiretype = WireType(v & 7);
    }

    // count tag occurrences, return an array due to no memory map support
	// have to create array for (maxtag+1) size. cnts[tag] = occurrences
	// should keep buf.idx unchanged because this is only a count function
    function CNTTAGS894(Buffer memory buf, uint maxtag) internal pure returns (uint[] memory cnts) {	//inject NONSTANDARD NAMING
        uint originalIdx = buf.idx;
        cnts = new uint[](maxtag+1);  // protobuf's tags are from 1 rather than 0
        uint tag;
        WireType wire;
        while (HASMORE830(buf)) {
            (tag, wire) = DECKEY407(buf);
            cnts[tag] += 1;
            SKIPVALUE259(buf, wire);
        }
        buf.idx = originalIdx;
    }

    // read varint from current buf idx, move buf.idx to next read, return the int value
    function DECVARINT539(Buffer memory buf) internal pure returns (uint v) {	//inject NONSTANDARD NAMING
        bytes10 tmp;  // proto int is at most 10 bytes (7 bits can be used per byte)
        bytes memory bb = buf.b;  // get buf.b mem addr to use in assembly
        v = buf.idx;  // use v to save one additional uint variable
        assembly {
            tmp := mload(add(add(bb, 32), v)) // load 10 bytes from buf.b[buf.idx] to tmp
        }
        uint b; // store current byte content
        v = 0; // reset to 0 for return value
        for (uint i=0; i<10; i++) {
            assembly {
                b := byte(i, tmp)  // don't use tmp[i] because it does bound check and costs extra
            }
            v |= (b & 0x7F) << (i * 7);
            if (b & 0x80 == 0) {
                buf.idx += i + 1;
                return v;
            }
        }
        revert(); // i=10, invalid varint stream
    }

    // read length delimited field and return bytes
    function DECBYTES375(Buffer memory buf) internal pure returns (bytes memory b) {	//inject NONSTANDARD NAMING
        uint len = DECVARINT539(buf);
        uint end = buf.idx + len;
        require(end <= buf.b.length);  // avoid overflow
        b = new bytes(len);
        bytes memory bufB = buf.b;  // get buf.b mem addr to use in assembly
        uint bStart;
        uint bufBStart = buf.idx;
        assembly {
            bStart := add(b, 32)
            bufBStart := add(add(bufB, 32), bufBStart)
        }
        for (uint i=0; i<len; i+=32) {
            assembly{
                mstore(add(bStart, i), mload(add(bufBStart, i)))
            }
        }
        buf.idx = end;
    }

    // return packed ints
    function DECPACKED909(Buffer memory buf) internal pure returns (uint[] memory t) {	//inject NONSTANDARD NAMING
        uint len = DECVARINT539(buf);
        uint end = buf.idx + len;
        require(end <= buf.b.length);  // avoid overflow
        // array in memory must be init w/ known length
        // so we have to create a tmp array w/ max possible len first
        uint[] memory tmp = new uint[](len);
        uint i = 0; // count how many ints are there
        while (buf.idx < end) {
            tmp[i] = DECVARINT539(buf);
            i++;
        }
        t = new uint[](i); // init t with correct length
        for (uint j=0; j<i; j++) {
            t[j] = tmp[j];
        }
        return t;
    }

    // move idx pass current value field, to beginning of next tag or msg end
    function SKIPVALUE259(Buffer memory buf, WireType wire) internal pure {	//inject NONSTANDARD NAMING
        if (wire == WireType.Varint) { DECVARINT539(buf); }
        else if (wire == WireType.LengthDelim) {
            uint len = DECVARINT539(buf);
            buf.idx += len; // skip len bytes value data
            require(buf.idx <= buf.b.length);  // avoid overflow
        } else { revert(); }  // unsupported wiretype
    }

    // type conversion help utils
    function _BOOL928(uint x) internal pure returns (bool v) {	//inject NONSTANDARD NAMING
        return x != 0;
    }

    function _UINT256835(bytes memory b) internal pure returns (uint256 v) {	//inject NONSTANDARD NAMING
        require(b.length <= 32);  // b's length must be smaller than or equal to 32
        assembly { v := mload(add(b, 32)) }  // load all 32bytes to v
        v = v >> (8 * (32 - b.length));  // only first b.length is valid
    }

    function _ADDRESS505(bytes memory b) internal pure returns (address v) {	//inject NONSTANDARD NAMING
        v = _ADDRESSPAYABLE151(b);
    }

    function _ADDRESSPAYABLE151(bytes memory b) internal pure returns (address payable v) {	//inject NONSTANDARD NAMING
        require(b.length == 20);
        //load 32bytes then shift right 12 bytes
        assembly { v := div(mload(add(b, 32)), 0x1000000000000000000000000) }
    }

    function _BYTES32139(bytes memory b) internal pure returns (bytes32 v) {	//inject NONSTANDARD NAMING
        require(b.length == 32);
        assembly { v := mload(add(b, 32)) }
    }

    // uint[] to uint8[]
    function UINT8S873(uint[] memory arr) internal pure returns (uint8[] memory t) {	//inject NONSTANDARD NAMING
        t = new uint8[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = uint8(arr[i]); }
    }

    function UINT32S406(uint[] memory arr) internal pure returns (uint32[] memory t) {	//inject NONSTANDARD NAMING
        t = new uint32[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = uint32(arr[i]); }
    }

    function UINT64S528(uint[] memory arr) internal pure returns (uint64[] memory t) {	//inject NONSTANDARD NAMING
        t = new uint64[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = uint64(arr[i]); }
    }

    function BOOLS180(uint[] memory arr) internal pure returns (bool[] memory t) {	//inject NONSTANDARD NAMING
        t = new bool[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = arr[i]!=0; }
    }
}

// File: contracts/lib/data/PbEntity.sol

// Code generated by protoc-gen-sol. DO NOT EDIT.
// source: entity.proto
pragma solidity ^0.5.0;


library PbEntity {
    using Pb for Pb.Buffer;  // so we can call Pb funcs on Buffer obj

    enum TokenType { INVALID, ETH, ERC20 }

    // TokenType[] decode function
    function TOKENTYPES730(uint[] memory arr) internal pure returns (TokenType[] memory t) {	//inject NONSTANDARD NAMING
        t = new TokenType[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = TokenType(arr[i]); }
    }

    enum TransferFunctionType { BOOLEAN_AND, BOOLEAN_OR, BOOLEAN_CIRCUIT, NUMERIC_ADD, NUMERIC_MAX, NUMERIC_MIN }

    // TransferFunctionType[] decode function
    function TRANSFERFUNCTIONTYPES780(uint[] memory arr) internal pure returns (TransferFunctionType[] memory t) {	//inject NONSTANDARD NAMING
        t = new TransferFunctionType[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = TransferFunctionType(arr[i]); }
    }

    enum ConditionType { HASH_LOCK, DEPLOYED_CONTRACT, VIRTUAL_CONTRACT }

    // ConditionType[] decode function
    function CONDITIONTYPES479(uint[] memory arr) internal pure returns (ConditionType[] memory t) {	//inject NONSTANDARD NAMING
        t = new ConditionType[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = ConditionType(arr[i]); }
    }

    struct AccountAmtPair {
        address account;   // tag: 1
        uint256 amt;   // tag: 2
    } // end struct AccountAmtPair

    function DECACCOUNTAMTPAIR261(bytes memory raw) internal pure returns (AccountAmtPair memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.account = Pb._ADDRESS505(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.amt = Pb._UINT256835(buf.DECBYTES375());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder AccountAmtPair

    struct TokenInfo {
        TokenType tokenType;   // tag: 1
        address tokenAddress;   // tag: 2
    } // end struct TokenInfo

    function DECTOKENINFO927(bytes memory raw) internal pure returns (TokenInfo memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.tokenType = TokenType(buf.DECVARINT539());
            }
            else if (tag == 2) {
                m.tokenAddress = Pb._ADDRESS505(buf.DECBYTES375());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder TokenInfo

    struct TokenDistribution {
        TokenInfo token;   // tag: 1
        AccountAmtPair[] distribution;   // tag: 2
    } // end struct TokenDistribution

    function DECTOKENDISTRIBUTION369(bytes memory raw) internal pure returns (TokenDistribution memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint[] memory cnts = buf.CNTTAGS894(2);
        m.distribution = new AccountAmtPair[](cnts[2]);
        cnts[2] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.token = DECTOKENINFO927(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.distribution[cnts[2]] = DECACCOUNTAMTPAIR261(buf.DECBYTES375());
                cnts[2]++;
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder TokenDistribution

    struct TokenTransfer {
        TokenInfo token;   // tag: 1
        AccountAmtPair receiver;   // tag: 2
    } // end struct TokenTransfer

    function DECTOKENTRANSFER595(bytes memory raw) internal pure returns (TokenTransfer memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.token = DECTOKENINFO927(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.receiver = DECACCOUNTAMTPAIR261(buf.DECBYTES375());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder TokenTransfer

    struct SimplexPaymentChannel {
        bytes32 channelId;   // tag: 1
        address peerFrom;   // tag: 2
        uint seqNum;   // tag: 3
        TokenTransfer transferToPeer;   // tag: 4
        PayIdList pendingPayIds;   // tag: 5
        uint lastPayResolveDeadline;   // tag: 6
        uint256 totalPendingAmount;   // tag: 7
    } // end struct SimplexPaymentChannel

    function DECSIMPLEXPAYMENTCHANNEL968(bytes memory raw) internal pure returns (SimplexPaymentChannel memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.channelId = Pb._BYTES32139(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.peerFrom = Pb._ADDRESS505(buf.DECBYTES375());
            }
            else if (tag == 3) {
                m.seqNum = uint(buf.DECVARINT539());
            }
            else if (tag == 4) {
                m.transferToPeer = DECTOKENTRANSFER595(buf.DECBYTES375());
            }
            else if (tag == 5) {
                m.pendingPayIds = DECPAYIDLIST628(buf.DECBYTES375());
            }
            else if (tag == 6) {
                m.lastPayResolveDeadline = uint(buf.DECVARINT539());
            }
            else if (tag == 7) {
                m.totalPendingAmount = Pb._UINT256835(buf.DECBYTES375());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder SimplexPaymentChannel

    struct PayIdList {
        bytes32[] payIds;   // tag: 1
        bytes32 nextListHash;   // tag: 2
    } // end struct PayIdList

    function DECPAYIDLIST628(bytes memory raw) internal pure returns (PayIdList memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint[] memory cnts = buf.CNTTAGS894(2);
        m.payIds = new bytes32[](cnts[1]);
        cnts[1] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.payIds[cnts[1]] = Pb._BYTES32139(buf.DECBYTES375());
                cnts[1]++;
            }
            else if (tag == 2) {
                m.nextListHash = Pb._BYTES32139(buf.DECBYTES375());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder PayIdList

    struct TransferFunction {
        TransferFunctionType logicType;   // tag: 1
        TokenTransfer maxTransfer;   // tag: 2
    } // end struct TransferFunction

    function DECTRANSFERFUNCTION194(bytes memory raw) internal pure returns (TransferFunction memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.logicType = TransferFunctionType(buf.DECVARINT539());
            }
            else if (tag == 2) {
                m.maxTransfer = DECTOKENTRANSFER595(buf.DECBYTES375());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder TransferFunction

    struct ConditionalPay {
        uint payTimestamp;   // tag: 1
        address src;   // tag: 2
        address dest;   // tag: 3
        Condition[] conditions;   // tag: 4
        TransferFunction transferFunc;   // tag: 5
        uint resolveDeadline;   // tag: 6
        uint resolveTimeout;   // tag: 7
        address payResolver;   // tag: 8
    } // end struct ConditionalPay

    function DECCONDITIONALPAY256(bytes memory raw) internal pure returns (ConditionalPay memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint[] memory cnts = buf.CNTTAGS894(8);
        m.conditions = new Condition[](cnts[4]);
        cnts[4] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.payTimestamp = uint(buf.DECVARINT539());
            }
            else if (tag == 2) {
                m.src = Pb._ADDRESS505(buf.DECBYTES375());
            }
            else if (tag == 3) {
                m.dest = Pb._ADDRESS505(buf.DECBYTES375());
            }
            else if (tag == 4) {
                m.conditions[cnts[4]] = DECCONDITION89(buf.DECBYTES375());
                cnts[4]++;
            }
            else if (tag == 5) {
                m.transferFunc = DECTRANSFERFUNCTION194(buf.DECBYTES375());
            }
            else if (tag == 6) {
                m.resolveDeadline = uint(buf.DECVARINT539());
            }
            else if (tag == 7) {
                m.resolveTimeout = uint(buf.DECVARINT539());
            }
            else if (tag == 8) {
                m.payResolver = Pb._ADDRESS505(buf.DECBYTES375());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder ConditionalPay

    struct CondPayResult {
        bytes condPay;   // tag: 1
        uint256 amount;   // tag: 2
    } // end struct CondPayResult

    function DECCONDPAYRESULT419(bytes memory raw) internal pure returns (CondPayResult memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.condPay = bytes(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.amount = Pb._UINT256835(buf.DECBYTES375());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder CondPayResult

    struct VouchedCondPayResult {
        bytes condPayResult;   // tag: 1
        bytes sigOfSrc;   // tag: 2
        bytes sigOfDest;   // tag: 3
    } // end struct VouchedCondPayResult

    function DECVOUCHEDCONDPAYRESULT638(bytes memory raw) internal pure returns (VouchedCondPayResult memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.condPayResult = bytes(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.sigOfSrc = bytes(buf.DECBYTES375());
            }
            else if (tag == 3) {
                m.sigOfDest = bytes(buf.DECBYTES375());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder VouchedCondPayResult

    struct Condition {
        ConditionType conditionType;   // tag: 1
        bytes32 hashLock;   // tag: 2
        address deployedContractAddress;   // tag: 3
        bytes32 virtualContractAddress;   // tag: 4
        bytes argsQueryFinalization;   // tag: 5
        bytes argsQueryOutcome;   // tag: 6
    } // end struct Condition

    function DECCONDITION89(bytes memory raw) internal pure returns (Condition memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.conditionType = ConditionType(buf.DECVARINT539());
            }
            else if (tag == 2) {
                m.hashLock = Pb._BYTES32139(buf.DECBYTES375());
            }
            else if (tag == 3) {
                m.deployedContractAddress = Pb._ADDRESS505(buf.DECBYTES375());
            }
            else if (tag == 4) {
                m.virtualContractAddress = Pb._BYTES32139(buf.DECBYTES375());
            }
            else if (tag == 5) {
                m.argsQueryFinalization = bytes(buf.DECBYTES375());
            }
            else if (tag == 6) {
                m.argsQueryOutcome = bytes(buf.DECBYTES375());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder Condition

    struct CooperativeWithdrawInfo {
        bytes32 channelId;   // tag: 1
        uint seqNum;   // tag: 2
        AccountAmtPair withdraw;   // tag: 3
        uint withdrawDeadline;   // tag: 4
        bytes32 recipientChannelId;   // tag: 5
    } // end struct CooperativeWithdrawInfo

    function DECCOOPERATIVEWITHDRAWINFO647(bytes memory raw) internal pure returns (CooperativeWithdrawInfo memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.channelId = Pb._BYTES32139(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.seqNum = uint(buf.DECVARINT539());
            }
            else if (tag == 3) {
                m.withdraw = DECACCOUNTAMTPAIR261(buf.DECBYTES375());
            }
            else if (tag == 4) {
                m.withdrawDeadline = uint(buf.DECVARINT539());
            }
            else if (tag == 5) {
                m.recipientChannelId = Pb._BYTES32139(buf.DECBYTES375());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder CooperativeWithdrawInfo

    struct PaymentChannelInitializer {
        TokenDistribution initDistribution;   // tag: 1
        uint openDeadline;   // tag: 2
        uint disputeTimeout;   // tag: 3
        uint msgValueReceiver;   // tag: 4
    } // end struct PaymentChannelInitializer

    function DECPAYMENTCHANNELINITIALIZER345(bytes memory raw) internal pure returns (PaymentChannelInitializer memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.initDistribution = DECTOKENDISTRIBUTION369(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.openDeadline = uint(buf.DECVARINT539());
            }
            else if (tag == 3) {
                m.disputeTimeout = uint(buf.DECVARINT539());
            }
            else if (tag == 4) {
                m.msgValueReceiver = uint(buf.DECVARINT539());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder PaymentChannelInitializer

    struct CooperativeSettleInfo {
        bytes32 channelId;   // tag: 1
        uint seqNum;   // tag: 2
        AccountAmtPair[] settleBalance;   // tag: 3
        uint settleDeadline;   // tag: 4
    } // end struct CooperativeSettleInfo

    function DECCOOPERATIVESETTLEINFO350(bytes memory raw) internal pure returns (CooperativeSettleInfo memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint[] memory cnts = buf.CNTTAGS894(4);
        m.settleBalance = new AccountAmtPair[](cnts[3]);
        cnts[3] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.channelId = Pb._BYTES32139(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.seqNum = uint(buf.DECVARINT539());
            }
            else if (tag == 3) {
                m.settleBalance[cnts[3]] = DECACCOUNTAMTPAIR261(buf.DECBYTES375());
                cnts[3]++;
            }
            else if (tag == 4) {
                m.settleDeadline = uint(buf.DECVARINT539());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder CooperativeSettleInfo

    struct ChannelMigrationInfo {
        bytes32 channelId;   // tag: 1
        address fromLedgerAddress;   // tag: 2
        address toLedgerAddress;   // tag: 3
        uint migrationDeadline;   // tag: 4
    } // end struct ChannelMigrationInfo

    function DECCHANNELMIGRATIONINFO706(bytes memory raw) internal pure returns (ChannelMigrationInfo memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.channelId = Pb._BYTES32139(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.fromLedgerAddress = Pb._ADDRESS505(buf.DECBYTES375());
            }
            else if (tag == 3) {
                m.toLedgerAddress = Pb._ADDRESS505(buf.DECBYTES375());
            }
            else if (tag == 4) {
                m.migrationDeadline = uint(buf.DECVARINT539());
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder ChannelMigrationInfo

}

// File: contracts/lib/ledgerlib/LedgerStruct.sol

pragma solidity ^0.5.1;





                                                                                                
library LedgerStruct {
    enum ChannelStatus { Uninitialized, Operable, Settling, Closed, Migrated }

    struct PeerState {
        uint seqNum;
        // balance sent out to the other peer of the channel, no need to record amtIn
        uint transferOut;
        bytes32 nextPayIdListHash;
        uint lastPayResolveDeadline;
        uint pendingPayOut;
    }

    struct PeerProfile {
        address peerAddr;
        // the (monotone increasing) amount that this peer deposit into this channel
        uint deposit;
        // the (monotone increasing) amount that this peer withdraw from this channel
        uint withdrawal;
        PeerState state;
    }

    struct WithdrawIntent {
        address receiver;
        uint amount;
        uint requestTime;
        bytes32 recipientChannelId;
    }

    // Channel is a representation of the state channel between peers which puts the funds
    // in CelerWallet and is hosted by a CelerLedger. The status of a state channel can
    // be migrated from one CelerLedger instance to another CelerLedger instance with probably
    // different operation logic.
    struct Channel {
        // the time after which peers can confirmSettle and before which peers can intendSettle
        uint settleFinalizedTime;
        uint disputeTimeout;
        PbEntity.TokenInfo token;
        ChannelStatus status;
        // record the new CelerLedger address after channel migration
        address migratedTo;
        // only support 2-peer channel for now
        PeerProfile[2] peerProfiles;
        uint cooperativeWithdrawSeqNum;
        WithdrawIntent withdrawIntent;
    }

    // Ledger is a host to record and operate the activities of many state
    // channels with specific operation logic.
    struct Ledger {
        // ChannelStatus => number of channels
        mapping(uint => uint) channelStatusNums;
        IEthPool ethPool;
        IPayRegistry payRegistry;
        ICelerWallet celerWallet;
        // per channel deposit limits for different tokens
        mapping(address => uint) balanceLimits;
        // whether deposit limits of all tokens have been enabled
        bool balanceLimitsEnabled;
        mapping(bytes32 => Channel) channelMap;
    }
}

// File: contracts/lib/interface/ICelerLedger.sol

pragma solidity ^0.5.1;



                                                                                                                                                                                                                   
interface ICelerLedger {
                                                                        
    function OPENCHANNEL286(bytes calldata _openChannelRequest) external payable;	//inject NONSTANDARD NAMING

    function DEPOSIT527(bytes32 _channelId, address _receiver, uint _transferFromAmount) external payable;	//inject NONSTANDARD NAMING

    function DEPOSITINBATCH701(	//inject NONSTANDARD NAMING
        bytes32[] calldata _channelIds,
        address[] calldata _receivers,
        uint[] calldata _transferFromAmounts
    ) external;

    function SNAPSHOTSTATES637(bytes calldata _signedSimplexStateArray) external;	//inject NONSTANDARD NAMING

    function INTENDWITHDRAW511(bytes32 _channelId, uint _amount, bytes32 _recipientChannelId) external;	//inject NONSTANDARD NAMING
    
    function CONFIRMWITHDRAW551(bytes32 _channelId) external;	//inject NONSTANDARD NAMING

    function VETOWITHDRAW874(bytes32 _channelId) external;	//inject NONSTANDARD NAMING
    
    function COOPERATIVEWITHDRAW372(bytes calldata _cooperativeWithdrawRequest) external;	//inject NONSTANDARD NAMING
    
    function INTENDSETTLE588(bytes calldata _signedSimplexStateArray) external;	//inject NONSTANDARD NAMING
    
    function CLEARPAYS645(bytes32 _channelId, address _peerFrom, bytes calldata _payIdList) external;	//inject NONSTANDARD NAMING
    
    function CONFIRMSETTLE509(bytes32 _channelId) external;	//inject NONSTANDARD NAMING
    
    function COOPERATIVESETTLE892(bytes calldata _settleRequest) external;	//inject NONSTANDARD NAMING
    
    function GETCHANNELSTATUSNUM45(uint _channelStatus) external view returns(uint);	//inject NONSTANDARD NAMING

    function GETETHPOOL585() external view returns(address);	//inject NONSTANDARD NAMING

    function GETPAYREGISTRY317() external view returns(address);	//inject NONSTANDARD NAMING

    function GETCELERWALLET378() external view returns(address);	//inject NONSTANDARD NAMING

    event OPENCHANNEL947(	//inject NONSTANDARD NAMING
        bytes32 indexed channelId,
        uint tokenType,
        address indexed tokenAddress,
        // TODO: there is an issue of setting address[2] as indexed. Need to fix and make this indexed
        address[2] peerAddrs,
        uint[2] initialDeposits
    );

    // TODO: there is an issue of setting address[2] as indexed. Need to fix and make this indexed
    event DEPOSIT999(bytes32 indexed channelId, address[2] peerAddrs, uint[2] deposits, uint[2] withdrawals);	//inject NONSTANDARD NAMING

    event SNAPSHOTSTATES568(bytes32 indexed channelId, uint[2] seqNums);	//inject NONSTANDARD NAMING

    event INTENDSETTLE985(bytes32 indexed channelId, uint[2] seqNums);	//inject NONSTANDARD NAMING

    event CLEARONEPAY272(bytes32 indexed channelId, bytes32 indexed payId, address indexed peerFrom, uint amount);	//inject NONSTANDARD NAMING

    event CONFIRMSETTLE810(bytes32 indexed channelId, uint[2] settleBalance);	//inject NONSTANDARD NAMING

    event CONFIRMSETTLEFAIL701(bytes32 indexed channelId);	//inject NONSTANDARD NAMING

    event INTENDWITHDRAW677(bytes32 indexed channelId, address indexed receiver, uint amount);	//inject NONSTANDARD NAMING

    event CONFIRMWITHDRAW233(	//inject NONSTANDARD NAMING
        bytes32 indexed channelId,
        uint withdrawnAmount,
        address indexed receiver,
        bytes32 indexed recipientChannelId,
        uint[2] deposits,
        uint[2] withdrawals
    );

    event VETOWITHDRAW818(bytes32 indexed channelId);	//inject NONSTANDARD NAMING

    event COOPERATIVEWITHDRAW956(	//inject NONSTANDARD NAMING
        bytes32 indexed channelId,
        uint withdrawnAmount,
        address indexed receiver,
        bytes32 indexed recipientChannelId,
        uint[2] deposits,
        uint[2] withdrawals,
        uint seqNum
    );

    event COOPERATIVESETTLE72(bytes32 indexed channelId, uint[2] settleBalance);	//inject NONSTANDARD NAMING
                                                                               


                                                                      
    function GETSETTLEFINALIZEDTIME626(bytes32 _channelId) external view returns(uint);	//inject NONSTANDARD NAMING

    function GETTOKENCONTRACT860(bytes32 _channelId) external view returns(address);	//inject NONSTANDARD NAMING

    function GETTOKENTYPE343(bytes32 _channelId) external view returns(PbEntity.TokenType);	//inject NONSTANDARD NAMING

    function GETCHANNELSTATUS512(bytes32 _channelId) external view returns(LedgerStruct.ChannelStatus);	//inject NONSTANDARD NAMING

    function GETCOOPERATIVEWITHDRAWSEQNUM672(bytes32 _channelId) external view returns(uint);	//inject NONSTANDARD NAMING

    function GETTOTALBALANCE713(bytes32 _channelId) external view returns(uint);	//inject NONSTANDARD NAMING

    function GETBALANCEMAP394(bytes32 _channelId) external view returns(address[2] memory, uint[2] memory, uint[2] memory);	//inject NONSTANDARD NAMING

    function GETCHANNELMIGRATIONARGS507(bytes32 _channelId) external view returns(uint, uint, address, uint);	//inject NONSTANDARD NAMING

    function GETPEERSMIGRATIONINFO312(bytes32 _channelId) external view returns(	//inject NONSTANDARD NAMING
        address[2] memory,
        uint[2] memory,
        uint[2] memory,
        uint[2] memory,
        uint[2] memory,
        uint[2] memory
    );

    function GETDISPUTETIMEOUT245(bytes32 _channelId) external view returns(uint);	//inject NONSTANDARD NAMING

    function GETMIGRATEDTO645(bytes32 _channelId) external view returns(address);	//inject NONSTANDARD NAMING

    function GETSTATESEQNUMMAP984(bytes32 _channelId) external view returns(address[2] memory, uint[2] memory);	//inject NONSTANDARD NAMING

    function GETTRANSFEROUTMAP620(bytes32 _channelId) external view returns(	//inject NONSTANDARD NAMING
        address[2] memory,
        uint[2] memory
    );

    function GETNEXTPAYIDLISTHASHMAP113(bytes32 _channelId) external view returns(	//inject NONSTANDARD NAMING
        address[2] memory,
        bytes32[2] memory
    );

    function GETLASTPAYRESOLVEDEADLINEMAP549(bytes32 _channelId) external view returns(	//inject NONSTANDARD NAMING
        address[2] memory,
        uint[2] memory
    );

    function GETPENDINGPAYOUTMAP362(bytes32 _channelId) external view returns(	//inject NONSTANDARD NAMING
        address[2] memory,
        uint[2] memory
    );

    function GETWITHDRAWINTENT123(bytes32 _channelId) external view returns(address, uint, uint, bytes32);	//inject NONSTANDARD NAMING
                                                                             


                                                                           
    function SETBALANCELIMITS489(address[] calldata _tokenAddrs, uint[] calldata _limits) external;	//inject NONSTANDARD NAMING

    function DISABLEBALANCELIMITS840() external;	//inject NONSTANDARD NAMING

    function ENABLEBALANCELIMITS678() external;	//inject NONSTANDARD NAMING

    function GETBALANCELIMIT1(address _tokenAddr) external view returns(uint);	//inject NONSTANDARD NAMING

    function GETBALANCELIMITSENABLED77() external view returns(bool);	//inject NONSTANDARD NAMING
                                                                                  


                                                                      
    function MIGRATECHANNELTO569(bytes calldata _migrationRequest) external returns(bytes32);	//inject NONSTANDARD NAMING

    function MIGRATECHANNELFROM434(address _fromLedgerAddr, bytes calldata _migrationRequest) external;	//inject NONSTANDARD NAMING

    event MIGRATECHANNELTO578(bytes32 indexed channelId, address indexed newLedgerAddr);	//inject NONSTANDARD NAMING

    event MIGRATECHANNELFROM861(bytes32 indexed channelId, address indexed oldLedgerAddr);	//inject NONSTANDARD NAMING
                                                                             
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.0;

                                                                                                   
library SafeMath {
                                                                                
    function MUL580(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV794(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB843(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD105(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD791(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/cryptography/ECDSA.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                

library ECDSA {
                                                                                                                                                                                                                                                                                                 
    function RECOVER935(bytes32 hash, bytes memory signature) internal pure returns (address) {	//inject NONSTANDARD NAMING
        bytes32 r;
        bytes32 s;
        uint8 v;

        // Check the signature length
        if (signature.length != 65) {
            return (address(0));
        }

        // Divide the signature in r, s and v variables
        // ecrecover takes the signature parameters, and the only way to get them
        // currently is to use assembly.
        // solhint-disable-next-line no-inline-assembly
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }

        // Version of signature should be 27 or 28, but 0 and 1 are also possible versions
        if (v < 27) {
            v += 27;
        }

        // If the version is correct return the signer address
        if (v != 27 && v != 28) {
            return (address(0));
        } else {
            return ecrecover(hash, v, r, s);
        }
    }

                                                                                                                                               
    function TOETHSIGNEDMESSAGEHASH450(bytes32 hash) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        // 32 is the length in bytes of hash,
        // enforced by the type signature above
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }
}

// File: contracts/lib/ledgerlib/LedgerChannel.sol

pragma solidity ^0.5.1;






                                                                                                                                                                                                             
library LedgerChannel {
    using SafeMath for uint;
    using ECDSA for bytes32;

                                                                                                                                                           
    function GETSETTLEFINALIZEDTIME626(LedgerStruct.Channel storage _c) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _c.settleFinalizedTime;
    }

                                                                                                                                                       
    function GETTOKENCONTRACT860(LedgerStruct.Channel storage _c) public view returns(address) {	//inject NONSTANDARD NAMING
        return _c.token.tokenAddress;
    }

                                                                                                                               
    function GETTOKENTYPE343(LedgerStruct.Channel storage _c) public view returns(PbEntity.TokenType) {	//inject NONSTANDARD NAMING
        return _c.token.tokenType;
    }

                                                                                                                       
    function GETCHANNELSTATUS512(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c
    )
        public
        view
        returns(LedgerStruct.ChannelStatus)
    {
        return _c.status;
    }

                                                                                                                                                 
    function GETCOOPERATIVEWITHDRAWSEQNUM672(LedgerStruct.Channel storage _c) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _c.cooperativeWithdrawSeqNum;
    }

                                                                                                                                             
    function GETTOTALBALANCE713(LedgerStruct.Channel storage _c) public view returns(uint) {	//inject NONSTANDARD NAMING
        uint balance = _c.peerProfiles[0].deposit
            .ADD105(_c.peerProfiles[1].deposit)
            .SUB843(_c.peerProfiles[0].withdrawal)
            .SUB843(_c.peerProfiles[1].withdrawal);
        return balance;
    }

                                                                                                                                                                                                                                                                                                                                                                                                      
    function GETBALANCEMAP394(LedgerStruct.Channel storage _c) public view	//inject NONSTANDARD NAMING
        returns(address[2] memory, uint[2] memory, uint[2] memory)
    {
        address[2] memory peerAddrs = [_c.peerProfiles[0].peerAddr, _c.peerProfiles[1].peerAddr];
        uint[2] memory deposits = [_c.peerProfiles[0].deposit, _c.peerProfiles[1].deposit];
        uint[2] memory withdrawals = [_c.peerProfiles[0].withdrawal, _c.peerProfiles[1].withdrawal];
        return (peerAddrs, deposits, withdrawals);
    }

                                                                                                                                                                                                                                                                                                                                                
    function GETCHANNELMIGRATIONARGS507(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c
    )
        external
        view
        returns(uint, uint, address, uint)
    {
        return (
            _c.disputeTimeout,
            uint(_c.token.tokenType),
            _c.token.tokenAddress,
            _c.cooperativeWithdrawSeqNum
        );
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function GETPEERSMIGRATIONINFO312(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c
    )
        external
        view
        returns(
        address[2] memory,
        uint[2] memory,
        uint[2] memory,
        uint[2] memory,
        uint[2] memory,
        uint[2] memory
    )
    {
        LedgerStruct.PeerProfile[2] memory peerProfiles = _c.peerProfiles;
        return (
            [peerProfiles[0].peerAddr, peerProfiles[1].peerAddr],
            [peerProfiles[0].deposit, peerProfiles[1].deposit],
            [peerProfiles[0].withdrawal, peerProfiles[1].withdrawal],
            [peerProfiles[0].state.seqNum, peerProfiles[1].state.seqNum],
            [peerProfiles[0].state.transferOut, peerProfiles[1].state.transferOut],
            [peerProfiles[0].state.pendingPayOut, peerProfiles[1].state.pendingPayOut]
        );
    }

                                                                                                                                                  
    function GETDISPUTETIMEOUT245(LedgerStruct.Channel storage _c) external view returns(uint) {	//inject NONSTANDARD NAMING
        return _c.disputeTimeout;
    }

                                                                                                                                                        
    function GETMIGRATEDTO645(LedgerStruct.Channel storage _c) external view returns(address) {	//inject NONSTANDARD NAMING
        return _c.migratedTo;
    }

                                                                                                                                                                                                      
    function GETSTATESEQNUMMAP984(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c
    )
        external
        view
        returns(address[2] memory, uint[2] memory)
    {
        LedgerStruct.PeerProfile[2] memory peerProfiles = _c.peerProfiles;
        return (
            [peerProfiles[0].peerAddr, peerProfiles[1].peerAddr],
            [peerProfiles[0].state.seqNum, peerProfiles[1].state.seqNum]
        );
    }

                                                                                                                                                                                                       
    function GETTRANSFEROUTMAP620(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c
    )
        external
        view
        returns(address[2] memory, uint[2] memory)
    {
        LedgerStruct.PeerProfile[2] memory peerProfiles = _c.peerProfiles;
        return (
            [peerProfiles[0].peerAddr, peerProfiles[1].peerAddr],
            [peerProfiles[0].state.transferOut, peerProfiles[1].state.transferOut]
        );
    }

                                                                                                                                                                                                                    
    function GETNEXTPAYIDLISTHASHMAP113(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c
    )
        external
        view
        returns(address[2] memory, bytes32[2] memory)
    {
        LedgerStruct.PeerProfile[2] memory peerProfiles = _c.peerProfiles;
        return (
            [peerProfiles[0].peerAddr, peerProfiles[1].peerAddr],
            [peerProfiles[0].state.nextPayIdListHash, peerProfiles[1].state.nextPayIdListHash]
        );
    }

                                                                                                                                                                                                                             
    function GETLASTPAYRESOLVEDEADLINEMAP549(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c
    )
        external
        view
        returns(address[2] memory, uint[2] memory)
    {
        LedgerStruct.PeerProfile[2] memory peerProfiles = _c.peerProfiles;
        return (
            [peerProfiles[0].peerAddr, peerProfiles[1].peerAddr],
            [peerProfiles[0].state.lastPayResolveDeadline, peerProfiles[1].state.lastPayResolveDeadline]
        );
    }

                                                                                                                                                                                                           
    function GETPENDINGPAYOUTMAP362(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c
    )
        external
        view
        returns(address[2] memory, uint[2] memory)
    {
        LedgerStruct.PeerProfile[2] memory peerProfiles = _c.peerProfiles;
        return (
            [peerProfiles[0].peerAddr, peerProfiles[1].peerAddr],
            [peerProfiles[0].state.pendingPayOut, peerProfiles[1].state.pendingPayOut]
        );
    }

                                                                                                                                                                                                                                                                                                                              
    function GETWITHDRAWINTENT123(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c
    )
        external
        view
        returns(address, uint, uint, bytes32)
    {
        LedgerStruct.WithdrawIntent memory withdrawIntent = _c.withdrawIntent;
        return (
            withdrawIntent.receiver,
            withdrawIntent.amount,
            withdrawIntent.requestTime,
            withdrawIntent.recipientChannelId
        );
    }

                                                                                                                                                                                                                                                                                                                        
    function _IMPORTCHANNELMIGRATIONARGS948(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c,
        address payable _fromLedgerAddr,
        bytes32 _channelId
    )
        internal
    {
        uint tokenType;
        (
            _c.disputeTimeout,
            tokenType,
            _c.token.tokenAddress,
            _c.cooperativeWithdrawSeqNum
        ) = ICelerLedger(_fromLedgerAddr).GETCHANNELMIGRATIONARGS507(_channelId);
        _c.token.tokenType = PbEntity.TokenType(tokenType);
    }

                                                                                                                                                                                                                                                                                                                          
    function _IMPORTPEERSMIGRATIONINFO93(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c,
        address payable _fromLedgerAddr,
        bytes32 _channelId
    )
        internal
    {
        (
            address[2] memory peersAddrs,
            uint[2] memory deposits,
            uint[2] memory withdrawals,
            uint[2] memory seqNums,
            uint[2] memory transferOuts,
            uint[2] memory pendingPayOuts
        ) = ICelerLedger(_fromLedgerAddr).GETPEERSMIGRATIONINFO312(_channelId);

        for (uint i = 0; i < 2; i++) {
            LedgerStruct.PeerProfile storage peerProfile = _c.peerProfiles[i];
            peerProfile.peerAddr = peersAddrs[i];
            peerProfile.deposit = deposits[i];
            peerProfile.withdrawal = withdrawals[i];
            peerProfile.state.seqNum = seqNums[i];
            peerProfile.state.transferOut = transferOuts[i];
            peerProfile.state.pendingPayOut = pendingPayOuts[i];
        }
    }

                                                                                                         
    function _GETSTATESEQNUMS363(LedgerStruct.Channel storage _c) internal view returns(uint[2] memory) {	//inject NONSTANDARD NAMING
        return [_c.peerProfiles[0].state.seqNum, _c.peerProfiles[1].state.seqNum];
    }

                                                                                                                                                                                   
    function _ISPEER484(LedgerStruct.Channel storage _c, address _addr) internal view returns(bool) {	//inject NONSTANDARD NAMING
        return _addr == _c.peerProfiles[0].peerAddr || _addr == _c.peerProfiles[1].peerAddr;
    }

                                                                                                                                      
     function _GETPEERID760(LedgerStruct.Channel storage _c, address _peer) internal view returns(uint) {	//inject NONSTANDARD NAMING
        if (_peer == _c.peerProfiles[0].peerAddr) {
            return 0;
        } else if (_peer == _c.peerProfiles[1].peerAddr) {
            return 1;
        } else {
            revert("Nonexist peer");
        }
    }

                                                                                                                                                                                                                                                                          
    function _CHECKSINGLESIGNATURE412(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c,
        bytes32 _h,
        bytes memory _sig
    )
        internal
        view
        returns(bool)
    {
        address addr = _h.TOETHSIGNEDMESSAGEHASH450().RECOVER935(_sig);
        return _ISPEER484(_c, addr);
    }

                                                                                                                                                                                                                                                                      
    function _CHECKCOSIGNATURES298(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c,
        bytes32 _h,
        bytes[] memory _sigs
    )
        internal
        view
        returns(bool)
    {
        if (_sigs.length != 2) {
            return false;
        }

        // check signature
        bytes32 hash = _h.TOETHSIGNEDMESSAGEHASH450();
        address addr;
        for (uint i = 0; i < 2; i++) {
            addr = hash.RECOVER935(_sigs[i]);
            // enforce the order of sigs consistent with ascending addresses
            if (addr != _c.peerProfiles[i].peerAddr) {
                return false;
            }
        }

        return true;
    }

                                                                                                                                                                                                                        
    function _VALIDATESETTLEBALANCE16(LedgerStruct.Channel storage _c)	//inject NONSTANDARD NAMING
        internal
        view
        returns(bool, uint[2] memory)
    {
        LedgerStruct.PeerProfile[2] memory peerProfiles = _c.peerProfiles;
        uint[2] memory settleBalance = [
            peerProfiles[0].deposit.ADD105(peerProfiles[1].state.transferOut),
            peerProfiles[1].deposit.ADD105(peerProfiles[0].state.transferOut)
        ];
        for (uint i = 0; i < 2; i++) {
            uint subAmt = peerProfiles[i].state.transferOut.ADD105(peerProfiles[i].withdrawal);
            if (settleBalance[i] < subAmt) {
                return (false, [uint(0), uint(0)]);
            }

            settleBalance[i] = settleBalance[i].SUB843(subAmt);
        }

        return (true, settleBalance);
    }

                                                                                                                                                                                                                                                                                   
    function _ADDWITHDRAWAL767(	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage _c,
        address _receiver,
        uint _amount,
        bool _checkBalance
    )
        internal
    {
        // this implicitly require receiver be a peer
        uint rid = _GETPEERID760(_c, _receiver);
        _c.peerProfiles[rid].withdrawal = _c.peerProfiles[rid].withdrawal.ADD105(_amount);
        if (_checkBalance) {
            require(GETTOTALBALANCE713(_c) >= 0);
        }
    }
}

// File: contracts/lib/data/PbChain.sol

// Code generated by protoc-gen-sol. DO NOT EDIT.
// source: chain.proto
pragma solidity ^0.5.0;


library PbChain {
    using Pb for Pb.Buffer;  // so we can call Pb funcs on Buffer obj

    struct OpenChannelRequest {
        bytes channelInitializer;   // tag: 1
        bytes[] sigs;   // tag: 2
    } // end struct OpenChannelRequest

    function DECOPENCHANNELREQUEST420(bytes memory raw) internal pure returns (OpenChannelRequest memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint[] memory cnts = buf.CNTTAGS894(2);
        m.sigs = new bytes[](cnts[2]);
        cnts[2] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.channelInitializer = bytes(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.sigs[cnts[2]] = bytes(buf.DECBYTES375());
                cnts[2]++;
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder OpenChannelRequest

    struct CooperativeWithdrawRequest {
        bytes withdrawInfo;   // tag: 1
        bytes[] sigs;   // tag: 2
    } // end struct CooperativeWithdrawRequest

    function DECCOOPERATIVEWITHDRAWREQUEST639(bytes memory raw) internal pure returns (CooperativeWithdrawRequest memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint[] memory cnts = buf.CNTTAGS894(2);
        m.sigs = new bytes[](cnts[2]);
        cnts[2] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.withdrawInfo = bytes(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.sigs[cnts[2]] = bytes(buf.DECBYTES375());
                cnts[2]++;
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder CooperativeWithdrawRequest

    struct CooperativeSettleRequest {
        bytes settleInfo;   // tag: 1
        bytes[] sigs;   // tag: 2
    } // end struct CooperativeSettleRequest

    function DECCOOPERATIVESETTLEREQUEST318(bytes memory raw) internal pure returns (CooperativeSettleRequest memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint[] memory cnts = buf.CNTTAGS894(2);
        m.sigs = new bytes[](cnts[2]);
        cnts[2] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.settleInfo = bytes(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.sigs[cnts[2]] = bytes(buf.DECBYTES375());
                cnts[2]++;
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder CooperativeSettleRequest

    struct ResolvePayByConditionsRequest {
        bytes condPay;   // tag: 1
        bytes[] hashPreimages;   // tag: 2
    } // end struct ResolvePayByConditionsRequest

    function DECRESOLVEPAYBYCONDITIONSREQUEST331(bytes memory raw) internal pure returns (ResolvePayByConditionsRequest memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint[] memory cnts = buf.CNTTAGS894(2);
        m.hashPreimages = new bytes[](cnts[2]);
        cnts[2] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.condPay = bytes(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.hashPreimages[cnts[2]] = bytes(buf.DECBYTES375());
                cnts[2]++;
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder ResolvePayByConditionsRequest

    struct SignedSimplexState {
        bytes simplexState;   // tag: 1
        bytes[] sigs;   // tag: 2
    } // end struct SignedSimplexState

    function DECSIGNEDSIMPLEXSTATE749(bytes memory raw) internal pure returns (SignedSimplexState memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint[] memory cnts = buf.CNTTAGS894(2);
        m.sigs = new bytes[](cnts[2]);
        cnts[2] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.simplexState = bytes(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.sigs[cnts[2]] = bytes(buf.DECBYTES375());
                cnts[2]++;
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder SignedSimplexState

    struct SignedSimplexStateArray {
        SignedSimplexState[] signedSimplexStates;   // tag: 1
    } // end struct SignedSimplexStateArray

    function DECSIGNEDSIMPLEXSTATEARRAY623(bytes memory raw) internal pure returns (SignedSimplexStateArray memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint[] memory cnts = buf.CNTTAGS894(1);
        m.signedSimplexStates = new SignedSimplexState[](cnts[1]);
        cnts[1] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.signedSimplexStates[cnts[1]] = DECSIGNEDSIMPLEXSTATE749(buf.DECBYTES375());
                cnts[1]++;
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder SignedSimplexStateArray

    struct ChannelMigrationRequest {
        bytes channelMigrationInfo;   // tag: 1
        bytes[] sigs;   // tag: 2
    } // end struct ChannelMigrationRequest

    function DECCHANNELMIGRATIONREQUEST258(bytes memory raw) internal pure returns (ChannelMigrationRequest memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES785(raw);

        uint[] memory cnts = buf.CNTTAGS894(2);
        m.sigs = new bytes[](cnts[2]);
        cnts[2] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE830()) {
            (tag, wire) = buf.DECKEY407();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.channelMigrationInfo = bytes(buf.DECBYTES375());
            }
            else if (tag == 2) {
                m.sigs[cnts[2]] = bytes(buf.DECBYTES375());
                cnts[2]++;
            }
            else { buf.SKIPVALUE259(wire); } // skip value of unknown tag
        }
    } // end decoder ChannelMigrationRequest

}

// File: openzeppelin-solidity/contracts/utils/Address.sol

pragma solidity ^0.5.0;

                                                           
library Address {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT700(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        uint256 size;
        // XXX Currently there is no better way to check if there is a contract in an address
        // than to check the size of the code at that address.
        // See https://ethereum.stackexchange.com/a/14016/36603
        // for more details about how this works.
        // TODO Check this again before the Serenity release, because all addresses will be
        // contracts then.
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.0;

                                                                                        
interface IERC20 {
    function TRANSFER888(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE201(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM544(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY264() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF264(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE512(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER967(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL774(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol

pragma solidity ^0.5.0;



                                                                                                                                                                                                                                                                            
library SafeERC20 {
    using SafeMath for uint256;

    function SAFETRANSFER390(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(token.TRANSFER888(to, value));
    }

    function SAFETRANSFERFROM153(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(token.TRANSFERFROM544(from, to, value));
    }

    function SAFEAPPROVE982(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require((value == 0) || (token.ALLOWANCE512(msg.sender, spender) == 0));
        require(token.APPROVE201(spender, value));
    }

    function SAFEINCREASEALLOWANCE481(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE512(address(this), spender).ADD105(value);
        require(token.APPROVE201(spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE805(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE512(address(this), spender).SUB843(value);
        require(token.APPROVE201(spender, newAllowance));
    }
}

// File: contracts/lib/ledgerlib/LedgerOperation.sol

pragma solidity ^0.5.1;










                                                                                                                                                                                                                                                                          
library LedgerOperation {
    using SafeMath for uint;
    using Address for address;
    using SafeERC20 for IERC20;
    using LedgerChannel for LedgerStruct.Channel;

                                                                                                                                                                                                                                                                                                    
    function OPENCHANNEL286(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes calldata _openRequest
    )
        external
    {
        PbChain.OpenChannelRequest memory openRequest =
            PbChain.DECOPENCHANNELREQUEST420(_openRequest);
        PbEntity.PaymentChannelInitializer memory channelInitializer =
            PbEntity.DECPAYMENTCHANNELINITIALIZER345(openRequest.channelInitializer);
        require(channelInitializer.initDistribution.distribution.length == 2, "Wrong length");
        require(block.number <= channelInitializer.openDeadline, "Open deadline passed");
        
        PbEntity.TokenInfo memory token = channelInitializer.initDistribution.token;
        uint[2] memory amounts = [
            channelInitializer.initDistribution.distribution[0].amt,
            channelInitializer.initDistribution.distribution[1].amt
        ];
        address[2] memory peerAddrs = [
            channelInitializer.initDistribution.distribution[0].account,
            channelInitializer.initDistribution.distribution[1].account
        ];
        // enforce ascending order of peers' addresses to simplify contract code
        require(peerAddrs[0] < peerAddrs[1], "Peer addrs are not ascending");

        ICelerWallet celerWallet = _self.celerWallet;
        bytes32 h = keccak256(openRequest.channelInitializer);
        (
            bytes32 channelId,
            LedgerStruct.Channel storage c
        ) = _CREATEWALLET8(_self, celerWallet, peerAddrs, h);

        c.disputeTimeout = channelInitializer.disputeTimeout;
        _UPDATECHANNELSTATUS881(_self, c, LedgerStruct.ChannelStatus.Operable);
        c.token = _VALIDATETOKENINFO726(token);
        c.peerProfiles[0].peerAddr = peerAddrs[0];
        c.peerProfiles[0].deposit = amounts[0];
        c.peerProfiles[1].peerAddr = peerAddrs[1];
        c.peerProfiles[1].deposit = amounts[1];

        require(c._CHECKCOSIGNATURES298(h, openRequest.sigs), "Check co-sigs failed");

        emit OPENCHANNEL947(channelId, uint(token.tokenType), token.tokenAddress, peerAddrs, amounts);

        uint amtSum = amounts[0].ADD105(amounts[1]);
        // if total deposit is 0
        if (amtSum == 0) {
            require(msg.value == 0, "msg.value is not 0");
            return;
        }

        // if total deposit is larger than 0
        if (_self.balanceLimitsEnabled) {
            require(amtSum <= _self.balanceLimits[token.tokenAddress], "Balance exceeds limit");
        }

        if (token.tokenType == PbEntity.TokenType.ETH) {
            uint msgValueReceiver = channelInitializer.msgValueReceiver;
            require(msg.value == amounts[msgValueReceiver], "msg.value mismatch");
            if (amounts[msgValueReceiver] > 0) {
                celerWallet.DEPOSITETH407.value(amounts[msgValueReceiver])(channelId);
            }

            // peer ID of non-msgValueReceiver
            uint pid = uint(1).SUB843(msgValueReceiver);
            if (amounts[pid] > 0) {
                _self.ethPool.TRANSFERTOCELERWALLET364(
                    peerAddrs[pid],
                    address(celerWallet),
                    channelId,
                    amounts[pid]
                );
            }
        } else if (token.tokenType == PbEntity.TokenType.ERC20) {
            require(msg.value == 0, "msg.value is not 0");

            IERC20 erc20Token = IERC20(token.tokenAddress);
            for (uint i = 0; i < 2; i++) {
                if (amounts[i] == 0) { continue; }

                erc20Token.SAFETRANSFERFROM153(peerAddrs[i], address(this), amounts[i]);
            }
            erc20Token.SAFEAPPROVE982(address(celerWallet), amtSum);
            celerWallet.DEPOSITERC20932(channelId, address(erc20Token), amtSum);
        } else {
            assert(false);
        }
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function DEPOSIT527(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes32 _channelId,
        address _receiver,
        uint _transferFromAmount
    )
        external
    {
        uint msgValue = msg.value;
        // this implicitly require _receiver be a peer
        _ADDDEPOSIT347(_self, _channelId, _receiver, _transferFromAmount.ADD105(msgValue));
        
        LedgerStruct.Channel storage c = _self.channelMap[_channelId];
        if (c.token.tokenType == PbEntity.TokenType.ETH) {
            if (msgValue > 0) {
                _self.celerWallet.DEPOSITETH407.value(msgValue)(_channelId);
            }
            if (_transferFromAmount > 0) {
                _self.ethPool.TRANSFERTOCELERWALLET364(
                    msg.sender,
                    address(_self.celerWallet),
                    _channelId,
                    _transferFromAmount
                );
            }
        } else if (c.token.tokenType == PbEntity.TokenType.ERC20) {
            require(msgValue == 0, "msg.value is not 0");

            IERC20 erc20Token = IERC20(c.token.tokenAddress);
            erc20Token.SAFETRANSFERFROM153(msg.sender, address(this), _transferFromAmount);
            erc20Token.SAFEAPPROVE982(address(_self.celerWallet), _transferFromAmount);
            _self.celerWallet.DEPOSITERC20932(_channelId, address(erc20Token), _transferFromAmount);
        } else {
            assert(false);
        }
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function SNAPSHOTSTATES637(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes calldata _signedSimplexStateArray
    )
        external
    {
        PbChain.SignedSimplexStateArray memory signedSimplexStateArray =
            PbChain.DECSIGNEDSIMPLEXSTATEARRAY623(_signedSimplexStateArray);
        uint simplexStatesNum = signedSimplexStateArray.signedSimplexStates.length;

        // snapshot each state
        PbEntity.SimplexPaymentChannel memory simplexState =
            PbEntity.DECSIMPLEXPAYMENTCHANNEL968(signedSimplexStateArray.signedSimplexStates[0].simplexState);
        for (uint i = 0; i < simplexStatesNum; i++) {
            bytes32 currentChannelId = simplexState.channelId;
            LedgerStruct.Channel storage c = _self.channelMap[currentChannelId];

            require(c.status == LedgerStruct.ChannelStatus.Operable, "Channel status error");

            bytes32 stateHash = keccak256(signedSimplexStateArray.signedSimplexStates[i].simplexState);
            bytes[] memory sigs = signedSimplexStateArray.signedSimplexStates[i].sigs;
            require(c._CHECKCOSIGNATURES298(stateHash, sigs), "Check co-sigs failed");
            uint peerFromId = c._GETPEERID760(simplexState.peerFrom);
            LedgerStruct.PeerState storage state = c.peerProfiles[peerFromId].state;
            require(simplexState.seqNum > state.seqNum, "seqNum error");

            // no need to update nextPayIdListHash and lastPayResolveDeadline for snapshot purpose
            state.seqNum = simplexState.seqNum;
            state.transferOut = simplexState.transferToPeer.receiver.amt;
            state.pendingPayOut = simplexState.totalPendingAmount;

            if (i == simplexStatesNum.SUB843(1)) {
                emit SNAPSHOTSTATES568(currentChannelId, c._GETSTATESEQNUMS363());
            } else if (i < simplexStatesNum.SUB843(1)) {
                simplexState = PbEntity.DECSIMPLEXPAYMENTCHANNEL968(
                    signedSimplexStateArray.signedSimplexStates[i+1].simplexState
                );
                // enforce channelIds of simplex states are ascending
                require(currentChannelId <= simplexState.channelId, "Non-ascending channelIds");
                if (currentChannelId < simplexState.channelId) {
                    emit SNAPSHOTSTATES568(currentChannelId, c._GETSTATESEQNUMS363());
                }
            } else {
                assert(false);
            }
        }
    }

                                                                                                                                                                                                                                                                                                                                                                                                                      
    function INTENDWITHDRAW511(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes32 _channelId,
        uint _amount,
        bytes32 _recipientChannelId
    )
        external
    {
        LedgerStruct.Channel storage c = _self.channelMap[_channelId];
        LedgerStruct.PeerProfile[2] storage peerProfiles = c.peerProfiles;
        LedgerStruct.WithdrawIntent storage withdrawIntent = c.withdrawIntent;
        address receiver = msg.sender;
        require(c.status == LedgerStruct.ChannelStatus.Operable, "Channel status error");
        // withdrawIntent.receiver is address(0) if and only if there is no pending WithdrawIntent,
        // because withdrawIntent.receiver may only be set as msg.sender which can't be address(0).
        require(withdrawIntent.receiver == address(0), "Pending withdraw intent exists");

        // check withdraw limit
        // this implicitly requires receiver be a peer
        uint rid = c._GETPEERID760(receiver);
        uint pid = uint(1).SUB843(rid);
        uint withdrawLimit = peerProfiles[rid].deposit
            .ADD105(peerProfiles[pid].state.transferOut)
            .SUB843(peerProfiles[rid].withdrawal)
            .SUB843(peerProfiles[rid].state.transferOut)
            .SUB843(peerProfiles[rid].state.pendingPayOut);
        require(_amount <= withdrawLimit, "Exceed withdraw limit");

        withdrawIntent.receiver = receiver;
        withdrawIntent.amount = _amount;
        withdrawIntent.requestTime = block.number;
        withdrawIntent.recipientChannelId = _recipientChannelId;

        emit INTENDWITHDRAW677(_channelId, receiver, _amount);
    }

                                                                                                                                                                                                                
    function CONFIRMWITHDRAW551(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes32 _channelId
    )
        external
    {
        LedgerStruct.Channel storage c = _self.channelMap[_channelId];
        require(c.status == LedgerStruct.ChannelStatus.Operable, "Channel status error");
        require(c.withdrawIntent.receiver != address(0), "No pending withdraw intent");
        require(
            block.number >= c.withdrawIntent.requestTime.ADD105(c.disputeTimeout),
            "Dispute not timeout"
        );

        address receiver = c.withdrawIntent.receiver;
        uint amount = c.withdrawIntent.amount;
        bytes32 recipientChannelId = c.withdrawIntent.recipientChannelId;
        delete c.withdrawIntent;

        // don't need to check balance because intendWithdraw() has already checked withdraw limit
        // this implicitly require receiver be a peer
        c._ADDWITHDRAWAL767(receiver, amount, false);
        
        (, uint[2] memory deposits, uint[2] memory withdrawals) = c.GETBALANCEMAP394();
        emit CONFIRMWITHDRAW233(_channelId, amount, receiver, recipientChannelId, deposits, withdrawals);

        _WITHDRAWFUNDS511(_self, _channelId, receiver, amount, recipientChannelId);
    }

                                                                                                                                                                                                                                                                                                            
    function VETOWITHDRAW874(LedgerStruct.Ledger storage _self, bytes32 _channelId) external {	//inject NONSTANDARD NAMING
        LedgerStruct.Channel storage c = _self.channelMap[_channelId];
        require(c.status == LedgerStruct.ChannelStatus.Operable, "Channel status error");
        require(c.withdrawIntent.receiver != address(0), "No pending withdraw intent");
        require(c._ISPEER484(msg.sender), "msg.sender is not peer");

        delete c.withdrawIntent;

        emit VETOWITHDRAW818(_channelId);
    }

                                                                                                                                                                                                                                 
    function COOPERATIVEWITHDRAW372(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes calldata _cooperativeWithdrawRequest
    )
        external
    {
        PbChain.CooperativeWithdrawRequest memory cooperativeWithdrawRequest =
            PbChain.DECCOOPERATIVEWITHDRAWREQUEST639(_cooperativeWithdrawRequest);
        PbEntity.CooperativeWithdrawInfo memory withdrawInfo =
            PbEntity.DECCOOPERATIVEWITHDRAWINFO647(cooperativeWithdrawRequest.withdrawInfo);
        bytes32 channelId = withdrawInfo.channelId;
        bytes32 recipientChannelId = withdrawInfo.recipientChannelId;
        LedgerStruct.Channel storage c = _self.channelMap[channelId];

        require(c.status == LedgerStruct.ChannelStatus.Operable, "Channel status error");
        bytes32 h = keccak256(cooperativeWithdrawRequest.withdrawInfo);
        require(
            c._CHECKCOSIGNATURES298(h, cooperativeWithdrawRequest.sigs),
            "Check co-sigs failed"
        );
        // require an increment of exactly 1 for seqNum of each cooperative withdraw request
        require(
            withdrawInfo.seqNum.SUB843(c.cooperativeWithdrawSeqNum) == 1,
            "seqNum error"
        );
        require(block.number <= withdrawInfo.withdrawDeadline, "Withdraw deadline passed");

        address receiver = withdrawInfo.withdraw.account;
        c.cooperativeWithdrawSeqNum = withdrawInfo.seqNum;
        uint amount = withdrawInfo.withdraw.amt;

        // this implicitly require receiver be a peer
        c._ADDWITHDRAWAL767(receiver, amount, true);

        (, uint[2] memory deposits, uint[2] memory withdrawals) = c.GETBALANCEMAP394();
        emit COOPERATIVEWITHDRAW956(
            channelId,
            amount,
            receiver,
            recipientChannelId,
            deposits,
            withdrawals,
            withdrawInfo.seqNum
        );

        _WITHDRAWFUNDS511(_self, channelId, receiver, amount, recipientChannelId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INTENDSETTLE588(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes calldata _signedSimplexStateArray
    )
        external
    {
        PbChain.SignedSimplexStateArray memory signedSimplexStateArray =
            PbChain.DECSIGNEDSIMPLEXSTATEARRAY623(_signedSimplexStateArray);
        uint simplexStatesNum = signedSimplexStateArray.signedSimplexStates.length;

        PbEntity.SimplexPaymentChannel memory simplexState =
            PbEntity.DECSIMPLEXPAYMENTCHANNEL968(signedSimplexStateArray.signedSimplexStates[0].simplexState);
        for (uint i = 0; i < simplexStatesNum; i++) {
            bytes32 currentChannelId = simplexState.channelId;
            LedgerStruct.Channel storage c = _self.channelMap[currentChannelId];
            require(
                c.status == LedgerStruct.ChannelStatus.Operable ||
                c.status == LedgerStruct.ChannelStatus.Settling,
                "Channel status error"
            );
            require(
                c.settleFinalizedTime == 0 || block.number < c.settleFinalizedTime,
                "Settle has already finalized"
            );
            
            bytes32 stateHash = keccak256(signedSimplexStateArray.signedSimplexStates[i].simplexState);
            bytes[] memory sigs = signedSimplexStateArray.signedSimplexStates[i].sigs;

            if (simplexState.seqNum > 0) {  // non-null state
                require(c._CHECKCOSIGNATURES298(stateHash, sigs), "Check co-sigs failed");
                uint peerFromId = c._GETPEERID760(simplexState.peerFrom);
                LedgerStruct.PeerState storage state = c.peerProfiles[peerFromId].state;
                // ensure each state can be intendSettle at most once
                if (c.status == LedgerStruct.ChannelStatus.Operable) {
                    // "==" is the case of cooperative on-chain checkpoint
                    require(simplexState.seqNum >= state.seqNum, "seqNum error");
                } else if (c.status == LedgerStruct.ChannelStatus.Settling) {
                    require(simplexState.seqNum > state.seqNum, "seqNum error");
                } else {
                    assert(false);
                }

                // update simplexState-dependent fields
                // no need to update pendingPayOut since channel settle process doesn't use it
                state.seqNum = simplexState.seqNum;
                state.transferOut = simplexState.transferToPeer.receiver.amt;
                state.nextPayIdListHash = simplexState.pendingPayIds.nextListHash;
                state.lastPayResolveDeadline = simplexState.lastPayResolveDeadline;
                _CLEARPAYS153(_self, currentChannelId, peerFromId, simplexState.pendingPayIds.payIds);
            } else if (simplexState.seqNum == 0) {  // null state
                // this implies both stored seqNums are 0
                require(c.settleFinalizedTime == 0, "intendSettle before");
                require(
                    sigs.length == 1 && c._CHECKSINGLESIGNATURE412(stateHash, sigs[0]),
                    "Check sig failed"
                );
            } else {
                assert(false);
            }

            if (i == simplexStatesNum.SUB843(1)) {
                _UPDATEOVERALLSTATESBYINTENDSTATE415(_self, currentChannelId);
            } else if (i < simplexStatesNum.SUB843(1)) {
                simplexState = PbEntity.DECSIMPLEXPAYMENTCHANNEL968(
                    signedSimplexStateArray.signedSimplexStates[i+1].simplexState
                );
                // enforce channelIds of simplex states are ascending
                require(currentChannelId <= simplexState.channelId, "Non-ascending channelIds");
                if (currentChannelId < simplexState.channelId) {
                    _UPDATEOVERALLSTATESBYINTENDSTATE415(_self, currentChannelId);
                }
            } else {
                assert(false);
            }
        }
    }

                                                                                                                                                                                                                                                                                                                               
    function CLEARPAYS645(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes32 _channelId,
        address _peerFrom,
        bytes calldata _payIdList
    )
        external
    {
        LedgerStruct.Channel storage c = _self.channelMap[_channelId];
        require(c.status == LedgerStruct.ChannelStatus.Settling, "Channel status error");
        uint peerFromId = c._GETPEERID760(_peerFrom);

        bytes32 listHash = keccak256(_payIdList);
        LedgerStruct.PeerState storage state = c.peerProfiles[peerFromId].state;
        require(state.nextPayIdListHash == listHash, "List hash mismatch");

        PbEntity.PayIdList memory payIdList = PbEntity.DECPAYIDLIST628(_payIdList);
        state.nextPayIdListHash = payIdList.nextListHash;
        _CLEARPAYS153(_self, _channelId, peerFromId, payIdList.payIds);
    }

                                                                                                                                                                                                                      
    function CONFIRMSETTLE509(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes32 _channelId
    )
        external
    {
        LedgerStruct.Channel storage c = _self.channelMap[_channelId];
        LedgerStruct.PeerProfile[2] storage peerProfiles = c.peerProfiles;
        uint blockNumber = block.number;
        require(c.status == LedgerStruct.ChannelStatus.Settling, "Channel status error");
        // require no new intendSettle can be called
        require(blockNumber >= c.settleFinalizedTime, "Settle is not finalized");

        // require channel status of current intendSettle has been finalized,
        // namely all payments have already been either cleared or expired
        // TODO: here we should use (lastPayResolveDeadline + clear safe margin)
        //   instead of lastPayResolveDeadline to avoid race condition between clearPays
        //   and confirmSettle, which may lead to different settle balance. Add this safe
        //   margin to the value of lastPayResolveDeadline for now as a temporary solution.
        require(
            (peerProfiles[0].state.nextPayIdListHash == bytes32(0) ||
                blockNumber > peerProfiles[0].state.lastPayResolveDeadline) &&
            (peerProfiles[1].state.nextPayIdListHash == bytes32(0) ||
                blockNumber > peerProfiles[1].state.lastPayResolveDeadline),
            "Payments are not finalized"
        );

        (bool validBalance, uint[2] memory settleBalance) = c._VALIDATESETTLEBALANCE16();
        if (!validBalance) {
            _RESETDUPLEXSTATE139(_self, c);
            emit CONFIRMSETTLEFAIL701(_channelId);
            return;
        }

        _UPDATECHANNELSTATUS881(_self, c, LedgerStruct.ChannelStatus.Closed);

        emit CONFIRMSETTLE810(_channelId, settleBalance);

        // Withdrawal from Contracts pattern is needless here,
        // because peers need to sign messages which implies that they can't be contracts
        _BATCHTRANSFEROUT751(
            _self,
            _channelId,
            c.token.tokenAddress,
            [peerProfiles[0].peerAddr, peerProfiles[1].peerAddr],
            settleBalance
        );
    }

                                                                                                                                                                                                 
    function COOPERATIVESETTLE892(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes calldata _settleRequest
    )
        external
    {
        PbChain.CooperativeSettleRequest memory settleRequest =
            PbChain.DECCOOPERATIVESETTLEREQUEST318(_settleRequest);
        PbEntity.CooperativeSettleInfo memory settleInfo =
            PbEntity.DECCOOPERATIVESETTLEINFO350(settleRequest.settleInfo);
        bytes32 channelId = settleInfo.channelId;
        LedgerStruct.Channel storage c = _self.channelMap[channelId];
        require(
            c.status == LedgerStruct.ChannelStatus.Operable ||
            c.status == LedgerStruct.ChannelStatus.Settling,
            "Channel status error"
        );

        bytes32 h = keccak256(settleRequest.settleInfo);
        require(c._CHECKCOSIGNATURES298(h, settleRequest.sigs), "Check co-sigs failed");

        address[2] memory peerAddrs = [c.peerProfiles[0].peerAddr, c.peerProfiles[1].peerAddr];
        require(
            settleInfo.seqNum > c.peerProfiles[0].state.seqNum &&
                settleInfo.seqNum > c.peerProfiles[1].state.seqNum,
            "seqNum error"
        );
        require(settleInfo.settleDeadline >= block.number, "Settle deadline passed");
        // require distribution is consistent with the order of peerAddrs in channel
        require(
            settleInfo.settleBalance[0].account == peerAddrs[0] &&
                settleInfo.settleBalance[1].account == peerAddrs[1],
            "Settle accounts mismatch"
        );

        uint[2] memory settleBalance = [
            settleInfo.settleBalance[0].amt,
            settleInfo.settleBalance[1].amt
        ];
        require(settleBalance[0].ADD105(settleBalance[1]) == c.GETTOTALBALANCE713(), "Balance sum mismatch");

        _UPDATECHANNELSTATUS881(_self, c, LedgerStruct.ChannelStatus.Closed);

        emit COOPERATIVESETTLE72(channelId, settleBalance);

        _BATCHTRANSFEROUT751(_self, channelId, c.token.tokenAddress, peerAddrs, settleBalance);
    }

                                                                                                                                                                                                                                                              
    function GETCHANNELSTATUSNUM45(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        uint _channelStatus
    )
        external
        view
        returns(uint)
    {
        return _self.channelStatusNums[_channelStatus];
    }

                                                                                                                                                                       
    function GETETHPOOL585(LedgerStruct.Ledger storage _self) external view returns(address) {	//inject NONSTANDARD NAMING
        return address(_self.ethPool);
    }

                                                                                                                                                                               
    function GETPAYREGISTRY317(LedgerStruct.Ledger storage _self) external view returns(address) {	//inject NONSTANDARD NAMING
        return address(_self.payRegistry);
    }

                                                                                                                                                                               
    function GETCELERWALLET378(LedgerStruct.Ledger storage _self) external view returns(address) {	//inject NONSTANDARD NAMING
        return address(_self.celerWallet);
    }

                                                                                                                                                                                                                                                                                                                                                                        
    function _CREATEWALLET8(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        ICelerWallet _w,
        address[2] memory _peers,
        bytes32 _nonce
    )
        internal
        returns(bytes32, LedgerStruct.Channel storage)
    {
        address[] memory owners = new address[](2);
        owners[0] = _peers[0];
        owners[1] = _peers[1];
        // it is safe to use abi.encodePacked() with only one dynamic variable
        // use walletId as channelId
        bytes32 channelId = _w.CREATE867(owners, address(this), _nonce);
        // 0 is reserved for non-channel indication
        require(channelId != bytes32(0), "channelId gets 0");
        LedgerStruct.Channel storage c = _self.channelMap[channelId];
        // No harm in having this check in case of keccak256 being broken 
        require(c.status == LedgerStruct.ChannelStatus.Uninitialized, "Occupied channelId");

        return (channelId, c);
    }

                                                                                                                                                                                                                                                                                 
    function _ADDDEPOSIT347(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes32 _channelId,
        address _receiver,
        uint _amount
    )
        internal
    {
        LedgerStruct.Channel storage c = _self.channelMap[_channelId];
        require(c.status == LedgerStruct.ChannelStatus.Operable, "Channel status error");

        // this implicitly require _receiver be a peer
        uint rid = c._GETPEERID760(_receiver);
        if (_self.balanceLimitsEnabled) {
            require(
                _amount.ADD105(c.GETTOTALBALANCE713()) <= _self.balanceLimits[c.token.tokenAddress],
                "Balance exceeds limit"
            );
        }

        c.peerProfiles[rid].deposit = c.peerProfiles[rid].deposit.ADD105(_amount);

        (
            address[2] memory peerAddrs,
            uint[2] memory deposits,
            uint[2] memory withdrawals
        ) = c.GETBALANCEMAP394();
        emit DEPOSIT999(_channelId, peerAddrs, deposits, withdrawals);
    }

                                                                                                                                                                                                                                                                                                                                                                   
    function _BATCHTRANSFEROUT751(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes32 _channelId,
        address _tokenAddr,
        address[2] memory _receivers,
        uint[2] memory _amounts
    )
        internal
    {
        for (uint i = 0; i < 2; i++) {
            if (_amounts[i] == 0) { continue; }

            _self.celerWallet.WITHDRAW16(_channelId, _tokenAddr, _receivers[i], _amounts[i]);
        }
    }

                                                                                                                                                                                                                                                                                                                                                                                      
    function _WITHDRAWFUNDS511(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes32 _channelId,
        address _receiver,
        uint _amount,
        bytes32 _recipientChannelId
    )
        internal
    {
        if (_amount == 0) { return; }

        LedgerStruct.Channel storage c = _self.channelMap[_channelId];
        if (_recipientChannelId == bytes32(0)) {
            _self.celerWallet.WITHDRAW16(_channelId, c.token.tokenAddress, _receiver, _amount);
        } else {
            LedgerStruct.Channel storage recipientChannel = _self.channelMap[_recipientChannelId];
            require(
                c.token.tokenType == recipientChannel.token.tokenType &&
                    c.token.tokenAddress == recipientChannel.token.tokenAddress,
                "Token mismatch of recipient channel"
            );
            _ADDDEPOSIT347(_self, _recipientChannelId, _receiver, _amount);

            // move funds from one channel's wallet to another channel's wallet
            _self.celerWallet.TRANSFERTOWALLET672(
                _channelId,
                _recipientChannelId,
                c.token.tokenAddress,
                _receiver,
                _amount
            );
        }
    }

                                                                                                                                                   
    function _RESETDUPLEXSTATE139(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        LedgerStruct.Channel storage _c
    )
        internal
    {
        delete _c.settleFinalizedTime;
        _UPDATECHANNELSTATUS881(_self, _c, LedgerStruct.ChannelStatus.Operable);
        delete _c.peerProfiles[0].state;
        delete _c.peerProfiles[1].state;
        // reset possibly remaining WithdrawIntent freezed by previous intendSettle()
        delete _c.withdrawIntent;
    }

                                                                                                                                                                                                                                                                           
    function _CLEARPAYS153(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes32 _channelId,
        uint _peerId,
        bytes32[] memory _payIds
    )
        internal
    {
        LedgerStruct.Channel storage c = _self.channelMap[_channelId];
        uint[] memory outAmts = _self.payRegistry.GETPAYAMOUNTS92(
            _payIds,
            c.peerProfiles[_peerId].state.lastPayResolveDeadline
        );

        uint totalAmtOut = 0;
        for (uint i = 0; i < outAmts.length; i++) {
            totalAmtOut = totalAmtOut.ADD105(outAmts[i]);
            emit CLEARONEPAY272(_channelId, _payIds[i], c.peerProfiles[_peerId].peerAddr, outAmts[i]);
        }
        c.peerProfiles[_peerId].state.transferOut =
            c.peerProfiles[_peerId].state.transferOut.ADD105(totalAmtOut);
    }

                                                                                                                                                                         
    function _UPDATEOVERALLSTATESBYINTENDSTATE415(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        bytes32 _channelId
    )
        internal
    {
        LedgerStruct.Channel storage c = _self.channelMap[_channelId];
        c.settleFinalizedTime = block.number.ADD105(c.disputeTimeout);
        _UPDATECHANNELSTATUS881(_self, c, LedgerStruct.ChannelStatus.Settling);

        emit INTENDSETTLE985(_channelId, c._GETSTATESEQNUMS363());
    }

                                                                                                                                                                                           
    function _UPDATECHANNELSTATUS881(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        LedgerStruct.Channel storage _c,
        LedgerStruct.ChannelStatus _newStatus
    )
        internal
    {
        if (_c.status == _newStatus) {
            return;
        }

        // update counter of old status
        if (_c.status != LedgerStruct.ChannelStatus.Uninitialized) {
            _self.channelStatusNums[uint(_c.status)] = _self.channelStatusNums[uint(_c.status)].SUB843(1);
        }

        // update counter of new status
        _self.channelStatusNums[uint(_newStatus)] = _self.channelStatusNums[uint(_newStatus)].ADD105(1);

        _c.status = _newStatus;
    }

                                                                                                                                      
    function _VALIDATETOKENINFO726(PbEntity.TokenInfo memory _token)	//inject NONSTANDARD NAMING
        internal
        view
        returns(PbEntity.TokenInfo memory)
    {
        if (_token.tokenType == PbEntity.TokenType.ETH) {
            require(_token.tokenAddress == address(0));
        } else if (_token.tokenType == PbEntity.TokenType.ERC20) {
            require(_token.tokenAddress != address(0));
            require(_token.tokenAddress.ISCONTRACT700());
        } else {
            assert(false);
        }

        return _token;
    }

    event OPENCHANNEL947(	//inject NONSTANDARD NAMING
        bytes32 indexed channelId,
        uint tokenType,
        address indexed tokenAddress,
        // TODO: there is an issue of setting address[2] as indexed. Need to fix and make this indexed
        address[2] peerAddrs,
        uint[2] initialDeposits
    );

    // TODO: there is an issue of setting address[2] as indexed. Need to fix and make this indexed
    event DEPOSIT999(bytes32 indexed channelId, address[2] peerAddrs, uint[2] deposits, uint[2] withdrawals);	//inject NONSTANDARD NAMING

    event SNAPSHOTSTATES568(bytes32 indexed channelId, uint[2] seqNums);	//inject NONSTANDARD NAMING

    event INTENDSETTLE985(bytes32 indexed channelId, uint[2] seqNums);	//inject NONSTANDARD NAMING

    event CLEARONEPAY272(bytes32 indexed channelId, bytes32 indexed payId, address indexed peerFrom, uint amount);	//inject NONSTANDARD NAMING

    event CONFIRMSETTLE810(bytes32 indexed channelId, uint[2] settleBalance);	//inject NONSTANDARD NAMING

    event CONFIRMSETTLEFAIL701(bytes32 indexed channelId);	//inject NONSTANDARD NAMING

    event INTENDWITHDRAW677(bytes32 indexed channelId, address indexed receiver, uint amount);	//inject NONSTANDARD NAMING

    event CONFIRMWITHDRAW233(	//inject NONSTANDARD NAMING
        bytes32 indexed channelId,
        uint withdrawnAmount,
        address indexed receiver,
        bytes32 indexed recipientChannelId,
        uint[2] deposits,
        uint[2] withdrawals
    );

    event VETOWITHDRAW818(bytes32 indexed channelId);	//inject NONSTANDARD NAMING

    event COOPERATIVEWITHDRAW956(	//inject NONSTANDARD NAMING
        bytes32 indexed channelId,
        uint withdrawnAmount,
        address indexed receiver,
        bytes32 indexed recipientChannelId,
        uint[2] deposits,
        uint[2] withdrawals,
        uint seqNum
    );

    event COOPERATIVESETTLE72(bytes32 indexed channelId, uint[2] settleBalance);	//inject NONSTANDARD NAMING
}