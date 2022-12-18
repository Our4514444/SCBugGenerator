/**
 *Submitted for verification at Etherscan.io on 2020-01-16
*/

pragma solidity ^0.5.0;

/**
  * @title ERC20Basic
  * @dev Simpler version of ERC20 interface
  * @dev see https://github.com/ethereum/EIPs/issues/179
  */
contract ERC20Basic {
  function totalSupply() public view returns (uint);
  function balanceOf(address who) public view returns (uint);
  function transfer(address to, uint value) public returns (bool);
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event Transfer(address indexed from, address indexed to, uint value);
}


/**
  * @title ERC20 interface
  * @dev see https://github.com/ethereum/EIPs/issues/20
  */
contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view returns (uint);
address winner_tmstmp6;
function play_tmstmp6(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp6 = msg.sender;}}
  function transferFrom(address from, address to, uint value) public returns (bool);
function bug_tmstmp21() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  function approve(address spender, uint value) public returns (bool);
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  event Approval(address indexed owner, address indexed spender, uint value);
}

/**
  * @title Ownable
  * @dev Owner validator
  */
contract Ownable {
  address private _owner;
  address private _operator;

uint256 bugv_tmstmp4 = block.timestamp;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
uint256 bugv_tmstmp5 = block.timestamp;
  event OperatorTransferred(address indexed previousOperator, address indexed newOperator);

  /**
    * @dev The Ownable constructor sets the original `owner` of the contract to the sender
    * account.
    */
  constructor() public {
    _owner = msg.sender;
    _operator = msg.sender;
    emit OwnershipTransferred(address(0), _owner);
    emit OperatorTransferred(address(0), _operator);
  }
address winner_tmstmp22;
function play_tmstmp22(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp22 = msg.sender;}}

  /**
    * @return the address of the owner.
    */
  function owner() public view returns (address) {
    return _owner;
  }
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

  /**
    * @return the address of the operator.
    */
  function operator() public view returns (address) {
    return _operator;
  }
address winner_tmstmp18;
function play_tmstmp18(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp18 = msg.sender;}}

  /**
    * @dev Throws if called by any account other than the owner.
    */
  modifier onlyOwner() {
    require(isOwner());
    _;
  }

  /**
    * @dev Throws if called by any account other than the owner or operator.
    */
  modifier onlyOwnerOrOperator() {
    require(isOwner() || isOperator());
    _;
  }


  /**
    * @return true if `msg.sender` is the owner of the contract.
    */
  function isOwner() public view returns (bool) {
    return msg.sender == _owner;
  }
function bug_tmstmp5() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  /**
    * @return true if `msg.sender` is the operator of the contract.
    */
  function isOperator() public view returns (bool) {
    return msg.sender == _operator;
  }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}

  /**
    * @dev Allows the current owner to transfer control of the contract to a newOwner.
    * @param newOwner The address to transfer ownership to.
    */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));

    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
  }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}

  /**
    * @dev Allows the current operator to transfer control of the contract to a newOperator.
    * @param newOperator The address to transfer ownership to.
    */
  function transferOperator(address newOperator) public onlyOwner {
    require(newOperator != address(0));

    emit OperatorTransferred(_operator, newOperator);
    _operator = newOperator;
  }
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }


}


/**
  * @title Pausable
  * @dev Base contract which allows children to implement an emergency stop mechanism.
  */
contract Pausable is Ownable {
uint256 bugv_tmstmp2 = block.timestamp;
  event Paused(address account);
uint256 bugv_tmstmp3 = block.timestamp;
  event Unpaused(address account);

  bool private _paused;

  constructor () internal {
    _paused = false;
  }
address winner_tmstmp34;
function play_tmstmp34(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp34 = msg.sender;}}

  /**
    * @return True if the contract is paused, false otherwise.
    */
  function paused() public view returns (bool) {
    return _paused;
  }
