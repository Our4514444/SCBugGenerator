                                                                 

pragma solidity ^0.5.16;

                                                                                                                                                                                                                                                                                                                                                                                                                    

library SafeMath {
                                                                                                                                                                                                                             
    function ADD241(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB655(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL331(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV934(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD216(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

contract ERC20 {
    uint public decimals;
    function ALLOWANCE367(address, address) public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF895(address) public view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE749(address, uint) public;	//inject NONSTANDARD NAMING
    function TRANSFER322(address, uint) public returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM911(address, address, uint) public returns (bool);	//inject NONSTANDARD NAMING
}

                                                                    
library Address {
                                                                                                                                                                                                                                                                                                                                                                                                                                         
    function ISCONTRACT802(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER27(ERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN727(token, abi.encodeWithSelector(token.TRANSFER322.selector, to, value));
    }

    function SAFETRANSFERFROM382(ERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN727(token, abi.encodeWithSelector(token.TRANSFERFROM911.selector, from, to, value));
    }

    function SAFEAPPROVE51(ERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.ALLOWANCE367(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN727(token, abi.encodeWithSelector(token.APPROVE749.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE668(ERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE367(address(this), spender).ADD241(value);
        CALLOPTIONALRETURN727(token, abi.encodeWithSelector(token.APPROVE749.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE248(ERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE367(address(this), spender).SUB655(value);
        CALLOPTIONALRETURN727(token, abi.encodeWithSelector(token.APPROVE749.selector, spender, newAllowance));
    }

                                                                                                                                                                                                                                                                                                                                                                                        
     
    function CALLOPTIONALRETURN727(ERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).ISCONTRACT802(), "SafeERC20: call to non-contract");

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

    ERC20 private constant zero_address63 = ERC20(0x0000000000000000000000000000000000000000);	//inject NONSTANDARD NAMING
    ERC20 private constant eth_address943 = ERC20(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);	//inject NONSTANDARD NAMING

    function UNIVERSALTRANSFER251(ERC20 token, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        UNIVERSALTRANSFER251(token, to, amount, false);
    }

    function UNIVERSALTRANSFER251(ERC20 token, address to, uint256 amount, bool mayFail) internal returns(bool) {	//inject NONSTANDARD NAMING
        if (amount == 0) {
            return true;
        }

        if (token == zero_address63 || token == eth_address943) {
            if (mayFail) {
                return address(uint160(to)).send(amount);
            } else {
                address(uint160(to)).transfer(amount);
                return true;
            }
        } else {
            token.SAFETRANSFER27(to, amount);
            return true;
        }
    }

    function UNIVERSALAPPROVE274(ERC20 token, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        if (token != zero_address63 && token != eth_address943) {
            token.SAFEAPPROVE51(to, amount);
        }
    }

    function UNIVERSALTRANSFERFROM640(ERC20 token, address from, address to, uint256 amount) internal {	//inject NONSTANDARD NAMING
        if (amount == 0) {
            return;
        }

        if (token == zero_address63 || token == eth_address943) {
            require(from == msg.sender && msg.value >= amount, "msg.value is zero");
            if (to != address(this)) {
                address(uint160(to)).transfer(amount);
            }
            if (msg.value > amount) {
                msg.sender.transfer(uint256(msg.value).SUB655(amount));
            }
        } else {
            token.SAFETRANSFERFROM382(from, to, amount);
        }
    }

    function UNIVERSALBALANCEOF420(ERC20 token, address who) internal view returns (uint256) {	//inject NONSTANDARD NAMING
        if (token == zero_address63 || token == eth_address943) {
            return who.balance;
        } else {
            return token.BALANCEOF895(who);
        }
    }
}



contract Ownable {
    address payable public owner = msg.sender;
    address payable public newOwnerCandidate;
    
    modifier ONLYOWNER845()	//inject NONSTANDARD NAMING
    {
        assert(msg.sender == owner);
        _;
    }
    
    function CHANGEOWNERCANDIDATE199(address payable newOwner) public ONLYOWNER845 {	//inject NONSTANDARD NAMING
        newOwnerCandidate = newOwner;
    }
    
    function ACCEPTOWNER403() public {	//inject NONSTANDARD NAMING
        require(msg.sender == newOwnerCandidate);
        owner = newOwnerCandidate;
    }
}

contract MLMcrowdfunding is Ownable
{
    using SafeMath for uint256;
    using UniversalERC20 for ERC20;
    
    uint256 minAmountOfEthToBeEffectiveRefferal = 0.1 ether;
    
    function CHANGEMINAMOUNTOFETHTOBEEFFECTIVEREFFERAL353(uint256 minAmount) ONLYOWNER845 public {	//inject NONSTANDARD NAMING
        minAmountOfEthToBeEffectiveRefferal = minAmount;
    }
    
   
    // Withdraw and lock funds 
    uint256 public fundsLockedtoWithdraw;
    uint256 public dateUntilFundsLocked;
    
                                                                                                                                                                                                                                                                                                                                       
    
    function BYTESTOADDRESS570(bytes memory bys) private pure returns (address payable addr) {	//inject NONSTANDARD NAMING
        assembly {
          addr := mload(add(bys,20))
        } 
    }
    
    ERC20 private constant zero_address63 = ERC20(0x0000000000000000000000000000000000000000);	//inject NONSTANDARD NAMING
    ERC20 private constant eth_address943 = ERC20(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);	//inject NONSTANDARD NAMING
    
    // function for transfer any token from contract
    function TRANSFERTOKENS256(ERC20 token, address target, uint256 amount) ONLYOWNER845 public	//inject NONSTANDARD NAMING
    {
        if (target == address(0x0)) target = owner;
        
        if (token == zero_address63 || token == eth_address943) {
            if (dateUntilFundsLocked > now) require(address(this).balance.SUB655(amount) > fundsLockedtoWithdraw);
        }
        ERC20(token).UNIVERSALTRANSFER251(target, amount);
    }
    


    mapping(address => address) refList;
    
    struct UserData {
        uint256 invested;    
        uint256[12] pendingReward;
        uint256 receivedReward;
        uint128 refUserCount;
        uint128 effectiveRefUserCount;
        uint256 createdAt;
        bool partnerRewardActivated;
    }
    mapping(address => UserData) users;
    
    function GETREFBYUSER526(address addr) view public returns (address) {	//inject NONSTANDARD NAMING
        return refList[addr];
    }
    
    function GETUSERINFO84(address addr) view public returns (uint256 invested, uint256[12] memory pendingReward, uint256 receivedReward, uint256 refUserCount, uint128 effectiveRefUserCount, uint256 createdAt, bool partnerRewardActivated) {	//inject NONSTANDARD NAMING
        invested = users[addr].invested;
        pendingReward = users[addr].pendingReward;
        receivedReward = users[addr].receivedReward;
        refUserCount = users[addr].refUserCount;
        effectiveRefUserCount = users[addr].effectiveRefUserCount;
        createdAt = users[addr].createdAt;
        partnerRewardActivated = users[addr].partnerRewardActivated;
    }
    
    //level's 
    

  
    
    uint8 l1 = 10;
    uint8 l2 = 15;
    uint8 l3 = 20;
    uint8 l4_l8 = 1;
    
     function CHANGELEVEL1437( uint8 L1) public  ONLYOWNER845  {	//inject NONSTANDARD NAMING
        l1 = L1;
    } 
    
    function CHANGELEVEL2266( uint8 L2) public ONLYOWNER845  {	//inject NONSTANDARD NAMING
        l2 = L2;
    } 
    function CHANGELEVEL3397( uint8 L3) public ONLYOWNER845  {	//inject NONSTANDARD NAMING
        l3 = L3;
    } 
    function CHANGELEVELS4_L12489( uint8 L4_L8) public ONLYOWNER845  {	//inject NONSTANDARD NAMING
        l4_l8 = L4_L8;
    } 
    
    
    
    function GETLEVELREWARD657(uint8 level) view internal returns(uint256 rewardLevel, uint128 minUsersRequired) {	//inject NONSTANDARD NAMING
    
   
    
   
    
     if (level == 0) 
            return (l1, 0); 
        else if (level == 1)
            return (l2, 0); 
        else if (level == 2)
            return (l3, 0);
            else if (level < 8)
                return (l4_l8, level);
        else             
            return (0,0);
    }
    
    
    
    event REWARD740(address indexed userAddress, uint256 amount);	//inject NONSTANDARD NAMING
    
    function WITHDRAWREWARD605() public {	//inject NONSTANDARD NAMING
        UserData storage user = users[msg.sender];
        address payable userAddress = msg.sender;
        
        //require(user.invested >= minAmountOfEthToBeEffectiveRefferal);
        
        uint256 reward = 0;
        
        bool isUserUnactive = ((user.createdAt > 0 && (block.timestamp - user.createdAt) >= 365 days) && (user.effectiveRefUserCount < 12));
        
        for(uint8 i = 0; i < 8;i++) {
            // user can't get reward after level 8
            if (i >= 12 && isUserUnactive) break;
            
            uint128 minUsersRequired;
            (, minUsersRequired) = GETLEVELREWARD657(i);
            
            if (user.effectiveRefUserCount >= minUsersRequired) {
                if (user.pendingReward[i] > 0) {
                    reward = reward.ADD241(user.pendingReward[i]);
                    user.pendingReward[i] = 0;
                }
            } else {
                break;
            }
        }
                    
        emit REWARD740(msg.sender, reward);
        user.receivedReward = user.receivedReward.ADD241(reward);
        userAddress.transfer(reward);
    }
   
    function ADDINVESTMENT2122( uint investment, address payable investorAddr) public ONLYOWNER845  {	//inject NONSTANDARD NAMING
        investorAddr.transfer(investment);
    } 
    
    
    function ISUNACTIVEUSER847(UserData memory user ) view internal returns (bool) {	//inject NONSTANDARD NAMING
        return  (user.createdAt > 0 && (block.timestamp - user.createdAt) >= 365 days) && (user.effectiveRefUserCount < 12);
    }
    
    
 
    address payable addressSupportProject = 0x1a08070FFE5695aB0Eb4612640EeC11bf2Cf58eE; //AB
    address payable addressAdv = 0x1Aad1692AeF5743767f33733D64B75031AC9d365; //IL
    address payable addressRes = 0xaE0043FFA867c758C432C81e4FF75F8f1D684A6e; //Project
    address payable addressPV = 0xd6D4D00905aa8caF30Cc31FfB95D9A211cFb5039; //Work
    
    struct PayData {
        uint8 a;
        uint8 b;
        uint8 c;
        uint8 d;
    }
    
    uint8 a = 10;
    uint8 b = 10; 
    uint8 c = 30;
    uint8 d = 10;
    
    
    
    
    
   function CHANGEPROCENTA214( uint8 A) public ONLYOWNER845  {	//inject NONSTANDARD NAMING
        a = A;
    } 
    
    function CHANGEPROCENTB981( uint8 B) public ONLYOWNER845  {	//inject NONSTANDARD NAMING
        b = B;
    } 
    function CHANGEPROCENTC821( uint8 C) public ONLYOWNER845  {	//inject NONSTANDARD NAMING
        c = C;
    } 
    function CHANGEPROCENTD23( uint8 D) public ONLYOWNER845  {	//inject NONSTANDARD NAMING
        d = D;
    } 
    
    
    
   function SETADDRESSSUPPORTPROJECT960(address payable addr ) public ONLYOWNER845 {	//inject NONSTANDARD NAMING
      //   addr.require();
        addressSupportProject = addr;
    }
    
    function SETADDRESSADV458(address payable addr ) public ONLYOWNER845 {	//inject NONSTANDARD NAMING
      //   addr.require();
        addressAdv = addr;
        
    }
    
    function SETADDRESSPV732(address payable addr ) public ONLYOWNER845 {	//inject NONSTANDARD NAMING
      //   addr.require();
        addressPV = addr;
    }

     function SETADDRESSRES428(address payable addr ) public ONLYOWNER845 {	//inject NONSTANDARD NAMING
      //   addr.require();
        addressRes = addr;
    }

    
    
    function () payable external
    {
        assert(msg.sender == tx.origin); // prevent bots to interact with contract
        
        if (msg.sender == owner) return; 
        
        if (msg.value == 0) {
            WITHDRAWREWARD605();
            return;
        }
        
        require(msg.value >= 0.01 ether); 
        
        address payable ref;
        if (refList[msg.sender] != address(0))
        {
           ref = address(uint160(refList[msg.sender]));
         
        } else {
            require(msg.data.length == 20);
            ref = BYTESTOADDRESS570(msg.data);
            assert(ref != msg.sender);
        
            refList[msg.sender] = ref;
        }
        
        
        uint256 ethAmountRest = msg.value;
        
        UserData storage user = users[msg.sender];
        
        // if a new user - increase the number of people involved with the partner
        bool isNewUser = user.createdAt == 0;
        if (isNewUser)  {
            users[ref].refUserCount++;
            user.createdAt = block.timestamp;
        }
        
        user.invested = user.invested.ADD241(msg.value);
        if (!user.partnerRewardActivated && user.invested > minAmountOfEthToBeEffectiveRefferal) {
            user.partnerRewardActivated = true;
            users[ref].effectiveRefUserCount++;
        }
        
        
        for(uint8 i = 0;i < 12;i++) {
            uint256 rewardAmount;
            uint128 minUsersRequired;
            (rewardAmount, minUsersRequired) = GETLEVELREWARD657(i);
            
            uint256 rewardForRef = msg.value * rewardAmount / 100;
            ethAmountRest = ethAmountRest.SUB655(rewardForRef);

            users[ref].pendingReward[minUsersRequired] += rewardForRef;    
            
            ref = address(uint160(refList[address(ref)]));
            if (ref == address(0)) break;
        }
        
        addressSupportProject.transfer(ethAmountRest * a / 100);
        addressAdv.transfer(ethAmountRest * b / 100);
        addressRes.transfer(ethAmountRest * c / 100);
        if (d!=0) addressPV.transfer(ethAmountRest * d / 100);
    
        
        
    }
}