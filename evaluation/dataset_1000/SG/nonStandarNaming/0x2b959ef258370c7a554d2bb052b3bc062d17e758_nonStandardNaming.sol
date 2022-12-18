pragma solidity ^0.5.7;

                                                                                                    
library SafeMath {
                                                                            
    function ADD798(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        c = a + b;
        assert(c >= a);
        return c;
    }

                                                                                                                              
    function SUB257(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

                                                                                  
    function MUL182(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        c = a * b;
        assert(c / a == b);
        return c;
    }

                                                                                                                                  
    function DIV881(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b > 0);
        uint256 c = a / b;
        assert(a == b * c + a % b);
        return a / b;
    }

                                                                                                                                                    
    function MOD374(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


                                                                                   
interface IERC20{
    function NAME560() external view returns (string memory);	//inject NONSTANDARD NAMING
    function SYMBOL692() external view returns (string memory);	//inject NONSTANDARD NAMING
    function DECIMALS137() external view returns (uint256);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY446() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF366(address owner) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER648(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM882(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE404(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE472(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    event TRANSFER855(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL764(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                         
contract Ownable {
    address internal _owner;

    event OWNERSHIPTRANSFERRED671(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED671(address(0), _owner);
    }

                                                        
    function OWNER295() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER276() {	//inject NONSTANDARD NAMING
        require(msg.sender == _owner);
        _;
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP335(address newOwner) external ONLYOWNER276 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        _owner = newOwner;
        emit OWNERSHIPTRANSFERRED671(_owner, newOwner);
    }

                                                                                                                                                                                                                      
    function RESCUETOKENS159(address tokenAddr, address receiver, uint256 amount) external ONLYOWNER276 {	//inject NONSTANDARD NAMING
        IERC20 _token = IERC20(tokenAddr);
        require(receiver != address(0));
        uint256 balance = _token.BALANCEOF366(address(this));

        require(balance >= amount);
        assert(_token.TRANSFER648(receiver, amount));
    }

                                          
    function WITHDRAWETHER578(address payable to, uint256 amount) external ONLYOWNER276 {	//inject NONSTANDARD NAMING
        require(to != address(0));

        uint256 balance = address(this).balance;

        require(balance >= amount);
        to.transfer(amount);
    }
}

                                                                                                                
contract Pausable is Ownable {
    bool private _paused;

    event PAUSED673(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED768(address account);	//inject NONSTANDARD NAMING

    constructor () internal {
        _paused = false;
    }

                                                                                       
    function PAUSED191() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED177() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED700() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE955() external ONLYOWNER276 WHENNOTPAUSED177 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED673(msg.sender);
    }

                                                                                   
    function UNPAUSE52() external ONLYOWNER276 WHENPAUSED700 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED768(msg.sender);
    }
}

                                     
contract OWpay is Ownable, Pausable, IERC20 {
    using SafeMath for uint256;

    string private _name = "OWpay";
    string private _symbol = "OW";
    uint256 private _decimals = 18;                // 18 decimals
    uint256 private _cap = 1000000000 * 10 **_decimals;   // 1 billion cap
    uint256 private _totalSupply;

    mapping (address => bool) private _minter;
    event MINT908(address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event MINTERCHANGED991(address account, bool state);	//inject NONSTANDARD NAMING

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;

    event DONATE501(address indexed account, uint256 amount);	//inject NONSTANDARD NAMING

                                       
    constructor() public {
        _minter[msg.sender] = true;
    }

                                  
    function () external payable {
        emit DONATE501(msg.sender, msg.value);
    }


                                                     
    function NAME560() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL692() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS137() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _decimals;
    }

                                                             
    function CAP954() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }

                                                                
    function TOTALSUPPLY446() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF366(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE472(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                 
    function TRANSFER648(address to, uint256 value) public WHENNOTPAUSED177 returns (bool) {	//inject NONSTANDARD NAMING
        // Normal Transfer
        _TRANSFER259(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                           
    function APPROVE404(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE729(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                       
    function INCREASEALLOWANCE806(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE729(msg.sender, spender, _allowed[msg.sender][spender].ADD798(addedValue));
        return true;
    }

                                                                                                                                                                                                                                            
    function DECREASEALLOWANCE866(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE729(msg.sender, spender, _allowed[msg.sender][spender].SUB257(subtractedValue));
        return true;
    }
                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM882(address from, address to, uint256 value) public WHENNOTPAUSED177 returns (bool) {	//inject NONSTANDARD NAMING
        require(_allowed[from][msg.sender] >= value);
        _TRANSFER259(from, to, value);
        _APPROVE729(from, msg.sender, _allowed[from][msg.sender].SUB257(value));
        return true;
    }

                                                                                                                                                                                                                     
    function _TRANSFER259(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB257(value);
        _balances[to] = _balances[to].ADD798(value);
        emit TRANSFER855(from, to, value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE729(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0));
        require(spender != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL764(owner, spender, value);
    }


                                                                     
    modifier ONLYMINTER60() {	//inject NONSTANDARD NAMING
        require(_minter[msg.sender]);
        _;
    }

                                                                        
    function ISMINTER411(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minter[account];
    }

                                              
    function SETMINTERSTATE164(address account, bool state) external ONLYOWNER276 {	//inject NONSTANDARD NAMING
        _minter[account] = state;
        emit MINTERCHANGED991(account, state);
    }

                                                                                                                                                                                                                                                
    function MINT705(address to, uint256 value) public ONLYMINTER60 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT53(to, value);
        return true;
    }

                                                                                                                                                                                                                                          
    function _MINT53(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(_totalSupply.ADD798(value) <= _cap);
        require(account != address(0));

        _totalSupply = _totalSupply.ADD798(value);
        _balances[account] = _balances[account].ADD798(value);
        emit MINT908(account, value);
        emit TRANSFER855(address(0), account, value);
    }
}