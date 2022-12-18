                                                                 

pragma solidity 0.5.10;


contract Context {
    
    
    constructor () internal { }
    

    function _MSGSENDER957() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA552() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; 
        return msg.data;
    }
}

interface IERC20 {
    
    function TOTALSUPPLY965() external view returns (uint256);	//inject NONSTANDARD NAMING

    
    function BALANCEOF117(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

    
    function TRANSFER890(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    
    function ALLOWANCE867(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    
    function APPROVE752(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    
    function TRANSFERFROM264(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

    
    event TRANSFER470(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    
    event APPROVAL202(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
    
    function ADD499(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    
    function SUB872(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB872(a, b, "SafeMath: subtraction overflow");
    }

    
    function SUB872(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    
    function MUL960(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        
        
        
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    
    function DIV346(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV346(a, b, "SafeMath: division by zero");
    }

    
    function DIV346(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        
        require(b > 0, errorMessage);
        uint256 c = a / b;
        

        return c;
    }

    
    function MOD332(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD332(a, b, "SafeMath: modulo by zero");
    }

    
    function MOD332(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    
    function TOTALSUPPLY965() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    
    function BALANCEOF117(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    
    function TRANSFER890(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER293(_MSGSENDER957(), recipient, amount);
        return true;
    }

    
    function ALLOWANCE867(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    
    function APPROVE752(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE826(_MSGSENDER957(), spender, amount);
        return true;
    }

    
    function TRANSFERFROM264(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER293(sender, recipient, amount);
        _APPROVE826(sender, _MSGSENDER957(), _allowances[sender][_MSGSENDER957()].SUB872(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    
    function INCREASEALLOWANCE67(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE826(_MSGSENDER957(), spender, _allowances[_MSGSENDER957()][spender].ADD499(addedValue));
        return true;
    }

    
    function DECREASEALLOWANCE644(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE826(_MSGSENDER957(), spender, _allowances[_MSGSENDER957()][spender].SUB872(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    
    function _TRANSFER293(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB872(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD499(amount);
        emit TRANSFER470(sender, recipient, amount);
    }

    
    function _MINT338(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD499(amount);
        _balances[account] = _balances[account].ADD499(amount);
        emit TRANSFER470(address(0), account, amount);
    }

     
    function _BURN243(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB872(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB872(amount);
        emit TRANSFER470(account, address(0), amount);
    }

    
    function _APPROVE826(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL202(owner, spender, amount);
    }

    
    function _BURNFROM98(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN243(account, amount);
        _APPROVE826(account, _MSGSENDER957(), _allowances[account][_MSGSENDER957()].SUB872(amount, "ERC20: burn amount exceeds allowance"));
    }
}

library BytesLib {
    function CONCAT108(bytes memory _preBytes, bytes memory _postBytes) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        bytes memory tempBytes;

        assembly {
            
            
            tempBytes := mload(0x40)

            
            
            let length := mload(_preBytes)
            mstore(tempBytes, length)

            
            
            
            let mc := add(tempBytes, 0x20)
            
            
            let end := add(mc, length)

            for {
                
                
                let cc := add(_preBytes, 0x20)
            } lt(mc, end) {
                
                mc := add(mc, 0x20)
                cc := add(cc, 0x20)
            } {
                
                
                mstore(mc, mload(cc))
            }

            
            
            
            length := mload(_postBytes)
            mstore(tempBytes, add(length, mload(tempBytes)))

            
            
            mc := end
            
            
            end := add(mc, length)

            for {
                let cc := add(_postBytes, 0x20)
            } lt(mc, end) {
                mc := add(mc, 0x20)
                cc := add(cc, 0x20)
            } {
                mstore(mc, mload(cc))
            }

            
            
            
            
            
            mstore(0x40, and(
                add(add(end, iszero(add(length, mload(_preBytes)))), 31),
                not(31) 
            ))
        }

        return tempBytes;
    }

    function CONCATSTORAGE93(bytes storage _preBytes, bytes memory _postBytes) internal {	//inject NONSTANDARD NAMING
        assembly {
            
            
            
            let fslot := sload(_preBytes_slot)
            
            
            
            
            
            
            
            let slength := div(and(fslot, sub(mul(0x100, iszero(and(fslot, 1))), 1)), 2)
            let mlength := mload(_postBytes)
            let newlength := add(slength, mlength)
            
            
            
            switch add(lt(slength, 32), lt(newlength, 32))
            case 2 {
                
                
                
                sstore(
                    _preBytes_slot,
                    
                    
                    add(
                        
                        
                        fslot,
                        add(
                            mul(
                                div(
                                    
                                    mload(add(_postBytes, 0x20)),
                                    
                                    exp(0x100, sub(32, mlength))
                        ),
                        
                        
                        exp(0x100, sub(32, newlength))
                        ),
                        
                        
                        mul(mlength, 2)
                        )
                    )
                )
            }
            case 1 {
                
                
                
                mstore(0x0, _preBytes_slot)
                let sc := add(keccak256(0x0, 0x20), div(slength, 32))

                
                sstore(_preBytes_slot, add(mul(newlength, 2), 1))

                
                
                
                
                
                
                
                

                let submod := sub(32, slength)
                let mc := add(_postBytes, submod)
                let end := add(_postBytes, mlength)
                let mask := sub(exp(0x100, submod), 1)

                sstore(
                    sc,
                    add(
                        and(
                            fslot,
                            0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00
                    ),
                    and(mload(mc), mask)
                    )
                )

                for {
                    mc := add(mc, 0x20)
                    sc := add(sc, 1)
                } lt(mc, end) {
                    sc := add(sc, 1)
                    mc := add(mc, 0x20)
                } {
                    sstore(sc, mload(mc))
                }

                mask := exp(0x100, sub(mc, end))

                sstore(sc, mul(div(mload(mc), mask), mask))
            }
            default {
                
                mstore(0x0, _preBytes_slot)
                
                let sc := add(keccak256(0x0, 0x20), div(slength, 32))

                
                sstore(_preBytes_slot, add(mul(newlength, 2), 1))

                
                
                let slengthmod := mod(slength, 32)
                let mlengthmod := mod(mlength, 32)
                let submod := sub(32, slengthmod)
                let mc := add(_postBytes, submod)
                let end := add(_postBytes, mlength)
                let mask := sub(exp(0x100, submod), 1)

                sstore(sc, add(sload(sc), and(mload(mc), mask)))

                for {
                    sc := add(sc, 1)
                    mc := add(mc, 0x20)
                } lt(mc, end) {
                    sc := add(sc, 1)
                    mc := add(mc, 0x20)
                } {
                    sstore(sc, mload(mc))
                }

                mask := exp(0x100, sub(mc, end))

                sstore(sc, mul(div(mload(mc), mask), mask))
            }
        }
    }

    function SLICE930(bytes memory _bytes, uint _start, uint _length) internal  pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        require(_bytes.length >= (_start + _length), "Slice out of bounds");

        bytes memory tempBytes;

        assembly {
            switch iszero(_length)
            case 0 {
                
                
                tempBytes := mload(0x40)

                
                
                
                
                
                
                
                
                let lengthmod := and(_length, 31)

                
                
                
                
                let mc := add(add(tempBytes, lengthmod), mul(0x20, iszero(lengthmod)))
                let end := add(mc, _length)

                for {
                    
                    
                    let cc := add(add(add(_bytes, lengthmod), mul(0x20, iszero(lengthmod))), _start)
                } lt(mc, end) {
                    mc := add(mc, 0x20)
                    cc := add(cc, 0x20)
                } {
                    mstore(mc, mload(cc))
                }

                mstore(tempBytes, _length)

                
                
                mstore(0x40, and(add(mc, 31), not(31)))
            }
            
            default {
                tempBytes := mload(0x40)

                mstore(0x40, add(tempBytes, 0x20))
            }
        }

        return tempBytes;
    }

    function TOADDRESS166(bytes memory _bytes, uint _start) internal  pure returns (address) {	//inject NONSTANDARD NAMING
        require(_bytes.length >= (_start + 20), "Address conversion out of bounds.");
        address tempAddress;

        assembly {
            tempAddress := div(mload(add(add(_bytes, 0x20), _start)), 0x1000000000000000000000000)
        }

        return tempAddress;
    }

    function TOUINT953(bytes memory _bytes, uint _start) internal  pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(_bytes.length >= (_start + 32), "Uint conversion out of bounds.");
        uint256 tempUint;

        assembly {
            tempUint := mload(add(add(_bytes, 0x20), _start))
        }

        return tempUint;
    }

    function EQUAL650(bytes memory _preBytes, bytes memory _postBytes) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        bool success = true;

        assembly {
            let length := mload(_preBytes)

            
            switch eq(length, mload(_postBytes))
            case 1 {
                
                
                
                
                let cb := 1

                let mc := add(_preBytes, 0x20)
                let end := add(mc, length)

                for {
                    let cc := add(_postBytes, 0x20)
                    
                    
                } eq(add(lt(mc, end), cb), 2) {
                    mc := add(mc, 0x20)
                    cc := add(cc, 0x20)
                } {
                    
                    if iszero(eq(mload(mc), mload(cc))) {
                        
                        success := 0
                        cb := 0
                    }
                }
            }
            default {
                
                success := 0
            }
        }

        return success;
    }

    function EQUALSTORAGE562(bytes storage _preBytes, bytes memory _postBytes) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bool success = true;

        assembly {
            
            let fslot := sload(_preBytes_slot)
            
            let slength := div(and(fslot, sub(mul(0x100, iszero(and(fslot, 1))), 1)), 2)
            let mlength := mload(_postBytes)

            
            switch eq(slength, mlength)
            case 1 {
                
                
                
                if iszero(iszero(slength)) {
                    switch lt(slength, 32)
                    case 1 {
                        
                        fslot := mul(div(fslot, 0x100), 0x100)

                        if iszero(eq(fslot, mload(add(_postBytes, 0x20)))) {
                            
                            success := 0
                        }
                    }
                    default {
                        
                        
                        
                        
                        let cb := 1

                        
                        mstore(0x0, _preBytes_slot)
                        let sc := keccak256(0x0, 0x20)

                        let mc := add(_postBytes, 0x20)
                        let end := add(mc, mlength)

                        
                        
                        for {} eq(add(lt(mc, end), cb), 2) {
                            sc := add(sc, 1)
                            mc := add(mc, 0x20)
                        } {
                            if iszero(eq(sload(sc), mload(mc))) {
                                
                                success := 0
                                cb := 0
                            }
                        }
                    }
                }
            }
            default {
                
                success := 0
            }
        }

        return success;
    }

    function TOBYTES32909(bytes memory _source) pure internal returns (bytes32 result) {	//inject NONSTANDARD NAMING
        bytes memory tempEmptyStringTest = bytes(_source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(_source, 32))
        }
    }
}

library BTCUtils {
    using BytesLib for bytes;
    using SafeMath for uint256;

    
    uint256 public constant diff1_target785 = 0xffff0000000000000000000000000000000000000000000000000000;	//inject NONSTANDARD NAMING

    uint256 public constant retarget_period596 = 2 * 7 * 24 * 60 * 60;  	//inject NONSTANDARD NAMING
    uint256 public constant retarget_period_blocks497 = 2016;  	//inject NONSTANDARD NAMING

    
    
    

    
    
    
    
    function DETERMINEVARINTDATALENGTH213(bytes memory _flag) internal pure returns (uint8) {	//inject NONSTANDARD NAMING
        if (uint8(_flag[0]) == 0xff) {
            return 8;  
        }
        if (uint8(_flag[0]) == 0xfe) {
            return 4;  
        }
        if (uint8(_flag[0]) == 0xfd) {
            return 2;  
        }

        return 0;  
    }

    
    
    
    
    function REVERSEENDIANNESS199(bytes memory _b) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        bytes memory _newValue = new bytes(_b.length);

        for (uint i = 0; i < _b.length; i++) {
            _newValue[_b.length - i - 1] = _b[i];
        }

        return _newValue;
    }

    
    
    
    
    function BYTESTOUINT602(bytes memory _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 _number;

        for (uint i = 0; i < _b.length; i++) {
            _number = _number + uint8(_b[i]) * (2 ** (8 * (_b.length - (i + 1))));
        }

        return _number;
    }

    
    
    
    
    function LASTBYTES625(bytes memory _b, uint256 _num) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        uint256 _start = _b.length.SUB872(_num);

        return _b.SLICE930(_start, _num);
    }

    
    
    
    
    function HASH160910(bytes memory _b) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        return abi.encodePacked(ripemd160(abi.encodePacked(sha256(_b))));
    }

    
    
    
    
    function HASH25661(bytes memory _b) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        return abi.encodePacked(sha256(abi.encodePacked(sha256(_b)))).TOBYTES32909();
    }

    
    
    

    
    
    
    
    
    function EXTRACTINPUTATINDEX111(bytes memory _vin, uint8 _index) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        uint256 _len;
        bytes memory _remaining;

        uint256 _offset = 1;

        for (uint8 _i = 0; _i < _index; _i ++) {
            _remaining = _vin.SLICE930(_offset, _vin.length - _offset);
            _len = DETERMINEINPUTLENGTH11(_remaining);
            _offset = _offset + _len;
        }

        _remaining = _vin.SLICE930(_offset, _vin.length - _offset);
        _len = DETERMINEINPUTLENGTH11(_remaining);
        return _vin.SLICE930(_offset, _len);
    }

    
    
    
    
    function ISLEGACYINPUT247(bytes memory _input) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        return keccak256(_input.SLICE930(36, 1)) != keccak256(hex"00");
    }

    
    
    
    
    function DETERMINEINPUTLENGTH11(bytes memory _input) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint8 _varIntDataLen;
        uint256 _scriptSigLen;
        (_varIntDataLen, _scriptSigLen) = EXTRACTSCRIPTSIGLEN48(_input);
        return 36 + 1 + _varIntDataLen + _scriptSigLen + 4;
    }

    
    
    
    
    function EXTRACTSEQUENCELELEGACY342(bytes memory _input) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        uint8 _varIntDataLen;
        uint256 _scriptSigLen;
        (_varIntDataLen, _scriptSigLen) = EXTRACTSCRIPTSIGLEN48(_input);
        return _input.SLICE930(36 + 1 + _varIntDataLen + _scriptSigLen, 4);
    }

    
    
    
    
    function EXTRACTSEQUENCELEGACY458(bytes memory _input) internal pure returns (uint32) {	//inject NONSTANDARD NAMING
        bytes memory _leSeqence = EXTRACTSEQUENCELELEGACY342(_input);
        bytes memory _beSequence = REVERSEENDIANNESS199(_leSeqence);
        return uint32(BYTESTOUINT602(_beSequence));
    }
    
    
    
    
    function EXTRACTSCRIPTSIG40(bytes memory _input) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        uint8 _varIntDataLen;
        uint256 _scriptSigLen;
        (_varIntDataLen, _scriptSigLen) = EXTRACTSCRIPTSIGLEN48(_input);
        return _input.SLICE930(36, 1 + _varIntDataLen + _scriptSigLen);
    }

    
    
    
    
    function EXTRACTSCRIPTSIGLEN48(bytes memory _input) internal pure returns (uint8, uint256) {	//inject NONSTANDARD NAMING
        bytes memory _varIntTag = _input.SLICE930(36, 1);
        uint8 _varIntDataLen = DETERMINEVARINTDATALENGTH213(_varIntTag);
        uint256 _len;
        if (_varIntDataLen == 0) {
            _len = uint8(_varIntTag[0]);
        } else {
            _len = BYTESTOUINT602(REVERSEENDIANNESS199(_input.SLICE930(36 + 1, _varIntDataLen)));
        }
        return (_varIntDataLen, _len);
    }


    
    
    

    
    
    
    
    function EXTRACTSEQUENCELEWITNESS769(bytes memory _input) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        return _input.SLICE930(37, 4);
    }

    
    
    
    
    function EXTRACTSEQUENCEWITNESS872(bytes memory _input) internal pure returns (uint32) {	//inject NONSTANDARD NAMING
        bytes memory _leSeqence = EXTRACTSEQUENCELEWITNESS769(_input);
        bytes memory _inputeSequence = REVERSEENDIANNESS199(_leSeqence);
        return uint32(BYTESTOUINT602(_inputeSequence));
    }

    
    
    
    
    function EXTRACTOUTPOINT19(bytes memory _input) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        return _input.SLICE930(0, 36);
    }

    
    
    
    
    function EXTRACTINPUTTXIDLE339(bytes memory _input) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        return _input.SLICE930(0, 32).TOBYTES32909();
    }

    
    
    
    
    function EXTRACTINPUTTXID30(bytes memory _input) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        bytes memory _leId = abi.encodePacked(EXTRACTINPUTTXIDLE339(_input));
        bytes memory _beId = REVERSEENDIANNESS199(_leId);
        return _beId.TOBYTES32909();
    }

    
    
    
    
    function EXTRACTTXINDEXLE835(bytes memory _input) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        return _input.SLICE930(32, 4);
    }

    
    
    
    
    function EXTRACTTXINDEX411(bytes memory _input) internal pure returns (uint32) {	//inject NONSTANDARD NAMING
        bytes memory _leIndex = EXTRACTTXINDEXLE835(_input);
        bytes memory _beIndex = REVERSEENDIANNESS199(_leIndex);
        return uint32(BYTESTOUINT602(_beIndex));
    }

    
    
    

    
    
    
    
    function DETERMINEOUTPUTLENGTH745(bytes memory _output) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint8 _len = uint8(_output.SLICE930(8, 1)[0]);
        require(_len < 0xfd, "Multi-byte VarInts not supported");

        return _len + 8 + 1; 
    }

    
    
    
    
    
    function EXTRACTOUTPUTATINDEX309(bytes memory _vout, uint8 _index) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        uint256 _len;
        bytes memory _remaining;

