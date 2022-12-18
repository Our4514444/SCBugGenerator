                                                                 

pragma solidity 0.5.17;


contract solcChecker {
 function F855(bytes calldata x) external;	//inject NONSTANDARD NAMING
}

contract ProvableI {

    address public cbAddress;

    function SETPROOFTYPE78(byte _proofType) external;	//inject NONSTANDARD NAMING
    function SETCUSTOMGASPRICE839(uint _gasPrice) external;	//inject NONSTANDARD NAMING
    function GETPRICE980(string memory _datasource) public returns (uint _dsprice);	//inject NONSTANDARD NAMING
    function RANDOMDS_GETSESSIONPUBKEYHASH228() external view returns (bytes32 _sessionKeyHash);	//inject NONSTANDARD NAMING
    function GETPRICE980(string memory _datasource, uint _gasLimit) public returns (uint _dsprice);	//inject NONSTANDARD NAMING
    function QUERYN377(uint _timestamp, string memory _datasource, bytes memory _argN) public payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY239(uint _timestamp, string calldata _datasource, string calldata _arg) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY2923(uint _timestamp, string memory _datasource, string memory _arg1, string memory _arg2) public payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY_WITHGASLIMIT300(uint _timestamp, string calldata _datasource, string calldata _arg, uint _gasLimit) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERYN_WITHGASLIMIT834(uint _timestamp, string calldata _datasource, bytes calldata _argN, uint _gasLimit) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY2_WITHGASLIMIT331(uint _timestamp, string calldata _datasource, string calldata _arg1, string calldata _arg2, uint _gasLimit) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
}

contract OracleAddrResolverI {
    function GETADDRESS265() public returns (address _address);	//inject NONSTANDARD NAMING
}

library Buffer {

    struct buffer {
        bytes buf;
        uint capacity;
    }

    function INIT810(buffer memory _buf, uint _capacity) internal pure {	//inject NONSTANDARD NAMING
        uint capacity = _capacity;
        if (capacity % 32 != 0) {
            capacity += 32 - (capacity % 32);
        }
        _buf.capacity = capacity; 
        assembly {
            let ptr := mload(0x40)
            mstore(_buf, ptr)
            mstore(ptr, 0)
            mstore(0x40, add(ptr, capacity))
        }
    }

    function RESIZE401(buffer memory _buf, uint _capacity) private pure {	//inject NONSTANDARD NAMING
        bytes memory oldbuf = _buf.buf;
        INIT810(_buf, _capacity);
        APPEND5(_buf, oldbuf);
    }

    function MAX492(uint _a, uint _b) private pure returns (uint _max) {	//inject NONSTANDARD NAMING
        if (_a > _b) {
            return _a;
        }
        return _b;
    }
    
    function APPEND5(buffer memory _buf, bytes memory _data) internal pure returns (buffer memory _buffer) {	//inject NONSTANDARD NAMING
        if (_data.length + _buf.buf.length > _buf.capacity) {
            RESIZE401(_buf, MAX492(_buf.capacity, _data.length) * 2);
        }
        uint dest;
        uint src;
        uint len = _data.length;
        assembly {
            let bufptr := mload(_buf) 
            let buflen := mload(bufptr) 
            dest := add(add(bufptr, buflen), 32) 
            mstore(bufptr, add(buflen, mload(_data))) 
            src := add(_data, 32)
        }
        for(; len >= 32; len -= 32) { 
            assembly {
                mstore(dest, mload(src))
            }
            dest += 32;
            src += 32;
        }
        uint mask = 256 ** (32 - len) - 1; 
        assembly {
            let srcpart := and(mload(src), not(mask))
            let destpart := and(mload(dest), mask)
            mstore(dest, or(destpart, srcpart))
        }
        return _buf;
    }
    
    function APPEND5(buffer memory _buf, uint8 _data) internal pure {	//inject NONSTANDARD NAMING
        if (_buf.buf.length + 1 > _buf.capacity) {
            RESIZE401(_buf, _buf.capacity * 2);
        }
        assembly {
            let bufptr := mload(_buf) 
            let buflen := mload(bufptr) 
            let dest := add(add(bufptr, buflen), 32) 
            mstore8(dest, _data)
            mstore(bufptr, add(buflen, 1)) 
        }
    }
    
    function APPENDINT47(buffer memory _buf, uint _data, uint _len) internal pure returns (buffer memory _buffer) {	//inject NONSTANDARD NAMING
        if (_len + _buf.buf.length > _buf.capacity) {
            RESIZE401(_buf, MAX492(_buf.capacity, _len) * 2);
        }
        uint mask = 256 ** _len - 1;
        assembly {
            let bufptr := mload(_buf) 
            let buflen := mload(bufptr) 
            let dest := add(add(bufptr, buflen), _len) 
            mstore(dest, or(and(mload(dest), not(mask)), _data))
            mstore(bufptr, add(buflen, _len)) 
        }
        return _buf;
    }
}

