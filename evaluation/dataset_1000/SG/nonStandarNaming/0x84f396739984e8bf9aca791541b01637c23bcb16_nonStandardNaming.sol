pragma solidity 0.5.4;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

// Dummy contract only used to emit to end-user they are using wrong solc
contract solcChecker {
                                                                                                              function F764(bytes calldata x) external;	//inject NONSTANDARD NAMING
}

contract OraclizeI {

    address public cbAddress;

    function SETPROOFTYPE689(byte _proofType) external;	//inject NONSTANDARD NAMING
    function SETCUSTOMGASPRICE643(uint _gasPrice) external;	//inject NONSTANDARD NAMING
    function GETPRICE435(string memory _datasource) public returns (uint _dsprice);	//inject NONSTANDARD NAMING
    function RANDOMDS_GETSESSIONPUBKEYHASH940() external view returns (bytes32 _sessionKeyHash);	//inject NONSTANDARD NAMING
    function GETPRICE435(string memory _datasource, uint _gasLimit) public returns (uint _dsprice);	//inject NONSTANDARD NAMING
    function QUERYN538(uint _timestamp, string memory _datasource, bytes memory _argN) public payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY713(uint _timestamp, string calldata _datasource, string calldata _arg) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY2197(uint _timestamp, string memory _datasource, string memory _arg1, string memory _arg2) public payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY_WITHGASLIMIT434(uint _timestamp, string calldata _datasource, string calldata _arg, uint _gasLimit) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERYN_WITHGASLIMIT285(uint _timestamp, string calldata _datasource, bytes calldata _argN, uint _gasLimit) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY2_WITHGASLIMIT866(uint _timestamp, string calldata _datasource, string calldata _arg1, string calldata _arg2, uint _gasLimit) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
}