address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}

  /**
    * @dev Modifier to make a function callable only when the contract is not paused.
    */
  modifier whenNotPaused() {
    require(!_paused);
    _;
  }

  /**
    * @dev Modifier to make a function callable only when the contract is paused.
    */
  modifier whenPaused() {
    require(_paused);
    _;
  }

  /**
    * @dev Called by a pauser to pause, triggers stopped state.
    */
  function pause() public onlyOwnerOrOperator whenNotPaused {
    _paused = true;
    emit Paused(msg.sender);
  }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}

  /**
    * @dev Called by a pauser to unpause, returns to normal state.
    */
  function unpause() public onlyOwnerOrOperator whenPaused {
    _paused = false;
    emit Unpaused(msg.sender);
  }
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}

/**
  * @title SafeMath
  * @dev Unsigned math operations with safety checks that revert on error.
  */
library SafeMath {

  /**
    * @dev Multiplies two unsigned integers, reverts on overflow.
    */
  function mul(uint a, uint b) internal pure returns (uint) {
    if (a == 0) {
      return 0;
    }

    uint c = a * b;
    require(c / a == b);

    return c;
  }

  /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
  function div(uint a, uint b) internal pure returns (uint) {
    // Solidity only automatically asserts when dividing by 0
    require(b > 0);
    uint c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }

  /**
    * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
    */
  function sub(uint a, uint b) internal pure returns (uint) {
    require(b <= a);
    uint c = a - b;

    return c;
  }

  /**
    * @dev Adds two numbers, throws on overflow.
    */
  function add(uint a, uint b) internal pure returns (uint) {
    uint c = a + b;
    require(c >= a);

    return c;
  }

  /**
    * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
  function mod(uint a, uint b) internal pure returns (uint) {
    require(b != 0);
    return a % b;
  }

}


/**
  * @title StandardToken
  * @dev Base Of token
  */
contract StandardToken is ERC20, Pausable {
  using SafeMath for uint;

  mapping (address => uint) private _balances;

  mapping (address => mapping (address => uint)) private _allowed;

  uint private _totalSupply;

  /**
    * @dev Total number of tokens in existence.
    */
  function totalSupply() public view returns (uint) {
    return _totalSupply;
  }
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  /**
    * @dev Gets the balance of the specified address.
    * @param owner The address to query the balance of.
    * @return A uint representing the amount owned by the passed address.
    */
  function balanceOf(address owner) public view returns (uint) {
    return _balances[owner];
  }
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

  /**
    * @dev Function to check the amount of tokens that an owner allowed to a spender.
    * @param owner address The address which owns the funds.
    * @param spender address The address which will spend the funds.
    * @return A uint specifying the amount of tokens still available for the spender.
    */
  function allowance(address owner, address spender) public view returns (uint) {
    return _allowed[owner][spender];
  }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}

  /**
    * @dev Transfer token to a specified address.
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
  function transfer(address to, uint value) public whenNotPaused returns (bool) {
    _transfer(msg.sender, to, value);
    return true;
  }
function bug_tmstmp28 () public payable {
	uint pastBlockTime_tmstmp28; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp28); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp28 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

  /**
    * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
    * Beware that changing an allowance with this method brings the risk that someone may use both the old
    * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
    * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
    * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    * @param spender The address which will spend the funds.
    * @param value The amount of tokens to be spent.
    */
  function approve(address spender, uint value) public whenNotPaused returns (bool) {
    _approve(msg.sender, spender, value);
    return true;
  }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}

  /**
    * @dev Transfer tokens from one address to another.
    * Note that while this function emits an Approval event, this is not required as per the specification,
    * and other compliant implementations may not emit the event.
    * @param from address The address which you want to send tokens from
    * @param to address The address which you want to transfer to
    * @param value uint the amount of tokens to be transferred
    */
  function transferFrom(address from, address to, uint value) public whenNotPaused returns (bool) {
    _transferFrom(from, to, value);
    return true;
  }
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

  /**
    * @dev Increase the amount of tokens that an owner allowed to a spender.
    * approve should be called when _allowed[msg.sender][spender] == 0. To increment
    * allowed value is better to use this function to avoid 2 calls (and wait until
    * the first transaction is mined)
    * From MonolithDAO Token.sol
    * Emits an Approval event.
    * @param spender The address which will spend the funds.
    * @param addedValue The amount of tokens to increase the allowance by.
    */
  function increaseAllowance(address spender, uint addedValue) public whenNotPaused returns (bool) {
    _approve(msg.sender, spender, _allowed[msg.sender][spender].add(addedValue));
    return true;
  }
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

  /**
    * @dev Decrease the amount of tokens that an owner allowed to a spender.
    * approve should be called when _allowed[msg.sender][spender] == 0. To decrement
    * allowed value is better to use this function to avoid 2 calls (and wait until
    * the first transaction is mined)
    * From MonolithDAO Token.sol
    * Emits an Approval event.
    * @param spender The address which will spend the funds.
    * @param subtractedValue The amount of tokens to decrease the allowance by.
    */
  function decreaseAllowance(address spender, uint subtractedValue) public whenNotPaused returns (bool) {
    _approve(msg.sender, spender, _allowed[msg.sender][spender].sub(subtractedValue));
    return true;
  }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  /**
    * @dev Transfer token for a specified addresses.
    * @param from The address to transfer from.
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
  function _transfer(address from, address to, uint value) internal {
    require(to != address(0));

    _balances[from] = _balances[from].sub(value);
    _balances[to] = _balances[to].add(value);
    emit Transfer(from, to, value);
  }
address winner_tmstmp15;
function play_tmstmp15(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp15 = msg.sender;}}

  /**
    * @dev Transfer tokens from one address to another.
    * Note that while this function emits an Approval event, this is not required as per the specification,
    * and other compliant implementations may not emit the event.
    * @param from address The address which you want to send tokens from
    * @param to address The address which you want to transfer to
    * @param value uint the amount of tokens to be transferred
    */
  function _transferFrom(address from, address to, uint value) internal {
    _transfer(from, to, value);
    _approve(from, msg.sender, _allowed[from][msg.sender].sub(value));
  }
