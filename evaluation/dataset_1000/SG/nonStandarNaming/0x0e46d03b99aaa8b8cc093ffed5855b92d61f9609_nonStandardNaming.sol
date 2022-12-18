pragma solidity ^0.5.8;

contract Registry {
    struct Entry {
        uint64 lenData;
        mapping (uint32=>address) data;
        address owner;
        bool uploaded;
    }
    mapping(uint256=>Entry) public entries;
    uint256 public numEntries = 0;

    function ADDENTRY338(uint64 lenData) public returns(uint256) {	//inject NONSTANDARD NAMING
        entries[numEntries] = Entry(lenData, msg.sender, false);
        numEntries += 1;
        return numEntries - 1;
    }

    function FINALIZE456(uint256 entryId) public {	//inject NONSTANDARD NAMING
        require(entries[entryId].owner == msg.sender);
        entries[entryId].uploaded = true;
    }
    
    function STOREDATAASCONTRACT64(bytes memory data) internal returns (address) {	//inject NONSTANDARD NAMING
        address result;
        assembly {
            let length := mload(data)
            mstore(data, 0x58600c8038038082843982f3)
            result := create(0, add(data, 20), add(12, length))
        }
        require(result != address(0x0));
        return result;
    }
    
    function ADDCHUNK687(uint256 entryId, uint32 chunkIndex, bytes memory chunkData) public {	//inject NONSTANDARD NAMING
        require(entries[entryId].owner == msg.sender);
        entries[entryId].data[chunkIndex] = STOREDATAASCONTRACT64(chunkData);
    }

    function GET785(uint256 entryId, uint32 chunkIndex) public view returns(bytes memory result) {	//inject NONSTANDARD NAMING
        require(entries[entryId].uploaded);
        address _addr = entries[entryId].data[chunkIndex];
        assembly {
            // retrieve the size of the code, this needs assembly
            let size := extcodesize(_addr)
            // allocate output byte array - this could also be done without assembly
            // by using o_code = new bytes(size)
            result := mload(0x40)
            // new "memory end" including padding
            mstore(0x40, add(result, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            // store length in memory
            mstore(result, size)
            // actually retrieve the code, this needs assembly
            extcodecopy(_addr, add(result, 0x20), 0, size)            
        }
    }

    function GETLEN844(uint256 entry) public view returns(uint64 length) {	//inject NONSTANDARD NAMING
        return entries[entry].lenData;
    }
}