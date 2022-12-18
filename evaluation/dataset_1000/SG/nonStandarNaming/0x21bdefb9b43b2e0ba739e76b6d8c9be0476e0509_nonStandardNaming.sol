pragma solidity ^0.5.3;

library SafeMath {

                                                               
  function MUL86(uint256 _a, uint256 _b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (_a == 0) {
      return 0;
    }

    c = _a * _b;
    assert(c / _a == _b);
    return c;
  }

                                                                             
  function DIV45(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(_b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = _a / _b;
    // assert(_a == _b * c + _a % _b); // There is no case in which this doesn't hold
    return _a / _b;
  }

                                                                                                           
  function SUB956(uint256 _a, uint256 _b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(_b <= _a);
    return _a - _b;
  }

                                                         
  function ADD801(uint256 _a, uint256 _b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    c = _a + _b;
    assert(c >= _a);
    return c;
  }
}

library Address {

                                                                                                                                                                                                                                                                                                                                                     
  function ISCONTRACT665(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
    uint256 size;
    // XXX Currently there is no better way to check if there is a contract in an address
    // than to check the size of the code at that address.
    // See https://ethereum.stackexchange.com/a/14016/36603
    // for more details about how this works.
    // TODO Check this again before the Serenity release, because all addresses will be
    // contracts then.
    // solium-disable-next-line security/no-inline-assembly
    assembly { size := extcodesize(account) }
    return size > 0;
  }

}

library SafeERC20 {
    function SAFETRANSFER996(	//inject NONSTANDARD NAMING
      ERC20Basic _token,
      address _to,
      uint256 _value
    )
      internal
    {
      require(_token.TRANSFER935(_to, _value));
    }
  
    function SAFETRANSFERFROM520(	//inject NONSTANDARD NAMING
      ERC20 _token,
      address _from,
      address _to,
      uint256 _value
    )
      internal
    {
      require(_token.TRANSFERFROM490(_from, _to, _value));
    }
  
    function SAFEAPPROVE510(	//inject NONSTANDARD NAMING
      ERC20 _token,
      address _spender,
      uint256 _value
    )
      internal
    {
        require(_token.APPROVE366(_spender, _value));
    }
}

contract Ownable {
  address public owner;


  event OWNERSHIPRENOUNCED82(address indexed previousOwner);	//inject NONSTANDARD NAMING
  event OWNERSHIPTRANSFERRED928(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );


                                                                                                                   
  constructor() public {
    owner = msg.sender;
  }

                                                                           
  modifier ONLYOWNER422() {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }

                                                                                                                                                                                                                                                                   
  function RENOUNCEOWNERSHIP439() public ONLYOWNER422 {	//inject NONSTANDARD NAMING
    emit OWNERSHIPRENOUNCED82(owner);
    owner = address(0);
  }

                                                                                                                                                             
  function TRANSFEROWNERSHIP59(address _newOwner) public ONLYOWNER422 {	//inject NONSTANDARD NAMING
    _TRANSFEROWNERSHIP176(_newOwner);
  }

                                                                                                                                  
  function _TRANSFEROWNERSHIP176(address _newOwner) internal {	//inject NONSTANDARD NAMING
    require(_newOwner != address(0));
    emit OWNERSHIPTRANSFERRED928(owner, _newOwner);
    owner = _newOwner;
  }
}

contract Pausable is Ownable {
  event PAUSE438();	//inject NONSTANDARD NAMING
  event UNPAUSE217();	//inject NONSTANDARD NAMING

  bool public paused = false;


                                                                                                
  modifier WHENNOTPAUSED32() {	//inject NONSTANDARD NAMING
    require(!paused);
    _;
  }

                                                                                            
  modifier WHENPAUSED938() {	//inject NONSTANDARD NAMING
    require(paused);
    _;
  }

                                                                          
  function PAUSE325() public ONLYOWNER422 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
    paused = true;
    emit PAUSE438();
  }

                                                                             
  function UNPAUSE672() public ONLYOWNER422 WHENPAUSED938 {	//inject NONSTANDARD NAMING
    paused = false;
    emit UNPAUSE217();
  }
}

contract ERC20Basic {
  function TOTALSUPPLY665() public view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF453(address _who) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER935(address _to, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
  event TRANSFER592(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}
  
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) internal balances;

  uint256 internal totalSupply_;

                                                       
  function TOTALSUPPLY665() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return totalSupply_;
  }

                                                                                                                                                     
  function TRANSFER935(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_value <= balances[msg.sender]);
    require(_to != address(0));

    balances[msg.sender] = balances[msg.sender].SUB956(_value);
    balances[_to] = balances[_to].ADD801(_value);
    emit TRANSFER592(msg.sender, _to, _value);
    return true;
  }

                                                                                                                                                                                                     
  function BALANCEOF453(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return balances[_owner];
  }

}

