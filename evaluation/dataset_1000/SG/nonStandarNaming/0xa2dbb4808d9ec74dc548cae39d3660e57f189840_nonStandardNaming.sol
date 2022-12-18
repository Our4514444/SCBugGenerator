pragma solidity ^0.5.2;

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD678(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS82(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE850(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS82(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS82(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}




contract PauserRole {
    using Roles for Roles.Role;

    event PAUSERADDED74(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED995(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    constructor () internal {
        _ADDPAUSER225(msg.sender);
    }

    modifier ONLYPAUSER659() {	//inject NONSTANDARD NAMING
        require(ISPAUSER463(msg.sender));
        _;
    }

    function ISPAUSER463(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS82(account);
    }

    function ADDPAUSER317(address account) public ONLYPAUSER659 {	//inject NONSTANDARD NAMING
        _ADDPAUSER225(account);
    }

    function RENOUNCEPAUSER448() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER227(msg.sender);
    }

    function _ADDPAUSER225(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD678(account);
        emit PAUSERADDED74(account);
    }

    function _REMOVEPAUSER227(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE850(account);
        emit PAUSERREMOVED995(account);
    }
}


                                                                                   
interface IERC20 {
    function TRANSFER261(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE809(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM324(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY662() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF126(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE570(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER636(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL528(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
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

                                                     
    function NAME869() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL928() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS554() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}








                                                                                                   
library SafeMath {
                                                                                  
    function MUL570(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV187(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB669(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD678(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD742(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY662() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF126(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE570(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER261(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER255(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE809(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE121(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM324(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER255(from, to, value);
        _APPROVE121(from, msg.sender, _allowed[from][msg.sender].SUB669(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE205(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE121(msg.sender, spender, _allowed[msg.sender][spender].ADD678(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE295(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE121(msg.sender, spender, _allowed[msg.sender][spender].SUB669(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER255(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB669(value);
        _balances[to] = _balances[to].ADD678(value);
        emit TRANSFER636(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT30(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD678(value);
        _balances[account] = _balances[account].ADD678(value);
        emit TRANSFER636(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN183(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB669(value);
        _balances[account] = _balances[account].SUB669(value);
        emit TRANSFER636(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE121(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL528(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM405(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN183(account, value);
        _APPROVE121(account, msg.sender, _allowed[account][msg.sender].SUB669(value));
    }
}





                                                                                                                
contract Pausable is PauserRole {
    event PAUSED951(address account);	//inject NONSTANDARD NAMING
    event UNPAUSED925(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

    constructor () internal {
        _paused = false;
    }

                                                                               
    function PAUSED848() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED106() {	//inject NONSTANDARD NAMING
        require(!_paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED206() {	//inject NONSTANDARD NAMING
        require(_paused);
        _;
    }

                                                                                
    function PAUSE393() public ONLYPAUSER659 WHENNOTPAUSED106 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED951(msg.sender);
    }

                                                                                   
    function UNPAUSE734() public ONLYPAUSER659 WHENPAUSED206 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED925(msg.sender);
    }
}


                                                                                
contract ERC20Pausable is ERC20, Pausable {
    function TRANSFER261(address to, uint256 value) public WHENNOTPAUSED106 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER261(to, value);
    }

    function TRANSFERFROM324(address from, address to, uint256 value) public WHENNOTPAUSED106 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM324(from, to, value);
    }

    function APPROVE809(address spender, uint256 value) public WHENNOTPAUSED106 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE809(spender, value);
    }

    function INCREASEALLOWANCE205(address spender, uint addedValue) public WHENNOTPAUSED106 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE205(spender, addedValue);
    }

    function DECREASEALLOWANCE295(address spender, uint subtractedValue) public WHENNOTPAUSED106 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE295(spender, subtractedValue);
    }
}


contract DeepCloud is ERC20Pausable, ERC20Detailed {
    uint8 public constant decimals864 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant initial_supply36 = 200000000 * (10 ** uint256(decimals864));	//inject NONSTANDARD NAMING
    uint256 public constant crowdsale71 = 90000000 * (10 ** uint256(decimals864));	//inject NONSTANDARD NAMING
    uint256 public constant bootstrap718 = 30000000 * (10 ** uint256(decimals864));	//inject NONSTANDARD NAMING
    uint256 public constant reserves352 = 30000000 * (10 ** uint256(decimals864));	//inject NONSTANDARD NAMING
    uint256 public constant advisors209 = 10000000 * (10 ** uint256(decimals864));	//inject NONSTANDARD NAMING
    uint256 public constant development470 = 30000000 * (10 ** uint256(decimals864));	//inject NONSTANDARD NAMING
    uint256 public constant marketing935 = 10000000 * (10 ** uint256(decimals864));	//inject NONSTANDARD NAMING

    uint256 public unblock = 1623974399;
    address private _owner;
    uint256 private CrowdSale = 0;
    uint256 private Bootstrap = 0;
    uint256 private Reserves = 0;
    uint256 private Advisors = 0;
    uint256 private Development = 0;
    uint256 private Marketing = 0;


    mapping(address => bool) public capAddress;
    uint256[] caps = [crowdsale71,bootstrap718,reserves352,advisors209,development470,marketing935];
    uint256[] supplied = [0,0,0,0,0,0];

    constructor () public ERC20Detailed("DeepCloud", "DEEP", decimals864) {
      _owner = msg.sender;
      _MINT30(msg.sender, initial_supply36);
    }

    function INITIALTRANSFER651(uint index,address to, uint256 value) public ONLYOWNER977 returns (bool){	//inject NONSTANDARD NAMING
      _CHECKAVAILABLECAP210(index, value);
      _UPDATECAPSUPPLY551(index, value);
      capAddress[to] = true;
      TRANSFER261(to, value);
      return true;
    }

    function _UPDATECAPSUPPLY551(uint index, uint256 value)  internal  {	//inject NONSTANDARD NAMING
      supplied[index] += value;
    }

    function _CHECKAVAILABLECAP210(uint index, uint256 value) internal view  {	//inject NONSTANDARD NAMING
      require(caps[index] >= (supplied[index] + value), "Balance: Low balance");
    }

    function TRANSFER261(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(CHECKLOCK924());
        return super.TRANSFER261(to, value);
    }

    function TRANSFERFROM324(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        CHECKLOCK924();
        return super.TRANSFERFROM324(from, to, value);
    }

    function APPROVE809(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        CHECKLOCK924();
        return super.APPROVE809(spender, value);
    }

    function INCREASEALLOWANCE205(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        CHECKLOCK924();
        return super.INCREASEALLOWANCE205(spender, addedValue);
    }

    function DECREASEALLOWANCE295(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        CHECKLOCK924();
        return super.DECREASEALLOWANCE295(spender, subtractedValue);
    }
    function ISOWNER239() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }
    modifier ONLYOWNER977() {	//inject NONSTANDARD NAMING
        require(ISOWNER239(), "Ownable: caller is not the owner");
        _;
    }
    function CHECKLOCK924() internal view returns (bool){	//inject NONSTANDARD NAMING
      if(capAddress[msg.sender]){
          return now > unblock;
      } else {
          return true;
      }
    }
}