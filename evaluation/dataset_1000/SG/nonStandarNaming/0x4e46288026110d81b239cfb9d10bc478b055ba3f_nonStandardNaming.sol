pragma solidity 0.5.4;

                                                                                        
interface IERC20 {
    function TRANSFER159(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE421(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM664(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY92() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF972(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE835(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER678(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL203(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED513(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED513(address(0), _owner);
    }

                                                        
    function OWNER596() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER522() {	//inject NONSTANDARD NAMING
        require(ISOWNER431());
        _;
    }

                                                                                 
    function ISOWNER431() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP640() public ONLYOWNER522 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED513(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP543(address newOwner) public ONLYOWNER522 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP413(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP413(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED513(_owner, newOwner);
        _owner = newOwner;
    }
}


                                                                                                                
contract Pausable is Ownable {
    event PAUSED7(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED469(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

                                                                               
    function PAUSED296() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED445() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED24() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE684() public ONLYOWNER522 WHENNOTPAUSED445 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED7(msg.sender);
    }

                                                                                   
    function UNPAUSE791() public ONLYOWNER522 WHENPAUSED24 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED469(msg.sender);
    }
}


                                                                                                   
library SafeMath {
                                                                                
    function MUL140(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV933(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB490(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD929(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD200(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


contract MPD is IERC20, Ownable, Pausable {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;

    string private _name = "MetexPalladium";
    string private _symbol = "MPD";
    uint256 private _decimals = 18;
    uint256 private _totalSupply;
    string public certificate;
    //uint256 private initialAmount = 10 * (10 ** _decimals);
    uint256 private initialAmount = 0;

    constructor(string memory certHash) public {
        certificate = certHash;
        MINT848(msg.sender, initialAmount);
    }

                                                     
    function NAME728() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL770() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS613() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _decimals;
    }

    function TOTALSUPPLY92() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF972(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE835(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER159(address to, uint256 value) public WHENNOTPAUSED445 returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER811(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE421(address spender, uint256 value) public WHENNOTPAUSED445 returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL203(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM664(address from, address to, uint256 value) public WHENNOTPAUSED445 returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB490(value);
        _TRANSFER811(from, to, value);
        emit APPROVAL203(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE88(address spender, uint256 addedValue) public WHENNOTPAUSED445 returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD929(addedValue);
        emit APPROVAL203(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE767(address spender, uint256 subtractedValue) public WHENNOTPAUSED445 returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB490(subtractedValue);
        emit APPROVAL203(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER811(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB490(value);
        _balances[to] = _balances[to].ADD929(value);
        emit TRANSFER678(from, to, value);
    }

    function MINT848(address to, uint256 value) public ONLYOWNER522 returns (bool) {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _totalSupply = _totalSupply.ADD929(value);
        _balances[to] = _balances[to].ADD929(value);
        emit TRANSFER678(address(0), to, value);
        return true;
    }

                                                                                                                    
    function BURN373(uint256 value) ONLYOWNER522 public {	//inject NONSTANDARD NAMING
        require(msg.sender != address(0));

        _totalSupply = _totalSupply.SUB490(value);
        _balances[msg.sender] = _balances[msg.sender].SUB490(value);
        emit TRANSFER678(msg.sender, address(0), value);
    }

                                                                                                     
    function SETCERTIFICATE293(string memory hash) public ONLYOWNER522 {	//inject NONSTANDARD NAMING
        certificate = hash;
    }
}