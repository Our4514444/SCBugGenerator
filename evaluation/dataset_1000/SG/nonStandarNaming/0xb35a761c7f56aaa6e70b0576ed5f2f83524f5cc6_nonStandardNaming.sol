                                                                 

pragma solidity 0.5.11;

library SafeMath {
    function MUL70(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV975(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a / b;
        return c;
    }

    function SUB576(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD698(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

    modifier ONLYOWNER941() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner || msg.sender == owner2);
        _;
    }

    function TRANSFEROWNERSHIP610(address newOwner) public {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }

    function SETOWNER297(address newOwner) public ONLYOWNER941 {	//inject NONSTANDARD NAMING
        owner2 = newOwner;
    }
}

contract ERC20Basic {
    uint public _totalSupply;
    function TOTALSUPPLY414() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF317(address who) public view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER192(address to, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    event TRANSFER982(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
}

contract ERC20 is ERC20Basic {
    function ALLOWANCE682(address owner, address spender) public view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFERFROM318(address from, address to, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE968(address spender, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    event APPROVAL338(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract ITokenRecipient {
    function TOKENFALLBACK305(address _from, uint _value) public;	//inject NONSTANDARD NAMING
}

contract BasicToken is Ownable, ERC20Basic {
    using SafeMath for uint;

    mapping(address => uint) public balances;

    uint public basisPointsRate = 0;
    uint public maximumFee = 0;

    modifier ONLYPAYLOADSIZE444(uint size) {	//inject NONSTANDARD NAMING
        require(!(msg.data.length < size + 4));
        _;
    }

    function TRANSFER192(address _to, uint _value) public ONLYPAYLOADSIZE444(2 * 32) returns (bool success) {	//inject NONSTANDARD NAMING
        uint fee = (_value.MUL70(basisPointsRate)).DIV975(10000);
        if (fee > maximumFee) {
            fee = maximumFee;
        }
        uint sendAmount = _value.SUB576(fee);
        balances[msg.sender] = balances[msg.sender].SUB576(_value);
        balances[_to] = balances[_to].ADD698(sendAmount);
        if (fee > 0) {
            balances[owner] = balances[owner].ADD698(fee);
            emit TRANSFER982(msg.sender, owner, fee);
        }
        if(ISCONTRACT381(_to)) {
            ITokenRecipient receiver = ITokenRecipient(_to);
            receiver.TOKENFALLBACK305(msg.sender, sendAmount);
        }
        emit TRANSFER982(msg.sender, _to, sendAmount);
        return true;
    }

    function ISCONTRACT381(address _address) private view returns (bool) {	//inject NONSTANDARD NAMING
        uint length;
        assembly { length := extcodesize(_address) }
        return (length > 0);
    }

    function BALANCEOF317(address _owner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }
}

contract StandardToken is BasicToken, ERC20 {

    mapping (address => mapping (address => uint)) public allowed;

    uint public constant max_uint481 = 2**256 - 1;	//inject NONSTANDARD NAMING

    function TRANSFERFROM318(address _from, address _to, uint _value) public ONLYPAYLOADSIZE444(3 * 32) returns (bool success) {	//inject NONSTANDARD NAMING
        uint _allowance = allowed[_from][msg.sender];

        uint fee = (_value.MUL70(basisPointsRate)).DIV975(10000);
        if (fee > maximumFee) {
            fee = maximumFee;
        }
        if (_allowance < max_uint481) {
            allowed[_from][msg.sender] = _allowance.SUB576(_value);
        }
        uint sendAmount = _value.SUB576(fee);
        balances[_from] = balances[_from].SUB576(_value);
        balances[_to] = balances[_to].ADD698(sendAmount);
        if (fee > 0) {
            balances[owner] = balances[owner].ADD698(fee);
            emit TRANSFER982(_from, owner, fee);
        }
        emit TRANSFER982(_from, _to, sendAmount);
        return true;
    }

    function APPROVE968(address _spender, uint _value) public ONLYPAYLOADSIZE444(2 * 32) returns (bool success) {	//inject NONSTANDARD NAMING
        require(!((_value != 0) && (allowed[msg.sender][_spender] != 0)));

        allowed[msg.sender][_spender] = _value;
        emit APPROVAL338(msg.sender, _spender, _value);
        return true;
    }

    function ALLOWANCE682(address _owner, address _spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }
}

contract Pausable is Ownable {
  event PAUSE673();	//inject NONSTANDARD NAMING
  event UNPAUSE942();	//inject NONSTANDARD NAMING

  bool public paused = false;

  modifier WHENNOTPAUSED900() {	//inject NONSTANDARD NAMING
    require(!paused);
    _;
  }

  modifier WHENPAUSED422() {	//inject NONSTANDARD NAMING
    require(paused);
    _;
  }

  function PAUSE531() ONLYOWNER941 WHENNOTPAUSED900 public {	//inject NONSTANDARD NAMING
    paused = true;
    emit PAUSE673();
  }

  function UNPAUSE934() ONLYOWNER941 WHENPAUSED422 public {	//inject NONSTANDARD NAMING
    paused = false;
    emit UNPAUSE942();
  }
}

contract BlackList is Ownable, BasicToken {
    function GETBLACKLISTSTATUS466(address _maker) external view returns (bool) {	//inject NONSTANDARD NAMING
        return isBlackListed[_maker];
    }

    function GETOWNER186() external view returns (address) {	//inject NONSTANDARD NAMING
        return owner;
    }

    mapping (address => bool) public isBlackListed;
    
    function ADDBLACKLIST618 (address _evilUser) public ONLYOWNER941 {	//inject NONSTANDARD NAMING
        isBlackListed[_evilUser] = true;
        emit ADDEDBLACKLIST766(_evilUser);
    }

    function REMOVEBLACKLIST853 (address _clearedUser) public ONLYOWNER941 {	//inject NONSTANDARD NAMING
        isBlackListed[_clearedUser] = false;
        emit REMOVEDBLACKLIST71(_clearedUser);
    }

    function DESTROYBLACKFUNDS635 (address _blackListedUser) public ONLYOWNER941 {	//inject NONSTANDARD NAMING
        require(isBlackListed[_blackListedUser]);
        uint dirtyFunds = BALANCEOF317(_blackListedUser);
        balances[_blackListedUser] = 0;
        _totalSupply -= dirtyFunds;
        emit DESTROYEDBLACKFUNDS875(_blackListedUser, dirtyFunds);
    }

    event DESTROYEDBLACKFUNDS875(address _blackListedUser, uint _balance);	//inject NONSTANDARD NAMING

    event ADDEDBLACKLIST766(address _user);	//inject NONSTANDARD NAMING

    event REMOVEDBLACKLIST71(address _user);	//inject NONSTANDARD NAMING
}

contract UpgradedStandardToken is StandardToken{
    function TRANSFERBYLEGACY957(address from, address to, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROMBYLEGACY212(address sender, address from, address spender, uint value) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVEBYLEGACY474(address from, address spender, uint value) public returns (bool success) ;	//inject NONSTANDARD NAMING
}

contract HeliosToken is Pausable, StandardToken, BlackList {
    string public name = "Helios Exchange";
    string public symbol = "HEX";
    uint public decimals = 18;
    address public upgradedAddress;
    bool public deprecated = false;

    constructor() public {
        _totalSupply = 10000000000000000000000000;
        balances[owner] = _totalSupply;
    }

    function TRANSFER192(address _to, uint _value) public WHENNOTPAUSED900 returns (bool success) {	//inject NONSTANDARD NAMING
        require(!isBlackListed[msg.sender]);
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).TRANSFERBYLEGACY957(msg.sender, _to, _value);
        } else {
            return super.TRANSFER192(_to, _value);
        }
    }

    function TRANSFERFROM318(address _from, address _to, uint _value) public WHENNOTPAUSED900 returns (bool success) {	//inject NONSTANDARD NAMING
        require(!isBlackListed[_from]);
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).TRANSFERFROMBYLEGACY212(msg.sender, _from, _to, _value);
        } else {
            return super.TRANSFERFROM318(_from, _to, _value);
        }
    }

    function BALANCEOF317(address who) public view returns (uint) {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).BALANCEOF317(who);
        } else {
            return super.BALANCEOF317(who);
        }
    }

    function APPROVE968(address _spender, uint _value) public ONLYPAYLOADSIZE444(2 * 32) returns (bool success)  {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).APPROVEBYLEGACY474(msg.sender, _spender, _value);
        } else {
            return super.APPROVE968(_spender, _value);
        }
    }

    function ALLOWANCE682(address _owner, address _spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return StandardToken(upgradedAddress).ALLOWANCE682(_owner, _spender);
        } else {
            return super.ALLOWANCE682(_owner, _spender);
        }
    }

    function DEPRECATE781(address _upgradedAddress) public ONLYOWNER941 returns (bool success) {	//inject NONSTANDARD NAMING
        deprecated = true;
        upgradedAddress = _upgradedAddress;
        emit DEPRECATE751(_upgradedAddress);
        return true;
    }

    function TOTALSUPPLY414() public view returns (uint) {	//inject NONSTANDARD NAMING
        if (deprecated) {
            return StandardToken(upgradedAddress).TOTALSUPPLY414();
        } else {
            return _totalSupply;
        }
    }

    function ISSUE147(uint amount) public ONLYOWNER941 returns (bool success) {	//inject NONSTANDARD NAMING
        require(_totalSupply + amount > _totalSupply);
        require(balances[owner] + amount > balances[owner]);

        balances[owner] += amount;
        _totalSupply += amount;
        emit ISSUE793(amount);
        return true;
    }

    function REDEEM542(uint amount) public ONLYOWNER941 returns (bool success) {	//inject NONSTANDARD NAMING
        require(_totalSupply >= amount);
        require(balances[owner] >= amount);

        _totalSupply -= amount;
        balances[owner] -= amount;
        emit REDEEM487(amount);
        return true;
    }

    function SETPARAMS307(uint newBasisPoints, uint newMaxFee) public ONLYOWNER941 {	//inject NONSTANDARD NAMING
        require(newBasisPoints < 20);
        require(newMaxFee < 50);

        basisPointsRate = newBasisPoints;
        maximumFee = newMaxFee.MUL70(10**decimals);

        emit PARAMS606(basisPointsRate, maximumFee);
    }

    event ISSUE793(uint amount);	//inject NONSTANDARD NAMING

    event REDEEM487(uint amount);	//inject NONSTANDARD NAMING

    event DEPRECATE751(address newAddress);	//inject NONSTANDARD NAMING

    event PARAMS606(uint feeBasisPoints, uint maxFee);	//inject NONSTANDARD NAMING
}