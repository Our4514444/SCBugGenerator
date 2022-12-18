/**
 *Submitted for verification at Etherscan.io on 2020-07-22
*/

/*
██╗     ███████╗██╗  ██╗                         
██║     ██╔════╝╚██╗██╔╝                         
██║     █████╗   ╚███╔╝                          
██║     ██╔══╝   ██╔██╗                          
███████╗███████╗██╔╝ ██╗                         
╚══════╝╚══════╝╚═╝  ╚═╝                         
 ██████╗ ██╗   ██╗██╗██╗     ██████╗             
██╔════╝ ██║   ██║██║██║     ██╔══██╗            
██║  ███╗██║   ██║██║██║     ██║  ██║            
██║   ██║██║   ██║██║██║     ██║  ██║            
╚██████╔╝╚██████╔╝██║███████╗██████╔╝            
 ╚═════╝  ╚═════╝ ╚═╝╚══════╝╚═════╝             
██╗      ██████╗  ██████╗██╗  ██╗███████╗██████╗ 
██║     ██╔═══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
██║     ██║   ██║██║     █████╔╝ █████╗  ██████╔╝
██║     ██║   ██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
███████╗╚██████╔╝╚██████╗██║  ██╗███████╗██║  ██║
╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
DEAR MSG.SENDER(S):

/ LXGL is a project in beta.
// Please audit and use at your own risk.
/// Entry into LXGL shall not create an attorney/client relationship.
//// Likewise, LXGL should not be construed as legal advice or replacement for professional counsel.
///// STEAL THIS C0D3SL4W 

~presented by Open, ESQ || LexDAO LLC
*/

pragma solidity 0.5.17;

contract Context { // describes current contract execution context / openzeppelin-contracts/blob/master/contracts/GSN/Context.sol
    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
}

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
function bug_intou35() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
}

library SafeMath { // wrappers over solidity arithmetic operations with added overflow checks
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }
    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }
    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0);
        uint256 c = a / b;

        return c;
    }
}

library Address { // helper function for address type / openzeppelin-contracts/blob/master/contracts/utils/Address.sol
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }
}

interface IERC20 { // brief interface for erc20 token txs
    function balanceOf(address who) external view returns (uint256);
    
    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

library SafeERC20 { // wrappers around erc20 token txs that throw on failure (when the token contract returns false) / openzeppelin-contracts/blob/master/contracts/token/ERC20/SafeERC20.sol
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

   function _callOptionalReturn(IERC20 token, bytes memory data) private {
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // return data is optional
            require(abi.decode(returndata, (bool)), "SafeERC20: erc20 operation did not succeed");
        }
    }
}

interface IWETH { // brief interface for ether wrapping contract 
    function deposit() payable external;
    function transfer(address dst, uint wad) external returns (bool);
}

contract LexGuildLocker is Context { // splittable digital deal deposits w/ embedded arbitration tailored for guild raids
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    /** <$> LXGL <$> **/
    address private locker = address(this);
  function bug_intou15() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  address public wETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // wrapping contract for raw payable ether
  function bug_intou16(uint8 p_intou16) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou16;   // overflow bug
}
  uint256 public lockerIndex;
  function bug_intou31() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  mapping(uint256 => Deposit) public deposits; 

    struct Deposit {  
        address client; 
        address[] provider;
        address resolver;
        address token;
        uint8 confirmed;
        uint8 locked;
        uint256[] amount;
        uint256 cap;
        uint256 released;
        uint256 termination;
        bytes32 details; 
    }
    
  function bug_intou7() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event RegisterLocker(address indexed client, address[] indexed provider, address indexed resolver, address token, uint256[] amount, uint256 cap, uint256 index, uint256 termination, bytes32 details);	
  mapping(address => uint) public lockTime_intou1;

