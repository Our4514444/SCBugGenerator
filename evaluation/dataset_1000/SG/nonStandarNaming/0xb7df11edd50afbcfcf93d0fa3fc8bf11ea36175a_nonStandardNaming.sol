                                                                 

pragma solidity 0.5.16;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY256() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF197(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER484(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE573(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE324(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM140(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER519(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL24(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD304(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB724(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB724(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB724(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL275(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV937(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV937(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV937(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD262(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD262(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD262(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract Initializable {

                                                                       
  bool private initialized;

                                                                                         
  bool private initializing;

                                                                                
  modifier INITIALIZER622() {	//inject NONSTANDARD NAMING
    require(initializing || ISCONSTRUCTOR857() || !initialized, "Contract instance has already been initialized");

    bool isTopLevelCall = !initializing;
    if (isTopLevelCall) {
      initializing = true;
      initialized = true;
    }

    _;

    if (isTopLevelCall) {
      initializing = false;
    }
  }

                                                                                 
  function ISCONSTRUCTOR857() private view returns (bool) {	//inject NONSTANDARD NAMING
    // extcodesize checks the size of the code stored in an address, and
    // address returns the current address. Since the code is still not
    // deployed when running a constructor, any checks on its code size will
    // yield zero, making it an effective way to detect if a contract is
    // under construction or not.
    address self = address(this);
    uint256 cs;
    assembly { cs := extcodesize(self) }
    return cs == 0;
  }

  // Reserved storage space to allow for layout changes in the future.
  uint256[50] private ______gap;
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context is Initializable {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER830() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA383() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}


                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD304(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS184(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE874(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS184(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS184(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}


contract PauserRole is Initializable, Context {
    using Roles for Roles.Role;

    event PAUSERADDED411(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED951(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    function INITIALIZE719(address sender) public INITIALIZER622 {	//inject NONSTANDARD NAMING
        if (!ISPAUSER633(sender)) {
            _ADDPAUSER937(sender);
        }
    }

    modifier ONLYPAUSER448() {	//inject NONSTANDARD NAMING
        require(ISPAUSER633(_MSGSENDER830()), "PauserRole: caller does not have the Pauser role");
        _;
    }

    function ISPAUSER633(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS184(account);
    }

    function ADDPAUSER70(address account) public ONLYPAUSER448 {	//inject NONSTANDARD NAMING
        _ADDPAUSER937(account);
    }

    function RENOUNCEPAUSER130() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER669(_MSGSENDER830());
    }

    function _ADDPAUSER937(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD304(account);
        emit PAUSERADDED411(account);
    }

    function _REMOVEPAUSER669(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE874(account);
        emit PAUSERREMOVED951(account);
    }

    uint256[50] private ______gap;
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                       
contract Pausable is Initializable, Context, PauserRole {
                                                                                        
    event PAUSED375(address account);	//inject NONSTANDARD NAMING

                                                                                     
    event UNPAUSED5(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

                                                                                                                       
    function INITIALIZE719(address sender) public INITIALIZER622 {	//inject NONSTANDARD NAMING
        PauserRole.INITIALIZE719(sender);

        _paused = false;
    }

                                                                                        
    function PAUSED792() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED404() {	//inject NONSTANDARD NAMING
        require(!_paused, "Pausable: paused");
        _;
    }

                                                                                                  
    modifier WHENPAUSED780() {	//inject NONSTANDARD NAMING
        require(_paused, "Pausable: not paused");
        _;
    }

                                                                                
    function PAUSE93() public ONLYPAUSER448 WHENNOTPAUSED404 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED375(_MSGSENDER830());
    }

                                                                                   
    function UNPAUSE866() public ONLYPAUSER448 WHENPAUSED780 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED5(_MSGSENDER830());
    }

    uint256[50] private ______gap;
}


                                                                                                                                                                                                                                                                                                                                                                       
contract Ownable is Initializable, Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED301(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    function INITIALIZE719(address sender) public INITIALIZER622 {	//inject NONSTANDARD NAMING
        _owner = sender;
        emit OWNERSHIPTRANSFERRED301(address(0), _owner);
    }

                                                                     
    function OWNER983() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER958() {	//inject NONSTANDARD NAMING
        require(ISOWNER744(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER744() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER830() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                 
    function RENOUNCEOWNERSHIP745() public ONLYOWNER958 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED301(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP241(address newOwner) public ONLYOWNER958 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP710(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP710(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED301(_owner, newOwner);
        _owner = newOwner;
    }

    uint256[50] private ______gap;
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract ReentrancyGuard is Initializable {
    // counter to allow mutex lock with only one SSTORE operation
    uint256 private _guardCounter;

    function INITIALIZE719() public INITIALIZER622 {	//inject NONSTANDARD NAMING
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT381() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }

    uint256[50] private ______gap;
}


interface IUniswapV2Router01 {
    function FACTORY494() external pure returns (address);	//inject NONSTANDARD NAMING

    function QUOTE455(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);	//inject NONSTANDARD NAMING
    function GETAMOUNTOUT937(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);	//inject NONSTANDARD NAMING
    function GETAMOUNTIN235(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);	//inject NONSTANDARD NAMING
    function GETAMOUNTSOUT499(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);	//inject NONSTANDARD NAMING
    function GETAMOUNTSIN173(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);	//inject NONSTANDARD NAMING

    function WETH604() external view returns (address);	//inject NONSTANDARD NAMING

    function ADDLIQUIDITY669(	//inject NONSTANDARD NAMING
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function ADDLIQUIDITYETH118(	//inject NONSTANDARD NAMING
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function REMOVELIQUIDITY476(	//inject NONSTANDARD NAMING
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function REMOVELIQUIDITYETH985(	//inject NONSTANDARD NAMING
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function REMOVELIQUIDITYWITHPERMIT187(	//inject NONSTANDARD NAMING
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function REMOVELIQUIDITYETHWITHPERMIT70(	//inject NONSTANDARD NAMING
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function SWAPEXACTTOKENSFORTOKENS972(	//inject NONSTANDARD NAMING
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function SWAPTOKENSFOREXACTTOKENS251(	//inject NONSTANDARD NAMING
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function SWAPEXACTETHFORTOKENS769(uint amountOutMin, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        payable
        returns (uint[] memory amounts);
    function SWAPTOKENSFOREXACTETH430(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        returns (uint[] memory amounts);
    function SWAPEXACTTOKENSFORETH951(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        returns (uint[] memory amounts);
    function SWAPETHFOREXACTTOKENS598(uint amountOut, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        payable
        returns (uint[] memory amounts);
}


library BasisPoints {
    using SafeMath for uint;

    uint constant private basis_points641 = 10000;	//inject NONSTANDARD NAMING

    function MULBP82(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        return amt.MUL275(bp).DIV937(basis_points641);
    }

    function DIVBP838(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(bp > 0, "Cannot divide by zero.");
        if (amt == 0) return 0;
        return amt.MUL275(basis_points641).DIV937(bp);
    }

    function ADDBP17(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        if (bp == 0) return amt;
        return amt.ADD304(MULBP82(amt, bp));
    }

    function SUBBP193(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        if (bp == 0) return amt;
        return amt.SUB724(MULBP82(amt, bp));
    }
}


contract LidSimplifiedPresaleTimer is Initializable, Ownable {
    using SafeMath for uint;

    uint public startTime;
    uint public endTime;
    uint public hardCapTimer;
    uint public softCap;
    address public presale;

    function INITIALIZE719(	//inject NONSTANDARD NAMING
        uint _startTime,
        uint _hardCapTimer,
        uint _softCap,
        address _presale,
        address owner
    ) external INITIALIZER622 {
        Ownable.INITIALIZE719(msg.sender);
        startTime = _startTime;
        hardCapTimer = _hardCapTimer;
        softCap = _softCap;
        presale = _presale;
        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP710(owner);
    }

    function SETSTARTTIME693(uint time) external ONLYOWNER958 {	//inject NONSTANDARD NAMING
        startTime = time;
    }

    function SETENDTIME456(uint time) external ONLYOWNER958 {	//inject NONSTANDARD NAMING
        endTime = time;
    }

    function UPDATEENDTIME974() external returns (uint) {	//inject NONSTANDARD NAMING
        if (endTime != 0) return endTime;
        if (presale.balance >= softCap) {
            endTime = now.ADD304(hardCapTimer);
            return endTime;
        }
        return 0;
    }

    function ISSTARTED968() external view returns (bool) {	//inject NONSTANDARD NAMING
        return (startTime != 0 && now > startTime);
    }

}


contract LidSimplifiedPresaleRedeemer is Initializable, Ownable {
    using BasisPoints for uint;
    using SafeMath for uint;

    uint public redeemBP;
    uint public redeemInterval;

    uint[] public bonusRangeStart;
    uint[] public bonusRangeBP;
    uint public currentBonusIndex;

    uint public totalShares;
    uint public totalDepositors;
    mapping(address => uint) public accountDeposits;
    mapping(address => uint) public accountShares;
    mapping(address => uint) public accountClaimedTokens;

    address private presale;

    modifier ONLYPRESALECONTRACT551 {	//inject NONSTANDARD NAMING
        require(msg.sender == presale, "Only callable by presale contract.");
        _;
    }

    function INITIALIZE719(	//inject NONSTANDARD NAMING
        uint _redeemBP,
        uint _redeemInterval,
        uint[] calldata _bonusRangeStart,
        uint[] calldata _bonusRangeBP,
        address _presale,
        address owner
    ) external INITIALIZER622 {
        Ownable.INITIALIZE719(msg.sender);

        redeemBP = _redeemBP;
        redeemInterval = _redeemInterval;
        presale = _presale;

        require(
            _bonusRangeStart.length == _bonusRangeBP.length,
            "Must have equal values for bonus range start and BP"
        );
        require(_bonusRangeStart.length <= 10, "Cannot have more than 10 items in bonusRange");
        for (uint i = 0; i < _bonusRangeStart.length; ++i) {
            bonusRangeStart.push(_bonusRangeStart[i]);
        }
        for (uint i = 0; i < _bonusRangeBP.length; ++i) {
            bonusRangeBP.push(_bonusRangeBP[i]);
        }

        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP710(owner);
    }

    function SETCLAIMED914(address account, uint amount) external ONLYPRESALECONTRACT551 {	//inject NONSTANDARD NAMING
        accountClaimedTokens[account] = accountClaimedTokens[account].ADD304(amount);
    }

    function SETDEPOSIT391(address account, uint deposit, uint postDepositEth) external ONLYPRESALECONTRACT551 {	//inject NONSTANDARD NAMING
        if (accountDeposits[account] == 0) totalDepositors = totalDepositors.ADD304(1);
        accountDeposits[account] = accountDeposits[account].ADD304(deposit);
        uint sharesToAdd;
        if (currentBonusIndex.ADD304(1) >= bonusRangeBP.length) {
            //final bonus rate
            sharesToAdd = deposit.ADDBP17(bonusRangeBP[currentBonusIndex]);
        } else if (postDepositEth < bonusRangeStart[currentBonusIndex.ADD304(1)]) {
            //Purchase doesnt push to next start
            sharesToAdd = deposit.ADDBP17(bonusRangeBP[currentBonusIndex]);
        } else {
            //purchase straddles next start
            uint previousBonusBP = bonusRangeBP[currentBonusIndex];
            uint newBonusBP = bonusRangeBP[currentBonusIndex.ADD304(1)];
            uint newBonusDeposit = postDepositEth.SUB724(bonusRangeStart[currentBonusIndex.ADD304(1)]);
            uint previousBonusDeposit = deposit.SUB724(newBonusDeposit);
            sharesToAdd = newBonusDeposit.ADDBP17(newBonusBP).ADD304(
                previousBonusDeposit.ADDBP17(previousBonusBP));
            currentBonusIndex = currentBonusIndex.ADD304(1);
        }
        accountShares[account] = accountShares[account].ADD304(sharesToAdd);
        totalShares = totalShares.ADD304(sharesToAdd);
    }

    function CALCULATERATEPERETH538(uint totalPresaleTokens, uint depositEth, uint hardCap) external view returns (uint) {	//inject NONSTANDARD NAMING

        uint tokensPerEtherShare = totalPresaleTokens
        .MUL275(1 ether)
        .DIV937(
            GETMAXSHARES183(hardCap)
        );

        uint bp;
        if (depositEth >= bonusRangeStart[bonusRangeStart.length.SUB724(1)]) {
            bp = bonusRangeBP[bonusRangeBP.length.SUB724(1)];
        } else {
            for (uint i = 1; i < bonusRangeStart.length; ++i) {
                if (bp == 0) {
                    if (depositEth < bonusRangeStart[i]) {
                        bp = bonusRangeBP[i.SUB724(1)];
                    }
                }
            }
        }
        return tokensPerEtherShare.ADDBP17(bp);
    }

    function CALCULATEREEDEMABLE999(	//inject NONSTANDARD NAMING
        address account,
        uint finalEndTime,
        uint totalPresaleTokens
    ) external view returns (uint) {
        if (finalEndTime == 0) return 0;
        if (finalEndTime >= now) return 0;
        uint earnedTokens = accountShares[account].MUL275(totalPresaleTokens).DIV937(totalShares);
        uint claimedTokens = accountClaimedTokens[account];
        uint cycles = now.SUB724(finalEndTime).DIV937(redeemInterval).ADD304(1);
        uint totalRedeemable = earnedTokens.MULBP82(redeemBP).MUL275(cycles);
        uint claimable;
        if (totalRedeemable >= earnedTokens) {
            claimable = earnedTokens.SUB724(claimedTokens);
        } else {
            claimable = totalRedeemable.SUB724(claimedTokens);
        }
        return claimable;
    }

    function GETMAXSHARES183(uint hardCap) public view returns (uint) {	//inject NONSTANDARD NAMING
        uint maxShares;
        for (uint i = 0; i < bonusRangeStart.length; ++i) {
            uint amt;
            if (i < bonusRangeStart.length.SUB724(1)) {
                amt = bonusRangeStart[i.ADD304(1)].SUB724(bonusRangeStart[i]);
            } else {
                amt = hardCap.SUB724(bonusRangeStart[i]);
            }
            maxShares = maxShares.ADD304(amt.ADDBP17(bonusRangeBP[i]));
        }
        return maxShares;
    }
}

interface IStakeHandler {
    function HANDLESTAKE681(address staker, uint stakerDeltaValue, uint stakerFinalValue) external;	//inject NONSTANDARD NAMING
    function HANDLEUNSTAKE17(address staker, uint stakerDeltaValue, uint stakerFinalValue) external;	//inject NONSTANDARD NAMING
}


interface ILidCertifiableToken {
    function ACTIVATETRANSFERS666() external;	//inject NONSTANDARD NAMING
    function ACTIVATETAX593() external;	//inject NONSTANDARD NAMING
    function MINT987(address account, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ADDMINTER806(address account) external;	//inject NONSTANDARD NAMING
    function RENOUNCEMINTER479() external;	//inject NONSTANDARD NAMING
    function TRANSFER484(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE324(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM140(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE573(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ISMINTER947(address account) external view returns (bool);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY256() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF197(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    event TRANSFER519(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL24(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

}


contract LidStaking is Initializable, Ownable {
    using BasisPoints for uint;
    using SafeMath for uint;

    uint256 constant internal distribution_multiplier164 = 2 ** 64;	//inject NONSTANDARD NAMING

    uint public stakingTaxBP;
    uint public unstakingTaxBP;
    ILidCertifiableToken private lidToken;

    mapping(address => uint) public stakeValue;
    mapping(address => int) public stakerPayouts;


    uint public totalDistributions;
    uint public totalStaked;
    uint public totalStakers;
    uint public profitPerShare;
    uint private emptyStakeTokens; //These are tokens given to the contract when there are no stakers.

    IStakeHandler[] public stakeHandlers;
    uint public startTime;

    uint public registrationFeeWithReferrer;
    uint public registrationFeeWithoutReferrer;
    mapping(address => uint) public accountReferrals;
    mapping(address => bool) public stakerIsRegistered;

    event ONDISTRIBUTE808(address sender, uint amountSent);	//inject NONSTANDARD NAMING
    event ONSTAKE327(address sender, uint amount, uint tax);	//inject NONSTANDARD NAMING
    event ONUNSTAKE543(address sender, uint amount, uint tax);	//inject NONSTANDARD NAMING
    event ONREINVEST360(address sender, uint amount, uint tax);	//inject NONSTANDARD NAMING
    event ONWITHDRAW478(address sender, uint amount);	//inject NONSTANDARD NAMING

    modifier ONLYLIDTOKEN452 {	//inject NONSTANDARD NAMING
        require(msg.sender == address(lidToken), "Can only be called by LidToken contract.");
        _;
    }

    modifier WHENSTAKINGACTIVE251 {	//inject NONSTANDARD NAMING
        require(startTime != 0 && now > startTime, "Staking not yet started.");
        _;
    }

    function INITIALIZE719(	//inject NONSTANDARD NAMING
        uint _stakingTaxBP,
        uint _ustakingTaxBP,
        uint _registrationFeeWithReferrer,
        uint _registrationFeeWithoutReferrer,
        address owner,
        ILidCertifiableToken _lidToken
    ) external INITIALIZER622 {
        Ownable.INITIALIZE719(msg.sender);
        stakingTaxBP = _stakingTaxBP;
        unstakingTaxBP = _ustakingTaxBP;
        lidToken = _lidToken;
        registrationFeeWithReferrer = _registrationFeeWithReferrer;
        registrationFeeWithoutReferrer = _registrationFeeWithoutReferrer;
        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP710(owner);
    }

    function REGISTERANDSTAKE328(uint amount) public {	//inject NONSTANDARD NAMING
        REGISTERANDSTAKE328(amount, address(0x0));
    }

    function REGISTERANDSTAKE328(uint amount, address referrer) public WHENSTAKINGACTIVE251 {	//inject NONSTANDARD NAMING
        require(!stakerIsRegistered[msg.sender], "Staker must not be registered");
        require(lidToken.BALANCEOF197(msg.sender) >= amount, "Must have enough balance to stake amount");
        uint finalAmount;
        if(address(0x0) == referrer) {
            //No referrer
            require(amount >= registrationFeeWithoutReferrer, "Must send at least enough LID to pay registration fee.");
            DISTRIBUTE947(registrationFeeWithoutReferrer);
            finalAmount = amount.SUB724(registrationFeeWithoutReferrer);
        } else {
            //has referrer
            require(amount >= registrationFeeWithReferrer, "Must send at least enough LID to pay registration fee.");
            require(lidToken.TRANSFERFROM140(msg.sender, referrer, registrationFeeWithReferrer), "Stake failed due to failed referral transfer.");
            accountReferrals[referrer] = accountReferrals[referrer].ADD304(1);
            finalAmount = amount.SUB724(registrationFeeWithReferrer);
        }
        stakerIsRegistered[msg.sender] = true;
        STAKE823(finalAmount);
    }

    function STAKE823(uint amount) public WHENSTAKINGACTIVE251 {	//inject NONSTANDARD NAMING
        require(stakerIsRegistered[msg.sender] == true, "Must be registered to stake.");
        require(amount >= 1e18, "Must stake at least one LID.");
        require(lidToken.BALANCEOF197(msg.sender) >= amount, "Cannot stake more LID than you hold unstaked.");
        if (stakeValue[msg.sender] == 0) totalStakers = totalStakers.ADD304(1);
        uint tax = _ADDSTAKE336(amount);
        require(lidToken.TRANSFERFROM140(msg.sender, address(this), amount), "Stake failed due to failed transfer.");
        emit ONSTAKE327(msg.sender, amount, tax);
    }

    function UNSTAKE281(uint amount) external WHENSTAKINGACTIVE251 {	//inject NONSTANDARD NAMING
        require(amount >= 1e18, "Must unstake at least one LID.");
        require(stakeValue[msg.sender] >= amount, "Cannot unstake more LID than you have staked.");
        //must withdraw all dividends, to prevent overflows
        WITHDRAW692(DIVIDENDSOF505(msg.sender));
        if (stakeValue[msg.sender] == amount) totalStakers = totalStakers.SUB724(1);
        totalStaked = totalStaked.SUB724(amount);
        stakeValue[msg.sender] = stakeValue[msg.sender].SUB724(amount);

        uint tax = FINDTAXAMOUNT245(amount, unstakingTaxBP);
        uint earnings = amount.SUB724(tax);
        _INCREASEPROFITPERSHARE953(tax);
        stakerPayouts[msg.sender] = UINTTOINT809(profitPerShare.MUL275(stakeValue[msg.sender]));

        for (uint i=0; i < stakeHandlers.length; i++) {
            stakeHandlers[i].HANDLEUNSTAKE17(msg.sender, amount, stakeValue[msg.sender]);
        }

        require(lidToken.TRANSFERFROM140(address(this), msg.sender, earnings), "Unstake failed due to failed transfer.");
        emit ONUNSTAKE543(msg.sender, amount, tax);
    }

    function WITHDRAW692(uint amount) public WHENSTAKINGACTIVE251 {	//inject NONSTANDARD NAMING
        require(DIVIDENDSOF505(msg.sender) >= amount, "Cannot withdraw more dividends than you have earned.");
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + UINTTOINT809(amount.MUL275(distribution_multiplier164));
        lidToken.TRANSFER484(msg.sender, amount);
        emit ONWITHDRAW478(msg.sender, amount);
    }

    function REINVEST684(uint amount) external WHENSTAKINGACTIVE251 {	//inject NONSTANDARD NAMING
        require(DIVIDENDSOF505(msg.sender) >= amount, "Cannot reinvest more dividends than you have earned.");
        uint payout = amount.MUL275(distribution_multiplier164);
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + UINTTOINT809(payout);
        uint tax = _ADDSTAKE336(amount);
        emit ONREINVEST360(msg.sender, amount, tax);
    }

    function DISTRIBUTE947(uint amount) public {	//inject NONSTANDARD NAMING
        require(lidToken.BALANCEOF197(msg.sender) >= amount, "Cannot distribute more LID than you hold unstaked.");
        totalDistributions = totalDistributions.ADD304(amount);
        _INCREASEPROFITPERSHARE953(amount);
        require(
            lidToken.TRANSFERFROM140(msg.sender, address(this), amount),
            "Distribution failed due to failed transfer."
        );
        emit ONDISTRIBUTE808(msg.sender, amount);
    }

    function HANDLETAXDISTRIBUTION932(uint amount) external ONLYLIDTOKEN452 {	//inject NONSTANDARD NAMING
        totalDistributions = totalDistributions.ADD304(amount);
        _INCREASEPROFITPERSHARE953(amount);
        emit ONDISTRIBUTE808(msg.sender, amount);
    }

    function DIVIDENDSOF505(address staker) public view returns (uint) {	//inject NONSTANDARD NAMING
        int divPayout = UINTTOINT809(profitPerShare.MUL275(stakeValue[staker]));
        require(divPayout >= stakerPayouts[staker], "dividend calc overflow");
        return uint(divPayout - stakerPayouts[staker])
            .DIV937(distribution_multiplier164);
    }

    function FINDTAXAMOUNT245(uint value, uint taxBP) public pure returns (uint) {	//inject NONSTANDARD NAMING
        return value.MULBP82(taxBP);
    }

    function NUMBERSTAKEHANDLERSREGISTERED27() external view returns (uint) {	//inject NONSTANDARD NAMING
        return stakeHandlers.length;
    }

    function REGISTERSTAKEHANDLER238(IStakeHandler sc) external ONLYOWNER958 {	//inject NONSTANDARD NAMING
        stakeHandlers.push(sc);
    }

    function UNREGISTERSTAKEHANDLER828(uint index) external ONLYOWNER958 {	//inject NONSTANDARD NAMING
        IStakeHandler sc = stakeHandlers[stakeHandlers.length-1];
        stakeHandlers.pop();
        stakeHandlers[index] = sc;
    }

    function SETSTAKINGBP978(uint valueBP) external ONLYOWNER958 {	//inject NONSTANDARD NAMING
        require(valueBP < 10000, "Tax connot be over 100% (10000 BP)");
        stakingTaxBP = valueBP;
    }

    function SETUNSTAKINGBP69(uint valueBP) external ONLYOWNER958 {	//inject NONSTANDARD NAMING
        require(valueBP < 10000, "Tax connot be over 100% (10000 BP)");
        unstakingTaxBP = valueBP;
    }

    function SETSTARTTIME693(uint _startTime) external ONLYOWNER958 {	//inject NONSTANDARD NAMING
        startTime = _startTime;
    }

    function SETREGISTRATIONFEES60(uint valueWithReferrer, uint valueWithoutReferrer) external ONLYOWNER958 {	//inject NONSTANDARD NAMING
        registrationFeeWithReferrer = valueWithReferrer;
        registrationFeeWithoutReferrer = valueWithoutReferrer;
    }

    function UINTTOINT809(uint val) internal pure returns (int) {	//inject NONSTANDARD NAMING
        if (val >= uint(-1).DIV937(2)) {
            require(false, "Overflow. Cannot convert uint to int.");
        } else {
            return int(val);
        }
    }

    function _ADDSTAKE336(uint amount) internal returns (uint tax) {	//inject NONSTANDARD NAMING
        tax = FINDTAXAMOUNT245(amount, stakingTaxBP);
        uint stakeAmount = amount.SUB724(tax);
        totalStaked = totalStaked.ADD304(stakeAmount);
        stakeValue[msg.sender] = stakeValue[msg.sender].ADD304(stakeAmount);
        for (uint i=0; i < stakeHandlers.length; i++) {
            stakeHandlers[i].HANDLESTAKE681(msg.sender, stakeAmount, stakeValue[msg.sender]);
        }
        uint payout = profitPerShare.MUL275(stakeAmount);
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + UINTTOINT809(payout);
        _INCREASEPROFITPERSHARE953(tax);
    }

    function _INCREASEPROFITPERSHARE953(uint amount) internal {	//inject NONSTANDARD NAMING
        if (totalStaked != 0) {
            if (emptyStakeTokens != 0) {
                amount = amount.ADD304(emptyStakeTokens);
                emptyStakeTokens = 0;
            }
            profitPerShare = profitPerShare.ADD304(amount.MUL275(distribution_multiplier164).DIV937(totalStaked));
        } else {
            emptyStakeTokens = emptyStakeTokens.ADD304(amount);
        }
    }

}

// File: contracts\LidSimplifiedPresaleAccess.sol

pragma solidity 0.5.16;


//TODO: Replace with abstract sc or interface. mocks should only be for testing



contract LidSimplifiedPresaleAccess is Initializable {
    using SafeMath for uint;
    LidStaking private staking;

    uint[5] private cutoffs;

    function INITIALIZE719(LidStaking _staking) external INITIALIZER622 {	//inject NONSTANDARD NAMING
        staking = _staking;
        //Precalculated
        cutoffs = [
            500000 ether,
            100000 ether,
            50000 ether,
            25000 ether,
            1 ether
        ];
    }

    function GETACCESSTIME411(address account, uint startTime) external view returns (uint accessTime) {	//inject NONSTANDARD NAMING
        uint stakeValue = staking.stakeValue(account);
        if (stakeValue == 0) return startTime.ADD304(15 minutes);
        if (stakeValue >= cutoffs[0]) return startTime;
        uint i=0;
        uint stake2 = cutoffs[0];
        while (stake2 > stakeValue && i < cutoffs.length) {
            i++;
            stake2 = cutoffs[i];
        }
        return startTime.ADD304(i.MUL275(3 minutes));
    }
}


contract LidSimplifiedPresale is Initializable, Ownable, ReentrancyGuard, Pausable {
    using BasisPoints for uint;
    using SafeMath for uint;

    uint public maxBuyPerAddress;

    uint public referralBP;

    uint public uniswapEthBP;
    uint public lidEthBP;

    uint public uniswapTokenBP;
    uint public presaleTokenBP;
    address[] public tokenPools;
    uint[] public tokenPoolBPs;

    uint public hardcap;
    uint public totalTokens;

    bool public hasSentToUniswap;
    bool public hasIssuedTokens;

    uint public finalEndTime;
    uint public finalEth;

    IERC20 private token;
    IUniswapV2Router01 private uniswapRouter;
    LidSimplifiedPresaleTimer private timer;
    LidSimplifiedPresaleRedeemer private redeemer;
    LidSimplifiedPresaleAccess private access;
    address payable private lidFund;

    mapping(address => uint) public earnedReferrals;

    mapping(address => uint) public referralCounts;

    mapping(address => uint) public refundedEth;

    bool public isRefunding;

    modifier WHENPRESALEACTIVE512 {	//inject NONSTANDARD NAMING
        require(timer.ISSTARTED968(), "Presale not yet started.");
        require(!ISPRESALEENDED151(), "Presale has ended.");
        _;
    }

    modifier WHENPRESALEFINISHED40 {	//inject NONSTANDARD NAMING
        require(timer.ISSTARTED968(), "Presale not yet started.");
        require(ISPRESALEENDED151(), "Presale has not yet ended.");
        _;
    }

    function INITIALIZE719(	//inject NONSTANDARD NAMING
        uint _maxBuyPerAddress,
        uint _uniswapEthBP,
        uint _lidEthBP,
        uint _referralBP,
        uint _hardcap,
        address owner,
        LidSimplifiedPresaleTimer _timer,
        LidSimplifiedPresaleRedeemer _redeemer,
        LidSimplifiedPresaleAccess _access,
        IERC20 _token,
        IUniswapV2Router01 _uniswapRouter,
        address payable _lidFund
    ) external INITIALIZER622 {
        Ownable.INITIALIZE719(msg.sender);
        Pausable.INITIALIZE719(msg.sender);
        ReentrancyGuard.INITIALIZE719();

        token = _token;
        timer = _timer;
        redeemer = _redeemer;
        access = _access;
        lidFund = _lidFund;

        maxBuyPerAddress = _maxBuyPerAddress;

        uniswapEthBP = _uniswapEthBP;
        lidEthBP = _lidEthBP;

        referralBP = _referralBP;
        hardcap = _hardcap;

        uniswapRouter = _uniswapRouter;
        totalTokens = token.TOTALSUPPLY256();
        token.APPROVE324(address(uniswapRouter), token.TOTALSUPPLY256());

        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP710(owner);
    }

    function DEPOSIT618() external payable WHENNOTPAUSED404 {	//inject NONSTANDARD NAMING
        DEPOSIT618(address(0x0));
    }

    function SETTOKENPOOLS487(	//inject NONSTANDARD NAMING
        uint _uniswapTokenBP,
        uint _presaleTokenBP,
        address[] calldata _tokenPools,
        uint[] calldata _tokenPoolBPs
    ) external ONLYOWNER958 WHENNOTPAUSED404 {
        require(_tokenPools.length == _tokenPoolBPs.length, "Must have exactly one tokenPool addresses for each BP.");
        delete tokenPools;
        delete tokenPoolBPs;
        uniswapTokenBP = _uniswapTokenBP;
        presaleTokenBP = _presaleTokenBP;
        for (uint i = 0; i < _tokenPools.length; ++i) {
            tokenPools.push(_tokenPools[i]);
        }
        uint totalTokenPoolBPs = uniswapTokenBP.ADD304(presaleTokenBP);
        for (uint i = 0; i < _tokenPoolBPs.length; ++i) {
            tokenPoolBPs.push(_tokenPoolBPs[i]);
            totalTokenPoolBPs = totalTokenPoolBPs.ADD304(_tokenPoolBPs[i]);
        }
        require(totalTokenPoolBPs == 10000, "Must allocate exactly 100% (10000 BP) of tokens to pools");
    }

    function SENDTOUNISWAP915() external WHENPRESALEFINISHED40 NONREENTRANT381 WHENNOTPAUSED404 {	//inject NONSTANDARD NAMING
        require(msg.sender == tx.origin, "Sender must be origin - no contract calls.");
        require(tokenPools.length > 0, "Must have set token pools");
        require(!hasSentToUniswap, "Has already sent to Uniswap.");
        finalEndTime = now;
        finalEth = address(this).balance;
        hasSentToUniswap = true;
        uint uniswapTokens = totalTokens.MULBP82(uniswapTokenBP);
        uint uniswapEth = finalEth.MULBP82(uniswapEthBP);
        uniswapRouter.ADDLIQUIDITYETH118.value(uniswapEth)(
            address(token),
            uniswapTokens,
            uniswapTokens,
            uniswapEth,
            address(0x000000000000000000000000000000000000dEaD),
            now
        );
    }

    function ISSUETOKENS426() external WHENPRESALEFINISHED40 WHENNOTPAUSED404 {	//inject NONSTANDARD NAMING
        require(hasSentToUniswap, "Has not yet sent to Uniswap.");
        require(!hasIssuedTokens, "Has already issued tokens.");
        hasIssuedTokens = true;
        uint last = tokenPools.length.SUB724(1);
        for (uint i = 0; i < last; ++i) {
            token.TRANSFER484(
                tokenPools[i],
                totalTokens.MULBP82(tokenPoolBPs[i])
            );
        }
        // in case rounding error, send all to final
        token.TRANSFER484(
            tokenPools[last],
            totalTokens.MULBP82(tokenPoolBPs[last])
        );
    }

    function RELEASEETHTOADDRESS759(address payable receiver, uint amount) external ONLYOWNER958 WHENNOTPAUSED404 returns(uint) {	//inject NONSTANDARD NAMING
        require(hasSentToUniswap, "Has not yet sent to Uniswap.");
        receiver.transfer(amount);
    }

    function REDEEM70() external WHENPRESALEFINISHED40 WHENNOTPAUSED404 {	//inject NONSTANDARD NAMING
        require(hasSentToUniswap, "Must have sent to Uniswap before any redeems.");
        uint claimable = redeemer.CALCULATEREEDEMABLE999(msg.sender, finalEndTime, totalTokens.MULBP82(presaleTokenBP));
        redeemer.SETCLAIMED914(msg.sender, claimable);
        token.TRANSFER484(msg.sender, claimable);
    }

    function STARTREFUND319() external ONLYOWNER958 {	//inject NONSTANDARD NAMING
        //TODO: Automatically start refund after timer is passed for softcap reach
        PAUSE93();
        isRefunding = true;
    }

    function TOPUPREFUNDFUND250() external payable ONLYOWNER958 {	//inject NONSTANDARD NAMING

    }

    function CLAIMREFUND609(address payable account) external WHENPAUSED780 {	//inject NONSTANDARD NAMING
        require(isRefunding, "Refunds not active");
        uint refundAmt = GETREFUNDABLEETH449(account);
        require(refundAmt > 0, "Nothing to refund");
        refundedEth[account] = refundedEth[account].ADD304(refundAmt);
        account.transfer(refundAmt);
    }

    function UPDATEHARDCAP723(uint valueWei) external ONLYOWNER958 {	//inject NONSTANDARD NAMING
        hardcap = valueWei;
    }

    function UPDATEMAXBUY71(uint valueWei) external ONLYOWNER958 {	//inject NONSTANDARD NAMING
        maxBuyPerAddress = valueWei;
    }

    function DEPOSIT618(address payable referrer) public payable NONREENTRANT381 WHENNOTPAUSED404 {	//inject NONSTANDARD NAMING
        require(timer.ISSTARTED968(), "Presale not yet started.");
        require(now >= access.GETACCESSTIME411(msg.sender, timer.startTime()), "Time must be at least access time.");
        require(msg.sender != referrer, "Sender cannot be referrer.");
        require(address(this).balance.SUB724(msg.value) <= hardcap, "Cannot deposit more than hardcap.");
        require(!hasSentToUniswap, "Presale Ended, Uniswap has been called.");
        uint endTime = timer.UPDATEENDTIME974();
        require(!(now > endTime && endTime != 0), "Presale Ended, time over limit.");
        require(
            redeemer.accountDeposits(msg.sender).ADD304(msg.value) <= maxBuyPerAddress,
            "Deposit exceeds max buy per address."
        );

        uint fee = msg.value.MULBP82(referralBP);
        uint depositEther = msg.value;
        uint excess = 0;

        //Remove fee and refund eth in case final purchase needed to end sale without dust errors
        if (address(this).balance > hardcap) {
            fee = 0;
            excess = address(this).balance.SUB724(hardcap);
            depositEther = depositEther.SUB724(excess);
        }

        redeemer.SETDEPOSIT391(msg.sender, depositEther.SUB724(fee), address(this).balance.SUB724(fee));

        if (excess == 0) {
            if (referrer != address(0x0) && referrer != msg.sender) {
                earnedReferrals[referrer] = earnedReferrals[referrer].ADD304(fee);
                referralCounts[referrer] = referralCounts[referrer].ADD304(1);
                referrer.transfer(fee);
            } else {
                lidFund.transfer(fee);
            }
        } else {
            msg.sender.transfer(excess);
        }
    }

    function GETREFUNDABLEETH449(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        if (!isRefunding) return 0;
        //TODO: use account eth deposits insted once switched to referral withdraw pattern
        return redeemer.accountDeposits(account)
            .DIVBP838(10000 - referralBP)
            .SUB724(refundedEth[account]);
    }

    function ISPRESALEENDED151() public view returns (bool) {	//inject NONSTANDARD NAMING
        uint endTime =  timer.endTime();
        if (hasSentToUniswap) return true;
        return (
            (address(this).balance >= hardcap) ||
            (timer.ISSTARTED968() && (now > endTime && endTime != 0))
        );
    }

}