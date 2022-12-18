/**
 *Submitted for verification at Etherscan.io on 2020-07-14
*/

/*
██╗     ███████╗██╗  ██╗                         
██║     ██╔════╝╚██╗██╔╝                         
██║     █████╗   ╚███╔╝                          
██║     ██╔══╝   ██╔██╗                          
███████╗███████╗██╔╝ ██╗                         
╚══════╝╚══════╝╚═╝  ╚═╝                         
██╗      ██████╗  ██████╗██╗  ██╗███████╗██████╗ 
██║     ██╔═══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
██║     ██║   ██║██║     █████╔╝ █████╗  ██████╔╝
██║     ██║   ██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
███████╗╚██████╔╝╚██████╗██║  ██╗███████╗██║  ██║
╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
DEAR MSG.SENDER(S):

/ LXL is a project in beta.
// Please audit and use at your own risk.
/// Entry into LXL shall not create an attorney/client relationship.
//// Likewise, LXL should not be construed as legal advice or replacement for professional counsel.
///// STEAL THIS C0D3SL4W 

~presented by Open, ESQ || LexDAO LLC
*/

pragma solidity 0.5.17;

contract Context { // describes current contract execution context / openzeppelin-contracts/blob/master/contracts/GSN/Context.sol
    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
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

contract LexLocker is Context { // digital deal deposits w/ embedded arbitration via lexDAO (lexdao.org)
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    
    /** ADR Wrapper **/
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  address public judgeAccessToken;
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  address public judgmentRewardToken;
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address payable public lexDAO;
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  uint256 public judgeAccessBalance;
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  uint256 public judgmentReward;

    /** <$> LXL <$> **/
    address private locker = address(this);
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  address public wETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // wrapping contract for raw payable ether
  function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint256 public lxl; // index for registered lexlocker
  function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
  mapping(uint256 => Deposit) public deposit; 

    struct Deposit {  
        address client; 
        address provider;
        address token;
        uint8 locked;
        uint256 amount;
        uint256 cap;
        uint256 index;
        uint256 released;
        uint256 termination;
        bytes32 details; 
    }
    	
  function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  event DepositToken(address indexed client, address indexed provider, uint256 indexed index);  
  function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  event Release(uint256 indexed index, uint256 indexed milestone); 
  function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event Withdraw(uint256 indexed index, uint256 indexed remainder);
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event Lock(address indexed sender, uint256 indexed index, bytes32 indexed details);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Resolve(address indexed resolver, uint256 indexed clientAward, uint256 indexed providerAward, uint256 index, bytes32 details); 
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event PayLexDAO(address indexed sender, uint256 indexed payment, bytes32 indexed details);
    
    constructor(
        address _judgeAccessToken, 
        address _judgmentRewardToken, 
        address payable _lexDAO, 
        uint256 _judgeAccessBalance, 
        uint256 _judgmentReward) public { 
        judgeAccessToken = _judgeAccessToken;
        judgmentRewardToken = _judgmentRewardToken;
        lexDAO = _lexDAO;
        judgeAccessBalance = _judgeAccessBalance;
        judgmentReward = _judgmentReward;
    }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    } 
    
    /***************
    LOCKER FUNCTIONS
    ***************/
    function depositToken( // register lexlocker and deposit token 
        address provider,
        address token,
        uint256 amount, 
        uint256 cap,
        uint256 termination,
        bytes32 details) payable external {
        require(amount <= cap, "amount exeeds cap"); 
        
        if (token == wETH && msg.value > 0) {
            require(msg.value == cap, "insufficient ETH");
            IWETH(wETH).deposit();
            (bool success, ) = wETH.call.value(msg.value)("");
            require(success, "transfer failed");
            IWETH(wETH).transfer(locker, msg.value);
        } else {
            IERC20(token).safeTransferFrom(msg.sender, locker, cap);
        }

        uint256 index = lxl+1; // add to registered index
	    lxl += lxl;
                
            deposit[index] = Deposit( 
                _msgSender(), 
                provider,
                token,
                0,
                amount,
                cap,
                index,
                0,
                termination,
                details);
 
        emit DepositToken(_msgSender(), provider, index); 
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    function release(uint256 index) external { // client transfers deposit amount (milestone) to provider
    	Deposit storage depos = deposit[index];
	    
	    require(depos.locked == 0, "deposit locked");
	    require(depos.cap > depos.released, "deposit released");
    	require(_msgSender() == depos.client, "not deposit client"); 
        
        uint256 milestone = depos.amount;  
        
        IERC20(depos.token).safeTransfer(depos.provider, milestone);
        
        depos.released = depos.released.add(milestone);
        
	    emit Release(index, milestone); 
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}
    
    function withdraw(uint256 index) external { // withdraw deposit remainder to client if termination time passes and no lock
    	Deposit storage depos = deposit[index];
        
        require(depos.locked == 0, "deposit locked");
        require(depos.cap > depos.released, "deposit released");
        require(now > depos.termination, "termination time pending");
        
        uint256 remainder = depos.cap.sub(depos.released); 
        
        IERC20(depos.token).safeTransfer(depos.client, remainder);
        
        depos.released = depos.released.add(remainder); 
        
	    emit Withdraw(index, remainder); 
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    
    /************
    ADR FUNCTIONS
    ************/
    function lock(uint256 index, bytes32 details) external { // client or provider can lock deposit for lexDAO resolution during locker period
        Deposit storage depos = deposit[index]; 
        
        require(depos.cap > depos.released, "deposit released");
        require(now < depos.termination, "termination time passed"); 
        require(_msgSender() == depos.client || _msgSender() == depos.provider, "not deposit party"); 
        
	    depos.locked = 1; 
	    
	    emit Lock(_msgSender(), index, details);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
    
    function resolve(uint256 index, uint256 clientAward, uint256 providerAward, bytes32 details) external { // lexDAO judge resolves locked deposit remainder 
        Deposit storage depos = deposit[index];
        
        uint256 remainder = depos.cap.sub(depos.released); 
	    uint256 resolutionFee = remainder.div(20); // calculates 5% lexDAO dispute resolution fee
	    
	    require(depos.locked == 1, "deposit not locked"); 
	    require(depos.cap > depos.released, "cap released");
	    require(_msgSender() != depos.client, "cannot be deposit party");
	    require(_msgSender() != depos.provider, "cannot be deposit party");
	    require(clientAward.add(providerAward) == remainder.sub(resolutionFee), "resolution must match deposit"); 
	    require(IERC20(judgeAccessToken).balanceOf(_msgSender()) >= judgeAccessBalance, "judgeAccessToken insufficient");
        
        IERC20(depos.token).safeTransfer(lexDAO, resolutionFee);
        IERC20(depos.token).safeTransfer(depos.client, clientAward);
        IERC20(depos.token).safeTransfer(depos.provider, providerAward);
	    IERC20(judgmentRewardToken).safeTransfer(_msgSender(), judgmentReward);
	    
	    depos.released = depos.released.add(remainder); 
	    
	    emit Resolve(_msgSender(), clientAward, providerAward, index, details);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
    
    /*************
    MGMT FUNCTIONS
    *************/
    modifier onlyLexDAO() {
        require(_msgSender() == lexDAO, "caller not lexDAO");
        _;
    }
    
    function payLexDAO(bytes32 details) payable external { // attach ether (Ξ) with details to lexDAO
        (bool success, ) = lexDAO.call.value(msg.value)("");
        require(success, "transfer failed");
        emit PayLexDAO(_msgSender(), msg.value, details);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    function updateJudgeAccessToken(address _judgeAccessToken) external onlyLexDAO { 
        judgeAccessToken = _judgeAccessToken; 
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    
    function updateJudgeAccessBalance(uint256 _judgeAccessBalance) external onlyLexDAO {
        judgeAccessBalance = _judgeAccessBalance;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
    
    function updateJudgmentRewardToken(address _judgmentRewardToken) external onlyLexDAO { 
        judgmentRewardToken = _judgmentRewardToken;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    
    function updateJudgmentReward(uint256 _judgmentReward) external onlyLexDAO {
        judgmentReward = _judgmentReward;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    function updateLexDAO(address payable _lexDAO) external onlyLexDAO {
        lexDAO = _lexDAO;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
}