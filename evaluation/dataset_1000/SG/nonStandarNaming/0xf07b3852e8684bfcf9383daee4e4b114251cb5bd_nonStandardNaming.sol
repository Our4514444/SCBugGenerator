                                                                 

// File: contracts/lib/interface/ICelerWallet.sol

pragma solidity ^0.5.1;

                                       
interface ICelerWallet {
    function CREATE820(address[] calldata _owners, address _operator, bytes32 _nonce) external returns(bytes32);	//inject NONSTANDARD NAMING

    function DEPOSITETH443(bytes32 _walletId) external payable;	//inject NONSTANDARD NAMING

    function DEPOSITERC20770(bytes32 _walletId, address _tokenAddress, uint _amount) external;	//inject NONSTANDARD NAMING
    
    function WITHDRAW368(bytes32 _walletId, address _tokenAddress, address _receiver, uint _amount) external;	//inject NONSTANDARD NAMING

    function TRANSFERTOWALLET581(bytes32 _fromWalletId, bytes32 _toWalletId, address _tokenAddress, address _receiver, uint _amount) external;	//inject NONSTANDARD NAMING

    function TRANSFEROPERATORSHIP508(bytes32 _walletId, address _newOperator) external;	//inject NONSTANDARD NAMING

    function PROPOSENEWOPERATOR253(bytes32 _walletId, address _newOperator) external;	//inject NONSTANDARD NAMING

    function DRAINTOKEN872(address _tokenAddress, address _receiver, uint _amount) external;	//inject NONSTANDARD NAMING

    function GETWALLETOWNERS638(bytes32 _walletId) external view returns(address[] memory);	//inject NONSTANDARD NAMING

    function GETOPERATOR939(bytes32 _walletId) external view returns(address);	//inject NONSTANDARD NAMING

    function GETBALANCE794(bytes32 _walletId, address _tokenAddress) external view returns(uint);	//inject NONSTANDARD NAMING

    function GETPROPOSEDNEWOPERATOR478(bytes32 _walletId) external view returns(address);	//inject NONSTANDARD NAMING

    function GETPROPOSALVOTE600(bytes32 _walletId, address _owner) external view returns(bool);	//inject NONSTANDARD NAMING

    event CREATEWALLET868(bytes32 indexed walletId, address[] indexed owners, address indexed operator);	//inject NONSTANDARD NAMING

    event DEPOSITTOWALLET952(bytes32 indexed walletId, address indexed tokenAddress, uint amount);	//inject NONSTANDARD NAMING

    event WITHDRAWFROMWALLET729(bytes32 indexed walletId, address indexed tokenAddress, address indexed receiver, uint amount);	//inject NONSTANDARD NAMING

    event TRANSFERTOWALLET672(bytes32 indexed fromWalletId, bytes32 indexed toWalletId, address indexed tokenAddress, address receiver, uint amount);	//inject NONSTANDARD NAMING

    event CHANGEOPERATOR698(bytes32 indexed walletId, address indexed oldOperator, address indexed newOperator);	//inject NONSTANDARD NAMING

    event PROPOSENEWOPERATOR582(bytes32 indexed walletId, address indexed newOperator, address indexed proposer);	//inject NONSTANDARD NAMING

    event DRAINTOKEN269(address indexed tokenAddress, address indexed receiver, uint amount);	//inject NONSTANDARD NAMING
}

// File: contracts/lib/interface/IEthPool.sol

pragma solidity ^0.5.1;

                                   
interface IEthPool {
    function DEPOSIT499(address _receiver) external payable;	//inject NONSTANDARD NAMING

    function WITHDRAW368(uint _value) external;	//inject NONSTANDARD NAMING

