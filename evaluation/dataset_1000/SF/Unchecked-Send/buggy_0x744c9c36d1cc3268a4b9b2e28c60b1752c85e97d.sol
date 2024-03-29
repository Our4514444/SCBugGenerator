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
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
    // @dev safe subtraction, reverts if integer underflow
    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    // @dev safe multiplication, reverts if integer overflow
    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    // @dev safe division, revert on division by zero
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
}

// @title ERC Token Standard #20 Interface
// @notice https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// @dev ERC20 contract framework with default function definitions
contract ERC20Interface {
    uint256 public totalSupply;

    function balanceOf(address _owner) public view returns (uint256 balance);
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address _to, uint256 _value) public returns (bool success);
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address _spender, uint256 _value) public returns (bool success);
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

// @title Contract ownership functionality
// @notice based on OpenZeppelin Ownable.sol
contract Owned {
    address public owner;
    address public newOwner;

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    // @dev sets msg.sender to contract owner on initial deployment
    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    // @notice function for new owner to accept contract ownership
    // @dev reverts if called before transferOwnership
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        owner = newOwner;
        newOwner = address(0);
        emit OwnershipTransferred(owner, newOwner);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
}

// @title Alluva ERC20 Token
// @notice Inherits default interface, ownership and safe maths.
contract AlluvaToken is ERC20Interface, Owned, SafeMath {
  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  address public owner = msg.sender;
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  string public name;
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  uint public totalSupply;

  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint) balances;
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
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
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    // @dev Returns the token balance for provided address
    // @param _owner The address of token owner
    // @return Balance of requested address
    function balanceOf(address _owner) public view returns (uint balance) {
        return balances[_owner];
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    // @dev Returns the number of tokens that can be transferred from _owner to
    // _spender, set by approve method
    // @param _owner Address of token owner
    // @param _spender Address of approved spender
    // @return Remaining approved spending
    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        return allowed[_owner][_spender];
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}


    // @dev Fallback function to reject ether sent to contract
    function () external payable {
        revert();
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    // @dev Allow contract owner to transfer other tokens sent to contract
    // @param _tokenAddress contract address of token to transfer
    // @param _tokens number of tokens to transfer
    // @return True if transaction was successful
    function transferAnyERC20Token(address _tokenAddress, uint _tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(_tokenAddress).transfer(owner, _tokens);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

}