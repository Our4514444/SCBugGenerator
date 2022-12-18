                                                                 

                                                                 

// File: contracts/Storage.sol

pragma solidity 0.5.16;

contract Storage {

  address public governance;
  address public controller;

  constructor() public {
    governance = msg.sender;
  }

  modifier ONLYGOVERNANCE484() {	//inject NONSTANDARD NAMING
    require(ISGOVERNANCE5(msg.sender), "Not governance");
    _;
  }

  function SETGOVERNANCE517(address _governance) public ONLYGOVERNANCE484 {	//inject NONSTANDARD NAMING
    require(_governance != address(0), "new governance shouldn't be empty");
    governance = _governance;
  }

  function SETCONTROLLER221(address _controller) public ONLYGOVERNANCE484 {	//inject NONSTANDARD NAMING
    require(_controller != address(0), "new controller shouldn't be empty");
    controller = _controller;
  }

  function ISGOVERNANCE5(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
    return account == governance;
  }

  function ISCONTROLLER654(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
    return account == controller;
  }
}

// File: contracts/Governable.sol

pragma solidity 0.5.16;


contract Governable {

  Storage public store;

  constructor(address _store) public {
    require(_store != address(0), "new storage shouldn't be empty");
    store = Storage(_store);
  }

  modifier ONLYGOVERNANCE484() {	//inject NONSTANDARD NAMING
    require(store.ISGOVERNANCE5(msg.sender), "Not governance");
    _;
  }

  function SETSTORAGE348(address _store) public ONLYGOVERNANCE484 {	//inject NONSTANDARD NAMING
    require(_store != address(0), "new storage shouldn't be empty");
    store = Storage(_store);
  }

  function GOVERNANCE526() public view returns (address) {	//inject NONSTANDARD NAMING
    return store.governance();
  }
}

// File: contracts/Controllable.sol

pragma solidity 0.5.16;


contract Controllable is Governable {

  constructor(address _storage) Governable(_storage) public {
  }

  modifier ONLYCONTROLLER981() {	//inject NONSTANDARD NAMING
    require(store.ISCONTROLLER654(msg.sender), "Not a controller");
    _;
  }

  modifier ONLYCONTROLLERORGOVERNANCE72(){	//inject NONSTANDARD NAMING
    require((store.ISCONTROLLER654(msg.sender) || store.ISGOVERNANCE5(msg.sender)),
      "The caller must be controller or governance");
    _;
  }

  function CONTROLLER536() public view returns (address) {	//inject NONSTANDARD NAMING
    return store.controller();
  }
}

// File: contracts/hardworkInterface/IController.sol

pragma solidity 0.5.16;

interface IController {
    // [Grey list]
    // An EOA can safely interact with the system no matter what.
    // If you're using Metamask, you're using an EOA.
    // Only smart contracts may be affected by this grey list.
    //
    // This contract will not be able to ban any EOA from the system
    // even if an EOA is being added to the greyList, he/she will still be able
    // to interact with the whole system as if nothing happened.
    // Only smart contracts will be affected by being added to the greyList.
    // This grey list is only used in Vault.sol, see the code there for reference
    function GREYLIST259(address _target) external view returns(bool);	//inject NONSTANDARD NAMING

    function ADDVAULTANDSTRATEGY716(address _vault, address _strategy) external;	//inject NONSTANDARD NAMING
    function DOHARDWORK680(address _vault) external;	//inject NONSTANDARD NAMING
    function HASVAULT161(address _vault) external returns(bool);	//inject NONSTANDARD NAMING

    function SALVAGE13(address _token, uint256 amount) external;	//inject NONSTANDARD NAMING
    function SALVAGESTRATEGY705(address _strategy, address _token, uint256 amount) external;	//inject NONSTANDARD NAMING

    function NOTIFYFEE212(address _underlying, uint256 fee) external;	//inject NONSTANDARD NAMING
    function PROFITSHARINGNUMERATOR336() external view returns (uint256);	//inject NONSTANDARD NAMING
    function PROFITSHARINGDENOMINATOR568() external view returns (uint256);	//inject NONSTANDARD NAMING
}

// File: contracts/RewardPool.sol

// https://etherscan.io/address/0xDCB6A51eA3CA5d3Fd898Fd6564757c7aAeC3ca92#code

                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

// File: @openzeppelin/contracts/math/Math.sol

