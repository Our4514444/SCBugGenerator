                                                                 

pragma solidity 0.5.16;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY936() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF614(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER961(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE643(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE839(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM165(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER771(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL213(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract Initializable {

                                                                       
  bool private initialized;

                                                                                         
  bool private initializing;

                                                                                
  modifier INITIALIZER398() {	//inject NONSTANDARD NAMING
    require(initializing || ISCONSTRUCTOR365() || !initialized, "Contract instance has already been initialized");

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

                                                                                 
  function ISCONSTRUCTOR365() private view returns (bool) {	//inject NONSTANDARD NAMING
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


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD578(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB880(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB880(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB880(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL879(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD423(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD423(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD423(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context is Initializable {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER911() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA892() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                       
contract Ownable is Initializable, Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED2(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    function INITIALIZE688(address sender) public INITIALIZER398 {	//inject NONSTANDARD NAMING
        _owner = sender;
        emit OWNERSHIPTRANSFERRED2(address(0), _owner);
    }

                                                                     
    function OWNER414() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER510() {	//inject NONSTANDARD NAMING
        require(ISOWNER210(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER210() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER911() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                 
    function RENOUNCEOWNERSHIP202() public ONLYOWNER510 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED2(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP259(address newOwner) public ONLYOWNER510 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP972(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP972(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED2(_owner, newOwner);
        _owner = newOwner;
    }

    uint256[50] private ______gap;
}


library BasisPoints {
    using SafeMath for uint;

    uint constant private basis_points998 = 10000;	//inject NONSTANDARD NAMING

    function MULBP568(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        return amt.MUL879(bp).DIV31(basis_points998);
    }

    function DIVBP784(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(bp > 0, "Cannot divide by zero.");
        if (amt == 0) return 0;
        return amt.MUL879(basis_points998).DIV31(bp);
    }

    function ADDBP634(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        if (bp == 0) return amt;
        return amt.ADD578(MULBP568(amt, bp));
    }

    function SUBBP464(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        if (bp == 0) return amt;
        return amt.SUB880(MULBP568(amt, bp));
    }
}


                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD578(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS728(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE162(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS728(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS728(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}


contract PauserRole is Initializable, Context {
    using Roles for Roles.Role;

    event PAUSERADDED239(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED334(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    function INITIALIZE688(address sender) public INITIALIZER398 {	//inject NONSTANDARD NAMING
        if (!ISPAUSER468(sender)) {
            _ADDPAUSER365(sender);
        }
    }

    modifier ONLYPAUSER793() {	//inject NONSTANDARD NAMING
        require(ISPAUSER468(_MSGSENDER911()), "PauserRole: caller does not have the Pauser role");
        _;
    }

    function ISPAUSER468(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS728(account);
    }

    function ADDPAUSER720(address account) public ONLYPAUSER793 {	//inject NONSTANDARD NAMING
        _ADDPAUSER365(account);
    }

    function RENOUNCEPAUSER521() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER322(_MSGSENDER911());
    }

    function _ADDPAUSER365(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD578(account);
        emit PAUSERADDED239(account);
    }

    function _REMOVEPAUSER322(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE162(account);
        emit PAUSERREMOVED334(account);
    }

    uint256[50] private ______gap;
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                       
contract Pausable is Initializable, Context, PauserRole {
                                                                                        
    event PAUSED62(address account);	//inject NONSTANDARD NAMING

                                                                                     
    event UNPAUSED231(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

                                                                                                                       
    function INITIALIZE688(address sender) public INITIALIZER398 {	//inject NONSTANDARD NAMING
        PauserRole.INITIALIZE688(sender);

        _paused = false;
    }

                                                                                        
    function PAUSED582() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED726() {	//inject NONSTANDARD NAMING
        require(!_paused, "Pausable: paused");
        _;
    }

                                                                                                  
    modifier WHENPAUSED521() {	//inject NONSTANDARD NAMING
        require(_paused, "Pausable: not paused");
        _;
    }

                                                                                
    function PAUSE86() public ONLYPAUSER793 WHENNOTPAUSED726 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED62(_MSGSENDER911());
    }

                                                                                   
    function UNPAUSE412() public ONLYPAUSER793 WHENPAUSED521 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED231(_MSGSENDER911());
    }

    uint256[50] private ______gap;
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract ReentrancyGuard is Initializable {
    // counter to allow mutex lock with only one SSTORE operation
    uint256 private _guardCounter;

    function INITIALIZE688() public INITIALIZER398 {	//inject NONSTANDARD NAMING
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT703() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }

    uint256[50] private ______gap;
}


pragma solidity =0.5.16;

interface IUniswapV2Router01 {
    function FACTORY461() external pure returns (address);	//inject NONSTANDARD NAMING

    function QUOTE393(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);	//inject NONSTANDARD NAMING
    function GETAMOUNTOUT103(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);	//inject NONSTANDARD NAMING
    function GETAMOUNTIN558(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);	//inject NONSTANDARD NAMING
    function GETAMOUNTSOUT414(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);	//inject NONSTANDARD NAMING
    function GETAMOUNTSIN302(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);	//inject NONSTANDARD NAMING

    function WETH110() external view returns (address);	//inject NONSTANDARD NAMING

    function ADDLIQUIDITY847(	//inject NONSTANDARD NAMING
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function ADDLIQUIDITYETH274(	//inject NONSTANDARD NAMING
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function REMOVELIQUIDITY433(	//inject NONSTANDARD NAMING
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function REMOVELIQUIDITYETH730(	//inject NONSTANDARD NAMING
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function REMOVELIQUIDITYWITHPERMIT141(	//inject NONSTANDARD NAMING
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function REMOVELIQUIDITYETHWITHPERMIT310(	//inject NONSTANDARD NAMING
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function SWAPEXACTTOKENSFORTOKENS422(	//inject NONSTANDARD NAMING
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function SWAPTOKENSFOREXACTTOKENS873(	//inject NONSTANDARD NAMING
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function SWAPEXACTETHFORTOKENS482(uint amountOutMin, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        payable
        returns (uint[] memory amounts);
    function SWAPTOKENSFOREXACTETH765(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        returns (uint[] memory amounts);
    function SWAPEXACTTOKENSFORETH833(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        returns (uint[] memory amounts);
    function SWAPETHFOREXACTTOKENS469(uint amountOut, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        payable
        returns (uint[] memory amounts);
}


contract LidSimplifiedPresaleTimer is Initializable, Ownable {
    using SafeMath for uint;

    uint public startTime;
    uint public endTime;
    uint public hardCapTimer;
    uint public softCap;
    address public presale;

    function INITIALIZE688(	//inject NONSTANDARD NAMING
        uint _startTime,
        uint _hardCapTimer,
        uint _softCap,
        address _presale,
        address owner
    ) external INITIALIZER398 {
        Ownable.INITIALIZE688(msg.sender);
        startTime = _startTime;
        hardCapTimer = _hardCapTimer;
        softCap = _softCap;
        presale = _presale;
        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP972(owner);
    }

    function SETSTARTTIME845(uint time) external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        startTime = time;
    }

    function SETENDTIME780(uint time) external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        endTime = time;
    }

    function UPDATESOFTCAP882(uint valueWei) external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        softCap = valueWei;
    }

    function UPDATEENDTIME645() external returns (uint) {	//inject NONSTANDARD NAMING
        if (endTime != 0) return endTime;
        if (presale.balance >= softCap) {
            endTime = now.ADD578(hardCapTimer);
            return endTime;
        }
        return 0;
    }

    function ISSTARTED105() external view returns (bool) {	//inject NONSTANDARD NAMING
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

    modifier ONLYPRESALECONTRACT595 {	//inject NONSTANDARD NAMING
        require(msg.sender == presale, "Only callable by presale contract.");
        _;
    }

    function INITIALIZE688(	//inject NONSTANDARD NAMING
        uint _redeemBP,
        uint _redeemInterval,
        uint[] calldata _bonusRangeStart,
        uint[] calldata _bonusRangeBP,
        address _presale,
        address owner
    ) external INITIALIZER398 {
        Ownable.INITIALIZE688(msg.sender);

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
        _TRANSFEROWNERSHIP972(owner);
    }

    function SETCLAIMED149(address account, uint amount) external ONLYPRESALECONTRACT595 {	//inject NONSTANDARD NAMING
        accountClaimedTokens[account] = accountClaimedTokens[account].ADD578(amount);
    }

    function SETDEPOSIT711(address account, uint deposit, uint postDepositEth) external ONLYPRESALECONTRACT595 {	//inject NONSTANDARD NAMING
        if (accountDeposits[account] == 0) totalDepositors = totalDepositors.ADD578(1);
        accountDeposits[account] = accountDeposits[account].ADD578(deposit);
        uint sharesToAdd;
        if (currentBonusIndex.ADD578(1) >= bonusRangeBP.length) {
            //final bonus rate
            sharesToAdd = deposit.ADDBP634(bonusRangeBP[currentBonusIndex]);
        } else if (postDepositEth < bonusRangeStart[currentBonusIndex.ADD578(1)]) {
            //Purchase doesnt push to next start
            sharesToAdd = deposit.ADDBP634(bonusRangeBP[currentBonusIndex]);
        } else {
            //purchase straddles next start
            uint previousBonusBP = bonusRangeBP[currentBonusIndex];
            uint newBonusBP = bonusRangeBP[currentBonusIndex.ADD578(1)];
            uint newBonusDeposit = postDepositEth.SUB880(bonusRangeStart[currentBonusIndex.ADD578(1)]);
            uint previousBonusDeposit = deposit.SUB880(newBonusDeposit);
            sharesToAdd = newBonusDeposit.ADDBP634(newBonusBP).ADD578(
                previousBonusDeposit.ADDBP634(previousBonusBP));
            currentBonusIndex = currentBonusIndex.ADD578(1);
        }
        accountShares[account] = accountShares[account].ADD578(sharesToAdd);
        totalShares = totalShares.ADD578(sharesToAdd);
    }

    function UPDATEBONUS764(	//inject NONSTANDARD NAMING
        uint[] calldata _bonusRangeStart,
        uint[] calldata _bonusRangeBP
    ) external ONLYOWNER510 {
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
    }

    function CALCULATERATEPERETH99(uint totalPresaleTokens, uint depositEth, uint hardCap) external view returns (uint) {	//inject NONSTANDARD NAMING

        uint tokensPerEtherShare = totalPresaleTokens
        .MUL879(1 ether)
        .DIV31(
            GETMAXSHARES234(hardCap)
        );

        uint bp;
        if (depositEth >= bonusRangeStart[bonusRangeStart.length.SUB880(1)]) {
            bp = bonusRangeBP[bonusRangeBP.length.SUB880(1)];
        } else {
            for (uint i = 1; i < bonusRangeStart.length; ++i) {
                if (bp == 0) {
                    if (depositEth < bonusRangeStart[i]) {
                        bp = bonusRangeBP[i.SUB880(1)];
                    }
                }
            }
        }
        return tokensPerEtherShare.ADDBP634(bp);
    }

    function CALCULATEREEDEMABLE9(	//inject NONSTANDARD NAMING
        address account,
        uint finalEndTime,
        uint totalPresaleTokens
    ) external view returns (uint) {
        if (finalEndTime == 0) return 0;
        if (finalEndTime >= now) return 0;
        uint earnedTokens = accountShares[account].MUL879(totalPresaleTokens).DIV31(totalShares);
        uint claimedTokens = accountClaimedTokens[account];
        uint cycles = now.SUB880(finalEndTime).DIV31(redeemInterval).ADD578(1);
        uint totalRedeemable = earnedTokens.MULBP568(redeemBP).MUL879(cycles);
        uint claimable;
        if (totalRedeemable >= earnedTokens) {
            claimable = earnedTokens.SUB880(claimedTokens);
        } else {
            claimable = totalRedeemable.SUB880(claimedTokens);
        }
        return claimable;
    }

    function GETMAXSHARES234(uint hardCap) public view returns (uint) {	//inject NONSTANDARD NAMING
        uint maxShares;
        for (uint i = 0; i < bonusRangeStart.length; ++i) {
            uint amt;
            if (i < bonusRangeStart.length.SUB880(1)) {
                amt = bonusRangeStart[i.ADD578(1)].SUB880(bonusRangeStart[i]);
            } else {
                amt = hardCap.SUB880(bonusRangeStart[i]);
            }
            maxShares = maxShares.ADD578(amt.ADDBP634(bonusRangeBP[i]));
        }
        return maxShares;
    }
}


interface IStakeHandler {
    function HANDLESTAKE593(address staker, uint stakerDeltaValue, uint stakerFinalValue) external;	//inject NONSTANDARD NAMING
    function HANDLEUNSTAKE765(address staker, uint stakerDeltaValue, uint stakerFinalValue) external;	//inject NONSTANDARD NAMING
}


interface ILidCertifiableToken {
    function ACTIVATETRANSFERS151() external;	//inject NONSTANDARD NAMING
    function ACTIVATETAX224() external;	//inject NONSTANDARD NAMING
    function MINT591(address account, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ADDMINTER781(address account) external;	//inject NONSTANDARD NAMING
    function RENOUNCEMINTER714() external;	//inject NONSTANDARD NAMING
    function TRANSFER961(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE839(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM165(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE643(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ISMINTER516(address account) external view returns (bool);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY936() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF614(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    event TRANSFER771(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL213(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

}


contract LidStaking is Initializable, Ownable {
    using BasisPoints for uint;
    using SafeMath for uint;

    uint256 constant internal distribution_multiplier609 = 2 ** 64;	//inject NONSTANDARD NAMING

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

    event ONDISTRIBUTE504(address sender, uint amountSent);	//inject NONSTANDARD NAMING
    event ONSTAKE279(address sender, uint amount, uint tax);	//inject NONSTANDARD NAMING
    event ONUNSTAKE701(address sender, uint amount, uint tax);	//inject NONSTANDARD NAMING
    event ONREINVEST989(address sender, uint amount, uint tax);	//inject NONSTANDARD NAMING
    event ONWITHDRAW50(address sender, uint amount);	//inject NONSTANDARD NAMING

    modifier ONLYLIDTOKEN155 {	//inject NONSTANDARD NAMING
        require(msg.sender == address(lidToken), "Can only be called by LidToken contract.");
        _;
    }

    modifier WHENSTAKINGACTIVE647 {	//inject NONSTANDARD NAMING
        require(startTime != 0 && now > startTime, "Staking not yet started.");
        _;
    }

    function INITIALIZE688(	//inject NONSTANDARD NAMING
        uint _stakingTaxBP,
        uint _ustakingTaxBP,
        uint _registrationFeeWithReferrer,
        uint _registrationFeeWithoutReferrer,
        address owner,
        ILidCertifiableToken _lidToken
    ) external INITIALIZER398 {
        Ownable.INITIALIZE688(msg.sender);
        stakingTaxBP = _stakingTaxBP;
        unstakingTaxBP = _ustakingTaxBP;
        lidToken = _lidToken;
        registrationFeeWithReferrer = _registrationFeeWithReferrer;
        registrationFeeWithoutReferrer = _registrationFeeWithoutReferrer;
        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP972(owner);
    }

    function REGISTERANDSTAKE797(uint amount) public {	//inject NONSTANDARD NAMING
        REGISTERANDSTAKE797(amount, address(0x0));
    }

    function REGISTERANDSTAKE797(uint amount, address referrer) public WHENSTAKINGACTIVE647 {	//inject NONSTANDARD NAMING
        require(!stakerIsRegistered[msg.sender], "Staker must not be registered");
        require(lidToken.BALANCEOF614(msg.sender) >= amount, "Must have enough balance to stake amount");
        uint finalAmount;
        if(address(0x0) == referrer) {
            //No referrer
            require(amount >= registrationFeeWithoutReferrer, "Must send at least enough LID to pay registration fee.");
            DISTRIBUTE760(registrationFeeWithoutReferrer);
            finalAmount = amount.SUB880(registrationFeeWithoutReferrer);
        } else {
            //has referrer
            require(amount >= registrationFeeWithReferrer, "Must send at least enough LID to pay registration fee.");
            require(lidToken.TRANSFERFROM165(msg.sender, referrer, registrationFeeWithReferrer), "Stake failed due to failed referral transfer.");
            accountReferrals[referrer] = accountReferrals[referrer].ADD578(1);
            finalAmount = amount.SUB880(registrationFeeWithReferrer);
        }
        stakerIsRegistered[msg.sender] = true;
        STAKE487(finalAmount);
    }

    function STAKE487(uint amount) public WHENSTAKINGACTIVE647 {	//inject NONSTANDARD NAMING
        require(stakerIsRegistered[msg.sender] == true, "Must be registered to stake.");
        require(amount >= 1e18, "Must stake at least one LID.");
        require(lidToken.BALANCEOF614(msg.sender) >= amount, "Cannot stake more LID than you hold unstaked.");
        if (stakeValue[msg.sender] == 0) totalStakers = totalStakers.ADD578(1);
        uint tax = _ADDSTAKE120(amount);
        require(lidToken.TRANSFERFROM165(msg.sender, address(this), amount), "Stake failed due to failed transfer.");
        emit ONSTAKE279(msg.sender, amount, tax);
    }

    function UNSTAKE563(uint amount) external WHENSTAKINGACTIVE647 {	//inject NONSTANDARD NAMING
        require(amount >= 1e18, "Must unstake at least one LID.");
        require(stakeValue[msg.sender] >= amount, "Cannot unstake more LID than you have staked.");
        //must withdraw all dividends, to prevent overflows
        WITHDRAW546(DIVIDENDSOF808(msg.sender));
        if (stakeValue[msg.sender] == amount) totalStakers = totalStakers.SUB880(1);
        totalStaked = totalStaked.SUB880(amount);
        stakeValue[msg.sender] = stakeValue[msg.sender].SUB880(amount);

        uint tax = FINDTAXAMOUNT354(amount, unstakingTaxBP);
        uint earnings = amount.SUB880(tax);
        _INCREASEPROFITPERSHARE643(tax);
        stakerPayouts[msg.sender] = UINTTOINT820(profitPerShare.MUL879(stakeValue[msg.sender]));

        for (uint i=0; i < stakeHandlers.length; i++) {
            stakeHandlers[i].HANDLEUNSTAKE765(msg.sender, amount, stakeValue[msg.sender]);
        }

        require(lidToken.TRANSFERFROM165(address(this), msg.sender, earnings), "Unstake failed due to failed transfer.");
        emit ONUNSTAKE701(msg.sender, amount, tax);
    }

    function WITHDRAW546(uint amount) public WHENSTAKINGACTIVE647 {	//inject NONSTANDARD NAMING
        require(DIVIDENDSOF808(msg.sender) >= amount, "Cannot withdraw more dividends than you have earned.");
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + UINTTOINT820(amount.MUL879(distribution_multiplier609));
        lidToken.TRANSFER961(msg.sender, amount);
        emit ONWITHDRAW50(msg.sender, amount);
    }

    function REINVEST738(uint amount) external WHENSTAKINGACTIVE647 {	//inject NONSTANDARD NAMING
        require(DIVIDENDSOF808(msg.sender) >= amount, "Cannot reinvest more dividends than you have earned.");
        uint payout = amount.MUL879(distribution_multiplier609);
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + UINTTOINT820(payout);
        uint tax = _ADDSTAKE120(amount);
        emit ONREINVEST989(msg.sender, amount, tax);
    }

    function DISTRIBUTE760(uint amount) public {	//inject NONSTANDARD NAMING
        require(lidToken.BALANCEOF614(msg.sender) >= amount, "Cannot distribute more LID than you hold unstaked.");
        totalDistributions = totalDistributions.ADD578(amount);
        _INCREASEPROFITPERSHARE643(amount);
        require(
            lidToken.TRANSFERFROM165(msg.sender, address(this), amount),
            "Distribution failed due to failed transfer."
        );
        emit ONDISTRIBUTE504(msg.sender, amount);
    }

    function HANDLETAXDISTRIBUTION426(uint amount) external ONLYLIDTOKEN155 {	//inject NONSTANDARD NAMING
        totalDistributions = totalDistributions.ADD578(amount);
        _INCREASEPROFITPERSHARE643(amount);
        emit ONDISTRIBUTE504(msg.sender, amount);
    }

    function DIVIDENDSOF808(address staker) public view returns (uint) {	//inject NONSTANDARD NAMING
        int divPayout = UINTTOINT820(profitPerShare.MUL879(stakeValue[staker]));
        require(divPayout >= stakerPayouts[staker], "dividend calc overflow");
        return uint(divPayout - stakerPayouts[staker])
            .DIV31(distribution_multiplier609);
    }

    function FINDTAXAMOUNT354(uint value, uint taxBP) public pure returns (uint) {	//inject NONSTANDARD NAMING
        return value.MULBP568(taxBP);
    }

    function NUMBERSTAKEHANDLERSREGISTERED831() external view returns (uint) {	//inject NONSTANDARD NAMING
        return stakeHandlers.length;
    }

    function REGISTERSTAKEHANDLER855(IStakeHandler sc) external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        stakeHandlers.push(sc);
    }

    function UNREGISTERSTAKEHANDLER348(uint index) external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        IStakeHandler sc = stakeHandlers[stakeHandlers.length-1];
        stakeHandlers.pop();
        stakeHandlers[index] = sc;
    }

    function SETSTAKINGBP101(uint valueBP) external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        require(valueBP < 10000, "Tax connot be over 100% (10000 BP)");
        stakingTaxBP = valueBP;
    }

    function SETUNSTAKINGBP415(uint valueBP) external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        require(valueBP < 10000, "Tax connot be over 100% (10000 BP)");
        unstakingTaxBP = valueBP;
    }

    function SETSTARTTIME845(uint _startTime) external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        startTime = _startTime;
    }

    function SETREGISTRATIONFEES29(uint valueWithReferrer, uint valueWithoutReferrer) external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        registrationFeeWithReferrer = valueWithReferrer;
        registrationFeeWithoutReferrer = valueWithoutReferrer;
    }

    function UINTTOINT820(uint val) internal pure returns (int) {	//inject NONSTANDARD NAMING
        if (val >= uint(-1).DIV31(2)) {
            require(false, "Overflow. Cannot convert uint to int.");
        } else {
            return int(val);
        }
    }

    function _ADDSTAKE120(uint amount) internal returns (uint tax) {	//inject NONSTANDARD NAMING
        tax = FINDTAXAMOUNT354(amount, stakingTaxBP);
        uint stakeAmount = amount.SUB880(tax);
        totalStaked = totalStaked.ADD578(stakeAmount);
        stakeValue[msg.sender] = stakeValue[msg.sender].ADD578(stakeAmount);
        for (uint i=0; i < stakeHandlers.length; i++) {
            stakeHandlers[i].HANDLESTAKE593(msg.sender, stakeAmount, stakeValue[msg.sender]);
        }
        uint payout = profitPerShare.MUL879(stakeAmount);
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + UINTTOINT820(payout);
        _INCREASEPROFITPERSHARE643(tax);
    }

    function _INCREASEPROFITPERSHARE643(uint amount) internal {	//inject NONSTANDARD NAMING
        if (totalStaked != 0) {
            if (emptyStakeTokens != 0) {
                amount = amount.ADD578(emptyStakeTokens);
                emptyStakeTokens = 0;
            }
            profitPerShare = profitPerShare.ADD578(amount.MUL879(distribution_multiplier609).DIV31(totalStaked));
        } else {
            emptyStakeTokens = emptyStakeTokens.ADD578(amount);
        }
    }

}


contract LidSimplifiedPresaleAccess is Initializable {
    using SafeMath for uint;
    LidStaking private staking;

    uint[5] private cutoffs;

    function INITIALIZE688(LidStaking _staking) external INITIALIZER398 {	//inject NONSTANDARD NAMING
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

    function GETACCESSTIME138(address account, uint startTime) external view returns (uint accessTime) {	//inject NONSTANDARD NAMING
        uint stakeValue = staking.stakeValue(account);
        if (stakeValue == 0) return startTime.ADD578(15 minutes);
        if (stakeValue >= cutoffs[0]) return startTime;
        uint i=0;
        uint stake2 = cutoffs[0];
        while (stake2 > stakeValue && i < cutoffs.length) {
            i++;
            stake2 = cutoffs[i];
        }
        return startTime.ADD578(i.MUL879(3 minutes));
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

    mapping(address => uint) public accountEthDeposit;
    mapping(address => uint) public earnedReferrals;

    mapping(address => uint) public referralCounts;

    mapping(address => uint) public refundedEth;

    bool public isRefunding;

    modifier WHENPRESALEACTIVE816 {	//inject NONSTANDARD NAMING
        require(timer.ISSTARTED105(), "Presale not yet started.");
        require(!ISPRESALEENDED764(), "Presale has ended.");
        _;
    }

    modifier WHENPRESALEFINISHED38 {	//inject NONSTANDARD NAMING
        require(timer.ISSTARTED105(), "Presale not yet started.");
        require(ISPRESALEENDED764(), "Presale has not yet ended.");
        _;
    }

    function INITIALIZE688(	//inject NONSTANDARD NAMING
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
    ) external INITIALIZER398 {
        Ownable.INITIALIZE688(msg.sender);
        Pausable.INITIALIZE688(msg.sender);
        ReentrancyGuard.INITIALIZE688();

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
        totalTokens = token.TOTALSUPPLY936();
        token.APPROVE839(address(uniswapRouter), token.TOTALSUPPLY936());

        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP972(owner);
    }

    function DEPOSIT96() external payable WHENNOTPAUSED726 {	//inject NONSTANDARD NAMING
        DEPOSIT96(address(0x0));
    }

    function SETTOKENPOOLS522(	//inject NONSTANDARD NAMING
        uint _uniswapTokenBP,
        uint _presaleTokenBP,
        address[] calldata _tokenPools,
        uint[] calldata _tokenPoolBPs
    ) external ONLYOWNER510 WHENNOTPAUSED726 {
        require(_tokenPools.length == _tokenPoolBPs.length, "Must have exactly one tokenPool addresses for each BP.");
        delete tokenPools;
        delete tokenPoolBPs;
        uniswapTokenBP = _uniswapTokenBP;
        presaleTokenBP = _presaleTokenBP;
        for (uint i = 0; i < _tokenPools.length; ++i) {
            tokenPools.push(_tokenPools[i]);
        }
        uint totalTokenPoolBPs = uniswapTokenBP.ADD578(presaleTokenBP);
        for (uint i = 0; i < _tokenPoolBPs.length; ++i) {
            tokenPoolBPs.push(_tokenPoolBPs[i]);
            totalTokenPoolBPs = totalTokenPoolBPs.ADD578(_tokenPoolBPs[i]);
        }
        require(totalTokenPoolBPs == 10000, "Must allocate exactly 100% (10000 BP) of tokens to pools");
    }

    function SENDTOUNISWAP140() external WHENPRESALEFINISHED38 NONREENTRANT703 WHENNOTPAUSED726 {	//inject NONSTANDARD NAMING
        require(msg.sender == tx.origin, "Sender must be origin - no contract calls.");
        require(tokenPools.length > 0, "Must have set token pools");
        require(!hasSentToUniswap, "Has already sent to Uniswap.");
        finalEndTime = now;
        finalEth = address(this).balance;
        hasSentToUniswap = true;
        uint uniswapTokens = totalTokens.MULBP568(uniswapTokenBP);
        uint uniswapEth = finalEth.MULBP568(uniswapEthBP);
        uniswapRouter.ADDLIQUIDITYETH274.value(uniswapEth)(
            address(token),
            uniswapTokens,
            uniswapTokens,
            uniswapEth,
            address(0x000000000000000000000000000000000000dEaD),
            now
        );
    }

    function ISSUETOKENS714() external WHENPRESALEFINISHED38 WHENNOTPAUSED726 {	//inject NONSTANDARD NAMING
        require(hasSentToUniswap, "Has not yet sent to Uniswap.");
        require(!hasIssuedTokens, "Has already issued tokens.");
        hasIssuedTokens = true;
        uint last = tokenPools.length.SUB880(1);
        for (uint i = 0; i < last; ++i) {
            token.TRANSFER961(
                tokenPools[i],
                totalTokens.MULBP568(tokenPoolBPs[i])
            );
        }
        // in case rounding error, send all to final
        token.TRANSFER961(
            tokenPools[last],
            totalTokens.MULBP568(tokenPoolBPs[last])
        );
    }

    function RELEASEETHTOADDRESS288(address payable receiver, uint amount) external ONLYOWNER510 WHENNOTPAUSED726 returns(uint) {	//inject NONSTANDARD NAMING
        require(hasSentToUniswap, "Has not yet sent to Uniswap.");
        receiver.transfer(amount);
    }

    function REDEEM460() external WHENPRESALEFINISHED38 WHENNOTPAUSED726 {	//inject NONSTANDARD NAMING
        require(hasSentToUniswap, "Must have sent to Uniswap before any redeems.");
        uint claimable = redeemer.CALCULATEREEDEMABLE9(msg.sender, finalEndTime, totalTokens.MULBP568(presaleTokenBP));
        redeemer.SETCLAIMED149(msg.sender, claimable);
        token.TRANSFER961(msg.sender, claimable);
    }

    function STARTREFUND897() external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        //TODO: Automatically start refund after timer is passed for softcap reach
        PAUSE86();
        isRefunding = true;
    }

    function TOPUPREFUNDFUND606() external payable ONLYOWNER510 {	//inject NONSTANDARD NAMING

    }

    function CLAIMREFUND965(address payable account) external WHENPAUSED521 {	//inject NONSTANDARD NAMING
        require(isRefunding, "Refunds not active");
        uint refundAmt = GETREFUNDABLEETH458(account);
        require(refundAmt > 0, "Nothing to refund");
        refundedEth[account] = refundedEth[account].ADD578(refundAmt);
        account.transfer(refundAmt);
    }

    function UPDATEHARDCAP908(uint valueWei) external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        hardcap = valueWei;
    }

    function UPDATEMAXBUY130(uint valueWei) external ONLYOWNER510 {	//inject NONSTANDARD NAMING
        maxBuyPerAddress = valueWei;
    }

    function DEPOSIT96(address payable referrer) public payable NONREENTRANT703 WHENNOTPAUSED726 {	//inject NONSTANDARD NAMING
        require(timer.ISSTARTED105(), "Presale not yet started.");
        require(now >= access.GETACCESSTIME138(msg.sender, timer.startTime()), "Time must be at least access time.");
        require(msg.sender != referrer, "Sender cannot be referrer.");
        require(address(this).balance.SUB880(msg.value) <= hardcap, "Cannot deposit more than hardcap.");
        require(!hasSentToUniswap, "Presale Ended, Uniswap has been called.");
        uint endTime = timer.UPDATEENDTIME645();
        require(!(now > endTime && endTime != 0), "Presale Ended, time over limit.");
        require(
            redeemer.accountDeposits(msg.sender).ADD578(msg.value) <= maxBuyPerAddress,
            "Deposit exceeds max buy per address."
        );

        uint fee = msg.value.MULBP568(referralBP);
        uint depositEther = msg.value;
        uint excess = 0;

        //Remove fee and refund eth in case final purchase needed to end sale without dust errors
        if (address(this).balance > hardcap) {
            fee = 0;
            excess = address(this).balance.SUB880(hardcap);
            depositEther = depositEther.SUB880(excess);
        }

        redeemer.SETDEPOSIT711(msg.sender, depositEther.SUB880(fee), address(this).balance.SUB880(fee));

        if (excess == 0) {
            if (referrer != address(0x0) && referrer != msg.sender) {
                earnedReferrals[referrer] = earnedReferrals[referrer].ADD578(fee);
                referralCounts[referrer] = referralCounts[referrer].ADD578(1);
                referrer.transfer(fee);
            } else {
                lidFund.transfer(fee);
            }
        } else {
            msg.sender.transfer(excess);
        }
    }

    function GETREFUNDABLEETH458(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        if (!isRefunding) return 0;
        //TODO: use account eth deposits insted once switched to referral withdraw pattern
        return redeemer.accountDeposits(account)
            .DIVBP784(10000 - referralBP)
            .SUB880(refundedEth[account]);
    }

    function ISPRESALEENDED764() public view returns (bool) {	//inject NONSTANDARD NAMING
        uint endTime =  timer.endTime();
        if (hasSentToUniswap) return true;
        return (
            (address(this).balance >= hardcap) ||
            (timer.ISSTARTED105() && (now > endTime && endTime != 0))
        );
    }

}


contract LidTimeLock is Initializable, Ownable {
    using BasisPoints for uint;
    using SafeMath for uint;

    uint public releaseInterval;
    uint public releaseStart;
    uint public releaseBP;

    uint public startingTokens;
    uint public claimedTokens;

    IERC20 private token;

    address releaseWallet;
    
    LidSimplifiedPresale private presale;

    modifier ONLYAFTERSTART837 {	//inject NONSTANDARD NAMING
        uint finalEndTime = presale.finalEndTime();
        require(finalEndTime != 0 && now > finalEndTime, "Has not yet started.");
        _;
    }

    function INITIALIZE688(	//inject NONSTANDARD NAMING
        uint _releaseInterval,
        uint _releaseBP,
        address owner,
        IERC20 _token,
        LidSimplifiedPresale _presale,
        address _releaseWallet
    ) external INITIALIZER398 {
        releaseInterval = _releaseInterval;
        releaseBP = _releaseBP;
        token = _token;
        presale = _presale;
        releaseWallet = _releaseWallet;

        Ownable.INITIALIZE688(msg.sender);

        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP972(owner);
    }

    function CLAIMTOKEN844() external ONLYAFTERSTART837 {	//inject NONSTANDARD NAMING
        startingTokens = token.BALANCEOF614(address(this)).ADD578(claimedTokens);
        uint cycle = GETCURRENTCYCLECOUNT294();
        uint totalClaimAmount = cycle.MUL879(startingTokens.MULBP568(releaseBP));
        uint toClaim = totalClaimAmount.SUB880(claimedTokens);
        if (token.BALANCEOF614(address(this)) < toClaim) toClaim = token.BALANCEOF614(address(this));
        claimedTokens = claimedTokens.ADD578(toClaim);
        token.TRANSFER961(releaseWallet, toClaim);
    }

    function RESET95(	//inject NONSTANDARD NAMING
        uint _releaseInterval,
        uint _releaseBP,
        LidSimplifiedPresale _presale,
        address _releaseWallet
    ) external ONLYOWNER510 {
        releaseInterval = _releaseInterval;
        releaseBP = _releaseBP;
        presale = _presale;
        releaseWallet = _releaseWallet;
    }

    function SETPRESALE461(	//inject NONSTANDARD NAMING
        LidSimplifiedPresale _presale
    ) external ONLYOWNER510 {
        presale = _presale;
    }

    function GETCURRENTCYCLECOUNT294() public view returns (uint) {	//inject NONSTANDARD NAMING
        uint finalEndTime = presale.finalEndTime();
        if (now <= finalEndTime || finalEndTime == 0) return 0;
        return now.SUB880(finalEndTime).DIV31(releaseInterval).ADD578(1);
    }

}