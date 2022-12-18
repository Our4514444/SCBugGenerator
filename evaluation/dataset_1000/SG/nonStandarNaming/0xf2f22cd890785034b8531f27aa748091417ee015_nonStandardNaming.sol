pragma solidity 0.5.8;

                                                                                                     
library SafeMath {
                                                                                
    function MUL29(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                          
    function DIV199(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                             
    function SUB594(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD581(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }
}

                                                                                   
interface IERC20 {
    function TRANSFER115(address to, uint256 value) external returns (bool); 	//inject NONSTANDARD NAMING

    function APPROVE759(address spender, uint256 value) external returns (bool); 	//inject NONSTANDARD NAMING

    function TRANSFERFROM351(address from, address to, uint256 value) external returns (bool); 	//inject NONSTANDARD NAMING

    function TOTALSUPPLY544() external view returns (uint256); 	//inject NONSTANDARD NAMING

    function BALANCEOF779(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE916(address owner, address spender) external view returns (uint256); 	//inject NONSTANDARD NAMING

    event TRANSFER813(address indexed from, address indexed to, uint256 value); 	//inject NONSTANDARD NAMING

    event APPROVAL881(address indexed owner, address indexed spender, uint256 value); 	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                             
contract Ownable {
    address internal _owner; 

    event OWNERSHIPTRANSFERRED424(address indexed previousOwner, address indexed newOwner); 	//inject NONSTANDARD NAMING

                                                        
    function OWNER665() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER608() {	//inject NONSTANDARD NAMING
        require(ISOWNER500(), "The caller must be owner");
        _;
    }

                                                                                 
    function ISOWNER500() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                          
    function RENOUNCEOWNERSHIP63() public ONLYOWNER608 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED424(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                   
    function TRANSFEROWNERSHIP204(address newOwner) public ONLYOWNER608 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP59(newOwner); 
    }

                                                                                                                                        
    function _TRANSFEROWNERSHIP59(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Cannot transfer control of the contract to the zero address");
        emit OWNERSHIPTRANSFERRED424(_owner, newOwner); 
        _owner = newOwner; 
    }
}

                                                                                          
contract StandardToken is IERC20 {
    using SafeMath for uint256; 
    
    mapping (address => uint256) internal _balances; 
    mapping (address => mapping (address => uint256)) internal _allowed; 
    
    uint256 internal _totalSupply; 
    
                                                                
    function TOTALSUPPLY544() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply; 
    }

                                                                                                                                                                                                            
    function BALANCEOF779(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE916(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                  
    function TRANSFER115(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER178(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE759(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE287(msg.sender, spender, value); 
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM351(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER178(from, to, value); 
        _APPROVE287(from, msg.sender, _allowed[from][msg.sender].SUB594(value)); 
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE972(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE287(msg.sender, spender, _allowed[msg.sender][spender].ADD581(addedValue)); 
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE583(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE287(msg.sender, spender, _allowed[msg.sender][spender].SUB594(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER178(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0), "Cannot transfer to the zero address"); 
        _balances[from] = _balances[from].SUB594(value); 
        _balances[to] = _balances[to].ADD581(value); 
        emit TRANSFER813(from, to, value); 
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE287(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0), "Cannot approve to the zero address"); 
        require(owner != address(0), "Setter cannot be the zero address"); 
	    _allowed[owner][spender] = value;
        emit APPROVAL881(owner, spender, value); 
    }

}

                                                                                                                
contract Pausable is Ownable {
    event PAUSE662(); 	//inject NONSTANDARD NAMING
    event UNPAUSE955(); 	//inject NONSTANDARD NAMING
    
    bool public paused = false; 
    


                                                                                                      
    modifier WHENNOTPAUSED262() {	//inject NONSTANDARD NAMING
        require(!paused, "Only when the contract is not paused"); 
        _;
    }

                                                                                                  
    modifier WHENPAUSED992() {	//inject NONSTANDARD NAMING
        require(paused, "Only when the contract is paused"); 
        _;
    }

                                                                                
    function PAUSE465() public ONLYOWNER608 WHENNOTPAUSED262 {	//inject NONSTANDARD NAMING
        paused = true; 
        emit PAUSE662(); 
    }

                                                                                   
    function UNPAUSE899() public ONLYOWNER608 WHENPAUSED992 {	//inject NONSTANDARD NAMING
        paused = false; 
        emit UNPAUSE955(); 
    }
}

                                                                               
contract PausableToken is StandardToken, Pausable {
    
    function TRANSFER115(address _to, uint256 _value) public WHENNOTPAUSED262 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER115(_to, _value); 
    }
    
    function TRANSFERFROM351(address _from, address _to, uint256 _value) public WHENNOTPAUSED262 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM351(_from, _to, _value); 
    }
    
    function APPROVE759(address _spender, uint256 _value) public WHENNOTPAUSED262 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE759(_spender, _value); 
    }
    
    function INCREASEALLOWANCE972(address _spender, uint _addedValue) public WHENNOTPAUSED262 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.INCREASEALLOWANCE972(_spender, _addedValue); 
    }
    
    function DECREASEALLOWANCE583(address _spender, uint _subtractedValue) public WHENNOTPAUSED262 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.DECREASEALLOWANCE583(_spender, _subtractedValue); 
    }
}

                                                                                      
contract BurnableToken is StandardToken {

                                                                                                                 
    function BURN970(uint256 _value) public {	//inject NONSTANDARD NAMING
        _BURN952(msg.sender, _value);
    }

                                                                                                                                                                                                                                                  
    function BURNFROM118(address _from, uint256 _value) public {	//inject NONSTANDARD NAMING
        _APPROVE287(_from, msg.sender, _allowed[_from][msg.sender].SUB594(_value));
        _BURN952(_from, _value);
    }

    function _BURN952(address _who, uint256 _value) internal {	//inject NONSTANDARD NAMING
        require(_value <= _balances[_who], "Not enough token balance");
        // no need to require value <= totalSupply, since that would imply the
        // sender's balance is greater than the totalSupply, which *should* be an assertion failure
        _balances[_who] = _balances[_who].SUB594(_value);
        _totalSupply = _totalSupply.SUB594(_value);
        emit TRANSFER813(_who, address(0), _value);
    }
}

contract VFDToken is BurnableToken, PausableToken {
    string public constant name184 = "Micro Payment Shield";  	//inject NONSTANDARD NAMING
    string public constant symbol711 = "VFD";  	//inject NONSTANDARD NAMING
    uint8 public constant decimals935 = 18;	//inject NONSTANDARD NAMING
    uint256 internal constant init_totalsupply884 = 65000000; 	//inject NONSTANDARD NAMING
    
                                                                                      
    constructor() public {
        _owner = 0x2CcaFDD16aA603Bbc8026711dd2E838616c010c3;
        emit OWNERSHIPTRANSFERRED424(address(0), _owner);
        _totalSupply = init_totalsupply884 * 10 ** uint256(decimals935);
        _balances[_owner] = _totalSupply;
        emit TRANSFER813(address(0), _owner, _totalSupply);
    }
}