pragma solidity ^0.5.0;



                                                                         
library Math {
                                                               
    function MAX383(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a >= b ? a : b;
    }

                                                                
    function MIN788(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return a < b ? a : b;
    }

                                                                                                          
    function AVERAGE133(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // (a + b) / 2 can overflow, so we distribute
        return (a / 2) + (b / 2) + ((a % 2 + b % 2) / 2);
    }
}

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD721(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB293(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB293(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB293(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL349(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV127(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV127(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV127(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD328(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD328(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD328(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/GSN/Context.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER534() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA859() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

pragma solidity ^0.5.0;

                                                                                                                                                                                                                                                                                                                                                                        
contract Ownable is Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED68(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    constructor () internal {
        _owner = _MSGSENDER534();
        emit OWNERSHIPTRANSFERRED68(address(0), _owner);
    }

                                                                     
    function OWNER495() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER736() {	//inject NONSTANDARD NAMING
        require(ISOWNER838(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER838() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER534() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP300() public ONLYOWNER736 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED68(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP498(address newOwner) public ONLYOWNER736 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP760(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP760(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED68(_owner, newOwner);
        _owner = newOwner;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.5.0;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY932() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF958(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER5(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE288(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE844(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM834(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER389(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL881(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity ^0.5.5;

                                                                   
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT689(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                          
    function TOPAYABLE362(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function SENDVALUE870(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

pragma solidity ^0.5.0;




                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER309(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN122(token, abi.encodeWithSelector(token.TRANSFER5.selector, to, value));
    }

    function SAFETRANSFERFROM622(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN122(token, abi.encodeWithSelector(token.TRANSFERFROM834.selector, from, to, value));
    }

    function SAFEAPPROVE877(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE288(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN122(token, abi.encodeWithSelector(token.APPROVE844.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE543(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE288(address(this), spender).ADD721(value);
        CALLOPTIONALRETURN122(token, abi.encodeWithSelector(token.APPROVE844.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE696(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE288(address(this), spender).SUB293(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN122(token, abi.encodeWithSelector(token.APPROVE844.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN122(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT689(), "SafeERC20: call to non-contract");

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

pragma solidity ^0.5.0;



contract IRewardDistributionRecipient is Ownable {
    address rewardDistribution;

    constructor(address _rewardDistribution) public {
        rewardDistribution = _rewardDistribution;
    }

    function NOTIFYREWARDAMOUNT805(uint256 reward) external;	//inject NONSTANDARD NAMING

    modifier ONLYREWARDDISTRIBUTION103() {	//inject NONSTANDARD NAMING
        require(_MSGSENDER534() == rewardDistribution, "Caller is not reward distribution");
        _;
    }

    function SETREWARDDISTRIBUTION112(address _rewardDistribution)	//inject NONSTANDARD NAMING
        external
        ONLYOWNER736
    {
        rewardDistribution = _rewardDistribution;
    }
}

// File: contracts/CurveRewards.sol

pragma solidity ^0.5.0;




                                                                                                                                                    

contract LPTokenWrapper {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    IERC20 public lpToken;

    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;

    function TOTALSUPPLY932() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF958(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function STAKE727(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.ADD721(amount);
        _balances[msg.sender] = _balances[msg.sender].ADD721(amount);
        lpToken.SAFETRANSFERFROM622(msg.sender, address(this), amount);
    }

    function WITHDRAW104(uint256 amount) public {	//inject NONSTANDARD NAMING
        _totalSupply = _totalSupply.SUB293(amount);
        _balances[msg.sender] = _balances[msg.sender].SUB293(amount);
        lpToken.SAFETRANSFER309(msg.sender, amount);
    }

    // Harvest migrate
    // only called by the migrateStakeFor in the MigrationHelperRewardPool
    function MIGRATESTAKEFOR202(address target, uint256 amountNewShare) internal  {	//inject NONSTANDARD NAMING
      _totalSupply = _totalSupply.ADD721(amountNewShare);
      _balances[target] = _balances[target].ADD721(amountNewShare);
    }
}

                                                                                                                                                                 

contract NoMintRewardPool is LPTokenWrapper, IRewardDistributionRecipient, Controllable {

    using Address for address;

    IERC20 public rewardToken;
    uint256 public duration; // making it not a constant is less gas efficient, but portable

    uint256 public periodFinish = 0;
    uint256 public rewardRate = 0;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored;
    mapping(address => uint256) public userRewardPerTokenPaid;
    mapping(address => uint256) public rewards;

    mapping (address => bool) smartContractStakers;

    // Harvest Migration
    // lpToken is the target vault
    address public sourceVault;
    address public migrationStrategy;
    bool public canMigrate;

    event REWARDADDED473(uint256 reward);	//inject NONSTANDARD NAMING
    event STAKED733(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event WITHDRAWN352(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    event REWARDPAID263(address indexed user, uint256 reward);	//inject NONSTANDARD NAMING
    event REWARDDENIED498(address indexed user, uint256 reward);	//inject NONSTANDARD NAMING
    event SMARTCONTRACTRECORDED887(address indexed smartContractAddress, address indexed smartContractInitiator);	//inject NONSTANDARD NAMING

    // Harvest Migration
    event MIGRATED818(address indexed account, uint256 legacyShare, uint256 newShare);	//inject NONSTANDARD NAMING

    modifier UPDATEREWARD829(address account) {	//inject NONSTANDARD NAMING
        rewardPerTokenStored = REWARDPERTOKEN253();
        lastUpdateTime = LASTTIMEREWARDAPPLICABLE208();
        if (account != address(0)) {
            rewards[account] = EARNED551(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }

    modifier ONLYMIGRATIONSTRATEGY980() {	//inject NONSTANDARD NAMING
      require(msg.sender == migrationStrategy, "sender needs to be migration strategy");
      _;
    }

    // [Hardwork] setting the reward, lpToken, duration, and rewardDistribution for each pool
    constructor(address _rewardToken,
        address _lpToken,
        uint256 _duration,
        address _rewardDistribution,
        address _storage,
        address _sourceVault,
        address _migrationStrategy) public
    IRewardDistributionRecipient(_rewardDistribution)
    Controllable(_storage) // only used for referencing the grey list
    {
        rewardToken = IERC20(_rewardToken);
        lpToken = IERC20(_lpToken);
        duration = _duration;
        sourceVault = _sourceVault;
        migrationStrategy = _migrationStrategy;
    }

    function LASTTIMEREWARDAPPLICABLE208() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return Math.MIN788(block.timestamp, periodFinish);
    }

    function REWARDPERTOKEN253() public view returns (uint256) {	//inject NONSTANDARD NAMING
        if (TOTALSUPPLY932() == 0) {
            return rewardPerTokenStored;
        }
        return
            rewardPerTokenStored.ADD721(
                LASTTIMEREWARDAPPLICABLE208()
                    .SUB293(lastUpdateTime)
                    .MUL349(rewardRate)
                    .MUL349(1e18)
                    .DIV127(TOTALSUPPLY932())
            );
    }

    function EARNED551(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return
            BALANCEOF958(account)
                .MUL349(REWARDPERTOKEN253().SUB293(userRewardPerTokenPaid[account]))
                .DIV127(1e18)
                .ADD721(rewards[account]);
    }

    // stake visibility is public as overriding LPTokenWrapper's stake() function
    function STAKE727(uint256 amount) public UPDATEREWARD829(msg.sender) {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot stake 0");
        RECORDSMARTCONTRACT810();

        super.STAKE727(amount);
        emit STAKED733(msg.sender, amount);
    }

    function WITHDRAW104(uint256 amount) public UPDATEREWARD829(msg.sender) {	//inject NONSTANDARD NAMING
        require(amount > 0, "Cannot withdraw 0");
        super.WITHDRAW104(amount);
        emit WITHDRAWN352(msg.sender, amount);
    }

    function EXIT785() external {	//inject NONSTANDARD NAMING
        WITHDRAW104(BALANCEOF958(msg.sender));
        GETREWARD780();
    }

                                                                                          
                                                                                            
                                
    function PUSHREWARD335(address recipient) public UPDATEREWARD829(recipient) ONLYGOVERNANCE484 {	//inject NONSTANDARD NAMING
        uint256 reward = EARNED551(recipient);
        if (reward > 0) {
            rewards[recipient] = 0;
            // If it is a normal user and not smart contract,
            // then the requirement will pass
            // If it is a smart contract, then
            // make sure that it is not on our greyList.
            if (!recipient.ISCONTRACT689() || !IController(CONTROLLER536()).GREYLIST259(recipient)) {
                rewardToken.SAFETRANSFER309(recipient, reward);
                emit REWARDPAID263(recipient, reward);
            } else {
                emit REWARDDENIED498(recipient, reward);
            }
        }
    }

    function GETREWARD780() public UPDATEREWARD829(msg.sender) {	//inject NONSTANDARD NAMING
        uint256 reward = EARNED551(msg.sender);
        if (reward > 0) {
            rewards[msg.sender] = 0;
            // If it is a normal user and not smart contract,
            // then the requirement will pass
            // If it is a smart contract, then
            // make sure that it is not on our greyList.
            if (tx.origin == msg.sender || !IController(CONTROLLER536()).GREYLIST259(msg.sender)) {
                rewardToken.SAFETRANSFER309(msg.sender, reward);
                emit REWARDPAID263(msg.sender, reward);
            } else {
                emit REWARDDENIED498(msg.sender, reward);
            }
        }
    }

    function NOTIFYREWARDAMOUNT805(uint256 reward)	//inject NONSTANDARD NAMING
        external
        ONLYREWARDDISTRIBUTION103
        UPDATEREWARD829(address(0))
    {
        // overflow fix according to https://sips.synthetix.io/sips/sip-77
        require(reward < uint(-1) / 1e18, "the notified reward cannot invoke multiplication overflow");

        if (block.timestamp >= periodFinish) {
            rewardRate = reward.DIV127(duration);
        } else {
            uint256 remaining = periodFinish.SUB293(block.timestamp);
            uint256 leftover = remaining.MUL349(rewardRate);
            rewardRate = reward.ADD721(leftover).DIV127(duration);
        }
        lastUpdateTime = block.timestamp;
        periodFinish = block.timestamp.ADD721(duration);
        emit REWARDADDED473(reward);
    }

    // Harvest Smart Contract recording
    function RECORDSMARTCONTRACT810() internal {	//inject NONSTANDARD NAMING
      if( tx.origin != msg.sender ) {
        smartContractStakers[msg.sender] = true;
        emit SMARTCONTRACTRECORDED887(msg.sender, tx.origin);
      }
    }


    // Harvest Migrate

    function SETCANMIGRATE464(bool _canMigrate) public ONLYGOVERNANCE484 {	//inject NONSTANDARD NAMING
      canMigrate = _canMigrate;
    }

    // obtain the legacy vault sahres from the migration strategy
    function PULLFROMSTRATEGY897() public ONLYMIGRATIONSTRATEGY980 {	//inject NONSTANDARD NAMING
      canMigrate = true;
      lpToken.SAFETRANSFERFROM622(msg.sender, address(this),lpToken.BALANCEOF958(msg.sender));
    }

    // called only by migrate() 
    function MIGRATESTAKEFOR202(address target, uint256 amountNewShare) internal UPDATEREWARD829(target) {	//inject NONSTANDARD NAMING
      super.MIGRATESTAKEFOR202(target, amountNewShare);
      emit STAKED733(target, amountNewShare);
    }

    // The MigrationHelperReward Pool already holds the shares of the targetVault
    // the users are coming with the old share to exchange for the new one
    // We want to incentivize the user to migrate, thus we will not stake for them before they migrate.
    // We also want to save user some hassle, thus when user migrate, we will automatically stake for them

    function MIGRATE923() external {	//inject NONSTANDARD NAMING
      require(canMigrate, "Funds not yet migrated");
      RECORDSMARTCONTRACT810();

      // casting here for readability
      address targetVault = address(lpToken);

      // total legacy share - migrated legacy shares
      // What happens when people wrongfully send their shares directly to this pool
      // without using the migrate() function? The people that are properly migrating would benefit from this.
      uint256 remainingLegacyShares = (IERC20(sourceVault).TOTALSUPPLY932()).SUB293(IERC20(sourceVault).BALANCEOF958(address(this)));

      // How many new shares does this contract hold?
      // We cannot get this just by IERC20(targetVault).balanceOf(address(this))
      // because this contract itself is a reward pool where they stake those vault shares
      // luckily, reward pool share and the underlying lp token works in 1:1
      // _totalSupply is the amount that is staked
      uint256 unmigratedNewShares = IERC20(targetVault).BALANCEOF958(address(this)).SUB293(TOTALSUPPLY932());
      uint256 userLegacyShares = IERC20(sourceVault).BALANCEOF958(msg.sender);
      require(userLegacyShares <= remainingLegacyShares, "impossible for user legacy share to have more than the remaining legacy share");

      // Because of the assertion above, 
      // we know for sure that userEquivalentNewShares must be less than unmigratedNewShares (the idle tokens sitting in this contract)
      uint256 userEquivalentNewShares = userLegacyShares.MUL349(unmigratedNewShares).DIV127(remainingLegacyShares);
      
      // Take the old shares from user
      IERC20(sourceVault).SAFETRANSFERFROM622(msg.sender, address(this), userLegacyShares);
      
      // User has now migrated, let's stake the idle tokens into the pool for the user
      MIGRATESTAKEFOR202(msg.sender, userEquivalentNewShares);

      emit MIGRATED818(msg.sender, userLegacyShares, userEquivalentNewShares);
    }
}