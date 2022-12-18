                                                                 

// File: @openzeppelin/contracts/math/Math.sol

pragma solidity 0.5.16;

                                                                         
library Math {
                                                               
    function MAX444(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN969(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE230(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity 0.5.16;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD945(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB940(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB940(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB940(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL674(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV625(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV625(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV625(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD514(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD514(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD514(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/GSN/Context.sol

pragma solidity 0.5.16;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER89() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA525() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

pragma solidity 0.5.16;

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED253(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER89();
        emit OWNERSHIPTRANSFERRED253(address(0), _owner);
    }

                                                                     
    function OWNER920() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER185() {	//inject NONSTANDARD NAMING
        require(ISOWNER809(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER809() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER89() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP653() public ONLYOWNER185 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED253(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP824(address newOwner) public ONLYOWNER185 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP699(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP699(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED253(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

pragma solidity 0.5.16;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY897() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF27(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER414(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function MINT921(address account, uint amount) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE113(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE453(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM247(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER220(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL630(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity 0.5.16;

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT277(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                          
    function TOPAYABLE658(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE419(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

pragma solidity 0.5.16;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER215(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN549(token, abi.encodeWithSelector(token.TRANSFER414.selector, to, value));
    }

    function SAFETRANSFERFROM772(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN549(token, abi.encodeWithSelector(token.TRANSFERFROM247.selector, from, to, value));
    }

    function SAFEAPPROVE321(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE113(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN549(token, abi.encodeWithSelector(token.APPROVE453.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE0(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE113(address(this), spender).ADD945(value);
        CALLOPTIONALRETURN549(token, abi.encodeWithSelector(token.APPROVE453.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE744(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE113(address(this), spender).SUB940(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN549(token, abi.encodeWithSelector(token.APPROVE453.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN549(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT277(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

                                  
pragma solidity 0.5.16;

contract IRewardDistributionRecipient is Ownable {
    address rewardDistribution;

    function NOTIFYREWARDAMOUNT663(uint256 reward) external;	//inject NONSTANDARD NAMING

    modifier ONLYREWARDDISTRIBUTION914() {	//inject NONSTANDARD NAMING
        require(_MSGSENDER89() == rewardDistribution, "Caller is not reward distribution");
        _;
    }

    function SETREWARDDISTRIBUTION356(address _rewardDistribution)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER185
    {
        rewardDistribution = _rewardDistribution;
    }
}

                                   
pragma solidity 0.5.16;

contract GOFTokenWrapper {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    IERC20 public stakeToken = IERC20(0x790F04AC1eCCb288aE216A5848Eb0f2038f7fc9e);
    
    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;

    function TOTALSUPPLY897() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF27(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function STAKE36(uint256 amount) public {	//inject NONSTANDARD NAMING
        uint256 _before = stakeToken.BALANCEOF27(address(this));
        stakeToken.SAFETRANSFERFROM772(msg.sender, address(this), amount);
        uint256 _after = stakeToken.BALANCEOF27(address(this));
        uint256 _amount = _after.SUB940(_before);
        
        _totalSupply = _totalSupply.ADD945(_amount);
        _balances[msg.sender] = _balances[msg.sender].ADD945(_amount);
    }

    function WITHDRAW369(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.SUB940(amount);
        _balances[msg.sender] = _balances[msg.sender].SUB940(amount);
        stakeToken.SAFETRANSFER215(msg.sender, amount);
    }
}

                
pragma solidity 0.5.16;

contract GOFGV2BUSDPool is GOFTokenWrapper, IRewardDistributionRecipient {
    
    IERC20 public gof = IERC20(0x488E0369f9BC5C40C002eA7c1fe4fd01A198801c);
    uint256 public constant duration265 = 7 days;	//inject NONSTANDARD NAMING

    uint256 public constant starttime750 = 1605096000; //utc+8 2020-11-11 20:00:00	//inject NONSTANDARD NAMING
    uint256 public periodFinish = 0;
    uint256 public rewardRate = 0;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored = 0;
    bool private open = true;
    uint256 private constant _gunit198 = 1e18;	//inject NONSTANDARD NAMING
    mapping(address => uint256) public userRewardPerTokenPaid; 
    mapping(address => uint256) public rewards; // Unclaimed rewards

    event REWARDADDED962(uint256 reward);	//inject NONSTANDARD NAMING
    event STAKED227(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event WITHDRAWN808(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event REWARDPAID201(address indexed user, uint256 reward);	//inject NONSTANDARD NAMING
    event SETOPEN909(bool _open);	//inject NONSTANDARD NAMING

    modifier UPDATEREWARD146(address account) {	//inject NONSTANDARD NAMING
        rewardPerTokenStored = REWARDPERTOKEN860();
        lastUpdateTime = LASTTIMEREWARDAPPLICABLE69();
        if (account != address(0)) {
            rewards[account] = EARNED228(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }

    function LASTTIMEREWARDAPPLICABLE69() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return Math.MIN969(block.timestamp, periodFinish);
    }

                                                           
    function REWARDPERTOKEN860() public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (TOTALSUPPLY897() == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored.ADD945(
                LASTTIMEREWARDAPPLICABLE69()
                    .SUB940(lastUpdateTime)
                    .MUL674(rewardRate)
                    .MUL674(_gunit198)
                    .DIV625(TOTALSUPPLY897())
            );
    }

    function EARNED228(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return
            BALANCEOF27(account)
                .MUL674(REWARDPERTOKEN860().SUB940(userRewardPerTokenPaid[account]))
                .DIV625(_gunit198)
                .ADD945(rewards[account]);
    }

    function STAKE36(uint256 amount) public CHECKOPEN821 CHECKSTART715 UPDATEREWARD146(msg.sender){ 	//inject NONSTANDARD NAMING
        require(amount > 0, "Golff-POOL: Cannot stake 0");
        super.STAKE36(amount);
        emit STAKED227(msg.sender, amount);
    }

    function WITHDRAW369(uint256 amount) public CHECKSTART715 UPDATEREWARD146(msg.sender){	//inject NONSTANDARD NAMING
        require(amount > 0, "Golff-POOL: Cannot withdraw 0");
        super.WITHDRAW369(amount);
        emit WITHDRAWN808(msg.sender, amount);
    }

    function EXIT53() external {	//inject NONSTANDARD NAMING
        WITHDRAW369(BALANCEOF27(msg.sender));
        GETREWARD829();
    }

    function GETREWARD829() public CHECKSTART715 UPDATEREWARD146(msg.sender){	//inject NONSTANDARD NAMING
        uint256 reward = EARNED228(msg.sender);
        if (reward > 0) {
            rewards[msg.sender] = 0;
            gof.SAFETRANSFER215(msg.sender, reward);
            emit REWARDPAID201(msg.sender, reward);
        }
    }

    modifier CHECKSTART715(){	//inject NONSTANDARD NAMING
        require(block.timestamp > starttime750,"Golff-POOL: Not start");
        _;
    }

    modifier CHECKOPEN821() {	//inject NONSTANDARD NAMING
        require(open, "Golff-POOL: Pool is closed");
        _;
    }

    function GETPERIODFINISH748() external view returns (uint256) {	//inject NONSTANDARD NAMING
        return periodFinish;
    }

    function ISOPEN200() external view returns (bool) {	//inject NONSTANDARD NAMING
        return open;
    }

    function SETOPEN297(bool _open) external ONLYOWNER185 {	//inject NONSTANDARD NAMING
        open = _open;
        emit SETOPEN909(_open);
    }

    function NOTIFYREWARDAMOUNT663(uint256 reward)	//inject NONSTANDARD NAMING
        external
        ONLYREWARDDISTRIBUTION914
        CHECKOPEN821
        UPDATEREWARD146(address(0)){
        if (block.timestamp > starttime750){
            if (block.timestamp >= periodFinish) {
                uint256 period = block.timestamp.SUB940(starttime750).DIV625(duration265).ADD945(1);
                periodFinish = starttime750.ADD945(period.MUL674(duration265));
                rewardRate = reward.DIV625(periodFinish.SUB940(block.timestamp));
            } else {
                uint256 remaining = periodFinish.SUB940(block.timestamp);
                uint256 leftover = remaining.MUL674(rewardRate);
                rewardRate = reward.ADD945(leftover).DIV625(remaining);
            }
            lastUpdateTime = block.timestamp;
        }else {
          uint256 b = gof.BALANCEOF27(address(this));
          rewardRate = reward.ADD945(b).DIV625(duration265);
          periodFinish = starttime750.ADD945(duration265);
          lastUpdateTime = starttime750;
        }

        gof.MINT921(address(this),reward);
        emit REWARDADDED962(reward);

        // avoid overflow to lock assets
        _CHECKREWARDRATE314();
    }
    
    function _CHECKREWARDRATE314() internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return duration265.MUL674(rewardRate).MUL674(_gunit198);
    }
}