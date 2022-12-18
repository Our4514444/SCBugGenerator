                                                                 

//SPDX-License-Identifier: MIT
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

pragma solidity ^0.5.17;

                                                                         
library Math {
                                                               
    function MAX689(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN176(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE328(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

pragma solidity ^0.5.17;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD107(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB134(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB134(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB134(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL660(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV169(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV169(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV169(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD859(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD859(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD859(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

    function _MSGSENDER207() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA92() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

pragma solidity ^0.5.17;

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED984(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER207();
        emit OWNERSHIPTRANSFERRED984(address(0), _owner);
    }

                                                                     
    function OWNER634() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER832() {	//inject NONSTANDARD NAMING
        require(ISOWNER55(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER55() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER207() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP79() public ONLYOWNER832 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED984(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP799(address newOwner) public ONLYOWNER832 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP126(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP126(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED984(_owner, newOwner);
        _owner = newOwner;
    }
}

pragma solidity ^0.5.17;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY971() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF880(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER835(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE909(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE972(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM912(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER868(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL110(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

interface IERC20Burnable {
    function TOTALSUPPLY971() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF880(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER835(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE909(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE972(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM912(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function BURN124(uint256 amount) external;	//inject NONSTANDARD NAMING
    event TRANSFER868(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL110(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

pragma solidity ^0.5.17;

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT596(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                          
    function TOPAYABLE226(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE44(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER54(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN697(token, abi.encodeWithSelector(token.TRANSFER835.selector, to, value));
    }

    function SAFETRANSFERFROM125(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN697(token, abi.encodeWithSelector(token.TRANSFERFROM912.selector, from, to, value));
    }

    function SAFEAPPROVE810(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE909(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN697(token, abi.encodeWithSelector(token.APPROVE972.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE285(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE909(address(this), spender).ADD107(value);
        CALLOPTIONALRETURN697(token, abi.encodeWithSelector(token.APPROVE972.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE853(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE909(address(this), spender).SUB134(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN697(token, abi.encodeWithSelector(token.APPROVE972.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN697(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT596(), "SafeERC20: call to non-contract");

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

    function TOTALSUPPLY971() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF880(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function STAKE717(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.ADD107(amount);
        _balances[msg.sender] = _balances[msg.sender].ADD107(amount);
        // safeTransferFrom shifted to last line of overridden method
    }

    function WITHDRAW13(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.SUB134(amount);
        _balances[msg.sender] = _balances[msg.sender].SUB134(amount);
        // safeTransfer shifted to last line of overridden method
    }
}

interface UniswapRouter {
    function WETH245() external pure returns (address);	//inject NONSTANDARD NAMING
    function SWAPEXACTTOKENSFORTOKENS653(	//inject NONSTANDARD NAMING
      uint amountIn,
      uint amountOutMin,
      address[] calldata path,
      address to,
      uint deadline
    ) external returns (uint[] memory amounts);
}

interface IGovernance {
    function GETSTABLECOIN466() external view returns (address);	//inject NONSTANDARD NAMING
}

contract BoostRewardsPool is LPTokenWrapper, Ownable {
    IERC20 public boostToken;
    address public governance;
    address public governanceSetter;
    UniswapRouter public uniswapRouter;
    address public stablecoin;
    
    uint256 public constant max_num_boosters278 = 5;	//inject NONSTANDARD NAMING
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
    uint256 public boosterPrice = precision418;
    uint256 internal constant precision418 = 1e18;	//inject NONSTANDARD NAMING

    event REWARDADDED5(uint256 reward);	//inject NONSTANDARD NAMING
    event REWARDPAID763(address indexed user, uint256 reward);	//inject NONSTANDARD NAMING

    modifier CHECKSTART101() {	//inject NONSTANDARD NAMING
        require(block.timestamp >= starttime,"not start");
        _;
    }

    modifier UPDATEREWARD444(address account) {	//inject NONSTANDARD NAMING
        rewardPerTokenStored = REWARDPERTOKEN770();
        lastUpdateTime = LASTTIMEREWARDAPPLICABLE501();
        if (account != address(0)) {
            rewards[account] = EARNED259(account);
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
        boostToken.APPROVE972(address(_uniswapRouter), uint256(-1));
        governanceSetter = _governanceSetter;
        uniswapRouter = _uniswapRouter;
        starttime = _starttime;
        duration = _duration;
    }
    
    function LASTTIMEREWARDAPPLICABLE501() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return Math.MIN176(block.timestamp, periodFinish);
    }

    function REWARDPERTOKEN770() public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (boostedTotalSupply == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored.ADD107(
                LASTTIMEREWARDAPPLICABLE501()
                    .SUB134(lastUpdateTime)
                    .MUL660(rewardRate)
                    .MUL660(1e18)
                    .DIV169(boostedTotalSupply)
            );
    }

    function EARNED259(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return
            boostedBalances[account]
                .MUL660(REWARDPERTOKEN770().SUB134(userRewardPerTokenPaid[account]))
                .DIV169(1e18)
                .ADD107(rewards[account]);
    }

    // stake visibility is public as overriding LPTokenWrapper's stake() function
    function STAKE717(uint256 amount) public UPDATEREWARD444(msg.sender) CHECKSTART101 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot stake 0");
        super.STAKE717(amount);

        // check user cap
        require(
            BALANCEOF880(msg.sender) <= tokenCapAmount || block.timestamp >= starttime.ADD107(86400),
            "token cap exceeded"
        );

        // update boosted balance and supply
        UPDATEBOOSTBALANCEANDSUPPLY489(msg.sender);
        
        // transfer token last, to follow CEI pattern
        stakeToken.SAFETRANSFERFROM125(msg.sender, address(this), amount);
    }

    function WITHDRAW13(uint256 amount) public UPDATEREWARD444(msg.sender) CHECKSTART101 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot withdraw 0");
        super.WITHDRAW13(amount);
        
        // update boosted balance and supply
        UPDATEBOOSTBALANCEANDSUPPLY489(msg.sender);
        
        stakeToken.SAFETRANSFER54(msg.sender, amount);
    }

    function EXIT62() external {	//inject NONSTANDARD NAMING
        WITHDRAW13(BALANCEOF880(msg.sender));
        GETREWARD822();
    }

    function GETREWARD822() public UPDATEREWARD444(msg.sender) CHECKSTART101 {	//inject NONSTANDARD NAMING
        uint256 reward = EARNED259(msg.sender);
        if (reward > 0) {
            rewards[msg.sender] = 0;
            boostToken.SAFETRANSFER54(msg.sender, reward);
            emit REWARDPAID763(msg.sender, reward);
        }
    }
    
    function BOOST605() external UPDATEREWARD444(msg.sender) CHECKSTART101 {	//inject NONSTANDARD NAMING
        require(
            // 2 days after starttime
            block.timestamp > starttime.ADD107(172800) &&
            block.timestamp > nextBoostPurchaseTime[msg.sender],
            "early boost purchase"
        );
        
        // increase next purchase eligibility by an hour
        nextBoostPurchaseTime[msg.sender] = block.timestamp.ADD107(3600);
        
        // increase no. of boosters bought
        uint256 booster = numBoostersBought[msg.sender].ADD107(1);
        numBoostersBought[msg.sender] = booster;
        require(booster <= max_num_boosters278, "max boosters bought");

        // save current booster price, since transfer is done last
        booster = boosterPrice;
        // increase next booster price by 5%
        boosterPrice = boosterPrice.MUL660(105).DIV169(100);
        
        // update boosted balance and supply
        UPDATEBOOSTBALANCEANDSUPPLY489(msg.sender);
        
        boostToken.SAFETRANSFERFROM125(msg.sender, address(this), booster);
        
        IERC20Burnable burnableBoostToken = IERC20Burnable(address(boostToken));
        // if governance not set, burn all
        if (governance == address(0)) {
            burnableBoostToken.BURN124(booster);
            return;
        }

        // otherwise, burn 50%
        uint256 burnAmount = booster.DIV169(2);
        burnableBoostToken.BURN124(burnAmount);
        booster = booster.SUB134(burnAmount);
        
        // swap to stablecoin, transferred to governance
        address[] memory routeDetails = new address[](3);
        routeDetails[0] = address(boostToken);
        routeDetails[1] = uniswapRouter.WETH245();
        routeDetails[2] = stablecoin;
        uniswapRouter.SWAPEXACTTOKENSFORTOKENS653(
            booster,
            0,
            routeDetails,
            governance,
            block.timestamp + 100
        );
    }

    function NOTIFYREWARDAMOUNT569(uint256 reward)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER832
        UPDATEREWARD444(address(0))
    {
        rewardRate = reward.DIV169(duration);
        lastUpdateTime = starttime;
        periodFinish = starttime.ADD107(duration);
        emit REWARDADDED5(reward);
    }
    
    function SETGOVERNANCE246(address _governance)	//inject NONSTANDARD NAMING
        external
    {
        require(msg.sender == governanceSetter, "only setter");
        governance = _governance;
        stablecoin = IGovernance(governance).GETSTABLECOIN466();
        governanceSetter = address(0);
    }
    
    function UPDATEBOOSTBALANCEANDSUPPLY489(address user) internal {	//inject NONSTANDARD NAMING
         // subtract existing balance from boostedSupply
        boostedTotalSupply = boostedTotalSupply.SUB134(boostedBalances[user]);
        // calculate and update new boosted balance (user's balance has been updated by parent method)
        // each booster adds 5% to stake amount
        uint256 newBoostBalance = BALANCEOF880(user).MUL660(numBoostersBought[user].MUL660(5).ADD107(100)).DIV169(100);
        boostedBalances[user] = newBoostBalance;
        // update boostedSupply
        boostedTotalSupply = boostedTotalSupply.ADD107(newBoostBalance);
    }
}