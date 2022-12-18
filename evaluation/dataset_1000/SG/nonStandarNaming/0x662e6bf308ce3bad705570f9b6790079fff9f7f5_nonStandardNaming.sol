pragma solidity ^0.5.4;

                                                                                   
interface IERC20 {
    function TRANSFER153(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE268(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM13(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY273() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF876(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE820(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER155(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL37(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                   
library SafeMath {
                                                                                  
    function MUL943(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV430(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB536(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD643(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD675(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY273() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF876(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE820(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER153(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER982(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE268(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE459(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM13(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER982(from, to, value);
        _APPROVE459(from, msg.sender, _allowed[from][msg.sender].SUB536(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE982(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE459(msg.sender, spender, _allowed[msg.sender][spender].ADD643(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE361(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE459(msg.sender, spender, _allowed[msg.sender][spender].SUB536(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER982(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB536(value);
        _balances[to] = _balances[to].ADD643(value);
        emit TRANSFER155(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT545(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD643(value);
        _balances[account] = _balances[account].ADD643(value);
        emit TRANSFER155(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN374(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB536(value);
        _balances[account] = _balances[account].SUB536(value);
        emit TRANSFER155(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE459(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL37(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM827(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN374(account, value);
        _APPROVE459(account, msg.sender, _allowed[account][msg.sender].SUB536(value));
    }
}

                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                               
    function ADD643(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(!HAS610(role, account));

        role.bearer[account] = true;
    }

                                                                   
    function REMOVE212(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));
        require(HAS610(role, account));

        role.bearer[account] = false;
    }

                                                                                 
    function HAS610(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0));
        return role.bearer[account];
    }
}

contract MinterRole {
    using Roles for Roles.Role;

    event MINTERADDED752(address indexed account);	//inject NONSTANDARD NAMING
    event MINTERREMOVED129(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _minters;

    constructor () internal {
        _ADDMINTER416(msg.sender);
    }

    modifier ONLYMINTER539() {	//inject NONSTANDARD NAMING
        require(ISMINTER156(msg.sender));
        _;
    }

    function ISMINTER156(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _minters.HAS610(account);
    }

    function ADDMINTER920(address account) public ONLYMINTER539 {	//inject NONSTANDARD NAMING
        _ADDMINTER416(account);
    }

    function RENOUNCEMINTER737() public {	//inject NONSTANDARD NAMING
        _REMOVEMINTER545(msg.sender);
    }

    function _ADDMINTER416(address account) internal {	//inject NONSTANDARD NAMING
        _minters.ADD643(account);
        emit MINTERADDED752(account);
    }

    function _REMOVEMINTER545(address account) internal {	//inject NONSTANDARD NAMING
        _minters.REMOVE212(account);
        emit MINTERREMOVED129(account);
    }
}

                                                           
contract ERC20Mintable is ERC20, MinterRole {
                                                                                                                                                                                                                                                
    function MINT366(address to, uint256 value) public ONLYMINTER539 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT545(to, value);
        return true;
    }
}

                                                                       
contract ERC20Capped is ERC20Mintable {
    uint256 private _cap;

    constructor (uint256 cap) public {
        require(cap > 0);
        _cap = cap;
    }

                                                             
    function CAP635() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _cap;
    }

    function _MINT545(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(TOTALSUPPLY273().ADD643(value) <= _cap);
        super._MINT545(account, value);
    }
}

contract HackersLiveCoin is ERC20Capped(10000000000 ether) {
    string public name = "Hackers Live Coin";
    string public symbol = "HCL";
    uint8 public decimals = 18;
    address public CFO;
    address public CEO;
    
    constructor () public {
        CEO = msg.sender;
        CFO = msg.sender;
    }
    
    function SETCEO649(address newCEO) external {	//inject NONSTANDARD NAMING
        require(msg.sender == CEO);
        
        CEO = newCEO;
    }
    
    function SETCFO887(address newCFO) external {	//inject NONSTANDARD NAMING
        require(msg.sender == CEO);
        CFO = newCFO;
    }
    
    function () payable external {
        
    }
    
    function WITHDRAWETHER938() external {	//inject NONSTANDARD NAMING
        require(msg.sender == CFO || msg.sender == CEO);
        msg.sender.transfer(address(this).balance);
    }
    
    function REMOVEMINTER830(address account) external {	//inject NONSTANDARD NAMING
        require(msg.sender == CFO || msg.sender == CEO);
        _REMOVEMINTER545(account);
    }
}