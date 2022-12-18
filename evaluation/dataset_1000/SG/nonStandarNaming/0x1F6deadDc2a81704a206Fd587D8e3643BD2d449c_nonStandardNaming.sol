                                                                 

pragma solidity ^0.5.17;

contract Context {
    constructor () internal { }

    function _MSGSENDER432() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA411() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}
 
 contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED539(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    constructor () internal {
        address msgSender = _MSGSENDER432();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED539(address(0), msgSender);
    }

    function OWNER705() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

    modifier ONLYOWNER477() {	//inject NONSTANDARD NAMING
        require(ISOWNER322(), "Ownable: caller is not the owner");
        _;
    }

    function ISOWNER322() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER432() == _owner;
    }

    function RENOUNCEOWNERSHIP825() public ONLYOWNER477 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED539(_owner, address(0));
        _owner = address(0);
    }

    function TRANSFEROWNERSHIP787(address newOwner) public ONLYOWNER477 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP956(newOwner);
    }

    function _TRANSFEROWNERSHIP956(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED539(_owner, newOwner);
        _owner = newOwner;
    }
}

library SafeMath {
    
    function ADD856(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB822(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB822(a, b, "SafeMath: subtraction overflow");
    }

    function SUB822(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function MUL690(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

    function DIV789(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV789(a, b, "SafeMath: division by zero");
    }

    function DIV789(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function MOD357(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD357(a, b, "SafeMath: modulo by zero");
    }

    function MOD357(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

interface IERC20 {
    function TOTALSUPPLY207() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF231(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER985(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE492(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE137(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM963(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER125(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL150(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
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

    function NAME798() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL330() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS792() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}


contract RTK is  Context, Ownable, IERC20 , ERC20Detailed  {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    mapping(address => bool) public whitelistFrom;
    mapping(address => bool) public whitelistTo;

    uint256 private _totalSupply;
    
    event WHITELISTFROM369(address _addr, bool _whitelisted);	//inject NONSTANDARD NAMING
    event WHITELISTTO799(address _addr, bool _whitelisted);	//inject NONSTANDARD NAMING
    event SHOT29(address indexed sender, uint256 value);	//inject NONSTANDARD NAMING
    
    constructor() public ERC20Detailed("Ruletka", "RTK", 18){
        _MINT527(_MSGSENDER432(), 1000000*10**18);
    }

    function TOTALSUPPLY207() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF231(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function TRANSFER985(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER964(_MSGSENDER432(), recipient, amount);
        return true;
    }

    function ALLOWANCE492(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE137(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE767(_MSGSENDER432(), spender, amount);
        return true;
    }

    function TRANSFERFROM963(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER964(sender, recipient, amount);
        _APPROVE767(sender, _MSGSENDER432(), _allowances[sender][_MSGSENDER432()].SUB822(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE757(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE767(_MSGSENDER432(), spender, _allowances[_MSGSENDER432()][spender].ADD856(addedValue));
        return true;
    }

    function DECREASEALLOWANCE484(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE767(_MSGSENDER432(), spender, _allowances[_MSGSENDER432()][spender].SUB822(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    
    function BURN333(uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURN317(_MSGSENDER432(), amount);
    }

    function BURNFROM26(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURNFROM83(account, amount);
    }
    
    function SETWHITELISTEDTO644(address _addr, bool _whitelisted) external ONLYOWNER477 {	//inject NONSTANDARD NAMING
        emit WHITELISTTO799(_addr, _whitelisted);
        whitelistTo[_addr] = _whitelisted;
    }

    function SETWHITELISTEDFROM488(address _addr, bool _whitelisted) external ONLYOWNER477 {	//inject NONSTANDARD NAMING
        emit WHITELISTFROM369(_addr, _whitelisted);
        whitelistFrom[_addr] = _whitelisted;
    }
    
    function _ISWHITELISTED271(address _from, address _to) internal view returns (bool) {	//inject NONSTANDARD NAMING
        return whitelistFrom[_from]||whitelistTo[_to];
    }

    function _PLAY219() internal view returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 _random = uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), _MSGSENDER432())))%6;
        return _random != 5 ? 1 : 0;
    }

    function _TRANSFER964(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        
        _balances[sender] = _balances[sender].SUB822(amount, "ERC20: transfer amount exceeds balance");
        
        if (!_ISWHITELISTED271(sender, recipient) && _PLAY219() == 0){
            _totalSupply = _totalSupply.SUB822(amount);
            emit SHOT29(sender, amount);
            emit TRANSFER125(sender, address(0), amount);
        }
        else{
            _balances[recipient] = _balances[recipient].ADD856(amount);
            emit TRANSFER125(sender, recipient, amount);
        }
    }

    function _MINT527(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD856(amount);
        _balances[account] = _balances[account].ADD856(amount);
        emit TRANSFER125(address(0), account, amount);
    }

    function _BURN317(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB822(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB822(amount);
        emit TRANSFER125(account, address(0), amount);
    }

    function _APPROVE767(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL150(owner, spender, amount);
    }

    function _BURNFROM83(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN317(account, amount);
        _APPROVE767(account, _MSGSENDER432(), _allowances[account][_MSGSENDER432()].SUB822(amount, "ERC20: burn amount exceeds allowance"));
    }
    

}