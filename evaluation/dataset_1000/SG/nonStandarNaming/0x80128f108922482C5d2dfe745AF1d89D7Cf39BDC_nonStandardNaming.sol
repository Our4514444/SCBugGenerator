                                                                 

// File: contracts/SafeMath.sol

pragma solidity 0.5.17;

// Note: This file has been modified to include the sqrt function for quadratic voting
                                                                         
library Math {
                                                               
    function MAX752(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN766(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE120(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }

                                                                                                                                                                          
   function SQRT444(uint256 x) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
       uint256 n = x / 2;
       uint256 lstX = 0;
       while (n != lstX){
           lstX = n;
           n = (n + x/n) / 2; 
       }
       return uint256(n);
   }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD971(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB240(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB240(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB240(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL981(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV0(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV0(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV0(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD190(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD190(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD190(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: contracts/zeppelin/Ownable.sol

pragma solidity 0.5.17;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER513() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA151() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED513(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER513();
        emit OWNERSHIPTRANSFERRED513(address(0), _owner);
    }

                                                                     
    function OWNER439() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER310() {	//inject NONSTANDARD NAMING
        require(ISOWNER871(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER871() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER513() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP612() public ONLYOWNER310 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED513(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP201(address newOwner) public ONLYOWNER310 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP282(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP282(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED513(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: contracts/zeppelin/Address.sol

pragma solidity 0.5.17;


                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT845(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                          
    function TOPAYABLE391(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE17(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: contracts/IERC20.sol

//SPDX-License-Identifier: GPL-3.0-only

pragma solidity 0.5.17;


                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY117() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF298(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER933(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE160(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE210(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM19(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER133(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL846(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: contracts/zeppelin/SafeERC20.sol

pragma solidity 0.5.17;




                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER918(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN211(token, abi.encodeWithSelector(token.TRANSFER933.selector, to, value));
    }

    function SAFETRANSFERFROM367(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN211(token, abi.encodeWithSelector(token.TRANSFERFROM19.selector, from, to, value));
    }

    function SAFEAPPROVE247(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE160(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN211(token, abi.encodeWithSelector(token.APPROVE210.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE143(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE160(address(this), spender).ADD971(value);
        CALLOPTIONALRETURN211(token, abi.encodeWithSelector(token.APPROVE210.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE281(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE160(address(this), spender).SUB240(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN211(token, abi.encodeWithSelector(token.APPROVE210.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN211(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT845(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: contracts/IERC20Burnable.sol

//SPDX-License-Identifier: GPL-3.0-only

pragma solidity 0.5.17;


interface IERC20Burnable {
    function TOTALSUPPLY117() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF298(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER933(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE160(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE210(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM19(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function BURN766(uint256 amount) external;	//inject NONSTANDARD NAMING
    event TRANSFER133(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL846(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: contracts/ITreasury.sol

pragma solidity 0.5.17;



interface ITreasury {
    function DEFAULTTOKEN905() external view returns (IERC20);	//inject NONSTANDARD NAMING
    function DEPOSIT267(IERC20 token, uint256 amount) external;	//inject NONSTANDARD NAMING
    function WITHDRAW403(uint256 amount, address withdrawAddress) external;	//inject NONSTANDARD NAMING
}

// File: contracts/ISwapRouter.sol

//SPDX-License-Identifier: GPL-3.0-only

pragma solidity 0.5.17;


interface SwapRouter {
    function WETH502() external pure returns (address);	//inject NONSTANDARD NAMING
    function SWAPEXACTTOKENSFORTOKENS874(	//inject NONSTANDARD NAMING
      uint amountIn,
      uint amountOutMin,
      address[] calldata path,
      address to,
      uint deadline
    ) external returns (uint[] memory amounts);
}

// File: contracts/LPTokenWrapper.sol

//SPDX-License-Identifier: GPL-3.0-only


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

    function TOTALSUPPLY117() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF298(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function STAKE52(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.ADD971(amount);
        _balances[msg.sender] = _balances[msg.sender].ADD971(amount);
        // safeTransferFrom shifted to overriden method
    }

    function WITHDRAW403(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.SUB240(amount);
        _balances[msg.sender] = _balances[msg.sender].SUB240(amount);
        // safeTransferFrom shifted to overriden method
    }
}

// File: contracts/BoostRewardsV2.sol

//SPDX-License-Identifier: MIT
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

pragma solidity 0.5.17;









contract BoostRewardsV2 is LPTokenWrapper, Ownable {
    IERC20 public boostToken;
    ITreasury public treasury;
    SwapRouter public swapRouter;
    IERC20 public stablecoin;
    
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
    uint256 public lastBoostPurchase; // timestamp of lastBoostPurchase
    mapping(address => uint256) public boostedBalances;
    mapping(address => uint256) public numBoostersBought; // each booster = 5% increase in stake amt
    mapping(address => uint256) public nextBoostPurchaseTime; // timestamp for which user is eligible to purchase another booster
    uint256 public globalBoosterPrice = 1e18;
    uint256 public boostThreshold = 10;
    uint256 public boostScaleFactor = 20;
    uint256 public scaleFactor = 320;

    event REWARDADDED965(uint256 reward);	//inject NONSTANDARD NAMING
    event REWARDPAID614(address indexed user, uint256 reward);	//inject NONSTANDARD NAMING

    modifier CHECKSTART672() {	//inject NONSTANDARD NAMING
        require(block.timestamp >= starttime,"not start");
        _;
    }

    modifier UPDATEREWARD461(address account) {	//inject NONSTANDARD NAMING
        rewardPerTokenStored = REWARDPERTOKEN872();
        lastUpdateTime = LASTTIMEREWARDAPPLICABLE177();
        if (account != address(0)) {
            rewards[account] = EARNED346(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }

    constructor(
        uint256 _tokenCapAmount,
        IERC20 _stakeToken,
        IERC20 _boostToken,
        address _treasury,
        SwapRouter _swapRouter,
        uint256 _starttime,
        uint256 _duration
    ) public LPTokenWrapper(_stakeToken) {
        tokenCapAmount = _tokenCapAmount;
        boostToken = _boostToken;
        treasury = ITreasury(_treasury);
        stablecoin = treasury.DEFAULTTOKEN905();
        swapRouter = _swapRouter;
        starttime = _starttime;
        lastBoostPurchase = _starttime;
        duration = _duration;
        boostToken.SAFEAPPROVE247(address(_swapRouter), uint256(-1));
        stablecoin.SAFEAPPROVE247(address(treasury), uint256(-1));
    }
    
    function LASTTIMEREWARDAPPLICABLE177() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return Math.MIN766(block.timestamp, periodFinish);
    }

    function REWARDPERTOKEN872() public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (boostedTotalSupply == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored.ADD971(
                LASTTIMEREWARDAPPLICABLE177()
                    .SUB240(lastUpdateTime)
                    .MUL981(rewardRate)
                    .MUL981(1e18)
                    .DIV0(boostedTotalSupply)
            );
    }

    function EARNED346(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return
            boostedBalances[account]
                .MUL981(REWARDPERTOKEN872().SUB240(userRewardPerTokenPaid[account]))
                .DIV0(1e18)
                .ADD971(rewards[account]);
    }

    function GETBOOSTERPRICE610(address user)	//inject NONSTANDARD NAMING
        public view returns (uint256 boosterPrice, uint256 newBoostBalance)
    {
        if (boostedTotalSupply == 0) return (0,0);

        // 5% increase for each previously user-purchased booster
        uint256 boostersBought = numBoostersBought[user];
        boosterPrice = globalBoosterPrice.MUL981(boostersBought.MUL981(5).ADD971(100)).DIV0(100);

        // increment boostersBought by 1
        boostersBought = boostersBought.ADD971(1);

        // if no. of boosters exceed threshold, increase booster price by boostScaleFactor;
        if (boostersBought >= boostThreshold) {
            boosterPrice = boosterPrice
                .MUL981((boostersBought.SUB240(boostThreshold)).MUL981(boostScaleFactor).ADD971(100))
                .DIV0(100);
        }

        // 2.5% decrease for every 2 hour interval since last global boost purchase
        boosterPrice = POW441(boosterPrice, 975, 1000, (block.timestamp.SUB240(lastBoostPurchase)).DIV0(2 hours));

        // adjust price based on expected increase in boost supply
        // boostersBought has been incremented by 1 already
        newBoostBalance = BALANCEOF298(user)
            .MUL981(boostersBought.MUL981(5).ADD971(100))
            .DIV0(100);
        uint256 boostBalanceIncrease = newBoostBalance.SUB240(boostedBalances[user]);
        boosterPrice = boosterPrice
            .MUL981(boostBalanceIncrease)
            .MUL981(scaleFactor)
            .DIV0(boostedTotalSupply);
    }

    // stake visibility is public as overriding LPTokenWrapper's stake() function
    function STAKE52(uint256 amount) public UPDATEREWARD461(msg.sender) CHECKSTART672 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot stake 0");
        super.STAKE52(amount);

        // check user cap
        require(
            BALANCEOF298(msg.sender) <= tokenCapAmount || block.timestamp >= starttime.ADD971(86400),
            "token cap exceeded"
        );

        // boosters do not affect new amounts
        boostedBalances[msg.sender] = boostedBalances[msg.sender].ADD971(amount);
        boostedTotalSupply = boostedTotalSupply.ADD971(amount);

        _GETREWARD933(msg.sender);

        // transfer token last, to follow CEI pattern
        stakeToken.SAFETRANSFERFROM367(msg.sender, address(this), amount);
    }

    function WITHDRAW403(uint256 amount) public UPDATEREWARD461(msg.sender) CHECKSTART672 {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot withdraw 0");
        super.WITHDRAW403(amount);
        
        // reset boosts :(
        numBoostersBought[msg.sender] = 0;

        // update boosted balance and supply
        UPDATEBOOSTBALANCEANDSUPPLY252(msg.sender, 0);

        // in case _getReward function fails, continue
        (bool success, ) = address(this).call(
            abi.encodeWithSignature(
                "_getReward(address)",
                msg.sender
            )
        );
        // to remove compiler warning
        success;

        // transfer token last, to follow CEI pattern
        stakeToken.SAFETRANSFER918(msg.sender, amount);
    }

    function GETREWARD113() public UPDATEREWARD461(msg.sender) CHECKSTART672 {	//inject NONSTANDARD NAMING
        _GETREWARD933(msg.sender);
    }

    function EXIT624() external {	//inject NONSTANDARD NAMING
        WITHDRAW403(BALANCEOF298(msg.sender));
    }

    function SETSCALEFACTORSANDTHRESHOLD637(	//inject NONSTANDARD NAMING
        uint256 _boostThreshold,
        uint256 _boostScaleFactor,
        uint256 _scaleFactor
    ) external ONLYOWNER310
    {
        boostThreshold = _boostThreshold;
        boostScaleFactor = _boostScaleFactor;
        scaleFactor = _scaleFactor;
    }
    
    function BOOST243() external UPDATEREWARD461(msg.sender) CHECKSTART672 {	//inject NONSTANDARD NAMING
        require(
            block.timestamp > nextBoostPurchaseTime[msg.sender],
            "early boost purchase"
        );

        // save current booster price, since transfer is done last
        // since getBoosterPrice() returns new boost balance, avoid re-calculation
        (uint256 boosterAmount, uint256 newBoostBalance) = GETBOOSTERPRICE610(msg.sender);
        // user's balance and boostedSupply will be changed in this function
        APPLYBOOST958(msg.sender, newBoostBalance);
        
        _GETREWARD933(msg.sender);

        boostToken.SAFETRANSFERFROM367(msg.sender, address(this), boosterAmount);
        
        IERC20Burnable burnableBoostToken = IERC20Burnable(address(boostToken));

        // burn 25%
        uint256 burnAmount = boosterAmount.DIV0(4);
        burnableBoostToken.BURN766(burnAmount);
        boosterAmount = boosterAmount.SUB240(burnAmount);
        
        // swap to stablecoin
        address[] memory routeDetails = new address[](3);
        routeDetails[0] = address(boostToken);
        routeDetails[1] = swapRouter.WETH502();
        routeDetails[2] = address(stablecoin);
        uint[] memory amounts = swapRouter.SWAPEXACTTOKENSFORTOKENS874(
            boosterAmount,
            0,
            routeDetails,
            address(this),
            block.timestamp + 100
        );

        // transfer to treasury
        // index 2 = final output amt
        treasury.DEPOSIT267(stablecoin, amounts[2]);
    }

    function NOTIFYREWARDAMOUNT996(uint256 reward)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER310
        UPDATEREWARD461(address(0))
    {
        rewardRate = reward.DIV0(duration);
        lastUpdateTime = starttime;
        periodFinish = starttime.ADD971(duration);
        emit REWARDADDED965(reward);
    }
    
    function UPDATEBOOSTBALANCEANDSUPPLY252(address user, uint256 newBoostBalance) internal {	//inject NONSTANDARD NAMING
        // subtract existing balance from boostedSupply
        boostedTotalSupply = boostedTotalSupply.SUB240(boostedBalances[user]);
    
        // when applying boosts,
        // newBoostBalance has already been calculated in getBoosterPrice()
        if (newBoostBalance == 0) {
            // each booster adds 5% to current stake amount
            newBoostBalance = BALANCEOF298(user).MUL981(numBoostersBought[user].MUL981(5).ADD971(100)).DIV0(100);
        }

        // update user's boosted balance
        boostedBalances[user] = newBoostBalance;
    
        // update boostedSupply
        boostedTotalSupply = boostedTotalSupply.ADD971(newBoostBalance);
    }

    function APPLYBOOST958(address user, uint256 newBoostBalance) internal {	//inject NONSTANDARD NAMING
        // increase no. of boosters bought
        numBoostersBought[user] = numBoostersBought[user].ADD971(1);

        UPDATEBOOSTBALANCEANDSUPPLY252(user, newBoostBalance);
        
        // increase next purchase eligibility by an hour
        nextBoostPurchaseTime[user] = block.timestamp.ADD971(3600);

        // increase global booster price by 1%
        globalBoosterPrice = globalBoosterPrice.MUL981(101).DIV0(100);

        lastBoostPurchase = block.timestamp;
    }

    function _GETREWARD933(address user) internal {	//inject NONSTANDARD NAMING
        uint256 reward = EARNED346(user);
        if (reward > 0) {
            rewards[user] = 0;
            boostToken.SAFETRANSFER918(user, reward);
            emit REWARDPAID614(user, reward);
        }
    }

                                                                                                             
                                                        
                                    
   function POW441(uint256 a, uint256 b, uint256 c, uint256 exponent) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (exponent == 0) {
            return a;
        }
        else if (exponent == 1) {
            return a.MUL981(b).DIV0(c);
        }
        else if (a == 0 && exponent != 0) {
            return 0;
        }
        else {
            uint256 z = a.MUL981(b).DIV0(c);
            for (uint256 i = 1; i < exponent; i++)
                z = z.MUL981(b).DIV0(c);
            return z;
        }
    }
}