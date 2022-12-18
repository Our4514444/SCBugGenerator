pragma solidity ^0.5.2;



interface IERC165 {
                                                                                                                                                                                                                                                                    
    function SUPPORTSINTERFACE455(bytes4 interfaceId) external view returns (bool);	//inject NONSTANDARD NAMING
}

contract ERC165 is IERC165 {
    bytes4 private constant _interface_id_erc165128 = 0x01ffc9a7;	//inject NONSTANDARD NAMING
                                                                                              

                                                                                      
    mapping(bytes4 => bool) private _supportedInterfaces;

                                                                                                                
    constructor () internal {
        _REGISTERINTERFACE646(_interface_id_erc165128);
    }

                                                                                     
    function SUPPORTSINTERFACE455(bytes4 interfaceId) external view returns (bool) {	//inject NONSTANDARD NAMING
        return _supportedInterfaces[interfaceId];
    }

                                                                         
    function _REGISTERINTERFACE646(bytes4 interfaceId) internal {	//inject NONSTANDARD NAMING
        require(interfaceId != 0xffffffff);
        _supportedInterfaces[interfaceId] = true;
    }
}


library SafeMath {
                                                                                  
    function MUL491(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV786(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB436(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD269(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD40(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


library Counters {
    using SafeMath for uint256;

    struct Counter {
        // This variable should never be directly accessed by users of the library: interactions must be restricted to
        // the library's function. As of Solidity v0.5.2, this cannot be enforced, though there is a proposal to add
        // this feature: see https://github.com/ethereum/solidity/issues/4637
        uint256 _value; // default: 0
    }

    function CURRENT36(Counter storage counter) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return counter._value;
    }

    function INCREMENT506(Counter storage counter) internal {	//inject NONSTANDARD NAMING
        counter._value += 1;
    }

    function DECREMENT568(Counter storage counter) internal {	//inject NONSTANDARD NAMING
        counter._value = counter._value.SUB436(1);
    }
}

contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED78(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED78(address(0), _owner);
    }

                                                        
    function OWNER592() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER33() {	//inject NONSTANDARD NAMING
        require(ISOWNER896());
        _;
    }

                                                                                 
    function ISOWNER896() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP54() public ONLYOWNER33 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED78(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP247(address newOwner) public ONLYOWNER33 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP271(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP271(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED78(_owner, newOwner);
        _owner = newOwner;
    }
}

contract IERC721 is IERC165 {
    event TRANSFER182(address indexed from, address indexed to, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVAL975(address indexed owner, address indexed approved, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVALFORALL58(address indexed owner, address indexed operator, bool approved);	//inject NONSTANDARD NAMING

    function BALANCEOF288(address owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING
    function OWNEROF915(uint256 tokenId) public view returns (address owner);	//inject NONSTANDARD NAMING

    function APPROVE828(address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function GETAPPROVED944(uint256 tokenId) public view returns (address operator);	//inject NONSTANDARD NAMING

    function SETAPPROVALFORALL403(address operator, bool _approved) public;	//inject NONSTANDARD NAMING
    function ISAPPROVEDFORALL223(address owner, address operator) public view returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM330(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function SAFETRANSFERFROM661(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING

    function SAFETRANSFERFROM661(address from, address to, uint256 tokenId, bytes memory data) public;	//inject NONSTANDARD NAMING
}

contract ERC721 is ERC165, IERC721 {
    using SafeMath for uint256;
    using Address for address;
    using Counters for Counters.Counter;

    // Equals to `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
    // which can be also obtained as `IERC721Receiver(0).onERC721Received.selector`
    bytes4 private constant _erc721_received482 = 0x150b7a02;	//inject NONSTANDARD NAMING

    // Mapping from token ID to owner
    mapping (uint256 => address) private _tokenOwner;

    // Mapping from token ID to approved address
    mapping (uint256 => address) private _tokenApprovals;

    // Mapping from owner to number of owned token
    mapping (address => Counters.Counter) private _ownedTokensCount;

    // Mapping from owner to operator approvals
    mapping (address => mapping (address => bool)) private _operatorApprovals;

    bytes4 private constant _interface_id_erc721639 = 0x80ac58cd;	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

    constructor () public {
        // register the supported interfaces to conform to ERC721 via ERC165
        _REGISTERINTERFACE646(_interface_id_erc721639);
    }

                                                                                                                                                                                                     
    function BALANCEOF288(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        require(owner != address(0));
        return _ownedTokensCount[owner].CURRENT36();
    }

                                                                                                                                                                                                                    
    function OWNEROF915(uint256 tokenId) public view returns (address) {	//inject NONSTANDARD NAMING
        address owner = _tokenOwner[tokenId];
        require(owner != address(0));
        return owner;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                              
    function APPROVE828(address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        address owner = OWNEROF915(tokenId);
        require(to != owner);
        require(msg.sender == owner || ISAPPROVEDFORALL223(owner, msg.sender));

        _tokenApprovals[tokenId] = to;
        emit APPROVAL975(owner, to, tokenId);
    }

                                                                                                                                                                                                                                                                                      
    function GETAPPROVED944(uint256 tokenId) public view returns (address) {	//inject NONSTANDARD NAMING
        require(_EXISTS406(tokenId));
        return _tokenApprovals[tokenId];
    }

                                                                                                                                                                                                                                                                                              
    function SETAPPROVALFORALL403(address to, bool approved) public {	//inject NONSTANDARD NAMING
        require(to != msg.sender);
        _operatorApprovals[msg.sender][to] = approved;
        emit APPROVALFORALL58(msg.sender, to, approved);
    }

                                                                                                                                                                                                                                                                                                                           
    function ISAPPROVEDFORALL223(address owner, address operator) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _operatorApprovals[owner][operator];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function TRANSFERFROM330(address from, address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        require(_ISAPPROVEDOROWNER250(msg.sender, tokenId));

        _TRANSFERFROM150(from, to, tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function SAFETRANSFERFROM661(address from, address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        SAFETRANSFERFROM661(from, to, tokenId, "");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function SAFETRANSFERFROM661(address from, address to, uint256 tokenId, bytes memory _data) public {	//inject NONSTANDARD NAMING
        TRANSFERFROM330(from, to, tokenId);
        require(_CHECKONERC721RECEIVED802(from, to, tokenId, _data));
    }

                                                                                                                                                                                            
    function _EXISTS406(uint256 tokenId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

                                                                                                                                                                                                                                                                                                                                                                  
    function _ISAPPROVEDOROWNER250(address spender, uint256 tokenId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        address owner = OWNEROF915(tokenId);
        return (spender == owner || GETAPPROVED944(tokenId) == spender || ISAPPROVEDFORALL223(owner, spender));
    }

                                                                                                                                                                                                                                              
    function _MINT891(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));
        require(!_EXISTS406(tokenId));

        _tokenOwner[tokenId] = to;
        _ownedTokensCount[to].INCREMENT506();

        emit TRANSFER182(address(0), to, tokenId);
    }

                                                                                                                                                                                                                                                                            
    function _BURN53(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(OWNEROF915(tokenId) == owner);

        _CLEARAPPROVAL524(tokenId);

        _ownedTokensCount[owner].DECREMENT568();
        _tokenOwner[tokenId] = address(0);

        emit TRANSFER182(owner, address(0), tokenId);
    }

                                                                                                                                                                              
    function _BURN53(uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        _BURN53(OWNEROF915(tokenId), tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                
    function _TRANSFERFROM150(address from, address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(OWNEROF915(tokenId) == from);
        require(to != address(0));

        _CLEARAPPROVAL524(tokenId);

        _ownedTokensCount[from].DECREMENT568();
        _ownedTokensCount[to].INCREMENT506();

        _tokenOwner[tokenId] = to;

        emit TRANSFER182(from, to, tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function _CHECKONERC721RECEIVED802(address from, address to, uint256 tokenId, bytes memory _data)	//inject NONSTANDARD NAMING
        internal returns (bool)
    {
        if (!to.ISCONTRACT798()) {
            return true;
        }

        bytes4 retval = IERC721Receiver(to).ONERC721RECEIVED625(msg.sender, from, tokenId, _data);
        return (retval == _erc721_received482);
    }

                                                                                                                                                           
    function _CLEARAPPROVAL524(uint256 tokenId) private {	//inject NONSTANDARD NAMING
        if (_tokenApprovals[tokenId] != address(0)) {
            _tokenApprovals[tokenId] = address(0);
        }
    }
}

contract IERC721Enumerable is IERC721 {
    function TOTALSUPPLY215() public view returns (uint256);	//inject NONSTANDARD NAMING
    function TOKENOFOWNERBYINDEX448(address owner, uint256 index) public view returns (uint256 tokenId);	//inject NONSTANDARD NAMING

    function TOKENBYINDEX339(uint256 index) public view returns (uint256);	//inject NONSTANDARD NAMING
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

    bytes4 private constant _interface_id_erc721_enumerable454 = 0x780e9d63;	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                 

                                                 
    constructor () public {
        // register the supported interface to conform to ERC721Enumerable via ERC165
        _REGISTERINTERFACE646(_interface_id_erc721_enumerable454);
    }

                                                                                                                                                                                                                                                                                                                                                                               
    function TOKENOFOWNERBYINDEX448(address owner, uint256 index) public view returns (uint256) {	//inject NONSTANDARD NAMING
        require(index < BALANCEOF288(owner));
        return _ownedTokens[owner][index];
    }

                                                                                                                                                  
    function TOTALSUPPLY215() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allTokens.length;
    }

                                                                                                                                                                                                                                                                                                                                           
    function TOKENBYINDEX339(uint256 index) public view returns (uint256) {	//inject NONSTANDARD NAMING
        require(index < TOTALSUPPLY215());
        return _allTokens[index];
    }

                                                                                                                                                                                                                                                                                                                                                                                
    function _TRANSFERFROM150(address from, address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._TRANSFERFROM150(from, to, tokenId);

        _REMOVETOKENFROMOWNERENUMERATION621(from, tokenId);

        _ADDTOKENTOOWNERENUMERATION631(to, tokenId);
    }

                                                                                                                                                                                                                                                          
    function _MINT891(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._MINT891(to, tokenId);

        _ADDTOKENTOOWNERENUMERATION631(to, tokenId);

        _ADDTOKENTOALLTOKENSENUMERATION888(tokenId);
    }

                                                                                                                                                                                                                                                                            
    function _BURN53(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._BURN53(owner, tokenId);

        _REMOVETOKENFROMOWNERENUMERATION621(owner, tokenId);
        // Since tokenId will be deleted, we can clear its slot in _ownedTokensIndex to trigger a gas refund
        _ownedTokensIndex[tokenId] = 0;

        _REMOVETOKENFROMALLTOKENSENUMERATION365(tokenId);
    }

                                                                                                                                                                                                      
    function _TOKENSOFOWNER125(address owner) internal view returns (uint256[] storage) {	//inject NONSTANDARD NAMING
        return _ownedTokens[owner];
    }

                                                                                                                                                                                                                                                                                               
    function _ADDTOKENTOOWNERENUMERATION631(address to, uint256 tokenId) private {	//inject NONSTANDARD NAMING
        _ownedTokensIndex[tokenId] = _ownedTokens[to].length;
        _ownedTokens[to].push(tokenId);
    }

                                                                                                                                                                                            
    function _ADDTOKENTOALLTOKENSENUMERATION888(uint256 tokenId) private {	//inject NONSTANDARD NAMING
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function _REMOVETOKENFROMOWNERENUMERATION621(address from, uint256 tokenId) private {	//inject NONSTANDARD NAMING
        // To prevent a gap in from's tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _ownedTokens[from].length.SUB436(1);
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

                                                                                                                                                                                                                                                                                         
    function _REMOVETOKENFROMALLTOKENSENUMERATION365(uint256 tokenId) private {	//inject NONSTANDARD NAMING
        // To prevent a gap in the tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _allTokens.length.SUB436(1);
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

contract IERC721Metadata is IERC721 {
    function NAME984() external view returns (string memory);	//inject NONSTANDARD NAMING
    function SYMBOL316() external view returns (string memory);	//inject NONSTANDARD NAMING
    function TOKENURI643(uint256 tokenId) external view returns (string memory);	//inject NONSTANDARD NAMING
}

contract ERC721Metadata is ERC165, ERC721, IERC721Metadata {
    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Optional mapping for token URIs
    mapping(uint256 => string) private _tokenURIs;

    bytes4 private constant _interface_id_erc721_metadata482 = 0x5b5e139f;	//inject NONSTANDARD NAMING
                                                                                                                                                                          

                                                
    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;

        // register the supported interfaces to conform to ERC721 via ERC165
        _REGISTERINTERFACE646(_interface_id_erc721_metadata482);
    }

                                                                                                  
    function NAME984() external view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                                                                      
    function SYMBOL316() external view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                                                                                                                                                 
    function _TOKENURI323(uint256 tokenId) internal view returns (string memory) {	//inject NONSTANDARD NAMING
        require(_EXISTS406(tokenId));
        return _tokenURIs[tokenId];
    }

                                                                                                                                                                                                                                        
    function _SETTOKENURI174(uint256 tokenId, string memory uri) internal {	//inject NONSTANDARD NAMING
        require(_EXISTS406(tokenId));
        _tokenURIs[tokenId] = uri;
    }

                                                                                                                                                                                                                                                                                              
    function _BURN53(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        super._BURN53(owner, tokenId);

        // Clear metadata (if any)
        if (bytes(_tokenURIs[tokenId]).length != 0) {
            delete _tokenURIs[tokenId];
        }
    }
}
contract IERC721Receiver {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ONERC721RECEIVED625(address operator, address from, uint256 tokenId, bytes memory data)	//inject NONSTANDARD NAMING
    public returns (bytes4);
}

library Address {
                                                                                                                                                                                                                                                                                                                                                                   
    function ISCONTRACT798(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                


contract kleee002test is ERC721, ERC721Enumerable, ERC721Metadata, Ownable {


    uint256 public liveTokenId;

    uint public price = 1;

    //mapping(uint256 => bytes32) private token2hash;
    //mapping(uint256 => string) private _tokenMSGs;

    string public info = "TEXT";
    bool public infohasnotbeenset = true;

    string public baseTokenURI = "https://fungle.xyz/tokenURI.php?id=";

    address private constant minter813 = 0x1003d51FeF31E52262B1E699f03C789cA6dbEfDC;	//inject NONSTANDARD NAMING

    address payable private constant payrollartist1569 = 0x4257D02E2854C9c86d6975FCd14a1aF4FA65a652;	//inject NONSTANDARD NAMING
    address payable private constant payrollartist2312 = 0x2ea533314069dC9B4dF29E72bD1dFB64cC68456d;	//inject NONSTANDARD NAMING


    event PAYMENTRECEIVED28(address from, uint256 amount);	//inject NONSTANDARD NAMING
    event TOKENMINTED717(address owner, uint256 tokenId);	//inject NONSTANDARD NAMING

    constructor () public ERC721Metadata("KLEEETEST02", "KTEST") {
        // solhint-disable-previous-line no-empty-blocks
    }

                                                                                                                                                                                

    modifier ONLYMINTERANDOWNER854 {	//inject NONSTANDARD NAMING
        require(msg.sender == minter813 || ISOWNER896() );
        _;
    }

    modifier COSTS148(uint price_) {	//inject NONSTANDARD NAMING
       if (msg.value >= price_) {
           _;
       }
   }


                                                                                                                                                                                



    function TOKENURI643(uint256 tokenId) external view returns (string memory) {	//inject NONSTANDARD NAMING
        require(_EXISTS406(tokenId));
        return STRCONCAT156(
            baseTokenURI,
            _TOKENURI323(tokenId)
        );
    }


                                                                                                                                                                                
    function STRCONCAT156(string memory a, string memory b) internal pure returns (string memory) {	//inject NONSTANDARD NAMING
        return string(abi.encodePacked(a, b));
    }

    function NEXTTOKENID858() internal returns(uint256) {	//inject NONSTANDARD NAMING
      liveTokenId = liveTokenId + 1;
      return liveTokenId;
    }


    function () external payable COSTS148(price){

        payrollartist1569.transfer(msg.value/2);
        payrollartist2312.transfer(msg.value/2);

        emit PAYMENTRECEIVED28(msg.sender, msg.value);

        ___MINT785(msg.sender);
    }


    function CREATETOKEN398(address newowner)	//inject NONSTANDARD NAMING
        ONLYMINTERANDOWNER854
        public
        returns(string memory)
    {

      //hash the color data
      //bytes32 colordatahash = keccak256(abi.encodePacked(data));
      ___MINT785(newowner);

    }


    //mint a new token
    function ___MINT785(address newowner)	//inject NONSTANDARD NAMING
      internal
      {

        //limit the totalSupply
        require(liveTokenId<=360);

        uint256 newTokenId = NEXTTOKENID858();

        //mint new token
        _MINT891(newowner, newTokenId);
        _SETTOKENURI174(newTokenId, UINT2STR587(newTokenId));

        emit TOKENMINTED717(newowner, newTokenId);

        //2 DO price maths
        price = price + price/75;

      }


    function CHANGEINFO363(string memory newstring)	//inject NONSTANDARD NAMING
      public
      ONLYOWNER33
    {
      require(infohasnotbeenset);
      info = newstring;
      infohasnotbeenset = false;
    }

    function CHANGEBASETOKENURI584(string memory newstring)	//inject NONSTANDARD NAMING
      public
      ONLYOWNER33
    {
      baseTokenURI = newstring;
    }


    function UINT2STR587(uint _i)	//inject NONSTANDARD NAMING
      internal
      pure
      returns (string memory _uintAsString)
    {
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