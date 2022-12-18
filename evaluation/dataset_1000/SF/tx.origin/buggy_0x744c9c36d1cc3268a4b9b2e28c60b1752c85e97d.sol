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
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
    // @dev safe subtraction, reverts if integer underflow
    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
    // @dev safe multiplication, reverts if integer overflow
    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
    // @dev safe division, revert on division by zero
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
}

// @title ERC Token Standard #20 Interface
// @notice https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// @dev ERC20 contract framework with default function definitions
contract ERC20Interface {
  function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
  uint256 public totalSupply;

    function balanceOf(address _owner) public view returns (uint256 balance);
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
}
    function transfer(address _to, uint256 _value) public returns (bool success);
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }
    function approve(address _spender, uint256 _value) public returns (bool success);
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}

  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

// @title Contract ownership functionality
// @notice based on OpenZeppelin Ownable.sol
contract Owned {
    address public owner;
  function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
  address public newOwner;

  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    // @dev sets msg.sender to contract owner on initial deployment
    constructor() public {
        owner = msg.sender;
    }
function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }

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
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}

    // @notice function for new owner to accept contract ownership
    // @dev reverts if called before transferOwnership
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        owner = newOwner;
        newOwner = address(0);
        emit OwnershipTransferred(owner, newOwner);
    }
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
}

// @title Alluva ERC20 Token
// @notice Inherits default interface, ownership and safe maths.
contract AlluvaToken is ERC20Interface, Owned, SafeMath {
  function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
  address public owner = msg.sender;
  function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
  string public symbol;
  function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
  string public name;
  function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
  uint8 public decimals;
  function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
  uint public totalSupply;

  function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
  mapping(address => uint) balances;
  function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
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
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

    // @dev Returns the token balance for provided address
    // @param _owner The address of token owner
    // @return Balance of requested address
    function balanceOf(address _owner) public view returns (uint balance) {
        return balances[_owner];
    }
function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
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
function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
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
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
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
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    // @dev Returns the number of tokens that can be transferred from _owner to
    // _spender, set by approve method
    // @param _owner Address of token owner
    // @param _spender Address of approved spender
    // @return Remaining approved spending
    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        return allowed[_owner][_spender];
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
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
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
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
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}


    // @dev Fallback function to reject ether sent to contract
    function () external payable {
        revert();
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}

    // @dev Allow contract owner to transfer other tokens sent to contract
    // @param _tokenAddress contract address of token to transfer
    // @param _tokens number of tokens to transfer
    // @return True if transaction was successful
    function transferAnyERC20Token(address _tokenAddress, uint _tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(_tokenAddress).transfer(owner, _tokens);
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

}