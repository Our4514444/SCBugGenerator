                                                                 

pragma solidity 0.5.8;

// File: node_modules\openzeppelin-solidity\contracts\token\ERC20\IERC20.sol

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY924() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF552(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER860(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE658(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE578(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM917(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER893(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL918(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: node_modules\openzeppelin-solidity\contracts\math\SafeMath.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD866(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB199(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL662(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV643(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD211(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

// File: node_modules\openzeppelin-solidity\contracts\token\ERC20\ERC20.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) internal _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY924() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF552(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER860(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER545(msg.sender, recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE658(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE578(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE926(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function TRANSFERFROM917(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER545(sender, recipient, amount);
        _APPROVE926(sender, msg.sender, _allowances[sender][msg.sender].SUB199(amount));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE15(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE926(msg.sender, spender, _allowances[msg.sender][spender].ADD866(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE788(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE926(msg.sender, spender, _allowances[msg.sender][spender].SUB199(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER545(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB199(amount);
        _balances[recipient] = _balances[recipient].ADD866(amount);
        emit TRANSFER893(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT820(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD866(amount);
        _balances[account] = _balances[account].ADD866(amount);
        emit TRANSFER893(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN430(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _totalSupply = _totalSupply.SUB199(value);
        _balances[account] = _balances[account].SUB199(value);
        emit TRANSFER893(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE926(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit APPROVAL918(owner, spender, value);
    }

                                                                                                                                                                          
    function _BURNFROM48(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN430(account, amount);
        _APPROVE926(account, msg.sender, _allowances[account][msg.sender].SUB199(amount));
    }
}

// File: J\contracts\PointUSD(USDP).sol

contract PointUSD is ERC20 {
    string public constant name955 = "PointUSD"; 	//inject NONSTANDARD NAMING
    string public constant symbol533 = "USDP"; 	//inject NONSTANDARD NAMING
    uint8 public constant decimals499 = 18; 	//inject NONSTANDARD NAMING
    uint256 public constant initialsupply919 = 1000000000 * (10 ** uint256(decimals499));	//inject NONSTANDARD NAMING
    
    constructor() public {
        super._MINT820(msg.sender, initialsupply919);
        owner = msg.sender;
    }

    //ownership
    address public owner;

    event OWNERSHIPRENOUNCED232(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED708(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
    );

    modifier ONLYOWNER885() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Not owner");
        _;
    }

                                                                                                                                                                                                                                                                   
    function RENOUNCEOWNERSHIP807() public ONLYOWNER885 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED232(owner);
        owner = address(0);
    }

                                                                                                                                                             
    function TRANSFEROWNERSHIP332(address _newOwner) public ONLYOWNER885 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP549(_newOwner);
    }

                                                                                                                                  
    function _TRANSFEROWNERSHIP549(address _newOwner) internal {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Already owner");
        emit OWNERSHIPTRANSFERRED708(owner, _newOwner);
        owner = _newOwner;
    }

    //pausable
    event PAUSE26();	//inject NONSTANDARD NAMING
    event UNPAUSE974();	//inject NONSTANDARD NAMING

    bool public paused = false;
    
                                                                                                    
    modifier WHENNOTPAUSED958() {	//inject NONSTANDARD NAMING
        require(!paused, "Paused by owner");
        _;
    }

                                                                                                
    modifier WHENPAUSED21() {	//inject NONSTANDARD NAMING
        require(paused, "Not paused now");
        _;
    }

                                                                              
    function PAUSE486() public ONLYOWNER885 WHENNOTPAUSED958 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE26();
    }

                                                                                 
    function UNPAUSE549() public ONLYOWNER885 WHENPAUSED21 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE974();
    }

    //freezable
    event FROZEN84(address target);	//inject NONSTANDARD NAMING
    event UNFROZEN462(address target);	//inject NONSTANDARD NAMING

    mapping(address => bool) internal freezes;

    modifier WHENNOTFROZEN285() {	//inject NONSTANDARD NAMING
        require(!freezes[msg.sender], "Sender account is locked.");
        _;
    }

    function FREEZE86(address _target) public ONLYOWNER885 {	//inject NONSTANDARD NAMING
        freezes[_target] = true;
        emit FROZEN84(_target);
    }

    function UNFREEZE533(address _target) public ONLYOWNER885 {	//inject NONSTANDARD NAMING
        freezes[_target] = false;
        emit UNFROZEN462(_target);
    }

    function ISFROZEN652(address _target) public view returns (bool) {	//inject NONSTANDARD NAMING
        return freezes[_target];
    }

    function TRANSFER860(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _value
    )
      public
      WHENNOTFROZEN285
      WHENNOTPAUSED958
      returns (bool)
    {
        RELEASELOCK91(msg.sender);
        return super.TRANSFER860(_to, _value);
    }

    function TRANSFERFROM917(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value
    )
      public
      WHENNOTPAUSED958
      returns (bool)
    {
        require(!freezes[_from], "From account is locked.");
        RELEASELOCK91(_from);
        return super.TRANSFERFROM917(_from, _to, _value);
    }

    //mintable
    event MINT915(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

    function MINT468(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _amount
    )
      public
      ONLYOWNER885
      returns (bool)
    {
        super._MINT820(_to, _amount);
        emit MINT915(_to, _amount);
        return true;
    }

    //burnable
    event BURN780(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

    function BURN326(address _who, uint256 _value) public ONLYOWNER885 {	//inject NONSTANDARD NAMING
        require(_value <= super.BALANCEOF552(_who), "Balance is too small.");

        _BURN430(_who, _value);
        emit BURN780(_who, _value);
    }

    //lockable
    struct LockInfo {
        uint256 releaseTime;
        uint256 balance;
    }
    mapping(address => LockInfo[]) internal lockInfo;

    event LOCK175(address indexed holder, uint256 value, uint256 releaseTime);	//inject NONSTANDARD NAMING
    event UNLOCK233(address indexed holder, uint256 value);	//inject NONSTANDARD NAMING

    function BALANCEOF552(address _holder) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        uint256 lockedBalance = 0;
        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            lockedBalance = lockedBalance.ADD866(lockInfo[_holder][i].balance);
        }
        return super.BALANCEOF552(_holder).ADD866(lockedBalance);
    }

    function RELEASELOCK91(address _holder) internal {	//inject NONSTANDARD NAMING

        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            if (lockInfo[_holder][i].releaseTime <= now) {
                _balances[_holder] = _balances[_holder].ADD866(lockInfo[_holder][i].balance);
                emit UNLOCK233(_holder, lockInfo[_holder][i].balance);
                lockInfo[_holder][i].balance = 0;

                if (i != lockInfo[_holder].length - 1) {
                    lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
                    i--;
                }
                lockInfo[_holder].length--;

            }
        }
    }
    function LOCKCOUNT149(address _holder) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return lockInfo[_holder].length;
    }
    function LOCKSTATE682(address _holder, uint256 _idx) public view returns (uint256, uint256) {	//inject NONSTANDARD NAMING
        return (lockInfo[_holder][_idx].releaseTime, lockInfo[_holder][_idx].balance);
    }

    function LOCK661(address _holder, uint256 _amount, uint256 _releaseTime) public ONLYOWNER885 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF552(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB199(_amount);
        lockInfo[_holder].push(
            LockInfo(_releaseTime, _amount)
        );
        emit LOCK175(_holder, _amount, _releaseTime);
    }

    function LOCKAFTER822(address _holder, uint256 _amount, uint256 _afterTime) public ONLYOWNER885 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF552(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB199(_amount);
        lockInfo[_holder].push(
            LockInfo(now + _afterTime, _amount)
        );
        emit LOCK175(_holder, _amount, now + _afterTime);
    }

    function UNLOCK792(address _holder, uint256 i) public ONLYOWNER885 {	//inject NONSTANDARD NAMING
        require(i < lockInfo[_holder].length, "No lock information.");

        _balances[_holder] = _balances[_holder].ADD866(lockInfo[_holder][i].balance);
        emit UNLOCK233(_holder, lockInfo[_holder][i].balance);
        lockInfo[_holder][i].balance = 0;

        if (i != lockInfo[_holder].length - 1) {
            lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
        }
        lockInfo[_holder].length--;
    }

    function TRANSFERWITHLOCK204(address _to, uint256 _value, uint256 _releaseTime) public ONLYOWNER885 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF552(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB199(_value);
        lockInfo[_to].push(
            LockInfo(_releaseTime, _value)
        );
        emit TRANSFER893(owner, _to, _value);
        emit LOCK175(_to, _value, _releaseTime);

        return true;
    }

    function TRANSFERWITHLOCKAFTER829(address _to, uint256 _value, uint256 _afterTime) public ONLYOWNER885 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF552(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB199(_value);
        lockInfo[_to].push(
            LockInfo(now + _afterTime, _value)
        );
        emit TRANSFER893(owner, _to, _value);
        emit LOCK175(_to, _value, now + _afterTime);

        return true;
    }

    function CURRENTTIME953() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now;
    }

    function AFTERTIME556(uint256 _value) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now + _value;
    }

    //airdrop
    mapping (address => uint256) public airDropHistory;
    event AIRDROP288(address _receiver, uint256 _amount);	//inject NONSTANDARD NAMING

    function DROPTOKEN371(address[] memory receivers, uint256[] memory values) ONLYOWNER885 public {	//inject NONSTANDARD NAMING
    require(receivers.length != 0);
    require(receivers.length == values.length);

    for (uint256 i = 0; i < receivers.length; i++) {
      address receiver = receivers[i];
      uint256 amount = values[i];

      TRANSFER860(receiver, amount);
      airDropHistory[receiver] += amount;

      emit AIRDROP288(receiver, amount);
    }
  }
}