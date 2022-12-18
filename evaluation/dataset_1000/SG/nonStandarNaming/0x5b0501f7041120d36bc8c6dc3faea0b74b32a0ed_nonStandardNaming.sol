                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

// File: @openzeppelin/contracts/math/Math.sol

pragma solidity 0.5.15;

                                                                         
library Math {
                                                               
    function MAX22(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN591(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE356(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity 0.5.15;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD422(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB473(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB473(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB473(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL338(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV71(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV71(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV71(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD732(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD732(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD732(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/GSN/Context.sol

pragma solidity 0.5.15;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER91() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA190() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

pragma solidity 0.5.15;

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED477(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER91();
        emit OWNERSHIPTRANSFERRED477(address(0), _owner);
    }

                                                                     
    function OWNER394() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER123() {	//inject NONSTANDARD NAMING
        require(ISOWNER872(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER872() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER91() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP143() public ONLYOWNER123 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED477(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP823(address newOwner) public ONLYOWNER123 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP652(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP652(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED477(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

pragma solidity 0.5.15;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY205() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF433(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER1(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function MINT718(address account, uint amount) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE398(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE981(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM910(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER90(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL960(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity 0.5.15;

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT755(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                          
    function TOPAYABLE428(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE803(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

pragma solidity 0.5.15;




                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER142(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN180(token, abi.encodeWithSelector(token.TRANSFER1.selector, to, value));
    }

    function SAFETRANSFERFROM765(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN180(token, abi.encodeWithSelector(token.TRANSFERFROM910.selector, from, to, value));
    }

    function SAFEAPPROVE692(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE398(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN180(token, abi.encodeWithSelector(token.APPROVE981.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE643(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE398(address(this), spender).ADD422(value);
        CALLOPTIONALRETURN180(token, abi.encodeWithSelector(token.APPROVE981.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE987(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE398(address(this), spender).SUB473(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN180(token, abi.encodeWithSelector(token.APPROVE981.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN180(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT755(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: contracts/IRewardDistributionRecipient.sol

pragma solidity 0.5.15;



contract IRewardDistributionRecipient is Ownable {
    address public rewardDistribution;

    function NOTIFYREWARDAMOUNT740(uint256 reward) external;	//inject NONSTANDARD NAMING

    modifier ONLYREWARDDISTRIBUTION140() {	//inject NONSTANDARD NAMING
        require(_MSGSENDER91() == rewardDistribution, "Caller is not reward distribution");
        _;
    }

    function SETREWARDDISTRIBUTION438(address _rewardDistribution)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER123
    {
        rewardDistribution = _rewardDistribution;
    }
}

// File: contracts/CurveRewards.sol

pragma solidity 0.5.15;






contract LPTokenWrapper {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    IERC20 public uni_lp = IERC20(0xb93Cc05334093c6B3b8Bfd29933bb8d5C031caBC);

    uint256 private _totalSupply;

    mapping(address => uint256) private _balances;

    function TOTALSUPPLY205() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF433(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function STAKE608(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.ADD422(amount);
        _balances[msg.sender] = _balances[msg.sender].ADD422(amount);
        uni_lp.SAFETRANSFERFROM765(msg.sender, address(this), amount);
    }

    function WITHDRAW51(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.SUB473(amount);
        _balances[msg.sender] = _balances[msg.sender].SUB473(amount);
        uni_lp.SAFETRANSFER142(msg.sender, amount);
    }
}

interface YAM {
    function YAMSSCALINGFACTOR981() external returns (uint256);	//inject NONSTANDARD NAMING
    function MINT718(address to, uint256 amount) external;	//inject NONSTANDARD NAMING
}

contract YAMIncentivizer is LPTokenWrapper, IRewardDistributionRecipient {
    IERC20 public yam = IERC20(0x0AaCfbeC6a24756c20D41914F2caba817C0d8521);
    uint256 public constant duration821 = 7 days;	//inject NONSTANDARD NAMING

    uint256 public initreward = 925 * 10**2 * 10**18; // 92.5k
    uint256 public starttime = 1600545600; // 2020-09-19 8:00:00 PM (UTC +00:00)
    uint256 public periodFinish = 0;
    uint256 public rewardRate = 0;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored;

    bool public initialized = false;
    bool public breaker;

    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;


    event REWARDADDED849(uint256 reward);	//inject NONSTANDARD NAMING
    event STAKED851(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event WITHDRAWN399(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event REWARDPAID341(address indexed user, uint256 reward);	//inject NONSTANDARD NAMING

    modifier UPDATEREWARD426(address account) {	//inject NONSTANDARD NAMING
        rewardPerTokenStored = REWARDPERTOKEN240();
        lastUpdateTime = LASTTIMEREWARDAPPLICABLE468();
        if (account != address(0)) {
            rewards[account] = EARNED933(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }

    function LASTTIMEREWARDAPPLICABLE468() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return Math.MIN591(block.timestamp, periodFinish);
    }

    function REWARDPERTOKEN240() public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (TOTALSUPPLY205() == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored.ADD422(
                LASTTIMEREWARDAPPLICABLE468()
                    .SUB473(lastUpdateTime)
                    .MUL338(rewardRate)
                    .MUL338(1e18)
                    .DIV71(TOTALSUPPLY205())
            );
    }

    function EARNED933(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return
            BALANCEOF433(account)
                .MUL338(REWARDPERTOKEN240().SUB473(userRewardPerTokenPaid[account]))
                .DIV71(1e18)
                .ADD422(rewards[account]);
    }

    // stake visibility is public as overriding LPTokenWrapper's stake() function
    function STAKE608(uint256 amount) public UPDATEREWARD426(msg.sender) CHECKHALVE965 CHECKSTART273 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot stake 0");
        super.STAKE608(amount);
        emit STAKED851(msg.sender, amount);
    }

    function WITHDRAW51(uint256 amount) public UPDATEREWARD426(msg.sender) CHECKSTART273 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot withdraw 0");
        super.WITHDRAW51(amount);
        emit WITHDRAWN399(msg.sender, amount);
    }

    function EXIT541() external {	//inject NONSTANDARD NAMING
        WITHDRAW51(BALANCEOF433(msg.sender));
        GETREWARD517();
    }

    function GETREWARD517() public UPDATEREWARD426(msg.sender) CHECKHALVE965 CHECKSTART273 {	//inject NONSTANDARD NAMING
        uint256 reward = EARNED933(msg.sender);
        if (reward > 0) {
            rewards[msg.sender] = 0;
            uint256 scalingFactor = YAM(address(yam)).YAMSSCALINGFACTOR981();
            uint256 trueReward = reward.MUL338(scalingFactor).DIV71(10**18);
            yam.SAFETRANSFER142(msg.sender, trueReward);
            emit REWARDPAID341(msg.sender, trueReward);
        }
    }

    modifier CHECKHALVE965() {	//inject NONSTANDARD NAMING
        if (breaker) {
          // do nothing
        } else if (block.timestamp >= periodFinish) {
            initreward = initreward.MUL338(90).DIV71(100);
            uint256 scalingFactor = YAM(address(yam)).YAMSSCALINGFACTOR981();
            uint256 newRewards = initreward.MUL338(scalingFactor).DIV71(10**18);
            yam.MINT718(address(this), newRewards);

            rewardRate = initreward.DIV71(duration821);
            periodFinish = block.timestamp.ADD422(duration821);
            emit REWARDADDED849(initreward);
        }
        _;
    }

    modifier CHECKSTART273(){	//inject NONSTANDARD NAMING
        require(block.timestamp >= starttime,"not start");
        _;
    }


    function NOTIFYREWARDAMOUNT740(uint256 reward)	//inject NONSTANDARD NAMING
        external
        ONLYREWARDDISTRIBUTION140
        UPDATEREWARD426(address(0))
    {
        // https://sips.synthetix.io/sips/sip-77
        require(reward < uint256(-1) / 10**18, "rewards too large, would lock");
        if (block.timestamp > starttime) {
          if (block.timestamp >= periodFinish) {
              rewardRate = reward.DIV71(duration821);
          } else {
              uint256 remaining = periodFinish.SUB473(block.timestamp);
              uint256 leftover = remaining.MUL338(rewardRate);
              rewardRate = reward.ADD422(leftover).DIV71(duration821);
          }
          lastUpdateTime = block.timestamp;
          periodFinish = block.timestamp.ADD422(duration821);
          emit REWARDADDED849(reward);
        } else {
          require(initreward < uint256(-1) / 10**18, "rewards too large, would lock");
          require(!initialized, "already initialized");
          initialized = true;
          yam.MINT718(address(this), initreward);
          rewardRate = initreward.DIV71(duration821);
          lastUpdateTime = starttime;
          periodFinish = starttime.ADD422(duration821);
          emit REWARDADDED849(reward);
        }
    }


    // This function allows governance to take unsupported tokens out of the
    // contract, since this one exists longer than the other pools.
    // This is in an effort to make someone whole, should they seriously
    // mess up. There is no guarantee governance will vote to return these.
    // It also allows for removal of airdropped tokens.
    function RESCUETOKENS361(IERC20 _token, uint256 amount, address to)	//inject NONSTANDARD NAMING
        external
    {
        // only gov
        require(msg.sender == OWNER394(), "!governance");
        // cant take staked asset
        require(_token != uni_lp, "uni_lp");
        // cant take reward asset
        require(_token != yam, "yam");

        // transfer to
        _token.SAFETRANSFER142(to, amount);
    }

    function SETBREAKER74(bool breaker_)	//inject NONSTANDARD NAMING
        external
    {
        // only gov
        require(msg.sender == OWNER394(), "!governance");
        breaker = breaker_;
    }
}