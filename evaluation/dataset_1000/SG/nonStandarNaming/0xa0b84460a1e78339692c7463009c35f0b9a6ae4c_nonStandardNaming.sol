                                                                 

pragma solidity 0.5.8;

// File: node_modules\openzeppelin-solidity\contracts\token\ERC20\IERC20.sol

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY119() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF525(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER157(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE574(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE585(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM14(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER356(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL143(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: node_modules\openzeppelin-solidity\contracts\math\SafeMath.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD958(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB465(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL215(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV412(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD50(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                     
    function TOTALSUPPLY119() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF525(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER157(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER292(msg.sender, recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE574(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE585(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE177(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function TRANSFERFROM14(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER292(sender, recipient, amount);
        _APPROVE177(sender, msg.sender, _allowances[sender][msg.sender].SUB465(amount));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE347(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE177(msg.sender, spender, _allowances[msg.sender][spender].ADD958(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE307(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE177(msg.sender, spender, _allowances[msg.sender][spender].SUB465(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER292(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB465(amount);
        _balances[recipient] = _balances[recipient].ADD958(amount);
        emit TRANSFER356(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT112(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD958(amount);
        _balances[account] = _balances[account].ADD958(amount);
        emit TRANSFER356(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN179(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _totalSupply = _totalSupply.SUB465(value);
        _balances[account] = _balances[account].SUB465(value);
        emit TRANSFER356(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE177(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit APPROVAL143(owner, spender, value);
    }

                                                                                                                                                                          
    function _BURNFROM110(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN179(account, amount);
        _APPROVE177(account, msg.sender, _allowances[account][msg.sender].SUB465(amount));
    }
}

// File: J\contracts\E2P.sol

contract E2P is ERC20 {
    string public constant name417 = "E2P"; 	//inject NONSTANDARD NAMING
    string public constant symbol801 = "E2P"; 	//inject NONSTANDARD NAMING
    uint8 public constant decimals672 = 18; 	//inject NONSTANDARD NAMING
    uint256 public constant initialsupply552 = 5000000000 * (10 ** uint256(decimals672));	//inject NONSTANDARD NAMING
    
    constructor() public {
        super._MINT112(msg.sender, initialsupply552);
        owner = msg.sender;
    }

    //ownership
    address public owner;

    event OWNERSHIPRENOUNCED565(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED322(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
    );

    modifier ONLYOWNER48() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Not owner");
        _;
    }

                                                                                                                                                                                                                                                                   
    function RENOUNCEOWNERSHIP59() public ONLYOWNER48 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED565(owner);
        owner = address(0);
    }

                                                                                                                                                             
    function TRANSFEROWNERSHIP724(address _newOwner) public ONLYOWNER48 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP714(_newOwner);
    }

                                                                                                                                  
    function _TRANSFEROWNERSHIP714(address _newOwner) internal {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Already owner");
        emit OWNERSHIPTRANSFERRED322(owner, _newOwner);
        owner = _newOwner;
    }

    //pausable
    event PAUSE602();	//inject NONSTANDARD NAMING
    event UNPAUSE652();	//inject NONSTANDARD NAMING

    bool public paused = false;
    
                                                                                                    
    modifier WHENNOTPAUSED960() {	//inject NONSTANDARD NAMING
        require(!paused, "Paused by owner");
        _;
    }

                                                                                                
    modifier WHENPAUSED784() {	//inject NONSTANDARD NAMING
        require(paused, "Not paused now");
        _;
    }

                                                                              
    function PAUSE56() public ONLYOWNER48 WHENNOTPAUSED960 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE602();
    }

                                                                                 
    function UNPAUSE186() public ONLYOWNER48 WHENPAUSED784 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE652();
    }

    //freezable
    event FROZEN41(address target);	//inject NONSTANDARD NAMING
    event UNFROZEN163(address target);	//inject NONSTANDARD NAMING

    mapping(address => bool) internal freezes;

    modifier WHENNOTFROZEN689() {	//inject NONSTANDARD NAMING
        require(!freezes[msg.sender], "Sender account is locked.");
        _;
    }

    function FREEZE255(address _target) public ONLYOWNER48 {	//inject NONSTANDARD NAMING
        freezes[_target] = true;
        emit FROZEN41(_target);
    }

    function UNFREEZE766(address _target) public ONLYOWNER48 {	//inject NONSTANDARD NAMING
        freezes[_target] = false;
        emit UNFROZEN163(_target);
    }

    function ISFROZEN315(address _target) public view returns (bool) {	//inject NONSTANDARD NAMING
        return freezes[_target];
    }

    function TRANSFER157(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _value
    )
      public
      WHENNOTFROZEN689
      WHENNOTPAUSED960
      returns (bool)
    {
        RELEASELOCK317(msg.sender);
        return super.TRANSFER157(_to, _value);
    }

    function TRANSFERFROM14(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value
    )
      public
      WHENNOTPAUSED960
      returns (bool)
    {
        require(!freezes[_from], "From account is locked.");
        RELEASELOCK317(_from);
        return super.TRANSFERFROM14(_from, _to, _value);
    }

    //mintable
    event MINT354(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

    function MINT669(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _amount
    )
      public
      ONLYOWNER48
      returns (bool)
    {
        super._MINT112(_to, _amount);
        emit MINT354(_to, _amount);
        return true;
    }

    //burnable
    event BURN453(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

    function BURN409(address _who, uint256 _value) public ONLYOWNER48 {	//inject NONSTANDARD NAMING
        require(_value <= super.BALANCEOF525(_who), "Balance is too small.");

        _BURN179(_who, _value);
        emit BURN453(_who, _value);
    }

    //lockable
    struct LockInfo {
        uint256 releaseTime;
        uint256 balance;
    }
    mapping(address => LockInfo[]) internal lockInfo;

    event LOCK909(address indexed holder, uint256 value, uint256 releaseTime);	//inject NONSTANDARD NAMING
    event UNLOCK709(address indexed holder, uint256 value);	//inject NONSTANDARD NAMING

    function BALANCEOF525(address _holder) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        uint256 lockedBalance = 0;
        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            lockedBalance = lockedBalance.ADD958(lockInfo[_holder][i].balance);
        }
        return super.BALANCEOF525(_holder).ADD958(lockedBalance);
    }

    function RELEASELOCK317(address _holder) internal {	//inject NONSTANDARD NAMING

        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            if (lockInfo[_holder][i].releaseTime <= now) {
                _balances[_holder] = _balances[_holder].ADD958(lockInfo[_holder][i].balance);
                emit UNLOCK709(_holder, lockInfo[_holder][i].balance);
                lockInfo[_holder][i].balance = 0;

                if (i != lockInfo[_holder].length - 1) {
                    lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
                    i--;
                }
                lockInfo[_holder].length--;

            }
        }
    }
    function LOCKCOUNT428(address _holder) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return lockInfo[_holder].length;
    }
    function LOCKSTATE963(address _holder, uint256 _idx) public view returns (uint256, uint256) {	//inject NONSTANDARD NAMING
        return (lockInfo[_holder][_idx].releaseTime, lockInfo[_holder][_idx].balance);
    }

    function LOCK979(address _holder, uint256 _amount, uint256 _releaseTime) public ONLYOWNER48 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF525(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB465(_amount);
        lockInfo[_holder].push(
            LockInfo(_releaseTime, _amount)
        );
        emit LOCK909(_holder, _amount, _releaseTime);
    }

    function LOCKAFTER786(address _holder, uint256 _amount, uint256 _afterTime) public ONLYOWNER48 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF525(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB465(_amount);
        lockInfo[_holder].push(
            LockInfo(now + _afterTime, _amount)
        );
        emit LOCK909(_holder, _amount, now + _afterTime);
    }

    function UNLOCK903(address _holder, uint256 i) public ONLYOWNER48 {	//inject NONSTANDARD NAMING
        require(i < lockInfo[_holder].length, "No lock information.");

        _balances[_holder] = _balances[_holder].ADD958(lockInfo[_holder][i].balance);
        emit UNLOCK709(_holder, lockInfo[_holder][i].balance);
        lockInfo[_holder][i].balance = 0;

        if (i != lockInfo[_holder].length - 1) {
            lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
        }
        lockInfo[_holder].length--;
    }

    function TRANSFERWITHLOCK60(address _to, uint256 _value, uint256 _releaseTime) public ONLYOWNER48 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF525(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB465(_value);
        lockInfo[_to].push(
            LockInfo(_releaseTime, _value)
        );
        emit TRANSFER356(owner, _to, _value);
        emit LOCK909(_to, _value, _releaseTime);

        return true;
    }

    function TRANSFERWITHLOCKAFTER99(address _to, uint256 _value, uint256 _afterTime) public ONLYOWNER48 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF525(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB465(_value);
        lockInfo[_to].push(
            LockInfo(now + _afterTime, _value)
        );
        emit TRANSFER356(owner, _to, _value);
        emit LOCK909(_to, _value, now + _afterTime);

        return true;
    }

    function CURRENTTIME266() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now;
    }

    function AFTERTIME483(uint256 _value) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now + _value;
    }

    //airdrop
    mapping (address => uint256) public airDropHistory;
    event AIRDROP126(address _receiver, uint256 _amount);	//inject NONSTANDARD NAMING

    function DROPTOKEN894(address[] memory receivers, uint256[] memory values) ONLYOWNER48 public {	//inject NONSTANDARD NAMING
    require(receivers.length != 0);
    require(receivers.length == values.length);

    for (uint256 i = 0; i < receivers.length; i++) {
      address receiver = receivers[i];
      uint256 amount = values[i];

      TRANSFER157(receiver, amount);
      airDropHistory[receiver] += amount;

      emit AIRDROP126(receiver, amount);
    }
  }
}