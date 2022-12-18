                                                                 

pragma solidity ^0.5.16;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
contract Initializable {

                                                                             
    bool private initialized;

                                                                                               
    bool private initializing;

                                                                                      
    modifier INITIALIZER109() {	//inject NONSTANDARD NAMING
        require(initializing || ISCONSTRUCTOR415() || !initialized, "Contract instance has already been initialized");

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

                                                                                   
    function ISCONSTRUCTOR415() private view returns (bool) {	//inject NONSTANDARD NAMING
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
    mapping (address => uint256) public balanceOf;
    function TRANSFER396(address _to, uint256 _value) public;	//inject NONSTANDARD NAMING
    function TRANSFERFROM58(address _from, address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
}

library SafeMath {
                                                                                                                                                                                                                             
    function ADD419(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB540(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    uint256 constant wad84 = 10 ** 18;	//inject NONSTANDARD NAMING

    function WDIV489(uint x, uint y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD419(MUL332(x, wad84), y / 2) / y;
    }

    function WMUL840(uint x, uint y) internal pure returns (uint256 z) {	//inject NONSTANDARD NAMING
        z = ADD419(MUL332(x, y), wad84 / 2) / wad84;
    }

                                                                                                                                                                                                                                         
    function MUL332(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV200(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD439(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}
contract OldShareholderVomer {
    function GETINFO18(address investor) view public returns (uint256 totalFunds, uint256 pendingReward, uint256 totalProfit, uint256 contractBalance);	//inject NONSTANDARD NAMING
}

contract Ownable {
    address payable public owner = msg.sender;
    address payable public newOwnerCandidate;

    modifier ONLYOWNER618()	//inject NONSTANDARD NAMING
    {
        assert(msg.sender == owner);
        _;
    }

    function CHANGEOWNERCANDIDATE496(address payable newOwner) public ONLYOWNER618 {	//inject NONSTANDARD NAMING
        newOwnerCandidate = newOwner;
    }

    function ACCEPTOWNER787() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwnerCandidate);
        owner = newOwnerCandidate;
    }
}

contract ShareholderVomer is Initializable
{
    using SafeMath for uint256;

    address payable public owner;
    address payable public newOwnerCandidate;

    uint256 MinBalanceVMR;
    ERC20Token VMR_Token;

    OldShareholderVomer oldContract;

    event CREDIT721(address indexed approvedAddr, address indexed receiver, uint256 amount);	//inject NONSTANDARD NAMING
    event RETURNCREDIT535(address indexed approvedAddr, uint256 amount);	//inject NONSTANDARD NAMING

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

    modifier ONLYOWNER618()	//inject NONSTANDARD NAMING
    {
        assert(msg.sender == owner);
        _;
    }

    modifier ONLYADMIN850()	//inject NONSTANDARD NAMING
    {
        assert(admins[msg.sender]);
        _;
    }

    function INITIALIZE578() INITIALIZER109 public {	//inject NONSTANDARD NAMING
        VMR_Token = ERC20Token(0x063b98a414EAA1D4a5D4fC235a22db1427199024); // testnet 0xa258a452FC38Fc9Fa8A8b03F210346E8390A5D56
        oldContract = OldShareholderVomer(0x9C235ac2C33077A30593A3fd27A0087c687A80A3);
        MinBalanceVMR = 1000 * 10**18;
        migrateDone[0x12A09763eC6e5B7cbc4feb7178db8C91A79E456a] = true;
        migrateDone[0xB7722517f410914fFf62DF357A0c14B88EFb9369] = true;
        owner = msg.sender;
        paymentToken = address(0);
    }

    function GETPAYMENTINFO468() view public returns (address token, uint256 rate) {	//inject NONSTANDARD NAMING
        token = paymentToken;
        rate = VMR_ETH_RATE;
    }

    function UPDATEPAYMENTMODE21(address newPaymantMode, uint256 newRate) ONLYOWNER618 public {	//inject NONSTANDARD NAMING
        require(newPaymantMode == address(0) || newPaymantMode == address(VMR_Token));
        paymentToken = newPaymantMode;
        if (newRate != 0) VMR_ETH_RATE = newRate;
        require(VMR_ETH_RATE != 0);
    }

    function SAFEETHTRANSFER816(address target, uint256 amount) internal {	//inject NONSTANDARD NAMING
        address payable payableTarget = address(uint160(target));
        (bool ok, ) = payableTarget.call.value(amount)("");
        require(ok);
    }

    function TAKEETH755(address targetAddr, uint256 amount) public {	//inject NONSTANDARD NAMING
        if (targetAddr == address(0)) targetAddr = msg.sender;

        Partner storage data = partners[msg.sender];

        require(data.maxCredit + data.balance > 0);
        require(uint256(data.maxCredit + data.balance) >= amount);

        data.balance -= int256(amount);

        SAFEETHTRANSFER816(targetAddr, amount);
        emit CREDIT721(msg.sender, targetAddr, amount);
    }

    function GETPARTNERINFO893(address addressPartner) view public returns (int256 maxCredit, int256 balance) {	//inject NONSTANDARD NAMING
        maxCredit = partners[addressPartner].maxCredit;
        balance = partners[addressPartner].balance;
    }

    function GIVEBACKETH8() payable public {	//inject NONSTANDARD NAMING
        Partner storage data = partners[msg.sender];
        if (data.maxCredit > 0) {
            data.balance += int256(msg.value);
        }
        emit RETURNCREDIT535(msg.sender, msg.value);
    }

    function SETPARTNERCONTRACT697(address addr, int256 maxCredit) ONLYOWNER618 public {	//inject NONSTANDARD NAMING
        require(maxCredit >= 0);
        Partner storage data = partners[addr];
        data.maxCredit = maxCredit;
    }

    function SETADMIN639(address newAdmin, bool activate) ONLYOWNER618 public {	//inject NONSTANDARD NAMING
        admins[newAdmin] = activate;
    }

    // set amount to 0 to disable individual cup
    function CHANGEINDIVIDUALVMRCUP427(address userAddress, uint256 minAmount) ONLYOWNER618 public {	//inject NONSTANDARD NAMING
        individualVMRCup[userAddress] = minAmount * 10**18;
    }

    uint256 public fundsLockedtoWithdraw;
    uint256 public dateUntilFundsLocked;

    function WITHDRAW856(uint256 amount)  public ONLYOWNER618 {	//inject NONSTANDARD NAMING
        if (dateUntilFundsLocked > now) require(address(this).balance.SUB540(amount) > fundsLockedtoWithdraw);
        owner.transfer(amount);
    }

    function LOCKFUNDS700(uint256 amount) public ONLYOWNER618 {	//inject NONSTANDARD NAMING
        // funds lock is active
        if (dateUntilFundsLocked > now) {
            require(amount > fundsLockedtoWithdraw);
        }
        fundsLockedtoWithdraw = amount;
        dateUntilFundsLocked = now + 30 days;
    }

    function CHANGEOWNERCANDIDATE496(address payable newOwner) public ONLYOWNER618 {	//inject NONSTANDARD NAMING
        newOwnerCandidate = newOwner;
    }

    function ACCEPTOWNER787() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwnerCandidate);
        owner = newOwnerCandidate;
    }

    function CHANGEMINBALANCE602(uint256 newMinBalance) public ONLYOWNER618 {	//inject NONSTANDARD NAMING
        MinBalanceVMR = newMinBalance * 10**18;
    }

    function BYTESTOADDRESS856(bytes memory bys) private pure returns (address payable addr) {	//inject NONSTANDARD NAMING
        assembly {
            addr := mload(add(bys,20))
        }
    }
    // function for transfer any token from contract
    function TRANSFERTOKENS740 (address token, address target, uint256 amount) ONLYOWNER618 public	//inject NONSTANDARD NAMING
    {
        ERC20Token(token).TRANSFER396(target, amount);
    }

    function MIGRATEDATAFROMOLDCONTRACT605(address oldAddress, address newAddress) internal	//inject NONSTANDARD NAMING
    {
        if (!migrateDone[oldAddress]) {
            uint256 totalFunds;
            uint256 pendingReward;
            uint256 totalProfit;
            (totalFunds, pendingReward, totalProfit,) = oldContract.GETINFO18(oldAddress);
            if (totalFunds > 0) {
                uint256 lastDatetime = block.timestamp - pendingReward.MUL332(30 days).MUL332(100).DIV200(20).DIV200(totalFunds);
                uint256 totalVMR = investors[newAddress].totalVMR;
                investors[newAddress] = InvestorData(totalFunds, lastDatetime, totalProfit, totalVMR);
            }
            migrateDone[oldAddress] = true;
            if (oldAddress != newAddress) migrateDone[newAddress] = true;
        }
    }

    function GETINFO18(address investor) view public returns (uint256 totalFunds, uint256 pendingReward, uint256 totalProfit, uint256 contractBalance, uint256 totalVMR, uint256 minVMR)	//inject NONSTANDARD NAMING
    {
        contractBalance = address(this).balance;
        minVMR = individualVMRCup[investor];
        if (minVMR == 0) minVMR = MinBalanceVMR;
        
        if (!migrateDone[investor]) {
            (totalFunds, pendingReward, totalProfit,) = oldContract.GETINFO18(investor);
            totalVMR = investors[investor].totalVMR;
        } else {
            InvestorData memory data = investors[investor];
            totalFunds = data.funds;
            if (data.funds > 0) pendingReward = data.funds.MUL332(20).DIV200(100).MUL332(block.timestamp - data.lastDatetime).DIV200(30 days);
            totalProfit = data.totalProfit;
            totalVMR = data.totalVMR;
        }

    }

    function SETDEPOSITTOKENS813(address[] calldata userAddress, uint256[] calldata amountTokens) ONLYADMIN850 external {	//inject NONSTANDARD NAMING
        uint256 len = userAddress.length;
        require(len == amountTokens.length);

        for(uint16 i = 0;i < len; i++) {
            investors[userAddress[i]].totalVMR = amountTokens[i];
        }
    }

    function () payable external
    {
        require(msg.sender == tx.origin); // prevent bots to interact with contract

        if (msg.sender == owner) return;

        MIGRATEDATAFROMOLDCONTRACT605(msg.sender, msg.sender);

        InvestorData storage data = investors[msg.sender];
        
        require(data.totalProfit < data.funds.ADD419(msg.value.MUL332(70).DIV200(100)));

        uint256 minBalanceRequired = individualVMRCup[msg.sender];
        if (minBalanceRequired == 0) minBalanceRequired = MinBalanceVMR;
        require(data.totalVMR >= minBalanceRequired);

        if (msg.value > 0)
        {
            // first investment at least 2 ether, all next at least 0.01 ether
            require(msg.value >= 2 ether || (data.funds != 0 && msg.value >= 0.01 ether));
            if (msg.data.length == 20) {
                address payable ref = BYTESTOADDRESS856(msg.data);
                require(ref != msg.sender);
                ref.transfer(msg.value.MUL332(25).DIV200(100));   // 25%
                owner.transfer(msg.value.MUL332(5).DIV200(100));  // 5%
            } else if (msg.data.length == 0) {
                owner.transfer(msg.value.MUL332(30).DIV200(100));
            } else {
                require(false); // invalid memo
            }
        }

        if (data.funds != 0) {
            // 20% per 30 days
            uint256 reward = data.funds.MUL332(20).DIV200(100).MUL332(block.timestamp - data.lastDatetime).DIV200(30 days);
            
            if (reward.ADD419(data.totalProfit) > data.funds) {
                if (data.funds > data.totalProfit) {
                    reward = data.funds.SUB540(data.totalProfit);
                } else {
                    reward = 0;
                }
            }
            data.totalProfit = data.totalProfit.ADD419(reward);

            if (paymentToken == address(0)) {
                address payable payableUser = address(uint160(msg.sender));
                payableUser.transfer(reward);
            } else if (paymentToken == address(VMR_Token)) {
                VMR_Token.TRANSFER396(msg.sender, reward.WMUL840(VMR_ETH_RATE));
            } else {
                require(false);
            }
        }

        data.lastDatetime = block.timestamp;
        data.funds = data.funds.ADD419(msg.value.MUL332(70).DIV200(100));

    }
}