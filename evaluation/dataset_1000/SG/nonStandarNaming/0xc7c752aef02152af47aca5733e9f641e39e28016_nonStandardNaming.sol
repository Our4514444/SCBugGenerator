// File: node_modules\openzeppelin-solidity\contracts\token\ERC20\IERC20.sol

pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER815(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE681(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM636(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY970() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF62(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE816(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER854(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL416(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: node_modules\openzeppelin-solidity\contracts\math\SafeMath.sol

pragma solidity ^0.5.2;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL504(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV463(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB905(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD464(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD707(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: openzeppelin-solidity\contracts\token\ERC20\ERC20.sol

pragma solidity ^0.5.2;



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY970() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF62(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE816(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER815(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER599(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE681(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE162(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM636(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER599(from, to, value);
        _APPROVE162(from, msg.sender, _allowed[from][msg.sender].SUB905(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE247(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE162(msg.sender, spender, _allowed[msg.sender][spender].ADD464(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE263(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE162(msg.sender, spender, _allowed[msg.sender][spender].SUB905(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER599(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB905(value);
        _balances[to] = _balances[to].ADD464(value);
        emit TRANSFER854(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT96(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD464(value);
        _balances[account] = _balances[account].ADD464(value);
        emit TRANSFER854(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN660(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB905(value);
        _balances[account] = _balances[account].SUB905(value);
        emit TRANSFER854(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE162(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL416(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM742(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN660(account, value);
        _APPROVE162(account, msg.sender, _allowed[account][msg.sender].SUB905(value));
    }
}

// File: openzeppelin-solidity\contracts\token\ERC20\ERC20Detailed.sol

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

                                                     
    function NAME540() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

                                                       
    function SYMBOL498() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

                                                                   
    function DECIMALS276() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

// File: openzeppelin-solidity\contracts\ownership\Ownable.sol

pragma solidity ^0.5.2;

                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED520(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED520(address(0), _owner);
    }

                                                        
    function OWNER126() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER677() {	//inject NONSTANDARD NAMING
        require(ISOWNER514());
        _;
    }

                                                                                 
    function ISOWNER514() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP390() public ONLYOWNER677 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED520(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP555(address newOwner) public ONLYOWNER677 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP776(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP776(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED520(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts\Ort.sol

pragma solidity ^0.5.2;




contract Ort is ERC20, ERC20Detailed, Ownable {
    uint8 public constant decimals753 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant initial_supply595 = 888888888 * (10 ** uint256(decimals753));	//inject NONSTANDARD NAMING

    constructor () public ERC20Detailed("Orientum Token", "ORT", decimals753) {
        _MINT96(msg.sender, initial_supply595);
    }

    function RENOUNCEOWNERSHIP390() public ONLYOWNER677 {	//inject NONSTANDARD NAMING
        revert();
    }
}