pragma solidity 0.5.3;

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/external/Token.sol

                                                                                                         
contract Token {
                                                                                                                                                                                                                                                                                                                                                                                                                
                            
  uint public totalSupply;

                                                                        
                         
  function BALANCEOF520(address _owner) public view returns (uint balance);	//inject NONSTANDARD NAMING

                                                            
                                             
                                                         
                                                        
  function TRANSFER689(address _to, uint _value) public returns (bool success);	//inject NONSTANDARD NAMING

                                                                                                  
                                            
                                             
                                                         
                                                        
  function TRANSFERFROM691(address _from, address _to, uint _value) public returns (bool success);	//inject NONSTANDARD NAMING

                                                                       
                                                                            
                                                                    
                                                        
  function APPROVE685(address _spender, uint _value) public returns (bool success);	//inject NONSTANDARD NAMING

                                                            
                                                                            
                                                         
  function ALLOWANCE171(address _owner, address _spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING

  event TRANSFER219(address indexed _from, address indexed _to, uint _value);	//inject NONSTANDARD NAMING
  event APPROVAL789(address indexed _owner, address indexed _spender, uint _value);	//inject NONSTANDARD NAMING
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/Math.sol

                                                                                                                                                                                                                                   
library Math {

  function MIN409(uint x, uint y) internal pure returns (uint) { return x <= y ? x : y; }	//inject NONSTANDARD NAMING
  function MAX688(uint x, uint y) internal pure returns (uint) { return x >= y ? x : y; }	//inject NONSTANDARD NAMING


                                                   
  function PLUS943(uint x, uint y) internal pure returns (uint z) { require((z = x + y) >= x, "bad addition"); }	//inject NONSTANDARD NAMING

                                                                                                     
  function MINUS405(uint x, uint y) internal pure returns (uint z) { require((z = x - y) <= x, "bad subtraction"); }	//inject NONSTANDARD NAMING


                                                         
  function TIMES749(uint x, uint y) internal pure returns (uint z) { require(y == 0 || (z = x * y) / y == x, "bad multiplication"); }	//inject NONSTANDARD NAMING

                                                                                                                    
  function MOD656(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
    require(y != 0, "bad modulo; using 0 as divisor");
    z = x % y;
  }

                                                                    
  function DIVIDEPERFECTLYBY213(uint x, uint y) internal pure returns (uint z) {	//inject NONSTANDARD NAMING
    require((z = x / y) * y == x, "bad division; leaving a reminder");
  }

  //fixme: debate whether this should be here at all, as it does nothing but return ( a / b )
                                                                                                  
  function DIV473(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
  }

}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/Validating.sol

contract Validating {

  modifier NOTZERO727(uint number) { require(number != 0, "invalid 0 value"); _; }	//inject NONSTANDARD NAMING
  modifier NOTEMPTY844(string memory text) { require(bytes(text).length != 0, "invalid empty string"); _; }	//inject NONSTANDARD NAMING
  modifier VALIDADDRESS163(address value) { require(value != address(0x0), "invalid address");  _; }	//inject NONSTANDARD NAMING

}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/HasOwners.sol

contract HasOwners is Validating {

  mapping(address => bool) public isOwner;
  address[] private owners;

  constructor(address[] memory _owners) public {
    for (uint i = 0; i < _owners.length; i++) _ADDOWNER_666(_owners[i]);
    owners = _owners;
  }

  modifier ONLYOWNER655 { require(isOwner[msg.sender], "invalid sender; must be owner"); _; }	//inject NONSTANDARD NAMING

  function GETOWNERS493() public view returns (address[] memory) { return owners; }	//inject NONSTANDARD NAMING

  function ADDOWNER787(address owner) external ONLYOWNER655 {  _ADDOWNER_666(owner); }	//inject NONSTANDARD NAMING

  function _ADDOWNER_666(address owner) private VALIDADDRESS163(owner) {	//inject NONSTANDARD NAMING
    if (!isOwner[owner]) {
      isOwner[owner] = true;
      owners.push(owner);
      emit OWNERADDED285(owner);
    }
  }
  event OWNERADDED285(address indexed owner);	//inject NONSTANDARD NAMING

  function REMOVEOWNER97(address owner) external ONLYOWNER655 {	//inject NONSTANDARD NAMING
    if (isOwner[owner]) {
      require(owners.length > 1, "removing the last owner is not allowed");
      isOwner[owner] = false;
      for (uint i = 0; i < owners.length - 1; i++) {
        if (owners[i] == owner) {
          owners[i] = owners[owners.length - 1]; // replace map last entry
          delete owners[owners.length - 1];
          break;
        }
      }
      owners.length -= 1;
      emit OWNERREMOVED447(owner);
    }
  }
  event OWNERREMOVED447(address indexed owner);	//inject NONSTANDARD NAMING
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

  function CONTAINS98(address apiKey) external view returns (bool);	//inject NONSTANDARD NAMING

  function REGISTER676(address apiKey) external;	//inject NONSTANDARD NAMING
  function REGISTERWITHUSERAGREEMENT164(address apiKey, bytes32 userAgreement) external;	//inject NONSTANDARD NAMING

  function TRANSLATE742(address apiKey) external view returns (address);	//inject NONSTANDARD NAMING
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/custodian/Withdrawing.sol

interface Withdrawing {

  function WITHDRAW577(address[] calldata addresses, uint[] calldata uints, bytes calldata signature, bytes calldata proof, bytes32 root) external;	//inject NONSTANDARD NAMING

  function CLAIMEXIT575(address[] calldata addresses, uint[] calldata uints, bytes calldata signature, bytes calldata proof, bytes32 root) external;	//inject NONSTANDARD NAMING

  function EXIT953(bytes32 entryHash, bytes calldata proof, bytes32 root) external;	//inject NONSTANDARD NAMING

  function EXITONHALT230(address[] calldata addresses, uint[] calldata uints, bytes calldata signature, bytes calldata proof, bytes32 root) external;	//inject NONSTANDARD NAMING
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/external/StandardToken.sol

                                                                                                                                                                                                                                                                                                                                                         
contract StandardToken is Token {

  function TRANSFER689(address _to, uint _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    //Default assumes totalSupply can"t be over max (2^256 - 1).
    //If your token leaves out totalSupply and can issue more tokens as time goes on, you need to check if it doesn't wrap.
    //Replace the if map this one instead.
    //require(balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]);
    require(balances[msg.sender] >= _value, "sender has insufficient token balance");
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    emit TRANSFER219(msg.sender, _to, _value);
    return true;
  }

  function TRANSFERFROM691(address _from, address _to, uint _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    //same as above. Replace this line map the following if you want to protect against wrapping uints.
    //require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value && balances[_to] + _value > balances[_to]);
    require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value,
      "either from address has insufficient token balance, or insufficient amount was approved for sender");
    balances[_to] += _value;
    balances[_from] -= _value;
    allowed[_from][msg.sender] -= _value;
    emit TRANSFER219(_from, _to, _value);
    return true;
  }

  function BALANCEOF520(address _owner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
    return balances[_owner];
  }

  function APPROVE685(address _spender, uint _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = _value;
    emit APPROVAL789(msg.sender, _spender, _value);
    return true;
  }

  function ALLOWANCE171(address _owner, address _spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
    return allowed[_owner][_spender];
  }

  mapping(address => uint) balances;
  mapping(address => mapping(address => uint)) allowed;
}

// File: /private/var/folders/2q/x2n3s2rx0d16552ynj1lx90r0000gn/T/tmp.ODkPvI0P/gluon-plasma/packages/on-chain/contracts/staking/Fee.sol

                                                                                                                                                                                                                          
contract Fee is HasOwners, Versioned, StandardToken {

                                                    
  event BURN572(address indexed from, uint value);	//inject NONSTANDARD NAMING

  string public name;                   //fancy name: eg Simon Bucks
  uint8 public decimals;                //How many decimals to show. ie. There could 1000 base units with 3 decimals.
                                        //Meaning 0.980 SBX = 980 base units. It's like comparing 1 wei to 1 ether.
  string public symbol;                 //An identifier: eg SBX
  address public minter;

  modifier ONLYMINTER546 { require(msg.sender == minter, "invalid sender; must be minter"); _; }	//inject NONSTANDARD NAMING

  constructor(address[] memory owners, string memory tokenName, uint8 decimalUnits, string memory tokenSymbol, string memory _version)
    HasOwners(owners)
    Versioned(_version)
    public NOTEMPTY844(tokenName) NOTEMPTY844(tokenSymbol)
  {
    name = tokenName;
    decimals = decimalUnits;
    symbol = tokenSymbol;
  }

  function SETMINTER674(address _minter) external ONLYOWNER655 VALIDADDRESS163(_minter) {	//inject NONSTANDARD NAMING
    minter = _minter;
  }

                                                                        
                                                
  function BURNTOKENS153(uint quantity) public NOTZERO727(quantity) {	//inject NONSTANDARD NAMING
    require(balances[msg.sender] >= quantity, "insufficient quantity to burn");
    balances[msg.sender] = Math.MINUS405(balances[msg.sender], quantity);
    totalSupply = Math.MINUS405(totalSupply, quantity);
    emit BURN572(msg.sender, quantity);
  }

                                                                               
                                      
                                          
                                  
  function SENDTOKENS627(address to, uint quantity) public ONLYMINTER546 VALIDADDRESS163(to) NOTZERO727(quantity) {	//inject NONSTANDARD NAMING
    balances[to] = Math.PLUS943(balances[to], quantity);
    totalSupply = Math.PLUS943(totalSupply, quantity);
    emit TRANSFER219(address(0), to, quantity);
  }
}

// File: contracts/staking/Stake.sol

contract Stake is HasOwners, Versioned {
  using Math for uint;

  uint public weiPerFEE; // Wei for each Fee token
  Token public LEV;
  Fee public FEE;
  address payable public wallet;
  address public operator;
  uint public intervalSize;

  bool public halted;
  uint public FEE2Distribute;
  uint public totalStakedLEV;
  uint public latest = 1;

  mapping (address => UserStake) public stakes;
  mapping (uint => Interval) public intervals;

  event STAKED488(address indexed user, uint levs, uint startBlock, uint endBlock, uint intervalId);	//inject NONSTANDARD NAMING
  event RESTAKED327(address indexed user, uint levs, uint startBlock, uint endBlock, uint intervalId);	//inject NONSTANDARD NAMING
  event REDEEMED718(address indexed user, uint levs, uint feeEarned, uint startBlock, uint endBlock, uint intervalId);	//inject NONSTANDARD NAMING
  event FEECALCULATED222(uint feeCalculated, uint feeReceived, uint weiReceived, uint startBlock, uint endBlock, uint intervalId);	//inject NONSTANDARD NAMING
  event NEWINTERVAL291(uint start, uint end, uint intervalId);	//inject NONSTANDARD NAMING
  event HALTED569(uint block, uint intervalId);	//inject NONSTANDARD NAMING

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
    public VALIDADDRESS163(_wallet) VALIDADDRESS163(_levToken) VALIDADDRESS163(_feeToken) NOTZERO727(_weiPerFee) NOTZERO727(_intervalSize)
  {
    wallet = _wallet;
    weiPerFEE = _weiPerFee;
    LEV = Token(_levToken);
    FEE = Fee(_feeToken);
    intervalSize = _intervalSize;
    intervals[latest].start = block.number;
    intervals[latest].end = block.number + intervalSize;
    operator = _operator;
    Registry(registry).REGISTERWITHUSERAGREEMENT164(apiKey, userAgreement);
  }

  modifier NOTHALTED345 { require(!halted, "exchange is halted"); _; }	//inject NONSTANDARD NAMING

  function() external payable {}

  function SETWALLET553(address payable _wallet) external VALIDADDRESS163(_wallet) ONLYOWNER655 {	//inject NONSTANDARD NAMING
    ENSUREINTERVAL319();
    wallet = _wallet;
  }

  function SETINTERVALSIZE28(uint _intervalSize) external NOTZERO727(_intervalSize) ONLYOWNER655 {	//inject NONSTANDARD NAMING
    ENSUREINTERVAL319();
    intervalSize = _intervalSize;
  }

                                                  
  function ENSUREINTERVAL319() public NOTHALTED345 {	//inject NONSTANDARD NAMING
    if (intervals[latest].end > block.number) return;

    Interval storage interval = intervals[latest];
    (uint feeEarned, uint ethEarned) = CALCULATEINTERVALEARNING543(interval.start, interval.end);
    interval.generatedFEE = feeEarned.PLUS943(ethEarned.DIV473(weiPerFEE));
    FEE2Distribute = FEE2Distribute.PLUS943(interval.generatedFEE);
    if (ethEarned.DIV473(weiPerFEE) > 0) FEE.SENDTOKENS627(address(this), ethEarned.DIV473(weiPerFEE));
    emit FEECALCULATED222(interval.generatedFEE, feeEarned, ethEarned, interval.start, interval.end, latest);
    if (ethEarned > 0) address(wallet).transfer(ethEarned);

    uint diff = (block.number - intervals[latest].end) % intervalSize;
    latest += 1;
    intervals[latest].start = intervals[latest - 1].end;
    intervals[latest].end = block.number - diff + intervalSize;
    emit NEWINTERVAL291(intervals[latest].start, intervals[latest].end, latest);
  }

  function RESTAKE789(int signedQuantity) private {	//inject NONSTANDARD NAMING
    UserStake storage stake = stakes[msg.sender];
    if (stake.intervalId == latest || stake.intervalId == 0) return;

    uint lev = stake.quantity;
    uint withdrawLev = signedQuantity >= 0 ? 0 : (stake.quantity).MIN409(uint(signedQuantity * -1));
    REDEEM909(withdrawLev);
    stake.quantity = lev.MINUS405(withdrawLev);
    if (stake.quantity == 0) {
      delete stakes[msg.sender];
      return;
    }

    Interval storage interval = intervals[latest];
    stake.intervalId = latest;
    stake.worth = stake.quantity.TIMES749(interval.end.MINUS405(interval.start));
    interval.worth = interval.worth.PLUS943(stake.worth);
    emit RESTAKED327(msg.sender, stake.quantity, interval.start, interval.end, latest);
  }

  function STAKE611(int signedQuantity) external NOTHALTED345 {	//inject NONSTANDARD NAMING
    ENSUREINTERVAL319();
    RESTAKE789(signedQuantity);
    if (signedQuantity <= 0) return;

    STAKEINCURRENTPERIOD425(uint(signedQuantity));
  }

  function STAKEINCURRENTPERIOD425(uint quantity) private {	//inject NONSTANDARD NAMING
    require(LEV.ALLOWANCE171(msg.sender, address(this)) >= quantity, "Approve LEV tokens first");
    Interval storage interval = intervals[latest];
    stakes[msg.sender].intervalId = latest;
    stakes[msg.sender].worth = stakes[msg.sender].worth.PLUS943(quantity.TIMES749(intervals[latest].end.MINUS405(block.number)));
    stakes[msg.sender].quantity = stakes[msg.sender].quantity.PLUS943(quantity);
    interval.worth = interval.worth.PLUS943(quantity.TIMES749(interval.end.MINUS405(block.number)));
    require(LEV.TRANSFERFROM691(msg.sender, address(this), quantity), "LEV token transfer was not successful");
    totalStakedLEV = totalStakedLEV.PLUS943(quantity);
    emit STAKED488(msg.sender, quantity, interval.start, interval.end, latest);
  }

  function WITHDRAW577() external {	//inject NONSTANDARD NAMING
    if (!halted) ENSUREINTERVAL319();
    if (stakes[msg.sender].intervalId == 0 || stakes[msg.sender].intervalId == latest) return;
    REDEEM909(stakes[msg.sender].quantity);
  }

  function HALT190() external NOTHALTED345 ONLYOWNER655 {	//inject NONSTANDARD NAMING
    intervals[latest].end = block.number;
    ENSUREINTERVAL319();
    halted = true;
    emit HALTED569(block.number, latest - 1);
  }

  function TRANSFERTOWALLETAFTERHALT197() public ONLYOWNER655 {	//inject NONSTANDARD NAMING
    require(halted, "Stake is not halted yet.");
    uint feeEarned = FEE.BALANCEOF520(address(this)).MINUS405(FEE2Distribute);
    uint ethEarned = address(this).balance;
    if (feeEarned > 0) FEE.TRANSFER689(wallet, feeEarned);
    if (ethEarned > 0) address(wallet).transfer(ethEarned);
  }

  function TRANSFERTOKEN719(address token) public VALIDADDRESS163(token) {	//inject NONSTANDARD NAMING
    if (token == address(FEE)) return;

    uint balance = Token(token).BALANCEOF520(address(this));
    if (token == address(LEV)) balance = balance.MINUS405(totalStakedLEV);
    if (balance > 0) Token(token).TRANSFER689(wallet, balance);
  }

  function REDEEM909(uint howMuchLEV) private {	//inject NONSTANDARD NAMING
    uint intervalId = stakes[msg.sender].intervalId;
    Interval memory interval = intervals[intervalId];
    uint earnedFEE = stakes[msg.sender].worth.TIMES749(interval.generatedFEE).DIV473(interval.worth);
    delete stakes[msg.sender];
    if (earnedFEE > 0) {
      FEE2Distribute = FEE2Distribute.MINUS405(earnedFEE);
      require(FEE.TRANSFER689(msg.sender, earnedFEE), "Fee transfer to account failed");
    }
    if (howMuchLEV > 0) {
      totalStakedLEV = totalStakedLEV.MINUS405(howMuchLEV);
      require(LEV.TRANSFER689(msg.sender, howMuchLEV), "Redeeming LEV token to account failed.");
    }
    emit REDEEMED718(msg.sender, howMuchLEV, earnedFEE, interval.start, interval.end, intervalId);
  }

  // public for testing purposes only. not intended to be called directly
  function CALCULATEINTERVALEARNING543(uint start, uint end) public view returns (uint earnedFEE, uint earnedETH) {	//inject NONSTANDARD NAMING
    earnedFEE = FEE.BALANCEOF520(address(this)).MINUS405(FEE2Distribute);
    earnedETH = address(this).balance;
    earnedFEE = earnedFEE.TIMES749(end.MINUS405(start)).DIV473(block.number.MINUS405(start));
    earnedETH = earnedETH.TIMES749(end.MINUS405(start)).DIV473(block.number.MINUS405(start));
  }

  function REGISTERAPIKEY962(address registry, address apiKey, bytes32 userAgreement) public ONLYOWNER655 {	//inject NONSTANDARD NAMING
    Registry(registry).REGISTERWITHUSERAGREEMENT164(apiKey, userAgreement);
  }

  function WITHDRAWFROMCUSTODIAN721(	//inject NONSTANDARD NAMING
    address custodian,
    address[] memory addresses,
    uint[] memory uints,
    bytes memory signature,
    bytes memory proof,
    bytes32 root
  ) public {
    Withdrawing(custodian).WITHDRAW577(addresses, uints, signature, proof, root);
  }

  function EXITONHALTFROMCUSTODIAN405(	//inject NONSTANDARD NAMING
    address custodian,
    address[] memory addresses,
    uint[] memory uints,
    bytes memory signature,
    bytes memory proof,
    bytes32 root
  ) public {
    Withdrawing(custodian).EXITONHALT230(addresses, uints, signature, proof, root);
  }
}
