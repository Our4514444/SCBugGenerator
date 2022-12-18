                                                                 

// File: @openzeppelin/contracts/math/Math.sol

pragma solidity 0.5.16;

                                                                         
library Math {
                                                               
    function MAX585(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN629(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE906(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity 0.5.16;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD773(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB603(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB603(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB603(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL317(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV31(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV31(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV31(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD137(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD137(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD137(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

    function _MSGSENDER992() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA632() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

pragma solidity 0.5.16;

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED455(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER992();
        emit OWNERSHIPTRANSFERRED455(address(0), _owner);
    }

                                                                     
    function OWNER597() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER355() {	//inject NONSTANDARD NAMING
        require(ISOWNER621(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER621() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER992() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP342() public ONLYOWNER355 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED455(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP183(address newOwner) public ONLYOWNER355 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP508(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP508(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED455(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

pragma solidity 0.5.16;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY143() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF765(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER719(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function MINT390(address account, uint amount) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE837(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE679(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM251(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER755(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL16(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity 0.5.16;

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT824(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                          
    function TOPAYABLE265(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE808(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER822(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN933(token, abi.encodeWithSelector(token.TRANSFER719.selector, to, value));
    }

    function SAFETRANSFERFROM1(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN933(token, abi.encodeWithSelector(token.TRANSFERFROM251.selector, from, to, value));
    }

    function SAFEAPPROVE667(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE837(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN933(token, abi.encodeWithSelector(token.APPROVE679.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE692(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE837(address(this), spender).ADD773(value);
        CALLOPTIONALRETURN933(token, abi.encodeWithSelector(token.APPROVE679.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE26(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE837(address(this), spender).SUB603(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN933(token, abi.encodeWithSelector(token.APPROVE679.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN933(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT824(), "SafeERC20: call to non-contract");

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

    function NOTIFYREWARDAMOUNT250(uint256 reward) external;	//inject NONSTANDARD NAMING

    modifier ONLYREWARDDISTRIBUTION89() {	//inject NONSTANDARD NAMING
        require(_MSGSENDER992() == rewardDistribution, "Caller is not reward distribution");
        _;
    }

    function SETREWARDDISTRIBUTION362(address _rewardDistribution)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER355
    {
        rewardDistribution = _rewardDistribution;
    }
}

                                
pragma solidity 0.5.16;

contract AVOTokenWrapper {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    IERC20 public stakeToken = IERC20(0xdAC17F958D2ee523a2206206994597C13D831ec7);

    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;

    function TOTALSUPPLY143() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF765(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function STAKE678(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.ADD773(amount);
        _balances[msg.sender] = _balances[msg.sender].ADD773(amount);
        stakeToken.SAFETRANSFERFROM1(msg.sender, address(this), amount);
    }

    function WITHDRAW358(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.SUB603(amount);
        _balances[msg.sender] = _balances[msg.sender].SUB603(amount);
        stakeToken.SAFETRANSFER822(msg.sender, amount);
    }
}

                    
pragma solidity 0.5.16;

contract AVOUSDTPool is AVOTokenWrapper, IRewardDistributionRecipient {
    IERC20 public avo = IERC20(0xb8e3Fd2D4539A9176d2236A7b27917222664316b);
    uint256 public constant duration752 = 7 days;	//inject NONSTANDARD NAMING
    uint256 public constant starttime440 = 1600747200; //utc+8 2020-09-22 12:00:00	//inject NONSTANDARD NAMING
    uint256 public periodFinish = 0;
    uint256 public rewardRate = 0;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored = 0;
    bool private open = true;
    uint256 private constant _gunit820 = 1e18;	//inject NONSTANDARD NAMING
    mapping(address => uint256) public userRewardPerTokenPaid; 
    mapping(address => uint256) public rewards; // Unclaimed rewards

    event REWARDADDED449(uint256 reward);	//inject NONSTANDARD NAMING
    event STAKED331(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event WITHDRAWN471(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event REWARDPAID389(address indexed user, uint256 reward);	//inject NONSTANDARD NAMING
    event SETOPEN103(bool _open);	//inject NONSTANDARD NAMING

    modifier UPDATEREWARD151(address account) {	//inject NONSTANDARD NAMING
        rewardPerTokenStored = REWARDPERTOKEN977();
        lastUpdateTime = LASTTIMEREWARDAPPLICABLE66();
        if (account != address(0)) {
            rewards[account] = EARNED311(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }

    function LASTTIMEREWARDAPPLICABLE66() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return Math.MIN629(block.timestamp, periodFinish);
    }

                                                           
    function REWARDPERTOKEN977() public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (TOTALSUPPLY143() == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored.ADD773(
                LASTTIMEREWARDAPPLICABLE66()
                    .SUB603(lastUpdateTime)
                    .MUL317(rewardRate)
                    .MUL317(_gunit820)
                    .DIV31(TOTALSUPPLY143())
            );
    }

    function EARNED311(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return
            BALANCEOF765(account)
                .MUL317(REWARDPERTOKEN977().SUB603(userRewardPerTokenPaid[account]))
                .DIV31(_gunit820)
                .ADD773(rewards[account]);
    }

    function STAKE678(uint256 amount) public CHECKOPEN733 CHECKSTART814 UPDATEREWARD151(msg.sender){ 	//inject NONSTANDARD NAMING
        require(amount > 0, "AVO-USDT-POOL: Cannot stake 0");
        super.STAKE678(amount);
        emit STAKED331(msg.sender, amount);
    }

    function WITHDRAW358(uint256 amount) public CHECKSTART814 UPDATEREWARD151(msg.sender){	//inject NONSTANDARD NAMING
        require(amount > 0, "AVO-USDT-POOL: Cannot withdraw 0");
        super.WITHDRAW358(amount);
        emit WITHDRAWN471(msg.sender, amount);
    }

    function EXIT410() external {	//inject NONSTANDARD NAMING
        WITHDRAW358(BALANCEOF765(msg.sender));
        GETREWARD65();
    }

    function GETREWARD65() public CHECKSTART814 UPDATEREWARD151(msg.sender){	//inject NONSTANDARD NAMING
        uint256 reward = EARNED311(msg.sender);
        if (reward > 0) {
            rewards[msg.sender] = 0;
            avo.SAFETRANSFER822(msg.sender, reward);
            emit REWARDPAID389(msg.sender, reward);
        }
    }

    modifier CHECKSTART814(){	//inject NONSTANDARD NAMING
        require(block.timestamp > starttime440,"Golff-USDT-POOL: Not start");
        _;
    }

    modifier CHECKOPEN733() {	//inject NONSTANDARD NAMING
        require(open, "Golff-USDT-POOL: Pool is closed");
        _;
    }

    function GETPERIODFINISH167() external view returns (uint256) {	//inject NONSTANDARD NAMING
        return periodFinish;
    }

    function ISOPEN56() external view returns (bool) {	//inject NONSTANDARD NAMING
        return open;
    }

    function SETOPEN246(bool _open) external ONLYOWNER355 {	//inject NONSTANDARD NAMING
        open = _open;
        emit SETOPEN103(_open);
    }

    function NOTIFYREWARDAMOUNT250(uint256 reward)	//inject NONSTANDARD NAMING
        external
        ONLYREWARDDISTRIBUTION89
        CHECKOPEN733
        UPDATEREWARD151(address(0)) {
        if (block.timestamp > starttime440){
            if (block.timestamp >= periodFinish) {
                uint256 period = block.timestamp.SUB603(starttime440).DIV31(duration752).ADD773(1);
                periodFinish = starttime440.ADD773(period.MUL317(duration752));
                rewardRate = reward.DIV31(periodFinish.SUB603(block.timestamp));
            } else {
                uint256 remaining = periodFinish.SUB603(block.timestamp);
                uint256 leftover = remaining.MUL317(rewardRate);
                rewardRate = reward.ADD773(leftover).DIV31(remaining);
            }
            lastUpdateTime = block.timestamp;
        }else {
          rewardRate = reward.DIV31(duration752);
          periodFinish = starttime440.ADD773(duration752);
          lastUpdateTime = starttime440;
        }

        avo.MINT390(address(this),reward);
        emit REWARDADDED449(reward);

         // avoid overflow to lock assets
        _CHECKREWARDRATE832();
    }
    
    function _CHECKREWARDRATE832() internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return duration752.MUL317(rewardRate).MUL317(_gunit820);
    }
}