contract ERC20 is ERC20Basic {
  function ALLOWANCE351(address _owner, address _spender)	//inject NONSTANDARD NAMING
    public view returns (uint256);

  function TRANSFERFROM490(address _from, address _to, uint256 _value)	//inject NONSTANDARD NAMING
    public returns (bool);

  function APPROVE366(address _spender, uint256 _value) public returns (bool);	//inject NONSTANDARD NAMING
  event APPROVAL570(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;


                                                                                                                                                                                                                                                                              
  function TRANSFERFROM490(	//inject NONSTANDARD NAMING
    address _from,
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);
    require(_to != address(0));

    balances[_from] = balances[_from].SUB956(_value);
    balances[_to] = balances[_to].ADD801(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB956(_value);
    emit TRANSFER592(_from, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
  function APPROVE366(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = _value;
    emit APPROVAL570(msg.sender, _spender, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                          
  function ALLOWANCE351(	//inject NONSTANDARD NAMING
    address _owner,
    address _spender
   )
    public
    view
    returns (uint256)
  {
    return allowed[_owner][_spender];
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  function INCREASEAPPROVAL771(	//inject NONSTANDARD NAMING
    address _spender,
    uint256 _addedValue
  )
    public
    returns (bool)
  {
    allowed[msg.sender][_spender] = (
      allowed[msg.sender][_spender].ADD801(_addedValue));
    emit APPROVAL570(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function DECREASEAPPROVAL963(	//inject NONSTANDARD NAMING
    address _spender,
    uint256 _subtractedValue
  )
    public
    returns (bool)
  {
    uint256 oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue >= oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.SUB956(_subtractedValue);
    }
    emit APPROVAL570(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}

contract PausableToken is StandardToken, Pausable {

  function TRANSFER935(	//inject NONSTANDARD NAMING
    address _to,
    uint256 _value
  )
    public
    WHENNOTPAUSED32
    returns (bool)
  {
    return super.TRANSFER935(_to, _value);
  }

  function TRANSFERFROM490(	//inject NONSTANDARD NAMING
    address _from,
    address _to,
    uint256 _value
  )
    public
    WHENNOTPAUSED32
    returns (bool)
  {
    return super.TRANSFERFROM490(_from, _to, _value);
  }

  function APPROVE366(	//inject NONSTANDARD NAMING
    address _spender,
    uint256 _value
  )
    public
    WHENNOTPAUSED32
    returns (bool)
  {
    return super.APPROVE366(_spender, _value);
  }

  function INCREASEAPPROVAL771(	//inject NONSTANDARD NAMING
    address _spender,
    uint _addedValue
  )
    public
    WHENNOTPAUSED32
    returns (bool success)
  {
    return super.INCREASEAPPROVAL771(_spender, _addedValue);
  }

  function DECREASEAPPROVAL963(	//inject NONSTANDARD NAMING
    address _spender,
    uint _subtractedValue
  )
    public
    WHENNOTPAUSED32
    returns (bool success)
  {
    return super.DECREASEAPPROVAL963(_spender, _subtractedValue);
  }
}

contract AccessControl is Ownable, Pausable {

                                                                                                     
    address payable public ceoAddress;
    address payable public cfoAddress;
    address payable public cooAddress;
    address payable public cmoAddress;
    address payable public BAEFeeAddress;
    address payable public owner = msg.sender;

                                                       
    modifier ONLYCEO388() {	//inject NONSTANDARD NAMING
        require(
            msg.sender == ceoAddress,
            "Only our CEO address can execute this function");
        _;
    }

                                                       
    modifier ONLYCFO124() {	//inject NONSTANDARD NAMING
        require(
            msg.sender == cfoAddress,
            "Only our CFO can can ll this function");
        _;
    }

                                                       
    modifier ONLYCOO457() {	//inject NONSTANDARD NAMING
        require(
            msg.sender == cooAddress,
            "Only our COO can can ll this function");
        _;
    }

                                                 
    modifier ONLYCLEVELOROWNER482() {	//inject NONSTANDARD NAMING
        require(
            msg.sender == cooAddress ||
            msg.sender == ceoAddress ||
            msg.sender == cfoAddress ||
            msg.sender == owner,
            "You need to be the owner or a Clevel @BAE to call this function"
        );
        _;
    }
    

                                                                                        
                                                 
    function SETCEO626(address payable _newCEO) external ONLYCEO388 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        require(_newCEO != address(0));
        ceoAddress = _newCEO;
    }

                                                                                        
                                                 
    function SETCFO30(address payable _newCFO) external ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        require(_newCFO != address(0));
        cfoAddress = _newCFO;
    }

                                                                                        
                                                 
    function SETCOO955(address payable _newCOO) external ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        require(_newCOO != address(0));
        cooAddress = _newCOO;
    }
                                                       
                                                 
    function SETCMO235(address payable _newCMO) external ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        require(_newCMO != address(0));
        cmoAddress = _newCMO;
    }

    function GETBAEFEEADDRESS830() external view ONLYCLEVELOROWNER482 returns (address) {	//inject NONSTANDARD NAMING
        return BAEFeeAddress;
    }

    function SETBAEFEEADDRESS175(address payable _newAddress) public ONLYCLEVELOROWNER482 {	//inject NONSTANDARD NAMING
        BAEFeeAddress = _newAddress;
    }

    // Only the CEO, COO, and CFO can execute this function:
    function PAUSE325() public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE438();
    }

    function UNPAUSE672() public ONLYCLEVELOROWNER482 WHENPAUSED938 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE217();
    }
}

contract Destructible is AccessControl {

                                                                                                                                                    
    function DESTROY798() public ONLYCLEVELOROWNER482 WHENPAUSED938{	//inject NONSTANDARD NAMING
        selfdestruct(owner);
    }

                                                                                                   
    function DESTROYANDSEND556(address payable _recipient) public ONLYCLEVELOROWNER482 WHENPAUSED938 {	//inject NONSTANDARD NAMING
        selfdestruct(_recipient);
    }
}

contract ArtShop is Destructible {
    using SafeMath for uint256;

                                                        
    event NEWARTPIECE480(uint pieceId, string  name, string artist);	//inject NONSTANDARD NAMING
                                                                              
    event URLCHANGE633(uint pieceId);	//inject NONSTANDARD NAMING

                                                                                              
                                                                       
    uint8 internal baeFeeLevel;
    uint8 internal royaltyFeeLevel;
    uint8 internal potFeeLevel = 5;

                                                                
    uint32 public timeUntilAbleToTransfer = 1 hours;

                                                 
                                                                           
                                                                                                          
    struct ArtpieceMetaData {
        uint8 remainingPrintings;
        uint64 basePrice;                      
        uint256 dateCreatedByTheArtist;
        string notes;
        bool isFirstSale;
        bool physical;
    }

                                          
    struct Artpiece {
        string name;                                                
        string artist;                                                               
        string thumbnailUrl;
        string mainUrl;
        string grade;
        uint64 price;                       
        uint8 feeLevel;                                 
        uint8 baeFeeLevel;
        ArtpieceMetaData metadata;
    }

    Artpiece[] artpieces;

    mapping (uint256 => address) public numArtInAddress;
    mapping (address => uint256) public artCollection;
    mapping (uint256 => address) public artpieceApproved;

                                                
    modifier ONLYWITHGLOBALLYSETFEE393() {	//inject NONSTANDARD NAMING
        require(
            baeFeeLevel > 0,
            "Requires a fee level to be set up"
        );
        require(
            royaltyFeeLevel > 0,
            "Requires a an artist fee level to be set up"
        );
        _;
    }

                                           
                                                                
    function SETBAEFEELEVEL643(uint8 _newFee) public ONLYCLEVELOROWNER482 {	//inject NONSTANDARD NAMING
        baeFeeLevel = _newFee;
    }

    function SETROYALTYFEELEVEL41(uint8 _newFee) public ONLYCLEVELOROWNER482 {	//inject NONSTANDARD NAMING
        royaltyFeeLevel = _newFee;
    }
    
    function _CREATEARTPIECE573(	//inject NONSTANDARD NAMING
        string memory _name,
        string memory _artist,
        string memory _thumbnailUrl,
        string memory _mainUrl,
        string memory _notes,
        string memory _grade,
        uint256 _dateCreatedByTheArtist,
        uint64 _price,
        uint64 _basePrice,
        uint8 _remainingPrintings,
        bool _physical
        )  
        internal
        ONLYWITHGLOBALLYSETFEE393
        WHENNOTPAUSED32
        {
        
        ArtpieceMetaData memory metd = ArtpieceMetaData(
                _remainingPrintings,
                _basePrice,
                _dateCreatedByTheArtist,
                _notes,
                true,
                _physical
        ); 
            
        Artpiece memory newArtpiece = Artpiece(
            _name,
            _artist,
            _thumbnailUrl,
            _mainUrl,
            _grade,
            _price,
            royaltyFeeLevel,
            baeFeeLevel,
            metd
        );
        uint id = artpieces.push(newArtpiece) - 1;

        numArtInAddress[id] = msg.sender;
        artCollection[msg.sender] = artCollection[msg.sender].ADD801(1);
            
        emit NEWARTPIECE480(id, _name, _artist);
    }
}

contract Helpers is ArtShop {
    
                                                             
    modifier ONLYOWNEROF549(uint _artpieceId) {	//inject NONSTANDARD NAMING
        require(msg.sender == numArtInAddress[_artpieceId]);
        _;
    }
    
                                                                              
                                                            
    modifier ONLYBEFOREFIRSTSALE731(uint _tokenId) {	//inject NONSTANDARD NAMING
        (,,,,bool isFirstSale,) = GETARTPIECEMETA444(_tokenId);
        require(isFirstSale == true);
        _;
    }

    event PRINTED136(uint indexed _id, uint256 indexed _time);	//inject NONSTANDARD NAMING
    
    function GETARTPIECEDATA803(uint _id) public view returns(string memory name, string memory artist, string memory thumbnailUrl, string memory grade, uint64 price) {	//inject NONSTANDARD NAMING
        return (
            artpieces[_id].name, 
            artpieces[_id].artist, 
            artpieces[_id].thumbnailUrl, 
            artpieces[_id].grade,
            artpieces[_id].price 
        );
    }
    
    function GETARTPIECEFEELEVELS315(uint _id) public view returns(uint8, uint8) {	//inject NONSTANDARD NAMING
        return (
            artpieces[_id].feeLevel,
            artpieces[_id].baeFeeLevel
        );
    }
    
    function GETARTPIECEMETA444(uint _id) public view returns(uint8, uint64, uint256, string memory, bool, bool) {	//inject NONSTANDARD NAMING
        return (
            artpieces[_id].metadata.remainingPrintings, 
            artpieces[_id].metadata.basePrice, 
            artpieces[_id].metadata.dateCreatedByTheArtist, 
            artpieces[_id].metadata.notes, 
            artpieces[_id].metadata.isFirstSale, 
            artpieces[_id].metadata.physical
        );
    }
    
    function GETMAINURL821(uint _id) public view ONLYOWNEROF549(_id) returns(string memory) {	//inject NONSTANDARD NAMING
        return artpieces[_id].mainUrl;
    }

    function SETARTPIECENAME979(uint _id, string memory _name) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        artpieces[_id].name = _name;
    }

    function SETARTIST441(uint _id, string memory _artist) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        artpieces[_id].artist = _artist;
    }

    function SETTHUMBNAILURL800(uint _id, string memory _newThumbnailUrl) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        artpieces[_id].thumbnailUrl = _newThumbnailUrl;
    }

    // this used to be internal
    function SETMAINURL780(uint _id, string memory _newUrl) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        artpieces[_id].mainUrl = _newUrl;
        emit URLCHANGE633(_id);
    }

    function SETGRADE74(uint _id, string memory _grade) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 returns (bool success) {	//inject NONSTANDARD NAMING
        artpieces[_id].grade = _grade;
        return true;
    }

    function SETPRICE986(uint _id, uint64 _price) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        artpieces[_id].price = _price;
    }

    function SETARTPIECEBAEFEE56(uint _id, uint8 _newFee) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        artpieces[_id].baeFeeLevel = _newFee;
    }

    function SETARTPIECEROYALTYFEELEVEL914(uint _id, uint8 _newFee) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        artpieces[_id].feeLevel = _newFee;
    }

    function SETREMAININGPRINTINGS14(uint _id, uint8 _remainingPrintings) internal ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        artpieces[_id].metadata.remainingPrintings = _remainingPrintings;
    }
    
    function SETBASEPRICE911(uint _id, uint64 _basePrice) public ONLYCLEVELOROWNER482 {	//inject NONSTANDARD NAMING
        artpieces[_id].metadata.basePrice = _basePrice;
    }

    function SETDATECREATEBYARTIST835(uint _id, uint256 _dateCreatedByTheArtist) public ONLYCLEVELOROWNER482 {	//inject NONSTANDARD NAMING
        artpieces[_id].metadata.dateCreatedByTheArtist = _dateCreatedByTheArtist;
    }

    function SETNOTES965(uint _id, string memory _notes) public ONLYCLEVELOROWNER482 {	//inject NONSTANDARD NAMING
        artpieces[_id].metadata.notes = _notes;
    }

    function SETISPHYSICAL437(uint _id, bool _physical) public ONLYCLEVELOROWNER482 {	//inject NONSTANDARD NAMING
        artpieces[_id].metadata.physical = _physical;
    }
    
    function GETARTPIECESBYOWNER52(address _owner) external view returns(uint[] memory) {	//inject NONSTANDARD NAMING
        uint[] memory result = new uint[](artCollection[_owner]);
        uint counter = 0;

        for ( uint i = 0; i < artpieces.length; i++ ) {
            if (numArtInAddress[i] == _owner) {
                result[counter] = i;
                counter = counter.ADD801(1);
            }
        }

        return result;
    }
}

