                                                                 

pragma solidity ^0.5.17;
      

                                                                                                                                                                                                                                                                         



                                                                         
library Math {
                                                               
    function MAX254(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN366(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE465(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD624(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB769(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB769(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB769(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL531(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV76(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV76(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV76(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD367(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD367(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD367(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER879() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA324() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED898(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER879();
        emit OWNERSHIPTRANSFERRED898(address(0), _owner);
    }

                                                                     
    function OWNER12() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER391() {	//inject NONSTANDARD NAMING
        require(ISOWNER632(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER632() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER879() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP586() public ONLYOWNER391 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED898(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP233(address newOwner) public ONLYOWNER391 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP614(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP614(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED898(_owner, newOwner);
        _owner = newOwner;
    }
}

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY661() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF613(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER263(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function MINT789(address account, uint amount) external;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE214(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE700(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM148(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER416(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL325(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity ^0.5.5;

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT593(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                          
    function TOPAYABLE256(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE775(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER442(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN858(token, abi.encodeWithSelector(token.TRANSFER263.selector, to, value));
    }

    function SAFETRANSFERFROM125(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN858(token, abi.encodeWithSelector(token.TRANSFERFROM148.selector, from, to, value));
    }

    function SAFEAPPROVE759(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE214(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN858(token, abi.encodeWithSelector(token.APPROVE700.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE705(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE214(address(this), spender).ADD624(value);
        CALLOPTIONALRETURN858(token, abi.encodeWithSelector(token.APPROVE700.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE504(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE214(address(this), spender).SUB769(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN858(token, abi.encodeWithSelector(token.APPROVE700.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN858(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT593(), "SafeERC20: call to non-contract");

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
    address rewardDistribution = 0x680b6e26C9b0107fda32D8395a977F3F00fa0c7F;

    function NOTIFYREWARDAMOUNT687(uint256 reward) external;	//inject NONSTANDARD NAMING

    modifier ONLYREWARDDISTRIBUTION37() {	//inject NONSTANDARD NAMING
        require(_MSGSENDER879() == rewardDistribution, "Caller is not reward distribution");
        _;
    }

    function SETREWARDDISTRIBUTION100(address _rewardDistribution)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER391
    {
        rewardDistribution = _rewardDistribution;
    }
}
contract YRXPoolone {
     function BALANCEOF613(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
}

contract LPTokenWrapper is YRXPoolone {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    address public poolSetter = 0x680b6e26C9b0107fda32D8395a977F3F00fa0c7F; //LOS + rrvx deployer

    IERC20 public rvx = IERC20(0x91d6f6e9026E43240ce6F06Af6a4b33129EBdE94); 
    IERC20 public rRvx = IERC20(0x6f7B10841eABd73ad226BBf653989539f1BFf809); 
    YRXPoolone public yrx;
    address public constant rrvxcollection991 = 0x680b6e26C9b0107fda32D8395a977F3F00fa0c7F; //change RRVX deyploer	//inject NONSTANDARD NAMING
  

    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    
    modifier ONLYPOOLSETTER539() {	//inject NONSTANDARD NAMING
        require(msg.sender == poolSetter);
        _;
    }
    

    function SETYRXPOOLONE831(address _address) public ONLYPOOLSETTER539 {	//inject NONSTANDARD NAMING
        yrx = YRXPoolone(_address);
        
    }

    function TOTALSUPPLY661() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF613(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function ADJUSTSTAKE636(address account) internal {	//inject NONSTANDARD NAMING
        uint256 rrvxbal = rRvx.BALANCEOF613(account);
        uint256 rrvxpoolbal = yrx.BALANCEOF613(account);
        uint256 newbal = rrvxbal.ADD624(rrvxpoolbal);
        _balances[account] = newbal;

    }
    function STAKE506(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.ADD624(amount);
        _balances[msg.sender] = _balances[msg.sender].ADD624(amount);
        rvx.SAFETRANSFERFROM125(msg.sender, address(this), amount);
    }
    
     function GETRRVX8(uint256 amount) internal {	//inject NONSTANDARD NAMING

        rRvx.MINT789(msg.sender,amount); //contract needs to be minter of RRVX
    }
    
    function BURNRRVX219(uint256 amount) internal { //rRVX sent to collection address (maybe timelocked wallet)	//inject NONSTANDARD NAMING

        rRvx.SAFETRANSFERFROM125(msg.sender,rrvxcollection991,amount);
    }

    function WITHDRAWRVX201(uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(amount <= rRvx.BALANCEOF613(msg.sender),"Can't withdrawrvx more than your amount");
        if(amount > _balances[msg.sender] || amount > _totalSupply) { //check if amount is higher than total supply of deposited RVX (should happen in rare scenarios)
            _totalSupply = 0;
            _balances[msg.sender] = 0;
            rvx.SAFETRANSFER442(msg.sender, amount);
        } else {
            _totalSupply = _totalSupply.SUB769(amount);
            _balances[msg.sender] = _balances[msg.sender].SUB769(amount);
             rvx.SAFETRANSFER442(msg.sender, amount);
        }
        
    }

}

contract Losv2 is LPTokenWrapper, IRewardDistributionRecipient {
    IERC20 public rvx = IERC20(0x91d6f6e9026E43240ce6F06Af6a4b33129EBdE94);
    uint8 public constant number_epochs69 = 11;	//inject NONSTANDARD NAMING
     uint256 public constant epoch_reward684 = 63636 ether;	//inject NONSTANDARD NAMING
      uint256 public constant total_reward743 = epoch_reward684 * number_epochs69;	//inject NONSTANDARD NAMING
    uint256 public constant duration663 = 7 days;	//inject NONSTANDARD NAMING
     uint256 public currentEpochReward = epoch_reward684;
     uint256 public totalAccumulatedReward = 0;
      uint8 public currentEpoch = 0;
    uint256 public starttime = 1602237600; //Friday, October 9, 2020 12:00:00 PM GMT+02:00 || Friday, October 9, 6 PM SGT
    uint256 public periodFinish = 0;
    uint256 public rewardRate = 0;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored;
    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;

    event REWARDADDED681(uint256 reward);	//inject NONSTANDARD NAMING
    event STAKED110(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event WITHDRAWN158(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event REWARDPAID602(address indexed user, uint256 reward);	//inject NONSTANDARD NAMING

    modifier UPDATEREWARD4(address account) {	//inject NONSTANDARD NAMING
       
        rewardPerTokenStored = REWARDPERTOKEN401();
        lastUpdateTime = LASTTIMEREWARDAPPLICABLE409();
        if (account != address(0)) {
            rewards[account] = EARNED139(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }

    function LASTTIMEREWARDAPPLICABLE409() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return Math.MIN366(block.timestamp, periodFinish);
    }

    function REWARDPERTOKEN401() public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (TOTALSUPPLY661() == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored.ADD624(
                LASTTIMEREWARDAPPLICABLE409()
                    .SUB769(lastUpdateTime)
                    .MUL531(rewardRate)
                    .MUL531(1e18)
                    .DIV76(TOTALSUPPLY661())
            );
    }

    function EARNED139(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return
            BALANCEOF613(account)
                .MUL531(REWARDPERTOKEN401().SUB769(userRewardPerTokenPaid[account]))
                .DIV76(1e18)
                .ADD624(rewards[account]);
    }

    // stake visibility is public as overriding LPTokenWrapper's stake() function
    function STAKE506(uint256 amount) public UPDATEREWARD4(msg.sender) CHECKNEXTEPOCH381 CHECKSTART248{	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot stake 0");
        super.STAKE506(amount); //stake RVX
        super.GETRRVX8(amount); //get equal amount rRVX
        emit STAKED110(msg.sender, amount);
    }

    function WITHDRAW363(uint256 amount) public UPDATEREWARD4(msg.sender) CHECKNEXTEPOCH381 CHECKSTART248{	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot withdraw 0");
        require(amount <= rRvx.BALANCEOF613(msg.sender),"Can't withdraw more rrvx than you have"); //amount can't be higher than users rRVX balance.
        super.WITHDRAWRVX201(amount); //RVX is withdrawn based on rRVX amount.
        super.BURNRRVX219(amount); //rRVX is sent to collection address
        emit WITHDRAWN158(msg.sender, amount);
    }

    function EXIT325() external {	//inject NONSTANDARD NAMING
        WITHDRAW363(rRvx.BALANCEOF613(msg.sender)); //withdraws all users RVX + reward based on rRVX balance
        GETREWARD388();
    }
    
    function GETRRVXBALANCE102(address account) public view returns(uint256) { //testing	//inject NONSTANDARD NAMING
        return rRvx.BALANCEOF613(account);
    }

    function GETREWARD388() public UPDATEREWARD4(msg.sender) CHECKNEXTEPOCH381 CHECKSTART248{	//inject NONSTANDARD NAMING
       
        uint256 reward = EARNED139(msg.sender);
        if (reward > 0) {
            rewards[msg.sender] = 0;
            rvx.SAFETRANSFER442(msg.sender, reward);
            emit REWARDPAID602(msg.sender, reward);
            super.ADJUSTSTAKE636(msg.sender);
        }
    }

  modifier CHECKNEXTEPOCH381() {	//inject NONSTANDARD NAMING
        if (block.timestamp >= periodFinish) {
            currentEpochReward = epoch_reward684;

            if (totalAccumulatedReward.ADD624(currentEpochReward) > total_reward743) {
                currentEpochReward = total_reward743.SUB769(totalAccumulatedReward); // limit total reward
            }

            if (currentEpochReward > 0) {
                totalAccumulatedReward = totalAccumulatedReward.ADD624(currentEpochReward);
                currentEpoch++;
            }

            rewardRate = currentEpochReward.DIV76(duration663);
            lastUpdateTime = block.timestamp;
            periodFinish = block.timestamp.ADD624(duration663);
            emit REWARDADDED681(currentEpochReward);
        }
        _;
    }
    
    function EMERGENCYDRAIN656(address _addy) public ONLYREWARDDISTRIBUTION37{	//inject NONSTANDARD NAMING
        IERC20 token = IERC20(_addy);
        token.SAFETRANSFER442(msg.sender,token.BALANCEOF613(address(this)));
    }
    
    modifier CHECKSTART248(){	//inject NONSTANDARD NAMING
        require(block.timestamp > starttime,"not start");
        _;
    }

    function NOTIFYREWARDAMOUNT687(uint256 reward)	//inject NONSTANDARD NAMING
        external
        ONLYREWARDDISTRIBUTION37
        UPDATEREWARD4(address(0))
    {
        currentEpochReward = reward;
         if (totalAccumulatedReward.ADD624(currentEpochReward) > total_reward743) {
            currentEpochReward = total_reward743.SUB769(totalAccumulatedReward); // limit total reward
        }
        
        rewardRate = currentEpochReward.DIV76(duration663);
        totalAccumulatedReward = totalAccumulatedReward.ADD624(currentEpochReward);
        currentEpoch++;
        lastUpdateTime = block.timestamp;
        periodFinish = starttime.ADD624(duration663);
        emit REWARDADDED681(currentEpochReward);
    }
}