contract OraclizeAddrResolverI {
    function GETADDRESS270() public returns (address _address);	//inject NONSTANDARD NAMING
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
library Buffer {

    struct buffer {
        bytes buf;
        uint capacity;
    }

    function INIT307(buffer memory _buf, uint _capacity) internal pure {	//inject NONSTANDARD NAMING
        uint capacity = _capacity;
        if (capacity % 32 != 0) {
            capacity += 32 - (capacity % 32);
        }
        _buf.capacity = capacity; // Allocate space for the buffer data
        assembly {
            let ptr := mload(0x40)
            mstore(_buf, ptr)
            mstore(ptr, 0)
            mstore(0x40, add(ptr, capacity))
        }
    }

    function RESIZE452(buffer memory _buf, uint _capacity) private pure {	//inject NONSTANDARD NAMING
        bytes memory oldbuf = _buf.buf;
        INIT307(_buf, _capacity);
        APPEND980(_buf, oldbuf);
    }

    function MAX897(uint _a, uint _b) private pure returns (uint _max) {	//inject NONSTANDARD NAMING
        if (_a > _b) {
            return _a;
        }
        return _b;
    }
                                                                                                                                                                                                                                                                                         
    function APPEND980(buffer memory _buf, bytes memory _data) internal pure returns (buffer memory _buffer) {	//inject NONSTANDARD NAMING
        if (_data.length + _buf.buf.length > _buf.capacity) {
            RESIZE452(_buf, MAX897(_buf.capacity, _data.length) * 2);
        }
        uint dest;
        uint src;
        uint len = _data.length;
        assembly {
            let bufptr := mload(_buf) // Memory address of the buffer data
            let buflen := mload(bufptr) // Length of existing buffer data
            dest := add(add(bufptr, buflen), 32) // Start address = buffer address + buffer length + sizeof(buffer length)
            mstore(bufptr, add(buflen, mload(_data))) // Update buffer length
            src := add(_data, 32)
        }
        for(; len >= 32; len -= 32) { // Copy word-length chunks while possible
            assembly {
                mstore(dest, mload(src))
            }
            dest += 32;
            src += 32;
        }
        uint mask = 256 ** (32 - len) - 1; // Copy remaining bytes
        assembly {
            let srcpart := and(mload(src), not(mask))
            let destpart := and(mload(dest), mask)
            mstore(dest, or(destpart, srcpart))
        }
        return _buf;
    }
                                                                                                                                                                                                                                                                                      
    function APPEND980(buffer memory _buf, uint8 _data) internal pure {	//inject NONSTANDARD NAMING
        if (_buf.buf.length + 1 > _buf.capacity) {
            RESIZE452(_buf, _buf.capacity * 2);
        }
        assembly {
            let bufptr := mload(_buf) // Memory address of the buffer data
            let buflen := mload(bufptr) // Length of existing buffer data
            let dest := add(add(bufptr, buflen), 32) // Address = buffer address + buffer length + sizeof(buffer length)
            mstore8(dest, _data)
            mstore(bufptr, add(buflen, 1)) // Update buffer length
        }
    }
                                                                                                                                                                                                                                                                                      
    function APPENDINT121(buffer memory _buf, uint _data, uint _len) internal pure returns (buffer memory _buffer) {	//inject NONSTANDARD NAMING
        if (_len + _buf.buf.length > _buf.capacity) {
            RESIZE452(_buf, MAX897(_buf.capacity, _len) * 2);
        }
        uint mask = 256 ** _len - 1;
        assembly {
            let bufptr := mload(_buf) // Memory address of the buffer data
            let buflen := mload(bufptr) // Length of existing buffer data
            let dest := add(add(bufptr, buflen), _len) // Address = buffer address + buffer length + sizeof(buffer length) + len
            mstore(dest, or(and(mload(dest), not(mask)), _data))
            mstore(bufptr, add(buflen, _len)) // Update buffer length
        }
        return _buf;
    }
}

library CBOR {

    using Buffer for Buffer.buffer;

    uint8 private constant major_type_int449 = 0;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_map49 = 5;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_bytes928 = 2;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_array262 = 4;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_string818 = 3;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_negative_int849 = 1;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_content_free873 = 7;	//inject NONSTANDARD NAMING

    function ENCODETYPE555(Buffer.buffer memory _buf, uint8 _major, uint _value) private pure {	//inject NONSTANDARD NAMING
        if (_value <= 23) {
            _buf.APPEND980(uint8((_major << 5) | _value));
        } else if (_value <= 0xFF) {
            _buf.APPEND980(uint8((_major << 5) | 24));
            _buf.APPENDINT121(_value, 1);
        } else if (_value <= 0xFFFF) {
            _buf.APPEND980(uint8((_major << 5) | 25));
            _buf.APPENDINT121(_value, 2);
        } else if (_value <= 0xFFFFFFFF) {
            _buf.APPEND980(uint8((_major << 5) | 26));
            _buf.APPENDINT121(_value, 4);
        } else if (_value <= 0xFFFFFFFFFFFFFFFF) {
            _buf.APPEND980(uint8((_major << 5) | 27));
            _buf.APPENDINT121(_value, 8);
        }
    }

    function ENCODEINDEFINITELENGTHTYPE124(Buffer.buffer memory _buf, uint8 _major) private pure {	//inject NONSTANDARD NAMING
        _buf.APPEND980(uint8((_major << 5) | 31));
    }

    function ENCODEUINT573(Buffer.buffer memory _buf, uint _value) internal pure {	//inject NONSTANDARD NAMING
        ENCODETYPE555(_buf, major_type_int449, _value);
    }

    function ENCODEINT507(Buffer.buffer memory _buf, int _value) internal pure {	//inject NONSTANDARD NAMING
        if (_value >= 0) {
            ENCODETYPE555(_buf, major_type_int449, uint(_value));
        } else {
            ENCODETYPE555(_buf, major_type_negative_int849, uint(-1 - _value));
        }
    }

    function ENCODEBYTES505(Buffer.buffer memory _buf, bytes memory _value) internal pure {	//inject NONSTANDARD NAMING
        ENCODETYPE555(_buf, major_type_bytes928, _value.length);
        _buf.APPEND980(_value);
    }

    function ENCODESTRING623(Buffer.buffer memory _buf, string memory _value) internal pure {	//inject NONSTANDARD NAMING
        ENCODETYPE555(_buf, major_type_string818, bytes(_value).length);
        _buf.APPEND980(bytes(_value));
    }

    function STARTARRAY255(Buffer.buffer memory _buf) internal pure {	//inject NONSTANDARD NAMING
        ENCODEINDEFINITELENGTHTYPE124(_buf, major_type_array262);
    }

    function STARTMAP978(Buffer.buffer memory _buf) internal pure {	//inject NONSTANDARD NAMING
        ENCODEINDEFINITELENGTHTYPE124(_buf, major_type_map49);
    }

    function ENDSEQUENCE334(Buffer.buffer memory _buf) internal pure {	//inject NONSTANDARD NAMING
        ENCODEINDEFINITELENGTHTYPE124(_buf, major_type_content_free873);
    }
}
                            
contract usingOraclize {

    using CBOR for Buffer.buffer;

    OraclizeI oraclize;
    OraclizeAddrResolverI OAR;

    uint constant day825 = 60 * 60 * 24;	//inject NONSTANDARD NAMING
    uint constant week913 = 60 * 60 * 24 * 7;	//inject NONSTANDARD NAMING
    uint constant month922 = 60 * 60 * 24 * 30;	//inject NONSTANDARD NAMING

    byte constant prooftype_none698 = 0x00;	//inject NONSTANDARD NAMING
    byte constant prooftype_ledger121 = 0x30;	//inject NONSTANDARD NAMING
    byte constant prooftype_native922 = 0xF0;	//inject NONSTANDARD NAMING
    byte constant proofstorage_ipfs99 = 0x01;	//inject NONSTANDARD NAMING
    byte constant prooftype_android885 = 0x40;	//inject NONSTANDARD NAMING
    byte constant prooftype_tlsnotary134 = 0x10;	//inject NONSTANDARD NAMING

    string oraclize_network_name;
    uint8 constant networkid_auto260 = 0;	//inject NONSTANDARD NAMING
    uint8 constant networkid_morden426 = 2;	//inject NONSTANDARD NAMING
    uint8 constant networkid_mainnet868 = 1;	//inject NONSTANDARD NAMING
    uint8 constant networkid_testnet103 = 2;	//inject NONSTANDARD NAMING
    uint8 constant networkid_consensys170 = 161;	//inject NONSTANDARD NAMING

    mapping(bytes32 => bytes32) oraclize_randomDS_args;
    mapping(bytes32 => bool) oraclize_randomDS_sessionKeysHashVerified;

    modifier ORACLIZEAPI691 {	//inject NONSTANDARD NAMING
        if ((address(OAR) == address(0)) || (GETCODESIZE616(address(OAR)) == 0)) {
            ORACLIZE_SETNETWORK470(networkid_auto260);
        }
        if (address(oraclize) != OAR.GETADDRESS270()) {
            oraclize = OraclizeI(OAR.GETADDRESS270());
        }
        _;
    }

    modifier ORACLIZE_RANDOMDS_PROOFVERIFY703(bytes32 _queryId, string memory _result, bytes memory _proof) {	//inject NONSTANDARD NAMING
        // RandomDS Proof Step 1: The prefix has to match 'LP\x01' (Ledger Proof version 1)
        require((_proof[0] == "L") && (_proof[1] == "P") && (uint8(_proof[2]) == uint8(1)));
        bool proofVerified = ORACLIZE_RANDOMDS_PROOFVERIFY__MAIN433(_proof, _queryId, bytes(_result), ORACLIZE_GETNETWORKNAME349());
        require(proofVerified);
        _;
    }

    function ORACLIZE_SETNETWORK470(uint8 _networkID) internal returns (bool _networkSet) {	//inject NONSTANDARD NAMING
      return ORACLIZE_SETNETWORK470();
      _networkID; // silence the warning and remain backwards compatible
    }

    function ORACLIZE_SETNETWORKNAME901(string memory _network_name) internal {	//inject NONSTANDARD NAMING
        oraclize_network_name = _network_name;
    }

    function ORACLIZE_GETNETWORKNAME349() internal view returns (string memory _networkName) {	//inject NONSTANDARD NAMING
        return oraclize_network_name;
    }

    function ORACLIZE_SETNETWORK470() internal returns (bool _networkSet) {	//inject NONSTANDARD NAMING
        if (GETCODESIZE616(0x1d3B2638a7cC9f2CB3D298A3DA7a90B67E5506ed) > 0) { //mainnet
            OAR = OraclizeAddrResolverI(0x1d3B2638a7cC9f2CB3D298A3DA7a90B67E5506ed);
            ORACLIZE_SETNETWORKNAME901("eth_mainnet");
            return true;
        }
        if (GETCODESIZE616(0xc03A2615D5efaf5F49F60B7BB6583eaec212fdf1) > 0) { //ropsten testnet
            OAR = OraclizeAddrResolverI(0xc03A2615D5efaf5F49F60B7BB6583eaec212fdf1);
            ORACLIZE_SETNETWORKNAME901("eth_ropsten3");
            return true;
        }
        if (GETCODESIZE616(0xB7A07BcF2Ba2f2703b24C0691b5278999C59AC7e) > 0) { //kovan testnet
            OAR = OraclizeAddrResolverI(0xB7A07BcF2Ba2f2703b24C0691b5278999C59AC7e);
            ORACLIZE_SETNETWORKNAME901("eth_kovan");
            return true;
        }
        if (GETCODESIZE616(0x146500cfd35B22E4A392Fe0aDc06De1a1368Ed48) > 0) { //rinkeby testnet
            OAR = OraclizeAddrResolverI(0x146500cfd35B22E4A392Fe0aDc06De1a1368Ed48);
            ORACLIZE_SETNETWORKNAME901("eth_rinkeby");
            return true;
        }
        if (GETCODESIZE616(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475) > 0) { //ethereum-bridge
            OAR = OraclizeAddrResolverI(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475);
            return true;
        }
        if (GETCODESIZE616(0x20e12A1F859B3FeaE5Fb2A0A32C18F5a65555bBF) > 0) { //ether.camp ide
            OAR = OraclizeAddrResolverI(0x20e12A1F859B3FeaE5Fb2A0A32C18F5a65555bBF);
            return true;
        }
        if (GETCODESIZE616(0x51efaF4c8B3C9AfBD5aB9F4bbC82784Ab6ef8fAA) > 0) { //browser-solidity
            OAR = OraclizeAddrResolverI(0x51efaF4c8B3C9AfBD5aB9F4bbC82784Ab6ef8fAA);
            return true;
        }
        return false;
    }

    function __CALLBACK479(bytes32 _myid, string memory _result) public {	//inject NONSTANDARD NAMING
        __CALLBACK479(_myid, _result, new bytes(0));
    }

    function __CALLBACK479(bytes32 _myid, string memory _result, bytes memory _proof) public {	//inject NONSTANDARD NAMING
      return;
      _myid; _result; _proof; // Silence compiler warnings
    }

    function ORACLIZE_GETPRICE470(string memory _datasource) ORACLIZEAPI691 internal returns (uint _queryPrice) {	//inject NONSTANDARD NAMING
        return oraclize.GETPRICE435(_datasource);
    }

    function ORACLIZE_GETPRICE470(string memory _datasource, uint _gasLimit) ORACLIZEAPI691 internal returns (uint _queryPrice) {	//inject NONSTANDARD NAMING
        return oraclize.GETPRICE435(_datasource, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string memory _arg) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY713.value(price)(0, _datasource, _arg);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string memory _arg) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY713.value(price)(_timestamp, _datasource, _arg);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string memory _arg, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource,_gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY_WITHGASLIMIT434.value(price)(_timestamp, _datasource, _arg, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string memory _arg, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
           return 0; // Unexpectedly high price
        }
        return oraclize.QUERY_WITHGASLIMIT434.value(price)(0, _datasource, _arg, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string memory _arg1, string memory _arg2) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY2197.value(price)(0, _datasource, _arg1, _arg2);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string memory _arg1, string memory _arg2) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY2197.value(price)(_timestamp, _datasource, _arg1, _arg2);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string memory _arg1, string memory _arg2, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY2_WITHGASLIMIT866.value(price)(_timestamp, _datasource, _arg1, _arg2, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string memory _arg1, string memory _arg2, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY2_WITHGASLIMIT866.value(price)(0, _datasource, _arg1, _arg2, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[] memory _argN) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = STRA2CBOR232(_argN);
        return oraclize.QUERYN538.value(price)(0, _datasource, args);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[] memory _argN) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = STRA2CBOR232(_argN);
        return oraclize.QUERYN538.value(price)(_timestamp, _datasource, args);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[] memory _argN, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = STRA2CBOR232(_argN);
        return oraclize.QUERYN_WITHGASLIMIT285.value(price)(_timestamp, _datasource, args, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[] memory _argN, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = STRA2CBOR232(_argN);
        return oraclize.QUERYN_WITHGASLIMIT285.value(price)(0, _datasource, args, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[1] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY1(_datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[1] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[1] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[1] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY1(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[2] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY1(_datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[2] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[2] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[2] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY1(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[3] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY1(_datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[3] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[3] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[3] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY1(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[4] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY1(_datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[4] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[4] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[4] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY1(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[5] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY1(_datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[5] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, string[5] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, string[5] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY1(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[] memory _argN) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = BA2CBOR926(_argN);
        return oraclize.QUERYN538.value(price)(0, _datasource, args);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[] memory _argN) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = BA2CBOR926(_argN);
        return oraclize.QUERYN538.value(price)(_timestamp, _datasource, args);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[] memory _argN, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = BA2CBOR926(_argN);
        return oraclize.QUERYN_WITHGASLIMIT285.value(price)(_timestamp, _datasource, args, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[] memory _argN, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE435(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = BA2CBOR926(_argN);
        return oraclize.QUERYN_WITHGASLIMIT285.value(price)(0, _datasource, args, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[1] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY1(_datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[1] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[1] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[1] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY1(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[2] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY1(_datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[2] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[2] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[2] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY1(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[3] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY1(_datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[3] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[3] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[3] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY1(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[4] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY1(_datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[4] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[4] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[4] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY1(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[5] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY1(_datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[5] memory _args) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY1(uint _timestamp, string memory _datasource, bytes[5] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY1(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY1(string memory _datasource, bytes[5] memory _args, uint _gasLimit) ORACLIZEAPI691 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY1(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_SETPROOF574(byte _proofP) ORACLIZEAPI691 internal {	//inject NONSTANDARD NAMING
        return oraclize.SETPROOFTYPE689(_proofP);
    }


    function ORACLIZE_CBADDRESS916() ORACLIZEAPI691 internal returns (address _callbackAddress) {	//inject NONSTANDARD NAMING
        return oraclize.cbAddress();
    }

    function GETCODESIZE616(address _addr) view internal returns (uint _size) {	//inject NONSTANDARD NAMING
        assembly {
            _size := extcodesize(_addr)
        }
    }

    function ORACLIZE_SETCUSTOMGASPRICE109(uint _gasPrice) ORACLIZEAPI691 internal {	//inject NONSTANDARD NAMING
        return oraclize.SETCUSTOMGASPRICE643(_gasPrice);
    }

    function ORACLIZE_RANDOMDS_GETSESSIONPUBKEYHASH501() ORACLIZEAPI691 internal returns (bytes32 _sessionKeyHash) {	//inject NONSTANDARD NAMING
        return oraclize.RANDOMDS_GETSESSIONPUBKEYHASH940();
    }

    function PARSEADDR16(string memory _a) internal pure returns (address _parsedAddress) {	//inject NONSTANDARD NAMING
        bytes memory tmp = bytes(_a);
        uint160 iaddr = 0;
        uint160 b1;
        uint160 b2;
        for (uint i = 2; i < 2 + 2 * 20; i += 2) {
            iaddr *= 256;
            b1 = uint160(uint8(tmp[i]));
            b2 = uint160(uint8(tmp[i + 1]));
            if ((b1 >= 97) && (b1 <= 102)) {
                b1 -= 87;
            } else if ((b1 >= 65) && (b1 <= 70)) {
                b1 -= 55;
            } else if ((b1 >= 48) && (b1 <= 57)) {
                b1 -= 48;
            }
            if ((b2 >= 97) && (b2 <= 102)) {
                b2 -= 87;
            } else if ((b2 >= 65) && (b2 <= 70)) {
                b2 -= 55;
            } else if ((b2 >= 48) && (b2 <= 57)) {
                b2 -= 48;
            }
            iaddr += (b1 * 16 + b2);
        }
        return address(iaddr);
    }

    function STRCOMPARE830(string memory _a, string memory _b) internal pure returns (int _returnCode) {	//inject NONSTANDARD NAMING
        bytes memory a = bytes(_a);
        bytes memory b = bytes(_b);
        uint minLength = a.length;
        if (b.length < minLength) {
            minLength = b.length;
        }
        for (uint i = 0; i < minLength; i ++) {
            if (a[i] < b[i]) {
                return -1;
            } else if (a[i] > b[i]) {
                return 1;
            }
        }
        if (a.length < b.length) {
            return -1;
        } else if (a.length > b.length) {
            return 1;
        } else {
            return 0;
        }
    }

    function INDEXOF510(string memory _haystack, string memory _needle) internal pure returns (int _returnCode) {	//inject NONSTANDARD NAMING
        bytes memory h = bytes(_haystack);
        bytes memory n = bytes(_needle);
        if (h.length < 1 || n.length < 1 || (n.length > h.length)) {
            return -1;
        } else if (h.length > (2 ** 128 - 1)) {
            return -1;
        } else {
            uint subindex = 0;
            for (uint i = 0; i < h.length; i++) {
                if (h[i] == n[0]) {
                    subindex = 1;
                    while(subindex < n.length && (i + subindex) < h.length && h[i + subindex] == n[subindex]) {
                        subindex++;
                    }
                    if (subindex == n.length) {
                        return int(i);
                    }
                }
            }
            return -1;
        }
    }

    function STRCONCAT697(string memory _a, string memory _b) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
        return STRCONCAT697(_a, _b, "", "", "");
    }

    function STRCONCAT697(string memory _a, string memory _b, string memory _c) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
        return STRCONCAT697(_a, _b, _c, "", "");
    }

    function STRCONCAT697(string memory _a, string memory _b, string memory _c, string memory _d) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
        return STRCONCAT697(_a, _b, _c, _d, "");
    }

    function STRCONCAT697(string memory _a, string memory _b, string memory _c, string memory _d, string memory _e) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);
        bytes memory _bd = bytes(_d);
        bytes memory _be = bytes(_e);
        string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
        bytes memory babcde = bytes(abcde);
        uint k = 0;
        uint i = 0;
        for (i = 0; i < _ba.length; i++) {
            babcde[k++] = _ba[i];
        }
        for (i = 0; i < _bb.length; i++) {
            babcde[k++] = _bb[i];
        }
        for (i = 0; i < _bc.length; i++) {
            babcde[k++] = _bc[i];
        }
        for (i = 0; i < _bd.length; i++) {
            babcde[k++] = _bd[i];
        }
        for (i = 0; i < _be.length; i++) {
            babcde[k++] = _be[i];
        }
        return string(babcde);
    }

    function SAFEPARSEINT974(string memory _a) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
        return SAFEPARSEINT974(_a, 0);
    }

    function SAFEPARSEINT974(string memory _a, uint _b) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
        bytes memory bresult = bytes(_a);
        uint mint = 0;
        bool decimals = false;
        for (uint i = 0; i < bresult.length; i++) {
            if ((uint(uint8(bresult[i])) >= 48) && (uint(uint8(bresult[i])) <= 57)) {
                if (decimals) {
                   if (_b == 0) break;
                    else _b--;
                }
                mint *= 10;
                mint += uint(uint8(bresult[i])) - 48;
            } else if (uint(uint8(bresult[i])) == 46) {
                require(!decimals, 'More than one decimal encountered in string!');
                decimals = true;
            } else {
                revert("Non-numeral character encountered in string!");
            }
        }
        if (_b > 0) {
            mint *= 10 ** _b;
        }
        return mint;
    }

    function PARSEINT592(string memory _a) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
        return PARSEINT592(_a, 0);
    }

    function PARSEINT592(string memory _a, uint _b) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
        bytes memory bresult = bytes(_a);
        uint mint = 0;
        bool decimals = false;
        for (uint i = 0; i < bresult.length; i++) {
            if ((uint(uint8(bresult[i])) >= 48) && (uint(uint8(bresult[i])) <= 57)) {
                if (decimals) {
                   if (_b == 0) {
                       break;
                   } else {
                       _b--;
                   }
                }
                mint *= 10;
                mint += uint(uint8(bresult[i])) - 48;
            } else if (uint(uint8(bresult[i])) == 46) {
                decimals = true;
            }
        }
        if (_b > 0) {
            mint *= 10 ** _b;
        }
        return mint;
    }

    function UINT2STR150(uint _i) internal pure returns (string memory _uintAsString) {	//inject NONSTANDARD NAMING
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }

    function STRA2CBOR232(string[] memory _arr) internal pure returns (bytes memory _cborEncoding) {	//inject NONSTANDARD NAMING
        SAFEMEMORYCLEANER45();
        Buffer.buffer memory buf;
        Buffer.INIT307(buf, 1024);
        buf.STARTARRAY255();
        for (uint i = 0; i < _arr.length; i++) {
            buf.ENCODESTRING623(_arr[i]);
        }
        buf.ENDSEQUENCE334();
        return buf.buf;
    }

    function BA2CBOR926(bytes[] memory _arr) internal pure returns (bytes memory _cborEncoding) {	//inject NONSTANDARD NAMING
        SAFEMEMORYCLEANER45();
        Buffer.buffer memory buf;
        Buffer.INIT307(buf, 1024);
        buf.STARTARRAY255();
        for (uint i = 0; i < _arr.length; i++) {
            buf.ENCODEBYTES505(_arr[i]);
        }
        buf.ENDSEQUENCE334();
        return buf.buf;
    }

    function ORACLIZE_NEWRANDOMDSQUERY505(uint _delay, uint _nbytes, uint _customGasLimit) internal returns (bytes32 _queryId) {	//inject NONSTANDARD NAMING
        require((_nbytes > 0) && (_nbytes <= 32));
        _delay *= 10; // Convert from seconds to ledger timer ticks
        bytes memory nbytes = new bytes(1);
        nbytes[0] = byte(uint8(_nbytes));
        bytes memory unonce = new bytes(32);
        bytes memory sessionKeyHash = new bytes(32);
        bytes32 sessionKeyHash_bytes32 = ORACLIZE_RANDOMDS_GETSESSIONPUBKEYHASH501();
        assembly {
            mstore(unonce, 0x20)
                                                                                                                                                                                                                                                                 
            mstore(add(unonce, 0x20), xor(blockhash(sub(number, 1)), xor(coinbase, timestamp)))
            mstore(sessionKeyHash, 0x20)
            mstore(add(sessionKeyHash, 0x20), sessionKeyHash_bytes32)
        }
        bytes memory delay = new bytes(32);
        assembly {
            mstore(add(delay, 0x20), _delay)
        }
        bytes memory delay_bytes8 = new bytes(8);
        COPYBYTES370(delay, 24, 8, delay_bytes8, 0);
        bytes[4] memory args = [unonce, nbytes, sessionKeyHash, delay];
        bytes32 queryId = ORACLIZE_QUERY1("random", args, _customGasLimit);
        bytes memory delay_bytes8_left = new bytes(8);
        assembly {
            let x := mload(add(delay_bytes8, 0x20))
            mstore8(add(delay_bytes8_left, 0x27), div(x, 0x100000000000000000000000000000000000000000000000000000000000000))
            mstore8(add(delay_bytes8_left, 0x26), div(x, 0x1000000000000000000000000000000000000000000000000000000000000))
            mstore8(add(delay_bytes8_left, 0x25), div(x, 0x10000000000000000000000000000000000000000000000000000000000))
            mstore8(add(delay_bytes8_left, 0x24), div(x, 0x100000000000000000000000000000000000000000000000000000000))
            mstore8(add(delay_bytes8_left, 0x23), div(x, 0x1000000000000000000000000000000000000000000000000000000))
            mstore8(add(delay_bytes8_left, 0x22), div(x, 0x10000000000000000000000000000000000000000000000000000))
            mstore8(add(delay_bytes8_left, 0x21), div(x, 0x100000000000000000000000000000000000000000000000000))
            mstore8(add(delay_bytes8_left, 0x20), div(x, 0x1000000000000000000000000000000000000000000000000))
        }
        ORACLIZE_RANDOMDS_SETCOMMITMENT518(queryId, keccak256(abi.encodePacked(delay_bytes8_left, args[1], sha256(args[0]), args[2])));
        return queryId;
    }

    function ORACLIZE_RANDOMDS_SETCOMMITMENT518(bytes32 _queryId, bytes32 _commitment) internal {	//inject NONSTANDARD NAMING
        oraclize_randomDS_args[_queryId] = _commitment;
    }

    function VERIFYSIG26(bytes32 _tosignh, bytes memory _dersig, bytes memory _pubkey) internal returns (bool _sigVerified) {	//inject NONSTANDARD NAMING
        bool sigok;
        address signer;
        bytes32 sigr;
        bytes32 sigs;
        bytes memory sigr_ = new bytes(32);
        uint offset = 4 + (uint(uint8(_dersig[3])) - 0x20);
        sigr_ = COPYBYTES370(_dersig, offset, 32, sigr_, 0);
        bytes memory sigs_ = new bytes(32);
        offset += 32 + 2;
        sigs_ = COPYBYTES370(_dersig, offset + (uint(uint8(_dersig[offset - 1])) - 0x20), 32, sigs_, 0);
        assembly {
            sigr := mload(add(sigr_, 32))
            sigs := mload(add(sigs_, 32))
        }
        (sigok, signer) = SAFER_ECRECOVER424(_tosignh, 27, sigr, sigs);
        if (address(uint160(uint256(keccak256(_pubkey)))) == signer) {
            return true;
        } else {
            (sigok, signer) = SAFER_ECRECOVER424(_tosignh, 28, sigr, sigs);
            return (address(uint160(uint256(keccak256(_pubkey)))) == signer);
        }
    }

    function ORACLIZE_RANDOMDS_PROOFVERIFY__SESSIONKEYVALIDITY869(bytes memory _proof, uint _sig2offset) internal returns (bool _proofVerified) {	//inject NONSTANDARD NAMING
        bool sigok;
        // Random DS Proof Step 6: Verify the attestation signature, APPKEY1 must sign the sessionKey from the correct ledger app (CODEHASH)
        bytes memory sig2 = new bytes(uint(uint8(_proof[_sig2offset + 1])) + 2);
        COPYBYTES370(_proof, _sig2offset, sig2.length, sig2, 0);
        bytes memory appkey1_pubkey = new bytes(64);
        COPYBYTES370(_proof, 3 + 1, 64, appkey1_pubkey, 0);
        bytes memory tosign2 = new bytes(1 + 65 + 32);
        tosign2[0] = byte(uint8(1)); //role
        COPYBYTES370(_proof, _sig2offset - 65, 65, tosign2, 1);
        bytes memory CODEHASH = hex"fd94fa71bc0ba10d39d464d0d8f465efeef0a2764e3887fcc9df41ded20f505c";
        COPYBYTES370(CODEHASH, 0, 32, tosign2, 1 + 65);
        sigok = VERIFYSIG26(sha256(tosign2), sig2, appkey1_pubkey);
        if (!sigok) {
            return false;
        }
        // Random DS Proof Step 7: Verify the APPKEY1 provenance (must be signed by Ledger)
        bytes memory LEDGERKEY = hex"7fb956469c5c9b89840d55b43537e66a98dd4811ea0a27224272c2e5622911e8537a2f8e86a46baec82864e98dd01e9ccc2f8bc5dfc9cbe5a91a290498dd96e4";
        bytes memory tosign3 = new bytes(1 + 65);
        tosign3[0] = 0xFE;
        COPYBYTES370(_proof, 3, 65, tosign3, 1);
        bytes memory sig3 = new bytes(uint(uint8(_proof[3 + 65 + 1])) + 2);
        COPYBYTES370(_proof, 3 + 65, sig3.length, sig3, 0);
        sigok = VERIFYSIG26(sha256(tosign3), sig3, LEDGERKEY);
        return sigok;
    }

    function ORACLIZE_RANDOMDS_PROOFVERIFY__RETURNCODE787(bytes32 _queryId, string memory _result, bytes memory _proof) internal returns (uint8 _returnCode) {	//inject NONSTANDARD NAMING
        // Random DS Proof Step 1: The prefix has to match 'LP\x01' (Ledger Proof version 1)
        if ((_proof[0] != "L") || (_proof[1] != "P") || (uint8(_proof[2]) != uint8(1))) {
            return 1;
        }
        bool proofVerified = ORACLIZE_RANDOMDS_PROOFVERIFY__MAIN433(_proof, _queryId, bytes(_result), ORACLIZE_GETNETWORKNAME349());
        if (!proofVerified) {
            return 2;
        }
        return 0;
    }

    function MATCHBYTES32PREFIX665(bytes32 _content, bytes memory _prefix, uint _nRandomBytes) internal pure returns (bool _matchesPrefix) {	//inject NONSTANDARD NAMING
        bool match_ = true;
        require(_prefix.length == _nRandomBytes);
        for (uint256 i = 0; i< _nRandomBytes; i++) {
            if (_content[i] != _prefix[i]) {
                match_ = false;
            }
        }
        return match_;
    }

    function ORACLIZE_RANDOMDS_PROOFVERIFY__MAIN433(bytes memory _proof, bytes32 _queryId, bytes memory _result, string memory _contextName) internal returns (bool _proofVerified) {	//inject NONSTANDARD NAMING
        // Random DS Proof Step 2: The unique keyhash has to match with the sha256 of (context name + _queryId)
        uint ledgerProofLength = 3 + 65 + (uint(uint8(_proof[3 + 65 + 1])) + 2) + 32;
        bytes memory keyhash = new bytes(32);
        COPYBYTES370(_proof, ledgerProofLength, 32, keyhash, 0);
        if (!(keccak256(keyhash) == keccak256(abi.encodePacked(sha256(abi.encodePacked(_contextName, _queryId)))))) {
            return false;
        }
        bytes memory sig1 = new bytes(uint(uint8(_proof[ledgerProofLength + (32 + 8 + 1 + 32) + 1])) + 2);
        COPYBYTES370(_proof, ledgerProofLength + (32 + 8 + 1 + 32), sig1.length, sig1, 0);
        // Random DS Proof Step 3: We assume sig1 is valid (it will be verified during step 5) and we verify if '_result' is the _prefix of sha256(sig1)
        if (!MATCHBYTES32PREFIX665(sha256(sig1), _result, uint(uint8(_proof[ledgerProofLength + 32 + 8])))) {
            return false;
        }
        // Random DS Proof Step 4: Commitment match verification, keccak256(delay, nbytes, unonce, sessionKeyHash) == commitment in storage.
        // This is to verify that the computed args match with the ones specified in the query.
        bytes memory commitmentSlice1 = new bytes(8 + 1 + 32);
        COPYBYTES370(_proof, ledgerProofLength + 32, 8 + 1 + 32, commitmentSlice1, 0);
        bytes memory sessionPubkey = new bytes(64);
        uint sig2offset = ledgerProofLength + 32 + (8 + 1 + 32) + sig1.length + 65;
        COPYBYTES370(_proof, sig2offset - 64, 64, sessionPubkey, 0);
        bytes32 sessionPubkeyHash = sha256(sessionPubkey);
        if (oraclize_randomDS_args[_queryId] == keccak256(abi.encodePacked(commitmentSlice1, sessionPubkeyHash))) { //unonce, nbytes and sessionKeyHash match
            delete oraclize_randomDS_args[_queryId];
        } else return false;
        // Random DS Proof Step 5: Validity verification for sig1 (keyhash and args signed with the sessionKey)
        bytes memory tosign1 = new bytes(32 + 8 + 1 + 32);
        COPYBYTES370(_proof, ledgerProofLength, 32 + 8 + 1 + 32, tosign1, 0);
        if (!VERIFYSIG26(sha256(tosign1), sig1, sessionPubkey)) {
            return false;
        }
        // Verify if sessionPubkeyHash was verified already, if not.. let's do it!
        if (!oraclize_randomDS_sessionKeysHashVerified[sessionPubkeyHash]) {
            oraclize_randomDS_sessionKeysHashVerified[sessionPubkeyHash] = ORACLIZE_RANDOMDS_PROOFVERIFY__SESSIONKEYVALIDITY869(_proof, sig2offset);
        }
        return oraclize_randomDS_sessionKeysHashVerified[sessionPubkeyHash];
    }
                                                                                                                                 
    function COPYBYTES370(bytes memory _from, uint _fromOffset, uint _length, bytes memory _to, uint _toOffset) internal pure returns (bytes memory _copiedBytes) {	//inject NONSTANDARD NAMING
        uint minLength = _length + _toOffset;
        require(_to.length >= minLength); // Buffer too small. Should be a better way?
        uint i = 32 + _fromOffset; // NOTE: the offset 32 is added to skip the `size` field of both bytes variables
        uint j = 32 + _toOffset;
        while (i < (32 + _fromOffset + _length)) {
            assembly {
                let tmp := mload(add(_from, i))
                mstore(add(_to, j), tmp)
            }
            i += 32;
            j += 32;
        }
        return _to;
    }
                                                                                                                                                                                                         
    function SAFER_ECRECOVER424(bytes32 _hash, uint8 _v, bytes32 _r, bytes32 _s) internal returns (bool _success, address _recoveredAddress) {	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                                                                                                                                                         
        bool ret;
        address addr;
        assembly {
            let size := mload(0x40)
            mstore(size, _hash)
            mstore(add(size, 32), _v)
            mstore(add(size, 64), _r)
            mstore(add(size, 96), _s)
            ret := call(3000, 1, 0, size, 128, size, 32) // NOTE: we can reuse the request memory because we deal with the return code.
            addr := mload(size)
        }
        return (ret, addr);
    }
                                                                                                                                 
    function ECRECOVERY323(bytes32 _hash, bytes memory _sig) internal returns (bool _success, address _recoveredAddress) {	//inject NONSTANDARD NAMING
        bytes32 r;
        bytes32 s;
        uint8 v;
        if (_sig.length != 65) {
            return (false, address(0));
        }
                                                                                                                                                                             
        assembly {
            r := mload(add(_sig, 32))
            s := mload(add(_sig, 64))
                                                                                                                                                                                                                                           
            v := byte(0, mload(add(_sig, 96)))
                                                                                                                                                                                                                                           
        }
                                                                                                                                                                                                                                                                                                             
        if (v < 27) {
            v += 27;
        }
        if (v != 27 && v != 28) {
            return (false, address(0));
        }
        return SAFER_ECRECOVER424(_hash, v, r, s);
    }

    function SAFEMEMORYCLEANER45() internal pure {	//inject NONSTANDARD NAMING
        assembly {
            let fmem := mload(0x40)
            codecopy(fmem, codesize, sub(msize, fmem))
        }
    }
}
                      


contract Ownable {
    address public owner;
    address public pendingOwner;

    event OWNERSHIPTRANSFERRED433(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                               
    modifier ONLYOWNER495() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                 
    modifier ONLYPENDINGOWNER822() {	//inject NONSTANDARD NAMING
        require(msg.sender == pendingOwner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

                                                                                                                                                  
    function TRANSFEROWNERSHIP42(address newOwner) ONLYOWNER495 public {	//inject NONSTANDARD NAMING
        pendingOwner = newOwner;
    }

                                                                                     
    function CLAIMOWNERSHIP137() ONLYPENDINGOWNER822 public {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED433(owner, pendingOwner);
        owner = pendingOwner;
        pendingOwner = address(0);
    }
}


contract Manageable is Ownable {
    mapping(address => bool) public listOfManagers;

    modifier ONLYMANAGER644() {	//inject NONSTANDARD NAMING
        require(listOfManagers[msg.sender], "");
        _;
    }

    function ADDMANAGER32(address _manager) public ONLYOWNER495 returns (bool success) {	//inject NONSTANDARD NAMING
        if (!listOfManagers[_manager]) {
            require(_manager != address(0), "");
            listOfManagers[_manager] = true;
            success = true;
        }
    }

    function REMOVEMANAGER89(address _manager) public ONLYOWNER495 returns (bool success) {	//inject NONSTANDARD NAMING
        if (listOfManagers[_manager]) {
            listOfManagers[_manager] = false;
            success = true;
        }
    }

    function GETINFO70(address _manager) public view returns (bool) {	//inject NONSTANDARD NAMING
        return listOfManagers[_manager];
    }
}


                                                                                        
interface IERC20 {
    function TOTALSUPPLY532() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF967(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE787(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER681(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE800(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM817(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function MINT161(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER871(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL334(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}



contract Sale is Ownable, usingOraclize {
    using SafeMath for uint256;

    string public url = "json(https://api.etherscan.io/api?module=stats&action=ethprice&apikey=91DFNHV3CJDJE12PG4DD66FUZEK71TC6NW).result.ethusd";

    IERC20 public token;

    address payable public wallet;
    uint256 public rate;
    uint256 public usdRaised;

    uint public lastCallbackTimestamp;
    uint public minTimeUpdate = 600; // 10 min in sec

    uint public gasLimit = 150000;
    uint public timeout = 86400; // 1 day in sec

    event NEWORACLIZEQUERY450(string description);	//inject NONSTANDARD NAMING
    event NEWPRICE539(uint price);	//inject NONSTANDARD NAMING
    event CALLBACKISFAILED724(address lottery, bytes32 queryId);	//inject NONSTANDARD NAMING

    event TOKENPURCHASE275(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);	//inject NONSTANDARD NAMING

    constructor(uint256 _rate, address payable _wallet, address _token) public {
        require(_rate != 0);
        require(_token != address(0));
        require(_wallet != address(0));

        rate = _rate;
        token = IERC20(_token);
        wallet = _wallet;

    }

    function () external payable {
        BUYTOKENS753(msg.sender);
    }

    function SENDETH775() public payable {	//inject NONSTANDARD NAMING

    }

    function BUYTOKENS753(address _beneficiary) public payable {	//inject NONSTANDARD NAMING
        uint256 weiAmount = msg.value;
        require(_beneficiary != address(0));
        require(weiAmount != 0);

        // calculate token amount to be created
        uint256 tokensAmount = CHECKTOKENSAMOUNT930(weiAmount);

        usdRaised = usdRaised.ADD388(weiAmount.MUL808(rate).DIV263(10**18));

        token.MINT161(_beneficiary, tokensAmount);

        wallet.transfer(msg.value);
        emit TOKENPURCHASE275(
            msg.sender,
            _beneficiary,
            weiAmount,
            tokensAmount
        );
    }

    function CHECKTOKENSAMOUNT930(uint _weiAmount) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _weiAmount.MUL808(rate).DIV263(100).MUL808(1000).DIV263(GETPRICE435()).DIV263(10**18).MUL808(10**18);
    }

                                                                                                                                  
    function RECLAIMTOKEN789(IERC20 _token) external ONLYOWNER495 {	//inject NONSTANDARD NAMING
        uint256 balance = _token.BALANCEOF967(address(this));
        _token.TRANSFER681(owner, balance);
    }

    function __CALLBACK479(bytes32 _queryId, string memory  _result) public {	//inject NONSTANDARD NAMING
        require(msg.sender == ORACLIZE_CBADDRESS916());
        require(now > lastCallbackTimestamp + minTimeUpdate);
        rate = PARSEINT592(_result, 2);
        emit NEWPRICE539(rate);
        lastCallbackTimestamp = now;
        UPDATE515();
        _queryId;
    }

    function SETURL335(string memory _url) public ONLYOWNER495 {	//inject NONSTANDARD NAMING
        url = _url;
    }

    function UPDATE515() public payable {	//inject NONSTANDARD NAMING
        require(msg.sender == ORACLIZE_CBADDRESS916() || msg.sender == address(owner));

        if (ORACLIZE_GETPRICE470("URL", gasLimit) > address(this).balance) {
            emit NEWORACLIZEQUERY450("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            emit NEWORACLIZEQUERY450("Oraclize query was sent, standing by for the answer..");
            ORACLIZE_QUERY1(
                timeout,
                "URL",
                url,
                gasLimit
            );
        }
    }

    function GETPRICE435() public view returns (uint) {	//inject NONSTANDARD NAMING
        if (usdRaised >= 10000000000) return 1000;
        uint startPrice = 2;
        uint step = 10000000;
        return startPrice.ADD388(usdRaised.DIV263(step));
    }

    function WITHDRAWETH358(address payable _to, uint _amount) public ONLYOWNER495 {	//inject NONSTANDARD NAMING
        require(_to != address(0));

        address(_to).transfer(_amount);
    }

    function CHANGEWALLET382(address payable _wallet) public ONLYOWNER495 {	//inject NONSTANDARD NAMING
        require(_wallet != address(0));
        wallet = _wallet;
    }

    function SETTIMEOUT313(uint _timeout) public ONLYOWNER495 {	//inject NONSTANDARD NAMING
        timeout = _timeout;
    }

    function SETGASLIMIT874(uint _gasLimit) public ONLYOWNER495 {	//inject NONSTANDARD NAMING
        gasLimit = _gasLimit;
    }

}

                                                                                         
library SafeMath {

                                                                     
    function MUL808(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

                                                                                   
    function DIV263(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

                                                                                                                 
    function SUB987(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

                                                               
    function ADD388(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}