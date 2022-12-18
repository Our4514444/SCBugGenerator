                                                                 

pragma solidity ^0.5.15;

contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER709() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA761() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
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

    function CURRENT628(Counter storage counter) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return counter._value;
    }

    function INCREMENT937(Counter storage counter) internal {	//inject NONSTANDARD NAMING
        // The {SafeMath} overflow check can be skipped here, see the comment at the top
        counter._value += 1;
    }

    function DECREMENT836(Counter storage counter) internal {	//inject NONSTANDARD NAMING
        counter._value = counter._value.SUB762(1);
    }
}

interface IERC165 {
                                                                                                                                                                                                                                                                                                                                                        
    function SUPPORTSINTERFACE975(bytes4 interfaceId) external view returns (bool);	//inject NONSTANDARD NAMING
}

contract ERC165 is IERC165 {
                                                                                  
    bytes4 private constant _interface_id_erc165583 = 0x01ffc9a7;	//inject NONSTANDARD NAMING

                                                                                      
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor () internal {
        // Derived contracts need only register support for their own interfaces,
        // we register support for ERC165 itself here
        _REGISTERINTERFACE685(_interface_id_erc165583);
    }

                                                                                                                                               
    function SUPPORTSINTERFACE975(bytes4 interfaceId) external view returns (bool) {	//inject NONSTANDARD NAMING
        return _supportedInterfaces[interfaceId];
    }

                                                                                                                                                                                                                                                                                                                                                                                                   
    function _REGISTERINTERFACE685(bytes4 interfaceId) internal {	//inject NONSTANDARD NAMING
        require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
        _supportedInterfaces[interfaceId] = true;
    }
}

