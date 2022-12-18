pragma solidity 0.5.3;

library SafeMath {
                                                                                
    function MUL44(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV815(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB954(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD739(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD987(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED866(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED866(address(0), _owner);
    }

                                                        
    function OWNER671() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER42() {	//inject NONSTANDARD NAMING
        require(ISOWNER704());
        _;
    }

                                                                                 
    function ISOWNER704() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP750() public ONLYOWNER42 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED866(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP627(address newOwner) public ONLYOWNER42 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP752(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP752(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED866(_owner, newOwner);
        _owner = newOwner;
    }
}

interface IERC20 {
    function TRANSFER872(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE959(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM944(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY857() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF548(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE551(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER726(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL45(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                             
    function TOTALSUPPLY857() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF548(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE551(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER872(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER48(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE959(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL45(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM944(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB954(value);
        _TRANSFER48(from, to, value);
        emit APPROVAL45(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE917(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD739(addedValue);
        emit APPROVAL45(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE743(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB954(subtractedValue);
        emit APPROVAL45(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER48(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB954(value);
        _balances[to] = _balances[to].ADD739(value);
        emit TRANSFER726(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT766(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD739(value);
        _balances[account] = _balances[account].ADD739(value);
        emit TRANSFER726(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN666(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB954(value);
        _balances[account] = _balances[account].SUB954(value);
        emit TRANSFER726(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM616(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _allowed[account][msg.sender] = _allowed[account][msg.sender].SUB954(value);
        _BURN666(account, value);
        emit APPROVAL45(account, msg.sender, _allowed[account][msg.sender]);
    }
}

contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                     
    function NAME491() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL997() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS60() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

contract Documentable is Ownable {
  address private _provenanceDocuments;
  bytes32 public assetHash;

  constructor (address documentsContract) public Ownable() {
    _provenanceDocuments = documentsContract;
  }

  function GETPROVENANCEDOCUMENTS517() public view returns(address) {	//inject NONSTANDARD NAMING
    return _provenanceDocuments;
  }

  function SETASSETHASH56(bytes32 _newHash) public ONLYOWNER42 {	//inject NONSTANDARD NAMING
    require(assetHash == 0x0, "Asset Hash can only be set once");
    assetHash = _newHash;
  }
}

contract Migratable is ERC20, Ownable{
  address private _new;
  mapping (address => bool) private _old;

  event NEWVERSIONCHANGES176(address old, address new_);	//inject NONSTANDARD NAMING
  
  event OLDVERSIONADDED60(address old);	//inject NONSTANDARD NAMING
  event OLDVERSIONREMOVED830(address old);	//inject NONSTANDARD NAMING
  
  event MIGRATED101(address account, uint256 balance);	//inject NONSTANDARD NAMING

  modifier ONLYOLDVERSION801(){	//inject NONSTANDARD NAMING
    require(msg.sender != address(0x0), "Invalid caller");
    require(_old[msg.sender], "Only callable by old version");
    _;
  }

  modifier ONLYIFNEWVERSIONISDEFINED693(){	//inject NONSTANDARD NAMING
    require(_new != address(0x0), "Unknow new version");
    _;
  }

  function APPENDOLDVERSION747(address old) public ONLYOWNER42{	//inject NONSTANDARD NAMING
    require(_old[old] == false, "Know old version");
    _old[old] = true;
    emit OLDVERSIONADDED60(old);
  }

  function APPENDOLDVERSIONS4(address[] memory olds) public{	//inject NONSTANDARD NAMING
    for (uint i = 0; i < olds.length; i++) {
      APPENDOLDVERSION747(olds[i]);
    }
  }

  function REMOVEOLDVERSION24(address old) public ONLYOWNER42{	//inject NONSTANDARD NAMING
    require(_old[old], "Unknow old version");
    _old[old] = false;
    emit OLDVERSIONREMOVED830(old);
  }

  function REMOVEOLDVERSIONS566(address[] memory olds) public{	//inject NONSTANDARD NAMING
    for (uint i = 0; i < olds.length; i++) {
      REMOVEOLDVERSION24(olds[i]);
    }
  }

  function SETNEWVERSION356(address new_) public ONLYOWNER42{	//inject NONSTANDARD NAMING
    emit NEWVERSIONCHANGES176(_new, new_);
    _new = new_;
  }

  function NEWVERSION666() public view returns(address){	//inject NONSTANDARD NAMING
    return _new;
  }

  function ISOLDVERSION565(address address_) public view returns(bool){	//inject NONSTANDARD NAMING
    return _old[address_];
  }

  function MIGRATE835() public ONLYIFNEWVERSIONISDEFINED693 {	//inject NONSTANDARD NAMING
    address account = msg.sender;
    uint256 balance = BALANCEOF548(account);
    require(balance > 0, "Current balance is zero");

    _BURN666(account, balance);
    Migratable(_new).MIGRATION364(account, balance);
    emit MIGRATED101(account, balance);
  }

  function MIGRATION364(address account, uint256 balance) public ONLYOLDVERSION801{	//inject NONSTANDARD NAMING
    _MINT766(account,balance);
    emit MIGRATED101(account, balance);
  }
}

contract Pausable is Ownable {
    event PAUSED506();	//inject NONSTANDARD NAMING
    event UNPAUSED161();	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () public {
        _paused = false;
    }

                                                                               
    function PAUSED33() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED852() {	//inject NONSTANDARD NAMING
        require(!_paused, "Paused");
        _;
    }

                                                                                                  
    modifier WHENPAUSED448() {	//inject NONSTANDARD NAMING
        require(_paused, "Unpaused");
        _;
    }

                                                                                
    function PAUSE902() public ONLYOWNER42 WHENNOTPAUSED852 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED506();
    }

                                                                                   
    function UNPAUSE900() public ONLYOWNER42 WHENPAUSED448 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED161();
    }
}

contract Policable is Ownable {
    ITransferPolicy public transferPolicy;
    event POLICYCHANGED834(address _oldPolicy, address _newPolicy);	//inject NONSTANDARD NAMING

    constructor(
        address policyContract
    ) public {
        transferPolicy = ITransferPolicy(policyContract);
    }


    modifier ONLYIFISTRANSFERPOSSIBLE501(address from, address to, uint256 value){	//inject NONSTANDARD NAMING
        require(transferPolicy.ISTRANSFERPOSSIBLE503(from, to, value), "Transfer is not possible");
        _;
    }

    modifier ONLYIFISBEHALFTRANSFERPOSSIBLE474(address sender, address from, address to, uint256 value){	//inject NONSTANDARD NAMING
        require(transferPolicy.ISBEHALFTRANSFERPOSSIBLE886(sender, from, to, value), "Transfer is not possible");
        _;
    }

    function SETTRANSFERPOLICY349(address _newPolicy) public ONLYOWNER42 {	//inject NONSTANDARD NAMING
        address old = address(transferPolicy);
        transferPolicy = ITransferPolicy(_newPolicy);
        emit POLICYCHANGED834(old, _newPolicy);
    }
}

contract Seizable is ERC20, Ownable {
    mapping(address => uint256) public seizedAmounts;
    event SEIZURE661(address indexed seized, uint256 amount);	//inject NONSTANDARD NAMING

    function SEIZE502(address _seized) public ONLYOWNER42 {	//inject NONSTANDARD NAMING
        uint256 _amount = BALANCEOF548(_seized);
        _BURN666(_seized, _amount);
        _MINT766(OWNER671(), _amount);
        emit SEIZURE661(_seized, _amount);
    }
}

contract Token is ERC20, ERC20Detailed {
    constructor(string memory name, string memory symbol, uint8 decimals, uint256 mint) ERC20Detailed(name,symbol,decimals) public {
        _MINT766(msg.sender, mint);
    }
}

contract ArtworkToken is Token, Policable, Seizable, Pausable, Documentable, Migratable{
    

    constructor (
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 amount,
        address policyContract,
        address documentsContract
    ) public 
        Token(name, symbol, decimals, amount)
        Policable(policyContract)
        Pausable()
        Documentable(documentsContract)
    { }

    function TRANSFER872(address to, uint256 value) public	//inject NONSTANDARD NAMING
        WHENNOTPAUSED852
        ONLYIFISTRANSFERPOSSIBLE501(msg.sender, to, value)
    returns (bool) {
        return super.TRANSFER872(to, value);
    }

    function TRANSFERFROM944(address from, address to, uint256 value)  public	//inject NONSTANDARD NAMING
        WHENNOTPAUSED852
        ONLYIFISBEHALFTRANSFERPOSSIBLE474(msg.sender, from, to, value)
    returns (bool) {
        return super.TRANSFERFROM944(from, to, value);
    }
}

interface ITransferPolicy {
    function ISTRANSFERPOSSIBLE503(address from, address to, uint256 amount) 	//inject NONSTANDARD NAMING
        external view returns (bool);
    
    function ISBEHALFTRANSFERPOSSIBLE886(address sender, address from, address to, uint256 amount) 	//inject NONSTANDARD NAMING
        external view returns (bool);
}