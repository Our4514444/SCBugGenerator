                                                                 

pragma solidity ^0.5.12;


                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED666(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED666(address(0), _owner);
    }

                                                        
    function OWNER213() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER422() {	//inject NONSTANDARD NAMING
        require(ISOWNER409());
        _;
    }

                                                                                 
    function ISOWNER409() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP460() public ONLYOWNER422 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED666(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP566(address newOwner) public ONLYOWNER422 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP286(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP286(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED666(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                
interface IERC1155TokenReceiver {

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function ONERC1155RECEIVED932(address _operator, address _from, uint256 _id, uint256 _amount, bytes calldata _data) external returns(bytes4);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function ONERC1155BATCHRECEIVED798(address _operator, address _from, uint256[] calldata _ids, uint256[] calldata _amounts, bytes calldata _data) external returns(bytes4);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
  function SUPPORTSINTERFACE1000(bytes4 interfaceID) external view returns (bool);	//inject NONSTANDARD NAMING

}

library Strings {
  // via https://github.com/oraclize/ethereum-api/blob/master/oraclizeAPI_0.5.sol
  function STRCONCAT58(string memory _a, string memory _b, string memory _c, string memory _d, string memory _e) internal pure returns (string memory) {	//inject NONSTANDARD NAMING
      bytes memory _ba = bytes(_a);
      bytes memory _bb = bytes(_b);
      bytes memory _bc = bytes(_c);
      bytes memory _bd = bytes(_d);
      bytes memory _be = bytes(_e);
      string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
      bytes memory babcde = bytes(abcde);
      uint k = 0;
      for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
      for (uint i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
      for (uint i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
      for (uint i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
      for (uint i = 0; i < _be.length; i++) babcde[k++] = _be[i];
      return string(babcde);
    }

    function STRCONCAT58(string memory _a, string memory _b, string memory _c, string memory _d) internal pure returns (string memory) {	//inject NONSTANDARD NAMING
        return STRCONCAT58(_a, _b, _c, _d, "");
    }

    function STRCONCAT58(string memory _a, string memory _b, string memory _c) internal pure returns (string memory) {	//inject NONSTANDARD NAMING
        return STRCONCAT58(_a, _b, _c, "", "");
    }

    function STRCONCAT58(string memory _a, string memory _b) internal pure returns (string memory) {	//inject NONSTANDARD NAMING
        return STRCONCAT58(_a, _b, "", "", "");
    }

    function UINT2STR861(uint _i) internal pure returns (string memory _uintAsString) {	//inject NONSTANDARD NAMING
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
}

                                                                                             
interface IERC165 {

                                                                                                                                                                                                                                                                    
    function SUPPORTSINTERFACE1000(bytes4 _interfaceId)	//inject NONSTANDARD NAMING
    external
    view
    returns (bool);
}

interface ERC721Collection {
    function ISSUETOKEN242(address _beneficiary, string calldata _wearableId) external;	//inject NONSTANDARD NAMING
    function GETWEARABLEKEY560(string calldata _wearableId) external view returns (bytes32);	//inject NONSTANDARD NAMING
    function ISSUED987(bytes32 _wearableKey) external view returns (uint256);	//inject NONSTANDARD NAMING
    function MAXISSUANCE735(bytes32 _wearableKey) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ISSUETOKENS358(address[] calldata _beneficiaries, bytes32[] calldata _wearableIds) external;	//inject NONSTANDARD NAMING
    function BALANCEOF362(address _owner) external view returns (uint256);	//inject NONSTANDARD NAMING
}

                                                                                                         
contract WearableCrafting is IERC165, IERC1155TokenReceiver, Ownable {
    using Strings for string;

    address erc1155VouchersCollection;
    mapping (uint256 => ERC721Collection) public erc721WearableCollections;
    mapping (uint256 => string) public wearableIds;

    // onReceive function signatures
    bytes4 constant internal erc1155_received_value36 = 0xf23a6e61;	//inject NONSTANDARD NAMING
    bytes4 constant internal erc1155_batch_received_value828 = 0xbc197c81;	//inject NONSTANDARD NAMING

    constructor(
        address _vouchersCollection,
        ERC721Collection _wearableCollection
    ) public {
        erc1155VouchersCollection = _vouchersCollection;

        wearableIds[64] = "moonminer_helmet";
        wearableIds[65] = "moonminer_goggles_eyewear";
        wearableIds[66] = "moonminer_jacket_upper_body";
        wearableIds[67] = "moonminer_pants_lower_body";
        wearableIds[68] = "moonminer_boots_feet";
        wearableIds[69] = "moonminer_neurahairs_hair";

        erc721WearableCollections[64] = erc721WearableCollections[65] = erc721WearableCollections[66] =
        erc721WearableCollections[67] = erc721WearableCollections[68] = erc721WearableCollections[69] = _wearableCollection;

        wearableIds[96] = "blocksmith_helmet";
        wearableIds[97] = "blocksmith_eyewear";
        wearableIds[98] = "blocksmith_upper_body";
        wearableIds[99] = "blocksmith_lower_body";
        wearableIds[100] = "blocksmith_feet";
        wearableIds[101] = "blocksmith_top_head";
    }

    function MINTWEARABLES737(address _beneficiary, uint256 _id, uint256 _amount) internal {	//inject NONSTANDARD NAMING
        string memory wearableId = wearableIds[_id];
        ERC721Collection _wearableCollection = erc721WearableCollections[_id];
        require(bytes(wearableId).length != 0, "wearableId is not correct");
        require(address(_wearableCollection) != address(0), "wearable collection is not correct");

        for (uint256 i = 0; i < _amount; i++) {
            _wearableCollection.ISSUETOKEN242(_beneficiary, wearableId);
        }
    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function ONERC1155RECEIVED932(address              , address _from, uint256 _id, uint256 _amount, bytes calldata          ) external returns(bytes4){	//inject NONSTANDARD NAMING
        require(msg.sender == erc1155VouchersCollection, "Only token contract allowed");
        MINTWEARABLES737(_from, _id, _amount);
        return erc1155_received_value36;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function ONERC1155BATCHRECEIVED798(address              , address _from, uint256[] calldata _ids, uint256[] calldata _amounts, bytes calldata          ) external returns(bytes4){	//inject NONSTANDARD NAMING
        require(msg.sender == erc1155VouchersCollection, "Only token contract allowed");
        require(_ids.length == _amounts.length, "Arrays must be same size");

        for (uint256 k = 0; k < _ids.length; k++) {
            uint256 id = _ids[k];
            uint256 amount = _amounts[k];
            MINTWEARABLES737(_from, id, amount);
        }
        return erc1155_batch_received_value828;
    }

    bytes4 constant private interface_signature_erc165519 = 0x01ffc9a7;	//inject NONSTANDARD NAMING
    bytes4 constant private interface_signature_erc1155tokenreceiver938 = 0x4fdcdb47;	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function SUPPORTSINTERFACE1000(bytes4 _interfaceID) external view returns (bool) {	//inject NONSTANDARD NAMING
        if (_interfaceID == interface_signature_erc165519 ||
        _interfaceID == interface_signature_erc1155tokenreceiver938) {
            return true;
        }
        return false;
    }

    function SETWEARABLECOLLECTION31(	//inject NONSTANDARD NAMING
        uint256[] memory _voucherIds,
        ERC721Collection _wearableCollection
    ) public ONLYOWNER422 {
        for (uint256 k = 0; k < _voucherIds.length; k++) {
            uint256 id = _voucherIds[k];
            erc721WearableCollections[id] = _wearableCollection;
        }
    }

    function SETWEARABLEIDS254(	//inject NONSTANDARD NAMING
        uint256 _voucherId,
        string memory _wearableId
    ) public ONLYOWNER422 {
        wearableIds[_voucherId] = _wearableId;
    }
}