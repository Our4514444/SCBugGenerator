                                                                 

pragma solidity 0.5.17;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

                                                                         
library Math {
                                                               
    function MAX440(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN450(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE72(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD643(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB927(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB927(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB927(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL822(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV61(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV61(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV61(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD678(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD678(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD678(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER255() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA672() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED904(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER255();
        emit OWNERSHIPTRANSFERRED904(address(0), _owner);
    }

                                                                     
    function OWNER760() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER642() {	//inject NONSTANDARD NAMING
        require(ISOWNER665(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER665() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER255() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP710() public ONLYOWNER642 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED904(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP280(address newOwner) public ONLYOWNER642 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP395(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP395(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED904(_owner, newOwner);
        _owner = newOwner;
    }
}


                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY489() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF479(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER801(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE995(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE96(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM343(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER836(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL886(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT201(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }

                                                                                                                                                                                                          
    function TOPAYABLE801(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE1(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}



                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER991(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN655(token, abi.encodeWithSelector(token.TRANSFER801.selector, to, value));
    }

    function SAFETRANSFERFROM815(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN655(token, abi.encodeWithSelector(token.TRANSFERFROM343.selector, from, to, value));
    }

    function SAFEAPPROVE323(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE995(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN655(token, abi.encodeWithSelector(token.APPROVE96.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE841(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE995(address(this), spender).ADD643(value);
        CALLOPTIONALRETURN655(token, abi.encodeWithSelector(token.APPROVE96.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE860(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE995(address(this), spender).SUB927(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN655(token, abi.encodeWithSelector(token.APPROVE96.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN655(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT201(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}




contract IRewardDistributionRecipient is Ownable {
    address public rewardDistribution;

    function NOTIFYREWARDAMOUNT890(uint256 reward, uint256 _duration) external;	//inject NONSTANDARD NAMING

    modifier ONLYREWARDDISTRIBUTION416() {	//inject NONSTANDARD NAMING
        require(_MSGSENDER255() == rewardDistribution, "Caller is not reward distribution");
        _;
    }

    function SETREWARDDISTRIBUTION754(address _rewardDistribution) external ONLYOWNER642 {	//inject NONSTANDARD NAMING
        rewardDistribution = _rewardDistribution;
    }
}


contract LPTokenWrapper {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    IERC20 public lpToken;

    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;

    constructor(address _lpToken) internal {
        lpToken = IERC20(_lpToken);
    }

    function TOTALSUPPLY489() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF479(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function STAKE715(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.ADD643(amount);
        _balances[msg.sender] = _balances[msg.sender].ADD643(amount);
        lpToken.SAFETRANSFERFROM815(msg.sender, address(this), amount);
    }

    function WITHDRAW915(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.SUB927(amount);
        _balances[msg.sender] = _balances[msg.sender].SUB927(amount);
        lpToken.SAFETRANSFER991(msg.sender, amount);
    }
}

contract WARPool is LPTokenWrapper, IRewardDistributionRecipient {
    IERC20 public constant war349 = IERC20(0xf4A81C18816C9B0AB98FAC51B36Dcb63b0E58Fde);	//inject NONSTANDARD NAMING

    string public desc;

    uint256 public DURATION;
    uint256 public starttime;

    uint256 public periodFinish = 0;
    uint256 public rewardRate = 0;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored;
    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;

    event REWARDADDED199(uint256 reward);	//inject NONSTANDARD NAMING
    event STAKED916(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event WITHDRAWN616(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event REWARDPAID120(address indexed user, uint256 reward);	//inject NONSTANDARD NAMING

    constructor(address _lpToken, string memory _desc, uint256 _starttime) public LPTokenWrapper(_lpToken) {
        rewardDistribution = msg.sender;
        desc = _desc;
        starttime = _starttime;
    }

    function SETSTARTTIME990(uint256 _starttime) external ONLYOWNER642 {	//inject NONSTANDARD NAMING
        require(block.timestamp < starttime, "started");
        starttime = _starttime;
    }

    modifier CHECKSTART765(){	//inject NONSTANDARD NAMING
        require(block.timestamp >= starttime, "not started");
        _;
    }

    modifier UPDATEREWARD520(address account) {	//inject NONSTANDARD NAMING
        rewardPerTokenStored = REWARDPERTOKEN730();
        lastUpdateTime = LASTTIMEREWARDAPPLICABLE208();
        if (account != address(0)) {
            rewards[account] = EARNED66(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }


    function LASTTIMEREWARDAPPLICABLE208() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return Math.MIN450(block.timestamp, periodFinish);
    }

    function REWARDPERTOKEN730() public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (TOTALSUPPLY489() == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored.ADD643(
                LASTTIMEREWARDAPPLICABLE208()
                    .SUB927(lastUpdateTime)
                    .MUL822(rewardRate)
                    .MUL822(1e18)
                    .DIV61(TOTALSUPPLY489())
            );
    }

    function EARNED66(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return
            BALANCEOF479(account)
                .MUL822(REWARDPERTOKEN730().SUB927(userRewardPerTokenPaid[account]))
                .DIV61(1e18)
                .ADD643(rewards[account]);
    }

    function STAKE715(uint256 amount) public UPDATEREWARD520(msg.sender) CHECKSTART765 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot stake 0");
        super.STAKE715(amount);
        emit STAKED916(msg.sender, amount);
    }

    function WITHDRAW915(uint256 amount) public UPDATEREWARD520(msg.sender) CHECKSTART765 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot withdraw 0");
        super.WITHDRAW915(amount);
        emit WITHDRAWN616(msg.sender, amount);
    }

    function EXIT305() external {	//inject NONSTANDARD NAMING
        WITHDRAW915(BALANCEOF479(msg.sender));
        GETREWARD691();
    }

    function GETREWARD691() public UPDATEREWARD520(msg.sender) CHECKSTART765 {	//inject NONSTANDARD NAMING
        uint256 reward = EARNED66(msg.sender);
        if (reward > 0) {
            rewards[msg.sender] = 0;
            war349.SAFETRANSFER991(msg.sender, reward);
            emit REWARDPAID120(msg.sender, reward);
        }
    }

    function NOTIFYREWARDAMOUNT890(uint256 _reward, uint256 _duration) external ONLYREWARDDISTRIBUTION416 UPDATEREWARD520(address(0)) {	//inject NONSTANDARD NAMING
        require(_duration != 0, "Duration must not be 0");
        require(_reward != 0, "Reward must not be 0");

        war349.SAFETRANSFERFROM815(msg.sender, address(this), _reward);
        DURATION = _duration;
        if (block.timestamp > starttime) {
            if (block.timestamp >= periodFinish) {
                rewardRate = _reward.DIV61(_duration);
            } else {
                uint256 remaining = periodFinish.SUB927(block.timestamp);
                uint256 leftover = remaining.MUL822(rewardRate);
                rewardRate = _reward.ADD643(leftover).DIV61(_duration);
            }
            lastUpdateTime = block.timestamp;
            periodFinish = block.timestamp.ADD643(_duration);
            emit REWARDADDED199(_reward);
        } else {
            rewardRate = _reward.DIV61(_duration);
            lastUpdateTime = starttime;
            periodFinish = starttime.ADD643(_duration);
            emit REWARDADDED199(_reward);
        }
    }
}