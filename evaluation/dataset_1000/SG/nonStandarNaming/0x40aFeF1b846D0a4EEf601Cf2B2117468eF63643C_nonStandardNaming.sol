                                                                 

//SPDX-License-Identifier: MIT
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

pragma solidity ^0.5.17;

                                                                         
library Math {
                                                               
    function MAX689(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN106(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE181(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

pragma solidity ^0.5.17;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD876(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB886(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB886(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB886(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL357(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV102(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV102(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV102(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD258(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD258(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD258(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

pragma solidity ^0.5.17;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER975() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA325() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

pragma solidity ^0.5.17;

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED552(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER975();
        emit OWNERSHIPTRANSFERRED552(address(0), _owner);
    }

                                                                     
    function OWNER17() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER995() {	//inject NONSTANDARD NAMING
        require(ISOWNER322(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER322() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER975() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP972() public ONLYOWNER995 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED552(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP175(address newOwner) public ONLYOWNER995 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP972(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP972(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED552(_owner, newOwner);
        _owner = newOwner;
    }
}

pragma solidity ^0.5.17;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY677() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF525(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER81(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE756(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE541(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM182(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER35(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL42(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

interface IERC20Burnable {
    function TOTALSUPPLY677() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF525(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER81(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE756(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE541(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM182(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function BURN865(uint256 amount) external;	//inject NONSTANDARD NAMING
    event TRANSFER35(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL42(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

pragma solidity ^0.5.17;

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT914(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                          
    function TOPAYABLE175(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE23(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

pragma solidity ^0.5.17;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER131(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN580(token, abi.encodeWithSelector(token.TRANSFER81.selector, to, value));
    }

    function SAFETRANSFERFROM516(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN580(token, abi.encodeWithSelector(token.TRANSFERFROM182.selector, from, to, value));
    }

    function SAFEAPPROVE94(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE756(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN580(token, abi.encodeWithSelector(token.APPROVE541.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE487(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE756(address(this), spender).ADD876(value);
        CALLOPTIONALRETURN580(token, abi.encodeWithSelector(token.APPROVE541.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE885(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE756(address(this), spender).SUB886(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN580(token, abi.encodeWithSelector(token.APPROVE541.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN580(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT914(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

pragma solidity ^0.5.17;


contract LPTokenWrapper {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    IERC20 public stakeToken;

    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;

    constructor(IERC20 _stakeToken) public {
        stakeToken = _stakeToken;
    }

    function TOTALSUPPLY677() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF525(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function STAKE33(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.ADD876(amount);
        _balances[msg.sender] = _balances[msg.sender].ADD876(amount);
        // safeTransferFrom shifted to last line of overridden method
    }

    function WITHDRAW510(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.SUB886(amount);
        _balances[msg.sender] = _balances[msg.sender].SUB886(amount);
        // safeTransfer shifted to last line of overridden method
    }
}

interface UniswapRouter {
    function WETH749() external pure returns (address);	//inject NONSTANDARD NAMING
    function SWAPEXACTTOKENSFORTOKENS528(	//inject NONSTANDARD NAMING
      uint amountIn,
      uint amountOutMin,
      address[] calldata path,
      address to,
      uint deadline
    ) external returns (uint[] memory amounts);
}

interface IGovernance {
    function GETSTABLECOIN346() external view returns (address);	//inject NONSTANDARD NAMING
}

contract BoostRewardsPool is LPTokenWrapper, Ownable {
    IERC20 public boostToken;
    address public governance;
    address public governanceSetter;
    UniswapRouter public uniswapRouter;
    address public stablecoin;
    
    uint256 public constant max_num_boosters351 = 5;	//inject NONSTANDARD NAMING
    uint256 public tokenCapAmount;
    uint256 public starttime;
    uint256 public duration;
    uint256 public periodFinish = 0;
    uint256 public rewardRate = 0;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored;
    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;
    
    // booster variables
    // variables to keep track of totalSupply and balances (after accounting for multiplier)
    uint256 public boostedTotalSupply;
    mapping(address => uint256) public boostedBalances;
    mapping(address => uint256) public numBoostersBought; // each booster = 5% increase in stake amt
    mapping(address => uint256) public nextBoostPurchaseTime; // timestamp for which user is eligible to purchase another booster
    uint256 public boosterPrice = precision789;
    uint256 internal constant precision789 = 1e18;	//inject NONSTANDARD NAMING

    event REWARDADDED999(uint256 reward);	//inject NONSTANDARD NAMING
    event REWARDPAID334(address indexed user, uint256 reward);	//inject NONSTANDARD NAMING

    modifier CHECKSTART533() {	//inject NONSTANDARD NAMING
        require(block.timestamp >= starttime,"not start");
        _;
    }

    modifier UPDATEREWARD366(address account) {	//inject NONSTANDARD NAMING
        rewardPerTokenStored = REWARDPERTOKEN255();
        lastUpdateTime = LASTTIMEREWARDAPPLICABLE100();
        if (account != address(0)) {
            rewards[account] = EARNED493(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }

    constructor(
        uint256 _tokenCapAmount,
        IERC20 _stakeToken,
        IERC20 _boostToken,
        address _governanceSetter,
        UniswapRouter _uniswapRouter,
        uint256 _starttime,
        uint256 _duration
    ) public LPTokenWrapper(_stakeToken) {
        tokenCapAmount = _tokenCapAmount;
        boostToken = _boostToken;
        boostToken.APPROVE541(address(_uniswapRouter), uint256(-1));
        governanceSetter = _governanceSetter;
        uniswapRouter = _uniswapRouter;
        starttime = _starttime;
        duration = _duration;
    }
    
    function LASTTIMEREWARDAPPLICABLE100() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return Math.MIN106(block.timestamp, periodFinish);
    }

    function REWARDPERTOKEN255() public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (boostedTotalSupply == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored.ADD876(
                LASTTIMEREWARDAPPLICABLE100()
                    .SUB886(lastUpdateTime)
                    .MUL357(rewardRate)
                    .MUL357(1e18)
                    .DIV102(boostedTotalSupply)
            );
    }

    function EARNED493(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return
            boostedBalances[account]
                .MUL357(REWARDPERTOKEN255().SUB886(userRewardPerTokenPaid[account]))
                .DIV102(1e18)
                .ADD876(rewards[account]);
    }

    // stake visibility is public as overriding LPTokenWrapper's stake() function
    function STAKE33(uint256 amount) public UPDATEREWARD366(msg.sender) CHECKSTART533 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot stake 0");
        super.STAKE33(amount);

        // check user cap
        require(
            BALANCEOF525(msg.sender) <= tokenCapAmount || block.timestamp >= starttime.ADD876(86400),
            "token cap exceeded"
        );

        // update boosted balance and supply
        UPDATEBOOSTBALANCEANDSUPPLY66(msg.sender);
        
        // transfer token last, to follow CEI pattern
        stakeToken.SAFETRANSFERFROM516(msg.sender, address(this), amount);
    }

    function WITHDRAW510(uint256 amount) public UPDATEREWARD366(msg.sender) CHECKSTART533 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot withdraw 0");
        super.WITHDRAW510(amount);
        
        // update boosted balance and supply
        UPDATEBOOSTBALANCEANDSUPPLY66(msg.sender);
        
        stakeToken.SAFETRANSFER131(msg.sender, amount);
    }

    function EXIT534() external {	//inject NONSTANDARD NAMING
        WITHDRAW510(BALANCEOF525(msg.sender));
        GETREWARD63();
    }

    function GETREWARD63() public UPDATEREWARD366(msg.sender) CHECKSTART533 {	//inject NONSTANDARD NAMING
        uint256 reward = EARNED493(msg.sender);
        if (reward > 0) {
            rewards[msg.sender] = 0;
            boostToken.SAFETRANSFER131(msg.sender, reward);
            emit REWARDPAID334(msg.sender, reward);
        }
    }
    
    function BOOST609() external UPDATEREWARD366(msg.sender) CHECKSTART533 {	//inject NONSTANDARD NAMING
        require(
            // 2 days after starttime
            block.timestamp > starttime.ADD876(172800) &&
            block.timestamp > nextBoostPurchaseTime[msg.sender],
            "early boost purchase"
        );
        
        // increase next purchase eligibility by an hour
        nextBoostPurchaseTime[msg.sender] = block.timestamp.ADD876(3600);
        
        // increase no. of boosters bought
        uint256 booster = numBoostersBought[msg.sender].ADD876(1);
        numBoostersBought[msg.sender] = booster;
        require(booster <= max_num_boosters351, "max boosters bought");

        // save current booster price, since transfer is done last
        booster = boosterPrice;
        // increase next booster price by 5%
        boosterPrice = boosterPrice.MUL357(105).DIV102(100);
        
        // update boosted balance and supply
        UPDATEBOOSTBALANCEANDSUPPLY66(msg.sender);
        
        boostToken.SAFETRANSFERFROM516(msg.sender, address(this), booster);
        
        IERC20Burnable burnableBoostToken = IERC20Burnable(address(boostToken));
        // if governance not set, burn all
        if (governance == address(0)) {
            burnableBoostToken.BURN865(booster);
            return;
        }

        // otherwise, burn 50%
        uint256 burnAmount = booster.DIV102(2);
        burnableBoostToken.BURN865(burnAmount);
        booster = booster.SUB886(burnAmount);
        
        // swap to stablecoin, transferred to governance
        address[] memory routeDetails = new address[](3);
        routeDetails[0] = address(boostToken);
        routeDetails[1] = uniswapRouter.WETH749();
        routeDetails[2] = stablecoin;
        uniswapRouter.SWAPEXACTTOKENSFORTOKENS528(
            booster,
            0,
            routeDetails,
            governance,
            block.timestamp + 100
        );
    }

    function NOTIFYREWARDAMOUNT292(uint256 reward)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER995
        UPDATEREWARD366(address(0))
    {
        rewardRate = reward.DIV102(duration);
        lastUpdateTime = starttime;
        periodFinish = starttime.ADD876(duration);
        emit REWARDADDED999(reward);
    }
    
    function SETGOVERNANCE472(address _governance)	//inject NONSTANDARD NAMING
        external
    {
        require(msg.sender == governanceSetter, "only setter");
        governance = _governance;
        stablecoin = IGovernance(governance).GETSTABLECOIN346();
        governanceSetter = address(0);
    }
    
    function UPDATEBOOSTBALANCEANDSUPPLY66(address user) internal {	//inject NONSTANDARD NAMING
         // subtract existing balance from boostedSupply
        boostedTotalSupply = boostedTotalSupply.SUB886(boostedBalances[user]);
        // calculate and update new boosted balance (user's balance has been updated by parent method)
        // each booster adds 5% to stake amount
        uint256 newBoostBalance = BALANCEOF525(user).MUL357(numBoostersBought[user].MUL357(5).ADD876(100)).DIV102(100);
        boostedBalances[user] = newBoostBalance;
        // update boostedSupply
        boostedTotalSupply = boostedTotalSupply.ADD876(newBoostBalance);
    }
}