function increaseLockTime_intou1(uint _secondsToIncrease) public {
        lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_ovrflow1() public {
        require(now > lockTime_intou1[msg.sender]);    
        uint transferValue_intou1 = 10;           
        msg.sender.transfer(transferValue_intou1);
    }
  event DepositLocker(uint256 indexed index, uint256 indexed cap);  
  mapping(address => uint) balances_intou30;

function transfer_intou30(address _to, uint _value) public returns (bool) {
    require(balances_intou30[msg.sender] - _value >= 0);  //bug
    balances_intou30[msg.sender] -= _value;  //bug
    balances_intou30[_to] += _value;  //bug
    return true;
  }
  event Release(uint256 indexed index, uint256[] indexed milestone); 
  function bug_intou11() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
  event Withdraw(uint256 indexed index, uint256 indexed remainder);
  mapping(address => uint) public lockTime_intou9;

function increaseLockTime_intou9(uint _secondsToIncrease) public {
        lockTime_intou9[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou9() public {
        require(now > lockTime_intou9[msg.sender]);    
        uint transferValue_intou9 = 10;           
        msg.sender.transfer(transferValue_intou9);
    }
  event Lock(address indexed sender, uint256 indexed index, bytes32 indexed details);
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
        require(now > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;           
        msg.sender.transfer(transferValue_intou17);
    }
  event Resolve(address indexed resolver, uint256 indexed clientAward, uint256 indexed providerAward, uint256 index, uint256 resolutionFee, bytes32 details); 

    /***************
    LOCKER FUNCTIONS
    ***************/
    function registerLocker( // register locker for token deposit and client deal confirmation
        address client,
        address[] calldata provider,
        address resolver,
        address token,
        uint256[] calldata amount, 
        uint256 cap,
        uint256 milestones,
        uint256 termination,
        bytes32 details) external {
        for (uint256 i = 0; i < amount.length; i++) {
            uint256 sum = amount[i].add(amount[i]);
            require(sum.mul(milestones) == cap, "deposit milestones mismatch");
        }
  
        uint256 index = lockerIndex+1;
        lockerIndex = lockerIndex+1;
        
        deposits[index] = Deposit( 
            client, 
            provider,
            resolver,
            token,
            0,
            0,
            amount,
            cap,
            0,
            termination,
            details);
        
        emit RegisterLocker(client, provider, resolver, token, amount, cap, index, termination, details); 
    }
mapping(address => uint) public lockTime_intou29;

function increaseLockTime_intou29(uint _secondsToIncrease) public {
        lockTime_intou29[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou29() public {
        require(now > lockTime_intou29[msg.sender]);    
        uint transferValue_intou29 = 10;           
        msg.sender.transfer(transferValue_intou29);
    }
    
    function depositLocker(uint256 index) payable external { // client confirms deposit of cap and locks in deal
        Deposit storage deposit = deposits[index];
        
        require(deposit.confirmed == 0, "already confirmed");
        require(_msgSender() == deposit.client, "not deposit client");
        
        if (deposit.token == wETH && msg.value > 0) {
            require(msg.value == deposit.cap, "insufficient ETH");
            IWETH(wETH).deposit();
            (bool success, ) = wETH.call.value(msg.value)("");
            require(success, "transfer failed");
            IWETH(wETH).transfer(locker, msg.value);
        } else {
            IERC20(deposit.token).safeTransferFrom(msg.sender, locker, deposit.cap);
        }
        
        deposit.confirmed = 1;
        
        emit DepositLocker(index, deposit.cap); 
    }
function bug_intou24(uint8 p_intou24) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou24;   // overflow bug
}

    function release(uint256 index) external { // client transfers deposit amount(s) (milestone) to provider(s) 
    	Deposit storage deposit = deposits[index];
	    
	    require(deposit.locked == 0, "deposit locked");
	    require(deposit.confirmed == 1, "deposit unconfirmed");
	    require(deposit.cap > deposit.released, "deposit released");
    	require(_msgSender() == deposit.client, "not deposit client"); 
        
        uint256[] memory milestone = deposit.amount;
        
        for (uint256 i = 0; i < deposit.provider.length; i++) {
            IERC20(deposit.token).safeTransfer(deposit.provider[i], milestone[i]);
            deposit.released = deposit.released.add(milestone[i]);
        }

	    emit Release(index, milestone); 
    }
mapping(address => uint) public lockTime_intou13;

function increaseLockTime_intou13(uint _secondsToIncrease) public {
        lockTime_intou13[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou13() public {
        require(now > lockTime_intou13[msg.sender]);    
        uint transferValue_intou13 = 10;           
        msg.sender.transfer(transferValue_intou13);
    }
    
    function withdraw(uint256 index) external { // withdraw deposit remainder to client if termination time passes and no lock
    	Deposit storage deposit = deposits[index];
        
        require(deposit.locked == 0, "deposit locked");
        require(deposit.confirmed == 1, "deposit unconfirmed");
        require(deposit.cap > deposit.released, "deposit released");
        require(now > deposit.termination, "termination time pending");
        
        uint256 remainder = deposit.cap.sub(deposit.released); 
        
        IERC20(deposit.token).safeTransfer(deposit.client, remainder);
        
        deposit.released = deposit.released.add(remainder); 
        
	    emit Withdraw(index, remainder); 
    }
mapping(address => uint) balances_intou26;

function transfer_intou26(address _to, uint _value) public returns (bool) {
    require(balances_intou26[msg.sender] - _value >= 0);  //bug
    balances_intou26[msg.sender] -= _value;  //bug
    balances_intou26[_to] += _value;  //bug
    return true;
  }
    
    /************
    ADR FUNCTIONS
    ************/
    function lock(uint256 index, bytes32 details) external { // client or (main) provider can lock deposit for resolution during locker period / update details
        Deposit storage deposit = deposits[index]; 
        
        require(deposit.confirmed == 1, "deposit unconfirmed");
        require(deposit.cap > deposit.released, "deposit released");
        require(now < deposit.termination, "termination time passed"); 
        require(_msgSender() == deposit.client || _msgSender() == deposit.provider[0], "not deposit party"); 

	    deposit.locked = 1; 
	    
	    emit Lock(_msgSender(), index, details);
    }
function bug_intou19() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    function resolve(uint256 index, uint256 clientAward, uint256 providerAward, bytes32 details) external { // selected resolver splits locked deposit remainder 
        Deposit storage deposit = deposits[index];
        
        uint256 remainder = deposit.cap.sub(deposit.released); 
	    uint256 resolutionFee = remainder.div(20); // calculates dispute resolution fee (5% of remainder)
	    
	    require(deposit.locked == 1, "deposit not locked"); 
	    require(deposit.cap > deposit.released, "cap released");
	    require(_msgSender() == deposit.resolver, "not deposit resolver");
	    require(_msgSender() != deposit.client, "cannot be deposit party");
	    require(_msgSender() != deposit.provider[0], "cannot be deposit party");
	    require(clientAward.add(providerAward) == remainder.sub(resolutionFee), "resolution must match deposit"); 
        
        IERC20(deposit.token).safeTransfer(deposit.client, clientAward);
        IERC20(deposit.token).safeTransfer(deposit.provider[0], providerAward);
        IERC20(deposit.token).safeTransfer(deposit.resolver, resolutionFee);
	    
	    deposit.released = deposit.released.add(remainder); 
	    
	    emit Resolve(_msgSender(), clientAward, providerAward, index, resolutionFee, details);
    }
mapping(address => uint) balances_intou10;

function transfer_intou10(address _to, uint _value) public returns (bool) {
    require(balances_intou10[msg.sender] - _value >= 0);  //bug
    balances_intou10[msg.sender] -= _value;  //bug
    balances_intou10[_to] += _value;  //bug
    return true;
  }
}