function bug_tmstmp16 () public payable {
	uint pastBlockTime_tmstmp16; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp16); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp16 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

  /**
    * @dev Internal function that mints an amount of the token and assigns it to
    * an account. This encapsulates the modification of balances such that the
    * proper events are emitted.
    * @param account The account that will receive the created tokens.
    * @param value The amount that will be created.
    */
  function _mint(address account, uint value) internal {
    require(account != address(0));

    _totalSupply = _totalSupply.add(value);
    _balances[account] = _balances[account].add(value);
    emit Transfer(address(0), account, value);
  }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}

  /**
    * @dev Internal function that burns an amount of the token of the owner
    * account.
    * @param value The amount that will be burnt.
    */
  function _burn(uint value) internal {
    _totalSupply = _totalSupply.sub(value);
    _balances[msg.sender] = _balances[msg.sender].sub(value);
    emit Transfer(msg.sender, address(0), value);
  }
function bug_tmstmp12 () public payable {
	uint pastBlockTime_tmstmp12; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp12); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp12 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }

  /**
    * @dev Approve an address to spend another addresses' tokens.
    * @param owner The address that owns the tokens.
    * @param spender The address that will spend the tokens.
    * @param value The number of tokens that can be spent.
    */
  function _approve(address owner, address spender, uint value) internal {
    require(spender != address(0));
    require(owner != address(0));

    _allowed[owner][spender] = value;
    emit Approval(owner, spender, value);
  }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
}

/**
  * @title MintableToken
  * @dev Minting of total balance
  */
contract MintableToken is StandardToken {
uint256 bugv_tmstmp1 = block.timestamp;
  event MintFinished();

  bool public mintingFinished = false;

  modifier canMint() {
    require(!mintingFinished);
    _;
  }

  /**
    * @dev Function to mint tokens
    * @param to The address that will receive the minted tokens.
    * @param amount The amount of tokens to mint
    * @return A boolean that indicated if the operation was successful.
    */
  function mint(address to, uint amount) public whenNotPaused onlyOwner canMint returns (bool) {
    _mint(to, amount);
    return true;
  }
function bug_tmstmp29() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  /**
    * @dev Function to stop minting new tokens.
    * @return True if the operation was successful.
    */
  function finishMinting() public whenNotPaused onlyOwner canMint returns (bool) {
    mintingFinished = true;
    emit MintFinished();
    return true;
  }
function bug_tmstmp24 () public payable {
	uint pastBlockTime_tmstmp24; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp24); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp24 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
}

