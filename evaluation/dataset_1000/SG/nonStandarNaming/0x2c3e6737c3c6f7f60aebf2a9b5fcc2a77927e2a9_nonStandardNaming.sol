                                                                 

                                                                 

pragma solidity ^0.5.12;

                                                                                         
library SafeMath {
    function MUL889(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV74(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB612(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD241(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

                                                                                                                                                                                             
contract Ownable {
    address public owner;

                                                                                                                              
    constructor() public {
        owner = msg.sender;
    }

                                                                                   
    modifier ONLYOWNER622() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

                                                                                                                                                                 
    function TRANSFEROWNERSHIP847(address newOwner) public ONLYOWNER622 {	//inject NONSTANDARD NAMING
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }

}

                                                                                                                              
contract ERC20Basic {
    uint public _totalSupply;
    function TOTALSUPPLY216() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF475(address who) public view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER136(address to, uint value) public;	//inject NONSTANDARD NAMING
    event TRANSFER934(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
}

                                                                                        
contract ERC20 is ERC20Basic {
    function ALLOWANCE906(address owner, address spender) public view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFERFROM505(address from, address to, uint value) public;	//inject NONSTANDARD NAMING
    function APPROVE6(address spender, uint value) public;	//inject NONSTANDARD NAMING
    event APPROVAL746(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

                                                                                         
contract BasicToken is Ownable, ERC20Basic {
    using SafeMath for uint;

    mapping(address => uint) public balances;

    // additional variables for use if transaction fees ever became necessary
    uint public maximumFee = 0;

                                                                 
    modifier ONLYPAYLOADSIZE851(uint size) {	//inject NONSTANDARD NAMING
        require(!(msg.data.length < size + 4));
        _;
    }

                                                                                                                                                               
    function TRANSFER136(address _to, uint _value) public ONLYPAYLOADSIZE851(2 * 32) {	//inject NONSTANDARD NAMING
        balances[msg.sender] = balances[msg.sender].SUB612(_value);
        balances[_to] = balances[_to].ADD241(_value);
        emit TRANSFER934(msg.sender, _to, _value);
    }

                                                                                                                                                                                                            
    function BALANCEOF475(address _owner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

}

                                                                                                                                                                                                                                                                         
contract StandardToken is BasicToken, ERC20 {

    mapping (address => mapping (address => uint)) public allowed;

    uint public MAX_UINT = 2**256 - 1;

                                                                                                                                                                                                                                                                                  
    function TRANSFERFROM505(address _from, address _to, uint _value) public ONLYPAYLOADSIZE851(3 * 32) {	//inject NONSTANDARD NAMING
        uint256 _allowance = allowed[_from][msg.sender];

        // Check is not needed because sub(_allowance, _value) will already throw if this condition is not met
        // if (_value > _allowance) throw;
        if (_allowance < MAX_UINT) {
            allowed[_from][msg.sender] = _allowance.SUB612(_value);
        }

        balances[_from] = balances[_from].SUB612(_value);
        balances[_to] = balances[_to].ADD241(_value);

        emit TRANSFER934(_from, _to, _value);
    }

                                                                                                                                                                                                                                         
    function APPROVE6(address _spender, uint _value) public ONLYPAYLOADSIZE851(2 * 32) {	//inject NONSTANDARD NAMING

        // To change the approve amount you first have to reduce the addresses`
        //  allowance to zero by calling `approve(_spender, 0)` if it is not
        //  already 0 to mitigate the race condition described here:
        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        require(!((_value != 0) && (allowed[msg.sender][_spender] != 0)));

        allowed[msg.sender][_spender] = _value;
        emit APPROVAL746(msg.sender, _spender, _value);
    }

                                                                                                                                                                                                                                                                                                                              
    function ALLOWANCE906(address _owner, address _spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

}


                                                                                                                
contract Pausable is Ownable {
    event PAUSE624();	//inject NONSTANDARD NAMING
    event UNPAUSE954();	//inject NONSTANDARD NAMING

    bool public paused = false;


                                                                                                      
    modifier WHENNOTPAUSED709() {	//inject NONSTANDARD NAMING
        require(!paused);
        _;
    }

                                                                                                  
    modifier WHENPAUSED351() {	//inject NONSTANDARD NAMING
        require(paused);
        _;
    }

                                                                                
    function PAUSE900() ONLYOWNER622 WHENNOTPAUSED709 public {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE624();
    }

                                                                                   
    function UNPAUSE620() ONLYOWNER622 WHENPAUSED351 public {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE954();
    }
}

contract BlackList is Ownable, BasicToken {

                                                                                                                   
    function GETBLACKLISTSTATUS334(address _maker) external view returns (bool) {	//inject NONSTANDARD NAMING
        return isBlackListed[_maker];
    }

    function GETOWNER263() external view returns (address) {	//inject NONSTANDARD NAMING
        return owner;
    }

    mapping (address => bool) public isBlackListed;

    function ADDBLACKLIST14 (address _evilUser) public ONLYOWNER622 {	//inject NONSTANDARD NAMING
        isBlackListed[_evilUser] = true;
        emit ADDEDBLACKLIST924(_evilUser);
    }

    function REMOVEBLACKLIST954 (address _clearedUser) public ONLYOWNER622 {	//inject NONSTANDARD NAMING
        isBlackListed[_clearedUser] = false;
        emit REMOVEDBLACKLIST387(_clearedUser);
    }

    function DESTROYBLACKFUNDS575 (address _blackListedUser) public ONLYOWNER622 {	//inject NONSTANDARD NAMING
        require(isBlackListed[_blackListedUser]);
        uint dirtyFunds = BALANCEOF475(_blackListedUser);
        balances[_blackListedUser] = 0;
        _totalSupply -= dirtyFunds;
        emit DESTROYEDBLACKFUNDS180(_blackListedUser, dirtyFunds);
    }

    event DESTROYEDBLACKFUNDS180(address _blackListedUser, uint _balance);	//inject NONSTANDARD NAMING

    event ADDEDBLACKLIST924(address _user);	//inject NONSTANDARD NAMING

    event REMOVEDBLACKLIST387(address _user);	//inject NONSTANDARD NAMING

}

contract UpgradedStandardToken is StandardToken{
    // those methods are called by the legacy contract
    // and they must ensure msg.sender to be the contract address
    function TRANSFERBYLEGACY286(address from, address to, uint value) public;	//inject NONSTANDARD NAMING
    function TRANSFERFROMBYLEGACY361(address sender, address from, address spender, uint value) public;	//inject NONSTANDARD NAMING
    function APPROVEBYLEGACY927(address from, address spender, uint value) public;	//inject NONSTANDARD NAMING
}

contract ERCToken is Pausable, StandardToken, BlackList {

    string public name;
    string public symbol;
    uint public decimals;
    address public upgradedAddress;
    bool public deprecated;

    //  The contract can be initialized with a number of tokens
    //  All the tokens are deposited to the owner address
    //
    // @param _balance Initial supply of the contract
    // @param _name Token Name
    // @param _symbol Token symbol
    // @param _decimals Token decimals
    constructor(uint _initialSupply, string memory _name, string memory _symbol, uint _decimals) public {
        _totalSupply = _initialSupply;
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        balances[owner] = _initialSupply;
        deprecated = false;
    }

    // Forward ERC20 methods to upgraded contract if this one is deprecated
    function TRANSFER136(address _to, uint _value) public WHENNOTPAUSED709 {	//inject NONSTANDARD NAMING
        require(!isBlackListed[msg.sender]);
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).TRANSFERBYLEGACY286(msg.sender, _to, _value);
        } else {
            return super.TRANSFER136(_to, _value);
        }
    }

    // Forward ERC20 methods to upgraded contract if this one is deprecated
    function TRANSFERFROM505(address _from, address _to, uint _value) public WHENNOTPAUSED709 {	//inject NONSTANDARD NAMING
        require(!isBlackListed[_from]);
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).TRANSFERFROMBYLEGACY361(msg.sender, _from, _to, _value);
        } else {
            return super.TRANSFERFROM505(_from, _to, _value);
        }
    }

    // Forward ERC20 methods to upgraded contract if this one is deprecated
    function BALANCEOF475(address who) public view returns (uint) {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).BALANCEOF475(who);
        } else {
            return super.BALANCEOF475(who);
        }
    }

    // Forward ERC20 methods to upgraded contract if this one is deprecated
    function APPROVE6(address _spender, uint _value) public ONLYPAYLOADSIZE851(2 * 32) {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).APPROVEBYLEGACY927(msg.sender, _spender, _value);
        } else {
            return super.APPROVE6(_spender, _value);
        }
    }

    // Forward ERC20 methods to upgraded contract if this one is deprecated
    function ALLOWANCE906(address _owner, address _spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return StandardToken(upgradedAddress).ALLOWANCE906(_owner, _spender);
        } else {
            return super.ALLOWANCE906(_owner, _spender);
        }
    }

    // deprecate current contract in favour of a new one
    function DEPRECATE118(address _upgradedAddress) public ONLYOWNER622 {	//inject NONSTANDARD NAMING
        deprecated = true;
        upgradedAddress = _upgradedAddress;
        emit DEPRECATE753(_upgradedAddress);
    }

    // deprecate current contract if favour of a new one
    function TOTALSUPPLY216() public view returns (uint) {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return StandardToken(upgradedAddress).TOTALSUPPLY216();
        } else {
            return _totalSupply;
        }
    }

    // Issue a new amount of tokens
    // these tokens are deposited into the owner address
    //
    // @param _amount Number of tokens to be issued
    function ISSUE527(uint amount) public ONLYOWNER622 {	//inject NONSTANDARD NAMING
        require(_totalSupply + amount > _totalSupply);
        require(balances[owner] + amount > balances[owner]);

        balances[owner] += amount;
        _totalSupply += amount;
        emit ISSUE651(amount);
    }

    // Redeem tokens.
    // These tokens are withdrawn from the owner address
    // if the balance must be enough to cover the redeem
    // or the call will fail.
    // @param _amount Number of tokens to be issued
    function REDEEM347(uint amount) public ONLYOWNER622 {	//inject NONSTANDARD NAMING
        require(_totalSupply >= amount);
        require(balances[owner] >= amount);

        _totalSupply -= amount;
        balances[owner] -= amount;
        emit REDEEM801(amount);
    }

    // Called when new token are issued
    event ISSUE651(uint amount);	//inject NONSTANDARD NAMING

    // Called when tokens are redeemed
    event REDEEM801(uint amount);	//inject NONSTANDARD NAMING

    // Called when contract is deprecated
    event DEPRECATE753(address newAddress);	//inject NONSTANDARD NAMING

}