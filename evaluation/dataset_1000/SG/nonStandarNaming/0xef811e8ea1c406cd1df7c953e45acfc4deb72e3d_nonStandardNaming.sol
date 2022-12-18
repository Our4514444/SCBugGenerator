                                                                 

// File: contracts/SafeMath.sol

pragma solidity 0.5.16;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL791(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV124(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB705(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD452(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD201(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: contracts/IERC20.sol

pragma solidity 0.5.16;

                                                                                   
interface IERC20 {
    function TRANSFER130(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE808(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM48(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY425() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF464(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE689(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER524(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL80(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: contracts/Token.sol

pragma solidity 0.5.16;



contract Token is IERC20 {
    using SafeMath for uint256;

    string public constant name721 = "GICCOIN";	//inject NONSTANDARD NAMING
    string public constant symbol125 = "GICC";	//inject NONSTANDARD NAMING
    uint256 public constant decimals610 = 18;	//inject NONSTANDARD NAMING

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowed;
    uint256 private _totalSupply;

    constructor(address banker) public {
        uint256 amount = 3 * (10 ** 8) * (10 ** decimals610);

        _totalSupply = _totalSupply.ADD452(amount);
        _balances[banker] = amount;
        emit TRANSFER524(address(0), banker, amount);
    }

                                                               
    function TOTALSUPPLY425() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF464(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE689(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER130(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER953(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE808(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE881(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM48(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER953(from, to, value);
        _APPROVE881(from, msg.sender, _allowed[from][msg.sender].SUB705(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE371(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE881(msg.sender, spender, _allowed[msg.sender][spender].ADD452(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE388(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE881(msg.sender, spender, _allowed[msg.sender][spender].SUB705(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER953(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB705(value);
        _balances[to] = _balances[to].ADD452(value);
        emit TRANSFER524(from, to, value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE881(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL80(owner, spender, value);
    }
}