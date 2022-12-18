pragma solidity ^0.5.2;
pragma experimental ABIEncoderV2;
// produced by the Solididy File Flattener (c) David Appleton 2018
// contact : dave@akomba.com
// released under Apache 2.0 licence
// input  /Users/yurivisser/Dev/gener8tive/contracts/Gener8tiveKBlocksERC721.sol
// flattened :  Saturday, 27-Apr-19 00:28:41 UTC
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED270(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED270(address(0), _owner);
    }

                                                        
    function OWNER255() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER962() {	//inject NONSTANDARD NAMING
        require(ISOWNER604());
        _;
    }

                                                                                 
    function ISOWNER604() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP588() public ONLYOWNER962 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED270(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP540(address newOwner) public ONLYOWNER962 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP981(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP981(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED270(_owner, newOwner);
        _owner = newOwner;
    }
}

contract solcChecker {
                                                                                                              function F912(bytes calldata x) external;	//inject NONSTANDARD NAMING
}

contract OraclizeI {

    address public cbAddress;

    function SETPROOFTYPE824(byte _proofType) external;	//inject NONSTANDARD NAMING
    function SETCUSTOMGASPRICE638(uint _gasPrice) external;	//inject NONSTANDARD NAMING
    function GETPRICE907(string memory _datasource) public returns (uint _dsprice);	//inject NONSTANDARD NAMING
    function RANDOMDS_GETSESSIONPUBKEYHASH762() external view returns (bytes32 _sessionKeyHash);	//inject NONSTANDARD NAMING
    function GETPRICE907(string memory _datasource, uint _gasLimit) public returns (uint _dsprice);	//inject NONSTANDARD NAMING
    function QUERYN215(uint _timestamp, string memory _datasource, bytes memory _argN) public payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY86(uint _timestamp, string calldata _datasource, string calldata _arg) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY2966(uint _timestamp, string memory _datasource, string memory _arg1, string memory _arg2) public payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY_WITHGASLIMIT806(uint _timestamp, string calldata _datasource, string calldata _arg, uint _gasLimit) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERYN_WITHGASLIMIT758(uint _timestamp, string calldata _datasource, bytes calldata _argN, uint _gasLimit) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
    function QUERY2_WITHGASLIMIT332(uint _timestamp, string calldata _datasource, string calldata _arg1, string calldata _arg2, uint _gasLimit) external payable returns (bytes32 _id);	//inject NONSTANDARD NAMING
}

contract OraclizeAddrResolverI {
    function GETADDRESS481() public returns (address _address);	//inject NONSTANDARD NAMING
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
library Buffer {

    struct buffer {
        bytes buf;
        uint capacity;
    }

    function INIT222(buffer memory _buf, uint _capacity) internal pure {	//inject NONSTANDARD NAMING
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

    function RESIZE274(buffer memory _buf, uint _capacity) private pure {	//inject NONSTANDARD NAMING
        bytes memory oldbuf = _buf.buf;
        INIT222(_buf, _capacity);
        APPEND314(_buf, oldbuf);
    }

    function MAX251(uint _a, uint _b) private pure returns (uint _max) {	//inject NONSTANDARD NAMING
        if (_a > _b) {
            return _a;
        }
        return _b;
    }
                                                                                                                                                                                                                                                                                         
    function APPEND314(buffer memory _buf, bytes memory _data) internal pure returns (buffer memory _buffer) {	//inject NONSTANDARD NAMING
        if (_data.length + _buf.buf.length > _buf.capacity) {
            RESIZE274(_buf, MAX251(_buf.capacity, _data.length) * 2);
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
                                                                                                                                                                                                                                                                                      
    function APPEND314(buffer memory _buf, uint8 _data) internal pure {	//inject NONSTANDARD NAMING
        if (_buf.buf.length + 1 > _buf.capacity) {
            RESIZE274(_buf, _buf.capacity * 2);
        }
        assembly {
            let bufptr := mload(_buf) // Memory address of the buffer data
            let buflen := mload(bufptr) // Length of existing buffer data
            let dest := add(add(bufptr, buflen), 32) // Address = buffer address + buffer length + sizeof(buffer length)
            mstore8(dest, _data)
            mstore(bufptr, add(buflen, 1)) // Update buffer length
        }
    }
                                                                                                                                                                                                                                                                                      
    function APPENDINT340(buffer memory _buf, uint _data, uint _len) internal pure returns (buffer memory _buffer) {	//inject NONSTANDARD NAMING
        if (_len + _buf.buf.length > _buf.capacity) {
            RESIZE274(_buf, MAX251(_buf.capacity, _len) * 2);
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

    uint8 private constant major_type_int920 = 0;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_map785 = 5;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_bytes15 = 2;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_array583 = 4;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_string370 = 3;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_negative_int202 = 1;	//inject NONSTANDARD NAMING
    uint8 private constant major_type_content_free458 = 7;	//inject NONSTANDARD NAMING

    function ENCODETYPE108(Buffer.buffer memory _buf, uint8 _major, uint _value) private pure {	//inject NONSTANDARD NAMING
        if (_value <= 23) {
            _buf.APPEND314(uint8((_major << 5) | _value));
        } else if (_value <= 0xFF) {
            _buf.APPEND314(uint8((_major << 5) | 24));
            _buf.APPENDINT340(_value, 1);
        } else if (_value <= 0xFFFF) {
            _buf.APPEND314(uint8((_major << 5) | 25));
            _buf.APPENDINT340(_value, 2);
        } else if (_value <= 0xFFFFFFFF) {
            _buf.APPEND314(uint8((_major << 5) | 26));
            _buf.APPENDINT340(_value, 4);
        } else if (_value <= 0xFFFFFFFFFFFFFFFF) {
            _buf.APPEND314(uint8((_major << 5) | 27));
            _buf.APPENDINT340(_value, 8);
        }
    }

    function ENCODEINDEFINITELENGTHTYPE749(Buffer.buffer memory _buf, uint8 _major) private pure {	//inject NONSTANDARD NAMING
        _buf.APPEND314(uint8((_major << 5) | 31));
    }

    function ENCODEUINT46(Buffer.buffer memory _buf, uint _value) internal pure {	//inject NONSTANDARD NAMING
        ENCODETYPE108(_buf, major_type_int920, _value);
    }

    function ENCODEINT364(Buffer.buffer memory _buf, int _value) internal pure {	//inject NONSTANDARD NAMING
        if (_value >= 0) {
            ENCODETYPE108(_buf, major_type_int920, uint(_value));
        } else {
            ENCODETYPE108(_buf, major_type_negative_int202, uint(-1 - _value));
        }
    }

    function ENCODEBYTES428(Buffer.buffer memory _buf, bytes memory _value) internal pure {	//inject NONSTANDARD NAMING
        ENCODETYPE108(_buf, major_type_bytes15, _value.length);
        _buf.APPEND314(_value);
    }

    function ENCODESTRING3(Buffer.buffer memory _buf, string memory _value) internal pure {	//inject NONSTANDARD NAMING
        ENCODETYPE108(_buf, major_type_string370, bytes(_value).length);
        _buf.APPEND314(bytes(_value));
    }

    function STARTARRAY876(Buffer.buffer memory _buf) internal pure {	//inject NONSTANDARD NAMING
        ENCODEINDEFINITELENGTHTYPE749(_buf, major_type_array583);
    }

    function STARTMAP465(Buffer.buffer memory _buf) internal pure {	//inject NONSTANDARD NAMING
        ENCODEINDEFINITELENGTHTYPE749(_buf, major_type_map785);
    }

    function ENDSEQUENCE279(Buffer.buffer memory _buf) internal pure {	//inject NONSTANDARD NAMING
        ENCODEINDEFINITELENGTHTYPE749(_buf, major_type_content_free458);
    }
}
                              
contract usingOraclize {

    using CBOR for Buffer.buffer;

    OraclizeI oraclize;
    OraclizeAddrResolverI OAR;

    uint constant day146 = 60 * 60 * 24;	//inject NONSTANDARD NAMING
    uint constant week285 = 60 * 60 * 24 * 7;	//inject NONSTANDARD NAMING
    uint constant month180 = 60 * 60 * 24 * 30;	//inject NONSTANDARD NAMING

    byte constant prooftype_none932 = 0x00;	//inject NONSTANDARD NAMING
    byte constant prooftype_ledger671 = 0x30;	//inject NONSTANDARD NAMING
    byte constant prooftype_native98 = 0xF0;	//inject NONSTANDARD NAMING
    byte constant proofstorage_ipfs606 = 0x01;	//inject NONSTANDARD NAMING
    byte constant prooftype_android182 = 0x40;	//inject NONSTANDARD NAMING
    byte constant prooftype_tlsnotary675 = 0x10;	//inject NONSTANDARD NAMING

    string oraclize_network_name;
    uint8 constant networkid_auto174 = 0;	//inject NONSTANDARD NAMING
    uint8 constant networkid_morden736 = 2;	//inject NONSTANDARD NAMING
    uint8 constant networkid_mainnet670 = 1;	//inject NONSTANDARD NAMING
    uint8 constant networkid_testnet190 = 2;	//inject NONSTANDARD NAMING
    uint8 constant networkid_consensys878 = 161;	//inject NONSTANDARD NAMING

    mapping(bytes32 => bytes32) oraclize_randomDS_args;
    mapping(bytes32 => bool) oraclize_randomDS_sessionKeysHashVerified;

    modifier ORACLIZEAPI465 {	//inject NONSTANDARD NAMING
        if ((address(OAR) == address(0)) || (GETCODESIZE336(address(OAR)) == 0)) {
            ORACLIZE_SETNETWORK991(networkid_auto174);
        }
        if (address(oraclize) != OAR.GETADDRESS481()) {
            oraclize = OraclizeI(OAR.GETADDRESS481());
        }
        _;
    }

    modifier ORACLIZE_RANDOMDS_PROOFVERIFY484(bytes32 _queryId, string memory _result, bytes memory _proof) {	//inject NONSTANDARD NAMING
        // RandomDS Proof Step 1: The prefix has to match 'LP\x01' (Ledger Proof version 1)
        require((_proof[0] == "L") && (_proof[1] == "P") && (uint8(_proof[2]) == uint8(1)));
        bool proofVerified = ORACLIZE_RANDOMDS_PROOFVERIFY__MAIN142(_proof, _queryId, bytes(_result), ORACLIZE_GETNETWORKNAME187());
        require(proofVerified);
        _;
    }

    function ORACLIZE_SETNETWORK991(uint8 _networkID) internal returns (bool _networkSet) {	//inject NONSTANDARD NAMING
      return ORACLIZE_SETNETWORK991();
      _networkID; // silence the warning and remain backwards compatible
    }

    function ORACLIZE_SETNETWORKNAME332(string memory _network_name) internal {	//inject NONSTANDARD NAMING
        oraclize_network_name = _network_name;
    }

    function ORACLIZE_GETNETWORKNAME187() internal view returns (string memory _networkName) {	//inject NONSTANDARD NAMING
        return oraclize_network_name;
    }

    function ORACLIZE_SETNETWORK991() internal returns (bool _networkSet) {	//inject NONSTANDARD NAMING
        if (GETCODESIZE336(0x1d3B2638a7cC9f2CB3D298A3DA7a90B67E5506ed) > 0) { //mainnet
            OAR = OraclizeAddrResolverI(0x1d3B2638a7cC9f2CB3D298A3DA7a90B67E5506ed);
            ORACLIZE_SETNETWORKNAME332("eth_mainnet");
            return true;
        }
        if (GETCODESIZE336(0xc03A2615D5efaf5F49F60B7BB6583eaec212fdf1) > 0) { //ropsten testnet
            OAR = OraclizeAddrResolverI(0xc03A2615D5efaf5F49F60B7BB6583eaec212fdf1);
            ORACLIZE_SETNETWORKNAME332("eth_ropsten3");
            return true;
        }
        if (GETCODESIZE336(0xB7A07BcF2Ba2f2703b24C0691b5278999C59AC7e) > 0) { //kovan testnet
            OAR = OraclizeAddrResolverI(0xB7A07BcF2Ba2f2703b24C0691b5278999C59AC7e);
            ORACLIZE_SETNETWORKNAME332("eth_kovan");
            return true;
        }
        if (GETCODESIZE336(0x146500cfd35B22E4A392Fe0aDc06De1a1368Ed48) > 0) { //rinkeby testnet
            OAR = OraclizeAddrResolverI(0x146500cfd35B22E4A392Fe0aDc06De1a1368Ed48);
            ORACLIZE_SETNETWORKNAME332("eth_rinkeby");
            return true;
        }
        if (GETCODESIZE336(0xa2998EFD205FB9D4B4963aFb70778D6354ad3A41) > 0) { //goerli testnet
            OAR = OraclizeAddrResolverI(0xa2998EFD205FB9D4B4963aFb70778D6354ad3A41);
            ORACLIZE_SETNETWORKNAME332("eth_goerli");
            return true;
        }
        if (GETCODESIZE336(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475) > 0) { //ethereum-bridge
            OAR = OraclizeAddrResolverI(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475);
            return true;
        }
        if (GETCODESIZE336(0x20e12A1F859B3FeaE5Fb2A0A32C18F5a65555bBF) > 0) { //ether.camp ide
            OAR = OraclizeAddrResolverI(0x20e12A1F859B3FeaE5Fb2A0A32C18F5a65555bBF);
            return true;
        }
        if (GETCODESIZE336(0x51efaF4c8B3C9AfBD5aB9F4bbC82784Ab6ef8fAA) > 0) { //browser-solidity
            OAR = OraclizeAddrResolverI(0x51efaF4c8B3C9AfBD5aB9F4bbC82784Ab6ef8fAA);
            return true;
        }
        return false;
    }

    function __CALLBACK955(bytes32 _myid, string memory _result) public {	//inject NONSTANDARD NAMING
        __CALLBACK955(_myid, _result, new bytes(0));
    }

    function __CALLBACK955(bytes32 _myid, string memory _result, bytes memory _proof) public {	//inject NONSTANDARD NAMING
      return;
      _myid; _result; _proof; // Silence compiler warnings
    }

    function ORACLIZE_GETPRICE400(string memory _datasource) ORACLIZEAPI465 internal returns (uint _queryPrice) {	//inject NONSTANDARD NAMING
        return oraclize.GETPRICE907(_datasource);
    }

    function ORACLIZE_GETPRICE400(string memory _datasource, uint _gasLimit) ORACLIZEAPI465 internal returns (uint _queryPrice) {	//inject NONSTANDARD NAMING
        return oraclize.GETPRICE907(_datasource, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string memory _arg) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY86.value(price)(0, _datasource, _arg);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string memory _arg) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY86.value(price)(_timestamp, _datasource, _arg);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string memory _arg, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource,_gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY_WITHGASLIMIT806.value(price)(_timestamp, _datasource, _arg, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string memory _arg, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
           return 0; // Unexpectedly high price
        }
        return oraclize.QUERY_WITHGASLIMIT806.value(price)(0, _datasource, _arg, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string memory _arg1, string memory _arg2) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY2966.value(price)(0, _datasource, _arg1, _arg2);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string memory _arg1, string memory _arg2) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY2966.value(price)(_timestamp, _datasource, _arg1, _arg2);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string memory _arg1, string memory _arg2, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY2_WITHGASLIMIT332.value(price)(_timestamp, _datasource, _arg1, _arg2, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string memory _arg1, string memory _arg2, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        return oraclize.QUERY2_WITHGASLIMIT332.value(price)(0, _datasource, _arg1, _arg2, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[] memory _argN) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = STRA2CBOR573(_argN);
        return oraclize.QUERYN215.value(price)(0, _datasource, args);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[] memory _argN) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = STRA2CBOR573(_argN);
        return oraclize.QUERYN215.value(price)(_timestamp, _datasource, args);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[] memory _argN, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = STRA2CBOR573(_argN);
        return oraclize.QUERYN_WITHGASLIMIT758.value(price)(_timestamp, _datasource, args, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[] memory _argN, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = STRA2CBOR573(_argN);
        return oraclize.QUERYN_WITHGASLIMIT758.value(price)(0, _datasource, args, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[1] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY642(_datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[1] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[1] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[1] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY642(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[2] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY642(_datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[2] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[2] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[2] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY642(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[3] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY642(_datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[3] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[3] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[3] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY642(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[4] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY642(_datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[4] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[4] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[4] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY642(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[5] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY642(_datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[5] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, string[5] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, string[5] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        string[] memory dynargs = new string[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY642(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[] memory _argN) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = BA2CBOR62(_argN);
        return oraclize.QUERYN215.value(price)(0, _datasource, args);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[] memory _argN) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource);
        if (price > 1 ether + tx.gasprice * 200000) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = BA2CBOR62(_argN);
        return oraclize.QUERYN215.value(price)(_timestamp, _datasource, args);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[] memory _argN, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = BA2CBOR62(_argN);
        return oraclize.QUERYN_WITHGASLIMIT758.value(price)(_timestamp, _datasource, args, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[] memory _argN, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        uint price = oraclize.GETPRICE907(_datasource, _gasLimit);
        if (price > 1 ether + tx.gasprice * _gasLimit) {
            return 0; // Unexpectedly high price
        }
        bytes memory args = BA2CBOR62(_argN);
        return oraclize.QUERYN_WITHGASLIMIT758.value(price)(0, _datasource, args, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[1] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY642(_datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[1] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[1] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[1] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](1);
        dynargs[0] = _args[0];
        return ORACLIZE_QUERY642(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[2] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY642(_datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[2] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[2] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[2] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](2);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        return ORACLIZE_QUERY642(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[3] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY642(_datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[3] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[3] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[3] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](3);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        return ORACLIZE_QUERY642(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[4] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY642(_datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[4] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[4] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[4] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](4);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        return ORACLIZE_QUERY642(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[5] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY642(_datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[5] memory _args) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs);
    }

    function ORACLIZE_QUERY642(uint _timestamp, string memory _datasource, bytes[5] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY642(_timestamp, _datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_QUERY642(string memory _datasource, bytes[5] memory _args, uint _gasLimit) ORACLIZEAPI465 internal returns (bytes32 _id) {	//inject NONSTANDARD NAMING
        bytes[] memory dynargs = new bytes[](5);
        dynargs[0] = _args[0];
        dynargs[1] = _args[1];
        dynargs[2] = _args[2];
        dynargs[3] = _args[3];
        dynargs[4] = _args[4];
        return ORACLIZE_QUERY642(_datasource, dynargs, _gasLimit);
    }

    function ORACLIZE_SETPROOF743(byte _proofP) ORACLIZEAPI465 internal {	//inject NONSTANDARD NAMING
        return oraclize.SETPROOFTYPE824(_proofP);
    }


    function ORACLIZE_CBADDRESS353() ORACLIZEAPI465 internal returns (address _callbackAddress) {	//inject NONSTANDARD NAMING
        return oraclize.cbAddress();
    }

    function GETCODESIZE336(address _addr) view internal returns (uint _size) {	//inject NONSTANDARD NAMING
        assembly {
            _size := extcodesize(_addr)
        }
    }

    function ORACLIZE_SETCUSTOMGASPRICE167(uint _gasPrice) ORACLIZEAPI465 internal {	//inject NONSTANDARD NAMING
        return oraclize.SETCUSTOMGASPRICE638(_gasPrice);
    }

    function ORACLIZE_RANDOMDS_GETSESSIONPUBKEYHASH232() ORACLIZEAPI465 internal returns (bytes32 _sessionKeyHash) {	//inject NONSTANDARD NAMING
        return oraclize.RANDOMDS_GETSESSIONPUBKEYHASH762();
    }

    function PARSEADDR866(string memory _a) internal pure returns (address _parsedAddress) {	//inject NONSTANDARD NAMING
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

    function STRCOMPARE862(string memory _a, string memory _b) internal pure returns (int _returnCode) {	//inject NONSTANDARD NAMING
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

    function INDEXOF746(string memory _haystack, string memory _needle) internal pure returns (int _returnCode) {	//inject NONSTANDARD NAMING
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

    function STRCONCAT665(string memory _a, string memory _b) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
        return STRCONCAT665(_a, _b, "", "", "");
    }

    function STRCONCAT665(string memory _a, string memory _b, string memory _c) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
        return STRCONCAT665(_a, _b, _c, "", "");
    }

    function STRCONCAT665(string memory _a, string memory _b, string memory _c, string memory _d) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
        return STRCONCAT665(_a, _b, _c, _d, "");
    }

    function STRCONCAT665(string memory _a, string memory _b, string memory _c, string memory _d, string memory _e) internal pure returns (string memory _concatenatedString) {	//inject NONSTANDARD NAMING
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

    function SAFEPARSEINT654(string memory _a) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
        return SAFEPARSEINT654(_a, 0);
    }

    function SAFEPARSEINT654(string memory _a, uint _b) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
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

    function PARSEINT931(string memory _a) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
        return PARSEINT931(_a, 0);
    }

    function PARSEINT931(string memory _a, uint _b) internal pure returns (uint _parsedInt) {	//inject NONSTANDARD NAMING
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

    function UINT2STR194(uint _i) internal pure returns (string memory _uintAsString) {	//inject NONSTANDARD NAMING
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

    function STRA2CBOR573(string[] memory _arr) internal pure returns (bytes memory _cborEncoding) {	//inject NONSTANDARD NAMING
        SAFEMEMORYCLEANER686();
        Buffer.buffer memory buf;
        Buffer.INIT222(buf, 1024);
        buf.STARTARRAY876();
        for (uint i = 0; i < _arr.length; i++) {
            buf.ENCODESTRING3(_arr[i]);
        }
        buf.ENDSEQUENCE279();
        return buf.buf;
    }

    function BA2CBOR62(bytes[] memory _arr) internal pure returns (bytes memory _cborEncoding) {	//inject NONSTANDARD NAMING
        SAFEMEMORYCLEANER686();
        Buffer.buffer memory buf;
        Buffer.INIT222(buf, 1024);
        buf.STARTARRAY876();
        for (uint i = 0; i < _arr.length; i++) {
            buf.ENCODEBYTES428(_arr[i]);
        }
        buf.ENDSEQUENCE279();
        return buf.buf;
    }

    function ORACLIZE_NEWRANDOMDSQUERY351(uint _delay, uint _nbytes, uint _customGasLimit) internal returns (bytes32 _queryId) {	//inject NONSTANDARD NAMING
        require((_nbytes > 0) && (_nbytes <= 32));
        _delay *= 10; // Convert from seconds to ledger timer ticks
        bytes memory nbytes = new bytes(1);
        nbytes[0] = byte(uint8(_nbytes));
        bytes memory unonce = new bytes(32);
        bytes memory sessionKeyHash = new bytes(32);
        bytes32 sessionKeyHash_bytes32 = ORACLIZE_RANDOMDS_GETSESSIONPUBKEYHASH232();
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
        COPYBYTES452(delay, 24, 8, delay_bytes8, 0);
        bytes[4] memory args = [unonce, nbytes, sessionKeyHash, delay];
        bytes32 queryId = ORACLIZE_QUERY642("random", args, _customGasLimit);
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
        ORACLIZE_RANDOMDS_SETCOMMITMENT817(queryId, keccak256(abi.encodePacked(delay_bytes8_left, args[1], sha256(args[0]), args[2])));
        return queryId;
    }

    function ORACLIZE_RANDOMDS_SETCOMMITMENT817(bytes32 _queryId, bytes32 _commitment) internal {	//inject NONSTANDARD NAMING
        oraclize_randomDS_args[_queryId] = _commitment;
    }

    function VERIFYSIG720(bytes32 _tosignh, bytes memory _dersig, bytes memory _pubkey) internal returns (bool _sigVerified) {	//inject NONSTANDARD NAMING
        bool sigok;
        address signer;
        bytes32 sigr;
        bytes32 sigs;
        bytes memory sigr_ = new bytes(32);
        uint offset = 4 + (uint(uint8(_dersig[3])) - 0x20);
        sigr_ = COPYBYTES452(_dersig, offset, 32, sigr_, 0);
        bytes memory sigs_ = new bytes(32);
        offset += 32 + 2;
        sigs_ = COPYBYTES452(_dersig, offset + (uint(uint8(_dersig[offset - 1])) - 0x20), 32, sigs_, 0);
        assembly {
            sigr := mload(add(sigr_, 32))
            sigs := mload(add(sigs_, 32))
        }
        (sigok, signer) = SAFER_ECRECOVER748(_tosignh, 27, sigr, sigs);
        if (address(uint160(uint256(keccak256(_pubkey)))) == signer) {
            return true;
        } else {
            (sigok, signer) = SAFER_ECRECOVER748(_tosignh, 28, sigr, sigs);
            return (address(uint160(uint256(keccak256(_pubkey)))) == signer);
        }
    }

    function ORACLIZE_RANDOMDS_PROOFVERIFY__SESSIONKEYVALIDITY789(bytes memory _proof, uint _sig2offset) internal returns (bool _proofVerified) {	//inject NONSTANDARD NAMING
        bool sigok;
        // Random DS Proof Step 6: Verify the attestation signature, APPKEY1 must sign the sessionKey from the correct ledger app (CODEHASH)
        bytes memory sig2 = new bytes(uint(uint8(_proof[_sig2offset + 1])) + 2);
        COPYBYTES452(_proof, _sig2offset, sig2.length, sig2, 0);
        bytes memory appkey1_pubkey = new bytes(64);
        COPYBYTES452(_proof, 3 + 1, 64, appkey1_pubkey, 0);
        bytes memory tosign2 = new bytes(1 + 65 + 32);
        tosign2[0] = byte(uint8(1)); //role
        COPYBYTES452(_proof, _sig2offset - 65, 65, tosign2, 1);
        bytes memory CODEHASH = hex"fd94fa71bc0ba10d39d464d0d8f465efeef0a2764e3887fcc9df41ded20f505c";
        COPYBYTES452(CODEHASH, 0, 32, tosign2, 1 + 65);
        sigok = VERIFYSIG720(sha256(tosign2), sig2, appkey1_pubkey);
        if (!sigok) {
            return false;
        }
        // Random DS Proof Step 7: Verify the APPKEY1 provenance (must be signed by Ledger)
        bytes memory LEDGERKEY = hex"7fb956469c5c9b89840d55b43537e66a98dd4811ea0a27224272c2e5622911e8537a2f8e86a46baec82864e98dd01e9ccc2f8bc5dfc9cbe5a91a290498dd96e4";
        bytes memory tosign3 = new bytes(1 + 65);
        tosign3[0] = 0xFE;
        COPYBYTES452(_proof, 3, 65, tosign3, 1);
        bytes memory sig3 = new bytes(uint(uint8(_proof[3 + 65 + 1])) + 2);
        COPYBYTES452(_proof, 3 + 65, sig3.length, sig3, 0);
        sigok = VERIFYSIG720(sha256(tosign3), sig3, LEDGERKEY);
        return sigok;
    }

    function ORACLIZE_RANDOMDS_PROOFVERIFY__RETURNCODE693(bytes32 _queryId, string memory _result, bytes memory _proof) internal returns (uint8 _returnCode) {	//inject NONSTANDARD NAMING
        // Random DS Proof Step 1: The prefix has to match 'LP\x01' (Ledger Proof version 1)
        if ((_proof[0] != "L") || (_proof[1] != "P") || (uint8(_proof[2]) != uint8(1))) {
            return 1;
        }
        bool proofVerified = ORACLIZE_RANDOMDS_PROOFVERIFY__MAIN142(_proof, _queryId, bytes(_result), ORACLIZE_GETNETWORKNAME187());
        if (!proofVerified) {
            return 2;
        }
        return 0;
    }

    function MATCHBYTES32PREFIX578(bytes32 _content, bytes memory _prefix, uint _nRandomBytes) internal pure returns (bool _matchesPrefix) {	//inject NONSTANDARD NAMING
        bool match_ = true;
        require(_prefix.length == _nRandomBytes);
        for (uint256 i = 0; i< _nRandomBytes; i++) {
            if (_content[i] != _prefix[i]) {
                match_ = false;
            }
        }
        return match_;
    }

    function ORACLIZE_RANDOMDS_PROOFVERIFY__MAIN142(bytes memory _proof, bytes32 _queryId, bytes memory _result, string memory _contextName) internal returns (bool _proofVerified) {	//inject NONSTANDARD NAMING
        // Random DS Proof Step 2: The unique keyhash has to match with the sha256 of (context name + _queryId)
        uint ledgerProofLength = 3 + 65 + (uint(uint8(_proof[3 + 65 + 1])) + 2) + 32;
        bytes memory keyhash = new bytes(32);
        COPYBYTES452(_proof, ledgerProofLength, 32, keyhash, 0);
        if (!(keccak256(keyhash) == keccak256(abi.encodePacked(sha256(abi.encodePacked(_contextName, _queryId)))))) {
            return false;
        }
        bytes memory sig1 = new bytes(uint(uint8(_proof[ledgerProofLength + (32 + 8 + 1 + 32) + 1])) + 2);
        COPYBYTES452(_proof, ledgerProofLength + (32 + 8 + 1 + 32), sig1.length, sig1, 0);
        // Random DS Proof Step 3: We assume sig1 is valid (it will be verified during step 5) and we verify if '_result' is the _prefix of sha256(sig1)
        if (!MATCHBYTES32PREFIX578(sha256(sig1), _result, uint(uint8(_proof[ledgerProofLength + 32 + 8])))) {
            return false;
        }
        // Random DS Proof Step 4: Commitment match verification, keccak256(delay, nbytes, unonce, sessionKeyHash) == commitment in storage.
        // This is to verify that the computed args match with the ones specified in the query.
        bytes memory commitmentSlice1 = new bytes(8 + 1 + 32);
        COPYBYTES452(_proof, ledgerProofLength + 32, 8 + 1 + 32, commitmentSlice1, 0);
        bytes memory sessionPubkey = new bytes(64);
        uint sig2offset = ledgerProofLength + 32 + (8 + 1 + 32) + sig1.length + 65;
        COPYBYTES452(_proof, sig2offset - 64, 64, sessionPubkey, 0);
        bytes32 sessionPubkeyHash = sha256(sessionPubkey);
        if (oraclize_randomDS_args[_queryId] == keccak256(abi.encodePacked(commitmentSlice1, sessionPubkeyHash))) { //unonce, nbytes and sessionKeyHash match
            delete oraclize_randomDS_args[_queryId];
        } else return false;
        // Random DS Proof Step 5: Validity verification for sig1 (keyhash and args signed with the sessionKey)
        bytes memory tosign1 = new bytes(32 + 8 + 1 + 32);
        COPYBYTES452(_proof, ledgerProofLength, 32 + 8 + 1 + 32, tosign1, 0);
        if (!VERIFYSIG720(sha256(tosign1), sig1, sessionPubkey)) {
            return false;
        }
        // Verify if sessionPubkeyHash was verified already, if not.. let's do it!
        if (!oraclize_randomDS_sessionKeysHashVerified[sessionPubkeyHash]) {
            oraclize_randomDS_sessionKeysHashVerified[sessionPubkeyHash] = ORACLIZE_RANDOMDS_PROOFVERIFY__SESSIONKEYVALIDITY789(_proof, sig2offset);
        }
        return oraclize_randomDS_sessionKeysHashVerified[sessionPubkeyHash];
    }
                                                                                                                                 
    function COPYBYTES452(bytes memory _from, uint _fromOffset, uint _length, bytes memory _to, uint _toOffset) internal pure returns (bytes memory _copiedBytes) {	//inject NONSTANDARD NAMING
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
                                                                                                                                                                                                         
    function SAFER_ECRECOVER748(bytes32 _hash, uint8 _v, bytes32 _r, bytes32 _s) internal returns (bool _success, address _recoveredAddress) {	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                                                                                                                                                         
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
                                                                                                                                 
    function ECRECOVERY871(bytes32 _hash, bytes memory _sig) internal returns (bool _success, address _recoveredAddress) {	//inject NONSTANDARD NAMING
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
        return SAFER_ECRECOVER748(_hash, v, r, s);
    }

    function SAFEMEMORYCLEANER686() internal pure {	//inject NONSTANDARD NAMING
        assembly {
            let fmem := mload(0x40)
            codecopy(fmem, codesize, sub(msize, fmem))
        }
    }
}
                        
interface IERC165 {
                                                                                                                                                                                                                                                                    
    function SUPPORTSINTERFACE164(bytes4 interfaceId) external view returns (bool);	//inject NONSTANDARD NAMING
}

library SafeMath {
                                                                                  
    function MUL140(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV429(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB204(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD724(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD160(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

contract IERC721Receiver {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ONERC721RECEIVED297(address operator, address from, uint256 tokenId, bytes memory data)	//inject NONSTANDARD NAMING
    public returns (bytes4);
}

library Address {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT286(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

contract IERC721 is IERC165 {
    event TRANSFER131(address indexed from, address indexed to, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVAL66(address indexed owner, address indexed approved, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVALFORALL185(address indexed owner, address indexed operator, bool approved);	//inject NONSTANDARD NAMING

    function BALANCEOF936(address owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING
    function OWNEROF832(uint256 tokenId) public view returns (address owner);	//inject NONSTANDARD NAMING

    function APPROVE551(address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function GETAPPROVED321(uint256 tokenId) public view returns (address operator);	//inject NONSTANDARD NAMING

    function SETAPPROVALFORALL749(address operator, bool _approved) public;	//inject NONSTANDARD NAMING
    function ISAPPROVEDFORALL94(address owner, address operator) public view returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM635(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function SAFETRANSFERFROM955(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function SAFETRANSFERFROM955(address from, address to, uint256 tokenId, bytes memory data) public;	//inject NONSTANDARD NAMING
}

library Counters {
    using SafeMath for uint256;

    struct Counter {
        // This variable should never be directly accessed by users of the library: interactions must be restricted to
        // the library's function. As of Solidity v0.5.2, this cannot be enforced, though there is a proposal to add
        // this feature: see https://github.com/ethereum/solidity/issues/4637
        uint256 _value; // default: 0
    }

    function CURRENT536(Counter storage counter) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return counter._value;
    }

    function INCREMENT851(Counter storage counter) internal {	//inject NONSTANDARD NAMING
        counter._value += 1;
    }

    function DECREMENT227(Counter storage counter) internal {	//inject NONSTANDARD NAMING
        counter._value = counter._value.SUB204(1);
    }
}

contract ERC165 is IERC165 {
    bytes4 private constant _interface_id_erc16582 = 0x01ffc9a7;	//inject NONSTANDARD NAMING
                                                                                              

                                                                                      
    mapping(bytes4 => bool) private _supportedInterfaces;

                                                                                                              
    constructor () internal {
        _REGISTERINTERFACE36(_interface_id_erc16582);
    }

                                                                                    
    function SUPPORTSINTERFACE164(bytes4 interfaceId) external view returns (bool) {	//inject NONSTANDARD NAMING
        return _supportedInterfaces[interfaceId];
    }

                                                                        
    function _REGISTERINTERFACE36(bytes4 interfaceId) internal {	//inject NONSTANDARD NAMING
        require(interfaceId != 0xffffffff);
        _supportedInterfaces[interfaceId] = true;
    }
}

contract ERC721 is ERC165, IERC721 {
    using SafeMath for uint256;
    using Address for address;
    using Counters for Counters.Counter;

    // Equals to `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
    // which can be also obtained as `IERC721Receiver(0).onERC721Received.selector`
    bytes4 private constant _erc721_received45 = 0x150b7a02;	//inject NONSTANDARD NAMING

    // Mapping from token ID to owner
    mapping (uint256 => address) private _tokenOwner;

    // Mapping from token ID to approved address
    mapping (uint256 => address) private _tokenApprovals;

    // Mapping from owner to number of owned token
    mapping (address => Counters.Counter) private _ownedTokensCount;

    // Mapping from owner to operator approvals
    mapping (address => mapping (address => bool)) private _operatorApprovals;

    bytes4 private constant _interface_id_erc721354 = 0x80ac58cd;	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

    constructor () public {
        // register the supported interfaces to conform to ERC721 via ERC165
        _REGISTERINTERFACE36(_interface_id_erc721354);
    }

                                                                                                                                                                                                    
    function BALANCEOF936(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        require(owner != address(0));
        return _ownedTokensCount[owner].CURRENT536();
    }

                                                                                                                                                                                                                   
    function OWNEROF832(uint256 tokenId) public view returns (address) {	//inject NONSTANDARD NAMING
        address owner = _tokenOwner[tokenId];
        require(owner != address(0));
        return owner;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                              
    function APPROVE551(address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        address owner = OWNEROF832(tokenId);
        require(to != owner);
        require(msg.sender == owner || ISAPPROVEDFORALL94(owner, msg.sender));

        _tokenApprovals[tokenId] = to;
        emit APPROVAL66(owner, to, tokenId);
    }

                                                                                                                                                                                                                                                                                      
    function GETAPPROVED321(uint256 tokenId) public view returns (address) {	//inject NONSTANDARD NAMING
        require(_EXISTS798(tokenId));
        return _tokenApprovals[tokenId];
    }

                                                                                                                                                                                                                                                                                             
    function SETAPPROVALFORALL749(address to, bool approved) public {	//inject NONSTANDARD NAMING
        require(to != msg.sender);
        _operatorApprovals[msg.sender][to] = approved;
        emit APPROVALFORALL185(msg.sender, to, approved);
    }

                                                                                                                                                                                                                                                                                                                          
    function ISAPPROVEDFORALL94(address owner, address operator) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _operatorApprovals[owner][operator];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function TRANSFERFROM635(address from, address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        require(_ISAPPROVEDOROWNER35(msg.sender, tokenId));

        _TRANSFERFROM873(from, to, tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function SAFETRANSFERFROM955(address from, address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        SAFETRANSFERFROM955(from, to, tokenId, "");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function SAFETRANSFERFROM955(address from, address to, uint256 tokenId, bytes memory _data) public {	//inject NONSTANDARD NAMING
        TRANSFERFROM635(from, to, tokenId);
        require(_CHECKONERC721RECEIVED848(from, to, tokenId, _data));
    }

                                                                                                                                                                                           
    function _EXISTS798(uint256 tokenId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

                                                                                                                                                                                                                                                                                                                                                                 
    function _ISAPPROVEDOROWNER35(address spender, uint256 tokenId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        address owner = OWNEROF832(tokenId);
        return (spender == owner || GETAPPROVED321(tokenId) == spender || ISAPPROVEDFORALL94(owner, spender));
    }

                                                                                                                                                                                                                                            
    function _MINT607(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));
        require(!_EXISTS798(tokenId));

        _tokenOwner[tokenId] = to;
        _ownedTokensCount[to].INCREMENT851();

        emit TRANSFER131(address(0), to, tokenId);
    }

                                                                                                                                                                                                                                                                          
    function _BURN488(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(OWNEROF832(tokenId) == owner);

        _CLEARAPPROVAL502(tokenId);

        _ownedTokensCount[owner].DECREMENT227();
        _tokenOwner[tokenId] = address(0);

        emit TRANSFER131(owner, address(0), tokenId);
    }

                                                                                                                                                                            
    function _BURN488(uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        _BURN488(OWNEROF832(tokenId), tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                
    function _TRANSFERFROM873(address from, address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(OWNEROF832(tokenId) == from);
        require(to != address(0));

        _CLEARAPPROVAL502(tokenId);

        _ownedTokensCount[from].DECREMENT227();
        _ownedTokensCount[to].INCREMENT851();

        _tokenOwner[tokenId] = to;

        emit TRANSFER131(from, to, tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function _CHECKONERC721RECEIVED848(address from, address to, uint256 tokenId, bytes memory _data)	//inject NONSTANDARD NAMING
        internal returns (bool)
    {
        if (!to.ISCONTRACT286()) {
            return true;
        }

        bytes4 retval = IERC721Receiver(to).ONERC721RECEIVED297(msg.sender, from, tokenId, _data);
        return (retval == _erc721_received45);
    }

                                                                                                                                                          
    function _CLEARAPPROVAL502(uint256 tokenId) private {	//inject NONSTANDARD NAMING
        if (_tokenApprovals[tokenId] != address(0)) {
            _tokenApprovals[tokenId] = address(0);
        }
    }
}

contract IERC721Enumerable is IERC721 {
    function TOTALSUPPLY302() public view returns (uint256);	//inject NONSTANDARD NAMING
    function TOKENOFOWNERBYINDEX709(address owner, uint256 index) public view returns (uint256 tokenId);	//inject NONSTANDARD NAMING

    function TOKENBYINDEX597(uint256 index) public view returns (uint256);	//inject NONSTANDARD NAMING
}

contract ERC721Holder is IERC721Receiver {
    function ONERC721RECEIVED297(address, address, uint256, bytes memory) public returns (bytes4) {	//inject NONSTANDARD NAMING
        return this.ONERC721RECEIVED297.selector;
    }
}

contract IERC721Metadata is IERC721 {
    function NAME59() external view returns (string memory);	//inject NONSTANDARD NAMING
    function SYMBOL27() external view returns (string memory);	//inject NONSTANDARD NAMING
    function TOKENURI352(uint256 tokenId) external view returns (string memory);	//inject NONSTANDARD NAMING
}

contract ERC721Enumerable is ERC165, ERC721, IERC721Enumerable {
    // Mapping from owner to list of owned token IDs
    mapping(address => uint256[]) private _ownedTokens;

    // Mapping from token ID to index of the owner tokens list
    mapping(uint256 => uint256) private _ownedTokensIndex;

    // Array with all token ids, used for enumeration
    uint256[] private _allTokens;

    // Mapping from token id to position in the allTokens array
    mapping(uint256 => uint256) private _allTokensIndex;

    bytes4 private constant _interface_id_erc721_enumerable940 = 0x780e9d63;	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                 

                                                
    constructor () public {
        // register the supported interface to conform to ERC721Enumerable via ERC165
        _REGISTERINTERFACE36(_interface_id_erc721_enumerable940);
    }

                                                                                                                                                                                                                                                                                                                                                                              
    function TOKENOFOWNERBYINDEX709(address owner, uint256 index) public view returns (uint256) {	//inject NONSTANDARD NAMING
        require(index < BALANCEOF936(owner));
        return _ownedTokens[owner][index];
    }

                                                                                                                                                 
    function TOTALSUPPLY302() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allTokens.length;
    }

                                                                                                                                                                                                                                                                                                                                          
    function TOKENBYINDEX597(uint256 index) public view returns (uint256) {	//inject NONSTANDARD NAMING
        require(index < TOTALSUPPLY302());
        return _allTokens[index];
    }

                                                                                                                                                                                                                                                                                                                                                                                
    function _TRANSFERFROM873(address from, address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._TRANSFERFROM873(from, to, tokenId);

        _REMOVETOKENFROMOWNERENUMERATION773(from, tokenId);

        _ADDTOKENTOOWNERENUMERATION866(to, tokenId);
    }

                                                                                                                                                                                                                                                        
    function _MINT607(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._MINT607(to, tokenId);

        _ADDTOKENTOOWNERENUMERATION866(to, tokenId);

        _ADDTOKENTOALLTOKENSENUMERATION292(tokenId);
    }

                                                                                                                                                                                                                                                                         
    function _BURN488(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._BURN488(owner, tokenId);

        _REMOVETOKENFROMOWNERENUMERATION773(owner, tokenId);
        // Since tokenId will be deleted, we can clear its slot in _ownedTokensIndex to trigger a gas refund
        _ownedTokensIndex[tokenId] = 0;

        _REMOVETOKENFROMALLTOKENSENUMERATION868(tokenId);
    }

                                                                                                                                                                                                     
    function _TOKENSOFOWNER569(address owner) internal view returns (uint256[] storage) {	//inject NONSTANDARD NAMING
        return _ownedTokens[owner];
    }

                                                                                                                                                                                                                                                                                               
    function _ADDTOKENTOOWNERENUMERATION866(address to, uint256 tokenId) private {	//inject NONSTANDARD NAMING
        _ownedTokensIndex[tokenId] = _ownedTokens[to].length;
        _ownedTokens[to].push(tokenId);
    }

                                                                                                                                                                                            
    function _ADDTOKENTOALLTOKENSENUMERATION292(uint256 tokenId) private {	//inject NONSTANDARD NAMING
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function _REMOVETOKENFROMOWNERENUMERATION773(address from, uint256 tokenId) private {	//inject NONSTANDARD NAMING
        // To prevent a gap in from's tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _ownedTokens[from].length.SUB204(1);
        uint256 tokenIndex = _ownedTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary
        if (tokenIndex != lastTokenIndex) {
            uint256 lastTokenId = _ownedTokens[from][lastTokenIndex];

            _ownedTokens[from][tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
            _ownedTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index
        }

        // This also deletes the contents at the last position of the array
        _ownedTokens[from].length--;

        // Note that _ownedTokensIndex[tokenId] hasn't been cleared: it still points to the old slot (now occupied by
        // lastTokenId, or just over the end of the array if the token was the last one).
    }

                                                                                                                                                                                                                                                                                         
    function _REMOVETOKENFROMALLTOKENSENUMERATION868(uint256 tokenId) private {	//inject NONSTANDARD NAMING
        // To prevent a gap in the tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _allTokens.length.SUB204(1);
        uint256 tokenIndex = _allTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary. However, since this occurs so
        // rarely (when the last minted token is burnt) that we still do the swap here to avoid the gas cost of adding
        // an 'if' statement (like in _removeTokenFromOwnerEnumeration)
        uint256 lastTokenId = _allTokens[lastTokenIndex];

        _allTokens[tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
        _allTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index

        // This also deletes the contents at the last position of the array
        _allTokens.length--;
        _allTokensIndex[tokenId] = 0;
    }
}

contract ERC721Metadata is ERC165, ERC721, IERC721Metadata {
    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Optional mapping for token URIs
    mapping(uint256 => string) private _tokenURIs;

    bytes4 private constant _interface_id_erc721_metadata599 = 0x5b5e139f;	//inject NONSTANDARD NAMING
                                                                                                                                                                          

                                                
    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;

        // register the supported interfaces to conform to ERC721 via ERC165
        _REGISTERINTERFACE36(_interface_id_erc721_metadata599);
    }

                                                                                                 
    function NAME59() external view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                     
    function SYMBOL27() external view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                
    function TOKENURI352(uint256 tokenId) external view returns (string memory) {	//inject NONSTANDARD NAMING
        require(_EXISTS798(tokenId));
        return _tokenURIs[tokenId];
    }

                                                                                                                                                                                                                                      
    function _SETTOKENURI71(uint256 tokenId, string memory uri) internal {	//inject NONSTANDARD NAMING
        require(_EXISTS798(tokenId));
        _tokenURIs[tokenId] = uri;
    }

                                                                                                                                                                                                                                                                                           
    function _BURN488(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._BURN488(owner, tokenId);

        // Clear metadata (if any)
        if (bytes(_tokenURIs[tokenId]).length != 0) {
            delete _tokenURIs[tokenId];
        }
    }
}

contract ERC721Full is ERC721, ERC721Enumerable, ERC721Metadata {
    constructor (string memory name, string memory symbol) public ERC721Metadata(name, symbol) {
        // solhint-disable-previous-line no-empty-blocks
    }
}

contract Gener8tiveKBlocksERC721 is Ownable, ERC721Full, ERC721Holder, usingOraclize
{
    using SafeMath for uint8;
    using SafeMath for uint16;
    using Counters for Counters.Counter;

    // =======================================================
    // EVENTS
    // =======================================================
    event CAUSEBENEFICIARYCHANGED0(address indexed);	//inject NONSTANDARD NAMING
    event TOKENURIUPDATED137(uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event FUNDSWITHDRAWN636(address recipient, uint256 amount);	//inject NONSTANDARD NAMING

    // =======================================================
    // STATE
    // =======================================================
    Counters.Counter private tokenId;
    
    address payable public causeBeneficiary;
    
    uint256 public constant price15 = 275 finney;	//inject NONSTANDARD NAMING
    uint256 public constant feepercentage40 = 15;	//inject NONSTANDARD NAMING
    uint8 public constant maxsupply429 = 250;	//inject NONSTANDARD NAMING
    uint8 public constant creatorsupply503 = 50;	//inject NONSTANDARD NAMING
    
    // =======================================================
    // CONSTRUCTOR
    // =======================================================
    constructor (string memory _name, string memory _symbol, address payable _causeBeneficiary) public
        ERC721Full(_name, _symbol)
    {
        causeBeneficiary = _causeBeneficiary;
    }

    // =======================================================
    // STRURCTS & ENUMS
    // =======================================================
    struct Rectangle {
        uint8 index;
        uint8 x;
        uint8 y;
        uint8 width;
        uint8 height;
        uint16 color;
        uint16 saturation;
        uint16 colorRatio;
        uint16 transparency;
    }

     struct Circle {
         uint8 x;
         uint8 y;
         uint8 r;
         uint16 color;
     }

    // =======================================================
    // ADMIN
    // =======================================================
    function CHANGECAUSEBENEFICIARY431(address payable newCauseBeneficiary)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER962
    {
        causeBeneficiary = newCauseBeneficiary;
        emit CAUSEBENEFICIARYCHANGED0(causeBeneficiary);
    }

    function UPDATETOKENURI916(uint256 _tokenId, string memory newTokenURI)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER962
    {
        super._SETTOKENURI71(_tokenId, newTokenURI);
        emit TOKENURIUPDATED137(_tokenId);
    }

    function WITHDRAWFUNDS751(address payable recipient, uint256 amount)	//inject NONSTANDARD NAMING
        public
        ONLYOWNER962
    {
        recipient.transfer(amount);
        emit FUNDSWITHDRAWN636(recipient, amount);
    }

    // =======================================================
    // UTILS & HELPERS
    // =======================================================
    function MUL16358(uint16 a, uint16 b) internal pure returns (uint16) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint16 c = a * b;
        require(c / a == b);

        return c;
    }

    function MUL256416(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

    function DIV16998(uint16 a, uint16 b) internal pure returns (uint16) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint16 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function DIV256208(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    // =======================================================
    // PUBLIC API
    // =======================================================
    function MINT94()	//inject NONSTANDARD NAMING
        external
        payable
    {
        // ensure the max supply has not been reached
        require(TOTALSUPPLY302() < maxsupply429, "Max tokens issued");
        
        // the following block applicable for public minting
        if(msg.sender != OWNER255()) {
            // ensure sufficient funds were sent
            require(msg.value >= price15, "Insufficient ETH sent with transaction");

            // calculate system fees percentage
            uint256 fee = DIV256208(MUL256416(feepercentage40, msg.value), 100);

            // send to cause beneficiary (revert if no beneficiary is set)
            require(causeBeneficiary != address(0), "Cause Beneficiary not set");
            causeBeneficiary.transfer(msg.value - fee);
        }
        else {
            require(TOTALSUPPLY302() < creatorsupply503, "Max number creator tokens already issued");
        }

        string memory tokenIdStr = UINT2STR194(tokenId.CURRENT536());

        super._MINT607(msg.sender, tokenId.CURRENT536());
        super._SETTOKENURI71(tokenId.CURRENT536(), STRCONCAT665("https://api.gener8tive.io/kcompositions/tokens/metadata/", tokenIdStr));

        tokenId.INCREMENT851();
    }

    function TOKENSOWNED546(address ownerAddress)	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256[] memory)
    {
        return super._TOKENSOFOWNER569(ownerAddress);
    }

    function DRAWKCOMPOSISTION512(uint256 _tokenId)	//inject NONSTANDARD NAMING
        public
        view
        returns(bytes32 idKeccak, Rectangle[] memory rectangles, Circle memory circle)
    {
        if(!ISOWNER604()) {
            // only allow viewing of composition data of tokens that have already been minted
            require(_EXISTS798(_tokenId), "Requested token does not exist yet");
        }

        idKeccak = keccak256(abi.encodePacked(_tokenId));
        
        uint8 numHashParts = uint8(idKeccak.length);
        
        rectangles = new Rectangle[](numHashParts / 3);
        
        uint8 pointer = 0;
        for(uint8 i = 0; i < rectangles.length; i++) {
            uint8 rectVal1 = uint8((idKeccak[pointer] >> 4) & 0x0f);
            uint8 rectVal2 = uint8(idKeccak[pointer] & 0x0f);
            uint8 rectVal3 = uint8((idKeccak[++pointer] >> 4) & 0x0f);
            uint8 rectVal4 = uint8(uint8(idKeccak[pointer] & 0x0f));
            uint8 rectVal5 = uint8((idKeccak[++pointer] >> 4) & 0x0f);
            uint8 rectVal6 = uint8(uint8(idKeccak[pointer] & 0x0f));

            //limit colorRatio to avoid whites
            uint16 crValue = DIV16998(MUL16358(rectVal5, 100), 15);
            if(crValue > 90) {
                crValue = 90;
            }
            
            uint16 tmpSaturation = DIV16998(MUL16358(rectVal3, 100), 15);

            Rectangle memory r = Rectangle({
                index: i,
                x: rectVal1,
                y: rectVal2,
                width: rectVal3,
                height: rectVal4,
                color: DIV16998(MUL16358(rectVal1, 360), 15),
                saturation: tmpSaturation > 95 ? 95 : tmpSaturation,
                colorRatio: crValue,
                transparency: rectVal6 < 1 ? 1 : rectVal6
            });

            pointer++;

            rectangles[i] = r;
        }

        circle =  Circle({
            x: uint8((idKeccak[pointer] >> 4) & 0x0f),
            y: uint8(idKeccak[pointer] & 0x0f),
            r: uint8((idKeccak[++pointer] >> 4) & 0x0f),
            color: DIV16998(MUL16358(uint8(idKeccak[pointer] & 0x0f), 360), 15)
        });
    }

    function GETSUPPLYDATA740(address ownerAddress)	//inject NONSTANDARD NAMING
        external
        view
        returns(
            uint8 supplyDataMaxSupply,
            uint8 supplyDataCreatorSupply,
            address supplyDataCauseBeneficiary,
            uint256 supplyDataPrice,
            uint256 supplyDataFeePercentage,
            uint256 supplyDataTotalSupply,
            uint256[] memory ownedTokens)
    {
        supplyDataCauseBeneficiary = causeBeneficiary;
        supplyDataPrice = price15;
        supplyDataFeePercentage = feepercentage40;
        supplyDataMaxSupply = maxsupply429;
        supplyDataCreatorSupply = creatorsupply503;
        supplyDataTotalSupply = TOTALSUPPLY302();
        ownedTokens = TOKENSOWNED546(ownerAddress);
    }

    function GETTOKENDATA359(uint256 _tokenId)	//inject NONSTANDARD NAMING
        external
        view
        returns(
            bytes32 idKeccak,
            Rectangle[] memory rectangles,
            Circle memory circle,
            string memory tokenURI,
            address owner)
    {
        (idKeccak, rectangles, circle) = DRAWKCOMPOSISTION512(_tokenId);
        tokenURI = this.TOKENURI352(_tokenId);
        owner = OWNEROF832(_tokenId);
    }
}