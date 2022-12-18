pragma solidity ^0.5.8;

contract Registry {
    struct Entry {
        uint64 lenData;
        mapping (uint32=>address) data;
        address owner;
        bool uploaded;
    }
  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  mapping(uint256=>Entry) public entries;
  function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
  uint256 public numEntries = 0;

    function addEntry(uint64 lenData) public returns(uint256) {
        entries[numEntries] = Entry(lenData, msg.sender, false);
        numEntries += 1;
        return numEntries - 1;
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

    function finalize(uint256 entryId) public {
        require(entries[entryId].owner == msg.sender);
        entries[entryId].uploaded = true;
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
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
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }
    
    function addChunk(uint256 entryId, uint32 chunkIndex, bytes memory chunkData) public {
        require(entries[entryId].owner == msg.sender);
        entries[entryId].data[chunkIndex] = storeDataAsContract(chunkData);
    }
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}

    function get(uint256 entryId, uint32 chunkIndex) public view returns(bytes memory result) {
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
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}

    function getLen(uint256 entry) public view returns(uint64 length) {
        return entries[entry].lenData;
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
}