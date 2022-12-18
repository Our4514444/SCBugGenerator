                                                                 

pragma solidity ^0.5.16;

library SafeMath {
                                                                                                                                                                                                                             
    function ADD645(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB467(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL899(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV905(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD0(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

contract ERC20 {
    uint public decimals;
    function ALLOWANCE720(address, address) public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF650(address) public view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE825(address, uint) public;	//inject NONSTANDARD NAMING
    function TRANSFER338(address, uint) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM518(address, address, uint) public returns (bool);	//inject NONSTANDARD NAMING
}

                                                                    
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT482(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER683(ERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN163(token, abi.encodeWithSelector(token.TRANSFER338.selector, to, value));
    }

    function SAFETRANSFERFROM222(ERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN163(token, abi.encodeWithSelector(token.TRANSFERFROM518.selector, from, to, value));
    }

    function SAFEAPPROVE647(ERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE720(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN163(token, abi.encodeWithSelector(token.APPROVE825.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE971(ERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE720(address(this), spender).ADD645(value);
        CALLOPTIONALRETURN163(token, abi.encodeWithSelector(token.APPROVE825.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE177(ERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE720(address(this), spender).SUB467(value);
        CALLOPTIONALRETURN163(token, abi.encodeWithSelector(token.APPROVE825.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
    function CALLOPTIONALRETURN163(ERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT482(), "SafeERC20: call to non-contract");

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
    using SafeERC20 for ERC20;

    ERC20 private constant zero_address275 = ERC20(0x0000000000000000000000000000000000000000);	//inject NONSTANDARD NAMING
    ERC20 private constant eth_address814 = ERC20(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);	//inject NONSTANDARD NAMING

    function UNIVERSALTRANSFER253(ERC20 token, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        UNIVERSALTRANSFER253(token, to, amount, false);
    }

    function UNIVERSALTRANSFER253(ERC20 token, address to, uint256 amount, bool mayFail) internal returns(bool) {	//inject NONSTANDARD NAMING
        if (amount == 0) {
            return true;
        }

        if (token == zero_address275 || token == eth_address814) {
            if (mayFail) {
                return address(uint160(to)).send(amount);
            } else {
                address(uint160(to)).transfer(amount);
                return true;
            }
        } else {
            token.SAFETRANSFER683(to, amount);
            return true;
        }
    }

    function UNIVERSALAPPROVE987(ERC20 token, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        if (token != zero_address275 && token != eth_address814) {
            token.SAFEAPPROVE647(to, amount);
        }
    }

    function UNIVERSALTRANSFERFROM118(ERC20 token, address from, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        if (amount == 0) {
            return;
        }

        if (token == zero_address275 || token == eth_address814) {
            require(from == msg.sender && msg.value >= amount, "msg.value is zero");
            if (to != address(this)) {
                address(uint160(to)).transfer(amount);
            }
            if (msg.value > amount) {
                msg.sender.transfer(uint256(msg.value).SUB467(amount));
            }
        } else {
            token.SAFETRANSFERFROM222(from, to, amount);
        }
    }

    function UNIVERSALBALANCEOF808(ERC20 token, address who) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        if (token == zero_address275 || token == eth_address814) {
            return who.balance;
        } else {
            return token.BALANCEOF650(who);
        }
    }
}

contract ERC20Token
{
    mapping (address => uint256) public balanceOf;
    function TRANSFER338(address _to, uint256 _value) public;	//inject NONSTANDARD NAMING
    function TRANSFERFROM518(address _from, address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
}

contract ShareholderVomer 
{
    function TAKEETH993(address targetAddr, uint256 amount) public;	//inject NONSTANDARD NAMING
    function GIVEBACKETH535() payable public;	//inject NONSTANDARD NAMING
}
    
contract VomerPartner
{
    using SafeMath for uint256;

    address payable public owner;
    address payable public newOwnerCandidate;

    uint256 MinBalanceVMR;
    ERC20Token VMR_Token;
    
    ShareholderVomer partnerContract;
    address payable supportAddress;

    struct InvestorData {
        uint256 funds;
        uint256 lastDatetime;
        uint256 totalProfit;
        uint256 totalVMR;
        uint256 pendingReward;
        // Partner info
        uint256 totalReferralProfit;
        uint256 pendingReferralReward;
    }
    mapping (address => InvestorData) investors;
    
    mapping(address => address) refList;

    mapping(address => bool) public admins;

    modifier ONLYOWNER320()	//inject NONSTANDARD NAMING
    {
        assert(msg.sender == owner);
        _;
    }

    modifier ONLYADMINOROWNER1000()	//inject NONSTANDARD NAMING
    {
        require(admins[msg.sender] || msg.sender == owner);
        _;
    }

    event REWARD526(address indexed userAddress, uint256 amount);	//inject NONSTANDARD NAMING
    event REFERRALREWARD873(address indexed userAddress, uint256 amount);	//inject NONSTANDARD NAMING
    
    constructor() public {
        VMR_Token = ERC20Token(0x063b98a414EAA1D4a5D4fC235a22db1427199024); 
        partnerContract = ShareholderVomer(0xE1f5c6FD86628E299955a84f44E2DFCA47aAaaa4);
        MinBalanceVMR = 0;
        supportAddress = 0x4B7b1878338251874Ad8Dace56D198e31278676d;
        newOwnerCandidate = 0x4B7b1878338251874Ad8Dace56D198e31278676d;
        owner = msg.sender;
        admins[0x6Ecb917AfD0611F8Ab161f992a12c82e29dc533c] = true;
    }

    function CHANGESUPPORTADDRESS588(address newSupportAddress) ONLYOWNER320 public 	//inject NONSTANDARD NAMING
    {
        require(newSupportAddress != address(0));
        supportAddress = address(uint160(newSupportAddress));
    }
    
    function SAFEETHTRANSFER279(address target, uint256 amount) internal {	//inject NONSTANDARD NAMING
        address payable payableTarget = address(uint160(target));
        (bool ok, ) = payableTarget.call.value(amount)("");
        require(ok, "can't send eth to address");
    }

    function SETADMIN313(address newAdmin, bool activate) ONLYOWNER320 public {	//inject NONSTANDARD NAMING
        admins[newAdmin] = activate;
    }

    uint256 public fundsLockedtoWithdraw;
    uint256 public dateUntilFundsLocked;

    function WITHDRAW279(uint256 amount)  public ONLYOWNER320 {	//inject NONSTANDARD NAMING
        if (dateUntilFundsLocked > now) require(address(this).balance.SUB467(amount) > fundsLockedtoWithdraw);
        owner.transfer(amount);
    }

    function LOCKFUNDS759(uint256 amount) public ONLYOWNER320 {	//inject NONSTANDARD NAMING
        // funds lock is active
        if (dateUntilFundsLocked > now) {
            require(amount > fundsLockedtoWithdraw);
        }
        fundsLockedtoWithdraw = amount;
        dateUntilFundsLocked = now + 30 days;
    }

    function CHANGEOWNERCANDIDATE965(address payable newOwner) public ONLYOWNER320 {	//inject NONSTANDARD NAMING
        newOwnerCandidate = newOwner;
    }

    function ACCEPTOWNER897() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwnerCandidate);
        owner = newOwnerCandidate;
    }

    function CHANGEMINBALANCE962(uint256 newMinBalance) public ONLYOWNER320 {	//inject NONSTANDARD NAMING
        MinBalanceVMR = newMinBalance * 10**18;
    }

    function BYTESTOADDRESS482(bytes memory bys) private pure returns (address payable addr) {	//inject NONSTANDARD NAMING
        assembly {
            addr := mload(add(bys,20))
        }
    }
    // function for transfer any token from contract
    function TRANSFERTOKENS842 (address token, address target, uint256 amount) ONLYOWNER320 public	//inject NONSTANDARD NAMING
    {
        ERC20Token(token).TRANSFER338(target, amount);
    }

    function GETINFO33(address investor) view public returns (uint256 totalFunds, uint256 pendingReward, uint256 totalProfit, uint256 contractBalance, uint256 totalVMR, uint256 minVMR, uint256 totalReferralProfit, uint256 pendingReferralReward)	//inject NONSTANDARD NAMING
    {
        contractBalance = address(this).balance;
        minVMR = MinBalanceVMR;
        InvestorData memory data = investors[investor];
        totalFunds = data.funds;
        if (data.funds > 0) {
            pendingReward = data.pendingReward + data.funds.MUL899(20).DIV905(100).MUL899(block.timestamp - data.lastDatetime).DIV905(30 days);
        }
        totalProfit = data.totalProfit;
        totalVMR = data.totalVMR;
        
        // Referral\partner data
        totalReferralProfit = data.totalReferralProfit;
        pendingReferralReward = data.pendingReferralReward;
    }

    function GETLEVELREWARD661(uint8 level) pure internal returns(uint256 rewardLevel) {	//inject NONSTANDARD NAMING
        if (level == 0) 
            return 5; 
        else if (level == 1)
            return 2; 
        else             
            return 1;
    }
    
    function SETDEPOSITTOKENS688(address[] calldata userAddress, uint256[] calldata amountTokens) ONLYADMINOROWNER1000 external {	//inject NONSTANDARD NAMING
        uint256 len = userAddress.length;
        require(len == amountTokens.length);

        for(uint16 i = 0;i < len; i++) {
            investors[userAddress[i]].totalVMR = amountTokens[i];
        }
    }
    
    function GETREFBYUSER720(address addr) view public returns (address) {	//inject NONSTANDARD NAMING
        return refList[addr];
    }
    
    function WITHDRAWREWARD999(InvestorData storage data) internal {	//inject NONSTANDARD NAMING
        uint256 reward;
        
        require(data.totalVMR >= MinBalanceVMR, "Not enough VMR");
        
        require(data.funds > 0);
        
        // 20% per 30 days
        reward = data.pendingReward + data.funds.MUL899(20).DIV905(100).MUL899(block.timestamp - data.lastDatetime).DIV905(30 days);
        data.pendingReward = 0;
        data.lastDatetime = block.timestamp;

        data.totalProfit = data.totalProfit.ADD645(reward);
        data.totalReferralProfit = data.totalReferralProfit.ADD645(data.pendingReferralReward);
        
        uint256 _pendingReferralReward = data.pendingReferralReward;
        data.pendingReferralReward = 0;
        
        address payable payableUser = address(uint160(msg.sender));
        
        if (reward > 0) {
            partnerContract.TAKEETH993(payableUser, reward);
            emit REWARD526(payableUser, reward);
        }
        
        if (_pendingReferralReward > 0) {
            partnerContract.TAKEETH993(payableUser, _pendingReferralReward);
            emit REFERRALREWARD873(payableUser, _pendingReferralReward);
        }
    }
    
    function () payable external
    {
        if (msg.sender == address(partnerContract)) return;
        
        require(msg.sender == tx.origin); // prevent bots to interact with contract

        if (msg.sender == owner) return;

        InvestorData storage data = investors[msg.sender];
        
        if (msg.value == 0) {
            WITHDRAWREWARD999(data);
            return;
        }
        
        require(msg.value >= 0.1 ether);
        
        address ref;
        if (refList[msg.sender] != address(0))
        {
            ref = refList[msg.sender];
        } else {
            require(msg.data.length == 20, "first interaction with contract should be with referral address");
            ref = BYTESTOADDRESS482(msg.data);
            require(ref != msg.sender, "You can't ref yourself");
        
            refList[msg.sender] = ref;
        }
        
        supportAddress.transfer(msg.value.MUL899(5).DIV905(100));  // 5%
        
        if (data.funds > 0) data.pendingReward += data.funds.MUL899(20).DIV905(100).MUL899(block.timestamp - data.lastDatetime).DIV905(30 days);
        data.lastDatetime = block.timestamp;
        data.funds = data.funds.ADD645(msg.value * 95 / 100); // 95%
        
        partnerContract.GIVEBACKETH535.value(address(this).balance)();
    }
}