/**
  * @title Burnable Token
  * @dev Token that can be irreversibly burned (destroyed).
  */
contract BurnableToken is MintableToken {
  /**
    * @dev Burns a specific amount of tokens.
    * @param value The amount of token to be burned.
    */
  function burn(uint value) public whenNotPaused onlyOwner returns (bool) {
    _burn(value);
    return true;
  }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
}



/**
  * @title LockableToken
  * @dev locking of granted balance
  */
contract LockableToken is BurnableToken {

  using SafeMath for uint;

  /**
    * @dev Lock defines a lock of token
    */
  struct Lock {
    uint amount;
    uint expiresAt;
  }

  mapping (address => Lock[]) public grantedLocks;

  /**
    * @dev Transfer tokens to another
    * @param to address the address which you want to transfer to
    * @param value uint the amount of tokens to be transferred
    */
  function transfer(address to, uint value) public whenNotPaused returns (bool) {
    _verifyTransferLock(msg.sender, value);
    _transfer(msg.sender, to, value);
    return true;
  }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

  /**
    * @dev Transfer tokens from one address to another
    * @param from address The address which you want to send tokens from
    * @param to address the address which you want to transfer to
    * @param value uint the amount of tokens to be transferred
    */
  function transferFrom(address from, address to, uint value) public whenNotPaused returns (bool) {
    _verifyTransferLock(from, value);
    _transferFrom(from, to, value);
    return true;
  }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}

  /**
    * @dev Function to add lock
    * @param granted The address that will be locked.
    * @param amount The amount of tokens to be locked
    * @param expiresAt The expired date as unix timestamp
    */
  function addLock(address granted, uint amount, uint expiresAt) public whenNotPaused onlyOwnerOrOperator {
    require(amount > 0);
    require(expiresAt > now);

    grantedLocks[granted].push(Lock(amount, expiresAt));
  }
address winner_tmstmp10;
function play_tmstmp10(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp10 = msg.sender;}}

  /**
    * @dev Function to delete lock
    * @param granted The address that was locked
    * @param index The index of lock
    */
  function deleteLock(address granted, uint8 index) public whenNotPaused onlyOwnerOrOperator {
    require(grantedLocks[granted].length > index);

    uint len = grantedLocks[granted].length;
    if (len == 1) {
      delete grantedLocks[granted];
    } else {
      if (len - 1 != index) {
        grantedLocks[granted][index] = grantedLocks[granted][len - 1];
      }
      delete grantedLocks[granted][len - 1];
    }
  }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

  /**
    * @dev Verify transfer is possible
    * @param from - granted
    * @param value - amount of transfer
    */
  function _verifyTransferLock(address from, uint value) internal view {
    uint lockedAmount = getLockedAmount(from);
    uint balanceAmount = balanceOf(from);

    require(balanceAmount.sub(lockedAmount) >= value);
  }
function bug_tmstmp1() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

  /**
    * @dev get locked amount of address
    * @param granted The address want to know the lock state.
    * @return locked amount
    */
  function getLockedAmount(address granted) public view returns(uint) {
    uint lockedAmount = 0;

    uint len = grantedLocks[granted].length;
    for (uint i = 0; i < len; i++) {
      if (now < grantedLocks[granted][i].expiresAt) {
        lockedAmount = lockedAmount.add(grantedLocks[granted][i].amount);
      }
    }
    return lockedAmount;
  }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
}

/**
  * @title IzeToken
  * @dev ERC20 Token
  */
contract IzeToken is LockableToken {

  string public constant name = "IZE Fintech Blockchain";
  string public constant symbol = "IZE";
  uint32 public constant decimals = 18;

  uint public constant INITIAL_SUPPLY = 10000000000e18;

  /**
    * @dev Constructor that gives msg.sender all of existing tokens.
    */
  constructor() public {
    _mint(msg.sender, INITIAL_SUPPLY);
    emit Transfer(address(0), msg.sender, INITIAL_SUPPLY);
  }
address winner_tmstmp11;
function play_tmstmp11(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp11 = msg.sender;}}
}