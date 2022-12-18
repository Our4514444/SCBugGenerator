pragma solidity 0.5.3;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL938(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV765(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB757(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD316(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD144(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                                                        
interface IERC20 {
    function TRANSFER395(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE797(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM798(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY224() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF419(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE8(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER376(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL993(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY224() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                              
    function BALANCEOF419(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE8(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                 
    function TRANSFER395(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER673(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE797(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE845(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM798(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER673(from, to, value);
        _APPROVE845(from, msg.sender, _allowed[from][msg.sender].SUB757(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE659(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE845(msg.sender, spender, _allowed[msg.sender][spender].ADD316(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE81(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE845(msg.sender, spender, _allowed[msg.sender][spender].SUB757(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER673(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB757(value);
        _balances[to] = _balances[to].ADD316(value);
        emit TRANSFER376(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT644(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD316(value);
        _balances[account] = _balances[account].ADD316(value);
        emit TRANSFER376(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN441(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB757(value);
        _balances[account] = _balances[account].SUB757(value);
        emit TRANSFER376(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE845(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL993(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM235(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN441(account, value);
        _APPROVE845(account, msg.sender, _allowed[account][msg.sender].SUB757(value));
    }
}


contract TestToken is ERC20{
    string public constant name86 = "TestToken";	//inject NONSTANDARD NAMING
    string public constant symbol65 = "TT";	//inject NONSTANDARD NAMING
    uint8 public constant decimals597 = 18;	//inject NONSTANDARD NAMING
    
    uint256 public constant initial_supply977 = 520000000 * (10 ** uint256(decimals597));	//inject NONSTANDARD NAMING
    
    
    constructor() public{
        _MINT644(msg.sender,initial_supply977);
    }
    
}