contract BAEToken is PausableToken, AccessControl  {
    using SafeMath for uint256;
    using SafeERC20 for ERC20;

    event MINT581(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event MINTFINISHED193();	//inject NONSTANDARD NAMING
    event BURN963(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING
   
    string public constant name399 = "BAEToken";	//inject NONSTANDARD NAMING
    string public constant symbol989 = "BAE";	//inject NONSTANDARD NAMING
    uint public constant decimals247 = 6;	//inject NONSTANDARD NAMING
    uint public currentAmount = 0; // rate is 11 == 10 BAE based on 100 000 000 = 10,000,000
    uint public totalAllocated = 0;
    bool public mintingFinished = false;
    uint256 public currentIndex = 0;

                                       
    mapping(uint => address) public holderAddresses;

                                                         
    constructor() public {
        totalSupply_ = 0;
    }

    modifier VALIDDESTINATION435(address _to)	//inject NONSTANDARD NAMING
    {
        require(_to != address(0x0));
        require(_to != address(this)); 
        _;
    }

    modifier CANMINT871() {	//inject NONSTANDARD NAMING
        require(
            !mintingFinished,
            "Still minting."
        );
        _;
    }

    modifier HASMINTPERMISSION40() {	//inject NONSTANDARD NAMING
        require(
            msg.sender == owner,
            "Message sender is not owner."
        );
        _;
    }

    modifier ONLYWHENNOTMINTING535() {	//inject NONSTANDARD NAMING
        require(
            mintingFinished == false,
            "Minting needs to be stopped to execute this function"
        );
        _;
    }

                                            
    function GETNAME729() public pure returns (string memory) {	//inject NONSTANDARD NAMING
        return name399;
    }

                                                    
    function GETSYMBOL910() public pure returns (string memory) {	//inject NONSTANDARD NAMING
        return symbol989;
    }

                                                    
    function GETTOTALSUPPLY179() public view returns (uint) {	//inject NONSTANDARD NAMING
        return totalSupply_;
    }

                                                   
    function GETBALANCE842() public view returns (uint) {	//inject NONSTANDARD NAMING
        return balances[msg.sender];
    }

                                                                     
    function GETUSERBALANCE866(address _userAddress) public view ONLYCLEVELOROWNER482 returns(uint) {	//inject NONSTANDARD NAMING
        return balances[_userAddress];
    }
    
                                     
    function BURN543(address _who, uint256 _value) public ONLYCEO388 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        require(
            _value <= balances[_who],
            "Value is smaller than the value the account in balances has"
        );
        // no need to require value <= totalSupply, since that would imply the
        // sender's balance is greater than the totalSupply, which *should* be an assertion failure

        // BAEholders[_who] = BAEholders[_who].sub(_value);
        totalSupply_ = totalSupply_.SUB956(_value);
        totalAllocated = totalAllocated.SUB956(_value);
        balances[_who] = balances[_who].SUB956(_value);
        emit BURN963(_who, _value);
        emit TRANSFER592(_who, address(0), _value);
    }

                                                                                                                                                                                                                                              
    function MINT904(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _amount
    )
    public
    CANMINT871
    ONLYCLEVELOROWNER482
    WHENNOTPAUSED32
    returns (bool) {
        totalSupply_ = totalSupply_.ADD801(_amount);
        totalAllocated = totalAllocated.ADD801(_amount);
        balances[_to] = balances[_to].ADD801(_amount);
        emit MINT581(_to, _amount);
        emit TRANSFER592(address(0), _to, _amount);
        return true;
    }

                                                                                                                  
    function FINISHMINTING779() 	//inject NONSTANDARD NAMING
    public 
    ONLYCEO388
    CANMINT871
    WHENNOTPAUSED32
    returns (bool) {
        mintingFinished = true;
        emit MINTFINISHED193();
        return true;
    }


                                                                                                                                                                                                                                   

                                                                                                 
                                                                                
    function TRANSFER935(address _to, uint256 _value) public ONLYCLEVELOROWNER482 returns (bool) {	//inject NONSTANDARD NAMING
                                                       
        super.TRANSFER935(_to, _value);
        
                                     
        totalAllocated = totalAllocated.ADD801(_value);
        balances[msg.sender] = balances[msg.sender].SUB956(_value);
        balances[_to] = balances[_to].ADD801(_value);
        holderAddresses[currentIndex] = _to;
        currentIndex = currentIndex.ADD801(1);
        return true;
    }

    function TRANSFERFROM490(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value
    )
    public
    ONLYCLEVELOROWNER482
    returns (bool) {
        super.TRANSFERFROM490(_from, _to, _value);
        totalAllocated = totalAllocated.ADD801(_value);
        balances[_from] = balances[_from].SUB956(_value);
        balances[_to] = balances[_to].ADD801(_value);
        holderAddresses[currentIndex] = _to;
        currentIndex = currentIndex.ADD801(1);
        return true;
    }


    function APPROVE366(address _spender, uint256 _value) public ONLYCLEVELOROWNER482 returns (bool) {	//inject NONSTANDARD NAMING
        super.APPROVE366(_spender, _value);
    }
    

}

contract Payments is BAEToken {
    
    event POTPAYOUT352(address indexed _to, uint256 indexed value);	//inject NONSTANDARD NAMING

    BAECore public baeInstance;
    
    constructor() public {
        ceoAddress = msg.sender;
    }

    function SETBAECOREADDRESS787(address payable _address) public ONLYCEO388 WHENPAUSED938 {	//inject NONSTANDARD NAMING
        BAECore baeCandidate = BAECore(_address);
        baeInstance = baeCandidate;
    }
    
                                               
    function ADDTOBAEHOLDERS881(address _to) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        MINT904(_to, currentAmount);
    }
    
    function SUBTOBAEHOLDERS716(address _from, address _to, uint _amount) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        TRANSFERFROM490(_from, _to, _amount);
    }
    
    function SETFINALPRICEINPOUNDS109(uint _finalPrice) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        currentAmount = _finalPrice.MUL86(10000000);
    }
    
    function WITHDRAW765() public ONLYCFO124 {	//inject NONSTANDARD NAMING
        cfoAddress.transfer(address(this).balance);
    }
    
    function() external payable { }
}

