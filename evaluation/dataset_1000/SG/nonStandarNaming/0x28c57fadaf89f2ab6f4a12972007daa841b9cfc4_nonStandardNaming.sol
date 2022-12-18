                                                                 

pragma solidity ^0.5.4;

// File: node_modules/openzeppelin-solidity/contracts/token/ERC20/IERC20.sol

                                                                                        
interface IERC20 {
    function TRANSFER853(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE21(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM690(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY540() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF768(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE173(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER619(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL537(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol

                                                                                                   
library SafeMath {
                                                                                
    function MUL51(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV581(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB828(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD767(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD782(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                             
    function TOTALSUPPLY540() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF768(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE173(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER853(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER708(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE21(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL537(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM690(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB828(value);
        _TRANSFER708(from, to, value);
        emit APPROVAL537(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function INCREASEALLOWANCE613(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD767(addedValue);
        emit APPROVAL537(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function DECREASEALLOWANCE822(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB828(subtractedValue);
        emit APPROVAL537(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER708(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB828(value);
        _balances[to] = _balances[to].ADD767(value);
        emit TRANSFER619(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT864(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD767(value);
        _balances[account] = _balances[account].ADD767(value);
        emit TRANSFER619(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN589(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB828(value);
        _balances[account] = _balances[account].SUB828(value);
        emit TRANSFER619(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM566(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _allowed[account][msg.sender] = _allowed[account][msg.sender].SUB828(value);
        _BURN589(account, value);
        emit APPROVAL537(account, msg.sender, _allowed[account][msg.sender]);
    }
}



contract PAIIK is ERC20 {
    string public constant name631 = "PAIIK"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    string public constant symbol516 = "PIK"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    uint8 public constant decimals650 = 18; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    uint256 public constant initialsupply548 = 3000000000 * (10 ** uint256(decimals650));	//inject NONSTANDARD NAMING

    constructor() public {
        super._MINT864(msg.sender, initialsupply548);
        owner = msg.sender;
    }

    //ownership
    address public owner;

    event OWNERSHIPRENOUNCED410(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED390(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
    );

    modifier ONLYOWNER666() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Not owner");
        _;
    }

                                                                                                                                                                                                                                                                   
    function RENOUNCEOWNERSHIP935() public ONLYOWNER666 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED410(owner);
        owner = address(0);
    }

                                                                                                                                                             
    function TRANSFEROWNERSHIP633(address _newOwner) public ONLYOWNER666 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP278(_newOwner);
    }

                                                                                                                                  
    function _TRANSFEROWNERSHIP278(address _newOwner) internal {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Already owner");
        emit OWNERSHIPTRANSFERRED390(owner, _newOwner);
        owner = _newOwner;
    }

    //pausable
    event PAUSE310();	//inject NONSTANDARD NAMING
    event UNPAUSE341();	//inject NONSTANDARD NAMING

    bool public paused = false;

                                                                                                    
    modifier WHENNOTPAUSED413() {	//inject NONSTANDARD NAMING
        require(!paused, "Paused by owner");
        _;
    }

                                                                                                
    modifier WHENPAUSED828() {	//inject NONSTANDARD NAMING
        require(paused, "Not paused now");
        _;
    }

                                                                              
    function PAUSE57() public ONLYOWNER666 WHENNOTPAUSED413 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE310();
    }

                                                                                 
    function UNPAUSE752() public ONLYOWNER666 WHENPAUSED828 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE341();
    }

    //freezable
    event FROZEN447(address target);	//inject NONSTANDARD NAMING
    event UNFROZEN70(address target);	//inject NONSTANDARD NAMING

    mapping(address => bool) internal freezes;

    modifier WHENNOTFROZEN500() {	//inject NONSTANDARD NAMING
        require(!freezes[msg.sender], "Sender account is locked.");
        _;
    }

    function FREEZE586(address _target) public ONLYOWNER666 {	//inject NONSTANDARD NAMING
        freezes[_target] = true;
        emit FROZEN447(_target);
    }

    function UNFREEZE165(address _target) public ONLYOWNER666 {	//inject NONSTANDARD NAMING
        freezes[_target] = false;
        emit UNFROZEN70(_target);
    }

    function ISFROZEN513(address _target) public view returns (bool) {	//inject NONSTANDARD NAMING
        return freezes[_target];
    }

    function TRANSFER853(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _value
    )
      public
      WHENNOTFROZEN500
      WHENNOTPAUSED413
      returns (bool)
    {
        RELEASELOCK51(msg.sender);
        return super.TRANSFER853(_to, _value);
    }

    function TRANSFERFROM690(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value
    )
      public
      WHENNOTPAUSED413
      returns (bool)
    {
        require(!freezes[_from], "From account is locked.");
        RELEASELOCK51(_from);
        return super.TRANSFERFROM690(_from, _to, _value);
    }

    //mintable
    event MINT503(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

    function MINT270(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _amount
    )
      public
      ONLYOWNER666
      returns (bool)
    {
        super._MINT864(_to, _amount);
        emit MINT503(_to, _amount);
        return true;
    }

    //burnable
    event BURN475(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

    function BURN577(address _who, uint256 _value) public ONLYOWNER666 {	//inject NONSTANDARD NAMING
        require(_value <= super.BALANCEOF768(_who), "Balance is too small.");

        _BURN589(_who, _value);
        emit BURN475(_who, _value);
    }

    //lockable
    struct LockInfo {
        uint256 releaseTime;
        uint256 balance;
    }
    mapping(address => LockInfo[]) internal lockInfo;

    event LOCK934(address indexed holder, uint256 value, uint256 releaseTime);	//inject NONSTANDARD NAMING
    event UNLOCK920(address indexed holder, uint256 value);	//inject NONSTANDARD NAMING

    function BALANCEOF768(address _holder) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        uint256 lockedBalance = 0;
        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            lockedBalance = lockedBalance.ADD767(lockInfo[_holder][i].balance);
        }
        return super.BALANCEOF768(_holder).ADD767(lockedBalance);
    }

    function RELEASELOCK51(address _holder) internal {	//inject NONSTANDARD NAMING

        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            if (lockInfo[_holder][i].releaseTime <= now) {
                _balances[_holder] = _balances[_holder].ADD767(lockInfo[_holder][i].balance);
                emit UNLOCK920(_holder, lockInfo[_holder][i].balance);
                lockInfo[_holder][i].balance = 0;

                if (i != lockInfo[_holder].length - 1) {
                    lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
                    i--;
                }
                lockInfo[_holder].length--;

            }
        }
    }
    function LOCKCOUNT857(address _holder) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return lockInfo[_holder].length;
    }
    function LOCKSTATE238(address _holder, uint256 _idx) public view returns (uint256, uint256) {	//inject NONSTANDARD NAMING
        return (lockInfo[_holder][_idx].releaseTime, lockInfo[_holder][_idx].balance);
    }

    function LOCK202(address _holder, uint256 _amount, uint256 _releaseTime) public ONLYOWNER666 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF768(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB828(_amount);
        lockInfo[_holder].push(
            LockInfo(_releaseTime, _amount)
        );
        emit LOCK934(_holder, _amount, _releaseTime);
    }

    function LOCKAFTER960(address _holder, uint256 _amount, uint256 _afterTime) public ONLYOWNER666 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF768(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB828(_amount);
        lockInfo[_holder].push(
            LockInfo(now + _afterTime, _amount)
        );
        emit LOCK934(_holder, _amount, now + _afterTime);
    }

    function UNLOCK966(address _holder, uint256 i) public ONLYOWNER666 {	//inject NONSTANDARD NAMING
        require(i < lockInfo[_holder].length, "No lock information.");

        _balances[_holder] = _balances[_holder].ADD767(lockInfo[_holder][i].balance);
        emit UNLOCK920(_holder, lockInfo[_holder][i].balance);
        lockInfo[_holder][i].balance = 0;

        if (i != lockInfo[_holder].length - 1) {
            lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
        }
        lockInfo[_holder].length--;
    }

    function TRANSFERWITHLOCK214(address _to, uint256 _value, uint256 _releaseTime) public ONLYOWNER666 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF768(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB828(_value);
        lockInfo[_to].push(
            LockInfo(_releaseTime, _value)
        );
        emit TRANSFER619(owner, _to, _value);
        emit LOCK934(_to, _value, _releaseTime);

        return true;
    }

    function TRANSFERWITHLOCKAFTER44(address _to, uint256 _value, uint256 _afterTime) public ONLYOWNER666 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF768(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB828(_value);
        lockInfo[_to].push(
            LockInfo(now + _afterTime, _value)
        );
        emit TRANSFER619(owner, _to, _value);
        emit LOCK934(_to, _value, now + _afterTime);

        return true;
    }

    function CURRENTTIME115() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now;
    }

    function AFTERTIME473(uint256 _value) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now + _value;
    }
}