library CBOR {

    using Buffer for Buffer.buffer;

    uint8 private constant major_type_int240 = 0;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_map754 = 5;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_bytes184 = 2;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_array627 = 4;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_string778 = 3;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_negative_int481 = 1;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_content_free245 = 7;	//inject NONSTANDARD NAMING

    function ENCODETYPE298(Buffer.buffer memory _buf, uint8 _major, uint _value) private pure {	//inject NONSTANDARD NAMING
        if (_value <= 23) {
            _buf.APPEND5(uint8((_major << 5) | _value));
        } else if (_value <= 0xFF) {
            _buf.APPEND5(uint8((_major << 5) | 24));
            _buf.APPENDINT47(_value, 1);
        } else if (_value <= 0xFFFF) {
            _buf.APPEND5(uint8((_major << 5) | 25));
            _buf.APPENDINT47(_value, 2);
        } else if (_value <= 0xFFFFFFFF) {
            _buf.APPEND5(uint8((_major << 5) | 26));
            _buf.APPENDINT47(_value, 4);
        } else if (_value <= 0xFFFFFFFFFFFFFFFF) {
            _buf.APPEND5(uint8((_major << 5) | 27));
            _buf.APPENDINT47(_value, 8);
        }
    }

    function ENCODEINDEFINITELENGTHTYPE575(Buffer.buffer memory _buf, uint8 _major) private pure {	//inject NONSTANDARD NAMING
        _buf.APPEND5(uint8((_major << 5) | 31));
    }

    function ENCODEUINT70(Buffer.buffer memory _buf, uint _value) internal pure {	//inject NONSTANDARD NAMING
        ENCODETYPE298(_buf, major_type_int240, _value);
    }

    function ENCODEINT864(Buffer.buffer memory _buf, int _value) internal pure {	//inject NONSTANDARD NAMING
        if (_value >= 0) {
            ENCODETYPE298(_buf, major_type_int240, uint(_value));
        } else {
            ENCODETYPE298(_buf, major_type_negative_int481, uint(-1 - _value));
        }
    }

    function ENCODEBYTES234(Buffer.buffer memory _buf, bytes memory _value) internal pure {	//inject NONSTANDARD NAMING
        ENCODETYPE298(_buf, major_type_bytes184, _value.length);
        _buf.APPEND5(_value);
    }

    function ENCODESTRING632(Buffer.buffer memory _buf, string memory _value) internal pure {	//inject NONSTANDARD NAMING
        ENCODETYPE298(_buf, major_type_string778, bytes(_value).length);
        _buf.APPEND5(bytes(_value));
    }

    function STARTARRAY314(Buffer.buffer memory _buf) internal pure {	//inject NONSTANDARD NAMING
        ENCODEINDEFINITELENGTHTYPE575(_buf, major_type_array627);
    }

    function STARTMAP542(Buffer.buffer memory _buf) internal pure {	//inject NONSTANDARD NAMING
        ENCODEINDEFINITELENGTHTYPE575(_buf, major_type_map754);
    }

    function ENDSEQUENCE54(Buffer.buffer memory _buf) internal pure {	//inject NONSTANDARD NAMING
        ENCODEINDEFINITELENGTHTYPE575(_buf, major_type_content_free245);
    }
}