library SafeMath {
                                                                                                                                                                                                                             
    function ADD581(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB762(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB762(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB762(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL850(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV852(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV852(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV852(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD43(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD43(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD43(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract IERC721 is IERC165 {
    event TRANSFER485(address indexed from, address indexed to, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVAL746(address indexed owner, address indexed approved, uint256 indexed tokenId);	//inject NONSTANDARD NAMING
    event APPROVALFORALL161(address indexed owner, address indexed operator, bool approved);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF192(address owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING

                                                                                
    function OWNEROF599(uint256 tokenId) public view returns (address owner);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                       
    function SAFETRANSFERFROM491(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                              
    function TRANSFERFROM880(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function APPROVE140(address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
    function GETAPPROVED589(uint256 tokenId) public view returns (address operator);	//inject NONSTANDARD NAMING

    function SETAPPROVALFORALL901(address operator, bool _approved) public;	//inject NONSTANDARD NAMING
    function ISAPPROVEDFORALL648(address owner, address operator) public view returns (bool);	//inject NONSTANDARD NAMING


    function SAFETRANSFERFROM491(address from, address to, uint256 tokenId, bytes memory data) public;	//inject NONSTANDARD NAMING
}

contract ERC721 is Context, ERC165, IERC721 {
    using SafeMath for uint256;
    using Address for address;
    using Counters for Counters.Counter;

    // Equals to `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
    // which can be also obtained as `IERC721Receiver(0).onERC721Received.selector`
    bytes4 private constant _erc721_received907 = 0x150b7a02;	//inject NONSTANDARD NAMING

    // Mapping from token ID to owner
    mapping (uint256 => address) private _tokenOwner;

    // Mapping from token ID to approved address
    mapping (uint256 => address) private _tokenApprovals;

    // Mapping from owner to number of owned token
    mapping (address => Counters.Counter) private _ownedTokensCount;

    // Mapping from owner to operator approvals
    mapping (address => mapping (address => bool)) private _operatorApprovals;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    bytes4 private constant _interface_id_erc721185 = 0x80ac58cd;	//inject NONSTANDARD NAMING

    constructor () public {
        // register the supported interfaces to conform to ERC721 via ERC165
        _REGISTERINTERFACE685(_interface_id_erc721185);
    }

                                                                                                                                                                                                     
    function BALANCEOF192(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC721: balance query for the zero address");

        return _ownedTokensCount[owner].CURRENT628();
    }

                                                                                                                                                                                                                    
    function OWNEROF599(uint256 tokenId) public view returns (address) {	//inject NONSTANDARD NAMING
        address owner = _tokenOwner[tokenId];
        require(owner != address(0), "ERC721: owner query for nonexistent token");

        return owner;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                              
    function APPROVE140(address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        address owner = OWNEROF599(tokenId);
        require(to != owner, "ERC721: approval to current owner");

        require(_MSGSENDER709() == owner || ISAPPROVEDFORALL648(owner, _MSGSENDER709()),
            "ERC721: approve caller is not owner nor approved for all"
        );

        _tokenApprovals[tokenId] = to;
        emit APPROVAL746(owner, to, tokenId);
    }

                                                                                                                                                                                                                                                                                      
    function GETAPPROVED589(uint256 tokenId) public view returns (address) {	//inject NONSTANDARD NAMING
        require(_EXISTS89(tokenId), "ERC721: approved query for nonexistent token");

        return _tokenApprovals[tokenId];
    }

                                                                                                                                                                                                                                                                                              
    function SETAPPROVALFORALL901(address to, bool approved) public {	//inject NONSTANDARD NAMING
        require(to != _MSGSENDER709(), "ERC721: approve to caller");

        _operatorApprovals[_MSGSENDER709()][to] = approved;
        emit APPROVALFORALL161(_MSGSENDER709(), to, approved);
    }

                                                                                                                                                                                                                                                                                                                           
    function ISAPPROVEDFORALL648(address owner, address operator) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _operatorApprovals[owner][operator];
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                              
    function TRANSFERFROM880(address from, address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        //solhint-disable-next-line max-line-length
        require(_ISAPPROVEDOROWNER70(_MSGSENDER709(), tokenId), "ERC721: transfer caller is not owner nor approved");

        _TRANSFERFROM206(from, to, tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function SAFETRANSFERFROM491(address from, address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
        SAFETRANSFERFROM491(from, to, tokenId, "");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function SAFETRANSFERFROM491(address from, address to, uint256 tokenId, bytes memory _data) public {	//inject NONSTANDARD NAMING
        require(_ISAPPROVEDOROWNER70(_MSGSENDER709(), tokenId), "ERC721: transfer caller is not owner nor approved");
        _SAFETRANSFERFROM619(from, to, tokenId, _data);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function _SAFETRANSFERFROM619(address from, address to, uint256 tokenId, bytes memory _data) internal {	//inject NONSTANDARD NAMING
        _TRANSFERFROM206(from, to, tokenId);
        require(_CHECKONERC721RECEIVED700(from, to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
    }

                                                                                                                                                                                            
    function _EXISTS89(uint256 tokenId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

                                                                                                                                                                                                                                                                                                                                                                  
    function _ISAPPROVEDOROWNER70(address spender, uint256 tokenId) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(_EXISTS89(tokenId), "ERC721: operator query for nonexistent token");
        address owner = OWNEROF599(tokenId);
        return (spender == owner || GETAPPROVED589(tokenId) == spender || ISAPPROVEDFORALL648(owner, spender));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function _SAFEMINT476(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        _SAFEMINT476(to, tokenId, "");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _SAFEMINT476(address to, uint256 tokenId, bytes memory _data) internal {	//inject NONSTANDARD NAMING
        _MINT57(to, tokenId);
        require(_CHECKONERC721RECEIVED700(address(0), to, tokenId, _data), "ERC721: transfer to non ERC721Receiver implementer");
    }

                                                                                                                                                                                                                                              
    function _MINT57(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(to != address(0), "ERC721: mint to the zero address");
        require(!_EXISTS89(tokenId), "ERC721: token already minted");

        _tokenOwner[tokenId] = to;
        _ownedTokensCount[to].INCREMENT937();

        emit TRANSFER485(address(0), to, tokenId);
    }

                                                                                                                                                                                                                                                                     
    function _BURN490(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(OWNEROF599(tokenId) == owner, "ERC721: burn of token that is not own");

        _CLEARAPPROVAL791(tokenId);

        _ownedTokensCount[owner].DECREMENT836();
        _tokenOwner[tokenId] = address(0);

        emit TRANSFER485(owner, address(0), tokenId);
    }

                                                                                                                                                                              
    function _BURN490(uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        _BURN490(OWNEROF599(tokenId), tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                  
    function _TRANSFERFROM206(address from, address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
        require(OWNEROF599(tokenId) == from, "ERC721: transfer of token that is not own");
        require(to != address(0), "ERC721: transfer to the zero address");

        _CLEARAPPROVAL791(tokenId);

        _ownedTokensCount[from].DECREMENT836();
        _ownedTokensCount[to].INCREMENT937();

        _tokenOwner[tokenId] = to;

        emit TRANSFER485(from, to, tokenId);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function _CHECKONERC721RECEIVED700(address from, address to, uint256 tokenId, bytes memory _data)	//inject NONSTANDARD NAMING
        internal returns (bool)
    {
        if (!to.ISCONTRACT225()) {
            return true;
        }
        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = to.call(abi.encodeWithSelector(
            IERC721Receiver(to).ONERC721RECEIVED492.selector,
            _MSGSENDER709(),
            from,
            tokenId,
            _data
        ));
        if (!success) {
            if (returndata.length > 0) {
                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert("ERC721: transfer to non ERC721Receiver implementer");
            }
        } else {
            bytes4 retval = abi.decode(returndata, (bytes4));
            return (retval == _erc721_received907);
        }
    }

                                                                                                                                                           
    function _CLEARAPPROVAL791(uint256 tokenId) private {	//inject NONSTANDARD NAMING
        if (_tokenApprovals[tokenId] != address(0)) {
            _tokenApprovals[tokenId] = address(0);
        }
    }
}

contract IERC721Receiver {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function ONERC721RECEIVED492(address operator, address from, uint256 tokenId, bytes memory data)	//inject NONSTANDARD NAMING
    public returns (bytes4);
}

library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    function ISCONTRACT225(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

                                                                                                                                                                                                          
    function TOPAYABLE690(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE935(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

contract Poap is ERC721 {
    event EVENTTOKEN872(uint256 eventId, uint256 tokenId);	//inject NONSTANDARD NAMING

    // Last Used id (used to generate new ids)
    uint256 private lastId;

    // EventId for each token
    mapping(uint256 => uint256) private _tokenEvent;

                                                                                                                                                                                                                                                                                          
    function _MINTTOKEN359(uint256 eventId, uint256 tokenId, address to) internal returns (bool) {	//inject NONSTANDARD NAMING
        _MINT57(to, tokenId);
        _tokenEvent[tokenId] = eventId;
        emit EVENTTOKEN872(eventId, tokenId);
        return true;
    }

                                                                                                                                                                                                                                              
    function MINTTOKEN119(uint256 eventId, address to) public returns (bool) {	//inject NONSTANDARD NAMING
        lastId += 1;
        return _MINTTOKEN359(eventId, lastId, to);
    }
}

contract PoapDelegatedMint {

    event VERIFIEDSIGNATURE157(	//inject NONSTANDARD NAMING
        bytes _signedMessage
    );

    string public name = "POAP Delegated Mint";

    // POAP Contract - Only Mint Token function
    Poap POAPToken;

    // Contract creator
    address public owner;

    // POAP valid token minter
    address public validSigner;

    // Processed signatures
    mapping(bytes => bool) public processed;

    constructor (address _poapContractAddress, address _validSigner) public{
        validSigner = _validSigner;
        POAPToken = Poap(_poapContractAddress);
        owner = msg.sender;
    }

    function _RECOVERSIGNER95(bytes32 message, bytes memory signature) private pure returns (address) {	//inject NONSTANDARD NAMING
        uint8 v;
        bytes32 r;
        bytes32 s;

        (v, r, s) = _SPLITSIGNATURE897(signature);
        return ecrecover(message, v, r, s);
    }

    function _SPLITSIGNATURE897(bytes memory signature) private pure returns (uint8, bytes32, bytes32) {	//inject NONSTANDARD NAMING
        require(signature.length == 65);

        bytes32 r;
        bytes32 s;
        uint8 v;

        assembly {
        // first 32 bytes, after the length prefix
            r := mload(add(signature, 32))
        // second 32 bytes
            s := mload(add(signature, 64))
        // final byte (first byte of the next 32 bytes)
            v := byte(0, mload(add(signature, 96)))
        }

        return (v, r, s);
    }

    function _ISVALIDDATA883(uint256 _event_id, address _receiver, bytes memory _signed_message) private view returns(bool) {	//inject NONSTANDARD NAMING
        bytes32 message = keccak256(abi.encodePacked(_event_id, _receiver));
        return (_RECOVERSIGNER95(message, _signed_message) == validSigner);
    }

    function MINTTOKEN119(uint256 event_id, address receiver, bytes memory signedMessage) public returns (bool) {	//inject NONSTANDARD NAMING
        // Check that the signature is valid
        require(_ISVALIDDATA883(event_id, receiver, signedMessage), "Invalid signed message");
        // Check that the signature was not already processed
        require(processed[signedMessage] == false, "Signature already processed");

        processed[signedMessage] = true;
        emit VERIFIEDSIGNATURE157(signedMessage);
        return POAPToken.MINTTOKEN119(event_id, receiver);
    }
}