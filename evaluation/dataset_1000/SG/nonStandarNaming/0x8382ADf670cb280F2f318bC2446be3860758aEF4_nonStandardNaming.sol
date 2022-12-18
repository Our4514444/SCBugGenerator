                                                                 

pragma solidity 0.5.13;

// File: openzeppelin-solidity/contracts/GSN/Context.sol
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks
    function _MSGSENDER360() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
    function _MSGDATA702() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}
// File: openzeppelin-solidity/contracts/ownership/Ownable.sol
                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;
    event OWNERSHIPTRANSFERRED612(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
                                                                                               
    constructor () internal {
        _owner = _MSGSENDER360();
        emit OWNERSHIPTRANSFERRED612(address(0), _owner);
    }
                                                                     
    function OWNER371() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }
                                                                                 
    modifier ONLYOWNER968() {	//inject NONSTANDARD NAMING
        require(ISOWNER750(), "Ownable: caller is not the owner");
        _;
    }
                                                                            
    function ISOWNER750() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER360() == _owner;
    }
                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP126() public ONLYOWNER968 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED612(_owner, address(0));
        _owner = address(0);
    }
                                                                                                                                              
    function TRANSFEROWNERSHIP747(address newOwner) public ONLYOWNER968 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP132(newOwner);
    }
                                                                                              
    function _TRANSFEROWNERSHIP132(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED612(_owner, newOwner);
        _owner = newOwner;
    }
}
// File: contracts/GramChain.sol
contract GramChain is Ownable {
    // Map if hash has been submitted to contract
    mapping (bytes32 => bool) private _containsMap;
    // The actual hash event
    event ADDEDHASHENTRY692(bytes32 indexed hash);	//inject NONSTANDARD NAMING
    // adding entries only if it doesn't already exist and it's the owner
    function ADDHASHENTRY417(bytes32 dataHash) external ONLYOWNER968 {	//inject NONSTANDARD NAMING
        require(!_containsMap[dataHash], "The given hash already exists");
        _containsMap[dataHash] = true;
        emit ADDEDHASHENTRY692(dataHash);
    }
    // adding entries only if it doesn't already exist and it's the owner
    function ADDHASHENTRIES965(bytes32[] calldata hashlist) external ONLYOWNER968 {	//inject NONSTANDARD NAMING
        for (uint i=0; i < hashlist.length; i++) {
            bytes32 dataHash = hashlist[i];
            require(!_containsMap[dataHash], "The given hash already exists");
            _containsMap[dataHash] = true;
            emit ADDEDHASHENTRY692(dataHash);
        }
    }
    // Verify hash exists in contract
    function VERIFYDATAHASH362(bytes32 dataHash) external view returns (bool) {	//inject NONSTANDARD NAMING
        return _containsMap[dataHash];
    }
}