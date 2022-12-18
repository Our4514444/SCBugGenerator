                                                                 

pragma solidity ^0.5.4;



                                                                                        
interface IERC20 {
    function TRANSFER565(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE137(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM592(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY500() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF89(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE970(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER320(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL524(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol

                                                                                                   
library SafeMath {
                                                                                
    function MUL119(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                         
    function DIV165(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                            
    function SUB17(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                          
    function ADD758(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                 
    function MOD63(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                             
    function TOTALSUPPLY500() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                          
    function BALANCEOF89(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE970(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                             
    function TRANSFER565(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER174(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE137(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit APPROVAL524(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM592(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _allowed[from][msg.sender] = _allowed[from][msg.sender].SUB17(value);
        _TRANSFER174(from, to, value);
        emit APPROVAL524(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function INCREASEALLOWANCE776(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].ADD758(addedValue);
        emit APPROVAL524(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    function DECREASEALLOWANCE188(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        require(spender != address(0));

        _allowed[msg.sender][spender] = _allowed[msg.sender][spender].SUB17(subtractedValue);
        emit APPROVAL524(msg.sender, spender, _allowed[msg.sender][spender]);
        return true;
    }

                                                                                                                                                                                                               
    function _TRANSFER174(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB17(value);
        _balances[to] = _balances[to].ADD758(value);
        emit TRANSFER320(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT696(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD758(value);
        _balances[account] = _balances[account].ADD758(value);
        emit TRANSFER320(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN534(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB17(value);
        _balances[account] = _balances[account].SUB17(value);
        emit TRANSFER320(account, address(0), value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM271(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _allowed[account][msg.sender] = _allowed[account][msg.sender].SUB17(value);
        _BURN534(account, value);
        emit APPROVAL524(account, msg.sender, _allowed[account][msg.sender]);
    }
}

// File: contracts\TIP.sol

contract Tip is ERC20 {
    string public constant name269 = "technology innovation project"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    string public constant symbol191 = "TIP"; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    uint8 public constant decimals526 = 18; // solium-disable-line uppercase	//inject NONSTANDARD NAMING
    uint256 public constant initialsupply524 = 3300000 * (10 ** uint256(decimals526));	//inject NONSTANDARD NAMING

    constructor() public {
        super._MINT696(msg.sender, initialsupply524);
        owner = msg.sender;
    }

    //ownership
    address public owner;

    event OWNERSHIPRENOUNCED474(address indexed previousOwner);	//inject NONSTANDARD NAMING
    event OWNERSHIPTRANSFERRED494(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
    );

    modifier ONLYOWNER99() {	//inject NONSTANDARD NAMING
        require(msg.sender == owner, "Not owner");
        _;
    }

                                                                                                                                                                                                                                                                   
    function RENOUNCEOWNERSHIP755() public ONLYOWNER99 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPRENOUNCED474(owner);
        owner = address(0);
    }

                                                                                                                                                             
    function TRANSFEROWNERSHIP28(address _newOwner) public ONLYOWNER99 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP715(_newOwner);
    }

                                                                                                                                  
    function _TRANSFEROWNERSHIP715(address _newOwner) internal {	//inject NONSTANDARD NAMING
        require(_newOwner != address(0), "Already owner");
        emit OWNERSHIPTRANSFERRED494(owner, _newOwner);
        owner = _newOwner;
    }

    //pausable
    event PAUSE770();	//inject NONSTANDARD NAMING
    event UNPAUSE184();	//inject NONSTANDARD NAMING

    bool public paused = false;

                                                                                                    
    modifier WHENNOTPAUSED296() {	//inject NONSTANDARD NAMING
        require(!paused, "Paused by owner");
        _;
    }

                                                                                                
    modifier WHENPAUSED225() {	//inject NONSTANDARD NAMING
        require(paused, "Not paused now");
        _;
    }

                                                                              
    function PAUSE916() public ONLYOWNER99 WHENNOTPAUSED296 {	//inject NONSTANDARD NAMING
        paused = true;
        emit PAUSE770();
    }

                                                                                 
    function UNPAUSE327() public ONLYOWNER99 WHENPAUSED225 {	//inject NONSTANDARD NAMING
        paused = false;
        emit UNPAUSE184();
    }

    //freezable
    event FROZEN992(address target);	//inject NONSTANDARD NAMING
    event UNFROZEN814(address target);	//inject NONSTANDARD NAMING

    mapping(address => bool) internal freezes;

    modifier WHENNOTFROZEN661() {	//inject NONSTANDARD NAMING
        require(!freezes[msg.sender], "Sender account is locked.");
        _;
    }

    function FREEZE409(address _target) public ONLYOWNER99 {	//inject NONSTANDARD NAMING
        freezes[_target] = true;
        emit FROZEN992(_target);
    }

    function UNFREEZE252(address _target) public ONLYOWNER99 {	//inject NONSTANDARD NAMING
        freezes[_target] = false;
        emit UNFROZEN814(_target);
    }

    function ISFROZEN498(address _target) public view returns (bool) {	//inject NONSTANDARD NAMING
        return freezes[_target];
    }

    function TRANSFER565(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _value
    )
      public
      WHENNOTFROZEN661
      WHENNOTPAUSED296
      returns (bool)
    {
        RELEASELOCK243(msg.sender);
        return super.TRANSFER565(_to, _value);
    }

    function TRANSFERFROM592(	//inject NONSTANDARD NAMING
        address _from,
        address _to,
        uint256 _value
    )
      public
      WHENNOTPAUSED296
      returns (bool)
    {
        require(!freezes[_from], "From account is locked.");
        RELEASELOCK243(_from);
        return super.TRANSFERFROM592(_from, _to, _value);
    }

    //mintable
    event MINT772(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

    function MINT897(	//inject NONSTANDARD NAMING
        address _to,
        uint256 _amount
    )
      public
      ONLYOWNER99
      returns (bool)
    {
        super._MINT696(_to, _amount);
        emit MINT772(_to, _amount);
        return true;
    }

    //burnable
    event BURN213(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

    function BURN934(address _who, uint256 _value) public ONLYOWNER99 {	//inject NONSTANDARD NAMING
        require(_value <= super.BALANCEOF89(_who), "Balance is too small.");

        _BURN534(_who, _value);
        emit BURN213(_who, _value);
    }

    //lockable
    struct LockInfo {
        uint256 releaseTime;
        uint256 balance;
    }
    mapping(address => LockInfo[]) internal lockInfo;

    event LOCK56(address indexed holder, uint256 value, uint256 releaseTime);	//inject NONSTANDARD NAMING
    event UNLOCK536(address indexed holder, uint256 value);	//inject NONSTANDARD NAMING

    function BALANCEOF89(address _holder) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
        uint256 lockedBalance = 0;
        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            lockedBalance = lockedBalance.ADD758(lockInfo[_holder][i].balance);
        }
        return super.BALANCEOF89(_holder).ADD758(lockedBalance);
    }

    function RELEASELOCK243(address _holder) internal {	//inject NONSTANDARD NAMING

        for(uint256 i = 0; i < lockInfo[_holder].length ; i++ ) {
            if (lockInfo[_holder][i].releaseTime <= now) {
                _balances[_holder] = _balances[_holder].ADD758(lockInfo[_holder][i].balance);
                emit UNLOCK536(_holder, lockInfo[_holder][i].balance);
                lockInfo[_holder][i].balance = 0;

                if (i != lockInfo[_holder].length - 1) {
                    lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
                    i--;
                }
                lockInfo[_holder].length--;

            }
        }
    }
    function LOCKCOUNT387(address _holder) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return lockInfo[_holder].length;
    }
    function LOCKSTATE286(address _holder, uint256 _idx) public view returns (uint256, uint256) {	//inject NONSTANDARD NAMING
        return (lockInfo[_holder][_idx].releaseTime, lockInfo[_holder][_idx].balance);
    }

    function LOCK159(address _holder, uint256 _amount, uint256 _releaseTime) public ONLYOWNER99 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF89(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB17(_amount);
        lockInfo[_holder].push(
            LockInfo(_releaseTime, _amount)
        );
        emit LOCK56(_holder, _amount, _releaseTime);
    }

    function LOCKAFTER445(address _holder, uint256 _amount, uint256 _afterTime) public ONLYOWNER99 {	//inject NONSTANDARD NAMING
        require(super.BALANCEOF89(_holder) >= _amount, "Balance is too small.");
        _balances[_holder] = _balances[_holder].SUB17(_amount);
        lockInfo[_holder].push(
            LockInfo(now + _afterTime, _amount)
        );
        emit LOCK56(_holder, _amount, now + _afterTime);
    }

    function UNLOCK748(address _holder, uint256 i) public ONLYOWNER99 {	//inject NONSTANDARD NAMING
        require(i < lockInfo[_holder].length, "No lock information.");

        _balances[_holder] = _balances[_holder].ADD758(lockInfo[_holder][i].balance);
        emit UNLOCK536(_holder, lockInfo[_holder][i].balance);
        lockInfo[_holder][i].balance = 0;

        if (i != lockInfo[_holder].length - 1) {
            lockInfo[_holder][i] = lockInfo[_holder][lockInfo[_holder].length - 1];
        }
        lockInfo[_holder].length--;
    }

    function TRANSFERWITHLOCK939(address _to, uint256 _value, uint256 _releaseTime) public ONLYOWNER99 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF89(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB17(_value);
        lockInfo[_to].push(
            LockInfo(_releaseTime, _value)
        );
        emit TRANSFER320(owner, _to, _value);
        emit LOCK56(_to, _value, _releaseTime);

        return true;
    }

    function TRANSFERWITHLOCKAFTER915(address _to, uint256 _value, uint256 _afterTime) public ONLYOWNER99 returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0), "wrong address");
        require(_value <= super.BALANCEOF89(owner), "Not enough balance");

        _balances[owner] = _balances[owner].SUB17(_value);
        lockInfo[_to].push(
            LockInfo(now + _afterTime, _value)
        );
        emit TRANSFER320(owner, _to, _value);
        emit LOCK56(_to, _value, now + _afterTime);

        return true;
    }

    function CURRENTTIME937() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now;
    }

    function AFTERTIME970(uint256 _value) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return now + _value;
    }
}