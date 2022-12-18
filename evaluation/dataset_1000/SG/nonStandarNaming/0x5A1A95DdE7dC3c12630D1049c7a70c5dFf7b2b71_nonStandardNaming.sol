                                                                 

// File: contracts/IERC20.sol

//SPDX-License-Identifier: GPL-3.0-only

pragma solidity 0.5.17;


                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY527() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF184(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER862(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE282(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE591(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM277(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER469(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL589(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: contracts/ITreasury.sol

pragma solidity 0.5.17;



interface ITreasury {
    function DEFAULTTOKEN66() external view returns (IERC20);	//inject NONSTANDARD NAMING
    function DEPOSIT732(IERC20 token, uint256 amount) external;	//inject NONSTANDARD NAMING
    function WITHDRAW532(uint256 amount, address withdrawAddress) external;	//inject NONSTANDARD NAMING
}

// File: contracts/vaults/IVault.sol

pragma solidity 0.5.17;



interface IVault {
    function WANT944() external view returns (IERC20);	//inject NONSTANDARD NAMING
    function TRANSFERFUNDSTOSTRATEGY247(address strategy, uint256 amount) external;	//inject NONSTANDARD NAMING
    function AVAILABLEFUNDS584() external view returns (uint256);	//inject NONSTANDARD NAMING
}

// File: contracts/vaults/IVaultRewards.sol

pragma solidity 0.5.17;



interface IVaultRewards {
    function WANT944() external view returns (IERC20);	//inject NONSTANDARD NAMING
    function NOTIFYREWARDAMOUNT929(uint256 reward) external;	//inject NONSTANDARD NAMING
}

// File: contracts/vaults/IController.sol

pragma solidity 0.5.17;






interface IController {
    function CURRENTEPOCHTIME505() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF184(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function REWARDS473(address token) external view returns (IVaultRewards);	//inject NONSTANDARD NAMING
    function VAULT378(address token) external view returns (IVault);	//inject NONSTANDARD NAMING
    function ALLOWABLEAMOUNT471(address) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TREASURY727() external view returns (ITreasury);	//inject NONSTANDARD NAMING
    function APPROVEDSTRATEGIES898(address, address) external view returns (bool);	//inject NONSTANDARD NAMING
    function GETHARVESTINFO233(address strategy, address user)	//inject NONSTANDARD NAMING
        external view returns (
        uint256 vaultRewardPercentage,
        uint256 hurdleAmount,
        uint256 harvestPercentage
    );
    function WITHDRAW532(address, uint256) external;	//inject NONSTANDARD NAMING
    function EARN445(address, uint256) external;	//inject NONSTANDARD NAMING
    function INCREASEHURDLERATE622(address token) external;	//inject NONSTANDARD NAMING
}

// File: contracts/vaults/IStrategy.sol

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          

pragma solidity 0.5.17;


interface IStrategy {
    function GETNAME609() external pure returns (string memory);	//inject NONSTANDARD NAMING
    function WANT944() external view returns (address);	//inject NONSTANDARD NAMING
    function WITHDRAW532(address) external;	//inject NONSTANDARD NAMING
    function WITHDRAW532(uint256) external;	//inject NONSTANDARD NAMING
    function WITHDRAWALL33() external returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF184() external view returns (uint256);	//inject NONSTANDARD NAMING
}

// File: contracts/SafeMath.sol

pragma solidity 0.5.17;

// Note: This file has been modified to include the sqrt function for quadratic voting
                                                                         
library Math {
                                                               
    function MAX245(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN427(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE107(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }

                                                                                                                                                                          
   function SQRT824(uint256 x) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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
                                                                                                                                                                                                                             
    function ADD586(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB116(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB116(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB116(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL41(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV377(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV377(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV377(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD337(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD337(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD337(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: contracts/zeppelin/Address.sol

pragma solidity 0.5.17;


                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT76(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                          
    function TOPAYABLE452(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE140(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: contracts/zeppelin/SafeERC20.sol

pragma solidity 0.5.17;




                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER262(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN440(token, abi.encodeWithSelector(token.TRANSFER862.selector, to, value));
    }

    function SAFETRANSFERFROM876(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN440(token, abi.encodeWithSelector(token.TRANSFERFROM277.selector, from, to, value));
    }

    function SAFEAPPROVE826(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE282(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN440(token, abi.encodeWithSelector(token.APPROVE591.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE852(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE282(address(this), spender).ADD586(value);
        CALLOPTIONALRETURN440(token, abi.encodeWithSelector(token.APPROVE591.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE515(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE282(address(this), spender).SUB116(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN440(token, abi.encodeWithSelector(token.APPROVE591.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN440(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT76(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: contracts/vaults/BoostController.sol

//SPDX-License-Identifier: MIT
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

pragma solidity 0.5.17;






contract BoostController is IController {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;

    struct TokenStratInfo {
        IVault vault;
        IVaultRewards rewards;
        IStrategy[] strategies;
        uint256 currentHurdleRate;
        uint256 nextHurdleRate;
        uint256 hurdleLastUpdateTime;
        uint256 harvestPrice;
        uint256 globalHarvestLastUpdateTime;
        mapping(address => uint256) harvestPercentages;
        mapping(address => uint256) harvestLastUpdateTime;
    }

    address public gov;
    address public strategist;
    ITreasury public treasury;
    IERC20 public boostToken;

    mapping(address => TokenStratInfo) public tokenStratsInfo;
    mapping(address => uint256) public capAmounts;
    mapping(address => uint256) public investedAmounts;
    mapping(address => mapping(address => bool)) public approvedStrategies;

    uint256 public currentEpochTime;
    uint256 public constant epoch_duration970 = 1 weeks;	//inject NONSTANDARD NAMING
    uint256 internal constant denom694 = 10000;	//inject NONSTANDARD NAMING
    uint256 internal constant hurdle_rate_max171 = 500; // max 5%	//inject NONSTANDARD NAMING
    uint256 internal constant base_harvest_percentage10 = 50; // 0.5%	//inject NONSTANDARD NAMING
    uint256 internal constant base_reward_percentage264 = 5000; // 50%	//inject NONSTANDARD NAMING
    uint256 internal constant harvest_percentage_max100 = 100; // max 1% extra	//inject NONSTANDARD NAMING
    uint256 internal constant price_increase473 = 10100; // 1.01x	//inject NONSTANDARD NAMING
    uint256 internal constant epoch_price_reduction405 = 8000; // 0.8x	//inject NONSTANDARD NAMING

    uint256 vaultRewardChangePrice = 10e18; // initial cost of 10 boosts
    uint256 public globalVaultRewardPercentage = base_reward_percentage264;
    uint256 vaultRewardLastUpdateTime;

    constructor(
        address _gov,
        address _strategist,
        ITreasury _treasury,
        IERC20 _boostToken,
        uint256 _epochStart
    ) public {
        gov = _gov;
        strategist = _strategist;
        treasury = _treasury;
        boostToken = _boostToken;
        currentEpochTime = _epochStart;
    }

    modifier UPDATEEPOCH84() {	//inject NONSTANDARD NAMING
        if (block.timestamp > currentEpochTime.ADD586(epoch_duration970)) {
            currentEpochTime = currentEpochTime.ADD586(epoch_duration970);
        }
        _;
    }

    function REWARDS473(address token) external view returns (IVaultRewards) {	//inject NONSTANDARD NAMING
        return tokenStratsInfo[token].rewards;
    }

    function VAULT378(address token) external view returns (IVault) {	//inject NONSTANDARD NAMING
        return tokenStratsInfo[token].vault;
    }

    function BALANCEOF184(address token) external view returns (uint256) {	//inject NONSTANDARD NAMING
        IStrategy[] storage strategies = tokenStratsInfo[token].strategies;
        uint256 totalBalance;
        for (uint256 i = 0; i < strategies.length; i++) {
            totalBalance = totalBalance.ADD586(strategies[i].BALANCEOF184());
        }
        return totalBalance;
    }

    function ALLOWABLEAMOUNT471(address strategy) external view returns(uint256) {	//inject NONSTANDARD NAMING
        return capAmounts[strategy].SUB116(investedAmounts[strategy]);
    }

    function GETHARVESTINFO233(	//inject NONSTANDARD NAMING
        address strategy,
        address user
    ) external view returns (
        uint256 vaultRewardPercentage,
        uint256 hurdleAmount,
        uint256 harvestPercentage
    ) {
        address token = IStrategy(strategy).WANT944();
        vaultRewardPercentage = globalVaultRewardPercentage;
        hurdleAmount = GETHURDLEAMOUNT542(strategy, token);
        harvestPercentage = GETHARVESTPERCENTAGE181(user, token);
    }

    function GETHARVESTUSERINFO979(address user, address token)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256 harvestPercentage, uint256 lastUpdateTime)
    {
        TokenStratInfo storage info = tokenStratsInfo[token];
        harvestPercentage = info.harvestPercentages[user];
        lastUpdateTime = info.harvestLastUpdateTime[user];
    }

    function GETSTRATEGIES147(address token) external view returns (IStrategy[] memory strategies) {	//inject NONSTANDARD NAMING
        return tokenStratsInfo[token].strategies;
    }

    function SETTREASURY853(ITreasury _treasury) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(msg.sender == gov, "!gov");
        treasury = _treasury;
    }

    function SETSTRATEGIST744(address _strategist) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(msg.sender == gov, "!gov");
        strategist = _strategist;
    }

    function SETGOVERNANCE780(address _gov) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(msg.sender == gov, "!gov");
        gov = _gov;
    }

    function SETREWARDS750(IVaultRewards _rewards) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(msg.sender == strategist || msg.sender == gov, "!authorized");
        address token = address(_rewards.WANT944());
        require(tokenStratsInfo[token].rewards == IVaultRewards(0), "rewards exists");
        tokenStratsInfo[token].rewards = _rewards;
    }

    function SETVAULTANDINITHARVESTINFO795(IVault _vault) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(msg.sender == strategist || msg.sender == gov, "!authorized");
        address token = address(_vault.WANT944());
        TokenStratInfo storage info = tokenStratsInfo[token];
        require(info.vault == IVault(0), "vault exists");
        info.vault = _vault;
        // initial harvest booster price of 1 boost
        info.harvestPrice = 1e18;
        info.globalHarvestLastUpdateTime = currentEpochTime;
    }

    function APPROVESTRATEGY385(address _strategy, uint256 _cap) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(msg.sender == gov, "!gov");
        address token = IStrategy(_strategy).WANT944();
        require(!approvedStrategies[token][_strategy], "strat alr approved");
        require(tokenStratsInfo[token].vault.WANT944() == IERC20(token), "unequal wants");
        capAmounts[_strategy] = _cap;
        tokenStratsInfo[token].strategies.push(IStrategy(_strategy));
        approvedStrategies[token][_strategy] = true;
    }

    function CHANGECAP680(address strategy, uint256 _cap) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(msg.sender == gov, "!gov");
        capAmounts[strategy] = _cap;
    }

    function REVOKESTRATEGY862(address _strategy, uint256 _index) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(msg.sender == gov, "!gov");
        address token = IStrategy(_strategy).WANT944();
        require(approvedStrategies[token][_strategy], "strat alr revoked");
        IStrategy[] storage tokenStrategies = tokenStratsInfo[token].strategies;
        require(address(tokenStrategies[_index]) == _strategy, "wrong index");

        // replace revoked strategy with last element in array
        tokenStrategies[_index] = tokenStrategies[tokenStrategies.length - 1];
        delete tokenStrategies[tokenStrategies.length - 1];
        tokenStrategies.length--;
        capAmounts[_strategy] = 0;
        approvedStrategies[token][_strategy] = false;
    }

    function GETHURDLEAMOUNT542(address strategy, address token) public view returns (uint256) {	//inject NONSTANDARD NAMING
        TokenStratInfo storage info = tokenStratsInfo[token];
        return (info.hurdleLastUpdateTime < currentEpochTime ||
        (block.timestamp > currentEpochTime.ADD586(epoch_duration970))) ?
            0 :
            info.currentHurdleRate
            .MUL41(investedAmounts[strategy])
            .DIV377(denom694);
    }

    function GETHARVESTPERCENTAGE181(address user, address token) public view returns (uint256) {	//inject NONSTANDARD NAMING
        TokenStratInfo storage info = tokenStratsInfo[token];
        return (info.harvestLastUpdateTime[user] < currentEpochTime ||
            (block.timestamp > currentEpochTime.ADD586(epoch_duration970))) ?
            base_harvest_percentage10 :
            info.harvestPercentages[user];
    }

                                                                               
    function EARN445(address strategy, uint256 amount) public UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(msg.sender == strategy, "!strategy");
        address token = IStrategy(strategy).WANT944();
        require(approvedStrategies[token][strategy], "strat !approved");
        TokenStratInfo storage info = tokenStratsInfo[token];
        uint256 newInvestedAmount = investedAmounts[strategy].ADD586(amount);
        require(newInvestedAmount <= capAmounts[strategy], "hit strategy cap");
        // update invested amount
        investedAmounts[strategy] = newInvestedAmount;
        // transfer funds to strategy
        info.vault.TRANSFERFUNDSTOSTRATEGY247(strategy, amount);
    }

    // Anyone can withdraw non-core strategy tokens => sent to treasury
    function EARNMISCTOKENS955(IStrategy strategy, IERC20 token) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        // should send tokens to this contract
        strategy.WITHDRAW532(address(token));
        uint256 bal = token.BALANCEOF184(address(this));
        token.SAFEAPPROVE826(address(treasury), bal);
        // send funds to treasury
        treasury.DEPOSIT732(token, bal);
    }

    function INCREASEHARVESTPERCENTAGEHURDLERATE310(address token) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        TokenStratInfo storage info = tokenStratsInfo[token];
        // first, handle vault global price and update time
        // if new epoch, reduce price by 20%
        if (info.globalHarvestLastUpdateTime < currentEpochTime) {
            info.harvestPrice = info.harvestPrice.MUL41(epoch_price_reduction405).DIV377(denom694);
        }

        // get funds from user, send to treasury
        boostToken.SAFETRANSFERFROM876(msg.sender, address(this), info.harvestPrice);
        boostToken.SAFEAPPROVE826(address(treasury), info.harvestPrice);
        treasury.DEPOSIT732(boostToken, info.harvestPrice);

        // increase price
        info.harvestPrice = info.harvestPrice.MUL41(price_increase473).DIV377(denom694);
        // update globalHarvestLastUpdateTime
        info.globalHarvestLastUpdateTime = block.timestamp;

        // next, handle effect on harvest percentage and update user's harvest time
        // see if percentage needs to be reset
        if (info.harvestLastUpdateTime[msg.sender] < currentEpochTime) {
            info.harvestPercentages[msg.sender] = base_harvest_percentage10;
        }
        info.harvestLastUpdateTime[msg.sender] = block.timestamp;

        // increase harvest percentage by 0.25%
        info.harvestPercentages[msg.sender] = Math.MIN427(
            harvest_percentage_max100,
            info.harvestPercentages[msg.sender].ADD586(25)
        );
        INCREASEHURDLERATE622(token);
    }

    function CHANGEVAULTREWARDPERCENTAGE638(bool isIncrease) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        // if new epoch, reduce price by 20%
        if ((vaultRewardLastUpdateTime != 0) && (vaultRewardLastUpdateTime < currentEpochTime)) {
            vaultRewardChangePrice = vaultRewardChangePrice.MUL41(epoch_price_reduction405).DIV377(denom694);
        }

        // get funds from user, send to treasury
        boostToken.SAFETRANSFERFROM876(msg.sender, address(this), vaultRewardChangePrice);
        boostToken.SAFEAPPROVE826(address(treasury), vaultRewardChangePrice);
        treasury.DEPOSIT732(boostToken, vaultRewardChangePrice);

        // increase price
        vaultRewardChangePrice = vaultRewardChangePrice.MUL41(price_increase473).DIV377(denom694);
        // update vaultRewardLastUpdateTime
        vaultRewardLastUpdateTime = block.timestamp;
        if (isIncrease) {
            globalVaultRewardPercentage = Math.MIN427(denom694, globalVaultRewardPercentage.ADD586(25));
        } else {
            globalVaultRewardPercentage = globalVaultRewardPercentage.SUB116(25);
        }
    }

    // handle vault withdrawal
    function WITHDRAW532(address token, uint256 withdrawAmount) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        TokenStratInfo storage info = tokenStratsInfo[token];
        require(msg.sender == (address(info.vault)), "!vault");
        uint256 remainingWithdrawAmount = withdrawAmount;

        for (uint256 i = 0; i < info.strategies.length; i++) {
            if (remainingWithdrawAmount == 0) break;
            IStrategy strategy = info.strategies[i];
            // withdraw maximum amount possible
            uint256 actualWithdrawAmount = Math.MIN427(
                investedAmounts[address(strategy)], remainingWithdrawAmount
            );
            // update remaining withdraw amt
            remainingWithdrawAmount = remainingWithdrawAmount.SUB116(actualWithdrawAmount);
            // update strat invested amt
            investedAmounts[address(strategy)] = investedAmounts[address(strategy)]
                    .SUB116(actualWithdrawAmount);
            // do the actual withdrawal
            strategy.WITHDRAW532(actualWithdrawAmount);
        }
    }

    function WITHDRAWALL33(address strategy) external UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(
            msg.sender == strategist ||
            msg.sender == gov,
            "!authorized"
        );
        investedAmounts[strategy] = 0;
        IStrategy(strategy).WITHDRAWALL33();
    }

    function INCREASEHURDLERATE622(address token) public UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        TokenStratInfo storage info = tokenStratsInfo[token];
        require(msg.sender == address(info.rewards) || msg.sender == address(this), "!authorized");
        // see if hurdle rate has to update
        if (info.hurdleLastUpdateTime < currentEpochTime) {
            info.currentHurdleRate = info.nextHurdleRate;
            info.nextHurdleRate = 0;
        }
        info.hurdleLastUpdateTime = block.timestamp;
        // increase hurdle rate by 0.01%
        info.nextHurdleRate = Math.MIN427(hurdle_rate_max171, info.nextHurdleRate.ADD586(1));
    }

    function INCASETOKENSGETSTUCK98(address token, uint amount) public UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(msg.sender == strategist || msg.sender == gov, "!authorized");
        IERC20(token).SAFETRANSFER262(msg.sender, amount);
    }

    function INCASESTRATEGYTOKENGETSTUCK424(IStrategy strategy, address token) public UPDATEEPOCH84 {	//inject NONSTANDARD NAMING
        require(msg.sender == strategist || msg.sender == gov, "!authorized");
        strategy.WITHDRAW532(token);
    }
}