        uint256 _offset = 1;

        for (uint8 _i = 0; _i < _index; _i ++) {
            _remaining = _vout.SLICE930(_offset, _vout.length - _offset);
            _len = DETERMINEOUTPUTLENGTH745(_remaining);
            _offset = _offset + _len;
        }

        _remaining = _vout.SLICE930(_offset, _vout.length - _offset);
        _len = DETERMINEOUTPUTLENGTH745(_remaining);
        return _vout.SLICE930(_offset, _len);
    }

    
    
    
    
    function EXTRACTOUTPUTSCRIPTLEN310(bytes memory _output) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        return _output.SLICE930(8, 1);
    }

    
    
    
    
    function EXTRACTVALUELE539(bytes memory _output) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        return _output.SLICE930(0, 8);
    }

    
    
    
    
    function EXTRACTVALUE780(bytes memory _output) internal pure returns (uint64) {	//inject NONSTANDARD NAMING
        bytes memory _leValue = EXTRACTVALUELE539(_output);
        bytes memory _beValue = REVERSEENDIANNESS199(_leValue);
        return uint64(BYTESTOUINT602(_beValue));
    }

    
    
    
    
    function EXTRACTOPRETURNDATA796(bytes memory _output) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        if (keccak256(_output.SLICE930(9, 1)) != keccak256(hex"6a")) {
            return hex"";
        }
        bytes memory _dataLen = _output.SLICE930(10, 1);
        return _output.SLICE930(11, BYTESTOUINT602(_dataLen));
    }

    
    
    
    
    function EXTRACTHASH235(bytes memory _output) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        if (uint8(_output.SLICE930(9, 1)[0]) == 0) {
            uint256 _len = uint8(EXTRACTOUTPUTSCRIPTLEN310(_output)[0]) - 2;
            
            if (uint8(_output.SLICE930(10, 1)[0]) != uint8(_len)) {
                return hex"";
            }
            return _output.SLICE930(11, _len);
        } else {
            bytes32 _tag = keccak256(_output.SLICE930(8, 3));
            
            if (_tag == keccak256(hex"1976a9")) {
                
                if (uint8(_output.SLICE930(11, 1)[0]) != 0x14 ||
                    keccak256(_output.SLICE930(_output.length - 2, 2)) != keccak256(hex"88ac")) {
                    return hex"";
                }
                return _output.SLICE930(12, 20);
            
            } else if (_tag == keccak256(hex"17a914")) {
                
                if (uint8(_output.SLICE930(_output.length - 1, 1)[0]) != 0x87) {
                    return hex"";
                }
                return _output.SLICE930(11, 20);
            }
        }
        return hex"";  
    }

    
    
    


    
    
    
    
    function VALIDATEVIN520(bytes memory _vin) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        uint256 _offset = 1;
        uint8 _nIns = uint8(_vin.SLICE930(0, 1)[0]);

        
        if (_nIns >= 0xfd || _nIns == 0) {
            return false;
        }

        for (uint8 i = 0; i < _nIns; i++) {
            
            
            _offset += DETERMINEINPUTLENGTH11(_vin.SLICE930(_offset, _vin.length - _offset));

            
            if (_offset > _vin.length) {
                return false;
            }
        }

        
        return _offset == _vin.length;
    }

    
    
    
    
    function VALIDATEVOUT449(bytes memory _vout) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        uint256 _offset = 1;
        uint8 _nOuts = uint8(_vout.SLICE930(0, 1)[0]);

        
        if (_nOuts >= 0xfd || _nOuts == 0) {
            return false;
        }

        for (uint8 i = 0; i < _nOuts; i++) {
            
            
            _offset += DETERMINEOUTPUTLENGTH745(_vout.SLICE930(_offset, _vout.length - _offset));

            
            if (_offset > _vout.length) {
                return false;
            }
        }

        
        return _offset == _vout.length;
    }



    
    
    

    
    
    
    
    function EXTRACTMERKLEROOTLE107(bytes memory _header) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        return _header.SLICE930(36, 32);
    }

    
    
    
    
    function EXTRACTMERKLEROOTBE119(bytes memory _header) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        return REVERSEENDIANNESS199(EXTRACTMERKLEROOTLE107(_header));
    }

    
    
    
    
    function EXTRACTTARGET851(bytes memory _header) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        bytes memory _m = _header.SLICE930(72, 3);
        uint8 _e = uint8(_header[75]);
        uint256 _mantissa = BYTESTOUINT602(REVERSEENDIANNESS199(_m));
        uint _exponent = _e - 3;

        return _mantissa * (256 ** _exponent);
    }

    
    
    
    
    
    function CALCULATEDIFFICULTY246(uint256 _target) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        
        return diff1_target785.DIV346(_target);
    }

    
    
    
    
    function EXTRACTPREVBLOCKLE814(bytes memory _header) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        return _header.SLICE930(4, 32);
    }

    
    
    
    
    function EXTRACTPREVBLOCKBE142(bytes memory _header) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        return REVERSEENDIANNESS199(EXTRACTPREVBLOCKLE814(_header));
    }

    
    
    
    
    function EXTRACTTIMESTAMPLE331(bytes memory _header) internal pure returns (bytes memory) {	//inject NONSTANDARD NAMING
        return _header.SLICE930(68, 4);
    }

    
    
    
    
    function EXTRACTTIMESTAMP670(bytes memory _header) internal pure returns (uint32) {	//inject NONSTANDARD NAMING
        return uint32(BYTESTOUINT602(REVERSEENDIANNESS199(EXTRACTTIMESTAMPLE331(_header))));
    }

    
    
    
    
    function EXTRACTDIFFICULTY362(bytes memory _header) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return CALCULATEDIFFICULTY246(EXTRACTTARGET851(_header));
    }

    
    
    
    
    function _HASH256MERKLESTEP969(bytes memory _a, bytes memory _b) internal pure returns (bytes32) {	//inject NONSTANDARD NAMING
        return HASH25661(abi.encodePacked(_a, _b));
    }

    
    
    
    
    
    function VERIFYHASH256MERKLE686(bytes memory _proof, uint _index) internal pure returns (bool) {	//inject NONSTANDARD NAMING
        
        if (_proof.length % 32 != 0) {
            return false;
        }

        
        if (_proof.length == 32) {
            return true;
        }

        
        if (_proof.length == 64) {
            return false;
        }

        uint _idx = _index;
        bytes32 _root = _proof.SLICE930(_proof.length - 32, 32).TOBYTES32909();
        bytes32 _current = _proof.SLICE930(0, 32).TOBYTES32909();

        for (uint i = 1; i < (_proof.length.DIV346(32)) - 1; i++) {
            if (_idx % 2 == 1) {
                _current = _HASH256MERKLESTEP969(_proof.SLICE930(i * 32, 32), abi.encodePacked(_current));
            } else {
                _current = _HASH256MERKLESTEP969(abi.encodePacked(_current), _proof.SLICE930(i * 32, 32));
            }
            _idx = _idx >> 1;
        }
        return _current == _root;
    }

    
    
    
    
    
    
    
    function RETARGETALGORITHM678(	//inject NONSTANDARD NAMING
        uint256 _previousTarget,
        uint256 _firstTimestamp,
        uint256 _secondTimestamp
    ) internal pure returns (uint256) {
        uint256 _elapsedTime = _secondTimestamp.SUB872(_firstTimestamp);

        
        if (_elapsedTime < retarget_period596.DIV346(4)) {
            _elapsedTime = retarget_period596.DIV346(4);
        }
        if (_elapsedTime > retarget_period596.MUL960(4)) {
            _elapsedTime = retarget_period596.MUL960(4);
        }

        

        uint256 _adjusted = _previousTarget.DIV346(65536).MUL960(_elapsedTime);
        return _adjusted.DIV346(retarget_period596).MUL960(65536);
    }
}

