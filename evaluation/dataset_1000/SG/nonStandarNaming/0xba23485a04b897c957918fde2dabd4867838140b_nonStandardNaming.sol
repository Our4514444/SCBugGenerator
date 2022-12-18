pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER82(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE574(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM175(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY939() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF67(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE564(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER518(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL699(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              




                             
                                                                                                          
                                                     
                                                  
contract UpgradeableTarget {
    function UPGRADEFROM424(address from, uint256 value) external; // note: implementation should require(from == oldToken)	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED790(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED790(address(0), _owner);
    }

                                                        
    function OWNER551() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER212() {	//inject NONSTANDARD NAMING
        require(ISOWNER434());
        _;
    }

                                                                                 
    function ISOWNER434() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP530() public ONLYOWNER212 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED790(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP645(address newOwner) public ONLYOWNER212 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP152(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP152(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED790(_owner, newOwner);
        _owner = newOwner;
    }
}








                                                                                                   
library SafeMath {
                                                                                  
    function MUL283(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV34(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB628(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD239(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD345(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY939() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF67(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE564(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER82(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER274(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE574(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE691(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM175(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER274(from, to, value);
        _APPROVE691(from, msg.sender, _allowed[from][msg.sender].SUB628(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE31(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE691(msg.sender, spender, _allowed[msg.sender][spender].ADD239(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE302(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE691(msg.sender, spender, _allowed[msg.sender][spender].SUB628(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER274(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB628(value);
        _balances[to] = _balances[to].ADD239(value);
        emit TRANSFER518(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT265(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD239(value);
        _balances[account] = _balances[account].ADD239(value);
        emit TRANSFER518(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN918(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB628(value);
        _balances[account] = _balances[account].SUB628(value);
        emit TRANSFER518(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE691(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL699(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM447(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN918(account, value);
        _APPROVE691(account, msg.sender, _allowed[account][msg.sender].SUB628(value));
    }
}


                                                                                           
contract ERC20Burnable is ERC20 {
                                                                                                                    
    function BURN752(uint256 value) public {	//inject NONSTANDARD NAMING
        _BURN918(msg.sender, value);
    }

                                                                                                                                                                                                                                                
    function BURNFROM101(address from, uint256 value) public {	//inject NONSTANDARD NAMING
        _BURNFROM447(from, value);
    }
}



                            
                                                                                                                     
                                      
                                                  
contract UpgradeableToken is Ownable, ERC20Burnable {

    address public upgradeableTarget;       // contract address handling upgrade
    uint256 public totalUpgraded;           // total token amount already upgraded

    event UPGRADED98(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                             

                                                      
                                                                         
    function UPGRADE929(uint256 value) external {	//inject NONSTANDARD NAMING
        require(upgradeableTarget != address(0), "cannot upgrade with no target");

        BURN752(value);                    // burn tokens as we migrate them.
        totalUpgraded = totalUpgraded.ADD239(value);

        UpgradeableTarget(upgradeableTarget).UPGRADEFROM424(msg.sender, value);
        emit UPGRADED98(msg.sender, upgradeableTarget, value);
    }

                                                      
                                                                            
    function SETUPGRADEABLETARGET295(address upgradeAddress) external ONLYOWNER212 {	//inject NONSTANDARD NAMING
        upgradeableTarget = upgradeAddress;
    }

}


                       
                                                                                                       
                                                                               
                                                  
contract MarketToken is UpgradeableToken {

    string public constant name450 = "MARKET Protocol Token";	//inject NONSTANDARD NAMING
    string public constant symbol220 = "MKT";	//inject NONSTANDARD NAMING
    uint8 public constant decimals923 = 18;	//inject NONSTANDARD NAMING

    uint public constant initial_supply108 = 600000000 * 10**uint(decimals923); // 600 million tokens with 18 decimals (6e+26)	//inject NONSTANDARD NAMING

    constructor() public {
        _MINT265(msg.sender, initial_supply108);
    }
}