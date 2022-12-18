                                                                 

                                                                 

pragma solidity ^0.5.2;

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

                                
 
interface IERC20 {
    function TRANSFER554(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE797(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM539(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY51() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF561(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE530(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER398(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL484(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL401(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV629(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB551(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD295(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD438(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                               
    function TOTALSUPPLY51() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF561(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE530(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER554(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER517(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE797(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE137(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM539(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER517(from, to, value);
        _APPROVE137(from, msg.sender, _allowed[from][msg.sender].SUB551(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE187(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE137(msg.sender, spender, _allowed[msg.sender][spender].ADD295(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE618(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE137(msg.sender, spender, _allowed[msg.sender][spender].SUB551(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER517(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB551(value);
        _balances[to] = _balances[to].ADD295(value);
        emit TRANSFER398(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT372(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD295(value);
        _balances[account] = _balances[account].ADD295(value);
        emit TRANSFER398(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN826(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB551(value);
        _balances[account] = _balances[account].SUB551(value);
        emit TRANSFER398(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE137(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL484(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM598(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN826(account, value);
        _APPROVE137(account, msg.sender, _allowed[account][msg.sender].SUB551(value));
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

                                                     
    function NAME616() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL554() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS153() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol

pragma solidity ^0.5.2;


                                                                                           
contract ERC20Burnable is ERC20 {
                                                                                                                    
    function BURN592(uint256 value) public {	//inject NONSTANDARD NAMING
        _BURN826(msg.sender, value);
    }

                                                                                                                                                                                                                                                
    function BURNFROM882(address from, uint256 value) public {	//inject NONSTANDARD NAMING
        _BURNFROM598(from, value);
    }
}

// File: contracts/bees.finance.sol

pragma solidity ^0.5.0;

contract beesfinance is ERC20, ERC20Detailed, ERC20Burnable {
    constructor() ERC20Detailed('reef.finance', 'REEF', 18) public {
        _MINT372(msg.sender, 20000 * 10**18);
    }
}