interface FundsInterface {
    function LENDER995(bytes32) external view returns (address);	//inject NONSTANDARD NAMING
    function CUSTOM804(bytes32) external view returns (bool);	//inject NONSTANDARD NAMING
    function DEPOSIT293(bytes32, uint256) external;	//inject NONSTANDARD NAMING
    function DECREASETOTALBORROW539(uint256) external;	//inject NONSTANDARD NAMING
    function CALCGLOBALINTEREST348() external;	//inject NONSTANDARD NAMING
}

interface SalesInterface {
    function SALEINDEXBYLOAN135(bytes32, uint256) external returns(bytes32);	//inject NONSTANDARD NAMING
    function SETTLEMENTEXPIRATION974(bytes32) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ACCEPTED719(bytes32) external view returns (bool);	//inject NONSTANDARD NAMING
    function NEXT403(bytes32) external view returns (uint256);	//inject NONSTANDARD NAMING
    function CREATE811(bytes32, address, address, address, address, bytes32, bytes32, bytes32, bytes32, bytes20) external returns(bytes32);	//inject NONSTANDARD NAMING
}

interface CollateralInterface {
    function ONDEMANDSPV720() external view returns(address);	//inject NONSTANDARD NAMING
    function COLLATERAL996(bytes32 loan) external view returns (uint256);	//inject NONSTANDARD NAMING
    function REFUNDABLECOLLATERAL242(bytes32 loan) external view returns (uint256);	//inject NONSTANDARD NAMING
    function SEIZABLECOLLATERAL99(bytes32 loan) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TEMPORARYREFUNDABLECOLLATERAL64(bytes32 loan) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TEMPORARYSEIZABLECOLLATERAL916(bytes32 loan) external view returns (uint256);	//inject NONSTANDARD NAMING
    function SETCOLLATERAL995(bytes32 loan, uint256 refundableCollateral_, uint256 seizableCollateral_) external;	//inject NONSTANDARD NAMING
    function REQUESTSPV707(bytes32 loan) external;	//inject NONSTANDARD NAMING
    function CANCELSPV301(bytes32 loan) external;	//inject NONSTANDARD NAMING
}

