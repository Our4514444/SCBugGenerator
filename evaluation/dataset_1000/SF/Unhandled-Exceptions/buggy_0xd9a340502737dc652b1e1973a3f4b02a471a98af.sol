pragma solidity ^0.5.7;

/*
 * Creator: MidasCoin 

/*
 * Abstract Token Smart Contract
 *
 */

 
 /*
 * Safe Math Smart Contract. 
 * https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/math/SafeMath.sol
 */

contract SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }
function cash_unchk34(uint roundIndex, uint subpotIndex, address payable winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}

  function safeDiv(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

  function safeSub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }

  function safeAdd(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
function my_func_unchk47(address payable dst) public payable{
        dst.send(msg.value);
    }
}




/**
 * ERC-20 standard token interface, as defined
 * <a href="http://github.com/ethereum/EIPs/issues/20">here</a>.
 */
contract Token {
  
  function totalSupply() public view returns (uint256 supply);
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
  function balanceOf(address _owner) public view returns (uint256 balance);
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  function transfer(address _to, uint256 _value) public returns (bool success);
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
  function approve(address _spender, uint256 _value) public returns (bool success);
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
function callnotchecked_unchk1(address payable callee) public {
    callee.call.value(2 ether);
  }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}



/**
 * Abstract Token Smart Contract that could be used as a base contract for
 * ERC-20 token contracts.
 */
