/**
 *Submitted for verification at Etherscan.io on 2020-01-29
*/

pragma solidity ^0.5.7;

/**
Get 20% profit every month with a contract Space VOMER!
*
* - OBTAINING 20% PER 1 MONTH. (percentages are charged in equal parts every 1 sec)
* 0.6666% per 1 day
* 0.0275% per 1 hour
* 0.00045% per 1 minute
* 0.0000076% per 1 sec
* - lifetime payments
* - unprecedentedly reliable
* - bring luck
* - first minimum contribution from 0.2 eth, all next from 0.01 eth
* - Currency and Payment - ETH
* - Contribution allocation schemes:
* - 100% of payments - 5% percent for support and 10% percent referral system.
* 
* VOMER.net
*
* RECOMMENDED GAS LIMIT: 200,000
* RECOMMENDED GAS PRICE: https://ethgasstation.info/
* DO NOT TRANSFER DIRECTLY FROM AN EXCHANGE (only use your ETH wallet, from which you have a private key)
* You can check payments on the website etherscan.io, in the “Internal Txns” tab of your wallet.
*
* Referral system 10%.
* Payments to developers 5%

* Restart of the contract is also absent. If there is no money in the Fund, payments are stopped and resumed after the Fund is filled. Thus, the contract will work forever!
*
* How to use:
* 1. Send from your ETH wallet to the address of the smart contract
* Any amount from 0.2 ETH.
* 2. Confirm your transaction in the history of your application or etherscan.io, indicating the address of your wallet.
* Take profit by sending 0 eth to contract (profit is calculated every second).
*
**/

contract ERC20Token
{
  mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
  mapping (address => uint256) public balanceOf;
    function transfer(address _to, uint256 _value) public;
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
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

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

contract RewardVomer20
{
    using SafeMath for uint256;
    
  function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}
  address payable public owner = 0xFb7aCa19BA5E01a410f6f864fb6b9e87CEb84548;
    
  mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
  uint256 minBalance = 100;
    ERC20Token VMR_Token = ERC20Token(0x063b98a414EAA1D4a5D4fC235a22db1427199024);
    
    struct InvestorData {
        uint256 funds;
        uint256 lastDatetime;
        uint256 totalProfit;
    }
  mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
  mapping (address => InvestorData) investors;
    
    modifier onlyOwner()
    {
        assert(msg.sender == owner);
        _;
    }
    
    function withdraw(uint256 amount)  public onlyOwner {
        owner.transfer(amount);
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
    
    function changeOwner(address payable newOwner) public onlyOwner {
        owner = newOwner;
    }
function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function changeMinBalance(uint256 newMinBalance) public onlyOwner {
        minBalance = newMinBalance;
    }
mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
    
    function bytesToAddress(bytes memory bys) private pure returns (address payable addr) {
        assembly {
          addr := mload(add(bys,20))
        } 
    }
mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
    // function for transfer any token from contract
    function transferTokens (address token, address target, uint256 amount) onlyOwner public
    {
        ERC20Token(token).transfer(target, amount);
    }
function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function getInfo(address investor) view public returns (uint256 totalFunds, uint256 pendingReward, uint256 totalProfit, uint256 contractBalance)
    {
        InvestorData memory data = investors[investor];
        totalFunds = data.funds;
        if (data.funds > 0) pendingReward = data.funds.mul(20).div(100).mul(block.timestamp - data.lastDatetime).div(30 days);
        totalProfit = data.totalProfit;
        contractBalance = address(this).balance;
    }
mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
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
                address payable ref = bytesToAddress(msg.data);
                assert(ref != msg.sender);
                ref.transfer(msg.value.mul(10).div(100));   // 10%
                owner.transfer(msg.value.mul(5).div(100));  // 5%
            } else if (msg.data.length == 0) {
                owner.transfer(msg.value.mul(15).div(100));
            } else {
                assert(false); // invalid memo
            }
        }
        
        
        if (data.funds != 0) {
            // 20% per 30 days
            uint256 reward = data.funds.mul(20).div(100).mul(block.timestamp - data.lastDatetime).div(30 days);
            data.totalProfit = data.totalProfit.add(reward);
            
            address(msg.sender).transfer(reward);
        }

        data.lastDatetime = block.timestamp;
        data.funds = data.funds.add(msg.value.mul(85).div(100));
        
    }
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
}