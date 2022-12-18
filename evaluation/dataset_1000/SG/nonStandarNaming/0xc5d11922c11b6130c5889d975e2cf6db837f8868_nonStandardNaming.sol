// File: contracts/exchange/ownable.sol

pragma solidity 0.5.6;

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED551(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED551(address(0), _owner);
    }

                                                        
    function OWNER690() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER312() {	//inject NONSTANDARD NAMING
        require(ISOWNER782());
        _;
    }

                                                                                 
    function ISOWNER782() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP324() public ONLYOWNER312 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED551(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP774(address newOwner) public ONLYOWNER312 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP320(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP320(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED551(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/exchange/safe-math.sol

pragma solidity 0.5.6;

                                                                                                                                                                                                                            
library SafeMath
{

                                                                                                                                                                                       
  function MUL305(	//inject NONSTANDARD NAMING
    uint256 _factor1,
    uint256 _factor2
  )
    internal
    pure
    returns (uint256 product)
  {
    // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (_factor1 == 0)
    {
      return 0;
    }

    product = _factor1 * _factor2;
    require(product / _factor1 == _factor2);
  }

                                                                                                                                                                                                                   
  function DIV36(	//inject NONSTANDARD NAMING
    uint256 _dividend,
    uint256 _divisor
  )
    internal
    pure
    returns (uint256 quotient)
  {
    // Solidity automatically asserts when dividing by 0, using all gas.
    require(_divisor > 0);
    quotient = _dividend / _divisor;
    // assert(_dividend == _divisor * quotient + _dividend % _divisor); // There is no case in which this doesn't hold.
  }

                                                                                                                                                                                                                       
  function SUB244(	//inject NONSTANDARD NAMING
    uint256 _minuend,
    uint256 _subtrahend
  )
    internal
    pure
    returns (uint256 difference)
  {
    require(_subtrahend <= _minuend);
    difference = _minuend - _subtrahend;
  }

                                                                                                                                        
  function ADD154(	//inject NONSTANDARD NAMING
    uint256 _addend1,
    uint256 _addend2
  )
    internal
    pure
    returns (uint256 sum)
  {
    sum = _addend1 + _addend2;
    require(sum >= _addend1);
  }

                                                                                                                                                                                                                           
  function MOD223(	//inject NONSTANDARD NAMING
    uint256 _dividend,
    uint256 _divisor
  )
    internal
    pure
    returns (uint256 remainder) 
  {
    require(_divisor != 0);
    remainder = _dividend % _divisor;
  }

}

// File: contracts/exchange/erc721-token-receiver.sol

pragma solidity 0.5.6;

                                                                                                                                     
interface ERC721TokenReceiver
{

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function ONERC721RECEIVED483(	//inject NONSTANDARD NAMING
    address _operator,
    address _from,
    uint256 _tokenId,
    bytes calldata _data
  )
    external
    returns(bytes4);

	function ONERC721RECEIVED483(	//inject NONSTANDARD NAMING
    address _from, 
    uint256 _tokenId, 
    bytes calldata _data
  ) 
  external 
  returns 
  (bytes4);

}

// File: contracts/exchange/ERC165Checker.sol

pragma solidity ^0.5.6;

                                                                                                                                                
library ERC165Checker {
    // As per the EIP-165 spec, no interface should ever match 0xffffffff
    bytes4 private constant _interface_id_invalid309 = 0xffffffff;	//inject NONSTANDARD NAMING

    bytes4 private constant _interface_id_erc165186 = 0x01ffc9a7;	//inject NONSTANDARD NAMING
                                                                                              

                                                                                                                                                                                                                    
    function _SUPPORTSERC165870(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // Any contract that implements ERC165 must explicitly indicate support of
        // InterfaceId_ERC165 and explicitly indicate non-support of InterfaceId_Invalid
        return _SUPPORTSERC165INTERFACE575(account, _interface_id_erc165186) &&
            !_SUPPORTSERC165INTERFACE575(account, _interface_id_invalid309);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function _SUPPORTSINTERFACE780(address account, bytes4 interfaceId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // query support of both ERC165 as per the spec and support of _interfaceId
        return _SUPPORTSERC165870(account) &&
            _SUPPORTSERC165INTERFACE575(account, interfaceId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function _SUPPORTSALLINTERFACES971(address account, bytes4[] memory interfaceIds) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // query support of ERC165 itself
        if (!_SUPPORTSERC165870(account)) {
            return false;
        }

        // query support of each interface in _interfaceIds
        for (uint256 i = 0; i < interfaceIds.length; i++) {
            if (!_SUPPORTSERC165INTERFACE575(account, interfaceIds[i])) {
                return false;
            }
        }

        // all interfaces supported
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function _SUPPORTSERC165INTERFACE575(address account, bytes4 interfaceId) private view returns (bool) {	//inject NONSTANDARD NAMING
        // success determines whether the staticcall succeeded and result determines
        // whether the contract at account indicates support of _interfaceId
        (bool success, bool result) = _CALLERC165SUPPORTSINTERFACE698(account, interfaceId);

        return (success && result);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function _CALLERC165SUPPORTSINTERFACE698(address account, bytes4 interfaceId)	//inject NONSTANDARD NAMING
        private
        view
        returns (bool success, bool result)
    {
        bytes memory encodedParams = abi.encodeWithSelector(_interface_id_erc165186, interfaceId);

        // solhint-disable-next-line no-inline-assembly
        assembly {
            let encodedParams_data := add(0x20, encodedParams)
            let encodedParams_size := mload(encodedParams)

            let output := mload(0x40)    // Find empty storage location using "free memory pointer"
            mstore(output, 0x0)

            success := staticcall(
                30000,                   // 30k gas
                account,                 // To addr
                encodedParams_data,
                encodedParams_size,
                output,
                0x20                     // Outputs are 32 bytes long
            )

            result := mload(output)      // Load the result
        }
    }
}

// File: contracts/exchange/exchange.sol

pragma solidity 0.5.6;





                                                              
contract Erc721Interface {
    function TRANSFERFROM316(address _from, address _to, uint256 _tokenId) external;	//inject NONSTANDARD NAMING
    function ISAPPROVEDFORALL552(address _owner, address _operator) external view returns (bool);	//inject NONSTANDARD NAMING
    function OWNEROF94(uint256 _tokenId) external view returns (address _owner);	//inject NONSTANDARD NAMING
}

                                                                    
contract KittyInterface {
    mapping (uint256 => address) public kittyIndexToApproved;
    function TRANSFER398(address _to, uint256 _tokenId) external;	//inject NONSTANDARD NAMING
    function TRANSFERFROM316(address _from, address _to, uint256 _tokenId) external;	//inject NONSTANDARD NAMING
    function OWNEROF94(uint256 _tokenId) external view returns (address _owner);	//inject NONSTANDARD NAMING
}


contract Exchange is Ownable, ERC721TokenReceiver {

    using SafeMath for uint256;
    using SafeMath for uint;
    using ERC165Checker for address;

                                                                     
    address constant internal  cryptokittiesaddress842 = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;	//inject NONSTANDARD NAMING
    
                                                                                                                                                                        
    bytes4 internal constant erc721_received_three_input773 = 0xf0b9e5ba;	//inject NONSTANDARD NAMING

                                                                                                                                                                     
    bytes4 internal constant erc721_received_four_input586 = 0x150b7a02;	//inject NONSTANDARD NAMING

                                                                     
    mapping (address => mapping (uint256 => address)) internal TokenToOwner;

                                                                                                  
    mapping (address => mapping (address => uint256[])) internal OwnerToTokens;

                                                                                                               
    mapping (address => mapping(uint256 => uint256)) internal TokenToIndex;

                                                                         
    mapping (address => bytes32[]) internal OwnerToOrders;

                                                               
    mapping (bytes32 => address) internal OrderToOwner;

                                                                                 
    mapping (bytes32 => uint) internal OrderToIndex;

                                                                    
    mapping (bytes32 => address) internal MatchOrderToOwner;
   
                                                                        
    mapping (bytes32 => bytes32[]) internal OrderToMatchOrders;

                                                                                            
    mapping (bytes32 => mapping(bytes32 => uint)) internal OrderToMatchOrderIndex;

                                                                         
    mapping (bytes32 => bool) internal OrderToExist;


                                                                                       
    bytes4[] internal SupportNFTInterface;

                                                                                                                                                                                
    struct OrderObj {
        // NFT's owner
        address owner;

        // NFT's contract address
        address contractAddress;
        
        // NFT's id
        uint256 tokenId;
    }

                                                                                    
    mapping (bytes32 => OrderObj) internal HashToOrderObj;

                                                                                                                                                                                                                                                       
    event RECEIVETOKEN364(	//inject NONSTANDARD NAMING
        address indexed _from, 
        address _contractAddress, 
        uint256 _tokenId
    );


                                                                                                                                                                                                                                                       
    event SENDBACKTOKEN587(	//inject NONSTANDARD NAMING
        address indexed _owner, 
        address _contractAddress, 
        uint256 _tokenId
    );

                                                                                                                                                                                                                                       
    event SENDTOKEN158(	//inject NONSTANDARD NAMING
        address indexed _to, 
        address _contractAddress, 
        uint256 _tokenId
    );

                                                                                                                                                                                                                        
    event CREATEORDEROBJ110(	//inject NONSTANDARD NAMING
        bytes32 indexed _hash,
        address _owner,
        address _contractAddress,
        uint256 _tokenId   
    );

                                                                                                                                                                                                                                  
    event CREATEORDER164(	//inject NONSTANDARD NAMING
        address indexed _from,
        bytes32 indexed _orderHash,
        address _contractAddress,
        uint256 _tokenId
    );

                                                                                                                                                                                                                                                                                                               
    event CREATEMATCHORDER772(	//inject NONSTANDARD NAMING
        address indexed _from,
        bytes32 indexed _orderHash,
        bytes32 indexed _matchOrderHash,
        address _contractAddress,
        uint256 _tokenId
    );

                                                                                                                                              
    event DELETEORDER272(	//inject NONSTANDARD NAMING
        address indexed _from,
        bytes32 indexed _orderHash
    );

                                                                                                                                                                                                                  
    event DELETEMATCHORDER483(	//inject NONSTANDARD NAMING
        address indexed _from,
        bytes32 indexed _orderHash,
        bytes32 indexed _matchOrderHash
    );


                                                                                                                                                                        
    modifier ONLYSENDERISORIGINALOWNER410(	//inject NONSTANDARD NAMING
        address contractAddress, 
        uint256 tokenId
    ) 
    {
        require(TokenToOwner[contractAddress][tokenId] == msg.sender, "original owner should be message sender");
        _;
    }

    constructor () public {
        //nf-token
        SupportNFTInterface.push(0x80ac58cd);

        //nf-token-metadata
        SupportNFTInterface.push(0x780e9d63);

        //nf-token-enumerable
        SupportNFTInterface.push(0x5b5e139f);
    }

                                                                                                                                                                       
    function ADDSUPPORTNFTINTERFACE234(	//inject NONSTANDARD NAMING
        bytes4 interface_id
    )
    external
    ONLYOWNER312()
    {
        SupportNFTInterface.push(interface_id);
    }

                                                                                 
    function ONERC721RECEIVED483(	//inject NONSTANDARD NAMING
        address _from, 
        uint256 _tokenId, 
        bytes calldata _data
    ) 
    external 
    returns (bytes4)
    {
        return erc721_received_three_input773;
    }

                                                                                 
    function ONERC721RECEIVED483(	//inject NONSTANDARD NAMING
        address _operator,
        address _from,
        uint256 _tokenId,
        bytes calldata data
    )
    external
    returns(bytes4)
    {
        return erc721_received_four_input586;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                
    function CREATEORDER327(	//inject NONSTANDARD NAMING
        address contractAddress, 
        uint256 tokenId
    ) 
    external 
    ONLYSENDERISORIGINALOWNER410(
        contractAddress, 
        tokenId
    ) 
    {
        bytes32 orderHash = keccak256(abi.encodePacked(contractAddress, tokenId, msg.sender));
        require(OrderToOwner[orderHash] != msg.sender, "Order already exist");
        _ADDORDER672(msg.sender, orderHash);
        emit CREATEORDER164(msg.sender, orderHash, contractAddress, tokenId);
    }

                                                                                                                                        
    function _ADDORDER672(	//inject NONSTANDARD NAMING
        address sender, 
        bytes32 orderHash
    ) 
    internal 
    {
        uint index = OwnerToOrders[sender].push(orderHash).SUB244(1);
        OrderToOwner[orderHash] = sender;
        OrderToIndex[orderHash] = index;
        OrderToExist[orderHash] = true;
    }

                                                                                                                                                  
    function DELETEORDER450(	//inject NONSTANDARD NAMING
        bytes32 orderHash
    )
    external
    {
        require(OrderToOwner[orderHash] == msg.sender, "this order hash not belongs to this address");
        _REMOVEORDER35(msg.sender, orderHash);
        emit DELETEORDER272(msg.sender, orderHash);
    }

                                                                                                                                         
    function _REMOVEORDER35(	//inject NONSTANDARD NAMING
        address sender,
        bytes32 orderHash
    )
    internal
    {
        OrderToExist[orderHash] = false;
        delete OrderToOwner[orderHash];
        uint256 orderIndex = OrderToIndex[orderHash];
        uint256 lastOrderIndex = OwnerToOrders[sender].length.SUB244(1);
        if (lastOrderIndex != orderIndex){
            bytes32 lastOwnerOrder = OwnerToOrders[sender][lastOrderIndex];
            OwnerToOrders[sender][orderIndex] = lastOwnerOrder;
            OrderToIndex[lastOwnerOrder] = orderIndex;
        }
        OwnerToOrders[sender].length--;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function CREATEMATCHORDER255(	//inject NONSTANDARD NAMING
        address contractAddress,
        uint256 tokenId, 
        bytes32 orderHash
    ) 
    external 
    ONLYSENDERISORIGINALOWNER410(
        contractAddress, 
        tokenId
    ) 
    {
        bytes32 matchOrderHash = keccak256(abi.encodePacked(contractAddress, tokenId, msg.sender));
        require(OrderToOwner[matchOrderHash] != msg.sender, "Order already exist");
        _ADDMATCHORDER868(matchOrderHash, orderHash);
        emit CREATEMATCHORDER772(msg.sender, orderHash, matchOrderHash, contractAddress, tokenId);
    }

                                                                                                                                                                                   
    function _ADDMATCHORDER868(	//inject NONSTANDARD NAMING
        bytes32 matchOrderHash, 
        bytes32 orderHash
    ) 
    internal 
    {
        uint inOrderIndex = OrderToMatchOrders[orderHash].push(matchOrderHash).SUB244(1);
        OrderToMatchOrderIndex[orderHash][matchOrderHash] = inOrderIndex;
    }

                                                                                                                                                                                      
    function DELETEMATCHORDER29(	//inject NONSTANDARD NAMING
        bytes32 matchOrderHash,
        bytes32 orderHash
    )
    external
    {
        require(MatchOrderToOwner[matchOrderHash] == msg.sender, "match order doens't belong to this address" );
        require(OrderToExist[orderHash] == true, "this order is not exist");
        _REMOVEMATCHORDER998(orderHash, matchOrderHash);
        emit DELETEMATCHORDER483(msg.sender, orderHash, matchOrderHash);
    }

                                                                                                                                                                                     
    function _REMOVEMATCHORDER998(	//inject NONSTANDARD NAMING
        bytes32 orderHash,
        bytes32 matchOrderHash
    )
    internal
    {
        uint256 matchOrderIndex = OrderToMatchOrderIndex[orderHash][matchOrderHash];
        uint256 lastMatchOrderIndex = OrderToMatchOrders[orderHash].length.SUB244(1);
        if (lastMatchOrderIndex != matchOrderIndex){
            bytes32 lastMatchOrder = OrderToMatchOrders[orderHash][lastMatchOrderIndex];
            OrderToMatchOrders[orderHash][matchOrderIndex] = lastMatchOrder;
            OrderToMatchOrderIndex[orderHash][lastMatchOrder] = matchOrderIndex;
        }
        OrderToMatchOrders[orderHash].length--;
    }

                                                                                                                                                                                                                                                                                                                        
    function EXCHANGETOKEN536(	//inject NONSTANDARD NAMING
        bytes32 order,
        bytes32 matchOrder
    ) 
    external 
    {
        require(OrderToOwner[order] == msg.sender, "this order doesn't belongs to this address");
        OrderObj memory orderObj = HashToOrderObj[order];
        uint index = OrderToMatchOrderIndex[order][matchOrder];
        require(OrderToMatchOrders[order][index] == matchOrder, "match order is not in this order");
        require(OrderToExist[matchOrder] != true, "this match order's token have open order");
        OrderObj memory matchOrderObj = HashToOrderObj[matchOrder];
        _SENDTOKEN188(matchOrderObj.owner, orderObj.contractAddress, orderObj.tokenId);
        _SENDTOKEN188(orderObj.owner, matchOrderObj.contractAddress, matchOrderObj.tokenId);
        _REMOVEMATCHORDER998(order, matchOrder);
        _REMOVEORDER35(msg.sender, order);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function RECEIVEERC721TOKEN98(	//inject NONSTANDARD NAMING
        address contractAddress, 
        uint256 tokenId
    ) 
    external  
    {
        bool checkSupportErc165Interface = false;
        if(contractAddress != cryptokittiesaddress842){
            for(uint i = 0; i < SupportNFTInterface.length; i++){
                if(contractAddress._SUPPORTSINTERFACE780(SupportNFTInterface[i]) == true){
                    checkSupportErc165Interface = true;
                }
            }
            require(checkSupportErc165Interface == true, "not supported Erc165 Interface");
            Erc721Interface erc721Contract = Erc721Interface(contractAddress);
            require(erc721Contract.ISAPPROVEDFORALL552(msg.sender,address(this)) == true, "contract doesn't have power to control this token id");
            erc721Contract.TRANSFERFROM316(msg.sender, address(this), tokenId);
        }else {
            KittyInterface kittyContract = KittyInterface(contractAddress);
            require(kittyContract.kittyIndexToApproved(tokenId) == address(this), "contract doesn't have power to control this cryptoKitties's id");
            kittyContract.TRANSFERFROM316(msg.sender, address(this), tokenId);
        }
        _ADDTOKEN113(msg.sender, contractAddress, tokenId);
        emit RECEIVETOKEN364(msg.sender, contractAddress, tokenId);

    }

                                                                                                                                                                                                                                                                                                   
    function _ADDTOKEN113(	//inject NONSTANDARD NAMING
        address sender, 
        address contractAddress, 
        uint256 tokenId
    ) 
    internal 
    {   
        bytes32 matchOrderHash = keccak256(abi.encodePacked(contractAddress, tokenId, sender));
        MatchOrderToOwner[matchOrderHash] = sender;
        HashToOrderObj[matchOrderHash] = OrderObj(sender,contractAddress,tokenId);
        TokenToOwner[contractAddress][tokenId] = sender;
        uint index = OwnerToTokens[sender][contractAddress].push(tokenId).SUB244(1);
        TokenToIndex[contractAddress][tokenId] = index;
        emit CREATEORDEROBJ110(matchOrderHash, sender, contractAddress, tokenId);
    }


                                                                                                                                                                                                                                                                                                                                                                                                     
    function SENDBACKTOKEN625(	//inject NONSTANDARD NAMING
        address contractAddress, 
        uint256 tokenId
    ) 
    external 
    ONLYSENDERISORIGINALOWNER410(
        contractAddress, 
        tokenId
    ) 
    {
        bytes32 orderHash = keccak256(abi.encodePacked(contractAddress, tokenId, msg.sender));
        if(OrderToExist[orderHash] == true) {
            _REMOVEORDER35(msg.sender, orderHash);
        }
        _SENDTOKEN188(msg.sender, contractAddress, tokenId);
        emit SENDBACKTOKEN587(msg.sender, contractAddress, tokenId);
    }  


                                                                                                                                                                                                                                                                                                                                          
    function _SENDTOKEN188(	//inject NONSTANDARD NAMING
        address sendAddress,
        address contractAddress, 
        uint256 tokenId
    )
    internal
    {   
        if(contractAddress != cryptokittiesaddress842){
            Erc721Interface erc721Contract = Erc721Interface(contractAddress);
            require(erc721Contract.OWNEROF94(tokenId) == address(this), "exchange contract should have this token");
            erc721Contract.TRANSFERFROM316(address(this), sendAddress, tokenId);
        }else{
            KittyInterface kittyContract = KittyInterface(contractAddress);
            require(kittyContract.OWNEROF94(tokenId) == address(this), "exchange contract should have this token");
            kittyContract.TRANSFER398(sendAddress, tokenId);
        }
        _REMOVETOKEN991(contractAddress, tokenId);
        emit SENDTOKEN158(sendAddress, contractAddress, tokenId);
    }

                                                                                                                                                                      
    function _REMOVETOKEN991(	//inject NONSTANDARD NAMING
        address contractAddress, 
        uint256 tokenId
    ) 
    internal 
    {
        address owner = TokenToOwner[contractAddress][tokenId];
        bytes32 orderHash = keccak256(abi.encodePacked(contractAddress, tokenId, owner));
        delete HashToOrderObj[orderHash];
        delete MatchOrderToOwner[orderHash];
        delete TokenToOwner[contractAddress][tokenId];
        uint256 tokenIndex = TokenToIndex[contractAddress][tokenId];
        uint256 lastOwnerTokenIndex = OwnerToTokens[owner][contractAddress].length.SUB244(1);
        if (lastOwnerTokenIndex != tokenIndex){
            uint256 lastOwnerToken = OwnerToTokens[owner][contractAddress][lastOwnerTokenIndex];
            OwnerToTokens[owner][contractAddress][tokenIndex] = lastOwnerToken;
            TokenToIndex[contractAddress][lastOwnerToken] = tokenIndex;
        }
        OwnerToTokens[owner][contractAddress].length--;
    }

                                                                                                                                                                 
    function GETTOKENOWNER562(	//inject NONSTANDARD NAMING
        address contractAddress, 
        uint256 tokenId
    ) 
    external 
    view 
    returns (address)
    {
        return TokenToOwner[contractAddress][tokenId];
    }
    
                                                                                                                                                                                                      
    function GETOWNERTOKENS10(	//inject NONSTANDARD NAMING
        address ownerAddress, 
        address contractAddress
    ) 
    external 
    view 
    returns (uint256[] memory)
    {
        return OwnerToTokens[ownerAddress][contractAddress];
    }

                                                                                                                                                                           
    function GETTOKENINDEX339(	//inject NONSTANDARD NAMING
        address contractAddress, 
        uint256 tokenId
    ) 
    external 
    view
    returns (uint256)
    {
        return TokenToIndex[contractAddress][tokenId];
    }

                                                                                                                           
    function GETOWNERORDERS194(	//inject NONSTANDARD NAMING
        address ownerAddress
    ) 
    external 
    view 
    returns (bytes32[] memory){
        return OwnerToOrders[ownerAddress];
    }

                                                                                                                               
    function GETORDEROWNER45(	//inject NONSTANDARD NAMING
        bytes32 order
    ) 
    external 
    view 
    returns (address)
    {
        return OrderToOwner[order];
    }

                                                                                                                             
    function GETORDERINDEX923(	//inject NONSTANDARD NAMING
        bytes32 order
    ) 
    external 
    view 
    returns (uint)
    {
        return OrderToIndex[order];
    }

                                                                                                                                                   
    function GETORDEREXIST260(	//inject NONSTANDARD NAMING
        bytes32 order
    )
    external
    view
    returns (bool){
        return OrderToExist[order];
    }

                                                                                                                                                   
    function GETMATCHORDEROWNER548(	//inject NONSTANDARD NAMING
        bytes32 matchOrder
    ) 
    external 
    view 
    returns (address)
    {
        return MatchOrderToOwner[matchOrder];
    }

                                                                                                                                                       
    function GETORDERMATCHORDERINDEX397(	//inject NONSTANDARD NAMING
        bytes32 order,
        bytes32 matchOrder
    ) 
    external 
    view 
    returns (uint)
    {
        return OrderToMatchOrderIndex[order][matchOrder];
    }

                                                                                                                     
    function GETORDERMATCHORDERS208(	//inject NONSTANDARD NAMING
        bytes32 order
    ) 
    external 
    view 
    returns (bytes32[] memory)
    {
        return OrderToMatchOrders[order];
    }

                                                                                                                                                          
    function GETHASHORDEROBJ25(	//inject NONSTANDARD NAMING
        bytes32 hashOrder
    )
    external
    view
    returns(
        address, 
        address, 
        uint256
    )
    {
        OrderObj memory orderObj = HashToOrderObj[hashOrder];
        return(
            orderObj.owner,
            orderObj.contractAddress,
            orderObj.tokenId
        );
    }
}