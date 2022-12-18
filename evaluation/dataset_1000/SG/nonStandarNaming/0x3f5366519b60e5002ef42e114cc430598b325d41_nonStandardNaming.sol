pragma solidity ^0.5.6;

library SafeMath {
                                                                              
  function MUL412(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                       
  function DIV45(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // Solidity only automatically asserts when dividing by 0
    require(b > 0);
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

                                                                                                                          
  function SUB644(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    require(b <= a);
    uint256 c = a - b;
    return c;
  }

                                                                        
  function ADD315(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    require(c >= a);
    return c;
  }
}

contract Ownable {
  address public owner;
  mapping(address => bool) public adminList;

  event OWNERSHIPTRANSFERRED674(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );

                                                                                                                   
  constructor() public {
    owner = msg.sender;
  }

                                                                           
  modifier ONLYOWNER429() {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }

  modifier ONLYADMIN425() {	//inject NONSTANDARD NAMING
    require(adminList[msg.sender] == true || msg.sender == owner);
    _;
  }

  function ADDADMIN328(address _address) public ONLYOWNER429 {	//inject NONSTANDARD NAMING
      adminList[_address] = true;
  }

  function REMOVEADMIN171(address _address) public ONLYOWNER429 {	//inject NONSTANDARD NAMING
      adminList[_address] = false;
  }

                                                                                                                                                             
  function TRANSFEROWNERSHIP196(address _newOwner) public ONLYOWNER429 {	//inject NONSTANDARD NAMING
    _TRANSFEROWNERSHIP652(_newOwner);
  }

                                                                                                                                  
  function _TRANSFEROWNERSHIP652(address _newOwner) internal {	//inject NONSTANDARD NAMING
    require(_newOwner != address(0));
    emit OWNERSHIPTRANSFERRED674(owner, _newOwner);
    owner = _newOwner;
  }
}

contract Pausable is Ownable {
  event PAUSE724();	//inject NONSTANDARD NAMING
  event UNPAUSE844();	//inject NONSTANDARD NAMING

  bool public paused = false;


                                                                                                
  modifier WHENNOTPAUSED609() {	//inject NONSTANDARD NAMING
    require(!paused);
    _;
  }

                                                                                            
  modifier WHENPAUSED795() {	//inject NONSTANDARD NAMING
    require(paused);
    _;
  }

                                                                          
  function PAUSE351() public ONLYOWNER429 WHENNOTPAUSED609 {	//inject NONSTANDARD NAMING
    paused = true;
    emit PAUSE724();
  }

                                                                             
  function UNPAUSE533() public ONLYOWNER429 WHENPAUSED795 {	//inject NONSTANDARD NAMING
    paused = false;
    emit UNPAUSE844();
  }
}

                                      
contract StandardToken {
  using SafeMath for uint256;

  mapping(address => uint256) internal balances;

  mapping (address => mapping (address => uint256)) internal allowed;

  uint256 internal totalSupply_;

  event TRANSFER854(	//inject NONSTANDARD NAMING
    address indexed from,
    address indexed to,
    uint256 value
  );

  event APPROVAL276(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 vaule
  );

                                                       
  function TOTALSUPPLY349() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return totalSupply_;
  }

                                                                                                                                                                                                     
  function BALANCEOF122(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return balances[_owner];
  }

                                                                                                                                                                                                                                                                                                                          
  function ALLOWANCE310(	//inject NONSTANDARD NAMING
    address _owner,
    address _spender
   )
    public
    view
    returns (uint256)
  {
    return allowed[_owner][_spender];
  }

                                                                                                                                                     
  function TRANSFER921(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    balances[msg.sender] = balances[msg.sender].SUB644(_value);
    balances[_to] = balances[_to].ADD315(_value);
    emit TRANSFER854(msg.sender, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
  function APPROVE626(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = _value;
    emit APPROVAL276(msg.sender, _spender, _value);
    return true;
  }

                                                                                                                                                                                                                                                                              
  function TRANSFERFROM712(	//inject NONSTANDARD NAMING
    address _from,
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].SUB644(_value);
    balances[_to] = balances[_to].ADD315(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB644(_value);
    emit TRANSFER854(_from, _to, _value);
    return true;
  }
}

                                                                             
contract PausableToken is StandardToken, Pausable {

  event BURN695(address indexed from, uint256 value);	//inject NONSTANDARD NAMING
  event MINT452(address indexed to, uint256 value);	//inject NONSTANDARD NAMING

  function TRANSFER921(	//inject NONSTANDARD NAMING
    address _to,
    uint256 _value
  )
    public
    WHENNOTPAUSED609
    returns (bool)
  {
    return super.TRANSFER921(_to, _value);
  }

  function TRANSFERFROM712(	//inject NONSTANDARD NAMING
    address _from,
    address _to,
    uint256 _value
  )
    public
    WHENNOTPAUSED609
    returns (bool)
  {
    return super.TRANSFERFROM712(_from, _to, _value);
  }

  function APPROVE626(	//inject NONSTANDARD NAMING
    address _spender,
    uint256 _value
  )
    public
    WHENNOTPAUSED609
    returns (bool)
  {
    return super.APPROVE626(_spender, _value);
  }

                                                                                                             
  function BURN322(uint256 _value) public ONLYOWNER429 {	//inject NONSTANDARD NAMING
    require(balances[msg.sender] >= _value);
    balances[msg.sender] = balances[msg.sender].SUB644(_value);
    totalSupply_ = totalSupply_.SUB644(_value);
    emit TRANSFER854(msg.sender, address(0x00), _value);
    emit BURN695(msg.sender, _value);
  }

  function MINT569(uint256 _value) public ONLYOWNER429 {	//inject NONSTANDARD NAMING
    balances[msg.sender] = balances[msg.sender].ADD315(_value);
    totalSupply_ = totalSupply_.ADD315(_value);
    emit TRANSFER854(address(0x00), msg.sender, _value);
    emit MINT452(msg.sender, _value);
  }
}

contract FreezeToken is PausableToken {
  mapping(address=>bool) public frozenAccount;
  event FROZENACCOUNT862(address indexed target, bool frozen);	//inject NONSTANDARD NAMING

  function FROZENCHECK158(address target) internal view {	//inject NONSTANDARD NAMING
    require(!frozenAccount[target]);
  }

  function FREEZEACCOUNT319(address target, bool frozen) public ONLYADMIN425 {	//inject NONSTANDARD NAMING
    frozenAccount[target] = frozen;
    emit FROZENACCOUNT862(target, frozen);
  }

  function TRANSFER921(	//inject NONSTANDARD NAMING
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    FROZENCHECK158(msg.sender);
    FROZENCHECK158(_to);
    return super.TRANSFER921(_to, _value);
  }

  function TRANSFERFROM712(	//inject NONSTANDARD NAMING
    address _from,
    address _to,
    uint256 _value
  )
    public
    WHENNOTPAUSED609
    returns (bool)
  {
    FROZENCHECK158(msg.sender);
    FROZENCHECK158(_from);
    FROZENCHECK158(_to);
    return super.TRANSFERFROM712(_from, _to, _value);
  }
}

contract Token is FreezeToken {
  string public constant name91 = "Panda Coin";  // name of Token 	//inject NONSTANDARD NAMING
  string public constant symbol5 = "PANDA"; // symbol of Token 	//inject NONSTANDARD NAMING
  uint8 public constant decimals1 = 18;	//inject NONSTANDARD NAMING
  mapping (address => string) public keys;

  event REGISTER717 (address user, string key);	//inject NONSTANDARD NAMING
  
  constructor() public {
    totalSupply_ = 1350852214721 * 10 ** uint256(decimals1 - 2);
    balances[msg.sender] = totalSupply_;
    emit TRANSFER854(address(0x00), msg.sender,totalSupply_);
  }
  
  function REGISTER456(string memory key) public {	//inject NONSTANDARD NAMING
    keys[msg.sender] = key;
    emit REGISTER717(msg.sender, key);
  }
}