interface IERC165 {

                                                                                                                                                                                                                                                   
  function SUPPORTSINTERFACE549(bytes4 interfaceId)	//inject NONSTANDARD NAMING
    external
    view
    returns (bool);
}

contract IERC721 is IERC165 {

  event TRANSFER592(	//inject NONSTANDARD NAMING
    address indexed from,
    address indexed to,
    uint256 indexed tokenId
  );
  event APPROVAL570(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed approved,
    uint256 indexed tokenId
  );
  event APPROVALFORALL717(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed operator,
    bool approved
  );

  function BALANCEOF453(address owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING
  function OWNEROF114(uint256 tokenId) public view returns (address owner);	//inject NONSTANDARD NAMING

  function APPROVE366(address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
  function GETAPPROVED182(uint256 tokenId)	//inject NONSTANDARD NAMING
    public view returns (address operator);

  function SETAPPROVALFORALL726(address operator, bool _approved) public;	//inject NONSTANDARD NAMING
  function ISAPPROVEDFORALL40(address owner, address operator)	//inject NONSTANDARD NAMING
    public view returns (bool);

  function TRANSFERFROM490(address from, address to, uint256 tokenId) public;	//inject NONSTANDARD NAMING
  function SAFETRANSFERFROM520(address from, address to, uint256 tokenId)	//inject NONSTANDARD NAMING
    public;

  function SAFETRANSFERFROM520(	//inject NONSTANDARD NAMING
    address from,
    address to,
    uint256 tokenId,
    bytes memory data
  )
    public;
}

contract IERC721Metadata is IERC721 {
  function NAME555() external view returns (string memory);	//inject NONSTANDARD NAMING
  function SYMBOL402() external view returns (string memory);	//inject NONSTANDARD NAMING
  function TOKENURI227(uint256 tokenId) public view returns (string memory);	//inject NONSTANDARD NAMING
}

contract IERC721Enumerable is IERC721 {
  function TOTALSUPPLY665() public view returns (uint256);	//inject NONSTANDARD NAMING
  function TOKENOFOWNERBYINDEX617(	//inject NONSTANDARD NAMING
    address owner,
    uint256 index
  )
    public
    view
    returns (uint256 tokenId);

  function TOKENBYINDEX989(uint256 index) public view returns (uint256);	//inject NONSTANDARD NAMING
}

contract IERC721Receiver {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
  function ONERC721RECEIVED619(	//inject NONSTANDARD NAMING
    address operator,
    address from,
    uint256 tokenId,
    bytes memory data
  )
    public
    returns(bytes4);
}

contract IERC721Full is IERC721, IERC721Enumerable, IERC721Metadata {
}

contract ERC165 is IERC165 {

  bytes4 private constant _interfaceid_erc165111 = 0x01ffc9a7;	//inject NONSTANDARD NAMING
                                                                                  

                                                                              
  mapping(bytes4 => bool) internal _supportedInterfaces;

                                                                                                   
  constructor()
    public
  {
    _REGISTERINTERFACE51(_interfaceid_erc165111);
  }

                                                                            
  function SUPPORTSINTERFACE549(bytes4 interfaceId)	//inject NONSTANDARD NAMING
    external
    view
    returns (bool)
  {
    return _supportedInterfaces[interfaceId];
  }

                                                               
  function _REGISTERINTERFACE51(bytes4 interfaceId)	//inject NONSTANDARD NAMING
    internal
  {
    require(interfaceId != 0xffffffff);
    _supportedInterfaces[interfaceId] = true;
  }
}

contract ERC721 is ERC165, IERC721 {
  using SafeMath for uint256;
  using Address for address;

  // Equals to `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
  // which can be also obtained as `IERC721Receiver(0).onERC721Received.selector`
  bytes4 private constant _erc721_received755 = 0x150b7a02;	//inject NONSTANDARD NAMING

  // Mapping from token ID to owner
  mapping (uint256 => address) private _tokenOwner;

  // Mapping from token ID to approved address
  mapping (uint256 => address) private _tokenApprovals;

  // Mapping from owner to number of owned token
  mapping (address => uint256) private _ownedTokensCount;

  // Mapping from owner to operator approvals
  mapping (address => mapping (address => bool)) private _operatorApprovals;

  bytes4 private constant _interfaceid_erc721258 = 0x80ac58cd;	//inject NONSTANDARD NAMING
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

  constructor()
    public
  {
    // register the supported interfaces to conform to ERC721 via ERC165
    _REGISTERINTERFACE51(_interfaceid_erc721258);
  }

                                                                                                                                                                                      
  function BALANCEOF453(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
    require(owner != address(0));
    return _ownedTokensCount[owner];
  }

                                                                                                                                                                                                           
  function OWNEROF114(uint256 tokenId) public view returns (address) {	//inject NONSTANDARD NAMING
    address owner = _tokenOwner[tokenId];
    require(owner != address(0));
    return owner;
  }

                                                                                                                                                                                                                                                                                                                                                                                                       
  function APPROVE366(address to, uint256 tokenId) public {	//inject NONSTANDARD NAMING
    address owner = OWNEROF114(tokenId);
    require(to != owner);
    require(msg.sender == owner || ISAPPROVEDFORALL40(owner, msg.sender));

    _tokenApprovals[tokenId] = to;
    emit APPROVAL570(owner, to, tokenId);
  }

                                                                                                                                                                                                                                                                     
  function GETAPPROVED182(uint256 tokenId) public view returns (address) {	//inject NONSTANDARD NAMING
    require(_EXISTS748(tokenId));
    return _tokenApprovals[tokenId];
  }

                                                                                                                                                                                                                                                                            
  function SETAPPROVALFORALL726(address to, bool approved) public {	//inject NONSTANDARD NAMING
    require(to != msg.sender);
    _operatorApprovals[msg.sender][to] = approved;
    emit APPROVALFORALL717(msg.sender, to, approved);
  }

                                                                                                                                                                                                                                                                                                         
  function ISAPPROVEDFORALL40(	//inject NONSTANDARD NAMING
    address owner,
    address operator
  )
    public
    view
    returns (bool)
  {
    return _operatorApprovals[owner][operator];
  }

                                                                                                                                                                                                                                                                                                                                                                                                                    
  function TRANSFERFROM490(	//inject NONSTANDARD NAMING
    address from,
    address to,
    uint256 tokenId
  )
    public
  {
    require(_ISAPPROVEDOROWNER408(msg.sender, tokenId));
    require(to != address(0));

    _CLEARAPPROVAL320(from, tokenId);
    _REMOVETOKENFROM296(from, tokenId);
    _ADDTOKENTO792(to, tokenId);

    emit TRANSFER592(from, to, tokenId);
  }


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  function SAFETRANSFERFROM520(	//inject NONSTANDARD NAMING
    address from,
    address to,
    uint256 tokenId
  )
    public
  {
    // solium-disable-next-line arg-overflow
    SAFETRANSFERFROM520(from, to, tokenId, "");
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  function SAFETRANSFERFROM520(	//inject NONSTANDARD NAMING
    address from,
    address to,
    uint256 tokenId,
    bytes memory _data
  )
    public
  {
    TRANSFERFROM490(from, to, tokenId);
    // solium-disable-next-line arg-overflow
    require(_CHECKANDCALLSAFETRANSFER207(from, to, tokenId, _data));
  }

                                                                                                                                                                        
  function _EXISTS748(uint256 tokenId) internal view returns (bool) {	//inject NONSTANDARD NAMING
    address owner = _tokenOwner[tokenId];
    return owner != address(0);
  }

                                                                                                                                                                                                                                                                                                                                              
  function _ISAPPROVEDOROWNER408(	//inject NONSTANDARD NAMING
    address spender,
    uint256 tokenId
  )
    internal
    view
    returns (bool)
  {
    address owner = OWNEROF114(tokenId);
    // Disable solium check because of
    // https://github.com/duaraghav8/Solium/issues/175
    // solium-disable-next-line operator-whitespace
    return (
      spender == owner ||
      GETAPPROVED182(tokenId) == spender ||
      ISAPPROVEDFORALL40(owner, spender)
    );
  }

                                                                                                                                                                                                                                             
  function _MINT585(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
    require(to != address(0));
    _ADDTOKENTO792(to, tokenId);
    emit TRANSFER592(address(0), to, tokenId);
  }

                                                                                                                                                                                
  function _BURN604(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
    _CLEARAPPROVAL320(owner, tokenId);
    _REMOVETOKENFROM296(owner, tokenId);
    emit TRANSFER592(owner, address(0), tokenId);
  }

                                                                                                                                                                                                                                                          
  function _CLEARAPPROVAL320(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
    require(OWNEROF114(tokenId) == owner);
    if (_tokenApprovals[tokenId] != address(0)) {
      _tokenApprovals[tokenId] = address(0);
    }
  }

                                                                                                                                                                                                                                                            
  function _ADDTOKENTO792(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
    require(_tokenOwner[tokenId] == address(0));
    _tokenOwner[tokenId] = to;
    _ownedTokensCount[to] = _ownedTokensCount[to].ADD801(1);
  }

                                                                                                                                                                                                                                                                            
  function _REMOVETOKENFROM296(address from, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
    require(OWNEROF114(tokenId) == from);
    _ownedTokensCount[from] = _ownedTokensCount[from].SUB956(1);
    _tokenOwner[tokenId] = address(0);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  function _CHECKANDCALLSAFETRANSFER207(	//inject NONSTANDARD NAMING
    address from,
    address to,
    uint256 tokenId,
    bytes memory _data
  )
    internal
    returns (bool)
  {
    if (!to.ISCONTRACT665()) {
      return true;
    }
    bytes4 retval = IERC721Receiver(to).ONERC721RECEIVED619(
      msg.sender, from, tokenId, _data);
    return (retval == _erc721_received755);
  }
}

contract ERC721Metadata is ERC165, ERC721, IERC721Metadata {
  // Token name
  string internal _name;

  // Token symbol
  string internal _symbol;

  // Optional mapping for token URIs
  mapping(uint256 => string) private _tokenURIs;

  bytes4 private constant interfaceid_erc721metadata752 = 0x5b5e139f;	//inject NONSTANDARD NAMING
                                                                                                                                                    

                                        
  constructor(string memory name, string memory symbol) public {
    _name = name;
    _symbol = symbol;

    // register the supported interfaces to conform to ERC721 via ERC165
    _REGISTERINTERFACE51(interfaceid_erc721metadata752);
  }

                                                                                      
  function NAME555() external view returns (string memory) {	//inject NONSTANDARD NAMING
    return _name;
  }

                                                                                          
  function SYMBOL402() external view returns (string memory) {	//inject NONSTANDARD NAMING
    return _symbol;
  }

                                                                                                                                                                                  
  function TOKENURI227(uint256 tokenId) public view returns (string memory) {	//inject NONSTANDARD NAMING
    require(_EXISTS748(tokenId));
    return _tokenURIs[tokenId];
  }

                                                                                                                                                                                                                     
  function _SETTOKENURI529(uint256 tokenId, string memory uri) internal {	//inject NONSTANDARD NAMING
    require(_EXISTS748(tokenId));
    _tokenURIs[tokenId] = uri;
  }

                                                                                                                                                                                                                            
  function _BURN604(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
    super._BURN604(owner, tokenId);

    // Clear metadata (if any)
    if (bytes(_tokenURIs[tokenId]).length != 0) {
      delete _tokenURIs[tokenId];
    }
  }
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

  bytes4 private constant _interfaceid_erc721enumerable533 = 0x780e9d63;	//inject NONSTANDARD NAMING
                                                                                                                                                                                           

                                        
  constructor() public {
    // register the supported interface to conform to ERC721 via ERC165
    _REGISTERINTERFACE51(_interfaceid_erc721enumerable533);
  }

                                                                                                                                                                                                                                                                                                                                                             
  function TOKENOFOWNERBYINDEX617(	//inject NONSTANDARD NAMING
    address owner,
    uint256 index
  )
    public
    view
    returns (uint256)
  {
    require(index < BALANCEOF453(owner));
    return _ownedTokens[owner][index];
  }

                                                                                                                                      
  function TOTALSUPPLY665() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return _allTokens.length;
  }

                                                                                                                                                                                                                                                                                                                         
  function TOKENBYINDEX989(uint256 index) public view returns (uint256) {	//inject NONSTANDARD NAMING
    require(index < TOTALSUPPLY665());
    return _allTokens[index];
  }

                                                                                                                                                                                                                                                            
  function _ADDTOKENTO792(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
    super._ADDTOKENTO792(to, tokenId);
    uint256 length = _ownedTokens[to].length;
    _ownedTokens[to].push(tokenId);
    _ownedTokensIndex[tokenId] = length;
  }

                                                                                                                                                                                                                                                                            
  function _REMOVETOKENFROM296(address from, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
    super._REMOVETOKENFROM296(from, tokenId);

    // To prevent a gap in the array, we store the last token in the index of the token to delete, and
    // then delete the last slot.
    uint256 tokenIndex = _ownedTokensIndex[tokenId];
    uint256 lastTokenIndex = _ownedTokens[from].length.SUB956(1);
    uint256 lastToken = _ownedTokens[from][lastTokenIndex];

    _ownedTokens[from][tokenIndex] = lastToken;
    // This also deletes the contents at the last position of the array
    _ownedTokens[from].length--;

    // Note that this will handle single-element arrays. In that case, both tokenIndex and lastTokenIndex are going to
    // be zero. Then we can make sure that we will remove tokenId from the ownedTokens list since we are first swapping
    // the lastToken to the first position, and then dropping the element placed in the last position of the list

    _ownedTokensIndex[tokenId] = 0;
    _ownedTokensIndex[lastToken] = tokenIndex;
  }

                                                                                                                                                                                                                                                         
  function _MINT585(address to, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
    super._MINT585(to, tokenId);

    _allTokensIndex[tokenId] = _allTokens.length;
    _allTokens.push(tokenId);
  }

                                                                                                                                                                                                                            
  function _BURN604(address owner, uint256 tokenId) internal {	//inject NONSTANDARD NAMING
    super._BURN604(owner, tokenId);

    // Reorg all tokens array
    uint256 tokenIndex = _allTokensIndex[tokenId];
    uint256 lastTokenIndex = _allTokens.length.SUB956(1);
    uint256 lastToken = _allTokens[lastTokenIndex];

    _allTokens[tokenIndex] = lastToken;
    _allTokens[lastTokenIndex] = 0;

    _allTokens.length--;
    _allTokensIndex[tokenId] = 0;
    _allTokensIndex[lastToken] = tokenIndex;
  }
}

contract ERC721Full is ERC721, ERC721Enumerable, ERC721Metadata {
    constructor (string memory name, string memory symbol) public ERC721Metadata(name, symbol) {
        // solhint-disable-previous-line no-empty-blocks
    }
}

contract BAE is ERC721Full, Helpers {
    using SafeMath for uint256;

                                                  
    event SOLD117(uint indexed _tokenId, address _from, address _to, uint indexed _price);	//inject NONSTANDARD NAMING
    event DELETED265(uint indexed _tokenId, address _from);	//inject NONSTANDARD NAMING
    event PAYMENTSCONTRACTCHANGE733(address _prevAddress, address _futureAddress);	//inject NONSTANDARD NAMING
    event AUCTIONCONTRACTCHANGE940(address _prevAddress, address _futureAddress);	//inject NONSTANDARD NAMING

    Payments public tokenInterface;
    mapping (uint => address) artTransApprovals;

   constructor() ERC721Full("BlockchainArtExchange", "BAE") public {}
    
                                             
    function SETPAYMENTADDRESS150(address payable _newAddress) public ONLYCEO388 WHENPAUSED938 {	//inject NONSTANDARD NAMING
        Payments tokenInterfaceCandidate = Payments(_newAddress);
        tokenInterface = tokenInterfaceCandidate;
    }

  function CREATEARTPIECE364(	//inject NONSTANDARD NAMING
        string memory _name,
        string memory _artist,
        string memory _thumbnailUrl,
        string memory _mainUrl,
        string memory _notes,
        string memory _grade,
        uint256 _dateCreatedByTheArtist,
        uint64 _price,
        uint64 _basePrice,
        uint8 _remainingPrintings,
        bool _physical
    ) 
      public 
    {
        super._CREATEARTPIECE573(_name, _artist, _thumbnailUrl, _mainUrl, _notes, _grade, _dateCreatedByTheArtist, _price, _basePrice, _remainingPrintings, _physical);
        
        _MINT585(msg.sender, artpieces.length - 1);
    }
  
    function CALCULATEFEES740(uint _tokenId) public payable WHENNOTPAUSED32 returns (uint baeFee, uint royaltyFee, uint potFee) {	//inject NONSTANDARD NAMING
                                                                                                         
        uint baeFeeAmount = (uint(artpieces[_tokenId].baeFeeLevel) * msg.value) / 100;
        uint artistFeeAmount = (uint(artpieces[_tokenId].feeLevel) * msg.value) / 100;

                                                         
        uint potFeeAmount = msg.value - (baeFeeAmount + artistFeeAmount);
        return (baeFeeAmount, artistFeeAmount, potFeeAmount);
    }

                                                                                                    
    function PAYFEES133(uint256 _baeFee, uint256 _royaltyFee, uint256 _potFee, address payable _seller) public payable WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        uint totalToPay = _baeFee + _royaltyFee + _potFee;
        require(
            msg.value >= totalToPay,
            "Value must be equal or greater than the cost of the fees"
        );

        BAEFeeAddress.transfer(msg.value.SUB956(_baeFee));
        _seller.transfer(msg.value.SUB956(_royaltyFee));

        // we send the value left of the message to the POT contract
        address(tokenInterface).transfer(msg.value);
    }
    
                                   
    function _POSTPURCHASE585(address _from, address _to, uint256 _tokenId) internal {	//inject NONSTANDARD NAMING
        artCollection[_to] = artCollection[_to].ADD801(1);
        artCollection[_from] = artCollection[_from].SUB956(1);
        numArtInAddress[_tokenId] = _to;

        if (artpieces[_tokenId].metadata.isFirstSale) {
            artpieces[_tokenId].feeLevel = uint8(96);
            artpieces[_tokenId].baeFeeLevel = uint8(3);
                                                                                         
        }
        
                                                                
        artpieces[_tokenId].metadata.isFirstSale = false;

        emit SOLD117(_tokenId, _from, _to, artpieces[_tokenId].price);
    }
    
    
                                                                
    function DELETEARTPIECE748(uint256 _tokenId) public ONLYCLEVELOROWNER482 WHENNOTPAUSED32 ONLYBEFOREFIRSTSALE731(_tokenId) returns (bool deleted) {	//inject NONSTANDARD NAMING
        address _from = numArtInAddress[_tokenId];
        delete numArtInAddress[_tokenId];
        artCollection[_from] = artCollection[_from].SUB956(1);
        _BURN604(_from, _tokenId);
        delete artpieces[_tokenId];
        emit DELETED265(_tokenId, _from);
        return true;
    }

                                                            
    function PAUSE325() public ONLYCEO388 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        super.PAUSE325();
    }
}

contract PerishableSimpleAuction is Destructible {
    using SafeMath for uint256;

    event AUCTIONCREATED406(uint id, address seller);	//inject NONSTANDARD NAMING
    event AUCTIONWON996(uint tokenId, address _who);	//inject NONSTANDARD NAMING
    event SELLERPAID700(bool success, uint amount);	//inject NONSTANDARD NAMING
    
    BAECore public baeInstance;
    bool private currentAuction;

    struct Auction {
        uint256 tokenId;
        uint256 startingPrice;
        uint256 finalPrice;
        address payable seller;
        uint8 paid;
    }

    // When someone wins add it to this mapping 
                                                         
    mapping (uint => address) public winners;

    // Map from token ID to their corresponding auction.
    mapping (uint256 => Auction) public tokenIdToAuction;
    mapping (uint256 => uint256) public tokendIdToAuctionId;

                          
    Auction[20] public auctions;

                          
    uint public idx = 0;

                                
    uint256 public baeAuctionFee = 0.01 ether;

    modifier ONLYAUCTIONOWNER233() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }
    
    modifier ONLYAUCTIONLORD504() {	//inject NONSTANDARD NAMING
        require(msg.sender == address(baeInstance));
        _;
    }
    
    constructor() public {
        paused = true;
        ceoAddress = msg.sender;
    }
    
    function SETISCURRENTAUCTION173(bool _current) external ONLYCEO388 {	//inject NONSTANDARD NAMING
        currentAuction = _current;
    }
    
                                                                        
                                                                       
    function SETBAEADDRESS987(address payable _newAddress) public ONLYAUCTIONOWNER233 WHENPAUSED938 {	//inject NONSTANDARD NAMING
        address currentInstance = address(baeInstance);
        BAECore candidate = BAECore(_newAddress);
        baeInstance = candidate;
        require(address(baeInstance) != address(0) && address(baeInstance) != currentInstance);
    }

    function CREATEAUCTION26(	//inject NONSTANDARD NAMING
        uint256 _tokenId,
        uint256 _startingPrice,
        uint256 _finalPrice,
        address payable _seller
    )
        external
        WHENNOTPAUSED32
        ONLYAUCTIONLORD504
    {
        if (tokendIdToAuctionId[_tokenId] != 0) {
            require(tokenIdToAuction[_tokenId].paid == 1);
        }
        require(idx <= 20);
        
        Auction memory newAuction = Auction(_tokenId, _startingPrice, _finalPrice, _seller, 0);
        auctions[idx] = newAuction;
        tokenIdToAuction[_tokenId] = newAuction; 
        tokendIdToAuctionId[_tokenId] = idx;
        idx = idx.ADD801(1);
        
        emit AUCTIONCREATED406(idx,  _seller);
    }

                                                                                                            
    function HASWON483(uint256 _auctionId, address _winner, uint256 _finalBidPrice) external WHENNOTPAUSED32 ONLYAUCTIONLORD504 {	//inject NONSTANDARD NAMING
        winners[auctions[_auctionId].tokenId] = _winner;
        auctions[_auctionId].finalPrice = _finalBidPrice;
        emit AUCTIONWON996(auctions[_auctionId].tokenId, _winner);
    }

    function WINNERCHECKWIREDETAILS813(uint _auctionId, address _sender) external view WHENNOTPAUSED32 returns(address payable, uint, uint) {	//inject NONSTANDARD NAMING
                                     
        uint finalPrice = auctions[_auctionId].finalPrice;
        uint tokenId = auctions[_auctionId].tokenId;
        address winnerAddress = winners[tokenId];
        address payable seller = auctions[_auctionId].seller;

                                                                      
        require(_sender == winnerAddress);
        return (seller, tokenId, finalPrice);
    }
    
    function SETPAID762(uint _auctionId) external WHENNOTPAUSED32 ONLYAUCTIONLORD504 {	//inject NONSTANDARD NAMING
        require(auctions[_auctionId].paid == 0);
        auctions[_auctionId].paid = 1;
        emit SELLERPAID700(true, auctions[_auctionId].finalPrice);
    }
    
                                                                                                       
    function GETAUCTIONWINNERADDRESS827(uint _auctionId) external view WHENNOTPAUSED32 returns(address)  {	//inject NONSTANDARD NAMING
        return winners[auctions[_auctionId].tokenId];
    }
    
    function GETFINALPRICE182(uint _auctionId) external view WHENNOTPAUSED32 returns(uint)  {	//inject NONSTANDARD NAMING
        return auctions[_auctionId].finalPrice;
    }

    function GETAUCTIONDETAILS140(uint _auctionId) external view WHENNOTPAUSED32 returns (uint, uint, uint, address, uint) {	//inject NONSTANDARD NAMING
        return (auctions[_auctionId].tokenId, auctions[_auctionId].startingPrice, auctions[_auctionId].finalPrice, auctions[_auctionId].seller, auctions[_auctionId].paid);
    }
    
    function GETCURRENTINDEX918() external view returns (uint) {	//inject NONSTANDARD NAMING
        uint val = idx - 1;
                
        if (val > 20) {
            return 0;
        }
        
        return val;
    }
    
    function GETTOKENIDTOAUCTIONID981(uint _tokenId) external view returns (uint) {	//inject NONSTANDARD NAMING
        return tokendIdToAuctionId[_tokenId];
    }
    
    function UNPAUSE672() public ONLYAUCTIONOWNER233 WHENPAUSED938 {	//inject NONSTANDARD NAMING
        require(address(baeInstance) != address(0));

        super.UNPAUSE672();
    }
    
    function () external payable {
        revert();
    }
}