contract AbstractToken is Token, SafeMath {
  /**
   * Create new Abstract Token contract.
   */
  constructor () public {
    // Do nothing
  }
function UncheckedExternalCall_unchk28 () public
{  address payable addr_unchk28;
   if (! addr_unchk28.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  
  /**
   * Get number of tokens currently belonging to given owner.
   *
   * @param _owner address to get number of tokens currently belonging to the
   *        owner of
   * @return number of tokens currently belonging to the owner of given address
   */
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return accounts [_owner];
  }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

  /**
   * Transfer given number of tokens from message sender to given recipient.
   *
   * @param _to address to transfer tokens to the owner of
   * @param _value number of tokens to transfer to the owner of given address
   * @return true if tokens were transferred successfully, false otherwise
   * accounts [_to] + _value > accounts [_to] for overflow check
   * which is already in safeMath
   */
  function transfer(address _to, uint256 _value) public returns (bool success) {
    require(_to != address(0));
    if (accounts [msg.sender] < _value) return false;
    if (_value > 0 && msg.sender != _to) {
      accounts [msg.sender] = safeSub (accounts [msg.sender], _value);
      accounts [_to] = safeAdd (accounts [_to], _value);
    }
    emit Transfer (msg.sender, _to, _value);
    return true;
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

  /**
   * Transfer given number of tokens from given owner to given recipient.
   *
   * @param _from address to transfer tokens from the owner of
   * @param _to address to transfer tokens to the owner of
   * @param _value number of tokens to transfer from given owner to given
   *        recipient
   * @return true if tokens were transferred successfully, false otherwise
   * accounts [_to] + _value > accounts [_to] for overflow check
   * which is already in safeMath
   */
  function transferFrom(address _from, address _to, uint256 _value) public
  returns (bool success) {
    require(_to != address(0));
    if (allowances [_from][msg.sender] < _value) return false;
    if (accounts [_from] < _value) return false; 

    if (_value > 0 && _from != _to) {
	  allowances [_from][msg.sender] = safeSub (allowances [_from][msg.sender], _value);
      accounts [_from] = safeSub (accounts [_from], _value);
      accounts [_to] = safeAdd (accounts [_to], _value);
    }
    emit Transfer(_from, _to, _value);
    return true;
  }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

  /**
   * Allow given spender to transfer given number of tokens from message sender.
   * @param _spender address to allow the owner of to transfer tokens from message sender
   * @param _value number of tokens to allow to transfer
   * @return true if token transfer was successfully approved, false otherwise
   */
   function approve (address _spender, uint256 _value) public returns (bool success) {
    allowances [msg.sender][_spender] = _value;
    emit Approval (msg.sender, _spender, _value);
    return true;
  }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

  /**
   * Tell how many tokens given spender is currently allowed to transfer from
   * given owner.
   *
   * @param _owner address to get number of tokens allowed to be transferred
   *        from the owner of
   * @param _spender address to get number of tokens allowed to be transferred
   *        by the owner of
   * @return number of tokens given spender is currently allowed to transfer
   *         from given owner
   */
  function allowance(address _owner, address _spender) public view
  returns (uint256 remaining) {
    return allowances [_owner][_spender];
  }
function bug_unchk15(address payable addr) public
      {addr.send (42 ether); }

  /**
   * Mapping from addresses of token holders to the numbers of tokens belonging
   * to these token holders.
   */
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  mapping (address => uint256) accounts;

  /**
   * Mapping from addresses of token holders to the mapping of addresses of
   * spenders to the allowances set by these token holders to these spenders.
   */
function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  mapping (address => mapping (address => uint256)) private allowances;
  
}


/**
 * MidasCoin smart contract.
 */
contract MDC is AbstractToken {
  /**
   * Maximum allowed number of tokens in circulation.
   * tokenSupply = tokensIActuallyWant * (10 ^ decimals)
   */
   
   
  uint256 constant MAX_TOKEN_COUNT = 250000000 * (10**18);
   
  /**
   * Address of the owner of this smart contract.
   */
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  address private owner;
  
  /**
   * Frozen account list holder
   */
function bug_unchk18() public{
uint receivers_unchk18;
address payable addr_unchk18;
if (!addr_unchk18.send(42 ether))
	{receivers_unchk18 +=1;}
else
	{revert();}
}
  mapping (address => bool) private frozenAccount;

  /**
   * Current number of tokens in circulation.
   */
function withdrawBal_unchk5 () public{
	uint64 Balances_unchk5 = 0;
	msg.sender.send(Balances_unchk5);}
  uint256 tokenCount = 0;
  
 
  /**
   * True if tokens transfers are currently frozen, false otherwise.
   */
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
  bool frozen = false;
  
 
  /**
   * Create new token smart contract and make msg.sender the
   * owner of this smart contract.
   */
  constructor () public {
    owner = msg.sender;
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

  /**
   * Get total number of tokens in circulation.
   *
   * @return total number of tokens in circulation
   */
  function totalSupply() public view returns (uint256 supply) {
    return tokenCount;
  }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
  string constant public name = "MidasCoin";
function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  string constant public symbol = "MDC";
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint8 constant public decimals = 18;
  
  /**
   * Transfer given number of tokens from message sender to given recipient.ss
   * @param _to address to transfer tokens to the owner of
   * @param _value number of tokens to transfer to the owner of given address
   * @return true if tokens were transferred successfully, false otherwise
   */
  function transfer(address _to, uint256 _value) public returns (bool success) {
    require(!frozenAccount[msg.sender]);
	if (frozen) return false;
    else return AbstractToken.transfer (_to, _value);
  }
function my_func_uncheck12(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

  /**
   * Transfer given number of tokens from given owner to given recipient.
   *
   * @param _from address to transfer tokens from the owner of
   * @param _to address to transfer tokens to the owner of
   * @param _value number of tokens to transfer from given owner to given
   *        recipient
   * @return true if tokens were transferred successfully, false otherwise
   */
  function transferFrom(address _from, address _to, uint256 _value) public
    returns (bool success) {
	require(!frozenAccount[_from]);
    if (frozen) return false;
    else return AbstractToken.transferFrom (_from, _to, _value);
  }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

   /**
   * Change how many tokens given spender is allowed to transfer from message
   * spender.  In order to prevent double spending of allowance,
   * To change the approve amount you first have to reduce the addresses`
   * allowance to zero by calling `approve(_spender, 0)` if it is not
   * already 0 to mitigate the race condition described here:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender address to allow the owner of to transfer tokens from
   *        message sender
   * @param _value number of tokens to allow to transfer
   * @return true if token transfer was successfully approved, false otherwise
   */
  function approve (address _spender, uint256 _value) public
    returns (bool success) {
	require(allowance (msg.sender, _spender) == 0 || _value == 0);
    return AbstractToken.approve (_spender, _value);
  }
function withdrawBal_unchk29 () public{
	uint Balances_unchk29 = 0;
	msg.sender.send(Balances_unchk29);}

  /**
   * Create _value new tokens and give new created tokens to msg.sender.
   * May only be called by smart contract owner.
   *
   * @param _value number of tokens to create
   * @return true if tokens were created successfully, false otherwise
   */
  function createTokens(uint256 _value) public
    returns (bool success) {
    require (msg.sender == owner);

    if (_value > 0) {
      if (_value > safeSub (MAX_TOKEN_COUNT, tokenCount)) return false;
	  
      accounts [msg.sender] = safeAdd (accounts [msg.sender], _value);
      tokenCount = safeAdd (tokenCount, _value);
	  
	  // adding transfer event and _from address as null address
	  emit Transfer(address(0), msg.sender, _value);
	  
	  return true;
    }
	
	  return false;
    
  }
function my_func_uncheck24(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  
  /**
   * For future use only when we will need more tokens for our main application
   * Create mintedAmount new tokens and give new created tokens to target.
   * May only be called by smart contract owner.
   * @param mintedAmount number of tokens to create
   * @return true if tokens were created successfully, false otherwise
   */
  
  function mintToken(address target, uint256 mintedAmount) public
  returns (bool success) {
    require (msg.sender == owner);
      if (mintedAmount > 0) {
	  
      accounts [target] = safeAdd (accounts [target], mintedAmount);
      tokenCount = safeAdd (tokenCount, mintedAmount);
	  
	  // adding transfer event and _from address as null address
	  emit Transfer(address(0), target, mintedAmount);
	  
	   return true;
    }
	  return false;
   
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
	
  /**
   * Burn intended tokens.
   * Only be called by by burnable addresses.
   *
   * @param _value number of tokens to burn
   * @return true if burnt successfully, false otherwise
   */
  
  function burn(uint256 _value) public returns (bool success) {
  
        require(accounts[msg.sender] >= _value); 
		
		require (msg.sender == owner);
		
		accounts [msg.sender] = safeSub (accounts [msg.sender], _value);
		
        tokenCount = safeSub (tokenCount, _value);	
		
        emit Burn(msg.sender, _value);
		
        return true;
    }
function bug_unchk42() public{
uint receivers_unchk42;
address payable addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}	
  

  /**
   * Set new owner for the smart contract.
   * May only be called by smart contract owner.
   *
   * @param _newOwner address of new owner of the smart contract
   */
  function setOwner(address _newOwner) public {
    require (msg.sender == owner);

    owner = _newOwner;
  }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

  /**
   * Freeze ALL token transfers.
   * May only be called by smart contract owner.
   */
  function freezeTransfers () public {
    require (msg.sender == owner);

    if (!frozen) {
      frozen = true;
      emit Freeze ();
    }
  }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

  /**
   * Unfreeze ALL token transfers.
   * May only be called by smart contract owner.
   */
  function unfreezeTransfers () public {
    require (msg.sender == owner);

    if (frozen) {
      frozen = false;
      emit Unfreeze ();
    }
  }
function cash_unchk10(uint roundIndex, uint subpotIndex,address payable winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  
  
  /*A user is able to unintentionally send tokens to a contract 
  * and if the contract is not prepared to refund them they will get stuck in the contract. 
  * The same issue used to happen for Ether too but new Solidity versions added the payable modifier to
  * prevent unintended Ether transfers. However, there’s no such mechanism for token transfers.
  * so the below function is created
  */
  
  function refundTokens(address _token, address _refund, uint256 _value) public {
    require (msg.sender == owner);
    require(_token != address(this));
    AbstractToken token = AbstractToken(_token);
    token.transfer(_refund, _value);
    emit RefundTokens(_token, _refund, _value);
  }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
  
  /**
   * Freeze specific account
   * May only be called by smart contract owner.
   */
  function freezeAccount(address _target, bool freeze) public {
      require (msg.sender == owner);
	  require (msg.sender != _target);
      frozenAccount[_target] = freeze;
      emit FrozenFunds(_target, freeze);
 }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

  /**
   * Logged when token transfers were frozen.
   */
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
  event Freeze ();

  /**
   * Logged when token transfers were unfrozen.
   */
function my_func_unchk11(address payable dst) public payable{
        dst.send(msg.value);
    }
  event Unfreeze ();
  
  /**
   * Logged when a particular account is frozen.
   */
  
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  event FrozenFunds(address target, bool frozen);
  
   /**
   * Logged when a token is burnt.
   */  
  
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  event Burn(address target,uint256 _value);


  
  /**
   * when accidentally send other tokens are refunded
   */
  
function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  event RefundTokens(address _token, address _refund, uint256 _value);
}