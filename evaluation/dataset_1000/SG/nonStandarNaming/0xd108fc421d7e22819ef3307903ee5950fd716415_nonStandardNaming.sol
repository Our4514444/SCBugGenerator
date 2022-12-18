                                                                 

pragma solidity 0.5.8;

// File: node_modules\openzeppelin-solidity\contracts\token\ERC20\IERC20.sol

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY348() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF655(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER850(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE370(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE291(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM53(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER532(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL447(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: node_modules\openzeppelin-solidity\contracts\math\SafeMath.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD686(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB112(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL146(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV722(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD864(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                     
    function TOTALSUPPLY348() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF655(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER850(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER859(msg.sender, recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE370(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE291(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE823(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function TRANSFERFROM53(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER859(sender, recipient, amount);
        _APPROVE823(sender, msg.sender, _allowances[sender][msg.sender].SUB112(amount));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE28(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE823(msg.sender, spender, _allowances[msg.sender][spender].ADD686(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE918(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE823(msg.sender, spender, _allowances[msg.sender][spender].SUB112(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER859(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB112(amount);
        _balances[recipient] = _balances[recipient].ADD686(amount);
        emit TRANSFER532(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT304(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD686(amount);
        _balances[account] = _balances[account].ADD686(amount);
        emit TRANSFER532(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN53(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _totalSupply = _totalSupply.SUB112(value);
        _balances[account] = _balances[account].SUB112(value);
        emit TRANSFER532(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE823(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit APPROVAL447(owner, spender, value);
    }

                                                                                                                                                                          
    function _BURNFROM477(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN53(account, amount);
        _APPROVE823(account, msg.sender, _allowances[account][msg.sender].SUB112(amount));
    }
}

// File: J\contracts\Minings(MININGS).sol

contract Minings is ERC20 {
    string public constant name436 = "Minings"; 	//inject NONSTANDARD NAMING
    string public constant symbol143 = "MININGS"; 	//inject NONSTANDARD NAMING
    uint8 public constant decimals759 = 18; 	//inject NONSTANDARD NAMING
    uint256 public constant initialsupply515 = 100000000000 * (10 ** uint256(decimals759));	//inject NONSTANDARD NAMING
    
    constructor() public {
        super._MINT304(msg.sender, initialsupply515);
        owner = msg.sender;
    }

    //ownership
    address public owner;

    event OWNERSHIPRENOUNCED316(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED942(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
    );

    modifier ONLYOWNER480() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Not owner");
        _;
    }

                                                                                                                                                                                                                                                                   
    function RENOUNCEOWNERSHIP496() public ONLYOWNER480 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED316(owner);
        owner = address(0);
    }

                                                                                                                                                             
    function TRANSFEROWNERSHIP347(address _newOwner) public ONLYOWNER480 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP825(_newOwner);
    }

                                                                                                                                  
    function _TRANSFEROWNERSHIP825(address _newOwner) internal {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Already owner");
        emit OWNERSHIPTRANSFERRED942(owner, _newOwner);
        owner = _newOwner;
    }

    //pausable
    event PAUSE557();	//inject NONSTANDARD NAMING
    event UNPAUSE192();	//inject NONSTANDARD NAMING

    bool public paused = false;
    
                                                                                                    
    modifier WHENNOTPAUSED681() {	//inject NONSTANDARD NAMING
        require(!paused, "Paused by owner");
        _;
    }

                                                                                                
    modifier WHENPAUSED380() {	//inject NONSTANDARD NAMING
        require(paused, "Not paused now");
        _;
    }

                                                                              
    function PAUSE63() public ONLYOWNER480 WHENNOTPAUSED681 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE557();
    }

                                                                                 
    function UNPAUSE399() public ONLYOWNER480 WHENPAUSED380 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE192();
    }

    //freezable
    event FROZEN418(address target);	//inject NONSTANDARD NAMING
    event UNFROZEN406(address target);	//inject NONSTANDARD NAMING

    mapping(address => bool) internal freezes;

    modifier WHENNOTFROZEN758() {	//inject NONSTANDARD NAMING
        require(!freezes[msg.sender], "Sender account is locked.");
        _;
    }

    function FREEZE994(address _target) public ONLYOWNER480 {	//inject NONSTANDARD NAMING
        freezes[_target] = true;
        emit FROZEN418(_target);
    }

    function UNFREEZE669(address _target) public ONLYOWNER480 {	//inject NONSTANDARD NAMING
        freezes[_target] = false;
        emit UNFROZEN406(_target);
    }

    function ISFROZEN707(address _target) public view returns (bool) {	//inject NONSTANDARD NAMING
        return freezes[_target];
    }

    function TRANSFER850(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _value
    )
      public
      WHENNOTFROZEN758
      WHENNOTPAUSED681
      returns (bool)
    {
        RELEASELOCK344(msg.sender);
        return super.TRANSFER850(_to, _value);
    }

    function TRANSFERFROM53(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value
    )
      public
      WHENNOTPAUSED681
      returns (bool)
    {
        require(!freezes[_from], "From account is locked.");
        RELEASELOCK344(_from);
        return super.TRANSFERFROM53(_from, _to, _value);
    }

    //mintable
    event MINT532(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

    function MINT732(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _amount
    )
      public
      ONLYOWNER480
      returns (bool)
    {
        super._MINT304(_to, _amount);
        emit MINT532(_to, _amount);
        return true;
    }

    //burnable
    event BURN355(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

    function BURN116(address _who, uint256 _value) public ONLYOWNER480 {	//inject NONSTANDARD NAMING
        require(_value <= super.BALANCEOF655(_who), "Balance is too small.");

        _BURN53(_who, _value);
        emit BURN355(_who, _value);
    }

    //lockable
    struct LockInfo {
        uint256 releaseTime;
        uint256 balance;
    }
    mapping(address => LockInfo[]) internal lockInfo;

    event LOCK691(address indexed holder, uint256 value, uint256 releaseTime);	//inject NONSTANDARD NAMING
    event UNLOCK869(address indexed holder, uint256 value);	//inject NONSTANDARD NAMING

    function BALANCEOF655(address _holder) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        uint256 lockedBalance = 0;
        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            lockedBalance = lockedBalance.ADD686(lockInfo[_holder][i].balance);
        }
        return super.BALANCEOF655(_holder).ADD686(lockedBalance);
    }

    function RELEASELOCK344(address _holder) internal {	//inject NONSTANDARD NAMING

        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            if (lockInfo[_holder][i].releaseTime <= now) {
                _balances[_holder] = _balances[_holder].ADD686(lockInfo[_holder][i].balance);
                emit UNLOCK869(_holder, lockInfo[_holder][i].balance);
                lockInfo[_holder][i].balance = 0;

                if (i != lockInfo[_holder].length - 1) {
                    lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
                    i--;
                }
                lockInfo[_holder].length--;

            }
        }
    }
    function LOCKCOUNT67(address _holder) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return lockInfo[_holder].length;
    }
    function LOCKSTATE371(address _holder, uint256 _idx) public view returns (uint256, uint256) {	//inject NONSTANDARD NAMING
        return (lockInfo[_holder][_idx].releaseTime, lockInfo[_holder][_idx].balance);
    }

    function LOCK15(address _holder, uint256 _amount, uint256 _releaseTime) public ONLYOWNER480 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF655(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB112(_amount);
        lockInfo[_holder].push(
            LockInfo(_releaseTime, _amount)
        );
        emit LOCK691(_holder, _amount, _releaseTime);
    }

    function LOCKAFTER610(address _holder, uint256 _amount, uint256 _afterTime) public ONLYOWNER480 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF655(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB112(_amount);
        lockInfo[_holder].push(
            LockInfo(now + _afterTime, _amount)
        );
        emit LOCK691(_holder, _amount, now + _afterTime);
    }

    function UNLOCK586(address _holder, uint256 i) public ONLYOWNER480 {	//inject NONSTANDARD NAMING
        require(i < lockInfo[_holder].length, "No lock information.");

        _balances[_holder] = _balances[_holder].ADD686(lockInfo[_holder][i].balance);
        emit UNLOCK869(_holder, lockInfo[_holder][i].balance);
        lockInfo[_holder][i].balance = 0;

        if (i != lockInfo[_holder].length - 1) {
            lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
        }
        lockInfo[_holder].length--;
    }

    function TRANSFERWITHLOCK98(address _to, uint256 _value, uint256 _releaseTime) public ONLYOWNER480 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF655(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB112(_value);
        lockInfo[_to].push(
            LockInfo(_releaseTime, _value)
        );
        emit TRANSFER532(owner, _to, _value);
        emit LOCK691(_to, _value, _releaseTime);

        return true;
    }

    function TRANSFERWITHLOCKAFTER862(address _to, uint256 _value, uint256 _afterTime) public ONLYOWNER480 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF655(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB112(_value);
        lockInfo[_to].push(
            LockInfo(now + _afterTime, _value)
        );
        emit TRANSFER532(owner, _to, _value);
        emit LOCK691(_to, _value, now + _afterTime);

        return true;
    }

    function CURRENTTIME366() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now;
    }

    function AFTERTIME146(uint256 _value) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now + _value;
    }

    //airdrop
    mapping (address => uint256) public airDropHistory;
    event AIRDROP405(address _receiver, uint256 _amount);	//inject NONSTANDARD NAMING

    function DROPTOKEN364(address[] memory receivers, uint256[] memory values) ONLYOWNER480 public {	//inject NONSTANDARD NAMING
    require(receivers.length != 0);
    require(receivers.length == values.length);

    for (uint256 i = 0; i < receivers.length; i++) {
      address receiver = receivers[i];
      uint256 amount = values[i];

      TRANSFER850(receiver, amount);
      airDropHistory[receiver] += amount;

      emit AIRDROP405(receiver, amount);
    }
  }
}