    function APPROVE201(address _spender, uint _value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM425(address _from, address payable _to, uint _value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERTOCELERWALLET333(address _from, address _walletAddr, bytes32 _walletId, uint _value) external returns (bool);	//inject NONSTANDARD NAMING

    function INCREASEALLOWANCE406(address _spender, uint _addedValue) external returns (bool);	//inject NONSTANDARD NAMING

    function DECREASEALLOWANCE751(address _spender, uint _subtractedValue) external returns (bool);	//inject NONSTANDARD NAMING

    function BALANCEOF538(address _owner) external view returns (uint);	//inject NONSTANDARD NAMING

    function ALLOWANCE707(address _owner, address _spender) external view returns (uint);	//inject NONSTANDARD NAMING

    event DEPOSIT510(address indexed receiver, uint value);	//inject NONSTANDARD NAMING
    
    // transfer from "from" account inside EthPool to real "to" address outside EthPool
    event TRANSFER347(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    
    event APPROVAL248(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

// File: contracts/lib/interface/IPayRegistry.sol

pragma solidity ^0.5.1;

                                       
interface IPayRegistry {
    function CALCULATEPAYID785(bytes32 _payHash, address _setter) external pure returns(bytes32);	//inject NONSTANDARD NAMING

    function SETPAYAMOUNT245(bytes32 _payHash, uint _amt) external;	//inject NONSTANDARD NAMING

    function SETPAYDEADLINE886(bytes32 _payHash, uint _deadline) external;	//inject NONSTANDARD NAMING

    function SETPAYINFO464(bytes32 _payHash, uint _amt, uint _deadline) external;	//inject NONSTANDARD NAMING

    function SETPAYAMOUNTS742(bytes32[] calldata _payHashes, uint[] calldata _amts) external;	//inject NONSTANDARD NAMING

    function SETPAYDEADLINES819(bytes32[] calldata _payHashes, uint[] calldata _deadlines) external;	//inject NONSTANDARD NAMING

    function SETPAYINFOS560(bytes32[] calldata _payHashes, uint[] calldata _amts, uint[] calldata _deadlines) external;	//inject NONSTANDARD NAMING

    function GETPAYAMOUNTS828(	//inject NONSTANDARD NAMING
        bytes32[] calldata _payIds,
        uint _lastPayResolveDeadline
    ) external view returns(uint[] memory);

    function GETPAYINFO942(bytes32 _payId) external view returns(uint, uint);	//inject NONSTANDARD NAMING

    event PAYINFOUPDATE714(bytes32 indexed payId, uint amount, uint resolveDeadline);	//inject NONSTANDARD NAMING
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
    function FROMBYTES361(bytes memory raw) internal pure returns (Buffer memory buf) {	//inject NONSTANDARD NAMING
        buf.b = raw;
        buf.idx = 0;
    }

    // whether there are unread bytes
    function HASMORE628(Buffer memory buf) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return buf.idx < buf.b.length;
    }

    // decode current field number and wiretype
    function DECKEY852(Buffer memory buf) internal pure returns (uint tag, WireType wiretype) {	//inject NONSTANDARD NAMING
        uint v = DECVARINT478(buf);
        tag = v / 8;
        wiretype = WireType(v & 7);
    }

    // count tag occurrences, return an array due to no memory map support
	// have to create array for (maxtag+1) size. cnts[tag] = occurrences
	// should keep buf.idx unchanged because this is only a count function
    function CNTTAGS880(Buffer memory buf, uint maxtag) internal pure returns (uint[] memory cnts) {	//inject NONSTANDARD NAMING
        uint originalIdx = buf.idx;
        cnts = new uint[](maxtag+1);  // protobuf's tags are from 1 rather than 0
        uint tag;
        WireType wire;
        while (HASMORE628(buf)) {
            (tag, wire) = DECKEY852(buf);
            cnts[tag] += 1;
            SKIPVALUE135(buf, wire);
        }
        buf.idx = originalIdx;
    }

    // read varint from current buf idx, move buf.idx to next read, return the int value
    function DECVARINT478(Buffer memory buf) internal pure returns (uint v) {	//inject NONSTANDARD NAMING
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
    function DECBYTES532(Buffer memory buf) internal pure returns (bytes memory b) {	//inject NONSTANDARD NAMING
        uint len = DECVARINT478(buf);
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
    function DECPACKED358(Buffer memory buf) internal pure returns (uint[] memory t) {	//inject NONSTANDARD NAMING
        uint len = DECVARINT478(buf);
        uint end = buf.idx + len;
        require(end <= buf.b.length);  // avoid overflow
        // array in memory must be init w/ known length
        // so we have to create a tmp array w/ max possible len first
        uint[] memory tmp = new uint[](len);
        uint i = 0; // count how many ints are there
        while (buf.idx < end) {
            tmp[i] = DECVARINT478(buf);
            i++;
        }
        t = new uint[](i); // init t with correct length
        for (uint j=0; j<i; j++) {
            t[j] = tmp[j];
        }
        return t;
    }

    // move idx pass current value field, to beginning of next tag or msg end
    function SKIPVALUE135(Buffer memory buf, WireType wire) internal pure {	//inject NONSTANDARD NAMING
        if (wire == WireType.Varint) { DECVARINT478(buf); }
        else if (wire == WireType.LengthDelim) {
            uint len = DECVARINT478(buf);
            buf.idx += len; // skip len bytes value data
            require(buf.idx <= buf.b.length);  // avoid overflow
        } else { revert(); }  // unsupported wiretype
    }

    // type conversion help utils
    function _BOOL212(uint x) internal pure returns (bool v) {	//inject NONSTANDARD NAMING
        return x != 0;
    }

    function _UINT2567(bytes memory b) internal pure returns (uint256 v) {	//inject NONSTANDARD NAMING
        require(b.length <= 32);  // b's length must be smaller than or equal to 32
        assembly { v := mload(add(b, 32)) }  // load all 32bytes to v
        v = v >> (8 * (32 - b.length));  // only first b.length is valid
    }

    function _ADDRESS113(bytes memory b) internal pure returns (address v) {	//inject NONSTANDARD NAMING
        v = _ADDRESSPAYABLE609(b);
    }

    function _ADDRESSPAYABLE609(bytes memory b) internal pure returns (address payable v) {	//inject NONSTANDARD NAMING
        require(b.length == 20);
        //load 32bytes then shift right 12 bytes
        assembly { v := div(mload(add(b, 32)), 0x1000000000000000000000000) }
    }

    function _BYTES32103(bytes memory b) internal pure returns (bytes32 v) {	//inject NONSTANDARD NAMING
        require(b.length == 32);
        assembly { v := mload(add(b, 32)) }
    }

    // uint[] to uint8[]
    function UINT8S669(uint[] memory arr) internal pure returns (uint8[] memory t) {	//inject NONSTANDARD NAMING
        t = new uint8[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = uint8(arr[i]); }
    }

    function UINT32S771(uint[] memory arr) internal pure returns (uint32[] memory t) {	//inject NONSTANDARD NAMING
        t = new uint32[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = uint32(arr[i]); }
    }

    function UINT64S943(uint[] memory arr) internal pure returns (uint64[] memory t) {	//inject NONSTANDARD NAMING
        t = new uint64[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = uint64(arr[i]); }
    }

    function BOOLS79(uint[] memory arr) internal pure returns (bool[] memory t) {	//inject NONSTANDARD NAMING
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
    function TOKENTYPES983(uint[] memory arr) internal pure returns (TokenType[] memory t) {	//inject NONSTANDARD NAMING
        t = new TokenType[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = TokenType(arr[i]); }
    }

    enum TransferFunctionType { BOOLEAN_AND, BOOLEAN_OR, BOOLEAN_CIRCUIT, NUMERIC_ADD, NUMERIC_MAX, NUMERIC_MIN }

    // TransferFunctionType[] decode function
    function TRANSFERFUNCTIONTYPES762(uint[] memory arr) internal pure returns (TransferFunctionType[] memory t) {	//inject NONSTANDARD NAMING
        t = new TransferFunctionType[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = TransferFunctionType(arr[i]); }
    }

    enum ConditionType { HASH_LOCK, DEPLOYED_CONTRACT, VIRTUAL_CONTRACT }

    // ConditionType[] decode function
    function CONDITIONTYPES714(uint[] memory arr) internal pure returns (ConditionType[] memory t) {	//inject NONSTANDARD NAMING
        t = new ConditionType[](arr.length);
        for (uint i = 0; i < t.length; i++) { t[i] = ConditionType(arr[i]); }
    }

    struct AccountAmtPair {
        address account;   // tag: 1
        uint256 amt;   // tag: 2
    } // end struct AccountAmtPair

    function DECACCOUNTAMTPAIR606(bytes memory raw) internal pure returns (AccountAmtPair memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.account = Pb._ADDRESS113(buf.DECBYTES532());
            }
            else if (tag == 2) {
                m.amt = Pb._UINT2567(buf.DECBYTES532());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
        }
    } // end decoder AccountAmtPair

    struct TokenInfo {
        TokenType tokenType;   // tag: 1
        address tokenAddress;   // tag: 2
    } // end struct TokenInfo

    function DECTOKENINFO753(bytes memory raw) internal pure returns (TokenInfo memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.tokenType = TokenType(buf.DECVARINT478());
            }
            else if (tag == 2) {
                m.tokenAddress = Pb._ADDRESS113(buf.DECBYTES532());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
        }
    } // end decoder TokenInfo

    struct TokenDistribution {
        TokenInfo token;   // tag: 1
        AccountAmtPair[] distribution;   // tag: 2
    } // end struct TokenDistribution

    function DECTOKENDISTRIBUTION411(bytes memory raw) internal pure returns (TokenDistribution memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint[] memory cnts = buf.CNTTAGS880(2);
        m.distribution = new AccountAmtPair[](cnts[2]);
        cnts[2] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.token = DECTOKENINFO753(buf.DECBYTES532());
            }
            else if (tag == 2) {
                m.distribution[cnts[2]] = DECACCOUNTAMTPAIR606(buf.DECBYTES532());
                cnts[2]++;
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
        }
    } // end decoder TokenDistribution

    struct TokenTransfer {
        TokenInfo token;   // tag: 1
        AccountAmtPair receiver;   // tag: 2
    } // end struct TokenTransfer

    function DECTOKENTRANSFER92(bytes memory raw) internal pure returns (TokenTransfer memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.token = DECTOKENINFO753(buf.DECBYTES532());
            }
            else if (tag == 2) {
                m.receiver = DECACCOUNTAMTPAIR606(buf.DECBYTES532());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
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

    function DECSIMPLEXPAYMENTCHANNEL982(bytes memory raw) internal pure returns (SimplexPaymentChannel memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.channelId = Pb._BYTES32103(buf.DECBYTES532());
            }
            else if (tag == 2) {
                m.peerFrom = Pb._ADDRESS113(buf.DECBYTES532());
            }
            else if (tag == 3) {
                m.seqNum = uint(buf.DECVARINT478());
            }
            else if (tag == 4) {
                m.transferToPeer = DECTOKENTRANSFER92(buf.DECBYTES532());
            }
            else if (tag == 5) {
                m.pendingPayIds = DECPAYIDLIST366(buf.DECBYTES532());
            }
            else if (tag == 6) {
                m.lastPayResolveDeadline = uint(buf.DECVARINT478());
            }
            else if (tag == 7) {
                m.totalPendingAmount = Pb._UINT2567(buf.DECBYTES532());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
        }
    } // end decoder SimplexPaymentChannel

    struct PayIdList {
        bytes32[] payIds;   // tag: 1
        bytes32 nextListHash;   // tag: 2
    } // end struct PayIdList

    function DECPAYIDLIST366(bytes memory raw) internal pure returns (PayIdList memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint[] memory cnts = buf.CNTTAGS880(2);
        m.payIds = new bytes32[](cnts[1]);
        cnts[1] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.payIds[cnts[1]] = Pb._BYTES32103(buf.DECBYTES532());
                cnts[1]++;
            }
            else if (tag == 2) {
                m.nextListHash = Pb._BYTES32103(buf.DECBYTES532());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
        }
    } // end decoder PayIdList

    struct TransferFunction {
        TransferFunctionType logicType;   // tag: 1
        TokenTransfer maxTransfer;   // tag: 2
    } // end struct TransferFunction

    function DECTRANSFERFUNCTION968(bytes memory raw) internal pure returns (TransferFunction memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.logicType = TransferFunctionType(buf.DECVARINT478());
            }
            else if (tag == 2) {
                m.maxTransfer = DECTOKENTRANSFER92(buf.DECBYTES532());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
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

    function DECCONDITIONALPAY995(bytes memory raw) internal pure returns (ConditionalPay memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint[] memory cnts = buf.CNTTAGS880(8);
        m.conditions = new Condition[](cnts[4]);
        cnts[4] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.payTimestamp = uint(buf.DECVARINT478());
            }
            else if (tag == 2) {
                m.src = Pb._ADDRESS113(buf.DECBYTES532());
            }
            else if (tag == 3) {
                m.dest = Pb._ADDRESS113(buf.DECBYTES532());
            }
            else if (tag == 4) {
                m.conditions[cnts[4]] = DECCONDITION698(buf.DECBYTES532());
                cnts[4]++;
            }
            else if (tag == 5) {
                m.transferFunc = DECTRANSFERFUNCTION968(buf.DECBYTES532());
            }
            else if (tag == 6) {
                m.resolveDeadline = uint(buf.DECVARINT478());
            }
            else if (tag == 7) {
                m.resolveTimeout = uint(buf.DECVARINT478());
            }
            else if (tag == 8) {
                m.payResolver = Pb._ADDRESS113(buf.DECBYTES532());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
        }
    } // end decoder ConditionalPay

    struct CondPayResult {
        bytes condPay;   // tag: 1
        uint256 amount;   // tag: 2
    } // end struct CondPayResult

    function DECCONDPAYRESULT959(bytes memory raw) internal pure returns (CondPayResult memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.condPay = bytes(buf.DECBYTES532());
            }
            else if (tag == 2) {
                m.amount = Pb._UINT2567(buf.DECBYTES532());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
        }
    } // end decoder CondPayResult

    struct VouchedCondPayResult {
        bytes condPayResult;   // tag: 1
        bytes sigOfSrc;   // tag: 2
        bytes sigOfDest;   // tag: 3
    } // end struct VouchedCondPayResult

    function DECVOUCHEDCONDPAYRESULT355(bytes memory raw) internal pure returns (VouchedCondPayResult memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.condPayResult = bytes(buf.DECBYTES532());
            }
            else if (tag == 2) {
                m.sigOfSrc = bytes(buf.DECBYTES532());
            }
            else if (tag == 3) {
                m.sigOfDest = bytes(buf.DECBYTES532());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
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

    function DECCONDITION698(bytes memory raw) internal pure returns (Condition memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.conditionType = ConditionType(buf.DECVARINT478());
            }
            else if (tag == 2) {
                m.hashLock = Pb._BYTES32103(buf.DECBYTES532());
            }
            else if (tag == 3) {
                m.deployedContractAddress = Pb._ADDRESS113(buf.DECBYTES532());
            }
            else if (tag == 4) {
                m.virtualContractAddress = Pb._BYTES32103(buf.DECBYTES532());
            }
            else if (tag == 5) {
                m.argsQueryFinalization = bytes(buf.DECBYTES532());
            }
            else if (tag == 6) {
                m.argsQueryOutcome = bytes(buf.DECBYTES532());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
        }
    } // end decoder Condition

    struct CooperativeWithdrawInfo {
        bytes32 channelId;   // tag: 1
        uint seqNum;   // tag: 2
        AccountAmtPair withdraw;   // tag: 3
        uint withdrawDeadline;   // tag: 4
        bytes32 recipientChannelId;   // tag: 5
    } // end struct CooperativeWithdrawInfo

    function DECCOOPERATIVEWITHDRAWINFO755(bytes memory raw) internal pure returns (CooperativeWithdrawInfo memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.channelId = Pb._BYTES32103(buf.DECBYTES532());
            }
            else if (tag == 2) {
                m.seqNum = uint(buf.DECVARINT478());
            }
            else if (tag == 3) {
                m.withdraw = DECACCOUNTAMTPAIR606(buf.DECBYTES532());
            }
            else if (tag == 4) {
                m.withdrawDeadline = uint(buf.DECVARINT478());
            }
            else if (tag == 5) {
                m.recipientChannelId = Pb._BYTES32103(buf.DECBYTES532());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
        }
    } // end decoder CooperativeWithdrawInfo

    struct PaymentChannelInitializer {
        TokenDistribution initDistribution;   // tag: 1
        uint openDeadline;   // tag: 2
        uint disputeTimeout;   // tag: 3
        uint msgValueReceiver;   // tag: 4
    } // end struct PaymentChannelInitializer

    function DECPAYMENTCHANNELINITIALIZER779(bytes memory raw) internal pure returns (PaymentChannelInitializer memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.initDistribution = DECTOKENDISTRIBUTION411(buf.DECBYTES532());
            }
            else if (tag == 2) {
                m.openDeadline = uint(buf.DECVARINT478());
            }
            else if (tag == 3) {
                m.disputeTimeout = uint(buf.DECVARINT478());
            }
            else if (tag == 4) {
                m.msgValueReceiver = uint(buf.DECVARINT478());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
        }
    } // end decoder PaymentChannelInitializer

