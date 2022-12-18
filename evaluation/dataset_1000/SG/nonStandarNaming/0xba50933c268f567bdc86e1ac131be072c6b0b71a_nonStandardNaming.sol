pragma solidity 0.5.4;

                                                                                   
interface IERC20 {
    function TRANSFER841(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE994(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM628(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY943() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF321(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE300(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER41(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL71(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) internal _balances;

    mapping (address => mapping (address => uint256)) internal _allowed;

    uint256 internal _totalSupply;

                                                                
    function TOTALSUPPLY943() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF321(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE300(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                 
    function TRANSFER841(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER738(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE994(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE55(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM628(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER738(from, to, value);
        _APPROVE55(from, msg.sender, _allowed[from][msg.sender].SUB697(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE922(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE55(msg.sender, spender, _allowed[msg.sender][spender].ADD246(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE703(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE55(msg.sender, spender, _allowed[msg.sender][spender].SUB697(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                     
    function _TRANSFER738(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB697(value);
        _balances[to] = _balances[to].ADD246(value);
        emit TRANSFER41(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT814(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD246(value);
        _balances[account] = _balances[account].ADD246(value);
        emit TRANSFER41(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN855(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB697(value);
        _balances[account] = _balances[account].SUB697(value);
        emit TRANSFER41(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE55(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL71(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM400(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN855(account, value);
        _APPROVE55(account, msg.sender, _allowed[account][msg.sender].SUB697(value));
    }
}

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED852(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                                                                                           
    constructor (address initalOwner) internal {
        _owner = initalOwner;
        emit OWNERSHIPTRANSFERRED852(address(0), _owner);
    }

                                                        
    function OWNER962() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER809() {	//inject NONSTANDARD NAMING
        require(ISOWNER695());
        _;
    }

                                                                                 
    function ISOWNER695() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP84() public ONLYOWNER809 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED852(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP754(address newOwner) public ONLYOWNER809 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP912(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP912(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED852(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                                   
contract ARPAToken is ERC20, Ownable {
    using SafeMath for uint;

    string public constant name47 = "ARPA Token";	//inject NONSTANDARD NAMING
    uint8 public constant decimals994 = 18;	//inject NONSTANDARD NAMING
    string public constant symbol147 = "ARPA";	//inject NONSTANDARD NAMING
    uint public constant maxsupply339 = 2 * 10**9 * 10**uint(decimals994); // 2 billion	//inject NONSTANDARD NAMING
    uint public constant initalsupply41 = 14 * 10**8 * 10**uint(decimals994); // 1.4 billion	//inject NONSTANDARD NAMING
    
    bool public paused; // True when circulation is paused.

    mapping (address => bool) public minter;

                                                                                 
    modifier ONLYMINTER50() {	//inject NONSTANDARD NAMING
        require(minter[msg.sender]);
        _;
    }

                                                                            
    modifier WHENNOTPAUSED233() {	//inject NONSTANDARD NAMING
        require(paused == false);
        _;
    }

                                                                                                                                                                                                                                                 
    constructor(address manager) public Ownable(manager) {
        _balances[manager] = initalsupply41;
        _totalSupply = initalsupply41;
    }

                                                                                                                               
    function ADDMINTER446(address minterAddress) public ONLYOWNER809 {	//inject NONSTANDARD NAMING
        minter[minterAddress] = true;
    }

                                                                                                                                       
    function REMOVEMINTER49(address minterAddress) public ONLYOWNER809 {	//inject NONSTANDARD NAMING
        minter[minterAddress] = false;
    }

                                                                                                                                                                                                                                                                                                                                   
    function MINT301(address to, uint value) public ONLYMINTER50 returns (bool) {	//inject NONSTANDARD NAMING
        require(_totalSupply.ADD246(value) <= maxsupply339);
        _MINT814(to, value);
        return true;
    }

                                                                                           
    function PAUSE14() public ONLYOWNER809 {	//inject NONSTANDARD NAMING
        paused = true;
    }

                                                                                   
    function UNPAUSE557() public ONLYOWNER809 {	//inject NONSTANDARD NAMING
        paused = false;
    }

                                                                                                                    
    function BURN672(uint256 value) public {	//inject NONSTANDARD NAMING
        _BURN855(msg.sender, value);
    }

                                                                                                                                                                                                                                                 
    function BURNFROM521(address from, uint256 value) public {	//inject NONSTANDARD NAMING
        _BURNFROM400(from, value);
    }

    function TRANSFER841(address to, uint256 value) public WHENNOTPAUSED233 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER841(to, value);
    }

    function TRANSFERFROM628(address from, address to, uint256 value) public WHENNOTPAUSED233 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM628(from, to, value);
    }

    function APPROVE994(address spender, uint256 value) public WHENNOTPAUSED233 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE994(spender, value);
    }

    function INCREASEALLOWANCE922(address spender, uint addedValue) public WHENNOTPAUSED233 returns (bool) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE922(spender, addedValue);
    }

    function DECREASEALLOWANCE703(address spender, uint subtractedValue) public WHENNOTPAUSED233 returns (bool) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE703(spender, subtractedValue);
    }

}

                                                                                                    
library SafeMath {
                                                                                  
    function MUL866(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV774(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB697(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD246(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD98(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}