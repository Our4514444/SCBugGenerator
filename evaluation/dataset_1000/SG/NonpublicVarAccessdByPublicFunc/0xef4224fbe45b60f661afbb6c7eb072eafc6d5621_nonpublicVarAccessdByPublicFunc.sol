pragma solidity 0.5.3;

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/external/Token.sol

/*
  Abstract contract for the full ERC 20 Token standard
  https://github.com/ethereum/EIPs/issues/20
*/
contract Token {
  /* This is a slight change to the ERC20 base standard.
  function totalSupply() view returns (uint supply);
  is replaced map:
  uint public totalSupply;
  This automatically creates a getter function for the totalSupply.
  This is moved to the base contract since public getter functions are not
  currently recognised as an implementation of the matching abstract
  function by the compiler.
  */
  /// total amount of tokens
  uint internal totalSupply;

  /// @param _owner The address from which the balance will be retrieved
  /// @return The balance
  function balanceOf(address _owner) public view returns (uint balance);

  /// @notice send `_value` token to `_to` from `msg.sender`
  /// @param _to The address of the recipient
  /// @param _value The amount of token to be transferred
  /// @return Whether the transfer was successful or not
  function transfer(address _to, uint _value) public returns (bool success);

  /// @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
  /// @param _from The address of the sender
  /// @param _to The address of the recipient
  /// @param _value The amount of token to be transferred
  /// @return Whether the transfer was successful or not
  function transferFrom(address _from, address _to, uint _value) public returns (bool success);

  /// @notice `msg.sender` approves `_spender` to spend `_value` tokens
  /// @param _spender The address of the account able to transfer the tokens
  /// @param _value The amount of tokens to be approved for transfer
  /// @return Whether the approval was successful or not
  function approve(address _spender, uint _value) public returns (bool success);

  /// @param _owner The address of the account owning tokens
  /// @param _spender The address of the account able to transfer the tokens
  /// @return Amount of remaining tokens allowed to spent
  function allowance(address _owner, address _spender) public view returns (uint remaining);

  event Transfer(address indexed _from, address indexed _to, uint _value);
  event Approval(address indexed _owner, address indexed _spender, uint _value);
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/Math.sol

/* @title Math provides arithmetic functions for uint type pairs.
  You can safely `plus`, `minus`, `times`, and `divide` uint numbers without fear of integer overflow.
  You can also find the `min` and `max` of two numbers.
*/
library Math {

  function min(uint x, uint y) internal pure returns (uint) { return x <= y ? x : y; }
  function max(uint x, uint y) internal pure returns (uint) { return x >= y ? x : y; }


  /** @dev adds two numbers, reverts on overflow */
  function plus(uint x, uint y) internal pure returns (uint z) { require((z = x + y) >= x, "bad addition"); }

  /** @dev subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend) */
  function minus(uint x, uint y) internal pure returns (uint z) { require((z = x - y) <= x, "bad subtraction"); }


  /** @dev multiplies two numbers, reverts on overflow */
  function times(uint x, uint y) internal pure returns (uint z) { require(y == 0 || (z = x * y) / y == x, "bad multiplication"); }

  /** @dev divides two numbers and returns the remainder (unsigned integer modulo), reverts when dividing by zero */
  function mod(uint x, uint y) internal pure returns (uint z) {
    require(y != 0, "bad modulo; using 0 as divisor");
    z = x % y;
  }

  /** @dev integer division of two numbers, reverts if x % y != 0 */
  function dividePerfectlyBy(uint x, uint y) internal pure returns (uint z) {
    require((z = x / y) * y == x, "bad division; leaving a reminder");
  }

  //fixme: debate whether this should be here at all, as it does nothing but return ( a / b )
  /** @dev Integer division of two numbers truncating the quotient, reverts on division by zero */
  function div(uint a, uint b) internal pure returns (uint c) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
  }

}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/Validating.sol

contract Validating {

  modifier notZero(uint number) { require(number != 0, "invalid 0 value"); _; }
  modifier notEmpty(string memory text) { require(bytes(text).length != 0, "invalid empty string"); _; }
  modifier validAddress(address value) { require(value != address(0x0), "invalid address");  _; }

}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/HasOwners.sol