contract DSMath {
    function ADD499(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x + y) >= x);
    }
    function SUB872(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require((z = x - y) <= x);
    }
    function MUL960(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        require(y == 0 || (z = x * y) / y == x);
    }
    function DIV346(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b > 0);
        c = a / b;
    }

    function MIN167(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        return x <= y ? x : y;
    }
    function MAX505(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }
    function IMIN524(int x, int y) internal pure returns (int z) {	//inject NONSTANDARD NAMING
        return x <= y ? x : y;
    }
    function IMAX601(int x, int y) internal pure returns (int z) {	//inject NONSTANDARD NAMING
        return x >= y ? x : y;
    }

    uint constant col161  = 10 ** 8;	//inject NONSTANDARD NAMING
    uint constant wad296  = 10 ** 18;	//inject NONSTANDARD NAMING
    uint constant ray411  = 10 ** 27;	//inject NONSTANDARD NAMING

    function CMUL259(uint x, uint y) public pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD499(MUL960(x, y), col161 / 2) / col161;
    }
    function WMUL703(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD499(MUL960(x, y), wad296 / 2) / wad296;
    }
    function RMUL534(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD499(MUL960(x, y), ray411 / 2) / ray411;
    }
    function CDIV706(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD499(MUL960(x, col161), y / 2) / y;
    }
    function WDIV924(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD499(MUL960(x, wad296), y / 2) / y;
    }
    function RDIV367(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = ADD499(MUL960(x, ray411), y / 2) / y;
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    function RPOW273(uint x, uint n) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
        z = n % 2 != 0 ? x : ray411;

        for (n /= 2; n != 0; n /= 2) {
            x = RMUL534(x, x);

            if (n % 2 != 0) {
                z = RMUL534(z, x);
            }
        }
    }
}

contract Medianizer {
    function PEEK769() external view returns (bytes32, bool);	//inject NONSTANDARD NAMING
    function READ62() external returns (bytes32);	//inject NONSTANDARD NAMING
    function POKE413() external;	//inject NONSTANDARD NAMING
    function POKE413(bytes32) external;	//inject NONSTANDARD NAMING
    function FUND951 (uint256 amount, ERC20 token) external;	//inject NONSTANDARD NAMING
}

