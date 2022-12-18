                                                                 

pragma solidity 0.5.8;

// File: node_modules\openzeppelin-solidity\contracts\token\ERC20\IERC20.sol

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY787() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF759(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER123(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE181(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    function APPROVE136(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM534(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER507(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL103(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: node_modules\openzeppelin-solidity\contracts\math\SafeMath.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD253(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB242(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL563(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV695(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD940(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                     
    function TOTALSUPPLY787() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF759(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER123(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER107(msg.sender, recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE181(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE136(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE106(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function TRANSFERFROM534(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER107(sender, recipient, amount);
        _APPROVE106(sender, msg.sender, _allowances[sender][msg.sender].SUB242(amount));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE563(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE106(msg.sender, spender, _allowances[msg.sender][spender].ADD253(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE762(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE106(msg.sender, spender, _allowances[msg.sender][spender].SUB242(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER107(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB242(amount);
        _balances[recipient] = _balances[recipient].ADD253(amount);
        emit TRANSFER507(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT564(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD253(amount);
        _balances[account] = _balances[account].ADD253(amount);
        emit TRANSFER507(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN590(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _totalSupply = _totalSupply.SUB242(value);
        _balances[account] = _balances[account].SUB242(value);
        emit TRANSFER507(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE106(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit APPROVAL103(owner, spender, value);
    }

                                                                                                                                                                          
    function _BURNFROM57(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN590(account, amount);
        _APPROVE106(account, msg.sender, _allowances[account][msg.sender].SUB242(amount));
    }
}

// File: J\contracts\Ohmaco.sol

contract Ohmaco is ERC20 {
    string public constant name239 = "Ohmaco"; 	//inject NONSTANDARD NAMING
    string public constant symbol698 = "OMC"; 	//inject NONSTANDARD NAMING
    uint8 public constant decimals555 = 18; 	//inject NONSTANDARD NAMING
    uint256 public constant initialsupply611 = 5000000000 * (10 ** uint256(decimals555));	//inject NONSTANDARD NAMING
    
    constructor() public {
        super._MINT564(msg.sender, initialsupply611);
        owner = msg.sender;
    }

    //ownership
    address public owner;

    event OWNERSHIPRENOUNCED435(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED316(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
    );

    modifier ONLYOWNER609() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Not owner");
        _;
    }

                                                                                                                                                                                                                                                                   
    function RENOUNCEOWNERSHIP829() public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED435(owner);
        owner = address(0);
    }

                                                                                                                                                             
    function TRANSFEROWNERSHIP599(address _newOwner) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP813(_newOwner);
    }

                                                                                                                                  
    function _TRANSFEROWNERSHIP813(address _newOwner) internal {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Already owner");
        emit OWNERSHIPTRANSFERRED316(owner, _newOwner);
        owner = _newOwner;
    }

    //pausable
    event PAUSE57();	//inject NONSTANDARD NAMING
    event UNPAUSE216();	//inject NONSTANDARD NAMING

    bool public paused = false;
    
                                                                                                    
    modifier WHENNOTPAUSED762() {	//inject NONSTANDARD NAMING
        require(!paused, "Paused by owner");
        _;
    }

                                                                                                
    modifier WHENPAUSED878() {	//inject NONSTANDARD NAMING
        require(paused, "Not paused now");
        _;
    }

                                                                              
    function PAUSE880() public ONLYOWNER609 WHENNOTPAUSED762 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE57();
    }

                                                                                 
    function UNPAUSE921() public ONLYOWNER609 WHENPAUSED878 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE216();
    }

    //freezable
    event FROZEN745(address target);	//inject NONSTANDARD NAMING
    event UNFROZEN533(address target);	//inject NONSTANDARD NAMING

    mapping(address => bool) internal freezes;

    modifier WHENNOTFROZEN328() {	//inject NONSTANDARD NAMING
        require(!freezes[msg.sender], "Sender account is locked.");
        _;
    }

    function FREEZE773(address _target) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        freezes[_target] = true;
        emit FROZEN745(_target);
    }

    function UNFREEZE114(address _target) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        freezes[_target] = false;
        emit UNFROZEN533(_target);
    }

    function ISFROZEN623(address _target) public view returns (bool) {	//inject NONSTANDARD NAMING
        return freezes[_target];
    }

    function TRANSFER123(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _value
    )
      public
      WHENNOTFROZEN328
      WHENNOTPAUSED762
      returns (bool)
    {
        RELEASELOCK850(msg.sender);
        return super.TRANSFER123(_to, _value);
    }

    function TRANSFERFROM534(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value
    )
      public
      WHENNOTPAUSED762
      returns (bool)
    {
        require(!freezes[_from], "From account is locked.");
        RELEASELOCK850(_from);
        return super.TRANSFERFROM534(_from, _to, _value);
    }

    //mintable
    event MINT681(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

    function MINT402(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _amount
    )
      public
      ONLYOWNER609
      returns (bool)
    {
        super._MINT564(_to, _amount);
        emit MINT681(_to, _amount);
        return true;
    }

    //burnable
    event BURN300(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

    function BURN77(address _who, uint256 _value) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        require(_value <= super.BALANCEOF759(_who), "Balance is too small.");

        _BURN590(_who, _value);
        emit BURN300(_who, _value);
    }

    //lockable
    struct LockInfo {
        uint256 releaseTime;
        uint256 balance;
    }
    mapping(address => LockInfo[]) internal lockInfo;

    event LOCK401(address indexed holder, uint256 value, uint256 releaseTime);	//inject NONSTANDARD NAMING
    event UNLOCK846(address indexed holder, uint256 value);	//inject NONSTANDARD NAMING

    function BALANCEOF759(address _holder) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        uint256 lockedBalance = 0;
        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            lockedBalance = lockedBalance.ADD253(lockInfo[_holder][i].balance);
        }
        return super.BALANCEOF759(_holder).ADD253(lockedBalance);
    }

    function RELEASELOCK850(address _holder) internal {	//inject NONSTANDARD NAMING

        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            if (lockInfo[_holder][i].releaseTime <= now) {
                _balances[_holder] = _balances[_holder].ADD253(lockInfo[_holder][i].balance);
                emit UNLOCK846(_holder, lockInfo[_holder][i].balance);
                lockInfo[_holder][i].balance = 0;

                if (i != lockInfo[_holder].length - 1) {
                    lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
                    i--;
                }
                lockInfo[_holder].length--;

            }
        }
    }
    function LOCKCOUNT633(address _holder) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return lockInfo[_holder].length;
    }
    function LOCKSTATE39(address _holder, uint256 _idx) public view returns (uint256, uint256) {	//inject NONSTANDARD NAMING
        return (lockInfo[_holder][_idx].releaseTime, lockInfo[_holder][_idx].balance);
    }

    function LOCK462(address _holder, uint256 _amount, uint256 _releaseTime) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF759(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB242(_amount);
        lockInfo[_holder].push(
            LockInfo(_releaseTime, _amount)
        );
        emit LOCK401(_holder, _amount, _releaseTime);
    }

    function LOCKAFTER279(address _holder, uint256 _amount, uint256 _afterTime) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF759(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB242(_amount);
        lockInfo[_holder].push(
            LockInfo(now + _afterTime, _amount)
        );
        emit LOCK401(_holder, _amount, now + _afterTime);
    }

    function UNLOCK745(address _holder, uint256 i) public ONLYOWNER609 {	//inject NONSTANDARD NAMING
        require(i < lockInfo[_holder].length, "No lock information.");

        _balances[_holder] = _balances[_holder].ADD253(lockInfo[_holder][i].balance);
        emit UNLOCK846(_holder, lockInfo[_holder][i].balance);
        lockInfo[_holder][i].balance = 0;

        if (i != lockInfo[_holder].length - 1) {
            lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
        }
        lockInfo[_holder].length--;
    }

    function TRANSFERWITHLOCK828(address _to, uint256 _value, uint256 _releaseTime) public ONLYOWNER609 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF759(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB242(_value);
        lockInfo[_to].push(
            LockInfo(_releaseTime, _value)
        );
        emit TRANSFER507(owner, _to, _value);
        emit LOCK401(_to, _value, _releaseTime);

        return true;
    }

    function TRANSFERWITHLOCKAFTER387(address _to, uint256 _value, uint256 _afterTime) public ONLYOWNER609 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF759(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB242(_value);
        lockInfo[_to].push(
            LockInfo(now + _afterTime, _value)
        );
        emit TRANSFER507(owner, _to, _value);
        emit LOCK401(_to, _value, now + _afterTime);

        return true;
    }

    function CURRENTTIME821() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now;
    }

    function AFTERTIME856(uint256 _value) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now + _value;
    }

    //airdrop
    mapping (address => uint256) public airDropHistory;
    event AIRDROP52(address _receiver, uint256 _amount);	//inject NONSTANDARD NAMING

    function DROPTOKEN903(address[] memory receivers, uint256[] memory values) ONLYOWNER609 public {	//inject NONSTANDARD NAMING
    require(receivers.length != 0);
    require(receivers.length == values.length);

    for (uint256 i = 0; i < receivers.length; i++) {
      address receiver = receivers[i];
      uint256 amount = values[i];

      TRANSFER123(receiver, amount);
      airDropHistory[receiver] += amount;

      emit AIRDROP52(receiver, amount);
    }
  }
}