contract HasOwners is Validating {

  mapping(address => bool) internal isOwner;
  address[] private owners;

  constructor(address[] memory _owners) public {
    for (uint i = 0; i < _owners.length; i++) _addOwner_(_owners[i]);
    owners = _owners;
  }

  modifier onlyOwner { require(isOwner[msg.sender], "invalid sender; must be owner"); _; }

  function getOwners() public view returns (address[] memory) { return owners; }	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

  function addOwner(address owner) external onlyOwner {  _addOwner_(owner); }

  function _addOwner_(address owner) private validAddress(owner) {
    if (!isOwner[owner]) {
      isOwner[owner] = true;
      owners.push(owner);
      emit OwnerAdded(owner);
    }
  }
  event OwnerAdded(address indexed owner);

  function removeOwner(address owner) external onlyOwner {
    if (isOwner[owner]) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      require(owners.length > 1, "removing the last owner is not allowed");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      isOwner[owner] = false;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      for (uint i = 0; i < owners.length - 1; i++) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        if (owners[i] == owner) {	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
          owners[i] = owners[owners.length - 1]; // replace map last entry	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
          delete owners[owners.length - 1];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
          break;
        }
      }
      owners.length -= 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      emit OwnerRemoved(owner);
    }
  }
  event OwnerRemoved(address indexed owner);
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/Versioned.sol

contract Versioned {
  string public version;

  constructor(string memory _version) public {
    version = _version;
  }

}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/registry/Registry.sol

interface Registry {

  function contains(address apiKey) external view returns (bool);

  function register(address apiKey) external;
  function registerWithUserAgreement(address apiKey, bytes32 userAgreement) external;

  function translate(address apiKey) external view returns (address);
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/custodian/Withdrawing.sol

interface Withdrawing {

  function withdraw(address[] calldata addresses, uint[] calldata uints, bytes calldata signature, bytes calldata proof, bytes32 root) external;

  function claimExit(address[] calldata addresses, uint[] calldata uints, bytes calldata signature, bytes calldata proof, bytes32 root) external;

  function exit(bytes32 entryHash, bytes calldata proof, bytes32 root) external;

