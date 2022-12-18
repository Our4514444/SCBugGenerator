                                                                 

                                                                 

                                                                                             

pragma solidity ^0.5.7;


                                                                                   
interface IERC20 {
    function TRANSFER160(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE561(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM782(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY723() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF919(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE626(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER525(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL460(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
    
    event FREEZE959(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
    
    event UNFREEZE0(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
}



                                                                                                    
library SafeMath {
                                                                                  
    function MUL660(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV215(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB193(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD250(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD600(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;
    
    mapping (address => uint256) private _freezeOf;
    
    uint256 private _totalSupply;

                                                                
    function TOTALSUPPLY723() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF919(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }
    
                                                                                                                                                                                                                    
    function FREEZEOF220(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _freezeOf[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE626(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                 
    function TRANSFER160(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER156(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE561(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE466(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM782(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER156(from, to, value);
        _APPROVE466(from, msg.sender, _allowed[from][msg.sender].SUB193(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE696(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE466(msg.sender, spender, _allowed[msg.sender][spender].ADD250(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE717(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE466(msg.sender, spender, _allowed[msg.sender][spender].SUB193(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                     
    function _TRANSFER156(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB193(value);
        _balances[to] = _balances[to].ADD250(value);
        emit TRANSFER525(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT48(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        _totalSupply = _totalSupply.ADD250(value);
        _balances[account] = _balances[account].ADD250(value);
        emit TRANSFER525(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN790(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        
        _totalSupply = _totalSupply.SUB193(value);
        _balances[account] = _balances[account].SUB193(value);
        emit TRANSFER525(account, address(0), value);
    }
    
    function _FREEZE549(uint256 value) internal {	//inject NONSTANDARD NAMING
        require(_balances[msg.sender]>=value); // Check if the sender has enough
        require(value > 0);
        _balances[msg.sender] = _balances[msg.sender].SUB193(value);
        _freezeOf[msg.sender] = _freezeOf[msg.sender].ADD250(value);
        emit FREEZE959(msg.sender, value);
    }
    
    function _UNFREEZE152(uint256 value) internal{	//inject NONSTANDARD NAMING
        require(_freezeOf[msg.sender]>=value); 
		require(value > 0);
        _freezeOf[msg.sender] = _freezeOf[msg.sender].SUB193(value); 
		_balances[msg.sender] = _balances[msg.sender].ADD250(value);
        emit UNFREEZE0(msg.sender, value);

    }
    
                                                                                                                                                                                                                                                                  
    function _APPROVE466(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL460(owner, spender, value);
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

                                                     
    function NAME650() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL34() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS175() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD250(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS235(role, account));

        role.bearer[account] = true;
    }

                                                                    
    function REMOVE569(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS235(role, account));

        role.bearer[account] = false;
    }

                                                                                  
    function HAS235(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}


contract PauserRole {
    using Roles for Roles.Role;

    event PAUSERADDED294(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED736(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    constructor () internal {
        _ADDPAUSER489(msg.sender);
    }

    modifier ONLYPAUSER1() {	//inject NONSTANDARD NAMING
        require(ISPAUSER644(msg.sender));
        _;
    }

    function ISPAUSER644(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS235(account);
    }

    function ADDPAUSER533(address account) public ONLYPAUSER1 {	//inject NONSTANDARD NAMING
        _ADDPAUSER489(account);
    }

    function RENOUNCEPAUSER641() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER8(msg.sender);
    }

    function _ADDPAUSER489(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD250(account);
        emit PAUSERADDED294(account);
    }

    function _REMOVEPAUSER8(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE569(account);
        emit PAUSERREMOVED736(account);
    }
}



                                                                                                                
contract Pausable is PauserRole {
    event PAUSED576(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED677(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

                                                                               
    function PAUSED469() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED180() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED976() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE440() public ONLYPAUSER1 WHENNOTPAUSED180 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED576(msg.sender);
    }

                                                                                   
    function UNPAUSE273() public ONLYPAUSER1 WHENPAUSED976 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED677(msg.sender);
    }
}

                                                                                                                
contract Lockable is PauserRole{
    

    mapping (address => bool) private lockers;
    

    event LOCKACCOUNT153(address account, bool islock);	//inject NONSTANDARD NAMING
    
    
                                                                                                           
    function ISLOCK330(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return lockers[account];
    }
    
                                                                                                                                                    
    function LOCK309(address account, bool islock)  public ONLYPAUSER1 {	//inject NONSTANDARD NAMING
        lockers[account] = islock;
        emit LOCKACCOUNT153(account, islock);
    }
    
}




                                                                                 
contract ERC20Pausable is ERC20, Pausable,Lockable {
    
    function TRANSFER160(address to, uint256 value) public WHENNOTPAUSED180 returns (bool) {	//inject NONSTANDARD NAMING
        require(!ISLOCK330(msg.sender));
        require(!ISLOCK330(to));
        return super.TRANSFER160(to, value);
    }

    function TRANSFERFROM782(address from, address to, uint256 value) public WHENNOTPAUSED180 returns (bool) {	//inject NONSTANDARD NAMING
        require(!ISLOCK330(msg.sender));
        require(!ISLOCK330(from));
        require(!ISLOCK330(to));
        return super.TRANSFERFROM782(from, to, value);
    }

    function APPROVE561(address spender, uint256 value) public WHENNOTPAUSED180 returns (bool) {	//inject NONSTANDARD NAMING
        require(!ISLOCK330(msg.sender));
        require(!ISLOCK330(spender));
        return super.APPROVE561(spender, value);
    }

    function INCREASEALLOWANCE696(address spender, uint addedValue) public WHENNOTPAUSED180 returns (bool) {	//inject NONSTANDARD NAMING
        require(!ISLOCK330(msg.sender));
        require(!ISLOCK330(spender));
        return super.INCREASEALLOWANCE696(spender, addedValue);
    }

    function DECREASEALLOWANCE717(address spender, uint subtractedValue) public WHENNOTPAUSED180 returns (bool) {	//inject NONSTANDARD NAMING
        require(!ISLOCK330(msg.sender));
        require(!ISLOCK330(spender));
        return super.DECREASEALLOWANCE717(spender, subtractedValue);
    }
}


contract STF is ERC20, ERC20Detailed, ERC20Pausable {
    
    constructor(string memory name, string memory symbol, uint8 decimals,uint256 _totalSupply) ERC20Pausable()  ERC20Detailed(name, symbol, decimals) ERC20() public {
        require(_totalSupply > 0);
        _MINT48(msg.sender, _totalSupply);
    }
    
                                                                                                                    
    function BURN7(uint256 value) public WHENNOTPAUSED180 {	//inject NONSTANDARD NAMING
        require(!ISLOCK330(msg.sender));
        _BURN790(msg.sender, value);
    }
    
                                                                                                                     
    function FREEZE668(uint256 value) public WHENNOTPAUSED180 {	//inject NONSTANDARD NAMING
        require(!ISLOCK330(msg.sender));
        _FREEZE549(value);
    }
    
                                                                                                                             
    function UNFREEZE207(uint256 value) public WHENNOTPAUSED180 {	//inject NONSTANDARD NAMING
        require(!ISLOCK330(msg.sender));
        _UNFREEZE152(value);
    }
    
}