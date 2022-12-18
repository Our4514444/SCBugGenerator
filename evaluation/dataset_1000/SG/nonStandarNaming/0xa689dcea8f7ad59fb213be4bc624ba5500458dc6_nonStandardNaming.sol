                                                                 

pragma solidity ^0.5.7;

interface IERC20 {
    function TOTALSUPPLY604() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF57(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ALLOWANCE447(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    function TRANSFER35(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE903(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM214(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    event TRANSFER350(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL179(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                    
library SafeMath {
                                                                                    
    function MUL692(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                     
    function DIV302(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                        
    function SUB923(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                              
    function ADD68(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                       
    function MOD762(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

                                                                                                                                                                                             
contract Ownable {
    address public owner;


    event OWNERSHIPTRANSFERRED953(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING


                                                                                                                           
    constructor() public {
        owner = msg.sender;
    }


                                                                                 
    modifier ONLYOWNER608() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }


                                                                                                                                                                    
    function TRANSFEROWNERSHIP931(address newOwner) ONLYOWNER608 public {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED953(owner, newOwner);
        owner = newOwner;
    }

}

                                                                                                                
contract Pausable is Ownable {
    event PAUSE890();	//inject NONSTANDARD NAMING
    event UNPAUSE182();	//inject NONSTANDARD NAMING

    bool public paused = false;


                                                                                                    
    modifier WHENNOTPAUSED232() {	//inject NONSTANDARD NAMING
        require(!paused);
        _;
    }

                                                                                                
    modifier WHENPAUSED529() {	//inject NONSTANDARD NAMING
        require(paused);
        _;
    }

                                                                              
    function PAUSE512() public ONLYOWNER608 WHENNOTPAUSED232 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE890();
    }

                                                                                 
    function UNPAUSE395() public ONLYOWNER608 WHENPAUSED529 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE182();
    }
}

                                                                                                      
contract Blacklistable is Pausable {

    address public blacklister;
    mapping(address => bool) internal blacklisted;

    event BLACKLISTED204(address indexed _account);	//inject NONSTANDARD NAMING
    event UNBLACKLISTED579(address indexed _account);	//inject NONSTANDARD NAMING
    event BLACKLISTERCHANGED3(address indexed newBlacklister);	//inject NONSTANDARD NAMING

    constructor() public {
        blacklister = msg.sender;
    }

                                                                                     
    modifier ONLYBLACKLISTER128() {	//inject NONSTANDARD NAMING
        require(msg.sender == blacklister);
        _;
    }

                                                                                                                
    modifier NOTBLACKLISTED44(address _account) {	//inject NONSTANDARD NAMING
        require(blacklisted[_account] == false);
        _;
    }

                                                                                                       
    function ISBLACKLISTED835(address _account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return blacklisted[_account];
    }

                                                                                                    
    function BLACKLIST406(address _account) public ONLYBLACKLISTER128 {	//inject NONSTANDARD NAMING
        blacklisted[_account] = true;
        emit BLACKLISTED204(_account);
    }

                                                                                                                         
    function UNBLACKLIST822(address _account) public ONLYBLACKLISTER128 {	//inject NONSTANDARD NAMING
        blacklisted[_account] = false;
        emit UNBLACKLISTED579(_account);
    }

    function UPDATEBLACKLISTER12(address _newBlacklister) public ONLYOWNER608 {	//inject NONSTANDARD NAMING
        require(_newBlacklister != address(0));
        blacklister = _newBlacklister;
        emit BLACKLISTERCHANGED3(blacklister);
    }
}


contract StandardToken is IERC20, Pausable, Blacklistable {
    uint256 public totalSupply;

    using SafeMath for uint;

    mapping (address => uint256) internal balances;
    mapping (address => mapping (address => uint256)) internal allowed;

    function BALANCEOF57(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

    function TRANSFERFROM214(address _from, address _to, uint256 _value) WHENNOTPAUSED232 NOTBLACKLISTED44(_to) NOTBLACKLISTED44(msg.sender) NOTBLACKLISTED44(_from) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
        balances[_from] = balances[_from].SUB923(_value);
        balances[_to] = balances[_to].ADD68(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB923(_value);
        emit TRANSFER350(_from, _to, _value);
        return true;
    }

    function APPROVE903(address _spender, uint256 _value) WHENNOTPAUSED232 NOTBLACKLISTED44(msg.sender) NOTBLACKLISTED44(_spender) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL179(msg.sender, _spender, _value);
        return true;
    }

    function ALLOWANCE447(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

    function INCREASEAPPROVAL437(address _spender, uint _addedValue) WHENNOTPAUSED232 NOTBLACKLISTED44(msg.sender) NOTBLACKLISTED44(_spender) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD68(_addedValue);
        emit APPROVAL179(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL147(address _spender, uint _subtractedValue) WHENNOTPAUSED232 NOTBLACKLISTED44(msg.sender) NOTBLACKLISTED44(_spender) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB923(_subtractedValue);
        }
        emit APPROVAL179(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function TRANSFER35(address _to, uint _value) WHENNOTPAUSED232 NOTBLACKLISTED44(msg.sender) NOTBLACKLISTED44(_to) public returns (bool success) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(balances[msg.sender] >= _value);
        balances[msg.sender] = balances[msg.sender].SUB923(_value);
        balances[_to] = balances[_to].ADD68(_value);
        emit TRANSFER350(msg.sender, _to, _value);
        return true;
    }
}

                                                                                                                                                                                                                                                                                                 
contract MintableToken is StandardToken {
    event MINT453(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING
    event MINTFINISHED853();	//inject NONSTANDARD NAMING

    bool public mintingFinished = false;


    modifier CANMINT14() {	//inject NONSTANDARD NAMING
        require(!mintingFinished);
        _;
    }

                                                                                                                                                                                                                                                   
    function MINT545(address _to, uint256 _amount) ONLYOWNER608 CANMINT14 public returns (bool) {	//inject NONSTANDARD NAMING
        totalSupply = totalSupply.ADD68(_amount);
        balances[_to] = balances[_to].ADD68(_amount);
        emit MINT453(_to, _amount);
        emit TRANSFER350(address(0), _to, _amount);
        return true;
    }

                                                                                                                     
    function FINISHMINTING78() ONLYOWNER608 CANMINT14 public returns (bool) {	//inject NONSTANDARD NAMING
        mintingFinished = true;
        emit MINTFINISHED853();
        return true;
    }
}

                                                                                           
contract BurnableToken is MintableToken {

  event BURN139(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                             
  function BURN258(uint256 _value) public {	//inject NONSTANDARD NAMING
    _BURN630(msg.sender, _value);
  }

  function _BURN630(address _who, uint256 _value) internal {	//inject NONSTANDARD NAMING
    require(_value <= balances[_who]);
    // no need to require value <= totalSupply, since that would imply the
    // sender's balance is greater than the totalSupply, which *should* be an assertion failure

    balances[_who] = balances[_who].SUB923(_value);
    totalSupply = totalSupply.SUB923(_value);
    emit BURN139(_who, _value);
    emit TRANSFER350(_who, address(0), _value);
  }
}

contract EBASE is BurnableToken {
    string public constant name808 = "EURBASE Stablecoin V2";	//inject NONSTANDARD NAMING
    string public constant symbol987 = "EBASE";	//inject NONSTANDARD NAMING
    uint8 public constant decimals582 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant initialsupply583 = 1000000 * 10 ** uint256(decimals582);	//inject NONSTANDARD NAMING

    constructor () public {
        totalSupply = initialsupply583;
        balances[msg.sender] = initialsupply583;
    }
}