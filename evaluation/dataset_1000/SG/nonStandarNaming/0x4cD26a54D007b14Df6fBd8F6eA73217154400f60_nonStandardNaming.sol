                                                                 

pragma solidity 0.5.16;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER217() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA654() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY448() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF609(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER245(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE331(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE860(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM112(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER723(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL679(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD476(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB729(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB729(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB729(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL791(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV447(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV447(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV447(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD279(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD279(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD279(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

                                                     
    function TOTALSUPPLY448() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                   
    function BALANCEOF609(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                    
    function TRANSFER245(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER64(_MSGSENDER217(), recipient, amount);
        return true;
    }

                                                   
    function ALLOWANCE331(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                   
    function APPROVE860(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE994(_MSGSENDER217(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function TRANSFERFROM112(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER64(sender, recipient, amount);
        _APPROVE994(sender, _MSGSENDER217(), _allowances[sender][_MSGSENDER217()].SUB729(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                    
    function INCREASEALLOWANCE351(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE994(_MSGSENDER217(), spender, _allowances[_MSGSENDER217()][spender].ADD476(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE795(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE994(_MSGSENDER217(), spender, _allowances[_MSGSENDER217()][spender].SUB729(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER64(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB729(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD476(amount);
        emit TRANSFER723(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT394(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD476(amount);
        _balances[account] = _balances[account].ADD476(amount);
        emit TRANSFER723(address(0), account, amount);
    }

                                                                                                                                                                                                                                                                                                                        
    function _BURN223(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB729(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB729(amount);
        emit TRANSFER723(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE994(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL679(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM487(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN223(account, amount);
        _APPROVE994(account, _MSGSENDER217(), _allowances[account][_MSGSENDER217()].SUB729(amount, "ERC20: burn amount exceeds allowance"));
    }
}

                                                                         
library Math {
                                                               
    function MAX156(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN678(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE575(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED816(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        address msgSender = _MSGSENDER217();
        _owner = msgSender;
        emit OWNERSHIPTRANSFERRED816(address(0), msgSender);
    }

                                                                     
    function OWNER668() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER727() {	//inject NONSTANDARD NAMING
        require(ISOWNER198(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER198() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER217() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP347() public ONLYOWNER727 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED816(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP258(address newOwner) public ONLYOWNER727 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP907(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP907(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED816(_owner, newOwner);
        _owner = newOwner;
    }
}

contract TokenVesting is Ownable {
    using SafeMath for uint256;
    using SafeMath for uint16;

    ERC20 public token;

    address public recipient;
    uint256 public totalAmount;
    uint256 private startTime = ~uint256(0);
    uint256 public releaseInterval;
    uint16 public totalReleaseCount;

    uint256 public paidAmount;

    modifier ONLYRECIPIENT61 () {	//inject NONSTANDARD NAMING
        require(msg.sender == recipient, "NOT_RECIPIENT");
        _;
    }

    constructor(ERC20 _token) public {
        require(address(_token) != address(0));
        token = _token;
    }

    function SETVESTING155(address _recipient, uint256 _amount, uint256 _startTime, uint256 _releaseInterval, uint16 _releaseCount) external ONLYOWNER727 {	//inject NONSTANDARD NAMING
        require(startTime > block.timestamp, "VESTING_ALREADY_STARTED");
        require(_startTime > block.timestamp, "INVALID_START_TIME");
        require(_releaseCount > 0, "INVALID_RELEASE_COUNT");
        require(token.BALANCEOF609(address(this)) >= _amount, "INSUFFICIENT_TOKEN_BALANCE");

        startTime = _startTime;
        releaseInterval = _releaseInterval;
        totalReleaseCount = _releaseCount;
        totalAmount = _amount;
        recipient = _recipient;
    }

    function CANCELVESTING577() external ONLYOWNER727 {	//inject NONSTANDARD NAMING
        require(!ISVESTINGSTARTED412() , "VESTING_ALREADY_STARTED");

        token.TRANSFER245(OWNER668(), token.BALANCEOF609(address(this)));

        startTime = ~uint256(0);
        releaseInterval = 0;
        totalReleaseCount = 0;
        paidAmount = 0;
        recipient = address(0);
    }

    function CLAIM71() public ONLYRECIPIENT61 {	//inject NONSTANDARD NAMING
        uint256 claimingAmount = CLAIMABLEAMOUNT993();
        token.TRANSFER245(recipient, claimingAmount);
        paidAmount = paidAmount.ADD476(claimingAmount);
    }

    function CLAIMABLEAMOUNT993() public view returns(uint256) {	//inject NONSTANDARD NAMING
        if (startTime > block.timestamp) 
            return 0;
        
        uint256 elapsedTime = block.timestamp.SUB729(startTime);
        // Check if all releases are gone
        uint256 totalApproved = AMOUNTPERRELEASE406().MUL791(Math.MIN678(elapsedTime.DIV447(releaseInterval), totalReleaseCount));
        return totalApproved.SUB729(paidAmount);
    }
    
    function AMOUNTPERRELEASE406() public view returns(uint256) {	//inject NONSTANDARD NAMING
        return totalAmount.DIV447(totalReleaseCount);
    }

    function NEXTRELEASETIMESTAMP323() public view returns(uint256) {	//inject NONSTANDARD NAMING
        if (!ISVESTINGSET850()) {
            return 0;
        }

        if (!ISVESTINGSTARTED412()) {
            return startTime.ADD476(releaseInterval);
        }

        uint256 elapsedTime = block.timestamp.SUB729(startTime);
        uint256 pastReleaseCount = elapsedTime.DIV447(releaseInterval);

        if (pastReleaseCount > totalReleaseCount) {
            return 0;
        }
        return startTime.ADD476(releaseInterval.MUL791(pastReleaseCount + 1));
    }

    function ISVESTINGSTARTED412() public view returns(bool) {	//inject NONSTANDARD NAMING
        return ISVESTINGSET850() && startTime <= block.timestamp;
    }

    function ISVESTINGSET850() public view returns(bool) {	//inject NONSTANDARD NAMING
        return totalReleaseCount > 0;
    }
}