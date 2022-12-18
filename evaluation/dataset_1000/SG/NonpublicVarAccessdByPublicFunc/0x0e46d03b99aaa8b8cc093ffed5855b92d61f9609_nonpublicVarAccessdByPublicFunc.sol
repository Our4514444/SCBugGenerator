pragma solidity ^0.5.8;

contract Registry {
    struct Entry {
        uint64 lenData;
        mapping (uint32=>address) data;
        address owner;
        bool uploaded;
    }
    mapping(uint256=>Entry) internal entries;
    uint256 internal numEntries = 0;

    function addEntry(uint64 lenData) public returns(uint256) {
        entries[numEntries] = Entry(lenData, msg.sender, false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        numEntries += 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return numEntries - 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function finalize(uint256 entryId) public {
        require(entries[entryId].owner == msg.sender);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        entries[entryId].uploaded = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function storeDataAsContract(bytes memory data) internal returns (address) {
        address result;
        assembly {
            let length := mload(data)
            mstore(data, 0x58600c8038038082843982f3)
            result := create(0, add(data, 20), add(12, length))
        }
        require(result != address(0x0));
        return result;
    }
    
    function addChunk(uint256 entryId, uint32 chunkIndex, bytes memory chunkData) public {
        require(entries[entryId].owner == msg.sender);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        entries[entryId].data[chunkIndex] = storeDataAsContract(chunkData);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function get(uint256 entryId, uint32 chunkIndex) public view returns(bytes memory result) {
        require(entries[entryId].uploaded);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        address _addr = entries[entryId].data[chunkIndex];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
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

    function getLen(uint256 entry) public view returns(uint64 length) {
        return entries[entry].lenData;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
}