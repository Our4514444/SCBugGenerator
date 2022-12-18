                                                                 

pragma solidity 0.5.16;

                                                                                                                                                      
interface IERC20 {
                                                                      
    function TOTALSUPPLY997() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF458(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER343(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE791(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE715(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM759(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER993(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL385(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract Initializable {

                                                                       
  bool private initialized;

                                                                                         
  bool private initializing;

                                                                                
  modifier INITIALIZER119() {	//inject NONSTANDARD NAMING
    require(initializing || ISCONSTRUCTOR543() || !initialized, "Contract instance has already been initialized");

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

                                                                                 
  function ISCONSTRUCTOR543() private view returns (bool) {	//inject NONSTANDARD NAMING
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
                                                                                                                                                                                                                             
    function ADD61(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB819(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB819(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB819(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL937(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV209(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV209(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV209(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD562(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD562(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD562(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context is Initializable {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER365() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA407() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                                                                                                                                                                                                                                       
contract Ownable is Initializable, Context {
    address private _owner;

    event OWNERSHIPTRANSFERRED239(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                               
    function INITIALIZE181(address sender) public INITIALIZER119 {	//inject NONSTANDARD NAMING
        _owner = sender;
        emit OWNERSHIPTRANSFERRED239(address(0), _owner);
    }

                                                                     
    function OWNER968() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER321() {	//inject NONSTANDARD NAMING
        require(ISOWNER902(), "Ownable: caller is not the owner");
        _;
    }

                                                                            
    function ISOWNER902() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _MSGSENDER365() == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                 
    function RENOUNCEOWNERSHIP1000() public ONLYOWNER321 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED239(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                              
    function TRANSFEROWNERSHIP360(address newOwner) public ONLYOWNER321 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP461(newOwner);
    }

                                                                                              
    function _TRANSFEROWNERSHIP461(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OWNERSHIPTRANSFERRED239(_owner, newOwner);
        _owner = newOwner;
    }

    uint256[50] private ______gap;
}


library BasisPoints {
    using SafeMath for uint;

    uint constant private basis_points916 = 10000;	//inject NONSTANDARD NAMING

    function MULBP918(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        return amt.MUL937(bp).DIV209(basis_points916);
    }

    function DIVBP442(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(bp > 0, "Cannot divide by zero.");
        if (amt == 0) return 0;
        return amt.MUL937(basis_points916).DIV209(bp);
    }

    function ADDBP674(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        if (bp == 0) return amt;
        return amt.ADD61(MULBP918(amt, bp));
    }

    function SUBBP937(uint amt, uint bp) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (amt == 0) return 0;
        if (bp == 0) return amt;
        return amt.SUB819(MULBP918(amt, bp));
    }
}


                                                                                  
library Roles {
    struct Role {
        mapping (address => bool) bearer;
    }

                                                                
    function ADD61(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(!HAS255(role, account), "Roles: account already has role");
        role.bearer[account] = true;
    }

                                                                    
    function REMOVE168(Role storage role, address account) internal {	//inject NONSTANDARD NAMING
        require(HAS255(role, account), "Roles: account does not have role");
        role.bearer[account] = false;
    }

                                                                                  
    function HAS255(Role storage role, address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        require(account != address(0), "Roles: account is the zero address");
        return role.bearer[account];
    }
}


contract PauserRole is Initializable, Context {
    using Roles for Roles.Role;

    event PAUSERADDED483(address indexed account);	//inject NONSTANDARD NAMING
    event PAUSERREMOVED710(address indexed account);	//inject NONSTANDARD NAMING

    Roles.Role private _pausers;

    function INITIALIZE181(address sender) public INITIALIZER119 {	//inject NONSTANDARD NAMING
        if (!ISPAUSER159(sender)) {
            _ADDPAUSER337(sender);
        }
    }

    modifier ONLYPAUSER578() {	//inject NONSTANDARD NAMING
        require(ISPAUSER159(_MSGSENDER365()), "PauserRole: caller does not have the Pauser role");
        _;
    }

    function ISPAUSER159(address account) public view returns (bool) {	//inject NONSTANDARD NAMING
        return _pausers.HAS255(account);
    }

    function ADDPAUSER198(address account) public ONLYPAUSER578 {	//inject NONSTANDARD NAMING
        _ADDPAUSER337(account);
    }

    function RENOUNCEPAUSER666() public {	//inject NONSTANDARD NAMING
        _REMOVEPAUSER779(_MSGSENDER365());
    }

    function _ADDPAUSER337(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.ADD61(account);
        emit PAUSERADDED483(account);
    }

    function _REMOVEPAUSER779(address account) internal {	//inject NONSTANDARD NAMING
        _pausers.REMOVE168(account);
        emit PAUSERREMOVED710(account);
    }

    uint256[50] private ______gap;
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                       
contract Pausable is Initializable, Context, PauserRole {
                                                                                        
    event PAUSED76(address account);	//inject NONSTANDARD NAMING

                                                                                     
    event UNPAUSED428(address account);	//inject NONSTANDARD NAMING

    bool private _paused;

                                                                                                                       
    function INITIALIZE181(address sender) public INITIALIZER119 {	//inject NONSTANDARD NAMING
        PauserRole.INITIALIZE181(sender);

        _paused = false;
    }

                                                                                        
    function PAUSED716() public view returns (bool) {	//inject NONSTANDARD NAMING
        return _paused;
    }

                                                                                                      
    modifier WHENNOTPAUSED911() {	//inject NONSTANDARD NAMING
        require(!_paused, "Pausable: paused");
        _;
    }

                                                                                                  
    modifier WHENPAUSED621() {	//inject NONSTANDARD NAMING
        require(_paused, "Pausable: not paused");
        _;
    }

                                                                                
    function PAUSE501() public ONLYPAUSER578 WHENNOTPAUSED911 {	//inject NONSTANDARD NAMING
        _paused = true;
        emit PAUSED76(_MSGSENDER365());
    }

                                                                                   
    function UNPAUSE482() public ONLYPAUSER578 WHENPAUSED621 {	//inject NONSTANDARD NAMING
        _paused = false;
        emit UNPAUSED428(_MSGSENDER365());
    }

    uint256[50] private ______gap;
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract ReentrancyGuard is Initializable {
    // counter to allow mutex lock with only one SSTORE operation
    uint256 private _guardCounter;

    function INITIALIZE181() public INITIALIZER119 {	//inject NONSTANDARD NAMING
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }

                                                                                                                                                                                                                                                                                                                                                                                
    modifier NONREENTRANT829() {	//inject NONSTANDARD NAMING
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }

    uint256[50] private ______gap;
}


pragma solidity =0.5.16;

interface IUniswapV2Router01 {
    function FACTORY361() external pure returns (address);	//inject NONSTANDARD NAMING

    function QUOTE822(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);	//inject NONSTANDARD NAMING
    function GETAMOUNTOUT301(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);	//inject NONSTANDARD NAMING
    function GETAMOUNTIN912(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);	//inject NONSTANDARD NAMING
    function GETAMOUNTSOUT430(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);	//inject NONSTANDARD NAMING
    function GETAMOUNTSIN310(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);	//inject NONSTANDARD NAMING

    function WETH775() external view returns (address);	//inject NONSTANDARD NAMING

    function ADDLIQUIDITY665(	//inject NONSTANDARD NAMING
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function ADDLIQUIDITYETH618(	//inject NONSTANDARD NAMING
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function REMOVELIQUIDITY894(	//inject NONSTANDARD NAMING
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function REMOVELIQUIDITYETH625(	//inject NONSTANDARD NAMING
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function REMOVELIQUIDITYWITHPERMIT287(	//inject NONSTANDARD NAMING
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function REMOVELIQUIDITYETHWITHPERMIT636(	//inject NONSTANDARD NAMING
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function SWAPEXACTTOKENSFORTOKENS565(	//inject NONSTANDARD NAMING
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function SWAPTOKENSFOREXACTTOKENS831(	//inject NONSTANDARD NAMING
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function SWAPEXACTETHFORTOKENS677(uint amountOutMin, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        payable
        returns (uint[] memory amounts);
    function SWAPTOKENSFOREXACTETH988(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        returns (uint[] memory amounts);
    function SWAPEXACTTOKENSFORETH293(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
        external
        returns (uint[] memory amounts);
    function SWAPETHFOREXACTTOKENS844(uint amountOut, address[] calldata path, address to, uint deadline)	//inject NONSTANDARD NAMING
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

    function INITIALIZE181(	//inject NONSTANDARD NAMING
        uint _startTime,
        uint _hardCapTimer,
        uint _softCap,
        address _presale,
        address owner
    ) external INITIALIZER119 {
        Ownable.INITIALIZE181(msg.sender);
        startTime = _startTime;
        hardCapTimer = _hardCapTimer;
        softCap = _softCap;
        presale = _presale;
        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP461(owner);
    }

    function SETSTARTTIME656(uint time) external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        startTime = time;
    }

    function SETENDTIME494(uint time) external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        endTime = time;
    }

    function UPDATESOFTCAP219(uint valueWei) external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        softCap = valueWei;
    }

    function UPDATEENDTIME287() external returns (uint) {	//inject NONSTANDARD NAMING
        if (endTime != 0) return endTime;
        if (presale.balance >= softCap) {
            endTime = now.ADD61(hardCapTimer);
            return endTime;
        }
        return 0;
    }

    function ISSTARTED161() external view returns (bool) {	//inject NONSTANDARD NAMING
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

    modifier ONLYPRESALECONTRACT455 {	//inject NONSTANDARD NAMING
        require(msg.sender == presale, "Only callable by presale contract.");
        _;
    }

    function INITIALIZE181(	//inject NONSTANDARD NAMING
        uint _redeemBP,
        uint _redeemInterval,
        uint[] calldata _bonusRangeStart,
        uint[] calldata _bonusRangeBP,
        address _presale,
        address owner
    ) external INITIALIZER119 {
        Ownable.INITIALIZE181(msg.sender);

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
        _TRANSFEROWNERSHIP461(owner);
    }

    function SETCLAIMED586(address account, uint amount) external ONLYPRESALECONTRACT455 {	//inject NONSTANDARD NAMING
        accountClaimedTokens[account] = accountClaimedTokens[account].ADD61(amount);
    }

    function SETDEPOSIT351(address account, uint deposit, uint postDepositEth) external ONLYPRESALECONTRACT455 {	//inject NONSTANDARD NAMING
        if (accountDeposits[account] == 0) totalDepositors = totalDepositors.ADD61(1);
        accountDeposits[account] = accountDeposits[account].ADD61(deposit);
        uint sharesToAdd;
        if (currentBonusIndex.ADD61(1) >= bonusRangeBP.length) {
            //final bonus rate
            sharesToAdd = deposit.ADDBP674(bonusRangeBP[currentBonusIndex]);
        } else if (postDepositEth < bonusRangeStart[currentBonusIndex.ADD61(1)]) {
            //Purchase doesnt push to next start
            sharesToAdd = deposit.ADDBP674(bonusRangeBP[currentBonusIndex]);
        } else {
            //purchase straddles next start
            uint previousBonusBP = bonusRangeBP[currentBonusIndex];
            uint newBonusBP = bonusRangeBP[currentBonusIndex.ADD61(1)];
            uint newBonusDeposit = postDepositEth.SUB819(bonusRangeStart[currentBonusIndex.ADD61(1)]);
            uint previousBonusDeposit = deposit.SUB819(newBonusDeposit);
            sharesToAdd = newBonusDeposit.ADDBP674(newBonusBP).ADD61(
                previousBonusDeposit.ADDBP674(previousBonusBP));
            currentBonusIndex = currentBonusIndex.ADD61(1);
        }
        accountShares[account] = accountShares[account].ADD61(sharesToAdd);
        totalShares = totalShares.ADD61(sharesToAdd);
    }

    function UPDATEBONUS744(	//inject NONSTANDARD NAMING
        uint[] calldata _bonusRangeStart,
        uint[] calldata _bonusRangeBP
    ) external ONLYOWNER321 {
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

    function CALCULATERATEPERETH214(uint totalPresaleTokens, uint depositEth, uint hardCap) external view returns (uint) {	//inject NONSTANDARD NAMING

        uint tokensPerEtherShare = totalPresaleTokens
        .MUL937(1 ether)
        .DIV209(
            GETMAXSHARES418(hardCap)
        );

        uint bp;
        if (depositEth >= bonusRangeStart[bonusRangeStart.length.SUB819(1)]) {
            bp = bonusRangeBP[bonusRangeBP.length.SUB819(1)];
        } else {
            for (uint i = 1; i < bonusRangeStart.length; ++i) {
                if (bp == 0) {
                    if (depositEth < bonusRangeStart[i]) {
                        bp = bonusRangeBP[i.SUB819(1)];
                    }
                }
            }
        }
        return tokensPerEtherShare.ADDBP674(bp);
    }

    function CALCULATEREEDEMABLE570(	//inject NONSTANDARD NAMING
        address account,
        uint finalEndTime,
        uint totalPresaleTokens
    ) external view returns (uint) {
        if (finalEndTime == 0) return 0;
        if (finalEndTime >= now) return 0;
        uint earnedTokens = accountShares[account].MUL937(totalPresaleTokens).DIV209(totalShares);
        uint claimedTokens = accountClaimedTokens[account];
        uint cycles = now.SUB819(finalEndTime).DIV209(redeemInterval).ADD61(1);
        uint totalRedeemable = earnedTokens.MULBP918(redeemBP).MUL937(cycles);
        uint claimable;
        if (totalRedeemable >= earnedTokens) {
            claimable = earnedTokens.SUB819(claimedTokens);
        } else {
            claimable = totalRedeemable.SUB819(claimedTokens);
        }
        return claimable;
    }

    function GETMAXSHARES418(uint hardCap) public view returns (uint) {	//inject NONSTANDARD NAMING
        uint maxShares;
        for (uint i = 0; i < bonusRangeStart.length; ++i) {
            uint amt;
            if (i < bonusRangeStart.length.SUB819(1)) {
                amt = bonusRangeStart[i.ADD61(1)].SUB819(bonusRangeStart[i]);
            } else {
                amt = hardCap.SUB819(bonusRangeStart[i]);
            }
            maxShares = maxShares.ADD61(amt.ADDBP674(bonusRangeBP[i]));
        }
        return maxShares;
    }
}


interface IStakeHandler {
    function HANDLESTAKE719(address staker, uint stakerDeltaValue, uint stakerFinalValue) external;	//inject NONSTANDARD NAMING
    function HANDLEUNSTAKE819(address staker, uint stakerDeltaValue, uint stakerFinalValue) external;	//inject NONSTANDARD NAMING
}


interface ILidCertifiableToken {
    function ACTIVATETRANSFERS740() external;	//inject NONSTANDARD NAMING
    function ACTIVATETAX307() external;	//inject NONSTANDARD NAMING
    function MINT944(address account, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ADDMINTER539(address account) external;	//inject NONSTANDARD NAMING
    function RENOUNCEMINTER21() external;	//inject NONSTANDARD NAMING
    function TRANSFER343(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE715(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM759(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE791(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function ISMINTER520(address account) external view returns (bool);	//inject NONSTANDARD NAMING
    function TOTALSUPPLY997() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF458(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    event TRANSFER993(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL385(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING

}


contract LidStaking is Initializable, Ownable {
    using BasisPoints for uint;
    using SafeMath for uint;

    uint256 constant internal distribution_multiplier345 = 2 ** 64;	//inject NONSTANDARD NAMING

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

    event ONDISTRIBUTE306(address sender, uint amountSent);	//inject NONSTANDARD NAMING
    event ONSTAKE778(address sender, uint amount, uint tax);	//inject NONSTANDARD NAMING
    event ONUNSTAKE632(address sender, uint amount, uint tax);	//inject NONSTANDARD NAMING
    event ONREINVEST370(address sender, uint amount, uint tax);	//inject NONSTANDARD NAMING
    event ONWITHDRAW471(address sender, uint amount);	//inject NONSTANDARD NAMING

    modifier ONLYLIDTOKEN224 {	//inject NONSTANDARD NAMING
        require(msg.sender == address(lidToken), "Can only be called by LidToken contract.");
        _;
    }

    modifier WHENSTAKINGACTIVE773 {	//inject NONSTANDARD NAMING
        require(startTime != 0 && now > startTime, "Staking not yet started.");
        _;
    }

    function INITIALIZE181(	//inject NONSTANDARD NAMING
        uint _stakingTaxBP,
        uint _ustakingTaxBP,
        uint _registrationFeeWithReferrer,
        uint _registrationFeeWithoutReferrer,
        address owner,
        ILidCertifiableToken _lidToken
    ) external INITIALIZER119 {
        Ownable.INITIALIZE181(msg.sender);
        stakingTaxBP = _stakingTaxBP;
        unstakingTaxBP = _ustakingTaxBP;
        lidToken = _lidToken;
        registrationFeeWithReferrer = _registrationFeeWithReferrer;
        registrationFeeWithoutReferrer = _registrationFeeWithoutReferrer;
        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP461(owner);
    }

    function REGISTERANDSTAKE601(uint amount) public {	//inject NONSTANDARD NAMING
        REGISTERANDSTAKE601(amount, address(0x0));
    }

    function REGISTERANDSTAKE601(uint amount, address referrer) public WHENSTAKINGACTIVE773 {	//inject NONSTANDARD NAMING
        require(!stakerIsRegistered[msg.sender], "Staker must not be registered");
        require(lidToken.BALANCEOF458(msg.sender) >= amount, "Must have enough balance to stake amount");
        uint finalAmount;
        if(address(0x0) == referrer) {
            //No referrer
            require(amount >= registrationFeeWithoutReferrer, "Must send at least enough LID to pay registration fee.");
            DISTRIBUTE10(registrationFeeWithoutReferrer);
            finalAmount = amount.SUB819(registrationFeeWithoutReferrer);
        } else {
            //has referrer
            require(amount >= registrationFeeWithReferrer, "Must send at least enough LID to pay registration fee.");
            require(lidToken.TRANSFERFROM759(msg.sender, referrer, registrationFeeWithReferrer), "Stake failed due to failed referral transfer.");
            accountReferrals[referrer] = accountReferrals[referrer].ADD61(1);
            finalAmount = amount.SUB819(registrationFeeWithReferrer);
        }
        stakerIsRegistered[msg.sender] = true;
        STAKE726(finalAmount);
    }

    function STAKE726(uint amount) public WHENSTAKINGACTIVE773 {	//inject NONSTANDARD NAMING
        require(stakerIsRegistered[msg.sender] == true, "Must be registered to stake.");
        require(amount >= 1e18, "Must stake at least one LID.");
        require(lidToken.BALANCEOF458(msg.sender) >= amount, "Cannot stake more LID than you hold unstaked.");
        if (stakeValue[msg.sender] == 0) totalStakers = totalStakers.ADD61(1);
        uint tax = _ADDSTAKE304(amount);
        require(lidToken.TRANSFERFROM759(msg.sender, address(this), amount), "Stake failed due to failed transfer.");
        emit ONSTAKE778(msg.sender, amount, tax);
    }

    function UNSTAKE871(uint amount) external WHENSTAKINGACTIVE773 {	//inject NONSTANDARD NAMING
        require(amount >= 1e18, "Must unstake at least one LID.");
        require(stakeValue[msg.sender] >= amount, "Cannot unstake more LID than you have staked.");
        //must withdraw all dividends, to prevent overflows
        WITHDRAW73(DIVIDENDSOF197(msg.sender));
        if (stakeValue[msg.sender] == amount) totalStakers = totalStakers.SUB819(1);
        totalStaked = totalStaked.SUB819(amount);
        stakeValue[msg.sender] = stakeValue[msg.sender].SUB819(amount);

        uint tax = FINDTAXAMOUNT678(amount, unstakingTaxBP);
        uint earnings = amount.SUB819(tax);
        _INCREASEPROFITPERSHARE578(tax);
        stakerPayouts[msg.sender] = UINTTOINT287(profitPerShare.MUL937(stakeValue[msg.sender]));

        for (uint i=0; i < stakeHandlers.length; i++) {
            stakeHandlers[i].HANDLEUNSTAKE819(msg.sender, amount, stakeValue[msg.sender]);
        }

        require(lidToken.TRANSFERFROM759(address(this), msg.sender, earnings), "Unstake failed due to failed transfer.");
        emit ONUNSTAKE632(msg.sender, amount, tax);
    }

    function WITHDRAW73(uint amount) public WHENSTAKINGACTIVE773 {	//inject NONSTANDARD NAMING
        require(DIVIDENDSOF197(msg.sender) >= amount, "Cannot withdraw more dividends than you have earned.");
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + UINTTOINT287(amount.MUL937(distribution_multiplier345));
        lidToken.TRANSFER343(msg.sender, amount);
        emit ONWITHDRAW471(msg.sender, amount);
    }

    function REINVEST542(uint amount) external WHENSTAKINGACTIVE773 {	//inject NONSTANDARD NAMING
        require(DIVIDENDSOF197(msg.sender) >= amount, "Cannot reinvest more dividends than you have earned.");
        uint payout = amount.MUL937(distribution_multiplier345);
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + UINTTOINT287(payout);
        uint tax = _ADDSTAKE304(amount);
        emit ONREINVEST370(msg.sender, amount, tax);
    }

    function DISTRIBUTE10(uint amount) public {	//inject NONSTANDARD NAMING
        require(lidToken.BALANCEOF458(msg.sender) >= amount, "Cannot distribute more LID than you hold unstaked.");
        totalDistributions = totalDistributions.ADD61(amount);
        _INCREASEPROFITPERSHARE578(amount);
        require(
            lidToken.TRANSFERFROM759(msg.sender, address(this), amount),
            "Distribution failed due to failed transfer."
        );
        emit ONDISTRIBUTE306(msg.sender, amount);
    }

    function HANDLETAXDISTRIBUTION957(uint amount) external ONLYLIDTOKEN224 {	//inject NONSTANDARD NAMING
        totalDistributions = totalDistributions.ADD61(amount);
        _INCREASEPROFITPERSHARE578(amount);
        emit ONDISTRIBUTE306(msg.sender, amount);
    }

    function DIVIDENDSOF197(address staker) public view returns (uint) {	//inject NONSTANDARD NAMING
        int divPayout = UINTTOINT287(profitPerShare.MUL937(stakeValue[staker]));
        require(divPayout >= stakerPayouts[staker], "dividend calc overflow");
        return uint(divPayout - stakerPayouts[staker])
            .DIV209(distribution_multiplier345);
    }

    function FINDTAXAMOUNT678(uint value, uint taxBP) public pure returns (uint) {	//inject NONSTANDARD NAMING
        return value.MULBP918(taxBP);
    }

    function NUMBERSTAKEHANDLERSREGISTERED166() external view returns (uint) {	//inject NONSTANDARD NAMING
        return stakeHandlers.length;
    }

    function REGISTERSTAKEHANDLER111(IStakeHandler sc) external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        stakeHandlers.push(sc);
    }

    function UNREGISTERSTAKEHANDLER34(uint index) external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        IStakeHandler sc = stakeHandlers[stakeHandlers.length-1];
        stakeHandlers.pop();
        stakeHandlers[index] = sc;
    }

    function SETSTAKINGBP424(uint valueBP) external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        require(valueBP < 10000, "Tax connot be over 100% (10000 BP)");
        stakingTaxBP = valueBP;
    }

    function SETUNSTAKINGBP339(uint valueBP) external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        require(valueBP < 10000, "Tax connot be over 100% (10000 BP)");
        unstakingTaxBP = valueBP;
    }

    function SETSTARTTIME656(uint _startTime) external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        startTime = _startTime;
    }

    function SETREGISTRATIONFEES719(uint valueWithReferrer, uint valueWithoutReferrer) external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        registrationFeeWithReferrer = valueWithReferrer;
        registrationFeeWithoutReferrer = valueWithoutReferrer;
    }

    function UINTTOINT287(uint val) internal pure returns (int) {	//inject NONSTANDARD NAMING
        if (val >= uint(-1).DIV209(2)) {
            require(false, "Overflow. Cannot convert uint to int.");
        } else {
            return int(val);
        }
    }

    function _ADDSTAKE304(uint amount) internal returns (uint tax) {	//inject NONSTANDARD NAMING
        tax = FINDTAXAMOUNT678(amount, stakingTaxBP);
        uint stakeAmount = amount.SUB819(tax);
        totalStaked = totalStaked.ADD61(stakeAmount);
        stakeValue[msg.sender] = stakeValue[msg.sender].ADD61(stakeAmount);
        for (uint i=0; i < stakeHandlers.length; i++) {
            stakeHandlers[i].HANDLESTAKE719(msg.sender, stakeAmount, stakeValue[msg.sender]);
        }
        uint payout = profitPerShare.MUL937(stakeAmount);
        stakerPayouts[msg.sender] = stakerPayouts[msg.sender] + UINTTOINT287(payout);
        _INCREASEPROFITPERSHARE578(tax);
    }

    function _INCREASEPROFITPERSHARE578(uint amount) internal {	//inject NONSTANDARD NAMING
        if (totalStaked != 0) {
            if (emptyStakeTokens != 0) {
                amount = amount.ADD61(emptyStakeTokens);
                emptyStakeTokens = 0;
            }
            profitPerShare = profitPerShare.ADD61(amount.MUL937(distribution_multiplier345).DIV209(totalStaked));
        } else {
            emptyStakeTokens = emptyStakeTokens.ADD61(amount);
        }
    }

}


contract LidSimplifiedPresaleAccess is Initializable {
    using SafeMath for uint;
    LidStaking private staking;

    uint[5] private cutoffs;

    function INITIALIZE181(LidStaking _staking) external INITIALIZER119 {	//inject NONSTANDARD NAMING
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

    function GETACCESSTIME284(address account, uint startTime) external view returns (uint accessTime) {	//inject NONSTANDARD NAMING
        uint stakeValue = staking.stakeValue(account);
        if (stakeValue == 0) return startTime.ADD61(15 minutes);
        if (stakeValue >= cutoffs[0]) return startTime;
        uint i=0;
        uint stake2 = cutoffs[0];
        while (stake2 > stakeValue && i < cutoffs.length) {
            i++;
            stake2 = cutoffs[i];
        }
        return startTime.ADD61(i.MUL937(3 minutes));
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

    modifier WHENPRESALEACTIVE864 {	//inject NONSTANDARD NAMING
        require(timer.ISSTARTED161(), "Presale not yet started.");
        require(!ISPRESALEENDED747(), "Presale has ended.");
        _;
    }

    modifier WHENPRESALEFINISHED436 {	//inject NONSTANDARD NAMING
        require(timer.ISSTARTED161(), "Presale not yet started.");
        require(ISPRESALEENDED747(), "Presale has not yet ended.");
        _;
    }

    function INITIALIZE181(	//inject NONSTANDARD NAMING
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
    ) external INITIALIZER119 {
        Ownable.INITIALIZE181(msg.sender);
        Pausable.INITIALIZE181(msg.sender);
        ReentrancyGuard.INITIALIZE181();

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
        totalTokens = token.TOTALSUPPLY997();
        token.APPROVE715(address(uniswapRouter), token.TOTALSUPPLY997());

        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP461(owner);
    }

    function DEPOSIT538() external payable WHENNOTPAUSED911 {	//inject NONSTANDARD NAMING
        DEPOSIT538(address(0x0));
    }

    function SETTOKENPOOLS899(	//inject NONSTANDARD NAMING
        uint _uniswapTokenBP,
        uint _presaleTokenBP,
        address[] calldata _tokenPools,
        uint[] calldata _tokenPoolBPs
    ) external ONLYOWNER321 WHENNOTPAUSED911 {
        require(_tokenPools.length == _tokenPoolBPs.length, "Must have exactly one tokenPool addresses for each BP.");
        delete tokenPools;
        delete tokenPoolBPs;
        uniswapTokenBP = _uniswapTokenBP;
        presaleTokenBP = _presaleTokenBP;
        for (uint i = 0; i < _tokenPools.length; ++i) {
            tokenPools.push(_tokenPools[i]);
        }
        uint totalTokenPoolBPs = uniswapTokenBP.ADD61(presaleTokenBP);
        for (uint i = 0; i < _tokenPoolBPs.length; ++i) {
            tokenPoolBPs.push(_tokenPoolBPs[i]);
            totalTokenPoolBPs = totalTokenPoolBPs.ADD61(_tokenPoolBPs[i]);
        }
        require(totalTokenPoolBPs == 10000, "Must allocate exactly 100% (10000 BP) of tokens to pools");
    }

    function SENDTOUNISWAP341() external WHENPRESALEFINISHED436 NONREENTRANT829 WHENNOTPAUSED911 {	//inject NONSTANDARD NAMING
        require(msg.sender == tx.origin, "Sender must be origin - no contract calls.");
        require(tokenPools.length > 0, "Must have set token pools");
        require(!hasSentToUniswap, "Has already sent to Uniswap.");
        finalEndTime = now;
        finalEth = address(this).balance;
        hasSentToUniswap = true;
        uint uniswapTokens = totalTokens.MULBP918(uniswapTokenBP);
        uint uniswapEth = finalEth.MULBP918(uniswapEthBP);
        uniswapRouter.ADDLIQUIDITYETH618.value(uniswapEth)(
            address(token),
            uniswapTokens,
            uniswapTokens,
            uniswapEth,
            address(0x000000000000000000000000000000000000dEaD),
            now
        );
    }

    function ISSUETOKENS307() external WHENPRESALEFINISHED436 WHENNOTPAUSED911 {	//inject NONSTANDARD NAMING
        require(hasSentToUniswap, "Has not yet sent to Uniswap.");
        require(!hasIssuedTokens, "Has already issued tokens.");
        hasIssuedTokens = true;
        uint last = tokenPools.length.SUB819(1);
        for (uint i = 0; i < last; ++i) {
            token.TRANSFER343(
                tokenPools[i],
                totalTokens.MULBP918(tokenPoolBPs[i])
            );
        }
        // in case rounding error, send all to final
        token.TRANSFER343(
            tokenPools[last],
            totalTokens.MULBP918(tokenPoolBPs[last])
        );
    }

    function RELEASEETHTOADDRESS558(address payable receiver, uint amount) external ONLYOWNER321 WHENNOTPAUSED911 returns(uint) {	//inject NONSTANDARD NAMING
        require(hasSentToUniswap, "Has not yet sent to Uniswap.");
        receiver.transfer(amount);
    }

    function REDEEM23() external WHENPRESALEFINISHED436 WHENNOTPAUSED911 {	//inject NONSTANDARD NAMING
        require(hasSentToUniswap, "Must have sent to Uniswap before any redeems.");
        uint claimable = redeemer.CALCULATEREEDEMABLE570(msg.sender, finalEndTime, totalTokens.MULBP918(presaleTokenBP));
        redeemer.SETCLAIMED586(msg.sender, claimable);
        token.TRANSFER343(msg.sender, claimable);
    }

    function STARTREFUND996() external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        //TODO: Automatically start refund after timer is passed for softcap reach
        PAUSE501();
        isRefunding = true;
    }

    function TOPUPREFUNDFUND5() external payable ONLYOWNER321 {	//inject NONSTANDARD NAMING

    }

    function CLAIMREFUND234(address payable account) external WHENPAUSED621 {	//inject NONSTANDARD NAMING
        require(isRefunding, "Refunds not active");
        uint refundAmt = GETREFUNDABLEETH277(account);
        require(refundAmt > 0, "Nothing to refund");
        refundedEth[account] = refundedEth[account].ADD61(refundAmt);
        account.transfer(refundAmt);
    }

    function UPDATEHARDCAP299(uint valueWei) external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        hardcap = valueWei;
    }

    function UPDATEMAXBUY259(uint valueWei) external ONLYOWNER321 {	//inject NONSTANDARD NAMING
        maxBuyPerAddress = valueWei;
    }

    function DEPOSIT538(address payable referrer) public payable NONREENTRANT829 WHENNOTPAUSED911 {	//inject NONSTANDARD NAMING
        require(timer.ISSTARTED161(), "Presale not yet started.");
        require(now >= access.GETACCESSTIME284(msg.sender, timer.startTime()), "Time must be at least access time.");
        require(msg.sender != referrer, "Sender cannot be referrer.");
        require(address(this).balance.SUB819(msg.value) <= hardcap, "Cannot deposit more than hardcap.");
        require(!hasSentToUniswap, "Presale Ended, Uniswap has been called.");
        uint endTime = timer.UPDATEENDTIME287();
        require(!(now > endTime && endTime != 0), "Presale Ended, time over limit.");
        require(
            redeemer.accountDeposits(msg.sender).ADD61(msg.value) <= maxBuyPerAddress,
            "Deposit exceeds max buy per address."
        );

        uint fee = msg.value.MULBP918(referralBP);
        uint depositEther = msg.value;
        uint excess = 0;

        //Remove fee and refund eth in case final purchase needed to end sale without dust errors
        if (address(this).balance > hardcap) {
            fee = 0;
            excess = address(this).balance.SUB819(hardcap);
            depositEther = depositEther.SUB819(excess);
        }

        redeemer.SETDEPOSIT351(msg.sender, depositEther.SUB819(fee), address(this).balance.SUB819(fee));

        if (excess == 0) {
            if (referrer != address(0x0) && referrer != msg.sender) {
                earnedReferrals[referrer] = earnedReferrals[referrer].ADD61(fee);
                referralCounts[referrer] = referralCounts[referrer].ADD61(1);
                referrer.transfer(fee);
            } else {
                lidFund.transfer(fee);
            }
        } else {
            msg.sender.transfer(excess);
        }
    }

    function GETREFUNDABLEETH277(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        if (!isRefunding) return 0;
        //TODO: use account eth deposits insted once switched to referral withdraw pattern
        return redeemer.accountDeposits(account)
            .DIVBP442(10000 - referralBP)
            .SUB819(refundedEth[account]);
    }

    function ISPRESALEENDED747() public view returns (bool) {	//inject NONSTANDARD NAMING
        uint endTime =  timer.endTime();
        if (hasSentToUniswap) return true;
        return (
            (address(this).balance >= hardcap) ||
            (timer.ISSTARTED161() && (now > endTime && endTime != 0))
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

    modifier ONLYAFTERSTART770 {	//inject NONSTANDARD NAMING
        uint finalEndTime = presale.finalEndTime();
        require(finalEndTime != 0 && now > finalEndTime, "Has not yet started.");
        _;
    }

    function INITIALIZE181(	//inject NONSTANDARD NAMING
        uint _releaseInterval,
        uint _releaseBP,
        address owner,
        IERC20 _token,
        LidSimplifiedPresale _presale,
        address _releaseWallet
    ) external INITIALIZER119 {
        releaseInterval = _releaseInterval;
        releaseBP = _releaseBP;
        token = _token;
        presale = _presale;
        releaseWallet = _releaseWallet;

        Ownable.INITIALIZE181(msg.sender);

        //Due to issue in oz testing suite, the msg.sender might not be owner
        _TRANSFEROWNERSHIP461(owner);
    }

    function CLAIMTOKEN179() external ONLYAFTERSTART770 {	//inject NONSTANDARD NAMING
        startingTokens = token.BALANCEOF458(address(this)).ADD61(claimedTokens);
        uint cycle = GETCURRENTCYCLECOUNT788();
        uint totalClaimAmount = cycle.MUL937(startingTokens.MULBP918(releaseBP));
        uint toClaim = totalClaimAmount.SUB819(claimedTokens);
        if (token.BALANCEOF458(address(this)) < toClaim) toClaim = token.BALANCEOF458(address(this));
        claimedTokens = claimedTokens.ADD61(toClaim);
        token.TRANSFER343(releaseWallet, toClaim);
    }

    function RESET608(	//inject NONSTANDARD NAMING
        uint _releaseInterval,
        uint _releaseBP,
        LidSimplifiedPresale _presale,
        address _releaseWallet
    ) external ONLYOWNER321 {
        releaseInterval = _releaseInterval;
        releaseBP = _releaseBP;
        presale = _presale;
        releaseWallet = _releaseWallet;
    }

    function SETPRESALE599(	//inject NONSTANDARD NAMING
        LidSimplifiedPresale _presale
    ) external ONLYOWNER321 {
        presale = _presale;
    }

    function GETCURRENTCYCLECOUNT788() public view returns (uint) {	//inject NONSTANDARD NAMING
        uint finalEndTime = presale.finalEndTime();
        if (now <= finalEndTime || finalEndTime == 0) return 0;
        return now.SUB819(finalEndTime).DIV209(releaseInterval).ADD61(1);
    }

}