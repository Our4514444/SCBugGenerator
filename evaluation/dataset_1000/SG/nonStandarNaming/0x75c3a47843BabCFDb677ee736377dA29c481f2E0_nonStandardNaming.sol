                                                                 

// File: openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.10;

                                                                                   
interface IERC20 {
    function TRANSFER358(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE759(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM969(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY290() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF110(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE269(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    event TRANSFER906(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL657(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol

pragma solidity ^0.5.10;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL392(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV616(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB913(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD121(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD157(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity/contracts/token/ERC20/ERC20.sol

pragma solidity ^0.5.10;

                                                                                                                                                                                                                                                                                                                                                                                                                            
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY290() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF110(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE269(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER358(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER997(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE759(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE201(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM969(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER997(from, to, value);
        _APPROVE201(from, msg.sender, _allowed[from][msg.sender].SUB913(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE807(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE201(msg.sender, spender, _allowed[msg.sender][spender].ADD121(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE30(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE201(msg.sender, spender, _allowed[msg.sender][spender].SUB913(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER997(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB913(value);
        _balances[to] = _balances[to].ADD121(value);
        emit TRANSFER906(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT234(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD121(value);
        _balances[account] = _balances[account].ADD121(value);
        emit TRANSFER906(address(0), account, value);
    }


                                                                                                                                                                                                                                                                  
    function _APPROVE201(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL657(owner, spender, value);
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

                                                     
    function NAME191() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL387() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS642() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: contracts

pragma solidity ^0.5.10;

contract MYRT is ERC20, ERC20Detailed {
    constructor() ERC20Detailed('MYRT (MYRToken.com)', 'MYRT', 6) public {
        _MINT234(msg.sender, 1000_000_000_000 * 10 ** 6);
    }
}