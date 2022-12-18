                                                                 

                                                                 

pragma solidity ^0.5.16;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract Initializable {

                                                                             
    bool private initialized;

                                                                                               
    bool private initializing;

                                                                                      
    modifier INITIALIZER87() {	//inject NONSTANDARD NAMING
        require(initializing || ISCONSTRUCTOR676() || !initialized, "Contract instance has already been initialized");

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

                                                                                   
    function ISCONSTRUCTOR676() private view returns (bool) {	//inject NONSTANDARD NAMING
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

contract ERC20Token
{
    function DECIMALS766() external view returns (uint);	//inject NONSTANDARD NAMING
    function ALLOWANCE15(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF459(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE333(address spender, uint value) external;	//inject NONSTANDARD NAMING
    function TRANSFER766(address to, uint value) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM888(address from, address to, uint value) external returns (bool);	//inject NONSTANDARD NAMING
}

library SafeMath {
                                                                                                                                                                                                                             
    function ADD647(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB445(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    uint256 constant wad120 = 10 ** 18;	//inject NONSTANDARD NAMING

    function WDIV278(uint x, uint y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD647(MUL957(x, wad120), y / 2) / y;
    }

    function WMUL168(uint x, uint y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD647(MUL957(x, y), wad120 / 2) / wad120;
    }

                                                                                                                                                                                                                                         
    function MUL957(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV239(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD397(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}


                                                                    
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT118(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
library SafeERC20 {

    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER456(ERC20Token token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN968(token, abi.encodeWithSelector(token.TRANSFER766.selector, to, value));
    }

    function SAFETRANSFERFROM811(ERC20Token token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN968(token, abi.encodeWithSelector(token.TRANSFERFROM888.selector, from, to, value));
    }

    function SAFEAPPROVE805(ERC20Token token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE15(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN968(token, abi.encodeWithSelector(token.APPROVE333.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE403(ERC20Token token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE15(address(this), spender).ADD647(value);
        CALLOPTIONALRETURN968(token, abi.encodeWithSelector(token.APPROVE333.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE18(ERC20Token token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE15(address(this), spender).SUB445(value);
        CALLOPTIONALRETURN968(token, abi.encodeWithSelector(token.APPROVE333.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN968(ERC20Token token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT118(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}


library UniversalERC20 {

    using SafeMath for uint256;
    using SafeERC20 for ERC20Token;

    ERC20Token private constant zero_address258 = ERC20Token(0x0000000000000000000000000000000000000000);	//inject NONSTANDARD NAMING
    ERC20Token private constant eth_address874 = ERC20Token(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);	//inject NONSTANDARD NAMING

    function UNIVERSALTRANSFER27(ERC20Token token, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        UNIVERSALTRANSFER27(token, to, amount, false);
    }

    function UNIVERSALTRANSFER27(ERC20Token token, address to, uint256 amount, bool mayFail) internal returns(bool) {	//inject NONSTANDARD NAMING
        if (amount == 0) {
            return true;
        }

        if (token == zero_address258 || token == eth_address874) {
            if (mayFail) {
                return address(uint160(to)).send(amount);
            } else {
                address(uint160(to)).transfer(amount);
                return true;
            }
        } else {
            token.SAFETRANSFER456(to, amount);
            return true;
        }
    }

    function UNIVERSALAPPROVE730(ERC20Token token, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        if (token != zero_address258 && token != eth_address874) {
            token.SAFEAPPROVE805(to, amount);
        }
    }

    function UNIVERSALTRANSFERFROM931(ERC20Token token, address from, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        if (amount == 0) {
            return;
        }

        if (token == zero_address258 || token == eth_address874) {
            require(from == msg.sender && msg.value >= amount, "msg.value is zero");
            if (to != address(this)) {
                address(uint160(to)).transfer(amount);
            }
            if (msg.value > amount) {
                msg.sender.transfer(uint256(msg.value).SUB445(amount));
            }
        } else {
            token.SAFETRANSFERFROM811(from, to, amount);
        }
    }

    function UNIVERSALBALANCEOF538(ERC20Token token, address who) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        if (token == zero_address258 || token == eth_address874) {
            return who.balance;
        } else {
            return token.BALANCEOF459(who);
        }
    }
}

contract OldShareholderVomer {
    function GETINFO650(address investor) view public returns (uint256 totalFunds, uint256 pendingReward, uint256 totalProfit, uint256 contractBalance);	//inject NONSTANDARD NAMING
}

contract Ownable {
    address payable public owner = msg.sender;
    address payable public newOwnerCandidate;

    modifier ONLYOWNER149()	//inject NONSTANDARD NAMING
    {
        assert(msg.sender == owner);
        _;
    }

    function CHANGEOWNERCANDIDATE892(address payable newOwner) public ONLYOWNER149 {	//inject NONSTANDARD NAMING
        newOwnerCandidate = newOwner;
    }

    function ACCEPTOWNER388() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwnerCandidate);
        owner = newOwnerCandidate;
    }
}

contract ShareholderVomer is Initializable
{
    using SafeMath for uint256;
    using UniversalERC20 for ERC20Token;

    address payable public owner;
    address payable public newOwnerCandidate;

    uint256 MinBalanceVMR;
    ERC20Token VMR_Token;

    OldShareholderVomer oldContract;

    event CREDIT561(address indexed approvedAddr, address indexed receiver, uint256 amount);	//inject NONSTANDARD NAMING
    event RETURNCREDIT711(address indexed approvedAddr, uint256 amount);	//inject NONSTANDARD NAMING

    mapping (address => bool) migrateDone;

    struct InvestorData {
        uint256 funds;
        uint256 lastDatetime;
        uint256 totalProfit;
        uint256 totalVMR;
    }
    mapping (address => InvestorData) investors;

    mapping(address => bool) public admins;

    mapping(address => uint256) individualVMRCup; 

    struct Partner {
        int256 maxCredit;        // max partner owe
        int256 balance;
    }
    mapping(address => Partner) partners;

    // 0 - eth, VMR_Token - vmr
    address  paymentToken;
    uint256 VMR_ETH_RATE;

    struct InvestorDataExt {
        mapping(address => uint256) totalProfit;
        address activePayoutToken;
        uint256 limitVMR; 
        uint256 ______gap;
    }

    uint256 globalLimitVMR; 

    mapping (address => InvestorDataExt) investorsExt;

    mapping(address => address) refList;

    modifier ONLYOWNER149()	//inject NONSTANDARD NAMING
    {
        assert(msg.sender == owner);
        _;
    }

    modifier ONLYADMIN733()	//inject NONSTANDARD NAMING
    {
        assert(admins[msg.sender]);
        _;
    }

    function INITIALIZE857() INITIALIZER87 public {	//inject NONSTANDARD NAMING
        VMR_Token = ERC20Token(0x063b98a414EAA1D4a5D4fC235a22db1427199024); // testnet 0xa258a452FC38Fc9Fa8A8b03F210346E8390A5D56
        oldContract = OldShareholderVomer(0x9C235ac2C33077A30593A3fd27A0087c687A80A3);
        MinBalanceVMR = 1000 * 10**18;
        migrateDone[0x12A09763eC6e5B7cbc4feb7178db8C91A79E456a] = true;
        migrateDone[0xB7722517f410914fFf62DF357A0c14B88EFb9369] = true;
        owner = msg.sender;
        paymentToken = address(0);
    }

    function GETPAYMENTINFO331() view public returns (address token, uint256 rate) {	//inject NONSTANDARD NAMING
        token = paymentToken;
        rate = VMR_ETH_RATE;
    }

    function UPDATEPAYMENTMODE891(address newPaymantMode, uint256 newRateInWei, uint256 newGlobalLimitVMRInInteger) ONLYOWNER149 public {	//inject NONSTANDARD NAMING
        require(newPaymantMode == address(0) || newPaymantMode == address(VMR_Token));
        paymentToken = newPaymantMode;
        if (newRateInWei != 0) VMR_ETH_RATE = newRateInWei;
        require(VMR_ETH_RATE != 0);
        globalLimitVMR = newGlobalLimitVMRInInteger * 10**18;
    }

    function SAFEETHTRANSFER908(address target, uint256 amount) internal {	//inject NONSTANDARD NAMING
        address payable payableTarget = address(uint160(target));
        (bool ok, ) = payableTarget.call.value(amount)("");
        require(ok);
    }

    function TAKEETH757(address targetAddr, uint256 amount) public {	//inject NONSTANDARD NAMING
        if (targetAddr == address(0)) targetAddr = msg.sender;

        Partner storage data = partners[msg.sender];

        require(data.maxCredit + data.balance > 0);
        require(uint256(data.maxCredit + data.balance) >= amount);

        data.balance -= int256(amount);

        SAFEETHTRANSFER908(targetAddr, amount);
        emit CREDIT561(msg.sender, targetAddr, amount);
    }

    function GETPARTNERINFO59(address addressPartner) view public returns (int256 maxCredit, int256 balance) {	//inject NONSTANDARD NAMING
        maxCredit = partners[addressPartner].maxCredit;
        balance = partners[addressPartner].balance;
    }

    function GIVEBACKETH525() payable public {	//inject NONSTANDARD NAMING
        Partner storage data = partners[msg.sender];
        if (data.maxCredit > 0) {
            data.balance += int256(msg.value);
        }
        emit RETURNCREDIT711(msg.sender, msg.value);
    }

    function SETPARTNERCONTRACT438(address addr, int256 maxCredit) ONLYOWNER149 public {	//inject NONSTANDARD NAMING
        require(maxCredit >= 0);
        Partner storage data = partners[addr];
        data.maxCredit = maxCredit;
    }

    function SETADMIN981(address newAdmin, bool activate) ONLYOWNER149 public {	//inject NONSTANDARD NAMING
        admins[newAdmin] = activate;
    }

    // set amount to 0 to disable individual cup
    function CHANGEINDIVIDUALVMRCUP950(address userAddress, uint256 minAmountInInteger) ONLYOWNER149 public {	//inject NONSTANDARD NAMING
        individualVMRCup[userAddress] = minAmountInInteger * 10**18;
    }

    uint256 public fundsLockedtoWithdraw;
    uint256 public dateUntilFundsLocked;

    function WITHDRAW503(uint256 amount)  public ONLYOWNER149 {	//inject NONSTANDARD NAMING
        if (dateUntilFundsLocked > now) require(address(this).balance.SUB445(amount) > fundsLockedtoWithdraw);
        owner.transfer(amount);
    }

    function LOCKFUNDS14(uint256 amount) public ONLYOWNER149 {	//inject NONSTANDARD NAMING
        // funds lock is active
        if (dateUntilFundsLocked > now) {
            require(amount > fundsLockedtoWithdraw);
        }
        fundsLockedtoWithdraw = amount;
        dateUntilFundsLocked = now + 30 days;
    }

    function CHANGEOWNERCANDIDATE892(address payable newOwner) public ONLYOWNER149 {	//inject NONSTANDARD NAMING
        newOwnerCandidate = newOwner;
    }

    function ACCEPTOWNER388() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwnerCandidate);
        owner = newOwnerCandidate;
    }

    function CHANGEMINBALANCE100(uint256 newMinBalanceInInteger) public ONLYOWNER149 {	//inject NONSTANDARD NAMING
        MinBalanceVMR = newMinBalanceInInteger * 10**18;
    }

    function BYTESTOADDRESS502(bytes memory bys) private pure returns (address payable addr) {	//inject NONSTANDARD NAMING
        assembly {
            addr := mload(add(bys,20))
        }
    }
    // function for transfer any token from contract
    function TRANSFERTOKENS305 (address token, address target, uint256 amount) ONLYOWNER149 public	//inject NONSTANDARD NAMING
    {
        ERC20Token(token).UNIVERSALTRANSFER27(target, amount);
    }

    function MIGRATEDATAFROMOLDCONTRACT964(address oldAddress, address newAddress) internal	//inject NONSTANDARD NAMING
    {
        if (!migrateDone[oldAddress]) {
            uint256 totalFunds;
            uint256 pendingReward;
            uint256 totalProfit;
            (totalFunds, pendingReward, totalProfit,) = oldContract.GETINFO650(oldAddress);
            if (totalFunds > 0) {
                uint256 lastDatetime = block.timestamp - pendingReward.MUL957(30 days).MUL957(100).DIV239(20).DIV239(totalFunds);
                uint256 totalVMR = investors[newAddress].totalVMR;
                investors[newAddress] = InvestorData(totalFunds, lastDatetime, totalProfit, totalVMR);
            }
            migrateDone[oldAddress] = true;
            if (oldAddress != newAddress) migrateDone[newAddress] = true;
        }
    }

    function GETINFO650(address investor) view public returns (uint256 depositedEth, uint256 pendingEthReward, uint256 totalEthProfit, uint256 contractBalance, uint256 depositedVMR, uint256 minVMR, uint256 pendingVMRReward,	//inject NONSTANDARD NAMING
        uint256 pendingActiveTokenReward, uint256 totalActiveTokenProfit, uint256 activeTokenRate)
    {
        contractBalance = address(this).balance;
        minVMR = individualVMRCup[investor];
        if (minVMR == 0) minVMR = MinBalanceVMR;
        activeTokenRate = VMR_ETH_RATE;

        if (!migrateDone[investor]) {
            (depositedEth, pendingEthReward, totalEthProfit,) = oldContract.GETINFO650(investor);
            depositedVMR = investors[investor].totalVMR;
        } else {
            InvestorData memory data = investors[investor];
            depositedEth = data.funds;
            if (data.funds > 0) pendingEthReward = data.funds.MUL957(20).DIV239(100).MUL957(block.timestamp - data.lastDatetime).DIV239(30 days);
            totalEthProfit = data.totalProfit;
            depositedVMR = data.totalVMR;

            ( , ,pendingVMRReward, pendingActiveTokenReward) = GETINFOEXT554(investor);

            totalActiveTokenProfit = GETUSERPROFITBYTOKEN344(investor, paymentToken);
        }
    }

    function GETUSERPROFITBYTOKEN344(address investor, address token) view public returns(uint256) {	//inject NONSTANDARD NAMING
        return investorsExt[investor].totalProfit[token];
    }

    function GETINFOEXT554(address investor) view public returns (uint256 currentLimitVMR, uint256 currentEffectiveVMR, uint256 rewardVMR, uint256 rewardInActiveToken) {	//inject NONSTANDARD NAMING
        InvestorDataExt memory dataEx = investorsExt[investor];
        InvestorData memory data = investors[investor];
        currentLimitVMR = dataEx.limitVMR != 0 ? dataEx.limitVMR : globalLimitVMR; 
        currentEffectiveVMR = data.totalVMR > currentLimitVMR ? currentLimitVMR : data.totalVMR; 
        rewardVMR = currentEffectiveVMR.MUL957(20).DIV239(100).MUL957(block.timestamp - data.lastDatetime).DIV239(30 days);
        rewardInActiveToken = rewardVMR * VMR_ETH_RATE / 10**18; 
    }

    function SETDEPOSITTOKENS792(address[] calldata userAddress, uint256[] calldata amountTokens) ONLYADMIN733 external {	//inject NONSTANDARD NAMING
        uint256 len = userAddress.length;
        require(len == amountTokens.length);

        for(uint16 i = 0;i < len; i++) {
            InvestorData storage data = investors[userAddress[i]];
            if (data.lastDatetime == 0) data.lastDatetime = block.timestamp;
            data.totalVMR = amountTokens[i];
        }
    }

    function () payable external
    {
        require(msg.sender == tx.origin); // prevent bots to interact with contract

        if (msg.sender == owner) return;

        MIGRATEDATAFROMOLDCONTRACT964(msg.sender, msg.sender);

        InvestorData storage data = investors[msg.sender];

        uint256 minBalanceRequired = individualVMRCup[msg.sender];
        if (minBalanceRequired == 0) minBalanceRequired = MinBalanceVMR;
        require(data.totalVMR >= minBalanceRequired);
        require(data.lastDatetime > 0);
        require(msg.value == 0); 

        if (data.funds != 0 && data.totalProfit < data.funds) {
            // 20% per 30 days
            uint256 reward = data.funds.MUL957(20).DIV239(100).MUL957(block.timestamp - data.lastDatetime).DIV239(30 days);

            if (reward.ADD647(data.totalProfit) > data.funds) {
                if (data.funds > data.totalProfit) {
                    reward = data.funds.SUB445(data.totalProfit);
                } else {
                    reward = 0;
                }
            }

            if (reward > 0) {
                data.totalProfit = data.totalProfit.ADD647(reward); 

                address payable payableUser = address(uint160(msg.sender));
                payableUser.transfer(reward);
            }
        }

        InvestorDataExt storage dataEx = investorsExt[msg.sender];
        uint256 currentLimitVMR = dataEx.limitVMR != 0 ? dataEx.limitVMR : globalLimitVMR; 
        uint256 currentEffectiveVMR = data.totalVMR > currentLimitVMR ? currentLimitVMR : data.totalVMR; 
        uint256 rewardVMR = currentEffectiveVMR.MUL957(20).DIV239(100).MUL957(block.timestamp - data.lastDatetime).DIV239(30 days);
        uint256 rewardInActiveToken = rewardVMR * VMR_ETH_RATE / 10**18; 
        ERC20Token(paymentToken).UNIVERSALTRANSFER27(msg.sender, rewardInActiveToken);
        dataEx.totalProfit[paymentToken] += rewardInActiveToken;

        data.lastDatetime = block.timestamp;
    }
}