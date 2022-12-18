                                                                 

pragma solidity ^0.5.4;
                                               
                                             
                                               

interface IERC20 {
    function TRANSFER773(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE588(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM809(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY460() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF582(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE855(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER990(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL682(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


library SafeMath {

    function MUL959(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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


    function DIV220(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }


    function SUB111(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }


    function ADD634(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }


    function MOD117(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}

// File: node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol


contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) internal _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;


    function TOTALSUPPLY460() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }


    function BALANCEOF582(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }


    function ALLOWANCE855(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }


    function TRANSFER773(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER418(msg.sender, to, value);
        return true;
    }


    function APPROVE588(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL682(msg.sender, spender, value);
        return true;
    }


    function TRANSFERFROM809(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB111(value);
        _TRANSFER418(from, to, value);
        emit APPROVAL682(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }


    function INCREASEALLOWANCE871(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD634(addedValue);
        emit APPROVAL682(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }


    function DECREASEALLOWANCE715(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB111(subtractedValue);
        emit APPROVAL682(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }


    function _TRANSFER418(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB111(value);
        _balances[to] = _balances[to].ADD634(value);
        emit TRANSFER990(from, to, value);
    }


    function _MINT141(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD634(value);
        _balances[account] = _balances[account].ADD634(value);
        emit TRANSFER990(address(0), account, value);
    }


    function _BURN442(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB111(value);
        _balances[account] = _balances[account].SUB111(value);
        emit TRANSFER990(account, address(0), value);
    }


    function _BURNFROM898(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _allowed[account][msg.sender] = _allowed[account][msg.sender].SUB111(value);
        _BURN442(account, value);
        emit APPROVAL682(account, msg.sender, _allowed[account][msg.sender]);
    }
}

// File: contracts\mine.sol

contract SafeLife is ERC20 {
    string public constant name765 = "SafeLife"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    string public constant symbol90 = "SAFE"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    uint8 public constant decimals304 = 18; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    uint256 public constant initialsupply849 = 500000000  * (10 ** uint256(decimals304));	//inject NONSTANDARD NAMING

    constructor() public {
        super._MINT141(msg.sender, initialsupply849);
        owner = msg.sender;
    }

    //ownership
    address public owner;

    event OWNERSHIPRENOUNCED427(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED304(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
    );

    modifier ONLYOWNER609() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Not owner");
        _;
    }


    function RENOUNCEOWNERSHIP751() public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED427(owner);
        owner = address(0);
    }


    function TRANSFEROWNERSHIP699(address _newOwner) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP625(_newOwner);
    }


    function _TRANSFEROWNERSHIP625(address _newOwner) internal {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Already owner");
        emit OWNERSHIPTRANSFERRED304(owner, _newOwner);
        owner = _newOwner;
    }

    //pausable
    event PAUSE288();	//inject NONSTANDARD NAMING
    event UNPAUSE854();	//inject NONSTANDARD NAMING

    bool public paused = false;


    modifier WHENNOTPAUSED930() {	//inject NONSTANDARD NAMING
        require(!paused, "Paused by owner");
        _;
    }


    modifier WHENPAUSED614() {	//inject NONSTANDARD NAMING
        require(paused, "Not paused now");
        _;
    }


    function PAUSE896() public ONLYOWNER609 WHENNOTPAUSED930 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE288();
    }


    function UNPAUSE55() public ONLYOWNER609 WHENPAUSED614 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE854();
    }

    //freezable
    event FROZEN22(address target);	//inject NONSTANDARD NAMING
    event UNFROZEN964(address target);	//inject NONSTANDARD NAMING

    mapping(address => bool) internal freezes;

    modifier WHENNOTFROZEN581() {	//inject NONSTANDARD NAMING
        require(!freezes[msg.sender], "Sender account is locked.");
        _;
    }

    function FREEZE421(address _target) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        freezes[_target] = true;
        emit FROZEN22(_target);
    }

    function UNFREEZE265(address _target) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        freezes[_target] = false;
        emit UNFROZEN964(_target);
    }

    function ISFROZEN419(address _target) public view returns (bool) {	//inject NONSTANDARD NAMING
        return freezes[_target];
    }

    function TRANSFER773(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _value
    )
      public
      WHENNOTFROZEN581
      WHENNOTPAUSED930
      returns (bool)
    {
        RELEASELOCK138(msg.sender);
        return super.TRANSFER773(_to, _value);
    }

    function TRANSFERFROM809(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value
    )
      public
      WHENNOTPAUSED930
      returns (bool)
    {
        require(!freezes[_from], "From account is locked.");
        RELEASELOCK138(_from);
        return super.TRANSFERFROM809(_from, _to, _value);
    }

    //mintable
    event MINT369(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

    function MINT633(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _amount
    )
      public
      ONLYOWNER609
      returns (bool)
    {
        super._MINT141(_to, _amount);
        emit MINT369(_to, _amount);
        return true;
    }

    //burnable
    event BURN221(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

    function BURN276(address _who, uint256 _value) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        require(_value <= super.BALANCEOF582(_who), "Balance is too small.");

        _BURN442(_who, _value);
        emit BURN221(_who, _value);
    }

    //lockable
    struct LockInfo {
        uint256 releaseTime;
        uint256 balance;
    }
    mapping(address => LockInfo[]) internal lockInfo;

    event LOCK223(address indexed holder, uint256 value, uint256 releaseTime);	//inject NONSTANDARD NAMING
    event UNLOCK712(address indexed holder, uint256 value);	//inject NONSTANDARD NAMING

    function BALANCEOF582(address _holder) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        uint256 lockedBalance = 0;
        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            lockedBalance = lockedBalance.ADD634(lockInfo[_holder][i].balance);
        }
        return super.BALANCEOF582(_holder).ADD634(lockedBalance);
    }

    function RELEASELOCK138(address _holder) internal {	//inject NONSTANDARD NAMING

        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            if (lockInfo[_holder][i].releaseTime <= now) {
                _balances[_holder] = _balances[_holder].ADD634(lockInfo[_holder][i].balance);
                emit UNLOCK712(_holder, lockInfo[_holder][i].balance);
                lockInfo[_holder][i].balance = 0;

                if (i != lockInfo[_holder].length - 1) {
                    lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
                    i--;
                }
                lockInfo[_holder].length--;

            }
        }
    }
    function LOCKCOUNT673(address _holder) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return lockInfo[_holder].length;
    }
    function LOCKSTATE269(address _holder, uint256 _idx) public view returns (uint256, uint256) {	//inject NONSTANDARD NAMING
        return (lockInfo[_holder][_idx].releaseTime, lockInfo[_holder][_idx].balance);
    }

    function LOCK198(address _holder, uint256 _amount, uint256 _releaseTime) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF582(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB111(_amount);
        lockInfo[_holder].push(
            LockInfo(_releaseTime, _amount)
        );
        emit LOCK223(_holder, _amount, _releaseTime);
    }

    function LOCKAFTER598(address _holder, uint256 _amount, uint256 _afterTime) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF582(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB111(_amount);
        lockInfo[_holder].push(
            LockInfo(now + _afterTime, _amount)
        );
        emit LOCK223(_holder, _amount, now + _afterTime);
    }

    function UNLOCK680(address _holder, uint256 i) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        require(i < lockInfo[_holder].length, "No lock information.");

        _balances[_holder] = _balances[_holder].ADD634(lockInfo[_holder][i].balance);
        emit UNLOCK712(_holder, lockInfo[_holder][i].balance);
        lockInfo[_holder][i].balance = 0;

        if (i != lockInfo[_holder].length - 1) {
            lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
        }
        lockInfo[_holder].length--;
    }

    function TRANSFERWITHLOCK335(address _to, uint256 _value, uint256 _releaseTime) public ONLYOWNER609 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF582(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB111(_value);
        lockInfo[_to].push(
            LockInfo(_releaseTime, _value)
        );
        emit TRANSFER990(owner, _to, _value);
        emit LOCK223(_to, _value, _releaseTime);

        return true;
    }

    function TRANSFERWITHLOCKAFTER244(address _to, uint256 _value, uint256 _afterTime) public ONLYOWNER609 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF582(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB111(_value);
        lockInfo[_to].push(
            LockInfo(now + _afterTime, _value)
        );
        emit TRANSFER990(owner, _to, _value);
        emit LOCK223(_to, _value, now + _afterTime);

        return true;
    }

    function CURRENTTIME615() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now;
    }

    function AFTERTIME52(uint256 _value) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now + _value;
    }
}