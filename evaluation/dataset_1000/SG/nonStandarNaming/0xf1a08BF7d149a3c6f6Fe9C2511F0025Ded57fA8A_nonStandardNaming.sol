                                                                 

// Created By BitDNS.vip
// contact : Reward Pool
// SPDX-License-Identifier: MIT

pragma solidity ^0.5.8;

// File: @openzeppelin/contracts/math/SafeMath.sol
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD734(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB773(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB773(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB773(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL358(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV498(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV498(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV498(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol
                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY159() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF473(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER609(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE374(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE40(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM424(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER457(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL915(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/utils/Address.sol
                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT556(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER742(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN245(token, abi.encodeWithSelector(token.TRANSFER609.selector, to, value));
    }

    function SAFETRANSFERFROM931(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN245(token, abi.encodeWithSelector(token.TRANSFERFROM424.selector, from, to, value));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN245(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT556(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
      
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract IMinableERC20 is IERC20 {
    function MINT374(address account, uint amount) public;	//inject NONSTANDARD NAMING
}

contract RewardLockPool {
    using SafeMath for uint256;
    using Address for address;
    using SafeERC20 for IERC20;
    using SafeERC20 for IMinableERC20;

    IERC20 public stakeToken;
    IMinableERC20 public rewardToken;
    
    bool public started;
    uint256 public totalSupply;
    uint256 public rewardFinishTime = 0;
    uint256 public rewardRate = 0;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored;
    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;
    mapping(address => uint256) public balanceOf;
    mapping(address => uint256) public lockTimeOf;
    address private governance;

    event REWARDADDED473(uint256 reward);	//inject NONSTANDARD NAMING
    event STAKED70(address indexed user, uint256 amount, uint256 beforeT, uint256 afterT);	//inject NONSTANDARD NAMING
    event WITHDRAWN449(address indexed user, uint256 amount, uint256 beforeT, uint256 afterT);	//inject NONSTANDARD NAMING
    event REWARDPAID10(address indexed user, uint256 reward, uint256 beforeT, uint256 afterT);	//inject NONSTANDARD NAMING

    modifier UPDATEREWARD151(address account) {	//inject NONSTANDARD NAMING
        rewardPerTokenStored = REWARDPERTOKEN458();
        lastUpdateTime = LASTTIMEREWARDAPPLICABLE842();
        if (account != address(0)) {
            rewards[account] = EARNED789(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }

    modifier ONLYOWNER374() {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        _;
    }

    constructor () public {
        governance = msg.sender;
    }

    function START345(address stake_token, address reward_token, uint256 reward, uint256 duration) public ONLYOWNER374 {	//inject NONSTANDARD NAMING
        require(!started, "already started");
        require(stake_token != address(0) && stake_token.ISCONTRACT556(), "stake token is non-contract");
        require(reward_token != address(0) && reward_token.ISCONTRACT556(), "reward token is non-contract");

        started = true;
        stakeToken = IERC20(stake_token);
        rewardToken = IMinableERC20(reward_token);
        rewardRate = reward.MUL358(1e18).DIV498(duration);
        lastUpdateTime = block.timestamp;
        rewardFinishTime = block.timestamp.ADD734(duration);
    }

    function LASTTIMEREWARDAPPLICABLE842() internal view returns (uint256) {	//inject NONSTANDARD NAMING
        return block.timestamp < rewardFinishTime ? block.timestamp : rewardFinishTime;
    }

    function REWARDPERTOKEN458() public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (totalSupply == 0) {
            return rewardPerTokenStored;
        }
        return
        rewardPerTokenStored.ADD734(
            LASTTIMEREWARDAPPLICABLE842()
            .SUB773(lastUpdateTime)
            .MUL358(rewardRate)
            .MUL358(1e18)
            .DIV498(totalSupply)
        );
    }

    function EARNED789(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return
        balanceOf[account]
        .MUL358(REWARDPERTOKEN458().SUB773(userRewardPerTokenPaid[account]))
        .DIV498(1e18)
        .ADD734(rewards[account]);
    }

    function STAKE860(uint256 amount) public UPDATEREWARD151(msg.sender) {	//inject NONSTANDARD NAMING
        require(started, "Not start yet");
        require(amount > 0, "Cannot stake 0");
        require(stakeToken.BALANCEOF473(msg.sender) >= amount, "insufficient balance to stake");
        uint256 beforeT = stakeToken.BALANCEOF473(address(this));
        
        stakeToken.SAFETRANSFERFROM931(msg.sender, address(this), amount);
        totalSupply = totalSupply.ADD734(amount);
        balanceOf[msg.sender] = balanceOf[msg.sender].ADD734(amount);
        
        uint256 afterT = stakeToken.BALANCEOF473(address(this));

        // Add Lock Time Begin:
        lockTimeOf[msg.sender] = block.timestamp.ADD734(2 hours);
        // Add Lock Time End!!!

        emit STAKED70(msg.sender, amount, beforeT, afterT);
    }

    function WITHDRAW391(uint256 amount) public UPDATEREWARD151(msg.sender) {	//inject NONSTANDARD NAMING
        require(started, "Not start yet");
        require(amount > 0, "Cannot withdraw 0");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance to withdraw");

        // Add Lock Time Begin:
        require(CANWITHDRAW319(), "Must be locked for 14 days or Mining ended");
        // Add Lock Time End!!!

        uint256 beforeT = stakeToken.BALANCEOF473(address(this));
        
        totalSupply = totalSupply.SUB773(amount);
        balanceOf[msg.sender] = balanceOf[msg.sender].SUB773(amount);
        stakeToken.SAFETRANSFER742(msg.sender, amount);

        uint256 afterT = stakeToken.BALANCEOF473(address(this));
        emit WITHDRAWN449(msg.sender, amount, beforeT, afterT);
    }

    function EXIT811() external {	//inject NONSTANDARD NAMING
        require(started, "Not start yet");
        WITHDRAW391(balanceOf[msg.sender]);
        GETREWARD493();
    }

    function GETREWARD493() public UPDATEREWARD151(msg.sender) {	//inject NONSTANDARD NAMING
        require(started, "Not start yet");
        
        uint256 reward = EARNED789(msg.sender);
        if (reward > 0) {
            rewards[msg.sender] = 0;
            uint256 beforeT = rewardToken.BALANCEOF473(address(this));
            rewardToken.MINT374(msg.sender, reward);
            //rewardToken.safeTransfer(msg.sender, reward);
            uint256 afterT = rewardToken.BALANCEOF473(address(this));
            emit REWARDPAID10(msg.sender, reward, beforeT, afterT);
        }
    }

    // Add Lock Time Begin:
    function CANWITHDRAW319() public view returns (bool) {	//inject NONSTANDARD NAMING
        return started && (balanceOf[msg.sender] > 0) && 
            (block.timestamp >= lockTimeOf[msg.sender] || block.timestamp >= rewardFinishTime);
    }
    // Add Lock Time End!!!
}