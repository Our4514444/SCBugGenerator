pragma solidity ^0.5.8;

contract Registry {
    struct Entry {
        uint64 lenData;
        mapping (uint32=>address) data;
        address owner;
        bool uploaded;
    }
  function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  mapping(uint256=>Entry) public entries;
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public numEntries = 0;

    function addEntry(uint64 lenData) public returns(uint256) {
        entries[numEntries] = Entry(lenData, msg.sender, false);
        numEntries += 1;
        return numEntries - 1;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function finalize(uint256 entryId) public {
        require(entries[entryId].owner == msg.sender);
        entries[entryId].uploaded = true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
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
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    function addChunk(uint256 entryId, uint32 chunkIndex, bytes memory chunkData) public {
        require(entries[entryId].owner == msg.sender);
        entries[entryId].data[chunkIndex] = storeDataAsContract(chunkData);
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

    function getLen(uint256 entry) public view returns(uint64 length) {
        return entries[entry].lenData;
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}