                                                                 

pragma solidity ^0.5.10;

                                                                                                                                                                                                                                                                                                                                                                                                         


                                                                                                      
contract Owned {
    address public owner;
    address public newOwner;

    event OWNERSHIPTRANSFERRED832(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER169 {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    function TRANSFEROWNERSHIP443(address _newOwner) public ONLYOWNER169 {	//inject NONSTANDARD NAMING
        newOwner = _newOwner;
    }

    function ACCEPTOWNERSHIP616() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwner);

        emit OWNERSHIPTRANSFERRED832(owner, newOwner);

        owner = newOwner;

        newOwner = address(0);
    }
}


                                                                                                            
contract ModeneroDb is Owned {
                                       
    mapping(bytes32 => address)    private addressStorage;
    mapping(bytes32 => bool)       private boolStorage;
    mapping(bytes32 => bytes)      private bytesStorage;
    mapping(bytes32 => int256)     private intStorage;
    mapping(bytes32 => string)     private stringStorage;
    mapping(bytes32 => uint256)    private uIntStorage;

                                                                                                                                               
    modifier ONLYAUTHBYMODENERO463() {	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                                                   
        if (msg.sender == owner) {
                                                                            
            require(boolStorage[keccak256(
                abi.encodePacked('owner.auth.disabled'))] != true);
        } else {
                                                                               
            require(boolStorage[keccak256(
                abi.encodePacked(msg.sender, '.has.auth'))] == true);
        }

        _;      // function code is inserted here
    }

                                                                                                                              

                                          
    function GETADDRESS342(bytes32 _key) external view returns (address) {	//inject NONSTANDARD NAMING
        return addressStorage[_key];
    }

                                          
    function GETBOOL638(bytes32 _key) external view returns (bool) {	//inject NONSTANDARD NAMING
        return boolStorage[_key];
    }

                                          
    function GETBYTES950(bytes32 _key) external view returns (bytes memory) {	//inject NONSTANDARD NAMING
        return bytesStorage[_key];
    }

                                          
    function GETINT328(bytes32 _key) external view returns (int) {	//inject NONSTANDARD NAMING
        return intStorage[_key];
    }

                                          
    function GETSTRING593(bytes32 _key) external view returns (string memory) {	//inject NONSTANDARD NAMING
        return stringStorage[_key];
    }

                                          
    function GETUINT898(bytes32 _key) external view returns (uint) {	//inject NONSTANDARD NAMING
        return uIntStorage[_key];
    }


                                                                                                                              

                                          
    function SETADDRESS1000(bytes32 _key, address _value) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        addressStorage[_key] = _value;
    }

                                          
    function SETBOOL203(bytes32 _key, bool _value) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        boolStorage[_key] = _value;
    }

                                          
    function SETBYTES397(bytes32 _key, bytes calldata _value) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        bytesStorage[_key] = _value;
    }

                                          
    function SETINT123(bytes32 _key, int _value) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        intStorage[_key] = _value;
    }

                                          
    function SETSTRING73(bytes32 _key, string calldata _value) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        stringStorage[_key] = _value;
    }

                                          
    function SETUINT22(bytes32 _key, uint _value) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        uIntStorage[_key] = _value;
    }


                                                                                                                              

                                          
    function DELETEADDRESS146(bytes32 _key) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        delete addressStorage[_key];
    }

                                          
    function DELETEBOOL889(bytes32 _key) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        delete boolStorage[_key];
    }

                                          
    function DELETEBYTES814(bytes32 _key) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        delete bytesStorage[_key];
    }

                                          
    function DELETEINT818(bytes32 _key) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        delete intStorage[_key];
    }

                                          
    function DELETESTRING474(bytes32 _key) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        delete stringStorage[_key];
    }

                                          
    function DELETEUINT818(bytes32 _key) ONLYAUTHBYMODENERO463 external {	//inject NONSTANDARD NAMING
        delete uIntStorage[_key];
    }
}