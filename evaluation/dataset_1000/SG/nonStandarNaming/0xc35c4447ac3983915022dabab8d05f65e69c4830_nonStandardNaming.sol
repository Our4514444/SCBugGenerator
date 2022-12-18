                                                                 

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER514(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE20(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM935(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY856() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF117(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE261(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER871(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL688(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL75(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV854(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB399(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD46(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD999(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20.sol

pragma solidity ^0.5.2;

                                                                                                                                                                                                                                                                                                                                                                                                                            
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY856() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF117(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE261(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER514(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER872(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE20(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE86(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM935(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER872(from, to, value);
        _APPROVE86(from, msg.sender, _allowed[from][msg.sender].SUB399(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE576(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE86(msg.sender, spender, _allowed[msg.sender][spender].ADD46(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE153(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE86(msg.sender, spender, _allowed[msg.sender][spender].SUB399(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER872(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB399(value);
        _balances[to] = _balances[to].ADD46(value);
        emit TRANSFER871(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT880(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD46(value);
        _balances[account] = _balances[account].ADD46(value);
        emit TRANSFER871(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN981(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB399(value);
        _balances[account] = _balances[account].SUB399(value);
        emit TRANSFER871(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE86(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL688(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM352(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN981(account, value);
        _APPROVE86(account, msg.sender, _allowed[account][msg.sender].SUB399(value));
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol

pragma solidity ^0.5.2;


                                                                                                                                                                                                                                        
contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

                                                     
    function NAME236() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL789() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS464() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol

pragma solidity ^0.5.2;


                                                                                           
contract ERC20Burnable is ERC20 {
                                                                                                                    
    function BURN206(uint256 value) public {	//inject NONSTANDARD NAMING
        _BURN981(msg.sender, value);
    }

                                                                                                                                                                                                                                                
    function BURNFROM710(address from, uint256 value) public {	//inject NONSTANDARD NAMING
        _BURNFROM352(from, value);
    }
}

// File: contracts/OPO.sol

pragma solidity ^0.5.0;

contract OPO is ERC20, ERC20Detailed, ERC20Burnable {
    constructor() ERC20Detailed('Opoly Token', 'OPO', 18) public {
        _MINT880(msg.sender, 1000_000_000 * 10 ** 18);
    }
}