    struct CooperativeSettleInfo {
        bytes32 channelId;   // tag: 1
        uint seqNum;   // tag: 2
        AccountAmtPair[] settleBalance;   // tag: 3
        uint settleDeadline;   // tag: 4
    } // end struct CooperativeSettleInfo

    function DECCOOPERATIVESETTLEINFO414(bytes memory raw) internal pure returns (CooperativeSettleInfo memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint[] memory cnts = buf.CNTTAGS880(4);
        m.settleBalance = new AccountAmtPair[](cnts[3]);
        cnts[3] = 0;  // reset counter for later use
        
        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.channelId = Pb._BYTES32103(buf.DECBYTES532());
            }
            else if (tag == 2) {
                m.seqNum = uint(buf.DECVARINT478());
            }
            else if (tag == 3) {
                m.settleBalance[cnts[3]] = DECACCOUNTAMTPAIR606(buf.DECBYTES532());
                cnts[3]++;
            }
            else if (tag == 4) {
                m.settleDeadline = uint(buf.DECVARINT478());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
        }
    } // end decoder CooperativeSettleInfo

    struct ChannelMigrationInfo {
        bytes32 channelId;   // tag: 1
        address fromLedgerAddress;   // tag: 2
        address toLedgerAddress;   // tag: 3
        uint migrationDeadline;   // tag: 4
    } // end struct ChannelMigrationInfo

    function DECCHANNELMIGRATIONINFO604(bytes memory raw) internal pure returns (ChannelMigrationInfo memory m) {	//inject NONSTANDARD NAMING
        Pb.Buffer memory buf = Pb.FROMBYTES361(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.HASMORE628()) {
            (tag, wire) = buf.DECKEY852();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.channelId = Pb._BYTES32103(buf.DECBYTES532());
            }
            else if (tag == 2) {
                m.fromLedgerAddress = Pb._ADDRESS113(buf.DECBYTES532());
            }
            else if (tag == 3) {
                m.toLedgerAddress = Pb._ADDRESS113(buf.DECBYTES532());
            }
            else if (tag == 4) {
                m.migrationDeadline = uint(buf.DECVARINT478());
            }
            else { buf.SKIPVALUE135(wire); } // skip value of unknown tag
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

// File: contracts/lib/ledgerlib/LedgerBalanceLimit.sol

pragma solidity ^0.5.1;


                                                                                                  
library LedgerBalanceLimit {
                                                                                                                                                                                                                                                           
    function SETBALANCELIMITS25(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        address[] calldata _tokenAddrs,
        uint[] calldata _limits
    )
        external
    {
        require(_tokenAddrs.length == _limits.length, "Lengths do not match");
        for (uint i = 0; i < _tokenAddrs.length; i++) {
            _self.balanceLimits[_tokenAddrs[i]] = _limits[i];
        }
    }

                                                                                                                            
    function DISABLEBALANCELIMITS383(LedgerStruct.Ledger storage _self) external {	//inject NONSTANDARD NAMING
        _self.balanceLimitsEnabled = false;
    }

                                                                                                                           
    function ENABLEBALANCELIMITS719(LedgerStruct.Ledger storage _self) external {	//inject NONSTANDARD NAMING
        _self.balanceLimitsEnabled = true;
    }

                                                                                                                                                                                                           
    function GETBALANCELIMIT497(	//inject NONSTANDARD NAMING
        LedgerStruct.Ledger storage _self,
        address _tokenAddr
    )
        external
        view
        returns(uint)
    {
        return _self.balanceLimits[_tokenAddr];
    }

                                                                                                                                                       
    function GETBALANCELIMITSENABLED806(LedgerStruct.Ledger storage _self) external view returns(bool) {	//inject NONSTANDARD NAMING
        return _self.balanceLimitsEnabled;
    }
}