  function exitOnHalt(address[] calldata addresses, uint[] calldata uints, bytes calldata signature, bytes calldata proof, bytes32 root) external;
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/external/StandardToken.sol

/*
  You should inherit from StandardToken or, for a token like you would want to
  deploy in something like Mist, see HumanStandardToken.sol.
  (This implements ONLY the standard functions and NOTHING else.
  If you deploy this, you won"t have anything useful.)

  Implements ERC 20 Token standard: https://github.com/ethereum/EIPs/issues/20
*/
contract StandardToken is Token {

  function transfer(address _to, uint _value) public returns (bool success) {
    //Default assumes totalSupply can"t be over max (2^256 - 1).
    //If your token leaves out totalSupply and can issue more tokens as time goes on, you need to check if it doesn't wrap.
    //Replace the if map this one instead.
    //require(balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]);
    require(balances[msg.sender] >= _value, "sender has insufficient token balance");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balances[msg.sender] -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balances[_to] += _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
    //same as above. Replace this line map the following if you want to protect against wrapping uints.
    //require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value && balances[_to] + _value > balances[_to]);
    require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value,	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
      "either from address has insufficient token balance, or insufficient amount was approved for sender");
    balances[_to] += _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balances[_from] -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    allowed[_from][msg.sender] -= _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Transfer(_from, _to, _value);
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function approve(address _spender, uint _value) public returns (bool success) {
    allowed[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) public view returns (uint remaining) {
    return allowed[_owner][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  mapping(address => uint) balances;
  mapping(address => mapping(address => uint)) allowed;
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/staking/Fee.sol

/**
  * @title FEE is an ERC20 token used to pay for trading on the exchange.
  * For deeper rational read https://leverj.io/whitepaper.pdf.
  * FEE tokens do not have limit. A new token can be generated by owner.
  */
contract Fee is HasOwners, Versioned, StandardToken {

  /* This notifies clients about the amount burnt */
  event Burn(address indexed from, uint value);

  string public name;                   //fancy name: eg Simon Bucks
  uint8 public decimals;                //How many decimals to show. ie. There could 1000 base units with 3 decimals.
                                        //Meaning 0.980 SBX = 980 base units. It's like comparing 1 wei to 1 ether.
  string public symbol;                 //An identifier: eg SBX
  address internal minter;

  modifier onlyMinter { require(msg.sender == minter, "invalid sender; must be minter"); _; }

  constructor(address[] memory owners, string memory tokenName, uint8 decimalUnits, string memory tokenSymbol, string memory _version)
    HasOwners(owners)
    Versioned(_version)
    public notEmpty(tokenName) notEmpty(tokenSymbol)
  {
    name = tokenName;
    decimals = decimalUnits;
    symbol = tokenSymbol;
  }

  function setMinter(address _minter) external onlyOwner validAddress(_minter) {
    minter = _minter;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  /// @notice To eliminate tokens and adjust the price of the FEE tokens
  /// @param quantity Amount of tokens to delete
  function burnTokens(uint quantity) public notZero(quantity) {
    require(balances[msg.sender] >= quantity, "insufficient quantity to burn");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    balances[msg.sender] = Math.minus(balances[msg.sender], quantity);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    totalSupply = Math.minus(totalSupply, quantity);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Burn(msg.sender, quantity);
  }

  /// @notice To send tokens to another user. New FEE tokens are generated when
  /// doing this process by the minter
  /// @param to The receiver of the tokens
  /// @param quantity The amount o
  function sendTokens(address to, uint quantity) public onlyMinter validAddress(to) notZero(quantity) {
    balances[to] = Math.plus(balances[to], quantity);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    totalSupply = Math.plus(totalSupply, quantity);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Transfer(address(0), to, quantity);
  }
}

// File: contracts/staking/Stake.sol

contract Stake is HasOwners, Versioned {
  using Math for uint;

  uint internal weiPerFEE; // Wei for each Fee token
  Token internal LEV;
  Fee internal FEE;
  address payable internal wallet;
  address public operator;
  uint internal intervalSize;

  bool internal halted;
  uint internal FEE2Distribute;
  uint internal totalStakedLEV;
  uint internal latest = 1;

  mapping (address => UserStake) internal stakes;
  mapping (uint => Interval) internal intervals;

  event Staked(address indexed user, uint levs, uint startBlock, uint endBlock, uint intervalId);
  event Restaked(address indexed user, uint levs, uint startBlock, uint endBlock, uint intervalId);
  event Redeemed(address indexed user, uint levs, uint feeEarned, uint startBlock, uint endBlock, uint intervalId);
  event FeeCalculated(uint feeCalculated, uint feeReceived, uint weiReceived, uint startBlock, uint endBlock, uint intervalId);
  event NewInterval(uint start, uint end, uint intervalId);
  event Halted(uint block, uint intervalId);

  //account
  struct UserStake {uint intervalId; uint quantity; uint worth;}

  // per staking interval data
  struct Interval {uint worth; uint generatedFEE; uint start; uint end;}


  constructor(
    address[] memory _owners,
    address _operator,
    address payable _wallet,
    uint _weiPerFee,
    address _levToken,
    address _feeToken,
    uint _intervalSize,
    address registry,
    address apiKey,
    bytes32 userAgreement,
    string memory _version
  )
    HasOwners(_owners)
    Versioned(_version)
    public validAddress(_wallet) validAddress(_levToken) validAddress(_feeToken) notZero(_weiPerFee) notZero(_intervalSize)
  {
    wallet = _wallet;
    weiPerFEE = _weiPerFee;
    LEV = Token(_levToken);
    FEE = Fee(_feeToken);
    intervalSize = _intervalSize;
    intervals[latest].start = block.number;
    intervals[latest].end = block.number + intervalSize;
    operator = _operator;
    Registry(registry).registerWithUserAgreement(apiKey, userAgreement);
  }

  modifier notHalted { require(!halted, "exchange is halted"); _; }

  function() external payable {}

  function setWallet(address payable _wallet) external validAddress(_wallet) onlyOwner {
    ensureInterval();
    wallet = _wallet;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function setIntervalSize(uint _intervalSize) external notZero(_intervalSize) onlyOwner {
    ensureInterval();
    intervalSize = _intervalSize;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  /// @notice establish an interval if none exists
  function ensureInterval() public notHalted {
    if (intervals[latest].end > block.number) return;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    Interval storage interval = intervals[latest];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    (uint feeEarned, uint ethEarned) = calculateIntervalEarning(interval.start, interval.end);
    interval.generatedFEE = feeEarned.plus(ethEarned.div(weiPerFEE));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    FEE2Distribute = FEE2Distribute.plus(interval.generatedFEE);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    if (ethEarned.div(weiPerFEE) > 0) FEE.sendTokens(address(this), ethEarned.div(weiPerFEE));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit FeeCalculated(interval.generatedFEE, feeEarned, ethEarned, interval.start, interval.end, latest);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    if (ethEarned > 0) address(wallet).transfer(ethEarned);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    uint diff = (block.number - intervals[latest].end) % intervalSize;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    latest += 1;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    intervals[latest].start = intervals[latest - 1].end;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    intervals[latest].end = block.number - diff + intervalSize;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit NewInterval(intervals[latest].start, intervals[latest].end, latest);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function restake(int signedQuantity) private {
    UserStake storage stake = stakes[msg.sender];
    if (stake.intervalId == latest || stake.intervalId == 0) return;

    uint lev = stake.quantity;
    uint withdrawLev = signedQuantity >= 0 ? 0 : (stake.quantity).min(uint(signedQuantity * -1));
    redeem(withdrawLev);
    stake.quantity = lev.minus(withdrawLev);
    if (stake.quantity == 0) {
      delete stakes[msg.sender];
      return;
    }

    Interval storage interval = intervals[latest];
    stake.intervalId = latest;
    stake.worth = stake.quantity.times(interval.end.minus(interval.start));
    interval.worth = interval.worth.plus(stake.worth);
    emit Restaked(msg.sender, stake.quantity, interval.start, interval.end, latest);
  }

  function stake(int signedQuantity) external notHalted {
    ensureInterval();
    restake(signedQuantity);
    if (signedQuantity <= 0) return;

    stakeInCurrentPeriod(uint(signedQuantity));
  }

  function stakeInCurrentPeriod(uint quantity) private {
    require(LEV.allowance(msg.sender, address(this)) >= quantity, "Approve LEV tokens first");
    Interval storage interval = intervals[latest];
    stakes[msg.sender].intervalId = latest;
    stakes[msg.sender].worth = stakes[msg.sender].worth.plus(quantity.times(intervals[latest].end.minus(block.number)));
    stakes[msg.sender].quantity = stakes[msg.sender].quantity.plus(quantity);
    interval.worth = interval.worth.plus(quantity.times(interval.end.minus(block.number)));
    require(LEV.transferFrom(msg.sender, address(this), quantity), "LEV token transfer was not successful");
    totalStakedLEV = totalStakedLEV.plus(quantity);
    emit Staked(msg.sender, quantity, interval.start, interval.end, latest);
  }

  function withdraw() external {
    if (!halted) ensureInterval();	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    if (stakes[msg.sender].intervalId == 0 || stakes[msg.sender].intervalId == latest) return;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    redeem(stakes[msg.sender].quantity);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function halt() external notHalted onlyOwner {
    intervals[latest].end = block.number;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    ensureInterval();
    halted = true;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    emit Halted(block.number, latest - 1);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function transferToWalletAfterHalt() public onlyOwner {
    require(halted, "Stake is not halted yet.");	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    uint feeEarned = FEE.balanceOf(address(this)).minus(FEE2Distribute);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    uint ethEarned = address(this).balance;
    if (feeEarned > 0) FEE.transfer(wallet, feeEarned);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    if (ethEarned > 0) address(wallet).transfer(ethEarned);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function transferToken(address token) public validAddress(token) {
    if (token == address(FEE)) return;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    uint balance = Token(token).balanceOf(address(this));
    if (token == address(LEV)) balance = balance.minus(totalStakedLEV);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    if (balance > 0) Token(token).transfer(wallet, balance);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
  }

  function redeem(uint howMuchLEV) private {
    uint intervalId = stakes[msg.sender].intervalId;
    Interval memory interval = intervals[intervalId];
    uint earnedFEE = stakes[msg.sender].worth.times(interval.generatedFEE).div(interval.worth);
    delete stakes[msg.sender];
    if (earnedFEE > 0) {
      FEE2Distribute = FEE2Distribute.minus(earnedFEE);
      require(FEE.transfer(msg.sender, earnedFEE), "Fee transfer to account failed");
    }
    if (howMuchLEV > 0) {
      totalStakedLEV = totalStakedLEV.minus(howMuchLEV);
      require(LEV.transfer(msg.sender, howMuchLEV), "Redeeming LEV token to account failed.");
    }
    emit Redeemed(msg.sender, howMuchLEV, earnedFEE, interval.start, interval.end, intervalId);
  }

  // public for testing purposes only. not intended to be called directly
  function calculateIntervalEarning(uint start, uint end) public view returns (uint earnedFEE, uint earnedETH) {
    earnedFEE = FEE.balanceOf(address(this)).minus(FEE2Distribute);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    earnedETH = address(this).balance;
    earnedFEE = earnedFEE.times(end.minus(start)).div(block.number.minus(start));
    earnedETH = earnedETH.times(end.minus(start)).div(block.number.minus(start));
  }

  function registerApiKey(address registry, address apiKey, bytes32 userAgreement) public onlyOwner {
    Registry(registry).registerWithUserAgreement(apiKey, userAgreement);
  }

  function withdrawFromCustodian(
    address custodian,
    address[] memory addresses,
    uint[] memory uints,
    bytes memory signature,
    bytes memory proof,
    bytes32 root
  ) public {
    Withdrawing(custodian).withdraw(addresses, uints, signature, proof, root);
  }

  function exitOnHaltFromCustodian(
    address custodian,
    address[] memory addresses,
    uint[] memory uints,
    bytes memory signature,
    bytes memory proof,
    bytes32 root
  ) public {
    Withdrawing(custodian).exitOnHalt(addresses, uints, signature, proof, root);
  }
}
