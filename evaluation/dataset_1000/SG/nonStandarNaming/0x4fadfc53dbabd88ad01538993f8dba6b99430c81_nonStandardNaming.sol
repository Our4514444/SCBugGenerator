                                                                                                   

pragma solidity ^0.5.1;
                                                                                         
library SafeMath {
  function MUL285(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function DIV345(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function SUB312(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function ADD280(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}
                                                                                                                                                                                             
contract Ownable {
  address public owner;


  event OWNERSHIPTRANSFERRED345(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING


                                                                                                                   
  constructor() public {
    owner = msg.sender;
  }

                                                                           
  modifier ONLYOWNER825() {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }

                                                                                                                                                            
  function TRANSFEROWNERSHIP220(address newOwner) public ONLYOWNER825 {	//inject NONSTANDARD NAMING
    require(newOwner != address(0));
    emit OWNERSHIPTRANSFERRED345(owner, newOwner);
    owner = newOwner;
  }

}
                                                                                                                               
contract ERC20Basic {
                              
  uint256 public totalSupply;

  function BALANCEOF214(address _owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING

  function TRANSFER220(address _to, uint256 _amount) public returns (bool success);	//inject NONSTANDARD NAMING

  event TRANSFER712(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                        
contract ERC20 is ERC20Basic {
  function ALLOWANCE905(address _owner, address _spender) public view returns (uint256 remaining);	//inject NONSTANDARD NAMING

  function TRANSFERFROM618(address _from, address _to, uint256 _amount) public returns (bool success);	//inject NONSTANDARD NAMING

  function APPROVE280(address _spender, uint256 _amount) public returns (bool success);	//inject NONSTANDARD NAMING

  event APPROVAL957(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                         
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  //balance in each address account
  mapping(address => uint256) balances;
  address ownerWallet;
  bool released = false;

  enum LockupType {NOLOCK, FOUNDATION, TEAM, CONSORTIUM, PARTNER, BLACK}

  struct Lockup
  {
      uint256 lockupTime;
      uint256 lockupAmount;
      LockupType lockType;
  }
  Lockup lockup;
  mapping(address=>Lockup) lockupParticipants;


  uint256 startTime;
  function RELEASE611() public {	//inject NONSTANDARD NAMING
      require(ownerWallet == msg.sender);
      require(!released);
      released = true;
  }

  function LOCK864() public {	//inject NONSTANDARD NAMING
      require(ownerWallet == msg.sender);
      require(released);
      released = false;
  }

  function GET_RELEASE850() view public returns (bool) {	//inject NONSTANDARD NAMING
      return released;
  }

                                                                                                                                                      
  function TRANSFER220(address _to, uint256 _amount) public returns (bool success) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(balances[msg.sender] >= _amount && _amount > 0
        && balances[_to].ADD280(_amount) > balances[_to]);


    if (!released) { // before exchanged
      if ( (lockupParticipants[msg.sender].lockType == LockupType.PARTNER) || (msg.sender == ownerWallet) ) {
        // do something to the partner or ownerthing
        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].SUB312(_amount);
        balances[_to] = balances[_to].ADD280(_amount);
        emit TRANSFER712(msg.sender, _to, _amount);
        return true;
      //} else if (lockupParticipants[msg.sender].lockType == LockupType.BLACK ) {
      } else {
        // do something to the banned
        return false;
      }
    } else { // after changed
      if (lockupParticipants[msg.sender].lockType == LockupType.BLACK ) {
        // do something to the banned
        return false;
      } else
        if (lockupParticipants[msg.sender].lockupAmount>0) {
            uint timePassed = now - startTime;
            if (timePassed < lockupParticipants[msg.sender].lockupTime)
            {
                require(balances[msg.sender].SUB312(_amount) >= lockupParticipants[msg.sender].lockupAmount);
            }
            // do transfer
            // SafeMath.sub will throw if there is not enough balance.
            balances[msg.sender] = balances[msg.sender].SUB312(_amount);
            balances[_to] = balances[_to].ADD280(_amount);
            emit TRANSFER712(msg.sender, _to, _amount);
            return true;
      } else {
                // do transfer
                // SafeMath.sub will throw if there is not enough balance.
                balances[msg.sender] = balances[msg.sender].SUB312(_amount);
                balances[_to] = balances[_to].ADD280(_amount);
                emit TRANSFER712(msg.sender, _to, _amount);
                return true;
          }
    }
    return false;
  }

                                                                                                                                                                                                     
  function BALANCEOF214(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
    return balances[_owner];
  }

}

                                                                                                                                                
contract StandardToken is ERC20, BasicToken {


  mapping (address => mapping (address => uint256)) internal allowed;


                                                                                                                                                                                                                                                                               
  function TRANSFERFROM618(address _from, address _to, uint256 _amount) public returns (bool success) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    require(balances[_from] >= _amount);
    require(allowed[_from][msg.sender] >= _amount);
    require(_amount > 0 && balances[_to].ADD280(_amount) > balances[_to]);

    if (lockupParticipants[_from].lockupAmount>0)
    {
        uint timePassed = now - startTime;
        if (timePassed < lockupParticipants[_from].lockupTime)
        {
            require(balances[msg.sender].SUB312(_amount) >= lockupParticipants[_from].lockupAmount);
        }
    }
    balances[_from] = balances[_from].SUB312(_amount);
    balances[_to] = balances[_to].ADD280(_amount);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB312(_amount);
    emit TRANSFER712(_from, _to, _amount);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
  function APPROVE280(address _spender, uint256 _amount) public returns (bool success) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = _amount;
    emit APPROVAL957(msg.sender, _spender, _amount);
    return true;
  }

                                                                                                                                                                                                                                                                                                                          
  function ALLOWANCE905(address _owner, address _spender) public view returns (uint256 remaining) {	//inject NONSTANDARD NAMING
    return allowed[_owner][_spender];
  }

}

                                                                                           
contract BurnableToken is StandardToken, Ownable {

    event BURN308(address indexed burner, uint256 value);	//inject NONSTANDARD NAMING

                                                                                                                     
    function BURN968(uint256 _value) public ONLYOWNER825{	//inject NONSTANDARD NAMING
        require(_value <= balances[ownerWallet]);
        // no need to require value <= totalSupply, since that would imply the
        // sender's balance is greater than the totalSupply, which *should* be an assertion failure

        balances[ownerWallet] = balances[ownerWallet].SUB312(_value);
        totalSupply = totalSupply.SUB312(_value);
        emit BURN308(msg.sender, _value);
    }
}
                                                                           
 contract LineageCode is BurnableToken {
     string public name ;
     string public symbol ;
     uint8 public decimals;


                                                                                                                                                 
      function () external payable {
         revert();
     }

                                                                                                                          
     //constructor(address wallet) public
     constructor() public
     {
         owner = msg.sender;
         ownerWallet = owner;
         totalSupply = 9999999999;
         decimals = 9;
         totalSupply = totalSupply.MUL285(10 ** uint256(decimals)); //Update total supply with the decimal amount
         name = "LineageCode Digital Asset";
         symbol = "LIN";
         balances[owner] = totalSupply;
         startTime = now;

         //Emitting transfer event since assigning all tokens to the creator also corresponds to the transfer of tokens to the creator
         emit TRANSFER712(address(0), msg.sender, totalSupply);
     }

    function LOCKTOKENSFORFOUNDATION376(address foundation, uint256 daysafter) public ONLYOWNER825	//inject NONSTANDARD NAMING
    {
        lockup = Lockup({
                          lockupTime:daysafter * 1 days,
                          lockupAmount:10000000000 * 10 ** uint256(decimals),
                          lockType:LockupType.FOUNDATION
                          });
        lockupParticipants[foundation] = lockup;
    }

    function LOCKTOKENSFORCONSORTIUM865(address consortium, uint256 daysafter, uint256 amount) public ONLYOWNER825	//inject NONSTANDARD NAMING
    {
        lockup = Lockup({
                          lockupTime:daysafter * 1 days,
                          lockupAmount:amount * 10 ** uint256(decimals),
                          lockType:LockupType.CONSORTIUM
                          });
        lockupParticipants[consortium] = lockup;
    }

    function LOCKTOKENSFORTEAM559(address team, uint256 daysafter, uint256 amount) public ONLYOWNER825	//inject NONSTANDARD NAMING
    {
        lockup = Lockup({
                          lockupTime:daysafter * 1 days,
                          lockupAmount:amount * 10 ** uint256(decimals),
                          lockType:LockupType.TEAM
                          });
        lockupParticipants[team] = lockup;
    }

    function LOCKTOKENSFORBLACK204(address black) public ONLYOWNER825	//inject NONSTANDARD NAMING
    {
        lockup = Lockup({
                          lockupTime:9999999999 days,
                          lockupAmount:20000000000 * 10 ** uint256(decimals),
                          lockType:LockupType.BLACK
                          });
        lockupParticipants[black] = lockup;
    }

    function REGISTERPARTNER309(address partner) public ONLYOWNER825	//inject NONSTANDARD NAMING
    {
        lockup = Lockup({
                          lockupTime:0 days,
                          lockupAmount:0 * 10 ** uint256(decimals),
                          lockType:LockupType.PARTNER
                          });
        lockupParticipants[partner] = lockup;
    }

    function LOCKTOKENSUPDATE895(address addr, uint daysafter, uint256 amount, uint256 l_type) public ONLYOWNER825	//inject NONSTANDARD NAMING
    {

        lockup = Lockup({
                          lockupTime:daysafter *  1 days,
                          lockupAmount:amount * 10 ** uint256(decimals),
                          lockType: BasicToken.LockupType(l_type)
                          });
        lockupParticipants[addr] = lockup;
    }
 }