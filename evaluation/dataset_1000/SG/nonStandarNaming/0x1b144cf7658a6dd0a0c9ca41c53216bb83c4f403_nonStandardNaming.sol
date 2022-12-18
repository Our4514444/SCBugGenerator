                                                                 

pragma solidity ^0.5.4;



                                                                                        
interface IERC20 {
    function TRANSFER720(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE251(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM675(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY299() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF747(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE147(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER861(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL695(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol

                                                                                                   
library SafeMath {
                                                                                 
    function MUL817(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV588(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB715(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD373(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD723(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                             
    function TOTALSUPPLY299() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF747(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE147(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER720(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER96(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE251(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL695(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM675(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB715(value);
        _TRANSFER96(from, to, value);
        emit APPROVAL695(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function INCREASEALLOWANCE720(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD373(addedValue);
        emit APPROVAL695(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function DECREASEALLOWANCE989(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB715(subtractedValue);
        emit APPROVAL695(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER96(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB715(value);
        _balances[to] = _balances[to].ADD373(value);
        emit TRANSFER861(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT360(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD373(value);
        _balances[account] = _balances[account].ADD373(value);
        emit TRANSFER861(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN640(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB715(value);
        _balances[account] = _balances[account].SUB715(value);
        emit TRANSFER861(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM418(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _allowed[account][msg.sender] = _allowed[account][msg.sender].SUB715(value);
        _BURN640(account, value);
        emit APPROVAL695(account, msg.sender, _allowed[account][msg.sender]);
    }
}

// File: contracts\BKRW.sol

contract BKRW is ERC20 {
    string public constant name260 = "BKRW"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    string public constant symbol976 = "BKRW"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    uint8 public constant decimals236 = 18; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    uint256 public constant initialsupply31 = 10000000000 * (10 ** uint256(decimals236));	//inject NONSTANDARD NAMING

    constructor() public {
        super._MINT360(msg.sender, initialsupply31);
        owner = msg.sender;
    }

    //ownership
    address public owner;

    event OWNERSHIPRENOUNCED400(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED668(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
    );

    modifier ONLYOWNER981() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Not owner");
        _;
    }

                                                                                                                                                                                                                                                                   
    function RENOUNCEOWNERSHIP728() public ONLYOWNER981 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED400(owner);
        owner = address(0);
    }

                                                                                                                                                             
    function TRANSFEROWNERSHIP249(address _newOwner) public ONLYOWNER981 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP60(_newOwner);
    }

                                                                                                                                  
    function _TRANSFEROWNERSHIP60(address _newOwner) internal {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Already owner");
        emit OWNERSHIPTRANSFERRED668(owner, _newOwner);
        owner = _newOwner;
    }

    //pausable
    event PAUSE946();	//inject NONSTANDARD NAMING
    event UNPAUSE963();	//inject NONSTANDARD NAMING

    bool public paused = false;

                                                                                                    
    modifier WHENNOTPAUSED400() {	//inject NONSTANDARD NAMING
        require(!paused, "Paused by owner");
        _;
    }

                                                                                                
    modifier WHENPAUSED756() {	//inject NONSTANDARD NAMING
        require(paused, "Not paused now");
        _;
    }

                                                                              
    function PAUSE465() public ONLYOWNER981 WHENNOTPAUSED400 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE946();
    }

                                                                                 
    function UNPAUSE170() public ONLYOWNER981 WHENPAUSED756 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE963();
    }

    //freezable
    event FROZEN543(address target);	//inject NONSTANDARD NAMING
    event UNFROZEN799(address target);	//inject NONSTANDARD NAMING

    mapping(address => bool) internal freezes;

    modifier WHENNOTFROZEN508() {	//inject NONSTANDARD NAMING
        require(!freezes[msg.sender], "Sender account is locked.");
        _;
    }

    function FREEZE76(address _target) public ONLYOWNER981 {	//inject NONSTANDARD NAMING
        freezes[_target] = true;
        emit FROZEN543(_target);
    }

    function UNFREEZE972(address _target) public ONLYOWNER981 {	//inject NONSTANDARD NAMING
        freezes[_target] = false;
        emit UNFROZEN799(_target);
    }

    function ISFROZEN443(address _target) public view returns (bool) {	//inject NONSTANDARD NAMING
        return freezes[_target];
    }

    function TRANSFER720(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _value
    )
      public
      WHENNOTFROZEN508
      WHENNOTPAUSED400
      returns (bool)
    {
        RELEASELOCK846(msg.sender);
        return super.TRANSFER720(_to, _value);
    }

    function TRANSFERFROM675(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value
    )
      public
      WHENNOTPAUSED400
      returns (bool)
    {
        require(!freezes[_from], "From account is locked.");
        RELEASELOCK846(_from);
        return super.TRANSFERFROM675(_from, _to, _value);
    }

    //mintable
    event MINT626(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

    function MINT564(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _amount
    )
      public
      ONLYOWNER981
      returns (bool)
    {
        super._MINT360(_to, _amount);
        emit MINT626(_to, _amount);
        return true;
    }

    //burnable
    event BURN98(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

    function BURN646(address _who, uint256 _value) public ONLYOWNER981 {	//inject NONSTANDARD NAMING
        require(_value <= super.BALANCEOF747(_who), "Balance is too small.");

        _BURN640(_who, _value);
        emit BURN98(_who, _value);
    }

    //lockable
    struct LockInfo {
        uint256 releaseTime;
        uint256 balance;
    }
    mapping(address => LockInfo[]) internal lockInfo;

    event LOCK875(address indexed holder, uint256 value, uint256 releaseTime);	//inject NONSTANDARD NAMING
    event UNLOCK653(address indexed holder, uint256 value);	//inject NONSTANDARD NAMING

    function BALANCEOF747(address _holder) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        uint256 lockedBalance = 0;
        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            lockedBalance = lockedBalance.ADD373(lockInfo[_holder][i].balance);
        }
        return super.BALANCEOF747(_holder).ADD373(lockedBalance);
    }

    function RELEASELOCK846(address _holder) internal {	//inject NONSTANDARD NAMING

        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            if (lockInfo[_holder][i].releaseTime <= now) {
                _balances[_holder] = _balances[_holder].ADD373(lockInfo[_holder][i].balance);
                emit UNLOCK653(_holder, lockInfo[_holder][i].balance);
                lockInfo[_holder][i].balance = 0;

                if (i != lockInfo[_holder].length - 1) {
                    lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
                    i--;
                }
                lockInfo[_holder].length--;

            }
        }
    }
    function LOCKCOUNT50(address _holder) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return lockInfo[_holder].length;
    }
    function LOCKSTATE742(address _holder, uint256 _idx) public view returns (uint256, uint256) {	//inject NONSTANDARD NAMING
        return (lockInfo[_holder][_idx].releaseTime, lockInfo[_holder][_idx].balance);
    }

    function LOCK690(address _holder, uint256 _amount, uint256 _releaseTime) public ONLYOWNER981 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF747(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB715(_amount);
        lockInfo[_holder].push(
            LockInfo(_releaseTime, _amount)
        );
        emit LOCK875(_holder, _amount, _releaseTime);
    }

    function LOCKAFTER732(address _holder, uint256 _amount, uint256 _afterTime) public ONLYOWNER981 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF747(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB715(_amount);
        lockInfo[_holder].push(
            LockInfo(now + _afterTime, _amount)
        );
        emit LOCK875(_holder, _amount, now + _afterTime);
    }

    function UNLOCK447(address _holder, uint256 i) public ONLYOWNER981 {	//inject NONSTANDARD NAMING
        require(i < lockInfo[_holder].length, "No lock information.");

        _balances[_holder] = _balances[_holder].ADD373(lockInfo[_holder][i].balance);
        emit UNLOCK653(_holder, lockInfo[_holder][i].balance);
        lockInfo[_holder][i].balance = 0;

        if (i != lockInfo[_holder].length - 1) {
            lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
        }
        lockInfo[_holder].length--;
    }

    function TRANSFERWITHLOCK464(address _to, uint256 _value, uint256 _releaseTime) public ONLYOWNER981 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF747(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB715(_value);
        lockInfo[_to].push(
            LockInfo(_releaseTime, _value)
        );
        emit TRANSFER861(owner, _to, _value);
        emit LOCK875(_to, _value, _releaseTime);

        return true;
    }

    function TRANSFERWITHLOCKAFTER75(address _to, uint256 _value, uint256 _afterTime) public ONLYOWNER981 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF747(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB715(_value);
        lockInfo[_to].push(
            LockInfo(now + _afterTime, _value)
        );
        emit TRANSFER861(owner, _to, _value);
        emit LOCK875(_to, _value, now + _afterTime);

        return true;
    }

    function CURRENTTIME652() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now;
    }

    function AFTERTIME790(uint256 _value) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now + _value;
    }
}