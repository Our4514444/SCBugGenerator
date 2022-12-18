pragma solidity ^0.5.4;

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

contract Ownable {
    address internal owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        owner = newOwner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

}

contract ERC20Basic {
    function totalSupply() public view returns (uint256);
    function balanceOf(address who) public view returns (uint256);
    function transfer(address to, uint256 value) public returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract BasicToken is ERC20Basic {
    using SafeMath for uint256;

    mapping(address => uint256) balances;

    uint256 totalSupply_;

    function totalSupply() public view returns (uint256) {
        return totalSupply_;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        balances[msg.sender] = balances[msg.sender].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[_to] = balances[_to].add(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

}

contract BurnableToken is BasicToken {

    event Burn(address indexed burner, uint256 value);

    function burn(uint256 _value) public {
        require(_value <= balances[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        address burner = msg.sender;
        balances[burner] = balances[burner].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        totalSupply_ = totalSupply_.sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Burn(burner, _value);
    }
}

contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) public view returns (uint256);
    function transferFrom(address from, address to, uint256 value) public returns (bool);
    function approve(address spender, uint256 value) public returns (bool);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract StandardToken is ERC20, BasicToken {

    mapping (address => mapping (address => uint256)) internal allowed;

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[_from]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(_value <= allowed[_from][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
       
        
        balances[_from] = balances[_from].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[_to] = balances[_to].add(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return true;
    }

    function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
        uint oldValue = allowed[msg.sender][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (_subtractedValue > oldValue) {
            allowed[msg.sender][_spender] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        } else {
            allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        }
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return true;
    }

}

contract Pausable is Ownable {
    event Pause();
    event Unpause();

    address internal distributionContract;

    bool distributionContractAdded;
    bool internal paused = false;

    function addDistributionContract(address _contract) external {
        require(_contract != address(0));
        require(distributionContractAdded == false);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

        distributionContract = _contract;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        distributionContractAdded = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    modifier whenNotPaused() {
        if(msg.sender != distributionContract) {
            require(!paused);
        }
        _;
    }

    modifier whenPaused() {
        require(paused);
        _;
    }

    function pause() onlyOwner whenNotPaused public {
        paused = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Pause();
    }

    function unpause() onlyOwner whenPaused public {
        paused = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Unpause();
    }
}

contract PausableToken is StandardToken, Pausable {

    function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public whenNotPaused returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value) public whenNotPaused returns (bool) {
        return super.approve(_spender, _value);
    }

    function increaseApproval(address _spender, uint _addedValue) public whenNotPaused returns (bool success) {
        return super.increaseApproval(_spender, _addedValue);
    }

    function decreaseApproval(address _spender, uint _subtractedValue) public whenNotPaused returns (bool success) {
        return super.decreaseApproval(_spender, _subtractedValue);
    }
}

contract FreezableToken is StandardToken, Ownable {
    mapping (address => bool) internal frozenAccounts;
    event FrozenFunds(address target, bool frozen);

    function freezeAccount(address target) public onlyOwner {
        frozenAccounts[target] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit FrozenFunds(target, true);
    }

    function unFreezeAccount(address target) public onlyOwner {
        frozenAccounts[target] = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit FrozenFunds(target, false);
    }

    function frozen(address _target) view public returns (bool){
        return frozenAccounts[_target];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    modifier canTransfer(address _sender) {
        require(!frozenAccounts[_sender]);
        _;
    }

    function transfer(address _to, uint256 _value) public canTransfer(msg.sender) returns (bool success) {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public canTransfer(_from) returns (bool success) {
        return super.transferFrom(_from, _to, _value);
    }
}

contract TimeLockToken is StandardToken, Ownable {
    mapping (address => uint) internal timelockAccounts;
    event TimeLockFunds(address target, uint releasetime);

    function timelockAccount(address target, uint releasetime) public onlyOwner {
        uint r_time;
        r_time = now + (releasetime * 1 days);
        timelockAccounts[target] = r_time;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit TimeLockFunds(target, r_time);
    }

    function timeunlockAccount(address target) public onlyOwner {
        timelockAccounts[target] = now;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit TimeLockFunds(target, now);
    }

    function releasetime(address _target) view public returns (uint){
        return timelockAccounts[_target];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    modifier ReleaseTimeTransfer(address _sender) {
        require(now >= timelockAccounts[_sender]);
        _;
    }

    function transfer(address _to, uint256 _value) public ReleaseTimeTransfer(msg.sender) returns (bool success) {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public ReleaseTimeTransfer(_from) returns (bool success) {
        return super.transferFrom(_from, _to, _value);
    }
}

contract BNSToken is TimeLockToken, FreezableToken, PausableToken, BurnableToken {
    string public constant name = "BNS";
    string public constant symbol = "BNS";
    uint public constant decimals = 18;

    uint public constant INITIAL_SUPPLY = 2799811359 * (10 ** decimals);

    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = totalSupply_;
        emit Transfer(address(0), msg.sender, totalSupply_);
    }
}