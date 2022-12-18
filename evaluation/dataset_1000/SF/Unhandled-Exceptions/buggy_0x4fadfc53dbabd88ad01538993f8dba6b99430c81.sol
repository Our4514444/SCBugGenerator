/**
 * Source Code first verified at https://etherscan.io on Wednesday, December 12, 2018
 (UTC) */

pragma solidity ^0.5.1;
/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}
/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
  address public owner;


function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() public {
    owner = msg.sender;
  }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

}
/**
 * @title ERC20Basic
 * @dev Simpler version of ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
    /// Total amount of tokens
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  uint256 public totalSupply;

  function balanceOf(address _owner) public view returns (uint256 balance);
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

  function transfer(address _to, uint256 _amount) public returns (bool success);
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event Transfer(address indexed from, address indexed to, uint256 value);
}

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
  function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

  function transferFrom(address _from, address _to, uint256 _amount) public returns (bool success);
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

  function approve(address _spender, uint256 _amount) public returns (bool success);
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  //balance in each address account
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  mapping(address => uint256) balances;
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  address ownerWallet;
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  bool released = false;

  enum LockupType {NOLOCK, FOUNDATION, TEAM, CONSORTIUM, PARTNER, BLACK}

  struct Lockup
  {
      uint256 lockupTime;
      uint256 lockupAmount;
      LockupType lockType;
  }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  Lockup lockup;
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  mapping(address=>Lockup) lockupParticipants;


function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
  uint256 startTime;
  function release() public {
      require(ownerWallet == msg.sender);
      require(!released);
      released = true;
  }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

  function lock() public {
      require(ownerWallet == msg.sender);
      require(released);
      released = false;
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

  function get_Release() view public returns (bool) {
      return released;
  }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _amount The amount to be transferred.
  */
  function transfer(address _to, uint256 _amount) public returns (bool success) {
    require(_to != address(0));
    require(balances[msg.sender] >= _amount && _amount > 0
        && balances[_to].add(_amount) > balances[_to]);


    if (!released) { // before exchanged
      if ( (lockupParticipants[msg.sender].lockType == LockupType.PARTNER) || (msg.sender == ownerWallet) ) {
        // do something to the partner or ownerthing
        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_to] = balances[_to].add(_amount);
        emit Transfer(msg.sender, _to, _amount);
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
                require(balances[msg.sender].sub(_amount) >= lockupParticipants[msg.sender].lockupAmount);
            }
            // do transfer
            // SafeMath.sub will throw if there is not enough balance.
            balances[msg.sender] = balances[msg.sender].sub(_amount);
            balances[_to] = balances[_to].add(_amount);
            emit Transfer(msg.sender, _to, _amount);
            return true;
      } else {
                // do transfer
                // SafeMath.sub will throw if there is not enough balance.
                balances[msg.sender] = balances[msg.sender].sub(_amount);
                balances[_to] = balances[_to].add(_amount);
                emit Transfer(msg.sender, _to, _amount);
                return true;
          }
    }
    return false;
  }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

}

/**
 * @title Standard ERC20 token
 *
 * @dev Implementation of the basic standard token.
 * @dev https://github.com/ethereum/EIPs/issues/20
 */
contract StandardToken is ERC20, BasicToken {


function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  mapping (address => mapping (address => uint256)) internal allowed;


  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _amount uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _amount) public returns (bool success) {
    require(_to != address(0));
    require(balances[_from] >= _amount);
    require(allowed[_from][msg.sender] >= _amount);
    require(_amount > 0 && balances[_to].add(_amount) > balances[_to]);

    if (lockupParticipants[_from].lockupAmount>0)
    {
        uint timePassed = now - startTime;
        if (timePassed < lockupParticipants[_from].lockupTime)
        {
            require(balances[msg.sender].sub(_amount) >= lockupParticipants[_from].lockupAmount);
        }
    }
    balances[_from] = balances[_from].sub(_amount);
    balances[_to] = balances[_to].add(_amount);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_amount);
    emit Transfer(_from, _to, _amount);
    return true;
  }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   *
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender The address which will spend the funds.
   * @param _amount The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _amount) public returns (bool success) {
    allowed[msg.sender][_spender] = _amount;
    emit Approval(msg.sender, _spender, _amount);
    return true;
  }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
  function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
    return allowed[_owner][_spender];
  }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }

}

