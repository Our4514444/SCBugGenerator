                                                                 

pragma solidity ^0.5.7;

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

contract ERC20Token
{
    mapping (address => uint256) public balanceOf;
    function TRANSFER170(address _to, uint256 _value) public;	//inject NONSTANDARD NAMING
}

library SafeMath {
                                                                                                                                                                                                                             
    function ADD823(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

                                                                                                                                                                                                                                                                 
    function SUB721(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

                                                                                                                                                                                                                                         
    function MUL482(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DIV365(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function MOD143(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

contract RewardVomer20
{
    using SafeMath for uint256;
    
    address payable public owner = 0xFb7aCa19BA5E01a410f6f864fb6b9e87CEb84548;
    
    uint256 minBalance = 100;
    ERC20Token VMR_Token = ERC20Token(0x063b98a414EAA1D4a5D4fC235a22db1427199024);
    
    struct InvestorData {
        uint256 funds;
        uint256 lastDatetime;
        uint256 totalProfit;
    }
    mapping (address => InvestorData) investors;
    
    modifier ONLYOWNER649()	//inject NONSTANDARD NAMING
    {
        assert(msg.sender == owner);
        _;
    }
    
    function WITHDRAW951(uint256 amount)  public ONLYOWNER649 {	//inject NONSTANDARD NAMING
        owner.transfer(amount);
    }
    
    function CHANGEOWNER151(address payable newOwner) public ONLYOWNER649 {	//inject NONSTANDARD NAMING
        owner = newOwner;
    }
    
    function CHANGEMINBALANCE665(uint256 newMinBalance) public ONLYOWNER649 {	//inject NONSTANDARD NAMING
        minBalance = newMinBalance;
    }
    
    function BYTESTOADDRESS229(bytes memory bys) private pure returns (address payable addr) {	//inject NONSTANDARD NAMING
        assembly {
          addr := mload(add(bys,20))
        } 
    }
    // function for transfer any token from contract
    function TRANSFERTOKENS478 (address token, address target, uint256 amount) ONLYOWNER649 public	//inject NONSTANDARD NAMING
    {
        ERC20Token(token).TRANSFER170(target, amount);
    }
    
    function GETINFO68(address investor) view public returns (uint256 totalFunds, uint256 pendingReward, uint256 totalProfit, uint256 contractBalance)	//inject NONSTANDARD NAMING
    {
        InvestorData memory data = investors[investor];
        totalFunds = data.funds;
        if (data.funds > 0) pendingReward = data.funds.MUL482(20).DIV365(100).MUL482(block.timestamp - data.lastDatetime).DIV365(30 days);
        totalProfit = data.totalProfit;
        contractBalance = address(this).balance;
    }
    
    function() payable external
    {
        assert(msg.sender == tx.origin); // prevent bots to interact with contract
        
        if (msg.sender == owner) return;
        
        assert(VMR_Token.balanceOf(msg.sender) >= minBalance * 10**18);
        
        
        InvestorData storage data = investors[msg.sender];
        
        if (msg.value > 0)
        {
            // first investment at least 2 ether, all next at least 0.01 ether
            assert(msg.value >= 0.2 ether || (data.funds != 0 && msg.value >= 0.01 ether));
            if (msg.data.length == 20) {
                address payable ref = BYTESTOADDRESS229(msg.data);
                assert(ref != msg.sender);
                ref.transfer(msg.value.MUL482(10).DIV365(100));   // 10%
                owner.transfer(msg.value.MUL482(5).DIV365(100));  // 5%
            } else if (msg.data.length == 0) {
                owner.transfer(msg.value.MUL482(15).DIV365(100));
            } else {
                assert(false); // invalid memo
            }
        }
        
        
        if (data.funds != 0) {
            // 20% per 30 days
            uint256 reward = data.funds.MUL482(20).DIV365(100).MUL482(block.timestamp - data.lastDatetime).DIV365(30 days);
            data.totalProfit = data.totalProfit.ADD823(reward);
            
            address(msg.sender).transfer(reward);
        }

        data.lastDatetime = block.timestamp;
        data.funds = data.funds.ADD823(msg.value.MUL482(85).DIV365(100));
        
    }
}