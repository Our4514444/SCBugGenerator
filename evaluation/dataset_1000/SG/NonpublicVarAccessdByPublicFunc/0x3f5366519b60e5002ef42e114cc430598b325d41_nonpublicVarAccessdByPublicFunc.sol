pragma solidity ^0.5.6;

library SafeMath {
  /**
    * @dev Multiplies two unsigned integers, reverts on overflow.
    */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }

    uint256 c = a * b;
    require(c / a == b);
    return c;
  }

  /**
    * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
    */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // Solidity only automatically asserts when dividing by 0
    require(b > 0);
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  /**
    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b <= a);
    uint256 c = a - b;
    return c;
  }

  /**
    * @dev Adds two unsigned integers, reverts on overflow.
    */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a);
    return c;
  }
}

contract Ownable {
  address public owner;
  mapping(address => bool) internal adminList;

  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() public {
    owner = msg.sender;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  modifier onlyAdmin() {
    require(adminList[msg.sender] == true || msg.sender == owner);
    _;
  }

  function addAdmin(address _address) public onlyOwner {
      adminList[_address] = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function removeAdmin(address _address) public onlyOwner {
      adminList[_address] = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function transferOwnership(address _newOwner) public onlyOwner {
    _transferOwnership(_newOwner);
  }

  /**
   * @dev Transfers control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function _transferOwnership(address _newOwner) internal {
    require(_newOwner != address(0));
    emit OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
  }
}

contract Pausable is Ownable {
  event Pause();
  event Unpause();

  bool internal paused = false;


  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
  modifier whenPaused() {
    require(paused);
    _;
  }

  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() public onlyOwner whenNotPaused {
    paused = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Pause();
  }

  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function unpause() public onlyOwner whenPaused {
    paused = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Unpause();
  }
}

/**
 * @title Standard ERC20 token
 */
contract StandardToken {
  using SafeMath for uint256;

  mapping(address => uint256) internal balances;

  mapping (address => mapping (address => uint256)) internal allowed;

  uint256 internal totalSupply_;

  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );

  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 vaule
  );

  /**
  * @dev Total number of tokens in existence
  */
  function totalSupply() public view returns (uint256) {
    return totalSupply_;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
  function allowance(
    address _owner,
    address _spender
   )
    public
    view
    returns (uint256)
  {
    return allowed[_owner][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  /**
  * @dev Transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    balances[msg.sender] = balances[msg.sender].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balances[_to] = balances[_to].add(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    require(_to != address(0));
    require(_value <= balances[_from]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    require(_value <= allowed[_from][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    balances[_from] = balances[_from].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balances[_to] = balances[_to].add(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Transfer(_from, _to, _value);
    return true;
  }
}

/**
 * Overriding ERC-20 specification that lets owner Pause all trading.
 */
contract PausableToken is StandardToken, Pausable {

  event Burn(address indexed from, uint256 value);
  event Mint(address indexed to, uint256 value);

  function transfer(
    address _to,
    uint256 _value
  )
    public
    whenNotPaused
    returns (bool)
  {
    return super.transfer(_to, _value);
  }

  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    public
    whenNotPaused
    returns (bool)
  {
    return super.transferFrom(_from, _to, _value);
  }

  function approve(
    address _spender,
    uint256 _value
  )
    public
    whenNotPaused
    returns (bool)
  {
    return super.approve(_spender, _value);
  }

  /**
   * @dev Burns a specific amount of tokens.
   * @param _value The amount of token to be burned.
   */
  function burn(uint256 _value) public onlyOwner {
    require(balances[msg.sender] >= _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balances[msg.sender] = balances[msg.sender].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    totalSupply_ = totalSupply_.sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Transfer(msg.sender, address(0x00), _value);
    emit Burn(msg.sender, _value);
  }

  function mint(uint256 _value) public onlyOwner {
    balances[msg.sender] = balances[msg.sender].add(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    totalSupply_ = totalSupply_.add(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Transfer(address(0x00), msg.sender, _value);
    emit Mint(msg.sender, _value);
  }
}

contract FreezeToken is PausableToken {
  mapping(address=>bool) internal frozenAccount;
  event FrozenAccount(address indexed target, bool frozen);

  function frozenCheck(address target) internal view {
    require(!frozenAccount[target]);
  }

  function freezeAccount(address target, bool frozen) public onlyAdmin {
    frozenAccount[target] = frozen;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit FrozenAccount(target, frozen);
  }

  function transfer(
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    frozenCheck(msg.sender);
    frozenCheck(_to);
    return super.transfer(_to, _value);
  }

  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    public
    whenNotPaused
    returns (bool)
  {
    frozenCheck(msg.sender);
    frozenCheck(_from);
    frozenCheck(_to);
    return super.transferFrom(_from, _to, _value);
  }
}

contract Token is FreezeToken {
  string public constant name = "Panda Coin";  // name of Token 
  string public constant symbol = "PANDA"; // symbol of Token 
  uint8 public constant decimals = 18;
  mapping (address => string) internal keys;

  event Register (address user, string key);
  
  constructor() public {
    totalSupply_ = 1350852214721 * 10 ** uint256(decimals - 2);
    balances[msg.sender] = totalSupply_;
    emit Transfer(address(0x00), msg.sender,totalSupply_);
  }
  
  function register(string memory key) public {
    keys[msg.sender] = key;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Register(msg.sender, key);
  }
}