// solium-disable linebreak-style
pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER483(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE940(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM696(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY871() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF989(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE631(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER805(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL330(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
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

                                                     
    function NAME368() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL717() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS797() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

                                                                                                   
library SafeMath {
                                                                                  
    function MUL200(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV96(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB909(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD149(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD405(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY871() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF989(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE631(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER483(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER666(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE940(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE431(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM696(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER666(from, to, value);
        _APPROVE431(from, msg.sender, _allowed[from][msg.sender].SUB909(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE723(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE431(msg.sender, spender, _allowed[msg.sender][spender].ADD149(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE568(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE431(msg.sender, spender, _allowed[msg.sender][spender].SUB909(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER666(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB909(value);
        _balances[to] = _balances[to].ADD149(value);
        emit TRANSFER805(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT181(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD149(value);
        _balances[account] = _balances[account].ADD149(value);
        emit TRANSFER805(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN341(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB909(value);
        _balances[account] = _balances[account].SUB909(value);
        emit TRANSFER805(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE431(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL330(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM667(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN341(account, value);
        _APPROVE431(account, msg.sender, _allowed[account][msg.sender].SUB909(value));
    }
}

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD149(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS768(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE905(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS768(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS768(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED772(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED918(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER493(msg.sender);
    }

    modifier ONLYMINTER963() {	//inject NONSTANDARD NAMING
        require(ISMINTER212(msg.sender));
        _;
    }

    function ISMINTER212(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS768(account);
    }

    function ADDMINTER73(address account) public ONLYMINTER963 {	//inject NONSTANDARD NAMING
        _ADDMINTER493(account);
    }

    function RENOUNCEMINTER17() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER387(msg.sender);
    }

    function _ADDMINTER493(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD149(account);
        emit MINTERADDED772(account);
    }

    function _REMOVEMINTER387(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE905(account);
        emit MINTERREMOVED918(account);
    }
}

                                                           
contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                                                                                                                                
    function MINT182(address to, uint256 value) public ONLYMINTER963 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT181(to, value);
        return true;
    }
}

contract PauserRole {
    using Roles for Roles.Role;

    event PAUSERADDED772(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED745(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    constructor () internal {
        _ADDPAUSER378(msg.sender);
    }

    modifier ONLYPAUSER343() {	//inject NONSTANDARD NAMING
        require(ISPAUSER646(msg.sender));
        _;
    }

    function ISPAUSER646(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS768(account);
    }

    function ADDPAUSER707(address account) public ONLYPAUSER343 {	//inject NONSTANDARD NAMING
        _ADDPAUSER378(account);
    }

    function RENOUNCEPAUSER136() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER521(msg.sender);
    }

    function _ADDPAUSER378(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD149(account);
        emit PAUSERADDED772(account);
    }

    function _REMOVEPAUSER521(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE905(account);
        emit PAUSERREMOVED745(account);
    }
}

                                                                                                                
contract Pausable is PauserRole {
    event PAUSED313(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED219(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

                                                                               
    function PAUSED687() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED106() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED499() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE314() public ONLYPAUSER343 WHENNOTPAUSED106 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED313(msg.sender);
    }

                                                                                   
    function UNPAUSE637() public ONLYPAUSER343 WHENPAUSED499 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED219(msg.sender);
    }
}

                                                                                
contract ERC20Pausable is ERC20, Pausable {
    function TRANSFER483(address to, uint256 value) public WHENNOTPAUSED106 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER483(to, value);
    }

    function TRANSFERFROM696(address from, address to, uint256 value) public WHENNOTPAUSED106 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM696(from, to, value);
    }

    function APPROVE940(address spender, uint256 value) public WHENNOTPAUSED106 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE940(spender, value);
    }

    function INCREASEALLOWANCE723(address spender, uint addedValue) public WHENNOTPAUSED106 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE723(spender, addedValue);
    }

    function DECREASEALLOWANCE568(address spender, uint subtractedValue) public WHENNOTPAUSED106 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE568(spender, subtractedValue);
    }
}

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED625(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED625(address(0), _owner);
    }

                                                        
    function OWNER905() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER811() {	//inject NONSTANDARD NAMING
        require(ISOWNER876());
        _;
    }

                                                                                 
    function ISOWNER876() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP960() public ONLYOWNER811 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED625(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP938(address newOwner) public ONLYOWNER811 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP381(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP381(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED625(_owner, newOwner);
        _owner = newOwner;
    }
}

// NOTE replaced Mint -> Destroy, mint -> destroy

contract DestroyerRole {
    using Roles for Roles.Role;

    event DESTROYERADDED740(address indexed account);	//inject NONSTANDARD NAMING
    event DESTROYERREMOVED482(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private destroyers;

    constructor() internal {
        _ADDDESTROYER193(msg.sender);
    }

    modifier ONLYDESTROYER453() {	//inject NONSTANDARD NAMING
        require(ISDESTROYER86(msg.sender));
        _;
    }

    function ISDESTROYER86(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return destroyers.HAS768(account);
    }

    function ADDDESTROYER344(address account) public ONLYDESTROYER453 {	//inject NONSTANDARD NAMING
        _ADDDESTROYER193(account);
    }

    function RENOUNCEDESTROYER44() public {	//inject NONSTANDARD NAMING
        _REMOVEDESTROYER663(msg.sender);
    }

    function _ADDDESTROYER193(address account) internal {	//inject NONSTANDARD NAMING
        destroyers.ADD149(account);
        emit DESTROYERADDED740(account);
    }

    function _REMOVEDESTROYER663(address account) internal {	//inject NONSTANDARD NAMING
        destroyers.REMOVE905(account);
        emit DESTROYERREMOVED482(account);
    }
}

                                                                 
contract ERC20Destroyable is ERC20, DestroyerRole {
                                                                                                                                                                                                                                                     
    function DESTROY453(address from, uint256 value) public ONLYDESTROYER453 returns (bool) {	//inject NONSTANDARD NAMING
        _BURN341(from, value);
        return true;
    }
}

contract PrzToken is ERC20Detailed, ERC20Mintable, ERC20Destroyable, ERC20Pausable, Ownable {

    // Stores the address of the entry credit contract
    address private _entryCreditContract;

    // Stores the address of contract with burned tokens (basis for BME minting)
    address private _balanceSheetContract;

    // Stores the amount of addresses to mint for
    uint256 private _bmeClaimBatchSize;
    uint256 private _bmeMintBatchSize;

    // Stores phase state (default value for bool is false,
    // https://solidity.readthedocs.io/en/v0.5.3/control-structures.html#default-value)
    // Contract will be initialized in "initPhase", i.e. not in bmePhase
    bool private _isInBmePhase;

    modifier WHENNOTINBME281() {	//inject NONSTANDARD NAMING
        require(!_isInBmePhase, "Function may no longer be called once BME starts");
        _;
    }

    modifier WHENINBME43() {	//inject NONSTANDARD NAMING
        require(_isInBmePhase, "Function may only be called once BME starts");
        _;
    }

    event ENTRYCREDITCONTRACTCHANGED193(	//inject NONSTANDARD NAMING
        address indexed previousEntryCreditContract,
        address indexed newEntryCreditContract
    );

    event BALANCESHEETCONTRACTCHANGED941(	//inject NONSTANDARD NAMING
        address indexed previousBalanceSheetContract,
        address indexed newBalanceSheetContract
    );

    event BMEMINTBATCHSIZECHANGED826(	//inject NONSTANDARD NAMING
        uint256 indexed previousSize,
        uint256 indexed newSize
    );

    event BMECLAIMBATCHSIZECHANGED563(	//inject NONSTANDARD NAMING
        uint256 indexed previousSize,
        uint256 indexed newSize
    );

    event PHASECHANGEDTOBME794(address account);	//inject NONSTANDARD NAMING


                                                                               
    constructor (string memory name, string memory symbol, uint8 decimals)
        ERC20Detailed(name, symbol, decimals)
        ERC20Mintable()
        ERC20Destroyable()
        ERC20Pausable()
        Ownable()
        public
    {
        _isInBmePhase = false;
        PAUSE314();
        SETENTRYCREDITCONTRACT560(address(0));
        SETBALANCESHEETCONTRACT98(address(0));
        SETBMEMINTBATCHSIZE677(200);
        SETBMECLAIMBATCHSIZE308(200);
    }

    // Returns _entryCreditContract
    function ENTRYCREDITCONTRACT158() public view returns (address) {	//inject NONSTANDARD NAMING
        return _entryCreditContract;
    }

    // Set _entryCreditContract
    function SETENTRYCREDITCONTRACT560(address contractAddress) public ONLYOWNER811 {	//inject NONSTANDARD NAMING
        emit ENTRYCREDITCONTRACTCHANGED193(_entryCreditContract, contractAddress);
        _entryCreditContract = contractAddress;
    }

    // Returns _balanceSheetContract
    function BALANCESHEETCONTRACT265() public view returns (address) {	//inject NONSTANDARD NAMING
        return _balanceSheetContract;
    }

    // Set _balanceSheetContract
    function SETBALANCESHEETCONTRACT98(address contractAddress) public ONLYOWNER811 {	//inject NONSTANDARD NAMING
        emit BALANCESHEETCONTRACTCHANGED941(_balanceSheetContract, contractAddress);
        _balanceSheetContract = contractAddress;
    }

    // Returns _bmeMintBatchSize
    function BMEMINTBATCHSIZE88() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _bmeMintBatchSize;
    }

    // Set _bmeMintBatchSize
    function SETBMEMINTBATCHSIZE677(uint256 batchSize) public ONLYMINTER963 {	//inject NONSTANDARD NAMING
        emit BMEMINTBATCHSIZECHANGED826(_bmeMintBatchSize, batchSize);
        _bmeMintBatchSize = batchSize;
    }

    // Returns _bmeClaimBatchSize
    function BMECLAIMBATCHSIZE782() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _bmeClaimBatchSize;
    }

    // Set _bmeClaimBatchSize
    function SETBMECLAIMBATCHSIZE308(uint256 batchSize) public ONLYMINTER963 {	//inject NONSTANDARD NAMING
        emit BMECLAIMBATCHSIZECHANGED563(_bmeClaimBatchSize, batchSize);
        _bmeClaimBatchSize = batchSize;
    }

    // Overwrites ERC20._transfer.
    // If to = _entryCreditContract, sends tokens to the credit contract according to the
    // exchange rate in credit contract, destroys tokens locally
    function _TRANSFER666(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING

        if (to == _entryCreditContract) {

            _BURN341(from, value);
            IEntryCreditContract entryCreditContractInstance = IEntryCreditContract(to);
            require(entryCreditContractInstance.MINT182(from, value), "Failed to mint entry credits");

            IBalanceSheetContract balanceSheetContractInstance = IBalanceSheetContract(_balanceSheetContract);
            require(balanceSheetContractInstance.SETPEERZTOKENSUPPLY608(TOTALSUPPLY871()), "Failed to update token supply");

        } else {

            super._TRANSFER666(from, to, value);
        }
    }

    // Call ERC20._burn(from, value)
    function DESTROY453(address from, uint256 value)	//inject NONSTANDARD NAMING
        public WHENPAUSED499 WHENNOTINBME281
        returns (bool)
    {
        return super.DESTROY453(from, value);
    }

    // Run destroy for all entries
    function BATCHDESTROY752(address[] calldata from, uint256[] calldata values)	//inject NONSTANDARD NAMING
        external ONLYDESTROYER453 WHENPAUSED499 WHENNOTINBME281
        returns (bool)
    {
        uint fromLength = from.length;

        require(fromLength == values.length, "Input arrays must have the same length");

        for (uint256 i = 0; i < fromLength; i++) {
            _BURN341(from[i], values[i]);
        }

        return true;
    }

    // Call ERC20._mint(to, value)
    function MINT182(address to, uint256 value)	//inject NONSTANDARD NAMING
        public WHENPAUSED499 WHENNOTINBME281
        returns (bool)
    {
        return super.MINT182(to, value);
    }

    // Run mint for all entries
    function BATCHMINT850(address[] calldata to, uint256[] calldata values)	//inject NONSTANDARD NAMING
        external ONLYMINTER963 WHENPAUSED499 WHENNOTINBME281
        returns (bool)
    {
        _BATCHMINT628(to, values);

        return true;
    }

    // Uses the balance sheet in _balanceSheetContract as a basis for
    // batchMint call for _bmeMintBatchSize addresses
    function BMEMINT90()	//inject NONSTANDARD NAMING
        public ONLYMINTER963 WHENINBME43 WHENNOTPAUSED106
    {
        IBalanceSheetContract balanceSheetContractInstance = IBalanceSheetContract(_balanceSheetContract);
        (address[] memory receivers, uint256[] memory amounts) = balanceSheetContractInstance.POPMINTINGINFORMATION382(_bmeMintBatchSize);

        _BATCHMINT628(receivers, amounts);

        require(balanceSheetContractInstance.SETPEERZTOKENSUPPLY608(TOTALSUPPLY871()), "Failed to update token supply");
    }

    // Uses the balance sheet in _balanceSheetContract to create
    // tokens for all addresses in for, limits to _bmeMintBatchSize, emit Transfer
    function _CLAIMFOR628(address[] memory claimers)	//inject NONSTANDARD NAMING
        private
    {
        IBalanceSheetContract balanceSheetContractInstance = IBalanceSheetContract(_balanceSheetContract);
        uint256[] memory amounts = balanceSheetContractInstance.POPCLAIMINGINFORMATION536(claimers);

        _BATCHMINT628(claimers, amounts);

        require(balanceSheetContractInstance.SETPEERZTOKENSUPPLY608(TOTALSUPPLY871()), "Failed to update token supply");
    }

    function _BATCHMINT628(address[] memory to, uint256[] memory values)	//inject NONSTANDARD NAMING
        private
    {

        // length should not be computed at each iteration
        uint toLength = to.length;

        require(toLength == values.length, "Input arrays must have the same length");

        for (uint256 i = 0; i < toLength; i++) {
            _MINT181(to[i], values[i]);
        }
    }

    // Calls _claimFor with for = msg.sender
    function CLAIM491()	//inject NONSTANDARD NAMING
        public WHENINBME43 WHENNOTPAUSED106
    {
        address[] memory claimers = new address[](1);
        claimers[0] = msg.sender;
        _CLAIMFOR628(claimers);
    }

    // Calls _claimFor with for as provided
    function CLAIMFOR282(address[] calldata claimers)	//inject NONSTANDARD NAMING
        external WHENINBME43 WHENNOTPAUSED106
    {
        require(claimers.length <= _bmeClaimBatchSize, "Input array must be shorter than bme claim batch size.");
        _CLAIMFOR628(claimers);
    }

    // Change possible when in initPhase
    function CHANGEPHASETOBME805()	//inject NONSTANDARD NAMING
        public ONLYOWNER811 WHENNOTPAUSED106 WHENNOTINBME281
    {
        _isInBmePhase = true;
        emit PHASECHANGEDTOBME794(msg.sender);
    }
}

interface IEntryCreditContract {

    function MINT182(address receiver, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
}

// NOTE the following interface imposes the minimum technically feasible
// NOTE constraints on information that is to be exchanged between the
// NOTE Peerz token contract and the balance sheet contract

// NOTE in other words, in our opinion this interface is the one with the
// NOTE highest probability of allowing for an implementation of the required
// NOTE functionality in the balance sheet contract

// NOTE an alternative approach to having popMintingInformation return two
// NOTE arrays would be to have it return a single array that contains only
// NOTE the receiving addresses for minting and using popClaimingInformation
// NOTE to actually mint the tokens; this approach requires bmeMint to make
// NOTE two external calls instead of a single one; and it imposes more
// NOTE structure on the future implementation of the balance sheet contract
// NOTE since its side of the BME mint functionality would have to be
// NOTE implemented using two separate functions whereas it might also on its
// NOTE side be more efficient to use a single function

interface IBalanceSheetContract {

    function SETPEERZTOKENSUPPLY608(uint256 przTotalSupply) external returns (bool);	//inject NONSTANDARD NAMING

    // NOTE the returned arrays need to have exactly the same length
    function POPMINTINGINFORMATION382(uint256 bmeMintBatchSize) external returns (address[] memory, uint256[] memory);	//inject NONSTANDARD NAMING

    // NOTE the returned array needs to have exactly the same length as the claimers array
    function POPCLAIMINGINFORMATION536(address[] calldata claimers) external returns (uint256[] memory);	//inject NONSTANDARD NAMING
}