contract usingProvable {

    using CBOR for Buffer.buffer;

    ProvableI provable;
    OracleAddrResolverI OAR;

    uint constant day244 = 60 * 60 * 24;	//inject NONSTANDARD NAMING
    uint constant week626 = 60 * 60 * 24 * 7;	//inject NONSTANDARD NAMING
    uint constant month898 = 60 * 60 * 24 * 30;	//inject NONSTANDARD NAMING

    byte constant prooftype_none563 = 0x00;	//inject NONSTANDARD NAMING
    byte constant prooftype_ledger499 = 0x30;	//inject NONSTANDARD NAMING
    byte constant prooftype_native497 = 0xF0;	//inject NONSTANDARD NAMING
    byte constant proofstorage_ipfs463 = 0x01;	//inject NONSTANDARD NAMING
    byte constant prooftype_android990 = 0x40;	//inject NONSTANDARD NAMING
    byte constant prooftype_tlsnotary387 = 0x10;	//inject NONSTANDARD NAMING

    string provable_network_name;
    uint8 constant networkid_auto499 = 0;	//inject NONSTANDARD NAMING
    uint8 constant networkid_morden932 = 2;	//inject NONSTANDARD NAMING
    uint8 constant networkid_mainnet361 = 1;	//inject NONSTANDARD NAMING
    uint8 constant networkid_testnet306 = 2;	//inject NONSTANDARD NAMING
    uint8 constant networkid_consensys379 = 161;	//inject NONSTANDARD NAMING

    mapping(bytes32 => bytes32) provable_randomDS_args;
    mapping(bytes32 => bool) provable_randomDS_sessionKeysHashVerified;

    modifier PROVABLEAPI626 {	//inject NONSTANDARD NAMING
        if ((address(OAR) == address(0)) || (GETCODESIZE694(address(OAR)) == 0)) {
            PROVABLE_SETNETWORK338(networkid_auto499);
        }
        if (address(provable) != OAR.GETADDRESS265()) {
            provable = ProvableI(OAR.GETADDRESS265());
        }
        _;
    }

    modifier PROVABLE_RANDOMDS_PROOFVERIFY348(bytes32 _queryId, string memory _result, bytes memory _proof) {	//inject NONSTANDARD NAMING
        
        require((_proof[0] == "L") && (_proof[1] == "P") && (uint8(_proof[2]) == uint8(1)));
        bool proofVerified = PROVABLE_RANDOMDS_PROOFVERIFY__MAIN791(_proof, _queryId, bytes(_result), PROVABLE_GETNETWORKNAME73());
        require(proofVerified);
        _;
    }

    function PROVABLE_SETNETWORK338(uint8 _networkID) internal returns (bool _networkSet) {	//inject NONSTANDARD NAMING
      _networkID; 
      return PROVABLE_SETNETWORK338();
    }

    function PROVABLE_SETNETWORKNAME668(string memory _network_name) internal {	//inject NONSTANDARD NAMING
        provable_network_name = _network_name;
    }

    function PROVABLE_GETNETWORKNAME73() internal view returns (string memory _networkName) {	//inject NONSTANDARD NAMING
        return provable_network_name;
    }

    function PROVABLE_SETNETWORK338() internal returns (bool _networkSet) {	//inject NONSTANDARD NAMING
        if (GETCODESIZE694(0x1d3B2638a7cC9f2CB3D298A3DA7a90B67E5506ed) > 0) { 
            OAR = OracleAddrResolverI(0x1d3B2638a7cC9f2CB3D298A3DA7a90B67E5506ed);
            PROVABLE_SETNETWORKNAME668("eth_mainnet");
            return true;
        }
        if (GETCODESIZE694(0xc03A2615D5efaf5F49F60B7BB6583eaec212fdf1) > 0) { 
            OAR = OracleAddrResolverI(0xc03A2615D5efaf5F49F60B7BB6583eaec212fdf1);
            PROVABLE_SETNETWORKNAME668("eth_ropsten3");
            return true;
        }
        if (GETCODESIZE694(0xB7A07BcF2Ba2f2703b24C0691b5278999C59AC7e) > 0) { 
            OAR = OracleAddrResolverI(0xB7A07BcF2Ba2f2703b24C0691b5278999C59AC7e);
            PROVABLE_SETNETWORKNAME668("eth_kovan");
            return true;
        }
        if (GETCODESIZE694(0x146500cfd35B22E4A392Fe0aDc06De1a1368Ed48) > 0) { 
            OAR = OracleAddrResolverI(0x146500cfd35B22E4A392Fe0aDc06De1a1368Ed48);
            PROVABLE_SETNETWORKNAME668("eth_rinkeby");
            return true;
        }
        if (GETCODESIZE694(0xa2998EFD205FB9D4B4963aFb70778D6354ad3A41) > 0) { 
            OAR = OracleAddrResolverI(0xa2998EFD205FB9D4B4963aFb70778D6354ad3A41);
            PROVABLE_SETNETWORKNAME668("eth_goerli");
            return true;
        }
        if (GETCODESIZE694(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475) > 0) { 
            OAR = OracleAddrResolverI(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475);
            return true;
        }
        if (GETCODESIZE694(0x20e12A1F859B3FeaE5Fb2A0A32C18F5a65555bBF) > 0) { 
            OAR = OracleAddrResolverI(0x20e12A1F859B3FeaE5Fb2A0A32C18F5a65555bBF);
            return true;
        }
        if (GETCODESIZE694(0x51efaF4c8B3C9AfBD5aB9F4bbC82784Ab6ef8fAA) > 0) { 
            OAR = OracleAddrResolverI(0x51efaF4c8B3C9AfBD5aB9F4bbC82784Ab6ef8fAA);
            return true;
        }
        return false;
    }
    
    function __CALLBACK228(bytes32 _myid, string memory _result) public {	//inject NONSTANDARD NAMING
        __CALLBACK228(_myid, _result, new bytes(0));
    }

    function __CALLBACK228(bytes32 _myid, string memory _result, bytes memory _proof) public {	//inject NONSTANDARD NAMING
      _myid; _result; _proof;
      provable_randomDS_args[bytes32(0)] = bytes32(0);
    }

    function PROVABLE_GETPRICE652(string memory _datasource) PROVABLEAPI626 internal returns (uint _queryPrice) {	//inject NONSTANDARD NAMING
        return provable.GETPRICE980(_datasource);
    }

    function PROVABLE_GETPRICE652(string memory _datasource, uint _gasLimit) PROVABLEAPI626 internal returns (uint _queryPrice) {	//inject NONSTANDARD NAMING
        return provable.GETPRICE980(_datasource, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string memory _arg) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; 
        }
        return provable.QUERY239.value(price)(0, _datasource, _arg);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string memory _arg) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; 
        }
        return provable.QUERY239.value(price)(_timestamp, _datasource, _arg);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string memory _arg, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource,_gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; 
        }
        return provable.QUERY_WITHGASLIMIT300.value(price)(_timestamp, _datasource, _arg, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string memory _arg, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
           return 0; 
        }
        return provable.QUERY_WITHGASLIMIT300.value(price)(0, _datasource, _arg, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string memory _arg1, string memory _arg2) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; 
        }
        return provable.QUERY2923.value(price)(0, _datasource, _arg1, _arg2);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string memory _arg1, string memory _arg2) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; 
        }
        return provable.QUERY2923.value(price)(_timestamp, _datasource, _arg1, _arg2);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string memory _arg1, string memory _arg2, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; 
        }
        return provable.QUERY2_WITHGASLIMIT331.value(price)(_timestamp, _datasource, _arg1, _arg2, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string memory _arg1, string memory _arg2, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; 
        }
        return provable.QUERY2_WITHGASLIMIT331.value(price)(0, _datasource, _arg1, _arg2, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[] memory _argN) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; 
        }
        bytes memory args = STRA2CBOR679(_argN);
        return provable.QUERYN377.value(price)(0, _datasource, args);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[] memory _argN) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; 
        }
        bytes memory args = STRA2CBOR679(_argN);
        return provable.QUERYN377.value(price)(_timestamp, _datasource, args);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[] memory _argN, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; 
        }
        bytes memory args = STRA2CBOR679(_argN);
        return provable.QUERYN_WITHGASLIMIT834.value(price)(_timestamp, _datasource, args, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[] memory _argN, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; 
        }
        bytes memory args = STRA2CBOR679(_argN);
        return provable.QUERYN_WITHGASLIMIT834.value(price)(0, _datasource, args, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[1] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return PROVABLE_QUERY104(_datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[1] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[1] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[1] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return PROVABLE_QUERY104(_datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[2] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return PROVABLE_QUERY104(_datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[2] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[2] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[2] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return PROVABLE_QUERY104(_datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[3] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return PROVABLE_QUERY104(_datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[3] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[3] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[3] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return PROVABLE_QUERY104(_datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[4] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return PROVABLE_QUERY104(_datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[4] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[4] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[4] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return PROVABLE_QUERY104(_datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[5] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return PROVABLE_QUERY104(_datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[5] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, string[5] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, string[5] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return PROVABLE_QUERY104(_datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[] memory _argN) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; 
        }
        bytes memory args = BA2CBOR69(_argN);
        return provable.QUERYN377.value(price)(0, _datasource, args);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[] memory _argN) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; 
        }
        bytes memory args = BA2CBOR69(_argN);
        return provable.QUERYN377.value(price)(_timestamp, _datasource, args);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[] memory _argN, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; 
        }
        bytes memory args = BA2CBOR69(_argN);
        return provable.QUERYN_WITHGASLIMIT834.value(price)(_timestamp, _datasource, args, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[] memory _argN, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = provable.GETPRICE980(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; 
        }
        bytes memory args = BA2CBOR69(_argN);
        return provable.QUERYN_WITHGASLIMIT834.value(price)(0, _datasource, args, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[1] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return PROVABLE_QUERY104(_datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[1] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[1] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[1] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return PROVABLE_QUERY104(_datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[2] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return PROVABLE_QUERY104(_datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[2] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[2] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[2] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return PROVABLE_QUERY104(_datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[3] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return PROVABLE_QUERY104(_datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[3] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[3] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[3] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return PROVABLE_QUERY104(_datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[4] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return PROVABLE_QUERY104(_datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[4] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[4] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[4] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return PROVABLE_QUERY104(_datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[5] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return PROVABLE_QUERY104(_datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[5] memory _args) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs);
    }

    function PROVABLE_QUERY104(uint _timestamp, string memory _datasource, bytes[5] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return PROVABLE_QUERY104(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function PROVABLE_QUERY104(string memory _datasource, bytes[5] memory _args, uint _gasLimit) PROVABLEAPI626 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return PROVABLE_QUERY104(_datasource, dynargs, _gasLimit);
    }

    function PROVABLE_SETPROOF371(byte _proofP) PROVABLEAPI626 internal {	//inject NONSTANDARD NAMING
        return provable.SETPROOFTYPE78(_proofP);
    }


    function PROVABLE_CBADDRESS536() PROVABLEAPI626 internal returns (address _callbackAddress) {	//inject NONSTANDARD NAMING
        return provable.cbAddress();
    }

    function GETCODESIZE694(address _addr) view internal returns (uint _size) {	//inject NONSTANDARD NAMING
        assembly {
            _size := extcodesize(_addr)
        }
    }

    function PROVABLE_SETCUSTOMGASPRICE468(uint _gasPrice) PROVABLEAPI626 internal {	//inject NONSTANDARD NAMING
        return provable.SETCUSTOMGASPRICE839(_gasPrice);
    }

    function PROVABLE_RANDOMDS_GETSESSIONPUBKEYHASH427() PROVABLEAPI626 internal returns (bytes32 _sessionKeyHash) {	//inject NONSTANDARD NAMING
        return provable.RANDOMDS_GETSESSIONPUBKEYHASH228();
    }

    function PARSEADDR469(string memory _a) internal pure returns (address _parsedAddress) {	//inject NONSTANDARD NAMING
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

    function STRCOMPARE586(string memory _a, string memory _b) internal pure returns (int _returnCode) {	//inject NONSTANDARD NAMING
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

    function INDEXOF64(string memory _haystack, string memory _needle) internal pure returns (int _returnCode) {	//inject NONSTANDARD NAMING
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

    function STRCONCAT943(string memory _a, string memory _b) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
        return STRCONCAT943(_a, _b, "", "", "");
    }

    function STRCONCAT943(string memory _a, string memory _b, string memory _c) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
        return STRCONCAT943(_a, _b, _c, "", "");
    }

    function STRCONCAT943(string memory _a, string memory _b, string memory _c, string memory _d) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
        return STRCONCAT943(_a, _b, _c, _d, "");
    }

    function STRCONCAT943(string memory _a, string memory _b, string memory _c, string memory _d, string memory _e) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
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

    function SAFEPARSEINT518(string memory _a) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
        return SAFEPARSEINT518(_a, 0);
    }

    function SAFEPARSEINT518(string memory _a, uint _b) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
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

    function PARSEINT576(string memory _a) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
        return PARSEINT576(_a, 0);
    }

    function PARSEINT576(string memory _a, uint _b) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
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

    function UINT2STR322(uint _i) internal pure returns (string memory _uintAsString) {	//inject NONSTANDARD NAMING
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

    function STRA2CBOR679(string[] memory _arr) internal pure returns (bytes memory _cborEncoding) {	//inject NONSTANDARD NAMING
        SAFEMEMORYCLEANER747();
        Buffer.buffer memory buf;
        Buffer.INIT810(buf, 1024);
        buf.STARTARRAY314();
        for (uint i = 0; i < _arr.length; i++) {
            buf.ENCODESTRING632(_arr[i]);
        }
        buf.ENDSEQUENCE54();
        return buf.buf;
    }

    function BA2CBOR69(bytes[] memory _arr) internal pure returns (bytes memory _cborEncoding) {	//inject NONSTANDARD NAMING
        SAFEMEMORYCLEANER747();
        Buffer.buffer memory buf;
        Buffer.INIT810(buf, 1024);
        buf.STARTARRAY314();
        for (uint i = 0; i < _arr.length; i++) {
            buf.ENCODEBYTES234(_arr[i]);
        }
        buf.ENDSEQUENCE54();
        return buf.buf;
    }

    function PROVABLE_NEWRANDOMDSQUERY349(uint _delay, uint _nbytes, uint _customGasLimit) internal returns (bytes32 _queryId) {	//inject NONSTANDARD NAMING
        require((_nbytes > 0) && (_nbytes <= 32));
        _delay *= 10; 
        bytes memory nbytes = new bytes(1);
        nbytes[0] = byte(uint8(_nbytes));
        bytes memory unonce = new bytes(32);
        bytes memory sessionKeyHash = new bytes(32);
        bytes32 sessionKeyHash_bytes32 = PROVABLE_RANDOMDS_GETSESSIONPUBKEYHASH427();
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
        COPYBYTES684(delay, 24, 8, delay_bytes8, 0);
        bytes[4] memory args = [unonce, nbytes, sessionKeyHash, delay];
        bytes32 queryId = PROVABLE_QUERY104("random", args, _customGasLimit);
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
        PROVABLE_RANDOMDS_SETCOMMITMENT230(queryId, keccak256(abi.encodePacked(delay_bytes8_left, args[1], sha256(args[0]), args[2])));
        return queryId;
    }

    function PROVABLE_RANDOMDS_SETCOMMITMENT230(bytes32 _queryId, bytes32 _commitment) internal {	//inject NONSTANDARD NAMING
        provable_randomDS_args[_queryId] = _commitment;
    }

    function VERIFYSIG793(bytes32 _tosignh, bytes memory _dersig, bytes memory _pubkey) internal returns (bool _sigVerified) {	//inject NONSTANDARD NAMING
        bool sigok;
        address signer;
        bytes32 sigr;
        bytes32 sigs;
        bytes memory sigr_ = new bytes(32);
        uint offset = 4 + (uint(uint8(_dersig[3])) - 0x20);
        sigr_ = COPYBYTES684(_dersig, offset, 32, sigr_, 0);
        bytes memory sigs_ = new bytes(32);
        offset += 32 + 2;
        sigs_ = COPYBYTES684(_dersig, offset + (uint(uint8(_dersig[offset - 1])) - 0x20), 32, sigs_, 0);
        assembly {
            sigr := mload(add(sigr_, 32))
            sigs := mload(add(sigs_, 32))
        }
        (sigok, signer) = SAFER_ECRECOVER458(_tosignh, 27, sigr, sigs);
        if (address(uint160(uint256(keccak256(_pubkey)))) == signer) {
            return true;
        } else {
            (sigok, signer) = SAFER_ECRECOVER458(_tosignh, 28, sigr, sigs);
            return (address(uint160(uint256(keccak256(_pubkey)))) == signer);
        }
    }

    function PROVABLE_RANDOMDS_PROOFVERIFY__SESSIONKEYVALIDITY776(bytes memory _proof, uint _sig2offset) internal returns (bool _proofVerified) {	//inject NONSTANDARD NAMING
        bool sigok;
        
        bytes memory sig2 = new bytes(uint(uint8(_proof[_sig2offset + 1])) + 2);
        COPYBYTES684(_proof, _sig2offset, sig2.length, sig2, 0);
        bytes memory appkey1_pubkey = new bytes(64);
        COPYBYTES684(_proof, 3 + 1, 64, appkey1_pubkey, 0);
        bytes memory tosign2 = new bytes(1 + 65 + 32);
        tosign2[0] = byte(uint8(1)); 
        COPYBYTES684(_proof, _sig2offset - 65, 65, tosign2, 1);
        bytes memory CODEHASH = hex"fd94fa71bc0ba10d39d464d0d8f465efeef0a2764e3887fcc9df41ded20f505c";
        COPYBYTES684(CODEHASH, 0, 32, tosign2, 1 + 65);
        sigok = VERIFYSIG793(sha256(tosign2), sig2, appkey1_pubkey);
        if (!sigok) {
            return false;
        }
        
        bytes memory LEDGERKEY = hex"7fb956469c5c9b89840d55b43537e66a98dd4811ea0a27224272c2e5622911e8537a2f8e86a46baec82864e98dd01e9ccc2f8bc5dfc9cbe5a91a290498dd96e4";
        bytes memory tosign3 = new bytes(1 + 65);
        tosign3[0] = 0xFE;
        COPYBYTES684(_proof, 3, 65, tosign3, 1);
        bytes memory sig3 = new bytes(uint(uint8(_proof[3 + 65 + 1])) + 2);
        COPYBYTES684(_proof, 3 + 65, sig3.length, sig3, 0);
        sigok = VERIFYSIG793(sha256(tosign3), sig3, LEDGERKEY);
        return sigok;
    }

    function PROVABLE_RANDOMDS_PROOFVERIFY__RETURNCODE101(bytes32 _queryId, string memory _result, bytes memory _proof) internal returns (uint8 _returnCode) {	//inject NONSTANDARD NAMING
        
        if ((_proof[0] != "L") || (_proof[1] != "P") || (uint8(_proof[2]) != uint8(1))) {
            return 1;
        }
        bool proofVerified = PROVABLE_RANDOMDS_PROOFVERIFY__MAIN791(_proof, _queryId, bytes(_result), PROVABLE_GETNETWORKNAME73());
        if (!proofVerified) {
            return 2;
        }
        return 0;
    }

    function MATCHBYTES32PREFIX559(bytes32 _content, bytes memory _prefix, uint _nRandomBytes) internal pure returns (bool _matchesPrefix) {	//inject NONSTANDARD NAMING
        bool match_ = true;
        require(_prefix.length == _nRandomBytes);
        for (uint256 i = 0; i< _nRandomBytes; i++) {
            if (_content[i] != _prefix[i]) {
                match_ = false;
            }
        }
        return match_;
    }

    function PROVABLE_RANDOMDS_PROOFVERIFY__MAIN791(bytes memory _proof, bytes32 _queryId, bytes memory _result, string memory _contextName) internal returns (bool _proofVerified) {	//inject NONSTANDARD NAMING
        
        uint ledgerProofLength = 3 + 65 + (uint(uint8(_proof[3 + 65 + 1])) + 2) + 32;
        bytes memory keyhash = new bytes(32);
        COPYBYTES684(_proof, ledgerProofLength, 32, keyhash, 0);
        if (!(keccak256(keyhash) == keccak256(abi.encodePacked(sha256(abi.encodePacked(_contextName, _queryId)))))) {
            return false;
        }
        bytes memory sig1 = new bytes(uint(uint8(_proof[ledgerProofLength + (32 + 8 + 1 + 32) + 1])) + 2);
        COPYBYTES684(_proof, ledgerProofLength + (32 + 8 + 1 + 32), sig1.length, sig1, 0);
        
        if (!MATCHBYTES32PREFIX559(sha256(sig1), _result, uint(uint8(_proof[ledgerProofLength + 32 + 8])))) {
            return false;
        }
        
        
        bytes memory commitmentSlice1 = new bytes(8 + 1 + 32);
        COPYBYTES684(_proof, ledgerProofLength + 32, 8 + 1 + 32, commitmentSlice1, 0);
        bytes memory sessionPubkey = new bytes(64);
        uint sig2offset = ledgerProofLength + 32 + (8 + 1 + 32) + sig1.length + 65;
        COPYBYTES684(_proof, sig2offset - 64, 64, sessionPubkey, 0);
        bytes32 sessionPubkeyHash = sha256(sessionPubkey);
        if (provable_randomDS_args[_queryId] == keccak256(abi.encodePacked(commitmentSlice1, sessionPubkeyHash))) { 
            delete provable_randomDS_args[_queryId];
        } else return false;
        
        bytes memory tosign1 = new bytes(32 + 8 + 1 + 32);
        COPYBYTES684(_proof, ledgerProofLength, 32 + 8 + 1 + 32, tosign1, 0);
        if (!VERIFYSIG793(sha256(tosign1), sig1, sessionPubkey)) {
            return false;
        }
        
        if (!provable_randomDS_sessionKeysHashVerified[sessionPubkeyHash]) {
            provable_randomDS_sessionKeysHashVerified[sessionPubkeyHash] = PROVABLE_RANDOMDS_PROOFVERIFY__SESSIONKEYVALIDITY776(_proof, sig2offset);
        }
        return provable_randomDS_sessionKeysHashVerified[sessionPubkeyHash];
    }
    
    function COPYBYTES684(bytes memory _from, uint _fromOffset, uint _length, bytes memory _to, uint _toOffset) internal pure returns (bytes memory _copiedBytes) {	//inject NONSTANDARD NAMING
        uint minLength = _length + _toOffset;
        require(_to.length >= minLength); 
        uint i = 32 + _fromOffset; 
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
    
    function SAFER_ECRECOVER458(bytes32 _hash, uint8 _v, bytes32 _r, bytes32 _s) internal returns (bool _success, address _recoveredAddress) {	//inject NONSTANDARD NAMING
        
        bool ret;
        address addr;
        assembly {
            let size := mload(0x40)
            mstore(size, _hash)
            mstore(add(size, 32), _v)
            mstore(add(size, 64), _r)
            mstore(add(size, 96), _s)
            ret := call(3000, 1, 0, size, 128, size, 32) 
            addr := mload(size)
        }
        return (ret, addr);
    }
    
    function ECRECOVERY644(bytes32 _hash, bytes memory _sig) internal returns (bool _success, address _recoveredAddress) {	//inject NONSTANDARD NAMING
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
        return SAFER_ECRECOVER458(_hash, v, r, s);
    }

    function SAFEMEMORYCLEANER747() internal pure {	//inject NONSTANDARD NAMING
        assembly {
            let fmem := mload(0x40)
            codecopy(fmem, codesize, sub(msize, fmem))
        }
    }
}

interface IYeldContract {
  function REBALANCE875() external;	//inject NONSTANDARD NAMING
}

interface IERC20 {
    function TRANSFER853(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    

    function _MSGSENDER139() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA803() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; 
        return msg.data;
    }
}

contract Ownable is Context {
    address payable private _owner;

    event OWNERSHIPTRANSFERRED319(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    constructor () internal {
        _owner = _MSGSENDER139();
        emit OWNERSHIPTRANSFERRED319(address(0), _owner);
    }
    function OWNER129() public view returns (address payable) {	//inject NONSTANDARD NAMING
        return _owner;
    }
    modifier ONLYOWNER516() {	//inject NONSTANDARD NAMING
        require(ISOWNER137(), "Ownable: caller is not the owner");
        _;
    }
    function ISOWNER137() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER139() == _owner;
    }
    function RENOUNCEOWNERSHIP638() public ONLYOWNER516 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED319(_owner, address(0));
        _owner = address(0);
    }
    function TRANSFEROWNERSHIP149(address payable newOwner) public ONLYOWNER516 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP278(newOwner);
    }
    function _TRANSFEROWNERSHIP278(address payable newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED319(_owner, newOwner);
        _owner = newOwner;
    }
}

contract YeldOracle is usingProvable, Ownable {
  address public yDAI;
  address public yTether;
  address public yTrueUSD;
  address public yUSDC;
  uint256 public updateTime = 60; 

  function () external payable {}

  constructor (address _yDAI, address _yTether, address _yTrueUSD, address _yUSDC) public payable {
    yDAI = _yDAI;
    yTether = _yTether;
    yTrueUSD = _yTrueUSD;
    yUSDC = _yUSDC;
    REBALANCE875();
  }

  function __CALLBACK228(bytes32 myid, string memory result) public {	//inject NONSTANDARD NAMING
    if (msg.sender != PROVABLE_CBADDRESS536()) revert('The sender must be oraclize');
    REBALANCE875();
    PROVABLE_QUERY104(updateTime, "URL", "");
  }

  function EXTRACTTOKENSIFSTUCK7(address _token, uint256 _amount) public ONLYOWNER516 {	//inject NONSTANDARD NAMING
    IERC20(_token).TRANSFER853(msg.sender, _amount);
  }

  function EXTRACTETHIFSTUCK650() public ONLYOWNER516 {	//inject NONSTANDARD NAMING
    OWNER129().transfer(address(this).balance);
  }

  function SETUPDATETIME509(uint256 _time) public ONLYOWNER516 {	//inject NONSTANDARD NAMING
    updateTime = _time;
  }

  function SETYDAI93(address _contract) public ONLYOWNER516 {	//inject NONSTANDARD NAMING
    yDAI = _contract;
  }

  function SETYTETHER119(address _contract) public ONLYOWNER516 {	//inject NONSTANDARD NAMING
    yTether = _contract;
  }

  function SETYTRUEUSD625(address _contract) public ONLYOWNER516 {	//inject NONSTANDARD NAMING
    yTrueUSD = _contract;
  }

  function SETYUSDC206(address _contract) public ONLYOWNER516 {	//inject NONSTANDARD NAMING
    yUSDC = _contract;
  }

  function REBALANCE875() public {	//inject NONSTANDARD NAMING
    IYeldContract(yDAI).REBALANCE875();
    IYeldContract(yTether).REBALANCE875();
    IYeldContract(yTrueUSD).REBALANCE875();
    IYeldContract(yUSDC).REBALANCE875();
    
    PROVABLE_QUERY104(updateTime, "URL", "");
  }
}