                                                                 

pragma solidity 0.5.10;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER160() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA81() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

                                                                                                                                                      
interface TRC20 {
                                                                      
    function TOTALSUPPLY135() external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                            
    function BALANCEOF654(address account) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                     
    function TRANSFER957(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                            
    function ALLOWANCE821(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    function APPROVE568(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                                                                                            
    function TRANSFERFROM732(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING

                                                                                                                                                                  
    event TRANSFER346(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                                                        
    event APPROVAL669(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
library SafeMath {
                                                                                                                                                                                                                             
    function ADD699(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB455(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB455(a, b, "SafeMath: subtraction overflow");
    }

                                                                                                                                                                                                                                                                                                                             
    function SUB455(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL96(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV718(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV718(a, b, "SafeMath: division by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    function DIV718(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD515(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD515(a, b, "SafeMath: modulo by zero");
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
    function MOD515(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
contract ERC20 is Context, TRC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    // allocating 10 million tokens for xswap liquidity, promotions, airdrop and dev costs
    uint256 private _totalSupply = 10000000 * (10 ** 8);

    constructor() public {
        _balances[msg.sender] = _totalSupply;
    }

                                                    
    function TOTALSUPPLY135() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                  
    function BALANCEOF654(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

                                                                                                                                                                                                   
    function TRANSFER957(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER985(_MSGSENDER160(), recipient, amount);
        return true;
    }

                                                  
    function ALLOWANCE821(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

                                                                                                                                  
    function APPROVE568(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE329(_MSGSENDER160(), spender, amount);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function TRANSFERFROM732(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER985(sender, recipient, amount);
        _APPROVE329(sender, _MSGSENDER160(), _allowances[sender][_MSGSENDER160()].SUB455(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                   
    function INCREASEALLOWANCE485(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE329(_MSGSENDER160(), spender, _allowances[_MSGSENDER160()][spender].ADD699(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    function DECREASEALLOWANCE86(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE329(_MSGSENDER160(), spender, _allowances[_MSGSENDER160()][spender].SUB455(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function _TRANSFER985(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB455(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD699(amount);
        emit TRANSFER346(sender, recipient, amount);
    }

                                                                                                                                                                                                                                                                       
    function _MINT825(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD699(amount);
        _balances[account] = _balances[account].ADD699(amount);
        emit TRANSFER346(address(0), account, amount);
    }

                                                                                                                            
    function BURN844(uint256 amount) external {	//inject NONSTANDARD NAMING
        require(_balances[msg.sender] >= amount, "ERC20: not enough balance!");

        _BURN97(msg.sender, amount);
    }

                                                                                                                                                                                                                                                                                                                         
    function _BURN97(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB455(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB455(amount);
        emit TRANSFER346(account, address(0), amount);
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                  
    function _APPROVE329(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL669(owner, spender, amount);
    }

                                                                                                                                                                           
    function _BURNFROM236(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN97(account, amount);
        _APPROVE329(account, _MSGSENDER160(), _allowances[account][_MSGSENDER160()].SUB455(amount, "ERC20: burn amount exceeds allowance"));
    }
}

contract GlobalsAndUtility is ERC20 {
                           
    event XFLOBBYENTER524(	//inject NONSTANDARD NAMING
        uint256 timestamp,
        uint256 enterDay,
        uint256 indexed entryIndex,
        uint256 indexed rawAmount
    );

                           
    event XFLOBBYEXIT602(	//inject NONSTANDARD NAMING
        uint256 timestamp,
        uint256 enterDay,
        uint256 indexed entryIndex,
        uint256 indexed xfAmount,
        address indexed referrerAddr
    );

                              
    event DAILYDATAUPDATE936(	//inject NONSTANDARD NAMING
        address indexed updaterAddr,
        uint256 timestamp,
        uint256 beginDay,
        uint256 endDay
    );

                         
    event STAKESTART579(	//inject NONSTANDARD NAMING
        uint40 indexed stakeId,
        address indexed stakerAddr,
        uint256 stakedSuns,
        uint256 stakeShares,
        uint256 stakedDays
    );
    
                                  
    event STAKEGOODACCOUNTING417(	//inject NONSTANDARD NAMING
        uint40 indexed stakeId,
        address indexed stakerAddr,
        address indexed senderAddr,
        uint256 stakedSuns,
        uint256 stakeShares,
        uint256 payout,
        uint256 penalty
    );

                        
    event STAKEEND585(	//inject NONSTANDARD NAMING
        uint40 indexed stakeId,
        uint40 prevUnlocked,
        address indexed stakerAddr,
        uint256 lockedDay,
        uint256 servedDays,
        uint256 stakedSuns,
        uint256 stakeShares,
        uint256 dividends,
        uint256 payout,
        uint256 penalty,
        uint256 stakeReturn
    );

                               
    event SHARERATECHANGE529(	//inject NONSTANDARD NAMING
        uint40 indexed stakeId,
        uint256 timestamp,
        uint256 newShareRate
    );

                                      
    address payable internal constant t2x_share_addr668 = 0x769902b4cB2dfD79F2370555AD255Bf599bF7155;	//inject NONSTANDARD NAMING

    uint8 internal LAST_FLUSHED_DAY = 1;

                         
    string public constant name699 = "E2X";	//inject NONSTANDARD NAMING
    string public constant symbol891 = "E2X";	//inject NONSTANDARD NAMING
    uint8 public constant decimals160 = 8;	//inject NONSTANDARD NAMING

                                                     
    uint256 private constant suns_per_e2x950 = 10 ** uint256(decimals160); // 1e8	//inject NONSTANDARD NAMING

                                                         
    uint256 internal constant launch_time15 = 1604016000;	//inject NONSTANDARD NAMING

                              
    uint256 internal constant pre_claim_days99 = 1;	//inject NONSTANDARD NAMING
    uint256 internal constant claim_starting_amount694 = 5000000 * (10 ** 8);	//inject NONSTANDARD NAMING
    uint256 internal constant claim_lowest_amount682 = 1000000 * (10 ** 8);	//inject NONSTANDARD NAMING
    uint256 internal constant claim_phase_start_day317 = pre_claim_days99;	//inject NONSTANDARD NAMING

                                                                    
    uint256 internal constant xf_lobby_day_words214 = ((1 + (50 * 7)) + 255) >> 8;	//inject NONSTANDARD NAMING

                                 
    uint256 internal constant min_stake_days435 = 1;	//inject NONSTANDARD NAMING

    uint256 internal constant max_stake_days309 = 365;	//inject NONSTANDARD NAMING

    uint256 internal constant early_penalty_min_days266 = 90;	//inject NONSTANDARD NAMING

    uint256 private constant late_penalty_grace_weeks504 = 2;	//inject NONSTANDARD NAMING
    uint256 internal constant late_penalty_grace_days49 = late_penalty_grace_weeks504 * 7;	//inject NONSTANDARD NAMING

    uint256 private constant late_penalty_scale_weeks898 = 100;	//inject NONSTANDARD NAMING
    uint256 internal constant late_penalty_scale_days580 = late_penalty_scale_weeks898 * 7;	//inject NONSTANDARD NAMING

                                                                                        
    uint256 private constant lpb_bonus_percent812 = 20;	//inject NONSTANDARD NAMING
    uint256 private constant lpb_bonus_max_percent727 = 200;	//inject NONSTANDARD NAMING
    uint256 internal constant lpb319 = 364 * 100 / lpb_bonus_percent812;	//inject NONSTANDARD NAMING
    uint256 internal constant lpb_max_days592 = lpb319 * lpb_bonus_max_percent727 / 100;	//inject NONSTANDARD NAMING

                                                                                        
    uint256 private constant bpb_bonus_percent83 = 10;	//inject NONSTANDARD NAMING
    uint256 private constant bpb_max_e2x749 = 7 * 1e6;	//inject NONSTANDARD NAMING
    uint256 internal constant bpb_max_suns408 = bpb_max_e2x749 * suns_per_e2x950;	//inject NONSTANDARD NAMING
    uint256 internal constant bpb822 = bpb_max_suns408 * 100 / bpb_bonus_percent83;	//inject NONSTANDARD NAMING

                                                    
    uint256 internal constant share_rate_scale593 = 1e5;	//inject NONSTANDARD NAMING

                                        
    uint256 internal constant share_rate_uint_size116 = 40;	//inject NONSTANDARD NAMING
    uint256 internal constant share_rate_max997 = (1 << share_rate_uint_size116) - 1;	//inject NONSTANDARD NAMING

                              
    uint8 internal constant bonus_day_scale477 = 2;	//inject NONSTANDARD NAMING

                                                                                     
    struct GlobalsCache {
        uint256 _lockedSunsTotal;
        uint256 _nextStakeSharesTotal;
        uint256 _shareRate;
        uint256 _stakePenaltyTotal;
        uint256 _dailyDataCount;
        uint256 _stakeSharesTotal;
        uint40 _latestStakeId;
        uint256 _currentDay;
    }

    struct GlobalsStore {
        uint72 lockedSunsTotal;
        uint72 nextStakeSharesTotal;
        uint40 shareRate;
        uint72 stakePenaltyTotal;
        uint16 dailyDataCount;
        uint72 stakeSharesTotal;
        uint40 latestStakeId;
    }

    GlobalsStore public globals;

                    
    struct DailyDataStore {
        uint72 dayPayoutTotal;
        uint256 dayDividends;
        uint72 dayStakeSharesTotal;
    }

    mapping(uint256 => DailyDataStore) public dailyData;

                                                                             
    struct StakeCache {
        uint40 _stakeId;
        uint256 _stakedSuns;
        uint256 _stakeShares;
        uint256 _lockedDay;
        uint256 _stakedDays;
        uint256 _unlockedDay;
    }

    struct StakeStore {
        uint40 stakeId;
        uint72 stakedSuns;
        uint72 stakeShares;
        uint16 lockedDay;
        uint16 stakedDays;
        uint16 unlockedDay;
    }

    mapping(address => StakeStore[]) public stakeLists;

                                                      
    struct DailyRoundState {
        uint256 _allocSupplyCached;
        uint256 _payoutTotal;
    }

    struct XfLobbyEntryStore {
        uint96 rawAmount;
        address referrerAddr;
    }

    struct XfLobbyQueueStore {
        uint40 headIndex;
        uint40 tailIndex;
        mapping(uint256 => XfLobbyEntryStore) entries;
    }

    mapping(uint256 => uint256) public xfLobby;
    mapping(uint256 => mapping(address => XfLobbyQueueStore)) public xfLobbyMembers;

                                                                                                                                                                                                                                              
    function DAILYDATAUPDATE882(uint256 beforeDay)	//inject NONSTANDARD NAMING
        external
    {
        GlobalsCache memory g;
        GlobalsCache memory gSnapshot;
        _GLOBALSLOAD96(g, gSnapshot);

                                   
        require(g._currentDay > claim_phase_start_day317, "E2X: Too early");

        if (beforeDay != 0) {
            require(beforeDay <= g._currentDay, "E2X: beforeDay cannot be in the future");

            _DAILYDATAUPDATE609(g, beforeDay, false);
        } else {
                                                        
            _DAILYDATAUPDATE609(g, g._currentDay, false);
        }

        _GLOBALSSYNC724(g, gSnapshot);
    }

                                                                                                                                                                                                                                                                                                                                
    function DAILYDATARANGE328(uint256 beginDay, uint256 endDay)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256[] memory _dayStakeSharesTotal, uint256[] memory _dayPayoutTotal, uint256[] memory _dayDividends)
    {
        require(beginDay < endDay && endDay <= globals.dailyDataCount, "E2X: range invalid");

        _dayStakeSharesTotal = new uint256[](endDay - beginDay);
        _dayPayoutTotal = new uint256[](endDay - beginDay);
        _dayDividends = new uint256[](endDay - beginDay);

        uint256 src = beginDay;
        uint256 dst = 0;
        do {
            _dayStakeSharesTotal[dst] = uint256(dailyData[src].dayStakeSharesTotal);
            _dayPayoutTotal[dst++] = uint256(dailyData[src].dayPayoutTotal);
            _dayDividends[dst++] = dailyData[src].dayDividends;
        } while (++src < endDay);

        return (_dayStakeSharesTotal, _dayPayoutTotal, _dayDividends);
    }


                                                                                                                                                                                                                         
    function GLOBALINFO209()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256[10] memory)
    {

        return [
            globals.lockedSunsTotal,
            globals.nextStakeSharesTotal,
            globals.shareRate,
            globals.stakePenaltyTotal,
            globals.dailyDataCount,
            globals.stakeSharesTotal,
            globals.latestStakeId,
            block.timestamp,
            TOTALSUPPLY135(),
            xfLobby[_CURRENTDAY925()]
        ];
    }

                                                                                                                                                                                                              
    function ALLOCATEDSUPPLY816()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256)
    {
        return TOTALSUPPLY135() + globals.lockedSunsTotal;
    }

                                                                                                                                                      
    function CURRENTDAY307()	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256)
    {
        return _CURRENTDAY925();
    }

    function _CURRENTDAY925()	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256)
    {
        if (block.timestamp < launch_time15){
             return 0;
        }else{
             return (block.timestamp - launch_time15) / 1 days;
        }
    }

    function _DAILYDATAUPDATEAUTO412(GlobalsCache memory g)	//inject NONSTANDARD NAMING
        internal
    {
        _DAILYDATAUPDATE609(g, g._currentDay, true);
    }

    function _GLOBALSLOAD96(GlobalsCache memory g, GlobalsCache memory gSnapshot)	//inject NONSTANDARD NAMING
        internal
        view
    {
        g._lockedSunsTotal = globals.lockedSunsTotal;
        g._nextStakeSharesTotal = globals.nextStakeSharesTotal;
        g._shareRate = globals.shareRate;
        g._stakePenaltyTotal = globals.stakePenaltyTotal;
        g._dailyDataCount = globals.dailyDataCount;
        g._stakeSharesTotal = globals.stakeSharesTotal;
        g._latestStakeId = globals.latestStakeId;
        g._currentDay = _CURRENTDAY925();

        _GLOBALSCACHESNAPSHOT1(g, gSnapshot);
    }

    function _GLOBALSCACHESNAPSHOT1(GlobalsCache memory g, GlobalsCache memory gSnapshot)	//inject NONSTANDARD NAMING
        internal
        pure
    {
        gSnapshot._lockedSunsTotal = g._lockedSunsTotal;
        gSnapshot._nextStakeSharesTotal = g._nextStakeSharesTotal;
        gSnapshot._shareRate = g._shareRate;
        gSnapshot._stakePenaltyTotal = g._stakePenaltyTotal;
        gSnapshot._dailyDataCount = g._dailyDataCount;
        gSnapshot._stakeSharesTotal = g._stakeSharesTotal;
        gSnapshot._latestStakeId = g._latestStakeId;
    }

    function _GLOBALSSYNC724(GlobalsCache memory g, GlobalsCache memory gSnapshot)	//inject NONSTANDARD NAMING
        internal
    {
        if (g._lockedSunsTotal != gSnapshot._lockedSunsTotal
            || g._nextStakeSharesTotal != gSnapshot._nextStakeSharesTotal
            || g._shareRate != gSnapshot._shareRate
            || g._stakePenaltyTotal != gSnapshot._stakePenaltyTotal) {
            globals.lockedSunsTotal = uint72(g._lockedSunsTotal);
            globals.nextStakeSharesTotal = uint72(g._nextStakeSharesTotal);
            globals.shareRate = uint40(g._shareRate);
            globals.stakePenaltyTotal = uint72(g._stakePenaltyTotal);
        }
        if (g._dailyDataCount != gSnapshot._dailyDataCount
            || g._stakeSharesTotal != gSnapshot._stakeSharesTotal
            || g._latestStakeId != gSnapshot._latestStakeId) {
            globals.dailyDataCount = uint16(g._dailyDataCount);
            globals.stakeSharesTotal = uint72(g._stakeSharesTotal);
            globals.latestStakeId = g._latestStakeId;
        }
    }

    function _STAKELOAD548(StakeStore storage stRef, uint40 stakeIdParam, StakeCache memory st)	//inject NONSTANDARD NAMING
        internal
        view
    {
                                                         
        require(stakeIdParam == stRef.stakeId, "E2X: stakeIdParam not in stake");

        st._stakeId = stRef.stakeId;
        st._stakedSuns = stRef.stakedSuns;
        st._stakeShares = stRef.stakeShares;
        st._lockedDay = stRef.lockedDay;
        st._stakedDays = stRef.stakedDays;
        st._unlockedDay = stRef.unlockedDay;
    }

    function _STAKEUPDATE757(StakeStore storage stRef, StakeCache memory st)	//inject NONSTANDARD NAMING
        internal
    {
        stRef.stakeId = st._stakeId;
        stRef.stakedSuns = uint72(st._stakedSuns);
        stRef.stakeShares = uint72(st._stakeShares);
        stRef.lockedDay = uint16(st._lockedDay);
        stRef.stakedDays = uint16(st._stakedDays);
        stRef.unlockedDay = uint16(st._unlockedDay);
    }

    function _STAKEADD174(	//inject NONSTANDARD NAMING
        StakeStore[] storage stakeListRef,
        uint40 newStakeId,
        uint256 newStakedSuns,
        uint256 newStakeShares,
        uint256 newLockedDay,
        uint256 newStakedDays
    )
        internal
    {
        stakeListRef.push(
            StakeStore(
                newStakeId,
                uint72(newStakedSuns),
                uint72(newStakeShares),
                uint16(newLockedDay),
                uint16(newStakedDays),
                uint16(0) // unlockedDay
            )
        );
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    function _STAKEREMOVE502(StakeStore[] storage stakeListRef, uint256 stakeIndex)	//inject NONSTANDARD NAMING
        internal
    {
        uint256 lastIndex = stakeListRef.length - 1;

                                                                                
        if (stakeIndex != lastIndex) {
                                                                     
            stakeListRef[stakeIndex] = stakeListRef[lastIndex];
        }

                                                                                                                                                                                  
        stakeListRef.pop();
    }

                                                                                                                                                                                                                                                                         
    function _ESTIMATEPAYOUTREWARDSDAY752(GlobalsCache memory g, uint256 stakeSharesParam, uint256 day)	//inject NONSTANDARD NAMING
        internal
        view
        returns (uint256 payout)
    {
                                                        
        GlobalsCache memory gTmp;
        _GLOBALSCACHESNAPSHOT1(g, gTmp);

        DailyRoundState memory rs;
        rs._allocSupplyCached = TOTALSUPPLY135() + g._lockedSunsTotal;

        _DAILYROUNDCALC865(gTmp, rs, day);

                                                                                  
        gTmp._stakeSharesTotal += stakeSharesParam;

        payout = rs._payoutTotal * stakeSharesParam / gTmp._stakeSharesTotal;

        return payout;
    }

    function _DAILYROUNDCALC865(GlobalsCache memory g, DailyRoundState memory rs, uint256 day)	//inject NONSTANDARD NAMING
        private
        view
    {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        
        rs._payoutTotal = (rs._allocSupplyCached * 50000 / 68854153);

        if (g._stakePenaltyTotal != 0) {
            rs._payoutTotal += g._stakePenaltyTotal;
            g._stakePenaltyTotal = 0;
        }
    }

    function _DAILYROUNDCALCANDSTORE927(GlobalsCache memory g, DailyRoundState memory rs, uint256 day)	//inject NONSTANDARD NAMING
        private
    {
        _DAILYROUNDCALC865(g, rs, day);

        dailyData[day].dayPayoutTotal = uint72(rs._payoutTotal);
        dailyData[day].dayDividends = xfLobby[day];
        dailyData[day].dayStakeSharesTotal = uint72(g._stakeSharesTotal);
    }

    function _DAILYDATAUPDATE609(GlobalsCache memory g, uint256 beforeDay, bool isAutoUpdate)	//inject NONSTANDARD NAMING
        private
    {
        if (g._dailyDataCount >= beforeDay) {
                                    
            return;
        }

        DailyRoundState memory rs;
        rs._allocSupplyCached = TOTALSUPPLY135() + g._lockedSunsTotal;

        uint256 day = g._dailyDataCount;

        _DAILYROUNDCALCANDSTORE927(g, rs, day);

                                                                                
        if (g._nextStakeSharesTotal != 0) {
            g._stakeSharesTotal += g._nextStakeSharesTotal;
            g._nextStakeSharesTotal = 0;
        }

        while (++day < beforeDay) {
            _DAILYROUNDCALCANDSTORE927(g, rs, day);
        }

        emit DAILYDATAUPDATE936(
            msg.sender,
            block.timestamp,
            g._dailyDataCount, 
            day
        );
        
        g._dailyDataCount = day;
    }
}

contract StakeableToken is GlobalsAndUtility {
                                                                                                                                                                
    function STAKESTART743(uint256 newStakedSuns, uint256 newStakedDays)	//inject NONSTANDARD NAMING
        external
    {
        GlobalsCache memory g;
        GlobalsCache memory gSnapshot;
        _GLOBALSLOAD96(g, gSnapshot);

                                            
        require(newStakedDays >= min_stake_days435, "E2X: newStakedDays lower than minimum");

                                                   
        _DAILYDATAUPDATEAUTO412(g);

        _STAKESTART72(g, newStakedSuns, newStakedDays);

                                                       
        _BURN97(msg.sender, newStakedSuns);

        _GLOBALSSYNC724(g, gSnapshot);
    }

                                                                                                                                                                                                                                                                                                                                                                
    function STAKEGOODACCOUNTING598(address stakerAddr, uint256 stakeIndex, uint40 stakeIdParam)	//inject NONSTANDARD NAMING
        external
    {
        GlobalsCache memory g;
        GlobalsCache memory gSnapshot;
        _GLOBALSLOAD96(g, gSnapshot);

                                                                     
        require(stakeLists[stakerAddr].length != 0, "E2X: Empty stake list");
        require(stakeIndex < stakeLists[stakerAddr].length, "E2X: stakeIndex invalid");

        StakeStore storage stRef = stakeLists[stakerAddr][stakeIndex];

                            
        StakeCache memory st;
        _STAKELOAD548(stRef, stakeIdParam, st);

                                              
        require(g._currentDay >= st._lockedDay + st._stakedDays, "E2X: Stake not fully served");

                                        
        require(st._unlockedDay == 0, "E2X: Stake already unlocked");

                                                   
        _DAILYDATAUPDATEAUTO412(g);

                                        
        _STAKEUNLOCK180(g, st);

                                                            
        (, uint256 payout, uint256 dividends, uint256 penalty, uint256 cappedPenalty) = _STAKEPERFORMANCE539(
            g,
            st,
            st._stakedDays
        );

        emit STAKEGOODACCOUNTING417(
            stakeIdParam,
            stakerAddr,
            msg.sender,
            st._stakedSuns,
            st._stakeShares,
            payout,
            penalty
        );

        if (cappedPenalty != 0) {
            g._stakePenaltyTotal += cappedPenalty;
        }

                                         
        _STAKEUPDATE757(stRef, st);

        _GLOBALSSYNC724(g, gSnapshot);
    }

                                                                                                                                                                                                                                                           
    function STAKEEND328(uint256 stakeIndex, uint40 stakeIdParam)	//inject NONSTANDARD NAMING
        external
    {
        GlobalsCache memory g;
        GlobalsCache memory gSnapshot;
        _GLOBALSLOAD96(g, gSnapshot);

        StakeStore[] storage stakeListRef = stakeLists[msg.sender];

                                                                     
        require(stakeListRef.length != 0, "E2X: Empty stake list");
        require(stakeIndex < stakeListRef.length, "E2X: stakeIndex invalid");

                            
        StakeCache memory st;
        _STAKELOAD548(stakeListRef[stakeIndex], stakeIdParam, st);

                                                   
        _DAILYDATAUPDATEAUTO412(g);

        uint256 servedDays = 0;

        bool prevUnlocked = (st._unlockedDay != 0);
        uint256 stakeReturn;
        uint256 payout = 0;
        uint256 dividends = 0;
        uint256 penalty = 0;
        uint256 cappedPenalty = 0;

        if (g._currentDay >= st._lockedDay) {
            if (prevUnlocked) {
                                                                                                 
                servedDays = st._stakedDays;
            } else {
                _STAKEUNLOCK180(g, st);

                servedDays = g._currentDay - st._lockedDay;
                if (servedDays > st._stakedDays) {
                    servedDays = st._stakedDays;
                }
            }

            (stakeReturn, payout, dividends, penalty, cappedPenalty) = _STAKEPERFORMANCE539(g, st, servedDays);

            msg.sender.transfer(dividends);
        } else {
                                                                                            
            g._nextStakeSharesTotal -= st._stakeShares;

            stakeReturn = st._stakedSuns;
        }

        emit STAKEEND585(
            stakeIdParam, 
            prevUnlocked ? 1 : 0,
            msg.sender,
            st._lockedDay,
            servedDays, 
            st._stakedSuns, 
            st._stakeShares, 
            dividends,
            payout, 
            penalty,
            stakeReturn
        );

        if (cappedPenalty != 0 && !prevUnlocked) {
                                                                                                 
            g._stakePenaltyTotal += cappedPenalty;
        }

                                                         
        if (stakeReturn != 0) {
            _MINT825(msg.sender, stakeReturn);
        }
        g._lockedSunsTotal -= st._stakedSuns;

        _STAKEREMOVE502(stakeListRef, stakeIndex);

        _GLOBALSSYNC724(g, gSnapshot);
    }

                                                                                                                                         
    function STAKECOUNT40(address stakerAddr)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256)
    {
        return stakeLists[stakerAddr].length;
    }

                                                                                                                                                                                         
    function _STAKESTART72(	//inject NONSTANDARD NAMING
        GlobalsCache memory g,
        uint256 newStakedSuns,
        uint256 newStakedDays
    )
        internal
    {
                                            
        require(newStakedDays <= max_stake_days309, "E2X: newStakedDays higher than maximum");

        uint256 bonusSuns = _STAKESTARTBONUSSUNS666(newStakedSuns, newStakedDays);
        uint256 newStakeShares = (newStakedSuns + bonusSuns) * share_rate_scale593 / g._shareRate;

                                                                         
        require(newStakeShares != 0, "E2X: newStakedSuns must be at least minimum shareRate");

                                                                                                                                                                                                                                                                                                                                     
        uint256 newLockedDay = g._currentDay + 1;

                          
        uint40 newStakeId = ++g._latestStakeId;
        _STAKEADD174(
            stakeLists[msg.sender],
            newStakeId,
            newStakedSuns,
            newStakeShares,
            newLockedDay,
            newStakedDays
        );

        emit STAKESTART579(
            newStakeId, 
            msg.sender,
            newStakedSuns, 
            newStakeShares, 
            newStakedDays
        );

                                                                              
        g._nextStakeSharesTotal += newStakeShares;

                                                                
        g._lockedSunsTotal += newStakedSuns;
    }

                                                                                                                                                                                                                                                                                                                                                                                          
    function _CALCPAYOUTREWARDS104(	//inject NONSTANDARD NAMING
        GlobalsCache memory g,
        uint256 stakeSharesParam,
        uint256 beginDay,
        uint256 endDay
    )
        private
        view
        returns (uint256 payout)
    {
        uint256 counter;

        for (uint256 day = beginDay; day < endDay; day++) {
            uint256 dayPayout;

            dayPayout = dailyData[day].dayPayoutTotal * stakeSharesParam
                / dailyData[day].dayStakeSharesTotal;

            if (counter < 4) {
                counter++;
            } 
                                           
            else {
                dayPayout = (dailyData[day].dayPayoutTotal * stakeSharesParam
                / dailyData[day].dayStakeSharesTotal) * bonus_day_scale477;
                counter = 0;
            }

            payout += dayPayout;
        }

        return payout;
    }

                                                                                                                                                                                                                                                                                                                                              
    function _CALCPAYOUTDIVIDENDSREWARD220(	//inject NONSTANDARD NAMING
        GlobalsCache memory g,
        uint256 stakeSharesParam,
        uint256 beginDay,
        uint256 endDay
    )
        private
        view
        returns (uint256 payout)
    {

        for (uint256 day = beginDay; day < endDay; day++) {
            uint256 dayPayout;

                                                            
            dayPayout += ((dailyData[day].dayDividends * 90) / 100) * stakeSharesParam
            / dailyData[day].dayStakeSharesTotal;

            payout += dayPayout;
        }

        return payout;
    }

                                                                                                                                                                                
    function _STAKESTARTBONUSSUNS666(uint256 newStakedSuns, uint256 newStakedDays)	//inject NONSTANDARD NAMING
        private
        pure
        returns (uint256 bonusSuns)
    {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
        uint256 cappedExtraDays = 0;

                                                            
        if (newStakedDays > 1) {
            cappedExtraDays = newStakedDays <= lpb_max_days592 ? newStakedDays - 1 : lpb_max_days592;
        }

        uint256 cappedStakedSuns = newStakedSuns <= bpb_max_suns408
            ? newStakedSuns
            : bpb_max_suns408;

        bonusSuns = cappedExtraDays * bpb822 + cappedStakedSuns * lpb319;
        bonusSuns = newStakedSuns * bonusSuns / (lpb319 * bpb822);

        return bonusSuns;
    }

    function _STAKEUNLOCK180(GlobalsCache memory g, StakeCache memory st)	//inject NONSTANDARD NAMING
        private
        pure
    {
        g._stakeSharesTotal -= st._stakeShares;
        st._unlockedDay = g._currentDay;
    }

    function _STAKEPERFORMANCE539(GlobalsCache memory g, StakeCache memory st, uint256 servedDays)	//inject NONSTANDARD NAMING
        private
        view
        returns (uint256 stakeReturn, uint256 payout, uint256 dividends, uint256 penalty, uint256 cappedPenalty)
    {
        if (servedDays < st._stakedDays) {
            (payout, penalty) = _CALCPAYOUTANDEARLYPENALTY486(
                g,
                st._lockedDay,
                st._stakedDays,
                servedDays,
                st._stakeShares
            );
            stakeReturn = st._stakedSuns + payout;

            dividends = _CALCPAYOUTDIVIDENDSREWARD220(
                g,
                st._stakeShares,
                st._lockedDay,
                st._lockedDay + servedDays
            );
        } else {
            // servedDays must == stakedDays here
            payout = _CALCPAYOUTREWARDS104(
                g,
                st._stakeShares,
                st._lockedDay,
                st._lockedDay + servedDays
            );

            dividends = _CALCPAYOUTDIVIDENDSREWARD220(
                g,
                st._stakeShares,
                st._lockedDay,
                st._lockedDay + servedDays
            );

            stakeReturn = st._stakedSuns + payout;

            penalty = _CALCLATEPENALTY636(st._lockedDay, st._stakedDays, st._unlockedDay, stakeReturn);
        }
        if (penalty != 0) {
            if (penalty > stakeReturn) {
                                                         
                cappedPenalty = stakeReturn;
                stakeReturn = 0;
            } else {
                                                          
                cappedPenalty = penalty;
                stakeReturn -= cappedPenalty;
            }
        }
        return (stakeReturn, payout, dividends, penalty, cappedPenalty);
    }

    function _CALCPAYOUTANDEARLYPENALTY486(	//inject NONSTANDARD NAMING
        GlobalsCache memory g,
        uint256 lockedDayParam,
        uint256 stakedDaysParam,
        uint256 servedDays,
        uint256 stakeSharesParam
    )
        private
        view
        returns (uint256 payout, uint256 penalty)
    {
        uint256 servedEndDay = lockedDayParam + servedDays;

                                                                   
        uint256 penaltyDays = (stakedDaysParam + 1) / 2;
        if (penaltyDays < early_penalty_min_days266) {
            penaltyDays = early_penalty_min_days266;
        }

        if (servedDays == 0) {
                                                                     
            uint256 expected = _ESTIMATEPAYOUTREWARDSDAY752(g, stakeSharesParam, lockedDayParam);
            penalty = expected * penaltyDays;
            return (payout, penalty); // Actual payout was 0
        }

        if (penaltyDays < servedDays) {
                                                                                                                                                                                                                                                                                                                                            
            uint256 penaltyEndDay = lockedDayParam + penaltyDays;
            penalty = _CALCPAYOUTREWARDS104(g, stakeSharesParam, lockedDayParam, penaltyEndDay);

            uint256 delta = _CALCPAYOUTREWARDS104(g, stakeSharesParam, penaltyEndDay, servedEndDay);
            payout = penalty + delta;
            return (payout, penalty);
        }

                                        
        payout = _CALCPAYOUTREWARDS104(g, stakeSharesParam, lockedDayParam, servedEndDay);

        if (penaltyDays == servedDays) {
            penalty = payout;
        } else {
                                                                                                                                                                                                            
            penalty = payout * penaltyDays / servedDays;
        }
        return (payout, penalty);
    }

    function _CALCLATEPENALTY636(	//inject NONSTANDARD NAMING
        uint256 lockedDayParam,
        uint256 stakedDaysParam,
        uint256 unlockedDayParam,
        uint256 rawStakeReturn
    )
        private
        pure
        returns (uint256)
    {
                                                      
        uint256 maxUnlockedDay = lockedDayParam + stakedDaysParam + late_penalty_grace_days49;
        if (unlockedDayParam <= maxUnlockedDay) {
            return 0;
        }

                                                                             
        return rawStakeReturn * (unlockedDayParam - maxUnlockedDay) / late_penalty_scale_days580;
    }

}

contract TransformableToken is StakeableToken {
                                                                                                                                                                                 
    function XFLOBBYENTER349(address referrerAddr)	//inject NONSTANDARD NAMING
        external
        payable
    {
        uint256 enterDay = _CURRENTDAY925();

        uint256 rawAmount = msg.value;
        require(rawAmount != 0, "E2X: Amount required");

        XfLobbyQueueStore storage qRef = xfLobbyMembers[enterDay][msg.sender];

        uint256 entryIndex = qRef.tailIndex++;

        qRef.entries[entryIndex] = XfLobbyEntryStore(uint96(rawAmount), referrerAddr);

        xfLobby[enterDay] += rawAmount;

        emit XFLOBBYENTER524(
            block.timestamp, 
            enterDay, 
            entryIndex, 
            rawAmount
        );
    }

                                                                                                                                                                                                                                    
    function XFLOBBYEXIT32(uint256 enterDay, uint256 count)	//inject NONSTANDARD NAMING
        external
    {
        require(enterDay < _CURRENTDAY925(), "E2X: Round is not complete");

        XfLobbyQueueStore storage qRef = xfLobbyMembers[enterDay][msg.sender];

        uint256 headIndex = qRef.headIndex;
        uint256 endIndex;

        if (count != 0) {
            require(count <= qRef.tailIndex - headIndex, "E2X: count invalid");
            endIndex = headIndex + count;
        } else {
            endIndex = qRef.tailIndex;
            require(headIndex < endIndex, "E2X: count invalid");
        }

        uint256 waasLobby = _WAASLOBBY803(enterDay);
        uint256 _xfLobby = xfLobby[enterDay];
        uint256 totalXfAmount = 0;

        do {
            uint256 rawAmount = qRef.entries[headIndex].rawAmount;
            address referrerAddr = qRef.entries[headIndex].referrerAddr;

            delete qRef.entries[headIndex];

            uint256 xfAmount = waasLobby * rawAmount / _xfLobby;

            if (referrerAddr == address(0) || referrerAddr == msg.sender) {
                                                  
                _EMITXFLOBBYEXIT31(enterDay, headIndex, xfAmount, referrerAddr);
            } else {
                                                                
                uint256 referralBonusSuns = xfAmount / 20;

                xfAmount += referralBonusSuns;

                                                                         
                uint256 referrerBonusSuns = xfAmount / 10;

                _EMITXFLOBBYEXIT31(enterDay, headIndex, xfAmount, referrerAddr);
                _MINT825(referrerAddr, referrerBonusSuns);
            }

            totalXfAmount += xfAmount;
        } while (++headIndex < endIndex);

        qRef.headIndex = uint40(headIndex);

        if (totalXfAmount != 0) {
            _MINT825(msg.sender, totalXfAmount);
        }
    }

                                                                                                                                                                                                                                                                           
    function XFLOBBYRANGE106(uint256 beginDay, uint256 endDay)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256[] memory list)
    {
        require(
            beginDay < endDay && endDay <= _CURRENTDAY925(),
            "E2X: invalid range"
        );

        list = new uint256[](endDay - beginDay);

        uint256 src = beginDay;
        uint256 dst = 0;
        do {
            list[dst++] = uint256(xfLobby[src++]);
        } while (src < endDay);

        return list;
    }

                                                                                    
    function XFFLUSH422()	//inject NONSTANDARD NAMING
        external
    {
        GlobalsCache memory g;
        GlobalsCache memory gSnapshot;
        _GLOBALSLOAD96(g, gSnapshot);
        
        require(address(this).balance != 0, "E2X: No value");

        require(LAST_FLUSHED_DAY < _CURRENTDAY925(), "E2X: Invalid day");

        _DAILYDATAUPDATEAUTO412(g);

        t2x_share_addr668.transfer((dailyData[LAST_FLUSHED_DAY].dayDividends * 10) / 100);

        LAST_FLUSHED_DAY++;

        _GLOBALSSYNC724(g, gSnapshot);
    }

                                                                                                                                                                                                                                                                                                                                                                             
    function XFLOBBYENTRY303(address memberAddr, uint256 enterDay, uint256 entryIndex)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256 rawAmount, address referrerAddr)
    {
        XfLobbyEntryStore storage entry = xfLobbyMembers[enterDay][memberAddr].entries[entryIndex];

        require(entry.rawAmount != 0, "E2X: Param invalid");

        return (entry.rawAmount, entry.referrerAddr);
    }

                                                                                                                                                                                                     
    function XFLOBBYPENDINGDAYS599(address memberAddr)	//inject NONSTANDARD NAMING
        external
        view
        returns (uint256[xf_lobby_day_words214] memory words)
    {
        uint256 day = _CURRENTDAY925() + 1;

        while (day-- != 0) {
            if (xfLobbyMembers[day][memberAddr].tailIndex > xfLobbyMembers[day][memberAddr].headIndex) {
                words[day >> 8] |= 1 << (day & 255);
            }
        }

        return words;
    }
    
    function _WAASLOBBY803(uint256 enterDay)	//inject NONSTANDARD NAMING
        private
        returns (uint256 waasLobby)
    {
                                                            
        if (enterDay > 0 && enterDay <= 365) {                                     
            waasLobby = claim_starting_amount694 - ((enterDay - 1) * 1342465753424);
        } else {
            waasLobby = claim_lowest_amount682;
        }

        return waasLobby;
    }

    function _EMITXFLOBBYEXIT31(	//inject NONSTANDARD NAMING
        uint256 enterDay,
        uint256 entryIndex,
        uint256 xfAmount,
        address referrerAddr
    )
        private
    {
        emit XFLOBBYEXIT602(
            block.timestamp, 
            enterDay,
            entryIndex,
            xfAmount,
            referrerAddr
        );
    }
}

contract E2X is TransformableToken {
    constructor()
        public
    {
                                              
        globals.shareRate = uint40(1 * share_rate_scale593);
    }

    function() external payable {}
}