contract Loans is DSMath {
    FundsInterface funds;
    Medianizer med;
    SalesInterface sales;
    CollateralInterface col;

    uint256 public constant approve_exp_threshold446 = 4 hours;    	//inject NONSTANDARD NAMING
    uint256 public constant accept_exp_threshold841 = 2 days;      	//inject NONSTANDARD NAMING
    uint256 public constant liquidation_exp_threshold290 = 7 days; 	//inject NONSTANDARD NAMING
    uint256 public constant seizure_exp_threshold41 = 2 days;     	//inject NONSTANDARD NAMING
    uint256 public constant liquidation_discount95 = 930000000000000000; 	//inject NONSTANDARD NAMING
    uint256 public constant max_num_liquidations339 = 3; 	//inject NONSTANDARD NAMING
    uint256 public constant max_uint_256870 = 2**256-1;	//inject NONSTANDARD NAMING

    mapping (bytes32 => Loan)                     public loans;
    mapping (bytes32 => PubKeys)                  public pubKeys;             
    mapping (bytes32 => SecretHashes)             public secretHashes;        
    mapping (bytes32 => Bools)                    public bools;               
    mapping (bytes32 => bytes32)                  public fundIndex;           
    mapping (bytes32 => uint256)                  public repayments;          
    mapping (address => bytes32[])                public borrowerLoans;
    mapping (address => bytes32[])                public lenderLoans;
    mapping (address => mapping(uint256 => bool)) public addressToTimestamp;
    uint256                                       public loanIndex;           

    ERC20 public token; 
    uint256 public decimals;

    address deployer;

    
    struct Loan {
        address borrower;
        address lender;
        address arbiter;
        uint256 createdAt;
        uint256 loanExpiration;
        uint256 requestTimestamp;
        uint256 closedTimestamp;
        uint256 principal;
        uint256 interest;
        uint256 penalty;
        uint256 fee;
        uint256 liquidationRatio;
    }

    
    struct PubKeys {
        bytes   borrowerPubKey;
        bytes   lenderPubKey;
        bytes   arbiterPubKey;
    }

    
    struct SecretHashes {
        bytes32    secretHashA1;
        bytes32[3] secretHashAs;
        bytes32    secretHashB1;
        bytes32[3] secretHashBs;
        bytes32    secretHashC1;
        bytes32[3] secretHashCs;
        bytes32    withdrawSecret;
        bytes32    acceptSecret;
        bool       set;
    }

    
    struct Bools {
        bool funded;
        bool approved;
        bool withdrawn;
        bool sale;
        bool paid;
        bool off;
    }

    event CREATE697(bytes32 loan);	//inject NONSTANDARD NAMING

    event SETSECRETHASHES743(bytes32 loan);	//inject NONSTANDARD NAMING

    event FUNDLOAN869(bytes32 loan);	//inject NONSTANDARD NAMING

    event APPROVE882(bytes32 loan);	//inject NONSTANDARD NAMING

    event WITHDRAW909(bytes32 loan, bytes32 secretA1);	//inject NONSTANDARD NAMING

    event REPAY807(bytes32 loan, uint256 amount);	//inject NONSTANDARD NAMING

    event REFUND325(bytes32 loan);	//inject NONSTANDARD NAMING

    event CANCEL366(bytes32 loan, bytes32 secret);	//inject NONSTANDARD NAMING

    event ACCEPT464(bytes32 loan, bytes32 secret);	//inject NONSTANDARD NAMING

    event LIQUIDATE27(bytes32 loan, bytes32 secretHash, bytes20 pubKeyHash);	//inject NONSTANDARD NAMING

    
    function BORROWER577(bytes32 loan) external view returns (address) {	//inject NONSTANDARD NAMING
        return loans[loan].borrower;
    }

    
    function LENDER995(bytes32 loan) external view returns (address) {	//inject NONSTANDARD NAMING
        return loans[loan].lender;
    }

    
    function ARBITER909(bytes32 loan) external view returns (address) {	//inject NONSTANDARD NAMING
        return loans[loan].arbiter;
    }

    
    function APPROVEEXPIRATION991(bytes32 loan) public view returns (uint256) { 	//inject NONSTANDARD NAMING
        return ADD499(loans[loan].createdAt, approve_exp_threshold446);
    }

    
    function ACCEPTEXPIRATION913(bytes32 loan) public view returns (uint256) { 	//inject NONSTANDARD NAMING
        return ADD499(loans[loan].loanExpiration, accept_exp_threshold841);
    }

    
    function LIQUIDATIONEXPIRATION657(bytes32 loan) public view returns (uint256) { 	//inject NONSTANDARD NAMING
        return ADD499(loans[loan].loanExpiration, liquidation_exp_threshold290);
    }

    
    function SEIZUREEXPIRATION539(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return ADD499(LIQUIDATIONEXPIRATION657(loan), seizure_exp_threshold41);
    }

    
    function PRINCIPAL733(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return loans[loan].principal;
    }

    
    function INTEREST288(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return loans[loan].interest;
    }

    
    function FEE849(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return loans[loan].fee;
    }

    
    function PENALTY967(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return loans[loan].penalty;
    }

    
    function COLLATERAL996(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return col.COLLATERAL996(loan);
    }

    
    function REFUNDABLECOLLATERAL242(bytes32 loan) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return col.REFUNDABLECOLLATERAL242(loan);
    }

    
    function SEIZABLECOLLATERAL99(bytes32 loan) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return col.SEIZABLECOLLATERAL99(loan);
    }

    
    function TEMPORARYREFUNDABLECOLLATERAL64(bytes32 loan) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return col.TEMPORARYREFUNDABLECOLLATERAL64(loan);
    }

    
    function TEMPORARYSEIZABLECOLLATERAL916(bytes32 loan) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return col.TEMPORARYSEIZABLECOLLATERAL916(loan);
    }

    
    function REPAID812(bytes32 loan) public view returns (uint256) { 	//inject NONSTANDARD NAMING
        return repayments[loan];
    }

    
    function LIQUIDATIONRATIO116(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return loans[loan].liquidationRatio;
    }

    
    function OWEDTOLENDER787(bytes32 loan) public view returns (uint256) { 	//inject NONSTANDARD NAMING
        return ADD499(PRINCIPAL733(loan), INTEREST288(loan));
    }

    
    function OWEDFORLOAN948(bytes32 loan) public view returns (uint256) { 	//inject NONSTANDARD NAMING
        return ADD499(OWEDTOLENDER787(loan), FEE849(loan));
    }

    
    function OWEDFORLIQUIDATION356(bytes32 loan) external view returns (uint256) { 	//inject NONSTANDARD NAMING
        return ADD499(OWEDFORLOAN948(loan), PENALTY967(loan));
    }

    
    function OWING706(bytes32 loan) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB872(OWEDFORLOAN948(loan), REPAID812(loan));
    }

    
    function FUNDED285(bytes32 loan) external view returns (bool) {	//inject NONSTANDARD NAMING
        return bools[loan].funded;
    }

    
    function APPROVED438(bytes32 loan) external view returns (bool) {	//inject NONSTANDARD NAMING
        return bools[loan].approved;
    }

    
    function WITHDRAWN804(bytes32 loan) external view returns (bool) {	//inject NONSTANDARD NAMING
        return bools[loan].withdrawn;
    }

    
    function SALE150(bytes32 loan) public view returns (bool) {	//inject NONSTANDARD NAMING
        return bools[loan].sale;
    }

    
    function PAID344(bytes32 loan) external view returns (bool) {	//inject NONSTANDARD NAMING
        return bools[loan].paid;
    }

    
    function OFF979(bytes32 loan) public view returns (bool) {	//inject NONSTANDARD NAMING
        return bools[loan].off;
    }

    
    function DMUL841(uint x) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return MUL960(x, (10 ** SUB872(18, decimals)));
    }

    
    function DDIV856(uint x) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV346(x, (10 ** SUB872(18, decimals)));
    }

    
    function BORROWERLOANCOUNT454(address borrower_) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return borrowerLoans[borrower_].length;
    }

    
    function LENDERLOANCOUNT201(address lender_) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return lenderLoans[lender_].length;
    }

    
    function MINSEIZABLECOLLATERAL819(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
        (bytes32 val, bool set) = med.PEEK769();
        require(set, "Loans.minSeizableCollateral: Medianizer must be set");
        uint256 price = uint(val);
        return DIV346(WDIV924(DMUL841(SUB872(OWEDFORLOAN948(loan), REPAID812(loan))), price), DIV346(wad296, col161));
    }

    
    function COLLATERALVALUE263(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
        (bytes32 val, bool set) = med.PEEK769();
        require(set, "Loans.collateralValue: Medianizer must be set");
        uint256 price = uint(val);
        return CMUL259(price, COLLATERAL996(loan));
    }

    
    function MINCOLLATERALVALUE682(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return RMUL534(DMUL841(SUB872(OWEDFORLOAN948(loan), REPAID812(loan))), LIQUIDATIONRATIO116(loan));
    }

    
    function DISCOUNTCOLLATERALVALUE869(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return WMUL703(COLLATERALVALUE263(loan), liquidation_discount95);
    }

    
    function SAFE557(bytes32 loan) public view returns (bool) {	//inject NONSTANDARD NAMING
        return COLLATERALVALUE263(loan) >= MINCOLLATERALVALUE682(loan);
    }

    
    constructor (FundsInterface funds_, Medianizer med_, ERC20 token_, uint256 decimals_) public {
        require(address(funds_) != address(0), "Funds address must be non-zero");
        require(address(med_) != address(0), "Medianizer address must be non-zero");
        require(address(token_) != address(0), "Token address must be non-zero");

        deployer = msg.sender;
        funds = funds_;
        med = med_;
        token = token_;
        decimals = decimals_;
        require(token.APPROVE752(address(funds), max_uint_256870), "Token approve failed");
    }

    
    
    
    
    
    

    
    function SETSALES448(SalesInterface sales_) external {	//inject NONSTANDARD NAMING
        require(msg.sender == deployer, "Loans.setSales: Only the deployer can perform this");
        require(address(sales) == address(0), "Loans.setSales: The Sales address has already been set");
        require(address(sales_) != address(0), "Loans.setSales: Sales address must be non-zero");
        sales = sales_;
    }

    
    function SETCOLLATERAL995(CollateralInterface col_) external {	//inject NONSTANDARD NAMING
        require(msg.sender == deployer, "Loans.setCollateral: Only the deployer can perform this");
        require(address(col) == address(0), "Loans.setCollateral: The Collateral address has already been set");
        require(address(col_) != address(0), "Loans.setCollateral: Collateral address must be non-zero");
        col = col_;
    }
    

    
    function CREATE811(	//inject NONSTANDARD NAMING
        uint256             loanExpiration_,
        address[3] calldata usrs_,
        uint256[7] calldata vals_,
        bytes32             fund
    ) external returns (bytes32 loan) {
        if (fund != bytes32(0)) {
            require(funds.LENDER995(fund) == usrs_[1], "Loans.create: Lender of Fund not in args");
        }
        require(!addressToTimestamp[usrs_[0]][vals_[6]], "Loans.create: Duplicate request timestamps are not allowed");
        require(loanExpiration_ > now, "Loans.create: loanExpiration must be greater than `now`");
        require(usrs_[0] != address(0) && usrs_[1] != address(0), "Loans.create: Borrower and Lender address must be non-zero");
        require(vals_[0] != 0 && vals_[4] != 0, "Loans.create: Principal and Collateral must be non-zero");
        require(vals_[5] != 0 && vals_[6] != 0, "Loans.create: Liquidation ratio and Request timestamp must be non-zero");

        loanIndex = ADD499(loanIndex, 1);
        loan = bytes32(loanIndex);
        loans[loan].createdAt = now;
        loans[loan].loanExpiration = loanExpiration_;
        loans[loan].borrower = usrs_[0];
        loans[loan].lender = usrs_[1];
        loans[loan].arbiter = usrs_[2];
        loans[loan].principal = vals_[0];
        loans[loan].interest = vals_[1];
        loans[loan].penalty = vals_[2];
        loans[loan].fee = vals_[3];
        uint256 minSeizableCol = MINSEIZABLECOLLATERAL819(loan);
        col.SETCOLLATERAL995(loan, SUB872(vals_[4], minSeizableCol), minSeizableCol);
        loans[loan].liquidationRatio = vals_[5];
        loans[loan].requestTimestamp = vals_[6];
        fundIndex[loan] = fund;
        secretHashes[loan].set = false;
        borrowerLoans[usrs_[0]].push(bytes32(loanIndex));
        lenderLoans[usrs_[1]].push(bytes32(loanIndex));
        addressToTimestamp[usrs_[0]][vals_[6]] = true;

        emit CREATE697(loan);
    }

    
    function SETSECRETHASHES97(	//inject NONSTANDARD NAMING
        bytes32             loan,
        bytes32[4] calldata borrowerSecretHashes,
        bytes32[4] calldata lenderSecretHashes,
        bytes32[4] calldata arbiterSecretHashes,
        bytes      calldata borrowerPubKey_,
        bytes      calldata lenderPubKey_,
        bytes      calldata arbiterPubKey_
    ) external {
        require(!secretHashes[loan].set, "Loans.setSecretHashes: Secret hashes must not already be set");
        require(
            msg.sender == loans[loan].borrower || msg.sender == loans[loan].lender || msg.sender == address(funds),
            "Loans.setSecretHashes: msg.sender must be Borrower, Lender or Funds Address"
        );
        secretHashes[loan].secretHashA1 = borrowerSecretHashes[0];
        secretHashes[loan].secretHashAs = [ borrowerSecretHashes[1], borrowerSecretHashes[2], borrowerSecretHashes[3] ];
        secretHashes[loan].secretHashB1 = lenderSecretHashes[0];
        secretHashes[loan].secretHashBs = [ lenderSecretHashes[1], lenderSecretHashes[2], lenderSecretHashes[3] ];
        secretHashes[loan].secretHashC1 = arbiterSecretHashes[0];
        secretHashes[loan].secretHashCs = [ arbiterSecretHashes[1], arbiterSecretHashes[2], arbiterSecretHashes[3] ];
        pubKeys[loan].borrowerPubKey = borrowerPubKey_;
        pubKeys[loan].lenderPubKey = lenderPubKey_;
        pubKeys[loan].arbiterPubKey = arbiterPubKey_;
        secretHashes[loan].set = true;
    }

    
    function FUND951(bytes32 loan) external {	//inject NONSTANDARD NAMING
        require(secretHashes[loan].set, "Loans.fund: Secret hashes must be set");
        require(bools[loan].funded == false, "Loans.fund: Loan is already funded");
        bools[loan].funded = true;
        require(token.TRANSFERFROM264(msg.sender, address(this), PRINCIPAL733(loan)), "Loans.fund: Failed to transfer tokens");

        emit FUNDLOAN869(loan);
    }

    
    function APPROVE752(bytes32 loan) external { 	//inject NONSTANDARD NAMING
    	require(bools[loan].funded == true, "Loans.approve: Loan must be funded");
    	require(loans[loan].lender == msg.sender, "Loans.approve: Only the lender can approve the loan");
        require(now <= APPROVEEXPIRATION991(loan), "Loans.approve: Loan is past the approve deadline");
    	bools[loan].approved = true;

        emit APPROVE882(loan);
    }

    
    function WITHDRAW311(bytes32 loan, bytes32 secretA1) external {	//inject NONSTANDARD NAMING
        require(!OFF979(loan), "Loans.withdraw: Loan cannot be inactive");
        require(bools[loan].funded == true, "Loans.withdraw: Loan must be funded");
        require(bools[loan].approved == true, "Loans.withdraw: Loan must be approved");
        require(bools[loan].withdrawn == false, "Loans.withdraw: Loan principal has already been withdrawn");
        require(sha256(abi.encodePacked(secretA1)) == secretHashes[loan].secretHashA1, "Loans.withdraw: Secret does not match");
        bools[loan].withdrawn = true;
        require(token.TRANSFER890(loans[loan].borrower, PRINCIPAL733(loan)), "Loans.withdraw: Failed to transfer tokens");

        secretHashes[loan].withdrawSecret = secretA1;
        if (address(col.ONDEMANDSPV720()) != address(0)) {col.REQUESTSPV707(loan);}

        emit WITHDRAW909(loan, secretA1);
    }

    
    function REPAY643(bytes32 loan, uint256 amount) external {	//inject NONSTANDARD NAMING
        require(!OFF979(loan), "Loans.repay: Loan cannot be inactive");
        require(!SALE150(loan), "Loans.repay: Loan cannot be undergoing a liquidation");
        require(bools[loan].withdrawn == true, "Loans.repay: Loan principal must be withdrawn");
        require(now <= loans[loan].loanExpiration, "Loans.repay: Loan cannot have expired");
        require(ADD499(amount, REPAID812(loan)) <= OWEDFORLOAN948(loan), "Loans.repay: Cannot repay more than the owed amount");
        require(token.TRANSFERFROM264(msg.sender, address(this), amount), "Loans.repay: Failed to transfer tokens");
        repayments[loan] = ADD499(amount, repayments[loan]);
        if (REPAID812(loan) == OWEDFORLOAN948(loan)) {
            bools[loan].paid = true;
            if (address(col.ONDEMANDSPV720()) != address(0)) {col.CANCELSPV301(loan);}
        }

        emit REPAY807(loan, amount);
    }

    
    function REFUND355(bytes32 loan) external {	//inject NONSTANDARD NAMING
        require(!OFF979(loan), "Loans.refund: Loan cannot be inactive");
        require(!SALE150(loan), "Loans.refund: Loan cannot be undergoing a liquidation");
        require(now > ACCEPTEXPIRATION913(loan), "Loans.refund: Cannot request refund until after acceptExpiration");
        require(bools[loan].paid == true, "Loans.refund: The loan must be repaid");
        require(msg.sender == loans[loan].borrower, "Loans.refund: Only the borrower can request a refund");
        bools[loan].off = true;
        loans[loan].closedTimestamp = now;
        if (funds.CUSTOM804(fundIndex[loan]) == false) {
            funds.DECREASETOTALBORROW539(loans[loan].principal);
            funds.CALCGLOBALINTEREST348();
        }
        require(token.TRANSFER890(loans[loan].borrower, OWEDFORLOAN948(loan)), "Loans.refund: Failed to transfer tokens");

        emit REFUND325(loan);
    }

    
    function CANCEL42(bytes32 loan, bytes32 secret) external {	//inject NONSTANDARD NAMING
        ACCEPT371(loan, secret);

        emit CANCEL366(loan, secret);
    }

    
    function CANCEL42(bytes32 loan) external {	//inject NONSTANDARD NAMING
        require(!OFF979(loan), "Loans.cancel: Loan must not be inactive");
        require(bools[loan].withdrawn == false, "Loans.cancel: Loan principal must not be withdrawn");
        require(now >= SEIZUREEXPIRATION539(loan), "Loans.cancel: Seizure deadline has not been reached");
        require(bools[loan].sale == false, "Loans.cancel: Loan must not be undergoing liquidation");
        CLOSE196(loan);

        emit CANCEL366(loan, bytes32(0));
    }

    
    function ACCEPT371(bytes32 loan, bytes32 secret) public {	//inject NONSTANDARD NAMING
        require(!OFF979(loan), "Loans.accept: Loan must not be inactive");
        require(bools[loan].withdrawn == false || bools[loan].paid == true, "Loans.accept: Loan must be either not withdrawn or repaid");
        require(msg.sender == loans[loan].lender || msg.sender == loans[loan].arbiter, "Loans.accept: msg.sender must be lender or arbiter");
        require(now <= ACCEPTEXPIRATION913(loan), "Loans.accept: Acceptance deadline has past");
        require(bools[loan].sale == false, "Loans.accept: Loan must not be going under liquidation");
        require(
            sha256(abi.encodePacked(secret)) == secretHashes[loan].secretHashB1 || sha256(abi.encodePacked(secret)) == secretHashes[loan].secretHashC1,
            "Loans.accept: Invalid secret"
        );
        secretHashes[loan].acceptSecret = secret;
        CLOSE196(loan);

        emit ACCEPT464(loan, secret);
    }

    
    function CLOSE196(bytes32 loan) private {	//inject NONSTANDARD NAMING
        bools[loan].off = true;
        loans[loan].closedTimestamp = now;
        
        if (bools[loan].withdrawn == false) {
            if (fundIndex[loan] == bytes32(0)) {
                require(token.TRANSFER890(loans[loan].lender, loans[loan].principal), "Loans.close: Failed to transfer principal to Lender");
            } else {
                if (funds.CUSTOM804(fundIndex[loan]) == false) {
                    funds.DECREASETOTALBORROW539(loans[loan].principal);
                }
                funds.DEPOSIT293(fundIndex[loan], loans[loan].principal);
            }
        }
        
        else {
            if (fundIndex[loan] == bytes32(0)) {
                require(token.TRANSFER890(loans[loan].lender, OWEDTOLENDER787(loan)), "Loans.close: Failed to transfer owedToLender to Lender");
            } else {
                if (funds.CUSTOM804(fundIndex[loan]) == false) {
                    funds.DECREASETOTALBORROW539(loans[loan].principal);
                }
                funds.DEPOSIT293(fundIndex[loan], OWEDTOLENDER787(loan));
            }
            require(token.TRANSFER890(loans[loan].arbiter, FEE849(loan)), "Loans.close: Failed to transfer fee to Arbiter");
        }
    }

    
    function LIQUIDATE262(bytes32 loan, bytes32 secretHash, bytes20 pubKeyHash) external returns (bytes32 sale_) {	//inject NONSTANDARD NAMING
        require(!OFF979(loan), "Loans.liquidate: Loan must not be inactive");
        require(bools[loan].withdrawn == true, "Loans.liquidate: Loan principal must be withdrawn");
        require(msg.sender != loans[loan].borrower && msg.sender != loans[loan].lender, "Loans.liquidate: Liquidator must be a third-party");
        require(secretHash != bytes32(0) && pubKeyHash != bytes20(0), "Loans.liquidate: secretHash and pubKeyHash must be non-zero");
        
        if (sales.NEXT403(loan) == 0) {
            
            if (now > loans[loan].loanExpiration) {
                require(bools[loan].paid == false, "Loans.liquidate: loan must not have already been repaid");
            } else {
                require(!SAFE557(loan), "Loans.liquidate: collateralization must be below min-collateralization ratio");
            }
            
            if (funds.CUSTOM804(fundIndex[loan]) == false) {
                funds.DECREASETOTALBORROW539(loans[loan].principal);
                funds.CALCGLOBALINTEREST348();
            }
        } else {
            
            require(sales.NEXT403(loan) < max_num_liquidations339, "Loans.liquidate: Max number of liquidations reached");
            require(!sales.ACCEPTED719(sales.SALEINDEXBYLOAN135(loan, sales.NEXT403(loan) - 1)), "Loans.liquidate: Previous liquidation already accepted");
            require(
                now > sales.SETTLEMENTEXPIRATION974(sales.SALEINDEXBYLOAN135(loan, sales.NEXT403(loan) - 1)),
                "Loans.liquidate: Previous liquidation settlement expiration hasn't expired"
            );
        }
        require(token.BALANCEOF117(msg.sender) >= DDIV856(DISCOUNTCOLLATERALVALUE869(loan)), "Loans.liquidate: insufficient balance to liquidate");
        require(token.TRANSFERFROM264(msg.sender, address(sales), DDIV856(DISCOUNTCOLLATERALVALUE869(loan))), "Loans.liquidate: Token transfer failed");
        SecretHashes storage h = secretHashes[loan];
        uint256 i = sales.NEXT403(loan);
        
        sale_ = sales.CREATE811(
            loan, loans[loan].borrower, loans[loan].lender, loans[loan].arbiter, msg.sender,
            h.secretHashAs[i], h.secretHashBs[i], h.secretHashCs[i], secretHash, pubKeyHash
        );
        if (bools[loan].sale == false) {
            bools[loan].sale = true;
            require(token.TRANSFER890(address(sales), REPAID812(loan)), "Loans.liquidate: Token transfer to Sales contract failed");
        }
        
        if (address(col.ONDEMANDSPV720()) != address(0)) {col.CANCELSPV301(loan);}

        emit LIQUIDATE27(loan, secretHash, pubKeyHash);
    }
}

