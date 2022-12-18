pragma solidity ^0.5.1;

// @title Alluva (ALV) Token Contract
// @owner Alluva

// @notice Safe Maths Contract to stop over/underflow errors
contract SafeMath {
    // @dev safe addition, reverts if integer overflow
    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
    // @dev safe subtraction, reverts if integer underflow
    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    // @dev safe multiplication, reverts if integer overflow
    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
    // @dev safe division, revert on division by zero
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
}

// @title ERC Token Standard #20 Interface
// @notice https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// @dev ERC20 contract framework with default function definitions
contract ERC20Interface {
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  uint256 public totalSupply;

    function balanceOf(address _owner) public view returns (uint256 balance);
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }
    function transfer(address _to, uint256 _value) public returns (bool success);
function UncheckedExternalCall_unchk16 () public
{  address payable addr_unchk16;
   if (! addr_unchk16.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    function approve(address _spender, uint256 _value) public returns (bool success);
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

// @title Contract ownership functionality
// @notice based on OpenZeppelin Ownable.sol
contract Owned {
    address public owner;
  function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  address public newOwner;

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    // @dev sets msg.sender to contract owner on initial deployment
    constructor() public {
        owner = msg.sender;
    }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

    // @dev modifier to check ownership before function execution
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    // @notice transfer ownership from one address to another
    // @param _newOwner The address of the new owner
    // @dev can only be executed by contract owner
    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    // @notice function for new owner to accept contract ownership
    // @dev reverts if called before transferOwnership
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        owner = newOwner;
        newOwner = address(0);
        emit OwnershipTransferred(owner, newOwner);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
}

// @title Alluva ERC20 Token
// @notice Inherits default interface, ownership and safe maths.
contract AlluvaToken is ERC20Interface, Owned, SafeMath {
  function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  address public owner = msg.sender;
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  string public symbol;
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  string public name;
  function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint8 public decimals;
  function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  uint public totalSupply;

  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  mapping(address => uint) balances;
  function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping(address => mapping(address => uint)) allowed;

    // @dev Constructor function
    constructor() public {
        symbol = "ALV";
        name = "Alluva";
        decimals = 18;
        totalSupply = 3000000000000000000000000000;
        balances[owner] = totalSupply;
        emit Transfer(address(0), owner, totalSupply);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}

    // @dev Returns the token balance for provided address
    // @param _owner The address of token owner
    // @return Balance of requested address
    function balanceOf(address _owner) public view returns (uint balance) {
        return balances[_owner];
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    // @dev Transfer tokens from sender to another address
    // @param _to Address of recipient
    // @param _value Number of tokens to transfer (in smallest divisible unit)
    // @return True if transaction was successful
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0));

        require(balances[msg.sender] >= _value);
        balances[msg.sender] = safeSub(balances[msg.sender], _value);
        balances[_to] = safeAdd(balances[_to], _value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    // @dev Transfer _value tokens from address _from to address _to. Caller
    // needs to be approved by _from, using approve method, prior to calling
    // @param _from Address to transfer tokens from
    // @param _to Address to transfer tokens to
    // @param _value Number of tokens to transfer (in smallest divisible unit)
    // @return True if transaction was successful
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0));

        allowed[_from][msg.sender] = safeSub(allowed[_from][msg.sender], _value);
        balances[_from] = safeSub(balances[_from], _value);
        balances[_to] = safeAdd(balances[_to], _value);
        emit Transfer(_from, _to, _value);
        return true;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    // @dev Approves _spender to transfer _value tokens from message sender address
    // @notice Frontend/Client should set allowance to 0 prior to updating to
    // prevent approve/transferFrom attack vector as described here:
    // https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    // @param _spender Address to allocate spending limit to
    // @param _value Number of tokens to allow spender (in smallest divisible unit)
    // @return True if transaction was successful
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0));

        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    // @dev Returns the number of tokens that can be transferred from _owner to
    // _spender, set by approve method
    // @param _owner Address of token owner
    // @param _spender Address of approved spender
    // @return Remaining approved spending
    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        return allowed[_owner][_spender];
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    // @dev Increase the amount of tokens that _spender can transfer from owner
    // approve should be called when allowed[_spender] == 0. To increment
    // allowed value use this function to avoid 2 calls (and wait until the
    // first transaction is mined)
    // From OpenZeppelin ERC20.sol
    // Emits an Approval event
    // @param _spender The address that is allowed to spend funds
    // @param _addedValue The value to add to allowance
    function increaseAllowance(address _spender, uint256 _addedValue) public returns (bool) {
        require(_spender != address(0));

        allowed[msg.sender][_spender] = safeAdd(allowed[msg.sender][_spender], _addedValue);
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    // @dev Decrease the amount of tokens that _spender can transfer from owner
    // approve should be called when allowed[_spender] == 0. To decrease
    // allowed value use this function to avoid 2 calls (and wait until the
    // first transaction is mined)
    // From OpenZeppelin ERC20.sol
    // Emits an Approval event
    // @param _spender The address that is allowed to spend funds
    // @param _subtractedValue The value to subtract from allowance
    function decreaseAllowance(address _spender, uint256 _subtractedValue) public returns (bool) {
        require(_spender != address(0));

        allowed[msg.sender][_spender] = safeSub(allowed[msg.sender][_spender], _subtractedValue);
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }


    // @dev Fallback function to reject ether sent to contract
    function () external payable {
        revert();
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    // @dev Allow contract owner to transfer other tokens sent to contract
    // @param _tokenAddress contract address of token to transfer
    // @param _tokens number of tokens to transfer
    // @return True if transaction was successful
    function transferAnyERC20Token(address _tokenAddress, uint _tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(_tokenAddress).transfer(owner, _tokens);
    }
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }

}