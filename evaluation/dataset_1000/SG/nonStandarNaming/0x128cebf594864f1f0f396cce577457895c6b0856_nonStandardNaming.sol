                                                                 

pragma solidity 0.5.11;

library SafeMath {
    function MUL682(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV451(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        return c;
    }

    function SUB309(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD905(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Ownable {
    address public owner;
    address public owner2;

    constructor() public {
      owner = msg.sender;
    }

    modifier ONLYOWNER297() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == owner2);
        _;
    }

    function TRANSFEROWNERSHIP591(address newOwner) public {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }

    function SETOWNER2716(address newOwner) public ONLYOWNER297 {	//inject NONSTANDARD NAMING
        owner2 = newOwner;
    }
}

contract ERC20Basic {
    uint public _totalSupply;
    function TOTALSUPPLY515() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF193(address who) public view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER52(address to, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    event TRANSFER621(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
}

contract ERC20 is ERC20Basic {
    function ALLOWANCE132(address owner, address spender) public view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFERFROM247(address from, address to, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE333(address spender, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    event APPROVAL994(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract ITokenRecipient {
    function TOKENFALLBACK110(address _from, uint _value) public;	//inject NONSTANDARD NAMING
}

contract BasicToken is Ownable, ERC20Basic {
    using SafeMath for uint;

    mapping(address => uint) public balances;

    uint public basisPointsRate = 0;
    uint public maximumFee = 0;

    modifier ONLYPAYLOADSIZE823(uint size) {	//inject NONSTANDARD NAMING
        require(!(msg.data.length < size + 4));
        _;
    }

    function TRANSFER52(address _to, uint _value) public ONLYPAYLOADSIZE823(2 * 32) returns (bool success) {	//inject NONSTANDARD NAMING
        uint fee = (_value.MUL682(basisPointsRate)).DIV451(10000);
        if (fee > maximumFee) {
            fee = maximumFee;
        }
        uint sendAmount = _value.SUB309(fee);
        balances[msg.sender] = balances[msg.sender].SUB309(_value);
        balances[_to] = balances[_to].ADD905(sendAmount);
        if (fee > 0) {
            balances[owner] = balances[owner].ADD905(fee);
            emit TRANSFER621(msg.sender, owner, fee);
        }
        if(ISCONTRACT980(_to)) {
            ITokenRecipient receiver = ITokenRecipient(_to);
            receiver.TOKENFALLBACK110(msg.sender, sendAmount);
        }
        emit TRANSFER621(msg.sender, _to, sendAmount);
        return true;
    }

    function ISCONTRACT980(address _address) private view returns (bool) {	//inject NONSTANDARD NAMING
        uint length;
        assembly { length := extcodesize(_address) }
        return (length > 0);
    }

    function BALANCEOF193(address _owner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }
}

contract StandardToken is BasicToken, ERC20 {

    mapping (address => mapping (address => uint)) public allowed;

    uint public constant max_uint110 = 2**256 - 1;	//inject NONSTANDARD NAMING

    function TRANSFERFROM247(address _from, address _to, uint _value) public ONLYPAYLOADSIZE823(3 * 32) returns (bool success) {	//inject NONSTANDARD NAMING
        uint _allowance = allowed[_from][msg.sender];

        uint fee = (_value.MUL682(basisPointsRate)).DIV451(10000);
        if (fee > maximumFee) {
            fee = maximumFee;
        }
        if (_allowance < max_uint110) {
            allowed[_from][msg.sender] = _allowance.SUB309(_value);
        }
        uint sendAmount = _value.SUB309(fee);
        balances[_from] = balances[_from].SUB309(_value);
        balances[_to] = balances[_to].ADD905(sendAmount);
        if (fee > 0) {
            balances[owner] = balances[owner].ADD905(fee);
            emit TRANSFER621(_from, owner, fee);
        }
        emit TRANSFER621(_from, _to, sendAmount);
        return true;
    }

    function APPROVE333(address _spender, uint _value) public ONLYPAYLOADSIZE823(2 * 32) returns (bool success) {	//inject NONSTANDARD NAMING
        require(!((_value != 0) && (allowed[msg.sender][_spender] != 0)));

        allowed[msg.sender][_spender] = _value;
        emit APPROVAL994(msg.sender, _spender, _value);
        return true;
    }

    function ALLOWANCE132(address _owner, address _spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }
}

contract Pausable is Ownable {
  event PAUSE120();	//inject NONSTANDARD NAMING
  event UNPAUSE997();	//inject NONSTANDARD NAMING

  bool public paused = false;

  modifier WHENNOTPAUSED425() {	//inject NONSTANDARD NAMING
    require(!paused);
    _;
  }

  modifier WHENPAUSED899() {	//inject NONSTANDARD NAMING
    require(paused);
    _;
  }

  function PAUSE25() ONLYOWNER297 WHENNOTPAUSED425 public {	//inject NONSTANDARD NAMING
    paused = true;
    emit PAUSE120();
  }

  function UNPAUSE772() ONLYOWNER297 WHENPAUSED899 public {	//inject NONSTANDARD NAMING
    paused = false;
    emit UNPAUSE997();
  }
}

contract BlackList is Ownable, BasicToken {
    function GETBLACKLISTSTATUS560(address _maker) external view returns (bool) {	//inject NONSTANDARD NAMING
        return isBlackListed[_maker];
    }

    function GETOWNER257() external view returns (address) {	//inject NONSTANDARD NAMING
        return owner;
    }

    mapping (address => bool) public isBlackListed;
    
    function ADDBLACKLIST121 (address _evilUser) public ONLYOWNER297 {	//inject NONSTANDARD NAMING
        isBlackListed[_evilUser] = true;
        emit ADDEDBLACKLIST462(_evilUser);
    }

    function REMOVEBLACKLIST514 (address _clearedUser) public ONLYOWNER297 {	//inject NONSTANDARD NAMING
        isBlackListed[_clearedUser] = false;
        emit REMOVEDBLACKLIST862(_clearedUser);
    }

    function DESTROYBLACKFUNDS689 (address _blackListedUser) public ONLYOWNER297 {	//inject NONSTANDARD NAMING
        require(isBlackListed[_blackListedUser]);
        uint dirtyFunds = BALANCEOF193(_blackListedUser);
        balances[_blackListedUser] = 0;
        _totalSupply -= dirtyFunds;
        emit DESTROYEDBLACKFUNDS711(_blackListedUser, dirtyFunds);
    }

    event DESTROYEDBLACKFUNDS711(address _blackListedUser, uint _balance);	//inject NONSTANDARD NAMING

    event ADDEDBLACKLIST462(address _user);	//inject NONSTANDARD NAMING

    event REMOVEDBLACKLIST862(address _user);	//inject NONSTANDARD NAMING
}

contract UpgradedStandardToken is StandardToken{
    function TRANSFERBYLEGACY175(address from, address to, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROMBYLEGACY154(address sender, address from, address spender, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVEBYLEGACY342(address from, address spender, uint value) public returns (bool success) ;	//inject NONSTANDARD NAMING
}

contract InternationalMonetaryDigital is Pausable, StandardToken, BlackList {
    string public name = "International Monetary Digital";
    string public symbol = "IMD";
    uint public decimals = 18;
    address public upgradedAddress;
    bool public deprecated = false;

    constructor() public {
        _totalSupply = 100000000000000000000000000;
        balances[owner] = _totalSupply;
    }
    
    function TRANSFER52(address _to, uint _value) public WHENNOTPAUSED425 returns (bool success) {	//inject NONSTANDARD NAMING
        require(!isBlackListed[msg.sender]);
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).TRANSFERBYLEGACY175(msg.sender, _to, _value);
        } else {
            return super.TRANSFER52(_to, _value);
        }
    }

    function TRANSFERFROM247(address _from, address _to, uint _value) public WHENNOTPAUSED425 returns (bool success) {	//inject NONSTANDARD NAMING
        require(!isBlackListed[_from]);
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).TRANSFERFROMBYLEGACY154(msg.sender, _from, _to, _value);
        } else {
            return super.TRANSFERFROM247(_from, _to, _value);
        }
    }

    function BALANCEOF193(address who) public view returns (uint) {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).BALANCEOF193(who);
        } else {
            return super.BALANCEOF193(who);
        }
    }

    function APPROVE333(address _spender, uint _value) public ONLYPAYLOADSIZE823(2 * 32) returns (bool success)  {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).APPROVEBYLEGACY342(msg.sender, _spender, _value);
        } else {
            return super.APPROVE333(_spender, _value);
        }
    }

    function ALLOWANCE132(address _owner, address _spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return StandardToken(upgradedAddress).ALLOWANCE132(_owner, _spender);
        } else {
            return super.ALLOWANCE132(_owner, _spender);
        }
    }

    function DEPRECATE41(address _upgradedAddress) public ONLYOWNER297 returns (bool success) {	//inject NONSTANDARD NAMING
        deprecated = true;
        upgradedAddress = _upgradedAddress;
        emit DEPRECATE339(_upgradedAddress);
        return true;
    }

    function TOTALSUPPLY515() public view returns (uint) {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return StandardToken(upgradedAddress).TOTALSUPPLY515();
        } else {
            return _totalSupply;
        }
    }

    function ISSUE278(uint amount) public ONLYOWNER297 returns (bool success) {	//inject NONSTANDARD NAMING
        require(_totalSupply + amount > _totalSupply);
        require(balances[owner] + amount > balances[owner]);

        balances[owner] += amount;
        _totalSupply += amount;
        emit ISSUE334(amount);
        return true;
    }

    function REDEEM331(uint amount) public ONLYOWNER297 returns (bool success) {	//inject NONSTANDARD NAMING
        require(_totalSupply >= amount);
        require(balances[owner] >= amount);

        _totalSupply -= amount;
        balances[owner] -= amount;
        emit REDEEM161(amount);
        return true;
    }

    function SETPARAMS587(uint newBasisPoints, uint newMaxFee) public ONLYOWNER297 {	//inject NONSTANDARD NAMING
        require(newBasisPoints < 20);
        require(newMaxFee < 50);

        basisPointsRate = newBasisPoints;
        maximumFee = newMaxFee.MUL682(10**decimals);

        emit PARAMS1000(basisPointsRate, maximumFee);
    }

    event ISSUE334(uint amount);	//inject NONSTANDARD NAMING

    event REDEEM161(uint amount);	//inject NONSTANDARD NAMING

    event DEPRECATE339(address newAddress);	//inject NONSTANDARD NAMING

    event PARAMS1000(uint feeBasisPoints, uint maxFee);	//inject NONSTANDARD NAMING
}