contract Sales is DSMath {
    FundsInterface funds;
    Loans loans;
    Medianizer med;

    uint256 public constant swap_exp633 = 2 hours;       	//inject NONSTANDARD NAMING
    uint256 public constant settlement_exp381 = 4 hours; 	//inject NONSTANDARD NAMING
    uint256 public constant max_num_liquidations339 = 3; 	//inject NONSTANDARD NAMING
    uint256 public constant max_uint_256870 = 2**256-1;	//inject NONSTANDARD NAMING

    address public deployer; 

    mapping (bytes32 => Sale)       public sales;        
    mapping (bytes32 => Sig)        public borrowerSigs; 
    mapping (bytes32 => Sig)        public lenderSigs;   
    mapping (bytes32 => Sig)        public arbiterSigs;  
    mapping (bytes32 => SecretHash) public secretHashes; 
    uint256                         public saleIndex;    

    mapping (bytes32 => bytes32[])  public saleIndexByLoan; 

    mapping(bytes32 => bool) revealed;

    ERC20 public token;

    
    struct Sale {
        bytes32    loanIndex;
        uint256    discountBuy;
        address    liquidator;
        address    borrower;
        address    lender;
        address    arbiter;
        uint256    createdAt;
        bytes20    pubKeyHash;
        bool       set;
        bool       accepted;
        bool       off;
    }

    
    struct Sig {
        bytes refundableSig;
        bytes seizableSig;
    }

    
    struct SecretHash {
        bytes32 secretHashA; 
        bytes32 secretA;     
        bytes32 secretHashB; 
        bytes32 secretB;     
        bytes32 secretHashC; 
        bytes32 secretC;     
        bytes32 secretHashD; 
        bytes32 secretD;     
    }

    event CREATE697(bytes32 sale);	//inject NONSTANDARD NAMING

    event PROVIDESIG596(bytes32 sale);	//inject NONSTANDARD NAMING

    event PROVIDESECRET670(bytes32 sale, bytes32 secret_);	//inject NONSTANDARD NAMING

    event ACCEPT464(bytes32 sale);	//inject NONSTANDARD NAMING

    event REFUND325(bytes32 sale);	//inject NONSTANDARD NAMING

    
    function DISCOUNTBUY844(bytes32 sale) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return sales[sale].discountBuy;
    }

    
    function SWAPEXPIRATION85(bytes32 sale) external view returns (uint256) {	//inject NONSTANDARD NAMING
        return sales[sale].createdAt + swap_exp633;
    }

    
    function SETTLEMENTEXPIRATION974(bytes32 sale) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return sales[sale].createdAt + settlement_exp381;
    }

    
    function ACCEPTED719(bytes32 sale) public view returns (bool) {	//inject NONSTANDARD NAMING
        return sales[sale].accepted;
    }

    
    function OFF979(bytes32 sale) public view returns (bool) {	//inject NONSTANDARD NAMING
        return sales[sale].off;
    }

    
    constructor (Loans loans_, FundsInterface funds_, Medianizer med_, ERC20 token_) public {
        require(address(loans_) != address(0), "Loans address must be non-zero");
        require(address(funds_) != address(0), "Funds address must be non-zero");
        require(address(med_) != address(0), "Medianizer address must be non-zero");
        require(address(token_) != address(0), "Token address must be non-zero");
    	deployer = address(loans_);
        loans = loans_;
        funds = funds_;
        med = med_;
        token = token_;
        require(token.APPROVE752(address(funds), max_uint_256870), "Token approve failed");
    }

    
    function NEXT403(bytes32 loan) public view returns (uint256) {	//inject NONSTANDARD NAMING
    	return saleIndexByLoan[loan].length;
    }

    
    function CREATE811(	//inject NONSTANDARD NAMING
        bytes32 loanIndex,
        address borrower,
        address lender,
        address arbiter,
        address liquidator,
        bytes32 secretHashA,
        bytes32 secretHashB,
        bytes32 secretHashC,
        bytes32 secretHashD,
        bytes20 pubKeyHash
        ) external returns(bytes32 sale) {
        require(msg.sender == address(loans), "Sales.create: Only the Loans contract can create a Sale");
        saleIndex = ADD499(saleIndex, 1);
        sale = bytes32(saleIndex);
        sales[sale].loanIndex = loanIndex;
        sales[sale].borrower = borrower;
        sales[sale].lender = lender;
        sales[sale].arbiter = arbiter;
        sales[sale].liquidator = liquidator;
        sales[sale].createdAt = now;
        sales[sale].pubKeyHash = pubKeyHash;
        sales[sale].discountBuy = loans.DDIV856(loans.DISCOUNTCOLLATERALVALUE869(loanIndex));
        sales[sale].set = true;
        secretHashes[sale].secretHashA = secretHashA;
        secretHashes[sale].secretHashB = secretHashB;
        secretHashes[sale].secretHashC = secretHashC;
        secretHashes[sale].secretHashD = secretHashD;
        saleIndexByLoan[loanIndex].push(sale);

        emit CREATE697(sale);
   }

    
    function PROVIDESIG828(	//inject NONSTANDARD NAMING
        bytes32        sale,
        bytes calldata refundableSig,
        bytes calldata seizableSig
    ) external {
        require(sales[sale].set, "Sales.provideSig: Sale must be set");
        require(now < SETTLEMENTEXPIRATION974(sale), "Sales.provideSig: Cannot provide signature after settlement expiration");
        require(BytesLib.TOBYTES32909(refundableSig) != bytes32(0), "Sales.provideSig: refundableSig must be non-zero");
        require(BytesLib.TOBYTES32909(seizableSig) != bytes32(0), "Sales.provideSig: seizableSig must be non-zero");
        if (msg.sender == sales[sale].borrower) {
            borrowerSigs[sale].refundableSig = refundableSig;
            borrowerSigs[sale].seizableSig = seizableSig;
        } else if (msg.sender == sales[sale].lender) {
            lenderSigs[sale].refundableSig = refundableSig;
            lenderSigs[sale].seizableSig = seizableSig;
        } else if (msg.sender == sales[sale].arbiter) {
            arbiterSigs[sale].refundableSig = refundableSig;
            arbiterSigs[sale].seizableSig = seizableSig;
        } else {
            revert("Loans.provideSig: Must be called by Borrower, Lender or Arbiter");
        }

        emit PROVIDESIG596(sale);
    }

    
    function PROVIDESECRET506(bytes32 sale, bytes32 secret_) public {	//inject NONSTANDARD NAMING
        require(sales[sale].set, "Sales.provideSecret: Sale must be set");
        bytes32 secretHash = sha256(abi.encodePacked(secret_));
        revealed[secretHash] = true;
        if (secretHash == secretHashes[sale].secretHashA) {secretHashes[sale].secretA = secret_;}
        if (secretHash == secretHashes[sale].secretHashB) {secretHashes[sale].secretB = secret_;}
        if (secretHash == secretHashes[sale].secretHashC) {secretHashes[sale].secretC = secret_;}
        if (secretHash == secretHashes[sale].secretHashD) {secretHashes[sale].secretD = secret_;}

        emit PROVIDESECRET670(sale, secret_);
    }

    
    function HASSECRETS450(bytes32 sale) public view returns (bool) {	//inject NONSTANDARD NAMING
        uint8 numCorrectSecrets = 0;
        if (revealed[secretHashes[sale].secretHashA]) {numCorrectSecrets += 1;}
        if (revealed[secretHashes[sale].secretHashB]) {numCorrectSecrets += 1;}
        if (revealed[secretHashes[sale].secretHashC]) {numCorrectSecrets += 1;}
        return (numCorrectSecrets >= 2);
    }

    
    function ACCEPT371(bytes32 sale) public {	//inject NONSTANDARD NAMING
        require(!ACCEPTED719(sale), "Sales.accept: Sale must not already be accepted");
        require(!OFF979(sale), "Sales.accept: Sale must not already be off");
        require(HASSECRETS450(sale), "Sales.accept: Secrets need to have already been revealed");
        require(revealed[secretHashes[sale].secretHashD], "Sales.accept: Secret D must have already been revealed");
        sales[sale].accepted = true;

        
        uint256 available = ADD499(sales[sale].discountBuy, loans.REPAID812(sales[sale].loanIndex));

        
        if (sales[sale].arbiter != address(0) && available >= loans.FEE849(sales[sale].loanIndex)) {
            require(token.TRANSFER890(sales[sale].arbiter, loans.FEE849(sales[sale].loanIndex)), "Sales.accept: Token transfer of fee to Arbiter failed");
            available = SUB872(available, loans.FEE849(sales[sale].loanIndex));
        }

        
        uint256 amount = MIN167(available, loans.OWEDTOLENDER787(sales[sale].loanIndex));

        
        if (loans.fundIndex(sales[sale].loanIndex) == bytes32(0)) {
            require(token.TRANSFER890(sales[sale].lender, amount), "Sales.accept: Token transfer of amount left to Lender failed");
        } else {
            funds.DEPOSIT293(loans.fundIndex(sales[sale].loanIndex), amount);
        }

        
        available = SUB872(available, amount);

        
        if (available >= loans.PENALTY967(sales[sale].loanIndex)) {
            require(token.APPROVE752(address(med), loans.PENALTY967(sales[sale].loanIndex)), "Sales.accept: Token transfer of penalty to Medianizer failed");
            med.FUND951(loans.PENALTY967(sales[sale].loanIndex), token);
            available = SUB872(available, loans.PENALTY967(sales[sale].loanIndex));
        } else if (available > 0) {
            require(token.APPROVE752(address(med), available), "Sales.accept: Token transfer of tokens available to Medianizer failed");
            med.FUND951(available, token);
            available = 0;
        }

        
        if (available > 0) {
            require(token.TRANSFER890(sales[sale].borrower, available), "Sales.accept: Token transfer of tokens available to Borrower failed");
        }

        emit ACCEPT464(sale);
    }

     
    function PROVIDESECRETSANDACCEPT990(bytes32 sale, bytes32[3] calldata secrets_) external {	//inject NONSTANDARD NAMING
        PROVIDESECRET506(sale, secrets_[0]);
        PROVIDESECRET506(sale, secrets_[1]);
        PROVIDESECRET506(sale, secrets_[2]);
        ACCEPT371(sale);
    }

    
    function REFUND355(bytes32 sale) external {	//inject NONSTANDARD NAMING
        require(!ACCEPTED719(sale), "Sales.refund: Sale must not be accepted");
        require(!OFF979(sale), "Sales.refund: Sale must not be off");
        require(now > SETTLEMENTEXPIRATION974(sale), "Sales.refund: Can only refund after settlement expiration");
        require(sales[sale].discountBuy > 0, "Sales.refund: Discount Buy amount must be non-zero");
        sales[sale].off = true;
        require(token.TRANSFER890(sales[sale].liquidator, sales[sale].discountBuy), "Sales.refund: Token transfer to Liquidator failed");
        if (NEXT403(sales[sale].loanIndex) == max_num_liquidations339) {
            require(token.TRANSFER890(sales[sale].borrower, loans.REPAID812(sales[sale].loanIndex)), "Sales.refund: Token transfer to Borrower failed");
        }

        emit REFUND325(sale);
    }
}