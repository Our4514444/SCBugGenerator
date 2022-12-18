                                                                 

                  


pragma solidity ^0.5.2;

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

                                                                                   
interface IERC20 {
    function TRANSFER701(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE862(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM414(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY653() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF22(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE186(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER961(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL720(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL592(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV552(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB932(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD545(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD692(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                               
    function TOTALSUPPLY653() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF22(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE186(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER701(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER508(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE862(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE779(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM414(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER508(from, to, value);
        _APPROVE779(from, msg.sender, _allowed[from][msg.sender].SUB932(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE899(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE779(msg.sender, spender, _allowed[msg.sender][spender].ADD545(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE750(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE779(msg.sender, spender, _allowed[msg.sender][spender].SUB932(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER508(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB932(value);
        _balances[to] = _balances[to].ADD545(value);
        emit TRANSFER961(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT356(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD545(value);
        _balances[account] = _balances[account].ADD545(value);
        emit TRANSFER961(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN335(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB932(value);
        _balances[account] = _balances[account].SUB932(value);
        emit TRANSFER961(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE779(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL720(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM417(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN335(account, value);
        _APPROVE779(account, msg.sender, _allowed[account][msg.sender].SUB932(value));
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

                                                     
    function NAME777() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL523() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS486() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol

pragma solidity ^0.5.2;


                                                                                           
contract ERC20Burnable is ERC20 {
                                                                                                                    
    function BURN23(uint256 value) public {	//inject NONSTANDARD NAMING
        _BURN335(msg.sender, value);
    }

                                                                                                                                                                                                                                                
    function BURNFROM227(address from, uint256 value) public {	//inject NONSTANDARD NAMING
        _BURNFROM417(from, value);
    }
}

// File: contracts/ONUS.sol

pragma solidity ^0.5.0;

contract ONUS is ERC20, ERC20Detailed, ERC20Burnable {
    constructor() ERC20Detailed('ONUS', 'ONUS', 18) public {
        _MINT356(msg.sender, 14400000000 * 10 ** 18);
    }
}