/**
 * @title Burnable Token
 * @dev Token that can be irreversibly burned (destroyed).
 */
contract BurnableToken is StandardToken, Ownable {

  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event Burn(address indexed burner, uint256 value);

    /**
     * @dev Burns a specific amount of tokens.
     * @param _value The amount of token to be burned.
     */
    function burn(uint256 _value) public onlyOwner{
        require(_value <= balances[ownerWallet]);
        // no need to require value <= totalSupply, since that would imply the
        // sender's balance is greater than the totalSupply, which *should* be an assertion failure

        balances[ownerWallet] = balances[ownerWallet].sub(_value);
        totalSupply = totalSupply.sub(_value);
        emit Burn(msg.sender, _value);
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
}
/**
 * @title LineageCode Token
 * @dev Token representing LineageCode.
 */
 contract LineageCode is BurnableToken {
   bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  string public name ;
   bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  string public symbol ;
   function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  uint8 public decimals;


     /**
     *@dev users sending ether to this contract will be reverted. Any ether sent to the contract will be sent back to the caller
     */
      function () external payable {
         revert();
     }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

     /**
     * @dev Constructor function to initialize the initial supply of token to the creator of the contract
     */
     //constructor(address wallet) public
     constructor() public
     {
         owner = msg.sender;
         ownerWallet = owner;
         totalSupply = 9999999999;
         decimals = 9;
         totalSupply = totalSupply.mul(10 ** uint256(decimals)); //Update total supply with the decimal amount
         name = "LineageCode Digital Asset";
         symbol = "LIN";
         balances[owner] = totalSupply;
         startTime = now;

         //Emitting transfer event since assigning all tokens to the creator also corresponds to the transfer of tokens to the creator
         emit Transfer(address(0), msg.sender, totalSupply);
     }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function lockTokensForFoundation(address foundation, uint256 daysafter) public onlyOwner
    {
        lockup = Lockup({
                          lockupTime:daysafter * 1 days,
                          lockupAmount:10000000000 * 10 ** uint256(decimals),
                          lockType:LockupType.FOUNDATION
                          });
        lockupParticipants[foundation] = lockup;
    }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}

    function lockTokensForConsortium(address consortium, uint256 daysafter, uint256 amount) public onlyOwner
    {
        lockup = Lockup({
                          lockupTime:daysafter * 1 days,
                          lockupAmount:amount * 10 ** uint256(decimals),
                          lockType:LockupType.CONSORTIUM
                          });
        lockupParticipants[consortium] = lockup;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function lockTokensForTeam(address team, uint256 daysafter, uint256 amount) public onlyOwner
    {
        lockup = Lockup({
                          lockupTime:daysafter * 1 days,
                          lockupAmount:amount * 10 ** uint256(decimals),
                          lockType:LockupType.TEAM
                          });
        lockupParticipants[team] = lockup;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    function lockTokensForBlack(address black) public onlyOwner
    {
        lockup = Lockup({
                          lockupTime:9999999999 days,
                          lockupAmount:20000000000 * 10 ** uint256(decimals),
                          lockType:LockupType.BLACK
                          });
        lockupParticipants[black] = lockup;
    }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}

    function registerPartner(address partner) public onlyOwner
    {
        lockup = Lockup({
                          lockupTime:0 days,
                          lockupAmount:0 * 10 ** uint256(decimals),
                          lockType:LockupType.PARTNER
                          });
        lockupParticipants[partner] = lockup;
    }
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }

    function lockTokensUpdate(address addr, uint daysafter, uint256 amount, uint256 l_type) public onlyOwner
    {

        lockup = Lockup({
                          lockupTime:daysafter *  1 days,
                          lockupAmount:amount * 10 ** uint256(decimals),
                          lockType: BasicToken.LockupType(l_type)
                          });
        lockupParticipants[addr] = lockup;
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
 }