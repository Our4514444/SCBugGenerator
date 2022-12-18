pragma solidity ^0.5.4;

library SafeMath {
    function MUL940(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function DIV617(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function SUB403(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        assert(b <= a);
        return a - b;
    }

    function ADD403(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Ownable {
    address public owner;

    event OWNERSHIPTRANSFERRED24(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

    constructor() public {
        owner = msg.sender;
    }

    modifier ONLYOWNER495() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        _;
    }

    function TRANSFEROWNERSHIP781(address newOwner) public ONLYOWNER495 {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED24(owner, newOwner);
        owner = newOwner;
    }

}

contract ERC20Basic {
    function TOTALSUPPLY286() public view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF101(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER803(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER15(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

contract BasicToken is ERC20Basic {
    using SafeMath for uint256;

    mapping(address => uint256) balances;

    uint256 totalSupply_;

    function TOTALSUPPLY286() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return totalSupply_;
    }

    function TRANSFER803(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].SUB403(_value);
        balances[_to] = balances[_to].ADD403(_value);
        emit TRANSFER15(msg.sender, _to, _value);
        return true;
    }

    function BALANCEOF101(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        return balances[_owner];
    }

}

contract BurnableToken is BasicToken {

    event BURN896(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

    function BURN43(uint256 _value) public {	//inject NONSTANDARD NAMING
        require(_value <= balances[msg.sender]);

        address burner = msg.sender;
        balances[burner] = balances[burner].SUB403(_value);
        totalSupply_ = totalSupply_.SUB403(_value);
        emit BURN896(burner, _value);
    }
}

contract ERC20 is ERC20Basic {
    function ALLOWANCE868(address owner, address spender) public view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFERFROM451(address from, address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE340(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
    event APPROVAL174(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract StandardToken is ERC20, BasicToken {

    mapping (address => mapping (address => uint256)) internal allowed;

    function TRANSFERFROM451(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);
       
        
        balances[_from] = balances[_from].SUB403(_value);
        balances[_to] = balances[_to].ADD403(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB403(_value);
        emit TRANSFER15(_from, _to, _value);
        return true;
    }

    function APPROVE340(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = _value;
        emit APPROVAL174(msg.sender, _spender, _value);
        return true;
    }

    function ALLOWANCE868(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return allowed[_owner][_spender];
    }

    function INCREASEAPPROVAL42(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].ADD403(_addedValue);
        emit APPROVAL174(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

    function DECREASEAPPROVAL767(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint oldValue = allowed[msg.sender][_spender];
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = oldValue.SUB403(_subtractedValue);
        }
        emit APPROVAL174(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }

}

contract Pausable is Ownable {
    event PAUSE302();	//inject NONSTANDARD NAMING
    event UNPAUSE50();	//inject NONSTANDARD NAMING

    address public distributionContract;

    bool distributionContractAdded;
    bool public paused = false;

    function ADDDISTRIBUTIONCONTRACT175(address _contract) external {	//inject NONSTANDARD NAMING
        require(_contract != address(0));
        require(distributionContractAdded == false);

        distributionContract = _contract;
        distributionContractAdded = true;
    }

    modifier WHENNOTPAUSED313() {	//inject NONSTANDARD NAMING
        if(msg.sender != distributionContract) {
            require(!paused);
        }
        _;
    }

    modifier WHENPAUSED544() {	//inject NONSTANDARD NAMING
        require(paused);
        _;
    }

    function PAUSE574() ONLYOWNER495 WHENNOTPAUSED313 public {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE302();
    }

    function UNPAUSE380() ONLYOWNER495 WHENPAUSED544 public {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE50();
    }
}

contract PausableToken is StandardToken, Pausable {

    function TRANSFER803(address _to, uint256 _value) public WHENNOTPAUSED313 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFER803(_to, _value);
    }

    function TRANSFERFROM451(address _from, address _to, uint256 _value) public WHENNOTPAUSED313 returns (bool) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM451(_from, _to, _value);
    }

    function APPROVE340(address _spender, uint256 _value) public WHENNOTPAUSED313 returns (bool) {	//inject NONSTANDARD NAMING
        return super.APPROVE340(_spender, _value);
    }

    function INCREASEAPPROVAL42(address _spender, uint _addedValue) public WHENNOTPAUSED313 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.INCREASEAPPROVAL42(_spender, _addedValue);
    }

    function DECREASEAPPROVAL767(address _spender, uint _subtractedValue) public WHENNOTPAUSED313 returns (bool success) {	//inject NONSTANDARD NAMING
        return super.DECREASEAPPROVAL767(_spender, _subtractedValue);
    }
}

contract FreezableToken is StandardToken, Ownable {
    mapping (address => bool) public frozenAccounts;
    event FROZENFUNDS921(address target, bool frozen);	//inject NONSTANDARD NAMING

    function FREEZEACCOUNT440(address target) public ONLYOWNER495 {	//inject NONSTANDARD NAMING
        frozenAccounts[target] = true;
        emit FROZENFUNDS921(target, true);
    }

    function UNFREEZEACCOUNT654(address target) public ONLYOWNER495 {	//inject NONSTANDARD NAMING
        frozenAccounts[target] = false;
        emit FROZENFUNDS921(target, false);
    }

    function FROZEN103(address _target) view public returns (bool){	//inject NONSTANDARD NAMING
        return frozenAccounts[_target];
    }

    modifier CANTRANSFER481(address _sender) {	//inject NONSTANDARD NAMING
        require(!frozenAccounts[_sender]);
        _;
    }

    function TRANSFER803(address _to, uint256 _value) public CANTRANSFER481(msg.sender) returns (bool success) {	//inject NONSTANDARD NAMING
        return super.TRANSFER803(_to, _value);
    }

    function TRANSFERFROM451(address _from, address _to, uint256 _value) public CANTRANSFER481(_from) returns (bool success) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM451(_from, _to, _value);
    }
}

contract TimeLockToken is StandardToken, Ownable {
    mapping (address => uint) public timelockAccounts;
    event TIMELOCKFUNDS474(address target, uint releasetime);	//inject NONSTANDARD NAMING

    function TIMELOCKACCOUNT118(address target, uint releasetime) public ONLYOWNER495 {	//inject NONSTANDARD NAMING
        uint r_time;
        r_time = now + (releasetime * 1 days);
        timelockAccounts[target] = r_time;
        emit TIMELOCKFUNDS474(target, r_time);
    }

    function TIMEUNLOCKACCOUNT487(address target) public ONLYOWNER495 {	//inject NONSTANDARD NAMING
        timelockAccounts[target] = now;
        emit TIMELOCKFUNDS474(target, now);
    }

    function RELEASETIME155(address _target) view public returns (uint){	//inject NONSTANDARD NAMING
        return timelockAccounts[_target];
    }

    modifier RELEASETIMETRANSFER349(address _sender) {	//inject NONSTANDARD NAMING
        require(now >= timelockAccounts[_sender]);
        _;
    }

    function TRANSFER803(address _to, uint256 _value) public RELEASETIMETRANSFER349(msg.sender) returns (bool success) {	//inject NONSTANDARD NAMING
        return super.TRANSFER803(_to, _value);
    }

    function TRANSFERFROM451(address _from, address _to, uint256 _value) public RELEASETIMETRANSFER349(_from) returns (bool success) {	//inject NONSTANDARD NAMING
        return super.TRANSFERFROM451(_from, _to, _value);
    }
}

contract BNSToken is TimeLockToken, FreezableToken, PausableToken, BurnableToken {
    string public constant name324 = "BNS";	//inject NONSTANDARD NAMING
    string public constant symbol7 = "BNS";	//inject NONSTANDARD NAMING
    uint public constant decimals612 = 18;	//inject NONSTANDARD NAMING

    uint public constant initial_supply752 = 2799811359 * (10 ** decimals612);	//inject NONSTANDARD NAMING

    constructor() public {
        totalSupply_ = initial_supply752;
        balances[msg.sender] = totalSupply_;
        emit TRANSFER15(address(0), msg.sender, totalSupply_);
    }
}