contract BAECore is BAE {
      using SafeMath for uint256;
 
                                                                                                              
    PerishableSimpleAuction private instanceAuctionAddress;
    
    constructor() public {
        paused = true;
        ceoAddress = msg.sender;
    }

    function SETAUCTIONADDRESS224(address payable _newAddress) public ONLYCEO388 WHENPAUSED938 {	//inject NONSTANDARD NAMING
        PerishableSimpleAuction possibleAuctionInstance = PerishableSimpleAuction(_newAddress);
        instanceAuctionAddress = possibleAuctionInstance;
    }
    
                                                                                                    
    function CREATEAUCTION26(uint _tokenId, uint _startingPrice, uint _finalPrice) external WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        require(OWNEROF114( _tokenId) == msg.sender, "You can't transfer an artpiece which is not yours");
        require(_startingPrice >= artpieces[_tokenId].metadata.basePrice);
        instanceAuctionAddress.CREATEAUCTION26(_tokenId, _startingPrice,_finalPrice, msg.sender);
        
                                                        
        SETAPPROVALFORALL726(owner, true);
        SETAPPROVALFORALL726(ceoAddress, true);
        SETAPPROVALFORALL726(cfoAddress, true);
        SETAPPROVALFORALL726(cooAddress, true);
    }
    
    function GETAUCTIONDETAILS140(uint _auctionId) public view returns (uint) {	//inject NONSTANDARD NAMING
        (uint tokenId,,,,) = instanceAuctionAddress.GETAUCTIONDETAILS140(_auctionId);
        return tokenId;
    }
    
                                                                                  
    function SETWINNERANDPRICE679(uint256 _auctionId, address _winner, uint256 _finalPrice, uint256 _currentPrice) external ONLYCLEVELOROWNER482 WHENNOTPAUSED32 returns(bool hasWinnerInfo) 	//inject NONSTANDARD NAMING
    {   
        (uint tokenId,,,,) = instanceAuctionAddress.GETAUCTIONDETAILS140(_auctionId);
        require(_finalPrice >= uint256(artpieces[tokenId].metadata.basePrice));
        APPROVE366(_winner, tokenId);
        instanceAuctionAddress.HASWON483(_auctionId, _winner, _finalPrice);
        tokenInterface.SETFINALPRICEINPOUNDS109(_currentPrice);
        return true;
    }
    
    function CALCULATEFEES740(uint _tokenId, uint _fullAmount) internal view  WHENNOTPAUSED32 returns (uint baeFee, uint royaltyFee, uint potFee) {	//inject NONSTANDARD NAMING
                                                                                                         
        uint baeFeeAmount = (uint(artpieces[_tokenId].baeFeeLevel) * _fullAmount) / 100;
        uint artistFeeAmount = (uint(artpieces[_tokenId].feeLevel) * _fullAmount) / 100;

                                                         
        uint potFeeAmount = _fullAmount - (baeFeeAmount + artistFeeAmount);
        return (baeFeeAmount, artistFeeAmount, potFeeAmount);
    }

    function PAYANDWITHDRAW479(uint _auctionId) public payable {	//inject NONSTANDARD NAMING
        // calculate the share of each of the stakeholders 
        (address payable seller, uint tokenId, uint finalPrice) = instanceAuctionAddress.WINNERCHECKWIREDETAILS813(_auctionId, msg.sender);
        (uint baeFeeAmount, uint artistFeeAmount,) = CALCULATEFEES740(tokenId, finalPrice);
        
        // break msg.value it into the rightchunks
        require(msg.value >= finalPrice);
        uint baeFee = msg.value.SUB956(baeFeeAmount);
        uint artistFee = msg.value.SUB956(artistFeeAmount);
        
        // do the transfers
        BAEFeeAddress.transfer(msg.value.SUB956(baeFee));
        seller.transfer(msg.value.SUB956(artistFee));
        address(tokenInterface).transfer(address(this).balance);
        
        // and when the money is sent, we mark the auccion as completed
        instanceAuctionAddress.SETPAID762(_auctionId);
        
        // and since it's paid then initiate the transfer mechanism
        TRANSFERFROM490(seller, msg.sender, tokenId);
    }
    
    function GETWINNERADDRESS659(uint _auctionId) public view returns(address)  {	//inject NONSTANDARD NAMING
        return instanceAuctionAddress.GETAUCTIONWINNERADDRESS827(_auctionId);
    }
    
    function GETHIGHESTBID288(uint _auctionId) public view returns(uint)  {	//inject NONSTANDARD NAMING
        return instanceAuctionAddress.GETFINALPRICE182(_auctionId);
    }
    
    function GETLATESTAUCTIONINDEX288() public view returns(uint) {	//inject NONSTANDARD NAMING
        return instanceAuctionAddress.GETCURRENTINDEX918();
    }

    function TRANSFERFROM490(address _from, address _to, uint256 _tokenId) public WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        uint auctionId = instanceAuctionAddress.GETTOKENIDTOAUCTIONID981(_tokenId);
        (,,,,uint paid) = (instanceAuctionAddress.GETAUCTIONDETAILS140(auctionId));
        require(paid == 1);
        super.TRANSFERFROM490(_from, _to, _tokenId);
        _POSTPURCHASE585(_from, _to, _tokenId);
        
                                                                                          
        tokenInterface.ADDTOBAEHOLDERS881(_from);
    }
    
    function UNPAUSE672() public ONLYCEO388 WHENPAUSED938 {	//inject NONSTANDARD NAMING
        require(ceoAddress != address(0));
        require(address(instanceAuctionAddress) != address(0));
        require(address(tokenInterface) != address(0));
        require(address(BAEFeeAddress) != address(0));

        super.UNPAUSE672();
    }
    
                                                            
    function PAUSE325() public ONLYCEO388 WHENNOTPAUSED32 {	//inject NONSTANDARD NAMING
        super.PAUSE325();
    }
    
    function () external payable {}
}