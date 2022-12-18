pragma solidity 0.5.5;

                                                                                                   
library SafeMath {
                                                                                  
    function MUL261(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV800(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB458(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD100(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD564(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED259(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED259(address(0), _owner);
    }

                                                        
    function OWNER395() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER482() {	//inject NONSTANDARD NAMING
        require(ISOWNER438());
        _;
    }

                                                                                 
    function ISOWNER438() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP893() public ONLYOWNER482 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED259(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP754(address newOwner) public ONLYOWNER482 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP872(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP872(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED259(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                   
interface IERC20 {
    function TRANSFER688(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE694(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM263(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY33() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF603(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE426(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER116(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL325(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20, Ownable {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY33() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF603(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE426(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER688(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER798(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE694(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE424(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM263(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER798(from, to, value);
        _APPROVE424(from, msg.sender, _allowed[from][msg.sender].SUB458(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE774(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE424(msg.sender, spender, _allowed[msg.sender][spender].ADD100(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE772(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE424(msg.sender, spender, _allowed[msg.sender][spender].SUB458(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER798(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB458(value);
        _balances[to] = _balances[to].ADD100(value);
        emit TRANSFER116(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT857(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD100(value);
        _balances[account] = _balances[account].ADD100(value);
        emit TRANSFER116(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN889(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB458(value);
        _balances[account] = _balances[account].SUB458(value);
        emit TRANSFER116(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE424(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL325(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM240(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN889(account, value);
        _APPROVE424(account, msg.sender, _allowed[account][msg.sender].SUB458(value));
    }
}

                                                                                           
contract ERC20Burnable is ERC20 {
                                                                                                                    
    function BURN729(uint256 value) public {	//inject NONSTANDARD NAMING
        _BURN889(msg.sender, value);
    }

                                                                                                                                                                                                                                                
    function BURNFROM813(address from, uint256 value) public {	//inject NONSTANDARD NAMING
        _BURNFROM240(from, value);
    }
}

                                                           
contract ERC20Mintable is ERC20 {
                                                                                                                                                                                                                                                
    function MINT185(address to, uint256 value) public ONLYOWNER482 returns (bool) {	//inject NONSTANDARD NAMING
        _MINT857(to, value);
        return true;
    }
}

interface tokenRecipient { 
    function RECEIVEAPPROVAL865(address _from, uint256 _value, bytes calldata _extraData) external;	//inject NONSTANDARD NAMING
}

contract VXD is ERC20Mintable, ERC20Burnable {
    string public constant name436 = "VALYOU X MUSIC DIGITAL CURRENCY";	//inject NONSTANDARD NAMING
    string public constant symbol816 = "VXD";	//inject NONSTANDARD NAMING
    uint256 public constant decimals401 = 18;	//inject NONSTANDARD NAMING

    // there is no problem in using * here instead of .mul()
    uint256 public initialSupply = 100000000000 * (10 ** decimals401);

    constructor () public {
        _MINT857(msg.sender, initialSupply);
    }

    function APPROVEANDCALL439(address _spender, uint256 _value, bytes calldata _extraData)	//inject NONSTANDARD NAMING
        external
        returns (bool success) 
    {
        tokenRecipient spender = tokenRecipient(_spender);
        if (APPROVE694(_spender, _value)) {
            spender.RECEIVEAPPROVAL865(msg.sender, _value, _extraData);
            return true;
        }
    }
}