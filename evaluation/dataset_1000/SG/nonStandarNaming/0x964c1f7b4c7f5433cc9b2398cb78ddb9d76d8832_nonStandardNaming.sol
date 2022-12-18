pragma solidity 0.5.7;

                                                                                                     
library SafeMath {
                                                                                  
    function MUL822(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV695(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                               
    function SUB691(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD730(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }
}
                                                                                                                    
contract Token {
    using SafeMath for uint256;
    
    string public constant name283 = "5G Cloud Chain";	//inject NONSTANDARD NAMING
    string public constant symbol961 = "5GCC";	//inject NONSTANDARD NAMING
    uint8 public constant decimals287 = 4;	//inject NONSTANDARD NAMING

    uint256 private constant initial_supply584 = 1e9;	//inject NONSTANDARD NAMING
    uint256 public constant totalsupply349 = initial_supply584 * 10 ** uint256(decimals287);	//inject NONSTANDARD NAMING

    address public constant wallet161 = 0x25c5141A20f2D901C2fbA19131C8f6dccdE90399;	//inject NONSTANDARD NAMING

    mapping (address => uint256) internal _balances;
    mapping (address => mapping (address => uint256)) internal _allowed;

    event TRANSFER253(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL59(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

    constructor() public {
        _balances[wallet161] = totalsupply349;
        emit TRANSFER253(address(0), wallet161, totalsupply349);
    }

                                                                                                                                                                                                             
    function BALANCEOF977(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE498(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                 
    function TRANSFER643(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER252(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE133(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE67(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM159(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER252(from, to, value);
        _APPROVE67(from, msg.sender, _allowed[from][msg.sender].SUB691(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE680(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE67(msg.sender, spender, _allowed[msg.sender][spender].ADD730(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE631(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE67(msg.sender, spender, _allowed[msg.sender][spender].SUB691(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                   
    function _TRANSFER252(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0), "Cannot transfer to zero address");

        _balances[from] = _balances[from].SUB691(value);
        _balances[to] = _balances[to].ADD730(value);
        emit TRANSFER253(from, to, value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE67(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0), "Cannot approve to the zero address");
        require(owner != address(0), "Setter cannot be a zero address");

        _allowed[owner][spender] = value;
        emit APPROVAL59(owner, spender, value);
    }
}